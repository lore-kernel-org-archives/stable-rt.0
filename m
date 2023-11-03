Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70DDC4332F
	for <stable-rt@archiver.kernel.org>; Fri,  3 Nov 2023 10:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbjKCKo2 (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Fri, 3 Nov 2023 06:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377699AbjKCKoK (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Fri, 3 Nov 2023 06:44:10 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A960BD7
        for <stable-rt@vger.kernel.org>; Fri,  3 Nov 2023 03:44:03 -0700 (PDT)
Date:   Fri, 3 Nov 2023 11:44:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1699008241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uXca5P1XYGK3ZhgkQ4uWmpMIlQvfLnbM6vlFcJOMpPU=;
        b=C/FVgEJUXtxjuX2cC5qcoKcbpWxD8SGAp8rCQSU5F2hf4FTC9cpU0QTTaBxZuj6hN5vDFl
        hcABK60azmmnT2VfK80X1YO2P7gZZgxyo1Qas4CtuQ9erwKNOgGzEgy9cZAObNrchl/eft
        TVF3zoR3IXHBc1bcijwwwbc1HdWljGiV8T9rLKODvNVDMHDFsZKj6xDWVCHyz8V426ruXd
        fVyLEeLyJdYmjiBOV1+PKDuRq7lbbBcIx/4qqo5Dmq4vFblQ5r5hhmv9LxuUM1wzutTaDX
        Hq//QQMPcK+4UroW2pjKFyTwFLgpMxlPoB2z6kL6jrotLwFKJObpgvgZSmNzKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1699008241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uXca5P1XYGK3ZhgkQ4uWmpMIlQvfLnbM6vlFcJOMpPU=;
        b=atPjXJ4CXyZWyDCZD9vv1Zc6afc6jHvbQ01d/vZAcTP4q+Ngj+vrsiKLaRpeCUNOOPWJeO
        YZEhFabe/UD9CxBg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc:     stable-rt <stable-rt@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: Quick note about v5.10.199-rt97-rc1
Message-ID: <20231103104400.PWMC-z7p@linutronix.de>
References: <ZTnL6Maa9s9ZlETp@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZTnL6Maa9s9ZlETp@uudg.org>
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On 2023-10-25 23:16:08 [-0300], Luis Claudio R. Goncalves wrote:
> Hello fellow maintainers!
> 
> I just pushed v5.10.199-rt97-rc1 (v5.10-rt-next) to kernel.org for testing.
> 
> The merge worked flawlessly but the build test failed with an undefined
> function. That was easy to track and fix, but I am not sure if the method
> I chose for the fix is the desired one.
> 
> In short, I performed the merge and then added the following patch to fix
> the build issue. Is this OK or should I have added this extra code in the
> merge?
> 
> Also, for the release, should I send the usual stable update message and
> add a note such as "the following change was required to fix a build
> problem: ..."?

Just looked at your v5.10.199-rt97-rc1 and considering everything it is
good. You could that a build failure was fixed due to upstream changes
affecting only the PREEMPT_RT part.

> Best regards,
> Luis

Sebastian
