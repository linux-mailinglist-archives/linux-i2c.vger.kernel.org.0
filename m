Return-Path: <linux-i2c+bounces-8378-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B39E99F0
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 16:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5B2718817C0
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 15:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406F31BEF6B;
	Mon,  9 Dec 2024 15:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c/YCBUdV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A51A23B7;
	Mon,  9 Dec 2024 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756545; cv=none; b=YZfZGnKaQ1ODXOfJwXGAIMHSKY2KkWlDjTmRBsUHFNubRTrvV3bz9fOXZbHUGFFBo/4fAU8TVHMKOrgbSn6OjeTzSrZCd9kVpqYjUn+1BRwxLdGT5x9wsTZyimknZehin6+tOGIARQC5Fsg9gN2Q8H+SIwKCuKcG3jpJeH+p3sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756545; c=relaxed/simple;
	bh=dKlPGxYkwTD/3sIxuE9y+LM1/E1cOyuiFi5A6mgj4nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QqMOrTRWFmoP2TkyGlKy6qwIGseLBQhvUSVlSUl5XZhV82zL5CAD4UMTmTBtCTpsgWDj/hs+vEX5xV76FrqcHjew7tuxa0Uxk8+2QCE3e4atnVyVXGbe5dKLnNlF8mB1Z1OfGw6Xqr1p/lK4BtZAgUUPWUCve5FT6Gr8V5YPVJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c/YCBUdV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9AXCM4003487;
	Mon, 9 Dec 2024 15:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmbJmFBmY5oCW22GTFiwaIUH94lWuVHWFqeXe2H6j60=; b=c/YCBUdVUEskN3qa
	Ou19cT7IXGamBIjGl4HxR8GqPJcz1j3dRK9u17+FkBKju3XV0EKGuXe9Dt3me+Z2
	EnxUC2zvZbLpixMNINcxjawARr3kC1SHhxVQXMGL1D9llrgemkFYsdIp195yspBg
	k1qChwWT5SwzxIwG8oEjuGmHKlcT8wrqM7wcQshPLSj951pNPshApvQLnPPH/wgJ
	UrCcwWwxsH8UdXHiahVFvOnb2vU8UFzk/QYZ+RRq71HFZ08X0VSJTWgV/c6NbtR8
	kkxGrSlS+Uh4Zb/ojeveMyYxgh6VlFf58FN3GeARnXzL+IxPWgiNQtsQyEDp6LJR
	s3KZGw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw40xf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 15:02:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9F24n7026925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 15:02:04 GMT
Received: from [10.50.34.16] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 07:01:56 -0800
Message-ID: <e7b4f266-c2dc-4253-a3e5-53716ef006bd@quicinc.com>
Date: Mon, 9 Dec 2024 20:31:51 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
 <db428697-a9dc-46e1-abbe-73341306403f@kernel.org>
 <a8b1ccd2-c37b-4a6f-b592-caf1a53be02c@quicinc.com>
 <fc33c4ed-32e5-46cc-87d6-921f2e58b4ff@kernel.org>
 <75f2cc08-e3ab-41fb-aa94-22963c4ffd82@quicinc.com>
 <904ae8ea-d970-4b4b-a30a-cd1b65296a9b@kernel.org>
 <da2ba3df-eb47-4b55-a0c9-e038a3b9da30@quicinc.com>
 <a7186553-d8f6-46d4-88da-d042a4a340e2@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <a7186553-d8f6-46d4-88da-d042a4a340e2@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fcQXGs8dm37uCG8CvS2f-oOGki1Xx-KR
X-Proofpoint-GUID: fcQXGs8dm37uCG8CvS2f-oOGki1Xx-KR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090118



On 12/2/2024 7:34 PM, Konrad Dybcio wrote:
> On 2.12.2024 1:55 PM, Mukesh Kumar Savaliya wrote:
>>
>>
>> On 12/2/2024 4:34 PM, Krzysztof Kozlowski wrote:
>>> On 02/12/2024 11:38, Mukesh Kumar Savaliya wrote:
>>>>>
>>>>> Come with one flag or enum, if needed, covering all your cases like this.
>>>>>
>>>> Let me explain, this feature is one of the additional software case
>>>> adding on base protocol support. if we dont have more than one usecase
>>>> or repurposing this feature, why do we need to add enums ? I see one
>>>> flag gpi_mode but it's internal to driver not exposed to user or expose
>>>> any usecase/feature.
>>>>
>>>> Below was our earlier context, just wanted to add for clarity.
>>>> -- 
>>>>    > Is sharing of IP blocks going to be also for other devices? If yes, then
>>>>    > this should be one property for all Qualcomm devices. If not, then be
>>>>    > sure that this is the case because I will bring it up if you come with
>>>>    > one more solution for something else.
>>>
>>>
>>> You keep repeating the same. You won't receive any other answer.
>>>
>> So far i was in context to SEs. I am not sure in qualcomm SOC all cores supporting this feature and if it at all it supports, it may have it's own mechanism then what is followed in SE IP. I was probably thinking on my owned IP core hence i was revolving around.
>>
>> Hope this dt-binding i can conclude somewhere by seeking answer from other IP core owners within qualcomm.
>>>>    >
>>>> IP blocks like SE can be shared. Here we are talking about I2C sharing.
>>>> In future it can be SPI sharing. But design wise it fits better to add
>>>> flag per SE node. Same we shall be adding for SPI too in future.
>>>
>>>
>>> How flag per SE node is relevant? I did not ask to move the property.
>>>
>>>>
>>>> Please let me know your further suggestions.
>>> We do not talk about I2C or SPI here only. We talk about entire SoC.
>>> Since beginning. Find other patch proposals and align with rest of
>>> Qualcomm developers so that you come with only one definition for this
>>> feature/characteristic. Or do you want to say that I am free to NAK all
>>> further properties duplicating this one?
> 
> I'm not sure a single property name+description can fit all possible
> cases here. The hardware being "shared" can mean a number of different
> things, with some blocks having hardware provisions for that, while
> others may have totally none and rely on external mechanisms (e.g.
> a shared memory buffer) to indicate whether an external entity
> manages power to them.
> 
I agree. Also i checked internally with UFS team and other peripheral 
core. Not heard of core being shared the way SE is being shared.
> Even here, I'm not particularly sure whether dt is the right place.
> Maybe we could think about checking for clock_is_enabled()? That's
> just an idea, as it may fall apart if CCF gets a .sync_state impl.
> 
I feel DT flag is the only way as one or other way this leads to some 
need of prior knowledge. in case of using clock_is_enabled() kind of 
API, we still need a flag to keep the clock enabled. By the way, we keep 
pinctrl only enabled for shared SE.

Please let me know if the given binding can be improved further OR this 
looks fine ?
> Konrad


