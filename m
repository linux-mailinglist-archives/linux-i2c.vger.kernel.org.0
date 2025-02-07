Return-Path: <linux-i2c+bounces-9350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9A6A2CC6E
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 20:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08D29168E2F
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 19:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F171A314D;
	Fri,  7 Feb 2025 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="owoJTPRB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D1A23C8D8;
	Fri,  7 Feb 2025 19:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738955893; cv=none; b=XThFs9r/ixYnFzY4l6ZDJOUra97iwlALBTrVJkPoFxbDhho/Rq7WMKaJSbApzN7wFpbiz3Y9KyXo4+GLlqB5O6/afI0TPFyX4xc+FYamcyE0PpRYbr/jOi1wk0zudPKnX6mKH1iT+H5zON5TQQHRaRwm7NP9QoX+/SNo37EEMhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738955893; c=relaxed/simple;
	bh=t62gH5c16fuWRM4Gx9r+e5gCavfddjCnvdWXCa8xuuo=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=Dp911DQjKhM9Q6+Jcv5g+XjW3ChwFMH3EvwAPNu7kmINvhB8AnIihQoiRpK8LU+hKhGdOSINACyvI9C/Yo7dHIg83+jdlAlffmDbdHvIPHBpgR5XeLzWfHjvYIVuJSXWVnRErvzZfa1so7F30U3PafvCeg1TeRGjyju8BuxBiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=owoJTPRB; arc=none smtp.client-ip=80.12.242.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gTrNtuENr4pO2gTrQtRSuH; Fri, 07 Feb 2025 20:18:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738955883;
	bh=Geww/XSk7fQewULTCZ4YIfK1rHBp7LYET61t8OWraN0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=owoJTPRBBYGmXW+GA+5sFCj+ma6uE2qoSXX3NkCzQM7Y3EHfBBLS7Az/g3JXVQG1I
	 VmoiMPPbr4rlhFXOVWp135XWuRBlnDIDLu24/AvQ3NW3UV/f8R7MvGJdjhYjNjHyYy
	 AUoN3e8mH/lLROqRVJeQeVXEv5sJy4+RAAxlUm92am+cQl+bEYOqpxoU7AaF65iSpt
	 u0PoaQG3UiU/wuzd31UfZY2VdhSnHURIPhpTgq7JxMcW2d6l/kKN8jvHm6RrYLXvM5
	 6yQvkDmd6yxX0UWIRUn6cEVErQROg7WK4hEZunZ23HE21Ow2JQRb5vDGAPThq8d81i
	 F7Ituc1Puwi5A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 07 Feb 2025 20:18:03 +0100
X-ME-IP: 90.11.132.44
Message-ID: <c714463f-e027-470d-82d8-3905f5107d6c@wanadoo.fr>
Date: Fri, 7 Feb 2025 20:17:52 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-5-a0282524688@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
 jdelvare@suse.com, alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
In-Reply-To: <20250207074502.1055111-5-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/02/2025 à 08:44, Ming Yu a écrit :
> This driver supports Socket CANFD functionality for NCT6694 MFD
> device based on USB interface.

...

> +static int nct6694_can_start(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct nct6694_can_setting *setting;

Could be:
struct nct6694_can_setting *setting __free(kfree) = NULL;

to slightly simplify code below.


> +	struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_CAN_MOD,
> +		.cmd = NCT6694_CAN_SETTING,
> +		.sel = priv->can_idx,
> +		.len = cpu_to_le16(sizeof(*setting))
> +	};

...

> +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
> +{
> +	struct nct6694_can_information *info;

Could be:
struct nct6694_can_information *info __free(kfree) = NULL;

to slightly simplify code below.

> +	static const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_CAN_MOD,
> +		.cmd = NCT6694_CAN_INFORMATION,
> +		.sel = NCT6694_CAN_INFORMATION_SEL,
> +		.len = cpu_to_le16(sizeof(*info))
> +	};
> +	int ret, can_clk;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;

...

CJ


