Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD401F3D4B
	for <stable-rt@vger.kernel.org>; Fri,  6 Dec 2024 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502625; cv=none; b=AuOQLDKbv+Z1mp4ZygdjMC3LA7gTljw1yf64q4w3xPC+94fmXQcsaQKF9BKOZWrJsQgbBgNlefUPOKCxdrS/EhOmvop1bxwk34YM409SMZ9+nSX/XKHoSGvhDyFVme+XVyBS655YkCicMFmWzmjBzhalSn+QXVOzwGX2r9Xe8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502625; c=relaxed/simple;
	bh=pQDcAemzbapVktoDIQ8F+y8f6yJAP7/ljBhUs7YNQa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEg0tSSnIm8YZG8ZfY5wbbhK/p6x+NN1lvx9O9pjenJR6vguuMq7WWGAlp/3HtkTku8DkapQtZ+o69RoCHbKi1nLKQyzDW677Km3OWYviD0mV1vj7IMjKW4SF68OSI4XoYorc+VV75WO8JDzJut7nPX1HAPmuub2mGPynC/dTt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D2a2T+12; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2a2T+12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733502622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hEOV8AIhBoB9AvDjHDWD9/oHVbE7APb5kRg3pvXByF4=;
	b=D2a2T+12/wwaBFgk+DdllOEDSGTsJmnzZAJNpPNkxi8Fo/srqIPs2ZwweQiWWazHp/52wl
	crQb4kWHWCAjI89Clu7vJvTbMNAdsj4aBI1xsHOokfTdwKp8Klq8yJQxHaUm/TEqfTEYQJ
	GBpqiAmIesNW5UEZSeu7lKvNRvXN7cg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-YjF1NcgRMk2nsQsz9qRA3g-1; Fri, 06 Dec 2024 11:30:19 -0500
X-MC-Unique: YjF1NcgRMk2nsQsz9qRA3g-1
X-Mimecast-MFC-AGG-ID: YjF1NcgRMk2nsQsz9qRA3g
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-381d0582ad3so1807294f8f.0
        for <stable-rt@vger.kernel.org>; Fri, 06 Dec 2024 08:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502618; x=1734107418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEOV8AIhBoB9AvDjHDWD9/oHVbE7APb5kRg3pvXByF4=;
        b=eARtDJZjZft6fU98uXA9Rtl1yQy1EVl7+NMgUUiDOpm0t60Y/mq54jUilxz9khRJ1e
         JY7lQXaBI1s03HV2Uck86BDbmD6VS5bMCMzhs7r6GF3huWVl2u2/5toHvoXlG+8xjcr4
         njvppGslB6sYrV1f1F+ez7LOoPggN8oikLnd5KoIoj9Rabe1kdgIiiKTdyRDksilVmCF
         w6VydZ6TWyO5c9cdgA2Qd3wMxSY7UT+WZy4cNazj/sh3vY+rzyOJQzzkK2s/vWbRnlbn
         33tlu3ZrnPivT290/19XUzInLkq0yxGiIiKGn7SN38opyZelHPSpHOSps0wN2ApKc4Ox
         R27w==
X-Forwarded-Encrypted: i=1; AJvYcCWd2s6zFmj/OrK57UDNdfJtxyOdubU1ULZ70R2o50zGVydFaqQm73jMzHGXcEOW/+DhFTY4pYaycos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb9y//AsvzBrYdvbiuNdUQsMzgjwVx/epxKz7pTZOnMX/iB9pW
	Vl2eUOURq/uP4EQTz3BqYfWIQlwCh0ESKl9T1oDIpETgKYcde7OUzWPYMXDtvNr1YEyvDvN5gsL
	kzwPNOAPlbFLHnL2wurLbQY41zhXCkrEBsdYsGr5nPllZRTGputVWYk34LMxMqaPfTPPf3KVAka
	5xGM120Q0C/wWUpluRtVQjKwEVNQ5UQgcL
X-Gm-Gg: ASbGncvdnUE0l/5pAPE2CGOIx+nY5+twrZCfPZQUbEhLxfzVNLS46rPQd4SPIv9c1rc
	DQ3KUDZEVQuZBAozcucEAXsNJIi7y4w==
X-Received: by 2002:a05:6000:707:b0:385:eb7c:5d0f with SMTP id ffacd0b85a97d-3862b36ace8mr3693661f8f.26.1733502618224;
        Fri, 06 Dec 2024 08:30:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnu5uzpkWjfcU4pdd5o/39FM3VzHRtGNeapFyBsxD9aw6AxhlBO3YvriAgO37aghT0D8M5/rerbo71B/wuZLk=
X-Received: by 2002:a05:6000:707:b0:385:eb7c:5d0f with SMTP id
 ffacd0b85a97d-3862b36ace8mr3693633f8f.26.1733502617936; Fri, 06 Dec 2024
 08:30:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203094009.67697-1-ende.tan@starfivetech.com>
 <20241203103611._nfkyEXJ@linutronix.de> <NTZPR01MB10187B77E803325E8C88F383F837A@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
 <20241205080614.y_512eFh@linutronix.de>
In-Reply-To: <20241205080614.y_512eFh@linutronix.de>
From: Clark Williams <williams@redhat.com>
Date: Fri, 6 Dec 2024 16:30:06 +0000
Message-ID: <CAMLffL8BPgObXvb4Ps2AkfQj=h62UJ_g_M9OYOkUsXhUZMzz=A@mail.gmail.com>
Subject: Re: RE: [RT,1/1] tty/serial/sifive: Make the locking RT aware
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: EnDe Tan <ende.tan@starfivetech.com>, stable-rt@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"linux-rt-users@vger.kernel.org" <linux-rt-users@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	"endeneer@gmail.com" <endeneer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes, I'll put it in my pending RC

On Thu, Dec 5, 2024 at 8:06=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2024-12-04 15:24:38 [+0000], EnDe Tan wrote:
> > > -----Original Message-----
> > > You need to state which kernel this needs to be applied to.
> > > The change you looking for is
> > >     32c694ec3efc2 ("serial: sifive: Use uart_prepare_sysrq_char() to
> > > handle sysrq.")
> >
> > Thanks for pointing this out, I overlooked the commit in the mainline k=
ernel.
> > BTW, the commit is not in v6.6.63-rt46-rebase.
>
> Indeed. Clark, could you please backport
>         32c694ec3efc2 serial: sifive: Use uart_prepare_sysrq_char() to ha=
ndle sysrq.
>
> for v6.6-RT?
>
> Sebastian
>

