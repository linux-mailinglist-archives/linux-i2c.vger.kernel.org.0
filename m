Return-Path: <linux-i2c+bounces-1969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C45866B3A
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 08:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECAA41C222FA
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 07:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A8E1BF28;
	Mon, 26 Feb 2024 07:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j9WkX167"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485C21BF2B
	for <linux-i2c@vger.kernel.org>; Mon, 26 Feb 2024 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708933420; cv=none; b=jjjRu6bnDwc5ApW6DGE3Ba6VgqelZpb+b1yL5mRfZ1d9PImYDhUaa6qYAN5SvrVKWFUX6cFUnNIAhxPT8rS88eguB4UW6ZlHBNKw+sLzHVQxBnTknnubpp5hhFbs8Ao6XcB+JHoWyZ44fx16LzhfWj1cgZY9Iv9OUCHr8ZV5Ntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708933420; c=relaxed/simple;
	bh=0jHZbERHvBz8/k+vAtgKv8uNTvvfRkoN9sbJWBnosLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUJDtQqA+8MzK4wpletd78pf7Ks2SeGXflcXNQAT3X93lACL7wMcTpmTE4BQy2WIxe1y0ehEvZLMXxJWek3j43lIfsyNu369LeHS5O26WbsZOM1zKj4yrDm+HN8SEG/LsUe+h5EvWmM98XrvhW1pkZjW98DGeARb6PoIsrAupRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j9WkX167; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a4348aaa705so73092566b.0
        for <linux-i2c@vger.kernel.org>; Sun, 25 Feb 2024 23:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708933417; x=1709538217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLLV5MHKLPnEvbhOSWo3W24al4dWgZowpwQVTxE2dGA=;
        b=j9WkX16709IkyzX2qcUjOTYZEvXLqN3tI+M5a6CDPkIOIsh6mSRzM2KS0yxZLL4MrE
         s1ycLzdZSOie9AD2/bABHxqys2RsIwkA1U1Y4239vEex3HV2uLwBrCj/Q2j+WvBVw0WM
         aO3UgKebPPUR3uaMbrDestDz6JHnbivfCEpRrukJ41/tFQYSihCDAzYzSV/WTHQn/S+T
         7AgiohO7//Ek/4+ROyvrPUMCRysolJv3zQ1dNvPhcb6I2gCc5yJ5FabdtDP24qlae+XL
         nXCAYAVAo/37QHt08YCUjjSiLaojeUtJJflWLY8a/mkqftVA4JRKX7EmTC/+kVR5r6Ez
         Xc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708933417; x=1709538217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLLV5MHKLPnEvbhOSWo3W24al4dWgZowpwQVTxE2dGA=;
        b=fgqJdXvV/cfcZtUpnVS4IF5DSHHAqg4+6N9RF592mwi9oPhX56uNkTv8LrH63EXfBk
         3IIwWGeaV5VjJcClCeJtaYkwNhmgQPfYIjTaUeeRpDvN7ir2MzmQwYH9vjuFlUJQgjnv
         4bhpJ8tASqmctLkO6SiB1BM8qvJwanKjsBCiZkiip7xsdvlcuBix4YEyWbNkh/3XVSsa
         U/gVXlCMXukTjb1k5tjDqlMUipvZfnQFIrWyAH/v19ldC/XnTL723fo0Tudttk7gvrOG
         8PM4Hv+z9YJ2LcMa/gZ2pkIw5CP9npC6XocKDvZz4uRqDXU9OMWQFpUfFx+IQ8TOUk2U
         8HuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGJz2e8xuJS0X/rMkaGkaIFvpGSHIoJ7ieoKJGZJFkG1vWuk8HfYYt2KdUrIj9LPpqzswwxFLHORQ8si4PNkwNA7HrhpS5vv2o
X-Gm-Message-State: AOJu0Yx+7Ik+E3xMEWY2F2bs7n6lkCXGQg5zKrNL1Q5JEV7l9jdLgxXq
	RT2s8g1sCMbHguutcC8L3YAltdQxQtg/94MQuGFMyccDG5kaIBczDkQ2L6GtQzU=
X-Google-Smtp-Source: AGHT+IHdpjXymkNeepkoicWIMCSzGhXDOUvo65ozxzq3/2UCtX50FaiKrO4j18hn/2YhbD+1hIo/iA==
X-Received: by 2002:a17:906:381:b0:a3e:d92d:ef6a with SMTP id b1-20020a170906038100b00a3ed92def6amr4016032eja.25.1708933417407;
        Sun, 25 Feb 2024 23:43:37 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906304e00b00a3f9949743dsm2138215ejd.209.2024.02.25.23.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Feb 2024 23:43:36 -0800 (PST)
Message-ID: <4978a002-d726-4fcc-9435-028923a32317@linaro.org>
Date: Mon, 26 Feb 2024 08:43:34 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] dt-bindings: hwmon: lm75: add label property
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Jean Delvare
 <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-3-19a336e91dca@bootlin.com>
 <dcd5794b-aca6-4f6d-8e8d-f5548fcad644@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <dcd5794b-aca6-4f6d-8e8d-f5548fcad644@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/02/2024 18:30, Guenter Roeck wrote:
> On Thu, Feb 15, 2024 at 05:52:10PM +0100, Théo Lebrun wrote:
>> Declare optional label devicetree property. Show usage in one example
>> with dummy name.
>>
>> To: Jean Delvare <jdelvare@suse.com>
>> To: Guenter Roeck <linux@roeck-us.net>
>> Cc: <linux-hwmon@vger.kernel.org>
>> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> What is the verdict here ? Should I apply it and accept another patch
> to update it, or should it be reworked to be based on the new common
> hwmon schema ?

This should be reworked based on the new common schema (just like my
follow up patches did for some of the bindings).

Best regards,
Krzysztof


