Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9444CC7EE25
	for <stable-rt@archiver.kernel.org>; Fri,  9 Jun 2023 01:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237386AbjFIBMH (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Thu, 8 Jun 2023 21:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235563AbjFIBMG (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Thu, 8 Jun 2023 21:12:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E482D4F
        for <stable-rt@vger.kernel.org>; Thu,  8 Jun 2023 18:11:16 -0700 (PDT)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-H0rTBmLaMEGFSZDmjxQi5g-1; Thu, 08 Jun 2023 21:11:10 -0400
X-MC-Unique: H0rTBmLaMEGFSZDmjxQi5g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C8912801589;
        Fri,  9 Jun 2023 01:11:09 +0000 (UTC)
Received: from localhost (unknown [10.22.32.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 540F51121314;
        Fri,  9 Jun 2023 01:11:09 +0000 (UTC)
From:   "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To:     linux-rt-users <linux-rt-users@vger.kernel.org>,
        stable-rt <stable-rt@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Carsten Emde <C.Emde@osadl.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Daniel Wagner <daniel.wagner@suse.com>,
        Tom Zanussi <tom.zanussi@linux.intel.com>,
        Clark Williams <williams@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Jeff Brady <jeffreyjbrady@gmail.com>,
        Luis Goncalves <lgoncalv@redhat.com>
Subject: [PATCH RT 3/3] Linux 5.10.180-rt89-rc1
Date:   Thu,  8 Jun 2023 22:11:04 -0300
Message-Id: <20230609011104.967128-4-lgoncalv@redhat.com>
In-Reply-To: <20230609011104.967128-1-lgoncalv@redhat.com>
References: <20230609011104.967128-1-lgoncalv@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

v5.10.180-rt89-rc1 stable review patch.
If anyone has any objections, please let me know.

-----------


Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
---
 localversion-rt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/localversion-rt b/localversion-rt
index 666227d921a3d..d1173dc87024f 100644
--- a/localversion-rt
+++ b/localversion-rt
@@ -1 +1 @@
--rt88
+-rt89-rc1
-- 
2.40.1

