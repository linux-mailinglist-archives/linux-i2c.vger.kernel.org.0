Return-Path: <linux-i2c+bounces-8418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA509EB393
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 15:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 729751882DBB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 14:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDED51A38F9;
	Tue, 10 Dec 2024 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vo4pWOiW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9151A704C;
	Tue, 10 Dec 2024 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841525; cv=none; b=AjXBET5FtY22whkRCQYAb1UvmOu3pAboGM9hoQnFRo1MeFFmMGvhAfLvre7sUgiQzXSPN7EoWHF5Yws/L7lstnKNj5mt/dNZ10CZInHuGRuAdCdZQVvJf1CtTdBpOKMflNayvN6XupajPcUiaIG+XVyVT2s4sDAr4Kdt/IIvvjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841525; c=relaxed/simple;
	bh=4ptCUxlg3CS8R0UKDc4pEafLSFTcKyhRiAR5SRLDvcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIEs2ejJATF/dRRf7zMgigUCgS1BXI7tckCz4bjuYOFrZGXY96gmhx+uedM5RqFAfHirjNEPiB/EPOHHdtTQYwJ4EWZGqTIcjPjrI2zVzLD3Jfefudc3TgHgoPYTdRe2t1/QUcg2OgzSrIHT96hqoAB9vD6iNWY4CJ59ozJk8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vo4pWOiW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF30C4CED6;
	Tue, 10 Dec 2024 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733841525;
	bh=4ptCUxlg3CS8R0UKDc4pEafLSFTcKyhRiAR5SRLDvcA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vo4pWOiWSMnqeNGo33PfVZJSLxQ0uefa7VrHqCv3pinOTN79UdAMNguDjN1Be9anB
	 xgDV0/TEQn7g1IAGJNnl76QyCIHStyd8afga31/p+OGduaGNkBcjKRDPtNvhzq+8C6
	 TR2GlFFB8HRkMyZ2qUI15VOdOO8hSpX/skTlbtKGVW8ncAVWK0JIL8W1bUAwmbWT05
	 OSPRA1s/CUITQBqwot8FhO1fcvDyDiGB75WvqY7tetI7MjaqU78EJzDACJzf9P1SJB
	 G6qwEhheQK2T8qqWAZgBNsu+qjgdoWfDsAG4fHGsQWCa42fwSNWekzOXobcoVZk5r6
	 u0lObBPlWWlrQ==
Message-ID: <68d1490a-ba67-480b-943f-afa56e5b8436@kernel.org>
Date: Tue, 10 Dec 2024 15:38:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
 jdelvare@suse.com, alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-2-tmyu0@nuvoton.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241210104524.2466586-2-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/12/2024 11:45, Ming Yu wrote:
> +	nct6694->int_buffer = devm_kcalloc(dev, NCT6694_MAX_PACKET_SZ,
> +					   sizeof(unsigned char), GFP_KERNEL);
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
> +	if (!nct6694->domain)
> +		return -ENODEV;
> +
> +	nct6694->udev = udev;
> +	nct6694->timeout = NCT6694_URB_TIMEOUT;	/* Wait until urb complete */
> +	nct6694->cmd_header = cmd_header;
> +	nct6694->response_header = response_header;
> +
> +	mutex_init(&nct6694->access_lock);
> +	mutex_init(&nct6694->irq_lock);
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
> +
> +	ret = mfd_add_hotplug_devices(dev, nct6694_dev, ARRAY_SIZE(nct6694_dev));
> +	if (ret)
> +		goto err_mfd;
> +
> +	dev_info(dev, "Probed device: (%04X:%04X)\n", id->idVendor, id->idProduct);

Drop. Duplicating existing messages and interfaces. Your driver is
supposed to be silent on success.

> +	return 0;
> +
> +err_mfd:
> +	usb_kill_urb(nct6694->int_in_urb);
> +err_urb:
> +	usb_free_urb(nct6694->int_in_urb);
> +	return dev_err_probe(dev, ret, "Probe failed\n");

No, this should go to individual call causing errors so this will be
informative. Above is not informative at all and kernel already reports
this, so drop.

> +}
> +
> +static void nct6694_usb_disconnect(struct usb_interface *iface)
> +{
> +	struct usb_device *udev = interface_to_usbdev(iface);
> +	struct nct6694 *nct6694 = usb_get_intfdata(iface);


Best regards,
Krzysztof

