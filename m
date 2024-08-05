Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F3C155744
	for <stable-rt@vger.kernel.org>; Mon,  5 Aug 2024 11:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722855604; cv=none; b=fs7gVOwkhkqzF+vNjvvnZqmeYjyHDNU5CEJE8z+Pd//yI2FC4P3vuIQ6ec2JyIacBOMbUj4RrL2PN8WlD3JonEDqtVNNA8SV+QhqiVQ1M1elpjsE0xM1rZGIwxafxiB7AupGyIJXaemDHfNdt3/ZI1srhbRGvNE3HIMp3QZDSKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722855604; c=relaxed/simple;
	bh=CoLRTsPbZRjUjR/1CUKz3EI4vHmV2f0C9jiZIExajLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBCVeajYaP1FZoByTdziQ1NVB5Y1rXScBBPyFf05vHYz78tzQa6bFD69j+NmR6+6dvrxIo6BRSlKqUqZ8Vk28fyuB24Ayf+V0pLC/jmAs1qYK6d7poBDaQhjDd5tUgBa25PTagk9LxBgaL5HtYSSQhir4ooNFUgD1Tj2/gYsJ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=no6OxZG4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Iup4dndm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="no6OxZG4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Iup4dndm"
Date: Mon, 5 Aug 2024 13:00:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722855601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QBQQbzVLcPw4QLYhO2Q88yM73Yl2YisWs/crDgt1poA=;
	b=no6OxZG4nRZClj3muHjwHHv0dsvRtH8McRLHd9l6yCFTUkXdpbNp9xAhWEam4mPkuzcbBW
	6gSisGVeWHwGhphFYkG3UW7UhEzAtCpFpiwbhNL7QBaT0Hx+lJOQC0cAcWZDnhXX+R8Mbr
	ygnHZhSJmNrqo4kgHTPMUXK5kuNYkRyRGzOtduszOoNbXUKaWItWgTl+JaTvGLC89JSa5c
	gPmIP2GPh8S1/K2iyD0tiVP93Oe+j4i6Qc/OuwtJA63ZiuW/5BOtvQo9WuiNblVD/UPpei
	/eE5vlZaJpRummZHUSRbVw2ICH1sofY4ASiv+j1kcNuen7Kux0WVDafcgQcKVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722855601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QBQQbzVLcPw4QLYhO2Q88yM73Yl2YisWs/crDgt1poA=;
	b=Iup4dndmIR5kV+MIS+AIc/x2XG0WBm4oOIzTrB+d6ecyGMJhWOY1jtK7gsgZHnvtDbofNq
	+NzhDl/4xP0xyUCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Clark Williams <williams@redhat.com>
Cc: stable-rt <stable-rt@vger.kernel.org>,
	"Claudio R., Luis" <lgoncalv@redhat.com>
Subject: Re: CI build failure in v6.6-rt
Message-ID: <20240805110000.ga17k3zy@linutronix.de>
References: <CAMLffL9t0SFkO90d6pFZAwp-WVbont7NgELx_WW-GRRYkF_QXA@mail.gmail.com>
 <2024080344-division-undertook-4905@gregkh>
 <20240805105834.9GZL-G9o@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240805105834.9GZL-G9o@linutronix.de>

On 2024-08-05 12:58:36 [+0200], To Kroah-Hartman, Greg wrote:
> I'm sorry. I misunderstood Clark and assumed this is a stable issue. Now
> that I have the needed pointers, it is a RT-stable issue only.
> I'm going to drop the stable folks from Cc: and reply with a patch.
> 

Clark, this one, please:

----->8------

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Mon, 5 Aug 2024 12:38:59 +0200
Subject: [PATCH] riscv: Add return value to check_unaligned_access().

The stable backport of commit c20d36cc2a207 ("riscv: don't probe
unaligned access speed if already done") added a `return' stament to
check_unaligned_access(). The return value of the function is `void' but
the RT tree has the backport of commit 73cf6167ef44c ("RISC-V: Probe
misaligned access speed in parallel") which changes the return type to
`int'.

Make the return statement return 0.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dd118773e717b..347cdf56f3a15 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -588,7 +588,7 @@ static int check_unaligned_access(void *param)
 
 	/* We are already set since the last check */
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
-		return;
+		return 0;
 
 	/* Make an unaligned destination buffer. */
 	dst = (void *)((unsigned long)page_address(page) | 0x1);
-- 
2.45.2

Sebastian
