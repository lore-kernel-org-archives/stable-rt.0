Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AEC1F55ED
	for <stable-rt@vger.kernel.org>; Tue, 11 Feb 2025 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288053; cv=none; b=d7ac5e70dML+yX2kDE+oDA6xtr9SHRMb9BC/nK5kptC/G2cXYUkMDdNx0fKThzk++/J+MF7Cgs5uUavqx8C2TqkQDVwULzbLAwRTgBKK5l6//ZCfcDCFXPwVEbyPai/Bg8p2cPcEPyX+IbNQ6FIYbWhyHJiBo2t0gYJ+DyMrQ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288053; c=relaxed/simple;
	bh=c4U0BQoGEDqvwQiEJG/iNEafKJ/9ljNNGuWV+PcZbfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OusLOBrhRXYKm5mbLO16qCmtfS6msUM7vXMxyfmNx4WrNM3IXx7OQgHZS0aqRzB5h+K/ULOxXqs5ot7lpCtUr8kCUcLPEiV+xzYGlwGZoCcfM96E7/OhewZOHIoqMLRAou12fOfxuWHudtjUAtpdg4YWqjyQ80FdUSioK3Zgy1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KOn7aDMY; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KOn7aDMY"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de636e6937so10052a12.0
        for <stable-rt@vger.kernel.org>; Tue, 11 Feb 2025 07:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739288050; x=1739892850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbL9eQa2NHquqUeuZMpqgcfigc8NbXhYu6ZhdCUgNRA=;
        b=KOn7aDMY7T4u5U38NV316zkHtRSk2MZCCPxUvzZb/GepEpnVOwP83v8Gks2RQ5rkN4
         EfJoy8aiJHLGAxPc8um6fDVzPU3XlgSaduM1isW6R4keot4IjNMaCjGtFlZL85RbKrB5
         vO28gUVQDSAnJBLQruexj9Gaa9TnW0qiWYAeqf3KtDiATkMeIRhe2L7zZioCQgE7bI2E
         C9AlfOEpULhT6T/NRojnY6e86A6AAnnni0tkjPWlwpUuPXj2k1gpwl0jl7PxsxbL+YEx
         Pzjd/d1N6bBZquNqCX6i475TmH1rLAZcz7USIrBtC1OIWTPniUeXA8DIUZbrZ2vw0hCM
         FP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288050; x=1739892850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbL9eQa2NHquqUeuZMpqgcfigc8NbXhYu6ZhdCUgNRA=;
        b=Rf90iQGLiHymIAEYEZhRJI/pIP5OLVlsAh1cM29vXQfR5TqzRBTmQfxjs0Xw7IoqXB
         F7WoyrK3+yI0clUAeby8DoUi4ESGihOfoWS7iZwX1PaMXMgqUr1vJqyQTSdN5ho7Fo0n
         MoOB9yZlhZc4txn+Kwd6g6/G8La9er1dC2nX3lqptUWJiRrn//bncDbAoraT0p+AwnSW
         1/xTkpdICoKARsG+cVRlYolOs6wwSRZrrs8OXtYP1Yai1QsL+WdMnIMix9ODleJDCmne
         DThrSVnVjjV0KmElLRnxlz9Hx7xE44TnD0Tbmy3CIpJm4CmKqyXbxjP5UCb9xIAQym65
         oraA==
X-Forwarded-Encrypted: i=1; AJvYcCVo52zcnFMdXWXNnDS1ZXQ2We0EbTbsUzlg4j6cM1L8zcV1Nz/5AKbw5N1YasJvzX1rhCjFua5vbjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5bcYOk/hOjhIpdTluxSWXcf/SUkeCzk2XPaYyin4Htg/bRTGv
	t284m7gdR6hqmKEj3x17lrIWXRHKSqAZIbHyLs+3zAAUCo8UAtSIqoYKx0WkZRHHR66puNENWfw
	udb9aj2BG9AetMySNVssclha+lpKfU5th4WgK
X-Gm-Gg: ASbGncsJFJqRqJBnpVtb8xm8y06OQSDZrhbUjZOf5GfTPSSfpWiwByHz4n8WUvwuCE4
	x0vxoYs5wCvXEe4J5CcMOk9c8ksUREjwvOcvJ+ENwOl6qnFSNqo1DZ0R/oxTzw3SoQAyvA7RWzy
	TTa2dC1+ivMf1/dO/rf9eY/ebijCQ3Ays=
X-Google-Smtp-Source: AGHT+IHqGDGz0wfrcp45JtErtpRAYfNh1EE57PPR06fLJQNwhTHl/SAaKNWTZ8LVn4rijthtDnq+ZrEwVKQjctxaREg=
X-Received: by 2002:a50:aa93:0:b0:5dc:d08e:e128 with SMTP id
 4fb4d7f45d1cf-5dea05e7838mr88792a12.5.1739288049612; Tue, 11 Feb 2025
 07:34:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211090511.xeFJVnH_@linutronix.de>
In-Reply-To: <20250211090511.xeFJVnH_@linutronix.de>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 11 Feb 2025 07:33:57 -0800
X-Gm-Features: AWEUYZlq96aEBCvQeCZ-nHsg7o-TOaHeFPxTcHp9j8eLA7B3lgOzEs9a9524BPo
Message-ID: <CABXOdTeLUi8mKkV38SegM_n8=Uyykd-X+n7RysjpgAZfxxb5BQ@mail.gmail.com>
Subject: Re: PREEMPT_RT testing on kernelci
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernelci@lists.linux.dev, linux-rt-devel@lists.linux.dev, 
	stable-rt@vger.kernel.org, Daniel Wagner <wagi@monom.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 1:05=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> Hi,
>
> I remember Daniel Wagner has been asking to include PREEMPT_RT within
> kernelci. I don't really know what the status here is. Thank you for the
> work.
>
> Since PREEMPT_RT is now available upstream, would it work to compile and
> enable some of its tests for the supported architectures on Linus' tree
> and maybe the -next tree? I don't think that happens at the moment, I
> saw only a few stable-rt trees.
>
> If so, should I just open an issue at
>         https://github.com/kernelci/kernelci-core/issues/new
>
> Is there be anything in particular you need help with?
>

Unrelated to KernelCI - how stable is PREEMPT_RT in practice ? Reason
for asking is that I enabled it for x86_64 together with lock
debugging and got an almost immediate "sleeping function called"
backtrace.

Thanks,
Guenter
