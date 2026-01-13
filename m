Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A1A29D27D
	for <stable-rt@vger.kernel.org>; Tue, 13 Jan 2026 19:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768332989; cv=none; b=XtbXR/uxPQe9KNAIbus31rGLDSqtnYJCElX1eKyK1q1qYOyosvFNQhjDau/RU46SsoKqLg50xuV3zS4bMlOxEurPj1SeIiH02irtMNQHfYx5DQ9pkTuVYvPsu3o6eXunj9FlfnSzQiLFJMEkQCO9MvNrNC2XPWh3WVMkvQdNJXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768332989; c=relaxed/simple;
	bh=EW1h3I/D1orexFUQTVdFzD8KqegRfqiiAS8Ucq4s5y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Li6yd2XR1ctQa0I60IA8FOJC385xhiw3XM0l2xgim2237RIBI1OaZOC1z74jWQiKg2wGBrHYTaIW1W5TerOxwykJMuKJM4Ys3TOCW0149a/FUSZ8XRoZYgp+nBbefZKxDcV6aSIFLTfFUySgPQ3XY+xWqmKKXnNXmdbYKwuSg4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZaMsNweK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZaMsNweK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768332986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HJw8QksqA8ZUvwDcpS/o4GYtYBXW+Zc2qvpN5Ms6NJo=;
	b=ZaMsNweKZAkdi7Cs6W3JOdJKC2RXSMa0vns9sCc1rTNcC1yPY0kZGMqk5JHtEQI7dCjijQ
	sdnm8/cnehCyKBLHYYXiwkmFORBMWRy2WC4+InvbYSE1/2GkZSV7VZSR5ZRTcf6XEMzuYX
	w/IN2VgmACp+Anh5v6wMLra4Cg4AO3E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-KCSyAqENPnm5E2K9nfIL9g-1; Tue,
 13 Jan 2026 14:36:23 -0500
X-MC-Unique: KCSyAqENPnm5E2K9nfIL9g-1
X-Mimecast-MFC-AGG-ID: KCSyAqENPnm5E2K9nfIL9g_1768332982
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FAD01800473;
	Tue, 13 Jan 2026 19:36:22 +0000 (UTC)
Received: from localhost (unknown [10.22.80.231])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E056819560AB;
	Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
Date: Tue, 13 Jan 2026 16:36:20 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: stable-rt@vger.kernel.org
Subject: Re: [PATCH net v4] ipv6: fix a BUG in rt6_get_pcpu_route() under
 PREEMPT_RT
Message-ID: <aWaetNiLITXn0UrV@redhat.com>
References: <20251223051413.124687-1-jiayuan.chen@linux.dev>
 <20260112154947.5C8DFdQb@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112154947.5C8DFdQb@linutronix.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Sebastian!

On Mon, Jan 12, 2026 at 04:49:47PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-12-23 13:14:12 [+0800], Jiayuan Chen wrote:
> > On PREEMPT_RT kernels, after rt6_get_pcpu_route() returns NULL, the
> > current task can be preempted. Another task running on the same CPU
> > may then execute rt6_make_pcpu_route() and successfully install a
> > pcpu_rt entry. When the first task resumes execution, its cmpxchg()
> > in rt6_make_pcpu_route() will fail because rt6i_pcpu is no longer
> > NULL, triggering the BUG_ON(prev). It's easy to reproduce it by adding
> > mdelay() after rt6_get_pcpu_route().
> > 
> > Using preempt_disable/enable is not appropriate here because
> > ip6_rt_pcpu_alloc() may sleep.
> > 
> > Fix this by handling the cmpxchg() failure gracefully on PREEMPT_RT:
> > free our allocation and return the existing pcpu_rt installed by
> > another task. The BUG_ON is replaced by WARN_ON_ONCE for non-PREEMPT_RT
> > kernels where such races should not occur.
> > 
> > Link: https://syzkaller.appspot.com/bug?extid=9b35e9bc0951140d13e6
> > Fixes: d2d6422f8bd1 ("x86: Allow to enable PREEMPT_RT.")
> > Reported-by: syzbot+9b35e9bc0951140d13e6@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/6918cd88.050a0220.1c914e.0045.GAE@google.com/T/
> > Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> 
> This is upstream as commit
>    1adaea51c61b5 ("ipv6: fix a BUG in rt6_get_pcpu_route() under PREEMPT_RT")
> 
> and should be backported down to v6.12 due to the fixes tag. RT wise it
> should be broken since its introduction so if the stable team could take
> it down to v5.10-rt, that would be nice.

Just to clarify, do you mean us, the stable RT maintainers, or Greg-KH
and his merry band?

Best,
Luis

