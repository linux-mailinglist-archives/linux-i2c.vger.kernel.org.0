Return-Path: <linux-i2c+bounces-7075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A19D998934C
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 08:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 644102858D9
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 06:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8BB137C35;
	Sun, 29 Sep 2024 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o7FWYazJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E332BE4E;
	Sun, 29 Sep 2024 06:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727591803; cv=none; b=LQSAxZDf1uUyHNooatQmLZyYtK6FZlqDRD+TX74qG0a+4YYG9Rr9TW0hVb2VJtRL8TrC4J3HrNxHXU+f3/082VCGYapHqOYCXXC5yJQ/dCCgLyi6tiUZrlijCcvVnJPjiGM4CM9TpTiqRYDxhSHVVbOqdPYpZiWPmp1KghTtV78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727591803; c=relaxed/simple;
	bh=AoeX5Bh+OPcP5MdPHb+2Fpmd785USqzbzYz38We8Qtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CLVlecr3d3vqdAsjpilCrRVA0p/f7FFPmWmFE98wtd6oLkb+kc5BGg2Ox0CGdYo3SPeuA2+5Hj35fC8DiN+thFdfobQ7OIzLOz6I2KdcFKyVRj8zu27FnvFK1hecfcCc7wE0Fg8FdlM+R+E2HP/idvV3izUBbGd6NzTCIayNIQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o7FWYazJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48T0Q9Wq019677;
	Sun, 29 Sep 2024 06:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgdxnNBOuwqsGfRJzvNbzlP0J/XoFZgAZjLjyzscPSA=; b=o7FWYazJ88VH7i5l
	frY+YxGjyqIA3wWRK5sAu/lv0/we2o2E+X7Qtg7w6jmz8udixAed8R30u/MLrAlk
	5ydAxnWPXJH2V5Kcg117pYFMAhZeGVAijkbNqHeHoufQpiYrDF7153c1r1KpBWV6
	4PxidNAXrlLleO8dKmwChlrkOnB48KkATVzsPBHT9tuTg/LGpxPmtOQiQNwaf4nD
	zlKvtgEWjYOoSRVGNMG7qW2KtxkMBhrnBLDm1BAXEBgKNBSUZRpYP4WmTtHzcO6t
	JqHblVGd8pZBrSf9oT5Aly6LdnRl0DfDzkT0XJzwyR+kXf95tCw/3XdOmG6dIOWw
	WY7oow==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x94h9wba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Sep 2024 06:36:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48T6aaDS025012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Sep 2024 06:36:36 GMT
Received: from [10.50.42.35] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 28 Sep
 2024 23:36:33 -0700
Message-ID: <2de5f3e7-1fd6-4368-94bc-4eecc8fc6752@quicinc.com>
Date: Sun, 29 Sep 2024 12:06:33 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
 <def1c338-8e41-4622-83d5-7a377d780d76@linaro.org>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <def1c338-8e41-4622-83d5-7a377d780d76@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 32GyGAd05XOJMRiHqCz9M_C-5RlgUS9y
X-Proofpoint-ORIG-GUID: 32GyGAd05XOJMRiHqCz9M_C-5RlgUS9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409290048



On 9/26/2024 3:58 PM, Vladimir Zapolskiy wrote:
> Hello Manikanta.
> 
> On 9/26/24 06:43, Manikanta Mylavarapu wrote:
>> In existing socs, I2C serial engine is sourced from XO (19.2MHz).
>> Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).
>>
>> The existing map table is based on 19.2MHz. This patch incorporate
>> the clock map table to derive the SCL clock from the 32MHz source
>> clock frequency.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>> Changes in v2:
>>     - Dropped IPQ5424 from the commit title
>>     - Added else part to assign geni_i2c_clk_map_19p2mhz to itr
>>     - Dropped MHZ macro and used HZ_PER_MHZ macro
>>     - Expanded SE to serial engine
>>     - Added the reason for 32MHz clock in commit message
>>
>>   drivers/i2c/busses/i2c-qcom-geni.c | 19 ++++++++++++++++---
>>   1 file changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 212336f724a6..22f2a0d83641 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/soc/qcom/geni-se.h>
>>   #include <linux/spinlock.h>
>> +#include <linux/units.h>
>>     #define SE_I2C_TX_TRANS_LEN        0x26c
>>   #define SE_I2C_RX_TRANS_LEN        0x270
>> @@ -146,18 +147,30 @@ struct geni_i2c_clk_fld {
>>    * clk_freq_out = t / t_cycle
>>    * source_clock = 19.2 MHz
>>    */
>> -static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>>       {KHZ(100), 7, 10, 11, 26},
>>       {KHZ(400), 2,  5, 12, 24},
>>       {KHZ(1000), 1, 3,  9, 18},
>>   };
>>   +/* source_clock = 32 MHz */
>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>> +    {KHZ(100), 7, 14, 18, 40},
>> +    {KHZ(400), 4,  3, 11, 20},
>> +    {KHZ(1000), 4, 3,  6, 15},
>> +};
> 
> Please double check the values.
> 
> This is what I get:
> * for 100KHz: 32000000 / (40 * 7) ~ 114286, apparently 32000000 / (40 * 8) would
> be a better fit, however it's unclear what would be proper t_high / t_low values,
> * for 400KHz: it seems good,
> * for 1000KHz: 32000000 / (15 * 4) ~ 533333, which is almost 1/2 of the wanted
> bus frequency, so this one looks very wrong.
> 
> Do you have any ideas how to get better bus frequency settings?
> 

Thanks for pointing this out.

I will double check and get back with the proper data.

Thanks & Regards,
Manikanta.

