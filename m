Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFAF384CC3
	for <stable-rt@vger.kernel.org>; Tue, 23 Jun 2026 00:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782174732; cv=none; b=ddDU8+3ULsxEzkcAJ76dAjrWXfrtxPlm4Xup3mFc8bj65DgV/oV6ynIzPvNxTgF2mV8c4LI7oVNucQEFmcCrn9B+5SQC9JB937ZB2Tx4EzyGCHtJZ8I02zWAWkZVTpbAiskT9yqXl615Fsk5clSemJOtL7pW6khSXm66qZ//Mrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782174732; c=relaxed/simple;
	bh=dZfJ8i/m413vVNq38a+hh56nyh/rMxJhTtOuNIXaidA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VPyfjP+wcIChROhOp2703b8Wk52DUuXEn6pzr6tHaG1TD91P03lqlLrEoRkmTaAMGe1zQbRRqr4jAq5VrtjBF5tZiTmJy4ETwvHV3lzHgjk8FuAQy8L6WRMVEph18z6m1rY/b5IyJ4zI8ABWbS8kW18qYSJ0G9VJZoDrL49OBsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVdTpI6/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVdTpI6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782174726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=QBxGUgRVysqNewTGd2q+SOA5tHAjuhMYTPES9N5YS3w=;
	b=MVdTpI6/nkFLxPtbZwtq9wPiY9wOx8SeR0C6zs7nb60OBqujg9Avsl30hr+hgRw2iUuR43
	QWBecwwHgtGR5Gl7Y/nTnYmQgFVf+AOQEMkNHLzOOrEpFhVbfBZ632dK5YFfdq+STUExlB
	8/TQVBvyQvxEBqdrfvwCIdDiNT7OhFM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-jFXaOj0eOKKy7vNdpJZSlQ-1; Mon,
 22 Jun 2026 20:32:03 -0400
X-MC-Unique: jFXaOj0eOKKy7vNdpJZSlQ-1
X-Mimecast-MFC-AGG-ID: jFXaOj0eOKKy7vNdpJZSlQ_1782174722
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 894561956056;
	Tue, 23 Jun 2026 00:32:01 +0000 (UTC)
Received: from localhost (unknown [10.22.80.11])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B3D2F1800591;
	Tue, 23 Jun 2026 00:32:00 +0000 (UTC)
Date: Mon, 22 Jun 2026 21:31:59 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: LKML <linux-kernel@vger.kernel.org>,
	linux-rt-users <linux-rt-users@vger.kernel.org>,
	stable-rt <stable-rt@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Daniel Wagner <daniel.wagner@suse.com>,
	Clark Williams <williams@redhat.com>,
	Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@denx.de>,
	Jeff Brady <jeffreyjbrady@gmail.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Luis Goncalves <lgoncalv@redhat.com>
Subject: [ANNOUNCE] 5.10.259-rt155
Message-ID: <ajnTzvfmwlUK409f@redhat.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hello RT-list!

I'm pleased to announce the 5.10.259-rt155 stable release.

This release is just an update to the new stable 5.10.259 version
and no RT-specific changes have been made.

You can get this release via the git tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

  branch: v5.10-rt
  Head SHA1: 5ef784fc69516940ac91f2b24f3c5067859d50f1

Or to build 5.10.259-rt155 directly, the following patches should be applied:

  https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.10.tar.xz

  https://www.kernel.org/pub/linux/kernel/v5.x/patch-5.10.259.xz

  https://www.kernel.org/pub/linux/kernel/projects/rt/5.10/older/patch-5.10.259-rt155.patch.xz

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis

