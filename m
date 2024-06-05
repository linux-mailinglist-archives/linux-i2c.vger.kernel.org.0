Return-Path: <linux-i2c+bounces-3837-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8C8FD844
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B1B91F27782
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5AE15F418;
	Wed,  5 Jun 2024 21:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLgiqi07"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A267139D00;
	Wed,  5 Jun 2024 21:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622299; cv=none; b=W4UvSV5m27FoYrKIOiQREGRD+6K84SYjXQdecd04lSddfIBpcdQ7uSXsII5sQAg12DFBv7lzag8/VXdtK+NI0LqVDNgMRlPxEvNKxRaZ1z69hyjZ5Dxdpq5LLVHXSCileU0F/U5TnigH5+qfcpz71iqXceJlzeTpuPdAkMcyYHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622299; c=relaxed/simple;
	bh=PohwR8Nc3tGOVCXQrntYVzc2LTggmjtaIiB8D9Q5S7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQ7VQMakft3o3AbqD86dxq0A4qnhci5vSTVCQnjJeeKUJSL7mxq1Qi8KVt/NiGvNXpy/odkKmAvQWKTQBg/GK+Oqhziz6aqn1Dy3mqCE/BldorLJUk+IRXz40aOPYlxXfatPDj086lkMPx9/1t075zPrmMgZjpcV6c/WYlv27+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLgiqi07; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c2999f969aso266485a91.0;
        Wed, 05 Jun 2024 14:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717622297; x=1718227097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0TC939jtnzolf29JXwiWps/F6ODviUjUE8F+jRVq7Bg=;
        b=GLgiqi07/MSvYFoKe5KyxJxMatiS1/XeL76Z7KKKezOVeDU/i2VvuSrv7mzgPl1IO5
         deG6KP5QB98PuJT1BAkTafqfCaBXt3am507pLu94RKnI2hHNeroLDgKLEhoC9BX+YJcd
         AlRpacHW5ypLuEqCEYgOYclRprrWXvyok15E925V0dIeKfIACny9WD9eo5qYzioQsHOL
         GzYDG72r7Jc7wQYXUeOv6tNOhZtbiiRjrMRyAo6Oi9Zrfj8Lhu5jMFTREbQa/P+xQp5m
         6uJSph+i5hJtC6Mqz9IElUhFF8Tet7PQAq99mz/qP8aVe3dIxVqmXvTHQhHqHFL82A55
         4lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717622297; x=1718227097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TC939jtnzolf29JXwiWps/F6ODviUjUE8F+jRVq7Bg=;
        b=qZjWlTohkHpmrBF0IZ+X/1fVS22ndZMYxArbgmk2UqsOStJpaopZtXBTv3YmB1l/32
         0Fldm+JqDBpGUQc1xt9WVIA4DfZzdB0V9gTgLlbiWvvLDCivxmxds4TLNzvNIKRCMC+n
         o9yCiOPlTQdmThUgsNID/R5ENq/8VWbNKUNaTAoTnLaP2NHnelpolYyErVf5YrtdZ2Hy
         02ORb1Of/ZT5+2lrBkcz20ArHvk8djQZ6atud9LmXm5XO6N2tu9W+xjhqH+9G1ZU9BIh
         dEaLN2AobV5xI+m+/uLsNEx4uiDKE+96P2Xea2Aehi2jEltHFtrr110VSL3HZIGHy9O5
         8lIA==
X-Forwarded-Encrypted: i=1; AJvYcCXRkSyAKPE04VLOJhBa+6LzeY3GciE7YlBVAVhKbRsV0Fi05nzjAEVzLcMkOxoi92mFdMqVWlq/iVcP7337RmbFp0+HELZUkiL+k4ZwNzlKKPexWnoGHD4CcOunyN7/ZPpcANjW93JUddPKmCxq1AedamZuNnkj0wiPR0yQuWxEjryjEJlexlXdpkJJYCcCaWEZmL1OAKC8Zpbn+YdJQ7hwl+SGY3k+XbgmgWtgNp13/dky8uXEG87KHBBZRrrqCWrzXBwFKdKdwpKsHm+9z188R8s4eFmvZyqwfn9H/7y3oPpv1UauCdfKon4Y2R5WiXa9Bm3zejRnT/AkzS7zD4rYQ/hzH5niD6OXGX9DYVM=
X-Gm-Message-State: AOJu0Yxirisr15ZoGrB2T5y4nuVkxatPNwNa67ptWz2rfpUGyThCC70K
	5hovAv51BZSKoNYGnixOFPo6WsddGoJO1WB/kU+0m0HSGN0gk17K
X-Google-Smtp-Source: AGHT+IH6mpaSlgZbj9wjlN2+g8jBX7TUrx4Tkes9rmgCSfmSHpu1TLrHJW7JJ/KoS4CQMuRhy5Masw==
X-Received: by 2002:a17:90b:128e:b0:2c2:8d2c:8292 with SMTP id 98e67ed59e1d1-2c28d2c8317mr2042051a91.48.1717622296577;
        Wed, 05 Jun 2024 14:18:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28066d59fsm1922215a91.24.2024.06.05.14.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 14:18:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <20a9ea0b-74d0-47b2-8dc0-2b5e7d070d38@roeck-us.net>
Date: Wed, 5 Jun 2024 14:18:13 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/17] misc: ds1682: Change nvmem reg_read/write return
 type
To: Joy Chakraborty <joychakr@google.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, manugautam@google.com
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-6-joychakr@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240605175953.2613260-6-joychakr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/24 10:59, Joy Chakraborty wrote:
> Change nvmem read/write function definition return type to ssize_t.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---
>   drivers/misc/ds1682.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
> index 5f8dcd0e3848..953341666ddb 100644
> --- a/drivers/misc/ds1682.c
> +++ b/drivers/misc/ds1682.c
> @@ -198,26 +198,22 @@ static const struct bin_attribute ds1682_eeprom_attr = {
>   	.write = ds1682_eeprom_write,
>   };
>   
> -static int ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
> -			     size_t bytes)
> +static ssize_t ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
> +				 size_t bytes)
>   {
>   	struct i2c_client *client = priv;
> -	int ret;
>   
> -	ret = i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
> +	return i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
>   					    bytes, val);
> -	return ret < 0 ? ret : 0;
>   }
>   
> -static int ds1682_nvmem_write(void *priv, unsigned int offset, void *val,
> -			      size_t bytes)
> +static ssize_t ds1682_nvmem_write(void *priv, unsigned int offset, void *val,
> +				  size_t bytes)
>   {
>   	struct i2c_client *client = priv;
> -	int ret;
>   
> -	ret = i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM + offset,
> +	return i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM + offset,
>   					     bytes, val);

i2c_smbus_write_i2c_block_data() does not return the number of bytes written.
It returns either 0 or an error code.

Guenter


