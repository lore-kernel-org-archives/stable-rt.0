Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AEE1350DC
	for <stable-rt@vger.kernel.org>; Fri, 16 Feb 2024 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708103574; cv=none; b=td5DAESK1fPR7oGt9m/AlGb84Bgwg0iF1tEJOMDDqzRjqO1PwxNAWoddrxmEiK8g2dyQPNyW5ecnHCde1mnovW5D0dLDJxHmzshC9mwCIdUGx8lm1cN3LlXTD4ur4vEeo6AH23TEh23U+WZEPW04nTFgi7zuEH39c1XNdoQ+ksw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708103574; c=relaxed/simple;
	bh=S/+yemvHZgVdz8mxKtnq9ho60IBky1Q7ZHlY/toMv5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lds8MSz6I/v//oubCcZ21cP1A+J6t9wAXkAC3AhcBHhecvAVWElZHwh77VwLLrK8cwl48Nf/a5GfVP7HmW7o69gEAZziuHfz2Z8itqz5qexG0/Ikx5hrtuLLzytClj5IO+zgFkScv/mHLAmXSRi7Yj3QRWsuu8prWrntdNb56Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (1024-bit key) header.d=siemens.com header.i=felix.moessbauer@siemens.com header.b=O8hQ8Rd5; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=siemens.com header.i=felix.moessbauer@siemens.com header.b="O8hQ8Rd5"
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20240216171242f6b99388d06444590b
        for <stable-rt@vger.kernel.org>;
        Fri, 16 Feb 2024 18:12:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Aogezgsootqf6Y+vTCDLAqgmqqzcNfdcg3Nqq5gQ8Sc=;
 b=O8hQ8Rd5mQ2+6dkZmWk0xLJKTKif5E+H5Dla9sFRLTaxzss8+/j8fc5G5K27WzFzCaLFQe
 DXmWyJTy9zFZd/OQWUHbx4PokqQPezGf4hFPiDWvKvLDa59OKiHkp/gL7ibKftL5NkDVLR88
 rqD1IADNA3rNEzFeDlJk7KhIfHlfk=;
From: Felix Moessbauer <felix.moessbauer@siemens.com>
To: stable-rt@vger.kernel.org
Cc: bigeasy@linutronix.de,
	petr.ivanov@siemens.com,
	jan.kiszka@siemens.com,
	Davidlohr Bueso <dave@stgolabs.net>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH][5.10, 5.15, 6.1][1/1] hrtimer: Ignore slack time for RT tasks in schedule_hrtimeout_range()
Date: Fri, 16 Feb 2024 18:11:56 +0100
Message-Id: <20240216171156.569294-2-felix.moessbauer@siemens.com>
In-Reply-To: <20240216171156.569294-1-felix.moessbauer@siemens.com>
References: <20240216171156.569294-1-felix.moessbauer@siemens.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1321639:519-21489:flowmailer

From: Davidlohr Bueso <dave@stgolabs.net>

While in theory the timer can be triggered before expires + delta, for the
cases of RT tasks they really have no business giving any lenience for
extra slack time, so override any passed value by the user and always use
zero for schedule_hrtimeout_range() calls. Furthermore, this is similar to
what the nanosleep(2) family already does with current->timer_slack_ns.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/r/20230123173206.6764-3-dave@stgolabs.net
---
 kernel/time/hrtimer.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index ede09dda36e9..0aebb88f1c11 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2161,7 +2161,7 @@ void __init hrtimers_init(void)
 /**
  * schedule_hrtimeout_range_clock - sleep until timeout
  * @expires:	timeout value (ktime_t)
- * @delta:	slack in expires timeout (ktime_t)
+ * @delta:	slack in expires timeout (ktime_t) for SCHED_OTHER tasks
  * @mode:	timer mode
  * @clock_id:	timer clock to be used
  */
@@ -2188,6 +2188,13 @@ schedule_hrtimeout_range_clock(ktime_t *expires, u64 delta,
 		return -EINTR;
 	}
 
+	/*
+	 * Override any slack passed by the user if under
+	 * rt contraints.
+	 */
+	if (rt_task(current))
+		delta = 0;
+
 	hrtimer_init_sleeper_on_stack(&t, clock_id, mode);
 	hrtimer_set_expires_range_ns(&t.timer, *expires, delta);
 	hrtimer_sleeper_start_expires(&t, mode);
@@ -2207,7 +2214,7 @@ EXPORT_SYMBOL_GPL(schedule_hrtimeout_range_clock);
 /**
  * schedule_hrtimeout_range - sleep until timeout
  * @expires:	timeout value (ktime_t)
- * @delta:	slack in expires timeout (ktime_t)
+ * @delta:	slack in expires timeout (ktime_t) for SCHED_OTHER tasks
  * @mode:	timer mode
  *
  * Make the current task sleep until the given expiry time has
@@ -2215,7 +2222,8 @@ EXPORT_SYMBOL_GPL(schedule_hrtimeout_range_clock);
  * the current task state has been set (see set_current_state()).
  *
  * The @delta argument gives the kernel the freedom to schedule the
- * actual wakeup to a time that is both power and performance friendly.
+ * actual wakeup to a time that is both power and performance friendly
+ * for regular (non RT/DL) tasks.
  * The kernel give the normal best effort behavior for "@expires+@delta",
  * but may decide to fire the timer earlier, but no earlier than @expires.
  *
-- 
2.39.2

