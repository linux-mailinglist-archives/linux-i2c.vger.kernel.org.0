Return-Path: <linux-i2c+bounces-3110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3184D8B0D79
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 16:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5516C1C24CEC
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E13815EFCD;
	Wed, 24 Apr 2024 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6lQLvi9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6854B15ECE4;
	Wed, 24 Apr 2024 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713970777; cv=none; b=WalRZtdsCJjRWPZPx/IqGmvjwQ+HRZKF2R2+Br88i2hIurCpYHd6grwksWhq2DqVVzAgxEk5y4qDrCYFfXzYCmUZzr6ho5YLZozqVWCxqwQRPKo/3U5xPEuvWrACBtIv63KFtTH5vPRASBjYcaKXLuyRW/dllxIk1Xajj40xnY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713970777; c=relaxed/simple;
	bh=K4ExJ6GuSInNKXFwEk1HyFMrEa7tI+fZTKmnaHlNJw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UScEEnlAOzz3KngmJe+9fyuXtlSEQFlLN/X5czqevz1eO0avnU5FxDCP3Bz6TujC0O5jOTuIFgZ9K3K2GHjm0jTKOyzBcHgxl93bgs2/lEDoCDYqwyDCUVzMX+aDiwr0JD1rzpbohjCD2GLDwPqy82HZXc7kscJ8Ag1D4eb9hyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6lQLvi9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e2c725e234so8472365ad.1;
        Wed, 24 Apr 2024 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713970776; x=1714575576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X74eyG1DXY+71bNT+un+ltxuft24ng2YP6D2WUX4f2o=;
        b=L6lQLvi9G7c7v9KFUe99/729EvO4yg/DxEBu0AxrW6KXMLNYlpXZp3huhwYFPITsxM
         fMyI8K+1bY9a+497o/hczMx6dFCTb8/2VxoPnUYcUapVcO6veRLikuHRmr7GGuKwYIJm
         lzCRrGKtw32zZ4Cwxp4OK9E88TqhHOIjM5mH+bh5NzYAAQXnLVTw8SFRMLjSyB1M5Civ
         iFUa+AUelS5eFSI8Z2QF6c2JtceneMInqE1n9NPXrL30tlV+VtrDqFE5/4Q1voTMN7IB
         27C/9388CJg0VFV8YSfmvqbAkwGq6UgSEWrqnujn8qNTK8ZWHwp3/iO4F8W/ZGA+y3hq
         vtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713970776; x=1714575576;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X74eyG1DXY+71bNT+un+ltxuft24ng2YP6D2WUX4f2o=;
        b=dRW2Dod5GMvUaZPdGciH82PEKvEHaWqWyVYNZm0hxxej0JVODL7EX6R/5z893Ym+EV
         e6MZlhzYRygaL1WoBAPLJwnAR/J+U6fHF0XeALPdoG4xx0ncIKXYA7TRpqIeJU0icG7f
         pHDzoVXH8qABIRQvhAnJeqqsBWWLzQR84vkhJfV5zs5h9fauH9mO6crijYMowC8s8nJp
         n/GQQgJV6wLlUeDStl1vFCJTj3XG3ZWm8LnhpLeRfyeM2rPbeYXqMin5U/zcqel5orjm
         2Dcqlqns0KQ791R2EkBiuQAW1p9rrgwAE2R6ejmQ2zw/OODFhicCxkcH9woezj0pxp3k
         K22g==
X-Forwarded-Encrypted: i=1; AJvYcCWDIeJGcKHs+uoA4AIrz7uNxmaYWWkXejjQ0GdzocKgCar9JOGuyPpApS36A9zjzw1oeCbfMQa3/6H7qUzgF0JJvY0BBvxgdqpAaM1eUpMURASgXLF47TLZa//2ruh9yEJeds3xHecvOCTlhS7AERuWY3+VxfckkWNG7h++gqC4nV1XGB/oPNqxiNp9V3A2xTDWCZd98C5D6S1NyGaPDNF/j5wNryzTMQp5f0+zRIhH3mlmWBY9QcKGeH/v
X-Gm-Message-State: AOJu0YxVaseueNsDZoBEX1/msAs1/gFIH7EoC55HJCTuKhn95uQTOx3c
	bLDapXLTiPlhRABSWhSa7QiFtPh1uMcFjicGWOmVzJKcKSMXvcb0
X-Google-Smtp-Source: AGHT+IH0ptHwUtqY8w4E+oyHPHd9wAxcdWO8sMQ345sdNTGWE/81J21xmHrBwm16sMQxwZAchKbajw==
X-Received: by 2002:a17:902:d491:b0:1e8:682b:7f67 with SMTP id c17-20020a170902d49100b001e8682b7f67mr3977371plg.29.1713970775527;
        Wed, 24 Apr 2024 07:59:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d1-20020a170903230100b001dee4a22c2bsm12028190plh.34.2024.04.24.07.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 07:59:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2b678387-2b19-4176-813d-408c121d9a87@roeck-us.net>
Date: Wed, 24 Apr 2024 07:59:32 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] Documentation: hwmon: Add infineon xdp710 driver
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Cosmo Chou <chou.cosmo@gmail.com>,
 Andre Werner <andre.werner@systec-electronic.com>,
 Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20240424095604.3425857-1-peteryin.openbmc@gmail.com>
 <20240424095604.3425857-4-peteryin.openbmc@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240424095604.3425857-4-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 02:55, Peter Yin wrote:
> Add document for xdp710 device
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>

Please merge with the first patch of the series.

> ---
>   Documentation/hwmon/index.rst  |  1 +
>   Documentation/hwmon/xdp710.rst | 83 ++++++++++++++++++++++++++++++++++
>   2 files changed, 84 insertions(+)
>   create mode 100644 Documentation/hwmon/xdp710.rst
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 1ca7a4fe1f8f..b2546925fb15 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -250,6 +250,7 @@ Hardware Monitoring Kernel Drivers
>      wm831x
>      wm8350
>      xgene-hwmon
> +   xdp710
>      xdpe12284
>      xdpe152c4
>      zl6100
> diff --git a/Documentation/hwmon/xdp710.rst b/Documentation/hwmon/xdp710.rst
> new file mode 100644
> index 000000000000..083891f27818
> --- /dev/null
> +++ b/Documentation/hwmon/xdp710.rst
> @@ -0,0 +1,83 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver xdp710
> +====================
> +
> +Supported chips:
> +
> +  * Infineon XDP710
> +
> +    Prefix: 'xdp710'
> +
> +  * Datasheet
> +
> +    Publicly available at the Infineon website : https://www.infineon.com/dgdl/Infineon-XDP710-001-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c8412f8d301848a5316290b97
> +
> +Author:
> +
> +	Peter Yin <peteryin.openbmc@gmail.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Infineon XDP710 Hot-Swap Controller.
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +Device supports direct and linear format for reading input voltage,
> +output voltage, output current, input power and temperature.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_max**
> +
> +**in1_max_alarm**
> +
> +**in1_min**
> +
> +**in1_min_alarm**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +**in2_alarm**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_alarm**
> +
> +**curr1_max**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> +
> +**power1_alarm**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**


