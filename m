Return-Path: <linux-i2c+bounces-6464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1127E972D09
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 358BF1C2472F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1354E187FF6;
	Tue, 10 Sep 2024 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YIA5RpCS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1515A140E5F;
	Tue, 10 Sep 2024 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959452; cv=none; b=IhFT4VU5pdyVIpIdWRbQkumIBsO13teFzdpNz4Ic01Z1rFI+cYDoekX2otNX6srjTT6iYI52G6spZiEi2c9FM4OcN6yPoeiPjo0cf6cop7yGA9Pf2bEpIjydWy3meDJBuCjUV8gC/QeAN2W/3h05vyl8dWuu6HVQRlrHZT4+D9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959452; c=relaxed/simple;
	bh=bi/3v78hirM3CCLx1Jpr2y1u/zazwAgieEY9QencFgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l2h0FJNtLLQH8VSNi20jHJBY+8jmdwu+E0U4/lc0E06zroYU/Y8tmdseqHswAz/hDW1IHuNfnfqgP7yW6nBHrLQhcZ84gYlSisyBjypWLi42CHrKuzYggEA4O9BxKzAKH3jH7fjt96jH+hG6SQRna/i+TFjuMZ+8rZbBlsDbe7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YIA5RpCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A8jBcm030328;
	Tue, 10 Sep 2024 09:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WGQiJqaXiZiLwnAudLqZ+P+0iP2TDw7Rp39R8v6pVR0=; b=YIA5RpCS/Az6Zii7
	lADT8QwVVnJJq8BO/GUFvk5cPyAeKTCuI5kJp9IkczZClbI04+i2LS3rd4c9qaxZ
	eR527AJ6GBCHS4GEYtZyfGdnvrYhB9Yl0DlsOjV2WFwSUzfxTeg1CEPAfZORv6Qm
	qa1T8YvHujXr7DKc+UtmX3KsdyXmwvw0BnC3qFxIT/EdzGee6L7tfgwyDKrimW5F
	hDtcNQ5UKwk8pMI1PwiPBnZfHB9SkPvprxIhtZOxJxiT7LaLQ8uuG6MNPsWvrWDq
	epeBNcGe8ujIHbr0DYaXzR/XAc0nWjHcRyF67YTi2UDGcaIugQnC57imrJZInLJ9
	EM+kFQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41j6gmsmjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 09:10:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48A9AY9t007678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 09:10:34 GMT
Received: from [10.218.13.83] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Sep
 2024 02:10:28 -0700
Message-ID: <9cc7d427-34c6-45c2-a747-f71112833773@quicinc.com>
Date: Tue, 10 Sep 2024 14:39:56 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-2-quic_msavaliy@quicinc.com>
 <6a6fc102-a18c-4ae3-9104-59eb3172f407@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <6a6fc102-a18c-4ae3-9104-59eb3172f407@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c1eYqJJ2a6EHb30zuLNgvoUuQjQCFeiE
X-Proofpoint-GUID: c1eYqJJ2a6EHb30zuLNgvoUuQjQCFeiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100069

Thanks Krzysztof.

On 9/7/2024 2:34 PM, Krzysztof Kozlowski wrote:
> On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>> controller needs to be shared between two subsystems.
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> </form letter>
> 
> You already got this comment, so how many times it has to be repeated?
> Your process is just wrong if you do not use the tools for this.
> 
Sorry, I was already using scripts/get_maintainer.pl but i kept everyone 
into To list (That's my mistake here). I shall keep maintainers in TO 
list and rest in CC list.

Question: With <Form Letter> , are you asking to add letter in this 
first patch ? I have cover letter, but it will get removed when patch 
gets merged. Please help suggest and clarify.
> 
>>
>> SE = Serial Engine, meant for I2C controller here.
>> TRE = Transfer Ring Element, refers to Queued Descriptor.
>>
>> Example :
>> Two clients from different SS can share an I2C SE for same slave device
> 
> What is SS?
> 
SS = Subsystem (EE - Execution Environment, can be Apps 
processor/TZ/Modem/ADSP etc). Let me add this too in next patch.
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
>> index 9f66a3bb1f80..ae423127f736 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -60,6 +60,10 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  qcom,shared-se:
>> +    description: True if I2C needs to be shared between two or more subsystems.
> 
> What is a subsystem? With commit msg I still do not understand this.
SS = Subsystem (EE - Execution Environment, can be Apps 
processor/TZ/Modem/ADSP etc). Let me add EE too with full form.
> Maybe presence of hwlock defines it anyway, so this is redundant?
No, this flag is required. As hwlock comes into picture if this flag is 
defined. So flag is acting as a condition to take hwlock TRE 
descriptor(transfer ring element). Hope i could answer your query.
> Best regards,
> Krzysztof
> 

