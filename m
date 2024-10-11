Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1893EBE
	for <stable-rt@vger.kernel.org>; Fri, 11 Oct 2024 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728638628; cv=none; b=QOeJYPDakkKJLicrvGxNlvOUr0jfyceQwI+arFykGnIRp3YTuYRLYoh4BZY/z7tsFbZsvQXgWWePdf3OlXmMmCzHKcLhyaST0PqZu8CFb3stvmfeyzqkdGpLjODNBR3NBauBoBuvYs5y0Uiy+c6hsc6aUner6Jsi0/HFgx1zHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728638628; c=relaxed/simple;
	bh=RZOhCqtQGUrND5PdW8SuF8LpV5qTKpOyhothPaTQL/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WF8GBoNSD/sQ7FLrYU4tJPgaP/rlMVOg+OR0ER+NFjwvMaQpjTazYXR6Kvp3ZNNFuGdamCGkJzqUbqgZAVjftEyXUIXr8PFAyMNz5ppAB0J0gdM+4TF68kkmRmla9aoM8f2Qm86PuMQKgBJenhw/QVUD0B9EM6SDlGDxY6SSLuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yF4rXgUh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6lUMUNYC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yF4rXgUh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6lUMUNYC"
Date: Fri, 11 Oct 2024 11:23:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728638625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZOhCqtQGUrND5PdW8SuF8LpV5qTKpOyhothPaTQL/M=;
	b=yF4rXgUh+Kc70w74SA4h3S6GzmFxR4INwwTHCknzlGGp5mqTWryenjTD+A4lva0oxAgZtL
	eEsRR1avLPvIbb8wPDEa1zlAMsPSsm3xMpFzaGlx9GHRbraZI6Zde2LBo42aEztehQj5z0
	bwESYk4ILZiuIKesb5IenL3pGMlefOSFe8fyYWwXpzKmluHT4rUFR57A/5A4fIbrnYj2ls
	H5aWBjmTOTF9z7YPPs5Ve6VYT1zZmMQluTv3nzwX30peF/881rS4umJ4EArkzgM5Bqkhua
	uo2Oj6wc0DBsWMaLFzuN5t+fSjB+fL17DWBt3ZSBmozPDmEj8lQv8lpAcuNAAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728638625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZOhCqtQGUrND5PdW8SuF8LpV5qTKpOyhothPaTQL/M=;
	b=6lUMUNYCgfw0TOATBnHNTBlfzOTWaCwdW+K/ODH/4wFv4zKSqz6DRYDLqENq0SWYBPSDaK
	fvboeKAmz9mUXVCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: stable-rt@vger.kernel.org
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@debian.org>
Subject: Re: Backports for 8b4865cd9046 ("cpufreq: intel_pstate: Make
 hwp_notify_lock a raw spinlock")
Message-ID: <20241011092344.WmduKcxt@linutronix.de>
References: <20241006205106.385009-4-ukleinek@debian.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241006205106.385009-4-ukleinek@debian.org>

+forwarding to the rt-stable list

On 2024-10-06 22:51:05 [+0200], Uwe Kleine-K=C3=B6nig wrote:
> commit 8b4865cd904650cbed7f2407e653934c621b8127 is marked for backport
> to stable. The patch does apply cleanly to 6.11.y, but not to earlier
> versions. In reply to this mail I send a backport for 6.10.y and 6.6.y.
> The 6.6.y patch also applies to 6.1.y. I didn't test earlier stable
> branches.

I've been looking at this and this go via the stable-rt queue, too. This
was applied to v6.6 already. In will probably appear in v6.1 but the
cycle did not start yet, I have no idea about earlier trees.

Fee free to wait a bit before looking into backporting ;)

> Best regards
> Uwe

Sebastian
