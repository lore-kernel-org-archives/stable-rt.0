Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF6DC7EE24
	for <stable-rt@archiver.kernel.org>; Tue,  6 Jun 2023 09:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbjFFJxN (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Tue, 6 Jun 2023 05:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjFFJxM (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Tue, 6 Jun 2023 05:53:12 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DADFE55
        for <stable-rt@vger.kernel.org>; Tue,  6 Jun 2023 02:53:11 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:53:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1686045190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7ZJKIcjzWhzx001T7TzvG3CttB6rIYjyiFQ31Lblr7o=;
        b=ofritgQMh01+qQfoU8IgBE7ws9PvCLXLj2I0HdBVyU/I3qgkWuDiDKv/s0yUZTPklAmt0w
        6xUPAkR+6HYlgRHv6tQ2fUBBqsyIOOU6unOrZR7kJmJETtOYGwnwTgqLrc/wXB+hytJnSC
        FKdCSNv6d+yCocyuT7VqdXLiSjw09huhapzu8EHu2FuJDDlnRO8qAr9i0BoDFy+NyZHzn5
        FREIAe/qQallkcnfsIgdnVK2W+7lc7njq95JpDl8IgLe1RWXpv/M26+B6ar75+K/FMLvlp
        S6GNLVb3VFbqmfZOdC5y29o4iW65MPp4V+kLqQEpSgiyc9/nhZ2ZTcJiQuZvlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1686045190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7ZJKIcjzWhzx001T7TzvG3CttB6rIYjyiFQ31Lblr7o=;
        b=Ie0eN6avLp3ZcbuDjwsUSserVcwijitXoL+Th+0TukGqlAnOCn7Oi9DAJXvG5Z0UBmO0SZ
        VUuH3AYGXCVCP7Cg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
        Clark Williams <williams@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        stable-rt <stable-rt@vger.kernel.org>
Subject: Re: rt: printk: create bogus deferred print functions (V2)
Message-ID: <20230606095308.ITricJVs@linutronix.de>
References: <ZG1F0hwxGRWxy/WH@uudg.org>
 <ZG7EefZxJPa5fbjB@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZG7EefZxJPa5fbjB@uudg.org>
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On 2023-05-24 23:14:17 [-0300], Luis Claudio R. Goncalves wrote:
> > My question is whether I should use the workaround or something like
> > what Clark did in v5.15-rt:
> > 
> >     449f5e1c4ddef Revert "printk: remove deferred printing"
> > 
> > Which brings back all of deferred printing. I do hope, for my sanity, that
> > the answer is "workaround", but whatever you suggest is good for me :)
> 
> The original patch failed on aarch64. So I expanded the patch a bit and
> changed description, making it an extension of the deferred printing
> removal already in tree. The question remains the same. :)

I missed that this got reverted in the v5.15 tree. Please see what I
wrote to your release email. And this deferred thingy needs to go back
into v5.15.

Sebastian
