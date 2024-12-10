Return-Path: <linux-i2c+bounces-8426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB37F9EB582
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 16:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2846B162DAB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 15:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8C222FE0D;
	Tue, 10 Dec 2024 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7bCAWvC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1985A22FDFB;
	Tue, 10 Dec 2024 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733846331; cv=none; b=qDWVs1lGfCHrQuoSe2q1ek7+WVozkY8bFgAfByLkZcvHlMDMSh4oBDevkD0BvldDal9RU1tlzFu4Mo+8MK224MheSyaUGehTxd2uWPgbs1y7V8UaqMdgIwJrl6teFy2RA/TmUprZahOsBojcocStrg3mzxy41NhmJEhvYDQrrCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733846331; c=relaxed/simple;
	bh=I5vknfFdy33r0ftvEi89h9ZVYsfaNjp9ZUrowMEFb1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdV88jUGmqzMNtC4QWr1l9mavwVl5l2ySYPYWSTExFknoAdRfHFrd42SFOyxA4KH/ntUJPFJnOg/0UVqwIkeqgATAcbOS5oZW6Efqe9ixUJ18NtVXittDyFX6cSVnrlUZcLKUoszHGUoTjnq2nsgyf2ToiGk+cHCok9qGlijrDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7bCAWvC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2efa856e4a4so1804857a91.0;
        Tue, 10 Dec 2024 07:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733846328; x=1734451128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88x7WkPdwBTvdwsPiLKh3I+gXAtjFkEEgDB5bnC+15o=;
        b=l7bCAWvC09x6PiT4pyJvwr3/QA7kgx0j9jfgsE+CLJg+E6i1kPJvrUTVP2SZ5ESEPR
         b4kt6nrUcB+E4Fxg08NlAG0q25FCpsYJZPtdSofytHYFw0ldhw0/oEr10S8j5wgJYiTs
         eiBZiVUayAUWQe+Gu3UjRW/x+z5cuEut5ag3er8Zo9cz7aNd91NKBinXLh/qE7ApZ44w
         hSHxqO8wlPlp0X+HzCczrgFJ6V34KkE7k2OYLsyIkygqee/E69/b9F1YmeTGmXviyDuK
         DP1aaq92DM/zZe++dcSKQdQHJr9rkGfwCdNpeOGyti2UxjCaUctY7tqkP/2yIvnppNDA
         gdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733846328; x=1734451128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88x7WkPdwBTvdwsPiLKh3I+gXAtjFkEEgDB5bnC+15o=;
        b=nQNBjEGmn1bLIzjnJZLnvUc5vxZxnTJSDGCi+fwKx2uxJmvMAtKDWdAkFziRi79KNd
         kwUwAr1t9z+jBZo5p23UTXE2g7N6APX9BXa7TKyrzsfJcOfVoyrfhDX6PVzfJfOzxGCQ
         BHJbuGxs06fKHlKIFSg36efLSgMUiREkureKe0zX+OLNVNHU+oYxC2PEdxz5D0nwfVx/
         HXlV7o+gSbnA37CRECf2XTzF2OuaNAdXhGicoaGVjpC+NFAE8hdmbg0L7Xi2NQUwYd6D
         XG1dHcmENeVljODifRXcJD+IBYe2ms+qviTMZbsHNSn11JfFL18WhtrS7i6LMKQTew+k
         0zDA==
X-Forwarded-Encrypted: i=1; AJvYcCU2ms5y4CJyJySCml4syRYNe7wWK/lBmZd+cuO40zAUlcze3yelLXOlPU0x/L56nStUZvEZ++vK@vger.kernel.org, AJvYcCU9CgNT/8XlcnEyRl/AimgytIb61r7KRPWdABEOStyWpMcoIdr79B4a/BF9XxbMQsHEVve+146UAuM=@vger.kernel.org, AJvYcCUIxC3L/TgWw+Y1ofgtjWGn4/OmkPXNI/jGcIhtABQ9RjAdNG1NbLRYnzv8dP8B69dJhyuoca4i5NBL5/X6DCg=@vger.kernel.org, AJvYcCUdKleoGLfM9GM2t7VJOrs1/cwpR9cooo/WbiI9CLHqgqGe6brtWbG7C+pi9JgTqyNMe5qmh8iZ46f8tldG@vger.kernel.org, AJvYcCVpEWQD2oJ/0nPT/VQnUoSFcHOJy1cVUppOF6aROL2a62Jdjf4N8Ga/QMEJ/0N/s43oA+xIpnjji/C6@vger.kernel.org, AJvYcCXLGteKetybA0IjccQGrWSz0TiW01AkJUUyUkFw3t1rwOQZQjHI5lBt4IYlXVD0x4m9TW5VWzJ/hN1o@vger.kernel.org, AJvYcCXje82Co75UoaIT7/TcT5L1acE3QYiJ493UHUQf0vX1jTsXO2a6dYGwRfyxCpGeXT3ikDBA7GocSXMnGDg=@vger.kernel.org, AJvYcCXmxAY/x7stSpgdYF/A35CUDhMFXT22ErE83gBxPnR6RTqwz7YzlBNVpZBNFYAHeAoZ10NrExOjl53CUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgIbRgegzC3jP5tkfm3VYv4gBWbGWmMfWR295oFxxS2EFeSZI
	y8L9s33Q/G74PhpzMr4rgyOE2wSkChXTG611J/J/me5W4r4tpR6f
X-Gm-Gg: ASbGncv0hsL2FYjy1GP53LNYl97a/NmYS0SKFb5CnSPz4PrwklIWqsj1jXX107OKJkB
	T/CJDGw24NGGKAXhpWOVMWlksj8zTYl7/5pYvTLubaCMnahl71CEe4IJ8uLMm+jUQX9sBzLxTsm
	lgIt7XXw+VF+8yLOzeP32sds5wbnwKIHY0B3PSiZuMPquUlmGPrpla7gHKvIDq9tXtiwstsmLDH
	XiipfKo0ZZmWk2sW7eqOZFOfLepLL9Y1LZCkNCISDtcUZzfk4y5CyIQn7rENg2lDjM=
X-Google-Smtp-Source: AGHT+IE0uDMJorEUkecWAjziDvn2P4we2p5qC7fLbX0bCmDpyEYX3FEPK17jkqOSsAR/GtbZLdW/EQ==
X-Received: by 2002:a17:90b:1fd0:b0:2ea:2a8d:dd2a with SMTP id 98e67ed59e1d1-2ef6ab0d31dmr23618856a91.27.1733846328088;
        Tue, 10 Dec 2024 07:58:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef951bd734sm5234204a91.4.2024.12.10.07.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:58:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 10 Dec 2024 07:58:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com,
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
Message-ID: <d3548f81-63f9-422c-9884-895d501e64b0@roeck-us.net>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-7-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210104524.2466586-7-tmyu0@nuvoton.com>

On Tue, Dec 10, 2024 at 06:45:23PM +0800, Ming Yu wrote:
> This driver supports Hardware monitor functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>

checkpatch:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Ming Yu <a0282524688@gmail.com>' != 'Signed-off-by: Ming Yu <tmyu0@nuvoton.com>'

> ---
>  MAINTAINERS                   |   1 +
>  drivers/hwmon/Kconfig         |  10 +
>  drivers/hwmon/Makefile        |   1 +
>  drivers/hwmon/nct6694-hwmon.c | 768 ++++++++++++++++++++++++++++++++++
>  4 files changed, 780 insertions(+)
>  create mode 100644 drivers/hwmon/nct6694-hwmon.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 496fe7d5a23f..d6414eea0463 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16546,6 +16546,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Supported
>  F:	drivers/gpio/gpio-nct6694.c
> +F:	drivers/hwmon/nct6694-hwmon.c
>  F:	drivers/i2c/busses/i2c-nct6694.c
>  F:	drivers/mfd/nct6694.c
>  F:	drivers/net/can/nct6694_canfd.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index dd376602f3f1..df40986424bd 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1636,6 +1636,16 @@ config SENSORS_NCT6683
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nct6683.
>  
> +config SENSORS_NCT6694
> +	tristate "Nuvoton NCT6694 Hardware Monitor support"
> +	depends on MFD_NCT6694
> +	help
> +	  Say Y here to support Nuvoton NCT6694 hardware monitoring
> +	  functionality.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nct6694-hwmon.
> +
>  config SENSORS_NCT6775_CORE
>  	tristate
>  	select REGMAP
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b827b92f2a78..27a43e67cdb7 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -168,6 +168,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
>  obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
>  obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
>  obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
> +obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
>  obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
>  nct6775-objs			:= nct6775-platform.o
>  obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
> diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
> new file mode 100644
> index 000000000000..b2320d64090b
> --- /dev/null
> +++ b/drivers/hwmon/nct6694-hwmon.c
> @@ -0,0 +1,768 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 HWMON driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +/* Host interface */
> +#define NCT6694_RPT_MOD			0xFF
> +#define NCT6694_HWMON_MOD		0x00
> +#define NCT6694_PWM_MOD			0x01
> +
> +/* Report Channel */
> +#define NCT6694_VIN_IDX(x)		(0x00 + (x))
> +#define NCT6694_TIN_IDX(x)			\
> +	({ typeof(x) (_x) = (x);		\
> +	 ((_x) < 10) ? (0x10 + ((_x) * 2)) :	\
> +	 (0x30 + (((_x) - 10) * 2)); })
> +#define NCT6694_FIN_IDX(x)		(0x50 + ((x) * 2))
> +#define NCT6694_PWM_IDX(x)		(0x70 + (x))
> +#define NCT6694_VIN_STS(x)		(0x68 + (x))
> +#define NCT6694_TIN_STS(x)		(0x6A + (x))
> +#define NCT6694_FIN_STS(x)		(0x6E + (x))
> +
> +/* Message Channel*/
> +/* HWMON Command */
> +/* Command 00h */
> +#define NCT6694_HWMON_CMD0_LEN		0x40
> +#define NCT6694_HWMON_CMD0_OFFSET	0x0000	/* OFFSET = SEL|CMD */
> +#define NCT6694_VIN_EN(x)		(0x00 + (x))
> +#define NCT6694_TIN_EN(x)		(0x02 + (x))
> +#define NCT6694_FIN_EN(x)		(0x04 + (x))
> +#define NCT6694_PWM_EN(x)		(0x06 + (x))
> +#define NCT6694_PWM_FREQ_IDX(x)		(0x30 + (x))
> +/* Command 02h */
> +#define NCT6694_HWMON_CMD2_LEN		0x90
> +#define NCT6694_HWMON_CMD2_OFFSET	0x0002	/* OFFSET = SEL|CMD */
> +#define NCT6694_SMI_CTRL_IDX		0x00
> +#define NCT6694_VIN_HL(x)		(0x10 + ((x) * 2))
> +#define NCT6694_VIN_LL(x)		(0x11 + ((x) * 2))
> +#define NCT6694_TIN_HYST(x)		(0x30 + ((x) * 2))
> +#define NCT6694_TIN_HL(x)		(0x31 + ((x) * 2))
> +#define NCT6694_FIN_HL(x)		(0x70 + ((x) * 2))
> +#define NCT6694_FIN_LL(x)		(0x71 + ((x) * 2))
> +/* PWM Command */
> +#define NCT6694_PWM_CMD1_LEN		0x18
> +#define NCT6694_PWM_CMD1_OFFSET		0x0001
> +#define NCT6694_MAL_VAL(x)		(0x02 + (x))
> +
> +#define NCT6694_FREQ_FROM_REG(reg)	((reg) * 25000 / 255)
> +#define NCT6694_FREQ_TO_REG(val)	\
> +	(DIV_ROUND_CLOSEST(clamp_val((val), 100, 25000) * 255, 25000))
> +
> +#define NCT6694_LSB_REG_MASK		GENMASK(7, 5)
> +#define NCT6694_TIN_HYST_MASK		GENMASK(7, 5)
> +
> +static inline long in_from_reg(u8 reg)
> +{
> +	return reg * 16;
> +}
> +
> +static inline u8 in_to_reg(long val)
> +{
> +	if (val <= 0)
> +		return 0;

This is pointless since the calling code already clamps the value to [0, 2032].

> +	return val / 16;

DIV_ROUND_CLOSEST() ?

> +}
> +
> +static inline long temp_from_reg(u8 reg)
> +{
> +	return reg * 1000;

This always returns a positive value, even though the temperature is
supposed to be signed. More on that below.

> +}
> +
> +static inline u8 temp_to_reg(long val)
> +{
> +	return val / 1000;

DIV_ROUND_CLOSEST() ?

> +}
> +
> +struct nct6694_hwmon_data {
> +	struct nct6694 *nct6694;
> +	struct mutex lock;
> +	unsigned char *xmit_buf;
> +	unsigned char hwmon_en[NCT6694_HWMON_CMD0_LEN];
> +};
> +
> +#define NCT6694_HWMON_IN_CONFIG (HWMON_I_INPUT | HWMON_I_ENABLE |	\
> +				 HWMON_I_MAX | HWMON_I_MIN |		\
> +				 HWMON_I_ALARM)
> +#define NCT6694_HWMON_TEMP_CONFIG (HWMON_T_INPUT | HWMON_T_ENABLE |	\
> +				   HWMON_T_MAX | HWMON_T_MAX_HYST |	\
> +				   HWMON_T_MAX_ALARM)
> +#define NCT6694_HWMON_FAN_CONFIG (HWMON_F_INPUT | HWMON_F_ENABLE |	\
> +				  HWMON_F_MIN | HWMON_F_MIN_ALARM)
> +#define NCT6694_HWMON_PWM_CONFIG (HWMON_PWM_INPUT | HWMON_PWM_ENABLE |	\
> +				  HWMON_PWM_FREQ)
> +static const struct hwmon_channel_info *nct6694_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   NCT6694_HWMON_IN_CONFIG,	/* VIN0 */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VIN1 */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VIN2 */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VIN3 */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VIN5 */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VIN6 */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VIN7 */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VIN14 */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VIN15 */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VIN16 */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VBAT */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VSB */
> +			   NCT6694_HWMON_IN_CONFIG,	/* AVSB */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VCC */
> +			   NCT6694_HWMON_IN_CONFIG,	/* VHIF */
> +			   NCT6694_HWMON_IN_CONFIG),	/* VTT */
> +
> +	HWMON_CHANNEL_INFO(temp,
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* THR1 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* THR2 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* THR14 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* THR15 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* THR16 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP0 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP1 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP2 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP3 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP4 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN0 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN1 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN2 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN3 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN4 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN5 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN6 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN7 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN8 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN9 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN10 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN11 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN12 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN13 */
> +			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN14 */
> +			   NCT6694_HWMON_TEMP_CONFIG),	/* DTIN15 */
> +
> +	HWMON_CHANNEL_INFO(fan,
> +			   NCT6694_HWMON_FAN_CONFIG,	/* FIN0 */
> +			   NCT6694_HWMON_FAN_CONFIG,	/* FIN1 */
> +			   NCT6694_HWMON_FAN_CONFIG,	/* FIN2 */
> +			   NCT6694_HWMON_FAN_CONFIG,	/* FIN3 */
> +			   NCT6694_HWMON_FAN_CONFIG,	/* FIN4 */
> +			   NCT6694_HWMON_FAN_CONFIG,	/* FIN5 */
> +			   NCT6694_HWMON_FAN_CONFIG,	/* FIN6 */
> +			   NCT6694_HWMON_FAN_CONFIG,	/* FIN7 */
> +			   NCT6694_HWMON_FAN_CONFIG,	/* FIN8 */
> +			   NCT6694_HWMON_FAN_CONFIG),	/* FIN9 */
> +
> +	HWMON_CHANNEL_INFO(pwm,
> +			   NCT6694_HWMON_PWM_CONFIG,	/* PWM0 */
> +			   NCT6694_HWMON_PWM_CONFIG,	/* PWM1 */
> +			   NCT6694_HWMON_PWM_CONFIG,	/* PWM2 */
> +			   NCT6694_HWMON_PWM_CONFIG,	/* PWM3 */
> +			   NCT6694_HWMON_PWM_CONFIG,	/* PWM4 */
> +			   NCT6694_HWMON_PWM_CONFIG,	/* PWM5 */
> +			   NCT6694_HWMON_PWM_CONFIG,	/* PWM6 */
> +			   NCT6694_HWMON_PWM_CONFIG,	/* PWM7 */
> +			   NCT6694_HWMON_PWM_CONFIG,	/* PWM8 */
> +			   NCT6694_HWMON_PWM_CONFIG),	/* PWM9 */
> +	NULL
> +};
> +
> +static int nct6694_in_read(struct device *dev, u32 attr, int channel,
> +			   long *val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	unsigned char vin_en;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_in_enable:
> +		vin_en = data->hwmon_en[NCT6694_VIN_EN(channel / 8)];
> +		*val = !!(vin_en & BIT(channel % 8)) ? 1 : 0;

Drop "? 1 : 0"

> +
> +		return 0;
> +	case hwmon_in_input:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> +				       NCT6694_VIN_IDX(channel), 1,
> +				       data->xmit_buf);

I am curious: Since the received data length is not returned, and the
expected minimum length is not passed to nct6694_read_msg(), the driver
has no means to check if the received data actually includes the expected
values at the expected index. That doesn't matter here, but some of the
returned data is located far into the buffer. Is it indeed not necessary
for the driver to check if the received data is actually as long as
expected ?

> +		if (ret)
> +			return ret;
> +
> +		*val = in_from_reg(data->xmit_buf[0]);
> +
> +		return 0;
> +	case hwmon_in_max:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_CMD2_OFFSET,
> +				       NCT6694_HWMON_CMD2_LEN,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		*val = in_from_reg(data->xmit_buf[NCT6694_VIN_HL(channel)]);
> +
> +		return 0;
> +	case hwmon_in_min:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_CMD2_OFFSET,
> +				       NCT6694_HWMON_CMD2_LEN,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		*val = in_from_reg(data->xmit_buf[NCT6694_VIN_LL(channel)]);
> +
> +		return 0;
> +	case hwmon_in_alarm:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> +				       NCT6694_VIN_STS(channel / 8), 1,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		*val = !!(data->xmit_buf[0] & BIT(channel % 8));
> +
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct6694_temp_read(struct device *dev, u32 attr, int channel,
> +			     long *val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	unsigned char temp_en, temp_hyst;
> +	int ret, int_part, frac_part;
> +	signed char temp_max;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_temp_enable:
> +		temp_en = data->hwmon_en[NCT6694_TIN_EN(channel / 8)];
> +		*val = !!(temp_en & BIT(channel % 8)) ? 1 : 0;

Drop "? 1 : 0"

> +
> +		return 0;
> +	case hwmon_temp_input:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> +				       NCT6694_TIN_IDX(channel), 2,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		int_part = sign_extend32(data->xmit_buf[0], 7);
> +		frac_part = FIELD_GET(NCT6694_LSB_REG_MASK, data->xmit_buf[1]);
> +		if (int_part < 0)
> +			*val = (int_part + 1) * 1000 - (8 - frac_part) * 125;
> +		else
> +			*val = int_part * 1000 + frac_part * 125;
> +
> +		return 0;
> +	case hwmon_temp_max:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_CMD2_OFFSET,
> +				       NCT6694_HWMON_CMD2_LEN,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		*val = temp_from_reg(data->xmit_buf[NCT6694_TIN_HL(channel)]);
> +

If the value in NCT6694_TIN_HL() is signed, this will return a large positive
value instead.

> +		return 0;
> +	case hwmon_temp_max_hyst:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_CMD2_OFFSET,
> +				       NCT6694_HWMON_CMD2_LEN,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		temp_max = (signed char)data->xmit_buf[NCT6694_TIN_HL(channel)];
> +		temp_hyst = FIELD_GET(NCT6694_TIN_HYST_MASK,
> +				      data->xmit_buf[NCT6694_TIN_HYST(channel)]);
> +		if (temp_max < 0)

This suggests that the temperature limit is signed, suggesting in turn that
temp_from_reg() is wrong.

> +			*val = temp_from_reg(temp_max + temp_hyst);
> +		else
> +			*val = temp_from_reg(temp_max - temp_hyst);
> +
> +		return 0;
> +	case hwmon_temp_max_alarm:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> +				       NCT6694_TIN_STS(channel / 8), 1,
> +					   data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		*val = !!(data->xmit_buf[0] & BIT(channel % 8));
> +
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct6694_fan_read(struct device *dev, u32 attr, int channel,
> +			    long *val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	unsigned char fanin_en;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_fan_enable:
> +		fanin_en = data->hwmon_en[NCT6694_FIN_EN(channel / 8)];
> +		*val = !!(fanin_en & BIT(channel % 8)) ? 1 : 0;

Drop "? 1 : 0"

> +
> +		return 0;
> +	case hwmon_fan_input:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> +				       NCT6694_FIN_IDX(channel), 2,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		*val = (data->xmit_buf[1] |
> +		       (data->xmit_buf[0] << 8)) & 0xFFFF;

The "& 0xffff" is pointless.

> +
> +		return 0;
> +	case hwmon_fan_min:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_CMD2_OFFSET,
> +				       NCT6694_HWMON_CMD2_LEN,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		*val = (data->xmit_buf[NCT6694_FIN_LL(channel)] |
> +			data->xmit_buf[NCT6694_FIN_HL(channel)] << 8) & 0xFFFF;

Same here.

> +
> +		return 0;
> +	case hwmon_fan_min_alarm:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> +				       NCT6694_FIN_STS(channel / 8),
> +				       1, data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		*val = !!(data->xmit_buf[0] & BIT(channel % 8));
> +
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct6694_pwm_read(struct device *dev, u32 attr, int channel,
> +			    long *val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	unsigned char pwm_en;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_pwm_enable:
> +		pwm_en = data->hwmon_en[NCT6694_PWM_EN(channel / 8)];
> +		*val = !!(pwm_en & BIT(channel % 8)) ? 1 : 0;

Drop "? 1 : 0".

> +
> +		return 0;
> +	case hwmon_pwm_input:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> +				       NCT6694_PWM_IDX(channel),
> +				       1, data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		*val = data->xmit_buf[0];
> +
> +		return 0;
> +	case hwmon_pwm_freq:
> +		*val = NCT6694_FREQ_FROM_REG(data->hwmon_en[NCT6694_PWM_FREQ_IDX(channel)]);
> +
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct6694_enable_channel(struct device *dev, u8 reg,
> +				  int channel, long val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +
> +	if (val == 0)
> +		data->hwmon_en[reg] &= ~BIT(channel % 8);
> +	else if (val == 1)
> +		data->hwmon_en[reg] |= BIT(channel % 8);
> +	else
> +		return -EINVAL;
> +
> +	return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				 NCT6694_HWMON_CMD0_OFFSET,
> +				 NCT6694_HWMON_CMD0_LEN,
> +				 data->hwmon_en);
> +}
> +
> +static int nct6694_in_write(struct device *dev, u32 attr, int channel,
> +			    long val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_in_enable:
> +		return nct6694_enable_channel(dev, NCT6694_VIN_EN(channel / 8),
> +					      channel, val);
> +	case hwmon_in_max:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_CMD2_OFFSET,
> +				       NCT6694_HWMON_CMD2_LEN,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		val = clamp_val(val, 0, 2032);
> +		data->xmit_buf[NCT6694_VIN_HL(channel)] = in_to_reg(val);
> +
> +		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
> +					 NCT6694_HWMON_CMD2_OFFSET,
> +					 NCT6694_HWMON_CMD2_LEN,
> +					 data->xmit_buf);
> +	case hwmon_in_min:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_CMD2_OFFSET,
> +				       NCT6694_HWMON_CMD2_LEN,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		val = clamp_val(val, 0, 2032);
> +		data->xmit_buf[NCT6694_VIN_LL(channel)] = in_to_reg(val);
> +
> +		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
> +					 NCT6694_HWMON_CMD2_OFFSET,
> +					 NCT6694_HWMON_CMD2_LEN,
> +					 data->xmit_buf);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct6694_temp_write(struct device *dev, u32 attr, int channel,
> +			      long val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	signed char temp_max, temp_hyst;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_temp_enable:
> +		return nct6694_enable_channel(dev, NCT6694_TIN_EN(channel / 8),
> +					      channel, val);
> +	case hwmon_temp_max:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_CMD2_OFFSET,
> +				       NCT6694_HWMON_CMD2_LEN,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		val = clamp_val(val, -127000, 127000);
> +		data->xmit_buf[NCT6694_TIN_HL(channel)] = temp_to_reg(val);
> +
> +		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
> +					 NCT6694_HWMON_CMD2_OFFSET,
> +					 NCT6694_HWMON_CMD2_LEN,
> +					 data->xmit_buf);
> +	case hwmon_temp_max_hyst:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_CMD2_OFFSET,
> +				       NCT6694_HWMON_CMD2_LEN,
> +				       data->xmit_buf);
> +
> +		val = clamp_val(val, -127000, 127000);
> +		temp_max = (signed char)data->xmit_buf[NCT6694_TIN_HL(channel)];
> +		temp_hyst = (temp_max < 0) ? (temp_max + val / 1000) :
> +					     (temp_max - val / 1000);

DIV_ROUND_CLOSEST() ?

> +		temp_hyst = clamp_val(temp_hyst, 0, 7);
> +		data->xmit_buf[NCT6694_TIN_HYST(channel)] =
> +		       (data->xmit_buf[NCT6694_TIN_HYST(channel)] & ~NCT6694_TIN_HYST_MASK) |
> +		       FIELD_PREP(NCT6694_TIN_HYST_MASK, temp_hyst);
> +
> +		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
> +					 NCT6694_HWMON_CMD2_OFFSET,
> +					 NCT6694_HWMON_CMD2_LEN,
> +					 data->xmit_buf);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct6694_fan_write(struct device *dev, u32 attr, int channel,
> +			     long val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_fan_enable:
> +		return nct6694_enable_channel(dev, NCT6694_FIN_EN(channel / 8),
> +					      channel, val);
> +	case hwmon_fan_min:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_CMD2_OFFSET,
> +				       NCT6694_HWMON_CMD2_LEN,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		val = clamp_val(val, 1, 65535);
> +		data->xmit_buf[NCT6694_FIN_HL(channel)] = (u8)((val >> 8) & 0xFF);
> +		data->xmit_buf[NCT6694_FIN_LL(channel)] = (u8)(val & 0xFF);
> +
> +		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
> +					 NCT6694_HWMON_CMD2_OFFSET,
> +					 NCT6694_HWMON_CMD2_LEN,
> +					 data->xmit_buf);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct6694_pwm_write(struct device *dev, u32 attr, int channel,
> +			     long val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_pwm_enable:
> +		return nct6694_enable_channel(dev, NCT6694_PWM_EN(channel / 8),
> +					      channel, val);
> +	case hwmon_pwm_input:
> +		if (val < 0 || val > 255)
> +			return -EINVAL;
> +
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_PWM_MOD,
> +				       NCT6694_PWM_CMD1_OFFSET,
> +				       NCT6694_PWM_CMD1_LEN,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		data->xmit_buf[NCT6694_MAL_VAL(channel)] = val;
> +
> +		return nct6694_write_msg(data->nct6694, NCT6694_PWM_MOD,
> +					 NCT6694_PWM_CMD1_OFFSET,
> +					 NCT6694_PWM_CMD1_LEN,
> +					 data->xmit_buf);
> +	case hwmon_pwm_freq:
> +		data->hwmon_en[NCT6694_PWM_FREQ_IDX(channel)] = NCT6694_FREQ_TO_REG(val);
> +
> +		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
> +					 NCT6694_HWMON_CMD0_OFFSET,
> +					 NCT6694_HWMON_CMD0_LEN,
> +					 data->hwmon_en);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct6694_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_in:	/* in mV */
> +		return nct6694_in_read(dev, attr, channel, val);
> +	case hwmon_temp:/* in mC */
> +		return nct6694_temp_read(dev, attr, channel, val);
> +	case hwmon_fan:	/* in RPM */
> +		return nct6694_fan_read(dev, attr, channel, val);
> +	case hwmon_pwm:	/* in value 0~255 */
> +		return nct6694_pwm_read(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct6694_write(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long val)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		return nct6694_in_write(dev, attr, channel, val);
> +	case hwmon_temp:
> +		return nct6694_temp_write(dev, attr, channel, val);
> +	case hwmon_fan:
> +		return nct6694_fan_write(dev, attr, channel, val);
> +	case hwmon_pwm:
> +		return nct6694_pwm_write(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t nct6694_is_visible(const void *data,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_enable:
> +		case hwmon_in_max:
> +		case hwmon_in_min:
> +			return 0644;
> +		case hwmon_in_alarm:
> +		case hwmon_in_input:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_enable:
> +		case hwmon_temp_max:
> +		case hwmon_temp_max_hyst:
> +			return 0644;
> +		case hwmon_temp_input:
> +		case hwmon_temp_max_alarm:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_enable:
> +		case hwmon_fan_min:
> +			return 0644;
> +		case hwmon_fan_input:
> +		case hwmon_fan_min_alarm:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_enable:
> +		case hwmon_pwm_freq:
> +		case hwmon_pwm_input:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct hwmon_ops nct6694_hwmon_ops = {
> +	.is_visible = nct6694_is_visible,
> +	.read = nct6694_read,
> +	.write = nct6694_write,
> +};
> +
> +static const struct hwmon_chip_info nct6694_chip_info = {
> +	.ops = &nct6694_hwmon_ops,
> +	.info = nct6694_info,
> +};
> +
> +static int nct6694_hwmon_init(struct nct6694_hwmon_data *data)
> +{
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +

Not significant, but this is unnecessary because the function is only
called once from probe.

> +	/*
> +	 *  Record each Hardware Monitor Channel enable status
> +	 *  and PWM frequency register
> +	 */
> +	ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +			       NCT6694_HWMON_CMD0_OFFSET,
> +			       NCT6694_HWMON_CMD0_LEN,
> +			       data->hwmon_en);
> +	if (ret)
> +		return ret;
> +
> +	/* Set Fan input Real Time alarm mode */
> +	ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +			       NCT6694_HWMON_CMD2_OFFSET,
> +			       NCT6694_HWMON_CMD2_LEN,
> +			       data->xmit_buf);
> +	if (ret)
> +		return ret;
> +
> +	data->xmit_buf[NCT6694_SMI_CTRL_IDX] = 0x02;
> +
> +	return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				 NCT6694_HWMON_CMD2_OFFSET,
> +				 NCT6694_HWMON_CMD2_LEN,
> +				 data->xmit_buf);
> +}
> +
> +static int nct6694_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct nct6694_hwmon_data *data;
> +	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->xmit_buf = devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
> +				      sizeof(unsigned char), GFP_KERNEL);

Wondering ... why not just devm_kzalloc(..,. NCT6694_MAX_PACKET_SZ, ...) ?
sizeof(unsigned char) is always 1, after all.

> +	if (!data->xmit_buf)
> +		return -ENOMEM;
> +
> +	data->nct6694 = nct6694;
> +	mutex_init(&data->lock);
> +	platform_set_drvdata(pdev, data);

This is unnecessary unless I am missing something.

> +
> +	ret = nct6694_hwmon_init(data);
> +	if (ret)
> +		return ret;
> +
> +	/* Register hwmon device to HWMON framework */
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +							 "nct6694", data,
> +							 &nct6694_chip_info,
> +							 NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct platform_driver nct6694_hwmon_driver = {
> +	.driver = {
> +		.name	= "nct6694-hwmon",
> +	},
> +	.probe		= nct6694_hwmon_probe,
> +};
> +
> +module_platform_driver(nct6694_hwmon_driver);
> +
> +MODULE_DESCRIPTION("USB-HWMON driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:nct6694-hwmon");
> -- 
> 2.34.1
> 
> 

