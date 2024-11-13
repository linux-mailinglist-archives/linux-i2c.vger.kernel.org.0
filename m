Return-Path: <linux-i2c+bounces-7962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B288B9C78B7
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63CF0B61CE1
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233A315B987;
	Wed, 13 Nov 2024 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ROwZxeZV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707CF171C9;
	Wed, 13 Nov 2024 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514191; cv=none; b=kPr9O5QcI4k3VjgRO44NEKoEs/PnJ+G8E9wRdxteAyWoNk/DgduyltvQ0d9RRIlHfBcywOUEcYlXLArymxUvAPe65UQyFzxNoJU/1+4N8G95iz6CBmftAYlTCins6Zc3SHuv+PWDSOtnMbzANDQfKwNERzDbuemzbs/pf080ImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514191; c=relaxed/simple;
	bh=d7caYVu6Vs0usYgjAaWScNI/C8iFF04SDUdMamgCg3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n2gZkS23C8/5F+iAeVjVLwGBnhe4glHr95jieaUJsJXgUNhCW0Q0GTfUMQPnkwaMqWkY4vc5YdQ92nmLnw6bJqPB7dowsi6MOchbla1oQp6d8g66Ceh+QDNIpDgPMWlmKjwd/Gt0yCYvE9yyuIgIO8sNoXgKb6xdOxx2FgEPVMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ROwZxeZV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADAprhe004027;
	Wed, 13 Nov 2024 16:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaWFZ8OOrCKmA1T90QFQJOtk0tsuYlwF6+/ipX/0iVs=; b=ROwZxeZV5+z3I6YF
	I8SThfADXzWM6W8e14SonpO1Kp7FtzA+KK4DDgkdYAVv7BPCDsw+xkiQLwBfSXoL
	8Oq2Q6HP1+xGWs5n1GriEKnzE0lfnO5sYCRJfTy824ibQ0RfeUc8cZJNwDzR+Yzh
	hyR4doBpeq2UO8cxDTu1V6Z5dUn4fxnAX/3t842D2PogUjrsUFFmCY5CZz+PEsEf
	S0JmyKhpuY2z/5nNE/gy5RVa0g4vlftlbv9MuuIlm8MrXZ6bGjpGKs8R85k0Nc8M
	h/02nxvdCprb3gNCXiKAm9k7Z39BVYetFqPZTsf9LveMtB5HAp/vJbeZCI4R/Tl1
	W+hDpw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vtqwrsyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:09:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADG9dvb002475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:09:39 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 08:09:34 -0800
Message-ID: <03f73326-f7a8-4070-81de-daadb969efdc@quicinc.com>
Date: Wed, 13 Nov 2024 21:39:31 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] soc: qcom: geni-se: Do not keep GPIOs to sleep
 state for shared SE usecase
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-4-quic_msavaliy@quicinc.com>
 <vnpl6a5accygarfowtiixbba6guxvgsyipdcte3tzf2vrvyve7@zjw4bnuckvmi>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <vnpl6a5accygarfowtiixbba6guxvgsyipdcte3tzf2vrvyve7@zjw4bnuckvmi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mrDwOlYuiRBwtL-KuaEm_EcIbrGbCjex
X-Proofpoint-ORIG-GUID: mrDwOlYuiRBwtL-KuaEm_EcIbrGbCjex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130135

Hi Bjorn,

On 9/30/2024 8:57 AM, Bjorn Andersson wrote:
> On Fri, Sep 27, 2024 at 12:01:07PM GMT, Mukesh Kumar Savaliya wrote:
>> Currently the driver provides a function called geni_serial_resources_off()
>> to turn off resources like clocks and  pinctrl.
>>
>> For shared SE between two SS, we don't need to keep pinctrl to sleep state
>> as other SS may be actively transferring data over SE.
> 
> "don't need to" sounds like an optimization. Is this really the case?
> The comment in the code below seems to indicate no.
It's not an optimization but real need for shared SE.
> 
> As with the other commit message, expand your abbreviations.
> 
Sure.
>> Hence,bypass keeping
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
>> +	if (se->shared_geni_se == false) {
>> +		ret = pinctrl_pm_select_sleep_state(se->dev);
> 
> I'm a bit rusty on the pinctrl API, but wouldn't you achieve the same
> result by just not specifying a "sleep" pinctrl state?
I find it more generic if code takes required action based on the flag. 
As such this flag is required to perform other actions too. Rather 
guiding with documentations, it would be good to have feature flag and 
manage.
> 
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	geni_se_clks_off(se);
>>   	return 0;
>> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
>> index c3bca9c0bf2c..359041c64ad8 100644
>> --- a/include/linux/soc/qcom/geni-se.h
>> +++ b/include/linux/soc/qcom/geni-se.h
>> @@ -1,6 +1,7 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   /*
>>    * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #ifndef _LINUX_QCOM_GENI_SE
>> @@ -61,6 +62,7 @@ struct geni_icc_path {
>>    * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
>>    * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
>>    * @icc_paths:		Array of ICC paths for SE
>> + * @shared_geni_se:	Tells if SE is used by two SS in shared environment.
> 
> Please avoid the abbreviations. Be succinct, e.g. does it matter that
> it's two SS - what if it's 3?
Sure Bjorn, I shall enhance like multiprocessors running different OS.
> "Tell" is not the correct verb here, struct members don't speak.
Agree, corrected.
> 
> Regards,
> Bjorn
> 
>>    */
>>   struct geni_se {
>>   	void __iomem *base;
>> @@ -70,6 +72,7 @@ struct geni_se {
>>   	unsigned int num_clk_levels;
>>   	unsigned long *clk_perf_tbl;
>>   	struct geni_icc_path icc_paths[3];
>> +	bool shared_geni_se;
>>   };
>>   
>>   /* Common SE registers */
>> -- 
>> 2.25.1
>>

