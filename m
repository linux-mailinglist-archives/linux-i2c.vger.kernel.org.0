Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F9B3D5A1
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 20:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391883AbfFKSkS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 14:40:18 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42984 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388875AbfFKSkR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 14:40:17 -0400
Received: by mail-pg1-f195.google.com with SMTP id l19so4845803pgh.9
        for <linux-i2c@vger.kernel.org>; Tue, 11 Jun 2019 11:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uF3scc9KxW/hDBo9yixpL6JLeJpWpCyfDiMubViqV3w=;
        b=a/IwH23tLKxZG4tHXQYxewZQ8XALRw+eja67K+M5/z/FNEeQwad3oJrXDdqxeiXTN0
         JCAwohTOmYwVBqWlbh42hI790jxwWh4U7uRcx6iTsHcNG9GOMmvR7eRoOZHCF44GQkAc
         oBTcWSoDfgJNn8h6THvhoka1uM5v+sahJRRAWiy3tyw+ghRjdlPOV/RqYAp7i23/sYBV
         WdLTaSx1YeAeEKSHV86SZ4KKKcgaww9h2/1TcVgsPu9BPYuNOpvH/c9FRbJrA+UdQdT2
         ErF4h0gR+JelusMccEw/LhaR3SsZ6jvNo5sTT6OAgRUOneDLE7TtHLWu3tcBzFB8NTzf
         RtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uF3scc9KxW/hDBo9yixpL6JLeJpWpCyfDiMubViqV3w=;
        b=KRw6elHuQdkq/rjzk4FonHhBJbc/qzy2ZoMdDwNQL4c9Ozf7ZKulqL2WVykhSKgkqi
         3y+t7zkpKc8AAVfdGNVLO4aeKyGFOvaC266M2FpMYL+NP68KFRVPKjC0G10BKBowixCd
         O+q/CyVEKiR6ro4iuZYn6TRVnZFVmWyiw19yLlJ/O/uJqI31WP3hSb7pXVvrYlDWBQbF
         gPbHajuvnWgWaaIwjbkQLUyHozwJp+OLIEsG5LLVztqz6BR/qSXaS2fWfdq8NJTwgKuP
         ZSQyqJqCgD1BW53jriGXCik6tcxiV0ZvH9ljKgcUU0pJS+w3FU5LFz3t+TGvlPgqs1JP
         McHA==
X-Gm-Message-State: APjAAAVerIKZh4DxVsIk+0gQ+geY3UVBADcxX+7MuElLdQ1F6MsFSa8C
        PMzyJzFXjQbHmIwRA2ltAlokaw==
X-Google-Smtp-Source: APXvYqynYnWiv/cECcNpuyerUBO5l0k57vUwYWheEE66J+ItnSzBpP+OdXuYXnj2u0eHb908ZqL+nA==
X-Received: by 2002:a62:3085:: with SMTP id w127mr78659179pfw.170.1560278416611;
        Tue, 11 Jun 2019 11:40:16 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a7sm13394893pgj.42.2019.06.11.11.40.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 11:40:16 -0700 (PDT)
Date:   Tue, 11 Jun 2019 11:40:13 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] pinctrl: qcom: sdm845: Provide ACPI support
Message-ID: <20190611184013.GQ4814@minitux>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190610084213.1052-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610084213.1052-4-lee.jones@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon 10 Jun 01:42 PDT 2019, Lee Jones wrote:

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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

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
>  	UFS_RESET(ufs_reset, 0x99f000),
>  };
>  
> +static const int sdm845_acpi_reserved_gpios[] = {
> +	0, 1, 2, 3, 81, 82, 83, 84, -1
> +};
> +
>  static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
>  	.pins = sdm845_pins,
>  	.npins = ARRAY_SIZE(sdm845_pins),
> @@ -1287,11 +1292,39 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
>  	.ngpios = 150,
>  };
>  
> +static const struct msm_pinctrl_soc_data sdm845_acpi_pinctrl = {
> +	.pins = sdm845_pins,
> +	.npins = ARRAY_SIZE(sdm845_pins),
> +	.groups = sdm845_groups,
> +	.ngroups = ARRAY_SIZE(sdm845_groups),
> +	.reserved_gpios = sdm845_acpi_reserved_gpios,
> +	.ngpios = 150,
> +};
> +
>  static int sdm845_pinctrl_probe(struct platform_device *pdev)
>  {
> -	return msm_pinctrl_probe(pdev, &sdm845_pinctrl);
> +	int ret;
> +
> +	if (pdev->dev.of_node) {
> +		ret = msm_pinctrl_probe(pdev, &sdm845_pinctrl);
> +	} else if (has_acpi_companion(&pdev->dev)) {
> +		ret = msm_pinctrl_probe(pdev, &sdm845_acpi_pinctrl);
> +	} else {
> +		dev_err(&pdev->dev, "DT and ACPI disabled\n");
> +		return -EINVAL;
> +	}
> +
> +	return ret;
>  }
>  
> +#if CONFIG_ACPI
> +static const struct acpi_device_id sdm845_pinctrl_acpi_match[] = {
> +	{ "QCOM0217"},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, sdm845_pinctrl_acpi_match);
> +#endif
> +
>  static const struct of_device_id sdm845_pinctrl_of_match[] = {
>  	{ .compatible = "qcom,sdm845-pinctrl", },
>  	{ },
> @@ -1302,6 +1335,7 @@ static struct platform_driver sdm845_pinctrl_driver = {
>  		.name = "sdm845-pinctrl",
>  		.pm = &msm_pinctrl_dev_pm_ops,
>  		.of_match_table = sdm845_pinctrl_of_match,
> +		.acpi_match_table = ACPI_PTR(sdm845_pinctrl_acpi_match),
>  	},
>  	.probe = sdm845_pinctrl_probe,
>  	.remove = msm_pinctrl_remove,
> -- 
> 2.17.1
> 
