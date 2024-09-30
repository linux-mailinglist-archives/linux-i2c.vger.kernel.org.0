Return-Path: <linux-i2c+bounces-7099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7098A789
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 16:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBD4F1C22C1E
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 14:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1454C1922CC;
	Mon, 30 Sep 2024 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d14X/7Xp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3417B2032A;
	Mon, 30 Sep 2024 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707537; cv=none; b=A3ajj6E1M147YkC/5Gq2BwRD/eifbZOgwi9KmvfxktgJbDoFrJYiPaVeXVVSlz6AIEiSV364QWkBZM/MrF/aKeoljohO+CvYTreXc7gCXEQFVd68anrN11yoiDsm4og2dxkZ74FDXfHRk4RTHd7K3owE+M+YT+zCAEHeFKfVWZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707537; c=relaxed/simple;
	bh=3HetSWB8pauIgHnpbc+Jan/OHiAVA1t62OSsi/uUbGY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Qi9hJjPkcvdtrinbWgcobNsNFAWiJXodAnwewbWD/+sQDYeAQ3KKtzrmZ70z+GrJJf3hRYmr6W9eCpT1LC0r5DmHj9KRKd1/7faRTNxhDyTofGvARx3KRIY5ntfOOov9/e1yZPaYtV0AWfHyuMiOG/skyOoDl5eJ1nofp4QQ+lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d14X/7Xp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48U6RwRZ014784;
	Mon, 30 Sep 2024 14:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSQC+/onyBzDMrxeEgdTEe7kX3EdK1p7LxLmFcRXzx0=; b=d14X/7XpXp4WxhcQ
	PcFCmvG1+VHoUhEyH08tHdwj5VwkiE/XNKfaHzRXaGNy4jj8kCFomdwSYxXvLfRR
	odX4oFSoMOcP5SZBssmC3EKRnnkPOUxmy+dA48e7tf2XGOH2Dzk/UhLyjfwmJR5V
	65JwDqL3lqG1hMrgr+jMX4sX++7sUM/Y42GazC2LkpnX02+pFxyFxh/FvUCcHqA5
	6z2q1Q67xfkhTWbfA8roK/fQ0hWv0hJ8piOiJidVoEt4cOIjNySZYeI+Ji8DWK39
	ng7J3mQV/PZimJPTSBgekt3eEdzBDIC41GuO+Fguo0huyB2hnhRsfNMcaf3mJkvb
	a+s/Ag==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41yprah8fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 14:45:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48UEjVUI025992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 14:45:31 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 07:45:28 -0700
Message-ID: <0e38cd39-ba91-48f8-a4ee-c90bf95acdfe@quicinc.com>
Date: Mon, 30 Sep 2024 20:15:24 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
 <def1c338-8e41-4622-83d5-7a377d780d76@linaro.org>
 <2de5f3e7-1fd6-4368-94bc-4eecc8fc6752@quicinc.com>
Content-Language: en-US
In-Reply-To: <2de5f3e7-1fd6-4368-94bc-4eecc8fc6752@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NqkfyRA8fxHIJ_Gw0wCPyI82Bhw_ngIA
X-Proofpoint-ORIG-GUID: NqkfyRA8fxHIJ_Gw0wCPyI82Bhw_ngIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300107



On 9/29/2024 12:06 PM, Manikanta Mylavarapu wrote:
> 
> 
> On 9/26/2024 3:58 PM, Vladimir Zapolskiy wrote:
>> Hello Manikanta.
>>
>> On 9/26/24 06:43, Manikanta Mylavarapu wrote:
>>> In existing socs, I2C serial engine is sourced from XO (19.2MHz).
>>> Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).
>>>
>>> The existing map table is based on 19.2MHz. This patch incorporate
>>> the clock map table to derive the SCL clock from the 32MHz source
>>> clock frequency.
>>>
>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>> ---
>>> Changes in v2:
>>>     - Dropped IPQ5424 from the commit title
>>>     - Added else part to assign geni_i2c_clk_map_19p2mhz to itr
>>>     - Dropped MHZ macro and used HZ_PER_MHZ macro
>>>     - Expanded SE to serial engine
>>>     - Added the reason for 32MHz clock in commit message
>>>
>>>   drivers/i2c/busses/i2c-qcom-geni.c | 19 ++++++++++++++++---
>>>   1 file changed, 16 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>>> index 212336f724a6..22f2a0d83641 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -16,6 +16,7 @@
>>>   #include <linux/pm_runtime.h>
>>>   #include <linux/soc/qcom/geni-se.h>
>>>   #include <linux/spinlock.h>
>>> +#include <linux/units.h>
>>>     #define SE_I2C_TX_TRANS_LEN        0x26c
>>>   #define SE_I2C_RX_TRANS_LEN        0x270
>>> @@ -146,18 +147,30 @@ struct geni_i2c_clk_fld {
>>>    * clk_freq_out = t / t_cycle
>>>    * source_clock = 19.2 MHz
>>>    */
>>> -static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
>>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>>>       {KHZ(100), 7, 10, 11, 26},
>>>       {KHZ(400), 2,  5, 12, 24},
>>>       {KHZ(1000), 1, 3,  9, 18},
>>>   };
>>>   +/* source_clock = 32 MHz */
>>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>>> +    {KHZ(100), 7, 14, 18, 40},
>>> +    {KHZ(400), 4,  3, 11, 20},
>>> +    {KHZ(1000), 4, 3,  6, 15},
>>> +};
>>
>> Please double check the values.
>>
>> This is what I get:
>> * for 100KHz: 32000000 / (40 * 7) ~ 114286, apparently 32000000 / (40 * 8) would
>> be a better fit, however it's unclear what would be proper t_high / t_low values,
>> * for 400KHz: it seems good,
>> * for 1000KHz: 32000000 / (15 * 4) ~ 533333, which is almost 1/2 of the wanted
>> bus frequency, so this one looks very wrong.
>>
>> Do you have any ideas how to get better bus frequency settings?
>>
> 
> Thanks for pointing this out.
> 
> I will double check and get back with the proper data.
> 
> Thanks & Regards,
> Manikanta.
> 

Based on Qualcomm's internal hardware programming guide, below values need to be used for 100K & 1000K.
{KHZ(100), 8, 14, 18, 40}
{KHZ(1000), 2, 3,  6, 15}

I will update these values in next version.

Thanks & Regards,
Manikanta.

