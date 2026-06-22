Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125DD3793B3
	for <stable-rt@vger.kernel.org>; Mon, 22 Jun 2026 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126211; cv=none; b=d+5cH/8wDxd+6+KwzKJ64w4zE7Oi7BaKxCMf+C7kBGp5vORQ/sYIZGxxiKwdo49KPdDLd1y8kxgbzRm2yNKDY7Mf1mxSuq9YkiCX2D4rjQe5/wgqo1Q3xWnVarPEKlv/VLDrJASSy3Uu3/DIHMOg8DBkhhMTaAXgc0yCc1vnr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126211; c=relaxed/simple;
	bh=hTVorCdhJuJO66y5pR5YsgvPjnF/jkah0VxtoZC3Ay0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VmEhXtLbj9uQXZYjpVF6YBC5TFMTRE5edrAgmRrv5A56YUT0UM9R3HhzIkP6H3eL5959h6c4Lej+X72Mf79f+bSDQ5gK4NUcSwy9p9WudgEHb28MHAsenSFoyrkrBeUMXtzLvgJLQfdnwCOXZYWUYQeq9f8IqToiQQN46ulzQNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CUyCfOmk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=88v/xCj8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CUyCfOmk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="88v/xCj8"
Date: Mon, 22 Jun 2026 13:03:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782126208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rcfyMljWvtC9GW+khPKqXYTtQjDUObpbO19g8aiNfGc=;
	b=CUyCfOmkT9b5whwtgUyQCl0f4Bj8dAG0uZqrz5WAVImPDmPasTFNylFZndlDzs5BRQaUS3
	0HiF0hD7SRoHo4CnUDnyhFHEDQ3Zmj06VkirmwXFJOMrFr1s8U2cnyM29BuXlImKTXSxMm
	BaSqew28k+egD/cGvksVMal3qez0BGJKQmphf/GRAxQj055kKEgR3Aq6BGCkzQQhukjLCa
	Hp6k3x4jgflyowEPvZIssqS0X1nOxSCx015vpdNZ+9WrzbFw/LHeaFH8Y0Q6Cby7/LqzIr
	FCAjoW8aXgai+t/q/0J1JH9z2pFIp08gje8ofGO8/1AcHE/jG7BpeY/FS7xBYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782126208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rcfyMljWvtC9GW+khPKqXYTtQjDUObpbO19g8aiNfGc=;
	b=88v/xCj8N0io06+dAHF5G+HlJGFBBEbtlr8Nvv0AJtOI83Qkjkb/ZYfvE+SoMzg7XWpUGT
	gNQcWlKykUZRw2Ag==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Clark Williams <williams@redhat.com>
Cc: stable-rt@vger.kernel.org
Subject: Updated =?utf-8?B?djYuMTjigKY=?=
Message-ID: <20260622110326.nZGkwabl@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Clark,

I updated the v6.18 series to v6.18.35-rt5 and uploaded it my git
rt-devel tree and https://www.kernel.org/pub/linux/kernel/projects/rt/6.18/.

I asked on FRI if we did or did not rotate the trees earlier this year
and people have been pointing to you as the v6.18 owner. I don't if this
is the case or they did like to blame you since you were not around ;)

The wiki is stuck at 6.18 as devel
	https://wiki.linuxfoundation.org/realtime/preempt_rt_versions

I could update it if I know to what=E2=80=A6

Sebastian
