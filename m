Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F15258065
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 20:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgHaSKZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 14:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbgHaSKY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 14:10:24 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA66C061573
        for <linux-i2c@vger.kernel.org>; Mon, 31 Aug 2020 11:10:24 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e23so6150145otk.7
        for <linux-i2c@vger.kernel.org>; Mon, 31 Aug 2020 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VjcOX+O6+Q0wVLVy5iOGuljY1HLUCKGrM2Zx4jaHF0E=;
        b=vZaqRz6gPaztwYQyRjYHR8xtBaNnsakq7VS7gV1Jc2XbRTtD3KOy2/T7zfVrl7Ux41
         m1n0QBSe07CxKazXvcJNC0qphB0ZM+F/RZjGclPdxPOyRIHHRotMD2u8Reilqq3Myt9t
         rgTYnm4TiWZ6QqaLHb5/J3a0tRHoXezu30kMr8imgBwyjdcnydc9nDu7FeRKyB6s3E4x
         6/yDTDyrcJg7rJiR9v10GikVAZHmp/mz1hT3K8ZvwaEwHbrwDRLYkgVQop12EIUogMcO
         AvUJnuyQ5gFNW5MnufPLajm+bduenZYdgux9DfNckAmmArxY9lp3WMU2oFqRZAX56c5W
         ajvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VjcOX+O6+Q0wVLVy5iOGuljY1HLUCKGrM2Zx4jaHF0E=;
        b=d+54rA9YpRETRXiYMuIbIP1e5Mwlx8XTOoC2pq7MYFrwfsAUCfy+xG/rauXhuMQ5Ne
         YItApF0DDkpQFAmjIxSybcx/Gv6sCAhVnRp6MFdtQyksStamoxde4/frAdNPK16fdgR9
         6l9O1ZnzVwwcaet5n2kiH8kCS0pM+jk25siaHymz/I38jiYnxuxYN+m1dsxFCE82P2Ho
         IHecTSdPoSZBEmDygGfx/lY7er/TVVb6Uaa+fvQoIz4WhA+M242rj2TqBWQTnNZ6iW/T
         WOOeoyEQ8Zekk842zhfcmJ9GZXm2ebUHDSrL5wA1+O20FaPMdZ2sR8ATX7mSGCz4iSNk
         VbGw==
X-Gm-Message-State: AOAM530Ts9Q/n2xtaOP3GaqksihGr+i6ZHq/5dmjWljoy3OC5fDsFXDh
        jdnF+ODvDqnbwuSfp5ZlNBCVXHv30XQoDFJuWg5Mpg==
X-Google-Smtp-Source: ABdhPJwOgUYMtjt9QOITuY87oezIiwUst1TAAS19PpHboVYHCLYkQhWhxobP65iEGxxUZlwrpCSiZH+ta1y30jMxkos=
X-Received: by 2002:a9d:7f06:: with SMTP id j6mr1714141otq.274.1598897423402;
 Mon, 31 Aug 2020 11:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200830213121.239533-1-tali.perry1@gmail.com> <CACPK8Xev4w4BxrxR1zQPk=wiHCK2fSGD9tEeAQwPe_uayGw_CA@mail.gmail.com>
In-Reply-To: <CACPK8Xev4w4BxrxR1zQPk=wiHCK2fSGD9tEeAQwPe_uayGw_CA@mail.gmail.com>
From:   Alex Qiu <xqiu@google.com>
Date:   Mon, 31 Aug 2020 11:10:12 -0700
Message-ID: <CAA_a9xKVEA-6n=rMA8Sk6zJpWV4_qGCcXwN7kFUFpJKuDiG=Bg@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: npcm7xx: Fix timeout calculation
To:     Joel Stanley <joel@jms.id.au>
Cc:     Tali Perry <tali.perry1@gmail.com>, Kun Yi <kunyi@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Aug 30, 2020 at 8:35 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Sun, 30 Aug 2020 at 21:31, Tali Perry <tali.perry1@gmail.com> wrote:
> >
> > timeout_usec value calculation was wrong, the calculated value
> > was in msec instead of usec.
> >
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Alex Qiu <xqiu@google.com>
>
> Cheers,
>
> Joel
>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> > index 75f07138a6fa..dfcf04e1967f 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2093,8 +2093,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> >                 }
> >         }
> >
> > -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> > -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> > +       /*
> > +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> > +        * 2: double the timeout for clock stretching case
> > +        * 9: bits per transaction (including the ack/nack)
> > +        */
> > +       timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
> >         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
> >         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
> >                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
> >
> > base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
> > --
> > 2.22.0
> >
