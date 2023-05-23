Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3745BC7EE23
	for <stable-rt@archiver.kernel.org>; Tue, 23 May 2023 23:02:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbjEWXC2 (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Tue, 23 May 2023 19:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233341AbjEWXC1 (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Tue, 23 May 2023 19:02:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AED2DA
        for <stable-rt@vger.kernel.org>; Tue, 23 May 2023 16:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684882903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=CEsbtbS+r4nFSX2WEp0qmpci7TM/HN+xQ4KohZe8jWg=;
        b=VdLeKCMUhZUWe2f8wPUBGKIu+qfuNdizLQMQ7QIt/vzKDPxuDfOsEOAkS8uRfhZsDEteLg
        3d4USdFb1zQo93jBcFU5G10E7eCRwVA1NTDUYHqDfkypy4GVH30+1YkQwFg+fRsFBxLowF
        j33SgxCp1E1zjAc0WLvWGG62OaRSmgk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-M59eF-x6O92WlUCBycMCiA-1; Tue, 23 May 2023 19:01:39 -0400
X-MC-Unique: M59eF-x6O92WlUCBycMCiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93126811E78;
        Tue, 23 May 2023 23:01:39 +0000 (UTC)
Received: from localhost (unknown [10.22.18.136])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4636A40C6CCF;
        Tue, 23 May 2023 23:01:39 +0000 (UTC)
Date:   Tue, 23 May 2023 20:01:38 -0300
From:   "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        stable-rt <stable-rt@vger.kernel.org>
Subject: rt: printk: create bogus deferred print functions
Message-ID: <ZG1F0hwxGRWxy/WH@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

Hello,

While working on v5.10.180-rt I stumbled over two commits from stable that
were related to deferred printing. That broke the kernel-rt builds for
v5.10-rt. I added the workaround below to the v5.10-rt-next[1] branch that
I pushed to kernelci.

My question is whether I should use the workaround or something like
what Clark did in v5.15-rt:

    449f5e1c4ddef Revert "printk: remove deferred printing"

Which brings back all of deferred printing. I do hope, for my sanity, that
the answer is "workaround", but whatever you suggest is good for me :)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/commit/?h=v5.10-rt-next&id=c14d0593588daa7d53f66bf1e787f982daf8cc98


Best, Luis


===

commit c14d0593588daa7d53f66bf1e787f982daf8cc98
Author: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
Date:   Tue May 23 19:17:23 2023 -0300

    rt: printk: create bogus deferred print functions
    
    Since v5.10-rc1-rt1 we carry this change:
    
        commit 9153e3c5cb0c96242fa85ab151b9b29647634c9a
        Author: John Ogness <john.ogness@linutronix.de>
        Date:   Mon Oct 19 22:53:30 2020 +0206
    
            printk: remove deferred printing
    
            Since printing occurs either atomically or from the printing
            kthread, there is no need for any deferring or tracking possible
            recursion paths. Remove all printk context tracking.
    
    But with the recent v5.10.180 stable update these two commits were added:
    
        32232bcd4e530 printk: declare printk_deferred_{enter,safe}() in include/linux/printk.h
        a992c387b4118 mm/page_alloc: fix potential deadlock on zonelist_update_seq seqlock
    
    And they break the kernel-rt builds because they depend on the nonexistent
    __printk_safe_enter() and __printk_safe_exit() pair of functions.
    
    In order to work around that problem, while minimizing the code delta, make
    the two related functions, printk_deferred_enter() and printk_deferred_exit()
    into no-ops.
    
    Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 83c7734e98025..92e0656841128 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -609,7 +609,7 @@ static inline void print_hex_dump_debug(const char *prefix_str, int prefix_type,
 #define print_hex_dump_bytes(prefix_str, prefix_type, buf, len)	\
 	print_hex_dump_debug(prefix_str, prefix_type, 16, 1, buf, len, true)
 
-#ifdef CONFIG_PRINTK
+#if defined(CONFIG_PRINTK) && !defined(CONFIG_PREEMPT_RT)
 extern void __printk_safe_enter(void);
 extern void __printk_safe_exit(void);
 /*
@@ -619,7 +619,7 @@ extern void __printk_safe_exit(void);
  */
 #define printk_deferred_enter __printk_safe_enter
 #define printk_deferred_exit __printk_safe_exit
-#else
+#else /* defined(CONFIG_PRINTK) && !defined(CONFIG_PREEMPT_RT) */
 static inline void printk_deferred_enter(void)
 {
 }

