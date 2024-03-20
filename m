Return-Path: <linux-i2c+bounces-2454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E17881333
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 15:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19DF82869E2
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 14:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88AD45943;
	Wed, 20 Mar 2024 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uSUFxJ2+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2294207B
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710944381; cv=none; b=kGEWqGCJPkSH7kRMPyl5syEPvnCv3+iAyciTolO2qpFGz6KT3HDvQtL1DIaIDqMuG+86EQ2dUEm4d6aJYKHGI2jaSpEqewRsVQTMAyOCEKghaQhEVGEu/6KoceJrfvTods9QrvSNZ1wyBLBMFLU51Cl212jxuQv3jBPOaK2gsUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710944381; c=relaxed/simple;
	bh=UaT7k2gmjmJuDNmAFWziVqd0sZYoQPO1VA3qLt/9T0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bAZEmAxvwKT14JB4Qktk5C1ptVcA4WZlPy9XhCSlgo9ocQ+wOwI/+ANljm12e69a4CRWa3kiIr2Dr/OPkQbU59McBDKVyt9F4R+jgvLIeEjTzBSlBgvjYHXW1dV6zSdlG90kgnlqhLXKS41oKAM/Ut1HRdfbM+ec8wBT9XAGcGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uSUFxJ2+; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51381021af1so10013248e87.0
        for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710944378; x=1711549178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tseffhcRc/A55FYIKavHDEB4t/Se1FCTP2ao/3daC3o=;
        b=uSUFxJ2+zyfIay03554aAvcBT57UCM0iV6tLjQ6+eWx8HxBkeOQ1sMpQlse3gJqRI7
         KnCsAyD/1glHjXXiZHzeW6SZFmML01J7UVxSpK5ZAdfQt+aJ5LUetm4xbR4oKSSm2edS
         2OrYlysBJ+ksxdKUY8zmr3koHLC8qQ9z9erDVhZ/HoACFmvCijsRbYt1TxB2O22QkgRo
         xuHWNFCOzDbLSPqx0opG7CDEiy6wUaxW5gkbnydTtvSfada7xqXAnNc23e+kBbhdZJ5G
         6K3ll3ET7xM03M5I5vTEI4w7UaoXwFTWV0xNk0Y4GJycPYy2asjVFDWAUzqgaNWpcJOY
         +34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710944378; x=1711549178;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tseffhcRc/A55FYIKavHDEB4t/Se1FCTP2ao/3daC3o=;
        b=XVEJnwNgbii+9mViosuW5PRSzGrUmZwCyylXh3qJz6TeUDUN+aVXY9PPI9st7LxTB1
         Vj3ns9cKo4zzTa4GRw3F7mDIyoK9NAXk24FcrBIhlDaUV8BPoXcXWmSrFRCXlPGRHD1e
         IBx4WIFPoGkSwP861pl9FRaSRqjBN7og8gjql0Ro4VULct/Efxt18hQLyTlUg7i68oq/
         mBDydd+WXZ1oxSLW1A0kux5iLbbvqFMtStJSMxKBrWHKks6DnRcM+E9SEMIXxs3fzz0R
         a6/Cj5JmQg78bEYY/vm4sVf7Zc0HgXEDW9rBnODOgq8tgqddG5kRSXQSJQHo/B7YGtAv
         90EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA0g4kQdSoPHFXbY4FESrxTVA/k/NlMG2Febe0WdPIFHReripWkwadUWhIY76HBShXEsVrB/WzZq+7morUsUSOebMASPujMDoD
X-Gm-Message-State: AOJu0Yyo0m4BAwZ8uDdtYAevXjNEJWD0H5Dhlr0LZcALKXHTEIHvo1BQ
	k2h5zcGhDmH1OdOW0HY1UB9Dv5zI/5E3HtpDEFlV0ic5CCTRCT5Z0hOdAT5g2+Q=
X-Google-Smtp-Source: AGHT+IGtS32g4S/JY+nQ/oVfpwIz8FRauqjVpODUlS55OFGiMLqGNfr7SgqN3YLuHXNyce8tweEH/w==
X-Received: by 2002:a19:381b:0:b0:513:26e7:440c with SMTP id f27-20020a19381b000000b0051326e7440cmr9710194lfa.61.1710944377695;
        Wed, 20 Mar 2024 07:19:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id bp14-20020a17090726ce00b00a46bdc6278csm3709043ejc.71.2024.03.20.07.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 07:19:37 -0700 (PDT)
Message-ID: <473a833c-b166-4002-823c-a71e5aaa784a@linaro.org>
Date: Wed, 20 Mar 2024 15:19:35 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: adp1050: add bindings
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20240320125727.5615-1-radu.sabau@analog.com>
 <SA1PR03MB6499527C7BEE83A3E4EE6AFBF7332@SA1PR03MB6499.namprd03.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <SA1PR03MB6499527C7BEE83A3E4EE6AFBF7332@SA1PR03MB6499.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/03/2024 14:05, Sabau, Radu bogdan wrote:

>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        clock-frequency = <100000>;
>> +
>> +        hwmon@70 {
>> +            compatible = "adi,adp1050";
>> +            reg = <0x70>;
>> +            vcc-supply = <&vcc>;
>> +        };
>> +    };
>> +...
> 
> Results of bindings testing :
> 

Yeah... please do not send patches which contain knowingly wrong code.
Code is wrong if you perform testing and result is some sort of FAILURE,
build error, warning message, static checker/linter warning message or
error.

If something is not clear, ask via email or IRC, but sending code which
does not work could cause wasted reviewer's effort.

About your warning, please start your bindings from example-schema or
latest reviewed bindings.

Best regards,
Krzysztof


