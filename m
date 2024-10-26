Return-Path: <linux-i2c+bounces-7608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5E9B18E4
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 17:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAD352823E2
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 15:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5011F22075;
	Sat, 26 Oct 2024 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="s0XD+0/R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC09DF58;
	Sat, 26 Oct 2024 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729954819; cv=none; b=kcj5/n1LX2EwHn+qy4V23qT8G8yvpgQ9qjZYpd5oYTr7okhGd1JzeAHAYV21xr2O529NF1fcN9XKkXnTdpW+4oq8G5shJN1RGnyFMQhU3To2ffx+bcTqEtCT2ewAknRZsBjOGUHVDqXGrP9S6z/lN+MmPNLz3zxFK4RgULhZJdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729954819; c=relaxed/simple;
	bh=ts35UP4FAc5BzWQKERSR0MJ3IuRU5JhtZqaBs3N64lg=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=PWQuGelUzRZZUwbsKdoRKgiL4TPgVccwRTzQqPYfNADbJVG96lKGxIxq6v3LEMKLI9zur4Rut6QcGCkgb5OuMMhovlUcaZeN1gXspkQU3yNec7/1s4m0eEBowdA90mp9AZJvvIQQbMqhrb1Gd+unQ/d+Wcqxl0Q79ZIzOClgVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=s0XD+0/R; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 4iFct7l3dzlrR4iFdt2p51; Sat, 26 Oct 2024 16:58:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1729954735;
	bh=KK8qel6CGXzEX9mNwNNB9T7obUbXstjn4obJblGJUZs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=s0XD+0/R/7RR/hR5QMfnjDOTlzl76kyOkrIOCBWKejy9NFYABFS+dhKLRHnYU8Uas
	 1pvbOfhABTfqeClkAxVZBeaHV/qZs8a8VXEAs4ojaq0M44ZlrT3cIG1DE2JWajpFT5
	 bed+HeNjsgfRa9PZCZss1JSnp3sOygpI+0CPgd+OMVio2j8fqJxjehLE5xmpx4O2hx
	 5H3bWuAbxrLPfNGv7kFT3PivITDe9KoQkSpU/IAvNWGGInqQNi3nhogrkH81qwODRQ
	 cZjZLUDJ5ZWcN7zQgLj90cJCc1XRs8iWryVVQsP7vWsSUGxiBIzjg9oyaq/4DlzXQZ
	 p3nTloixv4h2g==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 26 Oct 2024 16:58:55 +0200
X-ME-IP: 90.11.132.44
Message-ID: <5d1c39c3-b686-40ce-b8af-72dfddeb68da@wanadoo.fr>
Date: Sat, 26 Oct 2024 16:58:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-2-tmyu0@nuvoton.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
 mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org
In-Reply-To: <20241024085922.133071-2-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/10/2024 à 10:59, Ming Yu a écrit :
> The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> PWM, and RTC.
> 
> This driver implements USB device functionality and shares the
> chip's peripherals as a child device.
> 
> Each child device can use the USB functions nct6694_read_msg()
> and nct6694_write_msg() to issue a command. They can also register
> a handler function that will be called when the USB device receives
> its interrupt pipe.
> 
> Signed-off-by: Ming Yu <tmyu0-KrzQf0k3Iz9BDgjK7y7TUQ@public.gmane.org>
> ---

...

> +static int nct6694_usb_probe(struct usb_interface *iface,
> +			     const struct usb_device_id *id)
> +{
> +	struct usb_device *udev = interface_to_usbdev(iface);
> +	struct device *dev = &udev->dev;
> +	struct usb_host_interface *interface;
> +	struct usb_endpoint_descriptor *int_endpoint;
> +	struct nct6694 *nct6694;
> +	int pipe, maxp, bulk_pipe;
> +	int ret = EINVAL;

Nitpick: no need to init

> +
> +	interface = iface->cur_altsetting;
> +	/* Binding interface class : 0xFF */
> +	if (interface->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
> +	    interface->desc.bInterfaceSubClass != 0x00 ||
> +	    interface->desc.bInterfaceProtocol != 0x00)
> +		return -ENODEV;
> +
> +	int_endpoint = &interface->endpoint[0].desc;
> +	if (!usb_endpoint_is_int_in(int_endpoint))
> +		return -ENODEV;
> +
> +	nct6694 = devm_kzalloc(&udev->dev, sizeof(*nct6694), GFP_KERNEL);
> +	if (!nct6694)
> +		return -ENOMEM;
> +
> +	pipe = usb_rcvintpipe(udev, INT_IN_ENDPOINT);
> +	maxp = usb_maxpacket(udev, pipe);
> +
> +	nct6694->cmd_buffer = devm_kcalloc(dev, CMD_PACKET_SZ,
> +					   sizeof(unsigned char), GFP_KERNEL);
> +	if (!nct6694->cmd_buffer)
> +		return -ENOMEM;
> +	nct6694->rx_buffer = devm_kcalloc(dev, MAX_PACKET_SZ,
> +					  sizeof(unsigned char), GFP_KERNEL);
> +	if (!nct6694->rx_buffer)
> +		return -ENOMEM;
> +	nct6694->tx_buffer = devm_kcalloc(dev, MAX_PACKET_SZ,
> +					  sizeof(unsigned char), GFP_KERNEL);
> +	if (!nct6694->tx_buffer)
> +		return -ENOMEM;
> +	nct6694->int_buffer = devm_kcalloc(dev, MAX_PACKET_SZ,
> +					   sizeof(unsigned char), GFP_KERNEL);
> +	if (!nct6694->int_buffer)
> +		return -ENOMEM;
> +
> +	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!nct6694->int_in_urb) {
> +		dev_err(&udev->dev, "Failed to allocate INT-in urb!\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* Bulk pipe maximum packet for each transaction */
> +	bulk_pipe = usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT);
> +	nct6694->maxp = usb_maxpacket(udev, bulk_pipe);
> +
> +	mutex_init(&nct6694->access_lock);
> +	nct6694->udev = udev;
> +	nct6694->timeout = URB_TIMEOUT;	/* Wait until urb complete */
> +
> +	INIT_LIST_HEAD(&nct6694->handler_list);
> +	spin_lock_init(&nct6694->lock);
> +
> +	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> +			 nct6694->int_buffer, maxp, usb_int_callback,
> +			 nct6694, int_endpoint->bInterval);
> +	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> +	if (ret)
> +		goto err_urb;
> +
> +	dev_set_drvdata(&udev->dev, nct6694);
> +	usb_set_intfdata(iface, nct6694);
> +
> +	ret = mfd_add_hotplug_devices(&udev->dev, nct6694_dev,
> +				      ARRAY_SIZE(nct6694_dev));
> +	if (ret) {
> +		dev_err(&udev->dev, "Failed to add mfd's child device\n");
> +		goto err_mfd;
> +	}
> +
> +	nct6694->async_workqueue = alloc_ordered_workqueue("asyn_workqueue", 0);

Missing error handling.

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
> +	struct usb_device *udev = interface_to_usbdev(iface);
> +	struct nct6694 *nct6694 = usb_get_intfdata(iface);
> +
> +	mfd_remove_devices(&udev->dev);
> +	flush_workqueue(nct6694->async_workqueue);
> +	destroy_workqueue(nct6694->async_workqueue);
> +	usb_set_intfdata(iface, NULL);
> +	usb_kill_urb(nct6694->int_in_urb);
> +	usb_free_urb(nct6694->int_in_urb);
> +}
> +
> +static const struct usb_device_id nct6694_ids[] = {
> +	{ USB_DEVICE(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID)},

Nitpick: space missing before the ending }

> +	{},

Nitpick: usually, no comma is added after a {} terminator.

> +};
> +MODULE_DEVICE_TABLE(usb, nct6694_ids);

...

CJ

