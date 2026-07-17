Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F1429CF1
	for <stable-rt@vger.kernel.org>; Fri, 17 Jul 2026 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298134; cv=none; b=kNhZPCgZY/OimrwNGhtKx1OblBBjIHcN1Nz5RmxbNd1+4nxE0IylR6CvBkg7L0xo10HutBf956ZtulmJljbaCHND0bBpxFnTL+kyVHE8GwevipcL+RmltwyW0Ie3aluktRGcFBGsJNL9hnG4E5gNhyhIkCj341viYF7zcgOUO2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298134; c=relaxed/simple;
	bh=jb7dCv80urt/y8dpp8Xxa2kwrP1gh/g9rVtXnefsETQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omIDPZXGVtROYeTQtXGXi00Kn3AkXDUjcINJcesqy9ZdFb9rVqV75szHk/XjePId+Mb9INuD6ORXomr9huOVFOIvLRGUbElpy5xVE0/olbWI0d6ELzkteoIIoINn0be/3zRn8JfYe8wqa4FZDYrA1eRlLd0asgPLiRhRLiwFdZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0r8TN4DZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x1pxkntP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0r8TN4DZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x1pxkntP"
Date: Fri, 17 Jul 2026 16:22:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784298131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e83lJnaZX4/+AdvTSdSIoeXVY9ifGj/RLgipoOnIiWI=;
	b=0r8TN4DZPqnJsn9AB1Qg27Gu6MPqbi53in9Vk3jKV+YhCvP+O7hkFdVMcgMmRKTCD4HbBp
	z9+/riggw221pccNt/pdkU8TdpG0DojprpN0ogBOBxqy7iap+Z6dS4LXKu8Uh3kBtwBFl+
	8lwspqdpCn2P8PdcaWeQtQoltY+qg980tnsdjB2eqysrF06dc+DyA5RGBNtzDUj0EeHzv/
	dgo1DwQDJ+q6VDsZ8p3lY9C8NVFPHrwW8Nns06OBHi2CZGKEx0BNwP3vnYsziSng1fbe1j
	oZaYWyvxqYWMO2iU3mlBfvizzWhi3pCIa8wy39qJgA/qL/ktNjXMjsDzBujFaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784298131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e83lJnaZX4/+AdvTSdSIoeXVY9ifGj/RLgipoOnIiWI=;
	b=x1pxkntPasYwRPe4RuNArDcm4dvlJvL/ulbzK9tj5+gju0WjfCqTh6b0THqf87OQr5jbna
	Xh5NiKYr0/h9tBCQ==
From: "bigeasy@linutronix.de" <bigeasy@linutronix.de>
To: Daniel Wagner <wagi@monom.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, pavel@nabladev.com,
	nobuhiro.iwamatsu.x90@mail.toshiba, stable-rt@vger.kernel.org,
	cip-dev@lists.cip-project.org
Subject: Re: v6.12-rt arm updates
Message-ID: <20260717142210._ukh1yBD@linutronix.de>
References: <8a0f6ad1-0df7-4707-bcc4-83603cada945@monom.org>
 <20260717134624._f9g97lg@linutronix.de>
 <141ef3cb-361d-432c-a7ba-af010406283c@monom.org>
 <20260717140336.krBy6oQT@linutronix.de>
 <3706c5f1-53af-460e-9409-fa1b78706645@monom.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3706c5f1-53af-460e-9409-fa1b78706645@monom.org>

On 2026-07-17 14:17:54 [+0000], Daniel Wagner wrote:
> So here my updated queue (the comment points to the upstream
> version of the patch):

This looks okay. Your delta should be
	https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/diff/?h=linux-6.18.y-rt&id=868deefc37dfbdfe93d760155e0c84f5f3363cc2&id2=90a16cd5d693a75843b766d0efa17f1bc0149931

Sebastian
