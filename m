Return-Path: <linux-i2c+bounces-5929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80457964867
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 16:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0436C1F2665E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 14:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A17B1AED55;
	Thu, 29 Aug 2024 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kAK/k91b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37D1AD3F1;
	Thu, 29 Aug 2024 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724941764; cv=none; b=IjJ9CugfmiolIlKSILSbSDsDqwGCZ9xBezBIhfFbh/1euOXg0NV1eoURIuici07ZxYyk+6VPcJSz33LOvEvlfNmLJotFM4c06R0VIJEIGtjZ5jG2L5EWY/YpyCglp1dhspoGw5wtbQ4tkTnRSPE8MXtbxRWnYGDH4t6LJrzKZWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724941764; c=relaxed/simple;
	bh=EtZPE2CePCAzhLRHRFQb2qzvS/k5NMSLbjjJZWGY23k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=N947VHDnrIKIn8qyYS76eVXzXg6vjaUrbzqz+mUsA2EEZpPiOFtZXzMQdNDcbuTvntY6Wc5W6ov8gNSvdUt7LjfD6bZnztuZeOvC07N4YpzkK0qDGDe06z3hK6objZjkZDck4cvc/sHjP3plsA7hYZejTlqyruRtjbHjb2sI2Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kAK/k91b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8pX7h023318;
	Thu, 29 Aug 2024 14:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQ0bswqhk8lMj1tjHUnzz/9lNNC8rZHZTOxajfF8uS4=; b=kAK/k91bzA/q0FuJ
	rgknvk0zMnZKTqFlAht9WkIEdeGP7b3w57ba7KejrIOj3Xpxz2x6XIGOPgYb0pT6
	1zXZDcTjfvo12sCtstvbzPFVNFClLLT9cIMccvIbLW9+Phor8TJaBlhzSnSUyHKq
	sQTQ0b9wVq5+c9FqGHbfo6PUshm+7oMu22froGcyIc46C0Ib0EztiSZvHQFgYJah
	wHTiA4ReIJpTnzzPiEg8IzjiGLgzD+VvzjXQ9+FHv580ULAGEIhimrEAfXbalCE4
	hP3my5ScXIWc3yFWw6paIcM7fIB7On4CrLv9KkAl9a2JdNXrpBZY3wWCKsRfBmHS
	8R7J5g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41a612kd27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:23:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TENkYU011160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:23:46 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 07:23:42 -0700
Message-ID: <5ce821d8-ebf6-484c-9f0b-e78c227d799c@quicinc.com>
Date: Thu, 29 Aug 2024 07:23:41 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/22] dt-bindings: qcom: geni-se: document support for
 SA8255P
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
 <20240828203721.2751904-17-quic_nkela@quicinc.com>
 <zzznoxebkrksnpzmk55cff3wz5lhb7dd3qzcvtzkjjv2usmvbr@ebmlirkmahoj>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <zzznoxebkrksnpzmk55cff3wz5lhb7dd3qzcvtzkjjv2usmvbr@ebmlirkmahoj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sxqhH-kq4ndmC-gWA88KuXrw1QzJF9cu
X-Proofpoint-ORIG-GUID: sxqhH-kq4ndmC-gWA88KuXrw1QzJF9cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_03,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290100


On 8/29/2024 12:42 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 28, 2024 at 01:37:15PM -0700, Nikunj Kela wrote:
>> Add "qcom,sa8255p-geni-se-qup" compatible for representing QUP on
>> SA8255p.
>>
>> Clocks are being managed by the firmware VM and not required on
>> SA8255p Linux VM hence removing it from required list.
>>
>> CC: Praveen Talari <quic_ptalari@quicinc.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> ---
>>  .../bindings/soc/qcom/qcom,geni-se.yaml       | 47 +++++++++++++++++--
>>  1 file changed, 43 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>> index 7b031ef09669..40e3a3e045da 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>> @@ -22,17 +22,16 @@ properties:
>>      enum:
>>        - qcom,geni-se-qup
>>        - qcom,geni-se-i2c-master-hub
>> +      - qcom,sa8255p-geni-se-qup
> Same problems. If you decide to use generic compatibles, it means it
> covers all devices. Otherwise it does not make any sense.

Hi Krzysztof,

SA8255p platform is not compatible with generic ones. At the time
generic compatibles were added, no one thought of such platform will
appear in future. Please advise what should we do in this case?

Thanks,

-Nikunj

>>  
>>    reg:
>>      description: QUP wrapper common register address and length.
>>      maxItems: 1
>>  
>>    clock-names:
>> -    minItems: 1
> Huh?
>
> Best regards,
> Krzysztof
>

