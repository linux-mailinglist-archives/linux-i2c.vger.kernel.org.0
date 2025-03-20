Return-Path: <linux-i2c+bounces-9933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E9BA69F04
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 05:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA662189637B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 04:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2651CAA81;
	Thu, 20 Mar 2025 04:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI4PtD23"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0621026AF5;
	Thu, 20 Mar 2025 04:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742444657; cv=none; b=Ab2+40CZRb72I1cwDy5vLZ1dhnxmYcCoE6mfewaIl02WbUC79O0rnnFlMT6fSTgACbe8+0srWnnviwKy5ua0Rcvlt85gvNGB2AfBoNubj5Bsyg3pt/J9a+SKY9vbDeH6yypzr8kS4+rroQrROhuE4BlYUNAVC0YpAMsKUUyXxFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742444657; c=relaxed/simple;
	bh=xyoQy4QCFjkw/FO+d+IS7VhRohdUCRA8Lp1qI7AixA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHcnAgWl5nq1wvvI/OotFX0fo/UdEDRclDMeWWo950uvFGfDuo0ayNA1j+l5iBxuzq+0xxhEVKLA7zYvj47k0PjmT1ut5sOZBdkIGwI9bCaPyqR0hQIUZjh8Dnp60MFlYOq61srMbKdYYI8+sNmVftyvgGveeTvgeddIkrjjWlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hI4PtD23; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2260c91576aso4135885ad.3;
        Wed, 19 Mar 2025 21:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742444653; x=1743049453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ljnN7j4An65KzkMVAC4+EUjyK/smzNqsP2jVVbQb7sQ=;
        b=hI4PtD23i5XP/LUzs6zoo9yHhY4vvGISWDZOdLYklLy6F7u7OPe63M6chE2CYqJykg
         dVMjtmVuEm56dvAhyiMoXQcl63XAEUZCB38NCi9yP1oceex/xgurfjMP3piGDuUktwSg
         0naqL5CrV7V/6Nrzbgp/fFcDHSieQQG+U3j+UeQrM3Keiv6YlruS8r8k9oV2LAlViwdQ
         RVylgeDjNPZ+XH5MR3qIlUhQtrm+EwnqiJkZdnAgykvDcO7eiB+REoJ2mrwOUH1zCl2e
         eFSRNlPVr9mZlKIZU2mew5YJSzq1/jldVtcPHni51Qr4b6GBi/2iATbso7dZ8MMfu2kG
         CdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742444653; x=1743049453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljnN7j4An65KzkMVAC4+EUjyK/smzNqsP2jVVbQb7sQ=;
        b=a6r5dLL3q0gtU3qjomtg8umsQdgLhB306Mp/Z7dwc+TuDj1Wp6BqbAkkqf+XaYHVtQ
         yrpXhbbRD0AlEIzMW07uuTINQoug/HLLzuc7LXl525zLie79nxRgLCBm8RL6eWmwqAhE
         cDDHVRwreKfBSkUafIGyoYjPkBu4xDGj2mZ9PnryrA+ocNebSpwh041F1cREkvKQyrJ0
         1wvj20aeoQ5HU5oQdx3/z7Wc765RiU40hH6FEPOK+JYhwqtl8K5kwls+kQIaOVLwSeWB
         Md734QYCKmHQgjjptlATbc01AUaVASS7Y4mqVkgzTiT3Lu1i9vuArqfN/ExiELKeIivA
         DAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaTjajAGrNqfZu1Fx4P6LgvH6v4AWOQ1vsfxC9h/YmfL+zJ70RK0rUQRH6prEhEERNRIUvzTsBsK4=@vger.kernel.org, AJvYcCX9I+qoSHY7mZMPzK2YP0AYy2xB/MeRatHMOFYpwofwY1g5ByeX879sBuPljovClExhJp2QnLwx6EvOZbLm@vger.kernel.org, AJvYcCXU2OT8bWdAmjM+W45t/TerST2D3DuQbrItsmVkN/QmpuzQDN5HPuovwQ46hfW+6mTh73r9C4+JAxnj@vger.kernel.org
X-Gm-Message-State: AOJu0YwdU9AzAqOAyeDrVjJswI0umS4jSbIqwu3O0eHJy1m7ET0yAQQ8
	X31WqSlp1g2DpaAEMEqxKjcRxTmjJsay+etkp/ziWATjpcsYtYK9fCo+DA==
X-Gm-Gg: ASbGncurW7IV2wR0e1/z7lcbpuRPftmmCIF42jtas5B5hGiHYrsc7ha7uDdGhH1cp2R
	oRbaty5Pzfqu/oY90Cv7exTdOCkp8VClPwsFxO0AEWoIiYHwM+a1/lcGhoKXv9Qe9MH9jmr88nX
	bb5XojbOuIdVgGunRM7VPBEQek3pShSrSZwHOeFpXAdZM5HVVTg6EPfZo+AUMkl+GhDnOgna1Dd
	xJEdDnryAoLDnCuGvRflpPZgL2d/Crx9DLweSROFv4Db+Iv8stIJv4Nq5+D7NcMUWvQ3p/K+L0S
	LPJUHTaC83N4Q3A2i2x8IBhI7EsLWRAO3qe5xt8xhaKQtysBTY1+IPOOP3s2NuvDXUP70FgSSyq
	iL2BN6X9t/u98KOXMWw==
X-Google-Smtp-Source: AGHT+IFxQVFMZd40pFW2PigeoaVHNJQpNzK4XnPD8V7CFk9Ho+EntMPP/GkMK2yz34UbA+nwLSqsCg==
X-Received: by 2002:a17:902:ea06:b0:21f:61a9:be7d with SMTP id d9443c01a7336-22649cb6990mr67971065ad.49.1742444653049;
        Wed, 19 Mar 2025 21:24:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167da42sm13084987b3a.105.2025.03.19.21.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 21:24:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <80259b75-dfa6-4e49-8d9d-9edd72ae672f@roeck-us.net>
Date: Wed, 19 Mar 2025 21:24:10 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (pmbus/max34440): Fix support for max34451
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250320-dev_adpm12160-v1-0-8f7b975eac75@analog.com>
 <20250320-dev_adpm12160-v1-1-8f7b975eac75@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250320-dev_adpm12160-v1-1-8f7b975eac75@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/25 20:55, Alexis Czezar Torreno wrote:
> The max344** family has an issue with some PMBUS address being switched.
> This includes max34451 however version MAX34451-NA6 and later has this
> issue fixed and this commit supports that update.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>   Documentation/hwmon/max34440.rst |   8 ++-
>   drivers/hwmon/pmbus/max34440.c   | 102 ++++++++++++++++++++++++++-------------
>   2 files changed, 74 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
> index 162d289f08140341e8e76ab7033834ba07a8b935..b1f3f75091bb8e233e766c24913194dd62b0cd90 100644
> --- a/Documentation/hwmon/max34440.rst
> +++ b/Documentation/hwmon/max34440.rst
> @@ -35,7 +35,7 @@ Supported chips:
>   
>       PMBus 16-Channel V/I Monitor and 12-Channel Sequencer/Marginer
>   
> -    Prefixes: 'max34451'
> +    Prefixes: 'max34451', 'max34451_na6'
>   
>       Addresses scanned: -
>   
> @@ -93,6 +93,10 @@ attribute is set to a positive value. Power measurement is only enabled if
>   channel 1 (3) is configured for voltage measurement, and channel 2 (4) is
>   configured for current measurement.
>   
> +For MAX34451, version MAX34451ETNA6+ and later are denoted with prefix
> +'max34451_na6'. The previous versions contains some errors on the PMBUS
> +addresses and these are fixed on the later versions.
> +
>   
>   Platform data support
>   ---------------------
> @@ -192,4 +196,4 @@ temp[1-8]_reset_history	Write any value to reset history.
>      - MAX34451 supports attribute groups in[1-16] (or curr[1-16] based on
>        input pins) and temp[1-5].
>      - MAX34460 supports attribute groups in[1-12] and temp[1-5].
> -   - MAX34461 supports attribute groups in[1-16] and temp[1-5].
> +   - MAX34461 supports attribute groups in[1-16] and temp[1-5].
> \ No newline at end of file
> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
> index c9dda33831ff24e7b5e2fd1956a65e6bd2bfcbb9..d483c01f256c96f048c9da5981f10f52402d981c 100644
> --- a/drivers/hwmon/pmbus/max34440.c
> +++ b/drivers/hwmon/pmbus/max34440.c
> @@ -14,7 +14,15 @@
>   #include <linux/i2c.h>
>   #include "pmbus.h"
>   
> -enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
> +enum chips {
> +	max34440,
> +	max34441,
> +	max34446,
> +	max34451,
> +	max34451_na6,
> +	max34460,
> +	max34461,
> +};
>   
>   #define MAX34440_MFR_VOUT_PEAK		0xd4
>   #define MAX34440_MFR_IOUT_PEAK		0xd5
> @@ -34,6 +42,7 @@ enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
>   /*
>    * The whole max344* family have IOUT_OC_WARN_LIMIT and IOUT_OC_FAULT_LIMIT
>    * swapped from the standard pmbus spec addresses.
> + * For max34451, version MAX34451ETNA6+ and later has this issue fixed.
>    */
>   #define MAX34440_IOUT_OC_WARN_LIMIT	0x46
>   #define MAX34440_IOUT_OC_FAULT_LIMIT	0x4A
> @@ -59,12 +68,20 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
>   
>   	switch (reg) {
>   	case PMBUS_IOUT_OC_FAULT_LIMIT:
> -		ret = pmbus_read_word_data(client, page, phase,
> -					   MAX34440_IOUT_OC_FAULT_LIMIT);
> +		if (data->id == max34451_na6)

Use a flag instead of a chip ID, or even better store the register addresses
in max34440_data to avoid the runtime checks.

> +			ret = pmbus_read_word_data(client, page, phase,
> +						   PMBUS_IOUT_OC_FAULT_LIMIT);
> +		else
> +			ret = pmbus_read_word_data(client, page, phase,
> +						   MAX34440_IOUT_OC_FAULT_LIMIT);
>   		break;
>   	case PMBUS_IOUT_OC_WARN_LIMIT:
> -		ret = pmbus_read_word_data(client, page, phase,
> -					   MAX34440_IOUT_OC_WARN_LIMIT);
> +		if (data->id == max34451_na6)
> +			ret = pmbus_read_word_data(client, page, phase,
> +						   PMBUS_IOUT_OC_WARN_LIMIT);
> +		else
> +			ret = pmbus_read_word_data(client, page, phase,
> +						   MAX34440_IOUT_OC_WARN_LIMIT);
>   		break;
>   	case PMBUS_VIRT_READ_VOUT_MIN:
>   		ret = pmbus_read_word_data(client, page, phase,
> @@ -75,7 +92,8 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
>   					   MAX34440_MFR_VOUT_PEAK);
>   		break;
>   	case PMBUS_VIRT_READ_IOUT_AVG:
> -		if (data->id != max34446 && data->id != max34451)
> +		if (data->id != max34446 && data->id != max34451 &&
> +		    data->id != max34451_na6)
>   			return -ENXIO;
>   		ret = pmbus_read_word_data(client, page, phase,
>   					   MAX34446_MFR_IOUT_AVG);
> @@ -133,12 +151,20 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
>   
>   	switch (reg) {
>   	case PMBUS_IOUT_OC_FAULT_LIMIT:
> -		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_FAULT_LIMIT,
> -					    word);
> +		if (data->id == max34451_na6)
> +			ret = pmbus_write_word_data(client, page, PMBUS_IOUT_OC_FAULT_LIMIT,
> +						    word);
> +		else
> +			ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_FAULT_LIMIT,
> +						    word);
>   		break;
>   	case PMBUS_IOUT_OC_WARN_LIMIT:
> -		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_WARN_LIMIT,
> -					    word);
> +		if (data->id == max34451_na6)
> +			ret = pmbus_write_word_data(client, page, PMBUS_IOUT_OC_WARN_LIMIT,
> +						    word);
> +		else
> +			ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_WARN_LIMIT,
> +						    word);
>   		break;
>   	case PMBUS_VIRT_RESET_POUT_HISTORY:
>   		ret = pmbus_write_word_data(client, page,
> @@ -159,7 +185,8 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
>   	case PMBUS_VIRT_RESET_IOUT_HISTORY:
>   		ret = pmbus_write_word_data(client, page,
>   					    MAX34440_MFR_IOUT_PEAK, 0);
> -		if (!ret && (data->id == max34446 || data->id == max34451))
> +		if (!ret && (data->id == max34446 || data->id == max34451 ||
> +			     data->id == max34451_na6))
>   			ret = pmbus_write_word_data(client, page,
>   					MAX34446_MFR_IOUT_AVG, 0);
>   
> @@ -270,6 +297,29 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>   	return 0;
>   }
>   
> +#define MAX34451_COMMON_INFO \
> +	.pages = 21, \
> +	.format[PSC_VOLTAGE_OUT] = direct, \
> +	.format[PSC_TEMPERATURE] = direct, \
> +	.format[PSC_CURRENT_OUT] = direct, \
> +	.m[PSC_VOLTAGE_OUT] = 1, \
> +	.b[PSC_VOLTAGE_OUT] = 0, \
> +	.R[PSC_VOLTAGE_OUT] = 3, \
> +	.m[PSC_CURRENT_OUT] = 1, \
> +	.b[PSC_CURRENT_OUT] = 0, \
> +	.R[PSC_CURRENT_OUT] = 2, \
> +	.m[PSC_TEMPERATURE] = 1, \
> +	.b[PSC_TEMPERATURE] = 0, \
> +	.R[PSC_TEMPERATURE] = 2, \
> +	/* func 0-15 is set dynamically before probing */ \
> +	.func[16] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
> +	.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
> +	.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
> +	.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
> +	.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
> +	.read_word_data = max34440_read_word_data, \
> +	.write_word_data = max34440_write_word_data,
> +
>   static struct pmbus_driver_info max34440_info[] = {
>   	[max34440] = {
>   		.pages = 14,
> @@ -394,27 +444,10 @@ static struct pmbus_driver_info max34440_info[] = {
>   		.write_word_data = max34440_write_word_data,
>   	},
>   	[max34451] = {
> -		.pages = 21,
> -		.format[PSC_VOLTAGE_OUT] = direct,
> -		.format[PSC_TEMPERATURE] = direct,
> -		.format[PSC_CURRENT_OUT] = direct,
> -		.m[PSC_VOLTAGE_OUT] = 1,
> -		.b[PSC_VOLTAGE_OUT] = 0,
> -		.R[PSC_VOLTAGE_OUT] = 3,
> -		.m[PSC_CURRENT_OUT] = 1,
> -		.b[PSC_CURRENT_OUT] = 0,
> -		.R[PSC_CURRENT_OUT] = 2,
> -		.m[PSC_TEMPERATURE] = 1,
> -		.b[PSC_TEMPERATURE] = 0,
> -		.R[PSC_TEMPERATURE] = 2,
> -		/* func 0-15 is set dynamically before probing */
> -		.func[16] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> -		.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> -		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> -		.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> -		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> -		.read_word_data = max34440_read_word_data,
> -		.write_word_data = max34440_write_word_data,
> +		MAX34451_COMMON_INFO,
> +	},
> +	[max34451_na6] = {
> +		MAX34451_COMMON_INFO,
>   	},

This is way too complicated. Use a flag or set the register addresses in struct
max34440_data instead.

>   	[max34460] = {
>   		.pages = 18,
> @@ -495,7 +528,7 @@ static int max34440_probe(struct i2c_client *client)
>   	data->id = i2c_match_id(max34440_id, client)->driver_data;
>   	data->info = max34440_info[data->id];
>   
> -	if (data->id == max34451) {
> +	if (data->id == max34451 || data->id == max34451_na6) {
>   		rv = max34451_set_supported_funcs(client, data);
>   		if (rv)
>   			return rv;
> @@ -509,6 +542,7 @@ static const struct i2c_device_id max34440_id[] = {
>   	{"max34441", max34441},
>   	{"max34446", max34446},
>   	{"max34451", max34451},
> +	{"max34451_na6", max34451_na6},

Relying on this is way too fragile. This must be detectable from the chip;
maybe using MFR_REVISION.

>   	{"max34460", max34460},
>   	{"max34461", max34461},
>   	{}
> @@ -529,4 +563,4 @@ module_i2c_driver(max34440_driver);
>   MODULE_AUTHOR("Guenter Roeck");
>   MODULE_DESCRIPTION("PMBus driver for Maxim MAX34440/MAX34441");
>   MODULE_LICENSE("GPL");
> -MODULE_IMPORT_NS("PMBUS");
> +MODULE_IMPORT_NS(PMBUS);

Looks like your code is based on an older kernel branch. Please
rebase on top of mainline.

Guenter



> 


