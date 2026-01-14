Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A739C655
	for <stable-rt@vger.kernel.org>; Wed, 14 Jan 2026 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406654; cv=none; b=OF/RxuhAI4n4opVfUa5MhzmM4SJlEarIIH1gNtDTAf1nyqKMw/EGn1KYpuGdJiIpqVcmd2aMVv/H5vATfDGdaViS/FotdqeJCGawSkjB1rUpoBNlT1MY+gDCROJR/uVxORV/jSi5cP3UvoHgP/C1tnljsnFGnvX8DA89m6wHKFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406654; c=relaxed/simple;
	bh=aP3Szqwn1vr3oSalYfK+2Jt/iPVG5nGB0Ttpluush/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtM7dvWPJlx5GrQGZrZQ21VeRvr4h1xnmHRwmoPD/Xfj3Dkk/AK5eKoQzvrjjG9/MHZXyyp0ryvjvaN4XqQjE0xuns97cBJFjzPckAJv1+JN6eUJ1gymnFGxL9/StJ6lAqNXZrwvf0eRF8lrtpilU0IIrP9dgQhDwDonuMXC1QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aAySgQsw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YAbVtl9/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aAySgQsw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YAbVtl9/"
Date: Wed, 14 Jan 2026 17:04:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768406651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ia2Oz9yUmDn2Q1mN7iWk+poIYKTpG6Iv7FVJrkPEUs=;
	b=aAySgQswrIj1FPzyfxcnUoyqrvVg8PL9P8Xm6pOY50964yz3ZBGra0YkE6lQU7fz2+5GuX
	Am7syRUNaT7to2rLnBZvDMkTOKWNZCgBwY9qW4I4EulY8q0YoSgU9ahOIieTOtyafR3616
	KzkB3+y6jTCY4cS/dUahqbRzYFqKn3s0a6SKo5Mg7ZRWl1/PMZwD4oQuPgRlOe3IRh6i8G
	byaRDvf1OYBqrH7lm6KGJqkthjo2oWgBfs6QdrKKZaeVAtm34A2Y0l3KA/zDKbuJ+7wZRU
	sGphuzy9zfXDRF1hPNvcZdpxECDZfn5W2kyp9ePbh2A+wMr/HQPeTaDXsJ0oWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768406651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ia2Oz9yUmDn2Q1mN7iWk+poIYKTpG6Iv7FVJrkPEUs=;
	b=YAbVtl9/ozDLk2OGbgbZ6MYSgnlVLOhFA8I6AtZudCEqPKdD9wgjM0zwtNcvqLiwCSHEoM
	ZRJRqq37KfJqUQCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: stable-rt@vger.kernel.org
Subject: Re: [PATCH net v4] ipv6: fix a BUG in rt6_get_pcpu_route() under
 PREEMPT_RT
Message-ID: <20260114160409.wRytcnQC@linutronix.de>
References: <20251223051413.124687-1-jiayuan.chen@linux.dev>
 <20260112154947.5C8DFdQb@linutronix.de>
 <aWaetNiLITXn0UrV@redhat.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aWaetNiLITXn0UrV@redhat.com>

On 2026-01-13 16:36:20 [-0300], Luis Claudio R. Goncalves wrote:
> Hi Sebastian!
Hi,

> > This is upstream as commit
> >    1adaea51c61b5 ("ipv6: fix a BUG in rt6_get_pcpu_route() under PREEMPT_RT")
> > 
> > and should be backported down to v6.12 due to the fixes tag. RT wise it
> > should be broken since its introduction so if the stable team could take
> > it down to v5.10-rt, that would be nice.
> 
> Just to clarify, do you mean us, the stable RT maintainers, or Greg-KH
> and his merry band?

The RT maintainers. I don't think Greg will apply to kernels prio the
fixes commit also RT is not available in upstream so it makes no
difference. You could wait a month and see ;)
This was there since its introduction in 4.x and never triggered.

> Best,
> Luis

Sebastian
