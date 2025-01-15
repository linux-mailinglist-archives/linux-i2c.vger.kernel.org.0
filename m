Return-Path: <linux-i2c+bounces-9115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BCA12819
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 17:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A86A1889D62
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 16:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19C1166F3A;
	Wed, 15 Jan 2025 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHmTxIF8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6757F146D40;
	Wed, 15 Jan 2025 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736957049; cv=none; b=uGkAepoQBBNd/GWEtwf1zNmf0yvhw53Rl7h8aE+d8eqP05kvt2InxwdIwhGOr6ZXXbqkWTCCzPyVz9m0WjE5F2DHFqxAdaXoxcxnHjzLqZaxVZQH8aPMI3AYbljwPxJ+tY9Oq9G2Oi0zqbf93Jfjz/HfpLfYk6dPr9yXCzpm5Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736957049; c=relaxed/simple;
	bh=bBvIAc/ofzfuAZ2biCK8SOcIqkb30675D+1kYFAZUwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKMWc8QxixnwQUwq7m7Yq0wSFWwvFEOuQ1DuA8K0UIyPN+8GMkKwC3pfcVeGg3f/v2I4tsWZV9OeN1avzu0AQr3N9hovcmwztAKlXpsGoIkjDQV82OQwxadEBFcDSVGo8PJ8/HVzUDcEeH4op7VFahOUGqTYgui/LvE/K7JydDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHmTxIF8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47791C4CED1;
	Wed, 15 Jan 2025 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736957048;
	bh=bBvIAc/ofzfuAZ2biCK8SOcIqkb30675D+1kYFAZUwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHmTxIF81w3r5FZycyxOSmbwXFN8XCsXeNVIi/nWyuJMmm9nfUpdp4YTcSDVAiqYp
	 hRz7OMd6iO+yJeO+lRnzkCv2I3s25mJRWQBEJovL36Gfghck3NbakTRBSAgZbDpIRv
	 UV9MMgfKAGWS+GSzXkVrgD6NDpYWm9wwrRS8RqJeful607vRF6iHIYmDCQq2mQBRBO
	 txCi7ZjNQKfT6rf/1+3Nb01hFZeO9upQxX6ipPW5OcE2xRXI0r5lq29aJ7Rov+1ON8
	 IvYrHi2k32PN7lHSA2GYYrzoH1Au4us9WVyNrHc77sM0N2lwvqS9LVrCeAhyy6OqTS
	 WHrEpqM1UCCyw==
Date: Wed, 15 Jan 2025 16:04:01 +0000
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
Subject: Re: [PATCH v5 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250115160401.GL6763@google.com>
References: <20250114033010.2445925-1-a0282524688@gmail.com>
 <20250114033010.2445925-2-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114033010.2445925-2-a0282524688@gmail.com>

On Tue, 14 Jan 2025, Ming Yu wrote:

> The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> PWM, and RTC.
> 
> This driver implements USB device functionality and shares the
> chip's peripherals as a child device.
> 
> Each child device can use the USB functions nct6694_read_msg()
> and nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---
>  MAINTAINERS                 |   7 +
>  drivers/mfd/Kconfig         |  10 +
>  drivers/mfd/Makefile        |   2 +
>  drivers/mfd/nct6694.c       | 388 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/nct6694.h | 109 ++++++++++
>  5 files changed, 516 insertions(+)
>  create mode 100644 drivers/mfd/nct6694.c
>  create mode 100644 include/linux/mfd/nct6694.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a87ddad78e26..79568f82b98a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16717,6 +16717,13 @@ F:	drivers/nubus/
>  F:	include/linux/nubus.h
>  F:	include/uapi/linux/nubus.h
>  
> +NUVOTON NCT6694 MFD DRIVER
> +M:	Ming Yu <tmyu0@nuvoton.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Supported
> +F:	drivers/mfd/nct6694.c
> +F:	include/linux/mfd/nct6694.h
> +
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
>  M:	Antonino Daplas <adaplas@gmail.com>
>  L:	linux-fbdev@vger.kernel.org
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ae23b317a64e..3e641bfeeb38 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1045,6 +1045,16 @@ config MFD_MENF21BMC
>  	  This driver can also be built as a module. If so the module
>  	  will be called menf21bmc.
>  
> +config MFD_NCT6694
> +	tristate "Nuvoton NCT6694 support"
> +	select MFD_CORE
> +	depends on USB
> +	help
> +	  This adds support for Nuvoton USB device NCT6694 sharing peripherals

Missing full stop.

> +	  This includes the USB device driver and core APIs.
> +	  Additional drivers must be enabled in order to use the functionality

New sentences do not have to be on new lines.

> +	  of the device.

Please explain what this functionality is.

> +
>  config MFD_OCELOT
>  	tristate "Microsemi Ocelot External Control Support"
>  	depends on SPI_MASTER
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e057d6d6faef..3c902d3704dc 100644
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
> index 000000000000..294b6b7a902e
> --- /dev/null
> +++ b/drivers/mfd/nct6694.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 MFD driver based on USB interface.

No such thing as an MFD driver.  What is this device?

> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
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
> +#define MFD_DEV_SIMPLE(_name)				\
> +{							\
> +	.name = NCT6694_DEV_##_name,			\

Device names are usually lower case.

> +}							\

MFD_CELL_NAME()

> +#define MFD_DEV_WITH_ID(_name, _id)			\
> +{							\
> +	.name = NCT6694_DEV_##_name,			\
> +	.id = _id,					\
> +}

MFD_CELL_BASIC()

Or add a new one to include/linux/mfd/core.h.

> +/* MFD device resources */

This comment is superfluous.

> +static const struct mfd_cell nct6694_dev[] = {
> +	MFD_DEV_WITH_ID(GPIO, 0x0),

Why doesn't PLATFORM_DEVID_AUTO work for you?

> +	MFD_DEV_WITH_ID(GPIO, 0x1),
> +	MFD_DEV_WITH_ID(GPIO, 0x2),
> +	MFD_DEV_WITH_ID(GPIO, 0x3),
> +	MFD_DEV_WITH_ID(GPIO, 0x4),
> +	MFD_DEV_WITH_ID(GPIO, 0x5),
> +	MFD_DEV_WITH_ID(GPIO, 0x6),
> +	MFD_DEV_WITH_ID(GPIO, 0x7),
> +	MFD_DEV_WITH_ID(GPIO, 0x8),
> +	MFD_DEV_WITH_ID(GPIO, 0x9),
> +	MFD_DEV_WITH_ID(GPIO, 0xA),
> +	MFD_DEV_WITH_ID(GPIO, 0xB),
> +	MFD_DEV_WITH_ID(GPIO, 0xC),
> +	MFD_DEV_WITH_ID(GPIO, 0xD),
> +	MFD_DEV_WITH_ID(GPIO, 0xE),
> +	MFD_DEV_WITH_ID(GPIO, 0xF),
> +
> +	MFD_DEV_WITH_ID(I2C, 0x0),
> +	MFD_DEV_WITH_ID(I2C, 0x1),
> +	MFD_DEV_WITH_ID(I2C, 0x2),
> +	MFD_DEV_WITH_ID(I2C, 0x3),
> +	MFD_DEV_WITH_ID(I2C, 0x4),
> +	MFD_DEV_WITH_ID(I2C, 0x5),
> +
> +	MFD_DEV_WITH_ID(CAN, 0x0),
> +	MFD_DEV_WITH_ID(CAN, 0x1),
> +
> +	MFD_DEV_WITH_ID(WDT, 0x0),
> +	MFD_DEV_WITH_ID(WDT, 0x1),
> +
> +	MFD_DEV_SIMPLE(HWMON),
> +	MFD_DEV_SIMPLE(RTC),
> +};
> +
> +static int nct6694_response_err_handling(struct nct6694 *nct6694,
> +					 unsigned char err_status)
> +{
> +	struct device *dev = &nct6694->udev->dev;
> +
> +	switch (err_status) {
> +	case NCT6694_NO_ERROR:
> +		return err_status;
> +	case NCT6694_NOT_SUPPORT_ERROR:
> +		dev_dbg(dev, "%s: Command is not supported!\n", __func__);

These should be dev_warns().

__func__ shouldn't be used in production code.

Users don't care about functions.

> +		break;
> +	case NCT6694_NO_RESPONSE_ERROR:
> +		dev_dbg(dev, "%s: Command received no response!\n", __func__);
> +		break;
> +	case NCT6694_TIMEOUT_ERROR:
> +		dev_dbg(dev, "%s: Command timed out!\n", __func__);
> +		break;
> +	case NCT6694_PENDING:
> +		dev_dbg(dev, "%s: Command is pending!\n", __func__);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return -EIO;
> +}
> +
> +int nct6694_read_msg(struct nct6694 *nct6694,
> +		     struct nct6694_cmd_header *cmd_hd,
> +		     void *buf)
> +{
> +	union nct6694_usb_msg *msg = nct6694->usb_msg;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);
> +
> +	/* Send command packet to USB device */
> +	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> +	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
> +
> +	ret = usb_bulk_msg(nct6694->udev,
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
> +		dev_dbg(&nct6694->udev->dev, "%s: Received length is not match!\n",

"does not match <something>"

> +			__func__);

This should be dev_err().

> +		return -EIO;
> +	}
> +
> +	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
> +}
> +EXPORT_SYMBOL(nct6694_read_msg);
> +
> +int nct6694_write_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *cmd_hd,
> +		      void *buf)
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
> +		dev_dbg(&nct6694->udev->dev, "%s: Sent length is not match!\n",
> +			__func__);

This should be dev_err().

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
> +	struct device *dev = &nct6694->udev->dev;
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
> +		goto resubmit;
> +	}
> +
> +	while (*int_status) {
> +		int irq = __ffs(*int_status);
> +
> +		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
> +		*int_status &= ~BIT(irq);
> +	}
> +
> +resubmit:
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret)
> +		dev_dbg(dev, "%s: Failed to resubmit urb, status %pe",
> +			__func__, ERR_PTR(ret));
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

Changing a bit mask doesn't actually {en,dis}able an IRQ, right?

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
> +static struct irq_chip nct6694_irq_chip = {
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
> +	struct device *dev = &udev->dev;
> +	struct nct6694 *nct6694;
> +	int pipe, maxp;
> +	int ret;
> +
> +	interface = iface->cur_altsetting;

Initialise this during allocation.

> +	int_endpoint = &interface->endpoint[0].desc;
> +	if (!usb_endpoint_is_int_in(int_endpoint))
> +		return -ENODEV;
> +
> +	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
> +	if (!nct6694)
> +		return -ENOMEM;
> +
> +	pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
> +	maxp = usb_maxpacket(udev, pipe);
> +
> +	nct6694->usb_msg = devm_kzalloc(dev, sizeof(union nct6694_usb_msg),
> +					GFP_KERNEL);

Unwrap this - you can use up to 100-chars.

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
> +	nct6694->udev = udev;
> +	nct6694->timeout = NCT6694_URB_TIMEOUT;	/* Wait until urb complete */

"URB completes"?

> +
> +	devm_mutex_init(dev, &nct6694->access_lock);
> +	devm_mutex_init(dev, &nct6694->irq_lock);
> +
> +	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> +			 nct6694->int_buffer, maxp, usb_int_callback,
> +			 nct6694, int_endpoint->bInterval);
> +	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> +	if (ret)
> +		goto err_urb;
> +
> +	dev_set_drvdata(dev, nct6694);
> +	usb_set_intfdata(iface, nct6694);

These two do the same thing.  You don't need both.

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
> +	struct usb_device *udev = interface_to_usbdev(iface);
> +	struct nct6694 *nct6694 = usb_get_intfdata(iface);
> +
> +	mfd_remove_devices(&udev->dev);

Does devm_* work here?

> +	usb_kill_urb(nct6694->int_in_urb);
> +	usb_free_urb(nct6694->int_in_urb);
> +}
> +
> +static const struct usb_device_id nct6694_ids[] = {
> +	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID,
> +					NCT6694_PRODUCT_ID,
> +					0xFF, 0x00, 0x00)},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(usb, nct6694_ids);
> +
> +static struct usb_driver nct6694_usb_driver = {
> +	.name	= "nct6694",
> +	.id_table = nct6694_ids,
> +	.probe = nct6694_usb_probe,
> +	.disconnect = nct6694_usb_disconnect,
> +};
> +
> +module_usb_driver(nct6694_usb_driver);
> +
> +MODULE_DESCRIPTION("USB-MFD driver for NCT6694");

Remove all references to MFD.

> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> new file mode 100644
> index 000000000000..67ca835589ad
> --- /dev/null
> +++ b/include/linux/mfd/nct6694.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Nuvoton NCT6694 USB transaction and data structure.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#ifndef __MFD_NCT6694_H
> +#define __MFD_NCT6694_H
> +
> +#define NCT6694_DEV_GPIO	"nct6694-gpio"
> +#define NCT6694_DEV_I2C		"nct6694-i2c"
> +#define NCT6694_DEV_CAN		"nct6694-can"
> +#define NCT6694_DEV_WDT		"nct6694-wdt"
> +#define NCT6694_DEV_HWMON	"nct6694-hwmon"
> +#define NCT6694_DEV_RTC		"nct6694-rtc"

Use raw strings in place please.

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

These are never used.

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
> +	NCT6694_IRQ_CAN1,
> +	NCT6694_IRQ_CAN2,
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

Do all of these values need to be stored?

> +	struct usb_device *udev;
> +	struct urb *int_in_urb;
> +	struct irq_domain *domain;
> +	struct mutex access_lock;
> +	struct mutex irq_lock;
> +	union nct6694_usb_msg *usb_msg;
> +	unsigned char *int_buffer;
> +	unsigned int irq_enable;
> +	/* time in msec to wait for the urb to the complete */

"Time"  "URB"
> +	long timeout;
> +};
> +
> +int nct6694_read_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *cmd_hd,
> +		     void *buf);
> +
> +int nct6694_write_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *cmd_hd,
> +		      void *buf);
> +
> +#endif
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

