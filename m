Return-Path: <linux-i2c+bounces-9354-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC23A2DBF7
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Feb 2025 11:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9D8E18876CE
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Feb 2025 10:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A850156C62;
	Sun,  9 Feb 2025 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ktOQaRty"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E41339A8;
	Sun,  9 Feb 2025 10:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739095909; cv=none; b=FmLgMoeR1B2uHHd/2nXaK19U6AMfLlI9KN0U0E2EfUkk5Ls/77MygKWsXGsVuBL6x1PM1Q4h4v/spjwy1GQSQdQRGmBuN0JWLII5u8mdz0toGkVKiHJQJHNc8nBk9xi65r7aXEKoLAsfFW19ShY57jmFC1N5mFPPbUl9qI8M39w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739095909; c=relaxed/simple;
	bh=vNfQHGy9KvvHWawYZq7BNNrvnPQWExBbzHbPaHBUPaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t1PokcxpX61uqVV6f8KPrN4TwwEXiaqChJqukDhmNeUQjBaMM/+1muYuIPEhx0B3Kh7FO1dFf3IjEGaJtlTPItEx0GO6UvChbT67p1fbsJQ/fhiTU1jQkh9vsvWQRG3VpyfinTB4qXZkbzk1hdYUeDc+lNu8+meqrn0x06lwcBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ktOQaRty; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5199gVjw015074;
	Sun, 9 Feb 2025 10:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dmek2XxpbJMsM7efAFBBMti346SYX/rpk932t0eKqPQ=; b=ktOQaRtyNQa7+tB0
	RdPe2UaAv6kRKotfPEya8EU3JadZpwA7k8e7jJ2i7UjMi8notIQdL4D3oekm9xMD
	IJGcHgf+/2lzOiXhp4wPZZ+TiSyE1e8vIhgI7Tuel3M+g3eAOWVE/2ZY7DNGuApy
	dZn3H2ugc5UqprbR1+HnTNCN/+ns8zTo0DOoeCmGqW8kPlTj3L/IbSQop5i7ha3o
	D+OJrhoMdu2fWO9LqMwF0AYT/7Bg7zFk79xs+8ndu+DDit2F1nqFUYEHX/Oy5jTH
	t30gC7JscRsei0AwaAU7+/l0Z0/aD3IqBSQppIPTdXUCaZRWPvoslyaCBsvnwTt7
	M9PQnA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyhtfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 10:11:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 519ABepp019131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Feb 2025 10:11:40 GMT
Received: from [10.216.10.172] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Feb 2025
 02:11:33 -0800
Message-ID: <01362821-ac7f-41d7-a4c1-b1f675e9f644@quicinc.com>
Date: Sun, 9 Feb 2025 15:41:16 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: serial: Add support for selecting
 data transfer mode
To: <neil.armstrong@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
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
 <v5n7wn3saiymi2ncgi35drzdjfeaa4ng2ftia6ggex6oh74ocg@7vuskxosh726>
 <5f710113-08b0-468e-940a-2c65e8b42486@linaro.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <5f710113-08b0-468e-940a-2c65e8b42486@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nO-jX9qXh2SLLs-_2Es2F7tOeMSivxvw
X-Proofpoint-GUID: nO-jX9qXh2SLLs-_2Es2F7tOeMSivxvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_04,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502090089



On 1/29/2025 1:48 PM, neil.armstrong@linaro.org wrote:
> On 29/01/2025 03:21, Dmitry Baryshkov wrote:
>> On Mon, Jan 27, 2025 at 05:24:21PM +0100, Krzysztof Kozlowski wrote:
>>> On 27/01/2025 15:27, Dmitry Baryshkov wrote:
>>>> On Mon, Jan 27, 2025 at 08:02:12AM +0100, Krzysztof Kozlowski wrote:
>>>>> On 24/01/2025 11:53, Viken Dadhaniya wrote:
>>>>>> Data transfer mode is fixed by TrustZone (TZ), which currently 
>>>>>> restricts
>>>>>> developers from modifying the transfer mode from the APPS side.
>>>>>>
>>>>>> Document the 'qcom,xfer-mode' properties to select the data 
>>>>>> transfer mode,
>>>>>> either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU 
>>>>>> DMA).
>>>>>>
>>>>>> UART controller can operate in one of two modes based on the
>>>>>> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
>>>>>>
>>>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>>>> ---
>>>>>>
>>>>>> v1 -> v2:
>>>>>>
>>>>>> - Drop 'qcom,load-firmware' property and add 'firmware-name' 
>>>>>> property in
>>>>>>    qup common driver.
>>>>>> - Update commit log.
>>>>>>
>>>>>> v1 Link: 
>>>>>> https://lore.kernel.org/linux-kernel/20241204150326.1470749-4-quic_vdadhani@quicinc.com/
>>>>>> ---
>>>>>> ---
>>>>>>   .../devicetree/bindings/serial/qcom,serial-geni-qcom.yaml | 8 
>>>>>> ++++++++
>>>>>>   1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git 
>>>>>> a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>>>> index dd33794b3534..383773b32e47 100644
>>>>>> --- 
>>>>>> a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>>>> +++ 
>>>>>> b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>>>> @@ -56,6 +56,13 @@ properties:
>>>>>>     reg:
>>>>>>       maxItems: 1
>>>>>> +  qcom,xfer-mode:
>>>>>> +    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) 
>>>>>> mode and 3 for GPI DMA mode.
>>>>>> +      The default mode is FIFO.
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    enum: [1, 3]
>>>>>> +
>>>>>> +
>>>>>
>>>>> Just one blank line, but anyway, this property should not be in three
>>>>> places. Do you really expect that each of serial engines within one
>>>>> GeniQUP will be configured differently by TZ?
>>>>
>>>> Yes, each SE is configured separately and it's quite frequent when
>>>> different SEs have different DMA configuration.
>>>
>>> Well, I checked at sm8550 and sm8650 and each pair of SE - which shares
>>> resources - has the same DMAs, so I would not call it frequent. Care to
>>> bring an example where same serial engines have different DMAs and
>>> different TZ? We do not talk about single QUP.
>>
>> Well, I don't have access to the latest sm8550 / sm8650 devcfg sources.
>> I checked the RB5 ones. As far as I understand out of 14 enabled SEs
>> only two are configured for the GSI DMA, others should use FIFO / SE
>> DMA. Same applies to the SM8250 MTP devices. Checking the RB1 / RB2
>> setup also shows 3 out of 6 SEs being set for GSI.
> 
> I think selecting GSI DMA is only for devices needs high speed streaming 
> to the
> device, like the touch screen, using GSI DMA for random small access is 
> a non-sense.
> 
> But the thing is, in the TZ world the configuration was static so we had 
> no choice
> of using GSI DMA when configured, but now we have the choice so we could 
> totally
> reconfigure the SE with the transfer type (FIFO, SE DMA or GSI DMA) as 
> runtime and
> drop this attribute.
> 
> So instead of hardcoding this, add a way to dynamically select either of 
> the 3
> transfer types when firmware can be loaded from HLOS.
> 
> Neil
> 

Yes, GSI DMA mode is required for specific use cases only.

Dynamically switching from GSI mode to non-GSI mode is neither possible 
nor useful. For each SE, the use case is fixed, and based on the use 
case, the developer can choose the mode via the device tree property.

>>
>>>
>>> Anyway, if you need property per node, this has to be shared schema.
>>>
>>> Best regards,
>>> Krzysztof
>>
> 

