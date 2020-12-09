Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B4D2D4E77
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 00:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgLIXEv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 18:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbgLIXEu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Dec 2020 18:04:50 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6214CC0613CF
        for <linux-i2c@vger.kernel.org>; Wed,  9 Dec 2020 15:04:10 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id e7so4438993ljg.10
        for <linux-i2c@vger.kernel.org>; Wed, 09 Dec 2020 15:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMO74Hau3qL0zw1EsJlNy+Kf0E35Zr9dtC9lm7X7hVs=;
        b=RuTn6HCiV9nNg4HIQMkZc4/Qu4UsvOhRfwgqizxlXSto+yYPbP8PLgrAl0ZzDQCf8t
         dxarwTv0ijUCm6uugEAW7/IeTe3opsFB+6KzhTA6r8maxSDRrX5ui6ZbnsPzGDu8nWvz
         UsjXrsT9uvsY2yC/soUD60lQo4t5m9SKfRsE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMO74Hau3qL0zw1EsJlNy+Kf0E35Zr9dtC9lm7X7hVs=;
        b=ngdZSVgpaNEi8v94m/lF2+ke+DtjP9AYKkZqdljh0lGrFVf4UIzpsd5tHukJirjkzJ
         lZ8h0c+S7TyvrgR7wOpSEplFtmhF52WaEyU0aHcKkS+XT9OoaCqn/uQGQuHvgLBYOB4x
         Ujhp8hE+6oB71WZtBF01olqOUv4UhnMU0teehDsJk9yWeZ7DQ6xivXHmuRQyrlCaShGF
         9anrUddk/V23utWRTGJJnk4mhKjhucFnIhEwfT/A1xQGL3/jhrU3yM7Jb6MsTS9/lYfA
         YgE0U6mex7+A7aSuaLcKQGADd/yrcTExqu0ImoZ1dVpWIe6EJj41sbZKqarqA/S8ogkw
         HgBA==
X-Gm-Message-State: AOAM5314iABCda97NqSzMoc9NSM/R2hXhXH5Pl3v2k0g82kN77XnKB0O
        MknyL2rzV+CSeMsoq/GYC9/bKx37t6W67A==
X-Google-Smtp-Source: ABdhPJz9OUcWxQ7JlaqOLvrrtBbjO3s2PDhT++NVrWvDZl8WDRzrVYdHnE1bi/ekn4bcENnCn9U3tA==
X-Received: by 2002:a2e:3312:: with SMTP id d18mr725805ljc.284.1607555048416;
        Wed, 09 Dec 2020 15:04:08 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id c5sm317649lfg.220.2020.12.09.15.04.07
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 15:04:08 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id m19so5485685lfb.1
        for <linux-i2c@vger.kernel.org>; Wed, 09 Dec 2020 15:04:07 -0800 (PST)
X-Received: by 2002:a19:488:: with SMTP id 130mr1622914lfe.124.1607555046503;
 Wed, 09 Dec 2020 15:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20201118234025.376412-1-evgreen@chromium.org> <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <CAHp75VdtwyCj7emc7Bk87q7kMQA0sSX81-aK-fMq4qTfTF-c_g@mail.gmail.com>
 <CAE=gft4OW7_pWfco4+kY65tbUGUDzXXDfsVMCP8MN93inVem4A@mail.gmail.com> <CAE=gft4LDh7TmvMgL4_eov5=1Nh0PYVRDxn4eCLsDd5JJyCwAw@mail.gmail.com>
In-Reply-To: <CAE=gft4LDh7TmvMgL4_eov5=1Nh0PYVRDxn4eCLsDd5JJyCwAw@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 9 Dec 2020 15:03:29 -0800
X-Gmail-Original-Message-ID: <CAE=gft6_YYszA8k8zALEcDR9LbEtUG8RQKRB793vPgDqdGd7Fw@mail.gmail.com>
Message-ID: <CAE=gft6_YYszA8k8zALEcDR9LbEtUG8RQKRB793vPgDqdGd7Fw@mail.gmail.com>
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

Very sorry to ping. Is there anything I can do to help get this reviewed?
-Evan

On Mon, Nov 30, 2020 at 11:11 AM Evan Green <evgreen@chromium.org> wrote:
>
> Hi Andy, Peter,
>
> On Fri, Nov 20, 2020 at 10:59 AM Evan Green <evgreen@chromium.org> wrote:
> >
> > On Thu, Nov 19, 2020 at 7:24 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Thu, Nov 19, 2020 at 1:40 AM Evan Green <evgreen@chromium.org> wrote:
> > > >
> > > > Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> > > > property translates directly to a fwnode_property_*() call. The child
> > > > reg property translates naturally into _ADR in ACPI.
> > > >
> > > > The i2c-parent binding is a relic from the days when the bindings
> > > > dictated that all direct children of an I2C controller had to be I2C
> > > > devices. These days that's no longer required. The i2c-mux can sit as a
> > > > direct child of its parent controller, which is where it makes the most
> > > > sense from a hardware description perspective. For the ACPI
> > > > implementation we'll assume that's always how the i2c-mux-gpio is
> > > > instantiated.
> > >
> > > ...
> > >
> > > > +#ifdef CONFIG_ACPI
> > > > +
> > > > +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> > > > +                                    struct fwnode_handle *fwdev,
> > > > +                                    unsigned int *adr)
> > > > +
> > > > +{
> > > > +       unsigned long long adr64;
> > > > +       acpi_status status;
> > > > +
> > > > +       status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(fwdev),
> > > > +                                      METHOD_NAME__ADR,
> > > > +                                      NULL, &adr64);
> > > > +
> > > > +       if (!ACPI_SUCCESS(status)) {
> > > > +               dev_err(dev, "Cannot get address\n");
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +       *adr = adr64;
> > > > +       if (*adr != adr64) {
> > > > +               dev_err(dev, "Address out of range\n");
> > > > +               return -ERANGE;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +#else
> > > > +
> > > > +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> > > > +                                    struct fwnode_handle *fwdev,
> > > > +                                    unsigned int *adr)
> > > > +{
> > > > +       return -EINVAL;
> > > > +}
> > > > +
> > > > +#endif
> > >
> > > I'm wondering if you may use acpi_find_child_device() here.
> > > Or is it a complementary function?
> >
> > I think it's complementary. The code above is "I have a device, I want
> > its _ADR". whereas acpi_find_child_device() is "I have an _ADR, I want
> > its device". I could flip things around to use this, but it would turn
> > the code from linear into quadratic. I'd have to scan each possible
> > address and call acpi_find_child_device() with that _ADR to see if
> > there's a child device there.
> >
> > >
> > > ...
> > >
> > > > +       device_for_each_child_node(dev, child) {
> > > > +               if (is_of_node(child)) {
> > > > +                       fwnode_property_read_u32(child, "reg", values + i);
> > > > +
> > > > +               } else if (is_acpi_node(child)) {
> > > > +                       rc = i2c_mux_gpio_get_acpi_adr(dev, child, values + i);
> > > > +                       if (rc)
> > > > +                               return rc;
> > > > +               }
> > > > +
> > > >                 i++;
> > > >         }
> > >
> > > And for this I already told in two different threads with similar code
> > > that perhaps we need common helper that will check reg followed by
> > > _ADR.
> >
> > Oh, I'm not aware of those threads. I'd need some advice: I guess a
> > new fwnode_* API would make sense for this, but I had trouble coming
> > up with a generic interface. _ADR is just a blobbo 64 bit int, but
> > DT's "reg" is a little more flexible, having a length, and potentially
> > being an array. I suppose it would have to be something like:
> >
> > int fwnode_property_read_reg(const struct fwnode_handle *fwnode,
> >                                  size_t index, uint64_t *addr, uint64_t *len);
> >
> > But then ACPI would always return 0 for length, and only index 0 would
> > ever work? I'm worried I'm designing an API that's only useful to me.
> >
> > I tried to look around for other examples of this specific pattern of
> > _ADR then "reg", but struggled to turn up much.
>
> Any thoughts on this?
>
> > -Evan
> >
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
