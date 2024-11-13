Return-Path: <linux-i2c+bounces-7960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E908E9C7966
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A047CB61907
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CA715FD16;
	Wed, 13 Nov 2024 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eXkh6Guj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2147E792;
	Wed, 13 Nov 2024 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514136; cv=none; b=gLjqYcRIiJTzMR/MSvEpO5wz7oJQEtZeGfqVAuo1616uKObOAQWI2d5LgGF56N9DvS5PDrtDYH5UyoDooppaUOur840R0y7lXhefqXrGl3g+LH42Q9VBO1UN9Qn6GpGKKAwqpZvBoWCmwPdbCpozdCw4lQ+9vgJZC4bf78v+Uu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514136; c=relaxed/simple;
	bh=laroRk5d9ffpRwUS9iMIGJpuGlk9xNXcLXb1Bd8Glsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qba20OWuqPPHhQZi1p0EmvrfnZ8ErErg+AAnCiypoYIaWhZRg75jU+tmuRti6KRLB6/Uz1+hOwH6ESo+0qPdWqcH/d3t3mrxHWijLk713TK1URBMtkaG1lyZexA/WbzXguPtNuqEQj4zZiBiWHWvbDnGERZ+2v9s0NZjBadGGGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eXkh6Guj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADACs69014618;
	Wed, 13 Nov 2024 16:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3LTIGpTVLsQ4VBAUGigEKskEQ46OjwR8ligDJTY8bpA=; b=eXkh6GujsWqHk30z
	nhGjHStdk4w86G+tEBRbXleEvqWiE1FYeblT2bavJhugaKm1NuWhCL+XFyH8y8d/
	36UQfa0Su44i7ql2QLSsXvFWqEk99cXLLDYvTImeD9MqiayHsYvfkrcSK7nARc7U
	Z0O8ZXlVYEI3unusJeDoXziJM5M5D9upgacdMKoLge6N561lNShIPtvoqyR9MDyR
	uq/hTZtlPYJIE+lHL9+Occ4xgc2qhDm0VYDdODD6fHl3+yXD+O65l53AV5Il27Gt
	IWwkeqgzHNWXlMKDs3bKf8IvsDLBY/cPvXw/v0KlD3vMvf+uI4ltS6dNSzzHV65b
	sVL+cg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v47y4jgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:08:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADG8jTm012439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:08:45 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 08:08:40 -0800
Message-ID: <6d81d8e7-ecd1-46f0-8ca3-617b5ee96990@quicinc.com>
Date: Wed, 13 Nov 2024 21:38:37 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <devicetree@vger.kernel.org>, <vkoul@kernel.org>,
        <linux@treblig.org>, <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-2-quic_msavaliy@quicinc.com>
 <we3wmw6e25y6e4443ndrduurwvkkpvuw7ozrizuys6pwxppwfy@2uq7uda4evhd>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <we3wmw6e25y6e4443ndrduurwvkkpvuw7ozrizuys6pwxppwfy@2uq7uda4evhd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7qgOXIM_5spHtOKkhA_JidmRpvdfOX0Y
X-Proofpoint-GUID: 7qgOXIM_5spHtOKkhA_JidmRpvdfOX0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130135



On 9/27/2024 2:54 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 27, 2024 at 12:01:05PM +0530, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>> controller needs to be shared between two subsystems.
>>
>> SE = Serial Engine, meant for I2C controller here.
>> TRE = Transfer Ring Element, refers to Queued Descriptor.
>> SS = Subsystems (APPS processor, Modem, TZ, ADSP etc).
>>
>> Example :
>> Two clients from different SS can share an I2C SE for same slave device
>> OR their owned slave devices.
>> Assume I2C Slave EEPROM device connected with I2C controller.
>> Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
>> This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..3b9b20a0edff 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -60,6 +60,10 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  qcom,shared-se:
>> +    description: True if I2C needs to be shared between two or more subsystems(SS).
> 
> The "SS" and subsystem should be explained in the binding. Please do not
> use some qcom-specific abbreviations here, but explain exactly, e.g.
> processors like application processor and DSP.
> 
> "se" is also not explained in the binding - please open it and look for
> such explanation.
Sure, i thought cover letter explanation is good enough. I will add it 
per patch as cover letter will not be visible and go away after merge.
> 
> This all should be rephrased to make it clear... We talked about this
> and I do not see much of improvements except commit msg, so we are
> making circles. I don't know, get someone internally to help you in
> upstreaming this.
Let me retry to make it better.
Will make SS (subsystem) to system processor (can be APPS or DSP OR any 
other).
> 
> Is sharing of IP blocks going to be also for other devices? If yes, then
> this should be one property for all Qualcomm devices. If not, then be
> sure that this is the case because I will bring it up if you come with
> one more solution for something else.
> 
IP blocks like SE can be shared. Here we are talking about I2C sharing.
In future it can be SPI sharing. But design wise it fits better to add 
flag per SE node. Same we shall be adding for SPI too in future.

Please let me know your further suggestions.
> Best regards,
> Krzysztof
> 

