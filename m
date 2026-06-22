Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2450F3148D0
	for <stable-rt@vger.kernel.org>; Mon, 22 Jun 2026 16:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782144726; cv=none; b=T2DsRdvhrrJQuAeZLGCkdATgSN7lhOCMc9NMevS+CuQFegijG89WWrOEZ38cwwQ+ON4BsblXY5fY04CC3f7seGWsfovfySRkjU2NtZr6K4XNIoSqhdrUkbE8v4bI/v/UzoK/wMzIZTpMnHnIl4FME/WvENjDj7VOQvAbSooITiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782144726; c=relaxed/simple;
	bh=XW7o3T509i3rULg/928sgPvEfKY9ubh7sf6y6z3Kb4g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ueELgLCDpGbEXo+0IeoaaffotVFEHBXDyZqy7ti7/rSz41DNJaMru90JSdrEAysLqibp4pJgrLS7YmX3JXCyAk8i2/yhkF2HCCUTUuvjiUJEODQdKuOXmvuPiZHQFslTOC4SXN1gH7AC92btGIS67HafOtCAobCGoPhKHZRwoiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WC5dGAqz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WC5dGAqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782144724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=P5jWo7Te8kgqdRUyrZ5R0mdyPlEZ5Ks/izG9eTtyhdU=;
	b=WC5dGAqzw4cX+veJmrXDAdUIC53tT6IKBegQ0rCvlD9TMah0xBzhoeJ7dLHX5nn//D7c9W
	3pGhTUAAWfuZyRJ/Wem3hEMJ3eLNCfZDFOPDQtEoE8vX5C10rsolthqjX60xjUA/apkWTY
	5iFmD+WPbP/XJ5LPhl6pg2NG4Zgms4s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-96-AKlEyIdaN76ESeCF-BevpQ-1; Mon,
 22 Jun 2026 12:12:02 -0400
X-MC-Unique: AKlEyIdaN76ESeCF-BevpQ-1
X-Mimecast-MFC-AGG-ID: AKlEyIdaN76ESeCF-BevpQ_1782144721
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A5C5E195606D;
	Mon, 22 Jun 2026 16:12:01 +0000 (UTC)
Received: from localhost (unknown [10.22.64.81])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 29D4B1800593;
	Mon, 22 Jun 2026 16:12:00 +0000 (UTC)
Date: Mon, 22 Jun 2026 13:11:59 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>
Subject: Question about the maintenance of OOT RT patches for LTS releases
 (v12.x and v18.x)
Message-ID: <ajlez0ZNV3PJ26iz@redhat.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hello!

The question is simple:

   Should we have somebody maintaining the OOT RT patches for v12.x and v18.x,
   the LTS versions that already have PREEMPT_RT in-tree?

As we still have a few OOT patches, after a while, people using PREEMPT_RT on
those versions may encounter conflicts trying to apply the old patches. And
as those patches are not in-tree, the fixes won't probably be routed via
Stable.

Best regards,
Luis

