Return-Path: <stable-rt-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE59C25B67
	for <stable-rt@archiver.kernel.org>; Thu, 26 Oct 2023 13:13:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjJZNNS (ORCPT <rfc822;stable-rt@archiver.kernel.org>);
        Thu, 26 Oct 2023 09:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjJZNNR (ORCPT
        <rfc822;stable-rt@vger.kernel.org>); Thu, 26 Oct 2023 09:13:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32540196
        for <stable-rt@vger.kernel.org>; Thu, 26 Oct 2023 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698325949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/HpXK4mdyINOqxAS7fhfn7FIiboQopESApls21y/cgw=;
        b=JkANQ9q1HgtApZGOvZvBrq9zCSMb/PPD/fINd7tS7BNiWSVNfMpgRCJkpZ1G4qHD1fiZdp
        D3/D+d4HbZgDhUcCpw7sP50XY3LcscVV4mAIDuPiAGFM5RETtIYW7SGPaW0Z7P35lSTF/X
        KZlFVO42S68YPLHA/PNHLk7JkzM5058=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-x2aO2aSGNUyF4ZBOLHF1qQ-1; Thu, 26 Oct 2023 09:12:28 -0400
X-MC-Unique: x2aO2aSGNUyF4ZBOLHF1qQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-32f521150aaso442334f8f.1
        for <stable-rt@vger.kernel.org>; Thu, 26 Oct 2023 06:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698325947; x=1698930747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HpXK4mdyINOqxAS7fhfn7FIiboQopESApls21y/cgw=;
        b=MfxKXLW47j8iHY+Idci414Hcdz/BCsrxaJu8Pst0OzM/8yeN+620n8gDpMNobTB7eh
         O3C/FCz6lX8HB9+sLwsBoYmTR59g1pgMWz7OFVsU9qkpSmlawAg5nhz7c9cVgkb8kRiR
         ky5LCJOAjgMLGWZ6AcBCJxf6IhDgl9y85hXt4fUUuh6mBdbeKvSlxzDntKShHeau3CrM
         m/yhoEkE6FMcCMhPyW7uSLt+Omz/bdJQGhlzvGHJKg2F7tMMWunbXEFR8rJMPYkX5GVm
         kLeMLnKonJ7NeQROF5M7VsKPW14A1o8UF0a8PrilJTe4qrKNs63F/DAiGj1zMyivK+2a
         dHww==
X-Gm-Message-State: AOJu0Yw4ROLhm0XsscsLiPxRu4ZWVnlPhR7Aqtfysz9EjqrF9C1ELHRc
        NqzXszQypXaL1gMSSUWuUHHCS4II2aIlLYDLBJkL0aukpb75ZbdydOucH24AWdlpi46LAVUb1Wa
        X8Y3mNEUnYGXnF0wrRsbcQClMqsIDH1+23RRj
X-Received: by 2002:adf:f7c6:0:b0:32d:b8f8:2b18 with SMTP id a6-20020adff7c6000000b0032db8f82b18mr13307713wrq.32.1698325946970;
        Thu, 26 Oct 2023 06:12:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTNyBkpoN6QIkPcyX9TvEqO9IPMCYj3TtCqULJI59at+YG7ZW47helKSugNwlpNGsyGWKmIPfB+35t1ibSY6g=
X-Received: by 2002:adf:f7c6:0:b0:32d:b8f8:2b18 with SMTP id
 a6-20020adff7c6000000b0032db8f82b18mr13307703wrq.32.1698325946639; Thu, 26
 Oct 2023 06:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <ZTnL6Maa9s9ZlETp@uudg.org>
In-Reply-To: <ZTnL6Maa9s9ZlETp@uudg.org>
From:   Clark Williams <williams@redhat.com>
Date:   Thu, 26 Oct 2023 13:12:15 +0000
Message-ID: <CAMLffL_vCJbMJFatPXevi=xpZJtU157K=8m_DE7gFRUCCyrVxg@mail.gmail.com>
Subject: Re: Quick note about v5.10.199-rt97-rc1
To:     "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc:     stable-rt <stable-rt@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <stable-rt.vger.kernel.org>
X-Mailing-List: stable-rt@vger.kernel.org

I've done that in the past, but I prefer to fix it up in the merge,
that is after the merge and before the commit, fix something that I
know merged incorrectly.  I wish there was a way to 'git rebase -i'
this and just squash your fix into the merge commit, but I haven't
been able to figure out a way to do that without borking up the merge
commit. Sigh...

I'd be interested to hear how the other maintainers deal with this.

Clark

On Thu, Oct 26, 2023 at 2:18=E2=80=AFAM Luis Claudio R. Goncalves
<lgoncalv@redhat.com> wrote:
>
> Hello fellow maintainers!
>
> I just pushed v5.10.199-rt97-rc1 (v5.10-rt-next) to kernel.org for testin=
g.
>
> The merge worked flawlessly but the build test failed with an undefined
> function. That was easy to track and fix, but I am not sure if the method
> I chose for the fix is the desired one.
>
> In short, I performed the merge and then added the following patch to fix
> the build issue. Is this OK or should I have added this extra code in the
> merge?
>
> Also, for the release, should I send the usual stable update message and
> add a note such as "the following change was required to fix a build
> problem: ..."?
>
> Best regards,
> Luis
>
> ---
> net: replace raw_write_seqcount_t_begin by do_raw_write_seqcount_begin
>
> Commit a8dd21118b0fa ("seqlock: Prefix internal seqcount_t-only macros wi=
th a
> "do_""), among other changes, renames the function raw_write_seqcount_t_b=
egin
> to do_raw_write_seqcount_begin. That commit did not cover the changes fro=
m
> the RT-only commit 81ce24cd24a9e ("net: Properly annotate the try-lock fo=
r the
> seqlock"), which are fixed here.
>
> Fixes: 81ce24cd24a9e ("net: Properly annotate the try-lock for the seqloc=
k")
> Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> ---
>  include/net/sch_generic.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
> index 72be68652bb84..eee11a1c93216 100644
> --- a/include/net/sch_generic.h
> +++ b/include/net/sch_generic.h
> @@ -195,7 +195,7 @@ static inline bool qdisc_run_begin(struct Qdisc *qdis=
c)
>                  * Variant of write_seqcount_t_begin() telling lockdep th=
at a
>                  * trylock was attempted.
>                  */
> -               raw_write_seqcount_t_begin(s);
> +               do_raw_write_seqcount_begin(s);
>                 seqcount_acquire(&s->dep_map, 0, 1, _RET_IP_);
>                 return true;
>         }
> --
> 2.41.0
>

