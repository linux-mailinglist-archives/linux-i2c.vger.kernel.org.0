Return-Path: <linux-i2c+bounces-9751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0DCA55CF2
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Mar 2025 02:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6390A18863B4
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Mar 2025 01:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7987515B99E;
	Fri,  7 Mar 2025 01:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aekRaXtW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EDD184E;
	Fri,  7 Mar 2025 01:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741310146; cv=none; b=AOcVy9nVBla6P++CuLVHjlhjrpkv0MlAEcva+N7aZmWEKfnkE+mDvJY4BV42GTFMvecXhqZBYstH4h4T7dm4FIg3XWESFYwY/lOEPy7BqRBMi0ur1XL/FYV7kv+CKD4+BAE7eOaJiBQTHq0ManN7hIizW/edKyAE83c3zewAROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741310146; c=relaxed/simple;
	bh=bNMIUhhh/RXnwf99mZAYMem+tdjeV/8p4QU6V3jVJR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfuH2J8YkHISuflzN1hoImXBmv3SJZ6J3L1nlNgvE6bKgB+pr3qBkuF4BeENHk2hWKlekNgtdkkpWDec0jvYiI1Vfb8j0fHK1HrNhgJccpSGYaG6XPYTU09eb/IXS7TMLxOVx3NZ9Mke6SvIOT20D09Ekb9A/hNivxv9rWGJeQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aekRaXtW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF99EC4CEE0;
	Fri,  7 Mar 2025 01:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741310144;
	bh=bNMIUhhh/RXnwf99mZAYMem+tdjeV/8p4QU6V3jVJR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aekRaXtWfB1bTMiIpIND4XhzzWiL3Oo9VY8UcIKQrVMpmft1kZhAfRaB3VllW+5ro
	 CcUEzR6bKGGSskD0FPiiduNDYcFohfarR2OwaDwAwEWLa6M9m+b1YrPocC3oJ2+lvW
	 F0YggBMMgoSik766qD1Ogo/zvR1OnUSkvWnSJPtH2VDlKSVoUmvsWmAaXD8BVNsATq
	 hII2fzQW59GTHh5B0fW4bOMrz8lUyV0lNfHXuOnowexaQyepMQrKWQeFUzR2Hp/X0R
	 3Pg0OyvBnJF0LShNiJKCRkm75HpKmfWBFzVqxUIPtJ4V3hx/32OBTqzhE3a42o6ZhA
	 V0fWJq1X+o8JA==
Date: Thu, 6 Mar 2025 17:15:42 -0800
From: Lee Jones <lee@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250307011542.GE8350@google.com>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-2-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225081644.3524915-2-a0282524688@gmail.com>

On Tue, 25 Feb 2025, Ming Yu wrote:

> The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> PWM, and RTC.

This needs to go into the Kconfig help passage.

> This driver implements USB device functionality and shares the
> chip's peripherals as a child device.

This driver doesn't implement USB functionality.

> Each child device can use the USB functions nct6694_read_msg()
> and nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Why aren't you signing off with your work address?

> ---
>  MAINTAINERS                 |   7 +
>  drivers/mfd/Kconfig         |  18 ++
>  drivers/mfd/Makefile        |   2 +
>  drivers/mfd/nct6694.c       | 378 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/nct6694.h | 102 ++++++++++
>  5 files changed, 507 insertions(+)
>  create mode 100644 drivers/mfd/nct6694.c
>  create mode 100644 include/linux/mfd/nct6694.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 873aa2cce4d7..c700a0b96960 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16918,6 +16918,13 @@ F:	drivers/nubus/
>  F:	include/linux/nubus.h
>  F:	include/uapi/linux/nubus.h
>  
> +NUVOTON NCT6694 MFD DRIVER
> +M:	Ming Yu <tmyu0@nuvoton.com>
> +L:	linux-kernel@vger.kernel.org

This is the default list.  You shouldn't need to add that here.

> +S:	Supported
> +F:	drivers/mfd/nct6694.c
> +F:	include/linux/mfd/nct6694.h
> +
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
>  M:	Antonino Daplas <adaplas@gmail.com>
>  L:	linux-fbdev@vger.kernel.org
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6b0682af6e32..c97a2bdcea0b 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1045,6 +1045,24 @@ config MFD_MENF21BMC
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
> +
> +	  This driver provides core APIs to access the NCT6694 hardware
> +	  monitoring and control features.
> +
> +	  The NCT6694 is a versatile multi-function device that supports

Please drop the term multi-function device and replace it what a proper
description of the devices.

> +	  functionalities such as GPIO, I2C, CAN, WDT, HWMON, and RTC
> +	  management.

All of these line breaks should be removed.

> +	  Additional drivers must be enabled to utilize the specific
> +	  functionalities of the device.
> +
>  config MFD_OCELOT
>  	tristate "Microsemi Ocelot External Control Support"
>  	depends on SPI_MASTER
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 9220eaf7cf12..7725b732e265 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -121,6 +121,8 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
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
> index 000000000000..c82457679ca6
> --- /dev/null
> +++ b/drivers/mfd/nct6694.c
> @@ -0,0 +1,378 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 core driver using USB interface to provide
> + * access to the NCT6694 hardware monitoring and control features.
> + *
> + * The NCT6694 is a versatile multi-function device that supports

Here too.

> + * functionalities such as GPIO, I2C, CAN, WDT, HWMON and RTC
> + * management.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.

This goes at the top.

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
> +static const struct mfd_cell nct6694_dev[] = {
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x0),

"-gpio" usually goes on the end.

> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x1),

IDs are usually given in base-10.

Why are you manually adding the device IDs?

PLATFORM_DEVID_AUTO doesn't work for you?

> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x2),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x3),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x4),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x5),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x6),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x7),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x8),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x9),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xA),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xB),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xC),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xD),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xE),
> +	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xF),
> +
> +	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x0),
> +	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x1),
> +	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x2),
> +	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x3),
> +	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x4),
> +	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x5),
> +
> +	MFD_CELL_BASIC("nct6694_canfd", NULL, NULL, 0, 0x0),

Why has the naming convention changed here?

> +	MFD_CELL_BASIC("nct6694_canfd", NULL, NULL, 0, 0x1),
> +
> +	MFD_CELL_BASIC("nct6694_wdt", NULL, NULL, 0, 0x0),
> +	MFD_CELL_BASIC("nct6694_wdt", NULL, NULL, 0, 0x1),
> +
> +	MFD_CELL_NAME("nct6694-hwmon"),
> +	MFD_CELL_NAME("rtc-nct6694"),

There doesn't seem to be any consistency here.

> +};
> +
> +static int nct6694_response_err_handling(struct nct6694 *nct6694,

> +{
> +	switch (err_status) {
> +	case NCT6694_NO_ERROR:
> +		return err_status;

This is odd since you already know this will be 0.

> +	case NCT6694_NOT_SUPPORT_ERROR:
> +		dev_warn(nct6694->dev, "Command is not supported!\n");

Why not dev_err()?

> +		break;
> +	case NCT6694_NO_RESPONSE_ERROR:
> +		dev_warn(nct6694->dev, "Command received no response!\n");
> +		break;
> +	case NCT6694_TIMEOUT_ERROR:
> +		dev_warn(nct6694->dev, "Command timed out!\n");
> +		break;
> +	case NCT6694_PENDING:
> +		dev_warn(nct6694->dev, "Command is pending!\n");

Is this an error?

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return -EIO;
> +}
> +
> +int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
> +{
> +	union nct6694_usb_msg *msg = nct6694->usb_msg;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);
> +
> +	/* Send command packet to USB device */

This doesn't really describe the next 2 lines.

Move it down?

> +	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> +	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
> +
> +	ret = usb_bulk_msg(nct6694->udev,

Since you use nct6694->udev a bunch - sometimes twice in the same call,
it might be nicer to pull it into it's own variable instead of
dereferencing it all the time.

> +			   usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OUT_EP),
> +			   &msg->cmd_header, sizeof(*msg), &tx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive response packet from USB device */
> +	ret = usb_bulk_msg(nct6694->udev,
> +			   usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN_EP),
> +			   &msg->response_header, sizeof(*msg), &rx_len,

How can you read sizeof(*msg) Bytes (22?) into the smaller
response_header (16?) attribute?

> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive data packet from USB device */
> +	ret = usb_bulk_msg(nct6694->udev,
> +			   usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN_EP),
> +			   buf, le16_to_cpu(cmd_hd->len), &rx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	if (rx_len != le16_to_cpu(cmd_hd->len)) {
> +		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
> +			le16_to_cpu(cmd_hd->len), rx_len);
> +		return -EIO;
> +	}
> +
> +	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
> +}
> +EXPORT_SYMBOL(nct6694_read_msg);
> +
> +int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
> +{
> +	union nct6694_usb_msg *msg = nct6694->usb_msg;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);
> +
> +	/* Send command packet to USB device */
> +	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> +	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
> +
> +	ret = usb_bulk_msg(nct6694->udev,
> +			   usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OUT_EP),
> +			   &msg->cmd_header, sizeof(*msg), &tx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	/* Send data packet to USB device */
> +	ret = usb_bulk_msg(nct6694->udev,
> +			   usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OUT_EP),
> +			   buf, le16_to_cpu(cmd_hd->len), &tx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive response packet from USB device */
> +	ret = usb_bulk_msg(nct6694->udev,
> +			   usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN_EP),
> +			   &msg->response_header, sizeof(*msg), &rx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive data packet from USB device */
> +	ret = usb_bulk_msg(nct6694->udev,
> +			   usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN_EP),
> +			   buf, le16_to_cpu(cmd_hd->len), &rx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	if (rx_len != le16_to_cpu(cmd_hd->len)) {
> +		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
> +			le16_to_cpu(cmd_hd->len), rx_len);
> +		return -EIO;
> +	}
> +
> +	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
> +}
> +EXPORT_SYMBOL(nct6694_write_msg);
> +
> +static void usb_int_callback(struct urb *urb)
> +{
> +	struct nct6694 *nct6694 = urb->context;
> +	unsigned int *int_status = urb->transfer_buffer;
> +	int ret;
> +
> +	switch (urb->status) {
> +	case 0:
> +		break;
> +	case -ECONNRESET:
> +	case -ENOENT:
> +	case -ESHUTDOWN:
> +		return;
> +	default:
> +		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
> +		*int_status &= ~BIT(irq);
> +	}
> +
> +resubmit:
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret)
> +		dev_dbg(nct6694->dev, "%s: Failed to resubmit urb, status %pe",

Why debug?

> +			__func__, ERR_PTR(ret));

Remove the __func__ part.

> +}
> +
> +static void nct6694_irq_lock(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +
> +	mutex_lock(&nct6694->irq_lock);
> +}
> +
> +static void nct6694_irq_sync_unlock(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +
> +	mutex_unlock(&nct6694->irq_lock);
> +}
> +
> +static void nct6694_irq_enable(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(data);
> +
> +	nct6694->irq_enable |= BIT(hwirq);
> +}
> +
> +static void nct6694_irq_disable(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(data);
> +
> +	nct6694->irq_enable &= ~BIT(hwirq);
> +}
> +
> +static const struct irq_chip nct6694_irq_chip = {
> +	.name = "nct6694-irq",
> +	.flags = IRQCHIP_SKIP_SET_WAKE,
> +	.irq_bus_lock = nct6694_irq_lock,
> +	.irq_bus_sync_unlock = nct6694_irq_sync_unlock,
> +	.irq_enable = nct6694_irq_enable,
> +	.irq_disable = nct6694_irq_disable,
> +};
> +
> +static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq,
> +				  irq_hw_number_t hw)
> +{
> +	struct nct6694 *nct6694 = d->host_data;
> +
> +	irq_set_chip_data(irq, nct6694);
> +	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
> +
> +	return 0;
> +}
> +
> +static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
> +{
> +	irq_set_chip_and_handler(irq, NULL, NULL);
> +	irq_set_chip_data(irq, NULL);
> +}
> +
> +static const struct irq_domain_ops nct6694_irq_domain_ops = {
> +	.map	= nct6694_irq_domain_map,
> +	.unmap	= nct6694_irq_domain_unmap,
> +};
> +
> +static int nct6694_usb_probe(struct usb_interface *iface,
> +			     const struct usb_device_id *id)
> +{
> +	struct usb_device *udev = interface_to_usbdev(iface);
> +	struct usb_endpoint_descriptor *int_endpoint;
> +	struct usb_host_interface *interface;
> +	struct device *dev = &iface->dev;
> +	struct nct6694 *nct6694;
> +	int pipe, maxp;
> +	int ret;
> +
> +	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
> +	if (!nct6694)
> +		return -ENOMEM;
> +
> +	pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
> +	maxp = usb_maxpacket(udev, pipe);
> +
> +	nct6694->usb_msg = devm_kzalloc(dev, sizeof(union nct6694_usb_msg), GFP_KERNEL);
> +	if (!nct6694->usb_msg)
> +		return -ENOMEM;
> +
> +	nct6694->int_buffer = devm_kzalloc(dev, maxp, GFP_KERNEL);
> +	if (!nct6694->int_buffer)
> +		return -ENOMEM;
> +
> +	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!nct6694->int_in_urb)
> +		return -ENOMEM;
> +
> +	nct6694->domain = irq_domain_add_simple(NULL, NCT6694_NR_IRQS, 0,
> +						&nct6694_irq_domain_ops,
> +						nct6694);
> +	if (!nct6694->domain) {
> +		ret = -ENODEV;
> +		goto err_urb;
> +	}
> +
> +	nct6694->dev = dev;
> +	nct6694->udev = udev;
> +	nct6694->timeout = NCT6694_URB_TIMEOUT;	/* Wait until URB completes */

No need to save this known value.

> +	ret = devm_mutex_init(dev, &nct6694->access_lock);
> +	if (ret)
> +		goto err_urb;
> +
> +	ret = devm_mutex_init(dev, &nct6694->irq_lock);
> +	if (ret)
> +		goto err_urb;
> +
> +	interface = iface->cur_altsetting;
> +	int_endpoint = &interface->endpoint[0].desc;
> +	if (!usb_endpoint_is_int_in(int_endpoint)) {
> +		ret = -ENODEV;
> +		goto err_urb;
> +	}
> +	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> +			 nct6694->int_buffer, maxp, usb_int_callback,
> +			 nct6694, int_endpoint->bInterval);
> +	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> +	if (ret)
> +		goto err_urb;

Please unsquash these calls - space them out.

> +
> +	usb_set_intfdata(iface, nct6694);
> +
> +	ret = mfd_add_hotplug_devices(dev, nct6694_dev, ARRAY_SIZE(nct6694_dev));
> +	if (ret)
> +		goto err_mfd;
> +
> +	return 0;
> +
> +err_mfd:
> +	usb_kill_urb(nct6694->int_in_urb);
> +err_urb:
> +	usb_free_urb(nct6694->int_in_urb);
> +	return ret;
> +}
> +
> +static void nct6694_usb_disconnect(struct usb_interface *iface)
> +{
> +	struct nct6694 *nct6694 = usb_get_intfdata(iface);
> +
> +	mfd_remove_devices(nct6694->dev);
> +	usb_kill_urb(nct6694->int_in_urb);
> +	usb_free_urb(nct6694->int_in_urb);
> +}
> +
> +static const struct usb_device_id nct6694_ids[] = {
> +	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID,
> +					NCT6694_PRODUCT_ID,
> +					0xFF, 0x00, 0x00)},

This should fit on one line.  You can use up to 100-chars.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(usb, nct6694_ids);
> +
> +static struct usb_driver nct6694_usb_driver = {
> +	.name	= "nct6694",

Odd spaces.

> +	.id_table = nct6694_ids,
> +	.probe = nct6694_usb_probe,
> +	.disconnect = nct6694_usb_disconnect,
> +};
> +

Remove this line.

> +module_usb_driver(nct6694_usb_driver);
> +
> +MODULE_DESCRIPTION("USB core driver for NCT6694");

This is not a USB driver.

> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");

Different to SoB.

> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> new file mode 100644
> index 000000000000..8171f975761e
> --- /dev/null
> +++ b/include/linux/mfd/nct6694.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Nuvoton NCT6694 USB transaction and data structure.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.

At the top.

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
> +	struct mutex access_lock;
> +	/* Mutex to protect access to the IRQ */
> +	struct mutex irq_lock;
> +	struct urb *int_in_urb;
> +	struct usb_device *udev;
> +	union nct6694_usb_msg *usb_msg;
> +	unsigned char *int_buffer;
> +	unsigned int irq_enable;
> +	/* Time in msec to wait for the URB to the complete */
> +	long timeout;

timeout_ms

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

