Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6801DC77B61
	for <stable-rt@archiver.kernel.org>; Fri, 28 Apr 2023 18:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjD1SBY (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Fri, 28 Apr 2023 14:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjD1SBX (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Fri, 28 Apr 2023 14:01:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0FD1FDB
        for <stable-rt@vger.kernel.org>; Fri, 28 Apr 2023 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682704838;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=b8JFRxct5lkOd3hzJncFizpd5DdUIvvYTUJbV5bf+yA=;
        b=GSJO4rgMbJqjuDwXgUMkLwjbGvqOKP76eJjjbiSRUBzBtkzgcMJ2j7ZMLtXjOcVDA6NOxg
        IbIg+Y39Y003QAIf8WlQzNz7DuZ2slgVd+zZ4xLy5k4Nr3+rBmmxIUNHJc0ZyRatKtInDt
        ZV5WQv1BygtuMhDTosoq/6kvjMAlpXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-h9IQFPu3OHm2PuOgQvU8Tw-1; Fri, 28 Apr 2023 14:00:33 -0400
X-MC-Unique: h9IQFPu3OHm2PuOgQvU8Tw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D500811E7E;
        Fri, 28 Apr 2023 18:00:30 +0000 (UTC)
Received: from localhost (unknown [10.22.34.53])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3BB0A2027043;
        Fri, 28 Apr 2023 18:00:30 +0000 (UTC)
Date:   Fri, 28 Apr 2023 15:00:29 -0300
From:   "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        stable-rt <stable-rt@vger.kernel.org>
Subject: Re: kernel-rt: mm/memcg: refill_obj_stock() is being called from IRQ
 context
Message-ID: <ZEwJvU69mrXFu8Rg@uudg.org>
References: <ZEvbUY9alR5KPULD@uudg.org>
 <20230428161910.meKaMkWu@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428161910.meKaMkWu@linutronix.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On Fri, Apr 28, 2023 at 06:19:10PM +0200, Sebastian Andrzej Siewior wrote:
> On 2023-04-28 11:42:25 [-0300], Luis Claudio R. Goncalves wrote:
> > Sebastian et al,
> Hi,
> 
> > I am reporting this here, at first, to confirm if there is an obvious solution
> > for the problem or if it is really a problem.
> > 
> > In short, refill_obj_stock() is being called from IRQ context and lockdep
> > is complaining about the local lock stock_lock probably not being enough to
> > protect the data.
> 
> This has been reported before and a patch has been posted
> 	https://lore.kernel.org/all/20230425114307.36889-1-wander@redhat.com/
> 
> I don't like it but it should cure it.

Thank you! I both forgot about that thread and also missed that in my searches.

And yes, that's a solution for a different issue that fixes the problem I
reported as a side effect :)

I was torn between redoing the locking in that code or using something
similar to an old proposal from Wayman Long, where he had different
variables to account work on atomic and non-atomic contexts (which might
not be applicable here)

> Sebastian
> 
---end quoted text---

