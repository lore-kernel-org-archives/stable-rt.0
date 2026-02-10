Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0E225408
	for <stable-rt@vger.kernel.org>; Tue, 10 Feb 2026 01:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770687081; cv=none; b=ADmcln4BdAmfmj7aEuX88KvFfq8vess/mbtq+29Z633pr7k399ag24zjcubqyN1ZVInl2WO08KkaRBjkD9sAtJiftX1qSrcK98c78VwNHDzrvG/DAt2CWtkVPkU50QDG/Pr75iHZO1s1swKymtMZb5VMmmgQnXwK68ci+Mw9pms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770687081; c=relaxed/simple;
	bh=yxrcRqe9ro1svTbTgqZZj8BlqGpMugc8LFFzYoGRXL8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9g1A8M5MRWJzSgP/rZxGUcGwfbg6e5XRQ+dOeEc2AyDCne+eWRMILHXmhTw7ui1y/suCwL2RZVhpMDt1VrD4eIYpJTKz/xJ/8m+2+UXSDXiu9QHf5iaBy0v84EKfqyPb6fNXvLzXEhBqDbKee5QXJEBL+PcwSOyQfz6J27hnSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WFRKjopV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WFRKjopV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770687079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/nWOZhJEkvy1+pw7cGHB3rPaOygbBGW7MfeiszVO32E=;
	b=WFRKjopVhiU28kXLG6cgwDvgEWzL5OO9r63CHMJ5+0Odo+6aaz608WXiVI9pzszkV4ehuN
	MciaFgzp8YAbwGY0Wze5YpEevA0bzL1tsaqdqWvgREp5FZDoSZVtZGdEhPcOu1xR6Ph1tx
	cUdFDIVxU4iW5NiklRezwx7nsHVHUDY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-7Hr1TOC_NIaSrV_XmbAcQw-1; Mon,
 09 Feb 2026 20:31:15 -0500
X-MC-Unique: 7Hr1TOC_NIaSrV_XmbAcQw-1
X-Mimecast-MFC-AGG-ID: 7Hr1TOC_NIaSrV_XmbAcQw_1770687074
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1DBE31956053;
	Tue, 10 Feb 2026 01:31:13 +0000 (UTC)
Received: from localhost (unknown [10.22.64.105])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B257C180066C;
	Tue, 10 Feb 2026 01:31:11 +0000 (UTC)
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: linux-rt-users <linux-rt-users@vger.kernel.org>,
	stable-rt <stable-rt@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Carsten Emde <C.Emde@osadl.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Daniel Wagner <daniel.wagner@suse.com>,
	Clark Williams <williams@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Jeff Brady <jeffreyjbrady@gmail.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Ben Hutchings <ben@decadent.org.uk>,
	Luis Goncalves <lgoncalv@redhat.com>
Subject: [PATCH RT 2/2] Linux 5.10.248-rt143-rc1
Date: Mon,  9 Feb 2026 22:31:03 -0300
Message-ID: <20260210013103.73763-3-lgoncalv@redhat.com>
In-Reply-To: <20260210013103.73763-1-lgoncalv@redhat.com>
References: <20260210013103.73763-1-lgoncalv@redhat.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

v5.10.248-rt143-rc1 stable review patch.
If anyone has any objections, please let me know.

-----------


Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
---
 localversion-rt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/localversion-rt b/localversion-rt
index 234720dc343d..aec9f67adeee 100644
--- a/localversion-rt
+++ b/localversion-rt
@@ -1 +1 @@
--rt142
+-rt143-rc1
-- 
2.53.0

