Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFE928C009
	for <stable-rt@vger.kernel.org>; Thu, 25 Jun 2026 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374551; cv=none; b=XQ+2KB5wd0ROwITEC7TQ2/DP+9e0YAxFFDRuCdinJdg7EpW3nrhdjBoSQLijAP/KZNDRLxCMue50KKCnybe8V1Wx46614bhXNX0HKW+wSHj21R3sQqgT4x77fq2SihOFf/CwRk2RSOcrmb2Sil+CNAuHttLkMDnY5XJnimnA9UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374551; c=relaxed/simple;
	bh=P1eLcT0iPwNuHcCA7MYfRNCAInpCh8tJHDZnAbIwUjk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTKAMxQw7ydDGg2QpiL5Ri4sqLXykro4OLtYTC9dCmfOAsOvBS8sz4ZVLQldRBlCOajbi8ZIy+b9y0O/RAWmh2FifaLte0MULgDYwPlmIutz7LTJBQnH2NOjYdTOswQnnlxIJ29tkV991uEt7Wk42+pKUSHimQJGvq661r8qUaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D9qlpHga; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U9O8iXXl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D9qlpHga";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U9O8iXXl"
Date: Thu, 25 Jun 2026 10:02:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782374548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6RfTSm75C5XgoUu3poPlnJaFQoPycgyOby8gbtUnMc=;
	b=D9qlpHgan2mNV1BAUzWCKhVZJslZ5vL26wHtMDVWZVLDrHA2twdqIm2TkD6t3nau1dDl0q
	Y4KLltEKs6n6/r4Luz/7MJsxIG19Gd47tk2cPFFDh2SH+/PD4gixIRElUHjpxwWqbTN8yb
	Mm6hGrSZSP2/OtDXjtnHIXehGIvq8KZM5cQPDvhI8Pens4sPxJvEiqrtwUvkmMw9H5BBIo
	z+BNBYz+76U2ioDTf/eK0NXxcw94Wfp4jq00iXW6my+E/lmPiy0ArG4EfPbEO5fwN3BX7v
	TmedGqfYqi/r6JeY3UY0718moc9Ztk2Q7l507OEDJUcsbucjHTIhQE8N6Rlo1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782374548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6RfTSm75C5XgoUu3poPlnJaFQoPycgyOby8gbtUnMc=;
	b=U9O8iXXl76XIoQrSph7j1uQQ36yWgW55H911uKVhL2tLXWl0qCCK9nEcEc0gh3SUvCLQrG
	hmjz7zqayvN0muDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <20260625080227.WCsryMw4@linutronix.de>
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
 <aju8K3aPXCWr7v7z@redhat.com>
 <20260625-afar-trailside-f84c5025dc57@thorsis.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625-afar-trailside-f84c5025dc57@thorsis.com>

On 2026-06-25 09:35:19 [+0200], Alexander Dahl wrote:
> Hello,
> 
> just adding one datapoint here in case someone is wondering if there
> are users out there? ;-)

Sure. Having an update from _any_ user feels good. At least the work is
used ;)

> > Sebastian, just to make sure I understood your answer, then we don't need
> > to keep the OOT patches up-to-date for v6.18-rt specifically? My question
> > came from comments raised on the last two RT maintainers meetings and the
> > LF RT Board meeting. I just want to have a good answer if somebody else
> > asks about that. And to volunteer if work is needed.
> 
> We still use v6.12 LTS with PREEMPT_RT on arm32 (at91),
> and plan to use PREEMPT_RT on at91 (sam9x60, sama5d2) in the future.
> 
> If there are no regular patches for v6.18 we will probably skip that
> and use the LTS coming later this year.

I did assume we have v6.18 in maintenance but somehow it skipped. *I*
usually skip updates if there are no clashes and nothing changes.

> Greets
> Alex

Sebastian
