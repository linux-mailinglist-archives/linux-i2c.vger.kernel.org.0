Return-Path: <linux-i2c+bounces-8279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 839A19DF9C2
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 05:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C726162783
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 04:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F6938DE9;
	Mon,  2 Dec 2024 04:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YXf2gQrn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5898EC4;
	Mon,  2 Dec 2024 04:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733112060; cv=none; b=F8+dxpic6fQFnQYhb7IzhzpQDqLEailtAW+rR22Q/IWTaRnITOr88B2gw0eQRxOcsBfKjTf43aETdVSdPD4vR3c9kfWlIeRgzJ9Ue63IThu/zAXr3VQCPjoFZSN4ezHgVvBPPpHflw/oJlJ2q5eY1kOX3PsfMnW3YGLfnGgvYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733112060; c=relaxed/simple;
	bh=Pkx06eFoSQ5pLlwbVD3xNXp4h4D9c9tDfBn+JoB0TJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WS/uRpf2drisXU9A3eMp+oGSTPy5sUY6r2tAHY5ZRPr7WAtO2+NxxWWoWai4GjE1caNaJsMJ5ntdWPK2XMJ/lhCYo+tNOcCBVsq/Dzsx9k5qx62tSqXN1bpiqnqzaY+NXkPr78Y+Yn2gp/1IXCBRLaEfHFKnSjfy0Un6iwbw/WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YXf2gQrn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B21rVc9010828;
	Mon, 2 Dec 2024 04:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZ6U475vxcpKZIrB8K4blpoWg3pR0JybXy3nKP2lGy4=; b=YXf2gQrnG/9T9zGG
	qtFNEQm68ssCiXPQvij43zDrDFABuikzlryUFeFAhELcvsXGzXkFPhMdi9dfXANB
	A7tq10EUKVzB0WLdS76F3edFrC5L53oRL56Y3iUXR4tZmiM1nF4FG9+2vQvOuNIF
	S5gKTUCchUl0+WsjaBWY2ITbVXHbMnw/ocjlMTmuWWeiyGnL0OORToR+JzWEL642
	liOMa5oGG5N+fFzvJk4JX8laoHf3yb25Llubmyr74si1oVbDYBRaPFr9K+pwM2BM
	lP0/JbPawhCcxifYI4c1gZvmxTfP/trtwAS1WkcrqI65967LOwnneYJNuweuXXC2
	lopsUg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mp87m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 04:00:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B240bYT007770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 04:00:37 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 20:00:31 -0800
Message-ID: <a8b1ccd2-c37b-4a6f-b592-caf1a53be02c@quicinc.com>
Date: Mon, 2 Dec 2024 09:30:29 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
 <db428697-a9dc-46e1-abbe-73341306403f@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <db428697-a9dc-46e1-abbe-73341306403f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EuGOnA2UC-Qlre3pOkAgEbPsw931QVz9
X-Proofpoint-GUID: EuGOnA2UC-Qlre3pOkAgEbPsw931QVz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020032

Hi Krzysztof,

On 11/29/2024 8:44 PM, Krzysztof Kozlowski wrote:
> On 29/11/2024 15:43, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this flag when I2C serial controller
>> needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.
>>
>> SE(Serial Engine HW controller acting as protocol master controller) is an
>> I2C controller. Basically a programmable SERDES(serializer/deserializer)
>> coupled with data DMA entity, capable in handling a bus protocol, and data
>> moves to/from system memory.
>>
>> Two clients from different processors can share an I2C controller for same
>> slave device OR their owned slave devices. Assume I2C Slave EEPROM device
>> connected with I2C controller. Each client from ADSP SS and APPS Linux SS
>> can perform i2c transactions.
>>
>> Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml       | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..88682a333399 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -60,6 +60,14 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  qcom,shared-se:
>> +    description: True if I2C controller is shared between two or more system processors.
>> +        SE(Serial Engine HW controller working as protocol master controller) is an
>> +        I2C controller. Basically, a programmable SERDES(serializer/deserializer)
>> +        coupled with data DMA entity, capable in handling a bus protocol, and data
>> +        moves to/from system memory.
> I replied why I NAK it. You did not really address my concerns, but
> replied with some generic statement. After that generic statement you
> gave me exactly 0 seconds to react and you sent v5.
> 
Sorry for 0 seconds, i thought of addressing comment and uploading it 
new patch as i wanted to explain SE. whatever i have added for SE 
explanation is in qualcomm hardware programming guide document.
> Really 0 seconds to respond to your comment, while you give yourself
> days to respond to my comments.
> 
> This is not how it works.
> 
Sure, let me first conclude here what exactly should be done.
> NAK
> 
> Implement previous feedback. Don't send any new versions before you
> understand what you have to do and get some agreement with reviewers.
> 
Sure, this is definitely a good way. what did i do for previous comment ?
I have opened SE and expanded, explained.

which statement or explanation should i rephrase ? Is it description 
statement from this yaml file ? Could you please suggested better word 
instead of shared-se if this flag name is not suitable ?

I could not get this ask -
"There are few of such flags already and there are some patches adding 
it in different flavors."

> Best regards,
> Krzysztof

