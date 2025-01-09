Return-Path: <linux-i2c+bounces-9005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E95D7A075DA
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 13:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A80A7A1749
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 12:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A898217668;
	Thu,  9 Jan 2025 12:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fkBHoY1X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514551E531;
	Thu,  9 Jan 2025 12:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736426270; cv=none; b=tpj+3W29336o5oyalYzZ5W4WlZF2RMuG2IccVbOrPntJidNbHseDfnuiZx2gBZzCUd+6oVEKXlFholLakromkduzFAAgf2EVCdzy98Jx2kvMJJIoeTdIVFo07sKRbSo4flzdrBiSHAfiJXJvSK+cu3L3xBNe6Y4+bvE6udUkenM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736426270; c=relaxed/simple;
	bh=wBEvPp+6ym9NHVCszd31Lb7q4+yZktU1wYpGEvJzfgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Phi6aVTPPbVmgSKfN5kSHWR1pbnJO0I373DGPZ2YpVue8roXBeX4VFrKEo9AtVDan3ZwuCxQ3XWfP2qiWOj6lXjPp6oUbVQaxKM4KOkm5o3AyBTywd3qpVedFZxo+6A531/Z/oUUYFUn2nh6/XNRsWLjGvtYxGjzi00zAWW6NJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fkBHoY1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094gdcF018333;
	Thu, 9 Jan 2025 12:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPfG7RdUu5wH4i/HyaERh1sXPvlqbbemmgHvrUfdTgY=; b=fkBHoY1XhG6pdnGG
	biabeN38CM9K2YomX9SDdwS1E0WZ9BCGKvDKoUPXMdvNwYnAQo2+FAZ6eFe2VFdj
	Op8yvTdANB9ej8qFxgSnYZltTxVsEkv0jRfuT3mUopOGbwmfg5xXx64tKGUcrhNi
	azv5m+jBFgHIX1CyjmOod0/bFRagzLfaRuRYiIh0hJ4qESMJ2AFP+QR0CVTzfL5l
	fzYDBPMnuAmBCuY6qjs0VUJvxqi7qSta6HoBW+GhZWA4Q6IGAqbw10wSoRots7fm
	QXsQX88YMwMndtxV/W/S6z10l6fqsTsTp3yYLpaNyaLBUqi5c8S56NXbpT8yBjSG
	4w7Gnw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4427nws2e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 12:37:42 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509Cbf7l021431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 12:37:41 GMT
Received: from [10.216.26.158] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 04:37:35 -0800
Message-ID: <cd2c9d3c-b2b1-49f4-a427-16592be1cf0d@quicinc.com>
Date: Thu, 9 Jan 2025 18:07:32 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i2c: tegra: Add Tegra264 support
To: Thierry Reding <thierry.reding@gmail.com>
CC: Kartik Rajput <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>,
        <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <digetx@gmail.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250108110620.86900-1-kkartik@nvidia.com>
 <20250108110620.86900-4-kkartik@nvidia.com>
 <fc239699-d3ea-441a-ab48-0191fcda09d2@quicinc.com>
 <37faddynpvhj7nfp5si26tajnuhb4cuzkf5gveqsl2ewuazcut@tpcp4b67gtae>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <37faddynpvhj7nfp5si26tajnuhb4cuzkf5gveqsl2ewuazcut@tpcp4b67gtae>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bM69nFFFzUQIApyAPaMo8z0cHiqzhdBh
X-Proofpoint-GUID: bM69nFFFzUQIApyAPaMo8z0cHiqzhdBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090100

Thanks Thierry !

On 1/9/2025 3:54 PM, Thierry Reding wrote:
> On Thu, Jan 09, 2025 at 10:13:48AM +0530, Mukesh Kumar Savaliya wrote:
>> Hi Kartik,
>>
>> On 1/8/2025 4:36 PM, Kartik Rajput wrote:
>>> From: Akhil R <akhilrajeev@nvidia.com>
>>>
>>> Add support for Tegra264 SoC which supports 17 generic I2C controllers,
>>> two of which are in the AON (always-on) partition of the SoC. Tegra264
>>> I2C supports all the features supported by Tegra194 I2C controllers.
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>>> ---
>>>    drivers/i2c/busses/i2c-tegra.c | 28 ++++++++++++++++++++++++++++
>>>    1 file changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index 7b97c6d347ee..cf05937cb826 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -1646,7 +1646,35 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>>>    	.has_hs_mode_support = true,
>>>    };
>>> +static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
>> I could see 7 controllers have been already added. And this may keep
>> growing.
> 
> I'm not sure I understand the concern here. This is IP that's been in
> use ever since the first Tegra chip was released about 15 years ago.
> It's quite normal that the list of supported hardware will grow over
> time. At the same time there will be occasional improvements of the
> hardware that require certain parameterization.
> 
yes, i understand it can grow with new controllers. Was trying to 
optimize the growing list with common fields.

Example: tegra30_i2c_hw and tegra20_i2c_hw has one field changing
from 20 fields. So was thinking after seeing this commonality.

One suggestion: can one structure be default and then delta can be 
overridden ?

No concern if no other way as you mentioned below.

>> Can we make either default set which is common for most of and change only
>> sepcific fields ?
> 
> It's difficult to do. These are const structures on purpose so that they
> can go into .rodata, so as such there's no good way to reuse defaults. I
> suppose we could do something like add preprocessor defines, but I doubt
> that they would make things any better (these are quite fine-grained, so
> macros would likely only cover one or two fields at a time).
> 
Sure. Let's wait for others opinion. I understand complexity.

>> Second option - read these fields from DT and overwrite default if it's
>> mentioned in DTSI.
> 
> Some information is already parsed from DT. What's in this structure can
> all be derived from the compatible string, hence why it's associated
> with the compatible string via the of_device_id table. Moreover, we
> cannot move any of this information out into device tree (at least not
> for existing chips) because it would break DT ABI.
> 
Got it.
>> Please review and see if this makes sense. what others say ?
> 
> I'm always open to suggestions, but I also don't see this as very
> problematic. It's data that is cleanly structured out, not difficult to
> maintain and doesn't take up a huge amount of space.
> 
I Agree.
> Thierry


