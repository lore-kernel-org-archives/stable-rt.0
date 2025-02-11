Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7B1D63FC
	for <stable-rt@vger.kernel.org>; Tue, 11 Feb 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264722; cv=none; b=gPx+ykkMFtSG1CFeZZiUlNQlqLAQefW0VOf5tExlIu+NN67xqlJmpC2foww3X1N/y7ToAg8OQACMKZGvhKPInJw7wDvpeemfF+NebsRFGNr74JbL9S0q8wcmt8VN86wu5fWhpnGUTLHLtV3mLuuVa+V85Bqy5uONdx2mJKWwYF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264722; c=relaxed/simple;
	bh=Svv+nwNCLHdzs6QrvQV8o+WcV42oA41c9NaBW6BdasE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lFZv0G7vxxIee0adepWoGP0RLalt8KP92kE4bupaxVtgCoClvGuEOH8PKk5PY6+DQaYKZUQvK7ucvdUjh9Vot99MVs19yc6YhMMYQkHQ1f4wGHn+4gZ2dWsPqFIF9mOCgroq83IjWmIVAVSfPN3T8ycGxfrxDOqlf+hrzq8fRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DY7yj8oa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g39q/iz9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DY7yj8oa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g39q/iz9"
Date: Tue, 11 Feb 2025 10:05:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739264712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=kXfJDnilUU+EYr3pa8mS3jm4mEYeovUBiYG2tSWSdXE=;
	b=DY7yj8oah8Ym4OYEC60ABITHHNoha1WSkbrOjQCELm2kZA6pOc42AdOdioWioGgivjlKZC
	cK1OO703QRq/DzpfL6PzcOhCugxjWyP+L5J17699WaDLILqZTuyA0XJ9elpIl6Cpn59o3T
	mtKnt2PANnvU0CVpzlb7WjH/iMs5bFXAjwERxGja/dnZlxW/CITAAnJRu4GZ42CkXpdPq3
	OmPLFaiKCGazUY+rGENeFBln7SW0AeZLbV2GGnB3Zx4r8513T9q0QSD+FUoxpqPWeGE/h/
	3LtB2IDcJzg39w4bo34fz4OE+pqNKbZ6BgS1/Ep1j22sQeQuURt32rgZXqyIlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739264712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=kXfJDnilUU+EYr3pa8mS3jm4mEYeovUBiYG2tSWSdXE=;
	b=g39q/iz9djZntcVtBjHuJsajq8pnvv1A2R9uL+rMydv0r6jiKrMrefTiLcVUSe2Hc5cu7Y
	HjFIecQtj756XkDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernelci@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev, stable-rt@vger.kernel.org,
	Daniel Wagner <wagi@monom.org>
Subject: PREEMPT_RT testing on kernelci
Message-ID: <20250211090511.xeFJVnH_@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

I remember Daniel Wagner has been asking to include PREEMPT_RT within
kernelci. I don't really know what the status here is. Thank you for the
work.

Since PREEMPT_RT is now available upstream, would it work to compile and
enable some of its tests for the supported architectures on Linus' tree
and maybe the -next tree? I don't think that happens at the moment, I
saw only a few stable-rt trees.

If so, should I just open an issue at
	https://github.com/kernelci/kernelci-core/issues/new

Is there be anything in particular you need help with?

Sebastian
