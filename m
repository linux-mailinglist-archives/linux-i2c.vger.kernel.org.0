Return-Path: <linux-i2c+bounces-6172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D2896BD4F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD5A1C2450C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBCD1DA604;
	Wed,  4 Sep 2024 12:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MqhyQPbl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117751DA112;
	Wed,  4 Sep 2024 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454601; cv=none; b=m3ttWSZic1s7ltQHws/t7omzd8rBHVAQrXugqq44SeiRoYuOE4RT5g/HTHzX8Zq1G/7PE6wnw8+/nGvChM1Luhe/5a3cgz0OuNQ7wucvlrX+zq8PEDHMQcIZKzbv0MVIBl2BUavTYrtB/jUjZvSosr/Gn0Y1cdTI0hFOjet1dCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454601; c=relaxed/simple;
	bh=Fcd0kIv4uj2fI5afUr2RryCvVF7W3IzIfmNvA2+jmSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X4wwW5X5Cge1/d5tGIUHdY6KNUiB6JwqzCOPtqK7Frim8jHHpfoeL6I2Z7h3YnvsYJgsILaOJhFVS0d8FjTIjgkQ0levhIc1j4S72BzGN5mbnCqp0Se+As0WM0o7Of0lFY/H9ddpH00Lq+B7Ky/CI5mD+0AcREtJM4hjUDIoY4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MqhyQPbl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4844XgV2010124;
	Wed, 4 Sep 2024 12:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTdFOttdYDceHeWEwHYIPqera0Ca+5hH3pwRFvVQhUs=; b=MqhyQPblpBCItf6E
	F5eJU5+fJp0dvplmcAa1JYnV4h2rq+wNi4cAjq07XtE6vv102eNt/ZGGI0P8PSsX
	+5X3caWCRtrwpjgehCsANP4GA41O7PC0bS+cMfXBZL3d3OQuXS0RYT9dxjpAOJ9q
	jkq68VAnXkSOyc8wCSACk2TcVSHlMTWNVEIAFrMwLlQxCMPpWkaR9oW3MSTzKZDQ
	hKCcCQ+ne+IqqLX1VVW/ZIOHYC1diBAQlREqQpPOfituMNokmpYetolAB7HD9qxi
	zFG40BkNGrMw55BIK+TOFFzV96J9Q+oYjE8nRE5sL90pkBe85lga6MUaZ5McF7ho
	RKoBsQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrh77f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 12:54:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484CsIFG002879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 12:54:18 GMT
Received: from [10.110.120.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 05:54:14 -0700
Message-ID: <6fed4714-5239-473b-b4a0-886d83c459c3@quicinc.com>
Date: Wed, 4 Sep 2024 05:54:13 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] dt-bindings: serial: document support for
 SA8255p
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, Praveen Talari <quic_ptalari@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-18-quic_nkela@quicinc.com>
 <jzpx66l4tesnyszmpc3nt5h7mezbvdhtcbls5rbwlmpveb6d6y@i3jf7jsajjjd>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <jzpx66l4tesnyszmpc3nt5h7mezbvdhtcbls5rbwlmpveb6d6y@i3jf7jsajjjd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1Hp_omeLx4zuoXLFAXoqUzJqKcCgxAme
X-Proofpoint-ORIG-GUID: 1Hp_omeLx4zuoXLFAXoqUzJqKcCgxAme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040097


On 9/3/2024 11:36 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 03, 2024 at 03:02:36PM -0700, Nikunj Kela wrote:
>> Add compatibles representing UART support on SA8255p.
>>
>> Clocks and interconnects are being configured in the firmware VM
>> on SA8255p platform, therefore making them optional.
>>
>> CC: Praveen Talari <quic_ptalari@quicinc.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> ---
>>  .../serial/qcom,serial-geni-qcom.yaml         | 53 ++++++++++++++++---
>>  1 file changed, 47 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>> index dd33794b3534..b63c984684f3 100644
>> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>> @@ -10,14 +10,13 @@ maintainers:
>>    - Andy Gross <agross@kernel.org>
>>    - Bjorn Andersson <bjorn.andersson@linaro.org>
>>  
>> -allOf:
>> -  - $ref: /schemas/serial/serial.yaml#
>> -
>>  properties:
>>    compatible:
>>      enum:
>>        - qcom,geni-uart
>>        - qcom,geni-debug-uart
>> +      - qcom,sa8255p-geni-uart
>> +      - qcom,sa8255p-geni-debug-uart
> Why devices are not compatible? What changed in programming model?

The cover-letter explains what is changed for devices in this platform.
I will add the description in this patch too.


>
>>  
>>    clocks:
>>      maxItems: 1
>> @@ -51,18 +50,49 @@ properties:
>>        - const: sleep
>>  
>>    power-domains:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  power-domain-names:
> This does not match power-domains anymore.

Single power domain doesn't need to use power-domain-names binding as it
is not needed however for multiple(in this case 2), you need to provide
names. I will add this property to if block and only keep maxItems here.


>
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
>> +allOf:
>> +  - $ref: /schemas/serial/serial.yaml#
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
>> +
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +
>> +    else:
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
>> +
>>  unevaluatedProperties: false
>>  
>>  examples:
>> @@ -83,4 +113,15 @@ examples:
>>                          <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
>>          interconnect-names = "qup-core", "qup-config";
>>      };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    serial@990000 {
>> +        compatible = "qcom,sa8255p-geni-uart";
>> +        reg = <0x990000 0x4000>;
>> +        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
>> +        power-domains = <&scmi11_pd 4>, <&scmi11_dvfs 4>;
>> +        power-domain-names = "power", "perf";
>> +    };
>>  ...
>> -- 
>> 2.34.1
>>

