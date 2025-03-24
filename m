Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2813925F79C
	for <stable-rt@vger.kernel.org>; Mon, 24 Mar 2025 13:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742823449; cv=none; b=se/0y447psuZnQ2kkYionGNYTfkw5Q8McrpLb0EyFxrieKLE3ZISlsEhV1mDFw32qO3Yjlyy6yATxAwj7prqL93nMyA567nkwNAyWYFbQhjP0a5f7pCGZKWNBxdRl3q75y292AHzar8gBLFMDpEoFvfF8gpe6Dl1FwIAheaA0nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742823449; c=relaxed/simple;
	bh=y9kNmtV3rwyHjkz94A0Wkf/PTe3/sPVpCJ5E8YGL3gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KO9B600GlN3adkE4ijL9fRK0/gI8p6DmGfKdmS1OuGvr0hkA37wDVLUhUJgKTqDCe2a2mtmq0Ot+2MFnh/IO9Mp7i/YuwbCR8k/MHJ/hdChFYxyd7zVAwBm9Ostxsju8btErQ/b7UiYlHU+kdr0N8wryf4oW7A6yW3+gzFWSlVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=URRc7mtC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="URRc7mtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742823446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Itw7D4p9/7HHmEBt3j2UJgQx3i0qNuhBmdev44R+rFY=;
	b=URRc7mtC29K4eOu4+6610bwr3JWH7tPg7ytrSP3edA7iXDaZDTlOEJdH49hEwr4IFxqUsW
	qHAUNMOLk1kEWBpXNG1B7lmA/sRbbgtvrRdWIpZp2fBGSM9EBo0ouK0oyey/wgWty2jcM/
	LIKSpYU4nb1sWDUhDXnLSEMGgINE7aY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-306-Ir4TUETzPaKFRhIJ-tZB6w-1; Mon,
 24 Mar 2025 09:37:22 -0400
X-MC-Unique: Ir4TUETzPaKFRhIJ-tZB6w-1
X-Mimecast-MFC-AGG-ID: Ir4TUETzPaKFRhIJ-tZB6w_1742823441
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0780180AB1C;
	Mon, 24 Mar 2025 13:37:20 +0000 (UTC)
Received: from localhost (unknown [10.22.65.159])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 39D02180A801;
	Mon, 24 Mar 2025 13:37:19 +0000 (UTC)
Date: Mon, 24 Mar 2025 10:37:18 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: stable-rt <stable-rt@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v5.10-rt] rt: fix build issue in be2net
Message-ID: <Z-FgDliPqvOBSph3@uudg.org>
References: <Z9yuIpi8zjrTCkoB@uudg.org>
 <20250324083235.BjR4MB0k@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324083235.BjR4MB0k@linutronix.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Mon, Mar 24, 2025 at 09:32:35AM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-03-20 21:09:06 [-0300], Luis Claudio R. Goncalves wrote:
> > Sebastian, Steven, All,
> > 
> > Should I apply this solution in a RT update right after I release
> > v5.10.235-rt128 or should I backport the definition of rt locking
> > primitives from a newer PREEMPT_RT patch (say v5.15-rt or v6.1-rt)?
> 
> The statement ("return spin_unlock.*") is not very common, there is just
> one "user" even in later kernels.
> 
> Backporting the definition (instead of changing the driver) would be
> more consistent with later trees. I'm somewhere between the definition
> backport and what is less work.

How about we compromisse on the workaround for this release and if there is
a new case I revert the two workarounds and perform the backport? Does that
sound reasonable?

> The v5.4 should be also affected, right?

Yes, if the offending commits (below) are backported to v5.4-rt, you will
see the problem:

    1582cc3b4805 dmaengine: at_hdmac: Fix concurrency problems by removing atc_complete_all()
    7078e935b410 dmaengine: at_hdmac: Fix premature completion of desc in issue_pending
    7cfae8627511 be2net: fix sleeping while atomic bugs in be_ndo_bridge_getlink

Luis
 
> Sebastian
> 
---end quoted text---

