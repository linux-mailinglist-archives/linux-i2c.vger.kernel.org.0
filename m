Return-Path: <linux-i2c+bounces-201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 560057EE8FB
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 22:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41B51F24C62
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 21:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E04495E4;
	Thu, 16 Nov 2023 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtRkkNwf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A5C11F;
	Thu, 16 Nov 2023 13:53:03 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5c1f8b0c149so499046a12.3;
        Thu, 16 Nov 2023 13:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171583; x=1700776383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6C9AZL6xuvaw9TUCVtQuHjnxGIMH+zJ13tnQH5dBkZE=;
        b=gtRkkNwfJGoShFNZF04TeLD2uD63PsUXm6TORBHJ/0nKNVCCi9R+FWUpGZ6APmZAzG
         39z4KgwqOF0SOrRaPHJqfijW2K4Xzkb9oiAYL4/G01imExMfKr0Vivd8F12vvrI8yw0H
         Um5rryh/FD2mdWEhG9y8GuYhT89nFH2IUJcKSGuoGnTrIuoZvuXneIxzUgMfNuXJCZTH
         KgxkisMiCUsDRMZGjlDLvsrgufDdPOFpAQF+E02NgEmmKlBK95MmWRw2d0FhirBp1PZU
         YIOsSeyfqGsPs93YQkax2m04F7qxTT81Z9TFj2CRbMxw82wc3aG0CsKVx2ZxKQk6ydhr
         f4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171583; x=1700776383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6C9AZL6xuvaw9TUCVtQuHjnxGIMH+zJ13tnQH5dBkZE=;
        b=BeGmdAgcA9rtAXH/Rrp1cf54OIhHofczb6HBuc64gtkPlW+/f0Paiy91OXhHeBEuAQ
         LElfwZMfo4X4xYzQuxegIt16SLkRDIQAyLjy4dgxohP4xeSc/uD96mvUwaNgQtS7MpKO
         O3FYOKW/QfTZ3lQp3ctp4HNK7/nDicqaNKfZ7C8Z5x9GQVhiPb32QiUfqfrQkgFMl5Hw
         u833wTKp5Sw5MHHj+gNKrrdBHD6rYHCb76fx8HBMeyarCwmiWMwjZoKcBGA/gkGfQRjk
         nx8/EKbiNsUu41evoqGCTk7ujn7k1g9hqFVEoQweB96Q8iqytlU1UNNPnqV7DBLkyhDx
         TrbA==
X-Gm-Message-State: AOJu0YzHJiLjvAOXksL1zFy9IsOEAU+yJYbQ8068clDtb7gbXy6p10Hj
	AFKiqa95y98YsQHMKU5MmlM=
X-Google-Smtp-Source: AGHT+IFmlZ7+0Z1cztjaS5xXqOKocmLLq6Xgy++RtEF26Fl5qnKdIu1mkWfw/y6y3FCTA8TeAs1qFw==
X-Received: by 2002:a05:6a20:a112:b0:14c:c393:6af with SMTP id q18-20020a056a20a11200b0014cc39306afmr16401691pzk.0.1700171582658;
        Thu, 16 Nov 2023 13:53:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cm7-20020a056a020a0700b005b92ba3938dsm137240pgb.77.2023.11.16.13.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 13:53:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <780fd479-a3c0-49d0-b632-4bff171fe067@roeck-us.net>
Date: Thu, 16 Nov 2023 13:53:00 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] hwmon: pmbus: Add ltc4286 driver
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231116023027.24855-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231116023027.24855-3-Delphine_CC_Chiu@Wiwynn.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231116023027.24855-3-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/23 18:30, Delphine CC Chiu wrote:
> Add a driver to support ltc4286 chip
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> 
> -------------------------------------------------------------
[ ... ]

> +	/* Default of VRANGE_SELECT = 1, 102.4V */
> +	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
> +		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
> +		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
> +		if (ret < 0)
> +			return dev_err_probe(
> +				&client->dev, ret,
> +				"Failed to read manufacturer configuration one\n");
> +
> +		ret &= ~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6V */
> +		ret = i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1,
> +						ret);
> +		if (ret < 0)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Failed to set vrange\n");
> +
> +		info->m[PSC_VOLTAGE_IN] = 128;
> +		info->m[PSC_VOLTAGE_OUT] = 128;
> +		info->m[PSC_POWER] = 4 * rsense;
> +	} else {
> +		info->m[PSC_POWER] = rsense;
> +	}

My feedback has not been addressed.

Guenter


