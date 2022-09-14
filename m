Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12BC45B8FDB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Sep 2022 23:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiINVA4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 17:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiINVAw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 17:00:52 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204D72DAA6
        for <linux-i2c@vger.kernel.org>; Wed, 14 Sep 2022 14:00:49 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id l6so8640304ilk.13
        for <linux-i2c@vger.kernel.org>; Wed, 14 Sep 2022 14:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=F0XVjfoKHP+OTYQ82bFgm1NTW9Uts87VD6ivnlOEVVk=;
        b=T828Zm1P4W0m3y/FZrxNIRdJ04GyBvfBtyrjBpQ6PS3iRh4EoUYJ33eF85iXwdakkb
         Lor83qEZOLy8+rL0dFH3dXrcjWptShSbcG1g4/T30sJkXkwoNkZshdhhgXfX38SzxOea
         /nl5dOJNmmr4aBteO5lEgPZaqG+rXsJ7HEOmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=F0XVjfoKHP+OTYQ82bFgm1NTW9Uts87VD6ivnlOEVVk=;
        b=XLrpiyPEuok4giCkShEHVvT7ATnz8y742olnS2W7o6rUrnYu288hRkg4AQohp7SBSL
         E5MbJJ9EcOvA1IsHfZNODEQYfdq6zHk5l9vgBd8yCgjoUTTxUZ+zMQZoM6oR/V2v9e0l
         EQADJSea6EUMJDdYVmSmkOfp7GXutj/f+/qQdofmXgq5c3Whkm3tVobxa4pHFhfW3wba
         khF2P6onUyCJrTs4aUN0ihrNLTCJ1Y68JSvhPwX1qgPAKjay40+1ssVTuD2Rb9cLL/VD
         z0pmfmnwg/bUlaDVGkIaVLrmsNiizz8b8ARLeevqlCFUELn8F5yW+aRq//31MmAyCbqH
         IY5Q==
X-Gm-Message-State: ACgBeo0+m4gLb5ReGBx4aaUDMW2ciSPPr7e2OnhwiGdpzkjsTl+5l7Ve
        tcfNeDk7LXC0+iKl+xJVV1P04Bgd070/WA==
X-Google-Smtp-Source: AA6agR4zbSQvEPAktUzdibjH0AW0qBqcWv0xBTzjjGRj5bdDpyfHGpJmge9A4Yz6Cjb5QlUujluQwA==
X-Received: by 2002:a05:6e02:eea:b0:2eb:37a4:26d1 with SMTP id j10-20020a056e020eea00b002eb37a426d1mr15254026ilk.288.1663189248094;
        Wed, 14 Sep 2022 14:00:48 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id q14-20020a02a98e000000b0035883545473sm149233jam.2.2022.09.14.14.00.45
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 14:00:45 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id g8so10709471iob.0
        for <linux-i2c@vger.kernel.org>; Wed, 14 Sep 2022 14:00:45 -0700 (PDT)
X-Received: by 2002:a05:6638:4110:b0:35a:6d6b:57f7 with SMTP id
 ay16-20020a056638411000b0035a6d6b57f7mr1984073jab.134.1663189244533; Wed, 14
 Sep 2022 14:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid> <YyFslxMchzntebVb@black.fi.intel.com>
In-Reply-To: <YyFslxMchzntebVb@black.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Wed, 14 Sep 2022 15:00:20 -0600
X-Gmail-Original-Message-ID: <CAHQZ30AhQOxUBtbs8enUnGkBbtPYAN=_6vDV-9CcuMLMypZhtg@mail.gmail.com>
Message-ID: <CAHQZ30AhQOxUBtbs8enUnGkBbtPYAN=_6vDV-9CcuMLMypZhtg@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 13, 2022 at 11:54 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, Sep 12, 2022 at 04:13:11PM -0600, Raul E Rangel wrote:
> > Device tree already has a mechanism to pass the wake_irq. It does this
> > by looking for the wakeup-source property and setting the
> > I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> > ACPI interrupt wake flag to determine if the interrupt can be used to
> > wake the system. Previously the i2c drivers had to make assumptions and
> > blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> > If there is a device with an Active Low interrupt and the device gets
> > powered off while suspending, the interrupt line will go low since it's
> > no longer powered and wakes the system. For this reason we should
> > respect the board designers wishes and honor the wake bit defined on the
> > interrupt.
> >
> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Look at wake_cabple bit for IRQ/Interrupt resources
> >
> >  drivers/i2c/i2c-core-acpi.c | 37 ++++++++++++++++++++++++++++---------
> >  drivers/i2c/i2c-core-base.c |  6 +++++-
> >  drivers/i2c/i2c-core.h      |  4 ++--
> >  3 files changed, 35 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> > index c762a879c4cc6b..c3d69b287df824 100644
> > --- a/drivers/i2c/i2c-core-acpi.c
> > +++ b/drivers/i2c/i2c-core-acpi.c
> > @@ -137,6 +137,11 @@ static const struct acpi_device_id i2c_acpi_ignored_device_ids[] = {
> >       {}
> >  };
> >

> > +struct i2c_acpi_irq_context {
> > +     int irq;
> > +     int wake_capable;
>
> Why not bool?
>
SGTM


> Also perhaps 'wakeable'?
>

I kept it as wake_capable since I want to keep some consistency with
the ACPI nodes.

> > +};
> > +
> >  static int i2c_acpi_do_lookup(struct acpi_device *adev,
> >                             struct i2c_acpi_lookup *lookup)
> >  {
> > @@ -170,11 +175,14 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
> >
> >  static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> >  {
> > -     int *irq = data;
> > +     struct i2c_acpi_irq_context *irq_ctx = data;
> >       struct resource r;
> >
> > -     if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
> > -             *irq = i2c_dev_irq_from_resources(&r, 1);
> > +     if (irq_ctx->irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r)) {
> > +             irq_ctx->irq = i2c_dev_irq_from_resources(&r, 1);
> > +             irq_ctx->wake_capable =
> > +                     r.flags & IORESOURCE_IRQ_WAKECAPABLE ? 1 : 0;
>
> Then you can just do this:
>
>                 irq_ctx->wakeable = r.flags & IORESOURCE_IRQ_WAKECAPABLE;
>
> > +     }
> >
> >       return 1; /* No need to add resource to the list */
> >  }
> > @@ -182,31 +190,42 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> >  /**
> >   * i2c_acpi_get_irq - get device IRQ number from ACPI
> >   * @client: Pointer to the I2C client device
> > + * @wake_capable: Set to 1 if the IRQ is wake capable
> >   *
> >   * Find the IRQ number used by a specific client device.
> >   *
> >   * Return: The IRQ number or an error code.
> >   */
> > -int i2c_acpi_get_irq(struct i2c_client *client)
> > +int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
>
> bool here too
>
> >  {
> >       struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> >       struct list_head resource_list;
> > -     int irq = -ENOENT;
> > +     struct i2c_acpi_irq_context irq_ctx = {
> > +             .irq = -ENOENT,
> > +             .wake_capable = 0,
> > +     };
> >       int ret;
> >
> >       INIT_LIST_HEAD(&resource_list);
> >
> > +     if (wake_capable)
> > +             *wake_capable = 0;
>
> I think it is better to touch this only after the function succeeds so..
>
> > +
> >       ret = acpi_dev_get_resources(adev, &resource_list,
> > -                                  i2c_acpi_add_resource, &irq);
> > +                                  i2c_acpi_add_resource, &irq_ctx);
> >       if (ret < 0)
> >               return ret;
> >
> >       acpi_dev_free_resource_list(&resource_list);
> >
> > -     if (irq == -ENOENT)
> > -             irq = acpi_dev_gpio_irq_get(adev, 0);
> > +     if (irq_ctx.irq == -ENOENT)
> > +             irq_ctx.irq = acpi_dev_gpio_irq_get_wake(
> > +                     adev, 0, &irq_ctx.wake_capable);
> > +
> > +     if (wake_capable)
> > +             *wake_capable = irq_ctx.wake_capable;
>
> ... here only.
>
> >
> > -     return irq;
> > +     return irq_ctx.irq;
> >  }
> >
> >  static int i2c_acpi_get_info(struct acpi_device *adev,
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 91007558bcb260..97315b41550213 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -468,6 +468,7 @@ static int i2c_device_probe(struct device *dev)
> >       struct i2c_client       *client = i2c_verify_client(dev);
> >       struct i2c_driver       *driver;
> >       int status;
> > +     int acpi_wake_capable = 0;
>
> You can declare this in the below block instead.
>
> >
> >       if (!client)
> >               return 0;
> > @@ -487,7 +488,10 @@ static int i2c_device_probe(struct device *dev)
> >                       if (irq == -EINVAL || irq == -ENODATA)
> >                               irq = of_irq_get(dev->of_node, 0);
> >               } else if (ACPI_COMPANION(dev)) {
>
>                         bool wakeable;
>
> > -                     irq = i2c_acpi_get_irq(client);
> > +                     irq = i2c_acpi_get_irq(client, &acpi_wake_capable);
> > +
>                         if (irq > 0 && wakeable)
>                                 client->flags |= I2C_CLIENT_WAKE;
> >               }
> >               if (irq == -EPROBE_DEFER) {
> >                       status = irq;
> > diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> > index 87e2c914f1c57b..8e336638a0cd2e 100644
> > --- a/drivers/i2c/i2c-core.h
> > +++ b/drivers/i2c/i2c-core.h
> > @@ -61,11 +61,11 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
> >  #ifdef CONFIG_ACPI
> >  void i2c_acpi_register_devices(struct i2c_adapter *adap);
> >
> > -int i2c_acpi_get_irq(struct i2c_client *client);
> > +int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable);
> >  #else /* CONFIG_ACPI */
> >  static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
> >
> > -static inline int i2c_acpi_get_irq(struct i2c_client *client)
> > +static inline int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
> >  {
> >       return 0;
> >  }
> > --
> > 2.37.2.789.g6183377224-goog

I'll push out another patch series with all the latest changes.

Thanks for the reviews everyone.
