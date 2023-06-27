Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321B8EB64D9
	for <stable-rt@archiver.kernel.org>; Tue, 27 Jun 2023 19:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjF0TOm (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Tue, 27 Jun 2023 15:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbjF0TOm (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Tue, 27 Jun 2023 15:14:42 -0400
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE0126A5
        for <stable-rt@vger.kernel.org>; Tue, 27 Jun 2023 12:14:38 -0700 (PDT)
Received: from [10.172.66.188] (1.general.jsalisbury.us.vpn [10.172.66.188])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 66506426B5;
        Tue, 27 Jun 2023 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1687893276;
        bh=VfP4+s3d+he6YUX+JR8BAakXg/T7j1ASaK1a2dwr+1s=;
        h=Message-ID:Date:MIME-Version:To:References:From:Subject:
         In-Reply-To:Content-Type;
        b=H6o5KUL8Y6gNPwe+uf3MTECiOWo8AWnEVijS4MXWDH0QdQ4Atkp2i7JLofZaSojWe
         0BZSUj3CyIOL5uyoTyBH7YjHiF422rFNg/mNiAOJ8qOlvV1RJoNLjhQrrLj/OV9eTP
         Y3Xs4nSksTFrfFdFNBydxZWoiXnzAuSVP0xbKn3WvUGj8kZLa7dwXSxeQhYhp/Z40H
         0RDLZ9ni/RwjJ6FvGSw5XaZteUSuzZBdLIgIZ8/B1HS4HOkBnKz3WM33KyBoIVqynN
         Kd2G/VJQQWj+Hep1TdsUUmQvVChRuQ0KfAvGW2r3L2M6+wWuzdQo7RPESo/Jc4ZnSZ
         6n/IkVIGDuusw==
Message-ID: <8436cefa-9eea-7b1e-ff3f-63223f1f1ddf@canonical.com>
Date:   Tue, 27 Jun 2023 15:14:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        stable-rt@vger.kernel.org
References: <20230620150329.6r4xxvHu@linutronix.de>
From:   Joseph Salisbury <joseph.salisbury@canonical.com>
Subject: Re: Stable backports
In-Reply-To: <20230620150329.6r4xxvHu@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On 6/20/23 11:03, Sebastian Andrzej Siewior wrote:
> Hi,
>
> I've been looking over my queue and which patches vanishes (as in
> applied somewhere) and did not show up in the stable tree. Here is a
> list of some suggestions:
>
> - 7eb16f23b9a41 ("io-mapping: don't disable preempt on RT in io_mapping_map_atomic_wc().")
> - 286deb7ec03d9 ("locking/rwbase: Mitigate indefinite writer starvation")
> - 1c0908d8e4416 ("rtmutex: Add acquire semantics for rtmutex lock acquisition slow path")
>    (is in v6.1 but not in v5.15)
> - b8a04a538ed47 ("revert: "softirq: Let ksoftirqd do its job"")
> - 38cdd83a47fb2 ("tracing/timer: Add missing hrtimer modes to decode_hrtimer_mode().")
>
> Sebastian
Hi Sebastian,

Thanks for the heads up on these commits!

It appears v5.15 will need these commits:

d15121be7485 ("revert: "softirq: Let ksoftirqd do its job"")
2951580ba6ad ("tracing/timer: Add missing hrtimer modes to 
decode_hrtimer_mode().")
7eb16f23b9a41 ("io-mapping: don't disable preempt on RT in 
io_mapping_map_atomic_wc().")
286deb7ec03d9 ("locking/rwbase: Mitigate indefinite writer starvation")

The following commit was already added to v5.15 in v5.15.109:

c15737965434 (rtmutex: Add acquire semantics for rtmutex lock 
acquisition slow path)


The latest two commits are still in linux-next and have not landed in 
mainline as of yet (d15121be7485 and 2951580ba6ad).  Should I wait to 
add them to the v5.15-rt stable tree and see if Greg adds them to his 
trees first?

Thanks,

Joe



