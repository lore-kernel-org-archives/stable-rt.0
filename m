Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EFEC04A6A
	for <stable-rt@archiver.kernel.org>; Wed,  9 Aug 2023 13:51:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbjHINvs (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Wed, 9 Aug 2023 09:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbjHINvr (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Wed, 9 Aug 2023 09:51:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BACB1BF2
        for <stable-rt@vger.kernel.org>; Wed,  9 Aug 2023 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691589063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8GW7xIckDoapHXLu2QR3ZBKEoilYE3+FDusUN+SWSYQ=;
        b=EdbxLdYV8uDiorxZJwr8zEzZdvX4NC5Mhsn6HeMoW2VJVcgBd9D0WgGzZ2FiztPlVgWQYU
        /pZ2Rda+jL00wd2gfXd928zblXLX7Reakcp7adPfNragkZscE85M/lrpMFNyldht2+y0ie
        pOtv9Uz+kyTWIjipadLOYw6xh/0qszo=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-8DpGyYwmNti84MGykjBJdg-1; Wed, 09 Aug 2023 09:51:01 -0400
X-MC-Unique: 8DpGyYwmNti84MGykjBJdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C636B28EA6EF;
        Wed,  9 Aug 2023 13:51:00 +0000 (UTC)
Received: from localhost (unknown [10.22.8.88])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 68CCCC15BAE;
        Wed,  9 Aug 2023 13:51:00 +0000 (UTC)
Date:   Wed, 9 Aug 2023 10:50:59 -0300
From:   "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-rt-users <linux-rt-users@vger.kernel.org>,
        stable-rt <stable-rt@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Wagner <daniel.wagner@suse.com>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH RT 0/3] Linux v4.14.320-rt152-rc1
Message-ID: <ZNOZw6ubyVkrqw+J@uudg.org>
References: <20230808163520.305842-1-lgoncalv@redhat.com>
 <20230809081738.qhWKi8Os@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230809081738.qhWKi8Os@linutronix.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

On Wed, Aug 09, 2023 at 10:17:38AM +0200, Sebastian Andrzej Siewior wrote:
> On 2023-08-08 13:35:17 [-0300], Luis Claudio R. Goncalves wrote:
> > Dear RT Folks,
> > 
> > This is the RT stable review cycle of patch 4.14.320-rt152-rc1.
> > 
> > Please scream at me if I messed something up. Please test the patches
> > too.
> 
> Looks good, just a nitpick: If you add 2/3 you don't need 1/3.

Agreed. I just kept 1/3 because I wanted to both give credit to André Pribil
for reporting the problem and also highlight the symptom he observed.
Should I add that as a note on 2/3 and drop the first patch?

Thanks for reviewing the RC!
Luis

