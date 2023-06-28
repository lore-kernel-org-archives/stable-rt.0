Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665E6EB64DA
	for <stable-rt@archiver.kernel.org>; Wed, 28 Jun 2023 09:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbjF1JD3 (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Wed, 28 Jun 2023 05:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbjF1IY6 (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Wed, 28 Jun 2023 04:24:58 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EAE3C3B
        for <stable-rt@vger.kernel.org>; Wed, 28 Jun 2023 01:14:37 -0700 (PDT)
Date:   Wed, 28 Jun 2023 08:56:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1687935384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Do6Dg2aaoVJACJNCAF8OwFXR1FEgN5mHPX2Bini7KNc=;
        b=l6EwqinwP6517ACDTdOZeVk9QR4Fg0no4c8y5k+hoIf9wdTwMXTNUpYkI5/JHI/FKfciZH
        QJApB6qjEmCnLSNpozUJTCydueq5jcMPrz4l+6HXsixTaASe7+umRL3epzdW7tkk8eUgax
        vVeW9eMU6XSbOwPwvk1KQur4b1M4xj7J6wN7cblklKM9NTKmHNunaKH7ybCaGuQVY7iBp+
        aGTwbT+x22v2sHec4YoTxzNxsR8nh3Qzmp6ADRWO5BCWlDhREdILgKIhGhKUjeDR8gehVv
        SKHYjnvxsO1N2xcBCP+Ah7eOCer9ocI5S6MF6sTmiFgy0z/8YiEueLdDYoaNIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1687935384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Do6Dg2aaoVJACJNCAF8OwFXR1FEgN5mHPX2Bini7KNc=;
        b=qhIhBiIBBo4eYBIOiZsBl5LdeBqjG7GLRy2GYxaERKST0LKRJ1F7ILFOckjD1DoLWrji/6
        Yvd1+Tqe1zfo0tAA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Joseph Salisbury <joseph.salisbury@canonical.com>
Cc:     stable-rt@vger.kernel.org
Subject: Re: Stable backports
Message-ID: <20230628065623.GF8Wl6qw@linutronix.de>
References: <20230620150329.6r4xxvHu@linutronix.de>
 <8436cefa-9eea-7b1e-ff3f-63223f1f1ddf@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8436cefa-9eea-7b1e-ff3f-63223f1f1ddf@canonical.com>
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On 2023-06-27 15:14:35 [-0400], Joseph Salisbury wrote:
> Hi Sebastian,
Hi Joseph,

> Thanks for the heads up on these commits!
>=20
> It appears v5.15 will need these commits:
>=20
> d15121be7485 ("revert: "softirq: Let ksoftirqd do its job"")
> 2951580ba6ad ("tracing/timer: Add missing hrtimer modes to
> decode_hrtimer_mode().")
> 7eb16f23b9a41 ("io-mapping: don't disable preempt on RT in
> io_mapping_map_atomic_wc().")
> 286deb7ec03d9 ("locking/rwbase: Mitigate indefinite writer starvation")
>=20
> The following commit was already added to v5.15 in v5.15.109:
>=20
> c15737965434 (rtmutex: Add acquire semantics for rtmutex lock acquisition
> slow path)
>=20
>=20
> The latest two commits are still in linux-next and have not landed in
> mainline as of yet (d15121be7485 and 2951580ba6ad).=C2=A0 Should I wait t=
o add
> them to the v5.15-rt stable tree and see if Greg adds them to his trees
> first?

They should end up mainline during this merge window. You can wait until
-rc1/-rc2 if you want. If they end-up in the stable-tree, they should
easily vanish from your RT-queue.
Either way, please wait until until they show up in v6.1-RT so patches
flow from the youngest kernel to the oldest.

> Thanks,
>=20
> Joe

Sebastian
