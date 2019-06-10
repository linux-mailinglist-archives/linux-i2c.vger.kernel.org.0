Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B613AF16
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 08:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387830AbfFJGod (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 02:44:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42818 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387655AbfFJGod (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 02:44:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id x17so7885888wrl.9
        for <linux-i2c@vger.kernel.org>; Sun, 09 Jun 2019 23:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=6v285XyrONVGX85JZPN2vEBoOamuC/TCwUgIuT1MYVI=;
        b=JUO0jDnbhpEfAJfOIn/mmbA+BYvZwYR3dpEtmWpv9PZIPu+703QoKa9lYvNN7XE01N
         AVuskQ8lgqYi+ReRHmxOrXd+3ZIitSv/af+yb//VqjPkALpRfqUZdL/uGfKplsJoFcGw
         dz7tWj7T0RpYSYQNTTZ1dnCBTeRYE4/Ss6EQ2RS+ITbVhrViYs2H0KPJims9t1QepBn6
         fae6961ZZ0d1mcM/cSiHvZVl4tLZgujzYzWG9ouCPAuwDM1CzhtchbqGQkSuZ7/q8F20
         tbp9aLC0U4YJItjQdYRh9Y8lOaSRcOuO4hKmsKR1J6jdVcvCG0XFPTTX4C383DwnePsf
         sP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6v285XyrONVGX85JZPN2vEBoOamuC/TCwUgIuT1MYVI=;
        b=U3WIsnpFadlyPWaFeTQohr8wc/llHvThaWDHvO6Lw5ImR3UajmYRLNCuBpd7KhItQz
         y3gmHmyicasziT6wTW8NVQrQVsscHCy+4017tE4GJNxgfUoXGwKm9x+5ON4/VWHdoa/F
         RijzNa035NUd4l8CHUARJbEZmnj0KwKxV5kvfgwCGgwlRxwtrkJmRRmnP8187/m4mxIA
         wvi3kD6O8fzHHx32u4jm1bkRIz9ecKuBi1Y7vHzefTaNdZMHEe/+znhwExfrBKeQoTRd
         wVh1UvTcGPmB/RrmQhBbWOhSD3usFmqBIFHjsBS/c9gXxWenCPI3O9AwBEkh/u79RGkk
         wv5Q==
X-Gm-Message-State: APjAAAWR3Y63KaG9nE/BNHEK8aajcmI6iDxQGTbI4vA6Awy4OL1RYi+E
        3xN2SUuF1m83IIIJoOJcwQR0rA==
X-Google-Smtp-Source: APXvYqy45tNcTtpg/c94lrABKtUPI2IloeMt1vo9EvaBBcW/D4raRflIRHWeOa3AYFf8Fefw5c/jrg==
X-Received: by 2002:adf:a11d:: with SMTP id o29mr14522807wro.262.1560149071686;
        Sun, 09 Jun 2019 23:44:31 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a2sm5038333wmj.9.2019.06.09.23.44.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Jun 2019 23:44:30 -0700 (PDT)
Date:   Mon, 10 Jun 2019 07:44:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     alokc@codeaurora.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        wsa+renesas@sang-engineering.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>, balbi@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/8] i2c: i2c-qcom-geni: Provide support for ACPI
Message-ID: <20190610064428.GF4797@dell>
References: <20190607082901.6491-1-lee.jones@linaro.org>
 <CAKv+Gu_SP7qBggCrVkF41BimV3PnCQXb5OUKyCsE0bBxa68RZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKv+Gu_SP7qBggCrVkF41BimV3PnCQXb5OUKyCsE0bBxa68RZA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 07 Jun 2019, Ard Biesheuvel wrote:

> On Fri, 7 Jun 2019 at 10:29, Lee Jones <lee.jones@linaro.org> wrote:
> >
> > Add a match table to allow automatic probing of ACPI device
> > QCOM0220.  Ignore clock attainment errors.  Set default clock
> > frequency value.
> >
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index db075bc0d952..0fa93b448e8d 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> >
> > +#include <linux/acpi.h>
> >  #include <linux/clk.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/err.h>
> > @@ -483,6 +484,12 @@ static const struct i2c_algorithm geni_i2c_algo = {
> >         .functionality  = geni_i2c_func,
> >  };
> >
> > +static const struct acpi_device_id geni_i2c_acpi_match[] = {
> > +       { "QCOM0220"},
> > +       { },
> > +};
> > +MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
> > +
> 
> We usually put #ifdef CONFIG_ACPI/#endif around these, otherwise you
> end up with acpi:XXXX modaliases even though ACPI is not compiled in.

No problem.

> >  static int geni_i2c_probe(struct platform_device *pdev)
> >  {
> >         struct geni_i2c_dev *gi2c;
> > @@ -502,7 +509,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
> >                 return PTR_ERR(gi2c->se.base);
> >
> >         gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
> 
> Can we avoid this call altogether in ACPI mode? Also, please use

I'm trying not to place all non-ACPI specific callers into if ()
statements.  The tabbing becomes ridiculous in some places.  A great
deal of these calls are requesting optional resources too, so it's
better to simply ignore the returning error in the cases where
non-optional resources (such as this one) are requested, since it has
the least impact on the existing code.

> 'has_acpi_companion()' to test whether we are probing via ACPI.

Sure.

> > -       if (IS_ERR(gi2c->se.clk)) {
> > +       if (IS_ERR(gi2c->se.clk) && !ACPI_HANDLE(&pdev->dev)) {
> 
> 
> >                 ret = PTR_ERR(gi2c->se.clk);
> >                 dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
> >                 return ret;
> > @@ -510,12 +517,19 @@ static int geni_i2c_probe(struct platform_device *pdev)
> >
> >         ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> >                                                         &gi2c->clk_freq_out);
> > -       if (ret) {
> > +       if (ret && !ACPI_HANDLE(&pdev->dev)) {
> >                 dev_info(&pdev->dev,
> >                         "Bus frequency not specified, default to 100kHz.\n");
> >                 gi2c->clk_freq_out = KHZ(100);
> >         }
> >
> > +       if (ACPI_HANDLE(&pdev->dev)) {
> > +               ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(&pdev->dev));
> > +
> > +               /* Using default, same as the !ACPI case above */
> > +               gi2c->clk_freq_out = KHZ(100);
> > +       }
> > +
> 
> You are overriding the speed to 100 kHz even if the ACPI device has a
> "clock-frequency" property.

Will look at this.

Thanks Ard.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
