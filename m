Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A272C77B61
	for <stable-rt@archiver.kernel.org>; Fri, 28 Apr 2023 14:43:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjD1OnU (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Fri, 28 Apr 2023 10:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345696AbjD1OnT (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Fri, 28 Apr 2023 10:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1A2559F
        for <stable-rt@vger.kernel.org>; Fri, 28 Apr 2023 07:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682692950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=3KsBmXX9nkUU0aI9rxszB97SJF0T3fw56DHHIpUGFDU=;
        b=bqIilg9r5wlU2BxYlq1sY+2S/XdEw8LJ930FV99PrTSm/92WBtq6/3UDKzlmONrRmvZOt2
        C5FC+60rhcfP7Wcdspa5w7t3ICZwlUEcw1MsUpn8/oyed/iUNndFm7OducdEDoRBRHyfWw
        dSblgnyAeu3TpkkYVauEE0S1YlZbMNw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-U7TUX3n9M-6sYqheIry-DA-1; Fri, 28 Apr 2023 10:42:27 -0400
X-MC-Unique: U7TUX3n9M-6sYqheIry-DA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2308F811E7D;
        Fri, 28 Apr 2023 14:42:27 +0000 (UTC)
Received: from localhost (unknown [10.22.34.53])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B0FE81410DD7;
        Fri, 28 Apr 2023 14:42:26 +0000 (UTC)
Date:   Fri, 28 Apr 2023 11:42:25 -0300
From:   "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        stable-rt <stable-rt@vger.kernel.org>
Subject: kernel-rt: mm/memcg: refill_obj_stock() is being called from IRQ
 context
Message-ID: <ZEvbUY9alR5KPULD@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

Sebastian et al,

I am reporting this here, at first, to confirm if there is an obvious solution
for the problem or if it is really a problem.

In short, refill_obj_stock() is being called from IRQ context and lockdep
is complaining about the local lock stock_lock probably not being enough to
protect the data.

The problem is 100% reproducible.

Kernel: v6.3.0-rt11

Reproducer:

    # stress-ng  --sched deadline  --sched-period 1000000000 --sched-runtime 500000000 --sched-deadline 1000000000 --cpu 1 -l 95 -t 120


[  387.365953] ================================
[  387.365954] WARNING: inconsistent lock state
[  387.365954] 6.3.0-rt11 #3 Not tainted
[  387.365956] --------------------------------
[  387.365956] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
[  387.365957] swapper/7/0 [HC1[1]:SC0[0]:HE0:SE1] takes:
[  387.365958] ffff934e8fdb0338 ((stock_lock)){?.+.}-{2:2}, at: refill_obj_stock+0x3d/0x2d0
[  387.365965] {HARDIRQ-ON-W} state was registered at:
[  387.365965]   __lock_acquire+0x2fa/0xe70
[  387.365968]   lock_acquire+0xca/0x2f0
[  387.365969]   rt_spin_lock+0x27/0xd0
[  387.365971]   obj_cgroup_charge+0x3c/0x150
[  387.365973]   slab_pre_alloc_hook.constprop.0+0x119/0x320
[  387.365975]   kmem_cache_alloc_lru+0x4c/0x200
[  387.365976]   __d_alloc+0x29/0x250
[  387.365978]   d_alloc+0x1e/0xa0
[  387.365980]   __lookup_hash+0x53/0xa0
[  387.365982]   filename_create+0xb0/0x160
[  387.365983]   do_mkdirat+0x4b/0x160
[  387.365984]   __x64_sys_mkdir+0x48/0x70
[  387.365986]   do_syscall_64+0x59/0x90
[  387.365989]   entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  387.365990] irq event stamp: 432988
[  387.365991] hardirqs last  enabled at (432987): [<ffffffffaa92b6eb>] cpuidle_enter_state+0xcb/0x340
[  387.365993] hardirqs last disabled at (432988): [<ffffffffaa92919b>] sysvec_apic_timer_interrupt+0xb/0xd0
[  387.365996] softirqs last  enabled at (0): [<ffffffffa9d13c1b>] copy_process+0x7cb/0x19b0
[  387.365999] softirqs last disabled at (0): [<0000000000000000>] 0x0
[  387.366001] 
               other info that might help us debug this:
[  387.366001]  Possible unsafe locking scenario:

[  387.366002]        CPU0
[  387.366002]        ----
[  387.366003]   lock((stock_lock));
[  387.366004]   <Interrupt>
[  387.366004]     lock((stock_lock));
[  387.366005] 
                *** DEADLOCK ***

[  387.366006] no locks held by swapper/7/0.
[  387.366007] 
               stack backtrace:
[  387.366007] CPU: 7 PID: 0 Comm: swapper/7 Kdump: loaded Not tainted 6.3.0-rt11 #3
[  387.366009] Hardware name: Dell Inc. PowerEdge R330/0H5N7P, BIOS 2.10.1 06/11/2020
[  387.366010] Call Trace:
[  387.366011]  <IRQ>
[  387.366012]  dump_stack_lvl+0x47/0x80
[  387.366015]  mark_lock_irq+0x3bb/0x5d0
[  387.366017]  ? stack_trace_save+0x4b/0x70
[  387.366021]  ? save_trace+0x55/0x180
[  387.366025]  mark_lock.part.0+0x1c0/0x3d0
[  387.366027]  mark_usage+0x129/0x150
[  387.366028]  __lock_acquire+0x2fa/0xe70
[  387.366032]  lock_acquire+0xca/0x2f0
[  387.366034]  ? refill_obj_stock+0x3d/0x2d0
[  387.366036]  ? lock_is_held_type+0xd7/0x130
[  387.366039]  ? __pfx_put_cred_rcu+0x10/0x10
[  387.366042]  rt_spin_lock+0x27/0xd0
[  387.366044]  ? refill_obj_stock+0x3d/0x2d0
[  387.366046]  refill_obj_stock+0x3d/0x2d0
[  387.366047]  ? __put_task_struct+0xe9/0x120
[  387.366050]  kmem_cache_free+0x150/0x3c0
[  387.366054]  __put_task_struct+0xe9/0x120
[  387.366056]  inactive_task_timer+0x1af/0x4c0
[  387.366060]  ? __pfx_inactive_task_timer+0x10/0x10
[  387.366063]  __hrtimer_run_queues+0x26b/0x3c0
[  387.366067]  hrtimer_interrupt+0x10a/0x240
[  387.366070]  __sysvec_apic_timer_interrupt+0x93/0x220
[  387.366073]  sysvec_apic_timer_interrupt+0x9d/0xd0
[  387.366075]  </IRQ>
[  387.366076]  <TASK>
[  387.366077]  asm_sysvec_apic_timer_interrupt+0x16/0x20
[  387.366078] RIP: 0010:cpuidle_enter_state+0xcf/0x340
[  387.366080] Code: ff 8b 73 04 bf ff ff ff ff 49 89 c6 e8 2a 37 cb ff 31 ff e8 63 83 45 ff 45 84 ff 0f 85 de 01 00 00 e8 65 46 57 ff fb 45 85 ed <0f> 88 15 01 00 00 49 63 cd 4c 89 f2 48 2b 14 24 48 8d 04 49 48 8d
[  387.366081] RSP: 0018:ffffa9178025be80 EFLAGS: 00000206
[  387.366083] RAX: 0000000000069b5b RBX: ffffc9177fd873d8 RCX: 000000000000001f
[  387.366084] RDX: 0000000000000000 RSI: ffffffffab23caed RDI: ffffffffab1d1d1e
[  387.366085] RBP: 0000000000000006 R08: 0000000000000001 R09: 0000000000000001
[  387.366086] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffabd7a8e0
[  387.366087] R13: 0000000000000006 R14: 0000005a30cf27dd R15: 0000000000000000
[  387.366093]  cpuidle_enter+0x29/0x40
[  387.366096]  cpuidle_idle_call+0x109/0x180
[  387.366099]  do_idle+0x91/0x100
[  387.366100]  cpu_startup_entry+0x19/0x20
[  387.366102]  start_secondary+0x112/0x130
[  387.366104]  secondary_startup_64_no_verify+0xe5/0xeb
[  387.366110]  </TASK>

