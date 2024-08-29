Return-Path: <linux-i2c+bounces-5927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07098964850
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 16:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8614A1F21CF3
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 14:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229921AED55;
	Thu, 29 Aug 2024 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BG2jd9hy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA091A76D2;
	Thu, 29 Aug 2024 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724941685; cv=none; b=Nr/YisGb2or1xxEwhmnOzs3F+6/dhf2lK18AHfGjVBs6Kxv8YQ7qxHwREAsn8zPSooVnPtXFRkyvzo/KjZUxC16p006sBxqTjKJfpIBBcB169HKOiJZqYVmzxk6pPobmpHO3QQrkhhdQ4s8s7FmdtCMYRL91id+SlR/5xBzuXoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724941685; c=relaxed/simple;
	bh=BmWjnAijfw6T7UxB+tkThQpa/pIriw7JMt+dzMxcamc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ePMQWgEm+J5rokjihdiyrQFbJHW1pv51w5yTBhnhJegBzBtrHY0UTI3hIRmJiQRaetggRe1pxnmsGeaD1A/zxEHsOifV4SOgr+fFrl80+hN+EUy+tE7Axt2x8Wd9yLi7FNN80dl9ZjTW47fVTZlgqULqD4fEL7pWg6JvbPI0wA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BG2jd9hy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8HlKv031817;
	Thu, 29 Aug 2024 14:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1s4+RPa5fTYDeOi0K3UjRSPTnkLkZRQOrwdHKLhFCs0=; b=BG2jd9hyiuyvAIEl
	s8u0X9WRaiq1saQo74VPL2NCcxjODyemQD9GFPGFb8UQIvP3Lm+LaDVm58jcxuuN
	wbQt6Jrs/N77ZKZoTgOr/JkDE6sPy+CBEUy3v4hRILl/0C6x6Naw5vfFOwrAVPzN
	BPRwNkVZyq48rMOwH9MSF6YVpAatS1OjoY6qhhqealsjt5XJpldKKGtiSgY+86V+
	gcdwC4ja529t/2D50tFqhyJHpvSeVubaveMouh2oVPe8tv3XPwxp7IaSMm6Cf9su
	XmNeNzXCFF61YnhNtRtC3GjRZ06zSAr78vOwr6XhQkEUQzsya8bOCVcvYJ/KGK7O
	jEP+NA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puw5hps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:27:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TERJOl015048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:27:19 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 07:27:15 -0700
Message-ID: <19f5389a-a88b-4f29-98fd-c9d539c7c225@quicinc.com>
Date: Thu, 29 Aug 2024 07:27:15 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/22] dt-bindings: serial: document support for SA8255p
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <joro@8bytes.org>,
        <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robin.murphy@arm.com>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <vkoul@kernel.org>, <quic_gurus@quicinc.com>,
        <agross@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <quic_rjendra@quicinc.com>, <robimarko@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_shazhuss@quicinc.com>, Praveen Talari <quic_ptalari@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-18-quic_nkela@quicinc.com>
 <esl3zcntkewslcredif54venyopwgj2niruoeqcvbhqmbyt5qc@odixl23o7omk>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <esl3zcntkewslcredif54venyopwgj2niruoeqcvbhqmbyt5qc@odixl23o7omk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Uur1LjkVDPzDxrIosfw2P0DSrkNvBKO-
X-Proofpoint-GUID: Uur1LjkVDPzDxrIosfw2P0DSrkNvBKO-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_03,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290100


On 8/29/2024 12:41 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 28, 2024 at 01:37:16PM -0700, Nikunj Kela wrote:
>> Add compatibles representing UART support on SA8255p.
>>
>> Clocks and interconnects are being configured in the firmware VM
>> on SA8255p platform, therefore making them optional.
>>
>> CC: Praveen Talari <quic_ptalari@quicinc.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> ---
>>  .../serial/qcom,serial-geni-qcom.yaml         | 58 ++++++++++++++++---
>>  1 file changed, 51 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>> index dd33794b3534..dcd43e1353ec 100644
>> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>> @@ -13,11 +13,42 @@ maintainers:
>>  allOf:
>>    - $ref: /schemas/serial/serial.yaml#
> Please move entire allOf: to the place after "required:" block.
>
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sa8255p-geni-uart
>> +              - qcom,sa8255p-geni-debug-uart
>> +    then:
>> +      required:
>> +        - power-domains
>> +        - power-domain-names
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +          maxItems: 2
>> +    else:
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
>> +        interconnects:
>> +          maxItems: 2
>> +        interconnect-names:
>> +          items:
>> +            - const: qup-core
>> +            - const: qup-config
>> +
>>  properties:
>>    compatible:
>>      enum:
>>        - qcom,geni-uart
>>        - qcom,geni-debug-uart
>> +      - qcom,sa8255p-geni-uart
>> +      - qcom,sa8255p-geni-debug-uart
> Not compatible with the old ones? Well, it is impossible. Generic
> compatible like "qcom,geni-uart" means ALL DEVICES forever will be
> compatible, because otherwise it just does not make any sense.  Of
> course "all devices forever will be compatible" is impossible as well,
> thus DT maintainers are suggesting SoC-specific compatibles all the
> time, but if developers decide that they know the future, you should
> keep it, right?

Hi Krzysztof,

SA8255p uart is not compatible with generic ones. While I get your
point, could you please advise how to proceed on this? Of course, no one
could predict the future at the time generic compatibles were added but
here we are now with the usecase!

Thanks,

-Nikunj

>>  
>>    clocks:
>>      maxItems: 1
>> @@ -26,12 +57,10 @@ properties:
>>      const: se
>>  
>>    interconnects:
>> -    maxItems: 2
>> +    description: phandles of interconnect bw provider
> Constraints must stay in top-level.
>
> Best regards,
> Krzysztof
>

