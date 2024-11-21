Return-Path: <linux-i2c+bounces-8124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD43E9D4E75
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 15:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 529001F221C5
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 14:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E55D1DBB13;
	Thu, 21 Nov 2024 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abHSMMH2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A41D9A60;
	Thu, 21 Nov 2024 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732198519; cv=none; b=f5k3uIHp5QzXcRkvbTQWexbFtDOmLpY00pcZdcxgvLcprfxGuXvbLNHyOJVWmEsLNSx7eSphC8PKsvwT/bJtPG1S2KsFOlEr14jlhgJz4tYwfDp/965P0IOfLMp/KvysaGgS4HR/pAS7lPaFkB6LAK/UP7+kXoW+l0mYKbygEfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732198519; c=relaxed/simple;
	bh=+lQjCYtam5pa9l7L3iag9AVdGhR11GzF6IKXGkJLQik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=roj+FuRKertIGulG8NvBBjW9dHflKPOB019KYjEvZklVUbU1oUQYgv4v1sDTngnTtdk0Y+4EHJuc6iv00u2fL3AozMXZSgIrZdoSP1d6egUFNZ/iIAC+3CsLp3XAZhcvgtEnjCRJRTzYjZ2PjEKJ+yx3t447psiXFYwSvJ3dCqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abHSMMH2; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7f45ab88e7fso766142a12.1;
        Thu, 21 Nov 2024 06:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732198516; x=1732803316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jk1dZiEC1ur9wrruc4C2NzZd4uIBmS7sOPoPN7aX/7g=;
        b=abHSMMH2lYMFofaPvXKrWMpC+AecPGpvF9AbnU2iZqtKCL4QY0BHYAQyvWo2/wtQRs
         PF53njPsL2XfBrP07txg2R++hx6yskLM9zW5t+Xo4cUnyhUThYNMxA4u01FMXSMGgJ2T
         Hg9TTRrQmRm1eDRD+YghBYHASiGatGJcC8loPjORuQG0pvfmAoD7L+5QSHAJV5SG8/WI
         fzA0T8YHsfF/bkxGi5RIaUxoHOpv3SZMNxUZEEVOiP7Zz2GSm+ek8W/iZMwY51zT1jrO
         hnwmW1MMghoe13W4bQu8lsUVhr9xE8VThu3ZvGmJ2Z4SnbG78ALomYDhn4Ps9Kh6pdv+
         AXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732198516; x=1732803316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jk1dZiEC1ur9wrruc4C2NzZd4uIBmS7sOPoPN7aX/7g=;
        b=slT3Hk52WJcPTaQ+psYcAb9V4Z4Kt2AC9Q4YDSKnnVAe9UgLVD8jaL0acFW3iSkkZ1
         ZZNjiWThh6gWedHNdWsHq+/PlI6kW0TSbdhocKSmJUudbfhnivGuOmf2y0HfCJga7sYH
         nBtfgDjxpIsqS79d2cZ1hoin7Yg6I5YDLOXj9SeKrUESU8bvbQX0Sm+psGGV3CtRGVoD
         IUY4F9hnpRc/QtEsegbOz7pnzEeeQbHmWn+ZuGoD5kmcFXm5T6A3tqK0v5c7VdRLXLaR
         GN8CA92khSStkP9npuuie6UrM/OGErQAJwMa2uGIerRsyCOokXrc7ofIA3qlEo815s6Y
         Z+ew==
X-Forwarded-Encrypted: i=1; AJvYcCV3ok01z0+p8idaiFMR28eTsuH0GGglKHXRDVlM3nWM531qRQX0+249KeCiR5Xbgayq2lSYnZJGzDZy@vger.kernel.org, AJvYcCV6cISlbycmxJBhikjEvajnK0S7Jq2TpJiO/En+GZdzYXw5UhJVoJ4qkNQwwE388lmRKwwY/NY3ZS+m@vger.kernel.org, AJvYcCWBHPRC613z3EkzdyDjlKYxhlMBTw9E0C3+GRhIef5O1ajZar30hD4TyRFq3ymKNTHtGXpKQnaFAz4=@vger.kernel.org, AJvYcCWHijGF1tm9N3nswGqfns2AMb8n6POpl6NgRTHg1jG1uN+oEZcFjo5Wx2nhOZtqEPKDVNMNPRqB@vger.kernel.org, AJvYcCWqjeAzcZIa4aiIw12syQuLidLP4ZxeqBDy7T3CitNo38OyipkevY6vGZQNkdv8O7eexiuYX0e/XyW3WCk=@vger.kernel.org, AJvYcCXe2yPVD8czxSMS4ytOVeQRtG7sHApqgr8ouKS8SCKTgD1GRHiNydZkd8jl4F2s/KWlhfSRbpWntcIWB2QRxJc=@vger.kernel.org, AJvYcCXmMQx/KXPWNe+ODNqXEaT8VxjfliAVKdvQO0d1OooiPmKhfU3bkNh3LTceoTeisVPTVu0ZHQxpBFFSFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7bapnUXAyE7Y7vIpOgs6E3Kekv3Xj/M7xfnviKTURSh/pfSD2
	UrnE2CSWFSdVJ7gvf49FMqtZRV8R6QueFWAxI+Tacja6hwLbAICr
X-Gm-Gg: ASbGncvZiqFk/Dv5msel29ow9gbURa/nrYzQ8T4oogwxqY2a7U6oOHZFIug614fvkQo
	ZOzIHCijP8VamUZZEAsKNHbeoqEiTO3qof0tSAGNDtxIbvicJnA1KwhaPLTD//6XEcCl5XAxkPu
	S00IViZgNA0anClvVBDr79GZ8y55X22N0Uddy+Iqr/96FiFig/3/UEVm6BeU3KYdiQJ1KBGeihp
	UsYKHW/MY2yNllf4d6Ff0sfAduoo3MyRijA+Fp74YLEXqqhG3sMqQBxqC8FZ87cUI+k8EbT314g
	zaiu6vDwunC9qiz2MekkSgg=
X-Google-Smtp-Source: AGHT+IGdYFSuNTYFXDX7imvNXTNe0dfO/WLVejs0JA6Z+C5U78vXI5ZruRJ04i0pYZzYeFMkf7BpiQ==
X-Received: by 2002:a05:6a20:47d6:b0:1dc:1147:a632 with SMTP id adf61e73a8af0-1ddb0bfe4f2mr6438512637.37.1732198515704;
        Thu, 21 Nov 2024 06:15:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb65a0767sm1354415a12.81.2024.11.21.06.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 06:15:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2d21093f-7efd-4356-a1f5-2ae3af4a0da3@roeck-us.net>
Date: Thu, 21 Nov 2024 06:15:12 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] watchdog: Add Nuvoton NCT6694 WDT support
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20241121064046.3724726-1-tmyu0@nuvoton.com>
 <20241121064046.3724726-6-tmyu0@nuvoton.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241121064046.3724726-6-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/24 22:40, Ming Yu wrote:
> This driver supports Watchdog timer functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>   MAINTAINERS                    |   1 +
>   drivers/watchdog/Kconfig       |  11 ++
>   drivers/watchdog/Makefile      |   1 +
>   drivers/watchdog/nct6694_wdt.c | 277 +++++++++++++++++++++++++++++++++
>   4 files changed, 290 insertions(+)
>   create mode 100644 drivers/watchdog/nct6694_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eb5d46825e71..496fe7d5a23f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16549,6 +16549,7 @@ F:	drivers/gpio/gpio-nct6694.c
>   F:	drivers/i2c/busses/i2c-nct6694.c
>   F:	drivers/mfd/nct6694.c
>   F:	drivers/net/can/nct6694_canfd.c
> +F:	drivers/watchdog/nct6694_wdt.c
>   F:	include/linux/mfd/nct6694.h
>   
>   NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 2333476a42c0..851c1f17712d 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -739,6 +739,17 @@ config MAX77620_WATCHDOG
>   	  MAX77620 chips. To compile this driver as a module,
>   	  choose M here: the module will be called max77620_wdt.
>   
> +config NCT6694_WATCHDOG
> +	tristate "Nuvoton NCT6694 watchdog support"
> +	depends on MFD_NCT6694
> +	select WATCHDOG_CORE
> +	help
> +	  If you say yes to this option, support will be included for Nuvoton
> +	  NCT6694, a USB device to watchdog timer.
> +

It is a peripheral expander, not a "USB device to watchdog timer". Watchdog is only
a small part of its functionality.

> +	  This driver can also be built as a module. If so, the module will
> +	  be called nct6694_wdt.
> +
>   config IMX2_WDT
>   	tristate "IMX2+ Watchdog"
>   	depends on ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 386d88d89fe5..8355893b4435 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -232,6 +232,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
>   obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
>   obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
>   obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
> +obj-$(CONFIG_NCT6694_WATCHDOG)	+= nct6694_wdt.o
>   obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
>   obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
>   obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
> diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
> new file mode 100644
> index 000000000000..7d2c8d5c6fa3
> --- /dev/null
> +++ b/drivers/watchdog/nct6694_wdt.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 WDT driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/watchdog.h>
> +
> +#define DRVNAME "nct6694-wdt"
> +
> +#define NCT6694_DEFAULT_TIMEOUT		10
> +#define NCT6694_DEFAULT_PRETIMEOUT	0
> +
> +/* Host interface */
> +#define NCT6694_WDT_MOD		0x07
> +
> +/* Message Channel*/
> +/* Command 00h */
> +#define NCT6694_WDT_CMD0_LEN	0x0F
> +#define NCT6694_WDT_CMD0_OFFSET(idx)	(idx ? 0x0100 : 0x0000)	/* OFFSET = SEL|CMD */
> +
> +/* Command 01h */
> +#define NCT6694_WDT_CMD1_LEN		0x08
> +#define NCT6694_WDT_CMD1_OFFSET(idx)	(idx ? 0x0101 : 0x0001)	/* OFFSET = SEL|CMD */
> +
> +static unsigned int timeout = NCT6694_DEFAULT_TIMEOUT;
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +static unsigned int pretimeout = NCT6694_DEFAULT_PRETIMEOUT;
> +module_param(pretimeout, int, 0);
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
> +struct __packed nct6694_wdt_cmd0 {
> +	__le32 pretimeout;
> +	__le32 timeout;
> +	u8 owner;
> +	u8 scratch;
> +	u8 control;
> +	u8 status;
> +	__le32 countdown;
> +};
> +
> +struct __packed nct6694_wdt_cmd1 {
> +	u32 wdt_cmd;
> +	u32 reserved;
> +};
> +
> +struct nct6694_wdt_data {
> +	struct watchdog_device wdev;
> +	struct device *dev;
> +	struct nct6694 *nct6694;
> +	struct mutex lock;
> +	unsigned char *xmit_buf;
> +	unsigned int wdev_idx;
> +};
> +
> +static int nct6694_wdt_setting(struct watchdog_device *wdev,
> +			       u32 timeout_val, u8 timeout_act,
> +			       u32 pretimeout_val, u8 pretimeout_act)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694_wdt_cmd0 *buf = (struct nct6694_wdt_cmd0 *)data->xmit_buf;
> +	struct nct6694 *nct6694 = data->nct6694;
> +	unsigned int timeout_fmt, pretimeout_fmt;
> +
> +	guard(mutex)(&data->lock);
> +
> +	if (pretimeout_val == 0)
> +		pretimeout_act = NCT6694_ACTION_NONE;
> +
> +	timeout_fmt = (timeout_val * 1000) | (timeout_act << 24);
> +	pretimeout_fmt = (pretimeout_val * 1000) | (pretimeout_act << 24);
> +
> +	memset(buf, 0, NCT6694_WDT_CMD0_LEN);
> +	buf->timeout = cpu_to_le32(timeout_fmt);
> +	buf->pretimeout = cpu_to_le32(pretimeout_fmt);
> +
> +	return nct6694_write_msg(nct6694, NCT6694_WDT_MOD,
> +				 NCT6694_WDT_CMD0_OFFSET(data->wdev_idx),
> +				 NCT6694_WDT_CMD0_LEN, buf);
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
> +	dev_info(data->dev, "Setting WDT(%d): timeout = %d, pretimeout = %d\n",
> +		 data->wdev_idx, wdev->timeout, wdev->pretimeout);
> +

This is logging noise. Drop or set as debug message.

> +	return ret;
> +}
> +
> +static int nct6694_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694_wdt_cmd1 *buf = (struct nct6694_wdt_cmd1 *)data->xmit_buf;
> +	struct nct6694 *nct6694 = data->nct6694;
> +
> +	guard(mutex)(&data->lock);
> +
> +	memcpy(buf, "WDTC", 4);
> +	buf->reserved = 0;
> +
> +	return nct6694_write_msg(nct6694, NCT6694_WDT_MOD,
> +				 NCT6694_WDT_CMD1_OFFSET(data->wdev_idx),
> +				 NCT6694_WDT_CMD1_LEN, buf);
> +}
> +
> +static int nct6694_wdt_ping(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694_wdt_cmd1 *buf = (struct nct6694_wdt_cmd1 *)data->xmit_buf;
> +	struct nct6694 *nct6694 = data->nct6694;
> +
> +	guard(mutex)(&data->lock);
> +	memcpy(buf, "WDTS", 4);
> +	buf->reserved = 0;
> +
> +	return nct6694_write_msg(nct6694, NCT6694_WDT_MOD,
> +				 NCT6694_WDT_CMD1_OFFSET(data->wdev_idx),
> +				 NCT6694_WDT_CMD1_LEN, buf);
> +}
> +
> +static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
> +				   unsigned int timeout)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	int ret;
> +
> +	if (timeout < wdev->pretimeout) {
> +		dev_warn(data->dev, "pretimeout < timeout. Setting to zero\n");
> +		wdev->pretimeout = 0;
> +	}
> +
This is only necessary if the pretimeout was not validated during probe
since otherwise the watchdog core does the check. Please validate it there.

> +	ret = nct6694_wdt_setting(wdev, timeout, NCT6694_ACTION_GPO,
> +				  wdev->pretimeout, NCT6694_ACTION_GPO);
> +	if (ret)
> +		return ret;
> +
> +	wdev->timeout = timeout;
> +
> +	return ret;

ret == 0 here, so return 0.

> +}
> +
> +static int nct6694_wdt_set_pretimeout(struct watchdog_device *wdev,
> +				      unsigned int pretimeout)
> +{
> +	int ret;
> +
> +	ret = nct6694_wdt_setting(wdev, wdev->timeout, NCT6694_ACTION_GPO,
> +				  pretimeout, NCT6694_ACTION_GPO);
> +	if (ret)
> +		return ret;
> +
> +	wdev->pretimeout = pretimeout;
> +
> +	return ret;

ret == 0 here, so return 0.

> +}
> +
> +static unsigned int nct6694_wdt_get_time(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694_wdt_cmd0 *buf = (struct nct6694_wdt_cmd0 *)data->xmit_buf;
> +	struct nct6694 *nct6694 = data->nct6694;
> +	unsigned int timeleft_ms;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret = nct6694_read_msg(nct6694, NCT6694_WDT_MOD,
> +			       NCT6694_WDT_CMD0_OFFSET(data->wdev_idx),
> +			       NCT6694_WDT_CMD0_LEN, buf);
> +	if (ret)
> +		return ret;

The function does not return an error code. Return 0 instead.
> +
> +	timeleft_ms = le32_to_cpu(buf->countdown);
> +
> +	return timeleft_ms / 1000;
> +}
> +
> +static const struct watchdog_info nct6694_wdt_info = {
> +	.options = WDIOF_SETTIMEOUT	|
> +		   WDIOF_KEEPALIVEPING	|
> +		   WDIOF_MAGICCLOSE	|
> +		   WDIOF_PRETIMEOUT,
> +	.identity = DRVNAME,
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
> +static int nct6694_wdt_probe(struct platform_device *pdev)
> +{
> +	const struct mfd_cell *cell = mfd_get_cell(pdev);
> +	struct device *dev = &pdev->dev;
> +	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +	struct nct6694_wdt_data *data;
> +	struct watchdog_device *wdev;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->xmit_buf = devm_kcalloc(dev, NCT6694_MAX_PACKET_SZ,
> +				      sizeof(unsigned char), GFP_KERNEL);
> +	if (!data->xmit_buf)
> +		return -ENOMEM;
> +
> +	data->dev = dev;
> +	data->nct6694 = nct6694;
> +	data->wdev_idx = cell->id;
> +
> +	wdev = &data->wdev;
> +	wdev->info = &nct6694_wdt_info;
> +	wdev->ops = &nct6694_wdt_ops;
> +	wdev->timeout = timeout;
> +	wdev->pretimeout = pretimeout;

pretimeout should be validated here.

> +	wdev->min_timeout = 1;
> +	wdev->max_timeout = 255;
> +
> +	mutex_init(&data->lock);
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	/* Register watchdog timer device to WDT framework */
> +	watchdog_set_drvdata(&data->wdev, data);
> +	watchdog_init_timeout(&data->wdev, timeout, dev);
> +	watchdog_set_nowayout(&data->wdev, nowayout);
> +	watchdog_stop_on_reboot(&data->wdev);
> +
> +	return devm_watchdog_register_device(dev, &data->wdev);
> +}
> +
> +static struct platform_driver nct6694_wdt_driver = {
> +	.driver = {
> +		.name	= DRVNAME,
> +	},
> +	.probe		= nct6694_wdt_probe,
> +};
> +
> +module_platform_driver(nct6694_wdt_driver);
> +
> +MODULE_DESCRIPTION("USB-WDT driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");


