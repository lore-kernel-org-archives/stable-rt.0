Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D520EB
	for <stable-rt@vger.kernel.org>; Mon, 24 Mar 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805160; cv=none; b=UsusfGOMiqiiLQK33TYPPq7LHmaseQEt6yFefp7BZJO6bRBKxGGHuGXq9KdPhzFf7d+cNzTwY1pyUeMxHK68YOCkwqNy6cnf9REycoVqRvLjdfqfV4awkSb8qUfHS31VgZI5BZ5ZSlAr+aTGakLhksAjcGdipdtiet9J2cPa1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805160; c=relaxed/simple;
	bh=VhHCaC5u6xgHAPGtbopveXszIe8PBbWTcQrFCq1Cr3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IA9ActxAnuMGrCr1ljNu4NzErXs3FTBFRCkjAJUROWNpMWegoCOEAywZOvXBcNXP5yYU3IpBhRs32knKiuuGzcWs4BPqshjc3lXdcrJt24U91dqrkAmCjT/y6IEUi3/Yw1muzv/x7em6VRHOy6ZvA4Z4uWvyc0P31V7sbxUuFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zbqbh0ZC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x97pQ9oM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zbqbh0ZC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x97pQ9oM"
Date: Mon, 24 Mar 2025 09:32:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742805156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N1lYp2kYwI1KVKu0LIAp3dyjoJnGW6qUUgkvlrmpr9U=;
	b=Zbqbh0ZCQuGQIlga9wIL6Khz1ekL86kTHWoNeK0bYq1NJq3pSHyEhRgf6BHHBSGkvlhvAV
	SmPz5+JgC+d3aAjmAfuDaoEiAQToO8PWSXS86cGAPROJaKPktiShUTk2tbQcEnUEtevk5G
	a4VziWdnH+ugmQfSdRo9i6eRDR5IKrTrl+25qs11o2r0kWR/8O9ANYqkFKdJzomQ0bV7eb
	uJLktqP5dt/bL4jmUcupVK0aYIBOs+OzBH5B2v6If6ajVmPu9EwTdDJNtfLTXKf7lOlnC/
	bO6AxMzq7alhUXFwvU9VtMrwNOQiOi9NUefx0mXLxBBFQmC2R4+v5iQMId5dCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742805156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N1lYp2kYwI1KVKu0LIAp3dyjoJnGW6qUUgkvlrmpr9U=;
	b=x97pQ9oM2fy1VvBryQg5PNcGgGuyXhiNNIiGVi3vuPkZ0px5M1M3qDo6kjDB1f0BKuXkXV
	wciviS+SX0/WqXDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: stable-rt <stable-rt@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v5.10-rt] rt: fix build issue in be2net
Message-ID: <20250324083235.BjR4MB0k@linutronix.de>
References: <Z9yuIpi8zjrTCkoB@uudg.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z9yuIpi8zjrTCkoB@uudg.org>

On 2025-03-20 21:09:06 [-0300], Luis Claudio R. Goncalves wrote:
> Sebastian, Steven, All,
> 
> Should I apply this solution in a RT update right after I release
> v5.10.235-rt128 or should I backport the definition of rt locking
> primitives from a newer PREEMPT_RT patch (say v5.15-rt or v6.1-rt)?

The statement ("return spin_unlock.*") is not very common, there is just
one "user" even in later kernels.

Backporting the definition (instead of changing the driver) would be
more consistent with later trees. I'm somewhere between the definition
backport and what is less work.

The v5.4 should be also affected, right?

Sebastian
