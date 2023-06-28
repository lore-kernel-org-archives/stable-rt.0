Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D1FEB64D7
	for <stable-rt@archiver.kernel.org>; Wed, 28 Jun 2023 14:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjF1O23 (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Wed, 28 Jun 2023 10:28:29 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:48296
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231127AbjF1O20 (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Wed, 28 Jun 2023 10:28:26 -0400
Received: from [192.168.1.3] (unknown [216.212.49.106])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id F028F43F53;
        Wed, 28 Jun 2023 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1687962505;
        bh=/96p4ekEYdxHJmO9GK0Sv14uO9/Tz5RMEMpRM9oTCR4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=m4LKMBBU5PAC+jwAo3fXt7DSl5g6v+sYn83wHJYk5y79FlW0o1YQI+tUQ+fzYWI6m
         0viu9ybAy7ZfEyVyjFhi7zGJCZc/tpG4BE7b5tAFiwt6YhsbdKXJvrFGJCDI2Q4Jxd
         memymbG4VI5uQRL+O6cfVwSfEjQlRVwf2E4G9GD8MF0nMwR3JQNbb2v1tc3sIhO/uO
         iMHw0EjWbsiUCTmzpqPlwQeHfvmlwLFXbWVaxTDrJq2AsLPW+4C8rYvZrF25mM47nV
         TQGfntJQuEnLxfEJW3Htq2e0332XsqTKPJ2ay8Ifzn6JOnKYWRPbe/C0sXhu95qSGN
         9a2kmNR+9/CzA==
Message-ID: <d743d4bf-cade-5fd6-1745-cb3d5742e929@canonical.com>
Date:   Wed, 28 Jun 2023 10:28:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Stable backports
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        stable-rt@vger.kernel.org
References: <20230620150329.6r4xxvHu@linutronix.de>
 <8436cefa-9eea-7b1e-ff3f-63223f1f1ddf@canonical.com>
 <20230628040801.67d42348@rorschach.local.home>
Content-Language: en-US
From:   Joseph Salisbury <joseph.salisbury@canonical.com>
In-Reply-To: <20230628040801.67d42348@rorschach.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org



On 6/28/23 04:08, Steven Rostedt wrote:
> On Tue, 27 Jun 2023 15:14:35 -0400
> Joseph Salisbury <joseph.salisbury@canonical.com> wrote:
>
>> The latest two commits are still in linux-next and have not landed in
>> mainline as of yet (d15121be7485 and 2951580ba6ad).  Should I wait to
>> add them to the v5.15-rt stable tree and see if Greg adds them to his
>> trees first?
> Well, they are in mainline now ;-)
>
> But I just want to point out that our "upstream" is the next RT kernel
> that we have. That is, you should wait till 6.1-rt has a commit before
> you take it. 6.1 should wait till Sebastian's 6.3-rt has it.
>
> That is, if a commit goes into Sebastion's tree, it's OK to backport.
> But those backports are always added separately from merging a mainline
> stable branch.
>
> We merge stable branches by themselves and increment the -rt number
> (and we do not need to post a shortlog for that, even though srt does).
>
> Then we add backports as a separate release (and increment the -rt
> number again).
>
> -- Steve
>

This all makes sense to me now.  Thanks so much for the feedback, 
Sebastian and Steven!


