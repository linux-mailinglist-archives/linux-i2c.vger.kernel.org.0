Return-Path: <linux-i2c+bounces-10208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557DA80B80
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 15:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B889150261F
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 13:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A14E28151F;
	Tue,  8 Apr 2025 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZBWIuaTx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977BB26E17E;
	Tue,  8 Apr 2025 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116905; cv=none; b=q1aqeeEulPEJEZDvCuGW8B2De2REf075kmGFI/b+tt0OPZgUb8nagsOdODjYvZxQEvzGgRpdWBvI+kz02Egwul9zbLYvrUuS3cHPX1iz0q66UHea/sHaiHUPrkyoCWE0pIeD+lB9jrzOzemxvA050AVuYCvze7J4JeMh6pAd3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116905; c=relaxed/simple;
	bh=/84ukSlCVaOyj+Jg4UCVZk1Hls0iBIuUxNCWa0HsDQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJ6WFS5NBmusucHCAEWt1pc5sYACQE8vLoWKV5Hix0LNJlQqt3UvGXAPaCorPkE3V/6kRXJ3Wmxwe1CTy4KYcQrhfdu5hyG1oz48AomrLuerVqbmvoBtn56VP1Gc3f5TibfUSaAQ2kNCX8cE0ipJ8tmKnLF/Arwl+s3YhsuYODs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZBWIuaTx; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCFC120485;
	Tue,  8 Apr 2025 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744116899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K0LjqMnTVjmlsCDb+4rrav94UGGwyJeS3mNIumqCmLs=;
	b=ZBWIuaTxNHYAlnYPBN/QSnNOE/ucCKdlNJuNyuU4LD0xh1Dhv9Ur53+gyshzttYupvmBdy
	+XJU0tpDVJThn5trNuwjOE2ysO+kAHWSMkKkLxIVd+FWI1zwMkPepeGFB99aM0yGFwwCi1
	1INIpfHmsLiukhi/uFsE/CEtuXHa8PZqRHqruhyU8AjL/c9JN8WUw/ZYA8iYUBthXtCodJ
	Y8DEz4jAg3RwTmjtNiMp0StWnIfW56h3a6AHyF6u2XyzrO2jhg9WdeFWHTwaDUGFbIQbHd
	0T1YLHRZ7+UT2B4Aw8Xs+b3RCROvmWPRR/MnZ7S5vzNUiKXRPzcRpfuFOAF3Ig==
Date: Tue, 8 Apr 2025 14:54:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 7/7] rtc: Add Nuvoton NCT6694 RTC support
Message-ID: <202504081254567e7facbc@mail.local>
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-8-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207074502.1055111-8-a0282524688@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopegrtddvkedvhedvgeeikeeksehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhmhihutdesnhhuvhhothhonhdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnu
 hhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmkhhlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehmrghilhhhohhlrdhvihhntggvnhhtseifrghnrgguohhordhfrh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 07/02/2025 15:45:02+0800, Ming Yu wrote:
> This driver supports RTC functionality for NCT6694 MFD device
> based on USB interface.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  MAINTAINERS               |   1 +
>  drivers/rtc/Kconfig       |  10 ++
>  drivers/rtc/Makefile      |   1 +
>  drivers/rtc/rtc-nct6694.c | 286 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 298 insertions(+)
>  create mode 100644 drivers/rtc/rtc-nct6694.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a9eda4530b07..7eba4ffdc877 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16927,6 +16927,7 @@ F:	drivers/hwmon/nct6694-hwmon.c
>  F:	drivers/i2c/busses/i2c-nct6694.c
>  F:	drivers/mfd/nct6694.c
>  F:	drivers/net/can/usb/nct6694_canfd.c
> +F:	drivers/rtc/rtc-nct6694.c
>  F:	drivers/watchdog/nct6694_wdt.c
>  F:	include/linux/mfd/nct6694.h
>  
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 0bbbf778ecfa..248425bf26f3 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -416,6 +416,16 @@ config RTC_DRV_NCT3018Y
>  	   This driver can also be built as a module, if so, the module will be
>  	   called "rtc-nct3018y".
>  
> +config RTC_DRV_NCT6694
> +	tristate "Nuvoton NCT6694 RTC support"
> +	depends on MFD_NCT6694
> +	help
> +	  If you say yes to this option, support will be included for Nuvoton
> +	  NCT6694, a USB device to RTC.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called rtc-nct6694.
> +
>  config RTC_DRV_RK808
>  	tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
>  	depends on MFD_RK8XX
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 489b4ab07068..d0d6f4a4972e 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -118,6 +118,7 @@ obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
>  obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
>  obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
>  obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
> +obj-$(CONFIG_RTC_DRV_NCT6694)	+= rtc-nct6694.o
>  obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
>  obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
>  obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
> diff --git a/drivers/rtc/rtc-nct6694.c b/drivers/rtc/rtc-nct6694.c
> new file mode 100644
> index 000000000000..892674d453d1
> --- /dev/null
> +++ b/drivers/rtc/rtc-nct6694.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 RTC driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/bcd.h>
> +#include <linux/irqdomain.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +#include <linux/slab.h>
> +
> +/*
> + * USB command module type for NCT6694 RTC controller.
> + * This defines the module type used for communication with the NCT6694
> + * RTC controller over the USB interface.
> + */
> +#define NCT6694_RTC_MOD		0x08
> +
> +/* Command 00h - RTC Time */
> +#define NCT6694_RTC_TIME	0x0000
> +#define NCT6694_RTC_TIME_SEL	0x00
> +
> +/* Command 01h - RTC Alarm */
> +#define NCT6694_RTC_ALARM	0x01
> +#define NCT6694_RTC_ALARM_SEL	0x00
> +
> +/* Command 02h - RTC Status */
> +#define NCT6694_RTC_STATUS	0x02
> +#define NCT6694_RTC_STATUS_SEL	0x00
> +
> +#define NCT6694_RTC_IRQ_INT_EN	BIT(0)	/* Transmit a USB INT-in when RTC alarm */
> +#define NCT6694_RTC_IRQ_GPO_EN	BIT(5)	/* Trigger a GPO Low Pulse when RTC alarm */
> +
> +#define NCT6694_RTC_IRQ_EN	(NCT6694_RTC_IRQ_INT_EN | NCT6694_RTC_IRQ_GPO_EN)
> +#define NCT6694_RTC_IRQ_STS	BIT(0)	/* Write 1 clear IRQ status */
> +
> +struct __packed nct6694_rtc_time {
> +	u8 sec;
> +	u8 min;
> +	u8 hour;
> +	u8 week;
> +	u8 day;
> +	u8 month;
> +	u8 year;
> +};
> +
> +struct __packed nct6694_rtc_alarm {
> +	u8 sec;
> +	u8 min;
> +	u8 hour;
> +	u8 alarm_en;
> +	u8 alarm_pend;
> +};
> +
> +struct __packed nct6694_rtc_status {
> +	u8 irq_en;
> +	u8 irq_pend;
> +};
> +
> +union __packed nct6694_rtc_msg {
> +	struct nct6694_rtc_time time;
> +	struct nct6694_rtc_alarm alarm;
> +	struct nct6694_rtc_status sts;
> +};
> +
> +struct nct6694_rtc_data {
> +	struct nct6694 *nct6694;
> +	struct rtc_device *rtc;
> +	union nct6694_rtc_msg *msg;
> +};
> +
> +static int nct6694_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
> +	struct nct6694_rtc_time *time = &data->msg->time;
> +	static const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_RTC_MOD,
> +		.cmd = NCT6694_RTC_TIME,
> +		.sel = NCT6694_RTC_TIME_SEL,
> +		.len = cpu_to_le16(sizeof(*time))
> +	};
> +	int ret;
> +
> +	ret = nct6694_read_msg(data->nct6694, &cmd_hd, time);
> +	if (ret)
> +		return ret;
> +
> +	tm->tm_sec = bcd2bin(time->sec);		/* tm_sec expect 0 ~ 59 */
> +	tm->tm_min = bcd2bin(time->min);		/* tm_min expect 0 ~ 59 */
> +	tm->tm_hour = bcd2bin(time->hour);		/* tm_hour expect 0 ~ 23 */
> +	tm->tm_wday = bcd2bin(time->week) - 1;		/* tm_wday expect 0 ~ 6 */
> +	tm->tm_mday = bcd2bin(time->day);		/* tm_mday expect 1 ~ 31 */
> +	tm->tm_mon = bcd2bin(time->month) - 1;		/* tm_month expect 0 ~ 11 */
> +	tm->tm_year = bcd2bin(time->year) + 100;	/* tm_year expect since 1900 */
> +
> +	return ret;
> +}
> +
> +static int nct6694_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
> +	struct nct6694_rtc_time *time = &data->msg->time;
> +	static const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_RTC_MOD,
> +		.cmd = NCT6694_RTC_TIME,
> +		.sel = NCT6694_RTC_TIME_SEL,
> +		.len = cpu_to_le16(sizeof(*time))
> +	};
> +
> +	time->sec = bin2bcd(tm->tm_sec);
> +	time->min = bin2bcd(tm->tm_min);
> +	time->hour = bin2bcd(tm->tm_hour);
> +	time->week = bin2bcd(tm->tm_wday + 1);
> +	time->day = bin2bcd(tm->tm_mday);
> +	time->month = bin2bcd(tm->tm_mon + 1);
> +	time->year = bin2bcd(tm->tm_year - 100);
> +
> +	return nct6694_write_msg(data->nct6694, &cmd_hd, time);
> +}
> +
> +static int nct6694_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
> +	struct nct6694_rtc_alarm *alarm = &data->msg->alarm;
> +	static const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_RTC_MOD,
> +		.cmd = NCT6694_RTC_ALARM,
> +		.sel = NCT6694_RTC_ALARM_SEL,
> +		.len = cpu_to_le16(sizeof(*alarm))
> +	};
> +	int ret;
> +
> +	ret = nct6694_read_msg(data->nct6694, &cmd_hd, alarm);
> +	if (ret)
> +		return ret;
> +
> +	alrm->time.tm_sec = bcd2bin(alarm->sec);
> +	alrm->time.tm_min = bcd2bin(alarm->min);
> +	alrm->time.tm_hour = bcd2bin(alarm->hour);
> +	alrm->enabled = alarm->alarm_en;
> +	alrm->pending = alarm->alarm_pend;
> +
> +	return ret;
> +}
> +
> +static int nct6694_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
> +	struct nct6694_rtc_alarm *alarm = &data->msg->alarm;
> +	static const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_RTC_MOD,
> +		.cmd = NCT6694_RTC_ALARM,
> +		.sel = NCT6694_RTC_ALARM_SEL,
> +		.len = cpu_to_le16(sizeof(*alarm))
> +	};
> +
> +	alarm->sec = bin2bcd(alrm->time.tm_sec);
> +	alarm->min = bin2bcd(alrm->time.tm_min);
> +	alarm->hour = bin2bcd(alrm->time.tm_hour);
> +	alarm->alarm_en = alrm->enabled ? NCT6694_RTC_IRQ_EN : 0;
> +	alarm->alarm_pend = 0;
> +
> +	return nct6694_write_msg(data->nct6694, &cmd_hd, alarm);
> +}
> +
> +static int nct6694_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
> +	struct nct6694_rtc_status *sts = &data->msg->sts;
> +	static const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_RTC_MOD,
> +		.cmd = NCT6694_RTC_STATUS,
> +		.sel = NCT6694_RTC_STATUS_SEL,
> +		.len = cpu_to_le16(sizeof(*sts))
> +	};
> +
> +	if (enabled)
> +		sts->irq_en |= NCT6694_RTC_IRQ_EN;
> +	else
> +		sts->irq_en &= ~NCT6694_RTC_IRQ_EN;
> +
> +	sts->irq_pend = 0;
> +
> +	return nct6694_write_msg(data->nct6694, &cmd_hd, sts);
> +}
> +
> +static const struct rtc_class_ops nct6694_rtc_ops = {
> +	.read_time = nct6694_rtc_read_time,
> +	.set_time = nct6694_rtc_set_time,
> +	.read_alarm = nct6694_rtc_read_alarm,
> +	.set_alarm = nct6694_rtc_set_alarm,
> +	.alarm_irq_enable = nct6694_rtc_alarm_irq_enable,
> +};
> +
> +static irqreturn_t nct6694_irq(int irq, void *dev_id)
> +{
> +	struct nct6694_rtc_data *data = dev_id;
> +	struct nct6694_rtc_status *sts = &data->msg->sts;
> +	static const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_RTC_MOD,
> +		.cmd = NCT6694_RTC_STATUS,
> +		.sel = NCT6694_RTC_STATUS_SEL,
> +		.len = cpu_to_le16(sizeof(*sts))
> +	};
> +	int ret;
> +
> +	rtc_lock(data->rtc);
> +
> +	sts->irq_en = NCT6694_RTC_IRQ_EN;
> +	sts->irq_pend = NCT6694_RTC_IRQ_STS;
> +	ret = nct6694_write_msg(data->nct6694, &cmd_hd, sts);
> +	if (ret) {
> +		rtc_unlock(data->rtc);
> +		return IRQ_NONE;
> +	}
> +
> +	rtc_update_irq(data->rtc, 1, RTC_IRQF | RTC_AF);
> +
> +	rtc_unlock(data->rtc);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int nct6694_rtc_probe(struct platform_device *pdev)
> +{
> +	struct nct6694_rtc_data *data;
> +	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +	int ret, irq;
> +
> +	irq = irq_create_mapping(nct6694->domain, NCT6694_IRQ_RTC);
> +	if (!irq)
> +		return -EINVAL;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->msg = devm_kzalloc(&pdev->dev, sizeof(union nct6694_rtc_msg),
> +				 GFP_KERNEL);
> +	if (!data->msg)
> +		return -ENOMEM;
> +
> +	data->rtc = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(data->rtc))
> +		return PTR_ERR(data->rtc);
> +
> +	data->nct6694 = nct6694;
> +	data->rtc->ops = &nct6694_rtc_ops;
> +	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +					nct6694_irq, IRQF_ONESHOT,
> +					"rtc-nct6694", data);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to request irq\n");
> +
> +	ret = devm_rtc_register_device(data->rtc);
> +	if (ret)
> +		return ret;
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	return 0;
> +}
> +
> +static struct platform_driver nct6694_rtc_driver = {
> +	.driver = {
> +		.name	= "rtc-nct6694",
> +	},
> +	.probe		= nct6694_rtc_probe,
> +};
> +
> +module_platform_driver(nct6694_rtc_driver);
> +
> +MODULE_DESCRIPTION("USB-RTC driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:nct6694-rtc");
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

