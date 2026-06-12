Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411BA2F549F;
	Fri, 12 Jun 2026 19:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781291028; cv=none; b=plLnLrGQHHADz/cl46/NdyYstNNb3H/Xg+Q39ZLXD0tHq5IIMYfrmQWvJfQIvp38eLAimEl6eeAYSuFx+/7lWSsHTGruStpBRvGTHiMW/zVvK7iVxcUEEx5hrQFG/+l2xiplXJBEjk+wlVlZT3+GMv2zcncMcCMsDeTcipEctRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781291028; c=relaxed/simple;
	bh=L8znca/8uZ0/nNFnQ6KWQaUVzwSFDlIg4z9BXmgDkBc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6MTX7t65AcyoqwEOgJh5rDklyUg+zn3rz9cH9kyK6cnhRc97KTS7L6an1+SVmEvdDU7z60xjVP19ufG8hS9duXxdgeUBp/QYoJGKjJBo7J0vyPqk53c3whAQ/09oRa7f7IjFU1b4t28ugxo+eNtBBpeBefrtnDmmQzK4MGJ7KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=bsR6TNrj; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="bsR6TNrj"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F6AB11729D;
	Fri, 12 Jun 2026 21:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1781291024; h=from:subject:date:message-id:to:mime-version:content-type;
	bh=oR2PwlvPrxXMAOJvy9pA0OHWJPCDxf9diZsxWclH0l4=;
	b=bsR6TNrjUsiaJR1Sc5T2DYCe2JHhCOIeJkfQJ6fMU/vIjTZUWpM6LC88Nm91CrcDipGPaU
	MR6e4hSNoJTpxYooP4weorCacRorujd4w+N7yvvC1NRu3wa6IZj8O0Lo0GBadHj+VHCLlE
	nKUDPBE43Shg6YQuCDujIp8PwlqZJRvjGy6qFE8I9pm72p2jrSwU5UTBmDYyxhsBm4yHqV
	jILlSLgmXUXFgFVmLROw9ca2Fab+f94HpLAWRzglAAe1DeIeDiw4xRv8urVALs7xFSMu7N
	J5NJ/NHjsfLpkGWqr4E4e1fY1EuR8katd7Q261w34mdZbVPaVRk/jxAw8F+egA==
Date: Fri, 12 Jun 2026 21:03:42 +0200
From: Pavel Machek <pavel@nabladev.com>
To: williams@redhat.com, linux-kernel@vger.kernel.org,
	stable-rt@vger.kernel.org
Subject: 6.1-rt planned?
Message-ID: <aixYDtebH28HxGnf@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mq4W0Zb+j+pbk1IE"
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3


--Mq4W0Zb+j+pbk1IE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Is there / could I ask for 6.1-rt release? There was quite a bit of
CVEs recently, so update would be nice.

Thanks and best regards,
								Pavel

--Mq4W0Zb+j+pbk1IE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaixYDgAKCRAw5/Bqldv6
8j9JAJ0YK0qbh4AgvCsdAM1J/a3jZwi86ACfT0k8M+cPVs6STNrHBNVAZ5gWfbM=
=a1k+
-----END PGP SIGNATURE-----

--Mq4W0Zb+j+pbk1IE--
