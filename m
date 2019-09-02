Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8656CA5D3B
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 22:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfIBU4f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 16:56:35 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38855 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbfIBU4f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 16:56:35 -0400
Received: by mail-oi1-f195.google.com with SMTP id 7so3028055oip.5;
        Mon, 02 Sep 2019 13:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hHBlqhf1Pfrvrw+3NXufBPmdnxMIhZ7FoOVj1GVHXPE=;
        b=ulINDZ1YlEddLEdDUY3vR07OPMVDv/rVY1Z3oliNoUdqGL7FlfjhMcMTjHYEXGPQpB
         gvTIwYFluQFYqQ2h+oOR3GZDU8jd/Q0yJHzPe3+7Us9Yyfc2nbDTPeJagg/mJUTbjaDT
         0cJoZacqn2fmGX99H3M1gPNTKR7d3o5K5znvDfa/MmyX6o64m0nv7F7eEAD3stGmjgSL
         YZ4Ajoq6RVfkTEd0k2L9PnYqX4R61lAKJ5dGlRXIRWtgGxxx1W9yS/o7THE4fOj29NuA
         js8o6AO8wfrt7WGO2dWNniuYgAA1+mcPUVB91SJ7dcp9Fk5P2G7W6qihDoOIoptqqlyV
         c3+Q==
X-Gm-Message-State: APjAAAU39K/Kvp6S9lTnax3vqcIcjr1Bvz+KLAwxYzsJcnED96UyCdte
        I/TUf7Gjaup8jwNGruYlR44NQiLEsttgrPgPKXA=
X-Google-Smtp-Source: APXvYqzYYelZGMbZ3HtKmmG6PLaB4H45noR4424r5L/BE0qskiSX0U6Mc327EF9USMVBKANFkGyAvxOuRxmqk4Tuino=
X-Received: by 2002:aca:b808:: with SMTP id i8mr19414718oif.68.1567457794237;
 Mon, 02 Sep 2019 13:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190711102601.20582-1-chuanhua.han@nxp.com>
In-Reply-To: <20190711102601.20582-1-chuanhua.han@nxp.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 2 Sep 2019 22:56:22 +0200
Message-ID: <CAJZ5v0hY2sL+XfN_4v07_hjvoxgCAt+Q89+wNg5Pky6XKP-mqA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: support for NXP i2c controller
To:     Chuanhua Han <chuanhua.han@nxp.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Leo Li <leoyang.li@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 11, 2019 at 12:35 PM Chuanhua Han <chuanhua.han@nxp.com> wrote:
>
> Enable NXP i2c controller to boot with ACPI
>
> Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
> Signed-off-by: Udit Kumar <udit.kumar@nxp.com>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>

Wolfram, any objections to this from the i2c side?

> ---
>  drivers/acpi/acpi_apd.c      |  6 ++++++
>  drivers/i2c/busses/i2c-imx.c | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> index ff47317..cf8566c 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -165,6 +165,11 @@ static const struct apd_device_desc thunderx2_i2c_desc = {
>         .fixed_clk_rate = 125000000,
>  };
>
> +static const struct apd_device_desc nxp_i2c_desc = {
> +       .setup = acpi_apd_setup,
> +       .fixed_clk_rate = 350000000,
> +};
> +
>  static const struct apd_device_desc hip08_spi_desc = {
>         .setup = acpi_apd_setup,
>         .fixed_clk_rate = 250000000,
> @@ -238,6 +243,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
>         { "HISI02A1", APD_ADDR(hip07_i2c_desc) },
>         { "HISI02A2", APD_ADDR(hip08_i2c_desc) },
>         { "HISI0173", APD_ADDR(hip08_spi_desc) },
> +       { "NXP0001", APD_ADDR(nxp_i2c_desc) },
>  #endif
>         { }
>  };
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index b1b8b93..99f9b96 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -44,6 +44,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> +#include <linux/acpi.h>
>
>  /* This will be the driver name the kernel reports */
>  #define DRIVER_NAME "imx-i2c"
> @@ -255,6 +256,12 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, i2c_imx_dt_ids);
>
> +static const struct acpi_device_id i2c_imx_acpi_ids[] = {
> +       {"NXP0001", .driver_data = (kernel_ulong_t)&vf610_i2c_hwdata},
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, i2c_imx_acpi_ids);
> +
>  static inline int is_imx1_i2c(struct imx_i2c_struct *i2c_imx)
>  {
>         return i2c_imx->hwdata->devtype == IMX1_I2C;
> @@ -1052,6 +1059,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  {
>         const struct of_device_id *of_id = of_match_device(i2c_imx_dt_ids,
>                                                            &pdev->dev);
> +       const struct acpi_device_id *acpi_id =
> +                       acpi_match_device(i2c_imx_acpi_ids,
> +                                         &pdev->dev);
>         struct imx_i2c_struct *i2c_imx;
>         struct resource *res;
>         struct imxi2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
> @@ -1079,6 +1089,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
>
>         if (of_id)
>                 i2c_imx->hwdata = of_id->data;
> +       else if (acpi_id)
> +               i2c_imx->hwdata = (struct imx_i2c_hwdata *)
> +                               acpi_id->driver_data;
>         else
>                 i2c_imx->hwdata = (struct imx_i2c_hwdata *)
>                                 platform_get_device_id(pdev)->driver_data;
> @@ -1091,6 +1104,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>         i2c_imx->adapter.nr             = pdev->id;
>         i2c_imx->adapter.dev.of_node    = pdev->dev.of_node;
>         i2c_imx->base                   = base;
> +       ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
>
>         /* Get I2C clock */
>         i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
> @@ -1253,6 +1267,7 @@ static struct platform_driver i2c_imx_driver = {
>                 .name = DRIVER_NAME,
>                 .pm = &i2c_imx_pm_ops,
>                 .of_match_table = i2c_imx_dt_ids,
> +               .acpi_match_table = ACPI_PTR(i2c_imx_acpi_ids),
>         },
>         .id_table = imx_i2c_devtype,
>  };
> --
> 2.9.5
>
