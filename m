Return-Path: <linux-i2c+bounces-8456-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 483739ED279
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 17:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 437CB1669A8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 16:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977FC1DE3BE;
	Wed, 11 Dec 2024 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="PPUMdDom"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B137748A;
	Wed, 11 Dec 2024 16:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733935502; cv=none; b=dMtLBq8MmJdCXGN8jdJazFjtv3JcsxoQPSBNTIB1tuEOJuuA9vknfnuj2aLygZqb3Ga8Xu9XcZvXruJKtZAK0kjZDh1lv4WK2LxMhEbObrc3Bptj+pMrUXKFgdM2fz7e9uFQV9JSZsjscBbXHic+a4jqRF4RVVZWbkjieMu9dPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733935502; c=relaxed/simple;
	bh=sAP+tRgUhnql6R7R3db5IeDRYeDczl/yF1C3ExMaCgo=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=W4IeUBTY161sOdil/mKA1TplFeRTG9YMn52GVOLTjn+HuUMkfWn1gD0p4bP+mMkFuvps9t9Rr2I6twRom3zt8GgvhebxwKtX9xDYLyxJlNEM68HjKloUep2WPKbtu3wM7t+vvNuFhO+pMMFqWPid8IGwul3ZeHt6J17NEFmGHu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=PPUMdDom; arc=none smtp.client-ip=80.12.242.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id LPpQth5h4Q2aZLPpRtbPgg; Wed, 11 Dec 2024 17:44:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733935495;
	bh=SVQEOuIW0eCozjA9frw8qm4f/i4aTd4kf39LBuuYa5M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=PPUMdDomNKLrzttqf/svHMgQjR+ic9Q4Ke8v4qJ8yx6CY73kKOm+Zl+mmQI7I323t
	 5kgRkaExDDAXYCv1CBX9cSjpb3A1BoCbk+4ORMSP7XAksYZ+s9yVHnUKcgTJfptZmO
	 gXRJI3qXgAJvvC7YFRPYn12+Xyyn1AuJj2xiOiroxwoli11iKs4Ujg1q/hr2AtMnD0
	 Hd6sjCRAQBAlcdJ+aEKdirs6A3xlcuoUAR06okRqUVgQsscXVOSdxxrqoNWNtKA7zh
	 cH5GiyDFROkKXRYq9AA/Ekfx+H9FeI4gDHcC+1QpOnCo0i4Wxf455VgKzWh+7/KwdQ
	 m4INFOLUkmOkw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 11 Dec 2024 17:44:55 +0100
X-ME-IP: 90.11.132.44
Message-ID: <47f720f8-90d7-4444-bfde-fb76ec2a2f0f@wanadoo.fr>
Date: Wed, 11 Dec 2024 17:44:48 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-2-tmyu0@nuvoton.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, tmyu0@nuvoton.com,
 lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
 linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com
In-Reply-To: <20241210104524.2466586-2-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 10/12/2024 à 11:45, Ming Yu a écrit :
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

...

> +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> +		     u16 length, void *buf)
> +{
> +	struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
> +	struct nct6694_response_header *response_header = nct6694->response_header;
> +	struct usb_device *udev = nct6694->udev;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);

Nitpick: This could be moved a few lines below, should it still comply 
with your coding style.

> +
> +	/* Send command packet to USB device */
> +	cmd_header->mod = mod;
> +	cmd_header->cmd = offset & 0xFF;
> +	cmd_header->sel = (offset >> 8) & 0xFF;
> +	cmd_header->hctrl = NCT6694_HCTRL_GET;
> +	cmd_header->len = length;
> +
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP),
> +			   cmd_header, NCT6694_CMD_PACKET_SZ, &tx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive response packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
> +			   response_header, NCT6694_CMD_PACKET_SZ, &rx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
> +			   buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	return nct6694_response_err_handling(nct6694, response_header->sts);
> +}
> +EXPORT_SYMBOL(nct6694_read_msg);
> +
> +int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> +		      u16 length, void *buf)
> +{
> +	struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
> +	struct nct6694_response_header *response_header = nct6694->response_header;
> +	struct usb_device *udev = nct6694->udev;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);

Nitpick: This could be moved a few lines below, should it still comply 
with your coding style.

> +
> +	/* Send command packet to USB device  */

Nitpick: double space before */

> +	cmd_header->mod = mod;
> +	cmd_header->cmd = offset & 0xFF;
> +	cmd_header->sel = (offset >> 8) & 0xFF;
> +	cmd_header->hctrl = NCT6694_HCTRL_SET;
> +	cmd_header->len = length;

...

> +static struct irq_chip nct6694_irq_chip = {

const?

> +	.name = "nct6694-irq",
> +	.flags = IRQCHIP_SKIP_SET_WAKE,
> +	.irq_bus_lock = nct6694_irq_lock,
> +	.irq_bus_sync_unlock = nct6694_irq_sync_unlock,
> +	.irq_enable = nct6694_irq_enable,
> +	.irq_disable = nct6694_irq_disable,
> +};

...

> +static int nct6694_usb_probe(struct usb_interface *iface,
> +			     const struct usb_device_id *id)
> +{
> +	struct usb_device *udev = interface_to_usbdev(iface);
> +	struct device *dev = &udev->dev;
> +	struct usb_host_interface *interface;
> +	struct usb_endpoint_descriptor *int_endpoint;
> +	struct nct6694 *nct6694;
> +	struct nct6694_cmd_header *cmd_header;
> +	struct nct6694_response_header *response_header;
> +	int pipe, maxp;
> +	int ret;
> +
> +	interface = iface->cur_altsetting;
> +
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
> +	cmd_header = devm_kzalloc(dev, sizeof(*cmd_header),
> +				  GFP_KERNEL);
> +	if (!cmd_header)
> +		return -ENOMEM;
> +
> +	response_header = devm_kzalloc(dev, sizeof(*response_header),
> +				       GFP_KERNEL);
> +	if (!response_header)
> +		return -ENOMEM;
> +
> +	nct6694->int_buffer = devm_kcalloc(dev, NCT6694_MAX_PACKET_SZ,
> +					   sizeof(unsigned char), GFP_KERNEL);

Why for cmd_header and response_header we use a temp variable, while 
here we update directly nct6694->int_buffer?

It would save a few LoC do remove this temp var.

> +	if (!nct6694->int_buffer)
> +		return -ENOMEM;
> +
> +	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!nct6694->int_in_urb)
> +		return -ENOMEM;

...

CJ


