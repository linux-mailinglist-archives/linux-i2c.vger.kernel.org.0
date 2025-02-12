Return-Path: <linux-i2c+bounces-9386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2799A3296D
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BBA8164D49
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 15:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6DB211261;
	Wed, 12 Feb 2025 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KXqmeDS6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59CE18D65E;
	Wed, 12 Feb 2025 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739372619; cv=none; b=R7m64SF1TtfZt0T41jn1WH2+DZP9SRyblAzhblzIhpQaduuFjVlhAHJonpDrDRw8toJAOvsvhVsZ0cMCk2QRBp6vB/vP4kQz7f0nibGlzVO/1+VU9dmA+7hDcEe/YRLW92uV67QlEsiahQ5/0k5XX0ynInOfBxp4WEKVNGhtLWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739372619; c=relaxed/simple;
	bh=uGlxWXu4RJgSy6EuoRoeQc0/5ctKP8l09mk7cTTaNb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t4CisLj1d5vHjOdLJn/EgNAQsowTzNSBwrXmC0oKS1Ddz3cgAAUpIa7iVAY2wmJuMakiqJiSCT2PKi0nuuEUF8jVxorovzYGxZ8A7zUrbusJKVEKOaEPesrTEzKX5fm/vp5iFc95nyJbs0MkixN7vDgJVjJ2T8J61gE0eganB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KXqmeDS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C8K9XW008940;
	Wed, 12 Feb 2025 15:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljoXpAy3M6Qnlqaz7Y6PH0m4AKGvTA7X2/WJwi0CM9s=; b=KXqmeDS63z4LWOoT
	b4skeaUbPKL1H5pmYiHQ7QJS52FibQGIG7Qfn662XU3JIQ2tTeOepUNHEuiaY6vk
	o6lauPwDIauoZ2I4PLD9eI2AcnzDtd8qEd3zvFCoVB1D7ONs4L8ojQ1ZrJV2zg+/
	0IU8ETMjHRXl+lzAwxF15mYmOu8EMH0pU+8JWZNQr3R2Risw1zXrOBlx/rLMw+FD
	CHbcTI9jGw3N4VBHck39dNf7eIAjzmXk3rxCAEZDMH4uBxqLqhRVsSDRRWHt1Y2X
	j1xMP/Mc3N5/s3baSntfh4mn2rUCxW4T2GWWNnKpr+w0fStnu9q/0Ev/yksP6aEA
	Sf7uWA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qs1rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 15:03:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CF3Tci031119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 15:03:29 GMT
Received: from [10.216.10.30] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 07:03:24 -0800
Message-ID: <877d421f-18f8-461e-9b5e-e0e02ec3cbf0@quicinc.com>
Date: Wed, 12 Feb 2025 20:33:20 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
        Vinod Koul
	<vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
References: <20250212120536.28879-1-quic_jseerapu@quicinc.com>
 <20250212120536.28879-2-quic_jseerapu@quicinc.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250212120536.28879-2-quic_jseerapu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lBhoDt0lBR6hg9D3iKhswVE2QiPlzVlx
X-Proofpoint-ORIG-GUID: lBhoDt0lBR6hg9D3iKhswVE2QiPlzVlx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120114



On 2/12/2025 5:35 PM, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> When using BEI, consider splitting a single multi-message transfer into
> chunks of 8 messages internally and so interrupts are not expected for
> the first 7 message completions, only the last message triggers
> an interrupt, indicating the completion of 8 messages.
> 
> This BEI mechanism enhances overall transfer efficiency.
> 
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v4 -> v5:
>     -  BEI flag naming changed from flags to bei_flag.
>     -  QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
>        file, and Block event interrupt support is checked with bei_flag.
> 
> v3 -> v4:
>    - API's added for Block event interrupt with multi descriptor support for
>      I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>    - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>      I2C driver.
> 
> v2-> v3:
>     - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>     - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>     - Added documentation for newly added changes in "qcom-gpi-dma.h" file
>     - Updated commit description.
> 
> v1 -> v2:
>     - Changed dma_addr type from array of pointers to array.
>     - To support BEI functionality with the TRE size of 64 defined in GPI driver,
>       updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
> 
>   drivers/dma/qcom/gpi.c           | 3 +++
>   include/linux/dma/qcom-gpi-dma.h | 2 ++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 52a7c8f2498f..d925a8156317 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1693,6 +1693,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   
>   		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> +
> +		if (i2c->bei_flag)
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>   	}
>   
>   	for (i = 0; i < tre_idx; i++)
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..1060b7eac305 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -65,6 +65,7 @@ enum i2c_op {
>    * @rx_len: receive length for buffer
>    * @op: i2c cmd
>    * @muli-msg: is part of multi i2c r-w msgs
> + * @bei_flag: true for block event interrupt support
>    */
>   struct gpi_i2c_config {
>   	u8 set_config;
> @@ -78,6 +79,7 @@ struct gpi_i2c_config {
>   	u32 rx_len;
>   	enum i2c_op op;
>   	bool multi_msg;
> +	bool bei_flag;
>   };
>   
>   #endif /* QCOM_GPI_DMA_H */


