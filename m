Return-Path: <linux-i2c+bounces-6165-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2B096BC72
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626711F262DE
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF1C1D9D90;
	Wed,  4 Sep 2024 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b9SuzB/J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CEE18A95E;
	Wed,  4 Sep 2024 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453199; cv=none; b=TS48a+muqFZ7vxqs3fwm9QB68vPWuoSwt3+Jh1jRA2Uazv/t4eFV36/JwqujJSHkDFKFnVn3kLtA4GQxLx0bYbkSHZ9ZZPhwpwq1K2+RjlTbalHpxr5I36pGndlABVrASHMJexqa61WlBtT3LY2qLtefDfL98vLPn90t6LdCJ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453199; c=relaxed/simple;
	bh=xa87nakc6XNq/4Neh8s4LIJHVttsOMH5ng2n83Z6g0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gGtxpx1DzKCNCubXZrlw0urWl2YjuBQ7TkEdGYlCojPRzgjR7yz9tCgeyLW506uz6cjSVFBnSf/4YkeAxTCirJc3l3cW9oFBfMzEc5zWI4z+TSQ+5uhCDfABXPDPKkIFC9xhucwl0L0mP/K5Y3aEfPRstSKKIjX50IIfCsDY14A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b9SuzB/J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4844XuRU010442;
	Wed, 4 Sep 2024 12:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACIP4yKZfQ7RqY1CWgZI/P153QRx9YXMYeXV5DGtfXo=; b=b9SuzB/J5IzF1PS8
	FOfFvufwok8TKEtvQ2ooAAcJ6/F94hfMq6l34zrocUdnk3SLZs3UgKN2B5/fGoUt
	Sqz2yTybzXT8IArJtFCjgXbBTauWhgON4YNO1T4b5N+g4s5/FhY0ARgS0SlmCk3Q
	OSiFIBj+8UI2DLOkfhYTVGKRepN+6y5nP9tgQm0NFFqrwNhQPDmfIJlKOQnMwrHV
	WHpjRdJJdq4wOcgHRCmiTHuh5d8h20kXFSlVv8p/AmmI126/id5RmuKE28Qw4H3H
	ocIRT72wy14B4JrkD2De6KH9WHBXvPtJVfB3pGxpcbTkmMuKzUJ2oWXJNXKsY+rm
	5dxJvQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrh556-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 12:27:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484CRUH4014575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 12:27:30 GMT
Received: from [10.110.120.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 05:27:26 -0700
Message-ID: <1b831fc1-9360-4038-91b2-b2c0cea513ed@quicinc.com>
Date: Wed, 4 Sep 2024 05:27:25 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] dt-bindings: cpufreq: qcom-hw: document support
 for SA8255p
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
        <quic_psodagud@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-15-quic_nkela@quicinc.com>
 <odg5ssqu2soaqp6m4rambj7qhqiyp7othkvu4v6fu6xtuhbdho@vccya6qcwgoz>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <odg5ssqu2soaqp6m4rambj7qhqiyp7othkvu4v6fu6xtuhbdho@vccya6qcwgoz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NbquHstL0bz40AbnilrRCvaiD2k-JG5t
X-Proofpoint-ORIG-GUID: NbquHstL0bz40AbnilrRCvaiD2k-JG5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040094


On 9/3/2024 11:26 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 03, 2024 at 03:02:33PM -0700, Nikunj Kela wrote:
>> Add compatible for the cpufreq engine representing support on SA8255p.
>>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> ---
>>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml        | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
>> index 1e9797f96410..84865e553c8b 100644
>> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
>> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
>> @@ -34,6 +34,7 @@ properties:
>>          items:
>>            - enum:
>>                - qcom,qdu1000-cpufreq-epss
>> +              - qcom,sa8255p-cpufreq-epss
>>                - qcom,sa8775p-cpufreq-epss
>>                - qcom,sc7280-cpufreq-epss
>>                - qcom,sc8280xp-cpufreq-epss
>> @@ -206,6 +207,21 @@ allOf:
>>          interrupt-names:
>>            minItems: 2
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sa8255p-cpufreq-epss
>> +    then:
>> +      properties:
>> +        reg:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +        reg-names:
>> +          minItems: 2
>> +          maxItems: 2
> What about interrupts? You need to constrain each of such lists.
>
> Best regards,
> Krzysztof

Interrupts are not required, I still need to put constraints for
interrupts? BTW, there is no if block for SA8775p binding in this file.

Thanks,

-Nikunj


