Return-Path: <linux-i2c+bounces-2391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8301687EBE3
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 16:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38902283F95
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 15:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9311C4F883;
	Mon, 18 Mar 2024 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xrzjuy4H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994114F200;
	Mon, 18 Mar 2024 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710775071; cv=none; b=otiYkPuemglyEqUMAy0MWZiB+BIxFBequC2fuHH3CZLVt85U4kiGCAVaBOlRNDHPYBErTD7Bmu0xEuekkxt4mlOs/Nd5sLlpx3kOpHXa2o6SLyhbxMT82Y+GvuRCRrwj6f6mdaumOwiFuNkxrnEf0DLwC5Ux1vJl1JNhlYJUYlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710775071; c=relaxed/simple;
	bh=G3yhK96jNFKWxPnTwUrPzmxhcz802a43U06AZLBU7b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=V/AIor023GOedpfFTSxreHPm4hxwnJ9tKBa2IY0sTro+zgru1CBFJ0ZOtGiZ8SHt8NzWSf9f3/YZB0xDFRaAgpAfVDGqM+VfSW3vQnmePwqj3i4wAYifYsvlrs/MJhh+op3STFh0SgOnJjh3ZRY05jAXo3xYZh21v5NPr0Oe6bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xrzjuy4H; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5a480985625so1904380eaf.0;
        Mon, 18 Mar 2024 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710775068; x=1711379868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tXarof1ra1HlZEvUz3VGJibNa+StHEA4ynuHvFExBmM=;
        b=Xrzjuy4HQkB1mKPvEabbAdw8JHCLh6dac5j23C9Q8NNSTfc/FERLzXR8iU5NAVBPtH
         N/ys0JM0u8hdK7qlRZnIa0KLPQABiUdPKEkzrmcZ7pohN3nTVmMvRp7npjflCfAAWi1n
         FrFef9afhwvDLysSceR8D2Bqi4PjwxPjYN8fjirQNx7oExDqxCa5Ez4+e3t6bgA6KDPW
         J2vQwN3svgf0ZQcaaaMSCkFdaKVoapWPmprOFUh9iSuSlgwlGOAtLBY9pIryJ7w7zOuM
         AvGGZKQ8A6DAvFZcfDAx8VrorDMesaTxHMTFN5jdVznqxAFQ3Axz8VuuHFPsYqwl7s0E
         rHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710775068; x=1711379868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXarof1ra1HlZEvUz3VGJibNa+StHEA4ynuHvFExBmM=;
        b=jx1CL21jcqdyVjwnmkphvlSoGTDxkbq/X3TruUk3N/a3RHOkW4bYWHvmIdJb3TDr53
         LUhz1zkAvzYtapfeONzxevU7hGveBbJbihgaD3R8UVIGW1ViI6c7nG+fpI07kn6VFf46
         LghwME9TVQLlrum5iodSb5FaCzHg38gCIBRygDjtg9BeITwFAprtkoucVlBf6vJTGf8A
         uiYjm5GCN9WNwDU1+uTnKyHNj/iN3OooKKwx1KQJQviNLfAlmyV8yV9T0/mYd/qdNuPb
         8MMBJZxHySlaZcGKyu3tHv4sOj6MjpADU3EzbKDBAJudscsMf+/kpOssZLJYOyKRLWvg
         lT+w==
X-Forwarded-Encrypted: i=1; AJvYcCVKWesZnqJ1P5pBGaLJsp0XYgxbmDrqFel0a2WNgsBc8fUwzvWdMRJ3DCE0a1dbNCnOj6Qgq/pu1/5eWSxfG5arz8SbL6y9UTsc49g376r8LLvsGhHBfuCxvUrfm/FeWhU4jbI0jm2i/g0CFa0P73/gOtwT2NN2z2DbYtp0ruI+1eA2JyxJAM0Ujdf9eVvGvTCzAScoLj3hjfxT4yYQjBNs+76P4x8x2t0oxPusAVbbqxkZZhjRsw382rlg
X-Gm-Message-State: AOJu0YzUdn3/A+hA531kOMmXm+gDibvwGN8eLdAAstIbdijFAnUXd8v9
	utIwA2WZhZ/mfJfOTLx4xoEdOjqYsLz42RQK0CKBNb8oFyvwHi2O
X-Google-Smtp-Source: AGHT+IEh2egvDLm5ivK8HvPEsVDBe5K6y0cXAQQeTaBd/mBkb3A0sOYUQ1f8X2pNQwa7Uq52eFxO0w==
X-Received: by 2002:a05:6358:e481:b0:17e:eead:e532 with SMTP id by1-20020a056358e48100b0017eeeade532mr3874970rwb.6.1710775068477;
        Mon, 18 Mar 2024 08:17:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jw2-20020a056a00928200b006e703e0e2f7sm4643032pfb.194.2024.03.18.08.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 08:17:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e2caf1f3-97b8-4335-bb8c-be7fa2b40094@roeck-us.net>
Date: Mon, 18 Mar 2024 08:17:46 -0700
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
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240318112140.385244-1-radu.sabau@analog.com>
 <20240318112140.385244-2-radu.sabau@analog.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240318112140.385244-2-radu.sabau@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/24 04:21, Radu Sabau wrote:
> Add dt-bindings for adp1050 digital controller for isolated power supply
> with pmbus interface voltage, current and temperature monitor.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
>   .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 65 +++++++++++++++++++
>   MAINTAINERS                                   |  8 +++
>   2 files changed, 73 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
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
> +properties:
> +  compatbile:
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
> +  adi,iin-scale-monitor:
> +    description:
> +      The value of the input current scale used by the internal ADP1050 ADC in
> +      order to read carrect current values.
> +    $ref: /schemas/typees.yaml#/definitions/uint16
> +

I don't see value in "-monitor" in those property names.

Also, I don't see why those properties should be mandatory since the chip
has the ability to store its configuration in eeprom.

The proposed driver code disables vin and iin monitoring if the properties
are set to 0 or not provided. I disagree that this should be possible in
the first place (I don't see its value), but if disabling vin and iin
monitoring is supported it should be documented.

Last but not least, I think those values should be abstracted with some
scale instead of reflecting raw (and unexplained) register values.

Thanks,
Guenter


