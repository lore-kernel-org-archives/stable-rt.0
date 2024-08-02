Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36BA7A15B
	for <stable-rt@vger.kernel.org>; Fri,  2 Aug 2024 20:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722631632; cv=none; b=WfwKpN4hrEoXnYKJ3y7nnyN2x2G0bjEd+CjUU9rUQBBT/HNZ+MmGgZdDo5GdGLgxBWlTfzTfLXvqDf9CdzLaIO1TqX2uecGsEO1x3sPwkLGK4q/cXBRd1wmkKoxdcMgF5pInfNPg7z588V11c53H9CKw1Lv4kgCvn6+ne2Tkcdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722631632; c=relaxed/simple;
	bh=nOk48cFkjllDvibgzssjyX9TJxSU2CPtgkQ91y8in0M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W4INa/4Na5nO2vU/2KrYStURnpBDgtZ6WxIAjhX/XAcZ7mKw8IC/IZ9hnecNrcrKz7kTQOipic/KrgBFB8JLdJrYIstVUgo2u+kqSSUWyY0YfqQYu+s8DF939mdbRrn27RBdHWxXiEQNw+M8QBukDb5f4aqG676j3ao8H3p6pzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gD1zXcxb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gD1zXcxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722631629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=tXvK1vsGBENe1Z3UKUTgGBrRGiZzL2b18cCvo7uxGDQ=;
	b=gD1zXcxbSQoK64nWUZKihwF6xxoehnXA0Nh8RoaUvkG4Dy8u3VlTnB5V4MwaMpAgIcAV+W
	6lVFqMslr8sAffgEh1SN62TMlDIGD4MFb3zBF5vUhEKc4TNayMJ9iOVsEOFVUl90m49DTA
	FX5/fkPdOLLkwlWN7AoSa2bHvM0186o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-0hrn-lkJNPGkDejBb4vLsg-1; Fri, 02 Aug 2024 16:47:08 -0400
X-MC-Unique: 0hrn-lkJNPGkDejBb4vLsg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-367990b4beeso4206367f8f.2
        for <stable-rt@vger.kernel.org>; Fri, 02 Aug 2024 13:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722631627; x=1723236427;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXvK1vsGBENe1Z3UKUTgGBrRGiZzL2b18cCvo7uxGDQ=;
        b=BjSqp2Q0MU28lfLKKhBMKq9SWIUOOpsUc3YptgFH0oJrJFaIytNPUlEy+CgweHAY66
         WwR4PHjHQwllW25RAWOoQwtHU9zqramcZcK2iyyZwQxmmVa07wFwQPKRxDPUuIgfJNbK
         S2ToyJfi41+oVkokwg6UB2MZJzTfXkaN6TsLGCD7rRP1BAF8LcNClWjHV9FU4kuVwmNX
         GtWqsHDDt9YWDH0jFwgUl3nJWDyOn/L1N6yZVZaD6gnL2g34O2ZO3bDLcv/EylbviXJb
         uvl6GexE0pq8O61Q7igFyZHf+SQeVp8roVnDAObhEKTmYD0QC10s0AYFfwhiU08zYyj1
         9dgQ==
X-Gm-Message-State: AOJu0Yw4vS0MXEbFpbnYhFnvloZXdC1d0oF6lQBl2U6cLE3NgcBee7NM
	cIaT9CBPfZjEaDdsTuFmZg7FE4X5aowuIhxjBs+I7J9zCSqX2YByvXm9vgAYyNyOJCmwo1lvm1p
	HznPV5224Uq4Ujs9m2m6xbCbFIyArD6wCK0DtLBfGMULWEk1ynmqDME1R9EqlDRkcfdSja2sJgA
	dN5SezgWhSCCJmPy1YlP7It8z7/RJX6LlL
X-Received: by 2002:a05:6000:d2:b0:368:71fa:7532 with SMTP id ffacd0b85a97d-36bbc0e7225mr2566330f8f.31.1722631627435;
        Fri, 02 Aug 2024 13:47:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEln0HFWUnzDBZmzcRMtD0Me6jQ1f9XOaXjFPjA/wfih4jpNdvcWt0d9WgeSlaj4N6hRqB6cmklfiFdewCD/ak=
X-Received: by 2002:a05:6000:d2:b0:368:71fa:7532 with SMTP id
 ffacd0b85a97d-36bbc0e7225mr2566314f8f.31.1722631626654; Fri, 02 Aug 2024
 13:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Clark Williams <williams@redhat.com>
Date: Fri, 2 Aug 2024 20:46:55 +0000
Message-ID: <CAMLffL9t0SFkO90d6pFZAwp-WVbont7NgELx_WW-GRRYkF_QXA@mail.gmail.com>
Subject: CI build failure in v6.6-rt
To: "Kroah-Hartman, Greg" <gregkh@linuxfoundation.org>
Cc: stable-rt <stable-rt@vger.kernel.org>, stable <stable@vger.kernel.org>, 
	"Claudio R., Luis" <lgoncalv@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Greg,

Kernel CI is reporting a build failure on v6.6-rt:

https://grafana.kernelci.org/d/build/build?orgId=1&var-datasource=default&var-build_architecture=riscv&var-build_config_name=defconfig&var-id=maestro:66a6b448bb1dfd36a925ebef

It's in arch/riscv/kernel/cpufeature.c where a return statement in
check_unaligned_access() doesn't have a value (and
check_unaligned_access returns int).

Is 6.6 stable supporting RiscV? If so then we either have to fix that
return, or backport the refactor of arch/riscv/kernel/cpufeature.c
(f413aae96cda0).  If it's not then who should I talk to about turning
off riscv CI builds for v6.6-rt?

Thanks,
Clark

