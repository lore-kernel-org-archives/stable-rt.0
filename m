Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8C5C77B7A
	for <stable-rt@archiver.kernel.org>; Tue, 30 May 2023 20:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjE3UQl (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Tue, 30 May 2023 16:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjE3UQl (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Tue, 30 May 2023 16:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A58E124
        for <stable-rt@vger.kernel.org>; Tue, 30 May 2023 13:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685477746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=KwVegJycMDx8gT6rc6pZK7hnVF5FLPwEoaEPZ3IAKo0=;
        b=g6jJLxbjz3S1a7ebYSEqcRA3ZNyyhK/xRFN7Vl6f7wfbzcuWViNsHn9nXGwAC8ebYaTTo3
        NPyUIuJrHlAuzO+UlpIMau4jgiNiVQGqhPMrcu1RpZ5MwyhKWFcg/U06GBrcas5/9x4yF3
        J+9ZX1WM7TOSRgIks5FWgV1XJgK7d6Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-OR7fTmg-MgKrCNNSmVK9bg-1; Tue, 30 May 2023 16:15:45 -0400
X-MC-Unique: OR7fTmg-MgKrCNNSmVK9bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8F663C0CEEE;
        Tue, 30 May 2023 20:15:44 +0000 (UTC)
Received: from localhost (unknown [10.22.16.189])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 415B335443;
        Tue, 30 May 2023 20:15:44 +0000 (UTC)
Date:   Tue, 30 May 2023 17:15:43 -0300
From:   "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To:     LKML <linux-kernel@vger.kernel.org>,
        linux-rt-users <linux-rt-users@vger.kernel.org>,
        stable-rt <stable-rt@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Carsten Emde <C.Emde@osadl.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Daniel Wagner <daniel.wagner@suse.com>,
        Tom Zanussi <tom.zanussi@linux.intel.com>,
        Clark Williams <williams@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Luis Goncalves <lgoncalv@redhat.com>
Subject: [ANNOUNCE] 4.14.315-rt148
Message-ID: <ZHZZbw4jJbFWxBBh@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

Hello RT-list!

I'm pleased to announce the 4.14.315-rt148 stable release.

This release is just an update to the new stable 4.14.315
version and no RT specific changes have been made.

You can get this release via the git tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

  branch: v4.14-rt
  Head SHA1: 1b54c8a70b1c44c89fb04f131e6721bd2bbfc9d9

Or to build 4.14.315-rt148 directly, the following patches should be applied:

  https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.14.tar.xz

  https://www.kernel.org/pub/linux/kernel/v4.x/patch-4.14.315.xz

  https://www.kernel.org/pub/linux/kernel/projects/rt/4.14/older/patch-4.14.315-rt148.patch.xz

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis

