Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCB528BF2F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Oct 2020 19:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390824AbgJLRrh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Oct 2020 13:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390821AbgJLRrg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Oct 2020 13:47:36 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4649C0613D0
        for <linux-i2c@vger.kernel.org>; Mon, 12 Oct 2020 10:47:36 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j30so16821817lfp.4
        for <linux-i2c@vger.kernel.org>; Mon, 12 Oct 2020 10:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=73RrQFo50tZhbRkYDNdanOJrHtz/f4eqAYT4zmV7UqA=;
        b=h3DkQTPcdqvDKBX27/zOXx3tX2f26FSdorLnXTOibRArJ+gfh4pMXesF1sUL03wXpG
         LtI8DiV7z+k5BIygzCpk37KTt2JTtC8nwKv7DgDSa/5fZsIVbMVTqY1EB1O8Net4JCnG
         3zuYhQbhp38MlMi6IUTjnz+TKi+tltVfWcw5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=73RrQFo50tZhbRkYDNdanOJrHtz/f4eqAYT4zmV7UqA=;
        b=noACclfAPs3/0Cm85HEr2TX1lLY1/B8qHD2tVcTNorfaOJQrDzOVgJ8waO1jxNo3vE
         wXGWZ82XQkpkovn9+lUiccs1v5IiBOg3/cC+Vq4UENIIzOafh1sehVkn9xuMHxK8sBPd
         8ePUpKLaRmg9xS1ltXkj0E+3Cka8kvhopB425LjsRN8w8z5kBmsIJEx23IeN7ZyvweE+
         V865WAEJdbDpe6Yr8AuIoXxTFSNoatYCb2jJ4HA33moONR+Jnk9NhZbyKRJV3qhwyHWg
         ZoxJLPcDKUNTDt/k0KdogHX9xjCgtVi6Z/3WNoliJ2W3W48OiGir4ovycTBVso37uJat
         vcAg==
X-Gm-Message-State: AOAM531UTizk2R0ynX3WRaAlqDOEqm9CDxfBUtn28sC09D8WOowgEWDN
        C557ONeCI9OBr0XGNuw/8IzjAPD+v8Ly8w==
X-Google-Smtp-Source: ABdhPJzHrPYcB13KrV05K68I5+2g53mDx3EL4MPjqGUjxohCPAq874wRcNo+Gy1s+NJ+N5XxSNczOQ==
X-Received: by 2002:a19:8c17:: with SMTP id o23mr7990841lfd.279.1602524854718;
        Mon, 12 Oct 2020 10:47:34 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id y206sm3429558lfa.166.2020.10.12.10.47.33
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 10:47:34 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 77so9002754lfl.2
        for <linux-i2c@vger.kernel.org>; Mon, 12 Oct 2020 10:47:33 -0700 (PDT)
X-Received: by 2002:a19:be0c:: with SMTP id o12mr9100071lff.313.1602524853321;
 Mon, 12 Oct 2020 10:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201009154235.1.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <18912642-12b2-92fa-8667-4e6f4abc3838@axentia.se>
In-Reply-To: <18912642-12b2-92fa-8667-4e6f4abc3838@axentia.se>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 12 Oct 2020 10:46:56 -0700
X-Gmail-Original-Message-ID: <CAE=gft7CO2MO72AdDnE9fWhvOuBfu8TyGweMv5TMRKdyNRJn-Q@mail.gmail.com>
Message-ID: <CAE=gft7CO2MO72AdDnE9fWhvOuBfu8TyGweMv5TMRKdyNRJn-Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-mux-gpio: Enable this driver in ACPI land
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 10, 2020 at 10:03 AM Peter Rosin <peda@axentia.se> wrote:
>
> Hi!
>
> On 2020-10-10 00:43, Evan Green wrote:
> > Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> > property translates directly to a fwnode_property_*() call. The child
> > reg property translates naturally into _ADR in ACPI.
> >
> > The i2c-parent is a little trickier, since of's phandle definition
> > suggests the i2c mux could live in a completely different part of
> > the tree than its upstream i2c controller. For now in ACPI,
>
> This is so since the I2C gpio-mux predates the "i2c-bus" sub-node of
> I2C controllers. At that time *all* sub-nodes of I2C controllers
> represented I2C client device, IIUC. With that knowledge, you could
> perhaps rephrase the above?

Ah I see, so this part of the binding was defined to work around
implementation details of Linux. But now those details are worked out,
so porting that part to ACPI isn't necessary. I'll rephrase to that
effect.

>
> Also, a nit below.
>
> > just assume that the i2c-mux-gpio device will always be a direct
> > child of the i2c controller. If the additional flexibility of
> > defining muxes in wildly different locations from their parent
> > controllers is required, it can be added later.
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> > ---
> >
> >  drivers/i2c/muxes/i2c-mux-gpio.c | 77 +++++++++++++++++++++-----------
> >  1 file changed, 50 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> > index 4effe563e9e8d..f195e95e8a037 100644
> > --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> > +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> > @@ -49,34 +49,46 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
> >       return 0;
> >  }
> >
> > -#ifdef CONFIG_OF
> > -static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
> > -                                     struct platform_device *pdev)
> > +static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
> > +                              struct platform_device *pdev)
> >  {
> > -     struct device_node *np = pdev->dev.of_node;
> > -     struct device_node *adapter_np, *child;
> > -     struct i2c_adapter *adapter;
> > +     struct device *dev = &pdev->dev;
> > +     struct device_node *np = dev->of_node;
> > +     acpi_handle dev_handle;
> > +     struct device_node *adapter_np;
> > +     struct i2c_adapter *adapter = NULL;
> > +     struct fwnode_handle *child = NULL;
> >       unsigned *values;
> >       int i = 0;
> >
> > -     if (!np)
> > -             return -ENODEV;
> > +     if (is_of_node(dev->fwnode)) {
> > +             if (!np)
> > +                     return -ENODEV;
> >
> > -     adapter_np = of_parse_phandle(np, "i2c-parent", 0);
> > -     if (!adapter_np) {
> > -             dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
> > -             return -ENODEV;
> > +             adapter_np = of_parse_phandle(np, "i2c-parent", 0);
> > +             if (!adapter_np) {
> > +                     dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
> > +                     return -ENODEV;
> > +             }
> > +             adapter = of_find_i2c_adapter_by_node(adapter_np);
> > +             of_node_put(adapter_np);
> > +
> > +     } else if (is_acpi_node(dev->fwnode)) {
> > +             /*
> > +              * In ACPI land the mux should be a direct child of the i2c
> > +              * bus it muxes.
> > +              */
> > +             dev_handle = ACPI_HANDLE(dev->parent);
> > +             adapter = i2c_acpi_find_adapter_by_handle(dev_handle);
> >       }
> > -     adapter = of_find_i2c_adapter_by_node(adapter_np);
> > -     of_node_put(adapter_np);
> > +
> >       if (!adapter)
> >               return -EPROBE_DEFER;
> >
> >       mux->data.parent = i2c_adapter_id(adapter);
> >       put_device(&adapter->dev);
> >
> > -     mux->data.n_values = of_get_child_count(np);
> > -
> > +     mux->data.n_values = device_get_child_node_count(dev);
> >       values = devm_kcalloc(&pdev->dev,
> >                             mux->data.n_values, sizeof(*mux->data.values),
> >                             GFP_KERNEL);
> > @@ -85,24 +97,35 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
> >               return -ENOMEM;
> >       }
> >
> > -     for_each_child_of_node(np, child) {
> > -             of_property_read_u32(child, "reg", values + i);
> > +     device_for_each_child_node(dev, child) {
> > +             if (is_of_node(child)) {
> > +                     fwnode_property_read_u32(child, "reg", values + i);
> > +
> > +             } else if (is_acpi_node(child)) {
> > +                     unsigned long long adr;
> > +                     acpi_status status;
> > +
> > +                     status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(child),
> > +                                                    METHOD_NAME__ADR,
> > +                                                    NULL, &adr);
> > +                     if (ACPI_SUCCESS(status)) {
> > +                             *(values + i) = adr;
>
> I would write that as
>                                 values[i] = adr;

Will fix. Let me get this compiling properly when ACPI is not defined
and I'll send and update. Thanks for reviewing.
-Evan
