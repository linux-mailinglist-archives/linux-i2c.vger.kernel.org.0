Return-Path: <linux-i2c+bounces-1508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE75D840993
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 16:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F7921C2137A
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 15:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585D2153BC9;
	Mon, 29 Jan 2024 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVJ4Hzgp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D596155A4F;
	Mon, 29 Jan 2024 15:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706541418; cv=none; b=cMPGkCqRKKhhCpNpMqAyWSukKdOKcNGUn6wVYfteReBInm+UtZoexdFNMtZwmdPQIChX2VytGlQVnze0qZmUEKDMbBQg5Oh+md+uFzPfrdANBsenAvEFljw1eoAqiQ6UXpeyzt0+yIg/BhS1aoQ3kmdWm+y5BeA+zq75Kzw8KK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706541418; c=relaxed/simple;
	bh=qlUFaMcwXWhmmEzdeZQB+wJ3uKRWS2OB5K9A9Gc8SA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHGuKL2SZC4ghOvJlta66VEPcewBqj9dftzAStqBMRdTjSWAhtP5lC+XrS/Olya+GVFHvsT/VK4ZaxmJU0UyDIlr5W9faE7YutEQVUo51Hwtkxj+Xaeb/SNxQKPsYOgnbV15QOge+5AoD6vXrRbTSfrjjufweigOQgvmLFoho5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVJ4Hzgp; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-59612e4a21eso965298eaf.3;
        Mon, 29 Jan 2024 07:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706541415; x=1707146215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kB5Et7w3ZzgIpdxhAVYJONzfcR1otDulInd0ia/bfUc=;
        b=RVJ4HzgpKLlw3to5qzET8XaLTK11k/zn/5h6gyEqc3ObHoPSBKX7R9eUBAQw6QRGK0
         P8TLUofieO6Jh5OlCzMH5c13xgeRFKFtdHGANfBy4H9CFkoCUsDOvr1/FT/kY9j5em/3
         wqsKEzvVq1WZ1Vl8SnfWbvsG6y8yHhL1xII81LvU6FeffsrPgOxUxduG4Mc/y9wMwbWb
         kQHaBfH9LJlJXWtvsCAuZ0VG0deoABKiYahPwvuJUhv12QfSNXHtG5m2I4QlodyFZzVY
         e7s8EomtSsd0R6IeFhnZa5l8AfjGKrHe8lGdJt9LKOHLyzZMUt33nDznlyH5qDuWSSxf
         p1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541415; x=1707146215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kB5Et7w3ZzgIpdxhAVYJONzfcR1otDulInd0ia/bfUc=;
        b=s2OUhx8cih037Pg/c+85Kel9MG18BcIDKE5EIPv/N+SmJKRKREcyxOfnkk0hSG9Whm
         iUsnmisxk1zJthZHSlDjf8foQ7WvcQ62deKov4UQZlTbGN0YV9G1FGdd9opbrvHOpBO2
         Yh187l/MShBWC+nFrRoFi4iXg9Rt9KD3xI1RtN9mFr5ArPsd5q0FxUsnGogWt7k94ONZ
         swQz6CVCl/zG4IlscGKE6GqIc/dQN4711QAsrfIkZWq765kaPm4JjF+35LY1DK010vRS
         NdCxRnRO6rww/0AI+N3Z9A7MX3HHhbprm2GA6LBpY3JuwI2R7dm0eG0lN9voXrTdrirE
         bWng==
X-Gm-Message-State: AOJu0YzLTwUAkjM2VedFRPIZxS6hm9P/GSBAltS+TNYrVOa8JAeYtRva
	cxaiQDa1/cUJRIR0h4zSOSOfv6AFcAMe3kaoqu3xUB1cuY/DjtbY
X-Google-Smtp-Source: AGHT+IGr+MSeuJUTZb7DaKfa3gJXjjeWMmepVT9Lq6RXzavNVlN+XEq3wzubeKMDEFc70r3wv2bU8g==
X-Received: by 2002:a05:6358:6a47:b0:176:cd90:6ff8 with SMTP id c7-20020a0563586a4700b00176cd906ff8mr2025908rwh.7.1706541415240;
        Mon, 29 Jan 2024 07:16:55 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i17-20020a63e451000000b005d8b8efac4csm4050657pgk.85.2024.01.29.07.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 07:16:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ee2f4758-0b50-449a-b74b-492814a9cc8a@roeck-us.net>
Date: Mon, 29 Jan 2024 07:16:52 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: Add driver for MPS MPQ8785 Synchronous
 Step-Down Converter
Content-Language: en-US
To: Charles Hsu <ythsu0511@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jdelvare@suse.com,
 corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com, naresh.solanki@9elements.com,
 peteryin.openbmc@gmail.com, patrick.rudolph@9elements.com,
 alexander.stein@ew.tq-group.com, lakshmiy@us.ibm.com, bhelgaas@google.com,
 michal.simek@amd.com, lukas@wunner.de, festevam@denx.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org, ytshu0511@gmail.com
References: <20240129083115.2107466-1-ythsu0511@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240129083115.2107466-1-ythsu0511@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/24 00:31, Charles Hsu wrote:
> Add support for mpq8785 device from Monolithic Power Systems, Inc.
> (MPS) vendor. This is synchronous step-down controller.
> 
> Signed-off-by: Charles Hsu <ythsu0511@gmail.com>
> 
> ---
> Change in v1:
>      Initial patchset.
> Change in v2:
>      1.Add pmbus support status registers.
>      2.Add mpq8785 in trivial-devices.yaml.
>      3.Remove format[PSC_VOLTAGE_OUT]

This is insufficient, sorry. Problem is that pmbus_identify_common()
compares the more reported by PMBUS_VOUT_MODE with the configured mode.
Not setting format[PSC_VOLTAGE_OUT] means that the mode is the default (0),
which is linear mode. If the chip is configured for direct or vid mode
this again will result in probe failure.

I can see two options:

- Add a chip configuration flag such as PMBUS_DETECT_VOUT_MODE (for lack
   of a better idea) and use it in pmbus_identify_common() to actually
   _set_ the mode from the VOUT_MODE command instead of expecting it
   to be already set. This would require providing the coefficients for
   output voltage direct mode in mpq8785_info. This would be my preferred
   solution (but require a separate patch to add the code to pmbus_core.c).
- Select a fixed mode and write code to convert affected register readings
   to that mode if needed. See mp5990.c for an example.

>      4.Fix MODULE_DESCRIPTION
> ---
>   .../devicetree/bindings/trivial-devices.yaml  |  2 +
>   Documentation/hwmon/index.rst                 |  1 +
>   Documentation/hwmon/mpq8785.rst               | 94 +++++++++++++++++++
>   drivers/hwmon/pmbus/Kconfig                   |  9 ++
>   drivers/hwmon/pmbus/Makefile                  |  1 +
>   drivers/hwmon/pmbus/mpq8785.c                 | 62 ++++++++++++
>   6 files changed, 169 insertions(+)
>   create mode 100644 Documentation/hwmon/mpq8785.rst
>   create mode 100644 drivers/hwmon/pmbus/mpq8785.c
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 79dcd92c4a43..088b23ed2ae6 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -129,6 +129,8 @@ properties:
>             - mps,mp2975
>               # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
>             - mps,mp5990
> +            # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
> +          - mps,mpq8785
>               # Honeywell Humidicon HIH-6130 humidity/temperature sensor
>             - honeywell,hi6130
>               # IBM Common Form Factor Power Supply Versions (all versions)

Sorry, devicetree changes require a separate patch.

Thanks,
Guenter


