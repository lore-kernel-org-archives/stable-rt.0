Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BB31E32A2
	for <stable-rt@vger.kernel.org>; Thu, 25 Jun 2026 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373969; cv=none; b=U/sMBxsFboJp0DP1uSbzDxpJzsJ+fzwfUJjOUHzXNuSG36xlGfhd6tYHbYPyQrVvasm+qQjhikRRoju51SQfFp2NfbTL+6gwUOiwGDUU5RKq58JtXiZ9CSV2ZcHiv3lOidEpaWLBd66HTGyLCqiHg4pIGlHi3zrSRODQWxZD4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373969; c=relaxed/simple;
	bh=EICfa1ew1LkBoIGRpJ/Thuizd+4hlb4c/R2Y0RZOEuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKrUo+OHUl7SG0qFdxJT4o3aodCD/WKJwoUpOpOXBnmjS3faqMcqu24c6UpUHyD1ITLR+pBbotN/xWboI6Xq4owa3Eihj9XchoyAt/ax+NT3W4877j8FlAsmIue3ccTdnUPq9ZT3m1K3ESc8FK9RwiI36ZRnZ3qdQSfQhNycfdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jsW8NrTG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VEZjzhkI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jsW8NrTG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VEZjzhkI"
Date: Thu, 25 Jun 2026 09:52:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782373960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EICfa1ew1LkBoIGRpJ/Thuizd+4hlb4c/R2Y0RZOEuw=;
	b=jsW8NrTGkSHTzIyIVoVNypPTB0P+huLeyzHlpx6ERNXSGh0c2Stq/GaOIs67+nBWp7XghI
	KKgbvRjYWoJjP5ob5g/Jzj6LItMJvouOI5XF5BuUJH98Cjom/BQtwjZBxvbdU6FKq5W5Li
	N05b/5VkJQwPp8zDUGaE8Fnwhs/pP/N2CXt55SrtQDKMLOfmckTKDHFkt1cDnq2KgIZZf2
	S5yLqZEqRxbvk2aRaqCaE/35+W9VZ/WiL8UbQqKyIaWWCZLGCACSzAicnH2TY4HItgo2i8
	SpiZxMnmEgEgQkEd9yTPClaBlBxdm42VYsvmk6Mlug9G6E9anv0+VKwLQih6QQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782373960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EICfa1ew1LkBoIGRpJ/Thuizd+4hlb4c/R2Y0RZOEuw=;
	b=VEZjzhkIncdVhQSGlr/SSMDxLY2+brXf6AgOWNNFxfQjGuKwfm39oaH5aSypbnz1XAeBqU
	8QXcHmkUNzOQyXBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <20260625075238.yBVVPwdL@linutronix.de>
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
 <aju8K3aPXCWr7v7z@redhat.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aju8K3aPXCWr7v7z@redhat.com>

On 2026-06-24 08:14:51 [-0300], Luis Claudio R. Goncalves wrote:
> Sebastian, just to make sure I understood your answer, then we don't need
> to keep the OOT patches up-to-date for v6.18-rt specifically? My question

I did update v6.18 recently. I do think at the very least the 8250 bits
are important in case something goes wrong.

> came from comments raised on the last two RT maintainers meetings and the
> LF RT Board meeting. I just want to have a good answer if somebody else
> asks about that. And to volunteer if work is needed.

There isn't a lot that clashes in v6.12 and it is even less in v6.18.
However the printk/ serial changes in v6.18 caused some fallout exactly
there.
Hopefully we get the 8250 bits by the end of the year including i915 and
then we have just powerpc left and that one sysfs file and we can call
it a day.

> Best,
> Luis

Sebastian
