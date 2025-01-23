Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622A1BBBC8
	for <stable-rt@vger.kernel.org>; Thu, 23 Jan 2025 20:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664296; cv=none; b=JKJwzVO7kTAc2HBpAgAM2IzHmwzd1lZNID8tE4HVX2qQNLdurDh3fLEzNcYPJnbJAkbJ10b5+kisVJ31u2fsn8HspQ+jxDriJ7xSERszxNQrpd0uTC2FBbB6srg/1ZHFMDyHBKIZMA6Mlsv9KwA55VT/jcYriHh7RXoCz7B1XlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664296; c=relaxed/simple;
	bh=vrsGly5fhAty3f58iyzTRkDCleQiqFRmjNW7rCLER8Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXXj+pibES67P66aQKqD6funGTCzYkBv+MxuErnwKaM1V54DaU4NwFXVFMK0QfLXCBBmPaTFgz+THhnzw0iDzUDPyKHRcVSS7xuoLHdJPzBvPsMsGfeIIyCVC5b2UeQM6LWIPVc93xCHd/P5iZwQJEKgODnKzEHXBRNuWyQXmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QKccUmds; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QKccUmds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737664292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=spRZkkaYO2f411/dbcibecl8EF1/B3Du5skVUkJPvV4=;
	b=QKccUmdsoApnyWcVg3rfeDUaCDddN4FINVst9G4YDmmujAmZtogGrrMiQObldNac58BNf8
	GDGs0ifm4PTjwXihGPuqkW4Y/2ToY9RKeQprqL2LxpS1Km8ixiTCwE9zOv6tSroLPe4m0F
	hCOpNczd/73t68rnbCml4jW17XFeevc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-0tbDeCiNMAiYmhVoNLZB2w-1; Thu,
 23 Jan 2025 15:31:27 -0500
X-MC-Unique: 0tbDeCiNMAiYmhVoNLZB2w-1
X-Mimecast-MFC-AGG-ID: 0tbDeCiNMAiYmhVoNLZB2w
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85D7C1955DC6;
	Thu, 23 Jan 2025 20:31:24 +0000 (UTC)
Received: from localhost (unknown [10.22.80.13])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E13819560AD;
	Thu, 23 Jan 2025 20:31:22 +0000 (UTC)
Date: Thu, 23 Jan 2025 17:31:21 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: LKML <linux-kernel@vger.kernel.org>,
	linux-rt-users <linux-rt-users@vger.kernel.org>,
	stable-rt <stable-rt@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Carsten Emde <C.Emde@osadl.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Daniel Wagner <daniel.wagner@suse.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Clark Williams <williams@redhat.com>,
	Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@denx.de>,
	Jeff Brady <jeffreyjbrady@gmail.com>,
	Luis Goncalves <lgoncalv@redhat.com>
Subject: [ANNOUNCE] 5.10.233-rt125
Message-ID: <Z5KnGWmMgKISE7Sv@uudg.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hello RT-list!

I'm pleased to announce the 5.10.233-rt125 stable release.

This release is just an update to the new stable 5.10.233 version and
no RT specific changes have been made.

You can get this release via the git tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

  branch: v5.10-rt
  Head SHA1: 17301aac361df31917fb5065a76bc7a9a4748b7e

Or to build 5.10.233-rt125 directly, the following patches should be applied:

  https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.10.tar.xz

  https://www.kernel.org/pub/linux/kernel/v5.x/patch-5.10.233.xz

  https://www.kernel.org/pub/linux/kernel/projects/rt/5.10/older/patch-5.10.233-rt125.patch.xz

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis

