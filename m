Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660082EC09B
	for <stable-rt@vger.kernel.org>; Wed, 24 Jun 2026 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782299700; cv=none; b=fwXexKoOy8fQpcs0Ky14X44DL9ui9s7Qyb3Xw6xEzzxcYPh6qSvYtT5VNW1n39L1rxonnXkMxcDrNHWLSJd7CkPmppIRRWQi9YrAt3nTjRkopFC9eEPPFFf5MdRxgJG4/huONh32Q++V9Ct6Flt/1b0MOuAW0VWuuntKk8l+6+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782299700; c=relaxed/simple;
	bh=kx0OYEBZgpjqoN9KGypOmRPyNfcq3TMIPe0SFkuQt9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rL3qAdhgrMkrwkq1FPmQsP+4n5LtbKRHv4841Rop+O8SiyDLS5EGmYKtilSBG8+ksEAyqoXZW8Vsh5Qoj8RKPOSCjD1Yix8fjsKs9EeNE31DDetfaep4tkgsCbFGSWjf93f32BXXT9CgclcnAilcREJcm5xuqmYk8/3DpWEARro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jWenvRfO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jWenvRfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782299698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iONF7LTDEwtCd6/03WuJ2mCphhJ8L3yvGclsYyvwYRU=;
	b=jWenvRfOa6FCT8/Ik7Iwji/co48AVyigJyu+mXE4LsEChWBkQuT4IO8InamKqYtA5c0Tls
	BiOkLlnatloZzbtVx/VRsgh8ui5USI3WwpntXLk+kFpEOlRm5DOv3uoUoyzQDOX3TqklMU
	A5EK36AyK7wFdPSoclIHgovU9GP4V2A=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-Jy89RdIuOd2N2UgpPs6t_A-1; Wed,
 24 Jun 2026 07:14:55 -0400
X-MC-Unique: Jy89RdIuOd2N2UgpPs6t_A-1
X-Mimecast-MFC-AGG-ID: Jy89RdIuOd2N2UgpPs6t_A_1782299694
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF4FC18052C4;
	Wed, 24 Jun 2026 11:14:53 +0000 (UTC)
Received: from localhost (unknown [10.22.88.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5328D1800361;
	Wed, 24 Jun 2026 11:14:53 +0000 (UTC)
Date: Wed, 24 Jun 2026 08:14:51 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <aju8K3aPXCWr7v7z@redhat.com>
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624064944.Lt3vOksN@linutronix.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Wed, Jun 24, 2026 at 08:49:44AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-06-22 13:11:59 [-0300], Luis Claudio R. Goncalves wrote:
> > Hello!
> > 
> > The question is simple:
> > 
> >    Should we have somebody maintaining the OOT RT patches for v12.x and v18.x,
> >    the LTS versions that already have PREEMPT_RT in-tree?
> > 
> > As we still have a few OOT patches, after a while, people using PREEMPT_RT on
> > those versions may encounter conflicts trying to apply the old patches. And
> > as those patches are not in-tree, the fixes won't probably be routed via
> > Stable.
> 
> For 6.18, we have:
> - 8250 console
> - i915
> - arm-32
> - powerpc
> 
> For 6.12, we have additionally
> - ktimers thread
> - the whole lazy-preempt

I need to correct myself here, our local hero Daniel Wagner is maintaining
the v6.12-rt version. Sorry for that :)

Sebastian, just to make sure I understood your answer, then we don't need
to keep the OOT patches up-to-date for v6.18-rt specifically? My question
came from comments raised on the last two RT maintainers meetings and the
LF RT Board meeting. I just want to have a good answer if somebody else
asks about that. And to volunteer if work is needed.

Best,
Luis
 
> So for v6.12 there are bits outstanding which can impact you.
> For v6.18 if you are on arm64 then the mainline version is slightly
> better than on x86 because on arm64 you might be using the pl011 UART
> which has nbcon support since v6.15 while on x86 you almost always have
> the 8250 which is not yet with nbcon support in-tree.
> 
> These are the missing bits. None of them are essential. If you on x86
> and your kernel crashes, it is more likely to see a backtrace with nbcon
> driver than without it.
> 
> > Best regards,
> > Luis
> 
> Sebastian
> 
---end quoted text---

