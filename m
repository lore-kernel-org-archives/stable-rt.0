Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABACC77B60
	for <stable-rt@archiver.kernel.org>; Fri, 28 Apr 2023 16:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjD1QTP (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Fri, 28 Apr 2023 12:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjD1QTO (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Fri, 28 Apr 2023 12:19:14 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522ED26A2
        for <stable-rt@vger.kernel.org>; Fri, 28 Apr 2023 09:19:13 -0700 (PDT)
Date:   Fri, 28 Apr 2023 18:19:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1682698752;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=10gMOwXQkHLYFgAmCg8HxLLRBgibnZyYZq5BO8lslp0=;
        b=s63egHh08CuGTT5fVUjyLzHh1fq/FQIeULpdG534XQGu5E/mcMFGbLOK/Kk6mQHDPyX76J
        1LtlgVen12U+RN61P1y1gEvqt0+ZXWtca2ivdM0Ofh8RdqqZtMdLPwoaiibTqgxHBWvQg3
        ZW9UUfQAjKmqEKiBgUZzrBVahKpYqkaL9QxEGduYU+5JK+3mZcfNX1w0W3rT/kR/6OdgDa
        zJCO2IgDNRL3Sttc69Dci1dQm6nbJVGyN2ZOpeuUK+oByIMdOXrJUDxvAZ4IFpAJNlM+1Y
        HH3SnqoplYfzVCKfB9H46j4QvtYd1lk62XmB2HQse8nhQs1gEgE9sWqLtFG5Ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1682698752;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=10gMOwXQkHLYFgAmCg8HxLLRBgibnZyYZq5BO8lslp0=;
        b=5peWb3c6SK+aq7ob/kWH9muVkYFRjUzHs0Itaw6rFmlz9QV1ZU9vjvPov55OY3Oy+u3K38
        2Fz7eqGhGakV5xAg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        stable-rt <stable-rt@vger.kernel.org>
Subject: Re: kernel-rt: mm/memcg: refill_obj_stock() is being called from IRQ
 context
Message-ID: <20230428161910.meKaMkWu@linutronix.de>
References: <ZEvbUY9alR5KPULD@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZEvbUY9alR5KPULD@uudg.org>
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On 2023-04-28 11:42:25 [-0300], Luis Claudio R. Goncalves wrote:
> Sebastian et al,
Hi,

> I am reporting this here, at first, to confirm if there is an obvious solution
> for the problem or if it is really a problem.
> 
> In short, refill_obj_stock() is being called from IRQ context and lockdep
> is complaining about the local lock stock_lock probably not being enough to
> protect the data.

This has been reported before and a patch has been posted
	https://lore.kernel.org/all/20230425114307.36889-1-wander@redhat.com/

I don't like it but it should cure it.

Sebastian
