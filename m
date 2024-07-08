Return-Path: <linux-i2c+bounces-4774-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CDC92AB73
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 23:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 303FB282503
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 21:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D309014EC61;
	Mon,  8 Jul 2024 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5yEIF7M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5E149C57;
	Mon,  8 Jul 2024 21:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720475145; cv=none; b=Cn7BtTPCXMr109qOP8PzJGaNlmtgJ5JZ1wy2h8VcQ/3Myjd3TSQbqweost0t8ok2lx9glEBdHEo0WRFAtu43yvyR4GVpSmZs6w5pmMz91RKdGtvM7zBsbV8MD+v5UED+sbXDs0Y5q3EhwQ6wdzM8G4d9H5CWB0mJBtyFsH6mFVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720475145; c=relaxed/simple;
	bh=+ae8pg1lKkpGlOeMfZCLm0kbUy557ShXe/omxZLskjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQ+LkZttQde+dhH0KD3Ti1fqZTqlNzPfWX0eNPu/i3YnMAYAjX54fSxDSYf6KOdidwBActzBOmon8uaKBoBpTUF0F54gm0PM8P80egRvqc6QUhxzNi1WXfFYGPIHWJiy7GBE0Rxqs3BHMczM18uta6fOLF0nbnmZ2dRvipkBls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5yEIF7M; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-75a6c290528so2311825a12.1;
        Mon, 08 Jul 2024 14:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720475143; x=1721079943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCU3c2nAd7aJdRcBLdbkRzXUYEZGaosmRWTEVwbkU6w=;
        b=f5yEIF7M3s5j1N+3VTe+FSXAgIz/ejZRx7gRht8iQrJi7x/39XEqqh3M0SJo3Ti2P2
         rlZgAutHcrUr876WvsW5IKWsS26Jgw8K04640/pSMYShiTdzzQQuupOEO6yHTuyArLb/
         LUyT4ShKEjWV8tEMbMyVpfuqfJ4+qEkVjRQMd4SaDP1PwMSujXbrnU7au5ckgLiuL41D
         ScvA4ofFrK3cCBTyixLXfq7I2wel8XLx6uH0wBW4wfx+nmHbVlTmthQkFvBfMrozPJWV
         bK2WasaoWsBh6VBR4YttuWOAuoTPMqzZTckhUT1+WtbaYbcHEww1oe2RYnr3A+IywDKE
         DsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720475143; x=1721079943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCU3c2nAd7aJdRcBLdbkRzXUYEZGaosmRWTEVwbkU6w=;
        b=X5xeWgbEBtAxjbqCBgJ7Zh1avKExbQc6XdH39o7BExUzIIpZT+h1trv0K+jkGacvOI
         1zf/eYELmOm8/zX6LXXMb+AW7cOlQagmVKpVdZtBHHogapa5/pIAG3gWXplYICyPzmBj
         UyV5KjUznaDUwo8xiYwEiMRhaBKPCZKO9WZyv1OOfwy8fFSUltsQqwnrFptLIdE+GK/X
         9Wj7TcxR93xZRH78nsNLpyVZ44mcTM4VXs/j02wl9dogO86FJklg9AwDa3zLY1svDQN9
         Orok5c2zUFUEmQnMLyB3p7Y21wqkk+JF8yQGoMzv2phRJ5WjId9GIKksU/aX1LiJaSBx
         wsWw==
X-Forwarded-Encrypted: i=1; AJvYcCXMUvEBjd4IVtJj1wkUQIg/QdCqld8jYZA9goC2M/ZtPRPCHKsN5Zr6j85CiJ1nJBJnJRspBl5zYTPSwfxoeK88GAu0aEfFZBcjwCp5EfDlUYioQkD3mIi7J+ukzxMMaJihv06bK7PfrMdbrjIzQgtqpzZZc0YpT0bZYEWVHmyrKbjLh+h0
X-Gm-Message-State: AOJu0YyGMHINq64lbRAyFnC0tUafuTpk6zNQOBicyRvH62fycTBUjR0d
	i5DDDyV2M90ga5vYdv3Rkm98LnmM1OeeaOGhgpR+q4fmhGFZ2XVr
X-Google-Smtp-Source: AGHT+IGVa/Isf9H+e8+4NivDbgTeA4ktp0isulq+ODjXuA8oyJMRlgUb0nG0ofIfTiRW70PZb765yQ==
X-Received: by 2002:a05:6a21:3393:b0:1c2:8e77:a813 with SMTP id adf61e73a8af0-1c298205f0dmr843724637.1.1720475143018;
        Mon, 08 Jul 2024 14:45:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a0fc20sm3376065ad.2.2024.07.08.14.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 14:45:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <12045925-7876-492a-952b-7ecf04bcddb8@roeck-us.net>
Date: Mon, 8 Jul 2024 14:45:39 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] hwmon: (amc6821) add support for tsd,mule
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
 <20240708-dev-mule-i2c-mux-v5-4-71446d3f0b8d@cherry.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-4-71446d3f0b8d@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/24 09:12, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which is an amc6821 and other devices that are reachable through
> an I2C-mux.
> 
> The devices on the mux can be selected by writing the appropriate device
> number to an I2C config register (amc6821: reg 0xff)
> 
> Implement "tsd,mule" compatible to instantiate the I2C-mux platform device
> when probing the amc6821.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>   drivers/hwmon/amc6821.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
> index 0661cc6a6f8e..93c3b79b5f13 100644
> --- a/drivers/hwmon/amc6821.c
> +++ b/drivers/hwmon/amc6821.c
> @@ -22,6 +22,7 @@
>   #include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/of_platform.h>
>   #include <linux/regmap.h>
>   #include <linux/slab.h>
>   
> @@ -895,8 +896,17 @@ static const struct regmap_config amc6821_regmap_config = {
>   	.cache_type = REGCACHE_MAPLE,
>   };
>   
> +static const struct regmap_config amc6821_mule_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,

Unnecessary since the maximum possible register address is 0xff.

> +	.volatile_reg = amc6821_volatile_reg,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +

Anyway, don't bother. Just drop max_register from amc6821_regmap_config.

Thanks,
Guenter

>   static int amc6821_probe(struct i2c_client *client)
>   {
> +	const struct regmap_config *config;
>   	struct device *dev = &client->dev;
>   	struct amc6821_data *data;
>   	struct device *hwmon_dev;
> @@ -907,7 +917,10 @@ static int amc6821_probe(struct i2c_client *client)
>   	if (!data)
>   		return -ENOMEM;
>   
> -	regmap = devm_regmap_init_i2c(client, &amc6821_regmap_config);
> +	config = of_device_is_compatible(dev->of_node, "tsd,mule") ?
> +		&amc6821_mule_regmap_config : &amc6821_regmap_config;
> +
> +	regmap = devm_regmap_init_i2c(client, config);
>   	if (IS_ERR(regmap))
>   		return dev_err_probe(dev, PTR_ERR(regmap),
>   				     "Failed to initialize regmap\n");
> @@ -917,6 +930,13 @@ static int amc6821_probe(struct i2c_client *client)
>   	if (err)
>   		return err;
>   
> +	if (of_device_is_compatible(dev->of_node, "tsd,mule")) {
> +		err = devm_of_platform_populate(dev);
> +		if (err)
> +			return dev_err_probe(dev, err,
> +				     "Failed to create sub-devices\n");
> +	}
> +
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
>   							 data, &amc6821_chip_info,
>   							 amc6821_groups);
> @@ -934,6 +954,9 @@ static const struct of_device_id __maybe_unused amc6821_of_match[] = {
>   	{
>   		.compatible = "ti,amc6821",
>   	},
> +	{
> +		.compatible = "tsd,mule",
> +	},
>   	{ }
>   };
>   
> 


