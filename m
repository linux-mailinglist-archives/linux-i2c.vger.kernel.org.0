Return-Path: <linux-i2c+bounces-828-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B372F814344
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 09:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A639283231
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 08:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0918C11192;
	Fri, 15 Dec 2023 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IkuL8gdH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF1E12E72
	for <linux-i2c@vger.kernel.org>; Fri, 15 Dec 2023 08:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-54ba86ae133so297131a12.2
        for <linux-i2c@vger.kernel.org>; Fri, 15 Dec 2023 00:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702627660; x=1703232460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxD/VahC2ClQ2iwWPMIUIAj7e4n1LQ8i/xcl4ceScZo=;
        b=IkuL8gdHsOo1ykReLEththA0/6QdJYv2FQ3Vh0EpOYL2CJbiqIe7xIFHVa5CgtVkjo
         yl8ha9Kf+XLzj/7lcPR0ezFH8XfobYwyboPL0UthyW0ITd+dgJXa9BRukjVeZCOLI0SB
         hS9e7rQ8oGPQh0NcyZQQo9G6dv/OjSLD5kO+KbFG3ZxWnJeBNBZISS6ICFYeftiBB/np
         yNMUv2vgW5cNPXTBvHwVbY5i4CQv5/ux5667GS8h9z6Q7UR3U3jfeZQChgaE1Le989Kl
         AdS+/MrU8gviCRvhV+TQU9CsGZSwsrov/8TXbkL26S4ECLD+5uQb/yZ2/8a20U17Uan4
         K5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702627660; x=1703232460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxD/VahC2ClQ2iwWPMIUIAj7e4n1LQ8i/xcl4ceScZo=;
        b=h/rCYVeghyMrg+BI/g6qKlJey15GpjsCzT6dD5OpQqteD5/P3JfvNop2pCJ57vEsvc
         XMP0gODezu4gCXFCXfueOBGlzypPbpH4mw4cpK9lYolQHl+BeHb4GjFtV8uMp0y3zsMo
         DQOTy4weEnvOpNswys1NZqhRCZcqSoGus1QF+VrtMvZ9CsarFaPhFFL2uNuTHmBMcXL2
         YqWVJ6qKqa/8GehTxUgC2/sHJeCz9Jk8AIZyEHruh6JlhdaUr8gTMLHQFUg40nDSwHlr
         5NR4d9zYcj/He1VagR0NykX6cBuBVLvcRlc1x6kgwhiv/mKSpGkHSq/a/TGXUBJNag5R
         OMYQ==
X-Gm-Message-State: AOJu0Yz56PLaR+If5BerwpCzycKYFlHifNjyO8EIDn4z8ZTAmf/4CmOW
	LpQBPVYFZFD1Fa/s4i5IhDmQ0A==
X-Google-Smtp-Source: AGHT+IG9zEccBZFl5aP7IPpua8AKal9WySqOFWhLPSJEM7vjbmxr8qqS4iZT8fVNI6vEv60xIpQjmg==
X-Received: by 2002:a50:d50b:0:b0:552:72cf:1cf6 with SMTP id u11-20020a50d50b000000b0055272cf1cf6mr1157693edi.27.1702627659874;
        Fri, 15 Dec 2023 00:07:39 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id s28-20020a50ab1c000000b0054c6b50df3asm7881111edc.92.2023.12.15.00.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 00:07:39 -0800 (PST)
Message-ID: <c9ea0e9f-05d8-4def-8c68-6604c22763b9@linaro.org>
Date: Fri, 15 Dec 2023 09:07:36 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] arm64: dts: exynos: gs101: enable eeprom on
 gs101-oriole
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, krzysztof.kozlowski+dt@linaro.org
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de,
 andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-12-tudor.ambarus@linaro.org>
 <CAPLW+4nTgam4jZ+s5m5E05jWO_kfSy=fMS0Ywp3yQEEn-UESbg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAPLW+4nTgam4jZ+s5m5E05jWO_kfSy=fMS0Ywp3yQEEn-UESbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/12/2023 16:55, Sam Protsenko wrote:
> On Thu, Dec 14, 2023 at 4:53 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Enable the eeprom found on the battery connector.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../boot/dts/exynos/google/gs101-oriole.dts    | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
>> index 4a71f752200d..11b299d21c5d 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
>> @@ -63,6 +63,19 @@ &ext_200m {
>>         clock-frequency = <200000000>;
>>  };
>>
>> +&hsi2c_8 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&hsi2c8_bus>;
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
> 
> Not sure if those 4 above properties belong in board's dts or in SoC's
> dtsi. Krzysztof, what do you think?

The cells should be in DTSI, because you cannot have an enabled i2c bus
without nodes in normal cases. The not-normal case is incomplete
description, which does not happen here.

The pinctrls I guess as well in DTSI, because you do not customize the
pins in the DTS. IOW, if the pinctrl nodes are coming from shared
pinctrl.DTSI, then pinctrl-0/names stay in DTSI as well.


Best regards,
Krzysztof


