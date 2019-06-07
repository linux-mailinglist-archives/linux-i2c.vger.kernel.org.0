Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D2838882
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 13:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfFGLIh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 07:08:37 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42801 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbfFGLIh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 07:08:37 -0400
Received: by mail-io1-f65.google.com with SMTP id u19so1071138ior.9
        for <linux-i2c@vger.kernel.org>; Fri, 07 Jun 2019 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GXA3Jr+Mhw7TJ/Zj0rrWncqBfBkrIy8iCvF3ptMXOGE=;
        b=kKmWVm7KNq1gSBghKEw8JHjybhOI4fZHTnGfp2JTChD6SU08oV8twygIt6if0dSujm
         YFYcFhgdSb4cTtmxOX8hlja4HscZv35gluhEq+WILhmLtf2CXLYanIgjfETslUG3AIee
         77sfg8QmheYJ1Y9FMyJqEHmU78MGah8K9YstGDvrZfeib4m1GrGI77FH36AgGhfNvtmE
         5XRu8K1G/HTl0HNGtTgagJfajtF11z8NCLRF/bWYbXO0Oyb+PhDvuHUiw0aPyucijghq
         K7QZDmenykjrYN02pdjgCGLSvTWxLAYh1G8X164OxAHcifc+HYiAB0/+HlO43PpdrFIq
         Rx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GXA3Jr+Mhw7TJ/Zj0rrWncqBfBkrIy8iCvF3ptMXOGE=;
        b=k+xliy3/QXjV29Eop1uKxXDk1m8FPpnZ8zNzphVwWXt7iKrcsNo8FYbaqSa5UOo7tD
         qPfS7jBUM36gZW1PqekrnoneByIMhL9l3wJ9QmCXYYGwMnIKSkGPk9EZs2zoPPMtnIVP
         wVgYZJFb+ngukMK3VyMWmHCdi1Ks1dmqOf0hB8tqh3PCrICw1+OOWbI+2czoM/ybzgON
         WdSRP92yxOj1DTqfYuCJ1UL0adIBw/low8EyGghdhw7XW6h3YmrzoEC4bMnOzx1bjphA
         +VKgNVvrJ49dsD7CskCOUuLtaiEyZ/DfKvHMEbtWguv0ALHiYUMDDMt3tGGJO4kMjR7A
         bLAw==
X-Gm-Message-State: APjAAAWqSrPckRebuad8A2xmstoiiEOeEJlAWpUEU2gJDdGEd9hAQq9E
        3Dk9W+RPdNOuTLqjgyUuRM+IVDxgCYjciz2kUsiW5Q==
X-Google-Smtp-Source: APXvYqx+hd94b4UUsZSCPJJ96EY6XV+oXjukJZTTRGg/pxcsi1nOH4E1wPdCHkE5/rIixOEkqC0BmTndCcDQVsRhVM8=
X-Received: by 2002:a05:6602:98:: with SMTP id h24mr300107iob.49.1559905716603;
 Fri, 07 Jun 2019 04:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190607082901.6491-1-lee.jones@linaro.org>
In-Reply-To: <20190607082901.6491-1-lee.jones@linaro.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Fri, 7 Jun 2019 13:08:25 +0200
Message-ID: <CAKv+Gu_SP7qBggCrVkF41BimV3PnCQXb5OUKyCsE0bBxa68RZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] i2c: i2c-qcom-geni: Provide support for ACPI
To:     Lee Jones <lee.jones@linaro.org>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 7 Jun 2019 at 10:29, Lee Jones <lee.jones@linaro.org> wrote:
>
> Add a match table to allow automatic probing of ACPI device
> QCOM0220.  Ignore clock attainment errors.  Set default clock
> frequency value.
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index db075bc0d952..0fa93b448e8d 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>
> +#include <linux/acpi.h>
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> @@ -483,6 +484,12 @@ static const struct i2c_algorithm geni_i2c_algo = {
>         .functionality  = geni_i2c_func,
>  };
>
> +static const struct acpi_device_id geni_i2c_acpi_match[] = {
> +       { "QCOM0220"},
> +       { },
> +};
> +MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
> +

We usually put #ifdef CONFIG_ACPI/#endif around these, otherwise you
end up with acpi:XXXX modaliases even though ACPI is not compiled in.

>  static int geni_i2c_probe(struct platform_device *pdev)
>  {
>         struct geni_i2c_dev *gi2c;
> @@ -502,7 +509,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(gi2c->se.base);
>
>         gi2c->se.clk = devm_clk_get(&pdev->dev, "se");

Can we avoid this call altogether in ACPI mode? Also, please use
'has_acpi_companion()' to test whether we are probing via ACPI.

> -       if (IS_ERR(gi2c->se.clk)) {
> +       if (IS_ERR(gi2c->se.clk) && !ACPI_HANDLE(&pdev->dev)) {


>                 ret = PTR_ERR(gi2c->se.clk);
>                 dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
>                 return ret;
> @@ -510,12 +517,19 @@ static int geni_i2c_probe(struct platform_device *pdev)
>
>         ret = device_property_read_u32(&pdev->dev, "clock-frequency",
>                                                         &gi2c->clk_freq_out);
> -       if (ret) {
> +       if (ret && !ACPI_HANDLE(&pdev->dev)) {
>                 dev_info(&pdev->dev,
>                         "Bus frequency not specified, default to 100kHz.\n");
>                 gi2c->clk_freq_out = KHZ(100);
>         }
>
> +       if (ACPI_HANDLE(&pdev->dev)) {
> +               ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(&pdev->dev));
> +
> +               /* Using default, same as the !ACPI case above */
> +               gi2c->clk_freq_out = KHZ(100);
> +       }
> +

You are overriding the speed to 100 kHz even if the ACPI device has a
"clock-frequency" property.

>         gi2c->irq = platform_get_irq(pdev, 0);
>         if (gi2c->irq < 0) {
>                 dev_err(&pdev->dev, "IRQ error for i2c-geni\n");
> @@ -660,6 +674,7 @@ static struct platform_driver geni_i2c_driver = {
>                 .name = "geni_i2c",
>                 .pm = &geni_i2c_pm_ops,
>                 .of_match_table = geni_i2c_dt_match,
> +               .acpi_match_table = ACPI_PTR(geni_i2c_acpi_match),
>         },
>  };
>
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
