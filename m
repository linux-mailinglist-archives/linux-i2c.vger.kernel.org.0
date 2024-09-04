Return-Path: <linux-i2c+bounces-6211-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 706D096C688
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 20:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 276101F268F2
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 18:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E3D1E200B;
	Wed,  4 Sep 2024 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hoSucu6f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB01E1A28;
	Wed,  4 Sep 2024 18:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475086; cv=none; b=N/zj79dZOWljlEkcxpBP4NI5gevgsI0VAWei/AZZzhetFc8yyEZFsvaEgR7b/TJ2df5VZW4TpyB9UfwK11aLbZp90/pTq8kcFMRQGM5ueBivygYsu7sAa7jWjBAB/i5QOxzykGlT8IZoI5CnqTqZ8Ig7+6mHBOVpGFmiPBbR9/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475086; c=relaxed/simple;
	bh=AcWu8sKW4kDUWqP0G3QOwYTH0/tt35LzUfawR4mfnVY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=VRJ+xSLt26qOQipcGiex4ZhCR4tS3V7r8TC94bhOMtbPP3Tr+PfzI0AZaLO4Rf218BTE+HUBHDjrCK45QU8vTtNDUEocjcPx1bTV2DjhKu1Yl9kgpZgogDG0sQt7QNn9bayMTZwAwxI5/2y5t4cguG8FgoEp/hkksWgDFlUicOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hoSucu6f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484Bg6nV005623;
	Wed, 4 Sep 2024 18:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H1BPb7eUiaYaxfaFKjSoBGM8+2mcCzsKnwFf5iq9PXE=; b=hoSucu6fbECG2ntF
	f6e8pb2Dc/E1Zmfv4NvaUovN4LI5EmqxC0qHh8r+GscuspP1/W/xoj/winr61B7n
	k6DwYfNVkGClu34H7it6ilFuHPHq5dCDOLWGI/JirOydJxB+lE0yL5VO8Qy62XrT
	RGbXFQekTZniu6+jx4RMZPhUgV2bJRAkrk0rLW6/VwaYn03MSMYkUUgHddHs7uqO
	hg65TZqTHNgpGSQXxN7u3e34OYOdgNVd03xbv0YECdi6R0YxKFBL5yjHfxLbkNoh
	Vd586S4mwbERmkcTB4YIlCdvUVf1LR0fdNvDEYXQO9MPvYnai1ux7ul+kNMtnkmu
	peH6Uw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41epwe14nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 18:38:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484Ic0fW021304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 18:38:00 GMT
Received: from [10.216.2.237] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 11:37:57 -0700
Message-ID: <c34b7612-054d-4d00-bdbf-8ff9a6d29551@quicinc.com>
Date: Thu, 5 Sep 2024 00:07:53 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
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
Content-Language: en-US
In-Reply-To: <9af7518c-45e5-44a2-bbb7-19ce7ed899c3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5-dH-rcY8C5duyPhEuCbAdysyHdyubcD
X-Proofpoint-GUID: 5-dH-rcY8C5duyPhEuCbAdysyHdyubcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_16,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040139

Thanks Bryan For reviewing.

On 8/29/2024 3:28 PM, Bryan O'Donoghue wrote:
> On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>> controller needs to be shared between two subsystems.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml 
>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..ae423127f736 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -60,6 +60,10 @@ properties:
>>     power-domains:
>>       maxItems: 1
>> +  qcom,shared-se:
>> +    description: True if I2C needs to be shared between two or more 
>> subsystems.
>> +    type: boolean
>> +
>>     reg:
>>       maxItems: 1
> 
> SE = shared execution ?
> 
Sorry for short name. SE = Serial Engine. I shall mention in bracket in 
next step.
> ---
> bod

