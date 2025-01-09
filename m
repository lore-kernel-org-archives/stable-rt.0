Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BD1204C0C
	for <stable-rt@vger.kernel.org>; Thu,  9 Jan 2025 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424063; cv=none; b=JauY50h98xFvihc+NDd6jT94VXjnKH6Rlj039pO4s34Fj9AAwfJh8zatzKtJ/uBkbYOJXhSgYVIhOm4d+tNdxjoOWN56h5QtCEELiTZWZZLoF5fbBpEiafF82LKAe2MAItGnpKDy792BuQHzNDHd9CyfrRYM7x1bmn26z2IcWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424063; c=relaxed/simple;
	bh=QNia71mevrAclqOjNgRMhf/ZjIjiIdHTnUh5OF4dr/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UWNQP0sRy0IObrqWlxQceOLk1Fqj8zfrEWPdymJ6Ts0qfD+2InbD2a/33bmzki0C6Pr9R1MRdLTQCNK5y+7JJ5ycm+OhwAuPcCnESL7Mf1s855RgENSw/niIh40iWvd8aubP3oOxUhxl/F7avvq16RZ2Sz6OHOBCaYHpjDiyIdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I1ao/RPi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TielsCzz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I1ao/RPi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TielsCzz"
Date: Thu, 9 Jan 2025 13:00:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736424058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=+3UgZfyLHQAK5SyUNOSbAMpnD1xz5c0yDHUR/RZhaR0=;
	b=I1ao/RPiclKnlou1kVnLOykK3bkOo/iU6uhqDUIA0yi064fTYQ3xWnLEUVklmd+yB+ezux
	YvuzYSWeYoP4oKEKbN9AbI0S1mw5n2L0fymPCR/h2Uc55rm8kpSjjFiQSHp/NTfM/V2IYY
	jEAOwmu7ClaZWWDs8aHTPm6/DBnb0Vp/evcUrC66QqaB/prpN8zkYDZnqtoLQ+55VoTyUy
	pS5ukGTWjeB5P1pKi6WdW5H5Lqv82QDrb5FT0Y4KILN5gqmz0mhCkd+HuElbi7hd1+UfL/
	9TY/tr6XP/txpOFP2jM66H2Yu024jYlQeCTQWE9qWBEe43ID2dIPWalFOIOVxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736424058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=+3UgZfyLHQAK5SyUNOSbAMpnD1xz5c0yDHUR/RZhaR0=;
	b=TielsCzz42IuWnJ9v1YvM8ymsqS+PUjAIQE3Ej8Msit6n5gpcAwqAmwcsjzAfx8gB6fR4p
	fbTZPTJmrAPKlhBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: stable-rt@vger.kernel.org
Cc: Robert Joslyn <robert_joslyn@selinc.com>,
	Clark Williams <williams@redhat.com>
Subject: [PATCH v6.6-RT] powerpc: Allow scheduling of IRQ with PREEMPT_RT.
Message-ID: <20250109120056.TjyCKwua@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

With the LAZY_PREEMPT patches, PowerPC core code was modified to allow
scheduling on return to user land from interrupt based on
CONFIG_PREEMPTION. With the removal of LAZY_PREEMPT the code reverted to
its original state. The switch to PREEMPT_AUTO did not cover PowerPC so
this change was lost.

Not being able to immediately schedule on return from interrupt can lead
to large latency spikes but also hang on boot on a e300 based platform
as reported by Robert Joslyn.

Check for schedule() based on CONFIG_PREEMPTION.

Fixes: b33022a48c797 ("sched: Replace LAZY_PREEMPT with PREEMPT_AUTO")
Signed-off-by: Robert Joslyn <robert_joslyn@selinc.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

Clark, could you please stuff this into the v6.6 release after next?

 arch/powerpc/kernel/interrupt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c4f6d3c69ba9d..1370612b27e0b 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -395,7 +395,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
 again:
-		if (IS_ENABLED(CONFIG_PREEMPT)) {
+		if (IS_ENABLED(CONFIG_PREEMPTION)) {
 			/* Return to preemptible kernel context */
 			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
 				if (preempt_count() == 0)
-- 
2.47.1

