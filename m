Return-Path: <linux-i2c+bounces-6602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B732697603A
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 07:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 736D9282DF7
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 05:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B66018661F;
	Thu, 12 Sep 2024 05:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJXy0BZs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CF51DA5E
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 05:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726117609; cv=none; b=ioYV1wZ8WGAkmLzihtNxeGwE3381r/eMgqkID57IFvghix4tJ4e55NLfRrdsUuP4QLGZ9cbg+EXjlzm7SWvpKQgIvK4G/KHTK64gv0ERpoTCCGbY634Xzdoh1imLluNZlGl2AxOT5TBng0J4vPGbElu9falAT8HpiBEiF3QfmNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726117609; c=relaxed/simple;
	bh=2xvzjT4dSbsg2ca75RZWrZFakdrpq4/4OFC66iOgqrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JFg+q60sXZo80PJf2kwM3CI7n5QkB4lYSUCrdVB6vQyNqAQ/cOUVhY6dG66GYbSC/p6tj4cftNd3VYGB3pMN5NzsDq3Y+5LebZXqalMuXwNFnDeXI/YiVHeq38S1h/V2OiqFo1KCB3od/4GpLYKerMUjCwtUOG9BVFOlhmkxc3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJXy0BZs; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53567019df6so70584e87.0
        for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 22:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726117604; x=1726722404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhaj3N3I8dBKCbVeu0u/BT29RxFxQBADjkDC/gT+hV4=;
        b=pJXy0BZsvxcp820tp4myRbTogZUtqB3P5XSinL04h4xxKtP4ZSZbW5CzKtiqgZsh97
         O1VyHlSZM4//gP1GMQ2aSpzTWP8aDdWV9ao1uaOmVllffxm+c4DGqs81VBjqZ27GHt2h
         8IoOVXVlztKF6wX5iXvYGzkhos/9FLzWVGqbc9wJhDOmfJZFrAgv+ijJ5LaYVY9pzS9Z
         GgvgYXuxPdXd+G6JhGOCtt0UtmBLTIjSUeVIKjD9kNr1CLxzNc/3COOISCbS3oyowPZn
         L0GxydTMl8skaIQuh+L3Uu4wukHdCWuK7ftWCp4wiUU/lleGmg0wP9itkbz6u+0eNqVS
         8EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726117604; x=1726722404;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhaj3N3I8dBKCbVeu0u/BT29RxFxQBADjkDC/gT+hV4=;
        b=w4AqYWVLiP9J+Gn5P9nT/PU5TDdOM7UQcVE1QRuIfWqOkdnOQH2C5Me3Mw0ijrAq5l
         AGpvb0LQ4lS/hKgfa5FtDXPg959/x2TFR3bjzRDzsr/52aErHivAYMdDaq4lSGz7g6cn
         7YcrF6aQCj48X4X9yzK5wdcEMELxGK28QQ32KF//9j2iZvKznMwjwuVi83TeZFqxW2HR
         HA5EdBP2dYIL2KL05CLgvcTbS6AHx2mtfHMrIqnEzzwff1hwpc6aWWNHHPSDBDF46mTJ
         E31ZMTfOdCydoo5swIbOGogtHU50UX23rufiNXHT/GIDFWJTAkYJaPuJTr1SVCQUYsHk
         Cc6g==
X-Forwarded-Encrypted: i=1; AJvYcCUOZh1waEbA7QvIDumXpvr1AL64x7Yiehhc6ROg3rtE818HSOqSGBzZlJyW9QM674l++cSuB8Nz9F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzL0+NvSRndFZvJfwGma8cpJkg9rIApHs+3aLVEqJ3pmFhaSC3
	9JBJQsO1zkOy0+U2OyvukcgyXQxyf/zQGGmFleXTy03Txd66pFv9r/j2vz3d9HE=
X-Google-Smtp-Source: AGHT+IG1zAhxqCSnphVS4knrQ7lzHdY0hkkCl/xfW2+M2LrSeIS20G5k+mnES++w75TRcLNSM/0jNg==
X-Received: by 2002:a05:6512:282a:b0:535:4144:e682 with SMTP id 2adb3069b0e04-53678fffd64mr200928e87.11.1726117604333;
        Wed, 11 Sep 2024 22:06:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f86fcb4sm1791631e87.74.2024.09.11.22.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 22:06:43 -0700 (PDT)
Message-ID: <9dd00bbc-9a4b-4e00-8bdf-757221813f04@linaro.org>
Date: Thu, 12 Sep 2024 08:06:37 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, andi.shyti@kernel.org,
 swboyd@chromium.org, wsa@kernel.org, sdharia@codeaurora.org,
 girishm@codeaurora.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240912033459.3013904-1-ruanjinjie@huawei.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240912033459.3013904-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 06:34, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 06e836e3e877..4c9050a4d58e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -818,15 +818,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	init_completion(&gi2c->done);
>   	spin_lock_init(&gi2c->lock);
>   	platform_set_drvdata(pdev, gi2c);
> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>   			       dev_name(dev), gi2c);
>   	if (ret) {
>   		dev_err(dev, "Request_irq failed:%d: err:%d\n",
>   			gi2c->irq, ret);
>   		return ret;
>   	}
> -	/* Disable the interrupt so that the system can enter low-power mode */
> -	disable_irq(gi2c->irq);
>   	i2c_set_adapdata(&gi2c->adap, gi2c);
>   	gi2c->adap.dev.parent = dev;
>   	gi2c->adap.dev.of_node = dev->of_node;

Thank you for the change.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

