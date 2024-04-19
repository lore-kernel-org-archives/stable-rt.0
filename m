Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F98563E
	for <stable-rt@vger.kernel.org>; Fri, 19 Apr 2024 00:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713487207; cv=none; b=UYub0QC2M3NhAj3PyIa4grlyRaV+dG6ctCQpqdRevZxCdr6AW3aQlRGXXQZmgzNvy02Up6xbAEK4HYV0n6LMFkMDLbxy9EKFG43/NQ0yqg+O4RWXJyJXCFiQgtt+5RlKx/mBH4hBPXKZ8WkuT+NkuXub1/XEJFcTO1tZl7i93kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713487207; c=relaxed/simple;
	bh=uSfbOIFusL7yPA50dYF5H5x/u32T7cdQCxoVsUks114=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FSQafAtyb7dYkE8UQFPWr4s1w4i8FW/Q5XoqyNIT4i5Rh2FBzfmKqu+JoTwGKwPU844WisdTDxh3a2+IFpHzYKOHNo1iD5k+A9t9FLt67wy5Ysb4h1d4HjfhY9NjKJYQwDdUuWVVxaizmlemrKw/hYpAzzLc+ipVX+i3vKnw9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NmNnQv7x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NmNnQv7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713487205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=m2bpW9rm2qv+2Wunav+fPG5Qki620lzFcR5jp/JLSVc=;
	b=NmNnQv7xGbTQ1flBaEKlNMcOo3olgPUIFcl9VUuUPMo4pL5SfCa+dUUjz+syo3XvCNMjLg
	GyQ8F1ZswjJnjjE9/A3XN1WYg1yVFiomVxoTHWVP/SHjZUZgG854vA1MF7IC2vvYvesg6u
	YsLuxGFbCwDE8Xx29rzfejirJMXWoDM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-dhEQf1NgPf6CB8kNhSyeow-1; Thu,
 18 Apr 2024 20:39:55 -0400
X-MC-Unique: dhEQf1NgPf6CB8kNhSyeow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECA383819C64;
	Fri, 19 Apr 2024 00:39:54 +0000 (UTC)
Received: from localhost (unknown [10.22.10.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAE9D1121312;
	Fri, 19 Apr 2024 00:39:53 +0000 (UTC)
Date: Thu, 18 Apr 2024 21:39:53 -0300
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
Subject: [ANNOUNCE] 5.10.215-rt107
Message-ID: <ZiG9WanmSqCUNTuq@uudg.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Hello RT-list!

I'm pleased to announce the 5.10.215-rt107 stable release.

This release is simply an update to the new stable 5.10.215 version and no
RT-specific changes have been performed.

You can get this release via the git tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

  branch: v5.10-rt
  Head SHA1: b850d563e91f696a605c28e8d6a968a950cff491

Or to build 5.10.215-rt107 directly, the following patches should be applied:

  https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.10.tar.xz

  https://www.kernel.org/pub/linux/kernel/v5.x/patch-5.10.215.xz

  https://www.kernel.org/pub/linux/kernel/projects/rt/5.10/older/patch-5.10.215-rt107.patch.xz

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis

