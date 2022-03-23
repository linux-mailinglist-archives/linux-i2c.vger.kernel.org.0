Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F064E525B
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 13:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242908AbiCWMnR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 08:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242800AbiCWMnR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 08:43:17 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A597B56E
        for <linux-i2c@vger.kernel.org>; Wed, 23 Mar 2022 05:41:47 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id bx5so1528065pjb.3
        for <linux-i2c@vger.kernel.org>; Wed, 23 Mar 2022 05:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a4dvkjPYRELhzllIpA0f3GYBFS79Xmkqa9OQbMC0sQc=;
        b=BKV9SqrLcCplUfT86q4wICSAi929UqoXsOYEw5LTO37EfKdTN2GtR664bQ3vyjorSZ
         umEsHvA9Hf69ZUhSOSj2bHwQo7CoYe2dMR3VY8RSVgE6oCwkDjPS2kQtFuqphIyDUj4Q
         JhPZpVN5veA4MJL1CHALKuLy77VIaGfl3oAydDYdTtl5+oro1O72+9Utv02ZjSYfJiWl
         4Tlb1i3xphsC1I6jo19owV9XBgkkZvTCV2/LwprTZvQfKG/ahY//EyAZOMJLAxhZ75+s
         SXKAirhz68DkHMz6X8Gkd06lyWj3oYWLZMxK9/aiYcb0HsIC1hoo9f1GvlkvNeJo8Nlb
         +mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a4dvkjPYRELhzllIpA0f3GYBFS79Xmkqa9OQbMC0sQc=;
        b=bbILVFb59ICIrLw5HVI0On8e1WkmBgtj3XTAVIGxCQ3D+V8K6+n4DX0+IlucX4IXLc
         j0XKyOcEfP4qc2HNRAE0ar0XHFHttymYa3pTecTULSkNE3ErItiuKNTV6z9xE5/w8+cu
         dJ8IsuoKDIBm6Ek8br9z2KtRtGnZSfbEymvhZ4V+4qGkHa9dOK75IOka8vZktKUv06tT
         VjdrlDWSshe4ZHmBGIaJgCG5MH0KZEhh9eCZ7RWHQpud5N9+wsEJYZ/Axkbj5FrbWkOG
         OkR5vpZk80ZpWiYsImLnUmjcFDudCjD9BHz4EuJWHD4MK9uF2HDEox7AHoJRqs6hJTgG
         luFQ==
X-Gm-Message-State: AOAM530KqXn+d3Y7z5Rfp+pajpU2PNZeyqBM554OxcJ+69T9tVWx2nC/
        PXCiG2Nt+XqB9kkqlAWeJRuhScBuawlw7a98HBdgcRKZ+r7RRw==
X-Google-Smtp-Source: ABdhPJwj0X9bRHFxzj52gv00VxzzzCayohoiI5JJBSZZRHRycjz7IVFuiC6D+k6f9FViImGXM5UKs9f1KGdqXvP4E/c=
X-Received: by 2002:a17:902:e545:b0:154:4d5b:2006 with SMTP id
 n5-20020a170902e54500b001544d5b2006mr16865421plf.94.1648039306634; Wed, 23
 Mar 2022 05:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220216074613.235725-1-patrick.rudolph@9elements.com>
 <20220216074613.235725-3-patrick.rudolph@9elements.com> <5658941a-bf81-4ecf-3317-82d2a8244021@axentia.se>
In-Reply-To: <5658941a-bf81-4ecf-3317-82d2a8244021@axentia.se>
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
Date:   Wed, 23 Mar 2022 13:41:35 +0100
Message-ID: <CALNFmy0vADcLGcNCCGtPhsXXRCxV549Q5vhdv9v0YQ+HjZOhNQ@mail.gmail.com>
Subject: Re: [v6 2/3] i2c: muxes: pca954x: Add MAX735x/MAX736x support
To:     Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,
thanks for the review.
The MAX7358 has indeed the same registers as the MAX7357, but they
need to be "unlocked" by sending a magic sequence first.
As this isn't implemented by the driver it behaves like the MAX7356
with a single register.
The additional registers can be hidden again by setting a bit in the
config space.
Which wording would you prefer to describe this feature?

I'll change it to maxim_enhanced_mode.

Regards,
Patrick

On Sat, Mar 19, 2022 at 3:41 PM Peter Rosin <peda@axentia.se> wrote:
>
> Hi!
>
> Sorry for the slow review and thanks for your patience...
>
> On 2022-02-16 08:46, Patrick Rudolph wrote:
> > Add support for the following Maxim chips using the existing PCA954x
> > driver:
> > - MAX7356
> > - MAX7357
> > - MAX7358
> > - MAX7367
> > - MAX7368
> > - MAX7369
> >
> > All added Maxim chips behave like the PCA954x, where a single SMBUS byte
> > write selects up to 8 channels to be bridged to the primary bus.
> >
> > The MAX7357 exposes 6 additional registers at Power-On-Reset and is
>
> MAX7358 also has the same enhanced mode as the 7357, no?
>
> And what do you mean that they are exposed at POR? I can see why they
> are not exposed /before/ POR, but are they ever /not/ exposed? If they
> are always exposed when the chip is "alive", then I suggest that the
> POR wording is dropped, otherwise that the above is reworded to
> describe when the register are no longer exposed.
>
> > configured to:
> >  - Disabled interrupts on bus locked up detection
> >  - Enable bus locked-up clearing
> >  - Disconnect only locked bus instead of all channels
> >
> > While the MAX7357/MAX7358 have interrupt support, they don't act as
> > interrupt controller like the PCA9545 does. Thus don't enable IRQ support
> > and handle them like the PCA9548.
> >
> > Tested using the MAX7357 and verified that the stalled bus is disconnected
> > while the other channels remain operational.
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > ---
> >  drivers/i2c/muxes/Kconfig           |  4 +-
> >  drivers/i2c/muxes/i2c-mux-pca954x.c | 92 +++++++++++++++++++++++++++--
> >  2 files changed, 90 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> > index 1708b1a82da2..2ac99d044199 100644
> > --- a/drivers/i2c/muxes/Kconfig
> > +++ b/drivers/i2c/muxes/Kconfig
> > @@ -65,11 +65,11 @@ config I2C_MUX_PCA9541
> >         will be called i2c-mux-pca9541.
> >
> >  config I2C_MUX_PCA954x
> > -     tristate "NXP PCA954x and PCA984x I2C Mux/switches"
> > +     tristate "NXP PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C Mux/switches"
> >       depends on GPIOLIB || COMPILE_TEST
> >       help
> >         If you say yes here you get support for the NXP PCA954x
> > -       and PCA984x I2C mux/switch devices.
> > +       and PCA984x and Maxim MAX735x/MAX736x I2C mux/switch devices.
>
> and and and... :-) Maybe like this?
>
>           If you say yes here you get support for NXP PCA954x/PCA984x
>           and Maxim MAX735x/MAX736x I2C mux/switch devices.
>
> >         This driver can also be built as a module.  If so, the module
> >         will be called i2c-mux-pca954x.
> > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > index 4ad665757dd8..33b9a6a1fffa 100644
> > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > @@ -4,6 +4,7 @@
> >   *
> >   * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
> >   * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
> > + * Copyright (c) 2022 Patrick Rudolph <patrick.rudolph@9elements.com>
> >   *
> >   * This module supports the PCA954x and PCA984x series of I2C multiplexer/switch
> >   * chips made by NXP Semiconductors.
> > @@ -11,6 +12,12 @@
> >   *    PCA9540, PCA9542, PCA9543, PCA9544, PCA9545, PCA9546, PCA9547,
> >   *    PCA9548, PCA9846, PCA9847, PCA9848 and PCA9849.
> >   *
> > + * It's also compatible to Maxims MAX735x I2C switch chips, which are controlled
> > + * as the NXP PCA9548 and the MAX736x chips that act like the PCA9544.
> > + *
> > + * This includes the:
> > + *    MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
> > + *
> >   * These chips are all controlled via the I2C bus itself, and all have a
> >   * single 8-bit register. The upstream "parent" bus fans out to two,
> >   * four, or eight downstream busses or channels; which of these
> > @@ -50,7 +57,30 @@
> >
> >  #define PCA954X_IRQ_OFFSET 4
> >
> > +/*
> > + * MAX7357 exposes 7 registers on POR which allow to configure additional
> > + * features. Disable interrupts, enable bus locked-up clearing,
> > + * isolate only the locked channel instead of all channels.
>
> Same MAX7358 and POR comments as above.
>
> The way I understands things are:
>
>  * MAX7357/MAX7358 exposes 7 registers which allow setup of
>  * enhanced mode features. The first of these registers is the
>  * switch control register that is present in some form on all
>  * chips supported by this driver.
>  * The second register is the configuration register, which allows
>  * to configure additional features. E.g. disable interrupts,
>  * enable bus locked-up clearing and isolate only the locked
>  * channel instead of all channels.
>  * The remaining 5 registers are left as is by this driver.
>
> > + */
> > +#define MAX7357_CONF_INT_ENABLE                      BIT(0)
> > +#define MAX7357_CONF_FLUSH_OUT                       BIT(1)
> > +#define MAX7357_CONF_RELEASE_INT             BIT(2)
> > +#define MAX7357_CONF_LOCK_UP_CLEAR           BIT(3)
> > +#define MAX7357_CONF_DISCON_SINGLE_CHAN              BIT(4)
> > +#define MAX7357_CONF_BUS_LOCKUP_DETECTION    BIT(5)
> > +#define MAX7357_CONF_ENABLE_BASIC_MODE               BIT(6)
> > +#define MAX7357_CONF_PRECONNECT_TEST         BIT(7)
> > +
> > +#define MAX7357_CONF_DEFAULTS (MAX7357_CONF_FLUSH_OUT | \
> > +      MAX7357_CONF_DISCON_SINGLE_CHAN)
> > +
> >  enum pca_type {
> > +     max_7367,
> > +     max_7368,
> > +     max_7369,
> > +     max_7356,
> > +     max_7357,
> > +     max_7358,
> >       pca_9540,
> >       pca_9542,
> >       pca_9543,
> > @@ -69,6 +99,7 @@ struct chip_desc {
> >       u8 nchans;
> >       u8 enable;      /* used for muxes only */
> >       u8 has_irq;
> > +     u8 max7357;
>
> Perhaps maxim_enhanced_mode is a better name?
>
> >       enum muxtype {
> >               pca954x_ismux = 0,
> >               pca954x_isswi
> > @@ -90,8 +121,42 @@ struct pca954x {
> >       raw_spinlock_t lock;
> >  };
> >
> > -/* Provide specs for the PCA954x types we know about */
> > +/* Provide specs for the PCA954x and MAX735x types we know about */
> >  static const struct chip_desc chips[] = {
> > +     [max_7356] = {
> > +             .nchans = 8,
> > +             .muxtype = pca954x_isswi,
> > +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> > +     },
> > +     [max_7357] = {
> > +             .nchans = 8,
> > +             .muxtype = pca954x_isswi,
> > +             .max7357 = 1,
> > +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> > +     },
> > +     [max_7358] = {
> > +             .nchans = 8,
> > +             .muxtype = pca954x_isswi,
> > +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> > +     },
> > +     [max_7367] = {
> > +             .nchans = 4,
> > +             .muxtype = pca954x_isswi,
> > +             .has_irq = 1,
> > +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> > +     },
> > +     [max_7368] = {
> > +             .nchans = 4,
> > +             .muxtype = pca954x_isswi,
> > +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> > +     },
> > +     [max_7369] = {
> > +             .nchans = 4,
> > +             .enable = 0x4,
> > +             .muxtype = pca954x_ismux,
> > +             .has_irq = 1,
> > +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> > +     },
> >       [pca_9540] = {
> >               .nchans = 2,
> >               .enable = 0x4,
> > @@ -177,6 +242,12 @@ static const struct chip_desc chips[] = {
> >  };
> >
> >  static const struct i2c_device_id pca954x_id[] = {
> > +     { "max7356", max_7356 },
> > +     { "max7357", max_7357 },
> > +     { "max7358", max_7358 },
> > +     { "max7367", max_7367 },
> > +     { "max7368", max_7368 },
> > +     { "max7369", max_7369 },
> >       { "pca9540", pca_9540 },
> >       { "pca9542", pca_9542 },
> >       { "pca9543", pca_9543 },
> > @@ -194,6 +265,12 @@ static const struct i2c_device_id pca954x_id[] = {
> >  MODULE_DEVICE_TABLE(i2c, pca954x_id);
> >
> >  static const struct of_device_id pca954x_of_match[] = {
> > +     { .compatible = "maxim,max7356", .data = &chips[max_7356] },
> > +     { .compatible = "maxim,max7357", .data = &chips[max_7357] },
> > +     { .compatible = "maxim,max7358", .data = &chips[max_7358] },
> > +     { .compatible = "maxim,max7367", .data = &chips[max_7367] },
> > +     { .compatible = "maxim,max7368", .data = &chips[max_7368] },
> > +     { .compatible = "maxim,max7369", .data = &chips[max_7369] },
> >       { .compatible = "nxp,pca9540", .data = &chips[pca_9540] },
> >       { .compatible = "nxp,pca9542", .data = &chips[pca_9542] },
> >       { .compatible = "nxp,pca9543", .data = &chips[pca_9543] },
> > @@ -401,9 +478,16 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
> >       else
> >               data->last_chan = 0; /* Disconnect multiplexer */
> >
> > -     ret = i2c_smbus_write_byte(client, data->last_chan);
> > -     if (ret < 0)
> > -             data->last_chan = 0;
> > +     if (data->chip->max7357) {
> > +             ret = i2c_smbus_write_byte_data(client, data->last_chan,
> > +                                             MAX7357_CONF_DEFAULTS);
> > +             if (ret < 0)
> > +                     data->last_chan = 0;
> > +     } else {
> > +             ret = i2c_smbus_write_byte(client, data->last_chan);
> > +             if (ret < 0)
> > +                     data->last_chan = 0;
> > +     }
> >
> >       return ret;
> >  }
>
> The actual code is simple enough, and looks good.
>
> Cheers,
> Peter
