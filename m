Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7372BE80A99
	for <stable-rt@archiver.kernel.org>; Wed, 27 Sep 2023 06:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjI0Gep (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Wed, 27 Sep 2023 02:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjI0Gep (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Wed, 27 Sep 2023 02:34:45 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3180A9C
        for <stable-rt@vger.kernel.org>; Tue, 26 Sep 2023 23:34:44 -0700 (PDT)
Date:   Wed, 27 Sep 2023 08:34:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1695796481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z8unhHVLOoukWXaWRaeIRVDxKhjSenw1dZsYwH5k4L4=;
        b=19lEE7VBN8XUTh9mfFUsA3qcm0lNhwPrZSnPWoYBFVEQI+lEZ3t6ZheDMVWT9hrOrIvGbJ
        Oq1/VViKqE6O28CmMJ+CBxyxmhfetSaTNKEf5YD+LxnL28P/q41723E+jRcI/H4J03m8mj
        IdU5WzxCUoeUA5gI5qMW88gcbcGcWYhBT0NwXBl7iDUvKkxN0iU7FPjMucsPUt5YDubPpv
        ItqxE6OonWyuV4wliY8zoApWFDgohzfKwsmeL9120f2YdP2KxkFd0szgWsIFmM8J5+Kg3x
        qgJD7QyyIDkVB92QcEZyN65wmJUiyoQEo4Td7fvLQ8K1aYuCpfEWnhaCgjHNtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1695796481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z8unhHVLOoukWXaWRaeIRVDxKhjSenw1dZsYwH5k4L4=;
        b=tmNQv7M/V4UFVAZm3RoZXiWex7iaLK1mxvVbaM8UhfIhbBNvN3JK4RZRW9TfYM2IUXlwD0
        TY0yW8yQ9fFQwdAg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Joseph Salisbury <joseph.salisbury@canonical.com>
Cc:     Clark Williams <williams@redhat.com>,
        Clark Williams <clark.williams@gmail.com>, lgoncalv@redhat.com,
        daniel.wagner@suse.com, tom.zanussi@linux.intel.com,
        "Gross, Mark" <mark.gross@intel.com>, john.ogness@linutronix.de,
        stable-rt@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: Conflict for v5.15-rt
Message-ID: <20230927063438.ddjwR4DY@linutronix.de>
References: <f4b772af-3df2-82c5-336a-44341fce07fc@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f4b772af-3df2-82c5-336a-44341fce07fc@canonical.com>
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On 2023-09-26 15:20:35 [-0400], Joseph Salisbury wrote:
> Hey Stable Folks,
Hi,

> While creating the real-time stable kernel, v5.15-rt68, I ran into a
> conflict.=C2=A0 The conflict occurred while merging in upstream stable 5.=
15.133
> due to the following commit:
> f980bf1586ef ("printk: Consolidate console deferred printing") =C2=A0Upst=
ream
> commit 696ffaf50e1f
>=20
> I was wondering if you came across this commit for v6.1-rt yet, Clark?=C2=
=A0 If
> you did, how did you proceed with the backport?=C2=A0 For v5.15-rt, there=
 is the
> following patch that touches the same code, so I wanted to be careful:
> 0009-printk-call-boot_delay_msec-in-printk_delay.patch - [PATCH 009/171]
> printk: call boot_delay_msec() in printk_delay()
>=20
> I wanted to run this buy you all prior to backporting, and ensure I follow
> what all other stable versions plan on doing.

I dropped that patch while doing v5.19-rc1-rt1. It was merged as
   1f47e8af45fdd ("printk: call boot_delay_msec() in printk_delay()")

meaning Clark shouldn't have any problems related to this.

Would looking at later RT kernel help? As of v6.6-rc1-rt1 the printk
code is mostly the same.

> Thanks,
>=20
> Joe

Sebastian
