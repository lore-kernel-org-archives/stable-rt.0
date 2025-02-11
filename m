Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1173F253B4C
	for <stable-rt@vger.kernel.org>; Tue, 11 Feb 2025 15:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288994; cv=none; b=l0ylU8N9GmpjhatwfCbofENmvgHgoULeB3tl5JLSj5WDZ3F4d2YQVjlbGn4p7emOpdPv1SwP0NmPTeX/mtEe9NFm2wBeT3qERbeBRAns8BvbpbLaJ87IC2MD2IWMpoDwxZL3/e1+URqFeRPt39rBIvQoa2jKwaHINlqjl5qpNEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288994; c=relaxed/simple;
	bh=9kgt4DsYnmqFCPg4peB6p4/cEoV7Wc11pP7aFn7Ru+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbRP1vLHuh2fOfoo0UMtHoP4PHc4bbSGK2g2N4OPiOijfuq8Kb5VPFcv/KpSHmSQ09Lc5VvynA3TVWMUbdSuodyDlwO3yQplYfpg5OrWxhVWxIZYaIbVKGsefRfDzWgd4otbsV72OUmu5+aI0l+9UdglweetDk8vIe+Zfk2u81g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4DjAJL0P; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4DjAJL0P"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so10883a12.0
        for <stable-rt@vger.kernel.org>; Tue, 11 Feb 2025 07:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739288991; x=1739893791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kgt4DsYnmqFCPg4peB6p4/cEoV7Wc11pP7aFn7Ru+s=;
        b=4DjAJL0POzcBLLqP6yIeNA7VyS/QXfOpYMBJGFG8j1OwDPP+z1eDjjYF9N+lMcY6gq
         xc/zYQe8Z+x2fO8/iVgPzusqEjgRf0wpMP+sry2ol1dc/rL9ik3Bnzqz3+PJhBAIXO8C
         cx0+GJY2GPinCBX32/ybsETWUjy4WKWnyRKsRjFsbPCwRmNrL0uImDGcE/WF/7ZzxfhT
         XA/zU1PYc3GPp38BLvfQObdXaTym9Rk9Ead9A6p4Y1O/WIEaNH84CA9dWwuuJBncv6lH
         jK/Eei6UNza43rMd/j7Mnce0cSIZuaXpNKkLtFivQU/jf+Ti9dyZwbB+r5mTe5Y2wcOj
         nxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288991; x=1739893791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kgt4DsYnmqFCPg4peB6p4/cEoV7Wc11pP7aFn7Ru+s=;
        b=jIndvewPWdy87ZytsNtOj7z+7/gPxFrHDVDsnnR2p62wd6or2sxyHx8o3fk3v5G9sp
         IKyDBIGQ/M4VGi5sJzmlV3BFDPO2qbVf86MTPasjXcdpRLSvgUACr7rkiPrhYvNvzXaS
         oECjPVYJxhPieqlpgMuwM4Gdml1i/+mPv7uMPAE1cExCTpr4h9NNSgO7JAhAnfqMgCre
         Wlzb+ntYAnjbQmnv7iniQbp7ClSBgkAZ3jOKobYzRxiVs8KeXt4iaW9s4Hb3g5jwfnDB
         VhDdZbB9SGC5naIy6sr9M3+F3OX+bs+qoUxwfsZT8okDOqoqPkGQEfNABFOusENAKYuL
         GHtw==
X-Forwarded-Encrypted: i=1; AJvYcCXekSlMnaK/pOAU+AOg9Hotxzu/gDToTescfTV9La73H5nHUwUc2rAD5172zRhnvD2IvugISU7PcJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWQfH1YuQYzMUFCuiDak+yuixenWF7uqSJXhZUe0JanU0Um4M
	n7qakxjvspTbG3+Hy/s74iGbfiEc/lTb1XNx/5rM7ThRXowkuR1sYSz0LYBARMCMgX0ukK/0Fx1
	Pnhr4ZxHcaMWGcs0bI0I9pajjFFcCSSOqaZZV5/n3ngybJ9bj0A==
X-Gm-Gg: ASbGnctTHJZjV2xUGNh4DqzC9045OkJuB6VwKC6d9OZa60B0LJHpjy1bWjJMzcxX76+
	YZ569yYJmCuoteen6hPgFVHM4D4q6e439WIGsZmlf6/543UhS+SKhy8mYLbGj+M9qVRoFUvvibw
	MLggaR7bFLcdAhVGY6fnnWoTgryH1mSBI=
X-Google-Smtp-Source: AGHT+IE4Fxxf+5z69pFOeL1vlS+GzV7UVLD5EIil0y2c6civPDnAyqFQUMiM+rBmwqzz2VihxIer5GQ59MHN5QmVrIQ=
X-Received: by 2002:a50:9314:0:b0:5db:e72d:b084 with SMTP id
 4fb4d7f45d1cf-5de9cce8feemr101816a12.0.1739288991143; Tue, 11 Feb 2025
 07:49:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211090511.xeFJVnH_@linutronix.de> <CABXOdTeLUi8mKkV38SegM_n8=Uyykd-X+n7RysjpgAZfxxb5BQ@mail.gmail.com>
 <20250211153759.5sSPp1PI@linutronix.de>
In-Reply-To: <20250211153759.5sSPp1PI@linutronix.de>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 11 Feb 2025 07:49:40 -0800
X-Gm-Features: AWEUYZlEqu__1t_B87cyFxYGHoCRQ18AdYIcVNJRtnSUfqO1snO9huHuOzykOU4
Message-ID: <CABXOdTdgKPZEOWRE11V7XRpRwgAL5bav_X+ibGbYyJwj1EnLsQ@mail.gmail.com>
Subject: Re: PREEMPT_RT testing on kernelci
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernelci@lists.linux.dev, linux-rt-devel@lists.linux.dev, 
	stable-rt@vger.kernel.org, Daniel Wagner <wagi@monom.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 7:38=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2025-02-11 07:33:57 [-0800], Guenter Roeck wrote:
> > Unrelated to KernelCI - how stable is PREEMPT_RT in practice ? Reason
> > for asking is that I enabled it for x86_64 together with lock
> > debugging and got an almost immediate "sleeping function called"
> > backtrace.
>
> If I would have seen it I would have acted. My guess is that this is
> something not a lot of people observed.
>

I suspect that not many run the code with lock debugging enabled. I'll
send you the backtrace separately.

Guenter

> > Thanks,
> > Guenter
>
> Sebastian
