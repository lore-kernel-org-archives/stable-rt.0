Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007C2C4332F
	for <stable-rt@archiver.kernel.org>; Fri,  3 Nov 2023 12:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjKCMsX (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Fri, 3 Nov 2023 08:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjKCMsW (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Fri, 3 Nov 2023 08:48:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B15FCE
        for <stable-rt@vger.kernel.org>; Fri,  3 Nov 2023 05:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699015659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=awToWzg6hjB6/2jXosNtFbfWNEl6Dzr0AAL9mpjtPPI=;
        b=NSTkj0RI7lepLBhju/BzRQoSvZ9zAx0Fv6XH7AUAAqbEYj7A+LHXPFlxA4mI1P/eGamBYl
        rr1uPV43YrcgfRpQeJYlQmaEnpxLOOf69PZfNYjOLXIObYP2JB1GMpz3fyDwLqzqgec/rB
        q0E4flMXi34oOv6BFBc/xdtbmHIBjQU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-8AQlJj16NBqX6Ijb0lUHwA-1; Fri,
 03 Nov 2023 08:47:38 -0400
X-MC-Unique: 8AQlJj16NBqX6Ijb0lUHwA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5862381078C;
        Fri,  3 Nov 2023 12:47:37 +0000 (UTC)
Received: from localhost (unknown [10.22.33.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 80AB910160;
        Fri,  3 Nov 2023 12:47:37 +0000 (UTC)
Date:   Fri, 3 Nov 2023 09:47:36 -0300
From:   "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     stable-rt@vger.kernel.org
Subject: Re: v5.10 and less needs a fix up for __build_all_zonelists()
Message-ID: <ZUTr6L3AHmDMy8Ma@uudg.org>
References: <20231103113529.3TspAnq-@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103113529.3TspAnq-@linutronix.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On Fri, Nov 03, 2023 at 12:35:29PM +0100, Sebastian Andrzej Siewior wrote:
> Hi!
> 
> upstream landed commit
> 	a2ebb51575828 ("mm/page_alloc: use write_seqlock_irqsave() instead write_seqlock() + local_irq_save().")
> 
> a while ago after Luis pointed me at the actual issue. The v6.1-RT and
> v5.15-RT received the proper backport via -stable and are good.
> v5.10-RT has the commit
>     7bdd3bd5143a4 ("Revert "mm/page_alloc: fix potential deadlock on zonelist_update_seqseqlock"")
> 
> which I may have suggested at the time but requires now something
> proper. In reality it may not matter because nobody is using
> memory-hotplug but is should be fixed properly. Also it (as in v5.10)
> affects non-RT users. In less than v5.10 it affects possible RT users.
> 
> The fix for 5.10-RT is just the snippet which is the resolution if the
> initial commit would be backported to the v5.10 which did not happen.
> Everything less than v5.10 should apply commit a2ebb51575828 mentioned
> earlier.

Thank you for the heads-up, Sebastian!

I will finish the work on v5.10.199-rt97-rc1 and then release an RT-only
update with the fix below.

Luis

> Sebastian
> 
> -----8<---
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 3760a06932a6e..f6b3a46ac87d5 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6043,8 +6043,9 @@ static void __build_all_zonelists(void *data)
>  	int nid;
>  	int __maybe_unused cpu;
>  	pg_data_t *self = data;
> +	unsigned long flags;
>  
> -	write_seqlock(&zonelist_update_seq);
> +	write_seqlock_irqsave(&zonelist_update_seq, flags);
>  
>  #ifdef CONFIG_NUMA
>  	memset(node_load, 0, sizeof(node_load));
> @@ -6077,7 +6078,7 @@ static void __build_all_zonelists(void *data)
>  #endif
>  	}
>  
> -	write_sequnlock(&zonelist_update_seq);
> +	write_sequnlock_irqrestore(&zonelist_update_seq, flags);
>  }
>  
>  static noinline void __init
> 
---end quoted text---

