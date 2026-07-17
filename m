Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8843EC69C
	for <stable-rt@vger.kernel.org>; Fri, 17 Jul 2026 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295688; cv=none; b=MGoC6zlCYVA8SsYBz/nCaLH1uezsujRENomAH3hzAo894IODBMdDQkTJjQdSik/YudCEWCElUQSVYCMblf/7g1xV52Ydbo97rJd9nL4/0zPGxOUVKqgAAVuhZRc8UZawTvYcGIoF+LJZZUlIDCKUoT46yyrsOLop5qDVwJLfE2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295688; c=relaxed/simple;
	bh=3fYzpFX92NXL98dc+qELNOBq7f6GuWi9TAf7vZ+iXH0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FyF5MqC59eGLw8IHL2EnuAEKmMcIKWLdxL5DElkmo/+Rrmw6IPVcBx6wiV7mAsuxUZsVmrGM4MhqW0Eq9jwsShJmg2XpNzpRiYpAXmaKRFR8qnLve/TFiNjdm41e2naa5cr78PYmqWMou0j0vAyMiVYf9sccrw1g0vRMOM0rlWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=monom.org; spf=pass smtp.mailfrom=monom.org; dkim=pass (2048-bit key) header.d=monom.org header.i=@monom.org header.b=PUnL97wM; arc=none smtp.client-ip=79.135.106.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=monom.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monom.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monom.org header.i=@monom.org header.b="PUnL97wM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monom.org;
	s=protonmail; t=1784295682; x=1784554882;
	bh=jUnoLo9MY/iC54jYfcmPKDwmvYI8oBrPnAo02LLt6qQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PUnL97wMIrWTcHGzlpdqzpqsYvB+yvCgv9vEqqc0/qFwn2Q5cZ/O4FsUove7eLDut
	 eUs18mVR43WoretwCzgiH++Z6sIhO1DZZCdSdFKqyTWIyWazx+NKhMY/39P0QPx0s9
	 NBVJiWJzGqoyv1paCWg/NbHse979n2OlzAyjh1dykWCeLKRsjfOJTNYhLdIHrwnHhV
	 +nhcK71GO/yJ6B93Q3STP6TJkSYMgGSsk4kTjGkdLxtv3hPcNjrypJeMUcw8skyYUE
	 pDlOWy+oNQaDwttzwBVCcNdyY02/Q9I/gb7+ZqEua6TOHxVY7vl8V9YT6bVf8Y/Rz8
	 Blt2IW6nqV/Sg==
Date: Fri, 17 Jul 2026 13:41:18 +0000
To: "bigeasy@linutronix.de" <bigeasy@linutronix.de>
From: Daniel Wagner <wagi@monom.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, pavel@nabladev.com, nobuhiro.iwamatsu.x90@mail.toshiba, stable-rt@vger.kernel.org, cip-dev@lists.cip-project.org
Subject: Re: v6.12-rt arm updates
Message-ID: <0a00b244-c91e-4cf8-9acd-a02aadd05d7f@monom.org>
In-Reply-To: <8a0f6ad1-0df7-4707-bcc4-83603cada945@monom.org>
References: <8a0f6ad1-0df7-4707-bcc4-83603cada945@monom.org>
Feedback-ID: 209527651:user:proton
X-Pm-Message-ID: bc470b5baa9dd7d8cde11e14db27e80aaaa34c51
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/17/26 3:30 PM, Daniel Wagner wrote:
> #########################################################################=
##
> # ARM
> #########################################################################=
##

> # Commits in upstream but not in v6.12-stable
> ARM__enable_irq_in_translation_section_permission_fault_handlers.patch
> #  59e4f3b45b96 ("ARM: ensure interrupts are enabled in __do_user_fault()=
")

I am replacing the stable-rt patch with the upstream commit here.


