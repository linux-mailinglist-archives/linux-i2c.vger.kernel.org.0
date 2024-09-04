Return-Path: <linux-i2c+bounces-6210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9782F96C664
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 20:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BB2E1F266EC
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 18:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DF51E503F;
	Wed,  4 Sep 2024 18:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NakPZ2Pt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D57B1E5030;
	Wed,  4 Sep 2024 18:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725474428; cv=none; b=f+AQiNfYX3O5qC3kRSxFaFDuVg9lkkZ4oUq34+4R1XdE+RkSh8Xi4XNNKUiYsY3BThQ5O6v9g8rIK4KF2oU/EdKbUfy2VSfd6fuRtxr7N7rJXgWPgQDlvmxvU5I5lU///TVT8sXZ9K8n0k9WIFOR/iPOwjMMIB14q2YC2viH3rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725474428; c=relaxed/simple;
	bh=AxuabCzX97feCzpb/68gmipCWnlZpmzIO6avHNJ3q54=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NhRwpfjAurw2NOceAX+MDjHpxUZPqkH/7Foc2kESbtK0VzdjfcSVRObLi8t9RajHGp1qmTy9dVNTTKDXfq4XneqMAOv0E0knkdwV1+w00Ir5V8FvrdVMkUk8VZQZI8ARwbqL8t3r4FWcCf4MjY8KgDf7i7hAP6FJA0M7PIRM8zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NakPZ2Pt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484GT7T8009464;
	Wed, 4 Sep 2024 18:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGJgJ0+SAXepCkH4FDpJ9l1jG20sfJFijM2xWFcXdXY=; b=NakPZ2PtfgZzxS9z
	c6x//WSQIVOWzfHqjxUp2jMb7BsIgKFgjhsACEF/7zUkkh97ons/DWIfzYJYNr48
	ZqR8qn3NI3SdD+aYEvJVYiEcQO55NVq3DvnSx7XzGxVq6yNkV5bJGNTik3jzHqYo
	QCYWc5J3hzj13Osm4DDgL+1Qmesih9SQqU23+h9iejB6QV7HVahK+tI4dEh9WFsX
	ZPWBZUhIYHjMHw67Ohow/83C5pS4byvKibnkBu42i79TeKHyOcKnDBwGpnNdCd6I
	PbV71AILv6QxswWceSIsrrR62E6/xnbUn16AIj4nkJinykIn013NYKJSJzJiVzjA
	pNS2zA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41e0bhmyaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 18:27:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484IR0rc002234
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 18:27:00 GMT
Received: from [10.216.2.237] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 11:26:56 -0700
Message-ID: <b739bcd2-3ba6-4423-8afd-e5200beb9ed9@quicinc.com>
Date: Wed, 4 Sep 2024 23:56:52 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <20240829092418.2863659-2-quic_msavaliy@quicinc.com>
 <9af7518c-45e5-44a2-bbb7-19ce7ed899c3@linaro.org>
 <b2cfda34-f8e2-4db2-b4d4-9c707bfc8417@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <b2cfda34-f8e2-4db2-b4d4-9c707bfc8417@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZfEEzO_-xAAMCJMrfBQgASLp5rp1IckD
X-Proofpoint-GUID: ZfEEzO_-xAAMCJMrfBQgASLp5rp1IckD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_16,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040139



On 8/29/2024 3:31 PM, Bryan O'Donoghue wrote:
> On 29/08/2024 10:58, Bryan O'Donoghue wrote:
>> On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
>>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>>> controller needs to be shared between two subsystems.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---
>>>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml 
>>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> index 9f66a3bb1f80..ae423127f736 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> @@ -60,6 +60,10 @@ properties:
>>>     power-domains:
>>>       maxItems: 1
>>> +  qcom,shared-se:
>>> +    description: True if I2C needs to be shared between two or more 
>>> subsystems.
>>> +    type: boolean
>>> +
>>>     reg:
>>>       maxItems: 1
>>
>> SE = shared execution ?
>>
>> ---
>> bod
>>
> 
> Serial Engines
> 
Sorry for short name. yes, SE = Serial Engine. I shall mention in 
brackets in next patch. Noted below TLAs too.
> This is a good example of defining TLAs
> 
> commit eddac5af06546d2e7a0730e3dc02dde3dc91098a
> Author: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Date:   Fri Mar 30 11:08:17 2018 -0600
> 
>      soc: qcom: Add GENI based QUP Wrapper driver
> 
>      This driver manages the Generic Interface (GENI) firmware based
>      Qualcomm Universal Peripheral (QUP) Wrapper. GENI based QUP is the
>      next generation programmable module composed of multiple Serial
>      Engines (SE)
> 
> ...

