Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E28E9371F
	for <stable-rt@archiver.kernel.org>; Mon,  9 Oct 2023 23:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378152AbjJIXUr (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Mon, 9 Oct 2023 19:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379005AbjJIXUr (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Mon, 9 Oct 2023 19:20:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C2C9E
        for <stable-rt@vger.kernel.org>; Mon,  9 Oct 2023 16:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696893599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=Ra59s6ELCEBLlS89Z2HAfelqi5/68EEl27Q4FvjToO4=;
        b=jILEbJfBFrwXFUGLbNimzeUP9tHIwp5WuNGBcwFTslE0ntJQ55N/dxvzxhOu2/z59QMNxt
        KUblosO8zcc48amI4wjxK090m99k+Oq6gEmfvVVhLO2IdZCXugb8gPc5PKPbQWrGWVIYqz
        ZnuPdZ9F6fvX8p+sXlzLEa5/Pg0PYfI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-7Rcrwmj9M4-f5kjXXYEM-g-1; Mon, 09 Oct 2023 19:19:34 -0400
X-MC-Unique: 7Rcrwmj9M4-f5kjXXYEM-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB3BE8039C1;
        Mon,  9 Oct 2023 23:19:33 +0000 (UTC)
Received: from localhost (unknown [10.22.33.188])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D80851C060AE;
        Mon,  9 Oct 2023 23:19:32 +0000 (UTC)
Date:   Mon, 9 Oct 2023 20:19:31 -0300
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
Subject: [ANNOUNCE] 4.14.326-rt155
Message-ID: <ZSSKg0eQftFhia9j@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

Hello RT-list!

I'm pleased to announce the 4.14.326-rt155 stable release.

This release is an update to the new stable 4.14.326-rt155
version and no RT-specific changes have been performed.

You can get this release via the git tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

  branch: v4.14-rt
  Head SHA1: 1d10d09bd19b5eb5e90c5585afb308207e9c683f

Or to build 4.14.326-rt155 directly, the following patches should be applied:

  https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.14.tar.xz

  https://www.kernel.org/pub/linux/kernel/v4.x/patch-4.14.326.xz

  https://www.kernel.org/pub/linux/kernel/projects/rt/4.14/older/patch-4.14.326-rt155.patch.xz

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis

