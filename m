Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADADC25B47
	for <stable-rt@archiver.kernel.org>; Thu, 26 Oct 2023 02:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbjJZCRU (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Wed, 25 Oct 2023 22:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjJZCRT (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Wed, 25 Oct 2023 22:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D4493
        for <stable-rt@vger.kernel.org>; Wed, 25 Oct 2023 19:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698286590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=fMqNGpwH5pL+RIluIaKaVyh+KyG1tzmXNL4o4kcyT5o=;
        b=iTQsj+/GPEkIAEbMeWlfBMllUHvnq1xHXHcReA5QCMdj1ccF7CZBSs5YmvZianTvjcky/c
        rYYFIcNEjPE08RUfXIMdW6SRY8GtiA7/T4EywzEr+j77o5WbFT9kRPa9Ovg6gn1C0ko0TN
        jJaphcQxiKa3IaUv/tPXhlE0nWhT9Mc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-mvQaj3pCO0edylCVuO-w5Q-1; Wed,
 25 Oct 2023 22:16:09 -0400
X-MC-Unique: mvQaj3pCO0edylCVuO-w5Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67E14280BC43;
        Thu, 26 Oct 2023 02:16:09 +0000 (UTC)
Received: from localhost (unknown [10.22.8.151])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0CCDF492BE7;
        Thu, 26 Oct 2023 02:16:08 +0000 (UTC)
Date:   Wed, 25 Oct 2023 23:16:08 -0300
From:   "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To:     stable-rt <stable-rt@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Quick note about v5.10.199-rt97-rc1
Message-ID: <ZTnL6Maa9s9ZlETp@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

Hello fellow maintainers!

I just pushed v5.10.199-rt97-rc1 (v5.10-rt-next) to kernel.org for testing.

The merge worked flawlessly but the build test failed with an undefined
function. That was easy to track and fix, but I am not sure if the method
I chose for the fix is the desired one.

In short, I performed the merge and then added the following patch to fix
the build issue. Is this OK or should I have added this extra code in the
merge?

Also, for the release, should I send the usual stable update message and
add a note such as "the following change was required to fix a build
problem: ..."?

Best regards,
Luis

---
net: replace raw_write_seqcount_t_begin by do_raw_write_seqcount_begin

Commit a8dd21118b0fa ("seqlock: Prefix internal seqcount_t-only macros with a
"do_""), among other changes, renames the function raw_write_seqcount_t_begin
to do_raw_write_seqcount_begin. That commit did not cover the changes from
the RT-only commit 81ce24cd24a9e ("net: Properly annotate the try-lock for the
seqlock"), which are fixed here.

Fixes: 81ce24cd24a9e ("net: Properly annotate the try-lock for the seqlock")
Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
---
 include/net/sch_generic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
index 72be68652bb84..eee11a1c93216 100644
--- a/include/net/sch_generic.h
+++ b/include/net/sch_generic.h
@@ -195,7 +195,7 @@ static inline bool qdisc_run_begin(struct Qdisc *qdisc)
 		 * Variant of write_seqcount_t_begin() telling lockdep that a
 		 * trylock was attempted.
 		 */
-		raw_write_seqcount_t_begin(s);
+		do_raw_write_seqcount_begin(s);
 		seqcount_acquire(&s->dep_map, 0, 1, _RET_IP_);
 		return true;
 	}
-- 
2.41.0

