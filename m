Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151C0E7E65A
	for <stable-rt@archiver.kernel.org>; Tue, 26 Sep 2023 19:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjIZTUs (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Tue, 26 Sep 2023 15:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjIZTUr (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Tue, 26 Sep 2023 15:20:47 -0400
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CA3192
        for <stable-rt@vger.kernel.org>; Tue, 26 Sep 2023 12:20:40 -0700 (PDT)
Received: from [10.172.66.188] (1.general.jsalisbury.us.vpn [10.172.66.188])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 85EA943EA6;
        Tue, 26 Sep 2023 19:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1695756038;
        bh=PJAad6d+B0a8gqDLzsbLJCwDMt467KmJUilmMHC/a9g=;
        h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type;
        b=WYcatwYAdPEaWSHMURO6vSPiIZtPYJvFuJq/rBj0t1UzBDdfPVhALZMLG4BVFerio
         c+fLC/ayyE8GvCmh/XLHMp20XIA0MD0V3g1rh8iq0p6+XFU/8GNlcmZPShSAJziEtE
         KH9uLytCf7cHpjU41VcP0ZItTUHfGkP8BQvFwVaGJz7h2m2rjfeRM3AlcaUOKWADZD
         dnFUfYaMvWNKzD/vqfdn7DIWG80YYP90pQhxIOuVzwSITG17LVrlwOBFe3gm4RnqiC
         vGSr9aSsBj+kCGKAlpyonV50Xnyu4XFdmRf2K3WSjeBkN0gi440Am1Pbb5+jo7gXd8
         XHBHRhI//2Tkg==
Message-ID: <f4b772af-3df2-82c5-336a-44341fce07fc@canonical.com>
Date:   Tue, 26 Sep 2023 15:20:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     Clark Williams <williams@redhat.com>,
        Clark Williams <clark.williams@gmail.com>, lgoncalv@redhat.com,
        daniel.wagner@suse.com, tom.zanussi@linux.intel.com,
        "Gross, Mark" <mark.gross@intel.com>
Cc:     john.ogness@linutronix.de, stable-rt@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
From:   Joseph Salisbury <joseph.salisbury@canonical.com>
Subject: Conflict for v5.15-rt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

Hey Stable Folks,

While creating the real-time stable kernel, v5.15-rt68, I ran into a 
conflict.  The conflict occurred while merging in upstream stable 
5.15.133 due to the following commit:
f980bf1586ef ("printk: Consolidate console deferred printing")  Upstream 
commit 696ffaf50e1f

I was wondering if you came across this commit for v6.1-rt yet, Clark?  
If you did, how did you proceed with the backport?  For v5.15-rt, there 
is the following patch that touches the same code, so I wanted to be 
careful:
0009-printk-call-boot_delay_msec-in-printk_delay.patch - [PATCH 009/171] 
printk: call boot_delay_msec() in printk_delay()

I wanted to run this buy you all prior to backporting, and ensure I 
follow what all other stable versions plan on doing.

Thanks,

Joe





