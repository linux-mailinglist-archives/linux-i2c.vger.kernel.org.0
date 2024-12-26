Return-Path: <linux-i2c+bounces-8722-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E19D9FCA23
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 10:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AAAE1624AA
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 09:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0101D2F42;
	Thu, 26 Dec 2024 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMLQTKKU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B91E480;
	Thu, 26 Dec 2024 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735206627; cv=none; b=PNan/ycSd/28O2LYJtb1OALDr71AlW1BXsJgUELqUYOBFU5Y4oD/W69r8P1lDhAlFk9LszYvUzZbRuW6eOfxwolrPCrV3K05eltBAowiHnqWbWDJ1XPbeUqZxrPkqJIniKFzghqQizgXVNpmWh8pPZg6m1mCRgx0YrKrSdYoioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735206627; c=relaxed/simple;
	bh=ZRZJGAbp+aHeP7BLaQqXzxB6yn0PoQl0043X1mqvG+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIkOgCm5GhBmb1s5cufCfpngCBmrF2qTTNPq4H2Sux2vLMGXQZ58EIjHQVUw4ieC9ZEBBFi85Ngv6mTGDeaERUsGDin+OnLuUui5bQ4PVGL6esjhwmSZz/zfK1rKW6b3oRL8o16Hol3iE94RjNKu4DhLOJPVfyUV7UBTxxq4yb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMLQTKKU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43635796b48so38271345e9.0;
        Thu, 26 Dec 2024 01:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735206624; x=1735811424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BNLCGvzUscrhE8DerepH+jSw+ytsX5ncOa/i7T7TvEo=;
        b=RMLQTKKU5S0bCcKhyayi7E5drMRfAw8NBramjkejwhZZWqrjgHSGZZw1amiXGAuyU2
         YqZZ8TiUYkS4gfwQFEMt8tTzv3xc9cY1yNrbsSn9JqQG4qeSOKd4xEoAPBsfAGmnM0MI
         1fbKoGk1rIK4t3o9bpIpe5Dp7SPCdvgN0iunmvHtqS4H+ZI7VTxkZAksya8luchD6CUQ
         Zau0ifgetDGkSeKeZSWmjLilJZuPQz5AA2IsfFZ66Qk8QY3Kg0zhk8ZwAgaI89lBrrX0
         VrxhNW6BOFQ/F+CuckQ1owawnmMR4sd8pahbFjuGjpYFoZBpM8acNX8l1TIYg5ngSr4s
         xfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735206624; x=1735811424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNLCGvzUscrhE8DerepH+jSw+ytsX5ncOa/i7T7TvEo=;
        b=RREa7S89bzxTM4I5RX2t6a+cHemgZ5C+g8PHROZeGbp5RfKtgvQCRUrmszREFtAqOt
         w/OM16KAKWxh9Ezfcf9B0gj67IbgeODvQFJjcOlWKc4wVAJqP/nhBo69lT8fhf79eChg
         CRthmUDok00Ja+sKpoymGl8cl5Ml+Ugpw1XjE5HzGOFQD28Hd91wlvsP7CyX5BFlKR67
         KCSdU0h1isDFz5uZKsbsP/XD9xSK2mOy1pnfLw7M9nPI0tMcX6JYdxuOubY8//xEhsxY
         5sj4pLQaSzXyKGvEe5L2WQqlat6WJsxRO0LCnhR1LAsXy7IJIYnvvvpF1NQ2PRErJfoH
         0Gcw==
X-Forwarded-Encrypted: i=1; AJvYcCVm62p6uqPWhY3bynPkbilNBlAPXQqKb/nwOB8TOW1KjSZs/V7cYvucoswRC6wGtofBrsUj6nbq+cm6W2c4@vger.kernel.org, AJvYcCWu4Tq/OVpZQOxQDgaoTo+9dLkCo2ZHLPf53K6beVxloxVRFgHmH7e0k9SSK0oab8WHt4oDdnt31Ce7WhEBcLT7iaw=@vger.kernel.org, AJvYcCWzbP6vyt8HGwam8DP+gT/0gdpIWyTByoKgH7h4eKcWMCmHXs3f/md4SuXrGUvUNuO1xp3QzMOaLwJ4@vger.kernel.org, AJvYcCXBe8mVlQtkePb55+Fa/xKDMmF2xKaAknRSxu4UJ6/w/12lWWnztCceN5Otxf5G6akrrNh5L1Hb5dEH@vger.kernel.org
X-Gm-Message-State: AOJu0YwP5nQ/8TMAmRN/wIZ7sz5AWXxbkq6DsZYaGFKGcWCvCruVHArE
	qCOqajJONzL8XQ8MvzF+dH6yUg993otfH1R+3ZTPnP9OQysEDE/I
X-Gm-Gg: ASbGncuen48gpcnz7Y2+wHAay2cX0F8449HgOsuyBPaLBfOWBPOoU8Es37f1iL5m5I8
	aR11zaNwB4PkyRKj1ttq3yGkX8XYgpZS+j9ereJcNhsZCcEVmuYs2XcVoEwuD5BlfnHwENucGYg
	4EhVyAESxlzSI9BjfsfAjhlpCTpZd3lyUSxW4YGIEaqgfsp9vkjOoOiq9431Jext6NJ+MZtt5z1
	wY20Oe9nZ2B/4MRwydZxSzyH1PXaqvh1EZCR/nLcfbxG/KS6Dt26jU5WyMthorEqaHS118IZg==
X-Google-Smtp-Source: AGHT+IH1vPF2yBNf9acUDO94c4harHqUE+o6S9YimBB9B6UkN15rPNW1AYhFIZiHD2u4Qj/D2KcHGw==
X-Received: by 2002:a05:600c:3b8b:b0:434:f2af:6e74 with SMTP id 5b1f17b1804b1-4368d6e8d7bmr48232435e9.15.1735206623459;
        Thu, 26 Dec 2024 01:50:23 -0800 (PST)
Received: from [192.168.1.102] ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm230270745e9.7.2024.12.26.01.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 01:50:23 -0800 (PST)
Message-ID: <2cbb3ecf-fae8-4019-9b3e-43d48f3c9b25@gmail.com>
Date: Thu, 26 Dec 2024 11:50:21 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: exynos5: Add support for Exynos8895 SoC
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
 <20241221151937.1659139-3-ivo.ivanov.ivanov1@gmail.com>
 <djpcvn7von4rizjucplqwxlmpuaemrl7x3jsbqmojgzhybfu6o@n6l3dmtjy7jy>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <djpcvn7von4rizjucplqwxlmpuaemrl7x3jsbqmojgzhybfu6o@n6l3dmtjy7jy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/26/24 00:59, Andi Shyti wrote:
> Hi Ivaylo,
>
> On Sat, Dec 21, 2024 at 05:19:37PM +0200, Ivaylo Ivanov wrote:
>> Exynos8895 functioning logic mostly follows I2C_TYPE_EXYNOS7, but timing
>> and temp calculations are slightly changed according to the following
> /changed/different/

Sure.

>
>> logic:
>>
>> FPCLK / FI2C = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 2 *
>> ((FLT_CYCLE + 3) - (FLT_CYCLE + 3) % (CLK_DIV + 1))
>>
>> temp := (FPCLK / FI2C) - (FLT_CYCLE + 3) * 2
>>
> ...
>
>> @@ -352,11 +369,19 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>>  	 *
>>  	 */
>>  	t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
>> -	temp = clkin / op_clk - 8 - t_ftl_cycle;
>> +	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
>> +		temp = clkin / op_clk - (t_ftl_cycle + 3) * 2;
>> +	else
>> +		temp = clkin / op_clk - 8 - t_ftl_cycle;
>>  	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
>>  		temp -= t_ftl_cycle;
> Could you please make this:
>
> 	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
> 		...
> 	else if (i2c->variant->hw == I2C_TYPE_EXYNOS7)
> 		...
> 	else
> 		...
>
> For a better clarity.

Alright. Will post a v3 soon.

Thanks!
Best regards, Ivo.

>
> Thanks,
> Andi


