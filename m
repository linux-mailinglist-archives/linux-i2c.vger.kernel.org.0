Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612884D53FF
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Mar 2022 22:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243886AbiCJV6k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 16:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344172AbiCJV6j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 16:58:39 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00B922BFB
        for <linux-i2c@vger.kernel.org>; Thu, 10 Mar 2022 13:57:35 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id z12-20020a17090ad78c00b001bf022b69d6so6463139pju.2
        for <linux-i2c@vger.kernel.org>; Thu, 10 Mar 2022 13:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w4Y+Lwk1hxC/AzbSOkvNowZDQu7xoVwVAdWXCpTd7iY=;
        b=usskVvQqWI3CqIP2k6/6rOXGKMUhmfxkfrSF1cXnVJq149jet1G+r0plR4w+i8MyPG
         oesVFjDDNXXdP/gQxs6vewfPg6FdsyO/dsKUXKNoMKInxCwWqnNLoPmRfkPefgEU95ym
         yHnT5G4jKf2c30FiaoCMc79oUrCnVE8QcLbQK5GGUcLLK2tINEzhBASl9BSf5Eu/66XK
         A31Tq43oUzKsttIHjOOIKkxYr5Vih4Zajgh0NFZ50v0rX3qDctXn/6/fgKlhRqPIWpEC
         dcQBexLvmF5UMcYC/5l1agGw40xewueH8iVOYf6j15LQegpplax4qg2V9YmCPWGHkQJV
         V1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w4Y+Lwk1hxC/AzbSOkvNowZDQu7xoVwVAdWXCpTd7iY=;
        b=oU1IcWOL9+Wazw/Tc0k+4SzIF3E1Be2IZiDjpvUU1R65CCoEX/fwmPtmnYASu6p4jr
         tHkLBn0xsajzATHANqXH3wF1yL0Ncx2Ery+FoKVk4wWyvxPTIxlI1+91ldJaz9mWzi5l
         46BHDuKgP1JTIBAMgSZ0e56f1cJmKT76W87jvyod7nIWhZDVajI90zL5nf7d85FyBHgA
         2nEZHHNO33TXfihQaFylyrXMwcwsTXLSjSiXKc/QpbLluImgTFT5H43wLALDG5ua5w7w
         aXdPvTSriwE46gQ/55T4048KlNrZdUpAqWB2E6BZKN1/Xw5gmwdnFUkNI5lAuXEKxP7g
         i7wg==
X-Gm-Message-State: AOAM531D9jMzgdP3vLOJvnH6NzAovIIMN0yq65Ne35+MtUQVhlsGRAdf
        r46r/mVNOtM/By+89nUo27R3u3QEIfp6m9ondcp/nw==
X-Google-Smtp-Source: ABdhPJxe9cOkuuoZz6buPSByikFfAdF4xDIMOTKNFDOHkORurH8mAW/76lYdvFvqvFnvCsdOYphItD4OZoQrBzEcCPU=
X-Received: by 2002:a17:90a:eb0b:b0:1be:ddea:3d7b with SMTP id
 j11-20020a17090aeb0b00b001beddea3d7bmr7242237pjz.90.1646949455381; Thu, 10
 Mar 2022 13:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20220310142236.192811-1-jsd@semihalf.com> <5612fbbe-a42b-997e-2375-6d5f0c53bdea@linux.intel.com>
In-Reply-To: <5612fbbe-a42b-997e-2375-6d5f0c53bdea@linux.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Thu, 10 Mar 2022 22:57:24 +0100
Message-ID: <CAOtMz3Nf6jpX8dGMEr9tGgp-AJdOPx605NS+aPOMn2ryRYwsqw@mail.gmail.com>
Subject: Re: [PATCH -next] i2c: designware: Add helper to remove redundancy
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 10 mar 2022 o 15:52 Jarkko Nikula
<jarkko.nikula@linux.intel.com> napisa=C5=82(a):
>
> On 3/10/22 16:22, Jan Dabros wrote:
> > Simplify code by adding an extra static function for sending I2C
> > requests and verifying results.
> >
> > Signed-off-by: Jan Dabros <jsd@semihalf.com>
> > ---
> >   drivers/i2c/busses/i2c-designware-amdpsp.c | 44 ++++++++++++---------=
-
> >   1 file changed, 24 insertions(+), 20 deletions(-)
> >
> Do I remember correctly was this suggested by Andy? I.e. to give kudos
> to him if that was the case:
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Definitely! Actually I wasn't aware of such a tag, will add this in v2.

>
> > diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/b=
usses/i2c-designware-amdpsp.c
> > index c64e459afb5c..cc758792f150 100644
> > --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> > +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> > @@ -229,6 +229,26 @@ static int psp_send_i2c_req(enum psp_i2c_req_type =
i2c_req_type)
> >       return ret;
> >   }
> >
> > +static int psp_send_i2c_req_check_err(enum psp_i2c_req_type request)
> > +{
> > +     int status;
> > +
> > +     status =3D psp_send_i2c_req(request);
> > +     if (status) {
> > +             if (status =3D=3D -ETIMEDOUT)
> > +                     dev_err(psp_i2c_dev, "Timed out waiting for PSP t=
o %s I2C bus\n",
> > +                             (request =3D=3D PSP_I2C_REQ_ACQUIRE) ?
> > +                             "release" : "acquire");
> > +             else
> > +                     dev_err(psp_i2c_dev, "PSP communication error\n")=
;
> > +
> > +             dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive hos=
t usage\n");
> > +             psp_i2c_mbox_fail =3D true;
> > +     }
> > +
>
> Does it make sense to have these inside the psp_send_i2c_req() and get
> rid of this new middle function? I mean psp_send_i2c_req() is called now
> only from here so can it do these common error prints and set
> "psp_i2c_mbox_fail =3D true"?

I like this idea, please take a look at v2.

Best Regards,
Jan
