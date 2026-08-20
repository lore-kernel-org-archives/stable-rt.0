Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E447F774
	for <stable-rt@vger.kernel.org>; Thu, 20 Aug 2026 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246651; cv=none; b=BgDOyJcR1EBkOQ7ODY51m9oD2kOfamj5Ht5L3f45/T767Ye5vGz5zHPDEZTmUkQ0uNfSDe0HgPtQ0hPnGX0EzelGJIWPOGdZXClinj6AniYVTNqXFGfTTJ+Ofi1jxpYCLanE++vXUaHzyZEhH2LFqyM+NW2L7MEbXBKDCYktHas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246651; c=relaxed/simple;
	bh=Tq9zrGwFt1Av8p0S2gyuU3w+8db5r3n+3/fvrp3VMeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5Kvwc9ds3liDRdNbIP1hbS0fukKXwMkr0vJ10zboJMCP8Ns8BMCaNkfyxlyAljo4eTzFB23yg2YUGr6rFmVrRRkJg3JAoXhs9kvyTe6JJQ1SZv8JvTU0T62Mb51bZec3vVU6zGBNmJuKBBnNe9bWo0VfoyfhbkSHqWaGDO7PMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nfh9TrnW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nfh9TrnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787246649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zew0LnZ5yCwYMoAzdaGEde1fEEr1iyE4t/qdB7YuVzw=;
	b=Nfh9TrnWhlN7Px3g2/8WXdIryRbSGS5Xs4pNFLqy+0bdHxXwuDoiPVVR6JsZ62kxF6CX5O
	wx3YJagOtd4nsU/fz4/F/lqyjU1SevaZRmbtlwtm1NX4c/f77hjRFYevMQbzSq1s6gNN5G
	1ux6Y3K+CbC0ci0pmzTkKg/loCuLsjk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-S5Qx_KrlMT2GMWE1GJ-5yw-1; Thu,
 20 Aug 2026 13:23:58 -0400
X-MC-Unique: S5Qx_KrlMT2GMWE1GJ-5yw-1
X-Mimecast-MFC-AGG-ID: S5Qx_KrlMT2GMWE1GJ-5yw_1787246637
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F30A0195605E;
	Thu, 20 Aug 2026 17:23:56 +0000 (UTC)
Received: from localhost (unknown [10.22.64.86])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5D18C1800347;
	Thu, 20 Aug 2026 17:23:56 +0000 (UTC)
Date: Thu, 20 Aug 2026 14:23:54 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Bryan Brattlof <bb@ti.com>, Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <aoc4Ks-zKZMEcvmx@redhat.com>
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
 <aju8K3aPXCWr7v7z@redhat.com>
 <20260625-afar-trailside-f84c5025dc57@thorsis.com>
 <20260625080227.WCsryMw4@linutronix.de>
 <20260819163011.v7uqv6zbavgbebq5@bryanbrattlof.com>
 <20260820142314.OrEinRQt@linutronix.de>
 <aocj-6A2vEPw-5-O@redhat.com>
 <20260820161246.TOprmKgB@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820161246.TOprmKgB@linutronix.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Thu, Aug 20, 2026 at 06:12:46PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-20 12:57:47 [-0300], Luis Claudio R. Goncalves wrote:
> > On Thu, Aug 20, 2026 at 04:23:14PM +0200, Sebastian Andrzej Siewior wrote:
> > > On 2026-08-19 11:30:11 [-0500], Bryan Brattlof wrote:
> > > > > I did assume we have v6.18 in maintenance but somehow it skipped. *I*
> > > > > usually skip updates if there are no clashes and nothing changes.
> > > > 
> > > > Did we decide to skip v6.18 ? There are a few people internally asking 
> > > > me for a roadmap again with some guidance on the lifetime of the branch.
> > > 
> > > As of v6.18.45 the v6.18.37-rt6 applies as-is. Winthin the git tree, the
> > > stable tree tag can be merged. Does this work?
> > 
> > There seems to be a conflict when applying the 8250 nbcon patches. IIRC you
> > fixed that conflict (or something quite close to that) on v7.1-rc.
> > 
> > The conflict:
> > 
> > $ git checkout -b test01 v6.18.37-rt6
> > $ git rebase -v v6.18.45
> >   Changes from 0c503cf3dde2e53614f05261ece12f9d3d4c3c20 to bf3be28f6721e24961992ebb9e61c0cf21a56806:
> >   ...
> >   Rebasing (1/29)
> >   dropping bea58d7ab5ba4367a3208ecd1854a74b66b21f51 net: gro_cells: fix lock imbalance in gro_cells_receive() -- patch contents already upstream
> >   Rebasing (2/29)
> >   Auto-merging drivers/tty/serial/8250/8250_port.c
> >   CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_port.c
> >   Auto-merging include/linux/serial_8250.h
> >   error: could not apply 0b053910fa95... Reapply "serial: 8250: Switch to nbcon console"
> > 
> > Bryan, is this the problem you are seeing?
> 
> This is odd. Why does it drop "net: gro_cells: fix lock imbalance"? This
> has been removed in -rt2 already.
> I'm able here to merge v6.18.45 into v6.18.37-rt6 without a conflict.
> Also applying the quilt queue on top v6.18.45 works.

Sebastian, I can merge v6.18.45 into v6.18.37-rt6 too. I can not rebase
from v6.18.37-rt6 to v6.18.45. But if I repeat the process with
v6.18.37-rt6-rebase, it works fine. In any case, if that is not the
problem that prompted Bryan's email, no need to focus on that. I was just
trying to understand the reasoning behind the question and spotted the
rebase failure.

Just for reference:

$ git show v6.18.37-rt6 | grep ^commit
  commit a3c2a803731b7b3d139c45a019cf43c8759fcc93

$ git show v6.18.37-rt6-rebase | grep ^commit
  commit 2fdaf62aeab36227d0789a3132780ea74b7e06c5

$ git diff v6.18.37-rt6 v6.18.37-rt6-rebase
$ 

Best
Luis

