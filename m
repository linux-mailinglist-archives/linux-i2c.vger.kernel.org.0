Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DF6439488
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 13:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbhJYLOm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 07:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhJYLOm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 07:14:42 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CF4C061745;
        Mon, 25 Oct 2021 04:12:20 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id l13so20991631edi.8;
        Mon, 25 Oct 2021 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DE414Csss+ESJUsxIVSV3LbjKKBbROgWqQe4HOBfb1o=;
        b=ZyabSViE6U7Oogdi/LL9eL0DoZU1mlE5KHkHL4kMn5iqw3evyYKxGSA/W6q38331bM
         BwzH90IAxQMTWxLdXZBFrIRih2fY27usQYqwoOop1toa+3X5qgVXvc1SSSkIaifjMG/0
         Nn8EUcL1MOUPCUYeDWwvaJGdDkKdIcBzOFHDrsGFP3UAEYKqqwC8UKGzt1d+d+AKgN9Z
         wQdFk8V/VcpXrC3ZY98ZamMK/2y/sU589/tsO1FFMEwmDqZ4W+Mc5UKF79NVgKWRrklC
         2W8tcKHBVZsh2pv3l2f4fM+1M5sUdZLbU57j6ep4wR4Azrw+8nf2Fz26huOrOA/Hpd9W
         MrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DE414Csss+ESJUsxIVSV3LbjKKBbROgWqQe4HOBfb1o=;
        b=TNSjPm7ipHVX8sD52eHcIyniuUWiAO9y3LfdaFSHP5xDYXF0ES/68BjuMWaF0Jdj6u
         e2aCkRdRFxqOogJ228nA/ELufSXSHnNJUPl42jUMZK7xiuC7GrjI817R548sAIaLpWi9
         sEyvZrRSqtvNSi/52wntKyThAWLfbdxL3k6qzw7jVx9//YOli1PoTcczo0tF2KBFaZdi
         RckDP5le2i9YIHoID4aR6aUl/zYxTNrRgwh8cqGst+gZ9HX4MQJH9A/xq0zxtEwQr73k
         DTtTPAREiIwfHUhY5emszO+WknbhxtAnms4Eyy7OWP6qabbH/re+rZAcRCXD6hb6vn48
         Rw5g==
X-Gm-Message-State: AOAM531wyNtFJQoV3TuE2TKpxyeJeHA0b+2C5NJGLFvjzHzCp/WxmQJj
        t7YFQe5MLydqwOzSd9O7p0D6uVn/4LtCI//rc6o=
X-Google-Smtp-Source: ABdhPJxsHqCxc9rcuWSI/uo1379vMzZ34fwIDA/WvIMYTprTuHb5Azjp9WOPaOClk9+sjtE6UnOhGd4VS5+dBo7YQhQ=
X-Received: by 2002:a17:906:d553:: with SMTP id cr19mr14174870ejc.128.1635160338586;
 Mon, 25 Oct 2021 04:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-5-hdegoede@redhat.com>
In-Reply-To: <20211025094119.82967-5-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Oct 2021 14:11:24 +0300
Message-ID: <CAHp75Ve4nu1WDURaSvUto6+aLoEDM2OfTCVi2Th6x-oagO6a-Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] regulator: Introduce tps68470-regulator driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 25, 2021 at 12:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
> the kernel the Regulators and Clocks are controlled by an OpRegion
> driver designed to work with power control methods defined in ACPI, but
> some platforms lack those methods, meaning drivers need to be able to
> consume the resources of these chips through the usual frameworks.
>
> This commit adds a driver for the regulators provided by the tps68470,
> and is designed to bind to the platform_device registered by the
> intel_skl_int3472 module.
>
> This is based on this out of tree driver written by Intel:
> https://github.com/intel/linux-intel-lts/blob/4.14/base/drivers/regulator/tps68470-regulator.c
> with various cleanups added.

> +struct tps68470_regulator_data {
> +       struct clk *clk;
> +};

...

> +/*
> + * (1) This register must have same setting as VIOVAL if S_IO LDO is used to
> + *     power daisy chained IOs in the receive side.
> + * (2) If there is no I2C daisy chain it can be set freely.

> + *

Redundant empty line.

> + */

...

> +       struct tps68470_regulator_platform_data *pdata = pdev->dev.platform_data;

dev_get_platdata() ?

...

> +       data->clk = devm_clk_get(&pdev->dev, "tps68470-clk");
> +       if (IS_ERR(data->clk)) {
> +               dev_err(&pdev->dev, "Error getting tps68470-clk\n");
> +               return PTR_ERR(data->clk);
> +       }

return dev_err_probe(...);

...

> +               rdev = devm_regulator_register(&pdev->dev, &regulators[i], &config);
> +               if (IS_ERR(rdev)) {
> +                       dev_err(&pdev->dev, "failed to register %s regulator\n",
> +                               regulators[i].name);
> +                       return PTR_ERR(rdev);
> +               }

Ditto.

-- 
With Best Regards,
Andy Shevchenko
