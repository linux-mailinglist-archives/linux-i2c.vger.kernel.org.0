Return-Path: <linux-i2c+bounces-9174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DDFA1B4CA
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 12:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F2057A3CCA
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 11:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8922C21ADAB;
	Fri, 24 Jan 2025 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="paktOevl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B782A1E495;
	Fri, 24 Jan 2025 11:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737718446; cv=none; b=RxiWvIDtefmm0CGRE8B8yIz1WC3MwU2fdSn3mDYlsVmTuJ4YlyEZ9WSKehTe4FyEcggJg+AuQnqnAmrcMFYBfg0EZUaVathWpb8c3YTF8PEE96MMMzjUyUXQD3cd60UES7/UbDkKif03veCQPvq3FoEpnfOymhzO2MjRCJQ5/1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737718446; c=relaxed/simple;
	bh=3MyUNDpr3koth/P8JNvvsL7HHPSxoQMcEhW8HW0ilQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=flnaJWUfdPvVP51jDySfEtJmpv4VybD93mfNH3LyRGsd2VVerp6nR8oXMMHxj1fSPl5zvrjfblnhy1kUQXb5vaMbDVbbK4AWVs+vEQ0gecZGWFU0R512DCEqCXtcp0TibNZztF/YQeAmfnCdFjtIswQ2DiI/gMa3xFLfQ4RtjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=paktOevl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O8bk1s031357;
	Fri, 24 Jan 2025 11:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kT6AY6AU9dpDSLY7gkRI/8i4kr9v+2p4rKBxbqIzUDA=; b=paktOevlOkKWn5fM
	8w715QqA4mmR3fmZHPzvcTX5TTMMpTVUifLN3P5T950wjPAzN7kFWdmQ6BMSdO9x
	qGXhdA6WIwbMCri7Obf00rt7e53xF4J2nfsSyex4SuVXH1nSoCbYPO94vunsa0p6
	gccEJKh7bGalwG7nKIjFoHl26irl5BbLtUDy5UHWxgS6bjSaIqiqSFB5ApNIWMVK
	0yiHTh3KS8XaHvkGmIzaphw1eeL1SK/dgAUxVUehNm56Ew4R3QhPsR34WWu1bw8b
	k/z1MRznBV/yJEtxRyUta0Y2lrKDhFUVZkPvWmwG9dxVP71Fm4aAxrcwO57Rgo19
	r/0jJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c7h50hx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 11:34:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OBXxbA018064
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 11:33:59 GMT
Received: from [10.216.19.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 03:33:52 -0800
Message-ID: <6f701744-6a63-498e-9300-6458639be336@quicinc.com>
Date: Fri, 24 Jan 2025 17:03:30 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: qcom: geni-se: Add 'firmware-name'
 property for firmware loading
To: Krzysztof Kozlowski <krzk@kernel.org>, <andi.shyti@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <broonie@kernel.or>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-2-quic_vdadhani@quicinc.com>
 <df91c8f8-d6b2-4406-8a61-9e9db959fc59@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <df91c8f8-d6b2-4406-8a61-9e9db959fc59@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 709IaQK_5Hpil_u6nP-_xXsFhKXxctif
X-Proofpoint-GUID: 709IaQK_5Hpil_u6nP-_xXsFhKXxctif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240084



On 1/24/2025 4:30 PM, Krzysztof Kozlowski wrote:
> On 24/01/2025 11:53, Viken Dadhaniya wrote:
>> Document the 'firmware-name' property in the device tree bindings to
>> support loading SE (Serial Engine) firmware from the protocol driver,
>> allowing for more flexible firmware management.
>>
>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>> index 7b031ef09669..3e029d4d6f58 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>> @@ -54,6 +54,10 @@ properties:
>>   
>>     dma-coherent: true
>>   
>> +  firmware-name:
>> +    $ref: /schemas/types.yaml#/definitions/string
> 
> 
> You work on outdated tree. Just look how other bindings are doing this.
> maxItems instead.
> 
> 
> Best regards,
> Krzysztof
> 

Sure, Will update in next patch.

Thanks
Viken

