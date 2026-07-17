Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA3B274B3B
	for <stable-rt@vger.kernel.org>; Fri, 17 Jul 2026 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297021; cv=none; b=gKuaDdiBNtNi/WSGb+E/huMaK4bo1mWOpzlstVua3FDHjduK6m0ODoVa1/CQdJiYcYXc6vzhcOEGjORDuRxH0lEjGicMcblZufdXlRK8P+3rCpw5QcwVLmfc2VJsI3JMFQERjNnuY6/KbXMmsac8kudUUfYVdwkej+E9yeJm5NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297021; c=relaxed/simple;
	bh=XSnTRhepmJ2P84+fOLL/ULRvZWSfMeym6yLrdwNYQYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amwFcXYsbMmu18NAWdpbReIn6DwyjLznt+7ENLAgCYUAPtFD6fZcudS2C99Ya1yvO1dr+SnS3wvvCD13JUAbOZQdkw6Oms4k7KNXvmsW/dTu684RQZxeT0Ie+2m//JMHhCxU494HwY5P3li3EtrutkyfsLXPWOAXYzSEFjeXAhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RSxDbeYI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Hezjdiuw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RSxDbeYI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Hezjdiuw"
Date: Fri, 17 Jul 2026 16:03:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784297018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DP2iy+ioqHgCIiplFvIzL+zbcFThYsfYVuaPlRYUhE0=;
	b=RSxDbeYIJ+NacPdMnNiZPtOhklqTZPEzTX45+YG6IQ3Ui3h8jeJPZvFmB5511aYZP5cGai
	a1xmMHJ0PaG6Fkn2guVKsI3LWPPAHFd//FKRHAY98c5NhZBcedX59yo6DKL9hRrLyCj3OX
	33l4Ow4mtD8jJLN9K234rzBiSt1gcKfqqemGKvlAQa1cBiUWsBoc7CsKn4GsS29XLjANRj
	LFLDPDhQQL9C/Kh8eTnuaUBw0KBio6Udicw++YH/sU4nfuSSVbDll3JS+AtL1slBoouDN0
	cjyOJD/WIzRElAKTpr7E6TuUBDaUg2319xBkewcPlnR4Ar8Q3Lk3FqWrZWtCXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784297018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DP2iy+ioqHgCIiplFvIzL+zbcFThYsfYVuaPlRYUhE0=;
	b=HezjdiuwRN1KXos2T+401yi5jeHUtVijJoo0Pq8R8Bn+BTeftJ0d3kCFAOi1Cfybj+kZvL
	ldBPuFVoWiWJSjCQ==
From: "bigeasy@linutronix.de" <bigeasy@linutronix.de>
To: Daniel Wagner <wagi@monom.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, pavel@nabladev.com,
	nobuhiro.iwamatsu.x90@mail.toshiba, stable-rt@vger.kernel.org,
	cip-dev@lists.cip-project.org
Subject: Re: v6.12-rt arm updates
Message-ID: <20260717140336.krBy6oQT@linutronix.de>
References: <8a0f6ad1-0df7-4707-bcc4-83603cada945@monom.org>
 <20260717134624._f9g97lg@linutronix.de>
 <141ef3cb-361d-432c-a7ba-af010406283c@monom.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <141ef3cb-361d-432c-a7ba-af010406283c@monom.org>

On 2026-07-17 13:54:58 [+0000], Daniel Wagner wrote:
> >> # Commits in upstream but not in v6.12-stable
> >> ARM__enable_irq_in_translation_section_permission_fault_handlers.patch
> >> #  59e4f3b45b96 ("ARM: ensure interrupts are enabled in __do_user_fault()")
> 
> I've replaced the downstream patch with the commit mentioned...
> > You should be able to drop a few of those and replace them with what I
> > have in v6.18
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?h=linux-6.18.y-rt-patches&id=73c8e8d7a75fcc8b9026385e64990f3d5ec8a40d	
> 
> ... which is what you have done here as well. The main difference is 
> that v6.12-stable ships 'ARM: 9459/1: Disable jump-label on PREEMPT_RT'

It does? Not as of v6.12.95.

> The resulting v6.12-rt queue is
> 
> 0001-ARM-ensure-interrupts-are-enabled-in-__do_user_fault.patch

This looks like 59e4f3b45b96a ("ARM: ensure interrupts are enabled in __do_user_fault()")

Good.

> 0001-ARM-vfp-Provide-vfp_state_hold-for-VFP-locking.patch
> 0002-ARM-vfp-Use-vfp_state_hold-in-vfp_sync_hwstate.patch
> 0003-ARM-vfp-Use-vfp_state_hold-in-vfp_support_entry.patch
> 0004-ARM-vfp-Move-sending-signals-outside-of-vfp_state_ho.patch
> ARM__Allow_to_enable_RT.patch

Sebastian
