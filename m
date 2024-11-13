Return-Path: <linux-i2c+bounces-7961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 009829C784D
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0E7289101
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD6C1632F9;
	Wed, 13 Nov 2024 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OyW6UcdS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1669C171C9;
	Wed, 13 Nov 2024 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514150; cv=none; b=TuM62rMFI61UH/EiR473Vx2RbZ1iDudLASHgaDeWTCAmTa17I5MSaqIk2v/LesXE9xN511+0PN8Pkjwi5f9DrGT/pjm0EdtNmNXWMm3IxDEshPkMQc4Zrhyizx/D7NgAc58B1CYk0tGigBHNTwE7VqSpFF++PthgVAVbGac3jc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514150; c=relaxed/simple;
	bh=g8dQHkN4uYSTXjwnIcPVdc8shC7VdRvMfgKMnkuxaFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H9Z6x3YPKdxxVOH7NsRhy6d8oQs3MSiOGQPJLnCjUspZskIkuL3j2YzPsk8HQg/obcJq2K0IlsQBlWmTVu2q7lt/5YzGAR2LnOK1DD2X3DbOLSdoCVLGaPGCNukUzwz2M0tL8MJOQtWhp+Hpnvkt4+1lqCTlsfslGbB8q+tD5uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OyW6UcdS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD9Omuv001142;
	Wed, 13 Nov 2024 16:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxngHL/jLgwnNvONxZ3AGoEVjUYgakxlu3evuV5adSg=; b=OyW6UcdSZvCml1qP
	tbjsKfcqMDwWSkduANIJSk5sxJR4w1rHk7+NVbr0TSKxxbpexDMwQ3A09obYWPw0
	4QqRKeUWETKDTpC38pnIx7qdIdgvzW3eXGFxpf7lLVnqCs1kUmPWZXxQSqmADyWU
	t/OjjiW1kC59pMa2NDf6PaMc8gdfQyI+fmu8bBk9qdL1LgxbykcKvifhY4ExrCto
	AYfMqLlIqcY/nireUBzPiB53iQnMkabTp0XS4ReWfTy9QF0PVNFp8e66tbYxJBMp
	l+A7f6yh6Cy4XPWdowFX293zEI9ZfM8ZzzBrIBZjYUn7qjKuB0sMa0Nh5sGggEIn
	ZJHnQg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vsf311gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:09:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADG90Hh019598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:09:00 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 08:08:55 -0800
Message-ID: <af19d4d7-cc74-44dd-bd69-266007f68d5e@quicinc.com>
Date: Wed, 13 Nov 2024 21:38:52 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
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
 <20240927063108.2773304-2-quic_msavaliy@quicinc.com>
 <anfqjd5rcslplfqannqqli2k2gnq2p4qsnkyrfgmavdpll7p42@c7o4tdouiav4>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <anfqjd5rcslplfqannqqli2k2gnq2p4qsnkyrfgmavdpll7p42@c7o4tdouiav4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UXbBBLaEg2aHXcv4X5-jKI33FCc9blfQ
X-Proofpoint-GUID: UXbBBLaEg2aHXcv4X5-jKI33FCc9blfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130135

Thanks Bjorn !

On 9/30/2024 8:50 AM, Bjorn Andersson wrote:
> On Fri, Sep 27, 2024 at 12:01:05PM GMT, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>> controller needs to be shared between two subsystems.
>>
> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
>> SE = Serial Engine, meant for I2C controller here.
>> TRE = Transfer Ring Element, refers to Queued Descriptor.
>> SS = Subsystems (APPS processor, Modem, TZ, ADSP etc).
> 
> Expressing yourself in terms of abbreviations just makes the text harder
> to read. The dictionary is nice, but I don't see that it adds value to
> introduce these abbreviations with the reader.
Sure, thought it will ease the explanations of abbreviations. I learnt 
that not to use it and directly use complete name in opensource way.
> 
>>
>> Example :
>> Two clients from different SS can share an I2C SE for same slave device
>> OR their owned slave devices.
>> Assume I2C Slave EEPROM device connected with I2C controller.
>> Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
>> This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.
>>
> 
> Don't describe your problem using a bullet-point list. You should be
> able to express it in a flowing English sentence/paragraph.
Sure Bjorn.
> 
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
> I see no value in establishing the "SS" abbreviation here, what would be
> useful is to write this sentence such that it establishes the "SE"
> abbreviation (to avoid having to expand the property).
> 
> On the other hand, it's a boolean property in a serial-engine node, so
> I don't know if it's worth repeating "se" here. "qcom,is-shared" sounds
> like a better boolean in a se-node.
> 
Sure, Done. I thought shared-se will make it understand that SE is 
shared. I will modify to qcom,is-shared as recommended.
Also i am removing SS and make it multiprocessor as asked by Bryan.
> Regards,
> Bjorn
> 
>> +    type: boolean
>> +
>>     reg:
>>       maxItems: 1
>>   
>> -- 
>> 2.25.1
>>

