Return-Path: <linux-i2c+bounces-2252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F5874E37
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 12:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EFE11F2563D
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 11:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACDA12BEB2;
	Thu,  7 Mar 2024 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NYT9CZbD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69DD12881C
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709812072; cv=none; b=Wt1peUzCgQUpVAsuW/lWYNE01qrwbnCVY2nRDr4dq55PQsl4QRGL4bzWwoSehtkIqg2f7nP1M4xQhu3Hy7nmwQGZlResta3zfjpga9Vj/HuIcLQJwS5J9WeE2eEbc09QsO1/z6BmLcW1O+837nGIRqfK/BYU3N6cwoYmutiNbP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709812072; c=relaxed/simple;
	bh=Vrv0z7gQFMDUOBWY2rKoK6/7cKBL3W4o2tjUetSS3yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNGydS0hSkf9ak61bVaWvZvl2q0c5yrQdL4FUPMrDTeEtKC98SMAEmr47UE15h++/p/9xHcmZupRas97GsdtaAJloFrZiyMpjcicwJGgxljVgnVY1B4TevCf0uQCM04/zl9GeYAdrO3CuiHiaE7B+P8xPwYBFberBfsjsKKf+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NYT9CZbD; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a45cdb790dfso83100366b.3
        for <linux-i2c@vger.kernel.org>; Thu, 07 Mar 2024 03:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812069; x=1710416869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9iTWvvRreThJbr792gSSUgcVGKkhqTvLaTQ6MbUXeg0=;
        b=NYT9CZbDiJI1bjs4R0H4GhgAZSS5N7xYTdCMidxcwSld1d8/LrelKEn+ABgezg1oB6
         Kx0QyA8OpbPFl92An2kaqZXXFpImTW2IX2X0w8q1NYO5pOIkw0VY0EDuQ5LMobAJYwVy
         75oKjsZum8WEXUX5P1D/yTdAmzCJtAxmDKwLXhCjDanNTH+B1YxbjrgpW2qiNCuYh2S/
         RteKEnNRocXHFkwCGJt6TJMzRuZbGQDTx0BHrjbxZnN3Re3j3tYB0pYsqmntWsuA9LaA
         CROPwFUtidvAlK/nFzojkb/kSe54XB99oV15vIj1cpXSxMMYMN97Xf/P+ENn0JsP+Rgh
         PAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812069; x=1710416869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9iTWvvRreThJbr792gSSUgcVGKkhqTvLaTQ6MbUXeg0=;
        b=YlmS4nvc34PoVo7OTRrT4gchNZ9IKhj5qfNkoHm4Z2L3ojJnAML9AC2Kv18ZACSpdL
         wJjJMfJXgnagdgnrFNtVZvdIVRQ1crnrk0+39wdiA/NACPwBAJhLEb27ibx8gXMr7Zuq
         pjXE8RsnKaMWmq/AWMbU3HHg9/K2yzLklCPTwPWHudDHZRZoXZSU8hfmuQvgbHtkfkrr
         londHpH384vw8cQ2Nv8WY/a5rAkxzTI5qFX8emm1dAVz3AIRWJrM12q/vZmPCw8/vnjn
         XKwBst0BVvJ4NNNKZ/LZv63VgH9mwdI7pUUqORt/NYkabqfPWMprPZJUFDpMFe+rbDji
         Qv+w==
X-Gm-Message-State: AOJu0YyaHLdqRKrsSKe+dYU9p/A8g/ffD5h7uZMu4rkYnd1fmLbwqM2y
	ud6CGl3yNVf5IhUGVHoFRLMqfeJRb77+RnMhTUGj/Ugk/C/ZMZUTHIjv6X2lJdc=
X-Google-Smtp-Source: AGHT+IHRG8/2xC0WFEoGCqSGwJHFifqu4sOFzsxZ+jgZOKt7ZpnspuVHncf/NIbMkXl0Im//GVXc+Q==
X-Received: by 2002:a17:906:c454:b0:a45:432:cacc with SMTP id ck20-20020a170906c45400b00a450432caccmr9577540ejb.61.1709812068821;
        Thu, 07 Mar 2024 03:47:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id s2-20020a1709060d6200b00a45a73e0be9sm2859806ejh.180.2024.03.07.03.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 03:47:48 -0800 (PST)
Message-ID: <4220eff4-4d77-492f-bdcd-a8e44b9c4f81@linaro.org>
Date: Thu, 7 Mar 2024 12:47:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: exynos5: Init data before registering interrupt
 handler
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Andi Shyti
 <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@axis.com
References: <CGME20240305105548eucas1p110f1ecf1570ff69a618ca86297eeba89@eucas1p1.samsung.com>
 <20240305-i2c_exynos5-v3-1-17a749688806@axis.com>
 <949c82da-f0dc-4824-ac57-bc86ae42d871@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <949c82da-f0dc-4824-ac57-bc86ae42d871@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2024 12:41, Marek Szyprowski wrote:
> On 05.03.2024 11:50, Jesper Nilsson wrote:
>> devm_request_irq() is called before we initialize the "variant"
>> member variable from of_device_get_match_data(), so if an interrupt
>> is triggered inbetween, we can end up following a NULL pointer
>> in the interrupt handler.
>>
>> This problem was exposed when the I2C controller in question was
>> (mis)configured to be used in both secure world and Linux.
>>
>> That this can happen is also reflected by the existing code that
>> clears any pending interrupts from "u-boot or misc causes".
>>
>> Move the clearing of pending interrupts and the call to
>> devm_request_irq() to the end of probe.
>>
>> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>> Fixes: 218e1496135e ("i2c: exynos5: add support for HSI2C on Exynos5260 SoC")
>> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
>> ---
>> Changes in v3:
>> - Avoid multiple assignment
>> - Link to v2: https://lore.kernel.org/r/20240304-i2c_exynos5-v2-1-7b9c312be719@axis.com
>>
>> Changes in v2:
>> - Use dev_err_probe() instead of open coding it
>> - Dropped the return failure if we can't find a match in devicetree
>> - Link to v1: https://lore.kernel.org/r/20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com
>> ---
>>   drivers/i2c/busses/i2c-exynos5.c | 29 +++++++++++++++--------------
>>   1 file changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
>> index 385ef9d9e4d4..8458e22313a7 100644
>> --- a/drivers/i2c/busses/i2c-exynos5.c
>> +++ b/drivers/i2c/busses/i2c-exynos5.c
>> @@ -906,23 +906,9 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>>   	i2c->adap.algo_data = i2c;
>>   	i2c->adap.dev.parent = &pdev->dev;
>>   
>> -	/* Clear pending interrupts from u-boot or misc causes */
>> -	exynos5_i2c_clr_pend_irq(i2c);
>> -
>>   	spin_lock_init(&i2c->lock);
>>   	init_completion(&i2c->msg_complete);
>>   
>> -	i2c->irq = ret = platform_get_irq(pdev, 0);
>> -	if (ret < 0)
>> -		goto err_clk;
>> -
>> -	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
>> -			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
>> -	if (ret != 0) {
>> -		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
>> -		goto err_clk;
>> -	}
>> -
>>   	i2c->variant = of_device_get_match_data(&pdev->dev);
>>   
>>   	ret = exynos5_hsi2c_clock_setup(i2c);
>> @@ -940,6 +926,21 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>>   	clk_disable(i2c->clk);
>>   	clk_disable(i2c->pclk);
>>   
>> +	/* Clear pending interrupts from u-boot or misc causes */
>> +	exynos5_i2c_clr_pend_irq(i2c);
> 
> Just above this call the clocks have been disabled, so any access to the 
> i2c host registers will result in freeze or external abort (depending on 
> the soc/cpu).
> 
> To make things worse, this patch moved registering the interrupt handler 
> after the i2c_add_adapter() call. This means that all i2c devices that 
> will be probbed directly from i2c_add_adapter() won't be able to access 
> the i2c bus, as the host controller is still not fully functional that 
> time yet.
> 
> This breaks today's linux-next on all Exynos5+ platforms. Has anyone 
> tested this change?

I don't think so. So that's the reason my boards fail on today's
next/master and next/pending-fixes.

Untested code should not be send as fixes :/

Thanks for reporting Marek (and saving me some bisecting).


Best regards,
Krzysztof


