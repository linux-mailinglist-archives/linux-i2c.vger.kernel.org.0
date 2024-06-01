Return-Path: <linux-i2c+bounces-3736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9978D6EF1
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 10:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B32D1F2361E
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 08:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C3220332;
	Sat,  1 Jun 2024 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="CcxAMN5w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C65111AD;
	Sat,  1 Jun 2024 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717231254; cv=none; b=j/EVCrayk0D44LngwfTJD0DZ5i8L4uoJGxcr1Sz5GxBcMS2psvHLJJsQ9FDP65IxRA2J49d7O9mO9F2Eirl35EJ4esHSVZxq/gD0r8FtQ3U2KdkrFyCEcBb8Zh9rYFNGJh3Js5ebCdIT1jqZU490UZ4bbTRFJ97oOOJgtYauZbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717231254; c=relaxed/simple;
	bh=sF9BOyKHST//ueP1dpjJq4rkoGLKuLDyhaBu4xILE54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWdYyztJ63GTq+BrUshMjSpU15IKaNNMSFEu5CK65d75GPcLdDkucQcC4TyLS+P7CelZ0p4ErCB+9EPDtihrVrT0g3e6c2XZ+SgXnjA2pIky8/biJl7oFBfuhEBqW/V+mlXP7YiB+lx5TNad+hfc5g0QPZfkpp9Nn0Oq2dCjGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=CcxAMN5w; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id DKH2sUFIEvZ5mDKH3sPIqU; Sat, 01 Jun 2024 10:39:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1717231181;
	bh=uDIWi5FqRaEs9zERfH9KwqhtLcINKRmqH7+cDO7juLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=CcxAMN5w2n9SUWnzDnMjSIrDMG65v2mbI47yhBc7lDTBy+QT2U1zeA2Zi1+xfFA1E
	 uovCvYQ4AVbyrGVIDqto0QFZLbqwVPyobv8ECOw9e+Qk1y/LN8ZlqLA6NRpU0Sj+sg
	 D4jm+8QIy6/42X3QGJUj7rJHwkXYTQilB2Du8QlgWPgln7uKM9uc+vFg1+LaNERq5M
	 Kb17JpWUQJj2K75X6Y9adyGwXBGDWQQg518Gce6Uwrfw1Eu+XC661tph7pYgrLQXNA
	 tJC/lDguYLxMx5jvz4vYAwSb+N1RifGvitqdBNQRH2LjZQnG7dt++uCsNl1COoIKNt
	 dlM0iW41EnxxA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 01 Jun 2024 10:39:41 +0200
X-ME-IP: 86.243.17.157
Message-ID: <446b396b-753c-4114-9a8c-6f84ad3a69ba@wanadoo.fr>
Date: Sat, 1 Jun 2024 10:39:29 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,1/2] hwmon: add MP2891 driver
To: Noah Wang <noahwang.wang@outlook.com>, robh@kernel.org,
 krzk+dt@kernel.org, linux@roeck-us.net, conor+dt@kernel.org,
 jdelvare@suse.com
Cc: corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com, peteryin.openbmc@gmail.com,
 javier.carrasco.cruz@gmail.com, patrick.rudolph@9elements.com,
 luca.ceresoli@bootlin.com, chou.cosmo@gmail.com, bhelgaas@google.com,
 lukas@wunner.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <SEYPR04MB648253BF01D42B24A72B0027FAFC2@SEYPR04MB6482.apcprd04.prod.outlook.com>
Content-Language: en-MW, en-GB
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <SEYPR04MB648253BF01D42B24A72B0027FAFC2@SEYPR04MB6482.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 31/05/2024 à 09:26, Noah Wang a écrit :
> Add support for MPS VR controller mp2891. This driver exposes
> telemetry and limit value readings and writings.
> 
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
> ---

Hi,

below a few nitpicks, if it make sense to you.

...

> +++ b/drivers/hwmon/pmbus/mp2891.c
> @@ -0,0 +1,608 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP2891)
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/bitfield.h>

It is usually prefered to have includes sorted.

> +#include "pmbus.h"
> +

...

> +static struct pmbus_driver_info mp2891_info = {

I think this could be const.

> +	.pages = MP2891_PAGE_NUM,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_CURRENT_IN] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.format[PSC_POWER] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +
> +	/* set vin scale 31.25mV/Lsb */
> +	.m[PSC_VOLTAGE_IN] = 32,
> +	.R[PSC_VOLTAGE_IN] = 0,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +
> +	/* set temp scale 1000m°C/Lsb */
> +	.m[PSC_TEMPERATURE] = 1,
> +	.R[PSC_TEMPERATURE] = 0,
> +	.b[PSC_TEMPERATURE] = 0,
> +
> +	.m[PSC_CURRENT_IN] = 1,
> +	.R[PSC_CURRENT_IN] = 0,
> +	.b[PSC_CURRENT_IN] = 0,
> +
> +	.m[PSC_CURRENT_OUT] = 1,
> +	.R[PSC_CURRENT_OUT] = 0,
> +	.b[PSC_CURRENT_OUT] = 0,
> +
> +	.m[PSC_POWER] = 1,
> +	.R[PSC_POWER] = 0,
> +	.b[PSC_POWER] = 0,
> +
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.R[PSC_VOLTAGE_OUT] = 3,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +
> +	.func[0] = MP2891_RAIL1_FUNC,
> +	.func[1] = MP2891_RAIL2_FUNC,
> +	.read_word_data = mp2891_read_word_data,
> +	.write_word_data = mp2891_write_word_data,
> +	.read_byte_data = mp2891_read_byte_data,
> +	.identify = mp2891_identify,
> +};
> +
> +static int mp2891_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +	struct mp2891_data *data;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct mp2891_data), GFP_KERNEL);

sizeof(*data)?

> +	if (!data)
> +		return -ENOMEM;
> +
> +	memcpy(&data->info, &mp2891_info, sizeof(*info));
> +	info = &data->info;

'info' is not really useful. It could either be dropped, or initialised 
1 line above, so that it can be used in the memcpy().

CJ

> +
> +	return pmbus_do_probe(client, info);
> +}

...


