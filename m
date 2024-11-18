Return-Path: <linux-i2c+bounces-8014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE51E9D090A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 06:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00983B22BCC
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 05:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D2513E043;
	Mon, 18 Nov 2024 05:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ni76dJ/G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1612126BF5;
	Mon, 18 Nov 2024 05:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731908784; cv=none; b=V50WvSRvy4HIidfgy4KiiP/cu0FsyAilaOaOJ7pBedVQ6d9HY6B88Cbl3Zt1oI67siQ1bKwGqLfwYsJeYXO7sGc3gIWxdDIJY6DA7DEDMJtbChyEaEw/ZGWOY+K9Ox7Q0p54Yik1stM7WA8mRPHmVI2KxA7faZXuaFhe0Z6loUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731908784; c=relaxed/simple;
	bh=93Nb6r7t6AIN0MXxsslj2L7H+yq3vjWywpI3M1cqALU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WMr8zOKSU6SLsXvU8AGYHyo58tZ3uzt0BTnw9d+62Krw4CAShVxQBAzRZXPnAPUuLPBkuQ/HhxN0EAc3jNgaD/IxY3skRCtF9gluXKTtdA9i6SCaUQhXbUSmHvJFklHhHxsZHmCTfzSAfHzKH1tigXcbous7EVqV36D61dAeQ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ni76dJ/G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5RmCd029042;
	Mon, 18 Nov 2024 05:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOGrpjWMlH/TbNBbr4mUxA777nPQXKTSf24nXmae8hs=; b=Ni76dJ/GbMQbeV7j
	qRYQap0wVB1mPkdPoY7IbeyFZS8eyoNLGRszcJu9EE4lc0EWsopGha0rCHghVLJW
	zhXylDrw4hg2/WxzzxEhKZeHRBJg/gO4HcmeLq/1PEHJdEAcZJic4vpP1AE1Hask
	RIXv3kFVggkgAtsOl6x3vhjBPbJc76ku+lR1cN8MfnqAkatwI06aZsEq07XjrfMU
	yKcYYePVWq+NwLjE9HsEh8eWuNuX7IaD5hHPLnkreqmVBVuxh+VCeSewcyl86qIt
	lh07dG68NaC2E2dhPVQjMC2A8ql9accOMyUT/C7eIFIDDUbzHDOh1HKGFpHyIjh9
	3tvweQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkv9uhq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 05:46:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI5kC2c031641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 05:46:12 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 17 Nov
 2024 21:46:07 -0800
Message-ID: <5a39b6d0-600f-455f-9ba7-29787f9085ce@quicinc.com>
Date: Mon, 18 Nov 2024 11:16:07 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dmaengine: gpi: Add Lock and Unlock TRE support to
 access I2C exclusively
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
 <20241113161413.3821858-3-quic_msavaliy@quicinc.com>
 <87cc1f1e-85d2-40cb-b3b3-8935004f4f98@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <87cc1f1e-85d2-40cb-b3b3-8935004f4f98@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YGVu8ialxrtGNZHVR4ZDdas37iNRCKPn
X-Proofpoint-ORIG-GUID: YGVu8ialxrtGNZHVR4ZDdas37iNRCKPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180049

Thanks Konrad for the review !

On 11/16/2024 12:53 AM, Konrad Dybcio wrote:
> On 13.11.2024 5:14 PM, Mukesh Kumar Savaliya wrote:
>> GSI DMA provides specific TREs(Transfer ring element) namely Lock and
>> Unlock TRE. It provides mutually exclusive access to I2C controller from
>> any of the processor(Apps,ADSP). Lock prevents other subsystems from
>> concurrently performing DMA transfers and avoids disturbance to data path.
>> Basically for shared I2C usecase, lock the SE(Serial Engine) for one of
>> the processor, complete the transfer, unlock the SE.
>>
>> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
>> TRE for the last transfer.
>>
>> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   drivers/dma/qcom/gpi.c           | 37 +++++++++++++++++++++++++++++++-
>>   include/linux/dma/qcom-gpi-dma.h |  6 ++++++
>>   2 files changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index 52a7c8f2498f..c9e71c576680 100644
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
>> +#define TRE_LOCK		BIT(0)
>> +#define TRE_MINOR_TYPE		GENMASK(19, 16)
>> +#define TRE_MAJOR_TYPE		GENMASK(23, 20)
>> +
>> +/* Unlock TRE */
>> +#define TRE_I2C_UNLOCK		BIT(8)
> 
> So the lock is generic.. I'd then expect the unlock to be generic, too?
Absolutely, renamed it for generic as TRE_UNLOCK.
> 
>> +
>>   /* Register offsets from gpi-top */
>>   #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
>>   #define GPII_n_CH_k_CNTXT_0_EL_SIZE	GENMASK(31, 24)
>> @@ -516,7 +525,7 @@ struct gpii {
>>   	bool ieob_set;
>>   };
>>   
>> -#define MAX_TRE 3
>> +#define MAX_TRE 5
>>   
>>   struct gpi_desc {
>>   	struct virt_dma_desc vd;
>> @@ -1637,6 +1646,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>>   	struct gpi_tre *tre;
>>   	unsigned int i;
>>   
>> +	/* create lock tre for first tranfser */
>> +	if (i2c->shared_se && i2c->first_msg) {
> 
> Does the first/last logic handle errors well? i.e. what if we
> have >= 3 transfers and:
> 
> 1) the first transfer succeeds but the last doesn't
> 2) the first transfer succeeds, the second one doesn't and the lock
>     is submitted again
> 3) the unlock never suceeds
> 
geni_i2c_gpi_xfer() takes care of any of the error. Upon error, it does 
dma_engine_terminate_sync() which resets all the pipes. Internal 
downstream also has same implementation.
> Konrad

