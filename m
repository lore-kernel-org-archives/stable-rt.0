Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878A0176AD7
	for <stable-rt@vger.kernel.org>; Fri, 27 Sep 2024 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727471226; cv=none; b=LB2hLhgDv+RhUyl5cQuGx+6/cQhJqx3LjHwolPo377OluROJfWexkngGIMdlIQJ+HDNi3akrwk8Kw7umaC7E5xmvhus3UGbSpCvhpD/zHiYnVT5j/Fu8EOKjlwiYEfk+pKt6Vek0ywQku5k9Ou74D734BASo++vciGHr0oL3IOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727471226; c=relaxed/simple;
	bh=4Umuy3hRADabZ6+fuV9whTx08ccN0d7Gkpb6LYBRUcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca4sfQPCIg7Zcoej66eLiyb3KpCKCmym0wiwmtNNDfZsDPcY793yPevckfQ/xR18S34DaqMEAtbKkJZwNc35xhTagA3s/uo4wI+0+gIZa2tXadReyOYVTiahwFF+Yxid+lYuKLTQEDYfJSADrILpkWb/LWITNsGjkSLCdEvbBMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fxe43IK2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fxe43IK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727471223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Umuy3hRADabZ6+fuV9whTx08ccN0d7Gkpb6LYBRUcs=;
	b=fxe43IK2ZggDvg1H5t6pwhG9uF8H01Q9IddKxBl6x6mLHz+ek6TBs4h3OCdBxAutgJkRkD
	WFCxQNGAv19zH9NW4BQXV7YIUOSHN+/miltWMtFPUcK34iWIgjWkrW/x59MYhzSEb9s0V9
	aSHfJ32X1htMq1SJs//WfwC+RtKLd4s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-cg9XatZKNCy4nlYIOoSC0w-1; Fri, 27 Sep 2024 17:07:01 -0400
X-MC-Unique: cg9XatZKNCy4nlYIOoSC0w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37ccd7c3080so1159629f8f.3
        for <stable-rt@vger.kernel.org>; Fri, 27 Sep 2024 14:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727471220; x=1728076020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Umuy3hRADabZ6+fuV9whTx08ccN0d7Gkpb6LYBRUcs=;
        b=RGdaylZAwNSO+x74gm0KbkVZPKg3z9bkbdGXGftdACje3PhIt6aYqSKOgXMgTN7ZnQ
         hnT7JW5o5hnz7kEIxB0s5rgRTBWBf4XrY7/6e12uANf8dRLg6Ihu1ZFnESNCsv0LatcN
         Z44x0qb0TMs1vnoI3tmYi4ewFCDruwcTudGnsPb3BX1KXafJe3GI0EyF24vNbiZMYnib
         VJMpuxqEkdpr6NmTOxQbMA0/sDy4WlKOoiLVMY9yr6N4fg+vzFCi42tcupkWex+FN5lO
         3gRl58/twk71W3CFQzRZR3d6qQMvKu41QUYXsUf0cGMRrXw0/ThL4sa8lYHHSLa15TbN
         nQzA==
X-Gm-Message-State: AOJu0Yw2AornTitm74KfR/FUu9pRtDGwKdnS3M0lLbiwYvPpTZH3+Vm5
	+MV/KhtRna+Q15KFjmeMlR1F2KCZGZp3EiJPcKUVmCPhMGDu8DBr1EAOBlOZ2dQ5Z65WSJDTCtL
	gZ3ugTiTrVs1+JxgXlKdIB1NUCBzGYxwHc2i0aXlMpJgre7A8HGMmyn8Np0sA+XZAvers9WrjGb
	8cBflZrDuq0i78lZ5HZoQq2xKMKEEl7VX2
X-Received: by 2002:a5d:4212:0:b0:37c:cbd0:8d94 with SMTP id ffacd0b85a97d-37cd5b1252fmr2392962f8f.57.1727471220648;
        Fri, 27 Sep 2024 14:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSCbtsKGQs/V7LNSuimILh8+NkXK927m7f4tjvxhsHocAg9eAiAcnd1FenZX7Zq419Fe6YZHtUnPOr17znRYg=
X-Received: by 2002:a5d:4212:0:b0:37c:cbd0:8d94 with SMTP id
 ffacd0b85a97d-37cd5b1252fmr2392956f8f.57.1727471220318; Fri, 27 Sep 2024
 14:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927155656.Z-s6BO9B@linutronix.de>
In-Reply-To: <20240927155656.Z-s6BO9B@linutronix.de>
From: Clark Williams <williams@redhat.com>
Date: Fri, 27 Sep 2024 21:06:49 +0000
Message-ID: <CAMLffL-PTp+Y-rXsTFaC5cUJyMMiXk-Gjx59WiQvcTe46rXFrw@mail.gmail.com>
Subject: Re: Please backport: netfilter: nft_counter: Use u64_stats_t for statistic.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: stable-rt@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 3:57=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> Hi,
>
> please backport
>
> 4a1d3acd6ea86 ("netfilter: nft_counter: Use u64_stats_t for statistic.")
>
> https://git.kernel.org/torvalds/c/4a1d3acd6ea86
>
> Sebastian
>

Do you want backports to both v6.6-rt and v6.1-rt ?

