Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B7E471270
	for <stable-rt@vger.kernel.org>; Thu, 20 Aug 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235799; cv=none; b=taAx26//94ZumrbVPk0Y9fBLVF0kCfJTAbzLlZAq/NgpBBup7INXnViIYxQ0TIEI+Hk7WMJKMhaZmye6CI93eJlfzOBhvAEbrXNdjF1ZYilzOeju9YDpCkpynWaOm2mBcylhifMvoTCfS4H+xGwz7HhTPYXYkr0Tsm2XGpcH2SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235799; c=relaxed/simple;
	bh=+PUDOEBtS5/tsGDRhsMyV8YaYxUjou54B4rmmchA2q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an/tkRP3FaJLhNF//iple9t9F86ctr0xKnXsVmKzi8T3QxbEkoqXIb7sAVsGkAcfHaXtx4U6Yiw6PPPlBu8GHQEiJsiWP+EBqmpC/NLMklcdMSm13/iDzRolauN26esCNIkEt+zpj6U0Z7Etsb/1uD2TRJGGyzyfNYcrsYiH3RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l1kiiUe9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TiHtbn/q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l1kiiUe9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TiHtbn/q"
Date: Thu, 20 Aug 2026 16:23:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787235795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lVm1ZNCx9rXphsbJb3QWp7mvfqtQFHSmcsXjaLzCsm8=;
	b=l1kiiUe9+vLhOxyih5YxsG8UA0OVdrCacMdqQqES6tBVVrjYuvSEt7rvuy5A5FhS61ypav
	sF68qgMy5nK7/AEKvO6s8hPX+flrxc3LUkigrLsOHvF6EknjMud9r9NTXpUkDNP5WcljAO
	QU/AlVOshJHj0x0z8bA8g8KajFGqtuYgRlcxx/Ms0sw4qBHgUsCGLXPPC/JkFRyRNjoiJN
	GJmWdsw8BLk6RHPU7Er/6EruwjFCesOTLPVKHSGGbjynZIhfjpJxFmBbTCPm3SfYYBsFX3
	WjAVbe/5JK0Cy69L4sfEWRkFANSa2OBaZF+z1/Y6wix/QKsA8qAYbhp8Zs9IPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787235795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lVm1ZNCx9rXphsbJb3QWp7mvfqtQFHSmcsXjaLzCsm8=;
	b=TiHtbn/qoQ46wFrA+3lSf4eFZy6I9iflmjsb/geK5lRrZEAx3lIzeJKTBggtA6736h4SAw
	LIaUJeeXF2s663Ag==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Bryan Brattlof <bb@ti.com>
Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <20260820142314.OrEinRQt@linutronix.de>
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
 <aju8K3aPXCWr7v7z@redhat.com>
 <20260625-afar-trailside-f84c5025dc57@thorsis.com>
 <20260625080227.WCsryMw4@linutronix.de>
 <20260819163011.v7uqv6zbavgbebq5@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819163011.v7uqv6zbavgbebq5@bryanbrattlof.com>

On 2026-08-19 11:30:11 [-0500], Bryan Brattlof wrote:
> > I did assume we have v6.18 in maintenance but somehow it skipped. *I*
> > usually skip updates if there are no clashes and nothing changes.
> 
> Did we decide to skip v6.18 ? There are a few people internally asking 
> me for a roadmap again with some guidance on the lifetime of the branch.

As of v6.18.45 the v6.18.37-rt6 applies as-is. Winthin the git tree, the
stable tree tag can be merged. Does this work?

> ~Bryan

Sebastian
