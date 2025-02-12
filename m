Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD4F25C709
	for <stable-rt@vger.kernel.org>; Wed, 12 Feb 2025 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739383208; cv=none; b=lpQFSyVi03LC8Sa2TKcV4eSB+B5d5crWlta49yXxFNBRqEVEBYWRB4iaH2VCVDdvTwdqeOnKBhGOItnTUN9gcoDh6icWD0HNa/lduaDJWSoSjITh81mDQB24Z+I0Z1fUNx1al0dP3Opc8SAO9/P1XMqOPivTfm2KkMkr7+QkJvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739383208; c=relaxed/simple;
	bh=doZujOukE1DyZJnHcvr4klvWOJqMYmRJg/pI75v7sOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vB4B2nJ1jkhe+60dE/9/zbPPPjwVY1q7LX2u4ViBAtPFXxLgFFWYU6p28D1D8mlBxrimGErvl+CrwIfVLquCtt9kbiabex3giuCspFMnUJrYDPm8RcVP55Dwm0uaxn4Rk8Zlt8jkkD+wGkLn/PqQ8jktg9cAtWo0fDT7ruoRDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3hxXQ6h0; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3hxXQ6h0"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f8c280472so180085ad.1
        for <stable-rt@vger.kernel.org>; Wed, 12 Feb 2025 10:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739383206; x=1739988006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Fp16qTOknzk8Ci8vytjHzq+U+zw1AGZXtmb1bjqgP0=;
        b=3hxXQ6h0fOWgF/tv0ithMG0qU/E5YesJi9U9Gj3mpRiWuzY6Qg1/iOenD7C2hFjCl+
         Lf0FfbF67pTPGMgTkzrbsV996b0yc9s9Swe5hqNszL/FF7+vIYkXpuDK2PvAFUUGL3Uz
         RxbYMaAKaEhJ4WNU11Hs4XMJVPVes6RhEkNAMWMPUN/C0habPwcnCNNTUHUunoSN0DJZ
         pf9tcl62C/4lt13hpuivo5Rswm8q97amawz5NVa5MsUZCY/LnhqhO7/F0w0UopD2aif/
         ASGNUQKR3FUFKYvF3K+oX+UrncA48hSrjqNkBXU5vvoJaIF9UlIxyGfuns5bUjSAq5gw
         NXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739383206; x=1739988006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Fp16qTOknzk8Ci8vytjHzq+U+zw1AGZXtmb1bjqgP0=;
        b=ZjWz1eunIE7ma8kJMT6VwKMNbpq3dYpNkvdkCegmq+cP8l8OBqYpBKKXfsEyWZxk/1
         FsuZoAEQ8ZDr4gzDyJRQuFasgGRA7tOIjksFozqwVVh5Xnrs15leOgnp2U/JXFR5Tvip
         v8F7BRUqiTskaoX9m9gE5SKciBGuOLkxy1Y72vu+CInaz4Q1x7V2ZX/BWPlRvLQzRuYH
         r6A7XQxWQuPpSXujhMDMQWpemScshgCMvGMNvZXh9egHAUcX/NKD3iI67WH7aMMv4+Yd
         GErK6MO7IxoOr06oPARwr8LVB6CXB3Kin3g0FREacyel3eh4AhyewFHL6nsWjS7QTCj+
         niKw==
X-Forwarded-Encrypted: i=1; AJvYcCUuEa0oVZLm/akzV+nfFzui4R9P2A/3XpJsJe4tUURUzWQX4PuIB7xCqzNbFwZuAHK7us178ylqbqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKiX2y2tQa+CFOKrOqwJJaRHuENUkuz31JdgyF+7R8KETUejYL
	mgvQgecLgkdcIlM7w2D683JTWm7FZD9DgiJ4vCvM04xxvYvF9GrxwFTe1RsFq0R930nxKdv8Xam
	xvrIODkpvZG7QsZ9mDifGEtDDQ3z1My2RAJ3G6NdObCnFdoFk8sAs
X-Gm-Gg: ASbGncssD82NAj3wIzL16HXSFYWECgqXorsYGREKCR+vQj34ouv7LJReaIzGSzrljVI
	CW4ELz2yNRbogZddMhQkhtsNux+6BNaoyWMbMOy81rybMeb0EE83FXYQ6yPmxV24cGO754+9vth
	gswXTtp5iYYiDawKJDPrcR0TgFcrALCqg=
X-Google-Smtp-Source: AGHT+IGSHIXEG8Oo7g2j+uhztymqZqCIa8ogNEhnrV68BmF7ckJcHll6C4PFjbf4a8Afz/FVZ9TfqEgoEqm0t7WgYCQ=
X-Received: by 2002:a17:902:7006:b0:216:405e:8e2 with SMTP id
 d9443c01a7336-220bf324555mr2643535ad.27.1739383204660; Wed, 12 Feb 2025
 10:00:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211090511.xeFJVnH_@linutronix.de> <CABXOdTeLUi8mKkV38SegM_n8=Uyykd-X+n7RysjpgAZfxxb5BQ@mail.gmail.com>
 <CAK18DXYjsLNS+Hm2qW3COF4_gChPNLwtP1yViY32b+xPkmOapA@mail.gmail.com>
In-Reply-To: <CAK18DXYjsLNS+Hm2qW3COF4_gChPNLwtP1yViY32b+xPkmOapA@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 12 Feb 2025 09:59:53 -0800
X-Gm-Features: AWEUYZn3F_He5ptlBAkWl0fezYHXbo3-XSKubRaoBfPOTAdyS80r2n433ulDYYM
Message-ID: <CABXOdTe3Tp6SfuhoO1ZChsArszkK9d=iBsLZ+gmM7iLT+RYb6g@mail.gmail.com>
Subject: Re: PREEMPT_RT testing on kernelci
To: Donald Zickus <dzickus@redhat.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, kernelci@lists.linux.dev, 
	linux-rt-devel@lists.linux.dev, stable-rt@vger.kernel.org, 
	Daniel Wagner <wagi@monom.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 9:18=E2=80=AFAM Donald Zickus <dzickus@redhat.com> =
wrote:
>
> On Tue, Feb 11, 2025 at 10:43=E2=80=AFAM Guenter Roeck <groeck@google.com=
> wrote:
> >
> > On Tue, Feb 11, 2025 at 1:05=E2=80=AFAM Sebastian Andrzej Siewior
> > <bigeasy@linutronix.de> wrote:
> > >
> > > Hi,
> > >
> > > I remember Daniel Wagner has been asking to include PREEMPT_RT within
> > > kernelci. I don't really know what the status here is. Thank you for =
the
> > > work.
> > >
> > > Since PREEMPT_RT is now available upstream, would it work to compile =
and
> > > enable some of its tests for the supported architectures on Linus' tr=
ee
> > > and maybe the -next tree? I don't think that happens at the moment, I
> > > saw only a few stable-rt trees.
> > >
> > > If so, should I just open an issue at
> > >         https://github.com/kernelci/kernelci-core/issues/new
> > >
> > > Is there be anything in particular you need help with?
> > >
> >
> > Unrelated to KernelCI - how stable is PREEMPT_RT in practice ? Reason
> > for asking is that I enabled it for x86_64 together with lock
> > debugging and got an almost immediate "sleeping function called"
> > backtrace.
>
> Red Hat has been selling a kernel-rt product for almost a decade now.
> It should be fairly stable.  We also enable lock debugging on our
> debug version of kernel-rt and I don't recall anyone seeing anything
> (though those debug kernels are slow).  We may not have the same
> config options set and haven't seen it yet.  Stacktrace?
>

Two so far.

https://lore.kernel.org/linux-rt-devel/760e34f9-6034-40e0-82a5-ee9becd24438=
@roeck-us.net/
https://lore.kernel.org/linux-rt-devel/d9480845-7e81-46a2-8bbd-bd0ebdbc6a5f=
@roeck-us.net/

Guenter
