Return-Path: <linux-i2c+bounces-2394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ECC87ED24
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 17:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70561C219A8
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 16:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C495337C;
	Mon, 18 Mar 2024 16:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RA8YGDjO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82095537F7
	for <linux-i2c@vger.kernel.org>; Mon, 18 Mar 2024 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710778363; cv=none; b=bHChgN0H9Q0exssYjx27ufs2Zvn3KZI1LUYKI2VaJ6GfZ2qTYu/malHOXbm/xRlWEoFg07unbFHwYDQiXf3GE1yGnlv8U61ppuD+0u8rVVbGgn+juvXNwtnT6/uo+vi48k/rY/yXyBnIOPh+IXaa9NhJBlq821uQgZ8pIHIRxy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710778363; c=relaxed/simple;
	bh=qWIWRdlhHxM2YpAOK/CdrCJzY7erfxdMa6eYTRm+3dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aYzd0kEQeOyZPhtt1RFGdrPy4fs6uM/OErVighx/Wu8E0R84f06ZVMrgTRPwPXVHQ6z7Lb3dR/tXBcrhD31+b3H2xi2Ac1zRSs2JkhNylMbsxrlzsYP/V9RS1IuudwSBimm0tT3wJBqCERTlUtO9InGBc0YiGI4nKUcmNZ7H6RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RA8YGDjO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d485886545so73041511fa.2
        for <linux-i2c@vger.kernel.org>; Mon, 18 Mar 2024 09:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710778360; x=1711383160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9oKEy66iQx7fLJGG39Ko2q9eHHj3gCyG5CIVLyLT/E=;
        b=RA8YGDjOJMIoNz4+OUKFaBLtLr8J8Ocy3rMUGM9RIPCwSeVxIrXz8ESllrm9zZnKZv
         jUaKcL/KWDI1tcahpkZAivgU5Lnb5TKWVO4UEJBYS4UwujTq5EUmOkp1U4YnAeGLOV3x
         IdH6xjopRgehIVTIF1ScHzIxeCFj4ydMoRIcMdqUTgdNSxuKut6Sq42HW19sigZJyX2m
         6PW8nn3nzX1HFZjei1Ph5BacvvozHDkiG6yvljnzKlpPBKyjK3cTjZJc/h32DaxZ68r7
         n6Lfd5EKULExqCx5yGzQBdG4XXYDljJ4VOZUUugssf51tG3vXHzEGq13zssSGuyNagda
         9MWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710778360; x=1711383160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9oKEy66iQx7fLJGG39Ko2q9eHHj3gCyG5CIVLyLT/E=;
        b=fNH267Oi+4FTBeWBMO7S68WH2blUqYACA8cuZCy77NvlK5MLAP/QFgMLTtaex06wnP
         XFeqvFytAWXpE2O9qvdKqMNHTubQKf9Z5yXnlSu2RNDD8/GclE4qoKcoge1qkTplQi2F
         Py4lkuG1W779GT/sdCB72JzyVjUc7csoV6R65bvJnNUcf9XpZNSBpefsJHhzm4Ufe5XS
         3NxaAwMyMxON+Pgxn8H815xjMH5x2YbS7JwbCoxd6mQdOWW2rLlTeeieOPOXtKaIrTnC
         +4J3Vq0GDTJYmOr5x9nnQI6somcClUd09rMw6g5jnbpqz3izM0HKRmpSPGWQYxonhCA8
         KxCw==
X-Forwarded-Encrypted: i=1; AJvYcCXLsRInBlorLBlqW9V69iQP6k7dYzqaTZCFueanEzYFFfr5xmcQeYWPa4jEl3L/19FRpxbJZmLWj2OyH5Z5kFs5etvzw6nu8MgW
X-Gm-Message-State: AOJu0YwFPv7wE9M7pL91JdhuytRxal639CbcPo0Mz50PnIQ+majukrqD
	J5xKTrHif1zG2HsArNSklKwty/30IzshGGr7g47hqREn1KZ+tJkWIM6yKeW4OaY=
X-Google-Smtp-Source: AGHT+IHR94yES1pCaCbXUjgif8jE41k55vx1ZSsmjTkcDG0R6oz5GBnNbcczlwrVj1NsdRYJt7/t2w==
X-Received: by 2002:a05:651c:337:b0:2d4:513d:7b34 with SMTP id b23-20020a05651c033700b002d4513d7b34mr4857648ljp.17.1710778359619;
        Mon, 18 Mar 2024 09:12:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id e25-20020a170906845900b00a4652efd795sm5016635ejy.83.2024.03.18.09.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 09:12:39 -0700 (PDT)
Message-ID: <04b39945-e4e1-43bd-83bf-0d7eb3730352@linaro.org>
Date: Mon, 18 Mar 2024 17:12:37 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: pmbus: adp1050 : Add driver support
Content-Language: en-US
To: Radu Sabau <radu.sabau@analog.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240318112140.385244-1-radu.sabau@analog.com>
 <20240318112140.385244-3-radu.sabau@analog.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240318112140.385244-3-radu.sabau@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2024 12:21, Radu Sabau wrote:
> Add support for ADP1050 Digital Controller for Isolated Power Supplies
> with PMBus interface Voltage, Current and Temperature Monitor.
> 

...

> +static int adp1050_probe(struct i2c_client *client)
> +{
> +	u32 vin_scale_monitor, iin_scale_monitor;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_WRITE_WORD_DATA))
> +		return -ENODEV;
> +
> +	/* Unlock CHIP's password in order to be able to read/write to it's
> +	 * VIN_SCALE and IIN_SCALE registers.
> +	*/
> +	ret = i2c_smbus_write_word_data(client, ADP1050_CHIP_PASSWORD, 0xFFFF);
> +	if (ret < 0) {
> +		dev_err_probe(&client->dev, "Device can't be unlocked.\n");

Syntax is: return dev_err_probe(). Same in other places.

> +		return ret;
> +	}
> +
> +	ret = i2c_smbus_write_word_data(client, ADP1050_CHIP_PASSWORD, 0xFFFF);
> +	if (ret < 0) {
> +		dev_err_probe(&client->dev, "Device couldn't be unlocked.\n");
> +		return ret;
> +	}
> +
> +	/* If adi,vin-scale-monitor isn't set or is set to 0 means that the
> +	 * VIN monitor isn't used, therefore 0 is used as scale in order
> +	 * for the readings to return 0.
> +	*/

Please use Linux coding style comments. /* and aligned */.


> +	if (device_property_read_u32(&client->dev, "adi,vin-scale-monitor",
> +				     &vin_scale_monitor))
> +		vin_scale_monitor = 0;
> +
> +	/* If adi,iin-scale-monitor isn't set or is set to 0 means that the
> +	 * IIN monitor isn't used, therefore 0 is used as scale in order
> +	 * for the readings to return 0.
> +	*/
> +	if (device_property_read_u32(&client->dev, "adi,iin-scale-monitor",
> +				     &iin_scale_monitor))
> +		iin_scale_monitor = 0;
> +
> +	ret = i2c_smbus_write_word_data(client, ADP1050_VIN_SCALE_MONITOR,
> +					vin_scale_monitor);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_word_data(client, ADP1050_IIN_SCALE_MONITOR,
> +					iin_scale_monitor);
> +	if (ret < 0)
> +		return ret;
> +
> +	return pmbus_do_probe(client, &adp1050_info);
> +}
> +
> +static const struct i2c_device_id adp1050_id[] = {
> +	{"adp1050", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, adp1050_id);
> +
> +static const struct of_device_id adp1050_of_match[] = {
> +	{ .compatible = "adi,adp1050"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, adp1050_of_match);
> +
> +static struct i2c_driver adp1050_driver = {
> +	.driver = {
> +		.name = "adp1050",
> +		.of_match_table = of_match_ptr(adp1050_of_match),

Drop of_match_ptr, you will have here warnings.

> +	},
> +	.probe = adp1050_probe,
> +	.id_table = adp1050_id,
> +};
> +module_i2c_driver(adp1050_driver);
> +
> +MODULE_AUTHOR("Radu Sabau <radu.sabau@analog.com>");
> +MODULE_DESCRIPTION("Analog Devices ADP1050 HWMON PMBus Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);

Best regards,
Krzysztof


