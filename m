Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84A932720D
	for <stable-rt@vger.kernel.org>; Tue, 21 Jul 2026 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639204; cv=none; b=K1Y2Bv48qf/fuYDWeB3l0OqIIj+lpIQcHFjjt9R7pr0TomvvM6xQ6UpH11A9sLQHz98HI3lwV4Ju9R5YdvtqGZlmvcNzkCnthKVCCsA3ii5jqLTlVd/GFDn5F/BoP4YUdIjti02tOwa2zKYl1ojgp/Zi4av6PiSPRCm0xnCQghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639204; c=relaxed/simple;
	bh=mB1mAIm4edxNaapoNFJRQy9MnBsm4x6pfHwP23oYDuo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNjH46gnDfRJCTwMNM0oiLkP7TnbDvGv8DraJ5lUZNsk/CA/lPv8u/0nArzygAV5qQDWoS96A6di1RTvkPyidsaI2mpn6wZ3X3OaNsUZFKaXskPdTiW4MhHtDrCb27TlmER4kLrIZZtAZZbZd5MCBObhB2cwuJoQOiAFdqg5vPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=monom.org; spf=pass smtp.mailfrom=monom.org; dkim=pass (2048-bit key) header.d=monom.org header.i=@monom.org header.b=e2dJ+yjU; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=monom.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monom.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monom.org header.i=@monom.org header.b="e2dJ+yjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monom.org;
	s=protonmail; t=1784639192; x=1784898392;
	bh=E5A5b0327Pu+h0l7FQGtboYgL7vm9ILo4n76903TrDg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=e2dJ+yjUBhhaRIR/z7KNBstAYou9qsAzHZv9N5+CXgkxlnpxA+6sqeQUK4Fel1tDW
	 gNnse513fi90ddrjIRiBads0Cy72wNsMnsGLQpMwZQGTiEEOcEsLgiMAiqZMw3WO18
	 6A5NtebyGcOpjOIzioOI2fLWS4YSnVCj7DmkTaNph0bGMedD043OlDoWxnWNAIuMbf
	 C8AqBeIUydzs2RztZTAz1+JjyrBSOcyL5g7NQQDsJkIR81vn8qY5A/00+eqYgXbg9o
	 5/AEoh/9eSOgrMvoMz3BeDRLNNDywmp7puUCcAM3BS73f5z/opQY+8sfQNHKM6U8xb
	 G4XJ7dFaLzihg==
Date: Tue, 21 Jul 2026 13:06:24 +0000
To: "bigeasy@linutronix.de" <bigeasy@linutronix.de>
From: Daniel Wagner <wagi@monom.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, pavel@nabladev.com, nobuhiro.iwamatsu.x90@mail.toshiba, stable-rt@vger.kernel.org, cip-dev@lists.cip-project.org
Subject: Re: v6.12-rt arm updates
Message-ID: <72dcc63c-9786-488e-a840-f383533f2fbc@monom.org>
In-Reply-To: <20260717142210._ukh1yBD@linutronix.de>
References: <8a0f6ad1-0df7-4707-bcc4-83603cada945@monom.org> <20260717134624._f9g97lg@linutronix.de> <141ef3cb-361d-432c-a7ba-af010406283c@monom.org> <20260717140336.krBy6oQT@linutronix.de> <3706c5f1-53af-460e-9409-fa1b78706645@monom.org> <20260717142210._ukh1yBD@linutronix.de>
Feedback-ID: 209527651:user:proton
X-Pm-Message-ID: fbc4539bb5c48b7fbe5d12fc288f30e1c04a6985
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/17/26 4:22 PM, bigeasy@linutronix.de wrote:
> On 2026-07-17 14:17:54 [+0000], Daniel Wagner wrote:
>> So here my updated queue (the comment points to the upstream
>> version of the patch):
>=20
> This looks okay. Your delta should be
> =09https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/=
diff/?h=3Dlinux-6.18.y-rt&id=3D868deefc37dfbdfe93d760155e0c84f5f3363cc2&id2=
=3D90a16cd5d693a75843b766d0efa17f1bc0149931
My diff looks a bit different, due to the backport of a bunch of arm=20
cleanup patches. I've pushed the result to

   v6.12-rt-next
   v6.12-rt-patches-next

It all runs fine in my test setup. Any objections to release this?

