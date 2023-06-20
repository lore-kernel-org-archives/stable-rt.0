Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954FAEB64D7
	for <stable-rt@archiver.kernel.org>; Tue, 20 Jun 2023 15:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbjFTPEg (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Tue, 20 Jun 2023 11:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbjFTPEV (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Tue, 20 Jun 2023 11:04:21 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B13E170C
        for <stable-rt@vger.kernel.org>; Tue, 20 Jun 2023 08:03:32 -0700 (PDT)
Date:   Tue, 20 Jun 2023 17:03:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1687273411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=PmCW5gmayAmCF7VGn/riRqIETVSW1nqOciIhdYKQE7w=;
        b=OQMWtJNn1UGfpG8SUqG5DerL51tyGr3zIWQhKf7nRPTZZrds5gS82ZLebkRqzBoF5YP+WI
        6m+Gn7lt8upq2KkJFOCNgqp5DoMPH7cIl6R32e3QvhOuH6NMeCBNjdqtJL42xE2yIlrGSP
        WcTi2nbzHYUVaW3ehwF2UoTAi+yUD2K3IKo2gAOQOZpbOMEdaz+MBAFu8QY1Cfez83FQG7
        EEoCJot9Lf8ECxYN9wFtXGTHgVrckoY1DRJeAZjZ2TpF0+NMx/zPeigww3fD7EXYzlzNIN
        s2cK8O+XoSpuNehP6rQ916ho6lk5mgE8u0w1vEGFLZEfBIIXNGkEz84DeMuJJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1687273411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=PmCW5gmayAmCF7VGn/riRqIETVSW1nqOciIhdYKQE7w=;
        b=/p5VknW/jm46ADDH+dNs83ilFvgaw3uou/WSuSiwqvhYSE0fAL1+JZVu3zEJ73kvfoOPUb
        +0XLzSJU2HYjsWDQ==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     stable-rt@vger.kernel.org
Subject: Stable backports
Message-ID: <20230620150329.6r4xxvHu@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

Hi,

I've been looking over my queue and which patches vanishes (as in
applied somewhere) and did not show up in the stable tree. Here is a
list of some suggestions:

- 7eb16f23b9a41 ("io-mapping: don't disable preempt on RT in io_mapping_map_atomic_wc().")
- 286deb7ec03d9 ("locking/rwbase: Mitigate indefinite writer starvation")
- 1c0908d8e4416 ("rtmutex: Add acquire semantics for rtmutex lock acquisition slow path")
  (is in v6.1 but not in v5.15)
- b8a04a538ed47 ("revert: "softirq: Let ksoftirqd do its job"")
- 38cdd83a47fb2 ("tracing/timer: Add missing hrtimer modes to decode_hrtimer_mode().")

Sebastian
