Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B0A26FA4B
	for <stable-rt@vger.kernel.org>; Fri, 17 Jul 2026 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295989; cv=none; b=gofSPcevOE0ZcigYTpyRQlqDo4qyXc3WYdVmDJ5+OqXvWYU3FcSZnh3RXxduD8UO+qxTxqVxxQ3gagAceQWyBW9cm2LlqQJPVt+9lltdYWwxfLl6iyJkkTKrvTcIzmVT9acQtoVB07GYBMKefWJMGY5JP6pE5JNkpFOPkqcy3d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295989; c=relaxed/simple;
	bh=fflI/tf4Wg7BOaFbCl+214MoPj4kN4M+k/cmFbS/lA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8gX91UsNUTP4hdxISUC9/fhdSgB3+xbZ10lUOE8eVEsCu4NHF8ustyWjgMpD3+iNQd7X31Ha0LQmqkiTqP4KfKGWRQkQh8bf9Ub05rE8XY3VGaQaQ0vsCzVG5XeX2O0y2wT8T9+sxb4OKKuCmuwRB/DsG+oYHO3/AETXJ5UoHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wUrPlUje; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8teemIv7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wUrPlUje";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8teemIv7"
Date: Fri, 17 Jul 2026 15:46:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784295985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6yiIX/RmGHsSjDTg3/B0hv5zvL90f0Is3yNRDum9Bqo=;
	b=wUrPlUjemnEbnY782WXHevmp5Tg8AXyih11A3sW5MRthpr0HfTlaCMJJQS/ghpr9bnovuf
	MoRRVO+lJzhm8Ltst2mW0Vc3BCS3z7+in74YCw71NfNK4PzcdCEM9e77V/f8wiTBbfjfW+
	9iCp15Qw/42Hpo3AXmPc/xXML7AbFNKzchMNeMPeH2kB8WA6YLBYTItoPJGierayxfzPRU
	FCv70+2N2B0j92fOREV4G6Ah+psCoQAi9Rk55ojBPE//rZBAyrkTcCabM2ErKwx3A7oH5h
	B9upVmyVIvOa/lwq0O4SXSpH/B/Yh+QBLf48FkmhIEsjhHg2FDQOM43iAU5Jqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784295985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6yiIX/RmGHsSjDTg3/B0hv5zvL90f0Is3yNRDum9Bqo=;
	b=8teemIv7Nx72b8ZPvGwMbngpyqek5dmFITasJYNqZp8/fnVEBku+mfOApLpgyZIRoXS9Ce
	B3oQGHP4GmcFu3CA==
From: "bigeasy@linutronix.de" <bigeasy@linutronix.de>
To: Daniel Wagner <wagi@monom.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, pavel@nabladev.com,
	nobuhiro.iwamatsu.x90@mail.toshiba, stable-rt@vger.kernel.org,
	cip-dev@lists.cip-project.org
Subject: Re: v6.12-rt arm updates
Message-ID: <20260717134624._f9g97lg@linutronix.de>
References: <8a0f6ad1-0df7-4707-bcc4-83603cada945@monom.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a0f6ad1-0df7-4707-bcc4-83603cada945@monom.org>

On 2026-07-17 13:30:15 [+0000], Daniel Wagner wrote:
> Hi,
Hi,

> I am about to update v6.12-rt and the arm section needs some updates.
> Here is what I am going to do. Please let me know if there is something
> wrong.

not sure how to read this below, I try my best.

> Thanks,
> Daniel
> 
> ###########################################################################
> # ARM
> ###########################################################################
> # https://lore.kernel.org/all/cover.1777964226.git.jan.kiszka@siemens.com/
> 
> # v6.12-stable material relevant for RT but no patches to drop from
> # rt queue:
> # 47c5d569d39d ("ARM: group is_permission_fault() with 
> is_translation_fault()")
> # d5e8be7bea8d ("ARM: allow __do_kernel_fault() to report execution of 
> memory faults")
> # 25ae6a5c473b ("ARM: fix hash_name() fault")
> # fed889edca79 ("ARM: fix branch predictor hardening")

Those few should have entered via -stable.

> # landed in v6.12-stable, thus drop those
> # (commit ids from v6.12-stable):
> # 0001-arm-Disable-jump-label-on-PREEMPT_RT.patch
> # 256d97d3587b ("ARM: 9459/1: Disable jump-label on PREEMPT_RT")
> 
> # arm-Disable-FAST_GUP-on-PREEMPT_RT-if-HIGHPTE-is-als.patch
> # 1b645cd729ef ("ARM: 9461/1: Disable HIGHPTE on PREEMPT_RT kernels")
> 
> # Commits in upstream but not in v6.12-stable
> ARM__enable_irq_in_translation_section_permission_fault_handlers.patch
> #  59e4f3b45b96 ("ARM: ensure interrupts are enabled in __do_user_fault()")

You should be able to drop a few of those and replace them with what I
have in v6.18
	https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?h=linux-6.18.y-rt-patches&id=73c8e8d7a75fcc8b9026385e64990f3d5ec8a40d

> 0001-ARM-vfp-Provide-vfp_state_hold-for-VFP-locking.patch
> 0002-ARM-vfp-Use-vfp_state_hold-in-vfp_sync_hwstate.patch
> 0003-ARM-vfp-Use-vfp_state_hold-in-vfp_support_entry.patch
> 0004-ARM-vfp-Move-sending-signals-outside-of-vfp_state_ho.patch
> #  f26bdbe1fa9f ("ARM: 9423/1: vfp: Provide vfp_state_hold() for VFP 
> locking.")
>    #  b54cdbad4a39 ("ARM: 9424/1: vfp: Use vfp_state_hold() in 
> vfp_sync_hwstate().")
> #  27035c23bad5 ("ARM: 9425/1: vfp: Use vfp_state_hold() in 
> vfp_support_entry().")
> #  c0b5195bad63 ("ARM: 9426/1: vfp: Move sending signals outside of 
> vfp_state_hold()ed section.")

And this needs to stay

> ARM__Allow_to_enable_RT.patch
> #  c6e61c06d606 ("ARM: 9463/1: Allow to enable RT")
> 

Sebastian
