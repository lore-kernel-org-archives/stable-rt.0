Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87522C001E0
	for <stable-rt@archiver.kernel.org>; Thu, 27 Jul 2023 10:50:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbjG0Kup (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Thu, 27 Jul 2023 06:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbjG0Kuo (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Thu, 27 Jul 2023 06:50:44 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC882125
        for <stable-rt@vger.kernel.org>; Thu, 27 Jul 2023 03:50:43 -0700 (PDT)
Date:   Thu, 27 Jul 2023 12:50:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1690455041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WV28S33L9A313xv8fVSW5I0FfVPDzD1kq0pNIvKipvM=;
        b=TXanPrCvcwb9/c6WWIM9PbpdRCGNleZA3y2eT8aYrm/mJGg0XsHRpotPT8ycZLtYCQQdC8
        NNwy9L2epxaL0jmF+BXBDsh5OrZzNBZ9EKQUDW9VO8bpzm1ZeqpnLTv3I10HICVL16HTpv
        z0VGgbXK9gy+ySqzNQOuB+T7hAbfiYrwSobQHTFyXGcg/en4ulq/6fgnkmKJwrCN6ZtQIB
        Yva53jWvJTn2AKw7nIHPCquqoDzj8fGrLbMv1XrLxjGP6vM4FvThN0H1s+F21wGf5GqeU4
        ttz6gQAfkPCRi/j2dVGPTKpn75VmGbYZU8cxYjZEDm/oix2J8/4YFn3A+4RnwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1690455041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WV28S33L9A313xv8fVSW5I0FfVPDzD1kq0pNIvKipvM=;
        b=LJfeP0ZuF7HHMClZFr1YC0HTwR2U4HPJEHZ+xLvKCqC3vrBwlSOQudlk40PkY9KqV88i0X
        YWD6JERWyqX/PsCA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     stable-rt@vger.kernel.org
Subject: Re: Stable backports
Message-ID: <20230727105040.4V9DQ5pM@linutronix.de>
References: <20230620150329.6r4xxvHu@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230620150329.6r4xxvHu@linutronix.de>
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On 2023-06-20 17:03:29 [+0200], To stable-rt@vger.kernel.org wrote:
Hi,

> I've been looking over my queue and which patches vanishes (as in
> applied somewhere) and did not show up in the stable tree. Here is a
> list of some suggestions:
> 
> - 7eb16f23b9a41 ("io-mapping: don't disable preempt on RT in io_mapping_map_atomic_wc().")
> - 286deb7ec03d9 ("locking/rwbase: Mitigate indefinite writer starvation")
> - 1c0908d8e4416 ("rtmutex: Add acquire semantics for rtmutex lock acquisition slow path")
>   (is in v6.1 but not in v5.15)
> - b8a04a538ed47 ("revert: "softirq: Let ksoftirqd do its job"")
> - 38cdd83a47fb2 ("tracing/timer: Add missing hrtimer modes to decode_hrtimer_mode().")

No idea how far backporting got, I would like to extend the list:
- 40cd2835ced28 ("drm/i915: Do not disable preemption for resets")
- 7edeaf858cef4 ("locking/rtmutex: Fix task->pi_waiters integrity")
  Could be routed via stable
- 053ba1b91e511 ("kernel/fork: beware of __put_task_struct calling context")

The following two are just for lockdep:
- 0cce06ba859a5 ("debugobjects,locking: Annotate debug_object_fill_pool() wait type violation")
- a5e446e728e89 ("sched: avoid false lockdep splat in put_task_struct()")

The following three are for mm backport from stable which broke RT and
was noticed during Luis' stable backport. This should be backported so
it is fixed and aligned with upstream:
- a3f6be6e53532 ("printk: Check only for migration in printk_deferred_*().")
- dc93c1f07d485 ("seqlock: Do the lockdep annotation before locking in do_write_seqcount_begin_nested()")
- 4d1139baae8bc ("mm/page_alloc: Use write_seqlock_irqsave() instead write_seqlock() + local_irq_save().")

And finally. Both upstream not sure if they get in via -stable, but I
doubt since they are RT-only and not tagged:
- ab5d47bd41b1d ("bpf: Remove in_atomic() from bpf_link_put().")
- 9d9e522010eb5 ("posix-timers: Prevent RT livelock in itimer_delete()")
- 8ce8849dd1e78 ("posix-timers: Ensure timer ID search-loop limit is valid")

Sebastian
