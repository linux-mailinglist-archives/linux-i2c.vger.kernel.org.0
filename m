Return-Path: <linux-i2c+bounces-11131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6944FAC208B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 12:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BD531C05ADC
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 10:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F432288F4;
	Fri, 23 May 2025 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="As1vWrRI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A01211472;
	Fri, 23 May 2025 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994572; cv=none; b=aY8R70Trpi7LAm3nh21grhjAJhsQpg4METh0apY7q2fRccBHrXEInYwblAQ1+L8Xkm6U8C+uqMuetM9vzJqkjEqG3oW4DTGsaETklZQYa01VJfiZlcMP+/+pN/5Ra7KMBFRi4hH+gseyYnHE4Yx1ere4QCE3jr7uMZBmCq70ZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994572; c=relaxed/simple;
	bh=l7/qBjHyyZVZ46o9/KEVCDyk7Jc/zJFN3MD7KOx138w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujejWNfkfFKm8yRxOjvwV4E8HtdH8r5K7qc8U6orxt3kgRVJKbFcYyUjwC6r5mhZj3ccOaiuIqIeuOoYQ1MAZQaXVqZT10e+szorTnuCNRa7xP1Wpp0n2obU/TCAtBPZMfv5z7MZyGAZboPrJwSpuRJfDgroqj8vTPs+REX4Sak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=As1vWrRI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2322bace4ceso52126055ad.2;
        Fri, 23 May 2025 03:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747994569; x=1748599369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yFAtA3gWg+bq9tOXW+LoNEdx5p5IGPy5q2uOoxUx1Og=;
        b=As1vWrRI9njuP9pMbOuuAVek6Ey3bAYfRC5k5Rl5YJ7QNeJCPRrO8lXYl6avS85QXN
         NIigsiMS677uH9uszrlkCsQF6N01cp2t8yMfFJtdq1KVMWYIZid7FLtvQa0TdzyJVi/K
         cTY0+gra6BqVqBBeFw7nw3b2kglX0mHYN4suNQTIa9YpHjblkovymufskwGewe9yRs4H
         itYKq9rZkZkv0F4RNxEBsZa0EwuwxDgS2N9wc4EVm0EAOOHsekO7FmV95OzbDrtxnryA
         ISd9/Jk/BtgX6TU9XnOjTzYQ/MEhP8KpXx4bim9rIP7Fmak61v+rqjzV/m3KvmP3i6HP
         IntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994569; x=1748599369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFAtA3gWg+bq9tOXW+LoNEdx5p5IGPy5q2uOoxUx1Og=;
        b=gjfC2WjWf634xSS3MYUtglNcryVodd7x20Z3yJiLqX9DS2b5q8zgrspm4fo2SQuEp8
         gco+hkqlqYQoGmM+dGVLpI6ulgbsXK/7v6JFSlOWLIqtVIhxjpuvSNB3go1pORk/823Y
         raT1fuLc0GPrzUCxwOmGP8inqsTpnGbp4b2dLRuIlbiF46de7o2DmNXa6a6Yg57S3Eol
         XvvSJVCmR/6zs6mEqEAtjmHQpstvRzvgHW6IYlznaMMtI3W7mRzyr5O99oeiyMDR25sN
         W2dI7BLDaZK/ZKTGChgI8rKYd6bjCwll9+OKQmO1Y7Zb5shBI1woXv0DkA3Wb+Lf+7No
         +V9A==
X-Forwarded-Encrypted: i=1; AJvYcCULSxh2Ua4+AgwWY18PVt5qFqoGlHCjslEDiypYR3v9qVMGw5HplvNmEejsZXrGxeHgwm8JsL8SN3/v@vger.kernel.org, AJvYcCVI53FL3wRuaGS66P0KNNYxKZWRIxy/cE/a/4PlMRDBfuJwj9doMiKEzBwwd6k2vepEi6hxiLRRqy/2vg==@vger.kernel.org, AJvYcCWzqWiCT8dAcNB/iToBObdlCvHoyyYgPFXobp35sD6cBBH2iqV8Ceci9/weSuzvVGjiGkyxwHVswx9ffe9XFk0=@vger.kernel.org, AJvYcCX1i3V+PMZKv4P8KokDs5YFTPHn4qW/uJhOQCA2rLQ0PEo4pZb0qo5GfJn5N7DLGWXEWdgAE1lT@vger.kernel.org, AJvYcCXPAJzUC2a3efdyDjdW8DaAhot3+X3NEHBh4tgm3D+ESoU0hy9QeYgLaIfgUmYcsuArqgq0EQnW/aJz@vger.kernel.org, AJvYcCXXtEehpNhXx26nyW0y11a2IR//UohvT622XNAorvcofrgvEigRwquMO0cYk6waOzN/GzPM818rXjP0@vger.kernel.org, AJvYcCXkP0AwP8KqNU57kO0rwqisR5llzbSBTuCSWALxbEwZddJjgLr0uKer8jxs/YkaiLgTzvyqS12AkrM=@vger.kernel.org, AJvYcCXwh3vYsnRBMTjo3+fzKljVi96UBDuYJ4MuhmNWDytdc+ckZyb4tKXAz6UJ/M6bfeSO8oapE4TPAR0SZxo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Wg2fNjfJ6Do+aG1bCQwEutlzpnEuNY8Zm6oPFWKVq6gKCBLp
	Gkbc45mgjQwCzz2ZAvlUyIAAj2HBrTXRCMiwKkO5FkE/I9PcGJajGGQu
X-Gm-Gg: ASbGncuI55Aa4HFNt2uTgcnfEIelObVWmC/XvHKxrHMlkN0R3Wz3eIu7Uqh5ssXNVJ0
	AGmbj42Mrr9Oha1WzvtV6Bi6E1apwyZe25NIOu7QSfJX7jcpxjrSOhW9UiBYdnC688PWw8GUaBt
	tT2PCnKvMqnf4Ev1bTRPARLI67DRKINjXAVeVWBkOJxMHBxWWHvg+mHeDG34SYt/p09P5wFs4BY
	JSYBe/Z4K2w/eOUhiFqLLPgWuvcsfyZ01A/SUj2RTTejPOtVc2816E8heW/0306nwicGztL/0t5
	TJyAaCyXzvM8hjaVsCIUMGAGg6xqyZwyD97ZLnb9BCJ1+A5P2i259RJArswogtlsrfq6rNQYss/
	GSvYg8+HB2FUGaYv1IxZBL+Cu
X-Google-Smtp-Source: AGHT+IE14zXd9llMOAho4CAMPBzZZBNsDitYo9BwNsG9Jxnu4lSd4B1G0ufb/W5h4eU6HPBVQl7d8g==
X-Received: by 2002:a17:903:19c4:b0:231:d0a8:5179 with SMTP id d9443c01a7336-231d43bdb7dmr444525955ad.23.1747994569478;
        Fri, 23 May 2025 03:02:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233f8cbeb8asm5602645ad.161.2025.05.23.03.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:02:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4cc7d25b-35de-4303-94cf-7a8e33bdd246@roeck-us.net>
Date: Fri, 23 May 2025 03:02:46 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/7] watchdog: Add Nuvoton NCT6694 WDT support
To: a0282524688@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
 mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, jdelvare@suse.com, alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
References: <20250520020355.3885597-1-tmyu0@nuvoton.com>
 <20250520020355.3885597-6-tmyu0@nuvoton.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250520020355.3885597-6-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 19:03, a0282524688@gmail.com wrote:
> From: Ming Yu <tmyu0@nuvoton.com>
> 
> This driver supports Watchdog timer functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
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
>   MAINTAINERS                    |   1 +
>   drivers/watchdog/Kconfig       |  11 ++
>   drivers/watchdog/Makefile      |   1 +
>   drivers/watchdog/nct6694_wdt.c | 320 +++++++++++++++++++++++++++++++++
>   4 files changed, 333 insertions(+)
>   create mode 100644 drivers/watchdog/nct6694_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 57b95c21a626..681e0cfb4a4b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17458,6 +17458,7 @@ F:	drivers/gpio/gpio-nct6694.c
>   F:	drivers/i2c/busses/i2c-nct6694.c
>   F:	drivers/mfd/nct6694.c
>   F:	drivers/net/can/usb/nct6694_canfd.c
> +F:	drivers/watchdog/nct6694_wdt.c
>   F:	include/linux/mfd/nct6694.h
>   
>   NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0d8d37f712e8..6d84a509501e 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -760,6 +760,17 @@ config MAX77620_WATCHDOG
>   	  MAX77620 chips. To compile this driver as a module,
>   	  choose M here: the module will be called max77620_wdt.
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
>   config IMX2_WDT
>   	tristate "IMX2+ Watchdog"
>   	depends on ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index c9482904bf87..7fe51bb06060 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -233,6 +233,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
>   obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
>   obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
>   obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
> +obj-$(CONFIG_NCT6694_WATCHDOG) += nct6694_wdt.o
>   obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
>   obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
>   obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
> diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
> new file mode 100644
> index 000000000000..195bcbc0f156
> --- /dev/null
> +++ b/drivers/watchdog/nct6694_wdt.c
> @@ -0,0 +1,320 @@
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

How is this supposed to work if there are multiple NCT6694 in the system ?

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
> +	struct mutex lock;
> +	union nct6694_wdt_msg *msg;
> +	unsigned char wdev_idx;
> +};
> +
> +static DEFINE_IDA(nct6694_wdt_ida);
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
> +	guard(mutex)(&data->lock);
> +

Watchdog drivers are already mutex protected in the watchdog core.

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
> +	guard(mutex)(&data->lock);
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
> +	guard(mutex)(&data->lock);
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
> +	guard(mutex)(&data->lock);
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
> +static void nct6694_wdt_ida_remove(void *d)
> +{
> +	struct nct6694_wdt_data *data = d;
> +
> +	ida_free(&nct6694_wdt_ida, data->wdev_idx);
> +}
> +
> +static int nct6694_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +	struct nct6694_wdt_data *data;
> +	struct watchdog_device *wdev;
> +	int ret, wdev_idx;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->msg = devm_kzalloc(dev, sizeof(union nct6694_wdt_msg),
> +				 GFP_KERNEL);
> +	if (!data->msg)
> +		return -ENOMEM;
> +
> +	wdev_idx = ida_alloc(&nct6694_wdt_ida, GFP_KERNEL);
> +	if (wdev_idx < 0)
> +		return wdev_idx;
> +

Sorry, I fail to understand why this is needed or even makes sense.
That ID is global, so if there is more than one chip they all get more or
less random IDs assigned. Why would that be valuable or necessary ?
If it is just necessary to give the watchdog different IDs, and the
values don't matter, why not just use pdev->id ?
I guess that won't work either because it is used as array index below.
You'll have to find a different means to identify which of the two watchdogs
is handled by this instance of the driver.

This warrants a detailed explanation why there need to be globally unique IDs
across multiple chips.

> +	ret = devm_add_action_or_reset(dev, nct6694_wdt_ida_remove, data);
> +	if (ret)
> +		return ret;
> +
> +	data->dev = dev;
> +	data->nct6694 = nct6694;
> +	data->wdev_idx = wdev_idx;
> +
> +	wdev = &data->wdev;
> +	wdev->info = &nct6694_wdt_info;
> +	wdev->ops = &nct6694_wdt_ops;
> +	wdev->timeout = timeout[wdev_idx];
> +	wdev->pretimeout = pretimeout[wdev_idx];
> +	if (timeout[wdev_idx] < pretimeout[wdev_idx]) {

Maybe I am missing it, but I don't see where wdev_idx is bound to [0,1].
It is global. There could be a dozen of those chips connected through
USB.

> +		dev_warn(data->dev, "pretimeout < timeout. Setting to zero\n");
> +		wdev->pretimeout = 0;
> +	}
> +
> +	wdev->min_timeout = 1;
> +	wdev->max_timeout = 255;
> +
> +	ret = devm_mutex_init(dev, &data->lock);
> +	if (ret)
> +		return ret;
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


