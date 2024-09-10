Return-Path: <linux-i2c+bounces-6485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF39738FF
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B292B22ED5
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 13:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3409194A54;
	Tue, 10 Sep 2024 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b+d1icVl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A321118E11;
	Tue, 10 Sep 2024 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725975910; cv=none; b=H5xaqmy7EZerwFn56hJZF08etqXmSB6dGXcKYdh7hpkepGLnoJ6joSQUJo/9x8edsmtlJlfcYZT5ID9t9ruWn4PCdlYWpgMbm/gMLiTB11yrkYKyukEGpN/Nf32/Md+jc0mk4J2QhuYgW3tq9g43xDj+BqdIftxtjCHRoE14bi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725975910; c=relaxed/simple;
	bh=KJo3SHcB/JwI8XPTyZK5sX97uZlDx18H5V9wO6Eg61A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H0vaDkSdcM3aYSFgHCqTIYwqCwT91L66X0/enmExPGyN/J0JoxPXU/OkaePhnqXrtbxZA4VCdzW1yiaiC4W3hVXDukedkxbOE+8znKXrSdCOSrzLBOZtrkWL+rM8Dr0cBoW5S7V95oRIZWml5ELLIRDtosG9UDgDsTyoNe54pSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b+d1icVl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A3LTjN019858;
	Tue, 10 Sep 2024 13:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6fHP3hn5ddtDR1x6bqZmZhDSfhty386BUBD7qVrE4us=; b=b+d1icVlMwst0jkS
	4CXuf8KctYXFuxz9WKYfGoeSHC87DhX7rgEIlXHWezIY3kZjY6ersa5LciG9QJPr
	TzS8h/Bk9xjI0/DDXGAEl9Mu9L0SJB/DsoKO0OO2jo5MZPXYxrXSOUtxkQinFz+e
	yTq2IaicHpnnBh7lU1JnP/vVPzr3pmuxgv6N6d+ClTr/4dwV/F02+xi60HCShsG4
	GfkPOvGPoC2+Dmt1Z/H7B7u6PQZzimvettm0I/XGRSiYWxCg8d/0dbuMo9j4NKQ8
	VpZJ1kAJSyXm7Ne+g8r6zgbDGexMhldlwva2+5jLw6gQhRLwb1d0ezjvEghkV3hL
	pHQHfw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy59x3yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 13:44:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48ADiwM5017321
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 13:44:58 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Sep
 2024 06:44:53 -0700
Message-ID: <96eb669b-a6bb-497d-ad57-19abda17f704@quicinc.com>
Date: Tue, 10 Sep 2024 19:14:50 +0530
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
 <9cc7d427-34c6-45c2-a747-f71112833773@quicinc.com>
 <bb9e6ba2-4aeb-40ee-b123-9c59a0efa098@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <bb9e6ba2-4aeb-40ee-b123-9c59a0efa098@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QWbNuQqFRCRtlN2lFRIoKIcvZnh2jnQ5
X-Proofpoint-ORIG-GUID: QWbNuQqFRCRtlN2lFRIoKIcvZnh2jnQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100102

Thanks For your reviews,

On 9/10/2024 3:24 PM, Krzysztof Kozlowski wrote:
> On 10/09/2024 11:09, Mukesh Kumar Savaliya wrote:
>> Thanks Krzysztof.
>>
>> On 9/7/2024 2:34 PM, Krzysztof Kozlowski wrote:
>>> On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
>>>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>>>> controller needs to be shared between two subsystems.
>>>
>>> <form letter>
>>> Please use scripts/get_maintainers.pl to get a list of necessary people
>>> and lists to CC (and consider --no-git-fallback argument). It might
>>> happen, that command when run on an older kernel, gives you outdated
>>> entries. Therefore please be sure you base your patches on recent Linux
>>> kernel.
>>>
>>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>>> people, so fix your workflow. Tools might also fail if you work on some
>>> ancient tree (don't, instead use mainline) or work on fork of kernel
>>> (don't, instead use mainline). Just use b4 and everything should be
>>> fine, although remember about `b4 prep --auto-to-cc` if you added new
>>> patches to the patchset.
>>> </form letter>
>>>
>>> You already got this comment, so how many times it has to be repeated?
>>> Your process is just wrong if you do not use the tools for this.
>>>
>> Sorry, I was already using scripts/get_maintainer.pl but i kept everyone
>> into To list (That's my mistake here). I shall keep maintainers in TO
>> list and rest in CC list.
> 
> No, To or Cc does not matter. Your list is just incomplete.
> 
Got it, sorry for the trouble. It seems i missed below 3 names adding 
into reviewers by copy paste mistake. I hope this makes it complete now 
and will add them in V3.

Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Krzysztof Kozlowski <krzk+dt@kernel.org>
Rob Herring <robh@kernel.org>
>>
>> Question: With <Form Letter> , are you asking to add letter in this
>> first patch ? I have cover letter, but it will get removed when patch
>> gets merged. Please help suggest and clarify.
> 
> No, it's just template. Form letter... I am just bored to repeat the
> same comment.
> 
Sorry for that. I hope i could catch now as per above missing list.
>>>
>>>>
>>>> SE = Serial Engine, meant for I2C controller here.
>>>> TRE = Transfer Ring Element, refers to Queued Descriptor.
>>>>
>>>> Example :
>>>> Two clients from different SS can share an I2C SE for same slave device
>>>
>>> What is SS?
>>>
>> SS = Subsystem (EE - Execution Environment, can be Apps
>> processor/TZ/Modem/ADSP etc). Let me add this too in next patch.
> 
> Yes, please explain in the binding itself.
> 
ok, Sure.
>>>> OR their owned slave devices.
>>>> Assume I2C Slave EEPROM device connected with I2C controller.
>>>> Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
>>>> This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> index 9f66a3bb1f80..ae423127f736 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> @@ -60,6 +60,10 @@ properties:
>>>>      power-domains:
>>>>        maxItems: 1
>>>>    
>>>> +  qcom,shared-se:
>>>> +    description: True if I2C needs to be shared between two or more subsystems.
>>>
>>> What is a subsystem? With commit msg I still do not understand this.
>> SS = Subsystem (EE - Execution Environment, can be Apps
>> processor/TZ/Modem/ADSP etc). Let me add EE too with full form.
>>> Maybe presence of hwlock defines it anyway, so this is redundant?
>> No, this flag is required. As hwlock comes into picture if this flag is
> 
> Flag is required? By what? Sorry, you push your downstream solution to us.
> 
Let me explain, Using this flag to take hwlock via TRE @ [PATCH v2 2/4]
We need this to lock SE protecting from other SS transfers until 
unlocked. Hence shared-se flag becomes a decision marker.
drivers/dma/qcom/gpi.c => gpi_create_i2c_tre()
+	/* create lock tre for first tranfser */
+	if (i2c->shared_se && i2c->first_msg) {

Question: what exactly you mean "Maybe presence of hwlock defines it 
anyway" ?
I am open to consider all upstream solutions, trying to understand your 
suggestions and comments.
>> defined. So flag is acting as a condition to take hwlock TRE
>> descriptor(transfer ring element). Hope i could answer your query.
> 
> Hm, not sure, maybe indeed hwlock would not be enough. However I think
> existing binding misses hwlock property.
> 
Let me clarify, you may help suggest further.
hwlock is a descriptor bit(TRE_I2C_LOCK).
"However I think  existing binding misses hwlock property"
Where shall i keep this hwlock property? what's the usage ?

> Best regards,
> Krzysztof
> 

