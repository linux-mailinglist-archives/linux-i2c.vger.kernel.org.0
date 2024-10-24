Return-Path: <linux-i2c+bounces-7547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCC39AEA44
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 17:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 429551C21AB9
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 15:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BDB1E32CF;
	Thu, 24 Oct 2024 15:21:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4815F1D86C0
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729783311; cv=none; b=R0gvDC6zgQsT12zJnJVbFWc/UyyPGbLIjaHYmSjd/0G3RdK1fNgIN9bQiHIvmxjLTQOz5xYhE56IpfnMYV1UvZP+rtJI2+cx5lVySOXrwND7vcgF+68dynAIbPiOuagXTNjBrhrB0m8SHFSdgdbFwgOMbHFGl6VPFtYMUR2LapE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729783311; c=relaxed/simple;
	bh=xmURvGsSQUZFxfZ+RAjNnOSjIMdY2fZuT7tiMlghng8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5L3kXcutjl9vnCRWFH+Oibek6LPIQM9POc08iTrDVAk08tlsgml5b6xq0tYbTed309VcpwyrTb5Wieu3Xv31fxPC1yCiWQR8zb6veoDDSNSKoxSrWN1zEEdj1BicLMrfYRALGgTc9qF5yaKG+o1OVwiJSKiSJKD/CCwU5VNyQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3ze0-0004OZ-Mt; Thu, 24 Oct 2024 17:21:00 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3zdy-000Dj9-12;
	Thu, 24 Oct 2024 17:20:58 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id D3F2235DE43;
	Thu, 24 Oct 2024 15:20:57 +0000 (UTC)
Date: Thu, 24 Oct 2024 17:20:57 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-2-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bc6t2hauttfjlfk7"
Content-Disposition: inline
In-Reply-To: <20241024085922.133071-2-tmyu0@nuvoton.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--bc6t2hauttfjlfk7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
MIME-Version: 1.0

On 24.10.2024 16:59:14, Ming Yu wrote:
> The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> PWM, and RTC.
>=20
> This driver implements USB device functionality and shares the
> chip's peripherals as a child device.
>=20
> Each child device can use the USB functions nct6694_read_msg()
> and nct6694_write_msg() to issue a command. They can also register
> a handler function that will be called when the USB device receives
> its interrupt pipe.

[...]

> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> new file mode 100644
> index 000000000000..9838c7be0b98
> --- /dev/null
> +++ b/drivers/mfd/nct6694.c

[...]

> +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset, u16 le=
ngth,
> +		     u8 rd_idx, u8 rd_len, unsigned char *buf)

why not make buf a void *?

> +{
> +	struct usb_device *udev =3D nct6694->udev;
> +	unsigned char err_status;
> +	int len, packet_len, tx_len, rx_len;
> +	int i, ret;
> +
> +	mutex_lock(&nct6694->access_lock);
> +
> +	/* Send command packet to USB device */
> +	nct6694->cmd_buffer[REQUEST_MOD_IDX] =3D mod;
> +	nct6694->cmd_buffer[REQUEST_CMD_IDX] =3D offset & 0xFF;
> +	nct6694->cmd_buffer[REQUEST_SEL_IDX] =3D (offset >> 8) & 0xFF;
> +	nct6694->cmd_buffer[REQUEST_HCTRL_IDX] =3D HCTRL_GET;
> +	nct6694->cmd_buffer[REQUEST_LEN_L_IDX] =3D length & 0xFF;
> +	nct6694->cmd_buffer[REQUEST_LEN_H_IDX] =3D (length >> 8) & 0xFF;
> +
> +	ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT),
> +			   nct6694->cmd_buffer, CMD_PACKET_SZ, &tx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		goto err;
> +
> +	/* Receive response packet from USB device */
> +	ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDPOINT),
> +			   nct6694->rx_buffer, CMD_PACKET_SZ, &rx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		goto err;
> +
> +	err_status =3D nct6694->rx_buffer[RESPONSE_STS_IDX];
> +
> +	/*
> +	 * Segmented reception of messages that exceed the size of USB bulk
> +	 * pipe packets.
> +	 */

The Linux USB stack can receive bulk messages longer than the max packet si=
ze.

> +	for (i =3D 0, len =3D length; len > 0; i++, len -=3D packet_len) {
> +		if (len > nct6694->maxp)
> +			packet_len =3D nct6694->maxp;
> +		else
> +			packet_len =3D len;
> +
> +		ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDPOINT),
> +				   nct6694->rx_buffer + nct6694->maxp * i,
> +				   packet_len, &rx_len, nct6694->timeout);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	for (i =3D 0; i < rd_len; i++)
> +		buf[i] =3D nct6694->rx_buffer[i + rd_idx];

memcpy()?

Or why don't you directly receive data into the provided buffer? Copying
of the data doesn't make it faster.

On the other hand, receiving directly into the target buffer means the
target buffer must not live on the stack.

> +
> +	if (err_status) {
> +		pr_debug("%s: MSG CH status =3D %2Xh\n", __func__, err_status);
> +		ret =3D -EIO;
> +	}
> +
> +err:
> +	mutex_unlock(&nct6694->access_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL(nct6694_read_msg);
> +
> +int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> +		      u16 length, unsigned char *buf)
> +{
> +	struct usb_device *udev =3D nct6694->udev;
> +	unsigned char err_status;
> +	int len, packet_len, tx_len, rx_len;
> +	int i, ret;
> +
> +	mutex_lock(&nct6694->access_lock);
> +
> +	/* Send command packet to USB device  */
> +	nct6694->cmd_buffer[REQUEST_MOD_IDX] =3D mod;
> +	nct6694->cmd_buffer[REQUEST_CMD_IDX] =3D offset & 0xFF;
> +	nct6694->cmd_buffer[REQUEST_SEL_IDX] =3D (offset >> 8) & 0xFF;
> +	nct6694->cmd_buffer[REQUEST_HCTRL_IDX] =3D HCTRL_SET;
> +	nct6694->cmd_buffer[REQUEST_LEN_L_IDX] =3D length & 0xFF;
> +	nct6694->cmd_buffer[REQUEST_LEN_H_IDX] =3D (length >> 8) & 0xFF;

What about creating a struct that describes the cmd_buffer layout?

> +
> +	ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT),
> +			   nct6694->cmd_buffer, CMD_PACKET_SZ, &tx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		goto err;
> +
> +	/*
> +	 * Segmented transmission of messages that exceed the size of USB bulk
> +	 * pipe packets.
> +	 */

same as above

> +	for (i =3D 0, len =3D length; len > 0; i++, len -=3D packet_len) {
> +		if (len > nct6694->maxp)
> +			packet_len =3D nct6694->maxp;
> +		else
> +			packet_len =3D len;
> +
> +		memcpy(nct6694->tx_buffer + nct6694->maxp * i,
> +		       buf + nct6694->maxp * i, packet_len);
> +
> +		ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT),
> +				   nct6694->tx_buffer + nct6694->maxp * i,
> +				   packet_len, &tx_len, nct6694->timeout);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	/* Receive response packet from USB device */
> +	ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDPOINT),
> +			   nct6694->rx_buffer, CMD_PACKET_SZ, &rx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		goto err;
> +
> +	err_status =3D nct6694->rx_buffer[RESPONSE_STS_IDX];
> +
> +	/*
> +	 * Segmented reception of messages that exceed the size of USB bulk
> +	 * pipe packets.
> +	 */

same as above

> +	for (i =3D 0, len =3D length; len > 0; i++, len -=3D packet_len) {
> +		if (len > nct6694->maxp)
> +			packet_len =3D nct6694->maxp;
> +		else
> +			packet_len =3D len;
> +
> +		ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDPOINT),
> +				   nct6694->rx_buffer + nct6694->maxp * i,
> +				   packet_len, &rx_len, nct6694->timeout);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	memcpy(buf, nct6694->rx_buffer, length);

why not rx into the destination buffer directly?

> +
> +	if (err_status) {
> +		pr_debug("%s: MSG CH status =3D %2Xh\n", __func__, err_status);
> +		ret =3D -EIO;
> +	}
> +
> +err:
> +	mutex_unlock(&nct6694->access_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL(nct6694_write_msg);

[...]

> +static int nct6694_usb_probe(struct usb_interface *iface,
> +			     const struct usb_device_id *id)
> +{
> +	struct usb_device *udev =3D interface_to_usbdev(iface);
> +	struct device *dev =3D &udev->dev;
> +	struct usb_host_interface *interface;
> +	struct usb_endpoint_descriptor *int_endpoint;
> +	struct nct6694 *nct6694;
> +	int pipe, maxp, bulk_pipe;
> +	int ret =3D EINVAL;
> +
> +	interface =3D iface->cur_altsetting;
> +	/* Binding interface class : 0xFF */
> +	if (interface->desc.bInterfaceClass !=3D USB_CLASS_VENDOR_SPEC ||
> +	    interface->desc.bInterfaceSubClass !=3D 0x00 ||
> +	    interface->desc.bInterfaceProtocol !=3D 0x00)
> +		return -ENODEV;
> +
> +	int_endpoint =3D &interface->endpoint[0].desc;
> +	if (!usb_endpoint_is_int_in(int_endpoint))
> +		return -ENODEV;
> +
> +	nct6694 =3D devm_kzalloc(&udev->dev, sizeof(*nct6694), GFP_KERNEL);
> +	if (!nct6694)
> +		return -ENOMEM;
> +
> +	pipe =3D usb_rcvintpipe(udev, INT_IN_ENDPOINT);
> +	maxp =3D usb_maxpacket(udev, pipe);

better move these 2 down to the usb_fill_int_urb().

> +
> +	nct6694->cmd_buffer =3D devm_kcalloc(dev, CMD_PACKET_SZ,
> +					   sizeof(unsigned char), GFP_KERNEL);
> +	if (!nct6694->cmd_buffer)
> +		return -ENOMEM;
> +	nct6694->rx_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> +					  sizeof(unsigned char), GFP_KERNEL);
> +	if (!nct6694->rx_buffer)
> +		return -ENOMEM;
> +	nct6694->tx_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> +					  sizeof(unsigned char), GFP_KERNEL);
> +	if (!nct6694->tx_buffer)
> +		return -ENOMEM;
> +	nct6694->int_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> +					   sizeof(unsigned char), GFP_KERNEL);
> +	if (!nct6694->int_buffer)
> +		return -ENOMEM;
> +
> +	nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> +	if (!nct6694->int_in_urb) {
> +		dev_err(&udev->dev, "Failed to allocate INT-in urb!\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* Bulk pipe maximum packet for each transaction */
> +	bulk_pipe =3D usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT);
> +	nct6694->maxp =3D usb_maxpacket(udev, bulk_pipe);
> +
> +	mutex_init(&nct6694->access_lock);
> +	nct6694->udev =3D udev;
> +	nct6694->timeout =3D URB_TIMEOUT;	/* Wait until urb complete */
> +
> +	INIT_LIST_HEAD(&nct6694->handler_list);
> +	spin_lock_init(&nct6694->lock);
> +
> +	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> +			 nct6694->int_buffer, maxp, usb_int_callback,
> +			 nct6694, int_endpoint->bInterval);
> +	ret =3D usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> +	if (ret)
> +		goto err_urb;
> +
> +	dev_set_drvdata(&udev->dev, nct6694);
> +	usb_set_intfdata(iface, nct6694);
> +
> +	ret =3D mfd_add_hotplug_devices(&udev->dev, nct6694_dev,
> +				      ARRAY_SIZE(nct6694_dev));
> +	if (ret) {
> +		dev_err(&udev->dev, "Failed to add mfd's child device\n");
> +		goto err_mfd;
> +	}
> +
> +	nct6694->async_workqueue =3D alloc_ordered_workqueue("asyn_workqueue", =
0);

Where is the async_workqueue used?

> +
> +	dev_info(&udev->dev, "Probed device: (%04X:%04X)\n",
> +		 id->idVendor, id->idProduct);
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
> +	struct usb_device *udev =3D interface_to_usbdev(iface);
> +	struct nct6694 *nct6694 =3D usb_get_intfdata(iface);
> +
> +	mfd_remove_devices(&udev->dev);
> +	flush_workqueue(nct6694->async_workqueue);
> +	destroy_workqueue(nct6694->async_workqueue);
> +	usb_set_intfdata(iface, NULL);

I think this is not needed.

> +	usb_kill_urb(nct6694->int_in_urb);
> +	usb_free_urb(nct6694->int_in_urb);
> +}
> +
> +static const struct usb_device_id nct6694_ids[] =3D {
> +	{ USB_DEVICE(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID)},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(usb, nct6694_ids);
> +
> +static struct usb_driver nct6694_usb_driver =3D {
> +	.name	=3D DRVNAME,
> +	.id_table =3D nct6694_ids,
> +	.probe =3D nct6694_usb_probe,
> +	.disconnect =3D nct6694_usb_disconnect,
> +};
> +
> +module_usb_driver(nct6694_usb_driver);
> +
> +MODULE_DESCRIPTION("USB-MFD driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> new file mode 100644
> index 000000000000..0797564363be
> --- /dev/null
> +++ b/include/linux/mfd/nct6694.h
> @@ -0,0 +1,168 @@
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
> +#define NCT6694_DEV_GPIO		"nct6694-gpio"
> +#define NCT6694_DEV_I2C			"nct6694-i2c"
> +#define NCT6694_DEV_CAN			"nct6694-can"
> +#define NCT6694_DEV_WDT			"nct6694-wdt"
> +#define NCT6694_DEV_IIO			"nct6694-iio"
> +#define NCT6694_DEV_HWMON		"nct6694-hwmon"
> +#define NCT6694_DEV_PWM			"nct6694-pwm"
> +#define NCT6694_DEV_RTC			"nct6694-rtc"
> +
> +#define NCT6694_VENDOR_ID		0x0416
> +#define NCT6694_PRODUCT_ID		0x200B
> +#define INT_IN_ENDPOINT			0x81
> +#define BULK_IN_ENDPOINT		0x82

In Linux we don't add the 0x80 for IN endpoint, the framework does this
for you.

> +#define BULK_OUT_ENDPOINT		0x03
> +#define MAX_PACKET_SZ			0x100
> +
> +#define CMD_PACKET_SZ			0x8
> +#define HCTRL_SET			0x40
> +#define HCTRL_GET			0x80
> +
> +#define REQUEST_MOD_IDX			0x01
> +#define REQUEST_CMD_IDX			0x02
> +#define REQUEST_SEL_IDX			0x03
> +#define REQUEST_HCTRL_IDX		0x04
> +#define REQUEST_LEN_L_IDX		0x06
> +#define REQUEST_LEN_H_IDX		0x07
> +
> +#define RESPONSE_STS_IDX		0x01
> +
> +#define INT_IN_IRQ_IDX			0x00
> +#define GPIO_IRQ_STATUS			BIT(0)
> +#define CAN_IRQ_STATUS			BIT(2)
> +#define RTC_IRQ_STATUS			BIT(3)
> +
> +#define URB_TIMEOUT			1000
> +
> +/*
> + * struct nct6694 - Nuvoton NCT6694 structure
> + *
> + * @udev: Pointer to the USB device
> + * @int_in_urb: Interrupt pipe urb
> + * @access_lock: USB transaction lock
> + * @handler_list: List of registered handlers
> + * @async_workqueue: Workqueue of processing asynchronous work
> + * @tx_buffer: USB write message buffer
> + * @rx_buffer: USB read message buffer
> + * @cmd_buffer: USB send command message buffer
> + * @int_buffer: USB receive interrupt message buffer
> + * @lock: Handlers lock
> + * @timeout: URB timeout
> + * @maxp: Maximum packet of bulk pipe
> + */
> +struct nct6694 {
> +	struct usb_device *udev;
> +	struct urb *int_in_urb;
> +	struct list_head handler_list;
> +	struct workqueue_struct *async_workqueue;
> +
> +	/* Make sure that every USB transaction is not interrupted */
> +	struct mutex access_lock;
> +
> +	unsigned char *tx_buffer;
> +	unsigned char *rx_buffer;
> +	unsigned char *cmd_buffer;
> +	unsigned char *int_buffer;
> +
> +	/* Prevent races within handlers */
> +	spinlock_t lock;
> +
> +	/* time in msec to wait for the urb to the complete */
> +	long timeout;
> +
> +	/* Bulk pipe maximum packet for each transaction */
> +	int maxp;
> +};
> +
> +/*
> + * struct nct6694_handler_entry - Stores the interrupt handling informat=
ion
> + * for each registered peripheral
> + *
> + * @irq_bit: The bit in irq_status[INT_IN_IRQ_IDX] representing interrupt
                    ^^^

I think this comment could be more precise, you can emphasize, that it's
not the bit number but the bit mask.=20

> + * @handler: Function pointer to the interrupt handler of the peripheral
> + * @private_data: Private data specific to the peripheral driver
> + * @list: Node used to link to the handler_list
> + */
> +struct nct6694_handler_entry {
> +	int irq_bit;

the int_status you compare against in the IRQ callback ist a unsigned
char. Better make all a u8.

> +	void (*handler)(void *private_data);
> +	void *private_data;
> +	struct list_head list;
> +};

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--bc6t2hauttfjlfk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcaZdYACgkQKDiiPnot
vG8hTQf9GGzEvj1IT8hi7Dc2LklLz1DRfZZtySo3heWjBKwZGfg8OeS8aD4Xamc+
UZ+Nv9UCpXYl9wnt0c8VBzKNz1Y495JYia9N3BcKurHsqhKHVxXcg2MlTkIT6b95
+gZDXceiP2tOtc7nPhC+h625Qcpiz92AZvChQzmxMuJqqEvlYx95yZ/+xXbeWRdy
8Kad8joA0KJ2wNWS9DgGRJFiOKbTzw0KqSeCE8xH0k1kSWQJ3QRk5qqvcEuz/v9z
QVBYRhqVCudi6Kyt2baqPuHUTSL/Qgqyxr52VjwzppW5kWJsVXHXb88xkYBiormM
RqiOLe/MKN0fDDG2vvLZTB9ERYqXyw==
=f7L1
-----END PGP SIGNATURE-----

--bc6t2hauttfjlfk7--

