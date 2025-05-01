Return-Path: <linux-i2c+bounces-10721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8395FAA5E53
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 14:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63E3C4C3C00
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 12:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD38B2288EA;
	Thu,  1 May 2025 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rY85XMTI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422431EFFA3;
	Thu,  1 May 2025 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102143; cv=none; b=OYoh0dO452P2walPgNqVe/NuCUDvTlNz/2piGlNRDR31iv0A7WTy2isW5JqLrxDlOfhB5jB4vHXKvWP8r8YxIyjmHTza74AmepbbBPIUh/yPGWrrIJZ/Ijvkndp2toj5Gcm+AXXiAE+MhF7huxSbEURSIKeTjQa//NSOYIr6TzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102143; c=relaxed/simple;
	bh=CHMvBUGmp7PP9u6wrn26Zh6LkyOXYpzbY4BnHG5wesw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iy2bZb8sRxCe51O7NhMu4thGDJybrwelFTONY6uIGvfwe8z5s6MWTyQJufoULXBwYPkIVIqiY1fy4m5gvWPtuhRLQ75EgDadldoKE73noq7t2dXeXBWMz/VimO0xfbV7T3Sv4tlqa1AdQVGRU0ys7EXPvouO8wRRGhkUathfGu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rY85XMTI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08B2C4CEE4;
	Thu,  1 May 2025 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746102141;
	bh=CHMvBUGmp7PP9u6wrn26Zh6LkyOXYpzbY4BnHG5wesw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rY85XMTI6MbZ+LCxioQwyydm/BV/5bdRBS5900pseyqPBzx+6y4nLbIoa7MQm89A1
	 6TkhN7Rz+4vt7mI2OI2ZOqzUORIx0Z/XcQL8MdkV1yRx48WFwxcNd8YLmx4r48kB6k
	 nGVDECPtZ/7D6azN4C5QSV0TfeD8S0g0jqg/hpU5RV930nI5cRGiYkjcwjPY/6GF93
	 urghkRfWvrQgnaT8s7i6G4MamvW/e6amZ7uyv2gVwHei6qzdhdNI56uXVOg5H2hjfM
	 MacFCtzT671ZxJ5yWD3YvmKFQAADo6/LlI32B0wTICXoHkBcvmMJy9lT0DlowYlotE
	 Zv1gGRP5mlJ7g==
Date: Thu, 1 May 2025 13:22:14 +0100
From: Lee Jones <lee@kernel.org>
To: a0282524688@gmail.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
	linux@roeck-us.net, jdelvare@suse.com,
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v10 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250501122214.GK1567507@google.com>
References: <20250423094058.1656204-1-tmyu0@nuvoton.com>
 <20250423094058.1656204-2-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423094058.1656204-2-tmyu0@nuvoton.com>

On Wed, 23 Apr 2025, a0282524688@gmail.com wrote:

> From: Ming Yu <tmyu0@nuvoton.com>
> 
> The Nuvoton NCT6694 provides an USB interface to the host to
> access its features.
> 
> Sub-devices can use the USB functions nct6694_read_msg() and
> nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---

v10 and no change log?  Please add a change log.

>  MAINTAINERS                 |   6 +
>  drivers/mfd/Kconfig         |  15 ++
>  drivers/mfd/Makefile        |   2 +
>  drivers/mfd/nct6694.c       | 387 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/nct6694.h | 101 ++++++++++
>  5 files changed, 511 insertions(+)
>  create mode 100644 drivers/mfd/nct6694.c
>  create mode 100644 include/linux/mfd/nct6694.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa1e04e87d1d..b2dfcc063f88 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17358,6 +17358,12 @@ F:	drivers/nubus/
>  F:	include/linux/nubus.h
>  F:	include/uapi/linux/nubus.h
>  
> +NUVOTON NCT6694 MFD DRIVER
> +M:	Ming Yu <tmyu0@nuvoton.com>
> +S:	Supported
> +F:	drivers/mfd/nct6694.c
> +F:	include/linux/mfd/nct6694.h
> +
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
>  M:	Antonino Daplas <adaplas@gmail.com>
>  L:	linux-fbdev@vger.kernel.org
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 22b936310039..cd4d826a7fcb 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1058,6 +1058,21 @@ config MFD_MENF21BMC
>  	  This driver can also be built as a module. If so the module
>  	  will be called menf21bmc.
>  
> +config MFD_NCT6694
> +	tristate "Nuvoton NCT6694 support"
> +	select MFD_CORE
> +	depends on USB
> +	help
> +	  This enables support for the Nuvoton USB device NCT6694, which shares
> +	  peripherals.
> +	  The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> +	  6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> +	  PWM, and RTC.
> +	  This driver provides core APIs to access the NCT6694 hardware
> +	  monitoring and control features.
> +	  Additional drivers must be enabled to utilize the specific
> +	  functionalities of the device.
> +
>  config MFD_OCELOT
>  	tristate "Microsemi Ocelot External Control Support"
>  	depends on SPI_MASTER
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 948cbdf42a18..471dc1f183b8 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -120,6 +120,8 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
>  obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
>  obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>  
> +obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
> +
>  obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
>  
>  ocelot-soc-objs			:= ocelot-core.o ocelot-spi.o
> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> new file mode 100644
> index 000000000000..2480ca56f350
> --- /dev/null
> +++ b/drivers/mfd/nct6694.c
> @@ -0,0 +1,387 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + *
> + * Nuvoton NCT6694 core driver using USB interface to provide
> + * access to the NCT6694 hardware monitoring and control features.
> + *
> + * The NCT6694 is an integrated controller that provides GPIO, I2C,
> + * CAN, WDT, HWMON and RTC management.
> + *

Superfluous blank line.

> + */
> +
> +#include <linux/bits.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +
> +static const struct mfd_cell nct6694_devs[] = {
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),

These are all identical.

I thought you were going to use PLATFORM_DEVID_AUTO?  In fact, you are
already using PLATFORM_DEVID_AUTO since you are calling
mfd_add_hotplug_devices().  So you don't need this IDs.

MFD_CELL_NAME() should do.

> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> +
> +	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 1),
> +
> +	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 1),
> +
> +	MFD_CELL_NAME("nct6694-hwmon"),
> +	MFD_CELL_NAME("nct6694-rtc"),
> +};

[...]

> diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> new file mode 100644
> index 000000000000..7a02e5b14bbb
> --- /dev/null
> +++ b/include/linux/mfd/nct6694.h
> @@ -0,0 +1,101 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + *
> + * Nuvoton NCT6694 USB transaction and data structure.
> + *

Remove this line please.

> + */
> +
> +#ifndef __MFD_NCT6694_H
> +#define __MFD_NCT6694_H
> +
> +#define NCT6694_VENDOR_ID	0x0416
> +#define NCT6694_PRODUCT_ID	0x200B
> +#define NCT6694_INT_IN_EP	0x81
> +#define NCT6694_BULK_IN_EP	0x02
> +#define NCT6694_BULK_OUT_EP	0x03
> +
> +#define NCT6694_HCTRL_SET	0x40
> +#define NCT6694_HCTRL_GET	0x80
> +
> +#define NCT6694_URB_TIMEOUT	1000
> +
> +enum nct6694_irq_id {
> +	NCT6694_IRQ_GPIO0 = 0,
> +	NCT6694_IRQ_GPIO1,
> +	NCT6694_IRQ_GPIO2,
> +	NCT6694_IRQ_GPIO3,
> +	NCT6694_IRQ_GPIO4,
> +	NCT6694_IRQ_GPIO5,
> +	NCT6694_IRQ_GPIO6,
> +	NCT6694_IRQ_GPIO7,
> +	NCT6694_IRQ_GPIO8,
> +	NCT6694_IRQ_GPIO9,
> +	NCT6694_IRQ_GPIOA,
> +	NCT6694_IRQ_GPIOB,
> +	NCT6694_IRQ_GPIOC,
> +	NCT6694_IRQ_GPIOD,
> +	NCT6694_IRQ_GPIOE,
> +	NCT6694_IRQ_GPIOF,
> +	NCT6694_IRQ_CAN0,
> +	NCT6694_IRQ_CAN1,
> +	NCT6694_IRQ_RTC,
> +	NCT6694_NR_IRQS,
> +};
> +
> +enum nct6694_response_err_status {
> +	NCT6694_NO_ERROR = 0,
> +	NCT6694_FORMAT_ERROR,
> +	NCT6694_RESERVED1,
> +	NCT6694_RESERVED2,
> +	NCT6694_NOT_SUPPORT_ERROR,
> +	NCT6694_NO_RESPONSE_ERROR,
> +	NCT6694_TIMEOUT_ERROR,
> +	NCT6694_PENDING,
> +};
> +
> +struct __packed nct6694_cmd_header {
> +	u8 rsv1;
> +	u8 mod;
> +	union __packed {
> +		__le16 offset;
> +		struct __packed {
> +			u8 cmd;
> +			u8 sel;
> +		};
> +	};
> +	u8 hctrl;
> +	u8 rsv2;
> +	__le16 len;
> +};
> +
> +struct __packed nct6694_response_header {
> +	u8 sequence_id;
> +	u8 sts;
> +	u8 reserved[4];
> +	__le16 len;
> +};
> +
> +union __packed nct6694_usb_msg {
> +	struct nct6694_cmd_header cmd_header;
> +	struct nct6694_response_header response_header;
> +};
> +
> +struct nct6694 {
> +	struct device *dev;
> +	struct irq_domain *domain;
> +	/* Mutex to protect access to the device */

Place these single line comments on the end of the line you're commenting.

Actually, considering the nomenclature here, they're probably not
required at all.

> +	struct mutex access_lock;
> +	/* Mutex to protect access to the IRQ */
> +	struct mutex irq_lock;
> +	struct urb *int_in_urb;
> +	struct usb_device *udev;
> +	union nct6694_usb_msg *usb_msg;
> +	unsigned char *int_buffer;
> +	unsigned int irq_enable;
> +};
> +
> +int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
> +int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
> +
> +#endif
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

