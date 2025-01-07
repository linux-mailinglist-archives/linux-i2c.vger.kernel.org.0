Return-Path: <linux-i2c+bounces-8937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98590A0376D
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 06:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3F413A3954
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 05:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4816E190685;
	Tue,  7 Jan 2025 05:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kBkF9knI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEF178F49;
	Tue,  7 Jan 2025 05:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736228504; cv=none; b=BkXqFFBkRFjQwayDF2O9cq7N9j3Uex9b3zNdUStvsNAawbVLGLksCakirF8b/wi38Gum1HOExd6+OsWAk8fxxwIwkP+Mow0GoQjY2NfuKn1TBnfxlqjIsFJgPJ1HLIAb6xOZjr5fjn/SixAAckllMJKDvgDSBld2d1GRaYSP++Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736228504; c=relaxed/simple;
	bh=y5oswktjjXoDXa7lwo4GPhLx46yLdPeU+dMMFlvJtBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cEZ34ZbABBOxmqRrMMqklr2C8l5+qO6DVYv6akcYA507sojt/NWKLHoDN7qRvX8sPOl7RcZMHHPemstCBmeALax4990hu9tkhzJa5DyFSa6Q6ofrdsRKVlAf4QQg17iymQO34vFeTae4FWS5CaRZOSmhcMlvBU+jv9LATRo5RIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kBkF9knI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507401U0012848;
	Tue, 7 Jan 2025 05:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jp//zljxmkJUPS4LMLP6QOwLXDUS8c7lU7NPn4T4Dj4=; b=kBkF9knISj/D7YKZ
	BiO0wb4XwHh0k4uMlwq1+5EoA6ZRshOl/GG3mei6LL7zKuofqcHHtA27vwfjtpHQ
	cauyH7ymXQb+z80YzqX8JVmudFSJSMOkYENM9r4fFGFWmPT7Nkugjgv25TmT00nZ
	N2g6+M5q6WOPN0Zsn/UKCHwCcSqJJBHrr4vafUu6DLVtWUvrkBpRIvXx23Bmo/6K
	8D6bBaK86eDUq++NkUxHHCg95IRT0NmVDaguPDM3SIEsXJVyVfNP9zwtEP9sOHrq
	OVNlnZ0+RabBj13z56cEQDm5pSYn3D63L6XOfdElk/Jvd79xBsRYtU3xXgQboGDp
	ABLLkQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440vutg5hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 05:41:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5075fIFC005999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 05:41:18 GMT
Received: from [10.216.26.158] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 21:41:14 -0800
Message-ID: <13c5b4d2-8fab-4ad2-98b7-1f71584509a6@quicinc.com>
Date: Tue, 7 Jan 2025 11:11:10 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dmaengine: qcom: gpi: Add GPI Block event
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
References: <20241217170424.14703-1-quic_jseerapu@quicinc.com>
 <20241217170424.14703-2-quic_jseerapu@quicinc.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20241217170424.14703-2-quic_jseerapu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rh3e6RNNzMKXbrrMJ_RYUmr6lQKmyoEM
X-Proofpoint-ORIG-GUID: rh3e6RNNzMKXbrrMJ_RYUmr6lQKmyoEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070044



On 12/17/2024 10:34 PM, Jyothi Kumar Seerapu wrote:
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
> chunks of 8 internally. Interrupts are not expected for the first 7 message
chunks of 8 internally. This seems half statement to me. Something is 
missing to complete the statement.
> completions, only the last message triggers an interrupt,indicating
,indicating
here give space before.
> the completion of 8 messages.
> 
> This BEI mechanism enhances overall transfer efficiency.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
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
>   include/linux/dma/qcom-gpi-dma.h | 9 +++++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 52a7c8f2498f..74eabcd1416d 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1693,6 +1693,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   
>   		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> +
> +		if (i2c->flags & QCOM_GPI_BLOCK_EVENT_IRQ)
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>   	}
>   
>   	for (i = 0; i < tre_idx; i++)
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..d818c6a955e2 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -15,6 +15,13 @@ enum spi_transfer_cmd {
>   	SPI_DUPLEX,
>   };
>   
> +/**
> + * define QCOM_GPI_BLOCK_EVENT_IRQ - Block event interrupt support
> + *
> + * This is used to enable/disable the Block event interrupt mechanism.
> + */
> +#define QCOM_GPI_BLOCK_EVENT_IRQ	BIT(0)
> +
>   /**
>    * struct gpi_spi_config - spi config for peripheral
>    *
> @@ -65,6 +72,7 @@ enum i2c_op {
>    * @rx_len: receive length for buffer
>    * @op: i2c cmd
>    * @muli-msg: is part of multi i2c r-w msgs
> + * @flags: true for block event interrupt support
>    */
>   struct gpi_i2c_config {
>   	u8 set_config;
> @@ -78,6 +86,7 @@ struct gpi_i2c_config {
>   	u32 rx_len;
>   	enum i2c_op op;
>   	bool multi_msg;
> +	bool flags;
can we better singular name instead of general name ?
something like bei_flag ? OR block_int_flag ?

>   };
>   
>   #endif /* QCOM_GPI_DMA_H */


