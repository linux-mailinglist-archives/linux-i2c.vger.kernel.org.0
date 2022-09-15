Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C47B55B9F28
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Sep 2022 17:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiIOPtR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Sep 2022 11:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiIOPtI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Sep 2022 11:49:08 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC2C98D3B
        for <linux-i2c@vger.kernel.org>; Thu, 15 Sep 2022 08:49:07 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id l16so9899264ilj.2
        for <linux-i2c@vger.kernel.org>; Thu, 15 Sep 2022 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=RbcmCrt9MgNwVtS84rioFN6K+2EnzOOlimgTAZwP98I=;
        b=ZWfyszh5ASkbDN5lS0dfsNxWt9+T9r+fI0UExDTPZRhVQuglIZnwGXd9pcrBMwT+DF
         trkp5ZM/q57uF+azefdt/8dxoYLykqpa37Jz+ZulL03PsWodP3IVhsgjqanPo4bG8iPT
         htWBYNR5phBWSyLHfrPJuwYCya2nS+S7SWHcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RbcmCrt9MgNwVtS84rioFN6K+2EnzOOlimgTAZwP98I=;
        b=cxtXgnoPhaV5S0J6768wFPyQQfhe0hr4Cf3AFwz7DsELEND8i1bhsPskKuMAcfInFT
         KloMvoWl1Qw3I1ilMD8sGAkgvxf5fS2EhiitaX2NU7TZaUQawWpfkBNWTw+XMerNn87J
         zUX44GLKEDVOOJWXme0eOVYN3VQh0sa4CHg8thDPBJXhzimDx/r6oqSDKQYllSWQC5TR
         olWJWS0y81g+4fFsQVBNYbaS40W0YdiWR7vBGLOF+Vyu4wIkHulvu5DQtByDXGq+5XcQ
         /YeaDCF6zwoYy2TlgZYt6PqfhmCfT6ugLCdmqiVpM2/fNKSYzbmI6Ork+cc/tfodu2xl
         g3dw==
X-Gm-Message-State: ACrzQf0YNcA/+Jhzqh+du8BjP+IYZsgviUh8VvoKfF/UkCUzgPRUsYXm
        ON0ou4yq0Rvz0zFwy0Y9es/PaaQfIDOizw==
X-Google-Smtp-Source: AMsMyM6UfWHSyYEKJp2+nPvrY/FaoIYi1Ug6rFDtIoT30b71xjshsu5eKrDlq9dGNcA/Ijajo4vs9Q==
X-Received: by 2002:a05:6e02:1c48:b0:2f1:db4b:66df with SMTP id d8-20020a056e021c4800b002f1db4b66dfmr288771ilg.35.1663256946460;
        Thu, 15 Sep 2022 08:49:06 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id r2-20020a02aa02000000b0034e9ceed07csm1280479jam.88.2022.09.15.08.49.03
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 08:49:04 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id p3so5400062iof.13
        for <linux-i2c@vger.kernel.org>; Thu, 15 Sep 2022 08:49:03 -0700 (PDT)
X-Received: by 2002:a05:6638:4110:b0:35a:6d6b:57f7 with SMTP id
 ay16-20020a056638411000b0035a6d6b57f7mr326227jab.134.1663256942370; Thu, 15
 Sep 2022 08:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220914235801.1731478-1-rrangel@chromium.org>
 <20220914155914.v3.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid> <YyMCcNl2zU4/xEHN@black.fi.intel.com>
In-Reply-To: <YyMCcNl2zU4/xEHN@black.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Thu, 15 Sep 2022 09:48:50 -0600
X-Gmail-Original-Message-ID: <CAHQZ30A2Tpst-WKj-u_rmrnV69Dby3j0+mFBKorzF4YMBySqBw@mail.gmail.com>
Message-ID: <CAHQZ30A2Tpst-WKj-u_rmrnV69Dby3j0+mFBKorzF4YMBySqBw@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tim Van Patten <timvp@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 15, 2022 at 4:46 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Wed, Sep 14, 2022 at 05:57:55PM -0600, Raul E Rangel wrote:
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
> > Changes in v3:
> > - Convert wake_capable to bool
> > - Only update wake_capable pointer once
> > - Move wake_capable local into local block
> >
> > Changes in v2:
> > - Look at wake_cabple bit for IRQ/Interrupt resources
> >
> >  drivers/i2c/i2c-core-acpi.c | 33 ++++++++++++++++++++++++---------
> >  drivers/i2c/i2c-core-base.c |  8 +++++++-
> >  drivers/i2c/i2c-core.h      |  4 ++--
> >  3 files changed, 33 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> > index c762a879c4cc6b..b3d68a9659ff4f 100644
> > --- a/drivers/i2c/i2c-core-acpi.c
> > +++ b/drivers/i2c/i2c-core-acpi.c
> > @@ -137,6 +137,11 @@ static const struct acpi_device_id i2c_acpi_ignored_device_ids[] = {
> >       {}
> >  };
> >
> > +struct i2c_acpi_irq_context {
> > +     int irq;
> > +     bool wake_capable;
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
> > +                     !!(r.flags & IORESOURCE_IRQ_WAKECAPABLE);
>
> You don't need the !!() here. Just
>
>                 irq_ctx->wake_capable = r.flags & IORESOURCE_IRQ_WAKECAPABLE;
>
You know, I learned something new today! I was concerned about this
setting `wake_capable` to something that wasn't 0 or 1, but apparently
this is handled by the compiler!

http://port70.net/~nsz/c/c11/n1570.html#6.3.1.2

> 6.3.1.2 Boolean type
> When any scalar value is converted to _Bool, the result is 0 if the value compares equal to 0; otherwise, the result is 1.

Whoah!

> > +     }
> >
> >       return 1; /* No need to add resource to the list */
> >  }
> > @@ -182,31 +190,38 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> >  /**
> >   * i2c_acpi_get_irq - get device IRQ number from ACPI
> >   * @client: Pointer to the I2C client device
> > + * @wake_capable: Set to true if the IRQ is wake capable
> >   *
> >   * Find the IRQ number used by a specific client device.
> >   *
> >   * Return: The IRQ number or an error code.
> >   */
> > -int i2c_acpi_get_irq(struct i2c_client *client)
> > +int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable)
> >  {
> >       struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> >       struct list_head resource_list;
> > -     int irq = -ENOENT;
> > +     struct i2c_acpi_irq_context irq_ctx = {
> > +             .irq = -ENOENT,
> > +     };
> >       int ret;
> >
> >       INIT_LIST_HEAD(&resource_list);
> >
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
> > +             irq_ctx.irq = acpi_dev_gpio_irq_wake_get(adev, 0,
> > +                                                      &irq_ctx.wake_capable);
> > +
> > +     if (wake_capable)
> > +             *wake_capable = irq_ctx.wake_capable;
> >
> > -     return irq;
> > +     return irq_ctx.irq;
> >  }
> >
> >  static int i2c_acpi_get_info(struct acpi_device *adev,
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 91007558bcb260..c4debd46c6340f 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -487,8 +487,14 @@ static int i2c_device_probe(struct device *dev)
> >                       if (irq == -EINVAL || irq == -ENODATA)
> >                               irq = of_irq_get(dev->of_node, 0);
> >               } else if (ACPI_COMPANION(dev)) {
> > -                     irq = i2c_acpi_get_irq(client);
> > +                     bool wake_capable;
> > +
> > +                     irq = i2c_acpi_get_irq(client, &wake_capable);
> > +
>
> Drop the empty line here.
Done

>
> > +                     if (irq > 0 && wake_capable)
> > +                             client->flags |= I2C_CLIENT_WAKE;
> >               }
> > +
>
> Unrelated whitespace change.
Done

>
> With those fixed feel free to add,
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Added, thanks!
