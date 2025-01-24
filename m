Return-Path: <linux-i2c+bounces-9178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77748A1B8B1
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81E231886B69
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578B6150994;
	Fri, 24 Jan 2025 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gcqxak1S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772C5111AD;
	Fri, 24 Jan 2025 15:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731818; cv=none; b=hMuI8lWngIJoQabD1Mqy+8qiu6ea3PdSDM5HnBsAyF+r1AJ6nB8Z6aVbQLx3PcBNd8dC3pYfNQXCHvprtWqVUef9KzVPNCbJ1rfX1AXoIpm26pxKVWNm0zxVamAOslp8WCGWLO0+aNGt4cYzUhjqggoqASbQeQ40KC3JqqMd0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731818; c=relaxed/simple;
	bh=bZa0JBKVM651IGQdRqG75JoHWi9RvMkvN1mwkbxdU5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NyT0CXWBhFnFUN2VvCuBxgMp2RLNZ8GYn3zIcBTqC/vKqHT/nJw5RYyBR2H+bY8mHC6clCbxxYc32/1kJ+3r9n8DihUGshxLryrqHW7ncjoTLNebUbvOsFE4QHvAbH4DGCF5XOQhMkpq1loCbIgpR9oqCzpDwR5OyOFvuWrl87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gcqxak1S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OA5WUb010886;
	Fri, 24 Jan 2025 15:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cmeoqnaFxJsTh1LZ03PpBIVK0MlUiYz60nF4SK8Elas=; b=gcqxak1SieJDhXGF
	tX6efMmg396MmnKz9GfLN8kzxDWwGh1kQAEPD3qV0QufpGz1bzMSF0yZgVUYZIzc
	iLS9eJ67G5lp/N8qdNiuFMHZMcxC4txokyhuweNh42bwyOhg/Al3dTwnwovXDbtZ
	dCWBK8ed20aggmD7aq9SS6PyW8IUrAH41CUIIUgiKdencNe9jfwbGWQjy6oqTqlf
	5YBJkVwIDayRzIibsj4/imidLujbllaGX+Ga2VTe1VMSsmumhYTPcaZGIRFEWia5
	t+UtbqSWgPFGPx4DqAkjW8tAmzQxFqPrM3iGtJeYHnv/MfZiGb5/29HMqL7pXCzk
	+8288g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c8ta8u2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 15:16:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OFGont022814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 15:16:50 GMT
Received: from [10.216.19.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 07:16:43 -0800
Message-ID: <38d24c6b-369e-4254-ae50-5387e2b6063e@quicinc.com>
Date: Fri, 24 Jan 2025 20:46:39 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: i2c: qcom,i2c-geni: Add support for
 selecting data transfer mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <20250124105309.295769-3-quic_vdadhani@quicinc.com>
 <r4zfoaub3dwkirdbsolbl56xxa7ax5eusb2256c7ezlyl2s3vh@hit4g5cpzijw>
 <da7b9678-76cc-4e45-89e9-4e8d9c9a2005@quicinc.com>
 <ewwk5tvwlhu7cbev7su75ysooboq7ivloydvd3unwic2e6p7ap@bpyoqsrgvf6f>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <ewwk5tvwlhu7cbev7su75ysooboq7ivloydvd3unwic2e6p7ap@bpyoqsrgvf6f>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iwOu5ujyqbdForr4zsUKTO1U-DuGlfTm
X-Proofpoint-ORIG-GUID: iwOu5ujyqbdForr4zsUKTO1U-DuGlfTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240108



On 1/24/2025 8:33 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 24, 2025 at 05:52:24PM +0530, Viken Dadhaniya wrote:
>>
>>
>> On 1/24/2025 4:48 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 24, 2025 at 04:23:03PM +0530, Viken Dadhaniya wrote:
>>>> Data transfer mode is fixed by TrustZone (TZ), which currently restricts
>>>> developers from modifying the transfer mode from the APPS side.
>>>>
>>>> Document the 'qcom,xfer-mode' properties to select the data transfer mode,
>>>> either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).
>>>>
>>>> I2C controller can operate in one of two modes based on the
>>>> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
>>>
>>> Is it possible to load the firmware after it being loaded by TZ? Is it
>>> possible to change the mode at runtime too?
>>
>> No, firmware can be loaded either from the TZ side or APPS side.
> 
> You answer actually reads as "No, yes" (excuse me, non-native here).
> Most likely you mean that it can not be reloaded once either TZ or APPS
> has loaded it.

Yes correct. it can not be reloaded once either TZ or APPS has loaded it.

> 
>> In non-GPI mode, the transfer mode will change runtime between PIO and CPU
>> DMA based on the data length.
>>
>> We need to update the device tree property(qcom,xfer-mode) to change the
>> mode between non-GPI and GPI.
> 
> So, is it actually possible to change the mode? E.g. if the TZ has
> loaded the firmware and configured SE for PIO/SE DMA, is it possible to
> change it to GPI DMA?

No, if the TZ has loaded the firmware, it is not possible to switch from 
non-GPI (PIO/SE DMA) to GPI DMA mode.

> 
>>
>>>
>>>>
>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> ---
>>>>
>>>> v1 -> v2:
>>>>
>>>> - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
>>>>     qup common driver.
>>>> - Update commit log.
>>>>
>>>> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-2-quic_vdadhani@quicinc.com/
>>>> ---
>>>> ---
>>>>    .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml        | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> index 9f66a3bb1f80..68e4bf0c84d1 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> @@ -66,6 +66,12 @@ properties:
>>>>      required-opps:
>>>>        maxItems: 1
>>>> +  qcom,xfer-mode:
>>>> +    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
>>>> +      The default mode is FIFO.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    enum: [1, 3]
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - interrupts
>>>> @@ -142,5 +148,6 @@ examples:
>>>>            interconnect-names = "qup-core", "qup-config", "qup-memory";
>>>>            power-domains = <&rpmhpd SC7180_CX>;
>>>>            required-opps = <&rpmhpd_opp_low_svs>;
>>>> +        qcom,xfer-mode = <1>;
>>>
>>> What does <1> mean? Please provide corresponding defines.
>>
>> Do we need to add a string instead of a number, like
>> include/dt-bindings/dma/qcom-gpi.h?
> 
> You need to '#define FOO_BAR 1', then another one for 3. String is a
> "string", it's not required here (in my opinion).
> 

Sure, I will update it in the next patch.


