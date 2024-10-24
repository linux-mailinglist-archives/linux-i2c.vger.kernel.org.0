Return-Path: <linux-i2c+bounces-7549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 843359AEA85
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 17:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8F051C21CBA
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 15:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141AC1EF938;
	Thu, 24 Oct 2024 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUkhQw8m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB62719DFB4;
	Thu, 24 Oct 2024 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729783985; cv=none; b=rGKOxE8nSQWqfs/+zx4kR4yJzUrbirTr+ZzPreKJmn7et9lr9QJEy1mCLsYbU9/lU4ouo5ExW/b8aHgqmrZpE2pq+ymDVwY9+RflO4G1vfJWzkh83R9QrSpXGST+pOzcrD7DfcuRepgCFDxDmkuzPr+JdsYbxA/Yiq5e6SnzNMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729783985; c=relaxed/simple;
	bh=jNTLiPMBDSkchBwopLCxxwgAgtgUorYOGSYAlx3JKx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvgFcRFsu2C0p7FMuFMFbDjDXPV4pDPYO3eLcHbJoUhggTg092ieaQrnCNNrzEH/IEEgiFexxbRyft5ihh1CGJtUINI0xtyDAqCW4qHFgrZvQhc2ddVsrovrdeJiamg+nD4d4o6Ud0wfqrx2y0Pi4OpcJ58FicT5ZBAye4+0Yyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUkhQw8m; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7db908c9c83so588717a12.2;
        Thu, 24 Oct 2024 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729783982; x=1730388782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xYzLevyqUBkDT4B7cinCY+FgHSUFlHY3a1e4M80IzkQ=;
        b=VUkhQw8mJO5eXgHYNyq1lJTt59X+BcJirqKflwVj0ceUvBKnqOv0ISjWyiVQoOmYFr
         49gIiKsrY+RlJzr/bKwU34r+wV3yn1BXNx8MfMBM5F4A0QZPfDYrlfMD31MXE/2W9SIp
         YBDJOPNnZ8kvoRF086bSYtTUcOzeq7tMdyVGJyu+TeZ5t4tpDZocfLWe+fBI/xuBQtvn
         0G0IelTUA12rt1GqAqJnLlPDLT6yOshLb9UQlVglD1fvuBSh1ohHvLVmgho5+S1D+1x5
         105SLNUPz1iYrsxqc8uYx9fDYze4f9VatTZ8UP6u9xBsibC7wqOoAlbRU4yhz/8VJJOQ
         PfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729783982; x=1730388782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYzLevyqUBkDT4B7cinCY+FgHSUFlHY3a1e4M80IzkQ=;
        b=RXpeMf/2ekVE59iJWTBh73vrNN8vjMxxW7N2ayTQU7g1pJcDhUsuQID5ZxonsokVpd
         FaIV8y5wBuJAnuaAiWX4GVhCROq1G6+XhHk8NhQQNzZsu0JaIZSRJZcygs/tq48YmOcs
         pCN1Cwfgp4Gc5hPDPCiD3COjXcvlWZ+n3H1fVu6X+qXhKjttdnIYMXcw0gQdHPkPU5y2
         xlp1y4hc9wiYrxdbcA9nAQiffZbJIovwywsvULTeMsmRwVJtBwOWYLAndJh6ZluF3I8H
         pNwZehlalmkUhonWSaFFaHEVP7y6Zzj+mxaFavVAIxKqo3v3ZeSHXgdrJcFe7JZ91mgN
         vq2w==
X-Forwarded-Encrypted: i=1; AJvYcCUMYkDtWyCRYEA0pXN225khE4+7rdnOBQkg4pY93dK2xil8IvJ7aQAu4GHqIlMhwXHryvPS2k+3MHiu0Q==@vger.kernel.org, AJvYcCUZz0l1Pz7dnUGxhKSnNU2gdjAWyIlIj8TUHVdcC+p3GJIfvgEDQBEFbkQmRdjQC1pIVkm7aWriOD93@vger.kernel.org, AJvYcCUguYuIzjgjAKGd2t/79DCtY8s+JPgrU1BZ1sx+eKq4KevZSlkAnKV3TPyU2n2IfBut9W7WIIHmymRXW4o=@vger.kernel.org, AJvYcCUmKQpioYMYS/Vpyv9tq1roahMumawFeEh9X/eU/CF9B7Iz+08wVYYY3X1RzV4I2QuK9eGNWVYnDS0=@vger.kernel.org, AJvYcCW8QeCplYEdty87+mnveSQ1cL4MkUSCAoXqxNip06SHH2P7kNQKu0gPsKRaxeG/3VZvsV+DlEP2+QAn@vger.kernel.org, AJvYcCWB5qsWEjw0RHt+cBdl/9LWLWmWV4q/XE3sY39TzjaMReS9oHa/0+49travibGstsBRxQAIB/n7@vger.kernel.org, AJvYcCWv0j/cgMtr+lM+mU2n7/Z+YCnv2WcOOzGs2gVQ4HOJTKhyXwFygbntCCUjkSrEg5TrYPB/r9XC/tji@vger.kernel.org, AJvYcCXBq9AETzEEEJ/6Wbs/6IzqPQ/J1+ropJz4oPCgaLq3La/UHTLhmMC7PL+JftOmINWxdVPDYS0+7rUvKcPFjGA=@vger.kernel.org, AJvYcCXYabBxFN2d0tBuftQLPyZWaYsiYTOPrOcabpPnqR4bVejnecM0w1aAGy6zBYYf8XbHtxwBI9DztGrv@vger.kernel.org
X-Gm-Message-State: AOJu0YxgADirfODBnaJQ4bHiU8uEVTuskxZfP47S5mQxSZf+9zYv7g2c
	iC6f7jVijNmX3VGKH2DHig0MaS4pVF6y7aJ+iDE3/KMF9Qi+X/a0OYairQ==
X-Google-Smtp-Source: AGHT+IFXjPXB/ZLWn+YKAt4Rg1JoKWblMpow+gsdagE3/AB7Fo1JItwelMY0ZhQRo+YdN5mEN4JlAw==
X-Received: by 2002:a05:6a21:170f:b0:1d0:7df2:cf39 with SMTP id adf61e73a8af0-1d978ad5892mr7501334637.7.1729783981935;
        Thu, 24 Oct 2024 08:33:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d7544sm8382000b3a.140.2024.10.24.08.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 08:33:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5fa97399-25b8-4877-be6e-69ba1ae1837d@roeck-us.net>
Date: Thu, 24 Oct 2024 08:32:58 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/9] watchdog: Add Nuvoton NCT6694 WDT support
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com,
 jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org,
 alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-6-tmyu0@nuvoton.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241024085922.133071-6-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/24 01:59, Ming Yu wrote:
> This driver supports Watchdog timer functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>   MAINTAINERS                    |   1 +
>   drivers/watchdog/Kconfig       |  11 ++
>   drivers/watchdog/Makefile      |   1 +
>   drivers/watchdog/nct6694_wdt.c | 329 +++++++++++++++++++++++++++++++++
>   4 files changed, 342 insertions(+)
>   create mode 100644 drivers/watchdog/nct6694_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eccd5e795daa..63387c0d4ab6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16442,6 +16442,7 @@ F:	drivers/gpio/gpio-nct6694.c
>   F:	drivers/i2c/busses/i2c-nct6694.c
>   F:	drivers/mfd/nct6694.c
>   F:	drivers/net/can/nct6694_canfd.c
> +F:	drivers/watchdog/nct6694_wdt.c
>   F:	include/linux/mfd/nct6694.h
>   
>   NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 684b9fe84fff..bc9d63d69204 100644
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
> +	If you say yes to this option, support will be included for Nuvoton
> +	NCT6694, a USB device to watchdog timer.
> +
> +	This driver can also be built as a module. If so, the module
> +	will be called nct6694_wdt.
> +
>   config IMX2_WDT
>   	tristate "IMX2+ Watchdog"
>   	depends on ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index ab6f2b41e38e..453ceacd43ab 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -231,6 +231,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
>   obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
>   obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
>   obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
> +obj-$(CONFIG_NCT6694_WATCHDOG)	+= nct6694_wdt.o
>   obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
>   obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
>   obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
> diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
> new file mode 100644
> index 000000000000..68e2926ec504
> --- /dev/null
> +++ b/drivers/watchdog/nct6694_wdt.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 WDT driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/watchdog.h>
> +#include <linux/slab.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mfd/core.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/nct6694.h>
> +
> +#define DRVNAME "nct6694-wdt"
> +
> +#define WATCHDOG_TIMEOUT	10
> +#define WATCHDOG_PRETIMEOUT	0
> +
> +/* Host interface */
> +#define REQUEST_WDT_MOD		0x07
> +
> +/* Message Channel*/
> +/* Command 00h */
> +#define REQUEST_WDT_CMD0_LEN	0x0F
> +#define REQUEST_WDT_CMD0_OFFSET(idx)	(idx ? 0x0100 : 0x0000)	/* OFFSET = SEL|CMD */
> +#define WDT_PRETIMEOUT_IDX	0x00
> +#define WDT_PRETIMEOUT_LEN	0x04	/* PRETIMEOUT(3byte) | ACT(1byte) */
> +#define WDT_TIMEOUT_IDX		0x04
> +#define WDT_TIMEOUT_LEN		0x04	/* TIMEOUT(3byte) | ACT(1byte) */
> +#define WDT_COUNTDOWN_IDX	0x0C
> +#define WDT_COUNTDOWN_LEN	0x03
> +
> +#define WDT_PRETIMEOUT_ACT	BIT(1)
> +#define WDT_TIMEOUT_ACT		BIT(1)
> +
> +/* Command 01h */
> +#define REQUEST_WDT_CMD1_LEN		0x04
> +#define REQUEST_WDT_CMD1_OFFSET(idx)	(idx ? 0x0101 : 0x0001)	/* OFFSET = SEL|CMD */
> +#define WDT_CMD_IDX			0x00
> +#define WDT_CMD_LEN			0x04
> +
> +static unsigned int timeout;
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +static unsigned int pretimeout;
> +module_param(pretimeout, int, 0);
> +MODULE_PARM_DESC(pretimeout, "Watchdog pre-timeout in seconds");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +			   __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct nct6694_wdt_data {
> +	struct nct6694 *nct6694;
> +	struct watchdog_device wdev;
> +	unsigned int wdev_idx;
> +};
> +
> +static inline void set_buf32(void *buf, u32 u32_val)
> +{
> +	u8 *p = (u8 *)buf;
> +
> +	p[0] = u32_val & 0xFF;
> +	p[1] = (u32_val >> 8) & 0xFF;
> +	p[2] = (u32_val >> 16) & 0xFF;
> +	p[3] = (u32_val >> 24) & 0xFF;
> +}
> +
> +static int nct6694_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +
> +	pr_debug("%s: WDT(%d) Start\n", __func__, data->wdev_idx);
> +
> +	return 0;
> +}
> +
> +static int nct6694_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694 *nct6694 = data->nct6694;
> +	unsigned char buf[REQUEST_WDT_CMD1_LEN] = {'W', 'D', 'T', 'C'};
> +	int ret;
> +
> +	pr_debug("%s: WDT(%d) Close\n", __func__, data->wdev_idx);
> +	ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
> +				REQUEST_WDT_CMD1_OFFSET(data->wdev_idx),
> +				REQUEST_WDT_CMD1_LEN, buf);
> +	if (ret)
> +		pr_err("%s: Failed to start WDT device!\n", __func__);

Please refrain from logging noise. Besides, the message is wrong:
the watchdog is stopped here, not started.

Also, all messages should use dev_, not pr_ functions.

> +
> +	return ret;
> +}
> +
> +static int nct6694_wdt_ping(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694 *nct6694 = data->nct6694;
> +	unsigned char buf[REQUEST_WDT_CMD1_LEN] = {'W', 'D', 'T', 'S'};
> +	int ret;
> +
> +	pr_debug("%s: WDT(%d) Ping\n", __func__, data->wdev_idx);
> +	ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
> +				REQUEST_WDT_CMD1_OFFSET(data->wdev_idx),
> +				REQUEST_WDT_CMD1_LEN, buf);
> +	if (ret)
> +		pr_err("%s: Failed to ping WDT device!\n", __func__);

Same as above and everywhere else.

> +
> +	return ret;
> +}
> +
> +static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
> +				   unsigned int timeout)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694 *nct6694 = data->nct6694;
> +	unsigned int timeout_fmt, pretimeout_fmt;
> +	unsigned char buf[REQUEST_WDT_CMD0_LEN];
> +	int ret;
> +
> +	if (timeout < wdev->pretimeout) {
> +		pr_err("%s: 'timeout' must be greater than 'pre timeout'!\n",
> +		       __func__);
> +		return -EINVAL;

the driver is supposed to adjust pretimeout in this case. And please,
again, refrain from logging noise.
> +	}
> +
> +	timeout_fmt = timeout * 1000 | (WDT_TIMEOUT_ACT << 24);
> +	pretimeout_fmt = wdev->pretimeout * 1000 | (WDT_PRETIMEOUT_ACT << 24);
> +	set_buf32(&buf[WDT_TIMEOUT_IDX], le32_to_cpu(timeout_fmt));
> +	set_buf32(&buf[WDT_PRETIMEOUT_IDX], le32_to_cpu(pretimeout_fmt));
> +
> +	ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
> +				REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
> +				REQUEST_WDT_CMD0_LEN, buf);
> +	if (ret) {
> +		pr_err("%s: Don't write the setup command in Start stage!\n",
> +		       __func__);
> +		return ret;
> +	}
> +
> +	wdev->timeout = timeout;
> +
> +	return 0;
> +}
> +
> +static int nct6694_wdt_set_pretimeout(struct watchdog_device *wdev,
> +				      unsigned int pretimeout)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694 *nct6694 = data->nct6694;
> +	unsigned int timeout_fmt, pretimeout_fmt;
> +	unsigned char buf[REQUEST_WDT_CMD0_LEN];
> +	int ret;
> +
> +	if (pretimeout > wdev->timeout) {
> +		pr_err("%s: 'pre timeout' must be less than 'timeout'!\n",
> +		       __func__);
> +		return -EINVAL;

Already checked by the watchdog core.

> +	}
> +	timeout_fmt = wdev->timeout * 1000 | (WDT_TIMEOUT_ACT << 24);
> +	pretimeout_fmt = pretimeout * 1000 | (WDT_PRETIMEOUT_ACT << 24);
> +	set_buf32(&buf[WDT_TIMEOUT_IDX], le32_to_cpu(timeout_fmt));
> +	set_buf32(&buf[WDT_PRETIMEOUT_IDX], le32_to_cpu(pretimeout_fmt));
> +
> +	ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
> +				REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
> +				REQUEST_WDT_CMD0_LEN, buf);
> +	if (ret) {
> +		pr_err("%s: Don't write the setup command in Start stage!\n", __func__);

Besides it being noise, I don't even understand what this message is
supposed to mean, and neither would anyone else.

> +		return ret;
> +	}
> +
> +	wdev->pretimeout = pretimeout;
> +	return 0;
> +}
> +
> +static unsigned int nct6694_wdt_get_time(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694 *nct6694 = data->nct6694;
> +	unsigned char buf[WDT_COUNTDOWN_LEN];
> +	unsigned int timeleft_ms;
> +	int ret;
> +
> +	ret = nct6694_read_msg(nct6694, REQUEST_WDT_MOD,
> +			       REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
> +			       REQUEST_WDT_CMD0_LEN, WDT_COUNTDOWN_IDX,
> +			       WDT_COUNTDOWN_LEN, buf);
> +	if (ret)
> +		pr_err("%s: Failed to get WDT device!\n", __func__);
> +
> +	timeleft_ms = ((buf[2] << 16) | (buf[1] << 8) | buf[0]) & 0xFFFFFF;

If the above command failed this will be a random number.

> +
> +	return timeleft_ms / 1000;
> +}
> +
> +static int nct6694_wdt_setup(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +	struct nct6694 *nct6694 = data->nct6694;
> +	unsigned char buf[REQUEST_WDT_CMD0_LEN] = {0};
> +	unsigned int timeout_fmt, pretimeout_fmt;
> +	int ret;
> +
> +	if (timeout)
> +		wdev->timeout = timeout;
> +
Already set.

> +	if (pretimeout) {
> +		wdev->pretimeout = pretimeout;

Pretimeout is already set in the probe function. Do it completely there.

> +		pretimeout_fmt = wdev->pretimeout * 1000 | (WDT_PRETIMEOUT_ACT << 24);
> +	} else {
> +		pretimeout_fmt = 0;
> +	}
> +
> +	timeout_fmt = wdev->timeout * 1000 | (WDT_TIMEOUT_ACT << 24);
> +	set_buf32(&buf[WDT_TIMEOUT_IDX], le32_to_cpu(timeout_fmt));
> +	set_buf32(&buf[WDT_PRETIMEOUT_IDX], le32_to_cpu(pretimeout_fmt));
> +
> +	ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
> +				REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
> +				REQUEST_WDT_CMD0_LEN, buf);


This seems pretty pointless at this time. Why not do it in the watchdog
start function ?

> +	if (ret)
> +		return ret;
> +
> +	pr_info("Setting WDT(%d): timeout = %d, pretimeout = %d\n",
> +		data->wdev_idx, wdev->timeout, wdev->pretimeout);
> +
> +	return 0;
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
> +	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +	struct nct6694_wdt_data *data;
> +	struct watchdog_device *wdev;
> +	int ret;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->nct6694 = nct6694;
> +	data->wdev_idx = cell->id;
> +
> +	wdev = &data->wdev;
> +	wdev->info = &nct6694_wdt_info;
> +	wdev->ops = &nct6694_wdt_ops;
> +	wdev->timeout = WATCHDOG_TIMEOUT;
> +	wdev->pretimeout = WATCHDOG_PRETIMEOUT;
> +	wdev->min_timeout = 1;
> +	wdev->max_timeout = 255;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	/* Register watchdog timer device to WDT framework */
> +	watchdog_set_drvdata(&data->wdev, data);
> +	watchdog_init_timeout(&data->wdev, timeout, &pdev->dev);
> +	watchdog_set_nowayout(&data->wdev, nowayout);
> +	watchdog_stop_on_reboot(&data->wdev);
> +
> +	ret = devm_watchdog_register_device(&pdev->dev, &data->wdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: Failed to register watchdog device: %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	ret = nct6694_wdt_setup(&data->wdev);

This is too late. It needs to be done before registering the watchdog.

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to setup WDT device!\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver nct6694_wdt_driver = {
> +	.driver = {
> +		.name	= DRVNAME,
> +	},
> +	.probe		= nct6694_wdt_probe,
> +};
> +
> +static int __init nct6694_init(void)
> +{
> +	int err;
> +
> +	err = platform_driver_register(&nct6694_wdt_driver);
> +	if (!err) {
> +		if (err)
> +			platform_driver_unregister(&nct6694_wdt_driver);
> +	}
> +
> +	return err;
> +}
> +subsys_initcall(nct6694_init);
> +
> +static void __exit nct6694_exit(void)
> +{
> +	platform_driver_unregister(&nct6694_wdt_driver);
> +}
> +module_exit(nct6694_exit);
> +
> +MODULE_DESCRIPTION("USB-WDT driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");


