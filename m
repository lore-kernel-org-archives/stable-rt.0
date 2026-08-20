Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993DD37BE64
	for <stable-rt@vger.kernel.org>; Thu, 20 Aug 2026 16:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242370; cv=none; b=RBgioytkMiWiMnW5KKn1ACvwt6ZrV5GMOxa6LbZTTJQjrSt5dY4enB4/jkSBfRUAv9hx6rDgfe1VAiitPnlWimFRXHPrnPSL75eWW5CZdOb0iT/BlDUrBQV6b+c+34WcSis8/FNIDrnN89v/XlmrNd+jvp5YbKcL0HQAzRM6/WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242370; c=relaxed/simple;
	bh=0FG58n6VHgITUaOF9Fm5akV2YYAu/N2E5L3Tk218gfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVQzufRlNDi9juyVY1K2IqGyOxEWlHWdLgFbJqy5IVZicSrs/MwCIVnzEIDPR3iANpL/fd8TTDCy0V1YWweaau+NLezpHjGlI7ZDQ+g1/I/TnpzrVubnnJiwwc+4+AcCUJEYgTSFXhzLGmkzd9HEVLScUteiOAjw5TCNGmiP6DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Aqm0jDBz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Bo0eWU8I; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Aqm0jDBz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Bo0eWU8I"
Date: Thu, 20 Aug 2026 18:12:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787242367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rg73G9UWeUxEtlJaHFEsDK3azt6UWnkaLvbXbgNU1lE=;
	b=Aqm0jDBzVnBnhAtzD2Y1QG2BuAKlkFuOhPyXQ+3PtvSygsxS+ek2PUm0gUufH9X9FvPqTk
	o0gt7iMY7DImf9Ydoihq+rn+UH3U8Sh81r1/Amd9z95zJ5xcWDpYLI1E1IL6U/2TUQfsOK
	GPyzoGmrILidoQywoO0C6G/XI9ZttF9YHfe1SkmLljveaSBAHWiRb/NKAQELRZsnCrV2MC
	lkJjoyesnOqXxgLaiUoT4uduXBSQN7GvrUdrh1AY1KC0ScI1BStedqGzWFbQqKd5t5NGff
	0A8B/nv0+w2/EmSe4p1cOc4g5GZI03dSjahns0UAflRVWwcto0NObQ8+9QXiug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787242367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rg73G9UWeUxEtlJaHFEsDK3azt6UWnkaLvbXbgNU1lE=;
	b=Bo0eWU8IS/1r3JVaNQPIwIpMQOglWDa4pKe1+yaO6e+wnc2P+Fclg/4wOrxrC6tECCDvzx
	WvjIxcVdj7r1EyAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Bryan Brattlof <bb@ti.com>, Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <20260820161246.TOprmKgB@linutronix.de>
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
 <aju8K3aPXCWr7v7z@redhat.com>
 <20260625-afar-trailside-f84c5025dc57@thorsis.com>
 <20260625080227.WCsryMw4@linutronix.de>
 <20260819163011.v7uqv6zbavgbebq5@bryanbrattlof.com>
 <20260820142314.OrEinRQt@linutronix.de>
 <aocj-6A2vEPw-5-O@redhat.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aocj-6A2vEPw-5-O@redhat.com>

On 2026-08-20 12:57:47 [-0300], Luis Claudio R. Goncalves wrote:
> On Thu, Aug 20, 2026 at 04:23:14PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2026-08-19 11:30:11 [-0500], Bryan Brattlof wrote:
> > > > I did assume we have v6.18 in maintenance but somehow it skipped. *I*
> > > > usually skip updates if there are no clashes and nothing changes.
> > > 
> > > Did we decide to skip v6.18 ? There are a few people internally asking 
> > > me for a roadmap again with some guidance on the lifetime of the branch.
> > 
> > As of v6.18.45 the v6.18.37-rt6 applies as-is. Winthin the git tree, the
> > stable tree tag can be merged. Does this work?
> 
> There seems to be a conflict when applying the 8250 nbcon patches. IIRC you
> fixed that conflict (or something quite close to that) on v7.1-rc.
> 
> The conflict:
> 
> $ git checkout -b test01 v6.18.37-rt6
> $ git rebase -v v6.18.45
>   Changes from 0c503cf3dde2e53614f05261ece12f9d3d4c3c20 to bf3be28f6721e24961992ebb9e61c0cf21a56806:
>   ...
>   Rebasing (1/29)
>   dropping bea58d7ab5ba4367a3208ecd1854a74b66b21f51 net: gro_cells: fix lock imbalance in gro_cells_receive() -- patch contents already upstream
>   Rebasing (2/29)
>   Auto-merging drivers/tty/serial/8250/8250_port.c
>   CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_port.c
>   Auto-merging include/linux/serial_8250.h
>   error: could not apply 0b053910fa95... Reapply "serial: 8250: Switch to nbcon console"
> 
> Bryan, is this the problem you are seeing?

This is odd. Why does it drop "net: gro_cells: fix lock imbalance"? This
has been removed in -rt2 already.
I'm able here to merge v6.18.45 into v6.18.37-rt6 without a conflict.
Also applying the quilt queue on top v6.18.45 works.

> Luis

Sebastian
