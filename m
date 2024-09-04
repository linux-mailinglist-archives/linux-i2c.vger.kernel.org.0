Return-Path: <linux-i2c+bounces-6167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643EC96BCAA
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D2E32858FE
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1B51EBFEB;
	Wed,  4 Sep 2024 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NwSW2uSS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDFB1D88C0;
	Wed,  4 Sep 2024 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453705; cv=none; b=YyUbcdXkEbdzDQN5O7MsKElKrgjP5frkNaFexX0PNnDOYCaYrBaUgk+24rlobxazT4HaFICny6HccKkDoVrjkuG9OlHWU+1oIXuRvsxmo6s8VXFCMOl/M73BIMUz0/p8lm/OClqONiUH93cOcXbPX5DBFM/pyDbBGAn0GwD0yGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453705; c=relaxed/simple;
	bh=uN5W47xKqiofsiRvLQO9FgZG32WsSONW8PUWzSbP6NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TEFNLN5/eBSULhPU/9l86dgT5peHEF5hFMqeCrmuGNmAFcQcW8MC9g5flIEUBP4NFozikc9cfvVV75osRcR++Qtk8r1+EaD1aHuqlATNIdQkfY3bw+KfTNDX6RvNbnVcHcNTreDa2ivvo4V2JeORXOMtWw94zGN0sMowzrriu38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NwSW2uSS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484C1A6Q015388;
	Wed, 4 Sep 2024 12:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvnHrvOk02BNsBCgS1kD4aYGDPo30suEFW3uLxKtM4c=; b=NwSW2uSSUuAG7akB
	Q3GJEiSZMlKd963W2n9NL5Q3cctGTTLPe8zYwIrVyqOQv4Ih335M/gBDRkzkDZAi
	b0Q7oakZt7XUYN11S9Z4KSAyd+JYGEj4yXwUKxTK3WpLJmqO+XaROd01biwIB/YN
	eHlZZtK4xfz+SNXzr4ifPeE8Zv8xlAwq+LqBgeV1PRrWC+MuRHQgz3o1j/XT96cH
	/OmJXQBFJiBhyUz45vrGbJ7mqeWJi4s9jaTqyfWQf9k8ibPVY0cUi8/A578sJxUA
	VRTGzLqM5WAp91JFqIhFEnk1CebrvmaqHMya0qRA2Lte3OaPJzaW2aoS1HMPiN3L
	Jof2aQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dt69cuj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 12:41:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484Cf4LT023068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 12:41:05 GMT
Received: from [10.110.120.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 05:41:01 -0700
Message-ID: <06968d9d-0428-4fe8-8526-c91db3d9f0e7@quicinc.com>
Date: Wed, 4 Sep 2024 05:41:01 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] dt-bindings: i2c: document support for SA8255p
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
 <20240903220240.2594102-16-quic_nkela@quicinc.com>
 <xtguaoof7iblrtd2idsa2k4ml64qkttgliyijbeqw5thkdcbx3@jnm75a4wmbqd>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <xtguaoof7iblrtd2idsa2k4ml64qkttgliyijbeqw5thkdcbx3@jnm75a4wmbqd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CmrIEOmtqvMg8k9u_x-TRH3ehu6PryTp
X-Proofpoint-ORIG-GUID: CmrIEOmtqvMg8k9u_x-TRH3ehu6PryTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040095


On 9/3/2024 11:31 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 03, 2024 at 03:02:34PM -0700, Nikunj Kela wrote:
>> Add compatible representing i2c support on SA8255p.
>>
>> Clocks and interconnects are being configured in Firmware VM
>> on SA8255p, therefore making them optional.
>>
>> CC: Praveen Talari <quic_ptalari@quicinc.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> ---
>>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 33 +++++++++++++++++--
>>  1 file changed, 31 insertions(+), 2 deletions(-)
>>
> I don't know what to do with this patch. Using specific compatibles next
> to generic compatible is just wrong, although mistake was probably
> allowing generic compatible. The patch does not explain the differences
> in interface which would explain why devices are not compatible.

I mentioned in the description that clocks and interconnects on this
platform are configured in Firmware VM(over SCMI using power and perf
domains) therefore this is not compatible with existing generic compatible.


>  In the
> same time my advice of separate binding was not followed, because maybe
> these devices are compatible? But then it should be expressed...

Sorry, I missed that. You want me to use 'oneOf' expression with this
compatible?


>
> You have entire commit msg to explain what and why.

Will put more details in description.


>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..b477fae734b6 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -15,6 +15,7 @@ properties:
>>      enum:
>>        - qcom,geni-i2c
>>        - qcom,geni-i2c-master-hub
>> +      - qcom,sa8255p-geni-i2c
>>  
>>    clocks:
>>      minItems: 1
>> @@ -69,8 +70,6 @@ properties:
>>  required:
>>    - compatible
>>    - interrupts
>> -  - clocks
>> -  - clock-names
>>    - reg
>>  
>>  allOf:
>> @@ -81,6 +80,10 @@ allOf:
>>            contains:
>>              const: qcom,geni-i2c-master-hub
>>      then:
>> +      required:
>> +        - clocks
>> +        - clock-names
>
> So it is required here?

We are removing clocks from generic required list and enforcing rules
for all compatibles other than sa8255p.


>> +
>>        properties:
>>          clocks:
>>            minItems: 2
>> @@ -100,7 +103,21 @@ allOf:
>>            items:
>>              - const: qup-core
>>              - const: qup-config
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sa8255p-geni-i2c
>> +    then:
>> +      required:
>> +        - power-domains
>> +
> And possible here? I assume with the same clocks? The same for
> interconnects - same values are valid?

I guess I need to put here the same description as in the cover letter
to make it more clear. We are not using clocks and interconnects in this
platform in Linux. Instead, sending request to Firmware VM over
SCMI(using power and perf protocols)


>
>>      else:
>> +      required:
>> +        - clocks
>> +        - clock-names
> And clocks are required again?
Explained above.
>> +
>>        properties:
>>          clocks:
>>            maxItems: 1
> Eeee? So now all other variants have max 1 clock?

I will make if block for sa8255p up so else is not applied to rest of
the platforms.


>
> Nope, this wasn't ever tested on real DTS.

This is tested on SA8255p DTS and I ran DT schema check on SA8775p DT as
well.


>
> Best regards,
> Krzysztof
>

