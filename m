Return-Path: <linux-i2c+bounces-10099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E4CA7A807
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 18:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DAEA7A3A95
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 16:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58764242907;
	Thu,  3 Apr 2025 16:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGqtQ+cE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B81514F6;
	Thu,  3 Apr 2025 16:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697969; cv=none; b=LikbNK0uItllGgRb7oPFcrUgIvz3fkqA38X1u2oe7+h5cSWrQqBski2VDh52YTUSFVqromWOg9oNE5JDvKbzymIvHbOiu1cm/jfRcml4WrRNGjNdbu1Kg0lJgLW1JOJPaFpkI9p5KwtNkaICdw37GAvBJSoZ8TfoDnX2N/lukSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697969; c=relaxed/simple;
	bh=nMCJUD39JxPn8sbGvbI/xrwFl+jsJVFVNZQe/Lk07E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYa5JxHeU1pqTPoU3a/j03yXve0dFm6PXluDnaYdPy2Wc+42fvXAGqi+kKzSfkVd+zxXxDYJmW+tu5cyBe34OaVEp8aACJoePizVZqccpYmgyhJCB7QxbpFZMI+sms3OzJ2A7Ye55L15hqe4jPKeFvBLeFYR9a4UvYalkphYMRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGqtQ+cE; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af241f0a4beso1020305a12.2;
        Thu, 03 Apr 2025 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743697966; x=1744302766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KJdAxOd/G0iqxROXI10DaNI9IIAFwi2MfAijcTTkYc=;
        b=WGqtQ+cEdySJ6D2gzXYfXDcw/u+jYnwq8P5lpFeXUUdyyrQdmiIr4yk7SjI4fT8/iy
         3x0Z6+01oJZl4bgqY3M4edE5APuKFy9sUXWwWHq0oAYCXW8NbrdljBdkXy+8shn1eNeD
         cIcutsXNStFblFrk4+JmFGf7a2NgaUHFMiM5hRjRbIDAKKx4xusMfsN+qcOqB4Be2NHe
         7XC4H4+oO05SAPyINxO9Qt0YV+VrTSjKFd+hZZ1fHqLTGWFRlHNAt+gLkBLQ9qZSqN+D
         PtpwNdCTxuKJ8yNHgI7NaOBg4eTmJsjmqluy7namlvYXZ8cuV3V607r3CNVZKlCwOM0B
         T3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743697966; x=1744302766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KJdAxOd/G0iqxROXI10DaNI9IIAFwi2MfAijcTTkYc=;
        b=ZZDyyAJg2pnNdmykSkITwfqWbRdhsJsGHp6oUoxw6HeQeL9ACPzy384bB0/OUbQiBQ
         +UMIXKGabicsz3/U2gIINBTob0r/acKJXMI2ku6UFnfwChhVOdTJRBVaFfvwl97VTLxY
         fnlRh+0cSU44ATutZW3fWU87B2VnXsXAwP0rTFOb6Sf0DyVr6OSKGUOwWN3KuMBzMkKj
         F8K6S3wo2SAoR5ucjpzx2/RjWBkJKMNdLxpLjTtoLZ/+tX4RX20XVjkvL5PqVr1LhMz3
         v6iw71d21d/4gqNW0O/w5oY0lkbNxDI/lkg75eKbOjHeqLRrLUxn3RejKZWCMnbY9/Tp
         /KWg==
X-Forwarded-Encrypted: i=1; AJvYcCU1Xn+5W62idSAiRWgjb7GissTFbUzYEEDmxQi1eeTnVXVWGLcmhFDecuGT7y9Sx2rIMXvTwgtX2XeHpIE=@vger.kernel.org, AJvYcCWGabrbfpVeNmmuEYATi1RRCJXuz3OvVbIIZwj+RaOFej/XWVKaE4j25vMkt0Lo1vHvXgGwGibaRuU=@vger.kernel.org, AJvYcCXeewcdku5EvOVK9ObiXJZMOTt9coMh54n7AjINEJFHEQKcNkddX2A3nFeNm9614mShOfdVWRUFj9WY@vger.kernel.org, AJvYcCXevtq/rfbDC+XIqUO6COfbTAGxcvtikJ5gLindUR99hQB4wJ1jBNkRWiMtRlsSLIDZKpIF96V48N0OnIbK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc561kOmUAinADvKqVmtR/JUoEnHBlncZtEbPYfdsGCEyIDyw0
	mlkk1G5KLgOY0JPCGZs2jctm3z11d0J/UZIRmtiYRc53HDistaHr
X-Gm-Gg: ASbGncv3rzoMWKO/EJ+VT7scJnSuISbMxPFCvjuk6K0VldaOENo+etEr98Sse7LTRdf
	LtT1RsEhkU1s6s+TxsiINS+WyGaZkfR+HjHBnhrzibc0lL34AEbpIZHJ7accBcLZkqkdAQKADWK
	GGPoIlmJuo0a0+WOSP2XVdSCf0jQnMNYU3UT1LaZJJXfRAfuS8ar7Me+uEUfr/am3VsBAFxoK3t
	r4mUiOu+43A6EDJt2AQjvtlSDWMYRO4d0i8mrW9BMYa6Qtvbp42Rwy7HIzBJIko+ZZ/20/jfA1/
	8KGaV+Fzl6k1AZ7X6cLcYZGNXsWUiFqSZMHOx69EQtMdL3NVm6Ux9HeIGg==
X-Google-Smtp-Source: AGHT+IGNyHx4nxR5tTiooAyFc+8Sh9HpSHaXhwKL4UKkSQzlutFbKuE/+7rfXHqUXEHQgUx/tXZDIA==
X-Received: by 2002:a05:6a21:1583:b0:1f5:7eee:bb10 with SMTP id adf61e73a8af0-20104598389mr113569637.8.1743697966408;
        Thu, 03 Apr 2025 09:32:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc40098dsm1448971a12.48.2025.04.03.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:32:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 3 Apr 2025 09:32:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/max34440): Fix support for max34451
Message-ID: <2234425e-b676-4564-96c6-57c0a635292c@roeck-us.net>
References: <20250403-dev_adpm12160-v2-0-bbf40faae988@analog.com>
 <20250403-dev_adpm12160-v2-1-bbf40faae988@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dev_adpm12160-v2-1-bbf40faae988@analog.com>

On Thu, Apr 03, 2025 at 01:16:18PM +0800, Alexis Czezar Torreno wrote:
> The max344** family has an issue with some PMBUS address being switched.
> This includes max34451 however version MAX34451-NA6 and later has this
> issue fixed and this commit supports that update.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  drivers/hwmon/pmbus/max34440.c | 55 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
> index c9dda33831ff24e7b5e2fd1956a65e6bd2bfcbb9..585746806663409bc97042647f6c0aba4c6f520a 100644
> --- a/drivers/hwmon/pmbus/max34440.c
> +++ b/drivers/hwmon/pmbus/max34440.c
> @@ -34,16 +34,22 @@ enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
>  /*
>   * The whole max344* family have IOUT_OC_WARN_LIMIT and IOUT_OC_FAULT_LIMIT
>   * swapped from the standard pmbus spec addresses.
> + * For max34451, version MAX34451ETNA6+ and later has this issue fixed.
>   */
>  #define MAX34440_IOUT_OC_WARN_LIMIT	0x46
>  #define MAX34440_IOUT_OC_FAULT_LIMIT	0x4A
>  
> +#define MAX34451ETNA6_MFR_REV		0x0012
> +
>  #define MAX34451_MFR_CHANNEL_CONFIG	0xe4
>  #define MAX34451_MFR_CHANNEL_CONFIG_SEL_MASK	0x3f
>  
>  struct max34440_data {
>  	int id;
>  	struct pmbus_driver_info info;
> +	bool pmbus_addr_fixed;

Unnecessary. See below.

> +	u32 iout_oc_warn_limit;
> +	u32 iout_oc_fault_limit;

u8 would be sufficient.

>  };
>  
>  #define to_max34440_data(x)  container_of(x, struct max34440_data, info)
> @@ -60,11 +66,11 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
>  	switch (reg) {
>  	case PMBUS_IOUT_OC_FAULT_LIMIT:
>  		ret = pmbus_read_word_data(client, page, phase,
> -					   MAX34440_IOUT_OC_FAULT_LIMIT);
> +					   data->iout_oc_fault_limit);
>  		break;
>  	case PMBUS_IOUT_OC_WARN_LIMIT:
>  		ret = pmbus_read_word_data(client, page, phase,
> -					   MAX34440_IOUT_OC_WARN_LIMIT);
> +					   data->iout_oc_warn_limit);
>  		break;
>  	case PMBUS_VIRT_READ_VOUT_MIN:
>  		ret = pmbus_read_word_data(client, page, phase,
> @@ -133,11 +139,11 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
>  
>  	switch (reg) {
>  	case PMBUS_IOUT_OC_FAULT_LIMIT:
> -		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_FAULT_LIMIT,
> +		ret = pmbus_write_word_data(client, page, data->iout_oc_fault_limit,
>  					    word);
>  		break;
>  	case PMBUS_IOUT_OC_WARN_LIMIT:
> -		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_WARN_LIMIT,
> +		ret = pmbus_write_word_data(client, page, data->iout_oc_warn_limit,
>  					    word);
>  		break;
>  	case PMBUS_VIRT_RESET_POUT_HISTORY:
> @@ -235,6 +241,24 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>  	 */
>  
>  	int page, rv;
> +	bool max34451_na6 = false;
> +
> +	rv = i2c_smbus_read_word_data(client, PMBUS_MFR_REVISION);
> +	if (rv < 0)
> +		return rv;
> +
> +	if (rv == MAX34451ETNA6_MFR_REV) {

Sure that this is only one revision ?
Would it be better to use ">=" instead of "==" ?

> +		max34451_na6 = true;
> +		data->pmbus_addr_fixed = true;
> +		data->info.format[PSC_VOLTAGE_IN] = direct;
> +		data->info.format[PSC_CURRENT_IN] = direct;
> +		data->info.m[PSC_VOLTAGE_IN] = 1;
> +		data->info.b[PSC_VOLTAGE_IN] = 0;
> +		data->info.R[PSC_VOLTAGE_IN] = 3;
> +		data->info.m[PSC_CURRENT_IN] = 1;
> +		data->info.b[PSC_CURRENT_IN] = 0;
> +		data->info.R[PSC_CURRENT_IN] = 2;

Assign register addresses directly here.

		data->iout_oc_fault_limit = PMBUS_IOUT_OC_FAULT_LIMIT;
		data->iout_oc_warn_limit = PMBUS_IOUT_OC_WARN_LIMIT;
	} else {
		data->iout_oc_fault_limit = MAX34440_IOUT_OC_FAULT_LIMIT;
		data->iout_oc_warn_limit = MAX34440_IOUT_OC_WARN_LIMIT;

> +	}

Thanks,
Guenter

