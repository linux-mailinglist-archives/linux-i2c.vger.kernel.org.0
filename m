Return-Path: <linux-i2c+bounces-2094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6BB86E079
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 12:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34FBAB2483E
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 11:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA916BFC4;
	Fri,  1 Mar 2024 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kEDK5XO4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA24C6CDC3
	for <linux-i2c@vger.kernel.org>; Fri,  1 Mar 2024 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709292942; cv=none; b=pVSkgBSnUr7zfxGwvhxX6nJIhs19BnqanlZJvpqylmfXAwAwT+NCTSk4EarUbyXBSSsIeZTa0/jg3c2ZFUNR6bjODmMExRJ9WLyn+/U+pZOjUBljm1DjrBOi6aBq5R9a/CY+mA42pJk/cLhm05cUFXV4AzxaWU7QbLP/QK38RPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709292942; c=relaxed/simple;
	bh=Mq+Q9Adq1UGxH2yunIt9BT4VeceQKVpjb2ydeYEdbr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEP5/LLQMscyGaqadqLTrkwAuxucH5hwvq7GgAAA8pdeOCDug7bpGUiTXzs7Duvk58Zg+vLhjHZhqKFwtCt4f+URVBsYhCVhqwA0rib/5ZEjyXWa/tQtDbjldwGRk++vHsiPdR63clJiyNyJhtIbXkrrLIXKoqXLS+znwUEAPO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kEDK5XO4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a34c5ca2537so322396366b.0
        for <linux-i2c@vger.kernel.org>; Fri, 01 Mar 2024 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709292939; x=1709897739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eeJgU4KmvSf6bjy208HJ3rTyj2nuIaNorX/BOPhaaAM=;
        b=kEDK5XO4sci3vOixDUCJcS9BtO+PVT7xILBfXes7obdR+gP5pD/nlHmS2T3DbPWrKA
         thAJxqhpdB/snvWtuKL9ZRc7ppauZVZ/GvDDvR5Xevyk2SUIWQcJsV8Iodq8LVrCuxks
         HfBumBo+RQSFng9fvolXnHwhdt9ZKQD9TpmHbV/mkFUJ7mdkYUM3AAXnV6nowXAJxwz7
         tl0B/jNDF6+RhRnYPADF7cA4Wb1xNppG0SezVN9aHZWFVKTtRnLaXuGxrMQkZKD6mja/
         imGvOt2T6wpSwAAvC3FWI3RHkmlwVTUdjoi2J9qUvfKscHt1ieRvbwGNEVZQgexK1ZLv
         NVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292939; x=1709897739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeJgU4KmvSf6bjy208HJ3rTyj2nuIaNorX/BOPhaaAM=;
        b=wqlrgsbUNZHaXiNdwG8SwsZKaoTfRWTlPrs+ywagf3Vq9fd5BT0XzWQI/wXh7m91D6
         4uAnMeNSQgeKLEG8B/GaXQLcoM/WAWmDafvpy3VHvZqTqD9nvb8PulDMDNWivKfeppyC
         gQQURK3Ykqo++mhz0F7XGLm61yWJ4zdb2jIAgFvbRzO86V1pOgFhbnFAWQeIfj0Aa+Fp
         rbRVkQB5+22YcfVlg7n43PPWCfakPtpYk+uwT/qyXupb8IshPwe/LGBXEa0S+Z6tGgFn
         YbE5f1t3ysZWAeHIytI2pUOkKTgyHLYXLnJwQGJy5TeqcHOwO//qpvTKpZbRNJI3PUhX
         MMoA==
X-Forwarded-Encrypted: i=1; AJvYcCVC6EK+j+QpC8Cz4RAuyAMEZP/OTvNhblekRPDmjDngWlygyqcWcNrxX3J8Uau61nZSVwk//QFq2Y3SSs2Mxr01SObx6gKKuu8S
X-Gm-Message-State: AOJu0YyCQ7ac5IXnhpT3tPBx3sv55Ze8nOIzSpoqtJKpKNALxel+Ywwm
	Mhqol+72xMY+LhcZ7aZ1e+5bD6+A81g1XXJLvtjW0U/HPYTIGG6M4EfPao6Ns1Y=
X-Google-Smtp-Source: AGHT+IG4F1QwH++yXynaopX4llABAsvLgK3+WSHBwr90l8GZmx4pYjMhfgR4F/0TOGTZ/xFBLDpBfA==
X-Received: by 2002:a17:907:7677:b0:a3e:b439:6c8d with SMTP id kk23-20020a170907767700b00a3eb4396c8dmr1037349ejc.25.1709292939112;
        Fri, 01 Mar 2024 03:35:39 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id i27-20020a170906265b00b00a441c8c56d0sm1606968ejc.218.2024.03.01.03.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 03:35:38 -0800 (PST)
Message-ID: <d0826186-ac2a-4229-abd2-1be33fc177d6@linaro.org>
Date: Fri, 1 Mar 2024 12:35:36 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: lm75: use common hwmon
 schema
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij
 <linus.walleij@linaro.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Jean Delvare
 <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
 <6749c8df-c545-4aca-bc18-4dfe9c9f15b0@linaro.org>
 <d78fd3ca-ed0b-40e5-8f8f-21db152a7402@roeck-us.net>
 <CZIBCBQ2IB0E.2N3HAVO0P2SHT@bootlin.com>
 <f802a1e0-cedd-488a-a6fb-df793718d94b@linaro.org>
 <CZICOX6DR0SA.O876YRG8P03C@bootlin.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CZICOX6DR0SA.O876YRG8P03C@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/03/2024 11:44, Théo Lebrun wrote:
> Hello,
> 
> On Fri Mar 1, 2024 at 11:13 AM CET, Krzysztof Kozlowski wrote:
>> On 01/03/2024 10:41, Théo Lebrun wrote:
>>> Hello,
>>>
>>> On Fri Mar 1, 2024 at 7:53 AM CET, Guenter Roeck wrote:
>>>> On 2/29/24 22:37, Krzysztof Kozlowski wrote:
>>>>> On 29/02/2024 19:10, Théo Lebrun wrote:
>>>>>> Reference common hwmon schema which has the generic "label" property,
>>>>>> parsed by Linux hwmon subsystem.
>>>>>>
>>>>>
>>>>> Please do not mix independent patchsets. You create unneeded
>>>>> dependencies blocking this patch. This patch depends on hwmon work, so
>>>>> it cannot go through different tree.
>>>
>>> I had to pick between this or dtbs_check failing on my DTS that uses a
>>> label on temperature-sensor@48.
>>
>> I don't see how is that relevant. You can organize your branches as you
>> wish, e.g. base one b4 branch on another and you will not have any warnings.
> 
> That is what I do, I however do not want mips-next to have errors when
> running dtbs_check. Having dtbs_check return errors is not an issue?

You should ask your maintainer, but I don't understand how this is
achievable anyway. Subsystem bindings *should not* go via MIPS-next, so
how are you going to solve this?

And why MIPS shall be different than all other ARM/RISC-V SoCs?

Best regards,
Krzysztof


