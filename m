Return-Path: <linux-i2c+bounces-7957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F60A9C783D
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E805A288640
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D68A16DEB4;
	Wed, 13 Nov 2024 16:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FGJv8xkA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897AD1667DA;
	Wed, 13 Nov 2024 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514024; cv=none; b=Kld5S0iY6bRN9eA9qFaRtMlVkn1jCY9wE9rCeyYeIGOkgRPrxMADh5bGiPBqSNDe3ZPlFuCAYywnd4jSUGsqKU6G7ZXa1kWGp1TZE/s5fQmEisRRviFc21KNooj9Y59YP0VjAUAPhFcf0uLjfZmmcBNi85nBNdCJX3j7ZgpkUhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514024; c=relaxed/simple;
	bh=LyoCifBttw0Uzr7kNf/5BfdC2NH8H/5PVSus4OnAKU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XrRRUFlu2e/lbGjqJy5cjA3fLMWRXsIIuGsgGxr4mQ8sZ4V9hKj0oni+7DjHwi+7edI7qPSMMSoCKSEq5HC79/y1CW6tybfTAKAE93qLjP/6GxUHqE0KAHSnYH8qZiw3PV0+vXzyKS4DZsBNKnjqY3G+jtpDJsHcpeKqq6Pg8Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FGJv8xkA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD9mI51029029;
	Wed, 13 Nov 2024 16:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iUQP1y+u2PuZM3tsDi5lkHL9jojnzS58gaWmx2RMRos=; b=FGJv8xkAQ3RqiVpb
	aVYAPY+hmcY//jDKuSUpShAZFsf7G04UpEM3ghXVjLIAz2isRLS8m39Fbe1JeFsa
	IoVXehDAzlW4yfFXTSFZTrPM/ccNqTwef049Y//g7+cSvgJhH4DZfyl7WQDGvIUs
	qdzJzGSo24XpETb3dCfYoSfTacHUxnNlxwHzAEiHWvcZAxkUhjZRd/bj2G1NbLPo
	O8Q2MmNj7e7B2IV0PdXP1n2QGqYUy909vGKPoTtnnbhlXBC0fMf2hTO9xzc9Wq+m
	TTq3H/CP0Oc6KHb5XhirpKDxgoZ6IQ3VNMIOCdq9llIpdt5m2398oauCXASoKAxX
	3xjUEw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vgqqtcc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:06:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADG6sNo010160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:06:54 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 08:06:49 -0800
Message-ID: <ddf48f55-7b9a-4dbd-97f4-6f165d2c12af@quicinc.com>
Date: Wed, 13 Nov 2024 21:36:46 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dma: gpi: Add Lock and Unlock TRE support to
 access SE exclusively
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-3-quic_msavaliy@quicinc.com>
 <8fb9af47-b675-4fbf-bf66-5a273dd20261@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <8fb9af47-b675-4fbf-bf66-5a273dd20261@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0YUnHO-q9s5QEIq9JdV31oebvyzcofOj
X-Proofpoint-GUID: 0YUnHO-q9s5QEIq9JdV31oebvyzcofOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130135

Thanks Konrad for the review !

On 10/26/2024 12:18 AM, Konrad Dybcio wrote:
> On 27.09.2024 8:31 AM, Mukesh Kumar Savaliya wrote:
>> GSI DMA provides specific TREs namely Lock and Unlock TRE, which
>> provides mutual exclusive access to SE from any of the subsystem
>> (E.g. Apps, TZ, ADSP etc). Lock prevents other subsystems from
>> concurrently performing DMA transfers and avoids disturbance to
>> data path. Basically for shared SE usecase, lock the SE for
>> particular subsystem, complete the transfer, unlock the SE.
>>
>> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
>> TRE for the last transfer.
>>
>> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
>>
>> TRE = Transfer Ring Element, refers to the queued descriptor.
>> SE = Serial Engine
>> SS = Subsystems (Apps processor, TZ, ADSP, Modem)
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   drivers/dma/qcom/gpi.c           | 37 +++++++++++++++++++++++++++++++-
>>   include/linux/dma/qcom-gpi-dma.h |  6 ++++++
>>   2 files changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index 52a7c8f2498f..120d91234442 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -2,6 +2,7 @@
>>   /*
>>    * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>>    * Copyright (c) 2020, Linaro Limited
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include <dt-bindings/dma/qcom-gpi.h>
>> @@ -65,6 +66,14 @@
>>   /* DMA TRE */
>>   #define TRE_DMA_LEN		GENMASK(23, 0)
>>   
>> +/* Lock TRE */
>> +#define TRE_I2C_LOCK		BIT(0)
>> +#define TRE_MINOR_TYPE		GENMASK(19, 16)
>> +#define TRE_MAJOR_TYPE		GENMASK(23, 20)
> 
> Is this solely I2C specific?
> 
No, its generic. So i guess i should rename to TRE_LOCK only, we can use 
for other protocols in future. Thanks!
> Konrad

