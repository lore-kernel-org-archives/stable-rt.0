Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56A20F079
	for <stable-rt@vger.kernel.org>; Wed, 12 Feb 2025 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380692; cv=none; b=L/5SQYt1DoCL0fi3rWVYtaMH/K9Eajl1ZPBCCt0NVyMmBweLx8lrN/yz2Z8AIxGy6iM9Msx+ZIhCEhYwDeVSaGTxVdy5X/9vfYqrO0E3G/kFiAmfPZK92MvQef+RCDXs6Rn1MrRpwyUNeFzZbwr/dHLAQEW3U7z3ZlcqfXBc2TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380692; c=relaxed/simple;
	bh=E6V3ktEebwSlI2OpSCn820nCr2t0SYwR+etcpticThE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJQk6sTNrPrp8TdZV/pSGMR81kyFUN6LbwDE0pFuzxJyWPoLWsuy5YxmZqt6jMglQsAZPsN7axm9Lkc7LQv2ZgmO5AcUye1aC5XUN2C6g8RyH6A8xOKJ4hvG/3BRxfi8cPLvlA0PpNZz+YWycBbxomECPYyCE8rXuzXMIXzYJKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLqMOAuX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLqMOAuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739380689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTfc47a39PqxjnScnMsX8C0/EadmIM8SFWHp+lTEE0Y=;
	b=PLqMOAuX245CGSfFal6fzMw8+QRxDhokTLQwiVPwCvXJZJsHKLKQGboRCjxqJ+rYJvLEGE
	R02dI0AmezEww/BHPdzTUt7wOHVAmlMtl+L5PyRRlM6ntnCBTOEGzOoRyCzhQZCQyxzZCY
	e4QAqTOPVcZ00gMzs9G9fYkKkX3admY=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-OV0oNPkvM0uDyypZIRGs0g-1; Wed, 12 Feb 2025 12:18:08 -0500
X-MC-Unique: OV0oNPkvM0uDyypZIRGs0g-1
X-Mimecast-MFC-AGG-ID: OV0oNPkvM0uDyypZIRGs0g
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e5742f52896so10129639276.3
        for <stable-rt@vger.kernel.org>; Wed, 12 Feb 2025 09:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380687; x=1739985487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTfc47a39PqxjnScnMsX8C0/EadmIM8SFWHp+lTEE0Y=;
        b=C0uJ/qHU/5Gw0KxVmI6rwiKX3ArOctGvrj09rw7mjyXBUo/TPItJZCkrSsC9OqKx+7
         DYdH0qNrJoiiMh6K7DlxyGFTOXeLGYw7pVzXnbbtnOYzMFk+1AIQH2U/pi+FKPh6K79a
         RmvhK6fnFW8mo793ax1cTRE4k5ViNeGr6mg5Gf+HKT9aKTx+gFwovEM4g2t+RX/BCzY1
         5A9/6+kjB7cRw3YPelEWJWyoA6tnlShkcl59lecSqK7Bu4/8mmnsRQLkwIq6CC5oLcNR
         2XhbKzC8h2PlrMF/giipEhQh9FKD6uwZLdls3AXNSInNlJnVtD6UpdfKdmKj9mU3b8Sw
         pGCg==
X-Forwarded-Encrypted: i=1; AJvYcCUk+MDnVs3LqHjVEXrcP0i6EzB7l9KR5JXbRYPjpOuaA0iBpV0CpmAokQ5HlJ1L0O9k7N/WK5gKOt8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8pn/V7p4WVoJlDSaIp2QQP+YNeDzglRqA6h/VpCN5MEnW5Uzb
	EZZR4j+3m4KrGn7CZc7+3Kpnjo38HPX2lsFtAUNcDDHScEX1gxrs/8rEdasEpA8+E7+R7VOGmL9
	Ir7mK6uykqdPfs5deKjRw7xR4ckWkW+pXiuNBcbhsOmKyIxcn41rqvy7Xu4Pe1Bfzvf2GQDgNOI
	NNcHoAcBD1VaTIDOLoLzKr9lNQELU56VD/
X-Gm-Gg: ASbGncshKKMlbTIrspeYhup9gao/m2JxuFcxXIqOGJUCXkaewBEt250hlxtUHgmgdp4
	xJRcxpcz51EpDZ9uVg3UGLGO+CuBJr3lauu1lWTLPy6PpxAaB6QXjrMXbpaGy3Wg=
X-Received: by 2002:a05:6902:154f:b0:e58:835:a7b0 with SMTP id 3f1490d57ef6-e5da02a4f6bmr3247566276.37.1739380687203;
        Wed, 12 Feb 2025 09:18:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbcERdLFsmV+t17LaOEBVplV+A8dPg7iawzUSS4hQ8DXBwoLV8Iidd0fJd8KWBkejyYFVdkPWSIEhX+wMQzw4=
X-Received: by 2002:a05:6902:154f:b0:e58:835:a7b0 with SMTP id
 3f1490d57ef6-e5da02a4f6bmr3247531276.37.1739380686797; Wed, 12 Feb 2025
 09:18:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211090511.xeFJVnH_@linutronix.de> <CABXOdTeLUi8mKkV38SegM_n8=Uyykd-X+n7RysjpgAZfxxb5BQ@mail.gmail.com>
In-Reply-To: <CABXOdTeLUi8mKkV38SegM_n8=Uyykd-X+n7RysjpgAZfxxb5BQ@mail.gmail.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Wed, 12 Feb 2025 12:17:55 -0500
X-Gm-Features: AWEUYZlcXv-LP2ufUcwWauxbM15m0TCVbCYsswBmEDrEIUobFHZOQuZFboYNhn8
Message-ID: <CAK18DXYjsLNS+Hm2qW3COF4_gChPNLwtP1yViY32b+xPkmOapA@mail.gmail.com>
Subject: Re: PREEMPT_RT testing on kernelci
To: Guenter Roeck <groeck@google.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, kernelci@lists.linux.dev, 
	linux-rt-devel@lists.linux.dev, stable-rt@vger.kernel.org, 
	Daniel Wagner <wagi@monom.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 10:43=E2=80=AFAM Guenter Roeck <groeck@google.com> =
wrote:
>
> On Tue, Feb 11, 2025 at 1:05=E2=80=AFAM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> >
> > Hi,
> >
> > I remember Daniel Wagner has been asking to include PREEMPT_RT within
> > kernelci. I don't really know what the status here is. Thank you for th=
e
> > work.
> >
> > Since PREEMPT_RT is now available upstream, would it work to compile an=
d
> > enable some of its tests for the supported architectures on Linus' tree
> > and maybe the -next tree? I don't think that happens at the moment, I
> > saw only a few stable-rt trees.
> >
> > If so, should I just open an issue at
> >         https://github.com/kernelci/kernelci-core/issues/new
> >
> > Is there be anything in particular you need help with?
> >
>
> Unrelated to KernelCI - how stable is PREEMPT_RT in practice ? Reason
> for asking is that I enabled it for x86_64 together with lock
> debugging and got an almost immediate "sleeping function called"
> backtrace.

Red Hat has been selling a kernel-rt product for almost a decade now.
It should be fairly stable.  We also enable lock debugging on our
debug version of kernel-rt and I don't recall anyone seeing anything
(though those debug kernels are slow).  We may not have the same
config options set and haven't seen it yet.  Stacktrace?

Cheers,
Don

>
> Thanks,
> Guenter
>

