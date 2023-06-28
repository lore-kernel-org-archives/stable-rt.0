Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB76EB64DA
	for <stable-rt@archiver.kernel.org>; Wed, 28 Jun 2023 08:22:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbjF1IWl convert rfc822-to-8bit (ORCPT
        <rfc822;stable-rt@archiver.kernel.org>);
        Wed, 28 Jun 2023 04:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233923AbjF1IK3 (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Wed, 28 Jun 2023 04:10:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB55C3C17
        for <stable-rt@vger.kernel.org>; Wed, 28 Jun 2023 01:08:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69F89612FD
        for <stable-rt@vger.kernel.org>; Wed, 28 Jun 2023 08:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17171C433CA;
        Wed, 28 Jun 2023 08:08:06 +0000 (UTC)
Date:   Wed, 28 Jun 2023 04:08:01 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Joseph Salisbury <joseph.salisbury@canonical.com>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        stable-rt@vger.kernel.org
Subject: Re: Stable backports
Message-ID: <20230628040801.67d42348@rorschach.local.home>
In-Reply-To: <8436cefa-9eea-7b1e-ff3f-63223f1f1ddf@canonical.com>
References: <20230620150329.6r4xxvHu@linutronix.de>
        <8436cefa-9eea-7b1e-ff3f-63223f1f1ddf@canonical.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On Tue, 27 Jun 2023 15:14:35 -0400
Joseph Salisbury <joseph.salisbury@canonical.com> wrote:

> 
> The latest two commits are still in linux-next and have not landed in 
> mainline as of yet (d15121be7485 and 2951580ba6ad).  Should I wait to 
> add them to the v5.15-rt stable tree and see if Greg adds them to his 
> trees first?

Well, they are in mainline now ;-)

But I just want to point out that our "upstream" is the next RT kernel
that we have. That is, you should wait till 6.1-rt has a commit before
you take it. 6.1 should wait till Sebastian's 6.3-rt has it.

That is, if a commit goes into Sebastion's tree, it's OK to backport.
But those backports are always added separately from merging a mainline
stable branch.

We merge stable branches by themselves and increment the -rt number
(and we do not need to post a shortlog for that, even though srt does).

Then we add backports as a separate release (and increment the -rt
number again).

-- Steve

