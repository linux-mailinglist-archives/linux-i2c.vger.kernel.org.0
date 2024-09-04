Return-Path: <linux-i2c+bounces-6195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F288396C061
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 16:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8D7128EDD0
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3508F144316;
	Wed,  4 Sep 2024 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OZ/aWonB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0361DA611;
	Wed,  4 Sep 2024 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459935; cv=none; b=UgbZdhI5z3lAUCIUPnqnHmXQD1WTtAtmy1Pdswcg6WHWzIsNdWQkoBoQ61fCSv3yE6psVEnFIaZOUxMTFyOm//OrB/U0OmTGm8l2305aHUKeAYGFou7lboH9S+nu3DZ0MFTAbWskT1WnhIh58gQvQy8LsFsM3efd+tROB7SNJ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459935; c=relaxed/simple;
	bh=yId2XFcDum53FDLUrvJJqxl53SGALFaHo7PGfKocJpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T27GqZ/gtVGQw8Bcl4lvU+804WIZ+pM38ElJWEhLx9AYWjY/z6peNWzw8r72QHyPiMbkGjvNd+c6kBrDvsGonZyhVbqbwvqm+fRiMyGz/7pfiURuuqSG8S24WnFMwlodKy2Y//ox8WAFOmeIvP8S0utaxULjxqHKHVgDlKUcaTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OZ/aWonB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48479q8J021795;
	Wed, 4 Sep 2024 14:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+HWRwR//pa8nxnPX/XXNKjHo7VyGMD3KsrkE9xrHQ8=; b=OZ/aWonBk+wqOZrE
	rVBOE33PX7sgoLNRXFUJrywo6mqjOsyT6hK1zRby/g2IM0zHh67VfBo+IKAsIfuO
	6Xi7dfLgfLpM/ofFVXImR0qO2frbBQJ6yA4kajMvC0hBPU1N4YPNyBEw5qBsXrJs
	2uYFq7wTQfZ8j0XjiJI/jXoq8t0+UnKHs73QJYUP3xsFYTJRfb+Eb/BbpXe5nutQ
	oeX+tsq5kr2xId75Uub7bgnnJM9NwBWE0vfdDEzHQ0PRBb4+82gJcTqDTdBkSWGG
	tSyM2sKheoI7p5bIFVUBZ+UXjZPz/vPUdBjRYEJfgVk0Wf5XX2ZfXbGzfBtV9e3B
	5oNZkg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy24ddn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 14:19:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484EJuD9018659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 14:19:56 GMT
Received: from [10.110.120.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 07:19:52 -0700
Message-ID: <c163149b-bdf1-423b-ab51-f734d00277fe@quicinc.com>
Date: Wed, 4 Sep 2024 07:19:52 -0700
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
 <1b831fc1-9360-4038-91b2-b2c0cea513ed@quicinc.com>
 <baf00e50-10b2-410b-9c56-713564a2d1b9@kernel.org>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <baf00e50-10b2-410b-9c56-713564a2d1b9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ehT9Yu2c61CM5jE4p6KmfozbRKh_7JF8
X-Proofpoint-ORIG-GUID: ehT9Yu2c61CM5jE4p6KmfozbRKh_7JF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_11,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=941 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040108


On 9/4/2024 6:17 AM, Krzysztof Kozlowski wrote:
> On 04/09/2024 14:27, Nikunj Kela wrote:
>> On 9/3/2024 11:26 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 03, 2024 at 03:02:33PM -0700, Nikunj Kela wrote:
>>>> Add compatible for the cpufreq engine representing support on SA8255p.
>>>>
>>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>>> ---
>>>>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml        | 16 ++++++++++++++++
>>>>  1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
>>>> index 1e9797f96410..84865e553c8b 100644
>>>> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
>>>> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
>>>> @@ -34,6 +34,7 @@ properties:
>>>>          items:
>>>>            - enum:
>>>>                - qcom,qdu1000-cpufreq-epss
>>>> +              - qcom,sa8255p-cpufreq-epss
>>>>                - qcom,sa8775p-cpufreq-epss
>>>>                - qcom,sc7280-cpufreq-epss
>>>>                - qcom,sc8280xp-cpufreq-epss
>>>> @@ -206,6 +207,21 @@ allOf:
>>>>          interrupt-names:
>>>>            minItems: 2
>>>>  
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sa8255p-cpufreq-epss
>>>> +    then:
>>>> +      properties:
>>>> +        reg:
>>>> +          minItems: 2
>>>> +          maxItems: 2
>>>> +
>>>> +        reg-names:
>>>> +          minItems: 2
>>>> +          maxItems: 2
>>> What about interrupts? You need to constrain each of such lists.
>>>
>>> Best regards,
>>> Krzysztof
>> Interrupts are not required, I still need to put constraints for
> It's irrelevant whether they are required or not. Each property should
> be narrowed.

So evenif we don't use interrupts property in our DT(patch#21), we need
to mention interrupts here? You suggest we put interrupts with maxItems: 0?

I wonder why SA8775p compatible is not in constraint list..

>> interrupts? BTW, there is no if block for SA8775p binding in this file.
>
>
> Best regards,
> Krzysztof
>

