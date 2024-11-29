Return-Path: <linux-i2c+bounces-8267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 815179DE8BA
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 15:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F232A164149
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 14:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058B413B2BB;
	Fri, 29 Nov 2024 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mw9RyfnC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E34EB45;
	Fri, 29 Nov 2024 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732891421; cv=none; b=JDsfqKky0QeQ/qcEiiSnsqDQZ79Cmu7rAXUINmksfriDds82n0Jbe1EE4fYPWDZnIFaF1C/j3apNThLz1Fsc85Qlb8lWfRQ3IQynKn7uxkpopgNSlU2vCpyNRcO9x6kSWP+EPO6o9lKpXQS7sWVLIwbPcv41YJBm1pSrFQ/IAXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732891421; c=relaxed/simple;
	bh=6wyNEXgehoRdoIVNSbCoKQZKWPZZDgQwJiahCw9sG40=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SkqzU9J9kw458k683bgVXYM/DT2kVXKfA+S/6u2pv1djVmBBj5Jr+p16Jp638TMdQ/JUdLLpdTX+wtGnifyhDhUfJPwikCCqWpxyWYk5mTixlBCXCd5pvvKjj74D7Lwj6fDEfu/vp/E/qW4LuCOuT9qYS9VX8eCQxkU3ZTfxt8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mw9RyfnC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATCrMq9029780;
	Fri, 29 Nov 2024 14:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Pd4Qu7450RBGeZ+NWhXwa/7WL+hy4kgb5vA0RR8OgY=; b=mw9RyfnClGHlLl4j
	swTUfqU2MQk5aba1FgZ2MruFCqxcVX/TNnAeE9PavNXGZXNvUV3PY+EqxWZfEgwD
	HM2ZGlN7lBnzvYlbRWw0Jq2E/tvMgIxzKfRGiYcRwa5z45xPfUXfS/Zb5kLTHkCX
	T4O2Q01B8Dm3VwZYycB0+jYxOT9n75DFzNsliS66nuBmTEitM5i9oDLgbNk40+4W
	emvxYqYBdFWY3ML8toKLBWL9CoyB3PQSeHOhNzK8Z9sPZlAxH1VP/nwFih8bTXoU
	6NFrUyrgANspl7lIP8LTBMo1ZWQIQRjlXxm/64qFdl7r8otFk1px+JyCAJdTK8q8
	Xf0q7Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y05r86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:43:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ATEhT9S009109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:43:29 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 06:43:24 -0800
Message-ID: <8ea18a1d-1ba5-47b4-9fb6-343be3b2b26a@quicinc.com>
Date: Fri, 29 Nov 2024 20:13:21 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <devicetree@vger.kernel.org>, <vkoul@kernel.org>,
        <linux@treblig.org>, <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <quic_vdadhani@quicinc.com>
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
 <20241113161413.3821858-2-quic_msavaliy@quicinc.com>
 <20241115173156.GA3432253-robh@kernel.org>
 <ff20d185-4db4-482b-b6dd-06e46124b8ab@quicinc.com>
 <e1a7d9d6-c382-48f6-bf7f-145290d214d1@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <e1a7d9d6-c382-48f6-bf7f-145290d214d1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LpP6Od-tlQMgtg-AW1La_MmJxIMSzmju
X-Proofpoint-GUID: LpP6Od-tlQMgtg-AW1La_MmJxIMSzmju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290120

Thanks Rob,  Krzysztof !

On 11/25/2024 1:41 PM, Krzysztof Kozlowski wrote:
> On 17/11/2024 18:45, Mukesh Kumar Savaliya wrote:
>> Thanks Rob for your review and comments !
>>
>> On 11/15/2024 11:01 PM, Rob Herring wrote:
>>> On Wed, Nov 13, 2024 at 09:44:10PM +0530, Mukesh Kumar Savaliya wrote:
>>>> Adds qcom,is-shared flag usage. Use this flag when I2C serial controller
>>>
>>> Doesn't match the property name.
>> Sure, i need to change the name here as qcom,shared-se, will upload a
>> new patch.
>>>
>>>> needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.
>>>>
>>>> Two clients from different processors can share an I2C controller for same
>>>> slave device OR their owned slave devices. Assume I2C Slave EEPROM device
>>>> connected with I2C controller. Each client from ADSP SS and APPS Linux SS
>>>> can perform i2c transactions.
>>>>
>>>> Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> index 9f66a3bb1f80..fe36938712f7 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> @@ -60,6 +60,10 @@ properties:
>>>>      power-domains:
>>>>        maxItems: 1
>>>>    
>>>> +  qcom,shared-se:
>>>
>>> What is 'se'? Is that defined somewhere?
>>>
>> SE is Serial Engine acting as I2C controller. Let me add second line for
>> SE here also.
>>
>> It's mentioned in source code in Patch 3 where it's used.
>>   >>> True if serial engine is shared between multiprocessors OR
>> Execution Environment.
> You already got this comment:
> https://lore.kernel.org/lkml/20240927063108.2773304-4-quic_msavaliy@quicinc.com/T/#m79efdd1172631aca99a838b4bfe57943755701e3
> 
> ""se" is also not explained in the binding - please open it and look for
> such explanation."
> 
> Further comments asked you to rephrase it. Did anything improve? No,
> nothing.
> 
> You got comments, you ignore them and send the same.
It's actually changed to is-shared flag and again renamed to shared-se 
based on the review comments. This went for correction for flag naming. 
Sorry for missing SE description into dt-bindings in the latest patch.
I am adding it with more description.
> 
> But most important: I keep repeating this over and over - NAK for some
> specific "shared-se" flag, different for each of your IP blocks. Come
> with something generic for entire qualcomm. There are few of such flags
> already and there are some patches adding it in different flavors.
> 
we do have SE (serial engine) which works for i2c, spi, uart, i3c. And 
SE is single HW entity as you are aware of. But I feel it makes sense to 
keep this flag name per SE and even for SPI OR I3C we should be using 
same flag name in DTSI.
> Get this consistent.
> 
> NAK for this and v5 doing exactly theh same.
> 
Hope i meet expectations considering all your suggestions and past 
learning and not missing anything out of my mind.

> Best regards,
> Krzysztof

