Return-Path: <linux-i2c+bounces-9359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AACBEA2E504
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2025 08:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CF017A4525
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2025 07:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B681B87F0;
	Mon, 10 Feb 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Smp4c61J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B171B6CF5;
	Mon, 10 Feb 2025 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739170910; cv=none; b=gJ/6Zpy1mQE98tiv2uHx81t25kcWKkKqXQN8h0bJofKDfBB6AfXchr7nGrmbejzhT1WftgJjS7C9GKytyr4hJ+wosrKK0iFccL6Jw05f1LlprdV/0B0bcW3CRyYezdX2ZX4LflTzrrgmnzOTflIl/mZH97pDv4YbqfCadKiZY6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739170910; c=relaxed/simple;
	bh=97DBVZP6nZ1RKRthfd5Ef9bF1oc0ozFTh/YcAwjtOEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I04ba+V9z9kwsQuw6evNohZniDrNZ65WVNFoh4rOkMnMDwJvifab/dyz9pQ2zgohuIDoCaNOfWqWpiMWzYf4vj2Pt+jQuz6/NkW+0G/8tMAdgywLTvJqFfAbAHXwFeYaHcoY9un7+c4mRY88HyRZZxbVBtlEEsg2N9GGBSaEa5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Smp4c61J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519MJIIW026858;
	Mon, 10 Feb 2025 07:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2+5TsYHXFyoURscn4Apm5joBU+pUBcMjOrp94dzm1o=; b=Smp4c61Jt8O8OH00
	mPZh9Q/lNVdeoBmX8oeIFrg+ubu3FprmgRXx6fp4fpvV3++oP1EzMCTmRvufqsSq
	WW60WXo3rUQBkjkYF8vnJw7Ix4XQCmmn9OuSNYZwSGZ7hYebv6ojddyCnFUdB6C8
	10sMozzCN4lT7uQ63tzNlpWZ6vdSWicNvRoj+cL5kOwqalaLjQlFq6+MrEQEPrH5
	9Gvj9+8zrRebUFvR/5uOGkU53QiBzWj5yprQ8AgNPg/rRaoacLw0IXjIC3F0Y0+C
	0xL7dNs2cdKIzDcMUQp9SkIHmXNpWRQDwOIB8WjDJNCjK2T2K19Nx4tdfaa9Swsu
	ZJU5Gg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0g8ubqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 07:01:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51A71hR3001541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 07:01:43 GMT
Received: from [10.216.62.9] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Feb 2025
 23:01:35 -0800
Message-ID: <d54d1fd3-6b94-454c-aaca-3d4e43d6c178@quicinc.com>
Date: Mon, 10 Feb 2025 12:31:25 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: serial: Add support for selecting
 data transfer mode
To: Krzysztof Kozlowski <krzk@kernel.org>, <neil.armstrong@linaro.org>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <broonie@kernel.or>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <johan+linaro@kernel.org>,
        <dianders@chromium.org>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-5-quic_vdadhani@quicinc.com>
 <10060d39-87a4-4565-a2a6-80c93ac2266a@kernel.org>
 <dudqd2y42wy6iq2k73aphd5ol4mtq7z4c54zhd27rl745rrw5x@p3oummf2jke7>
 <374e16d6-46aa-4bdf-85e9-bc2e33c38057@kernel.org>
 <v5n7wn3saiymi2ncgi35drzdjfeaa4ng2ftia6ggex6oh74ocg@7vuskxosh726>
 <5f710113-08b0-468e-940a-2c65e8b42486@linaro.org>
 <01362821-ac7f-41d7-a4c1-b1f675e9f644@quicinc.com>
 <0efa70c3-dee4-4d0d-b106-d7083b5e68c3@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <0efa70c3-dee4-4d0d-b106-d7083b5e68c3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OwxZ3Ah_HU0nlOAsANqQhGzydYYEqlXp
X-Proofpoint-ORIG-GUID: OwxZ3Ah_HU0nlOAsANqQhGzydYYEqlXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100057



On 2/9/2025 3:49 PM, Krzysztof Kozlowski wrote:
> On 09/02/2025 11:11, Viken Dadhaniya wrote:
>>>>>>>
>>>>>>> Just one blank line, but anyway, this property should not be in three
>>>>>>> places. Do you really expect that each of serial engines within one
>>>>>>> GeniQUP will be configured differently by TZ?
>>>>>>
>>>>>> Yes, each SE is configured separately and it's quite frequent when
>>>>>> different SEs have different DMA configuration.
>>>>>
>>>>> Well, I checked at sm8550 and sm8650 and each pair of SE - which shares
>>>>> resources - has the same DMAs, so I would not call it frequent. Care to
>>>>> bring an example where same serial engines have different DMAs and
>>>>> different TZ? We do not talk about single QUP.
>>>>
>>>> Well, I don't have access to the latest sm8550 / sm8650 devcfg sources.
>>>> I checked the RB5 ones. As far as I understand out of 14 enabled SEs
>>>> only two are configured for the GSI DMA, others should use FIFO / SE
>>>> DMA. Same applies to the SM8250 MTP devices. Checking the RB1 / RB2
>>>> setup also shows 3 out of 6 SEs being set for GSI.
>>>
>>> I think selecting GSI DMA is only for devices needs high speed streaming
>>> to the
>>> device, like the touch screen, using GSI DMA for random small access is
>>> a non-sense.
>>>
>>> But the thing is, in the TZ world the configuration was static so we had
>>> no choice
>>> of using GSI DMA when configured, but now we have the choice so we could
>>> totally
>>> reconfigure the SE with the transfer type (FIFO, SE DMA or GSI DMA) as
>>> runtime and
>>> drop this attribute.
>>>
>>> So instead of hardcoding this, add a way to dynamically select either of
>>> the 3
>>> transfer types when firmware can be loaded from HLOS.
>>>
>>> Neil
>>>
>>
To exactly summarize:
GSI DMA and CPU DMA are mostly same performance unless we have
multiprocessor systems queuing the transfers
together.

GSI DMA to be used when multiprocessor systems (Application 
processor/TZ/modem/ADSP subsystems) has use cases together.
If only single subsystem or processor is using CPU DMA mode should be used.

Hardware guidance and configuration suggest that CPU DMA and FIFO can be 
switched but GSI DMA.

CPI DMA : Doesn't work with multiple subsystems.
FIFO : same as CPU DMA but < 64 bytes (FIFO_SIZE)
GSI_DMA: Work with multiple subsystems

Overall, there will be GSI and non-GSI modes. Dynamic switching is only 
required in PIO mode (FIFO and CPU DMA).

>> Yes, GSI DMA mode is required for specific use cases only.
>>
>> Dynamically switching from GSI mode to non-GSI mode is neither possible
>> nor useful. For each SE, the use case is fixed, and based on the use
>> case, the developer can choose the mode via the device tree property.
> 
> No, it cannot. Do not describe downstream as something set in stone.

Sorry, I am not referring to downstream but rather to the general 
process of mode selection.

Please let us know if you need more clarity.

> 
> Best regards,
> Krzysztof

