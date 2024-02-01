Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1007B5336F
	for <stable-rt@vger.kernel.org>; Thu,  1 Feb 2024 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706793625; cv=none; b=Ok0PCOWZGZnkA3X5RxCbkIIlIRqjQbNSO/iZThCNjfSxCmEvLv2PCd/cRImYMG6n/GaKo3apKSEFDs1nIyj2Q6d/xf86Y3prnk4u6NSK3ktRxsH6/XZNY/Lun5Wv5NsQFeHxkiiGh0Kt9wsmDy1kyZWTdmpzNkZWE4T+FxpI9+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706793625; c=relaxed/simple;
	bh=cvmolqsTy/2d7Qe4AIyBfFK8LhPyeVmcbRhnUpYL8s0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0BPlo98peFSA8Q43D7MUJyGXJ9MPSAw/saB/GUVvfcfdOmTbMR5IJwdnR76C92OXe523uFspRWGxQ1E4w/kkD5x4uBH+1IGyhgoAWt0VU6tPW8Miyf7K/pcwz6NR0WKR1hFVon4hp5jYiJMQbHYv4j8cM5HHzaBpE7ZIjRDcbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QIQ5aax/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QIQ5aax/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706793623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=jJtLN6yrGN0UJpNCi+cAIRSxr/Pu2NijAWYXx1ZxLuM=;
	b=QIQ5aax/l5NSExBbg6WhbdD71ilBnbjzvwcDsjQKFBqafUgH9diLW2cHCqeSS8YfkDkhEu
	/hj5OXy17aWg6d8iKEkmhil0VSFK7EdUkPvjOpK7VmVYlOOSJ016yR3BJCXfk/gZDd5tMr
	Cz36a7qBUMTIjzM5KOUsMs6R/BZ9w7o=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-507-XfMEe3h2PhujXu_UcV7_kw-1; Thu,
 01 Feb 2024 08:20:20 -0500
X-MC-Unique: XfMEe3h2PhujXu_UcV7_kw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 606473C0C487;
	Thu,  1 Feb 2024 13:20:19 +0000 (UTC)
Received: from localhost (unknown [10.22.32.98])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CBA51BDB0;
	Thu,  1 Feb 2024 13:20:18 +0000 (UTC)
Date: Thu, 1 Feb 2024 10:20:13 -0300
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
Subject: [ANNOUNCE] 5.10.209-rt101
Message-ID: <ZbuajQ0wK23kW84r@uudg.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Hello RT-list!

I'm pleased to announce the 5.10.209-rt101 stable release.

This release is just an update to the new stable 5.10.209
version and no RT-specific changes have been made.

You can get this release via the git tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

  branch: v5.10-rt
  Head SHA1: 2ff8470513b9651ecd42aaa0983ed13841b2fb1b

Or to build 5.10.209-rt101 directly, the following patches should be applied:

  https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.10.tar.xz

  https://www.kernel.org/pub/linux/kernel/v5.x/patch-5.10.209.xz

  https://www.kernel.org/pub/linux/kernel/projects/rt/5.10/older/patch-5.10.209-rt101.patch.xz

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis

