Return-Path: <linux-i2c+bounces-11794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F4AF64F4
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 00:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F11E1C458B7
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 22:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8A1246BD7;
	Wed,  2 Jul 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2h2uJ9p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214872DE718;
	Wed,  2 Jul 2025 22:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751494569; cv=none; b=SbInJvID34Tss37xEN/TstXcMZE2AKW7l6EKVNjFhtocFryYmu+my5g6clRFKCRnL/DkxzcW6aH4N0riml3QQvbATIr4QKSBX9SZ6RC0+CIJbv71P6Vs3qZ6TTGnYTym/UZqR2qNu8EK+pddKO/QKpC3a5t4dG/wD1H48MDgz+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751494569; c=relaxed/simple;
	bh=5lizU1qMKUV6S+gaqmTFXzfHzt4Ze8nyfGVhP06tJo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IT8gegTZwY0QGn3bSCgXo55riR8DFvrScxBmOfbtVv1RFjj0SuN5MsjnNy/BRaeXEG2T+L4uyJo24ziPIn2jdVvkQJkA8Pwsq5AFFiL255s6v8fY0ABUyTCHeVOw+p0toymxuDw5TykKjIMxK5rTuc/ubsO2ge/BwhmmTcbfA5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2h2uJ9p; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23602481460so76306085ad.0;
        Wed, 02 Jul 2025 15:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751494566; x=1752099366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukcKYtTICZOFWx70YWfw/Y20DGGfiPP24nM2GfmRoZo=;
        b=N2h2uJ9p7QIsHqfU1lus+aVqIfIJnMlOt8bjeaS6YYtc3KNby+15qWkOrT8yjwvsZX
         ef7YY+Y2esadcJG9kI29ss4UzJ7L7tSY/s0NJ9IAafaGr3HdVOfTAZfQtQ3EEzFNGpRI
         C7W7Dgn9jiewx2ggmrjZRgb6Lno4nDpvyqQegy3/nF97b5fcxRXTjLT83wRPIQjW8ev4
         EY/0exO0+T/PSklirqn2MaDcJSOjAf8l3jom8x7vpSWLCHA1o7e7l3jqDdH3hfGFmC5J
         3x9HHNLLxc2GhXELHGf2cDAPhciE/RWBsxDoGXrlaUFYi9KV7RijJBOmiYU4zRNxiCPL
         1HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751494566; x=1752099366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukcKYtTICZOFWx70YWfw/Y20DGGfiPP24nM2GfmRoZo=;
        b=mnB7ne/Bvv7odWARpbtnxz8sdxfQCeHmx2cPnBpl3NZcCUUtVHpjDAn8XRjQg1KjI0
         z/UGTPv1I+8rPghfvBXmErazoaYzXciORCUL/jaFDh1YOSrBNw5n9yyElMIJt2+oXBnt
         Nna8CxXdMK+qGocmTQd3vb1VjdSTu5SDi/HYkiiv1ljJjI3hfxr+uMx7jwKQRDCqzSHc
         BZISKmFXcsgSrnXPaqYKGGPRsX8/pcd6erz5fWfqIT5X9mo/zgwdvOw8rgNeI6ZelgUM
         Fx+asS3we+FZhPtwsfvPSC/9EM3q/vpPLrCoMwr0zsNr3GmsBnkrInPAEYP2HNM71jIF
         WBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3dMNJ/FRZ9sag8mQBQOVtxWDO0iV084OVb47MgX49NTdlgm2JMdaGcKcpIhwdMAwn84sNqAAUfJ60@vger.kernel.org, AJvYcCUCehqxlWvd4sFLeOWFpbvAjpN3/WA+d/U9vIUHGbTlo0eWbGlw30qhj4Rv69RxWpXDwJchijysq00=@vger.kernel.org, AJvYcCUCwMGD1AO+8UrLcUfjoj+4drLf8zNSnEYBbVJL1Q+OFegmWQqm633O/UM8si2TnAyFwAc6Un4EP/E2@vger.kernel.org, AJvYcCUzTMmY0Hc7XL7A2QgvE1QvuBgZkMHQXbhtIDhselpkIeV6KTnFQRiTNB6OK1znPt+B2KtAxAGsx9lzPTvyu3s=@vger.kernel.org, AJvYcCVMDQaZaJjossS3dCA095U44G18l9z9A8Hjy2vsyBHctNI5hs46AeONGKIlXbjEICKMcx22Hm3cLrDazQ==@vger.kernel.org, AJvYcCVTNSgtgzjWJtN7GKE1uw3jEP4qDi/rk6ydn0vfSjnZHu7aVtJuV93cIH6hlGtMEZDTpQ447ssJJL1tUM4=@vger.kernel.org, AJvYcCVaNwEcsM5RwmkNyFoEsA4ueejODl3k2WqvoH0EmaiQbwR/UgNOMAUjBr4XV8pErmvFgJ+KhuGQ+dgT@vger.kernel.org, AJvYcCXXbG6Y4Pf98e4WmeLn9rgNYirHyqRyFJqghD9B32a9PisNMMBfz8Qu8kMr9TaG9JdU+NrgOF/vJAnq1tWF@vger.kernel.org, AJvYcCXdvD6yaoH5LmtBGifFaFGW5OQ2Gj76t+FIHLfv02zT4jcxFX73riFkNAbn7PH6oJQkGoKq5bhN@vger.kernel.org
X-Gm-Message-State: AOJu0YwBbMrTB35b5F9bLTiChgd40hkcbrF7hlX+LxRXyYOh8U4/ZlZE
	wXCjyqCh5ZtaLRFmB888eQRDwUz4ctmC1aNhhyfrvVbvBM30JwyXTfmrnUZKwA==
X-Gm-Gg: ASbGnctAKAdHYTuOSzAVUti5kavXJwaCsHphVcBnM+7Ia5S27hiraF5uQSxDVwbEC8R
	3RDLbckCvgkgnmB/PbyEeE1w7TF5JBkPVIPBhm7vJejOgeokxjuQMvN/iYg3HLk9dOiLj7KI8sx
	uCeii8qeUGD8uaFyc3C6gMbzi1aszCXaIHZQgYinQiZm/sQCPIBA35Xas0BrXljcU1YHLY4f6pH
	JwzmjL5b7+q68Jf48sdBWDuxA+K+Ofam4H0lqm5QvDMUc2uwTXxhyHZQBDBoje00fn37q4ttic4
	Afk+n3XwECq5Y85q7zM7/C4qhAhe6yhFweuwDLmR8AteUAXhA3kwoLX1L8PHoVT6KmxbI7/Rd3e
	WIktr27MyNA==
X-Google-Smtp-Source: AGHT+IGQQtBYcyEpvl/DseiXOIUHuIfjHcKG+v891eBtTvMsoPWqjyLqnGXI8Byjt9M+YLgs+AiC9g==
X-Received: by 2002:a17:903:2343:b0:234:914b:3841 with SMTP id d9443c01a7336-23c7a28cb75mr6322875ad.39.1751494566291;
        Wed, 02 Jul 2025 15:16:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ad405sm135345575ad.150.2025.07.02.15.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:16:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Jul 2025 15:16:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: a0282524688@gmail.com
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com,
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v13 5/7] watchdog: Add Nuvoton NCT6694 WDT support
Message-ID: <3242fc11-4b9c-4883-ae52-4db3d9e25709@roeck-us.net>
References: <20250627102730.71222-1-a0282524688@gmail.com>
 <20250627102730.71222-6-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627102730.71222-6-a0282524688@gmail.com>

On Fri, Jun 27, 2025 at 06:27:28PM +0800, a0282524688@gmail.com wrote:
> From: Ming Yu <a0282524688@gmail.com>
> 
> This driver supports Watchdog timer functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes since version 12:
> - Implement IDA in MFD driver to handle per-device IDs
> - Use same email address in the signaturei
> 
> Changes since version 11:
> - Use platform_device's id to replace IDA
> 
> Changes since version 10:
> - Implement IDA to allocate id
> - Add module parameters to configure WDT's timeout and pretimeout value
> 
> Changes since version 9:
> 
> Changes since version 8:
> - Modify the signed-off-by with my work address
> 
> Changes since version 7:
> - Add error handling for devm_mutex_init()
> 
> Changes since version 6:
> - Fix warning
> 
> Changes since version 5:
> - Modify the module name and the driver name consistently
> 
> Changes since version 4:
> - Modify arguments in read/write function to a pointer to cmd_header
> - Modify all callers that call the read/write function
> 
> Changes since version 3:
> - Modify array buffer to structure
> - Fix defines and comments
> - Modify mutex_init() to devm_mutex_init()
> - Drop watchdog_init_timeout()
> 
> Changes since version 2:
> - Add MODULE_ALIAS()
> - Modify the pretimeout validation procedure
> 
> Changes since version 1:
> - Add each driver's command structure
> - Fix platform driver registration
> - Fix warnings
> - Drop unnecessary logs
> - Modify start() function to setup device
> 
>  MAINTAINERS                    |   1 +
>  drivers/watchdog/Kconfig       |  11 ++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/nct6694_wdt.c | 307 +++++++++++++++++++++++++++++++++
>  4 files changed, 320 insertions(+)
>  create mode 100644 drivers/watchdog/nct6694_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ce276999625e..7c3edac315b4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17796,6 +17796,7 @@ F:	drivers/gpio/gpio-nct6694.c
>  F:	drivers/i2c/busses/i2c-nct6694.c
>  F:	drivers/mfd/nct6694.c
>  F:	drivers/net/can/usb/nct6694_canfd.c
> +F:	drivers/watchdog/nct6694_wdt.c
>  F:	include/linux/mfd/nct6694.h
>  
>  NUVOTON NCT7201 IIO DRIVER
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0c25b2ed44eb..05008d937e40 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -760,6 +760,17 @@ config MAX77620_WATCHDOG
>  	  MAX77620 chips. To compile this driver as a module,
>  	  choose M here: the module will be called max77620_wdt.
>  
> +config NCT6694_WATCHDOG
> +	tristate "Nuvoton NCT6694 watchdog support"
> +	depends on MFD_NCT6694
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to support Nuvoton NCT6694 watchdog timer
> +	  functionality.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nct6694_wdt.
> +
>  config IMX2_WDT
>  	tristate "IMX2+ Watchdog"
>  	depends on ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index bbd4d62d2cc3..b680e4d3c1bc 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -235,6 +235,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
>  obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
>  obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
>  obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
> +obj-$(CONFIG_NCT6694_WATCHDOG) += nct6694_wdt.o
>  obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
>  obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
>  obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
> diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
> new file mode 100644
> index 000000000000..bc3689bd4b6b
> --- /dev/null
> +++ b/drivers/watchdog/nct6694_wdt.c
> @@ -0,0 +1,307 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 WDT driver based on USB interface.
> + *
> + * Copyright (C) 2025 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/watchdog.h>
> +
> +#define DEVICE_NAME "nct6694-wdt"
> +
> +#define NCT6694_DEFAULT_TIMEOUT		10
> +#define NCT6694_DEFAULT_PRETIMEOUT	0
> +
> +#define NCT6694_WDT_MAX_DEVS		2
> +
> +/*
> + * USB command module type for NCT6694 WDT controller.
> + * This defines the module type used for communication with the NCT6694
> + * WDT controller over the USB interface.
> + */
> +#define NCT6694_WDT_MOD			0x07
> +
> +/* Command 00h - WDT Setup */
> +#define NCT6694_WDT_SETUP		0x00
> +#define NCT6694_WDT_SETUP_SEL(idx)	(idx ? 0x01 : 0x00)
> +
> +/* Command 01h - WDT Command */
> +#define NCT6694_WDT_COMMAND		0x01
> +#define NCT6694_WDT_COMMAND_SEL(idx)	(idx ? 0x01 : 0x00)
> +
> +static unsigned int timeout[NCT6694_WDT_MAX_DEVS] = {
> +	[0 ... (NCT6694_WDT_MAX_DEVS - 1)] = NCT6694_DEFAULT_TIMEOUT
> +};
> +module_param_array(timeout, int, NULL, 0644);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +static unsigned int pretimeout[NCT6694_WDT_MAX_DEVS] = {
> +	[0 ... (NCT6694_WDT_MAX_DEVS - 1)] = NCT6694_DEFAULT_PRETIMEOUT
> +};
> +module_param_array(pretimeout, int, NULL, 0644);
> +MODULE_PARM_DESC(pretimeout, "Watchdog pre-timeout in seconds");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +			   __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +enum {
> +	NCT6694_ACTION_NONE = 0,
> +	NCT6694_ACTION_SIRQ,
> +	NCT6694_ACTION_GPO,
> +};
> +
> +struct __packed nct6694_wdt_setup {
> +	__le32 pretimeout;
> +	__le32 timeout;
> +	u8 owner;
> +	u8 scratch;
> +	u8 control;
> +	u8 status;
> +	__le32 countdown;
> +};
> +
> +struct __packed nct6694_wdt_cmd {
> +	__le32 wdt_cmd;
> +	__le32 reserved;
> +};
> +
> +union __packed nct6694_wdt_msg {
> +	struct nct6694_wdt_setup setup;
> +	struct nct6694_wdt_cmd cmd;
> +};
> +
> +struct nct6694_wdt_data {
> +	struct watchdog_device wdev;
> +	struct device *dev;
> +	struct nct6694 *nct6694;
> +	union nct6694_wdt_msg *msg;
> +	unsigned char wdev_idx;
> +};
> +
> +static int nct6694_wdt_setting(struct watchdog_device *wdev,
> +			       u32 timeout_val, u8 timeout_act,
> +			       u32 pretimeout_val, u8 pretimeout_act)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694_wdt_setup *setup = &data->msg->setup;
> +	const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_WDT_MOD,
> +		.cmd = NCT6694_WDT_SETUP,
> +		.sel = NCT6694_WDT_SETUP_SEL(data->wdev_idx),
> +		.len = cpu_to_le16(sizeof(*setup))
> +	};
> +	unsigned int timeout_fmt, pretimeout_fmt;
> +
> +	if (pretimeout_val == 0)
> +		pretimeout_act = NCT6694_ACTION_NONE;
> +
> +	timeout_fmt = (timeout_val * 1000) | (timeout_act << 24);
> +	pretimeout_fmt = (pretimeout_val * 1000) | (pretimeout_act << 24);
> +
> +	memset(setup, 0, sizeof(*setup));
> +	setup->timeout = cpu_to_le32(timeout_fmt);
> +	setup->pretimeout = cpu_to_le32(pretimeout_fmt);
> +
> +	return nct6694_write_msg(data->nct6694, &cmd_hd, setup);
> +}
> +
> +static int nct6694_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	int ret;
> +
> +	ret = nct6694_wdt_setting(wdev, wdev->timeout, NCT6694_ACTION_GPO,
> +				  wdev->pretimeout, NCT6694_ACTION_GPO);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(data->dev, "Setting WDT(%d): timeout = %d, pretimeout = %d\n",
> +		data->wdev_idx, wdev->timeout, wdev->pretimeout);
> +
> +	return ret;
> +}
> +
> +static int nct6694_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694_wdt_cmd *cmd = &data->msg->cmd;
> +	const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_WDT_MOD,
> +		.cmd = NCT6694_WDT_COMMAND,
> +		.sel = NCT6694_WDT_COMMAND_SEL(data->wdev_idx),
> +		.len = cpu_to_le16(sizeof(*cmd))
> +	};
> +
> +	memcpy(&cmd->wdt_cmd, "WDTC", 4);
> +	cmd->reserved = 0;
> +
> +	return nct6694_write_msg(data->nct6694, &cmd_hd, cmd);
> +}
> +
> +static int nct6694_wdt_ping(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694_wdt_cmd *cmd = &data->msg->cmd;
> +	const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_WDT_MOD,
> +		.cmd = NCT6694_WDT_COMMAND,
> +		.sel = NCT6694_WDT_COMMAND_SEL(data->wdev_idx),
> +		.len = cpu_to_le16(sizeof(*cmd))
> +	};
> +
> +	memcpy(&cmd->wdt_cmd, "WDTS", 4);
> +	cmd->reserved = 0;
> +
> +	return nct6694_write_msg(data->nct6694, &cmd_hd, cmd);
> +}
> +
> +static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
> +				   unsigned int new_timeout)
> +{
> +	int ret;
> +
> +	ret = nct6694_wdt_setting(wdev, new_timeout, NCT6694_ACTION_GPO,
> +				  wdev->pretimeout, NCT6694_ACTION_GPO);
> +	if (ret)
> +		return ret;
> +
> +	wdev->timeout = new_timeout;
> +
> +	return 0;
> +}
> +
> +static int nct6694_wdt_set_pretimeout(struct watchdog_device *wdev,
> +				      unsigned int new_pretimeout)
> +{
> +	int ret;
> +
> +	ret = nct6694_wdt_setting(wdev, wdev->timeout, NCT6694_ACTION_GPO,
> +				  new_pretimeout, NCT6694_ACTION_GPO);
> +	if (ret)
> +		return ret;
> +
> +	wdev->pretimeout = new_pretimeout;
> +
> +	return 0;
> +}
> +
> +static unsigned int nct6694_wdt_get_time(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694_wdt_setup *setup = &data->msg->setup;
> +	const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_WDT_MOD,
> +		.cmd = NCT6694_WDT_SETUP,
> +		.sel = NCT6694_WDT_SETUP_SEL(data->wdev_idx),
> +		.len = cpu_to_le16(sizeof(*setup))
> +	};
> +	unsigned int timeleft_ms;
> +	int ret;
> +
> +	ret = nct6694_read_msg(data->nct6694, &cmd_hd, setup);
> +	if (ret)
> +		return 0;
> +
> +	timeleft_ms = le32_to_cpu(setup->countdown);
> +
> +	return timeleft_ms / 1000;
> +}
> +
> +static const struct watchdog_info nct6694_wdt_info = {
> +	.options = WDIOF_SETTIMEOUT	|
> +		   WDIOF_KEEPALIVEPING	|
> +		   WDIOF_MAGICCLOSE	|
> +		   WDIOF_PRETIMEOUT,
> +	.identity = DEVICE_NAME,
> +};
> +
> +static const struct watchdog_ops nct6694_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = nct6694_wdt_start,
> +	.stop = nct6694_wdt_stop,
> +	.set_timeout = nct6694_wdt_set_timeout,
> +	.set_pretimeout = nct6694_wdt_set_pretimeout,
> +	.get_timeleft = nct6694_wdt_get_time,
> +	.ping = nct6694_wdt_ping,
> +};
> +
> +static void nct6694_wdt_ida_free(void *d)
> +{
> +	struct nct6694_wdt_data *data = d;
> +	struct nct6694 *nct6694 = data->nct6694;
> +
> +	ida_free(&nct6694->wdt_ida, data->wdev_idx);
> +}
> +
> +static int nct6694_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nct6694 *nct6694 = dev_get_drvdata(dev->parent);
> +	struct nct6694_wdt_data *data;
> +	struct watchdog_device *wdev;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->msg = devm_kzalloc(dev, sizeof(union nct6694_wdt_msg),
> +				 GFP_KERNEL);
> +	if (!data->msg)
> +		return -ENOMEM;
> +
> +	data->dev = dev;
> +	data->nct6694 = nct6694;
> +
> +	ret = ida_alloc(&nct6694->wdt_ida, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
> +	data->wdev_idx = ret;
> +
> +	ret = devm_add_action_or_reset(dev, nct6694_wdt_ida_free, data);
> +	if (ret)
> +		return ret;
> +
> +	wdev = &data->wdev;
> +	wdev->info = &nct6694_wdt_info;
> +	wdev->ops = &nct6694_wdt_ops;
> +	wdev->timeout = timeout[data->wdev_idx];
> +	wdev->pretimeout = pretimeout[data->wdev_idx];
> +	if (timeout[data->wdev_idx] < pretimeout[data->wdev_idx]) {
> +		dev_warn(data->dev, "pretimeout < timeout. Setting to zero\n");
> +		wdev->pretimeout = 0;
> +	}
> +
> +	wdev->min_timeout = 1;
> +	wdev->max_timeout = 255;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	watchdog_set_drvdata(&data->wdev, data);
> +	watchdog_set_nowayout(&data->wdev, nowayout);
> +	watchdog_stop_on_reboot(&data->wdev);
> +
> +	return devm_watchdog_register_device(dev, &data->wdev);
> +}
> +
> +static struct platform_driver nct6694_wdt_driver = {
> +	.driver = {
> +		.name	= DEVICE_NAME,
> +	},
> +	.probe		= nct6694_wdt_probe,
> +};
> +
> +module_platform_driver(nct6694_wdt_driver);
> +
> +MODULE_DESCRIPTION("USB-WDT driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:nct6694-wdt");
> -- 
> 2.34.1
> 

