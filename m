Return-Path: <linux-i2c+bounces-2096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E616E86E317
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 15:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F37C41C219AD
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 14:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E456F06B;
	Fri,  1 Mar 2024 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XDDNFFgg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675CA6EF1B
	for <linux-i2c@vger.kernel.org>; Fri,  1 Mar 2024 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709302395; cv=none; b=X+w5a0vnDjWA05uII4oxGu7VqVSkI1dbbu7ptvtMVE/Unu3shnzv6f2k/Qf5aAC6tmxkdnjf4/LVWYDJSaF+ihafdkzQkzrOf1/SiUFrwmROQdF9HKmHelsx/+wmSbpxZmR6+kw3yLSTmdi6Kmh5vc68nS9uYuqp8bw4lvezrhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709302395; c=relaxed/simple;
	bh=79AskBLIzpR8Y+RGiQXCQ50NscFHGmG0qnP7CvqQZ1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUoQ0muzfaGBQLHvbRRhlmR5WHZk/bTPoYhTO2mSlstPd8N2LSlZulJciM/Efwo/Y1H3CJgFdYsW6x2mVUfdNtDNRthtnAIJUrIsZgfP5L8rjr7+veyARaV4fCbVQMXT7Cv1hFnkxwIfxhoIlevwcoq9N6aOnYvM9RRyC+zjC08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XDDNFFgg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56648955ac5so3035911a12.3
        for <linux-i2c@vger.kernel.org>; Fri, 01 Mar 2024 06:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709302392; x=1709907192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smDa0EUQm9VZ5g/8IUqx/jlV3lWNyVjrs14iWU5k/XQ=;
        b=XDDNFFggWNl4sgc8T8gWxnB8ysxePKOyYaEP5H5SR0PmUeUhkQqwHPpi0HJ+OcNp5C
         xeUqQyI/fc3bfh5oU3+CuZwSHIjx5Hy4Htm8a+rT5rIXSHi+/bD1oqnidvyPkJQj5YV8
         am1ueBsx4ms8BmRkYNJAmaXI66hINAFzSvxxqTkWbNi1kr5Reae66l+O2or/e625UAtj
         a/RppA6fGJcYYjoNVXQMHMohC48Y8Dsac8u7TdAgm5+0bcC69GvevvQu5hKU44Gk0QFy
         6S6R7saV/BF8OU8G4NKKrL0mEE9ZMwKE9EOkT8qMQDSjd82E3dDLoBvx9IBAGROrgE+L
         Z+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709302392; x=1709907192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smDa0EUQm9VZ5g/8IUqx/jlV3lWNyVjrs14iWU5k/XQ=;
        b=SRfJyH3jV6HQdhN4DvEMP6zXgOZhtgxaTmDwJ9loVx9/L2aSzF48StxZyEXAbWGoMJ
         RCutq757Ptpsu6LA44AY+dBxDkgfPbeduFofmJHZ5hJ3otO5MoqkRYVz2L+0UdHCC4O7
         wQFig899AGIKLse2/M8EoHZja9yeh/Sv5oz1HZdbja9o1iLitslqaA55HGaZnAezfpwD
         PqH9MgI2NM7Wni6RBhOvuo06MHi3bSFI/hMRFHrn4o+WHroxadmxxzRFhVB+RWRRSae3
         4tC/wnF52MBU3YmtihuzBJyRMTRbxePQ6QN7ngh6dXKDhBOUkpKONkt4ePscsEZKa9V0
         fL0w==
X-Forwarded-Encrypted: i=1; AJvYcCUGShGUxjbK/t+QCBfspjpwql+dWlKhgComTKdIL7odJEuKbI1rquhQ+lnv6diHZUPjKrMvswfbBO/e/aLGB1FXeBvrK3Q4vdZg
X-Gm-Message-State: AOJu0YwU7Qz34+EjpPLLM8bzWlia0u3570eEBG4lkQB/7pxjRC9nk6TV
	Ztikkwm1HB7JMfPpF6zyCis7VYeZxp2RYw6FgCO7GqeCLOEMikJdx8CEJr5aTJQ=
X-Google-Smtp-Source: AGHT+IGteBZPF+60m4b/JbAsN2+6Hkqm/BAEUkImkL+e2ZnBBM0Kfp2EgJ4qlg9d/jXpEN9Oe2vTyw==
X-Received: by 2002:a05:6402:30a7:b0:566:414d:d70a with SMTP id df7-20020a05640230a700b00566414dd70amr1375716edb.23.1709302391693;
        Fri, 01 Mar 2024 06:13:11 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id en12-20020a056402528c00b005667bcc44b4sm1610803edb.9.2024.03.01.06.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 06:13:11 -0800 (PST)
Message-ID: <6cb235c9-e193-444a-ad41-533365c9b1da@linaro.org>
Date: Fri, 1 Mar 2024 15:13:07 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: lm75: use common hwmon
 schema
Content-Language: en-US
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
 <d0826186-ac2a-4229-abd2-1be33fc177d6@linaro.org>
 <CZIH21XQPA24.17TEKSPWLL7KR@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CZIH21XQPA24.17TEKSPWLL7KR@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/03/2024 15:09, Théo Lebrun wrote:
>>>> I don't see how is that relevant. You can organize your branches as you
>>>> wish, e.g. base one b4 branch on another and you will not have any warnings.
>>>
>>> That is what I do, I however do not want mips-next to have errors when
>>> running dtbs_check. Having dtbs_check return errors is not an issue?
>>
>> You should ask your maintainer, but I don't understand how this is
>> achievable anyway. Subsystem bindings *should not* go via MIPS-next, so
>> how are you going to solve this?
> 
> I thought it'd go in hwmon-next and be picked up by mips-next as well.
> It's clear now that the right approach is to send the lm75.yaml patch
> alone.

Then mips-next-dts branch would be based on subsystem branch with driver
changes? That violates the policy of not creating dependencies between
DTS and drivers.

What matters is final or even future release, not intermediate state.

Best regards,
Krzysztof


