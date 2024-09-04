Return-Path: <linux-i2c+bounces-6209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E0D96C64D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 20:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34D3B1F260A4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 18:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76701E1A0F;
	Wed,  4 Sep 2024 18:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HZ2JQeXt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C825A12BEBB;
	Wed,  4 Sep 2024 18:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725474238; cv=none; b=m220q0IpEc004YOWzXBlPUt2X/bQQxnmPV9yM9cahyemw+sLCtZ/DsP67FUPbuOdwkeVc/74tst36HUM/hUD9Kwe68Z/1cHkTO2XX+LIEZio3W4Oo+2I+NoJM0LGYNGn/b+azTU4IclrtfPkQhb+dS9CrjClfWU1wwnP1l1qq4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725474238; c=relaxed/simple;
	bh=svGc0NFdFcVJXX9aL9K9y/dt0XTWzy6A0Y7rfAqu1CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZZO+Du1wraDikbs3nB4dMj5VRRU0OhKvA/NZ+JqvPT1NbZXc3fGlPwgTS+58lkxhXS4/T62QhWkIhFBRCEL9VaWNz4bcwAh+SGMrL2fr+rpU2YAz0DZLcU5W/+Cwo8uGiDBSNNLBacnX+ZJ16+IUKet0vLj88sDA9d1zNiZaB20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HZ2JQeXt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484EGRqe010436;
	Wed, 4 Sep 2024 18:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbRMDnPTtu2T2sQ9GYY825EQC76vitSzmBsOk9f3G58=; b=HZ2JQeXtvN0tHLxn
	C08su80js8DuhWNSLJ7Rc6Sv8UNjaAM9+gLLnB2zVr92Ehk3Pp6gGqEa74+OmKhw
	27wGM+iIVBiNwkGGovJ0mQDs19iN4FqK53hKwhrCQj3Zgroeg8OhRQnECL7aZCt4
	8gQkoNzCH/bfBHdx+WIwSmQQXImDNNvHicpQonv7HeuyQO2fPZ7+QhQeuff77zFI
	0hkDtTgZBhc7ylAnTvcIenKyXDM6jrOqtjwnH0NdE9kgAYIgObCtvG3iQCs7jGg/
	PZgLVK083hTz6I5X4oTRDTa0KkX0FtptRlsRNBpffYP0nIfTkFc/bt75o3FftGPA
	kT95Og==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrj45k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 18:23:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484INqTv009548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 18:23:52 GMT
Received: from [10.216.2.237] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 11:23:49 -0700
Message-ID: <523acc68-2e85-4e33-b87f-8400411ac00b@quicinc.com>
Date: Wed, 4 Sep 2024 23:53:45 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] dma: gpi: Add Lock and Unlock TRE support to
 access SE exclusively
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <20240829092418.2863659-3-quic_msavaliy@quicinc.com>
 <0712caf4-568f-4c7c-b319-ccdbba37142a@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <0712caf4-568f-4c7c-b319-ccdbba37142a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wkyLMmrLeItekqGCmiELtRq4uVhtUgPB
X-Proofpoint-ORIG-GUID: wkyLMmrLeItekqGCmiELtRq4uVhtUgPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_16,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040138



On 8/29/2024 3:35 PM, Bryan O'Donoghue wrote:
> On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
>> GSI DMA provides specific TREs namely Lock and Unlock TRE, which
>> provides mutual exclusive access to SE from any of the subsystem
>> (E.g. Apps, TZ, ADSP etc). Lock prevents other subsystems from
>> concurrently performing DMA transfers and avoids disturbance to
>> data path. Basically lock the SE for particular subsystem, complete
>> the transfer, unlock the SE.
>>
>> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
>> TRE for the last transfer.
>>
>> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   drivers/dma/qcom/gpi.c           | 37 +++++++++++++++++++++++++++++++-
>>   include/linux/dma/qcom-gpi-dma.h |  6 ++++++
>>   2 files changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index e6ebd688d746..ba11b2641ab6 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -2,6 +2,7 @@
>>   /*
>>    * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>>    * Copyright (c) 2020, Linaro Limited
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>    */
>>   #include <dt-bindings/dma/qcom-gpi.h>
>> @@ -65,6 +66,14 @@
>>   /* DMA TRE */
>>   #define TRE_DMA_LEN        GENMASK(23, 0)
>> +/* Lock TRE */
>> +#define TRE_I2C_LOCK        BIT(0)
>> +#define TRE_MINOR_TYPE        GENMASK(19, 16)
>> +#define TRE_MAJOR_TYPE        GENMASK(23, 20)
>> +
>> +/* Unlock TRE */
>> +#define TRE_I2C_UNLOCK        BIT(8)
>> +
>>   /* Register offsets from gpi-top */
>>   #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)    (0x20000 + (0x4000 * (n)) 
>> + (0x80 * (k)))
>>   #define GPII_n_CH_k_CNTXT_0_EL_SIZE    GENMASK(31, 24)
>> @@ -516,7 +525,7 @@ struct gpii {
>>       bool ieob_set;
>>   };
>> -#define MAX_TRE 3
>> +#define MAX_TRE 5
>>   struct gpi_desc {
>>       struct virt_dma_desc vd;
>> @@ -1637,6 +1646,19 @@ static int gpi_create_i2c_tre(struct gchan 
>> *chan, struct gpi_desc *desc,
>>       struct gpi_tre *tre;
>>       unsigned int i;
>> +    /* create lock tre for first tranfser */
>> +    if (i2c->shared_se && i2c->first_msg) {
>> +        tre = &desc->tre[tre_idx];
>> +        tre_idx++;
>> +
>> +        tre->dword[0] = 0;
>> +        tre->dword[1] = 0;
>> +        tre->dword[2] = 0;
>> +        tre->dword[3] = u32_encode_bits(1, TRE_I2C_LOCK);
>> +        tre->dword[3] |= u32_encode_bits(0, TRE_MINOR_TYPE);
>> +        tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
>> +    }
>> +
>>       /* first create config tre if applicable */
>>       if (i2c->set_config) {
>>           tre = &desc->tre[tre_idx];
>> @@ -1695,6 +1717,19 @@ static int gpi_create_i2c_tre(struct gchan 
>> *chan, struct gpi_desc *desc,
>>           tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>>       }
>> +    /* Unlock tre for last transfer */
>> +    if (i2c->shared_se && i2c->last_msg && i2c->op != I2C_READ) {
>> +        tre = &desc->tre[tre_idx];
>> +        tre_idx++;
>> +
>> +        tre->dword[0] = 0;
>> +        tre->dword[1] = 0;
>> +        tre->dword[2] = 0;
>> +        tre->dword[3] = u32_encode_bits(1, TRE_I2C_UNLOCK);
>> +        tre->dword[3] |= u32_encode_bits(1, TRE_MINOR_TYPE);
>> +        tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
>> +    }
>> +
> 
> What happens if the first transfer succeeds => bus lock but the last 
> transfer fails => !unlock ?
> 
> Is the SE left in a locked state ?
> 
Here, it's GSI running the transfer descriptors and if it fails, we do 
dmaengine_terminate_sync() at i2c client side. It clears the descriptors 
and unmaps the buffer. SE remains in unlocked like initial state.
> ---
> bod

