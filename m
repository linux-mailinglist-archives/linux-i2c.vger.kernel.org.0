Return-Path: <linux-i2c+bounces-6976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8C9855C3
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 10:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F5411C21209
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 08:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A1315AD9C;
	Wed, 25 Sep 2024 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dB8lF5YF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC3F1552E0;
	Wed, 25 Sep 2024 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727253853; cv=none; b=qpVGsvRSx5Fzu6amZ5LyBb4VgDcV8fFDTSGqH8cuVAvYb3cEq+OwJarCYdGMCQlqEa1jf+vzIGWUxC/4zmj97e5yA/+dnMdzDZXR0cDqe2Fj20UV+FxMre7mhLlU6BsLJjE6gLO4KkYmrf7CMhPtiq1Wf/RA1X2QRTal4lLOSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727253853; c=relaxed/simple;
	bh=DO8VK0v2Jf7/FGxXPyOnJqfVq2g37pkTvX5TLfE/ong=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pKnYr2MxoISxBR+btrB+mWK0EuZ0TybzDTMp0lN3+41jC1H4rf744OqrenM1ZBXN0HpMH0m9stXTsK/SIrFefLgcne49gpJknaJsHnI2Pde9H83wqWpKGRFeNmuulbKzEjdgXs/4WYHeZH0NT0px+sjz403MbIfUbFIxrJEUTss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dB8lF5YF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P8Kj50016579;
	Wed, 25 Sep 2024 08:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wg9VmCa1LfbiNfZVXVBt2tG1pR0YkPVDCUAhMon4a4o=; b=dB8lF5YFErAH1VBj
	HpEqfIaNFxe7/lzs+IDMozZ3w0OuH8YpnM9V4VLB4W3DPXa5k+h29wXUvYFhrWWm
	fhJo+AcEhjyay8nMwezbM4q9kq/3udIlXI0cTINiQwW4uHDJ3Klq7AWqfjme7DVN
	owqvX0gRY0AbLBAu/HxwXZKS74l6Ua3ri1QDhQWTkql7TD1Dvr6GbcoEE6S4RF3N
	7NzB4wZRrBXzySV9turR8Kc4NOpzXTcxgNtwhFh0Z1beVc8/Zt5y000+r7M8kGkE
	kQ0DiMXHAd6SwXdCuIcADuyNmLrqKra2OVEX6HiwAag99apvRnuhpXnFTABro7Pi
	461tdA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skueue0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 08:44:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P8i8ht000614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 08:44:08 GMT
Received: from [10.151.37.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 01:44:06 -0700
Message-ID: <3c3647c1-8d6d-4038-8815-30c1570d856c@quicinc.com>
Date: Wed, 25 Sep 2024 14:14:03 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: qcom-geni: add 32MHz I2C SE clock support for
 IPQ5424
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
 <e14e2136-54eb-411d-afff-f6803a23ad6a@quicinc.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <e14e2136-54eb-411d-afff-f6803a23ad6a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T5ZMbQUGk6GSK37eaJXTzOdHna3SpbTz
X-Proofpoint-ORIG-GUID: T5ZMbQUGk6GSK37eaJXTzOdHna3SpbTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250062



On 9/25/2024 1:06 PM, Mukesh Kumar Savaliya wrote:
> Hi Manikanta,
> 
> On 9/24/2024 12:20 PM, Manikanta Mylavarapu wrote:
>> The IPQ5424 I2C SE clock operates at a frequency of 32MHz. Since the
> would it be better to say , I2C SE is sourced from 32MHZ ?

Okay, sure.

>> existing map table is based on 19.2MHz, this patch incorporate the
> based on 19.2MHz. this patch /,/.

Okay, sure.

>> clock map table to derive the SCL clock from the 32MHz SE clock.
> from the 32MHz Source Clock frequency.
> SE = Expand OR  (I2C Serial Engine Controller)

Okay, sure.

>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 212336f724a6..bbd9ecf09f4b 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -71,6 +71,7 @@ enum geni_i2c_err_code {
>>     #define I2C_AUTO_SUSPEND_DELAY    250
>>   #define KHZ(freq)        (1000 * freq)
>> +#define MHZ(freq)        (1000000 * freq)
>>   #define PACKING_BYTES_PW    4
>>     #define ABORT_TIMEOUT        HZ
>> @@ -152,11 +153,21 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
> A thought - Should we rename this appending _19.2M ? In future one or more may come as it evolves speed.

Okay, sure.

Thanks & Regards,
Manikanta.

>>       {KHZ(1000), 1, 3,  9, 18},
>>   };
>>   +/* source_clock = 32 MHz */
>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32M[] = {
>> +    {KHZ(100), 7, 14, 18, 40},
>> +    {KHZ(400), 4,  3, 11, 20},
>> +    {KHZ(1000), 4, 3,  6, 15},
>> +};
>> +
>>   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>>   {
>>       int i;
>>       const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
>>   +    if (clk_get_rate(gi2c->se.clk) == MHZ(32))
>> +        itr = geni_i2c_clk_map_32M;
>> +
>>       for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
>>           if (itr->clk_freq_out == gi2c->clk_freq_out) {
>>               gi2c->clk_fld = itr;


