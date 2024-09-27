Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A763C1C172C
	for <stable-rt@vger.kernel.org>; Fri, 27 Sep 2024 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727452621; cv=none; b=eA/DBAoMLZ8iolgmHx6nNrYjBwk1Brxy4EHEDAOpTN9TJqLqRepJVcy+D/wqWEVzJtCgDHQDyEru4J6P5qJGzpzR7N/YYNGNjaVN1vjK1vnsloh/hXs3wIxTElaD1Pzxya15ZS9cRAHt/k6hNk71FwU/RWiEqLGvxzkNN/dzea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727452621; c=relaxed/simple;
	bh=IukDf/O1arMlFrxuKXqQVSf8aqzT2OMcFgwNtqxNj2U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GbFCKBoQZMbPtx55R3I8/trTNGe1FNbbguUC5VSa8Y8MayjVlxiqvkQYv7UIrmsNxRRcjHdMOwBF+z5yvRqUa59VvJlGVamaidzT4UW4hhxZ0Vs076g41dyRXh1QsknaKDVIqiYZL340XoBbOMdQEx34EbxJpfaV6/jz8+GfaTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RXTOaAWr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xzj/m7Kz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RXTOaAWr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xzj/m7Kz"
Date: Fri, 27 Sep 2024 17:56:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727452618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=IukDf/O1arMlFrxuKXqQVSf8aqzT2OMcFgwNtqxNj2U=;
	b=RXTOaAWreEjDqgodZ8HjqVlojE9FZIOgNqyIKgB+TWX2mXz4fwVnAUrtDgPa276E4JMTTq
	tMeU8c5Ypuvoy5kyho0zNJJp3QDXBSCyGe+KniI+2EPLaNNYAQRGpEIKvpXWT/lo5FvxNM
	Oe312Nzcta/zc4fC+2vlGCcVloNI9OHRE8kRlthiGKsf95ThLkhN5oIlpZ5QjmtAeFUwb3
	igeJVN36FTm49U1Tz/xO2cVeoHSX8LTr/3P3n0qG6K22phb7yRXQLf3gE5X3hM4vC938pY
	yfC4WcRiZ9WlBOdp9i9SC6OCiStvXdmFLzvzL3OIZD80mwtRIuZ2eqzwwnE+Ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727452618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=IukDf/O1arMlFrxuKXqQVSf8aqzT2OMcFgwNtqxNj2U=;
	b=xzj/m7KzK00qy1V0Esme7RzKD4E+hiWGbal+pLJpw4VsZvIYoa5S28FbrYsx2VnBXpN5a7
	ukUb7i6pJZ/yCgCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: stable-rt@vger.kernel.org
Subject: Please backport: netfilter: nft_counter: Use u64_stats_t for
 statistic.
Message-ID: <20240927155656.Z-s6BO9B@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

please backport

4a1d3acd6ea86 ("netfilter: nft_counter: Use u64_stats_t for statistic.")

https://git.kernel.org/torvalds/c/4a1d3acd6ea86

Sebastian
