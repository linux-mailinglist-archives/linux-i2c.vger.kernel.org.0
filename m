Return-Path: <linux-i2c+bounces-2749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E86896F27
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 14:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE57B284AF5
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 12:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58799146D57;
	Wed,  3 Apr 2024 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgVUrLBx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2223C70CA7;
	Wed,  3 Apr 2024 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712148430; cv=none; b=Id7vaV7WomuTPLqBv1qmrzXvkPkU2+Hp+N4vP4ACy9/e5RDw3xqYnu/3vRPDXZVWXGGfiauYXTtXgqlaeOkfj+9zqxzNc+xYR/h5CztHYz3vjAzfoyyxgsJywv9s0uNzyKEsBCJ2WKY00Zv6fkJJIaXJJO8HI98yDleulAO/VSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712148430; c=relaxed/simple;
	bh=vq4TR42N8E6GRGTMPdYmd/Lz39ZHmbM1NYqgXsv4wRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYKgoBZ6jA33rUpEr0R48MTXWumr9qBT92jaocZ3vWf2UZyy8Dr3zJ7IiI+FHTZSiklr+NBmjTbOrzTDG7+s/6iJAwpXEOot3TbWgZGZ7JaKw3mTO8RxxIoOYJ9TQdMUdY1pkqL0wVIWc5yNehYzt42uvh4joaiY1l0w/iRRvw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgVUrLBx; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c3e2e18db7so3884529b6e.0;
        Wed, 03 Apr 2024 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712148427; x=1712753227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyV6c/j061HAWvPuJbhWgpu+BuvIpbfcD1UfYEx1jKw=;
        b=lgVUrLBxZ2G46XVKtcKkpSjkG5uGFLJK/6y4/81gDFhNsjfcTyUsTB4+/zpEouXUcT
         keUMdBtuFURG0fNlzOjzbL+eStnBthT3seQST0otn85qPo/mGua1ARxSDfLNlp4ZGxbK
         OuzdXImxeHq65ov0ODoSeXNyELnTP+sZCikPL4AIfI95ov9uRotC+2zTD/+rxDvC1ZW1
         8nxyJHxS/uQILS0Gq2htSEPEMJ0HDh3zjMWQ22ByAPBRNogNUecuYBAVmd4QzbdZK+MJ
         Iwo3vsXrwHZtV8iRXS4CrqCUFfn9XRyi0OsaPSEW5wBTnB/ouLZnJIG+aEscFeClKr1G
         kqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712148427; x=1712753227;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kyV6c/j061HAWvPuJbhWgpu+BuvIpbfcD1UfYEx1jKw=;
        b=p1d+8jY3z1Uhr4iXYi1aw0FnWeU49Hq3p+7H8op43VpFg/UwxHwD3V+UwAYS93Z8ia
         IStlUzyUxOFRShiDKbeg84Lwhc0HediREgO49EMW8TI3I78qCxlqkilPEj+wYrf7wQEV
         L8jgF0nzZ5An5RTOY0zqeM8PqRp9Mqda3w5HKn0OYY4gpEduGJArUnlwAXk3QfPZ6ZC5
         TRvsaR/L3waVBpWrW+h8u/pcI3aWtICckMByX4YJHnuTPYGjYSFYYC4zIHEMWqCFMJ6j
         js3HeJJfDmHo7An69fd/oz7to+BYJeCdtboSy7g+YgYxCcQYs+upJe52sUXXp9uS/Y3C
         ScuA==
X-Forwarded-Encrypted: i=1; AJvYcCW2uqh36RFdDT0F7s0MjhXe7oPoEB/AZNtPtWHx4NhjA+myz46FG3zGnqsiTQXbWw+9nbkOP/1+quyAcx6BMIlCgRSWcnxvPfUidvSsc9a7JshGcHtj9evbdD8D/T13S6vLRZ6Wfpx1ABYQTYVbbC4ai0AUdmYir2nxzkvC4TS3FtPKsMeh0BLRygSliu/8HnCqWzS2H9RHnfpg4nSc/V2H5raaDus2HQis8BqMNW6h6LniZ62sQ6hAWju9OT0FFGkMVoy39ETk7Ra14PuN26DDVSKdIk4XCVCCb5+iy8hQL/VNOzmvzMoVB3ZFqnKTuaPLlKUoxm1xP++7qw42DBwQ+PYFySYRxqn11oDdwKOGLro=
X-Gm-Message-State: AOJu0Yx2oyINCMPiWZJCcSG+93+0cKAsu60QnXCOMjyJUj0F6QUNZngu
	SvF4B5CqmWRwn5K+I8LNzTfR9K2SB5361+0fxcyfGqy9Fsjim+I=
X-Google-Smtp-Source: AGHT+IFX0evikIxwq15wK1wDUsfsab+hNUnURMc/O1YeHFovQCSU5NmMM43H7iU1TbH/RgNOcjgDNQ==
X-Received: by 2002:a05:6808:3849:b0:3c3:e511:2962 with SMTP id ej9-20020a056808384900b003c3e5112962mr3199975oib.20.1712148426974;
        Wed, 03 Apr 2024 05:47:06 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id r8-20020a544888000000b003c38afefbdbsm2493458oic.7.2024.04.03.05.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 05:47:06 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b::37a])
	by serve.minyard.net (Postfix) with ESMTPSA id D3C801800B7;
	Wed,  3 Apr 2024 12:47:04 +0000 (UTC)
Date: Wed, 3 Apr 2024 07:47:03 -0500
From: Corey Minyard <minyard@acm.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Peter Rosin <peda@axentia.se>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>,
	Jason Gunthorpe <jgg@ziepe.ca>, Tom Rix <trix@redhat.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	openipmi-developer@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 33/34] drivers: remove incorrect of_match_ptr/ACPI_PTR
 annotations
Message-ID: <Zg1Px1h7IiU+x9r1@mail.minyard.net>
Reply-To: minyard@acm.org
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-34-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403080702.3509288-34-arnd@kernel.org>

On Wed, Apr 03, 2024 at 10:06:51AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When building with CONFIG_OF and/or CONFIG_ACPI disabled but W=1 extra
> warnings enabled, a lot of driver cause a warning about an unused
> ID table:
> 
> drivers/char/tpm/tpm_ftpm_tee.c:356:34: error: unused variable 'of_ftpm_tee_ids' [-Werror,-Wunused-const-variable]
> drivers/dma/img-mdc-dma.c:863:34: error: unused variable 'mdc_dma_of_match' [-Werror,-Wunused-const-variable]
> drivers/fpga/versal-fpga.c:62:34: error: unused variable 'versal_fpga_of_match' [-Werror,-Wunused-const-variable]
> drivers/i2c/muxes/i2c-mux-ltc4306.c:200:34: error: unused variable 'ltc4306_of_match' [-Werror,-Wunused-const-variable]
> drivers/i2c/muxes/i2c-mux-reg.c:242:34: error: unused variable 'i2c_mux_reg_of_match' [-Werror,-Wunused-const-variable]
> drivers/memory/pl353-smc.c:62:34: error: unused variable 'pl353_smc_supported_children' [-Werror,-Wunused-const-variable]
> drivers/regulator/pbias-regulator.c:136:34: error: unused variable 'pbias_of_match' [-Werror,-Wunused-const-variable]
> drivers/regulator/twl-regulator.c:552:34: error: unused variable 'twl_of_match' [-Werror,-Wunused-const-variable]
> drivers/regulator/twl6030-regulator.c:645:34: error: unused variable 'twl_of_match' [-Werror,-Wunused-const-variable]
> drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3635:36: error: unused variable 'sas_v2_acpi_match' [-Werror,-Wunused-const-variable]
> drivers/staging/pi433/pi433_if.c:1359:34: error: unused variable 'pi433_dt_ids' [-Werror,-Wunused-const-variable]
> drivers/tty/serial/amba-pl011.c:2945:34: error: unused variable 'sbsa_uart_of_match' [-Werror,-Wunused-const-variable]
> 
> The fix is always to just remove the of_match_ptr() and ACPI_PTR() wrappers
> that remove the reference, rather than adding another #ifdef just for build
> testing for a configuration that doesn't matter in practice.
> 
> I considered splitting up the large patch into per subsystem patches, but since
> it's really just the same thing everywhere it feels better to do it all at once.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For the IPMI part:

Acked-by: Corey Minyard <minyard@acm.org>

> ---
>  drivers/char/ipmi/ipmb_dev_int.c          | 2 +-
>  drivers/char/tpm/tpm_ftpm_tee.c           | 2 +-
>  drivers/dma/img-mdc-dma.c                 | 2 +-
>  drivers/fpga/versal-fpga.c                | 2 +-
>  drivers/hid/hid-google-hammer.c           | 6 ++----
>  drivers/i2c/muxes/i2c-mux-ltc4306.c       | 2 +-
>  drivers/i2c/muxes/i2c-mux-reg.c           | 2 +-
>  drivers/input/touchscreen/wdt87xx_i2c.c   | 2 +-
>  drivers/mux/adg792a.c                     | 2 +-
>  drivers/net/ethernet/apm/xgene-v2/main.c  | 2 +-
>  drivers/net/ethernet/hisilicon/hns_mdio.c | 2 +-
>  drivers/regulator/pbias-regulator.c       | 2 +-
>  drivers/regulator/twl-regulator.c         | 2 +-
>  drivers/regulator/twl6030-regulator.c     | 2 +-
>  drivers/rtc/rtc-fsl-ftm-alarm.c           | 2 +-
>  drivers/scsi/hisi_sas/hisi_sas_v1_hw.c    | 2 +-
>  drivers/scsi/hisi_sas/hisi_sas_v2_hw.c    | 2 +-
>  drivers/staging/pi433/pi433_if.c          | 2 +-
>  drivers/tty/serial/amba-pl011.c           | 6 +++---
>  drivers/tty/serial/ma35d1_serial.c        | 2 +-
>  20 files changed, 23 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index 49100845fcb7..5e7bfc7c26e2 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -364,7 +364,7 @@ MODULE_DEVICE_TABLE(acpi, acpi_ipmb_id);
>  static struct i2c_driver ipmb_driver = {
>  	.driver = {
>  		.name = "ipmb-dev",
> -		.acpi_match_table = ACPI_PTR(acpi_ipmb_id),
> +		.acpi_match_table = acpi_ipmb_id,
>  	},
>  	.probe = ipmb_probe,
>  	.remove = ipmb_remove,
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
> index 2ea4882251cf..0c453f3f928d 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.c
> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
> @@ -362,7 +362,7 @@ MODULE_DEVICE_TABLE(of, of_ftpm_tee_ids);
>  static struct platform_driver ftpm_tee_plat_driver = {
>  	.driver = {
>  		.name = "ftpm-tee",
> -		.of_match_table = of_match_ptr(of_ftpm_tee_ids),
> +		.of_match_table = of_ftpm_tee_ids,
>  	},
>  	.shutdown = ftpm_plat_tee_shutdown,
>  	.probe = ftpm_plat_tee_probe,
> diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
> index 0532dd2640dc..6931c8a65415 100644
> --- a/drivers/dma/img-mdc-dma.c
> +++ b/drivers/dma/img-mdc-dma.c
> @@ -1073,7 +1073,7 @@ static struct platform_driver mdc_dma_driver = {
>  	.driver = {
>  		.name = "img-mdc-dma",
>  		.pm = &img_mdc_pm_ops,
> -		.of_match_table = of_match_ptr(mdc_dma_of_match),
> +		.of_match_table = mdc_dma_of_match,
>  	},
>  	.probe = mdc_dma_probe,
>  	.remove_new = mdc_dma_remove,
> diff --git a/drivers/fpga/versal-fpga.c b/drivers/fpga/versal-fpga.c
> index 3710e8f01be2..e6189106c468 100644
> --- a/drivers/fpga/versal-fpga.c
> +++ b/drivers/fpga/versal-fpga.c
> @@ -69,7 +69,7 @@ static struct platform_driver versal_fpga_driver = {
>  	.probe = versal_fpga_probe,
>  	.driver = {
>  		.name = "versal_fpga_manager",
> -		.of_match_table = of_match_ptr(versal_fpga_of_match),
> +		.of_match_table = versal_fpga_of_match,
>  	},
>  };
>  module_platform_driver(versal_fpga_driver);
> diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
> index c6bdb9c4ef3e..886cc5748b7d 100644
> --- a/drivers/hid/hid-google-hammer.c
> +++ b/drivers/hid/hid-google-hammer.c
> @@ -275,21 +275,19 @@ static const struct acpi_device_id cbas_ec_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, cbas_ec_acpi_ids);
>  
> -#ifdef CONFIG_OF
>  static const struct of_device_id cbas_ec_of_match[] = {
>  	{ .compatible = "google,cros-cbas" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, cbas_ec_of_match);
> -#endif
>  
>  static struct platform_driver cbas_ec_driver = {
>  	.probe = cbas_ec_probe,
>  	.remove = cbas_ec_remove,
>  	.driver = {
>  		.name = "cbas_ec",
> -		.acpi_match_table = ACPI_PTR(cbas_ec_acpi_ids),
> -		.of_match_table = of_match_ptr(cbas_ec_of_match),
> +		.acpi_match_table = cbas_ec_acpi_ids,
> +		.of_match_table = cbas_ec_of_match,
>  		.pm = &cbas_ec_pm_ops,
>  	},
>  };
> diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> index 23766d853e76..c6d70788161a 100644
> --- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
> +++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> @@ -303,7 +303,7 @@ static void ltc4306_remove(struct i2c_client *client)
>  static struct i2c_driver ltc4306_driver = {
>  	.driver		= {
>  		.name	= "ltc4306",
> -		.of_match_table = of_match_ptr(ltc4306_of_match),
> +		.of_match_table = ltc4306_of_match,
>  	},
>  	.probe		= ltc4306_probe,
>  	.remove		= ltc4306_remove,
> diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
> index 8489971babd3..0f1b39964743 100644
> --- a/drivers/i2c/muxes/i2c-mux-reg.c
> +++ b/drivers/i2c/muxes/i2c-mux-reg.c
> @@ -250,7 +250,7 @@ static struct platform_driver i2c_mux_reg_driver = {
>  	.remove_new = i2c_mux_reg_remove,
>  	.driver	= {
>  		.name	= "i2c-mux-reg",
> -		.of_match_table = of_match_ptr(i2c_mux_reg_of_match),
> +		.of_match_table = i2c_mux_reg_of_match,
>  	},
>  };
>  
> diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
> index 32c7be54434c..9f3a4092e47c 100644
> --- a/drivers/input/touchscreen/wdt87xx_i2c.c
> +++ b/drivers/input/touchscreen/wdt87xx_i2c.c
> @@ -1166,7 +1166,7 @@ static struct i2c_driver wdt87xx_driver = {
>  		.name = WDT87XX_NAME,
>  		.dev_groups = wdt87xx_groups,
>  		.pm = pm_sleep_ptr(&wdt87xx_pm_ops),
> -		.acpi_match_table = ACPI_PTR(wdt87xx_acpi_id),
> +		.acpi_match_table = wdt87xx_acpi_id,
>  	},
>  };
>  module_i2c_driver(wdt87xx_driver);
> diff --git a/drivers/mux/adg792a.c b/drivers/mux/adg792a.c
> index 4da5aecb9fc6..a5afe29e3cf1 100644
> --- a/drivers/mux/adg792a.c
> +++ b/drivers/mux/adg792a.c
> @@ -141,7 +141,7 @@ MODULE_DEVICE_TABLE(of, adg792a_of_match);
>  static struct i2c_driver adg792a_driver = {
>  	.driver		= {
>  		.name		= "adg792a",
> -		.of_match_table = of_match_ptr(adg792a_of_match),
> +		.of_match_table = adg792a_of_match,
>  	},
>  	.probe		= adg792a_probe,
>  	.id_table	= adg792a_id,
> diff --git a/drivers/net/ethernet/apm/xgene-v2/main.c b/drivers/net/ethernet/apm/xgene-v2/main.c
> index 9e90c2381491..64370057ba3d 100644
> --- a/drivers/net/ethernet/apm/xgene-v2/main.c
> +++ b/drivers/net/ethernet/apm/xgene-v2/main.c
> @@ -731,7 +731,7 @@ MODULE_DEVICE_TABLE(acpi, xge_acpi_match);
>  static struct platform_driver xge_driver = {
>  	.driver = {
>  		   .name = "xgene-enet-v2",
> -		   .acpi_match_table = ACPI_PTR(xge_acpi_match),
> +		   .acpi_match_table = xge_acpi_match,
>  	},
>  	.probe = xge_probe,
>  	.remove_new = xge_remove,
> diff --git a/drivers/net/ethernet/hisilicon/hns_mdio.c b/drivers/net/ethernet/hisilicon/hns_mdio.c
> index ed73707176c1..f8caf59bd759 100644
> --- a/drivers/net/ethernet/hisilicon/hns_mdio.c
> +++ b/drivers/net/ethernet/hisilicon/hns_mdio.c
> @@ -639,7 +639,7 @@ static struct platform_driver hns_mdio_driver = {
>  	.driver = {
>  		   .name = MDIO_DRV_NAME,
>  		   .of_match_table = hns_mdio_match,
> -		   .acpi_match_table = ACPI_PTR(hns_mdio_acpi_match),
> +		   .acpi_match_table = hns_mdio_acpi_match,
>  		   },
>  };
>  
> diff --git a/drivers/regulator/pbias-regulator.c b/drivers/regulator/pbias-regulator.c
> index cd5a0d7e4455..2eeb99e7b850 100644
> --- a/drivers/regulator/pbias-regulator.c
> +++ b/drivers/regulator/pbias-regulator.c
> @@ -231,7 +231,7 @@ static struct platform_driver pbias_regulator_driver = {
>  	.driver		= {
>  		.name		= "pbias-regulator",
>  		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
> -		.of_match_table = of_match_ptr(pbias_of_match),
> +		.of_match_table = pbias_of_match,
>  	},
>  };
>  
> diff --git a/drivers/regulator/twl-regulator.c b/drivers/regulator/twl-regulator.c
> index 5bacfcebf59a..4ed91e88e1eb 100644
> --- a/drivers/regulator/twl-regulator.c
> +++ b/drivers/regulator/twl-regulator.c
> @@ -656,7 +656,7 @@ static struct platform_driver twlreg_driver = {
>  	.driver  = {
>  		.name  = "twl4030_reg",
>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> -		.of_match_table = of_match_ptr(twl_of_match),
> +		.of_match_table = twl_of_match,
>  	},
>  };
>  
> diff --git a/drivers/regulator/twl6030-regulator.c b/drivers/regulator/twl6030-regulator.c
> index 6eed0f6e0adb..8a84048a66d7 100644
> --- a/drivers/regulator/twl6030-regulator.c
> +++ b/drivers/regulator/twl6030-regulator.c
> @@ -765,7 +765,7 @@ static struct platform_driver twlreg_driver = {
>  	.driver  = {
>  		.name  = "twl6030_reg",
>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> -		.of_match_table = of_match_ptr(twl_of_match),
> +		.of_match_table = twl_of_match,
>  	},
>  };
>  
> diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
> index a72c4ad0cec6..12da7d36e520 100644
> --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> @@ -320,7 +320,7 @@ static struct platform_driver ftm_rtc_driver = {
>  	.driver		= {
>  		.name	= "ftm-alarm",
>  		.of_match_table = ftm_rtc_match,
> -		.acpi_match_table = ACPI_PTR(ftm_imx_acpi_ids),
> +		.acpi_match_table = ftm_imx_acpi_ids,
>  	},
>  };
>  
> diff --git a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
> index 161feae3acab..c6f313c9605b 100644
> --- a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
> +++ b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
> @@ -1788,7 +1788,7 @@ static struct platform_driver hisi_sas_v1_driver = {
>  	.driver = {
>  		.name = DRV_NAME,
>  		.of_match_table = sas_v1_of_match,
> -		.acpi_match_table = ACPI_PTR(sas_v1_acpi_match),
> +		.acpi_match_table = sas_v1_acpi_match,
>  	},
>  };
>  
> diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
> index d89e97e8f5c2..ce3b5e1680f5 100644
> --- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
> +++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
> @@ -3635,7 +3635,7 @@ static struct platform_driver hisi_sas_v2_driver = {
>  	.driver = {
>  		.name = DRV_NAME,
>  		.of_match_table = sas_v2_of_match,
> -		.acpi_match_table = ACPI_PTR(sas_v2_acpi_match),
> +		.acpi_match_table = sas_v2_acpi_match,
>  	},
>  };
>  
> diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
> index 81de98c0245a..30fd6da3e8d8 100644
> --- a/drivers/staging/pi433/pi433_if.c
> +++ b/drivers/staging/pi433/pi433_if.c
> @@ -1367,7 +1367,7 @@ static struct spi_driver pi433_spi_driver = {
>  	.driver = {
>  		.name =		"pi433",
>  		.owner =	THIS_MODULE,
> -		.of_match_table = of_match_ptr(pi433_dt_ids),
> +		.of_match_table = pi433_dt_ids,
>  	},
>  	.probe =	pi433_probe,
>  	.remove =	pi433_remove,
> diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
> index 2fa3fb30dc6c..dd1d1a2cc5f5 100644
> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -2948,7 +2948,7 @@ static const struct of_device_id sbsa_uart_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, sbsa_uart_of_match);
>  
> -static const struct acpi_device_id __maybe_unused sbsa_uart_acpi_match[] = {
> +static const struct acpi_device_id sbsa_uart_acpi_match[] = {
>  	{ "ARMH0011", 0 },
>  	{ "ARMHB000", 0 },
>  	{},
> @@ -2961,8 +2961,8 @@ static struct platform_driver arm_sbsa_uart_platform_driver = {
>  	.driver	= {
>  		.name	= "sbsa-uart",
>  		.pm	= &pl011_dev_pm_ops,
> -		.of_match_table = of_match_ptr(sbsa_uart_of_match),
> -		.acpi_match_table = ACPI_PTR(sbsa_uart_acpi_match),
> +		.of_match_table = sbsa_uart_of_match,
> +		.acpi_match_table = sbsa_uart_acpi_match,
>  		.suppress_bind_attrs = IS_BUILTIN(CONFIG_SERIAL_AMBA_PL011),
>  	},
>  };
> diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
> index 19f0a305cc43..e326d0fb06b2 100644
> --- a/drivers/tty/serial/ma35d1_serial.c
> +++ b/drivers/tty/serial/ma35d1_serial.c
> @@ -798,7 +798,7 @@ static struct platform_driver ma35d1serial_driver = {
>  	.resume     = ma35d1serial_resume,
>  	.driver     = {
>  		.name   = "ma35d1-uart",
> -		.of_match_table = of_match_ptr(ma35d1_serial_of_match),
> +		.of_match_table = ma35d1_serial_of_match,
>  	},
>  };
>  
> -- 
> 2.39.2
> 

