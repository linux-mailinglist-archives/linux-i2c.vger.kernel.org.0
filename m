Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2066E2F6961
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 19:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbhANSUV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 13:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729791AbhANSUK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jan 2021 13:20:10 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EEFC0617A6
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jan 2021 10:18:39 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id y22so7508958ljn.9
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jan 2021 10:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pJvCZAHLaqoKEh3y+oXgKjwlwnBYnY7borzTim+qS1o=;
        b=cS4njNwz1nYL1oLQgguEnWk/vDzwqTbhtnDQOGZFDlONuogA+k6cMdUtps27GV41L/
         eM8uU49Q5s4mDy3pPtaNcswW/tT9DMGkPJ/mlrPx2a/2GUm7nUZcOq2oV2smZePEhD++
         S+YWl3vuAzLSeIEFoL1okEkoP/yPulGSm20Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJvCZAHLaqoKEh3y+oXgKjwlwnBYnY7borzTim+qS1o=;
        b=N0a4BzZopIollfJdLHwMzolzkALqOyYu3KqRk/i4oDP9TsLwm15VPEV6heo/R9FLGJ
         tJfYK7PQPIv30CyTKSO0Bz9t6VEXcPF3W8b3A5tBkE0qexYVp/fL48ULvMYgtauC4V5n
         Ui3C+qVDPoQFJqLqPdFyOhho/ZKTeFCNZI25ThBKHS1DqmaMA7agBbpr5aztrZSLShp6
         nAtK6qqxf1eqFrR48eX2wBGhM9P6VKMkh1bvK7FOPbTC39jWAsmC3Alszz10TJhILoiK
         geEtQnWCLW5UIm9TzI3mA0e1JcpN+CB6KiitRrOoI1bfcesY2tG5LPaVv7LGu8fl1hfJ
         lTWg==
X-Gm-Message-State: AOAM533JpiJC7Qnx82rlUYIKa3CNg7M3OUcSI7C0tGL2q83SyjFUdKR4
        OY1PFeXBF9bYxNuZPyNCTQ5QdNFg4DUIfw==
X-Google-Smtp-Source: ABdhPJzjZld/Un7kj57fBg+KaG5EP/OJv4hUjUI7BQaB2YFQbaOdr/71XoYXsKhqHy2A1G6xYbj3fg==
X-Received: by 2002:a2e:5756:: with SMTP id r22mr3742314ljd.481.1610648317503;
        Thu, 14 Jan 2021 10:18:37 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id q5sm619973lfr.172.2021.01.14.10.18.36
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 10:18:36 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id m10so7552091lji.1
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jan 2021 10:18:36 -0800 (PST)
X-Received: by 2002:a2e:a40b:: with SMTP id p11mr3547850ljn.315.1610648315779;
 Thu, 14 Jan 2021 10:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20201118234025.376412-1-evgreen@chromium.org> <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <CAHp75VdtwyCj7emc7Bk87q7kMQA0sSX81-aK-fMq4qTfTF-c_g@mail.gmail.com>
 <CAE=gft4OW7_pWfco4+kY65tbUGUDzXXDfsVMCP8MN93inVem4A@mail.gmail.com> <20210105102505.GG2000@ninjato>
In-Reply-To: <20210105102505.GG2000@ninjato>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 14 Jan 2021 10:17:59 -0800
X-Gmail-Original-Message-ID: <CAE=gft42nQECU9Sn9yC-o8+VE9EDoRgLmqVR0Uwma+vBTiEh-Q@mail.gmail.com>
Message-ID: <CAE=gft42nQECU9Sn9yC-o8+VE9EDoRgLmqVR0Uwma+vBTiEh-Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in
 ACPI land
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Rosin <peda@axentia.se>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 5, 2021 at 2:25 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Fri, Nov 20, 2020 at 10:59:12AM -0800, Evan Green wrote:
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
> > -Evan
>
> Andy, is Evan's answer satisfying for you?

Can this be accepted as-is, or should I resend?
-Evan
