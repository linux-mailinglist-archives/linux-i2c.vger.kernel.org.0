Return-Path: <linux-i2c+bounces-8476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C179EFB59
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 19:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D60D288100
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 18:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E2B223E64;
	Thu, 12 Dec 2024 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="l1BPtpJz";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="PZ/esHWK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6FA2101A0;
	Thu, 12 Dec 2024 18:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029071; cv=none; b=MU0fV4JsYG9AWLIUutS8v5+mlNdJrcu/WHOKBKd5GTvT8ExGIG1FVYzuqiVyzEvg9JjW2s6ssGOCc45JDT9cVjVCvN0QgR6SzCu594KHQAjQxlbKC3n96z1Wj4S8jn1pNnxz5xivgv3s7HxUWpbG/edPYEjXecMoinPDJZ347vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029071; c=relaxed/simple;
	bh=quKBbt6/Sg39xa7+BKBoBPyPizvKiv9w4Zjcr4IpfMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/EJ9uSRU6ynQNhR1Enq1JOdk4I0R3VQoQvWnTJR2ejDe7ZeiqtbFldHy3yeDgylY8YOeW+uL8asOXQK8FA89nqcPEnQkTaJj9OgPplLcyKanVCQ+SBEj3hqh0AWSWAi/OA5tBkdMUQDA4sHd3VEz4y6MMfjeK7LrmCaV3OOqA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=l1BPtpJz; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=PZ/esHWK; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1734028688; bh=quKBbt6/Sg39xa7+BKBoBPyPizvKiv9w4Zjcr4IpfMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l1BPtpJzhT2SnSQRoUfPesj8hHIq9oejlCEGntZj+dfgXrL2Doa1+oRnCp1TP6hQq
	 ZnZZnK7h4szWB3AQXcgthFlSIZV8iDhiTTJQfA2S93DAL69PPrJymbRUchPbO5sOjD
	 P6GAW1Yctmn7CaX375y7IzTXPVI2CQjFIhsjYzU84do7wQP37TvJbxdQXWNR0XtLVO
	 H1eZN1fJLq9ZDED4HbJ7+744h9u6Q8JIbdkGZpM2UHOWfO+zAnCVPuKuCp2/ueWo/7
	 Mgn+hlQx2N3TXRf3nehQHH4bJg75cQeR+8qbG3xEEEzq9cgvKySsS2THtRRgSjRvY7
	 zbrdTWxxhHepA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id EA0F939290C;
	Thu, 12 Dec 2024 18:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1734028687; bh=quKBbt6/Sg39xa7+BKBoBPyPizvKiv9w4Zjcr4IpfMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PZ/esHWKllbuwLRROs8jm/DcrjjKjMmHAQ3aFvgdoP8qgYDcx7VzP0JSOuhHcLL4q
	 aEw037IuDMAb3/EMm/nXiGSoteF0nfkBj1I4n/a+o8FqhpWfmx+GbeqMhgzlgIEIVK
	 aqch9L6Pf3uochqAF/zxA0fsKBG/JvW0PdVlAL0AsazAU1NEaBYUJiv9iXDvP9GPYG
	 ur/ySpOhbQcwF6P7y0YOLTnzkwmw1Qc0IILnHq3NArJ6m2OfjWDVpSMO4hcL1wJUIk
	 0xk2v5TsIaPicI6yGu8Qc391UIn3XCLYXLVM3bo5oEwS4SOAcQpfIeS3T2atri6ymn
	 lWILv4doB4GsA==
Message-ID: <fac676fe-c5b0-4765-90bc-affda7c00be5@mleia.com>
Date: Thu, 12 Dec 2024 20:38:06 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: qcom-geni: Simplify error handling in probe
 function
Content-Language: ru-RU
To: Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
References: <20241212135416.244504-1-andi.shyti@kernel.org>
 <20241212135416.244504-3-andi.shyti@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20241212135416.244504-3-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20241212_183807_974096_BA502DB0 
X-CRM114-Status: GOOD (  18.04  )

On 12/12/24 15:54, Andi Shyti wrote:
> Avoid repeating the error handling pattern:
> 
>          geni_se_resources_off(&gi2c->se);
>          clk_disable_unprepare(gi2c->core_clk);
>          return;
> 
> Introduce a single 'goto' exit label for cleanup in case of
> errors. While there are currently two distinct exit points, there
> is no overlap in their handling, allowing both branches to
> coexist cleanly.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 32 ++++++++++++++++--------------
>   1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 01db24188e29..88709b97f86d 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -867,14 +867,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   
>   	ret = geni_se_resources_on(&gi2c->se);
>   	if (ret) {
> -		clk_disable_unprepare(gi2c->core_clk);
> -		return dev_err_probe(dev, ret, "Error turning on resources\n");
> +		dev_err_probe(dev, ret, "Error turning on resources\n");
> +		goto err_clk;
>   	}
>   	proto = geni_se_read_proto(&gi2c->se);
>   	if (proto != GENI_SE_I2C) {
> -		geni_se_resources_off(&gi2c->se);
> -		clk_disable_unprepare(gi2c->core_clk);
> -		return dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
> +		dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
> +		goto err_resources;

What's about setting ret = -ENXIO before bailing out?

>   	}
>   
>   	if (desc && desc->no_dma_support)
> @@ -886,11 +885,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   		/* FIFO is disabled, so we can only use GPI DMA */
>   		gi2c->gpi_mode = true;
>   		ret = setup_gpi_dma(gi2c);
> -		if (ret) {
> -			geni_se_resources_off(&gi2c->se);
> -			clk_disable_unprepare(gi2c->core_clk);
> -			return ret;
> -		}
> +		if (ret)
> +			goto err_resources;
>   
>   		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
>   	} else {
> @@ -902,10 +898,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   			tx_depth = desc->tx_fifo_depth;
>   
>   		if (!tx_depth) {
> -			geni_se_resources_off(&gi2c->se);
> -			clk_disable_unprepare(gi2c->core_clk);
> -			return dev_err_probe(dev, -EINVAL,
> -					     "Invalid TX FIFO depth\n");
> +			dev_err_probe(dev, -EINVAL, "Invalid TX FIFO depth\n");
> +			goto err_resources;

Same comment as above.

>   		}
>   
>   		gi2c->tx_wm = tx_depth - 1;
> @@ -942,10 +936,18 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   
>   	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
>   
> -	return 0;
> +	return ret;
> +
> +err_resources:
> +	geni_se_resources_off(&gi2c->se);
> +err_clk:
> +	clk_disable_unprepare(gi2c->core_clk);
> +
> +	return ret;
>   
>   err_dma:
>   	release_gpi_dma(gi2c);
> +
>   	return ret;
>   }
>   

--
Best wishes,
Vladimir

