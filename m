Return-Path: <linux-i2c+bounces-6173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B99096BD5E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99F531F26938
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288461DB536;
	Wed,  4 Sep 2024 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O0QF9M3E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C91D88CC;
	Wed,  4 Sep 2024 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454620; cv=none; b=WkH+tw2YC1cHOghKwUdgdSciMsVbpnOn+vL9M4DxM+DB+pidsIOr6yITmEbbdJr5NidJz5ZsU4u2xPVphDDvl3GiHTYIypV41T+S1CWQ3a1sAwX1YEsUOl0ayc1FEvppK5axgOuVztw44RfNtjmollg8KvQER45QX5Z/DUhqVCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454620; c=relaxed/simple;
	bh=wMuz/yHSOeQnGRwmUte07k6KL4Jpdqqu0VGa+SJw7oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DJ+VnPrPYbOOX76c+0G5RBLQnXECMYANjN+aaKG7miuPG5T/poPJjNG2NKnf4EuHfHfIyNLdFR9TrHoZFoBgVxctNqdc8bJhporQIDoU/KloFYdGtWNUxnmQ+rLZp2hG82dSS9W5vltxi7cuhW4VsxtdwqEaRVa8AugikaHzhqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O0QF9M3E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484B7eIB010562;
	Wed, 4 Sep 2024 12:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lWsJOKrtYOtMLpjkVEgXvDSjNg2OYftc4eM9GT6EFA4=; b=O0QF9M3EzEzUZbiD
	rTJNm4LIoyFbfqffGMGLp4bzgnpN+YpCj91Xlo4SX08yqB0Hg1Yy0V4WjRgQXIUV
	4rqM5BKUe9toE0VC98jzD2NbjRXAsGj9xLhZAWFxDJsNKlbNj5geNPhDwejrSAMU
	D6asEzx3erjLzvnG7cqYrjdodcF4v229a36moT2hZKFTQ+yHTDJJTPf01rjDo3GY
	8pHItxVHkv/oXO+esnZl9Tc+QzJlMqqMVBFCj/kFhWvABEjQZpiCCtqJUgGlyPqf
	t5XrzfapwOasIeNqsk84mXXxoyfOBOxzHZCkfIlNrf0ah4GqIg6UHbeVKNkIaIn/
	WTVvMQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buxfakpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 12:56:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484CuSmB017921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 12:56:28 GMT
Received: from [10.110.120.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 05:56:24 -0700
Message-ID: <634ab05e-3b8c-4cc1-bf23-0c68c1d28484@quicinc.com>
Date: Wed, 4 Sep 2024 05:56:23 -0700
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
 <db4cb31f-b219-4ee8-b519-fdec7f7b8760@kernel.org>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <db4cb31f-b219-4ee8-b519-fdec7f7b8760@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 56I2SLtd3gnT1WeUGucUYjLKMtSJHPRc
X-Proofpoint-ORIG-GUID: 56I2SLtd3gnT1WeUGucUYjLKMtSJHPRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040098


On 9/4/2024 12:47 AM, Krzysztof Kozlowski wrote:
> On 04/09/2024 00:02, Nikunj Kela wrote:
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
>
> Anyway, the entire patchset is organized wrong. Or you sent only subset.
>
> Where is the driver change? This cannot work. To remind bindings go with
> the driver (nothing new here).
>
> Best regards,
> Krzysztof

The driver changes will soon be posted. They are being reviewed
internally. For a quick look on what is coming next, you can refer to
CodeLinaro git repo[1]

[1]:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/nkela/sa8255p_v6_11_rc2?ref_type=heads



