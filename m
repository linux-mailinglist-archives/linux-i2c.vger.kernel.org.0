Return-Path: <linux-i2c+bounces-14525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05114CB97F2
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 18:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E549E3009089
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 17:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED862F6189;
	Fri, 12 Dec 2025 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="P3ry7IaG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B02F6169
	for <linux-i2c@vger.kernel.org>; Fri, 12 Dec 2025 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765562373; cv=none; b=ItBowRIpi0jDe/8/pXki4Z6resS7pSY1QNTD76iruepBzbhj2VqE1LCYVOIweFVpMB+t7Jv7u+HLoJaXm9uo/KTzBH1f5SFJzs4oPOInROQ/mDiYposA3Ey0UbUFuh1ivrfCy2Ev5rDcYG7bNo5PsdVI3mUHTMCBy5zPj7s/o3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765562373; c=relaxed/simple;
	bh=4a7cJuMfsfKcF9dxtHK4Eok9DERSBWK7tN2nlBsxlyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYGRgTNv8zPIsDsPdD2i0GDQo2VLKMelVLfHG93TbrHjWUmFIAaihjpIIbqMoaqe/2e5q20OHHdBPmDIm/6hZcv1f3Nb7o6ox3w+1Xg++AkmzZWusVpHoVRiuwppEHZ2D192u81xLaSzOtoPZxBF55PpsZK4hNq72iAOUs0szsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=P3ry7IaG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so714157f8f.1
        for <linux-i2c@vger.kernel.org>; Fri, 12 Dec 2025 09:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765562369; x=1766167169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubelhp76EoglMTwgFjlgjRSHe1znCMF5dPcLNfQfdkg=;
        b=P3ry7IaGpvBSDDITWO3/OR57bL54WLo6xEU5oRW9pVm6EQ1D3fp60RoOawgaPDHNA/
         2rtn4+lqaMF+4bAyKVJxAh/g+GycEIaiqs1t5S89xKWu0H2MGTYoDpEja1YxvGic1sk4
         i5vMIx3hpysZdM+3M3Wz1OBNXUV2FXnZRJLYKYa6+gpol6KqUOuM2AEqS8X6GxiFXsHe
         SgRApLW6qjApeJ4GzhSpd1jHu9Gen1Pd/PNJX32vYsFvemOUuPKtok+EKrfI/khtokR/
         u2Wz72X9pToPC0iE7X7dlsVr7gSB5OeWfnskDG++M4QXehBS/lGe51/sDHEBkfJtzfrV
         cpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765562369; x=1766167169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubelhp76EoglMTwgFjlgjRSHe1znCMF5dPcLNfQfdkg=;
        b=TDMc4tnASxZyLE2lmpL3xi1Mn7+5SAzXqy16L4uQ3XcPd8Z/XG2oQbNRLS1/JhJHPH
         2h73q0awfXLjscFqlb4VupBZZwLIxVZPUWIc4mH22vCFy/YjvEDJmv07q8sCEQvm8i25
         qG+96sjYlJXMxbnYHFtx5/knwQaKfiMs0LkiJlDh3DhrGU9guLaSIgFoPKYpVS4T1RRc
         QmLBKg/e6A6BpN9Mql9mdAh/EHZ7SZ46sbtjiQDoFBBSdOcOHYqL5H17Bnk+cjgsQ3n3
         KKPHNsyRBcqGp8aQSuLKZF+kbZDztdyPsrzKUhyitJOww1j6f9PocGDRwfBjJNmtqcCm
         G2CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH3NwjogairKfYJp7KM7duXsa2G4ckobh454K9cvHetLaUwtP3QJ+p22+gcVexSDGZ4cIu1CNYT6c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bRCNtU3iDuXz53f4MI9H6OIiMebcUm9R/jb/fEwAtXyFjiN7
	2gxMZ4uq1MMmGH9GhgcqnI+bGXZLncKFhn9DUeKtw38p+Ve4ECooArqVAWManG4KhZY=
X-Gm-Gg: AY/fxX7dfMsWRjVNfwD1NPwPB9a3eXW3xFk2eZstlHX1AMZ2P5jWW30hmF2+D5ljHnt
	aFyaxBBIk/yHPHUupGRW2f/FAV0rHdEmuR0aVzRXkbNqtG0Srv/JKFMzRblCvEtr18klIFATEDd
	sGXEahMl2ss9g/3Eqcv+10RKilWTQLx7e1n6HlBo1d4i32hGoWAdgQAx/EXZqRBcil83Yx8F54q
	hwNh8Lngiyq9YEavInEb9edHDPtLmA1yuv+yKGdtGD9ErqjE1NlbPWsCFK93D4nD/i0WCyr2w9s
	664UCG/DhmP65M8ujCDoeJElTTNF4VPv2Y/6UmRCBIac5WBToKnnXzTX8lDrh8pb4Y8BzU6K64F
	a4089uesQ5J7wTx86mL93T+Ay7O5szi8bW7Vq4wYwBF2XOtWPfzGn07vHQTn40qTIsEaUX2RgY5
	1IiA2vFOpFHzcDMKmdd7MscCRvz+XDSiDOnKf86yX4aBddO3n9wjs6ABuJs4ayIG1KuvRIM91fh
	DzUF058Itl9vT57odrbVSuJ8DJoy/6bLRWLbE7UDiOIWqmHQHjFgqqn/5FTTB3U/x1IF4Yt
X-Google-Smtp-Source: AGHT+IGeTjk6mCqcqXAmzigHg26e/hao9mUU0yoaEX7eguJmL9pnsx3hmz6itwRthZLln0sfewFnoA==
X-Received: by 2002:a05:6000:238a:b0:42b:3dbe:3a43 with SMTP id ffacd0b85a97d-42fb491d917mr3488705f8f.50.1765562368969;
        Fri, 12 Dec 2025 09:59:28 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70379sm14423736f8f.11.2025.12.12.09.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 09:59:28 -0800 (PST)
Date: Fri, 12 Dec 2025 17:59:26 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	Wenkai Chung <wenkai.chung@advantech.com.tw>,
	Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>,
	Hongzhi Wang <hongzhi.wang@advantech.com>,
	Mikhail Tsukerman <mikhail.tsukerman@advantech.com>,
	Thomas Kastner <thomas.kastner@advantech.com>
Subject: Re: [PATCH 5/8] Add Advantech EIO Backlight driver
Message-ID: <aTxX_qUCNqpSSjyB@aspen.lan>
References: <20251212-upstream-v1-v1-0-d50d40ec8d8a@advantech.com>
 <20251212-upstream-v1-v1-5-d50d40ec8d8a@advantech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-upstream-v1-v1-5-d50d40ec8d8a@advantech.com>

On Fri, Dec 12, 2025 at 05:40:56PM +0100, Ramiro Oliveira wrote:
> This driver controls the Video Backlight block of the Advantech EIO chip.
>
> Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>

Thanks for the patch.

Review below...


> ---
>  MAINTAINERS                      |   1 +
>  drivers/video/backlight/Kconfig  |   6 +
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/eio_bl.c | 268 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 276 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index be9d3c4e1ce1..df4b4cc31257 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -623,6 +623,7 @@ F:	drivers/gpio/gpio-eio.c
>  F:	drivers/hwmon/eio-hwmon.c
>  F:	drivers/i2c/busses/i2c-eio.c
>  F:	drivers/mfd/eio_core.c
> +F:	drivers/video/backlight/eio_bl.c
>  F:	include/linux/mfd/eio.h
>
>  ADXL313 THREE-AXIS DIGITAL ACCELEROMETER DRIVER
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index a1422ddd1c22..ddd3d6922553 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -496,6 +496,12 @@ config BACKLIGHT_RAVE_SP
>  	help
>  	  Support for backlight control on RAVE SP device.
>
> +config BACKLIGHT_EIO
> +	tristate "Advantech EIO Backlight"
> +	depends on MFD_EIO && BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Backlight driver for Advantech EIO.
> +
>  config BACKLIGHT_LED
>  	tristate "Generic LED based Backlight Driver"
>  	depends on LEDS_CLASS && OF
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index a5d62b018102..4601b644b6d4 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
>  obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
>  obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
>  obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
> +obj-$(CONFIG_BACKLIGHT_EIO)		+= eio_bl.o
>  obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
>  obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
>  obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
> diff --git a/drivers/video/backlight/eio_bl.c b/drivers/video/backlight/eio_bl.c
> new file mode 100644
> index 000000000000..2b9fd4d48d30
> --- /dev/null
> +++ b/drivers/video/backlight/eio_bl.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Backlight driver for Advantech EIO Embedded controller.
> + *
> + * Copyright (C) 2025 Advantech Corporation. All rights reserved.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/errno.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/eio.h>
> +#include <linux/module.h>
> +#include <linux/uaccess.h>
> +
> +#define PMC_BL_WRITE		0x20
> +#define PMC_BL_READ		0x21
> +
> +#define BL_CTRL_STATUS		0x00
> +#define BL_CTRL_ENABLE		0x12
> +#define BL_CTRL_ENABLE_INVERT	0x13
> +#define BL_CTRL_DUTY		0x14
> +#define BL_CTRL_INVERT		0x15
> +#define BL_CTRL_FREQ		0x16
> +
> +#define BL_MAX			2
> +
> +#define BL_STATUS_AVAIL		0x01
> +#define BL_ENABLE_OFF		0x00
> +#define BL_ENABLE_ON		0x01
> +#define BL_ENABLE_AUTO		BIT(1)
> +
> +#define USE_DEFAULT		-1
> +#define THERMAL_MAX		100
> +
> +#define BL_AVAIL		BIT(0)
> +#define BL_PWM_DC		BIT(1)
> +#define BL_PWM_SRC		BIT(2)
> +#define BL_BRI_INVERT		BIT(3)
> +#define BL_ENABLE_PIN_SUPP	BIT(4)
> +#define BL_POWER_INVERT		BIT(5)
> +#define BL_ENABLE_PIN_EN	BIT(6)
> +#define BL_FIRMWARE_ERROR	BIT(7)

These appear to be unused.

> +
> +static uint bri_freq = USE_DEFAULT;
> +module_param(bri_freq, uint, 0444);
> +MODULE_PARM_DESC(bri_freq, "Setup backlight PWM frequency.\n");
> +
> +static int bri_invert = USE_DEFAULT;
> +module_param(bri_invert, int, 0444);
> +MODULE_PARM_DESC(bri_invert, "Setup backlight PWM polarity.\n");
> +
> +static int bl_power_invert = USE_DEFAULT;
> +module_param(bl_power_invert, int, 0444);
> +MODULE_PARM_DESC(bl_power_invert, "Setup backlight enable pin polarity.\n");
> +
> +static int timeout;
> +module_param(timeout, int, 0444);
> +MODULE_PARM_DESC(timeout, "Set PMC command timeout value.\n");

Module parameters are not really expected these days and are
pretty user hostile.

Are they really needed? AFAICT this is a firmware based device. Why
doesn't the firmware provide this information if the drivers need it
(either directly or via PNP ID and a lookup table)?


> +
> +struct eio_bl_dev {
> +	struct device *mfd;
> +	u8 id;
> +	u8 max;

The value in max is never read.


> +};
> +
> +static int pmc_write(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
> +{
> +	struct pmc_op op = {
> +		.cmd       = PMC_BL_WRITE,
> +		.control   = ctrl,
> +		.device_id = dev_id,
> +		.payload   = (u8 *)data,
> +		.size      = (ctrl == BL_CTRL_FREQ) ? 4 : 1,
> +		.timeout   = timeout,
> +	};
> +
> +	return eio_core_pmc_operation(mfd, &op);
> +}
> +
> +static int pmc_read(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
> +{
> +	struct pmc_op op = {
> +		.cmd       = PMC_BL_READ,
> +		.control   = ctrl,
> +		.device_id = dev_id,
> +		.payload   = (u8 *)data,
> +		.size      = (ctrl == BL_CTRL_FREQ) ? 4 : 1,
> +		.timeout   = timeout,
> +	};
> +
> +	return eio_core_pmc_operation(mfd, &op);
> +}
> +
> +static int bl_update_status(struct backlight_device *bl)
> +{
> +	struct eio_bl_dev *eio_bl = bl_get_data(bl);
> +	u32 max  = bl->props.max_brightness;
> +	u8 duty = clamp_val(bl->props.brightness, 0, max);
> +	u8 sw = bl->props.power == BACKLIGHT_POWER_OFF;

You shouldn't need to read anything from bl->props directly.
Please use the helper functions to get the duty value and power
state.

> +	int ret;
> +
> +	/* Setup PWM duty */
> +	ret = pmc_write(eio_bl->mfd, BL_CTRL_DUTY, eio_bl->id, &duty);
> +	if (ret)
> +		return ret;
> +
> +	/* Setup backlight enable pin */
> +	return pmc_write(eio_bl->mfd, BL_CTRL_ENABLE, eio_bl->id, &sw);
> +}
> +
> +static int bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct eio_bl_dev *eio_bl = bl_get_data(bl);
> +	u8 duty = 0;
> +	int ret;
> +
> +	ret = pmc_read(eio_bl->mfd, BL_CTRL_DUTY, eio_bl->id, &duty);
> +
> +	if (ret)
> +		return ret;
> +
> +	return duty;
> +}
> +
> +static const struct backlight_ops bl_ops = {
> +	.get_brightness = bl_get_brightness,
> +	.update_status	= bl_update_status,
> +	.options	= BL_CORE_SUSPENDRESUME,
> +};
> +
> +static int bl_init(struct device *dev, int id,
> +		   struct backlight_properties *props)
> +{
> +	int ret;
> +	u8 enabled = 0;
> +	u8 status = 0;
> +
> +	/* Check EC-supported backlight */
> +	ret = pmc_read(dev, BL_CTRL_STATUS, id, &status);
> +	if (ret)
> +		return ret;
> +
> +	if (!(status & BL_STATUS_AVAIL)) {
> +		dev_dbg(dev, "eio_bl%d hardware report disabled.\n", id);
> +		return -ENXIO;

Is -ENODEV more appropriate here?


> +	}
> +
> +	ret = pmc_read(dev, BL_CTRL_DUTY, id, &props->brightness);
> +	if (ret)
> +		return ret;
> +
> +	/* Invert PWM */
> +	dev_dbg(dev, "bri_invert=%d\n", bri_invert);

Let's drop the dev_dbg() messages, printing module parameter values
isn't very useful.


> +	if (bri_invert > USE_DEFAULT) {
> +		ret = pmc_write(dev, BL_CTRL_INVERT, id, &bri_invert);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	bri_invert = 0;
> +	ret = pmc_read(dev, BL_CTRL_INVERT, id, &bri_invert);
> +	if (ret)
> +		return ret;

Writing back to module parameters during probe is rather unusual. Is it
really needed?


> +
> +	dev_dbg(dev, "bri_freq=%u\n", bri_freq);
> +	if (bri_freq != USE_DEFAULT) {
> +		ret = pmc_write(dev, BL_CTRL_FREQ, id, &bri_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = pmc_read(dev, BL_CTRL_FREQ, id, &bri_freq);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(dev, "bl_power_invert=%d\n", bl_power_invert);
> +	if (bl_power_invert >= USE_DEFAULT) {
> +		ret = pmc_write(dev, BL_CTRL_ENABLE_INVERT, id, &bl_power_invert);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	bl_power_invert = 0;
> +	ret = pmc_read(dev, BL_CTRL_ENABLE_INVERT, id, &bl_power_invert);
> +	if (ret)
> +		return ret;
> +
> +	/* Read power state */
> +	ret = pmc_read(dev, BL_CTRL_ENABLE, id, &enabled);
> +	if (ret)
> +		return ret;
> +
> +	props->power = enabled ? BACKLIGHT_POWER_OFF : BACKLIGHT_POWER_ON;
> +
> +	return 0;
> +}
> +
> +static int bl_probe(struct platform_device *pdev)
> +{
> +	u8 id;
> +	struct device *dev = &pdev->dev;
> +	struct eio_dev *eio_dev = dev_get_drvdata(dev->parent);
> +
> +	if (!eio_dev) {
> +		dev_err(dev, "eio_core not present\n");
> +		return -ENODEV;
> +	}
> +
> +	for (id = 0; id < BL_MAX; id++) {
> +		char name[32];
> +		struct backlight_properties props;
> +		struct eio_bl_dev *eio_bl;
> +		struct backlight_device *bl;
> +		int ret;
> +
> +		memset(&props, 0, sizeof(props));
> +		props.type           = BACKLIGHT_RAW;
> +		props.max_brightness = THERMAL_MAX;
> +		props.power          = BACKLIGHT_POWER_OFF;
> +		props.brightness     = props.max_brightness;

New drivers should not initialize props.scale as UNKNOWN. Please
set to match the hardware behaviour (if brightness 50% looks roughly
half as bright as 100% then the scale is non-linear).


> +
> +		eio_bl = devm_kzalloc(dev, sizeof(*eio_bl), GFP_KERNEL);
> +		if (!eio_bl)
> +			return -ENOMEM;
> +
> +		eio_bl->mfd = dev->parent;
> +		eio_bl->id  = id;
> +		eio_bl->max = props.max_brightness;
> +
> +		ret = bl_init(eio_bl->mfd, id, &props);
> +		if (ret) {
> +			dev_info(dev, "%d No Backlight %u enabled!\n", ret, id);
> +			continue;
> +		}

If neither backlight is enabled if would be good to propagate the return
value (to prevent the probe from spuriously succeeding).


> +
> +		snprintf(name, sizeof(name), "%s%u", pdev->name, id);
> +
> +		bl = devm_backlight_device_register(dev, name, dev, eio_bl,
> +						    &bl_ops, &props);
> +
> +		if (IS_ERR(bl)) {
> +			ret = PTR_ERR(bl);
> +			if (ret == -EPROBE_DEFER)
> +				return ret;
> +
> +			dev_err(dev, "register %s failed: %d\n", name, ret);
> +			continue;
> +		}
> +
> +		dev_info(dev, "%s registered (max=%u)\n", name, props.max_brightness);

Silence (on success) is golden. Please remove this.


> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver bl_driver = {
> +	.probe  = bl_probe,
> +	.driver = {
> +		.name = "eio_bl",
> +	},
> +};
> +
> +module_platform_driver(bl_driver);
> +
> +MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
> +MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
> +MODULE_DESCRIPTION("Backlight driver for Advantech EIO embedded controller");
> +MODULE_LICENSE("GPL");


Thanks

Daniel.

