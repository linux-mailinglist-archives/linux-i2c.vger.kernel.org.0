Return-Path: <linux-i2c+bounces-7958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E8B9C7842
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA2971F2581D
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C119A15CD60;
	Wed, 13 Nov 2024 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Veo+wuhY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E879D15ADA4;
	Wed, 13 Nov 2024 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514062; cv=none; b=JQm8NblcWZoMAam7z/LasKYVzTQcMY0CZ/mo5RdWol4uP2Rof9/BaLSiTqDY2DmaLSi7gLsXwh/h7Y4jTVXoP8Xi5Xy1BI4WgG7PA/VRTaqeE6X+OYfZD8WGwyNfCrUIq4DK1TDDN7hCrV//LlEtR4fZBYhYhHDmsteNXn2G1TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514062; c=relaxed/simple;
	bh=GW/NL3gvnV+x/qkDjDfTfhWmhJ3TC/QsaPDy4rJKZkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Cb9XMdcFwrMBx+2v+xZjbSyjY0sIlj1SEdoPp2Cmalvt6k2bZObDvzt3dX51oa2RRfYAhP671eEdejCtQT79ORyDYXekjuwpQ0paT+yBmIu/xMY25Am0HPNHSMu6nrzytaj3crdyjCx7cO/P+zsWfVh6W0dQLKHqjLIURqK8Ao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Veo+wuhY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADDEXa4030599;
	Wed, 13 Nov 2024 16:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X86zf3TQdOM7BYM+wj89RO/fxo7N5CLscyXQPPm45Q4=; b=Veo+wuhYrnuiJoP2
	KGsW37FhXxbs4zW46ltDN4rq5zZwz1ryTmRSj6t8eoJzfph2XVPWPPlROXdadq60
	M+UFohDIhnMbUkfwb54pdpCvW9tj3XH9T8z6JK7JJC2uQlyReNCNh/Avb1R5B7Ut
	sK8lgh1/t6aoHkw0Gkc49shHJSswXbqhNbheDslKhZA2f2nt1mj7T35LjifK78+S
	hI/2REtVLWsDYqPS/UxHzG/JeTlxXT6KDDNed7lmQ/7GP7WXpmNHpbX90SaBq2c3
	r33ToGhcQ7lbLGUSrltJMqk8py3dzhviXxV6ePJSyJZBRkzeXR5FLioyYKlaVnBR
	sWtCKQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vkvr9wfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:07:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADG7VAL010623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:07:31 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 08:07:26 -0800
Message-ID: <b6793406-1527-4413-addd-e4d5dc73c5e3@quicinc.com>
Date: Wed, 13 Nov 2024 21:37:24 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] soc: qcom: geni-se: Do not keep GPIOs to sleep
 state for shared SE usecase
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
 <20240927063108.2773304-4-quic_msavaliy@quicinc.com>
 <d5d606b5-1135-4ed2-a2cd-8c2f7053cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <d5d606b5-1135-4ed2-a2cd-8c2f7053cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tssOpgWpP7iCphrGcpmhc7y3fWxmqhKX
X-Proofpoint-GUID: tssOpgWpP7iCphrGcpmhc7y3fWxmqhKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130134

Thanks Konrad for the review.

On 10/26/2024 12:23 AM, Konrad Dybcio wrote:
> On 27.09.2024 8:31 AM, Mukesh Kumar Savaliya wrote:
>> Currently the driver provides a function called geni_serial_resources_off()
>> to turn off resources like clocks and  pinctrl.
>>
>> For shared SE between two SS, we don't need to keep pinctrl to sleep state
>> as other SS may be actively transferring data over SE. Hence,bypass keeping
>> pinctrl to sleep state conditionally using shared_geni_se flag.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c  | 14 ++++++++++----
>>   include/linux/soc/qcom/geni-se.h |  3 +++
>>   2 files changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 2e8f24d5da80..89cf18699336 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   
>>   /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
>>   #define __DISABLE_TRACE_MMIO__
>> @@ -503,10 +504,15 @@ int geni_se_resources_off(struct geni_se *se)
>>   
>>   	if (has_acpi_companion(se->dev))
>>   		return 0;
>> -
>> -	ret = pinctrl_pm_select_sleep_state(se->dev);
>> -	if (ret)
>> -		return ret;
>> +	/* Keep pinctrl to sleep state only for regular usecase.
>> +	 * Do not sleep pinctrl for shared SE because other SS(subsystems)
>> +	 * may continueto perform transfer.
>> +	 */
> 
> /*
>   * Don't alter pin states on shared SEs to avoid potentially
>   * interrupting transfers started by other subsystems
>   */
> 
Done
> 
>> +	if (se->shared_geni_se == false) {
> 
> if (!se->shared_geni_se)
Done
> 
>> +		ret = pinctrl_pm_select_sleep_state(se->dev);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	geni_se_clks_off(se);
> 
> Should the clocks be turned off?
> 
Yes, it's required to be turned off.
> Konrad

