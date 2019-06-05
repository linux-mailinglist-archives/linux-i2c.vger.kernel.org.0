Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFBE356BA
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 08:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfFEGQi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 02:16:38 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39593 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbfFEGQh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 02:16:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id 196so11815001pgc.6
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jun 2019 23:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yPLGcJboWqTS41OXT0YPS9mFDLi+KIswrNZ4xj5RMzE=;
        b=a2p19VFRYfiN+slwv4mz43rBb2yISQyrLkTJcMwSA/WWx9l79OZvNlzb0McxQjlz1q
         V0H85qKfEr5ZtprV5QK9qBTKSV8I1gF9ndrBiqTp2IS+Bz1UAF4xjzJ5ovK8Dbv9obd/
         E4MAUdbc473B8+RS4fi0cnV5jtQ/pttN9wdLEjbGLZPKISnutmqS1RoLvLUmatV7Sxj4
         1YpTj26Z25oIhkuyqe73xgLobBxUTtBRWPzTU80HA6shTFVU+iFMdg7A/LeV1fBVQ54j
         iipbbvvwaXrxFxqY26USW52xFqh7PwiURi/plOK8dz92vePi2swKlawieFKqGfDli8E8
         zFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yPLGcJboWqTS41OXT0YPS9mFDLi+KIswrNZ4xj5RMzE=;
        b=QR5lfUoNu5xoaihPeAb9cZT/b+RCOtTQblnIGx8k44X6h1WzZWE/jD9wXELUNcWauH
         ifgNo0li3cTln7QR7K8cyN7721qAZwVaDqfdZb22ELtj/VTkzBVi9zyLB+MRTN2Ai5+c
         /ejRNnKem+dv23CqWqE98u3NBGhSrTtf1iF672vfAuk6mBx6B+HzlJHJbr90mK3w+xDt
         eFLCd4k8Um5cmV3pg7Y+AM7k1RjuUnTT/iE6OR3iKmilIrIDaeAf0Fbf9BxCCXGKTb1B
         tOuyJykvy/pO9NAF1TtRbF14IR1GhFWR64+hRhQUoJP4ClMjgvrjNbPiiKlD32bv4XTG
         fIpA==
X-Gm-Message-State: APjAAAXAmdTmGZKcMmh1iJP943qpifn0FzPNOqKRHIbBpNYFftShEbZ5
        ayPL2D2DVUx5fnJVWTIzpKWnTg==
X-Google-Smtp-Source: APXvYqwEJhIs8QubYN0avnbvfixWjIzhGaRnp7YPaFTgZ2Z2O0BG2WDaO37plKfU2MMrMOlw9tyzHw==
X-Received: by 2002:a62:ea0a:: with SMTP id t10mr43421341pfh.236.1559715396814;
        Tue, 04 Jun 2019 23:16:36 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z18sm8987858pgh.88.2019.06.04.23.16.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 23:16:36 -0700 (PDT)
Date:   Tue, 4 Jun 2019 23:17:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/8] pinctrl: qcom: sdm845: Provide ACPI support
Message-ID: <20190605061721.GK22737@tuxbook-pro>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604104455.8877-4-lee.jones@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:

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
> ---
>  drivers/pinctrl/qcom/Kconfig          |  2 +-
>  drivers/pinctrl/qcom/pinctrl-sdm845.c | 35 ++++++++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
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
> index c97f20fca5fd..7188bee3cf3e 100644
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
> @@ -1284,14 +1289,41 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
>  	.nfunctions = ARRAY_SIZE(sdm845_functions),
>  	.groups = sdm845_groups,
>  	.ngroups = ARRAY_SIZE(sdm845_groups),
> +	.reserved_gpios = sdm845_acpi_reserved_gpios,

The reason why put these in DT is because the list is board/firmware
dependent. E.g. the firmware on db845c does not support the peripherals
that sits on these 8 pins and as such these are not reserved.

But given that the two structs looks identical now, did you perhaps not
intend to add.reserved_gpios for the non-ACPI case?

Regards,
Bjorn

> +	.ngpios = 150,
> +};
> +
> +static const struct msm_pinctrl_soc_data sdm845_acpi_pinctrl = {
> +	.pins = sdm845_pins,
> +	.npins = ARRAY_SIZE(sdm845_pins),
> +	.groups = sdm845_groups,
> +	.ngroups = ARRAY_SIZE(sdm845_groups),
> +	.reserved_gpios = sdm845_acpi_reserved_gpios,
>  	.ngpios = 150,
>  };
>  
>  static int sdm845_pinctrl_probe(struct platform_device *pdev)
>  {
> -	return msm_pinctrl_probe(pdev, &sdm845_pinctrl);
> +	int ret;
> +
> +	if (pdev->dev.of_node) {
> +		ret = msm_pinctrl_probe(pdev, &sdm845_pinctrl);
> +	} else if (ACPI_HANDLE(&pdev->dev)) {
> +		ret = msm_pinctrl_probe(pdev, &sdm845_acpi_pinctrl);
> +	} else {
> +		dev_err(&pdev->dev, "DT and ACPI disabled\n");
> +		return -EINVAL;
> +	}
> +
> +	return ret;
>  }
>  
> +static const struct acpi_device_id sdm845_pinctrl_acpi_match[] = {
> +	{ "QCOM0217"},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, sdm845_pinctrl_acpi_match);
> +
>  static const struct of_device_id sdm845_pinctrl_of_match[] = {
>  	{ .compatible = "qcom,sdm845-pinctrl", },
>  	{ },
> @@ -1302,6 +1334,7 @@ static struct platform_driver sdm845_pinctrl_driver = {
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
