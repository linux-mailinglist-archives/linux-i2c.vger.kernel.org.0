Return-Path: <linux-i2c+bounces-8125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF039D4EA1
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 15:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4298283104
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 14:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE2A1D8A08;
	Thu, 21 Nov 2024 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYnUampt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757BF1369B4;
	Thu, 21 Nov 2024 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732198964; cv=none; b=DAz5cYP5n+Hzd4+qfxDucdAk2Jc70AmLJJfzb9Rph4fsle4QAJgdyJR1Bvb/YWHvK7cNvxB1iiqlNG2L4e5zRYO6pRFIqgyBNWRvq0alSh2wYOAXo568/M//WkKbTJ4wPFO0LlPXHw7eMQLJV+JK1IRlfqkmwHif0Zj7XqhXpXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732198964; c=relaxed/simple;
	bh=rLt6K7GF6AWADXrhRyFyxcdauGA1RmBZQkdSB7qwt98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cb+y4Q22Cm3fdTvFe6ljWZxlLPKRxndVS7Y7q7Twb/IAaY0h48UvwXRkW6Qrov/EUOcI+XKhoVkNxTEiogx8IBo8N4jbdsp3r+FfueW1FzAWYCNaFQLP1B8sjteJEpJnLvYNhaKmUlWC/4l/klotiVyc1sa4eqOWBrN2IEv0Noc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYnUampt; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7246c8b89b4so1541713b3a.1;
        Thu, 21 Nov 2024 06:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732198962; x=1732803762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QsYOpCmsSPmCS2WpvnLfL2ZPfoBE0p5WPVOClxGpsWg=;
        b=DYnUamptUyAw0F/qezPutilmHS/BSFKE9ygjxaGWpOi5c+QPcrMzF5V8FnRrcQM2uR
         PAuaV7PrDlVoOwn5zKhp5Ah6AyTnuhrNq3jMXtMZci6y6krbIs8gwT0pZw0bgjwPlVKd
         3YVb2FBEj986xlgxgWCNtTzQWZu2yevcbTPZJL9hsA6LX421vcT0i8QAp0FbKcQPSSS8
         pwlA7w1gcFI0Ay4oB1e9KPILfOqQz6TfKyKt5owHJ1wnz5Yu9oLw3886xcZ1pyXs6Mdm
         ufrq68fr0D1NPoliLsqp2xE5+KJpx/KizDuSMJvPce8PNFzjItfRMSoge6OpnViaVvE9
         7kNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732198962; x=1732803762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsYOpCmsSPmCS2WpvnLfL2ZPfoBE0p5WPVOClxGpsWg=;
        b=qCOgiJxv8trmNPORveXjbqGTa1qCJZb45Fd2BlijSRDGUr8PHtiMafORMwXbM0PZnA
         rko0+jLLaeGUIRCAtpRByCxk7A5IrcHCFDOs/AfaE//+VmAQxCSWlvrvG4aCap78PfWj
         l6PMDBe07nWdfIstkMPDC9s5k3H+VD0EbM/kvwSdFFhBDDZZbMo56XD6T2C3Vr8qRnr/
         M6+FrlT8iVhhTZn8HAZ6kdxGJ+zie2Fu9l3yxj1c2Ktfum+pY43S+Gf38vPUUobYjsir
         4yuM2diDjVdF3cci3TmKR+t/VA5qE/qYi5+iZsvjqCVu9QahRE1zQVIhA3ygkx1SBmiM
         fK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAejykKGdsi9GVlqTm1dGnXXVInxEbqLih6W0UFwYkPAzHTatpwC378MFW0evmO/Ueh12QpTt1hro=@vger.kernel.org, AJvYcCVS0jRvk/coNMu7rDvCO4APNgAlAkiiMzABXGOSY1sbGfatcJc21G0pTXVEeIVxP2pE7kPV4Tmmvv95@vger.kernel.org, AJvYcCW7CAK8UWiy8R9iFjEzu0mUV6JAsC7b9JVryhFTlE6+6m3904UvpO5P6KtLXM4z0Qnx9h4rvePBpmonRQ==@vger.kernel.org, AJvYcCWIKcwCtik6YGwSi/hPFazxxR1iohqB4IGEN/5NO4MchN4mgz+gWRKqR5cks8vAePYX8/Mv4rgB@vger.kernel.org, AJvYcCWLsfccBJn+ZEqvF3/GLWqGrhTA0vQkLt1KVXR5i2f9wmDhmyEi6xGenLYeizoHqomS1xQd9jqOiOoX@vger.kernel.org, AJvYcCWQqVH9sNqaRS0srGwhzxpXnOcL+h2HQHLfiPOwTduB8nTw7+MNrtCwk/fiRcJ9KJsGQSOVGxfitynaJBnR1js=@vger.kernel.org, AJvYcCXLQmp3qyn2jNOkDs/uweGfW+xMHimGz+RhWsTLTqjIzKRN4KfExas+/lncBX9NfdOZ5kDD7a8l8PLEb64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJB13xxzbnPoylIO6QUmyipHtcQxRO88PZumYVAXJS/ttspfre
	4/i+uPIwaKkoaw9MRSbZoDnorpgC6t2odpzVJVx5CvOnQzYx/kFO
X-Gm-Gg: ASbGncvDgYk6jYg7zkJ1wf9j+fGkaYOmidoLWblUf4o4PHJ232EBK8uhxe24rLifqOY
	vzDvf0vv+Wefl4oRzigYL/ZuBodzCElGucjgGfEh5ta/5H5B9OG4ZsEmecjrLg7MAbpgXkZV85g
	+8gZtA46lqUNQhF5eZ4qubvUdly2zP7SLYDfsG6C0A1aaWp/H5/9r6EAR+nncxS5siQQgIe3CrC
	V+H4lYfjjVln/SEeh8viguEvijM92y6q//93jf7r72kf53Gwo26lbnvb+aC0gVR0iijjyg54FwF
	dP58URl8WkDmWSdBf7+lnxA=
X-Google-Smtp-Source: AGHT+IGzymHuBRVlfYkPQJNWLDtvA5B9aqyTY2Q0GCcsgLzfvS0UFege28fLeXA2Br2visAjKyflsQ==
X-Received: by 2002:a17:902:ce03:b0:20b:a41f:6e4d with SMTP id d9443c01a7336-21283c94e57mr50621195ad.15.1732198961431;
        Thu, 21 Nov 2024 06:22:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2128788addesm14138255ad.3.2024.11.21.06.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 06:22:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c1ff92a6-8ad9-43fa-97af-12b1471b5bef@roeck-us.net>
Date: Thu, 21 Nov 2024 06:22:38 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
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
 <20241121064046.3724726-7-tmyu0@nuvoton.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241121064046.3724726-7-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/24 22:40, Ming Yu wrote:
> This driver supports Hardware monitor functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>   MAINTAINERS                   |   1 +
>   drivers/hwmon/Kconfig         |  10 +
>   drivers/hwmon/Makefile        |   1 +
>   drivers/hwmon/nct6694-hwmon.c | 771 ++++++++++++++++++++++++++++++++++
>   4 files changed, 783 insertions(+)
>   create mode 100644 drivers/hwmon/nct6694-hwmon.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 496fe7d5a23f..d6414eea0463 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16546,6 +16546,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
>   L:	linux-kernel@vger.kernel.org
>   S:	Supported
>   F:	drivers/gpio/gpio-nct6694.c
> +F:	drivers/hwmon/nct6694-hwmon.c
>   F:	drivers/i2c/busses/i2c-nct6694.c
>   F:	drivers/mfd/nct6694.c
>   F:	drivers/net/can/nct6694_canfd.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index dd376602f3f1..df40986424bd 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1636,6 +1636,16 @@ config SENSORS_NCT6683
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nct6683.
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
>   config SENSORS_NCT6775_CORE
>   	tristate
>   	select REGMAP
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b827b92f2a78..27a43e67cdb7 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -168,6 +168,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
>   obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
>   obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
>   obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
> +obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
>   obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
>   nct6775-objs			:= nct6775-platform.o
>   obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
> diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
> new file mode 100644
> index 000000000000..f24cc22b8b42
> --- /dev/null
> +++ b/drivers/hwmon/nct6694-hwmon.c
> @@ -0,0 +1,771 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 HWMON driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
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
> +	return val / 16;
> +}
> +
> +static inline long temp_from_reg(u8 reg)
> +{
> +	return reg * 1000;
> +}
> +
> +static inline u8 temp_to_reg(long val)
> +{
> +	return val / 1000;
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
> +		*val = vin_en & BIT(channel % 8) ? 1 : 0;

Nit: !!(vin_en & BIT(channel % 8))

Not even worth mentioning, but !! is used below, so it would make sense
to use it here as well for consistency.

> +
> +		return 0;
> +	case hwmon_in_input:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> +				       NCT6694_VIN_IDX(channel), 1,
> +				       data->xmit_buf);
> +		if (ret)
> +			return ret;
> + > +		*val = in_from_reg(data->xmit_buf[0]);
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
> +		*val = temp_en & BIT(channel % 8) ? 1 : 0;
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
> +		*val = fanin_en & BIT(channel % 8) ? 1 : 0;
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
> +
> +		return 0;
> +	case hwmon_fan_min_alarm:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> +				       NCT6694_FIN_STS(channel / 8),
> +				       1, data->xmit_buf);
> +		if (ret)
> +			return ret;
> +
> +		*val = data->xmit_buf[0] & BIT(channel % 8);
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
> +		*val = pwm_en & BIT(channel % 8) ? 1 : 0;
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
> +		if (temp_hyst < 0 || temp_hyst > 7)
> +			return -EINVAL;
> +

Just use clamp_val() again. Otherwise it is difficult for the user to determine
valid ranges.

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
> +		if (val <= 0)
> +			return -EINVAL;
> +
I'd suggest to just use clamp_val() and drop this check.

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
> +	if (!data->xmit_buf)
> +		return -ENOMEM;
> +
> +	data->nct6694 = nct6694;
> +	mutex_init(&data->lock);
> +	platform_set_drvdata(pdev, data);
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


