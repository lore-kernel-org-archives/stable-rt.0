Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C8AEB64DC
	for <stable-rt@archiver.kernel.org>; Thu,  6 Jul 2023 15:05:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjGFPFb (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Thu, 6 Jul 2023 11:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbjGFPFa (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Thu, 6 Jul 2023 11:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0EF8F
        for <stable-rt@vger.kernel.org>; Thu,  6 Jul 2023 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688655880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=+3JC41UdnpV2dDMh3AKArgC5wxDoafbnljXyCs9FZOk=;
        b=hFWybZ31Joo9odHu+aj3CM0D67lyOAszfMYs2SLSy/fuv7CsJmWY7PK2HmyjKrewqT9EfJ
        93FGZ/UXQOU9vvbcBt9fvEkAVZgXsMhCXWkPNmr/SxrAn5O54PXIsv1kLhGH5YHoRyr8Og
        nAzA61k50iysw2HQki7QNA+kI6hYApU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-uYVHhTMROXSomnfHLl0iHw-1; Thu, 06 Jul 2023 11:04:37 -0400
X-MC-Unique: uYVHhTMROXSomnfHLl0iHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7CEE881B27;
        Thu,  6 Jul 2023 15:04:35 +0000 (UTC)
Received: from localhost (unknown [10.22.17.175])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3506B1121331;
        Thu,  6 Jul 2023 15:04:35 +0000 (UTC)
Date:   Thu, 6 Jul 2023 12:04:34 -0300
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
        Pavel Machek <pavel@denx.de>,
        Jeff Brady <jeffreyjbrady@gmail.com>,
        Luis Goncalves <lgoncalv@redhat.com>
Subject: [ANNOUNCE] 5.10.186-rt91
Message-ID: <ZKbYAjRNE2uAgaUo@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

Hello RT-list!

I'm pleased to announce the 5.10.186-rt91 stable release.

This release is just an update to the new stable 5.10.186
version and no RT specific changes have been made.

You can get this release via the git tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

  branch: v5.10-rt
  Head SHA1: cf98372ffae9de63a04f415d8ca802c82a26747e

Or to build 5.10.186-rt91 directly, the following patches should be applied:

  https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.10.tar.xz

  https://www.kernel.org/pub/linux/kernel/v5.x/patch-5.10.186.xz

  https://www.kernel.org/pub/linux/kernel/projects/rt/5.10/older/patch-5.10.186-rt91.patch.xz

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis

