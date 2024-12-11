Return-Path: <linux-i2c+bounces-8436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8ED9EC3CE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 04:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D60F1883F72
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 03:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC4120DD6B;
	Wed, 11 Dec 2024 03:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gLqM+lqP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A72451CC;
	Wed, 11 Dec 2024 03:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733889422; cv=none; b=RMB4VC1D4ERCnLNMcHdsznhjlM2PiCd93bo+o+9XrN/eimgzIV9jg0p7nOqqlxWSYgk7yge0F+vDmG/aCR1Q9UnkvwlsGn/suj8XJSCofDcnk+ncDa4gUSJPZdW3YCBY3WZDd+0qyaHcn1Cfwyz8mCIqAcFcO+IgRfqnA7cbC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733889422; c=relaxed/simple;
	bh=3AlhQZkRXKO/RCJl/pWPDYap996INco2i4JazZXp0h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PP8TbxeEwfevzmwtnbbCZr8FdAyBmN/+5EkVskA3+71FxrROvtXmp1gn0otwtFnUb6lL52JzNPsVDR6UW+Jh2UDJvadFWGELn1AsxNi/V4cZ8Msz4sQ6tqVQgzN4StgHoksy6pMSk80xmLvsIC/DIQpe4UTmwWPcYjlJJ9Al2VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gLqM+lqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BALIw89018563;
	Wed, 11 Dec 2024 03:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsonQYLjKLE9nrH7N4snGlC5yXO0RiS7svj5S7B7UJw=; b=gLqM+lqPKg+GrNl0
	q/nDtSVkl8wgP/JxLDDdmlUMVdgG//P2XwOlwUg4DRST+GzYIEjAQIvlp/ft9X0c
	mX/nboBmQdD2N4guinsKthPIIJR1m+AW5vC3Ci97MRbtmzLIh370MsjTECQ0JRag
	2GT0Se7Ztpbj4ferhHvA/8Nja/M6gA/7F7MGnS3cYyZBkc1YTO4fqaBzI0y8JofK
	E5GSL0nmPTLhKuHKlyKCz1sEe831Z5bKiLSMuk5fDaA5Y5Q0AI8JtnJBUcgG0NYz
	6AGcgu4sLdI3Y4w59asv5aNHqKZfOoXF0rNYimWmJ94/cRXu81o4N142VeJS9T7y
	ASvEVw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak3c5sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 03:56:58 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB3uv8m030650
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 03:56:57 GMT
Received: from [10.50.34.16] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 19:56:56 -0800
Message-ID: <50ebc5f1-967a-4aa7-a4c3-3304961d1f8b@quicinc.com>
Date: Wed, 11 Dec 2024 09:26:53 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Simplify error handling in probe
 function
To: Andi Shyti <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <20241210231054.2844202-1-andi.shyti@kernel.org>
 <20241210231054.2844202-3-andi.shyti@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20241210231054.2844202-3-andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5riXyfls0kxv72Z7fliai4wCxpSHhOtt
X-Proofpoint-GUID: 5riXyfls0kxv72Z7fliai4wCxpSHhOtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110027

Thanks Andi for this change !

On 12/11/2024 4:40 AM, Andi Shyti wrote:
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
>   drivers/i2c/busses/i2c-qcom-geni.c | 30 ++++++++++++++++--------------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 01db24188e29..3fc85595a4aa 100644
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
Suggestive comment, can we make this second patch as first patch ? So 
that we can have both above lines reduced in this patch.
> +		goto err_off;
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
> +			goto err_off;
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
> +			goto err_off;
>   		}
>   
>   		gi2c->tx_wm = tx_depth - 1;
> @@ -944,8 +938,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   
>   	return 0;
return ret here ? yes, we need to initialize ret = 0.
>   
> +err_off:
can we rename as err_resources ?
> +	geni_se_resources_off(&gi2c->se);
> +err_clk:
> +	clk_disable_unprepare(gi2c->core_clk);
> +
> +	return ret;
> +
>   err_dma:
>   	release_gpi_dma(gi2c);
> +
>   	return ret;
>   }
>   


