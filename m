Return-Path: <linux-i2c+bounces-6168-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3785996BCF4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E828C280D83
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BC61D9D95;
	Wed,  4 Sep 2024 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CIhWxk6F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7081D9345;
	Wed,  4 Sep 2024 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454169; cv=none; b=OQd+RVTEqP58RivJLrv/j+HyspRdBOHSZgbdMfXNKPLveaiWrVOVsZJrfu/1Mb0pe80BWVHqCefAesSpHzatrU01WCbN/f5ID+kC8MPkGvW14nZ2tw/Mb1L5wqCsdge7YbTsqiqcjZc4ZbWqcAg+u7gUqrnluPiMWGDLafLvraU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454169; c=relaxed/simple;
	bh=azGb5AfJAgiTEYDuQyHOzUW0J1SqZRGExsvO7T/TmwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gDcO4ceqHCD3Pk/O0wpENLXj7iQUPolfR0r7NCrD+2FIgfirhMPLjNm5pLd8oAQETWJ4WT02IZPuSsMMaa8C4KI9NunJkAqiCD0+tt3wTWDmNcU46oRMgqolGbEV88L6fxbk5Wn23EpFjCerKGVhh6fy2dcw9tClVl+NLR7Q3TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CIhWxk6F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484AQ995011042;
	Wed, 4 Sep 2024 12:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drXNeLYBuC6sbfU/KpueXIJR614bjNyR90QeHlTxI98=; b=CIhWxk6FDSFZjc6U
	s4yNP2NWiicy4BWh7FRdjAM1oGV5bEt5Cix1X8r5M+OOVCWAuWgEd7suY3ezFo75
	lxx5TCCUNGtt+po2nNu6u3emICh526eLcsAtblWwAa+LxwNx+3uJ+MGxC20NdemZ
	OP1vSagT5NOtB+pxmifksCkjEX/ZYr7hBqDRRZOnO8c2dQyrrPPSZz6V9mbhfACA
	tbBotviD2HUeppvyVPo9GVi4eOouGm94No4AfUSBb8YyGK690uiU0Oq1GoSCB+7T
	ACKVEoolrynf+BenOfVGkdKS6JR1UZgBb0h5oPXadNEVvYhKVo61LRcYF/2Dy2Mn
	LCpPRQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buxfak5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 12:48:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484Cmdt9028666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 12:48:39 GMT
Received: from [10.110.120.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 05:48:36 -0700
Message-ID: <b369bd73-ce2f-4373-8172-82c0cca53793@quicinc.com>
Date: Wed, 4 Sep 2024 05:48:35 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
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
 <20240903220240.2594102-17-quic_nkela@quicinc.com>
 <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7EhcKdCr4xy2lalYszDfkLbRKP5Nk-Ng
X-Proofpoint-ORIG-GUID: 7EhcKdCr4xy2lalYszDfkLbRKP5Nk-Ng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040096


On 9/3/2024 11:34 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 03, 2024 at 03:02:35PM -0700, Nikunj Kela wrote:
>> Add compatible representing spi support on SA8255p.
>>
>> Clocks and interconnects are being configured in firmware VM
>> on SA8255p platform, therefore making them optional.
>>
> Please use standard email subjects, so with the PATCH keyword in the
> title.  helps here to create proper versioned patches.
Where did I miss PATCH keyword in the subject here? It says "[PATCH v2
16/21] dt-bindings: spi: document support for SA8255p"
> Another useful tool is b4. Skipping the PATCH keyword makes filtering of
> emails more difficult thus making the review process less convenient.
>
>
>> CC: Praveen Talari <quic_ptalari@quicinc.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> ---
>>  .../bindings/spi/qcom,spi-geni-qcom.yaml      | 60 +++++++++++++++++--
>>  1 file changed, 56 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
>> index 2e20ca313ec1..75b52c0a7440 100644
>> --- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
>> @@ -25,10 +25,45 @@ description:
>>  
>>  allOf:
>>    - $ref: /schemas/spi/spi-controller.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sa8255p-geni-spi
> Not much improved. All my previous (v1) and other patch (i2c) comments
> apply.
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
>> +        interconnects:
>> +          minItems: 2
>> +          maxItems: 3
>> +
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
> You have entire commit msg to explain why this device's programming
> model is not compatible with existing generic compatible which must
> cover all variants (because it is crazy generic).
>
> Best regards,
> Krzysztof

I will put more details in the description of the patch, though, I had
put the description in the cover letter for this entire series.


>

