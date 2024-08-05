Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6583F9D5
	for <stable-rt@vger.kernel.org>; Mon,  5 Aug 2024 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722870598; cv=none; b=tV+AY/Af2tR9jLwUEAdPDp7EvR8GidT8cfyzQNuylV8723WnmMDLIdmvnDM43EXsfgOhIMO1ubS5i9GevCKBWWiQbQQo1pSZ0QUMRHpT19AHGbrwaQ7SOE1ttIOwAj89UagR+p/lYx+e+d7E8g2JdgiS10nN6V6tfDiBEiS+hlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722870598; c=relaxed/simple;
	bh=X7I8N9YxYJTYo+/Aknj1/PvxHb9c7iAd4yc/efkIQxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfJz/p2KvCgVB7yFgwAd2h3HB/8xEOtS/IqzAChmQdnSDkZU4BNQ/iawhP2wdMDT4LTW/bHP8tpDfEuTF3CxLx5rz72XucLG82m3sDHxRLLHfN83fyI9ph4Zr5LMYzuKjGUKvlvGHZpkvhPpds35MJuacu0fofOY2CH544TEiag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SsSPOsBR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SsSPOsBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722870595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5EssBojX1YphE+Zsr3gqg0WwGRqanvomvZM5WNxOvLs=;
	b=SsSPOsBRTv9Z4NpMgM/avzrdZfFkMImE0oaFnfo9QDb7JXadvJEtICB7RcJpUmrxnUpqXI
	tYbtFn24iPp23r6y0Jv1sOnMOmGNk3ajHw37WrEmFyRIiToOD6ARl8EaoD3G9Vvve5Xtbz
	4XzI2bU95sZzi40XiMd4d1SJfRN6U9Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-odpgjg-aPFWr72JMlQVeAg-1; Mon, 05 Aug 2024 11:09:54 -0400
X-MC-Unique: odpgjg-aPFWr72JMlQVeAg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-36865706f5eso5694063f8f.0
        for <stable-rt@vger.kernel.org>; Mon, 05 Aug 2024 08:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722870593; x=1723475393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EssBojX1YphE+Zsr3gqg0WwGRqanvomvZM5WNxOvLs=;
        b=qPjY5S0UHiGUBpq5UFCHQ9F1kecG4NlmFQSk6e8I15GPmAOTghwfEKHQrxwYn1myfi
         K1ZPfA1CCBVXA+nsl1rye+2ufC61phSnWSXEROePVHnTyFhB0ps0EGjD3CdJqhdJE8Ti
         s+xK5Eh3uBlt9BhFx8yyF9cQjDoU+gc+Vg9aFRBazUXmzRQhlzCWiABOFNEkNPsJNilv
         UtBqUoZrybiFzPy0/0gfsL2E8VU5qepgKcjU2rDDITYPyDjFthXDa1l+d35xELCl7QFS
         iJAyqxuBXMNH/eronbTgO4pV9pjVc8DICo5Raed2Js+nQd5kNmxpdDfB0YQVRlddE8ws
         zu1A==
X-Gm-Message-State: AOJu0Yz8+7jnokCtgpzM4ikswl6XUxSXbGMKUc3N9xsnldnGlv+t+oHE
	f12ARTyU8crMif3SccwjdrLvjbdma7vdPhyyYMGSbizJpbVR6qME9KnWCgNksmmXAGvc2Ca86Yk
	6Wl4tPMQpn1lOMOkJjCs0vXogCySiVrar50kogd/dakPlYOqnLDUdiqwsh1ppqG9B5e3ObZDI72
	78mCjPSdUZkVcQ0+Dca3T7LN+etGsxbWOi
X-Received: by 2002:a5d:6d83:0:b0:368:6633:c550 with SMTP id ffacd0b85a97d-36bbc17c691mr9498808f8f.52.1722870592999;
        Mon, 05 Aug 2024 08:09:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWlSBYlFTrdRHHuo90fM7qam7aFvZ+yUOEduEzbsYmb6OKQZx6J/fMtH7mbGahCZ97PV9OhWlCs4wMBxYvYxU=
X-Received: by 2002:a5d:6d83:0:b0:368:6633:c550 with SMTP id
 ffacd0b85a97d-36bbc17c691mr9498755f8f.52.1722870591908; Mon, 05 Aug 2024
 08:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMLffL9t0SFkO90d6pFZAwp-WVbont7NgELx_WW-GRRYkF_QXA@mail.gmail.com>
 <2024080344-division-undertook-4905@gregkh> <20240805105834.9GZL-G9o@linutronix.de>
 <20240805110000.ga17k3zy@linutronix.de>
In-Reply-To: <20240805110000.ga17k3zy@linutronix.de>
From: Clark Williams <williams@redhat.com>
Date: Mon, 5 Aug 2024 15:09:40 +0000
Message-ID: <CAMLffL-owgU9aeNiBQjDDe8BUyH5L09746qHMHTZ7UbHD1+Ckw@mail.gmail.com>
Subject: Re: CI build failure in v6.6-rt
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: stable-rt <stable-rt@vger.kernel.org>, "Claudio R., Luis" <lgoncalv@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I missed that we had changed the return value for
check_unaligned_access(). I'll apply this to the next stable update.

Clark

On Mon, Aug 5, 2024 at 11:00=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2024-08-05 12:58:36 [+0200], To Kroah-Hartman, Greg wrote:
> > I'm sorry. I misunderstood Clark and assumed this is a stable issue. No=
w
> > that I have the needed pointers, it is a RT-stable issue only.
> > I'm going to drop the stable folks from Cc: and reply with a patch.
> >
>
> Clark, this one, please:
>
> ----->8------
>
> From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Date: Mon, 5 Aug 2024 12:38:59 +0200
> Subject: [PATCH] riscv: Add return value to check_unaligned_access().
>
> The stable backport of commit c20d36cc2a207 ("riscv: don't probe
> unaligned access speed if already done") added a `return' stament to
> check_unaligned_access(). The return value of the function is `void' but
> the RT tree has the backport of commit 73cf6167ef44c ("RISC-V: Probe
> misaligned access speed in parallel") which changes the return type to
> `int'.
>
> Make the return statement return 0.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index dd118773e717b..347cdf56f3a15 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -588,7 +588,7 @@ static int check_unaligned_access(void *param)
>
>         /* We are already set since the last check */
>         if (per_cpu(misaligned_access_speed, cpu) !=3D RISCV_HWPROBE_MISA=
LIGNED_UNKNOWN)
> -               return;
> +               return 0;
>
>         /* Make an unaligned destination buffer. */
>         dst =3D (void *)((unsigned long)page_address(page) | 0x1);
> --
> 2.45.2
>
> Sebastian
>

