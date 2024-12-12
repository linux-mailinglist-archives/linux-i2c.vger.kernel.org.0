Return-Path: <linux-i2c+bounces-8478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BF69EFC53
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 20:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 528C51890EAA
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 19:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AA9198A29;
	Thu, 12 Dec 2024 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SHuweTgo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABDD189B8B;
	Thu, 12 Dec 2024 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734031328; cv=none; b=iBTJf7rHHJe9WPSKjvF6EATppgyEJXCAJBWfuIeg7S7+aHzntvifALf522yAtyXRXybuC9iVb9Fq/P56B62m0rIOPx9vMbgiEXgEMNFtNZkkhtkdRcX1uvaNRGe+gbUv1CwTEJrZFbvuH2+vB7f0thnZd3XPT2gLYNDZbxJArZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734031328; c=relaxed/simple;
	bh=pG99Ali7/UQJ0BNAHnplHhhhn1OOw+rQrNM9cCosv5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JxMhnEYIsfO/pAryvpL2rxXiBbvydCiAx/xBY+rBF78FStfFI9eCbgM4+JsIMitaFjGzqqpdChM9F3kbSMpL57rnHrFTrXH85H4s46irBue+JvPYODgFiCDI+hWVXJS5dllXzNt/23FpGIPO71icL6jgMyiCxR/1I2xtN0Kn2eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SHuweTgo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHwDhP028100;
	Thu, 12 Dec 2024 19:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6+SiK8KaSZVmPtC9o0Sp5nmaAkRQiNJ5J80BL3i2fs=; b=SHuweTgomK5Ubyq6
	dABp+3rOZL1CXFzqCkJ0phEnLVhn7GgWEwJ8IbcK+ckPgBc0O//g5tVZ0TvhaWI3
	zk7TwDVskAM3Nc/xQDBVXPF5bA1qTkabmkqx11a6fUom3akQnYKRElnDFRP1gwTh
	OoxbJG0wdFwPOM5hIzFp/X7Y9087SbMcjvoIwdozMk2zhZwcIQM71qWVPR6WzvXr
	zwLRjtj/w94POhmC3Mt40VeU0hYRBeYiKcINtwnhwWArXUKADB3losU+RE+1Ib9E
	Z6SGfTNAdcrNSaSwmjCLl3OdN0PRpFalFBBC2Q0qi0OTD/4N6GikH0fnafTEQM7z
	kE38mA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xv19m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 19:22:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCJM266007773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 19:22:02 GMT
Received: from [10.216.33.158] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 11:22:00 -0800
Message-ID: <4e36ec76-469b-4804-b50a-12824e1d21b1@quicinc.com>
Date: Fri, 13 Dec 2024 00:51:52 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: qcom-geni: Use dev_err_probe in the probe
 function
To: Andi Shyti <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <20241212135416.244504-1-andi.shyti@kernel.org>
 <20241212135416.244504-2-andi.shyti@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20241212135416.244504-2-andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3rB2i32JJ9tE-lm5CJrZJjazrs4QiuIi
X-Proofpoint-GUID: 3rB2i32JJ9tE-lm5CJrZJjazrs4QiuIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120140



On 12/12/2024 7:24 PM, Andi Shyti wrote:
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

Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

