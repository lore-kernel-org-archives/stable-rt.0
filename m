Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48121862
	for <stable-rt@vger.kernel.org>; Fri,  4 Oct 2024 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728027579; cv=none; b=cBTl6YU1Nv10pteMB7j7OO4X7SwB0W9K66OsE9J1Y1wS79/P83GQ8cNNH0ZE2UZ3J+aJCIHN0C1rauDqjBWlU2swNPPt6v+TXWnP+vqg0htrtupgo5riZxJTSnj5+4Y9kAnGtYahJ4P9g97oP1Nc9eZl4a0LeK4y+KP41pOW09c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728027579; c=relaxed/simple;
	bh=lriwa/LeS0LiYoZRkEUTBGT2LNJfujRrtenqSByhovI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOKFGFXgowoTCZZsxweB00WRrJG9+Umu8AqnZs7+9g3YfWk/ZjQZVEp0+sft6+KPZF3c4fRGmSVwbZooDTO+vGLRD0yFvqNxsJzzCIyBN/XRR8qnXKXV0pYOBEeOwu0ff72mHLxvRGpNALVZgUJimdoLObLjCE/aUSccghxNcC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ez3gja+R; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DCAUvg7H; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ez3gja+R";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DCAUvg7H"
Date: Fri, 4 Oct 2024 09:39:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728027575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pBn26RJR8fkPLKbK2k2QDpWMOBJHFRk8wC/TZqgLg/Y=;
	b=Ez3gja+R3FBTrHDA4yim+mjPx7CEEpE10QB75b6b2RPf0SW7Ha1Z6GetOE2n+RzVV9BmMl
	rL0Nt36oAxOwIFbELVuoj9SxaAIGxSIDyInxpDylxnSA21SAWoNwWYyM4Co8bmlceJ6eQb
	rE7MtSc52Txf/IqccWxhXaoVoHhS4+61Lqu6UwDMe2h7hDwG4LQMmEI48zIZfF4L4EU4x2
	OU3TeS8JMsIIMYAOVbu9f6eFUZtjPLCgddP1dqtRqf9he/x/ArvrEc4UNrkhzxWds2Awft
	YJVOCrRIS0KmtkQ6Kr8pTl8qeaVFKkLKB/Pf1K6GK8rnRio/glMFZm0TavoxOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728027575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pBn26RJR8fkPLKbK2k2QDpWMOBJHFRk8wC/TZqgLg/Y=;
	b=DCAUvg7HPvam0VoedgBoCUEs+W+YHs6CGYAuEGa30SsOc/U99whMqwYa8yIXwl516P3nCo
	1/8ytkVwb7phaVCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Joseph Salisbury <joseph.salisbury@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, stable-rt@vger.kernel.org,
	Clark Williams <williams@redhat.com>
Subject: Re: [External] : Re: Please backport: netfilter: nft_counter: Use
 u64_stats_t for statistic.
Message-ID: <20241004073934.501MFrgf@linutronix.de>
References: <20240927155656.Z-s6BO9B@linutronix.de>
 <20240927144126.0dba172a@gandalf.local.home>
 <bab856cc-7c9f-4ee9-84f6-ab228b2648c0@oracle.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bab856cc-7c9f-4ee9-84f6-ab228b2648c0@oracle.com>

On 2024-09-27 15:01:00 [-0400], Joseph Salisbury wrote:
> Is it needed in all stable release patch sets, including v5.15?

Yes. I would appreciate backporting it all the way where the code is
available. The dependencies
	1eacdd71b3436 ("netfilter: nft_counter: Disable BH in nft_counter_offload_stats().")
	a0b39e2dc7017 ("netfilter: nft_counter: Synchronize nft_counter_reset() against reader.")

were already routed via stable.
The problem is that the seqcount has no lock associated so a reader
could preempt a writer and then lockup spinning.

Sebastian
