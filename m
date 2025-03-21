Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73097E1
	for <stable-rt@vger.kernel.org>; Fri, 21 Mar 2025 00:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742515756; cv=none; b=m1uEmuUsHtVXuiTczOHAW6prBeramP4sBxtJoDKNTuumEeK1kp4tnWvJRw0Cf5j3iYaSsYuGbJyDw4hMvLQ4fF8hQjynqL2a2J9UvHuZUrBJI3FSdPOutW7BvTXf3wdJr+8eor+3tmbAHJz2M+fsj7sP6WuaU0tBoYbCUXfbUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742515756; c=relaxed/simple;
	bh=bn6UORtHniYeUFrNKWwsFwqyTNBGgZ8QmzSLXEUbcbg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POcfhPWIkI/b4VFGbjcFQr+JPwSPlA6WENlvS6NBL1RNu67EJbsicKc4slpRrH8rQ/aRXJaSYSo5d8EFCWBjyjyT1SDuFQZqv4hQuKEsn/bEdgJKqg/d4veeVyyxAoYY/2r5GYUtyD7G/q0UeKmR3Y7UrMQ6PduWmGIMTsWJwNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JbtZIBkO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JbtZIBkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742515753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=P6IjoKMH75rxwNa/I0EZ26SBhU9b6U+p4efcu7UBpz8=;
	b=JbtZIBkOmJOedZaxbRPtlmNFq9uUtGyW9USOjEcu49qEQOCU9XXAUg34T6Q1LR9/3V6You
	hSgcb5wZn/u9iEuv6pmrUgQ6qQIx32UoqPOIOg1g++xQ5fLwxXXPtku1jtmoudTLoiakbW
	Bp2E144UeFE18km++rgDV9iqTfg33D0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-436-BtLjM5F2PMm0snZlQ7xm6Q-1; Thu,
 20 Mar 2025 20:09:10 -0400
X-MC-Unique: BtLjM5F2PMm0snZlQ7xm6Q-1
X-Mimecast-MFC-AGG-ID: BtLjM5F2PMm0snZlQ7xm6Q_1742515749
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 086B41800259;
	Fri, 21 Mar 2025 00:09:09 +0000 (UTC)
Received: from localhost (unknown [10.22.88.69])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4F5B71828A83;
	Fri, 21 Mar 2025 00:09:08 +0000 (UTC)
Date: Thu, 20 Mar 2025 21:09:06 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: stable-rt <stable-rt@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v5.10-rt] rt: fix build issue in be2net
Message-ID: <Z9yuIpi8zjrTCkoB@uudg.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

While working on v5.10.235-rt128-rc1 I noticed a build problem with
CONFIG_BE2NET enabled. Upon inspection I noticed commit 7cfae8627511
("be2net: fix sleeping while atomic bugs in be_ndo_bridge_getlink"),
from v5.10.235, which contains the following statement:

	return spin_unlock_bh(&adapter->mcc_lock);

The compiler complains when trying to expand the macro spin_unlock_bh()
in that context, requiring a fix similar to commit 386242acb15e ("rt: fix
build issue in at_hdmac"). This problem is specific to v5.10-rt.

Fixes: 7cfae8627511 ("be2net: fix sleeping while atomic bugs in be_ndo_bridge_getlink")
Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
---

Sebastian, Steven, All,

Should I apply this solution in a RT update right after I release
v5.10.235-rt128 or should I backport the definition of rt locking
primitives from a newer PREEMPT_RT patch (say v5.15-rt or v6.1-rt)?


diff --git a/drivers/net/ethernet/emulex/benet/be_cmds.c b/drivers/net/ethernet/emulex/benet/be_cmds.c
index 9812a9a5d033..3068ccd37034 100644
--- a/drivers/net/ethernet/emulex/benet/be_cmds.c
+++ b/drivers/net/ethernet/emulex/benet/be_cmds.c
@@ -875,9 +875,10 @@ static int be_cmd_lock(struct be_adapter *adapter)
 /* Must be used only in process context */
 static void be_cmd_unlock(struct be_adapter *adapter)
 {
-	if (use_mcc(adapter))
-		return spin_unlock_bh(&adapter->mcc_lock);
-	else
+	if (use_mcc(adapter)) {
+		spin_unlock_bh(&adapter->mcc_lock);
+		return;
+	} else
 		return mutex_unlock(&adapter->mbox_lock);
 }
 

