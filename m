Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEAA29B783
	for <stable-rt@vger.kernel.org>; Wed,  6 Aug 2025 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501821; cv=none; b=qz4HdL5WDJYd6E9jozAUxDszcanajju6JbOPxc/BBBW5cSg4GEI6nz/SBobASjIf45FWXvAeaSLi1eLqALBZ1s9NPBA2QIhf8+guJPq793s8ezoqTZQtUyQKEwVsBXTKEaYfuvcIn13SgWvhNkdL+J/ideaVqZgw9hJK+nSnPzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501821; c=relaxed/simple;
	bh=Pjg9HEaw6i4QEUJAeie3PKr/OrKrGNuJKETGnPy/IIk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gb97Lvds2bBf/51BQKRLA74jIv5Ts3Ari5WS0NNl2075wv/N+zHiJipRxAZFH+PYXxeSSGSx6YHRq4YE38DkzJzXqdQ8+Pri5zhvWci/lueomTE74E5ULRIn6Cfmk9euzBrsdTDltiqKkM/D5RxGxSDIw3XjefNfNJ0286K2oA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dz9wy0a4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dz9wy0a4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754501818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=M4ChUg9DtTEdsX27gmK+RCPcBcGl0as9LhoQukO7hoQ=;
	b=Dz9wy0a44HQBCIIPB4J3FDLupoFsRKmwWGcklXU0Uqb4q32eoee4haPjfT1fWDmdxPNvu8
	EPj79/IzdoKaglwoXOA2abGFdCbgerv3yivtCnRDEuW1+UZLJ/6bcTOrODh360xFPzDmA9
	0DnrprygphQxAW1AYmYzzWyOTjtTpD0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-ZXb8DqNgPYCxYf8xan7_5A-1; Wed,
 06 Aug 2025 13:36:53 -0400
X-MC-Unique: ZXb8DqNgPYCxYf8xan7_5A-1
X-Mimecast-MFC-AGG-ID: ZXb8DqNgPYCxYf8xan7_5A_1754501810
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29E9A195608F;
	Wed,  6 Aug 2025 17:36:50 +0000 (UTC)
Received: from localhost (unknown [10.22.80.109])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 020BA1800446;
	Wed,  6 Aug 2025 17:36:48 +0000 (UTC)
Date: Wed, 6 Aug 2025 14:36:47 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: LKML <linux-kernel@vger.kernel.org>,
	linux-rt-users <linux-rt-users@vger.kernel.org>,
	stable-rt <stable-rt@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Carsten Emde <C.Emde@osadl.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Daniel Wagner <daniel.wagner@suse.com>,
	Clark Williams <williams@redhat.com>,
	Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@denx.de>,
	Jeff Brady <jeffreyjbrady@gmail.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Luis Goncalves <lgoncalv@redhat.com>
Subject: [ANNOUNCE] 5.10.240-rt134
Message-ID: <aJOSr4YCX2t_hc0f@uudg.org>
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

I'm pleased to announce the 5.10.240-rt134 stable release.

This release is just an update to the new stable 5.10.240 version and
no RT specific changes have been made.

You can get this release via the git tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

  branch: v5.10-rt
  Head SHA1: 502b544c60cfebcd564285a0c807cf32b1a3e656

Or to build 5.10.240-rt134 directly, the following patches should be applied:

  https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.10.tar.xz

  https://www.kernel.org/pub/linux/kernel/v5.x/patch-5.10.240.xz

  https://www.kernel.org/pub/linux/kernel/projects/rt/5.10/older/patch-5.10.240-rt134.patch.xz

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis

