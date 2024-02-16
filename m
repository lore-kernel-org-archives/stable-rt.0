Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EE8132C14
	for <stable-rt@vger.kernel.org>; Fri, 16 Feb 2024 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708103571; cv=none; b=q4TBcagpuG7oIEnUU3MuX5iPxrX8vxN1AF/Bv/CH06tn4TzpUvG69tN+dK4Sst8g5kky5J8CX0U6m//XHLYx6v6yF7nOdatNE4Tpcx+RalJP62RhAgYYjf/8Zz8xzANHmrxtP8DUjVeQzmDgsivWKe76paSOM2zrW7e+br7Bv50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708103571; c=relaxed/simple;
	bh=n1v3NRXwxyRtyxpCEzmUxF08CXMN3RocTys00ef1kqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JQS6YNS0yAY6aPsYhkPTVr5pyxBDjVedrGyfSU5zpXEOFmLuY3lRez8+1GS7+lX9rbqQSmg9d3V6k7Ah/j0UKoES1F+vmJUM4Kn8LHP7/BdPCB4E5ReXHGm70s+sCySk6ISJaD8NDKfL9tI5NBmKiuvhJSIikyV0Gw/Vd03KvvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (1024-bit key) header.d=siemens.com header.i=felix.moessbauer@siemens.com header.b=bfY+BVou; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=siemens.com header.i=felix.moessbauer@siemens.com header.b="bfY+BVou"
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202402161712386f586d6eba8d204b14
        for <stable-rt@vger.kernel.org>;
        Fri, 16 Feb 2024 18:12:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=C/qoZPCJcnCyni1HoQmKacGfjqKKV4MiTxseBfGZQ3M=;
 b=bfY+BVou0Y8H2hnm1HVbRksdZmyCCSYTZVMxsGqdZ0DVDd7/C2lfjWNmj4BHSXapEam480
 pyjNGZUGVbgqeZpBAyG+Yu+pKRH1+aGcuoem95lmBN+w4daz4ewEhiazlF0cVSyfgk0z5nJz
 0UYEtL0pXDdwi+d6JISpnviY/e860=;
From: Felix Moessbauer <felix.moessbauer@siemens.com>
To: stable-rt@vger.kernel.org
Cc: bigeasy@linutronix.de,
	petr.ivanov@siemens.com,
	jan.kiszka@siemens.com,
	Felix Moessbauer <felix.moessbauer@siemens.com>
Subject: [PATCH][5.10, 5.15, 6.1][0/1] hrtimer: Ignore slack time for RT tasks
Date: Fri, 16 Feb 2024 18:11:55 +0100
Message-Id: <20240216171156.569294-1-felix.moessbauer@siemens.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1321639:519-21489:flowmailer

This suggests a fix from 6.3 for stable that fixes a nasty bug in the
timing behavior of periodic RT tasks w.r.t timerslack_ns. While the
documentation clearly states that the slack time is ignored for RT tasks,
this is not the case for the hrtimer code. This patch fixes the issue and
applies to all stable kernels.

Best regards,
Felix Moessbauer
Siemens AG

Davidlohr Bueso (1):
  hrtimer: Ignore slack time for RT tasks in schedule_hrtimeout_range()

 kernel/time/hrtimer.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.39.2

