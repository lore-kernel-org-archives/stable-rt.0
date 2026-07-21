Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56E73403FC
	for <stable-rt@vger.kernel.org>; Tue, 21 Jul 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639406; cv=none; b=L0WZwyAzX4amBuSJF18rQb/tmbMll7e3Hdg2b4UipgqUHH8Kf6bETn3Yw3pUgIqaDrehSr6f7rms2DV1AkLx1lPjqDP9wU+oLEaTJaQ8tlbzx+4TXR1UMkMvq4gl6nRMtQuT720N49D7TAzhQhbGOpKFtcsNwfCjr0CZPXiv3qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639406; c=relaxed/simple;
	bh=mBraF0RfzEUQVxZj/6XRRqC3MDBHG5bBNNzjmYPivuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CedQ0FvBVQvhxLyaaUo8h0OQdMwNeWfDpG0wLBB6KDfkksxGiLAx2yOwHXkk8sjJ5tELck03Y33UUJIju1DWlb0sovHO6AYLQx7AUCSqyMco1m2F9gsJXbJNSmU7M6eiGdMTKJ3XBq5IlfUQmU7f9T1f/7FCbbFrOF9BAmnwTjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ry/sgQaZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hgbro4Aj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ry/sgQaZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hgbro4Aj"
Date: Tue, 21 Jul 2026 15:10:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784639403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mBraF0RfzEUQVxZj/6XRRqC3MDBHG5bBNNzjmYPivuw=;
	b=ry/sgQaZ8SG1LvJpJapC/JGGBXTH3B6xoeAUbL0CJvAxaeQ9Yvfjh6HB+wElCff/9wlXDJ
	wC9R28FJQHCypjymtO9pwP3HcACfqmnwflaAl//a+U+eY0YGa0Q1LmD5xbZplvbXRJHugR
	JWXgSZtuZjB8W6DlrdiIKx93HMl/OyNgoYrI9nfGxkJNyABgq49/F+uHsxDlYXJKVfig7L
	LTWZm+TzFJSzXgQaEbbessmCn8mIIzbawWnpUHTf8dpyhMhGRVoaraddWyhOmSFTaxw+HY
	LJgrgwT5XOMZ3DIATstBHkV4hkALcqx6FGRw5oMBDIXL+MOq58kEe7aVLBolVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784639403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mBraF0RfzEUQVxZj/6XRRqC3MDBHG5bBNNzjmYPivuw=;
	b=hgbro4AjDdANnY+wDH+SeBc0pT2nsjrNtKEyZ6Cif1N7NpL7e823WxriDeebZ5oU57eV/t
	WXoSzQuvQCAjo3Aw==
From: "bigeasy@linutronix.de" <bigeasy@linutronix.de>
To: Daniel Wagner <wagi@monom.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, pavel@nabladev.com,
	nobuhiro.iwamatsu.x90@mail.toshiba, stable-rt@vger.kernel.org,
	cip-dev@lists.cip-project.org
Subject: Re: v6.12-rt arm updates
Message-ID: <20260721131002.4h77xeHc@linutronix.de>
References: <8a0f6ad1-0df7-4707-bcc4-83603cada945@monom.org>
 <20260717134624._f9g97lg@linutronix.de>
 <141ef3cb-361d-432c-a7ba-af010406283c@monom.org>
 <20260717140336.krBy6oQT@linutronix.de>
 <3706c5f1-53af-460e-9409-fa1b78706645@monom.org>
 <20260717142210._ukh1yBD@linutronix.de>
 <72dcc63c-9786-488e-a840-f383533f2fbc@monom.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <72dcc63c-9786-488e-a840-f383533f2fbc@monom.org>

On 2026-07-21 13:06:24 [+0000], Daniel Wagner wrote:
> It all runs fine in my test setup. Any objections to release this?

No. Go ahead.

Sebastian
