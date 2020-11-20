Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56CA2BB4B1
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Nov 2020 20:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730268AbgKTS7z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Nov 2020 13:59:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730041AbgKTS7y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Nov 2020 13:59:54 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0866EC0613CF
        for <linux-i2c@vger.kernel.org>; Fri, 20 Nov 2020 10:59:53 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s30so14939628lfc.4
        for <linux-i2c@vger.kernel.org>; Fri, 20 Nov 2020 10:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WP40hyIHVW+8+OBoS/eJu6n4FBxVosTt45ETp9kRxys=;
        b=iH6DYysSkQwGTz88LDkNljp6oFZgEGlYTmTVobZl/qFx8kbV2sq8WPrsBYs0JqxPs2
         JpaDdHbB3ZHYnEequccgC9CERCbsDthVuEYtV+ObOSVmw6eq2mY2SvY3M9lsPF6azORX
         r5UUMhtjVIbCM0g0fIXmo0aIeRDt4oDjgxLrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WP40hyIHVW+8+OBoS/eJu6n4FBxVosTt45ETp9kRxys=;
        b=DXaeGTSSXTDaJy+Ed8l/HwHjZU9W+co1SsLlsHoZ7LMcA0pKA+p34YDJcHwoA7cxW+
         g4KGp11kQuNp2zm0TH9NvdVXT/aSr979Vrdwyl5WwUEeJmwWMFMNOhRmsbUqEFdi3ppF
         hYah9uKaTKO1fIf1dx3BylExLe73NJCOQMiXjwAh0TBt4+GaTj3fUzZ4pj4k6QI7Ha0p
         5jvAaCT/He0glNusPLmCfQULNrf8ohvTKNiAvCURDVnt8dBnZGWTqVnkuCK+9/zBUr4m
         4tN8IIZjLQSokHxRaJyV0993W2DusRN+V/oC/kxtbvwYJzZcEXySfHO87r8I328qELpZ
         dHzA==
X-Gm-Message-State: AOAM530y9eS3RW17cZiSZgJJSxy/ik04JhlhkUkmhwOYhhLs8yW5V4w9
        KNS0khiRBvN7aaGpLamapKWufPheC4PoGQ==
X-Google-Smtp-Source: ABdhPJxH6aarhMPrBbUUQOzHvPoI9evVdGkBPHT+AwNXYDLp4rh/xmUQe1ik+80HliVyMQSrLrGoIQ==
X-Received: by 2002:a19:d06:: with SMTP id 6mr8286410lfn.531.1605898791064;
        Fri, 20 Nov 2020 10:59:51 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id q27sm434478lfo.242.2020.11.20.10.59.49
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 10:59:50 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id u19so14930867lfr.7
        for <linux-i2c@vger.kernel.org>; Fri, 20 Nov 2020 10:59:49 -0800 (PST)
X-Received: by 2002:a19:4b92:: with SMTP id y140mr8175542lfa.485.1605898789139;
 Fri, 20 Nov 2020 10:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20201118234025.376412-1-evgreen@chromium.org> <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <CAHp75VdtwyCj7emc7Bk87q7kMQA0sSX81-aK-fMq4qTfTF-c_g@mail.gmail.com>
In-Reply-To: <CAHp75VdtwyCj7emc7Bk87q7kMQA0sSX81-aK-fMq4qTfTF-c_g@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 20 Nov 2020 10:59:12 -0800
X-Gmail-Original-Message-ID: <CAE=gft4OW7_pWfco4+kY65tbUGUDzXXDfsVMCP8MN93inVem4A@mail.gmail.com>
Message-ID: <CAE=gft4OW7_pWfco4+kY65tbUGUDzXXDfsVMCP8MN93inVem4A@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in
 ACPI land
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 19, 2020 at 7:24 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Nov 19, 2020 at 1:40 AM Evan Green <evgreen@chromium.org> wrote:
> >
> > Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> > property translates directly to a fwnode_property_*() call. The child
> > reg property translates naturally into _ADR in ACPI.
> >
> > The i2c-parent binding is a relic from the days when the bindings
> > dictated that all direct children of an I2C controller had to be I2C
> > devices. These days that's no longer required. The i2c-mux can sit as a
> > direct child of its parent controller, which is where it makes the most
> > sense from a hardware description perspective. For the ACPI
> > implementation we'll assume that's always how the i2c-mux-gpio is
> > instantiated.
>
> ...
>
> > +#ifdef CONFIG_ACPI
> > +
> > +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> > +                                    struct fwnode_handle *fwdev,
> > +                                    unsigned int *adr)
> > +
> > +{
> > +       unsigned long long adr64;
> > +       acpi_status status;
> > +
> > +       status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(fwdev),
> > +                                      METHOD_NAME__ADR,
> > +                                      NULL, &adr64);
> > +
> > +       if (!ACPI_SUCCESS(status)) {
> > +               dev_err(dev, "Cannot get address\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       *adr = adr64;
> > +       if (*adr != adr64) {
> > +               dev_err(dev, "Address out of range\n");
> > +               return -ERANGE;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +#else
> > +
> > +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> > +                                    struct fwnode_handle *fwdev,
> > +                                    unsigned int *adr)
> > +{
> > +       return -EINVAL;
> > +}
> > +
> > +#endif
>
> I'm wondering if you may use acpi_find_child_device() here.
> Or is it a complementary function?

I think it's complementary. The code above is "I have a device, I want
its _ADR". whereas acpi_find_child_device() is "I have an _ADR, I want
its device". I could flip things around to use this, but it would turn
the code from linear into quadratic. I'd have to scan each possible
address and call acpi_find_child_device() with that _ADR to see if
there's a child device there.

>
> ...
>
> > +       device_for_each_child_node(dev, child) {
> > +               if (is_of_node(child)) {
> > +                       fwnode_property_read_u32(child, "reg", values + i);
> > +
> > +               } else if (is_acpi_node(child)) {
> > +                       rc = i2c_mux_gpio_get_acpi_adr(dev, child, values + i);
> > +                       if (rc)
> > +                               return rc;
> > +               }
> > +
> >                 i++;
> >         }
>
> And for this I already told in two different threads with similar code
> that perhaps we need common helper that will check reg followed by
> _ADR.

Oh, I'm not aware of those threads. I'd need some advice: I guess a
new fwnode_* API would make sense for this, but I had trouble coming
up with a generic interface. _ADR is just a blobbo 64 bit int, but
DT's "reg" is a little more flexible, having a length, and potentially
being an array. I suppose it would have to be something like:

int fwnode_property_read_reg(const struct fwnode_handle *fwnode,
                                 size_t index, uint64_t *addr, uint64_t *len);

But then ACPI would always return 0 for length, and only index 0 would
ever work? I'm worried I'm designing an API that's only useful to me.

I tried to look around for other examples of this specific pattern of
_ADR then "reg", but struggled to turn up much.
-Evan

>
> --
> With Best Regards,
> Andy Shevchenko
