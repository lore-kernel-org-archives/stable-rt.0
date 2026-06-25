Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D137C0F6
	for <stable-rt@vger.kernel.org>; Thu, 25 Jun 2026 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373283; cv=none; b=TyKOGPQ49sJIqrAiDuoueLXU1MXc3cLu5jYTeCgWpqQcQO4G2RDV94QLws65xtp9lWKfGvMgqRT+nhVG1fxG9/85XiJWiQD0SmTfKcqLIeMGgFcMK0CTO9NDcULzTQqUnXEFUEIG4DiIire4NbW7Z7s+w0WTa24NgHqRP4OfHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373283; c=relaxed/simple;
	bh=2njRbIy84AsLkyUPWVOhu4GycoLoV9oBHL5xvCa18uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3+B86DQXpDnA6Ihra6PKNxgiD1xfWOzXwj/zJLcQOCwGiLcPmfr16d+wVDscyYVj4c21YKriWRQMvaI48gbRJUg0/4R6tTy9gn5lTRaEfdKyKgE1f2h0dbsO5lgFxvwnjl81/rGf+xpx00u1u6iJiXHi1JvM/icEpTHGHZGpNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=WGv+U+Bq; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="WGv+U+Bq"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62D331486120;
	Thu, 25 Jun 2026 09:35:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1782372940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=IetZn8MGjW78MQ978pXWaA9lpM4s5uoPh9I3cBMnoNM=;
	b=WGv+U+BqVn+BZlkGAA4PQ2POnV1UCSgMjqPc0h7Q9ecSu6pI/doBrQxl6aERJG/k3gihPP
	J3CEKa7kTX5LokW95gxW/SQt+CvHnZqtzsVxkAz2mMisJJua1cpjfYyNFCEcugcfDlszTm
	r91LvaDBxcg8nlaPtc242MYPvC9vJxcRWgCuW4giZUY/8ukPeIrs8kmvpXI9IKXClkAG6f
	SEuVyVAevhLKJPl4GNFBj9rZkfc1jjrNKh4sctcntsxyZLhG/WQVwFQcapLUQtgi4LJJ7i
	u74CZ3rHlZ1NeJ6Bi+ECDxDjvgYgDNytGBeiAf0vXVBv7jo1O/0exYFXa8r1eg==
Date: Thu, 25 Jun 2026 09:35:19 +0200
From: Alexander Dahl <ada@thorsis.com>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <20260625-afar-trailside-f84c5025dc57@thorsis.com>
Mail-Followup-To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
 <aju8K3aPXCWr7v7z@redhat.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aju8K3aPXCWr7v7z@redhat.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello,

just adding one datapoint here in case someone is wondering if there
are users out there? ;-)

Am Wed, Jun 24, 2026 at 08:14:51AM -0300 schrieb Luis Claudio R. Goncalves:
> I need to correct myself here, our local hero Daniel Wagner is maintaining
> the v6.12-rt version. Sorry for that :)

Good to know.  Thank you for maintaing it for v6.12. :-)

> Sebastian, just to make sure I understood your answer, then we don't need
> to keep the OOT patches up-to-date for v6.18-rt specifically? My question
> came from comments raised on the last two RT maintainers meetings and the
> LF RT Board meeting. I just want to have a good answer if somebody else
> asks about that. And to volunteer if work is needed.

We still use v6.12 LTS with PREEMPT_RT on arm32 (at91),
and plan to use PREEMPT_RT on at91 (sam9x60, sama5d2) in the future.

If there are no regular patches for v6.18 we will probably skip that
and use the LTS coming later this year.

Greets
Alex

