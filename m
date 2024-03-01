Return-Path: <linux-i2c+bounces-2084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ACC86DBB5
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 07:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCA10B24DF9
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 06:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D3969301;
	Fri,  1 Mar 2024 06:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9S+uVoJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141969940;
	Fri,  1 Mar 2024 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709275994; cv=none; b=b07vbfX1y+BTYRhL/BKH7Ttz9ZF+sFua1ulwxxSzlImBnF/Ix/4IWp/IH2zCCUKeXquwqpKtN2oiMyrMfboUx7brimEE8Ho+KsMvwpOq8Zr1tvcO34jnoFVqBPyR08FpHh54y1O6LN0vc2IbjgdexDghAeFXxKnlPJ43Pgw31yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709275994; c=relaxed/simple;
	bh=yJ3qnuzsiD+vY7/3h2hLhh57k/nxh0MKDiLyXnJblD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtN9AaJgdiD7doexNEm7UahIIxOfm+p/CoFoVfOSsiQFVl8PRcn8SA7t3CVAgCupgJbRkEqxOpkCkwVDZJ2cuXZTeD6ziKdUTBbwzoiVS3bx42AV6M9Fj3+JKPd3LHdAWXGyVZecJf6l6t8kWgC2172AwlV+DDlQhRC3Zh7odu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9S+uVoJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dca3951ad9so16464195ad.3;
        Thu, 29 Feb 2024 22:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709275991; x=1709880791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wXiG6D5m4V4RhFeANN6ytUCYOxlqAHIxI03T8MEdzXo=;
        b=J9S+uVoJsX8hXydEC/sV3k2A4dJUhhcbBvaivT+khvwY8sJs5/8uyMrT8lcpQ3pNnD
         r0f/0aGuh1c76sPIBm5oNw+ooFaSso1z+TyH1oIwfXQ3MT9/ZkpjnakT8vYSHVmtknEq
         u62CX30cUz8EPd7+S/2QiyTxJHHaQtunKUvZep8K3DWFDCLALJB73f2PPON5yFnGtjm+
         cvABlz/82jlD1ubp2eZ170jLdDKGDpwMFsZJAKauOv3UM+YxQaDq9SWtpyJO7fCuwW/1
         Gz4NNscRDg7XYmgiWV8OsFVnI0jqR/T6gfadIFU0Z0FBkEZ358uYjO+JlhD65pKjZvFp
         phgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709275991; x=1709880791;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXiG6D5m4V4RhFeANN6ytUCYOxlqAHIxI03T8MEdzXo=;
        b=LhP6bB1EZK7rmTO3SqcrRt/JVTIQK8ELLujuV69btzF2TAmkNu1ImWB045i6xmFcxh
         AdpU7JgN9QNTknRsttRvj+g2VkdTqYaE5BvIwdNoJrGScHMJuiQbit1WQ8dw4m8et7D7
         pnM2ckj9n+77WHB2j85uYxWODG2pQ5z+PTq0qO4b36bAoJsjQfxGGLEx8CCxEF+76Lm2
         fjoCMryK88C1AQZwiv9Pg1TIcX/9UuUlftpl8fedQWrwCXSRWbT7bWDbyt4oxYCFOAl2
         IFOsHU16tbKvoT+kB+gNkJQk/yYf97pASg1CkDa901W8Z+GGW+rbAMlqEe+Fnt2rPPBX
         d1Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVVg2hiienzkdJX936+HEgWRkcZm8M4A/PNmIRBshX2zb0GzWHzAoYUv51uqyG79Oy/d3TVkk8Tgq5TgSjI+IF9ZLCYsV9tawfmF7S94ZpMiBsdYlSsLN56rOvLga1+idfpPCdbiL3e0k0EvpoHjSROsofBV8bSJyEvpQhm9GcrvnfXY8RGcXCEFFMAIUIC2zrlHXj1dxrhl42qSVAvGC2thzB8pHZeR52pr+mBoICFvor0uGIvoZ7y/WKxaQ==
X-Gm-Message-State: AOJu0Yygb9CcfAoc2H2LiF89R0mzouiX2SeE99m5qbfK/dcv/zbMbUR8
	oydoE88x7ki0MTLY7ZKTqGv+F85KA6azWnxX2Yk3jqhANMVuwKgx
X-Google-Smtp-Source: AGHT+IFpbSIiHEKTPKogLyHISu8ut/C5tr3wmgIj/iizT3dRu4HAqzDP5jIYhOI77adwEhkLqkAdmA==
X-Received: by 2002:a17:902:a384:b0:1d9:167b:8e6c with SMTP id x4-20020a170902a38400b001d9167b8e6cmr668758pla.46.1709275991299;
        Thu, 29 Feb 2024 22:53:11 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090341c200b001dcb560d7f0sm2646773ple.11.2024.02.29.22.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 22:53:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d78fd3ca-ed0b-40e5-8f8f-21db152a7402@roeck-us.net>
Date: Thu, 29 Feb 2024 22:53:07 -0800
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
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <6749c8df-c545-4aca-bc18-4dfe9c9f15b0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/29/24 22:37, Krzysztof Kozlowski wrote:
> On 29/02/2024 19:10, Théo Lebrun wrote:
>> Reference common hwmon schema which has the generic "label" property,
>> parsed by Linux hwmon subsystem.
>>
> 
> Please do not mix independent patchsets. You create unneeded
> dependencies blocking this patch. This patch depends on hwmon work, so
> it cannot go through different tree.
> 
> If you insist to combine independent patches, then at least clearly
> express merging strategy or dependency in patch changelog --- .
> 

For my part I have to say that I don't know what to do with it.
Rob's robot reported errors, so I won't apply it, and I don't
feel comfortable giving it an ack either because of those errors.

Guenter

> 
>> To: Jean Delvare <jdelvare@suse.com>
>> To: Guenter Roeck <linux@roeck-us.net>
>> Cc: linux-hwmon@vger.kernel.org
>> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
>> ---
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 


