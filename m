Return-Path: <linux-i2c+bounces-9356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4842A2DC76
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Feb 2025 11:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C261888A91
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Feb 2025 10:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19777169397;
	Sun,  9 Feb 2025 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QGwT9PdG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CAC156230;
	Sun,  9 Feb 2025 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739096866; cv=none; b=t4Jo6aEYy5kKTtWNPAtNeZhEv+03TzgE6n1/IqZvj3pzuYztkfT+MNx2kIJGMCPAdUDiA0kPxnHptFqcqW9kQ4BjNsCRvWiT68Jkn+1WRCQ1c9kcUPGV1YDz2YEhMVUHwnlA6nO9tjzpGlCUha0beIde6QzJzT49gNmy2Mc9uxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739096866; c=relaxed/simple;
	bh=nJSKx4VUJSQ/beBPK3QdoHeLOgZN0ytShH9LlNuDYCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IpxWvjozNGbsAOtuaL1aRP/q3Ix5imoLGjkuXlHGxr6XqMy5HKSATT1cWgE0kjYNcXckUcIlWnPchmOSrMklCNvAr2SAOlSTLHA3N+HktZHXFnXBbBIN4Z1xAvTOoBjlDj+V5z1mfCKsi88EzaesFkRyMnXOlXvlp+Bs7H2iF/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QGwT9PdG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5197d2xa030518;
	Sun, 9 Feb 2025 10:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxnH3oRgrkZjuWxgMgOQfvxxLoaMFH4iCwEh3sP8QI4=; b=QGwT9PdGn25v9Czb
	+rtG6MjsciViqo1F+VeMgasj8bgNneGNw0AoH53oS7YD8j788dXmZpiUW0HcFBn3
	VenSO+1u7ZTk0+sFgyNbbC1U0Xd/F8KvJKQirfgrdote59EPF+/QDWamCrauLuBL
	QBBNxyOKdqp/O2gXnqV16yWm+6057CLkUmLE9nWF0ohLiaMPuu7qXETQeMJVZ8vQ
	0WjXo01aJnW1b19LLtbNdV8kTa2db9bNR+NPV1XkTw9faLpDB6smnSJDWzW7Htpy
	HQkMq/g3zgl3HoxYBpt/idcqqLDxSd+fzLUHqMfoxgcdd4GFLiDTheLFd0YAT2et
	WaeGwA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0gusty9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 10:27:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 519ARabR002303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Feb 2025 10:27:36 GMT
Received: from [10.216.10.172] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Feb 2025
 02:27:29 -0800
Message-ID: <cc91e20e-f79e-49d8-86bb-08f4ff15dc38@quicinc.com>
Date: Sun, 9 Feb 2025 15:57:25 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: serial: Add support for selecting
 data transfer mode
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <broonie@kernel.or>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <johan+linaro@kernel.org>,
        <dianders@chromium.org>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-5-quic_vdadhani@quicinc.com>
 <10060d39-87a4-4565-a2a6-80c93ac2266a@kernel.org>
 <dudqd2y42wy6iq2k73aphd5ol4mtq7z4c54zhd27rl745rrw5x@p3oummf2jke7>
 <374e16d6-46aa-4bdf-85e9-bc2e33c38057@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <374e16d6-46aa-4bdf-85e9-bc2e33c38057@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zihFguJNNDqxCDos6Hpg6ELwWN6e6_kD
X-Proofpoint-GUID: zihFguJNNDqxCDos6Hpg6ELwWN6e6_kD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_04,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502090092



On 1/27/2025 9:54 PM, Krzysztof Kozlowski wrote:
> On 27/01/2025 15:27, Dmitry Baryshkov wrote:
>> On Mon, Jan 27, 2025 at 08:02:12AM +0100, Krzysztof Kozlowski wrote:
>>> On 24/01/2025 11:53, Viken Dadhaniya wrote:
>>>> Data transfer mode is fixed by TrustZone (TZ), which currently restricts
>>>> developers from modifying the transfer mode from the APPS side.
>>>>
>>>> Document the 'qcom,xfer-mode' properties to select the data transfer mode,
>>>> either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).
>>>>
>>>> UART controller can operate in one of two modes based on the
>>>> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
>>>>
>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> ---
>>>>
>>>> v1 -> v2:
>>>>
>>>> - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
>>>>    qup common driver.
>>>> - Update commit log.
>>>>
>>>> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-4-quic_vdadhani@quicinc.com/
>>>> ---
>>>> ---
>>>>   .../devicetree/bindings/serial/qcom,serial-geni-qcom.yaml | 8 ++++++++
>>>>   1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>> index dd33794b3534..383773b32e47 100644
>>>> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>> @@ -56,6 +56,13 @@ properties:
>>>>     reg:
>>>>       maxItems: 1
>>>>   
>>>> +  qcom,xfer-mode:
>>>> +    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
>>>> +      The default mode is FIFO.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    enum: [1, 3]
>>>> +
>>>> +
>>>
>>> Just one blank line, but anyway, this property should not be in three
>>> places. Do you really expect that each of serial engines within one
>>> GeniQUP will be configured differently by TZ?
>>
>> Yes, each SE is configured separately and it's quite frequent when
>> different SEs have different DMA configuration.
> 
> Well, I checked at sm8550 and sm8650 and each pair of SE - which shares
> resources - has the same DMAs, so I would not call it frequent. Care to
> bring an example where same serial engines have different DMAs and
> different TZ? We do not talk about single QUP.
> 
> Anyway, if you need property per node, this has to be shared schema.

Yes, this property is required for each SE node.
Can we use qcom,geni-se.yaml as a common YAML for the shared schema? 
Please suggest.

> 
> Best regards,
> Krzysztof

