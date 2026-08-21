Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950EF1A9FBC
	for <stable-rt@vger.kernel.org>; Fri, 21 Aug 2026 06:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787293503; cv=none; b=bPSRdhlmZOSR46V8zrmIiA5cLbhLcgI5Xeki3UgxiI8wDXEdZH7JiVYDfRLkVTUnekgqmRDvoYexm1bLmRF8LEeLAa3Qrj9liSo90R70l3wO+IxnJlYYSFITbck3EpjXvZdfTu8i4Nhs0VtNtO3cPIyo2BLVRivgR9C1d5ZvLV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787293503; c=relaxed/simple;
	bh=nlJ267SVJUxTaU7rEwu56wgT5tYTCmDt+/aDhIrHYeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxWi+yJdtit7stV8EeWfcaPVz69ToKlx6w85ZXZWtdamisojoPQexKFgzPLn8UZhSWgtW0wGHSkI/fuRSk7Fs2BczwdBH3LYYuXTnmhePTua8fwgfAg5NXLw+qzBs+xNWze/5hfArpuSmmA3ioZPhg4C3gPzYSURx1uFh6vVspo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JZgRg5lY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MgyW2iQT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JZgRg5lY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MgyW2iQT"
Date: Fri, 21 Aug 2026 08:24:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787293497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nlJ267SVJUxTaU7rEwu56wgT5tYTCmDt+/aDhIrHYeg=;
	b=JZgRg5lYAk2cjchUKzEIuqYD/T97rhO682X0TRMOdEeLNDk2QEfGZRAxcOqh4nJyoQb4OC
	N1VVKfh/ur1lhhTrPpJN3AZ/blmE7HEvbK5CL5Gtar1hmNmzmvLkxPMpdcdVG3K7GWhrxm
	UK87lBcmuqbYcIBamMibYr9HiKxs9TH0tvYPNR2GP5auR8yLbu/s8BwvVttCHtKw7iqaYK
	AJhqGTHIimPOnP0KSo38rsJ8U7gOwGDV+W63N8EILDNtc5f5oI+T4L3/zzaIoCNip+V2yP
	d8FgraJkONIVkWEsswvgkoVgnF2dgZyUyiAF03X+t6mP//LL9uOBHZzRE+2OZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787293497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nlJ267SVJUxTaU7rEwu56wgT5tYTCmDt+/aDhIrHYeg=;
	b=MgyW2iQTCv7siOebM4bwG1wVvJqsuMMTTgq1fEsfJ8F9Zxf9MtcUp5mgK2c2zXeT+3e+Kp
	pJKg44h/fvGgsvBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Bryan Brattlof <bb@ti.com>, Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <20260821062456.vqrnjWSh@linutronix.de>
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
 <aju8K3aPXCWr7v7z@redhat.com>
 <20260625-afar-trailside-f84c5025dc57@thorsis.com>
 <20260625080227.WCsryMw4@linutronix.de>
 <20260819163011.v7uqv6zbavgbebq5@bryanbrattlof.com>
 <20260820142314.OrEinRQt@linutronix.de>
 <aocj-6A2vEPw-5-O@redhat.com>
 <20260820161246.TOprmKgB@linutronix.de>
 <aoc4Ks-zKZMEcvmx@redhat.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aoc4Ks-zKZMEcvmx@redhat.com>

On 2026-08-20 14:23:54 [-0300], Luis Claudio R. Goncalves wrote:
> Sebastian, I can merge v6.18.45 into v6.18.37-rt6 too. I can not rebase
> from v6.18.37-rt6 to v6.18.45. But if I repeat the process with

That is expected. That branch has all the patches but also intermediate
patches. The "exact" patches are probably easy to recognize as applied
and dropped as part of the rebase process but the intermediate patches/
commits can result in a clash aborting the process.

So applying the quilt queue should work and merging the stable tag in
either of the two "complete" branches, too. Just don't rebase anything.

> v6.18.37-rt6-rebase, it works fine. In any case, if that is not the
> problem that prompted Bryan's email, no need to focus on that. I was just
> trying to understand the reasoning behind the question and spotted the
> rebase failure.

Okay.

> Best
> Luis

Sebastian
