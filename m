Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A39C4167D
	for <stable-rt@archiver.kernel.org>; Sat, 11 Nov 2023 09:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjKKJyN (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Sat, 11 Nov 2023 04:54:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjKKJyM (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Sat, 11 Nov 2023 04:54:12 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E3E3AAE;
        Sat, 11 Nov 2023 01:54:08 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AB0871C0050; Sat, 11 Nov 2023 10:54:05 +0100 (CET)
Date:   Sat, 11 Nov 2023 10:54:05 +0100
From:   Pavel Machek <pavel@denx.de>
To:     "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-rt-users <linux-rt-users@vger.kernel.org>,
        stable-rt <stable-rt@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Carsten Emde <C.Emde@osadl.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Daniel Wagner <daniel.wagner@suse.com>,
        Tom Zanussi <tom.zanussi@linux.intel.com>,
        Clark Williams <williams@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Jeff Brady <jeffreyjbrady@gmail.com>
Subject: Re: [ANNOUNCE] 5.10.199-rt97
Message-ID: <ZU9PPZS/NEL5Pksn@duo.ucw.cz>
References: <169966380957.83297.12867433063716152688@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="MidtYy9X1jc5TGgq"
Content-Disposition: inline
In-Reply-To: <169966380957.83297.12867433063716152688@localhost.localdomain>
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org


--MidtYy9X1jc5TGgq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I'm pleased to announce the 5.10.199-rt97 stable release.
>=20
> This release is an update to the new stable 5.10.199 version and no
> RT-specific changes were made, with the exception of a fix to a build
> failure due to upstream changes affecting only the PREEMPT_RT code.

Thanks for the release. Do you plan 5.10.200-based one by chance? .199
is buggy on hardware we care about, so it would make our job a bit
easier.

Thanks and best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--MidtYy9X1jc5TGgq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZU9PPQAKCRAw5/Bqldv6
8nOvAJ0cFrr8oOk5unevdkXrhbKV4QiPUwCgoPmNCnTITj4uFJV+5B1boYcl8xw=
=tAct
-----END PGP SIGNATURE-----

--MidtYy9X1jc5TGgq--
