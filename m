Return-Path: <linux-i2c+bounces-8484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C120B9EFEF7
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 23:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB54316B02D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 22:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4751DC19A;
	Thu, 12 Dec 2024 22:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1qNGfAF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B6E2F2F;
	Thu, 12 Dec 2024 22:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734041176; cv=none; b=WtGC0WReFORg160UBo57B/JlOJTPxKppQHxtclfas4w+GSYeUvUdUC2KSdUSXb/CjZefsMnUeuT/PWFavXM8+oUOq1GZ+kq9Yf/sCKqquLLnX/YjhhDoHvGJ/VeaPB5Sq+2gV+Gzj02ejWMwjG5rPj8N83eSJmhFTbGm3FDK34E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734041176; c=relaxed/simple;
	bh=W3AgQ32tPZsZxwvhUmucHlXiZ9eckahHL26btDnz58U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U+sdvoAjzNPCl161HzbCM5qLdJ+GCWQTfLYLRn4wybuNBSAb/yUmdeT/F/Ec4DMtM7xYSYr7KMFeUvQDYsP7Vo1gnvaetviyLweNLK1HJg7VvnHJEoFAm8oRwDBd67oeAYarywrE04+giBGCrTplbLZjyPJvtVFL26BXzdFovyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1qNGfAF; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fd49d85f82so925302a12.3;
        Thu, 12 Dec 2024 14:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734041173; x=1734645973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn7aTGxs0fZIZsteSxxOdiaizy01Z8EgP8KAplxUb/s=;
        b=B1qNGfAFA/fZV1IkCoEOhtydPk1gD81ov6744Ar29wFiHyVRAPHlriwS/4pja+BNW3
         LdzD4sMdVX8T9k+Umw22o3fsBnAoZ+3t0WKg+SW87qj+Ss2tUqjFAZdI2WAsZta0fXnR
         nkVSqTl6GNyJuspthdi7g6MlLV1KGcv2fXoPzPbdSI4j0ImciUzDStGHsa4PJqqha6xg
         LcBiRmNZHrLWZrzirtDdXfKJBGP73DSU935sMfolUmWUv+eeTxhNLv7ypoM1ETSoKBCj
         poq7kg+cr9D+s8mfK4qK6R+JJN84KkNn8HEQiBeL6PorbHroSCJDPcdSsaeuxpqVi/49
         R4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734041173; x=1734645973;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nn7aTGxs0fZIZsteSxxOdiaizy01Z8EgP8KAplxUb/s=;
        b=lSJrIJHbk5GJ2d5Z+o4ATBPuOom/9kN0LMvQEeXxQUhPZR6r8pH0iMnhlzq4IyfodJ
         tcXjnDLZfWk1g2+GWlDX+L8u/JK2rzaxyP4hiM62O12H4VQ0lyyUDXB8MrkWRpxY6dAZ
         jEHPmxuxigp2bzaIZnNv1j9utvRRBhKwZn+y+SjBJ2ATNe89JfL+1UXIcXYU3z5q1rrR
         jgRFr/sI2TeSNbiVJmI2If7nVtT5K8NmOupX4CycDD9XBKBa9K7N2dFWA+58qOYQpdw5
         16KWjYTD8/VN9H0CDGbJ12gaUXeE51hj1abF8fZAjQ4FctqTlZn8He1VgGe04VVjGTDL
         wN+A==
X-Forwarded-Encrypted: i=1; AJvYcCU6QUrIcoflmORnW50NKa4ubZNaEnobG7LPMeGkItcQ+M44dczEjeZ18hF8BoiCJzNvGMyvV+TGU9w7@vger.kernel.org, AJvYcCV5nhU/IcNSfPRZW1AVloU9gpAtlJZdRI//H9SPRtIUJrcay9nX0m1XCwjm/CUNXPL3fh+KiPiL83TN@vger.kernel.org, AJvYcCVhG/tpZ2X/qMqB3uwbkcAayvJXPLTTO6GOEgnvWDY4xq3JSaWLX41inzpEFJMfpRkzdhLb2FBbOlKX@vger.kernel.org, AJvYcCViRtIBIqS0r/cbvOHRVYbKZfElh9bNfT7GeTBblSb/RoXaXl1WkEjj0nNculz01d3uBiFOv4NyEANSRac=@vger.kernel.org, AJvYcCXgO5T2RZEprdBQxpByXW+ksTYG5qn5obKqp7KniHOkoQlSObhL+nu+vox+w1Wle06kuN9fXrXrF5bWgFeu@vger.kernel.org
X-Gm-Message-State: AOJu0YzfWsr3P3KAqEeQ4TxEt5wVHRHmFw1mBUboEmUiSvymjsbR++Um
	0YlDd9FkCR8fqMe6cUSp/Hjar1kClG0EAlVfXFNBpKppEbNO/fr0
X-Gm-Gg: ASbGncuMtOIp66ES/9R48OY0O9nGZYFuvnSHlvfoL30yy1S94clOHVXyBHV2i+9kkrR
	LI+eEJquXQT/GJahDSiBZOZanA/LkM/DPkVtGXvPoqPP8X5qEwG88af0MtH5pk7+uUDS6Vbv6yv
	JmpvMt/sFF7m0Bg9+pljNcToQahP9UmiJBjrfKD4/7Ppif1yaB4vcppMxfU3RkbBVXyyL5ifO20
	AAc2nEFe88R3E4Fav+Y6aMuY/KTrCvNkl+AVfLvwtHgUUm+jF3G0j1mYoX8VioTKR4XdNVFfaX+
	7hkocGM/ScHuvsKAiEY1ge2RxGMagA==
X-Google-Smtp-Source: AGHT+IEjcDWDcj+xx58FwEzylYzqnHeRBxwumiFyM7ZjcMUkstRS8dJbxY3ZD6142f7rcv8umWohsA==
X-Received: by 2002:a17:90b:2682:b0:2ea:7cd5:4ad6 with SMTP id 98e67ed59e1d1-2f2901b3181mr476376a91.32.1734041172844;
        Thu, 12 Dec 2024 14:06:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142de7ddfsm1799771a91.26.2024.12.12.14.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 14:06:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f9d881b7-7301-476e-b281-0380dfcf0e10@roeck-us.net>
Date: Thu, 12 Dec 2024 14:06:09 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] hwmon: pmbus-core: Add label for fan and temp
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
 corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
 Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org, peteryin.openbmc@gmail.com,
 noahwang.wang@outlook.com, naresh.solanki@9elements.com, lukas@wunner.de,
 jbrunet@baylibre.com, patrick.rudolph@9elements.com,
 gregkh@linuxfoundation.org, peterz@infradead.org, pbiel7@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-i2c@vger.kernel.org
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
 <20241212214927.3586509-2-ninad@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241212214927.3586509-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/24 13:49, Ninad Palsule wrote:
> Adding label files for fan and temperature sensors in the power supply.
> The openbmc application dbus-sensor(psusensor) requires those files to
> consfigure those sensors.
> Note that prefix for temp label is temp[A..C] used instead of temp[1..3]
> as dbus-sensor(psusensor) application calculate index based on last
> digit in the name so we do not want to make index double digit after
> appending page index.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

We are not going to fix userspace problems in the kernel.

Guenter

> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index a7000314e5ad..149b3c5f3a4c 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2144,6 +2144,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
>   	{
>   		.reg = PMBUS_READ_TEMPERATURE_1,
>   		.class = PSC_TEMPERATURE,
> +		.label = "tempA",
>   		.paged = true,
>   		.update = true,
>   		.compare = true,
> @@ -2156,6 +2157,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
>   	}, {
>   		.reg = PMBUS_READ_TEMPERATURE_2,
>   		.class = PSC_TEMPERATURE,
> +		.label = "tempB",
>   		.paged = true,
>   		.update = true,
>   		.compare = true,
> @@ -2168,6 +2170,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
>   	}, {
>   		.reg = PMBUS_READ_TEMPERATURE_3,
>   		.class = PSC_TEMPERATURE,
> +		.label = "tempC",
>   		.paged = true,
>   		.update = true,
>   		.compare = true,
> @@ -2282,6 +2285,17 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>   					     PSC_FAN, true, true, true) == NULL)
>   				return -ENOMEM;
>   
> +			/*
> +			 * Add fan label.
> +			 * Assuming paged attributes while passing page index
> +			 */
> +			ret = pmbus_add_label(data, "fan", index, "fan",
> +					      page + 1, 0xff);
> +			if (ret) {
> +				dev_err(data->dev, "Fan label add failed ret=%d\n", ret);
> +				return ret;
> +			}
> +
>   			/* Fan control */
>   			if (pmbus_check_word_register(client, page,
>   					pmbus_fan_command_registers[f])) {


