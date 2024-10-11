Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0331A20C46C
	for <stable-rt@vger.kernel.org>; Fri, 11 Oct 2024 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637931; cv=none; b=hA3/VxJMEN5cjfwRE6lWXnebMAclT+gS6q2HPjinBHcNndYuSsdvrkBCo2wUTRe3lTlmsN15rsz5jt/UtbZyOmz6aAy2c9H726akv+N29oQyC0wiTar6xoV4NlsgX2YiuIzEFrpMTsrOkaL/gwNDFW0MXXm0rGyAhKlojXjfFdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637931; c=relaxed/simple;
	bh=WnizTig0DJkvXNCOIZS5RrGoFQDdkuk9RtMAKkLjUxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOGuwWXx3v5iU4QL5oBMrqChCR7CKexGOhsFw5jJq2vTCnxhha1Fi+Kx4bC5i4SI/RpSwdh/w0BVdB1gYOX01ftfRStc3eiAcNWwJgkb+dZsCivANDMMQlxm+i0HyYhn/yyeS5E07GmrkHHaR1wKWsCB4H1tNzMpF5VBhyF6UBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aMZt+0BO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wwVEroEc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aMZt+0BO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wwVEroEc"
Date: Fri, 11 Oct 2024 11:12:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728637928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Codc880JuiZdnIRWCTnyuxvqgQb+M5uiKzkTWfeeXDQ=;
	b=aMZt+0BOV4VgZKWY2VAeL2iWxrDX0MMByB2vJ/QyP+WWZZseSMK4a7CYxqwErnycK0MFuS
	sWl3DW8OWc7ywI0SKZK874LtgqTtcg6eHJpJk6gQ6S8qiev2/X5YwFrcambm8yAJKvrgPn
	ZP3ZSS3Thxux/V+g8Fwch56fk9FtIcr3vkTz8et9zPgnEKYcQz7QneaOgQUz8ZPfEfNTyf
	VNyWP5QnYkBnZzS5sbdwGsX0f+pKNKYC90PfpOoz8lU0B8yn/dRmA/GufObXKYHT3LYr9r
	2Q6NK1SYkL5/tdDbEndDyEe7FaGSiklMx2RIFTmnyAjf/zyOfvhCS+STETcpqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728637928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Codc880JuiZdnIRWCTnyuxvqgQb+M5uiKzkTWfeeXDQ=;
	b=wwVEroEcebQsB02z0ZSiXV4aw51voekUc33ZdFIS2twwTuvTjjPbK2RxkzxXBuq7TVszAE
	6QsLqy2cB1ORB9BQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Joseph Salisbury <joseph.salisbury@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, stable-rt@vger.kernel.org,
	Clark Williams <williams@redhat.com>
Subject: Re: [External] : Re: Please backport: netfilter: nft_counter: Use
 u64_stats_t for statistic.
Message-ID: <20241011091207.g4MeBvAn@linutronix.de>
References: <20240927155656.Z-s6BO9B@linutronix.de>
 <20240927144126.0dba172a@gandalf.local.home>
 <bab856cc-7c9f-4ee9-84f6-ab228b2648c0@oracle.com>
 <20241004073934.501MFrgf@linutronix.de>
 <9f71f094-7763-4f96-869f-dd781aa68c68@oracle.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9f71f094-7763-4f96-869f-dd781aa68c68@oracle.com>

On 2024-10-04 15:14:52 [-0400], Joseph Salisbury wrote:
> I attempted a backport of commit 4a1d3acd6ea8 to v5.15-rt.=C2=A0 Commit
> 4a1d3acd6ea8 removes nft_counter_seq() from most places, but in v5.15 it =
is
> still in: nft_counter_module_init():
>=20
> ...
> ...
> ...
> static int __init nft_counter_module_init(void)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int cpu, err;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_possible_cpu(cpu)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 seqcount_init(per_cpu_ptr(*&nft_counter_seq*, cpu));

This should have been
		seqcount_init(per_cpu_ptr(&nft_counter_seq, cpu));

in 5.15 and should work to be replaced as
		u64_stats_init(per_cpu_ptr(&nft_counter_sync, cpu));

I *think* the API was the same in 5.15.

=E2=80=A6
> It looks like your patch handles this in nft_counter_init_seqcount().=C2=
=A0 I
> believe I can just backport the same into in nft_counter_module_init() for
> v5.15, but I wanted to run it by you.

You probably do the right thing. If in doubt just do it and post it for
review.

> Thanks,
>=20
> Joe
