Return-Path: <linux-i2c+bounces-12644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88265B43FA4
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E31887A3BF6
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A10627CB0A;
	Thu,  4 Sep 2025 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fM/TL1Cg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F0D433AD
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997532; cv=none; b=GgZk7MuZFIbTXEkDzOW45iYNC7biPul5JE/Y5g2mczJtbzwCy2YsvyynnYgx5gyGFNLEBiWx7mCGw8FVWF8P41VLFDx8hQRPAwMhed8zSW7sMw34UjMEi424vp0DemWFhqQ2ZDckfXCgJVFMbWdiHpUyc8msrnGIDm3mEjQHZMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997532; c=relaxed/simple;
	bh=Regk9837D3NO2JyFL4e0NWX9lDCfumsQhNU5GH68Kzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gp/Nm3YRmYcUzFEK+ft2iX6ZZyfNcGbXetEiZqMe1lf4KMosGsTXOPdKR+MTP/Apc381/R3jSY8V/ki/4Mi0SpkoTP/7zd3azUb+n8xGgBWYmR7wqRqp6KnCyLKcwEopj2RxfHOhIeNYD9/2DsknSeCvIRyuL3cXqiTWiCG64vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fM/TL1Cg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b7ebe667cso11160885e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756997528; x=1757602328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/ycGZnds+z/QHl/WDFajxaBGcjIl8uT9DspiT23BE4=;
        b=fM/TL1Cg3qcEeTClA3zrqQ9iBkqtIB+IZPoRRppM0R+QGNgz6hVfcSZ/5zua1t/Hql
         l4brfekWvXY04CAZvkcae6TNrFul7nXKu9R/ac8dD1ncHyKHi4LMeiI1yTZjccVRfqRC
         wSrsoHqv0dJLOl2e06wiRbNhXTgkCFNS2LuEFkzU8rlVOlH2G3sv7VcJ5dS9L5sVN7Py
         zrpOqPcrVPo+VWBd4sdEXsy+4nzBbltElhcnW2tKictvpt9nzi6ykmTLQvB2H9ZxaTzG
         IqeFe63/mkvCUqf7oFzFQ9UqEfN1JU6vZSo5Z3VENfYz8M2d2Ak5yq/fhZ6xCkDSig21
         I4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756997528; x=1757602328;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/ycGZnds+z/QHl/WDFajxaBGcjIl8uT9DspiT23BE4=;
        b=DYMmxD7cvx+ikdfgIUhHMWOe3c09tT8Adb3oGH2f7RRuxNYiCYwi4kNdhX0ykWNW2b
         VGSaAtVwx40CxqAJMTAqDbvANrrRuu0TSKydKbCPeo8Agqj2in6VyVsE0oFdFrPoBe1B
         7qcxpldHvC+PUV9kRRBC2XjlSGWYGsu1iIBsJkXJ4Zjo4kNbcbvELBcOJLLx1hDasqZL
         3OuxuA3uBZqnfmrRcqtJDoVEsNolGkTDC+yCIttdbD3qAr3vn+ut2NOJg4rq0pIGXgmN
         dST3GxYJGNuhUHTUmZUJOsE1F1r0GUOSxWBjsoCC5mLN58MNuIJRzjBBhl9yxvKrAkdR
         ilMw==
X-Forwarded-Encrypted: i=1; AJvYcCUUOj2BfL2NuaJECSljU2t+22F42mTteQz/q/Ta97h7/xBGSRUgOGYU7uXYmvN3WxgmynbY+y5fLrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0cgmei7vydwM1JVSPcGKqgs3/01jpsdUw2352VGfvehsfKmIp
	QVdW4NKmmDi1Y+9iU0+HwDULSiDUQXkeiMDRoKNZBeOI9ai3IurDMBGYg+qyIQv453E=
X-Gm-Gg: ASbGncuSm2H2J4biuKyxgGut8k3YH5V1uQtwFzaW5oMYolumsOwARtykXQfrWZd1Fhu
	epPTpaotIHzdIxFqU7q31uDoXUvQaITptlmUtuCpkrn0JJLn2Ta64TcnsU7zot9Ltz7VIz8B4ez
	wb2fPs8dgsOWevW7LD7ArAP4QlND+Lw7xucLfyCAvBrT2hqAbDvQwXz+5RZUyDrpnolfpsvOg0F
	M+EysIEDty8ZF9UHDz8gnL2OH+mqViO4MQsCVbiCS4L7f2f1WXXFTAX5mq0Bcefx7mK6UoF9gqp
	xDxdaig0at1ESief6WMR1q/Ch3Vir63xW6slDW/S7UtI9S73lFSsjempPQZde/ox0KrAbuZMv3M
	izz2d3UvpEylu/Tj5rQVzvhLHk05kr5+jlsKyhY9Kiem/+ii+1lZy028NZMCeZHOC+PG4M17mwu
	s5oV6UPqEQfynFxR7ptWg24IGgsgc2xg==
X-Google-Smtp-Source: AGHT+IHTsoxoB4HNlhL82k9H9mr9S0iDNSTkAjB8ilh2KdQhFDsFlKoFFZI/S3sZrW3O7oQ+6PlwTA==
X-Received: by 2002:a05:600c:1c92:b0:45c:b540:763d with SMTP id 5b1f17b1804b1-45cb5407993mr60253385e9.33.1756997528266;
        Thu, 04 Sep 2025 07:52:08 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfd000dasm19823545e9.5.2025.09.04.07.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:52:07 -0700 (PDT)
Message-ID: <8657e44a-9c3e-492d-8485-44ff92c3bd74@linaro.org>
Date: Thu, 4 Sep 2025 15:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i2c: qcom-cci: Drop single-line wrappers
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-3-d38559692703@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250904-topic-cci_updates-v1-3-d38559692703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 15:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The CCI clock en/disable functions simply call bulk_ops, remove them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 20 ++++++--------------
>   1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index a3afa11a71a10dbb720ee9acb566991fe55b98a0..74fedfdec3ae4e034ec4d946179e963c783b5923 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -466,21 +466,12 @@ static const struct i2c_algorithm cci_algo = {
>   	.functionality = cci_func,
>   };
>   
> -static int cci_enable_clocks(struct cci *cci)
> -{
> -	return clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
> -}
> -
> -static void cci_disable_clocks(struct cci *cci)
> -{
> -	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
> -}
> -
>   static int __maybe_unused cci_suspend_runtime(struct device *dev)
>   {
>   	struct cci *cci = dev_get_drvdata(dev);
>   
> -	cci_disable_clocks(cci);
> +	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
> +
>   	return 0;
>   }
>   
> @@ -489,11 +480,12 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
>   	struct cci *cci = dev_get_drvdata(dev);
>   	int ret;
>   
> -	ret = cci_enable_clocks(cci);
> +	ret = clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
>   	if (ret)
>   		return ret;
>   
>   	cci_init(cci);
> +
>   	return 0;
>   }
>   
> @@ -592,7 +584,7 @@ static int cci_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
>   	cci->nclocks = ret;
>   
> -	ret = cci_enable_clocks(cci);
> +	ret = clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -651,7 +643,7 @@ static int cci_probe(struct platform_device *pdev)
>   error:
>   	disable_irq(cci->irq);
>   disable_clocks:
> -	cci_disable_clocks(cci);
> +	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
>   
>   	return ret;
>   }
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

