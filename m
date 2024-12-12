Return-Path: <linux-i2c+bounces-8475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 721DE9EFB0F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 19:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AF14169DD4
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 18:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA6E223C7B;
	Thu, 12 Dec 2024 18:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WA2Du/js"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313CD222D7D
	for <linux-i2c@vger.kernel.org>; Thu, 12 Dec 2024 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028505; cv=none; b=dHn2vp60MirkoIotSQnfOaH1bVB6nS4O6q1gaASirSu0sffRQC/rxX4YblSTr7nabviCpxgzqJyObn3wZUjOQY2Zav4AnNF8lH1ubfxBrhva/NujB6cjr+F7a+mv2nPVxSykrW/IKfsnkq0FfuuihZDumO0oySDqIuXhCwHsR6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028505; c=relaxed/simple;
	bh=SeIAm+lZ2yOlHpZcR3VFAU3156D2ZaJCh011sYSMRuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uo3hX9b43yD4cCamUbjKDuLfKzIt1Zzq2k7IptFWVkZdeYCfD4Cm1h40zdmmjfm7gB72V+f90fXlzpo3464uJ8JKpjVCvKieNQ1GpLYqCNXOMzF20H2/ONXX0KDabiI9EdMm4ecvISLAV6gOQYa9VhBHijIOywNR6MeHxBqGUGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WA2Du/js; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5402a4547dbso147129e87.3
        for <linux-i2c@vger.kernel.org>; Thu, 12 Dec 2024 10:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734028501; x=1734633301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jLloTkAIqpAn2QEcEftcJWKOiGXTO1BOvV7Fm46HeA=;
        b=WA2Du/jsY+o2TaZqof5Hkr97YkQKfe6MyWpQ82XrmnBHd+0S0ttkE3T4WJZeP2+38c
         HPlrz/3gsXy7WPnI2RiUAvgP29GeromcBAoHjiG5OYlW8E+f/osrSwhWHL8426vmnVRo
         mW7jGoutorglVVksZyyqEEKhlcOt9AS/8/67M7aIHnDWGqwuDamu4xTwICLPuBpx7px9
         g26DVN0tcY2qbk028LenMQn4S2Duob0iIqbpMV9eaQNl9fKGM8fLTc3ENRskjbzxyp8G
         9e3/3+wW/ykJUEGS23G2ivsb3YRImlPqBMgEEreTFlxy3XlgbpxEYmWJ919CORLlZY4D
         FQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028501; x=1734633301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jLloTkAIqpAn2QEcEftcJWKOiGXTO1BOvV7Fm46HeA=;
        b=UeaUh+6QApnU4FELzoiLL4FpMvdfYqXdvEGwj7l1sAEsXF9p9iNdTuWD8cWNCYyuHV
         z3ll759b+f7qRzaNExPLi6SbUQasQ/ZRQqI6LhbfLjsdfw9113AjN71vuvhT6MqAzx5/
         K+eShxzvclaxUfiwzZHcwIpwKHH55IhqA2eJ72dcPT/qWwMcpwlgXhSuEuY4rHH92sOz
         6sPvgY1q9eMGacdmE72lR0R8P+r7mb1XJF+wSCTzdtE8HX0+ErruNpdoVB/c6THYJr4l
         4eaXn2B/AWKBJgX48p2OlpLkKqVdj4fVUv0Rk3grwOMdFt2fN6mlRH8AABt1wuj0AizF
         ZpAA==
X-Forwarded-Encrypted: i=1; AJvYcCVOp1e/url0wVf4Wev3ZQ7Dp/XLpF2fSBR6WfhXX26Qh2Yki/AJL38bgKwCh4HTNivYWplOc5Oy2MM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgmQQnXoAPzijh9AltljxBdLhqi0dFH/TLh/DyQTlsfB3baKxQ
	/cuOUz+yFwFuUk+WNG9wnFZVKZDIdg97I3bv38pIT4DdDfRkmGFx1AUUQmQOL7Y=
X-Gm-Gg: ASbGncsC52SBUbwnFwR7OUHPFTs2Wy7ewvv1Ngj3cTFDW+ql/EOJx8bqRp4tGRsbLU2
	acc6Kj7+jZBvaQjt9/6fs1EUR9lZzNNkCdnSrcv8rfsQHO3R1aWJGLLEAILhAnTqiQiXJiIkqxE
	sf5TyMofN9H/B/cC1bT0te2SjmgQvd4jNdHKy7WnwFQ4w71CgEhPmbf/rW8I8S33RVdysvjqbnX
	lbRMxczDOo0KnkKZtTB9U5LmNM8FMfznvSly5uyi6TXZR73quvScL7JlYRLgXAsB55RNtdi49Ps
	YzeXIeBQv5QakN5p7LgP1MynLr+DiMrViyw=
X-Google-Smtp-Source: AGHT+IE2ocauVfm8XXiFjr4T+1nEbJ4gNzDYCuilLYc/huPuG5NlGDRbLG6NiLujBuzRSXAGzjoNDw==
X-Received: by 2002:a05:6512:3195:b0:53e:fa8b:821e with SMTP id 2adb3069b0e04-5403412c712mr174340e87.9.1734028501312;
        Thu, 12 Dec 2024 10:35:01 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e38c31b0fsm1973118e87.277.2024.12.12.10.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:35:00 -0800 (PST)
Message-ID: <4353688e-61f8-4a45-b35f-c297575769e3@linaro.org>
Date: Thu, 12 Dec 2024 20:34:58 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: qcom-geni: Use dev_err_probe in the probe
 function
Content-Language: ru-RU
To: Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
References: <20241212135416.244504-1-andi.shyti@kernel.org>
 <20241212135416.244504-2-andi.shyti@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241212135416.244504-2-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/24 15:54, Andi Shyti wrote:
> Replace classical dev_err with dev_err_probe in the probe
> function for better error reporting. Also, use dev_err_probe in
> cases where the error number is clear (e.g., -EIO or -EINVAL) to
> maintain consistency.
> 
> Additionally, remove redundant logging to simplify the code.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 33 +++++++++++++-----------------
>   1 file changed, 14 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 7a22e1f46e60..01db24188e29 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -823,11 +823,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   		return gi2c->irq;
>   
>   	ret = geni_i2c_clk_map_idx(gi2c);
> -	if (ret) {
> -		dev_err(dev, "Invalid clk frequency %d Hz: %d\n",
> -			gi2c->clk_freq_out, ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Invalid clk frequency %d Hz\n",
> +				     gi2c->clk_freq_out);
>   
>   	gi2c->adap.algo = &geni_i2c_algo;
>   	init_completion(&gi2c->done);
> @@ -837,11 +835,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	/* Keep interrupts disabled initially to allow for low-power modes */
>   	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>   			       dev_name(dev), gi2c);
> -	if (ret) {
> -		dev_err(dev, "Request_irq failed:%d: err:%d\n",
> -			gi2c->irq, ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Request_irq failed: %d\n", gi2c->irq);
> +
>   	i2c_set_adapdata(&gi2c->adap, gi2c);
>   	gi2c->adap.dev.parent = dev;
>   	gi2c->adap.dev.of_node = dev->of_node;
> @@ -870,16 +867,14 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   
>   	ret = geni_se_resources_on(&gi2c->se);
>   	if (ret) {
> -		dev_err(dev, "Error turning on resources %d\n", ret);
>   		clk_disable_unprepare(gi2c->core_clk);
> -		return ret;
> +		return dev_err_probe(dev, ret, "Error turning on resources\n");
>   	}
>   	proto = geni_se_read_proto(&gi2c->se);
>   	if (proto != GENI_SE_I2C) {
> -		dev_err(dev, "Invalid proto %d\n", proto);
>   		geni_se_resources_off(&gi2c->se);
>   		clk_disable_unprepare(gi2c->core_clk);
> -		return -ENXIO;
> +		return dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
>   	}
>   
>   	if (desc && desc->no_dma_support)
> @@ -894,7 +889,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   		if (ret) {
>   			geni_se_resources_off(&gi2c->se);
>   			clk_disable_unprepare(gi2c->core_clk);
> -			return dev_err_probe(dev, ret, "Failed to setup GPI DMA mode\n");
> +			return ret;

I believe the removal is intentional, since setup_gpi_dma() reports better messages.

>   		}
>   
>   		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
> @@ -907,10 +902,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   			tx_depth = desc->tx_fifo_depth;
>   
>   		if (!tx_depth) {
> -			dev_err(dev, "Invalid TX FIFO depth\n");
>   			geni_se_resources_off(&gi2c->se);
>   			clk_disable_unprepare(gi2c->core_clk);
> -			return -EINVAL;
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid TX FIFO depth\n");
>   		}
>   
>   		gi2c->tx_wm = tx_depth - 1;
> @@ -924,7 +919,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	clk_disable_unprepare(gi2c->core_clk);
>   	ret = geni_se_resources_off(&gi2c->se);
>   	if (ret) {
> -		dev_err(dev, "Error turning off resources %d\n", ret);
> +		dev_err_probe(dev, ret, "Error turning off resources\n");
>   		goto err_dma;
>   	}
>   
> @@ -940,7 +935,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   
>   	ret = i2c_add_adapter(&gi2c->adap);
>   	if (ret) {
> -		dev_err(dev, "Error adding i2c adapter %d\n", ret);
> +		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
>   		pm_runtime_disable(gi2c->se.dev);
>   		goto err_dma;
>   	}

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

