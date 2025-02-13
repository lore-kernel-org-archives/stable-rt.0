Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F272063DA
	for <stable-rt@vger.kernel.org>; Thu, 13 Feb 2025 08:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739436781; cv=none; b=LM3h02dciP723ULR1fDcvhZQAG5XWOpJ0nVsozkR61C3r4VpuDec30DYinFr81z09vMPHmwTYGsWZFaR4xUkMFupT9j9TaczBJ6BXUW/wrLVcYwcaJUjh+FJahCl3YMXsH5rRhnoTtzrneiAGSAlyA9/dlC8/YETM2t2A9mDqgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739436781; c=relaxed/simple;
	bh=WKFQg0tUpD0V4K3NRekMqZhxeN3j1nUw2yKI1wbW/b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xrpu4f1wLEA3lWxhctTT4aqAm8KCCYLA0+H54R1c2tDzx22CXXpTbm16IJvrctnnXxh+CQZnrwGiKEXEjPUUCcTpQJL4+MKjWRokfJdHR9TRLAYqN7gLx9oX5IPoEE8BxgpOhXRv1PrgXRqjDVuIEpackDrPx+tKJ1E+9riN7lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nF80/H3e; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5+DfNGw9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nF80/H3e";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5+DfNGw9"
Date: Thu, 13 Feb 2025 09:52:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739436777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jj7WmyJALGlmD3SK+Lf26YBTxb3qNskOoxQ9euTth9w=;
	b=nF80/H3eTjxlDF+kwC24OsErHpxo6MLY5dVj8+HnI7D+j334Wki0GCqPG0qAnwIgwMT1CV
	w5WPPpsZqqWci65SM+hHezXYEaEXlqcJ4geuHHe7xN51AWoEe1GpOVL8Z0u4gCtsnZZvhM
	vZdx+VlR2MKARL6XhmJCjTgFQi3F5+ZuY4HzxIyQAiAZZ3HPziaH0OjqVXuXPVgNMUdmHk
	sy9QZngWbt2C0bgccYjkHaCSH2tXQENphfyvLO3b1UH5YF899GUsZNHl9jUivCxwBylGtQ
	vFfrlt9xM0mAIccJVyTyBlCGl3lOeBLmK6vDBZuhj3gdoeDvfO8l2mpKYlpHTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739436777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jj7WmyJALGlmD3SK+Lf26YBTxb3qNskOoxQ9euTth9w=;
	b=5+DfNGw9kopsvR/OGQwCZoDcNHE8k5d4/0dyHAsxQloPZlzpcbdjrA16m0lHebiyfqVYgx
	eObSeqZh+HVdvjBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Gustavo Padovan <gus@collabora.com>
Cc: kernelci <kernelci@lists.linux.dev>,
	linux-rt-devel <linux-rt-devel@lists.linux.dev>,
	stable-rt <stable-rt@vger.kernel.org>,
	Daniel Wagner <wagi@monom.org>
Subject: Re: PREEMPT_RT testing on kernelci
Message-ID: <20250213085256.nhWptGL3@linutronix.de>
References: <20250211090511.xeFJVnH_@linutronix.de>
 <194f4c989de.bdd18d3279996.2067896388251039576@collabora.com>
 <20250211152018.sK91dh93@linutronix.de>
 <194f5b4b029.e5ee4014194612.536900249866001318@collabora.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <194f5b4b029.e5ee4014194612.536900249866001318@collabora.com>

On 2025-02-11 12:50:47 [-0300], Gustavo Padovan wrote:
> Hi Sebastian,
Hi Gustavo,

> That is one the current limitations in the dashboard. The CI systems are not sending
> a clear signal yet that they completed all tests they wanted to run. They just submit
> test result individually as they get finished. 
> 
> Imo, it is a priority to fix this as it is second time this week I get this feedback.

Ah okay. No need to rush. If you have something to look at, let me know
and I will. Other than that I will lean back and wait for the bot to
complain ;)

Thank you.

> Best,
> 
> - Gus

Sebastian
