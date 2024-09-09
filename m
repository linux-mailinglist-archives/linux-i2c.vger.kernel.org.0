Return-Path: <linux-i2c+bounces-6431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A92099721BA
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 20:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C3F81F23D03
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 18:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110A0188CC3;
	Mon,  9 Sep 2024 18:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUGVgh+x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB88524C4;
	Mon,  9 Sep 2024 18:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725905806; cv=none; b=R/IGdYrbSUGAoC01WQQ9T3aYkL0f+nu1mJz89IqrvuYtFwE58oxxOhIqdVmrmtvHHAMc0om0/yl0QDV5axrxuMUV5JGYzdac07bSbLdTLTtMp7yG1kw85anvnhoJo2GXU2qjCWSmAleEJnFu4qFKwVuCWEdJaLoEpDgCLygILSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725905806; c=relaxed/simple;
	bh=qcr5MOHYJhKsitzdAiM0iybFMvgqUPw4gHKBKCHGWv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/5WXwiUHrBr6EKG5lvE+N4gsSNT85Zf7q5UwrRheRnxHTf+q8IQPr/kJby8/6Bw+tShZaFOL8+NjG8SgooAU0tFENc6GtsU2wCLSQ+zpoYQ1e9d4g7ltdbRP/w9KPkTdsRNMy8Gc/gR6yafbr8XXGrPR69c6rslHOdAZi061R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUGVgh+x; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-206aee4073cso47869155ad.1;
        Mon, 09 Sep 2024 11:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725905804; x=1726510604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zrATOHe5XjPdhMztHbQbQTeeUa2zuUhhA4iaEWDma3M=;
        b=CUGVgh+xjscfO6W6KzgWu2XmhKSAQcEREWGodwlf7zQDc4Hh5iX13cAejZM0K3rUIG
         YFm7HD+hCPGbuBD38frClHUY39vnPWRbPIuACvq7KaITMpGFQPEhQJGZadwWijOxvHc1
         +TMEiBSYCtWIx5b/Wd7pE0GTmMy/ly509ceoROhb1MiTh0wiMtW92HBeTKd261a/Qrmy
         eplN0GG/Y5DKVFWYmD371MR5SQJV3z6BK/z6+L0wVHzUiZF0g0HFRrWFX8d3Cana6wtR
         ueJH3hjsz+Ku8tzJPFV0M7rZWSGtI2Oazq84KKgSa7PHorIRq7aBhnvejtZlpUTogNi0
         oC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725905804; x=1726510604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrATOHe5XjPdhMztHbQbQTeeUa2zuUhhA4iaEWDma3M=;
        b=Cgea947C0zUewrjMT9L71WfJvPrpduuFmnPlfcLUIUAiaiSFZx8wZCC26Bf1Vg+7v5
         mOKKWbB4nWsCgbkmtfaX6qPrsdpvElpJvVlqZNj2IcSD+VK+csF+ZWea5VZdhqoTPO72
         g88UqIBoYfaPx/MOz/76pl8LZtMZNeS6mkG2yy60ljp5XRva+NnS81e5YTYPLKCps6sY
         VcraR18DpAnyZr9dgLsW++7nAxAREsjcdToar3FfJ5pkDJ6ImP6Iti/5oj+xc6yptr99
         tk6hzLuoA8zu0kLHv8VrjnjcFIcRV7AXRMqSd3BglYMH7pELxxDVCHqicSXdvbuNzfUN
         fBFw==
X-Forwarded-Encrypted: i=1; AJvYcCVuXTCHDGjrCy5qPkeJQnSw6bjA1ZGi5rJpt0J5YVngthammmv2ZY1sg+fvnQEozy1C0N8nMsx/Jj10GXkD@vger.kernel.org, AJvYcCWhEVziqpw89lAfXsb2kthR8sZbGtkR4Y88vk6HneHMF6j0/Q+Hj6EUeHTrARsjrjh8MDEgd+qDZYTq@vger.kernel.org, AJvYcCXJRoEQ2MJJsdA8skR24lvcxNEN5YkcrT4vdriwGePdtCKgm2DwfhYZv59SPY0+nEnEBYC4flaUTJNz@vger.kernel.org, AJvYcCXnpmrSPF5q4ow6U1/SIUZKhH/QkcnI8oQGUQJNbPkzoatlwkJWrqs8aFbQpgrZ/R6T58UR+Khk9AP2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr3Fch3JpvIE/nr+bsmB+RHIf5Ji2vrnuI1RSOsOKpPbHjlk6e
	xIhdoMxkvIgWmewbDI+GHVXabrqXxhT8s7lafUSHxIrycgvMJr2p27wLKg==
X-Google-Smtp-Source: AGHT+IFirGzM0CCUfiXl/kaXhL3US9esvMkev6/AQ2dfwTH+uze+N8uCelG8kf4lIJfPOETvDE9aiA==
X-Received: by 2002:a17:902:ce0b:b0:202:51ca:9823 with SMTP id d9443c01a7336-206f05f62f3mr225447475ad.46.1725905804488;
        Mon, 09 Sep 2024 11:16:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1a63csm36850415ad.13.2024.09.09.11.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 11:16:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d76290e0-f5e7-4192-92b8-94f260270fe3@roeck-us.net>
Date: Mon, 9 Sep 2024 11:16:41 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (pmbus/core) add POWER_GOOD signal limits
 support
To: Jerome Brunet <jbrunet@baylibre.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
 <20240909-tps25990-v1-2-39b37e43e795@baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240909-tps25990-v1-2-39b37e43e795@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/9/24 08:39, Jerome Brunet wrote:
> Add support for POWER_GOOD_ON and POWER_GOOD_OFF standard PMBus commands.
> 
> For PMBus devices that offer a POWER_GOOD signal, these commands are used
> for setting the output voltage at which a power good signal should be
> asserted and negated.
> 
> Power Good signals are device and manufacturer specific. Many factors other
> than output voltage may be used to determine whether or not the POWER_GOOD
> signal is to be asserted. PMBus device users are instructed to consult the
> device manufacturer’s product literature for the specifics of the device
> they are using.
> 
> Note that depending on the choice of the device manufacturer that a device
> may drive a POWER_GOOD signal high or low to indicate that the signal is
> asserted.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/hwmon/pmbus/pmbus.h      | 3 +++
>   drivers/hwmon/pmbus/pmbus_core.c | 6 ++++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 5d5dc774187b..e322d2dd9fb7 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -78,6 +78,9 @@ enum pmbus_regs {
>   	PMBUS_IIN_OC_FAULT_LIMIT	= 0x5B,
>   	PMBUS_IIN_OC_WARN_LIMIT		= 0x5D,
>   
> +	PMBUS_POWER_GOOD_ON		= 0x5E,
> +	PMBUS_POWER_GOOD_OFF		= 0x5F,
> +
>   	PMBUS_POUT_OP_FAULT_LIMIT	= 0x68,
>   	PMBUS_POUT_OP_WARN_LIMIT	= 0x6A,
>   	PMBUS_PIN_OP_WARN_LIMIT		= 0x6B,
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 0ea6fe7eb17c..94ddf0166770 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1768,6 +1768,12 @@ static const struct pmbus_limit_attr vout_limit_attrs[] = {
>   		.attr = "crit",
>   		.alarm = "crit_alarm",
>   		.sbit = PB_VOLTAGE_OV_FAULT,
> +	}, {
> +		.reg = PMBUS_POWER_GOOD_ON,
> +		.attr = "good_on",
> +	}, {
> +		.reg = PMBUS_POWER_GOOD_OFF,
> +		.attr = "good_off",
>   	}, {
>   		.reg = PMBUS_VIRT_READ_VOUT_AVG,
>   		.update = true,
> 

Those attributes are not hardware monitoring attributes and therefore not
acceptable. In general I am not sure if they should be configurable in the
first place, but definitely not from the hardware monitoring subsystem.
Maybe the regulator subsystem callbacks set_over_voltage_protection and
set_under_voltage_protection would be appropriate (with severity
REGULATOR_SEVERITY_PROT), but that should be discussed with regulator
subsystem maintainers.

Thanks,
Guenter


