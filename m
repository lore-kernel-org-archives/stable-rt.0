Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9053137F74A
	for <stable-rt@vger.kernel.org>; Thu, 20 Aug 2026 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787241509; cv=none; b=IkvrpqW3/XP5qw2ycKhVbyLyiqWT2qWgJDkv2valltWrjzKylbghgk65+ljXDY3hhmzqzQdPAJvD8ejgygnW8B2fk6Ejcm6++urV58cC18O8eHQTeNotXqMS+sOpPWCDAgjtd4kgGAmf8ml+ovVit/m3z6dJ3NfZs0em2uT4Y+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787241509; c=relaxed/simple;
	bh=jErP7ax1Wc3VYXf7g2th3RDWsPsn+W+AwFcYZDV7Sa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/w7QWNDm9k8mGcomRRPlHtGB1atR6c/55YMlQiQ0FurtK5g2fnf40w/ujmHNsh/n0LoTlO5diZz4TTfPCRx+bmcP5WnLnJUZjt66L6wFnA+R6unM21Q5fK7iEv8x93dKnV3Dt7I49z3Ku8YlskVj5jYKfY6kJ0FEPSqKsaj0zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iAH1VvO6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iAH1VvO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787241507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UWX15LlvFfH9qhyaSN/7SWQJ1lfxBtL+2PB3o1ANRdM=;
	b=iAH1VvO6tRc4gHEjoLd3LhMCevVzZmZCg6uk5+JLtKqVP9k3SNEorazROsurcf+QpoSvQG
	c+SKkoDlKjHVywKn035GRspps0fTCyMGo+AJ0QiHv9/Uge5a/67M86N79jILVX1c1zGNxm
	L65NhsZBWNdH/MA4L5T1mf5DpMK7bLY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-496-cFuCk6YvOMqVPHCzwPHMMw-1; Thu,
 20 Aug 2026 11:58:13 -0400
X-MC-Unique: cFuCk6YvOMqVPHCzwPHMMw-1
X-Mimecast-MFC-AGG-ID: cFuCk6YvOMqVPHCzwPHMMw_1787241492
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F0021944D2B;
	Thu, 20 Aug 2026 15:57:50 +0000 (UTC)
Received: from localhost (unknown [10.22.64.86])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 44A5F1955F03;
	Thu, 20 Aug 2026 15:57:49 +0000 (UTC)
Date: Thu, 20 Aug 2026 12:57:47 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Bryan Brattlof <bb@ti.com>, Steven Rostedt <rostedt@goodmis.org>,
	Stable RT List <stable-rt@vger.kernel.org>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <aocj-6A2vEPw-5-O@redhat.com>
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
 <aju8K3aPXCWr7v7z@redhat.com>
 <20260625-afar-trailside-f84c5025dc57@thorsis.com>
 <20260625080227.WCsryMw4@linutronix.de>
 <20260819163011.v7uqv6zbavgbebq5@bryanbrattlof.com>
 <20260820142314.OrEinRQt@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820142314.OrEinRQt@linutronix.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Thu, Aug 20, 2026 at 04:23:14PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-19 11:30:11 [-0500], Bryan Brattlof wrote:
> > > I did assume we have v6.18 in maintenance but somehow it skipped. *I*
> > > usually skip updates if there are no clashes and nothing changes.
> > 
> > Did we decide to skip v6.18 ? There are a few people internally asking 
> > me for a roadmap again with some guidance on the lifetime of the branch.
> 
> As of v6.18.45 the v6.18.37-rt6 applies as-is. Winthin the git tree, the
> stable tree tag can be merged. Does this work?

There seems to be a conflict when applying the 8250 nbcon patches. IIRC you
fixed that conflict (or something quite close to that) on v7.1-rc.

The conflict:

$ git checkout -b test01 v6.18.37-rt6
$ git rebase -v v6.18.45
  Changes from 0c503cf3dde2e53614f05261ece12f9d3d4c3c20 to bf3be28f6721e24961992ebb9e61c0cf21a56806:
  ...
  Rebasing (1/29)
  dropping bea58d7ab5ba4367a3208ecd1854a74b66b21f51 net: gro_cells: fix lock imbalance in gro_cells_receive() -- patch contents already upstream
  Rebasing (2/29)
  Auto-merging drivers/tty/serial/8250/8250_port.c
  CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_port.c
  Auto-merging include/linux/serial_8250.h
  error: could not apply 0b053910fa95... Reapply "serial: 8250: Switch to nbcon console"

Bryan, is this the problem you are seeing?

Luis

> 
> > ~Bryan
> 
> Sebastian
> 
---end quoted text---

