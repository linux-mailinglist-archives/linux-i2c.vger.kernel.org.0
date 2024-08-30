Return-Path: <linux-i2c+bounces-5965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F9C9664B1
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 16:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E098B21504
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 14:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EC61B3B08;
	Fri, 30 Aug 2024 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B2dtcPaL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F33E1B2ED5;
	Fri, 30 Aug 2024 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725029787; cv=none; b=lAEvuG0rChGz1JeUQ5Jngm/gFigorkIHJI4uf9r9UafEiWnUsDCBYk/y+X0uZW2KdIf6Grx/49Dd2iXd/BkUhIpL1V41mHu3DVeXIVFkKr4Ad8S3OyI5B5+/JfB7gwBeegXD42Ew1YCcJhlXFPtaKV5VmQF6cCoa4QP/6Z4xgRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725029787; c=relaxed/simple;
	bh=HOSF8ykokzGj565EbQP8vVNTMTY1jPDC04y84KqAwBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QXpW6IXM99d4mLzrCq4fprHmLZXW8133uF0kDcm2wGq4/BnMd87r0WM6xG6JJTjLk6n7i8CFwnlq+0H7djQjGWm4LsF9X3xtczr2220QI29VidNJAg7IWpNUbBZQRMtL8vV8pknPa436qxuaYj9gsrKHwvj0zA1nwxBG0MB1GPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B2dtcPaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U84iKL007721;
	Fri, 30 Aug 2024 14:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sMOYdqpHR+jylrSdCdHY5P/j3IfMgumYyO5vaWdtRxc=; b=B2dtcPaLZAlSp4ta
	NmtwkNZJqMPxHlYWx0uU8eqz/oRVGNTS3PYaLq80IrUB5sekdlQs+6M/Hw+ZRKD6
	d+rtVQos2J/4xQTo6dPJVtCFPBcbcXZGCAKJBcX7ZSTAyCjGHwSjS4BlLyY1KD0z
	rgXnETJcdEk0LQTc3bypEwkptcB3M9kPhcAKXxcp2hqHprLDN4/Y0QkOPobclLnK
	MO+lCbG7SMGs8AMHnTMEdGP67pVEU7DvmnDSthpQMn68+WttPUve6HcEDEI8z3Fq
	+uNwsDq7DTezOpSZ9/78Qk3IosQKQTm0kXtLetNrsItOCfjy9U2XV3VHEVKbH1Jm
	VzVb9A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0h631-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 14:55:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UEtc23006572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 14:55:38 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 07:55:34 -0700
Message-ID: <b8cbaa23-ca1e-4192-a5d0-d0973916926d@quicinc.com>
Date: Fri, 30 Aug 2024 07:55:34 -0700
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
 <5ce821d8-ebf6-484c-9f0b-e78c227d799c@quicinc.com>
 <1941ebf9-8bcf-49f5-bf69-cb2c66435b9b@kernel.org>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <1941ebf9-8bcf-49f5-bf69-cb2c66435b9b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P8CHtT4ahaeWh1f5LR3CsMBwdiaWy7Zc
X-Proofpoint-ORIG-GUID: P8CHtT4ahaeWh1f5LR3CsMBwdiaWy7Zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_09,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300114


On 8/30/2024 2:58 AM, Krzysztof Kozlowski wrote:
> On 29/08/2024 16:23, Nikunj Kela wrote:
>> On 8/29/2024 12:42 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 28, 2024 at 01:37:15PM -0700, Nikunj Kela wrote:
>>>> Add "qcom,sa8255p-geni-se-qup" compatible for representing QUP on
>>>> SA8255p.
>>>>
>>>> Clocks are being managed by the firmware VM and not required on
>>>> SA8255p Linux VM hence removing it from required list.
>>>>
>>>> CC: Praveen Talari <quic_ptalari@quicinc.com>
>>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>>> ---
>>>>  .../bindings/soc/qcom/qcom,geni-se.yaml       | 47 +++++++++++++++++--
>>>>  1 file changed, 43 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>>>> index 7b031ef09669..40e3a3e045da 100644
>>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>>>> @@ -22,17 +22,16 @@ properties:
>>>>      enum:
>>>>        - qcom,geni-se-qup
>>>>        - qcom,geni-se-i2c-master-hub
>>>> +      - qcom,sa8255p-geni-se-qup
>>> Same problems. If you decide to use generic compatibles, it means it
>>> covers all devices. Otherwise it does not make any sense.
>> Hi Krzysztof,
>>
>> SA8255p platform is not compatible with generic ones. At the time
>> generic compatibles were added, no one thought of such platform will
> That's kind of obvious and expected yet these were added...
>
>> appear in future. Please advise what should we do in this case?
> I don't know. We keep telling - do not use generic compatibles, because
> you will have something like this, but people use generic compatibles -
> so what can I say? I told you so?
>
> Can we get agreement that using generic compatibles is a wrong idea? Or
> sort of promise - we won't use them? Or policy? I don't know, we can
> move on assuming this was a mistake 8 years ago, approaches evolve,
> reviews change, but I am just afraid I will be repeating the same to
> several future contributions and every time come with long arguments
> exhausting my energy - don't add generic compatibles.
>
> If devices are not compatible, I suggest different bindings.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

I will bring your concerns (raised above) to Qualcomm leads' attention.
Thank you for your feedback and support.

Thanks,

-Nikunj

>

