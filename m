Return-Path: <linux-i2c+bounces-10032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9E7A71502
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 11:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB198174571
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 10:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4956C1C6FF5;
	Wed, 26 Mar 2025 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ooW5VAdK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9633A19F495;
	Wed, 26 Mar 2025 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742985539; cv=none; b=AF9O9L91Qwf3kG+SZAuWOZ3TUR441aGM075wChRGD6yVHjTzbRIaVEJi1YmlCPfPNztsOmvSsBbu6A+jOvdQwZ5xiPc/PF/MeDxDIysxdjckgQykjB275ljjVgvfC+W1D+uB04e3ASC6PE8EnEezYUS9j909NfbSDCDZChm3Sig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742985539; c=relaxed/simple;
	bh=4sjlpSeiW8BPZ2gloRcNiH1clVDJW6TOW9ZqzX8nOt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DuPkkQN0IMUiUQKdDeyo7uQODcD8azozwQr4puQZOO3e59sKAK1e202HuxWVJaQQy7N2cdq1Zb1boX6jEK9NIjc+SgtEm7ICZ6NHeuwcGH1/rrQAWGCNevUcBU4sIbfZCbt+gpjd6yPJBeSlf8ui4QJMKE9Z7X6vM1F7T+d+rtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ooW5VAdK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73JO7004322;
	Wed, 26 Mar 2025 10:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	misQHeiBbzOmvCNgf8vEmI8bJoYtUzpNmKjPdcGR5bk=; b=ooW5VAdKOLtb2zWR
	zx1t/zcU5VKWUS6nN+re/MF0n8rqEoc06bHAeax9ZRF4u0gaOaIstVp1SO8LT3yJ
	iX1BSP/EVQHEXigXz+c9O16hx4q6Wzm9i9rCFs5qTShMEBaWngq9PAHZfiMZFf2X
	PeLBZp83+GZCJDSdWCbY4EySS/QKfBtuC/czA97R1riHvqHy4r1myhH1o18g08Mp
	/gsbktxtesDP1uagx6Bo/OKP/q9v7ttQ55x0WT4JCW02khKTPobww/haLD3RRiiO
	48pDO1oJlLjY/rXFebjMJlq9b5zAdb+puyyDibTxZfPpegT7lejCMEe3xFufGmHX
	ttQHnQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcycq6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 10:38:35 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52QAcZHP031580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 10:38:35 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Mar
 2025 03:38:31 -0700
Message-ID: <823ab604-ac59-4b85-8bca-81e8b4c5c63d@quicinc.com>
Date: Wed, 26 Mar 2025 16:08:28 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: imx: add some dev_err_probe calls
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
        Oleksij Rempel
	<o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha
 Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
CC: <linux-i2c@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250326084937.3932383-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250326084937.3932383-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e3d92b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=8f9FM25-AAAA:8 a=T3eNeIW6sh54MCHzbYgA:9 a=QEXdDO2ut3YA:10
 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-ORIG-GUID: fBVMLbZVYV5bXMaBHbqWx3iBszV8Mp-n
X-Proofpoint-GUID: fBVMLbZVYV5bXMaBHbqWx3iBszV8Mp-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260064



On 3/26/2025 2:19 PM, Alexander Stein wrote:
> Especially DMA channels might not be available. Add some deferred probe
> messages accordingly.
> 
Anything specific instead of some deferred probe messages ?  Would be 
good to mention problem like During probe if DMA channels not available, 
replace regular error messages by deferred probe messages ?
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   drivers/i2c/busses/i2c-imx.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 9e5d454d8318e..e6e09d5a2bbd4 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1711,11 +1711,13 @@ static int i2c_imx_probe(struct platform_device *pdev)
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
> -		return irq;
> +		return dev_err_probe(&pdev->dev, irq,
> +				     "can't get IRQ\n");
Can fit into single line ?
>   
>   	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +		return dev_err_probe(&pdev->dev, PTR_ERR(base),
> +				     "can't get IO memory\n");
same here if possible.
>   
>   	phy_addr = (dma_addr_t)res->start;
>   	i2c_imx = devm_kzalloc(&pdev->dev, sizeof(*i2c_imx), GFP_KERNEL);
> @@ -1810,13 +1812,15 @@ static int i2c_imx_probe(struct platform_device *pdev)
>   	 */
>   	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
>   	if (ret) {
> -		if (ret == -EPROBE_DEFER)
> +		if (ret == -EPROBE_DEFER) {
> +			dev_err_probe(&pdev->dev, ret, "can't get DMA channels\n");
>   			goto clk_notifier_unregister;
> -		else if (ret == -ENODEV)
> +		} else if (ret == -ENODEV) {
>   			dev_dbg(&pdev->dev, "Only use PIO mode\n");
> -		else
> +		} else {
>   			dev_warn(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
>   				 ERR_PTR(ret));
> +		}
>   	}
>   
>   	/* Add I2C adapter */


