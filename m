Return-Path: <linux-i2c+bounces-5928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A3896485D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 16:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85B091F25BBA
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 14:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70CC1AED4A;
	Thu, 29 Aug 2024 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mLtmXy4s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCAF18A923;
	Thu, 29 Aug 2024 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724941736; cv=none; b=W9qIF5D5hAVd0Y0cqJW0ng/CZm2cN+1UdKyDUu6BSSxOHVE1edIG5iqy5QmFIulfTC+heGu47FFzwAGJp7PiSfZg1xqnS5yNe9CdtUc1VXfRQya1B5VAM1WyVqHLk2+giwr0USVj9jshuPNdb+Ohpc+0GLLarDhkF5zmNmfeAvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724941736; c=relaxed/simple;
	bh=yT3mRjfIM0OdDbwoHheUBJqk+U+RkT/RMKRcx+iwFo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nMY4LxWV+hc+UNo+wPu8vmuFuStS+HO1NJyS1f8VuFDaT+saJHOMx24eQhosiam3fLvvOxwDbMReAkCwhPiBOJ+rBzH9YR6cIRIrF+lN0PAAK+e01loab/2HAoPnXYIGMrlY6aRp9gsfv/jKsxniQlKzJJ93o8jkq+MKwGMlW5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mLtmXy4s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8HO2g006314;
	Thu, 29 Aug 2024 14:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HiR8R1l9FYUc6oLxT9hgNdyItnh5VeVkPaY37HDghaw=; b=mLtmXy4sHsjzyJKL
	kjMWZw4pLB+lOCpkGogEnzS1JZizQ9nMWQeQaHOD+GIhIorDRNXvUZNui3IXpgtt
	2Z8wTuMA/yCWzJ8sNlWBB4FM5wjBnUGjYu3QwQ7k4tZcxyAzTjTIzBH6AZMROcJL
	fWSbSjECKw+bLBC+6ScUzh9I2nVGB3HOY5scpvPH/zISgqx+QqcnmqRe1iJYMDuH
	c13RBhaB7xxBHvr2tXF0crdgzdiPf+u8PkjFTH4Pq7Ya0nHL2DstUOt9GH0OnpQ2
	AYlw+d1gHz8zJpsWlBZkkN0l87DKrSDvVPf5/jDqI7E82zQ+t1u+jZGxHmQH61kG
	IvEQ8g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putwkmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:28:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TESK4l009805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:28:20 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 07:28:16 -0700
Message-ID: <e391c0b3-079c-48be-b343-f4e893f910af@quicinc.com>
Date: Thu, 29 Aug 2024 07:28:16 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/22] dt-bindings: spi: document support for SA8255p
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <sudeep.holla@arm.com>, <andi.shyti@kernel.org>, <tglx@linutronix.de>,
        <will@kernel.org>, <joro@8bytes.org>, <jassisinghbrar@gmail.com>,
        <lee@kernel.org>, <linus.walleij@linaro.org>, <amitk@kernel.org>,
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
 <20240828203721.2751904-19-quic_nkela@quicinc.com>
 <20240829030636.GA2208587-robh@kernel.org>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <20240829030636.GA2208587-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zTQiZl9rW-fdwfZRlmE7eoVSXEp3SXgE
X-Proofpoint-GUID: zTQiZl9rW-fdwfZRlmE7eoVSXEp3SXgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_03,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290100


On 8/28/2024 8:06 PM, Rob Herring wrote:
> On Wed, Aug 28, 2024 at 01:37:17PM -0700, Nikunj Kela wrote:
>> Add compatible representing spi support on SA8255p.
>>
>> Clocks and interconnects are being configured in firmware VM
>> on SA8255p platform, therefore making them optional.
>>
>> CC: Praveen Talari <quic_ptalari@quicinc.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> ---
>>  .../bindings/spi/qcom,spi-geni-qcom.yaml      | 64 +++++++++++++++----
>>  1 file changed, 53 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
>> index 2e20ca313ec1..74ea7c4f2451 100644
>> --- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
>> @@ -25,10 +25,41 @@ description:
>>  
>>  allOf:
>>    - $ref: /schemas/spi/spi-controller.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sa8255p-geni-spi
>> +    then:
>> +      required:
>> +        - power-domains
>> +        - power-domain-names
> blank line
>
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +          maxItems: 2
> Drop maxItems as 2 is already the max (with my change below).
>
> Add blank line here.
>
>> +    else:
>> +      required:
>> +        - clocks
>> +        - clock-names
> blank line
>
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
> blank line
>
>> +        interconnects:
>> +          minItems: 2
>> +          maxItems: 3
> blank line
>
>> +        interconnect-names:
>> +          minItems: 2
>> +          items:
>> +            - const: qup-core
>> +            - const: qup-config
>> +            - const: qup-memory
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,geni-spi
>> +    enum:
>> +      - qcom,geni-spi
>> +      - qcom,sa8255p-geni-spi
>>  
>>    clocks:
>>      maxItems: 1
>> @@ -45,15 +76,10 @@ properties:
>>        - const: rx
>>  
>>    interconnects:
>> -    minItems: 2
>> -    maxItems: 3
>> +    description: phandles of interconnect bw provider
>>  
>>    interconnect-names:
>> -    minItems: 2
>> -    items:
>> -      - const: qup-core
>> -      - const: qup-config
>> -      - const: qup-memory
>> +    description: names of interconnects
> No, keep all properties defined at the top-level and then add 
> constraints in if/then schemas.
>
>>  
>>    interrupts:
>>      maxItems: 1
>> @@ -61,15 +87,18 @@ properties:
>>    operating-points-v2: true
>>  
>>    power-domains:
>> -    maxItems: 1
>> +    $ref: "/schemas/power/power-domain.yaml#/properties/power-domains"
> Do you see an example of this anywhere else? No. You need:
>
> minItems: 1
> maxItems: 2

Thanks Rob for reviewing the patch. Will take care of your comments in
next version.


>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: power
>> +      - const: perf
>>  
>>    reg:
>>      maxItems: 1
>>  
>>  required:
>>    - compatible
>> -  - clocks
>> -  - clock-names
>>    - interrupts
>>    - reg
>>  
>> @@ -116,3 +145,16 @@ examples:
>>          #address-cells = <1>;
>>          #size-cells = <0>;
>>      };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    spi@888000 {
>> +        compatible = "qcom,sa8255p-geni-spi";
>> +        reg = <0x888000 0x4000>;
>> +        interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        power-domains = <&scmi10_pd 16>, <&scmi10_dvfs 16>;
>> +        power-domain-names = "power", "perf";
>> +    };
>> -- 
>> 2.34.1
>>

