Return-Path: <linux-i2c+bounces-11379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BDDAD72D9
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 16:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1E843A8A50
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 14:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC21A18952C;
	Thu, 12 Jun 2025 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBN8jJ3j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBBC2745E;
	Thu, 12 Jun 2025 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736849; cv=none; b=c57uZvRrXIF1YP2dQ1G1iJCDot+4FrY+Qtfwa0vMJK7CjeuqhV7F+bWBFQB64FEU3T3aSp4NDx2XguyBfqatqi4M87XEmYOtxyfD4oW+u7P4OR2K2lLa2eJ0vuuYERiABiRQkRFhwKckiu6daUUGvzhjN8/gpH+UU9yGq4JdbKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736849; c=relaxed/simple;
	bh=b/HubsKTNPeTRSAp6TCHMgHzCQE3BmzRFQuGAGVx1pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MU0bl7DTV2oUOx7pEaU+pa/0K8V0lkKgEkIHYUkpXLUcAZ7ewYXZn2Au1lU7S4PHkAEu1CWYvok1MdH2vAqgGgRuqu39w9RpeLY1+GuXv10jM+KeE4K2oelwlmEPixirKEdZ0cMezvRpv6sl3Oh0cNJvQf/2jTHFRaSIRRL+1Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBN8jJ3j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C71DC4CEEB;
	Thu, 12 Jun 2025 14:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749736849;
	bh=b/HubsKTNPeTRSAp6TCHMgHzCQE3BmzRFQuGAGVx1pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBN8jJ3j/nD9SkRH3SZ2FjuvzuqbmCx00Z16QXYn7b8lFktXXebNl7vmpa0++ML4v
	 bOxBaHYiP7DdiYLNTvtH1FzmOQDoJLCq/OHvG1C2lCDpMzW9QT6KIkf+XZMkyZEI1Y
	 bLtjIkPrzk7kxSIMFdKjYwBhjekGm+8PuXEzKurCg7k4y/H+VZZP76948rtqznjb6o
	 Wy21rMZ9Y54R74JsZJtB8OA4dgznGaI8n3J7wiX13wRG33spDDVZljvWbTVSS5jCv8
	 qK46AmrpJP8IHJJEa6aGTS+HMRzFdLdZdN5FpLfI81lRoTsu/gzO5+Uq9LOCobFKT7
	 /UEMhZAQ4F0BQ==
Date: Thu, 12 Jun 2025 15:00:41 +0100
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
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250612140041.GF381401@google.com>
References: <20250604041418.1188792-1-tmyu0@nuvoton.com>
 <20250604041418.1188792-2-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604041418.1188792-2-tmyu0@nuvoton.com>

On Wed, 04 Jun 2025, a0282524688@gmail.com wrote:

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
> Changes since version 11:
> - Modify the irq_domain_add_simple() to irq_domain_create_simple()
> - Fix mfd_cell back to v9, and use Use platform_device's id to replace IDA
>   in sub-drivers
> 
> Changes since version 10:
> - Add change log for the patch
> - Fix mfd_cell to MFD_CELL_NAME()
> - Remove unnecessary blank line
> 
> Changes since version 9:
> - Add KernelDoc to exported functions
> 
> Changes since version 8:
> - Modify the signed-off-by with my work address
> - Rename all MFD cell names to "nct6694-xxx"
> - Fix some comments in nct6694.c and in nct6694.h
> 
> Changes since version 7:
> - Add error handling for devm_mutex_init()
> 
> Changes since version 6:
> 
> Changes since version 5:
> - Fix mfd_cell to MFD_CELL_NAME() and MFD_CELL_BASIC()
> - Drop unnecessary macros
> 
> Changes since version 4:
> - Modify arguments in read/write function to a pointer to cmd_header
> 
> Changes since version 3:
> - Modify array buffer to structure
> - Fix defines and comments
> - Add header <linux/bits.h> and use BIT macro
> - Modify mutex_init() to devm_mutex_init()
> 
> Changes since version 2:
> 
> Changes since version 1:
> - Implement IRQ domain to handle IRQ demux
> - Modify USB_DEVICE to USB_DEVICE_AND_INTERFACE_INFO API
> - Add command structure
> - Fix USB functions
> - Sort each driver's header files alphabetically
> 
>  MAINTAINERS                 |   6 +
>  drivers/mfd/Kconfig         |  15 ++
>  drivers/mfd/Makefile        |   2 +
>  drivers/mfd/nct6694.c       | 386 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/nct6694.h |  98 +++++++++
>  5 files changed, 507 insertions(+)
>  create mode 100644 drivers/mfd/nct6694.c
>  create mode 100644 include/linux/mfd/nct6694.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 98201e1f4ab5..29d2d05bac22 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17679,6 +17679,12 @@ F:	drivers/nubus/
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
> index 96992af22565..489c1950f1ac 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1078,6 +1078,21 @@ config MFD_MENF21BMC
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
> index 5e5cc279af60..a96204d938fc 100644
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
> index 000000000000..82d378ee47ed
> --- /dev/null
> +++ b/drivers/mfd/nct6694.c
> @@ -0,0 +1,386 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Nuvoton Technology Corp.
> + *
> + * Nuvoton NCT6694 core driver using USB interface to provide
> + * access to the NCT6694 hardware monitoring and control features.
> + *
> + * The NCT6694 is an integrated controller that provides GPIO, I2C,
> + * CAN, WDT, HWMON and RTC management.
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
> +
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),

Why have we gone back to this silly numbering scheme?

What happened to using IDA in the child driver?

> +
> +	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 1),
> +
> +	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 1),
> +
> +	MFD_CELL_NAME("nct6694-hwmon"),
> +
> +	MFD_CELL_NAME("nct6694-rtc"),
> +};

-- 
Lee Jones [李琼斯]

