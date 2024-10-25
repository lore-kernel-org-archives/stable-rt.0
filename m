Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD2918BC1C
	for <stable-rt@vger.kernel.org>; Fri, 25 Oct 2024 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729852001; cv=none; b=LANMjm/I612ZpebnIsrrbf+zoqQDguNz7yRVjoA1pYbS15Gv0y5xHHa5TrOSgmAiV0dgzuNc1dOdOb0BqQu1aHKe/EhM/0UQoN0ToFE8U5u0YnfaWBUYVfn/HK9zC1Tv+vSZWCy44LmTvaYWWKNB5tm38FsMhH8KRLUuXJuA1Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729852001; c=relaxed/simple;
	bh=p/YL6CuLSFfu3eqk3XOQ4+sZxkQNo7r3aLf1EeEvECo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ADGOIyFuwDdl+r0HhkVT8UVZXvaGjO4utlV5Zvu2YxU28xQ8vI2B6vX5qf5CpOTWZsUUk5MjDhngO1I7JEEroRsbiodOhNbg33+tHfkNLszs2GzF1+OEeLMX9MLr+tkfOBcrvxRLlPE6cgZgNdf0XfXHu81lTW7XBW4iGDqbKAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bhmHgG8o; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e42W0PCH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bhmHgG8o";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e42W0PCH"
Date: Fri, 25 Oct 2024 12:26:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729851998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=3i+ftQytGw6tMMVNwK7P4Aj7zl3SBTK0m5UJeAsZr8Q=;
	b=bhmHgG8oM8uyHMPfe2kkNsGjo4bckuVyoVSq7ifkHaMILvJidl8wAQ/XvwF1KccPX5aFdy
	FomDG9O7oqq1ITBEAgwRE1EqpGL507XLY/0tJ1VeDZ3NySn0yCzEhJyoc77ewA3vUZ+bhh
	Dw+Fg3hGtCDY6qZk1Mn4hwJjcKgL+Q+4x7fYmB1XntkSSqzQygxWZCRhcfdgJxHbJYiGBA
	q8OEEX8oprkMNyLVhUDFbM/s5NkdPEr5JiI/ljcnrrUMvlannxqbolbbDAuFveJjYIMAlJ
	xCltsSsMSmQHntgIYbHStxAENXletwSPnPC0kjelEJXvMYS/8InrsQpS9UtuhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729851998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=3i+ftQytGw6tMMVNwK7P4Aj7zl3SBTK0m5UJeAsZr8Q=;
	b=e42W0PCHJjTsgFYcDF5VBZ0B1jSqPX4PJuJbeHIZbBJsH7jbniwXtmH+hG7Zbz2R9R1mwM
	jb1JZDpOQSknT3CA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: stable-rt@vger.kernel.org
Cc: Clark Williams <williams@redhat.com>
Subject: [PATCH v6.6-RT] kvm: Use the proper mask to check for the LAZY bit.
Message-ID: <20241025102633.w55fsSjV@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

To check for the LAZY bit in ti_work, it is needed to use
_TIF_NEED_RESCHED_LAZY which contains the shifted bit (the mask) instead
of TIF_NEED_RESCHED_LAZY which contains the bit number.

This broke while switch from the old PREEMPT_LAZY code to PREEMPT_AUTO.

Use _TIF_NEED_RESCHED_LAZY instead of TIF_NEED_RESCHED_LAZY.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/entry/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
index d952fa5ee8801..5253d3d2d0139 100644
--- a/kernel/entry/kvm.c
+++ b/kernel/entry/kvm.c
@@ -13,7 +13,7 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
 			return -EINTR;
 		}
 
-		if (ti_work & (_TIF_NEED_RESCHED | TIF_NEED_RESCHED_LAZY))
+		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
 			schedule();
 
 		if (ti_work & _TIF_NOTIFY_RESUME)
-- 
2.45.2

