Return-Path: <linux-i2c+bounces-2393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B1987ED0E
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 17:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE032281509
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 16:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DA652F98;
	Mon, 18 Mar 2024 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZB+5VaPa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37892524D9
	for <linux-i2c@vger.kernel.org>; Mon, 18 Mar 2024 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710778256; cv=none; b=pp5jl9uN8RQ7vwMJTXgnHhtsa8R6VLmtE0mQtIb+FM4XkwDRmUBbqKLWYMSJ+o6hs993dLkiOWJxOtigF4vXtkUzeWTmdbDcuUdr9MUpozOtR7tPRqXf8b1zlpKNwf6ODpcmR5hpGCK22u8dqspGvlwfVG87olifbuMzunhHLrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710778256; c=relaxed/simple;
	bh=AYb2lq5LX/8aweRNC/57Ae4xwsA/O52DROdPAT9dQkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pnb0AILMKzBMq1bGspTjdoSit5IYmKRMXKLnFuVbP7SV/XttGWt0OJ6tQvzPxCbUGiEcw7KH7wS1CH9hEH8gNpV1agZPdh9ketO75OJp1Ik5m5IAu88g6ZOBOQPPlfQ7UkVf9+Z4GlgPGrm5tKsaOGibhwr54vxUnf6lQasYEm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZB+5VaPa; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d2509c66daso65253291fa.3
        for <linux-i2c@vger.kernel.org>; Mon, 18 Mar 2024 09:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710778253; x=1711383053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8dUXbiRvTaXe7jzoN2uhqGgGMYVk6uFqv8HZ26Pr0E=;
        b=ZB+5VaPagLf7RjhtFg+mN9KkrbdMengYnzor4Qcv1vBgax5gTPcjoLHG9qbnBuGuLX
         5MtEqrB/EVSMtyRqjyYIkTkBP5+Uz0LB/Bo9DYwvxQB0V8scYimvDdW9u9ACb6hH5Dia
         0ARzMBXwrhfpdmwUQ+1Fft/E7wfc6X65dl7BAOZgIxfLzxggqjcMAPuQmlMBhoUujF5N
         7ACEhPht+fRF+1MSqJ+AsWXwkoBsFd2qKoVL+AVYc9x6kGhezo0MG48Zn1seQglQDAtd
         U64ChimJQ1kfBohXUKFfjElOAVQfUZJ4HigG2OBvPTP4yNAPDQUwFtDqDDa13A4hV2wW
         qL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710778253; x=1711383053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8dUXbiRvTaXe7jzoN2uhqGgGMYVk6uFqv8HZ26Pr0E=;
        b=M6192netJfPjhjcoNEpuLXHGjPsKDmYjtf4cOiDr3PlxHXjx4xydy+rdD/q7E/0yfX
         kU1f+9okI8Sq3ek25+hNHttrINoNIfw4o4Rppl/bCqNY+DTuxiUbK50Yxnac+h//Cpwm
         w+jBYgShzEHR1EuoTCDTCoz+jafErgh5xOIerBMAilzCzuq7pBTJiqTKZ17/h/E0a4Gv
         wQ98rVl8svZuwl3sOrBuruZgwD3fs93hRUHiJ5Q1k2Sw48d19MNSu8W+482mY4anW3PN
         7CzBedz0wmW6je8Y5wE8Sb5a7wKIJWnfppn8Dhm5c5lS+7pcr1ctXdIThyZrhE/cWmuk
         CvGw==
X-Forwarded-Encrypted: i=1; AJvYcCVc0JTmy+8LlB4AwmW7FPfz6+OhHK6pexjFa1vtZ/Meuv6q6PreulHS6mCPyqF+sk12acf0aVkTnPJMJrsBwAO2P+ZcDBvhcmQ3
X-Gm-Message-State: AOJu0YzvrMGGwxT4bzDyvM2SpWcN2rW/L6jMNkDwk6CL1S2QV3J+BL6e
	yn7M6iGLc/+S8/Hroyhftg4raW0PKHAcc95nRLfQY1ZUJ6yddeJ46dXU0qrfEBw=
X-Google-Smtp-Source: AGHT+IHcNGWovNAwvG6xUZmGi1jrBAezgz96CrnlpJRoFjgy2DseL1o729ovzMBt0OfE9BGKqw4wUA==
X-Received: by 2002:a05:651c:204c:b0:2d3:1c52:7ae5 with SMTP id t12-20020a05651c204c00b002d31c527ae5mr7962218ljo.46.1710778253392;
        Mon, 18 Mar 2024 09:10:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id g18-20020a056402091200b00568b6f73491sm3321676edz.14.2024.03.18.09.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 09:10:52 -0700 (PDT)
Message-ID: <ce082596-b468-463e-95d6-89776a1ef30f@linaro.org>
Date: Mon, 18 Mar 2024 17:10:51 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: adp1050 : add bindings
Content-Language: en-US
To: Radu Sabau <radu.sabau@analog.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240318112140.385244-1-radu.sabau@analog.com>
 <20240318112140.385244-2-radu.sabau@analog.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240318112140.385244-2-radu.sabau@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2024 12:21, Radu Sabau wrote:
> Add dt-bindings for adp1050 digital controller for isolated power supply
> with pmbus interface voltage, current and temperature monitor.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>

Subject: drop space before ':'

> ---
>  .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 65 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> new file mode 100644
> index 000000000000..e3162d0df0e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +

Drop

> +$id: htpps://devicetree.org/schemas/hwmon/pmbus/adi,adp1050.yaml#
> +$schema: htpps://devicetree.org/meta-schemes/core.yaml#
> +
> +title: Analog Devices ADP1050 digital controller with PMBus interface
> +
> +maintainers:
> +  - Radu Sabau <radu.sabau@analog.com>
> +
> +description: |
> +   The ADP1050 is used to monitor system voltages, currents and temperatures.
> +   Through the PMBus interface, the ADP1050 targets isolated power supplies
> +   and has four individual monitors for input/output voltage, input current
> +   and temperature.
> +   Datasheet:
> +     https://www.analog.com/en/products/adp1050.html

Missing blank line

> +properties:
> +  compatbile:

Typo. And you did not test it...

> +    const: adi,adp1050
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply: true
> +
> +  adi,vin-scale-monitor:
> +    description:
> +      The value of the input voltage scale used by the internal ADP1050 ADC in
> +      order to read correct voltage values.
> +    $ref: /schemas/typees.yaml#/definitions/uint16

Missing blank line.

> +  adi,iin-scale-monitor:
> +    description:
> +      The value of the input current scale used by the internal ADP1050 ADC in
> +      order to read carrect current values.
> +    $ref: /schemas/typees.yaml#/definitions/uint16
> +
> +required:
> +  - compatible
> +  - reg
> +  - vcc-supply
> +  - adi,vin-scale-monitor
> +  - adi,iin-scale-monitor
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +             #adress-cells = <1>;

Totally messed indentation.
Use 4 spaces for example indentation.

> +             #size-cells = <0>;
> +             clock-frequency = <100000>;
> +            adp1050@70 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +                   #adress-cells = <1>;
> +                   #size-cells = <0>;
> +                   compatible = "adi,adp1050";
> +                   reg = <0x70>;
> +                   adi,vin-scale-monitor = <0xB030>;
> +                   adi,iin-scale-monitor = <0x1>;
> +                   vcc-supply = <&vcc>;
> +          };
> +...
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f4d7f7cb7577..c90140859988 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -479,6 +479,14 @@ L:	linux-wireless@vger.kernel.org
>  S:	Orphan
>  F:	drivers/net/wireless/admtek/adm8211.*
>  
> +ADP1050 HARDWARE MONITOR DRIVER
> +M:	Radu Sabau <radu.sabau@analog.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	Dcumentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> +F:	drivers/hwmon/pmbus/adp1050.c

There is no such file...



Best regards,
Krzysztof


