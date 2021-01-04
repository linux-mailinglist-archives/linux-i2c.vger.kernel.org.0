Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10BE2E97ED
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jan 2021 16:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbhADPAe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jan 2021 10:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbhADPAd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Jan 2021 10:00:33 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6192AC061796
        for <linux-i2c@vger.kernel.org>; Mon,  4 Jan 2021 06:59:53 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id x16so37175918ejj.7
        for <linux-i2c@vger.kernel.org>; Mon, 04 Jan 2021 06:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y1GDTPXFza3htMu5VSeDCpCXqmyO9V6AlVTJM1pcQqE=;
        b=BHcfEm1NmH48lFrueHkUvZCdPGmAbtG4nX8bUdBWK4kYRC+fmKonryjnONBPngR3QG
         KATLbWKnOzri7uNBERQNj/BWmkdiYfIPBlauI2zXZ55OtiuPHDb7laagpxAuDLG19icr
         Pkbqgd7l4RTUtMTFfamT2/NrN1M0dWDjBYecPnw8UPuneIW1vHevQvSxxzl0bGp8CIdi
         yM+6GMnrK+DPz49aXK88M+xDcky9vtdgkzpC7wxaCPU6jh9clwvrJrBTZ/bql+G1iLTq
         CwOs9XZ3RuwtSD/N53xQDYC+vQihAt/0+N8NKEvO4+xRxKTy4vgwKCnGErmhSwTgrF+o
         z6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y1GDTPXFza3htMu5VSeDCpCXqmyO9V6AlVTJM1pcQqE=;
        b=ehlmeqmw9Yeog3jsAn05ZqacdoQ4sXzcvJVUFrOvX94jTIV/STyhLiPmMj7utr3WL9
         B8BgSxTn3v1+5LqRxvj7/2/66cqLrNampOmWe5NaquwbNZHLuHaF3vwivOCAFFFRkaig
         Gwn6g0Kupv509Tl0RIk+v1Q5eQVUx/FYRgV2V5OMbA8G4jM5l37tVBqIstUf6Zz80Qsi
         4X5GyVDeuGthxPgP/OWmiaT46C1rXEeiT0tPzkjGoiy7rkWviAp2KRcVMFyua02ofmDx
         Bytkc8xQ7OFzOuZShKJYWjLAYKHWPIlj9AuWhap2Z4Fm2zj1u3xRIYHY/qGdC+koYo54
         wn0A==
X-Gm-Message-State: AOAM531Ywj6LEskLFqPtnVxAbk/5QB6c5D2PczSUQmuBCGBtnQozi46n
        WbOQz8kSIfGRJ6PI6PnZYrtmRKpamFRE6Ia1LpR+vg==
X-Google-Smtp-Source: ABdhPJzMVwvlAMPxcRJluuJeDXEOdW/jUGVJODxXJnzChF5bKgC96F8d2YHfrgZopHuMY7o7SZUgr9JxF6sWVvgAdEw=
X-Received: by 2002:a17:906:3a55:: with SMTP id a21mr67806851ejf.516.1609772392127;
 Mon, 04 Jan 2021 06:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJUM-6p_V5c6y+7kzhx92V1qEYC5xNS_PNDLcQYTOzHA2A@mail.gmail.com> <20210104143302.GZ4077@smile.fi.intel.com>
In-Reply-To: <20210104143302.GZ4077@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Jan 2021 15:59:41 +0100
Message-ID: <CAMpxmJVLbm3NKEHZ=nNyFG=87K10izL6WU0nzP64Q6grXsW7FQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpiolib: Follow usual pattern for
 gpiod_remove_lookup_table() call
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 4, 2021 at 3:32 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jan 04, 2021 at 03:24:47PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Dec 28, 2020 at 9:06 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > The usual pattern for the remove calls, like gpiod_remove_lookup_tabl=
e(),
> > > is to be NULL-aware, i.o.w. become a no-op whenever parameter is NULL=
.
> > > Update gpiod_remove_lookup_table() call to follow this pattern.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/gpio/gpiolib.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index b02cc2abd3b6..611d6ea82d75 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -3460,6 +3460,10 @@ EXPORT_SYMBOL_GPL(gpiod_add_lookup_table);
> > >   */
> > >  void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
> > >  {
> > > +       /* Nothing to remove */
> > > +       if (!table)
> > > +               return;
> > > +
> > >         mutex_lock(&gpio_lookup_lock);
> > >
> > >         list_del(&table->list);
> > > --
> > > 2.29.2
> > >
> >
> > Applied, thanks!
>
> Thanks. Though I think it can be also applied to I=E6=B6=8E tree since de=
pendency?
> Any tags / immutable branch for Wolfram?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Oops I assumed this is independent. In that case:

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Wolfram, please take it through the i2c tree.

Bartosz
