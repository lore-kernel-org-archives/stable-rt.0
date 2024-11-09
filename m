Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873652E628
	for <stable-rt@vger.kernel.org>; Sat,  9 Nov 2024 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731189104; cv=none; b=QdBXkz7njO+Uc/Jv5wG23H0K1CYaAtskPt3eO/kNHGuZKcBvEWODdvGYo3yyQpLYd9EqO8t+aAvikC6NlwS91N6wzggRWGDAUjgf1FY0bA4rvlnsCeNadfrrf9ZFq92QSIFrgwEqbxoUQW0BXxc2G99LkhZC19DSRUTcmRvmEvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731189104; c=relaxed/simple;
	bh=+Xqfw1BZyRKDMReDrUuWuyki9SGbNgFH6aQzx0536BA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDvHdnKMBLEk9C9HytUVWach09UHqikqIM4zI1Zt6JrtSVHbPE1b1HBh5g/XH6PGBWTec7ERlVg2nbb2qPNUsTOfHUL2KAJ/ve7ppxjfnyONCx0dUg8JMC1YjLdD9oz9m9j/sKyLQPZ/fr6n+lMt7jqcTOWBDeNnN8OWrTMJS3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MRRuNsxy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MRRuNsxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=XApJlKSY7zfkTU+eicdpu7onUBAV2XdJNopArDEH33Y=;
	b=MRRuNsxybSEapwDP1RrmzTA+iVcdHRIDuv+DAOn4B59WQ1X3J6jI1GbZi/x2k8KRq7VTDr
	qYw/7RevMlQXXdVtYWN+B9XMledOOqmhxTJcv4Rtc62cFl1qugoac35fhRlbrgPEf88Hio
	6sZmRZPcwy/xWD/lRmRdmaVGUbqEcpw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-aecymvF3MNG-c7IsJ3SedA-1; Sat,
 09 Nov 2024 16:51:38 -0500
X-MC-Unique: aecymvF3MNG-c7IsJ3SedA-1
X-Mimecast-MFC-AGG-ID: aecymvF3MNG-c7IsJ3SedA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F2A5A19560AD;
	Sat,  9 Nov 2024 21:51:35 +0000 (UTC)
Received: from localhost (unknown [10.22.80.69])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8305C1956056;
	Sat,  9 Nov 2024 21:51:34 +0000 (UTC)
Date: Sat, 9 Nov 2024 18:51:33 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: linux-rt-users <linux-rt-users@vger.kernel.org>,
	stable-rt <stable-rt@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Carsten Emde <C.Emde@osadl.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Daniel Wagner <daniel.wagner@suse.com>,
	Clark Williams <williams@redhat.com>
Subject: [PATCH RT] Linux v5.10.226-rt118-rc1
Message-ID: <Zy_ZZWELEwU8f0VY@uudg.org>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Dear RT Folks,

This is the RT stable review cycle of patch v5.10.226-rt118-rc1.

Please scream at me if I messed something up. Please test the patches
too.

The -rc release is also available on kernel.org

  https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

on the v5.10-rt-next branch.

If all goes well, this patch will be converted to the next main
release on 2024-11-15.

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis


Changes from v5.10.225-rt117:

There was a merge conflict due to the backport of 1401da1486dc1 ("rtmutex:
Drop rt_mutex::wait_lock before scheduling"). This commit added the lock
argument to rt_mutex_handle_deadlock function.


diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index b110fc57f7330..0b40709c3285b 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -1591,6 +1591,7 @@ __rt_mutex_slowlock(struct rt_mutex *lock, int state,
 }
 
 static void rt_mutex_handle_deadlock(int res, int detect_deadlock,
+				     struct rt_mutex *lock,
 				     struct rt_mutex_waiter *w)
 {
 	/*
@@ -1600,6 +1601,8 @@ static void rt_mutex_handle_deadlock(int res, int detect_deadlock,
 	if (res != -EDEADLOCK || detect_deadlock)
 		return;
 
+	raw_spin_unlock_irq(&lock->wait_lock);
+
 	while (1) {
 		set_current_state(TASK_INTERRUPTIBLE);
 		schedule();
@@ -1730,7 +1733,7 @@ int __sched rt_mutex_slowlock_locked(struct rt_mutex *lock, int state,
 		remove_waiter(lock, waiter);
 		/* ww_mutex wants to report EDEADLK/EALREADY, let it */
 		if (!ww_ctx)
-			rt_mutex_handle_deadlock(ret, chwalk, waiter);
+			rt_mutex_handle_deadlock(ret, chwalk, lock, waiter);
 	} else if (ww_ctx) {
 		ww_mutex_account_lock(lock, ww_ctx);
 	}

