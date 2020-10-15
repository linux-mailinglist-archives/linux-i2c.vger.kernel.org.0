Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE01D28F6D3
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Oct 2020 18:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390013AbgJOQb7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Oct 2020 12:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389892AbgJOQb7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Oct 2020 12:31:59 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E49C061755
        for <linux-i2c@vger.kernel.org>; Thu, 15 Oct 2020 09:31:58 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id x16so3824374ljh.2
        for <linux-i2c@vger.kernel.org>; Thu, 15 Oct 2020 09:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EniOGIlKiMQbGzMpLF3yZh6eMy9XXygigTCPkkQmyHo=;
        b=elBWdkC0Wrb/BP//lSIYmpj9KnbBCmk0ZrOIDdUsOfUoPsS5rsNzoriXR3iR0WRvsm
         MDBi6TPs9/XFEtk4yuHTlXHowyL2+NkwnvkLofS3CchBWNxoTqLIDWqSfTfJUr2Getl6
         xDffJ8KdjyZbMDGqmpH1MUJr5bK1pkT2qs8hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EniOGIlKiMQbGzMpLF3yZh6eMy9XXygigTCPkkQmyHo=;
        b=iIbXmY7+sS7iGxbGKIxvhYd19AiItUQSdlaHNDsRsiXHR1r9QYVyKIjAvEoqv1HCYF
         +EFWu55jybKHRiZ49vcXiueg67FW16swcog5CqifCwYB6p3k9DBnxEhZjRFnNDrczqAQ
         JKX0HkPHf76Y0gTSl0M+PM7pFcdLJg1lSEjsK3aot2aIrFusLbKqPmYy31hxjUmeObld
         cwrRvaLDb0VshFTmhox8cZFVGyRGH+3AWlcifjT2RYBDWo2OwqYYI7kr7Bf+BOo3EERq
         0ZMVLQV7d9hAXoxEuLSZR5QTcU82PGr6x1VIrqXPDQ/BFnU3+pFCSXRBa5BnpcWtDvBU
         nPnQ==
X-Gm-Message-State: AOAM531avdjMCkcJIimaAXwQ435yyxPY0xZ/cjf0f1uACTL3iS/V85YD
        LYNlLK1jFdTyDEm7HVU1fBDo49sQVd7H5g==
X-Google-Smtp-Source: ABdhPJzf1f9QmqpJV3FKw9qqfeQ68ahOcLKD2jdsdLdfFVMzuPo905MUVUt6RMPlo+U4p+5hKRx60Q==
X-Received: by 2002:a2e:b704:: with SMTP id j4mr1499036ljo.108.1602779516784;
        Thu, 15 Oct 2020 09:31:56 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id l14sm1470905lji.99.2020.10.15.09.31.55
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:31:56 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id x16so3824278ljh.2
        for <linux-i2c@vger.kernel.org>; Thu, 15 Oct 2020 09:31:55 -0700 (PDT)
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr1539454ljj.250.1602779515328;
 Thu, 15 Oct 2020 09:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201014180137.v2.1.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <6ac96561-0415-0ac6-8771-99c8bdee0881@axentia.se>
In-Reply-To: <6ac96561-0415-0ac6-8771-99c8bdee0881@axentia.se>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 15 Oct 2020 09:31:18 -0700
X-Gmail-Original-Message-ID: <CAE=gft6UbL=kVpEzHtGfeCuZQNyZytsy=Qqui5-+O0rYer5S9g@mail.gmail.com>
Message-ID: <CAE=gft6UbL=kVpEzHtGfeCuZQNyZytsy=Qqui5-+O0rYer5S9g@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: i2c-mux-gpio: Enable this driver in ACPI land
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 15, 2020 at 3:23 AM Peter Rosin <peda@axentia.se> wrote:
>
> Hi!
>
> On 2020-10-15 03:02, Evan Green wrote:
> > Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> > property translates directly to a fwnode_property_*() call. The child
> > reg property translates naturally into _ADR in ACPI.
> >
> > The i2c-parent binding is a relic from the days when all direct children
> > of an i2c controller in Linux had to be i2c devices. These days that
>
> I2C controller. I2C devices.
>
> I fail to see why this "relic" has to be explicitly blamed on Linux? In the
> beginning, the bindings for all I2C controllers (sometimes implicitely,
> sometimes explicitely) specified that all child nodes had to be I2C devices.
> The *bindings* were simply not as flexible before the i2c-bus subnode was
> invented only a few years ago. So, there are arguments that the "problem"
> was in DT-land and that Linux just followed suit.

Gotcha, that makes sense. I was probably reading between the lines
incorrectly in your previous reply. I'll blame it on the bindings :)

>
> > implementation detail has been worked out, so the i2c-mux can sit
> > as a direct child of its parent controller, which is where it makes the
> > most sense from a hardware description perspective. For the ACPI
> > implementation we'll assume that's always how the i2c-mux-gpio is
> > instantiated.
>
> There is potential to match this and make i2c-parent optional for the
> DT case and require it to be a child of its parent in such cases, if
> someone has the time/energy...

I won't plan to since I don't have a device like this, but yeah I
agree this would be a fine convention for DT to start following as
well.

>
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> > ---
> >
> > Changes in v2:
> >  - Make it compile properly when !CONFIG_ACPI (Randy)
> >  - Update commit message regarding i2c-parent (Peter)
> >
> >  drivers/i2c/muxes/i2c-mux-gpio.c | 103 ++++++++++++++++++++++---------
> >  1 file changed, 75 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> > index 4effe563e9e8d..8e4008f4a9b5d 100644
> > --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> > +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> > @@ -49,34 +49,80 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
> >       return 0;
> >  }
> >
> > -#ifdef CONFIG_OF
> > -static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
> > -                                     struct platform_device *pdev)
> > +#ifdef CONFIG_ACPI
> > +
> > +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> > +                                  struct fwnode_handle *fwdev,
> > +                                  unsigned int *adr)
> > +
> > +{
> > +     unsigned long long adr64;
> > +     acpi_status status;
> > +
> > +     status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(fwdev),
> > +                                    METHOD_NAME__ADR,
> > +                                    NULL, &adr64);
> > +
> > +     if (!ACPI_SUCCESS(status)) {
> > +             dev_err(dev, "Cannot get address");
>
> Missing trailing \n

Whoops.

>
> > +             return -EINVAL;
> > +     }
> > +
> > +     *adr = adr64;
>
> Maybe this is too pedantic? Optional, ignore if I'm just being insane...
>
>         if (*adr != adr64) {
>                 dev_err(dev, "Address out of range\n");
>                 return -EINVAL;
>         }
>

Sure, will add.

> > +     return 0;
> > +}
> > +
> > +#else
> > +
> > +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> > +                                  struct fwnode_handle *fwdev,
> > +                                  unsigned int *adr)
> > +{
> > +     return -EINVAL;
> > +}
> > +
> > +#endif
> > +
> > +static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
> > +                              struct platform_device *pdev)
> >  {
> > -     struct device_node *np = pdev->dev.of_node;
> > -     struct device_node *adapter_np, *child;
> > -     struct i2c_adapter *adapter;
> > +     struct device *dev = &pdev->dev;
> > +     struct device_node *np = dev->of_node;
> > +     acpi_handle dev_handle;
>
> Remove the dev_handle declaration here...(push)...
>
> > +     struct device_node *adapter_np;
> > +     struct i2c_adapter *adapter = NULL;
> > +     struct fwnode_handle *child = NULL;
>
> Why do you need these two " = NULL" here? I can't believe compilers are
> that stupid? If they are, fine. But otherwise, why single out these two
> pointers and add NULL only there and not everywhere? But NULL everywhere
> would be ugly...

The adapter NULL is there because in theory you could have
!is_acpi_node && !is_of_node (maybe in some weird compile test?), and
then you would be checking an uninitialized value.

child I could safely not initialize, so I'll change that.

>
> >       unsigned *values;
> > -     int i = 0;
> > +     int rc, i = 0;
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
>
> You should do "&pdev->dev" -> "dev" here, because I hate having
> the dev variable and then not use it. But that should perhaps be
> a preparatory patch, because I see more instances and this is an
> orthogonal change.

I see 3 other instances of it in this function. I'll create an initial
patch that introduces the dev local and uses it throughout this
function, then another patch with my main change on top.

>
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
>
> ...(pop)...and perhaps say
>
>                 acpi_handle dev_handle = ACPI_HANDLE(dev->parent);
>
> here?

Will do.

Thanks for the prompt review.
-Evan
