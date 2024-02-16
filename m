Return-Path: <linux-i2c+bounces-1827-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1EF857A5D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 11:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 525B81C21975
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF72524AF;
	Fri, 16 Feb 2024 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="riCumzGV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357A450A79
	for <linux-i2c@vger.kernel.org>; Fri, 16 Feb 2024 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708079587; cv=none; b=fm9efbEKAWWlAcxyhJNv6w2tfUxhkbZM5gsuO9FvuLL4xCOs922Rxm1NYkaIG3hKOXau00HYDFcqdbVPvyKjymkMNaKQKy8M1sX9mhNrwE8MIZJP2jh+4gZUWtIesh8Q//pkrzQnPPYyxu1rnmJdWzJXeaFFrV4UAKkvDXYlKKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708079587; c=relaxed/simple;
	bh=v3WMpPSpGKUFaBbKKqTFJuKj9lAE+BLYnJtaKvj+EM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBOTe2JnrHFGoT/o0d+iZuo4tJ8/hvuW/GK48zTG8JVJvw9XFGPiIDnwTpE8Z/e/NU4vrDlU7dYAr8Lr8fUXTgggotZJib4ZtW49VnT/oIY9ME+RcsKzJPnLYT6+OLSecbeZlSykRhJs9EshIeWXqr4khQ3P6+8sFfaPMwYEsEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=riCumzGV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3cc2f9621aso187706866b.1
        for <linux-i2c@vger.kernel.org>; Fri, 16 Feb 2024 02:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708079583; x=1708684383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMB5YhLwV+bPXVhP9q0xmbnU7mdwnTyrNaTcUxNZueM=;
        b=riCumzGVD4IRRqiEQNgou/vYuYQwnHCpOlcd3Y6cPZGb1PXlPE5ltkbsZF323fkrqj
         QLG5V8kHz5yzMHK3VSw1PpjlRlGsN2hrZAhrofTGV1OiUzHcEBtiIYCQ5MDDDgb5eg59
         UxYEYmlx//lf3DTPnDtUbjdrIpJkG1bZh0PWMlM0fvxPpmqyLcvKFRjSOKerhTuruQWO
         rx9l8Ss32kQn14LuU6iGXL8rQuwI1xquRfXxYYdwy21Gv4+5AtFRZOr+i7vVbh3bB0cy
         4YXTYZ1pubcQhSVLFuFDCM285n3jnUdFGiHhy5ehNSXVRRXarsf41/+9WgiQ8edtRvD0
         CHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708079583; x=1708684383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMB5YhLwV+bPXVhP9q0xmbnU7mdwnTyrNaTcUxNZueM=;
        b=Qp1zWgJl5WWiG86OgdUv9gnUdmJrIqn3PDExlvOaxZZkMUCtm4wQh53Yo2ziRcDUUQ
         ElVJ8VsLYR+V+of5SV5cAnK+MAFxs1wY10AaG8XSisIwJkD2Q6pzxcWqfE5qY75HwA8a
         mxGJNVUbRJrQGbsSUTrF4vROuatcArgMzrTISUqnLWfKrvD/AeiNw5vp7tOpsngMWwSk
         jLT8MuVXpt19Sg0j35tJFuHwKnh9O3OuYHcYwlTYmEE0SVjmaok+OcieSnwWPiIyjUzX
         EmJV/znHK3fW6SrFjKX10p3GYekj1cUHUGLLRppMCYhlD6+ZR9t7PNC+rVF8Ejyokg6I
         Egfg==
X-Forwarded-Encrypted: i=1; AJvYcCXkTZLIH7bwShM6IASEq5ZhdLHx6P7Mmvl+xzJIpwrCj9FqGmj1JlNE94tRDAmGZC+Xuz4DC0jkw+C4ptVMi1FiY1aUvT/SpH4w
X-Gm-Message-State: AOJu0Yw/mb3ooLyjcPaEunUdRHK6q+MNwP7m0xSFnHQBgo1l9mBR2eAF
	vsjXstFVxz/UDYD9gl9wsv35OrZmlGRoUvKftweuT5AugnczQ47bYl+9bGNmZ+4=
X-Google-Smtp-Source: AGHT+IGhs8GVCybVhuXGSnWnmLOpDsZ+8gyhbUXBwU5LBcsUGMlh6EUeaWyTfP0jQaAqhBv0ctcbnA==
X-Received: by 2002:a17:906:b0d9:b0:a3c:f048:c9eb with SMTP id bk25-20020a170906b0d900b00a3cf048c9ebmr3143374ejb.12.1708079583321;
        Fri, 16 Feb 2024 02:33:03 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id th8-20020a1709078e0800b00a3d120e311asm1408814ejc.117.2024.02.16.02.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 02:33:02 -0800 (PST)
Message-ID: <6effca50-29a4-43b9-86eb-310bd4e08e5c@linaro.org>
Date: Fri, 16 Feb 2024 11:33:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c
 bindings and example
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-2-19a336e91dca@bootlin.com>
 <20240216022227.GA850600-robh@kernel.org>
 <CZ6FD7EHIJDT.32IEDVT9FG2GP@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CZ6FD7EHIJDT.32IEDVT9FG2GP@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/02/2024 11:18, Théo Lebrun wrote:
> 
>>> +        mobileye,id:
>>> +          $ref: /schemas/types.yaml#/definitions/uint32
>>> +          description: Platform-wide controller ID (integer starting from zero).
>>
>> instance indexes are a NAK. You can use i2cN aliases if you must.
>>
>> Why do you need it? To access OLB? If so, add cell args to the OLB 
>> phandle instead.
> 
> Why we do what we do: I2C controller must write a 2 bit value depending
> on the bus speed. All I2C controllers write into the same register.

Which register?  Your devices do not share IO address space.

> Index is used to compute the shift.
> 
> mobileye,olb is a phandle to a syscon. I'll be using i2cN aliases I
> guess.
> 
> Thanks,
> 
> --
> Théo Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best regards,
Krzysztof


