Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42AB63B12A
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 10:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388190AbfFJIqu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 04:46:50 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:38704 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387947AbfFJIqt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 04:46:49 -0400
Received: by mail-it1-f196.google.com with SMTP id e25so5721134itk.3
        for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2019 01:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ikcgBnYbP9juRCdJItwhn68EANrq89roggN/h0NSIPw=;
        b=Z8yrK3B8Vo2vsUloPWC/6YqOyL7SvDr+wc3i83jXI97jgSQP3O28eo59oTkF31I0pu
         FdRGYdteGvZ9nMBpjQQWGkO16TmFWxngVwcOKkWJ87ytsYoWaZSbSnQ3vgY2g1VwT2od
         6diA7qJyjNTxao3TutOgCE64N9WVNfz7GQAz3m7t79W+hwXdnur6sjLRTSy8A9YUa4m5
         jX+J5YobXjnBVQD3InEAEmZDTZtAd7fkZVUDJ0kwYGOmw2V7QL9VM52jbNPkEgCmtaJU
         kGpQKtWR61iwtdmbopKPhC3P1EIbXkdY5WiloiqAz3QRcJqCGBxlDzLMqs5HIHRsKOQa
         26KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ikcgBnYbP9juRCdJItwhn68EANrq89roggN/h0NSIPw=;
        b=fLUpI0MdH8VhAzGgLX80Tece81XJauaoadATxTX6YkPFqjPSPWDwZUIVJHXdwLzKaa
         E2WzPDKeuUN1ibVi/2LNCayQgX/D9WbXG/XnjXcQG9Q4rEHzqPzhs41UzhIU3W+Rm2oj
         J2+2esD+BCwuvUXYxcmq2Gy+PR2rMPYehpe7Lam4AZXeAWMC4uxeLgZctFrYgVlhnk3u
         QcXwYyAU6mL98fcCnxs5U6HSOBU5Pye/mrzvQ9oWM1g8ujbq2RuDhOiVI+oo9UG8caER
         odTWTcNNK/xPERyjDnbL7809Sy0j2t6fcAo9XGyT+J+wNqIAL1HrgsrtWLi3PSczdOlV
         g+6w==
X-Gm-Message-State: APjAAAVYU+Iemgcmfx2ePlnlAhZEBEtLtDjSLzUyVHNAt1frm77q5vZT
        SYMlsn//foMu4B3Ti8r2dEgrtn/y2Ns1dsly+ejssQ==
X-Google-Smtp-Source: APXvYqy6GnWta/8uy1aSmaw7/hpzob6WfnV4XOnpexWzXqqcrSEKpvQgjKiRrjvvzqd947KVY0ETA/9UQAkKUNDadJ8=
X-Received: by 2002:a24:740f:: with SMTP id o15mr14320575itc.76.1560156408672;
 Mon, 10 Jun 2019 01:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190610084213.1052-1-lee.jones@linaro.org> <20190610084213.1052-4-lee.jones@linaro.org>
In-Reply-To: <20190610084213.1052-4-lee.jones@linaro.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Mon, 10 Jun 2019 10:46:36 +0200
Message-ID: <CAKv+Gu_s7i8JC4cv-dJMvm1_0cGzzhzf+Dxu0rxcF7iugF=vHg@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] pinctrl: qcom: sdm845: Provide ACPI support
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        wsa+renesas@sang-engineering.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>, balbi@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 10 Jun 2019 at 10:42, Lee Jones <lee.jones@linaro.org> wrote:
>
> This patch provides basic support for booting with ACPI instead
> of the currently supported Device Tree.  When doing so there are a
> couple of differences which we need to taken into consideration.
>
> Firstly, the SDM850 ACPI tables omit information pertaining to the
> 4 reserved GPIOs on the platform.  If Linux attempts to touch/
> initialise any of these lines, the firmware will restart the
> platform.
>
> Secondly, when booting with ACPI, it is expected that the firmware
> will set-up things like; Regulators, Clocks, Pin Functions, etc in
> their ideal configuration.  Thus, the possible Pin Functions
> available to this platform are not advertised when providing the
> higher GPIOD/Pinctrl APIs with pin information.
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

For the ACPI probing boilerplate:
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

*However*, I really don't like hardcoding reserved GPIOs like this.
What guarantee do we have that each and every ACPI system
incorporating the QCOM0217 device has the exact same list of reserved
GPIOs?

> ---
>  drivers/pinctrl/qcom/Kconfig          |  2 +-
>  drivers/pinctrl/qcom/pinctrl-sdm845.c | 36 ++++++++++++++++++++++++++-
>  2 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 2e66ab72c10b..aafbe932424f 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -168,7 +168,7 @@ config PINCTRL_SDM660
>
>  config PINCTRL_SDM845
>         tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
> -       depends on GPIOLIB && OF
> +       depends on GPIOLIB && (OF || ACPI)
>         select PINCTRL_MSM
>         help
>           This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> index c97f20fca5fd..98a438dba711 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -1277,6 +1278,10 @@ static const struct msm_pingroup sdm845_groups[] = {
>         UFS_RESET(ufs_reset, 0x99f000),
>  };
>
> +static const int sdm845_acpi_reserved_gpios[] = {
> +       0, 1, 2, 3, 81, 82, 83, 84, -1
> +};
> +
>  static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
>         .pins = sdm845_pins,
>         .npins = ARRAY_SIZE(sdm845_pins),
> @@ -1287,11 +1292,39 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
>         .ngpios = 150,
>  };
>
> +static const struct msm_pinctrl_soc_data sdm845_acpi_pinctrl = {
> +       .pins = sdm845_pins,
> +       .npins = ARRAY_SIZE(sdm845_pins),
> +       .groups = sdm845_groups,
> +       .ngroups = ARRAY_SIZE(sdm845_groups),
> +       .reserved_gpios = sdm845_acpi_reserved_gpios,
> +       .ngpios = 150,
> +};
> +
>  static int sdm845_pinctrl_probe(struct platform_device *pdev)
>  {
> -       return msm_pinctrl_probe(pdev, &sdm845_pinctrl);
> +       int ret;
> +
> +       if (pdev->dev.of_node) {
> +               ret = msm_pinctrl_probe(pdev, &sdm845_pinctrl);
> +       } else if (has_acpi_companion(&pdev->dev)) {
> +               ret = msm_pinctrl_probe(pdev, &sdm845_acpi_pinctrl);
> +       } else {
> +               dev_err(&pdev->dev, "DT and ACPI disabled\n");
> +               return -EINVAL;
> +       }
> +
> +       return ret;
>  }
>
> +#if CONFIG_ACPI
> +static const struct acpi_device_id sdm845_pinctrl_acpi_match[] = {
> +       { "QCOM0217"},
> +       { },
> +};
> +MODULE_DEVICE_TABLE(acpi, sdm845_pinctrl_acpi_match);
> +#endif
> +
>  static const struct of_device_id sdm845_pinctrl_of_match[] = {
>         { .compatible = "qcom,sdm845-pinctrl", },
>         { },
> @@ -1302,6 +1335,7 @@ static struct platform_driver sdm845_pinctrl_driver = {
>                 .name = "sdm845-pinctrl",
>                 .pm = &msm_pinctrl_dev_pm_ops,
>                 .of_match_table = sdm845_pinctrl_of_match,
> +               .acpi_match_table = ACPI_PTR(sdm845_pinctrl_acpi_match),
>         },
>         .probe = sdm845_pinctrl_probe,
>         .remove = msm_pinctrl_remove,
> --
> 2.17.1
>
