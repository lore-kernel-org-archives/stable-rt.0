Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B50E82CA2
	for <stable-rt@archiver.kernel.org>; Wed, 27 Sep 2023 14:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbjI0O6J (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Wed, 27 Sep 2023 10:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjI0O6I (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Wed, 27 Sep 2023 10:58:08 -0400
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1837FC
        for <stable-rt@vger.kernel.org>; Wed, 27 Sep 2023 07:58:06 -0700 (PDT)
Received: from [10.172.66.188] (1.general.jsalisbury.us.vpn [10.172.66.188])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 85FDB3F1DB;
        Wed, 27 Sep 2023 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1695826683;
        bh=YXBLffQh8IEIRv/Gz7wpg3U+GoEQ64owEiEjGNuR/jE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=gN6l2g/rEjLmvgZYinjM9p2mtpq29GRbAyok2KMuGAqqG6m+T/YJkha7eLKWZA3og
         K6keCKqSste1XaQZqRUlMPX2cvA5JCA85+neShuFr/cFL1s8mVRlspf20j+tk5U0Uv
         f9jqqAOQ+paKe7kFd36N3GtDk23EHLFo6Qz3WNXbWaFScPEaR5o0o/4RA8ISlq5ff7
         8NGNwj3xsXl4jA5iLQPQ+WfLMrtUVPrcfu5PNnMp6woLPtQ+A/C1pUC6yz+GSnJgbQ
         2ht+7PRYsjfTvIQAv2sIJm9g31qEQAQLRFTJc/jRLe/gkVaQemjdNOfn9NROybPMix
         yVyz26E2kMROg==
Message-ID: <0c80279b-e836-64a7-2bbb-6520e1834360@canonical.com>
Date:   Wed, 27 Sep 2023 10:58:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Conflict for v5.15-rt
Content-Language: en-US
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Clark Williams <williams@redhat.com>,
        Clark Williams <clark.williams@gmail.com>, lgoncalv@redhat.com,
        daniel.wagner@suse.com, tom.zanussi@linux.intel.com,
        "Gross, Mark" <mark.gross@intel.com>, john.ogness@linutronix.de,
        stable-rt@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
References: <f4b772af-3df2-82c5-336a-44341fce07fc@canonical.com>
 <20230927063438.ddjwR4DY@linutronix.de>
From:   Joseph Salisbury <joseph.salisbury@canonical.com>
In-Reply-To: <20230927063438.ddjwR4DY@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org



On 9/27/23 02:34, Sebastian Andrzej Siewior wrote:
> On 2023-09-26 15:20:35 [-0400], Joseph Salisbury wrote:
>> Hey Stable Folks,
> Hi,
>
>> While creating the real-time stable kernel, v5.15-rt68, I ran into a
>> conflict.  The conflict occurred while merging in upstream stable 5.15.133
>> due to the following commit:
>> f980bf1586ef ("printk: Consolidate console deferred printing")  Upstream
>> commit 696ffaf50e1f
>>
>> I was wondering if you came across this commit for v6.1-rt yet, Clark?  If
>> you did, how did you proceed with the backport?  For v5.15-rt, there is the
>> following patch that touches the same code, so I wanted to be careful:
>> 0009-printk-call-boot_delay_msec-in-printk_delay.patch - [PATCH 009/171]
>> printk: call boot_delay_msec() in printk_delay()
>>
>> I wanted to run this buy you all prior to backporting, and ensure I follow
>> what all other stable versions plan on doing.
> I dropped that patch while doing v5.19-rc1-rt1. It was merged as
>     1f47e8af45fdd ("printk: call boot_delay_msec() in printk_delay()")
>
> meaning Clark shouldn't have any problems related to this.
Ok, I understand.  Thanks for the feedback!
>
> Would looking at later RT kernel help? As of v6.6-rc1-rt1 the printk
> code is mostly the same.
I'll do this.  Thanks again for the suggestions and help!
>
>> Thanks,
>>
>> Joe
> Sebastian

