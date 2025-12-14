Return-Path: <linux-i2c+bounces-14530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8BCBB581
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Dec 2025 01:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54F0D30014D4
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Dec 2025 00:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229CE2C21D8;
	Sun, 14 Dec 2025 00:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCCqmTzQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A052C11D0
	for <linux-i2c@vger.kernel.org>; Sun, 14 Dec 2025 00:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765673665; cv=none; b=QNKIQ6Dxf3kYWtNRP4pp+pNSCZl3qCfItvBSzmPF3pfAwV8p0Xf7r5wPPOpPhfhJ1UZYeEJvE0F0hAw4SIpMxVZ1GnHx4QQDEY4HQtqMblNk+WdhO95ApiAYOVy6ps4GnEE8IhCi60GUMRw29cJeMqJg/CNeRX05ooy9U5mI//I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765673665; c=relaxed/simple;
	bh=ERnGOFeUU+FQpv7jY6ycnDkzi1PWq3mrRjKSp8p+Tno=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUONStLZsuIn17GYeIRoC+pg3fyzd+wnR6h3CLimv15bfkwkLlAkfJhkX4djfB31GCdfD3n1s6/eWN2yjAEr2RrynsAIo4gBh1+Lm57usbdVbLAEXX6epZiKs38n/81NXUzB5MpgDptgkVyT5ESjCHYCwjVvueTlDMnuiN6k+xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCCqmTzQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772B3C4CEF7
	for <linux-i2c@vger.kernel.org>; Sun, 14 Dec 2025 00:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765673665;
	bh=ERnGOFeUU+FQpv7jY6ycnDkzi1PWq3mrRjKSp8p+Tno=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=FCCqmTzQMJfXI+75bKihD5Op6Hx1tue1ECM/xu2+KD1qPMjsbMIGH8/fHaAgwuWMJ
	 0Iva5wpt9NmU5W0rHW9jXZ0iA2zDWD4bcibWyXAXm9JJML4BZWrnqcj09eYVNEAQBg
	 yU8q/bobkKUVbqaUUfwy2OS8ojfUsidNI2ZCx+yjl1+vnggoy9IQBLDgf/qsobnv4c
	 iqfd9lq5DjK9Gf1wTHAQaPrs4B6pQJBWsEgAQ65fYVYyXLJqkbit27U5SqVRxdnoVD
	 Wany39R3Ji8+O0xGDcXPt36gui5eD6hL8E2egkLQTDEmRU7FFFcZpkn7cWn+9g8NH/
	 447RzeFhE/eXw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37b495ce059so16124881fa.0
        for <linux-i2c@vger.kernel.org>; Sat, 13 Dec 2025 16:54:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeRaVe3mjrWPK/xW20tftgj/7W+UzYTLkAecxNH/0ZQRG+QVmVrWGjACjRndKEeEoIKjq1hem9I3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxu9hX7ACiTCFeZSJU9xa+/Z9kwsx6VPKN5bof341TpAkFs57R
	bgVcNmUrSelQrWdUzN2caBrFrdcQfugWj2OiekrbltHf0lubE9CEgCm7tCcs7zT3VH9bhFmkjgc
	5koYfnqD1e5USEh/inz0g5oom7fBf7P2tXFvj6qeRjw==
X-Google-Smtp-Source: AGHT+IF+JTcUODVC8z3ioXKDx5XLzM5A1F8MUCHcdRDUszOJc4X0+0PBaKTTlEDU6RzJck0+mvccxy7H3ksd1gh+4p8=
X-Received: by 2002:a2e:bd12:0:b0:37b:96e5:dc40 with SMTP id
 38308e7fff4ca-37fd0726477mr18776321fa.8.1765673664108; Sat, 13 Dec 2025
 16:54:24 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 13 Dec 2025 19:54:22 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 13 Dec 2025 19:54:22 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20251212-upstream-v1-v1-2-d50d40ec8d8a@advantech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212-upstream-v1-v1-0-d50d40ec8d8a@advantech.com> <20251212-upstream-v1-v1-2-d50d40ec8d8a@advantech.com>
Date: Sat, 13 Dec 2025 19:54:22 -0500
X-Gmail-Original-Message-ID: <CAMRc=McWhREAapUO1C26c7MxFhwsq9=HH7Z8BZabwbB1L5UoBw@mail.gmail.com>
X-Gm-Features: AQt7F2rFZ6NOo1ZqC__JipFGbv1EYlUkIy_oMb4Oy-Kh-pnz_txKQTmUlgiNcFo
Message-ID: <CAMRc=McWhREAapUO1C26c7MxFhwsq9=HH7Z8BZabwbB1L5UoBw@mail.gmail.com>
Subject: Re: [PATCH 2/8] Add Advantech EIO GPIO driver
To: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
	Wenkai Chung <wenkai.chung@advantech.com.tw>, 
	Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
	Hongzhi Wang <hongzhi.wang@advantech.com>, 
	Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
	Thomas Kastner <thomas.kastner@advantech.com>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Dec 2025 17:40:53 +0100, Ramiro Oliveira
<ramiro.oliveira@advantech.com> said:
> This driver controls the GPIO component of the Advantech EIO chip.
>
> Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
> ---
>  MAINTAINERS             |   1 +
>  drivers/gpio/Kconfig    |   6 ++
>  drivers/gpio/Makefile   |   1 +
>  drivers/gpio/gpio-eio.c | 273 ++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 281 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd9279796c2f..359d4a13f212 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -619,6 +619,7 @@ F:	drivers/platform/x86/adv_swbutton.c
>  ADVANTECH EIO DRIVER
>  M:	Ramiro Oliveira <ramiro.oliveira@advantech.com>
>  S:	Maintained
> +F:	drivers/gpio/gpio-eio.c

Instead of churning MAINTAINERS in every patch of the series, I suggest you
add a separate patch adding the full entry at the end.

>  F:	drivers/mfd/eio_core.c
>  F:	include/linux/mfd/eio.h
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index bd185482a7fd..628a914842bd 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -277,6 +277,12 @@ config GPIO_DWAPB
>  	  Say Y or M here to build support for the Synopsys DesignWare APB
>  	  GPIO block.
>
> +config GPIO_EIO
> +	tristate "Advantech EIO GPIO"
> +	depends on MFD_EIO
> +	help
> +	  Say Y or M to build support for Advantech EIO GPIO block.
> +
>  config GPIO_EIC_SPRD
>  	tristate "Spreadtrum EIC support"
>  	depends on ARCH_SPRD || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 2421a8fd3733..ba3883d5e4a0 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
>  obj-$(CONFIG_GPIO_DS4520)		+= gpio-ds4520.o
>  obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
>  obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
> +obj-$(CONFIG_GPIO_EIO)			+= gpio-eio.o
>  obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
>  obj-$(CONFIG_GPIO_EM)			+= gpio-em.o
>  obj-$(CONFIG_GPIO_EN7523)		+= gpio-en7523.o
> diff --git a/drivers/gpio/gpio-eio.c b/drivers/gpio/gpio-eio.c
> new file mode 100644
> index 000000000000..50f66a325e8f
> --- /dev/null
> +++ b/drivers/gpio/gpio-eio.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * GPIO driver for Advantech EIO Embedded controller.
> + *
> + * Copyright (C) 2025 Advantech Corporation. All rights reserved.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/gpio.h>

Don't include this, it's a legacy header as per one of the first lines in this
file.

> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/eio.h>
> +#include <linux/module.h>
> +
> +#define GPIO_MAX_PINS	48
> +#define GPIO_WRITE	0x18
> +#define GPIO_READ	0x19
> +
> +struct eio_gpio_dev {
> +	u64 avail;
> +	int max;
> +	struct gpio_chip chip;
> +	struct device *dev;
> +};
> +
> +struct {
> +	int size;
> +	bool write;
> +} ctrl_para[] = {
> +	{ 0x01, false }, { 0x00, false }, { 0x00, false }, { 0x02, false },
> +	{ 0x01, false }, { 0x00, false }, { 0x00, false }, { 0x00, false },
> +	{ 0x00, false }, { 0x00, false }, { 0x00, false }, { 0x00, false },
> +	{ 0x00, false }, { 0x00, false }, { 0x00, false }, { 0x00, false },
> +	{ 0x01, true  }, { 0x01, true  }, { 0x02, true  }, { 0x02, true  },
> +	{ 0x02, false }, { 0x10, false }
> +};

This should be static.

> +
> +enum {
> +	GPIO_STATUS	 = 0,
> +	GPIO_GROUP_AVAIL = 3,
> +	GPIO_ERROR	 = 0x04,
> +	GPIO_PIN_DIR	 = 0x10,
> +	GPIO_PIN_LEVEL	 = 0x11,
> +	GPIO_GROUP_DIR	 = 0x12,
> +	GPIO_GROUP_LEVEL = 0x13,
> +	GPIO_MAPPING	 = 0x14,
> +	GPIO_NAME	 = 0x15
> +} gpio_ctrl;

Do enum gpio_ctrl {. But also use a common prefix for all symbols in
this driver.

> +
> +struct {
> +	int group;
> +	int port;
> +} group_map[] = {
> +	{ 0, 0 }, { 0, 1 },
> +	{ 1, 0 }, { 1, 1 },
> +	{ 2, 0 }, { 2, 1 },
> +	{ 3, 0 }, { 3, 1 },
> +	{ 3, 2 }, { 3, 3 },
> +	{ 3, 4 }, { 3, 5 },
> +	{ 3, 6 }, { 3, 7 }
> +};
> +
> +static int timeout;
> +module_param(timeout, int, 0444);
> +MODULE_PARM_DESC(timeout, "Set PMC command timeout value.\n");
> +
> +static int pmc_write(struct device *mfd_dev, u8 ctrl, u8 dev_id, void *data)
> +{
> +	struct pmc_op op = {
> +		 .cmd       = GPIO_WRITE,
> +		 .control   = ctrl,
> +		 .device_id = dev_id,
> +		 .payload   = (u8 *)data,
> +		 .timeout   = timeout,
> +	};
> +
> +	if (ctrl > ARRAY_SIZE(ctrl_para))
> +		return -ENOMEM;
> +
> +	if (!ctrl_para[ctrl].write)
> +		return -EINVAL;
> +
> +	op.size = ctrl_para[ctrl].size;
> +
> +	return eio_core_pmc_operation(mfd_dev, &op);
> +}
> +
> +static int pmc_read(struct device *mfd_dev, u8 ctrl, u8 dev_id, void *data)
> +{
> +	struct pmc_op op = {
> +		 .cmd       = GPIO_READ,
> +		 .control   = ctrl,
> +		 .device_id = dev_id,
> +		 .payload   = (u8 *)data,
> +		 .timeout   = timeout,
> +	};
> +
> +	if (ctrl > ARRAY_SIZE(ctrl_para))
> +		return -ENOMEM;
> +
> +	op.size = ctrl_para[ctrl].size;
> +
> +	return eio_core_pmc_operation(mfd_dev, &op);
> +}
> +
> +static int get_dir(struct gpio_chip *chip, unsigned int offset)
> +{
> +	u8 dir;
> +	int ret;
> +
> +	ret = pmc_read(chip->parent, GPIO_PIN_DIR, offset, &dir);
> +	if (ret)
> +		return ret;
> +
> +	return dir ? 0 : 1;
> +}
> +
> +static int dir_input(struct gpio_chip *chip, unsigned int offset)
> +{
> +	u8 dir = 0;
> +
> +	return pmc_write(chip->parent, GPIO_PIN_DIR, offset, &dir);
> +}
> +
> +static int dir_output(struct gpio_chip *chip, unsigned int offset, int value)
> +{
> +	u8 dir = 1;
> +	u8 val = value;
> +
> +	pmc_write(chip->parent, GPIO_PIN_DIR, offset, &dir);
> +
> +	return pmc_write(chip->parent, GPIO_PIN_LEVEL, offset, &val);
> +}
> +
> +static int gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	u8 level;
> +	int ret;
> +
> +	ret = pmc_read(chip->parent, GPIO_PIN_LEVEL, offset, &level);
> +	if (ret)
> +		return ret;
> +
> +	return level;
> +}
> +
> +static int gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +{
> +	u8 val = value;
> +
> +	pmc_write(chip->parent, GPIO_PIN_LEVEL, offset, &val);
> +
> +	return 0;
> +}
> +
> +static int check_support(struct device *dev)
> +{
> +	u8  data;
> +	int ret;
> +
> +	ret = pmc_read(dev, GPIO_STATUS, 0, &data);
> +	if (!ret)
> +		return ret;
> +
> +	if ((data & 0x01) == 0)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static int check_pin(struct device *dev, int pin)
> +{
> +	int ret;
> +	int group, bit;
> +	u16 data;
> +
> +	/* Get pin mapping */
> +	ret = pmc_read(dev, GPIO_MAPPING, pin, &data);
> +	if (ret)
> +		return ret;
> +
> +	if ((data & 0xFF) > ARRAY_SIZE(group_map))
> +		return -EINVAL;
> +
> +	group = group_map[data & 0xFF].group;
> +	bit   = data >> 8;
> +
> +	/* Check mapped pin */
> +	ret = pmc_read(dev, GPIO_GROUP_AVAIL, group, &data);
> +	if (ret)
> +		return ret;
> +
> +	return data & BIT(bit) ? 0 : -EOPNOTSUPP;
> +}
> +
> +static int gpio_init(struct device *mfd, struct eio_gpio_dev *eio_gpio)
> +{
> +	int ret;
> +	int i;

Keep these on the same line.

> +	char str[GPIO_MAX_PINS + 1];
> +
> +	memset(str, 0x30, sizeof(str));
> +
> +	ret = check_support(mfd);
> +	if (ret) {
> +		dev_err(eio_gpio->dev, "GPIO not supported (%d)\n", ret);

return dev_err_probe()

> +		return ret;
> +	}
> +
> +	eio_gpio->avail = 0;
> +
> +	for (i = 0 ; i <  GPIO_MAX_PINS ; i++) {
> +		ret = check_pin(mfd, i);
> +		if (ret)
> +			continue;
> +
> +		eio_gpio->avail |= BIT(i);
> +		eio_gpio->max = i + 1;
> +		str[GPIO_MAX_PINS - i] = '1';
> +	}
> +
> +	dev_info(eio_gpio->dev, "GPIO pins=%s\n", str);
> +

No need to print anything here.

> +	return eio_gpio->max ? 0 : -EOPNOTSUPP;
> +}
> +
> +static const struct gpio_chip eio_gpio_chip = {
> +	.label	 	  = KBUILD_MODNAME,
> +	.owner		  = THIS_MODULE,
> +	.direction_input  = dir_input,
> +	.get		  = gpio_get,
> +	.direction_output = dir_output,
> +	.set		  = gpio_set,
> +	.get_direction	  = get_dir,
> +	.base		  = -1,
> +	.can_sleep	  = true,
> +};

Instead of having an unnecessary copy of the chip in .rodata, just use compound
literals when initiating it in probe().

> +
> +static int gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =  &pdev->dev;
> +	struct eio_gpio_dev *eio_gpio;
> +	struct eio_dev *eio_dev = dev_get_drvdata(dev->parent);
> +
> +	if (!eio_dev) {
> +		dev_err(dev, "Error contact eio_core\n");
> +		return -ENODEV;
> +	}

return dev_err_probe()

> +
> +	eio_gpio = devm_kzalloc(dev, sizeof(*eio_gpio), GFP_KERNEL);

This can fail, please check the return value.

> +	eio_gpio->dev = dev;
> +
> +	if (gpio_init(dev->parent, eio_gpio))
> +		return -EIO;
> +
> +	eio_gpio->chip	   = eio_gpio_chip;

Don't use tabs like that please. Just stick to single spaces.

> +	eio_gpio->chip.parent = dev->parent;
> +	eio_gpio->chip.ngpio  = eio_gpio->max;
> +
> +	return devm_gpiochip_add_data(dev, &eio_gpio->chip, eio_gpio);
> +}
> +
> +static struct platform_driver gpio_driver = {
> +	.probe  = gpio_probe,
> +	.driver = { .name = KBUILD_MODNAME, },
> +};
> +
> +module_platform_driver(gpio_driver);
> +
> +MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
> +MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
> +MODULE_DESCRIPTION("GPIO driver for Advantech EIO embedded controller");
> +MODULE_LICENSE("GPL");
>
> --
> 2.43.0
>
>

