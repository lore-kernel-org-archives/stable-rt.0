Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA61C77B7A
	for <stable-rt@archiver.kernel.org>; Thu, 25 May 2023 02:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbjEYCQZ (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Wed, 24 May 2023 22:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbjEYCQX (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Wed, 24 May 2023 22:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95878E54
        for <stable-rt@vger.kernel.org>; Wed, 24 May 2023 19:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684980861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gfHSlYAQX3kHW23P6Jt1XKfE9VVJJmWKzal6TLde1XU=;
        b=agJmMuKD1APw4TBI4Cf8YuWquKqgKewa1zE7DdTcGGx50dcbzN6xflRlnnPXQmeonHiN/6
        PQLsd2CgD9A6i0pHxXyP1zKY56DweZbOk+2Hpb2DfDH5gnz1a447aPB2dP+cgJA+KP2Os1
        L0f02lfpz5hiMxyXC7qjlCacXqKFpFM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-lf9Ss8KFM7GksDuuvyI7Ww-1; Wed, 24 May 2023 22:14:19 -0400
X-MC-Unique: lf9Ss8KFM7GksDuuvyI7Ww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20AF83C01C14;
        Thu, 25 May 2023 02:14:19 +0000 (UTC)
Received: from localhost (unknown [10.22.32.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C65D6C164ED;
        Thu, 25 May 2023 02:14:18 +0000 (UTC)
Date:   Wed, 24 May 2023 23:14:17 -0300
From:   "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        stable-rt <stable-rt@vger.kernel.org>
Subject: Re: rt: printk: create bogus deferred print functions (V2)
Message-ID: <ZG7EefZxJPa5fbjB@uudg.org>
References: <ZG1F0hwxGRWxy/WH@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZG1F0hwxGRWxy/WH@uudg.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On Tue, May 23, 2023 at 08:01:39PM -0300, Luis Claudio R. Goncalves wrote:
> Hello,
> 
> While working on v5.10.180-rt I stumbled over two commits from stable that
> were related to deferred printing. That broke the kernel-rt builds for
> v5.10-rt. I added the workaround below to the v5.10-rt-next[1] branch that
> I pushed to kernelci.
> 
> My question is whether I should use the workaround or something like
> what Clark did in v5.15-rt:
> 
>     449f5e1c4ddef Revert "printk: remove deferred printing"
> 
> Which brings back all of deferred printing. I do hope, for my sanity, that
> the answer is "workaround", but whatever you suggest is good for me :)

The original patch failed on aarch64. So I expanded the patch a bit and
changed description, making it an extension of the deferred printing
removal already in tree. The question remains the same. :)

================

rt: printk: remove new references to deferred printing

The support for deferred printing was removed in v5.10-rc1-rt1 by commit
9153e3c5cb0c9 ("printk: remove deferred printing") because:

        Since printing occurs either atomically or from the printing
        kthread, there is no need for any deferring or tracking possible
        recursion paths. Remove all printk context tracking.

But with the recent v5.10.180 stable update these two commits were added:

    32232bcd4e530 printk: declare printk_deferred_{enter,safe}() in include/linux/printk.h
    a992c387b4118 mm/page_alloc: fix potential deadlock on zonelist_update_seq seqlock

And they break the kernel-rt builds because they depend on the nonexistent
deferred printing __printk_safe_enter() and __printk_safe_exit() pair of
functions and their higher level companions printk_deferred_enter() and
printk_deferred_exit().

In order to work around this problem, remove the printk_deferred_*
calls from mm/page_alloc.c and force the empty definitions of these
functions if PREEMPT_RT is enabled.

Fixes: 9153e3c5cb0c9 ("printk: remove deferred printing")
Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
---

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
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 5f1c50a6bebc5..7e65e3ef16e3a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6057,7 +6057,6 @@ static void __build_all_zonelists(void *data)
 	 * tty_insert_flip_string_and_push_buffer() on other CPU might be
 	 * calling kmalloc(GFP_ATOMIC | __GFP_NOWARN) with port->lock held.
 	 */
-	printk_deferred_enter();
 	write_seqlock(&zonelist_update_seq);
 
 #ifdef CONFIG_NUMA
@@ -6092,7 +6091,6 @@ static void __build_all_zonelists(void *data)
 	}
 
 	write_sequnlock(&zonelist_update_seq);
-	printk_deferred_exit();
 	local_irq_restore(flags);
 }
 
-- 
2.40.1

