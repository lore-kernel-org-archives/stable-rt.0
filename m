Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD973C4167D
	for <stable-rt@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbjKCLfi (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Fri, 3 Nov 2023 07:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjKCLfh (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Fri, 3 Nov 2023 07:35:37 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5CCD56
        for <stable-rt@vger.kernel.org>; Fri,  3 Nov 2023 04:35:31 -0700 (PDT)
Date:   Fri, 3 Nov 2023 12:35:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1699011330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=i5rZvkveOBnOBGKOKv2Xlr0Q1K6IG3IWwYkkBkXSFyM=;
        b=AlLwPnVoMTPj+CqJpEhvR1aZhplWV2ZnX1ZOh0dhaZ1PzO9DsS9uy+Fzb9r0qzDRDEWGy5
        vwVxx7v0sZNbQPN4k6ePiIZY8tU74uIOFyJp9qWboyqPI/tomo8DepDDggLhTjw9UrJFjV
        BdQCUA57Prf5RZiAf6NbJs6nKxFB7b7/rqebyhWcBnvCgoENAkhAXMDQ4DCTaoyk77w7f7
        ElgpAgQQ2CLNyOrniTqd8bxAzWDHD1OOc+TJWrobfikzDOwqixleQbETtEp1e/sJxGtT1T
        PY98WRsgMgoBjQxyQTAG35GnfQqTqBBvH+aFYuxm3Z9HG6Q3tgt08DubHD0p5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1699011330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=i5rZvkveOBnOBGKOKv2Xlr0Q1K6IG3IWwYkkBkXSFyM=;
        b=KATbcZyHyS0VmrpWwTDwPf5L/eH7hzdVpSyr9idLvbzIO/Cm5hRvTqbZhZbY81zH1YQvZ5
        2YaLv4W0nXz4F3CQ==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     stable-rt@vger.kernel.org
Cc:     "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Subject: v5.10 and less needs a fix up for __build_all_zonelists()
Message-ID: <20231103113529.3TspAnq-@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

Hi!

upstream landed commit
	a2ebb51575828 ("mm/page_alloc: use write_seqlock_irqsave() instead write_seqlock() + local_irq_save().")

a while ago after Luis pointed me at the actual issue. The v6.1-RT and
v5.15-RT received the proper backport via -stable and are good.
v5.10-RT has the commit
    7bdd3bd5143a4 ("Revert "mm/page_alloc: fix potential deadlock on zonelist_update_seqseqlock"")

which I may have suggested at the time but requires now something
proper. In reality it may not matter because nobody is using
memory-hotplug but is should be fixed properly. Also it (as in v5.10)
affects non-RT users. In less than v5.10 it affects possible RT users.

The fix for 5.10-RT is just the snippet which is the resolution if the
initial commit would be backported to the v5.10 which did not happen.
Everything less than v5.10 should apply commit a2ebb51575828 mentioned
earlier.

Sebastian

-----8<---

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 3760a06932a6e..f6b3a46ac87d5 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6043,8 +6043,9 @@ static void __build_all_zonelists(void *data)
 	int nid;
 	int __maybe_unused cpu;
 	pg_data_t *self = data;
+	unsigned long flags;
 
-	write_seqlock(&zonelist_update_seq);
+	write_seqlock_irqsave(&zonelist_update_seq, flags);
 
 #ifdef CONFIG_NUMA
 	memset(node_load, 0, sizeof(node_load));
@@ -6077,7 +6078,7 @@ static void __build_all_zonelists(void *data)
 #endif
 	}
 
-	write_sequnlock(&zonelist_update_seq);
+	write_sequnlock_irqrestore(&zonelist_update_seq, flags);
 }
 
 static noinline void __init
