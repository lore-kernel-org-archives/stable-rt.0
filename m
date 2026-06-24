Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE6735E1A1
	for <stable-rt@vger.kernel.org>; Wed, 24 Jun 2026 06:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782283788; cv=none; b=kw8MUCHrFi/5Fb+mUAwhXlpvhBKik/TLJQzWbXobNKZj7PHAxxO9mkxqHbo0Co+oxgkdEDp6zP9SJQZhSPurZutMhdS8QcIUBr4gddEjWrpGbBMT6KGH7YbLMeTfolaj8aCZkk9liDFw8o2e8vZmyjiric3ls8VQU4mtpwkOSF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782283788; c=relaxed/simple;
	bh=5lTP7pOASEh9WY93tKFJ3sMUeo19IBbwDNxvzyqjREo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXKmcJWLBhJIO4ztslihQKztlbG+lemNR/ybWEBgGwRzAsGVDQ2vMnQEaksbYdfdAHZjbwVcRBlKj3bP6Igpk2Je8n2vm8xQKR5kIMF4+vCIsAjlrNNh4z+aZCLxAsb8Wq6ALDOtgUJDDPqCxVX1yABVYLq6Z3JczIyvuEKvfJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F51gguee; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pFgwNCas; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F51gguee";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pFgwNCas"
Date: Wed, 24 Jun 2026 08:49:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782283785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wG7nrX8bdg4eYhV9IQ5vJkeaUxCAlBKn4RsGYFYDgfo=;
	b=F51ggueewHGPZlsbfU5Pfu5jiwK8uBHKVPaWqRpVsVuj1OxOcdAPF4xVd1sugoA5G9rbh8
	37YEPJrkVD7/XhvE3DDi9WFd2oEAsX6q+yEbU8PqAGhug2Bmj+Ov5TxSC7NFRhuQM/BjX4
	03bQ/L901zG1NgK1RWeVNLhRQjmVsJLOU1ymtxRLmL4CXsN2ZCOUD+DFcSUG0guerTkYcd
	KR2Aaf/5Y4CwQZP6FTHqhNPOqV9k9te8hZB8+io/l3vpK8TaQjjBtUQ+3hBwpqJmcFVQPu
	XKjGsNclnsyxfeGK+2QfHT8yLREfK9AyjzUvvGnAk/M3l7zMCMZKaOhlyPVzew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782283785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wG7nrX8bdg4eYhV9IQ5vJkeaUxCAlBKn4RsGYFYDgfo=;
	b=pFgwNCas5BgdflWRzmUKiHs8cfrAD7QXVJ9OMebG5Ij7/P6uZ5K082D+qE4By0F+YNZcZ3
	sM5nH+Rc+iUYhhAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <20260624064944.Lt3vOksN@linutronix.de>
References: <ajlez0ZNV3PJ26iz@redhat.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajlez0ZNV3PJ26iz@redhat.com>

On 2026-06-22 13:11:59 [-0300], Luis Claudio R. Goncalves wrote:
> Hello!
> 
> The question is simple:
> 
>    Should we have somebody maintaining the OOT RT patches for v12.x and v18.x,
>    the LTS versions that already have PREEMPT_RT in-tree?
> 
> As we still have a few OOT patches, after a while, people using PREEMPT_RT on
> those versions may encounter conflicts trying to apply the old patches. And
> as those patches are not in-tree, the fixes won't probably be routed via
> Stable.

For 6.18, we have:
- 8250 console
- i915
- arm-32
- powerpc

For 6.12, we have additionally
- ktimers thread
- the whole lazy-preempt

So for v6.12 there are bits outstanding which can impact you.
For v6.18 if you are on arm64 then the mainline version is slightly
better than on x86 because on arm64 you might be using the pl011 UART
which has nbcon support since v6.15 while on x86 you almost always have
the 8250 which is not yet with nbcon support in-tree.

These are the missing bits. None of them are essential. If you on x86
and your kernel crashes, it is more likely to see a backtrace with nbcon
driver than without it.

> Best regards,
> Luis

Sebastian
