Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072C448ABB3
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 11:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237965AbiAKKvf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 05:51:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237719AbiAKKvf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jan 2022 05:51:35 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFE1C06173F;
        Tue, 11 Jan 2022 02:51:34 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id kc16so18000095qvb.3;
        Tue, 11 Jan 2022 02:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WW/ErXuM7aTThn8DyOtAxfHC+Lf/dAu6aF/ysr/kDtQ=;
        b=iy8TwFF44l+/tUgYTLhp7Cm+F03uo/wvxz6bjpch4q9ZrjF8KY4CTo4cH0pcLNIPQZ
         WgmTqDF14LmBZTQ/CK0AJ6CZrQ1V6VVJ+Gur0yR78DsI7OqeyG15uEZr+KwjW7w3ABhE
         151Tv7E2gmimx0dpdcSfYjPPuWUqmpfXDtEEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WW/ErXuM7aTThn8DyOtAxfHC+Lf/dAu6aF/ysr/kDtQ=;
        b=y9iga9Mwl6MJyqvfOCNo0lN6cUHDwrzK19s3hV5fPifp2rLwdIHbYjhP5KbwiYeGCD
         zA37kM4vm0S+nvf7NN06h3C/tKzFuBUyF0Ptb6n0RXG3WRjCcpna8pydUQ/pTIXbmzBQ
         Ny+R8nR0mZSMm559LROWb7yDP/BZqqrpxmeyDP2I/H8xZGrgzLgqYq1RA9QklYyxHLuF
         RYKJFXnTiAq3xPy4smNGWJno2M8TBZvgkkOvPFiGSfTIvwty/yCFNDfsKIxkKZRTWjt4
         +70vZuiGXV+Maz+aUBoMsxyzMjaKY6WEsw7UQBwSLgaN5/OmBpdqCxeiHBIWklCKlEmJ
         OPdA==
X-Gm-Message-State: AOAM5338WYczeZ49GCiOj6hqx6T6q8nsPyHQukoNfMJ21m0V5jiNoK3H
        dgAqVHDViF2xfgcWfb0pmmszpJ9aCWbY6IdzG+8=
X-Google-Smtp-Source: ABdhPJwt9p/tA3IkzY4pwfvtSr0KZDZ035KTUfqJ7iLltePV28fkkpcn/7KMIUQ58fumeDWt58a21jTwY1bs+1+spiw=
X-Received: by 2002:a05:6214:2522:: with SMTP id gg2mr3178151qvb.65.1641898293761;
 Tue, 11 Jan 2022 02:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20220109132613.122912-1-guoheyi@linux.alibaba.com> <ad5e5438-4a3f-2447-4af3-7caa91e7252a@linux.alibaba.com>
In-Reply-To: <ad5e5438-4a3f-2447-4af3-7caa91e7252a@linux.alibaba.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 11 Jan 2022 10:51:22 +0000
Message-ID: <CACPK8XcYp9iAD3fjBQCax41C-1UpA+1AQW3epyEooYzNLt7R5g@mail.gmail.com>
Subject: Re: [PATCH] drivers/i2c-aspeed: avoid invalid memory reference after timeout
To:     Heyi Guo <guoheyi@linux.alibaba.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 11 Jan 2022 at 07:52, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
> Hi all,
>
> Any comments?
>
> Thanks,
>
> Heyi
>
> =E5=9C=A8 2022/1/9 =E4=B8=8B=E5=8D=889:26, Heyi Guo =E5=86=99=E9=81=93:
> > The memory will be freed by the caller if transfer timeout occurs,
> > then it would trigger kernel panic if the peer device responds with
> > something after timeout and triggers the interrupt handler of aspeed
> > i2c driver.
> >
> > Set the msgs pointer to NULL to avoid invalid memory reference after
> > timeout to fix this potential kernel panic.

Thanks for the patch. How did you discover this issue? Do you have a
test I can run to reproduce the crash?

Can you provide a Fixes tag?

Do other i2c master drivers do this? I took a quick look at the meson
driver and it doesn't appear to clear it's pointer to msgs.

> >
> > Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> >
> > -------
> >
> > Cc: Brendan Higgins <brendanhiggins@google.com>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: linux-i2c@vger.kernel.org
> > Cc: openbmc@lists.ozlabs.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-aspeed@lists.ozlabs.org
> > ---
> >   drivers/i2c/busses/i2c-aspeed.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-a=
speed.c
> > index 67e8b97c0c950..3ab0396168680 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -708,6 +708,11 @@ static int aspeed_i2c_master_xfer(struct i2c_adapt=
er *adap,
> >               spin_lock_irqsave(&bus->lock, flags);
> >               if (bus->master_state =3D=3D ASPEED_I2C_MASTER_PENDING)
> >                       bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
> > +             /*
> > +              * All the buffers may be freed after returning to caller=
, so
> > +              * set msgs to NULL to avoid memory reference after freei=
ng.
> > +              */
> > +             bus->msgs =3D NULL;
> >               spin_unlock_irqrestore(&bus->lock, flags);
> >
> >               return -ETIMEDOUT;
