Return-Path: <linux-i2c+bounces-2736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F567896448
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 07:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E03EB225B1
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 05:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AA74D595;
	Wed,  3 Apr 2024 05:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GoXtO7Vv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2933A1870;
	Wed,  3 Apr 2024 05:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712123816; cv=none; b=Qe8tr+OFdhc+hFKhZvV3VfqpknvxvEqAsKZZKhyy0MKOrBSSxIkYanVO6DM2Cqh4CB9tIAtXOkWwzSbOTR9XfH2s0RJdts8PVGSzTnNUkjBqS/VKwltWSSuEh/KmXQvJop19glr3x4g+COQ/dCT7jijDKRKpHycgBwjQsQgLEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712123816; c=relaxed/simple;
	bh=1SHiij+ZVkWmkcRsHtsHy6EHB+og9wA1svshcDPXjog=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fNHPDiC0qcc1Usi5Mu5J/Y+T/31WgIK1pqXVkZ8OeJH9PuG0jbS+I1uTPg8K1TmZWJk9TfBcJvbywGavCEJg0gXJQWAWM+uy4lQbZt82Fuw/PRnTOYlEk80mYZyUedCDjRlx358S/VWnI+45tzsfk/CtqHDPkC23rrr99cDln0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GoXtO7Vv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4335nfd9020372;
	Wed, 3 Apr 2024 05:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bBWpql9YNcSzSsaBXGPIGlFx897DY1V9TTw2Z7sR13U=; b=Go
	XtO7Vv4N4X7km6mVAmHHWUgsmL/93Kn8H3S92Xaa9btoNRoGy8r71Xeof3DFxnH1
	t37a9NiwtcEKS6EG/t+idiXnu5ern6qrVbhL8XgdJ/lUVvb4VQQJOgF+vBFOEAqx
	m/zlblNSg14KD1Sih22VfQddKj4b8AdDrLibWxJX//MAF7z41hRro4yH++J4cTJv
	UL7HFHMfgacoVg8u5VBlsj7AW2+AlD9Si9caQjsjeDFaTxkyYnXl+JQCBXYrxUfo
	WJ7qcwdE7Zi4U3MoAWE9ab+rtrE2J4jQFkmeZd0Wm9aB4gX6DvcvdVTGKVL+Zoth
	slf2/Exl/6dtiTdI+NjA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8v3f8j8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 05:56:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4335uo6P022876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 05:56:50 GMT
Received: from [10.218.22.190] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 22:56:46 -0700
Message-ID: <669b516a-74c7-445a-b151-5463fe39b21b@quicinc.com>
Date: Wed, 3 Apr 2024 11:26:42 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Add support to share an I2C SE
 from two subsystem
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <dmaengine@vger.kernel.org>
CC: <quic_vdadhani@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20240402062131.9836-1-quic_msavaliy@quicinc.com>
 <51c84af2-73f7-4af4-8676-2276b6c7786d@linaro.org>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <51c84af2-73f7-4af4-8676-2276b6c7786d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c9hYjDh4pB5He_4GPI0EtGI50ze-svD3
X-Proofpoint-GUID: c9hYjDh4pB5He_4GPI0EtGI50ze-svD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_04,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030038

Thanks Konrad. I understood.

On 4/2/2024 7:54 PM, Konrad Dybcio wrote:
> On 2.04.2024 8:21 AM, Mukesh Kumar Savaliya wrote:
>> Add feature to share an I2C serial engine between two subsystems(SS) so
>> that individual clients from different subsystems can access the same bus.
>> For example single i2c slave device can be accessed by Client driver from
>> APPS OR modem subsystem image. Same way we can have slave being accessed
>> between APPS and TZ subsystems.
>>
>> This is possible in GSI mode where driver queues the TREs with required
>> descriptors and ensures to execute TREs in an mutually exclusive way.
>> Issue a "Lock TRE" command at the start of the transfer and an "Unlock TRE"
>> command at the end of the transfer. This prevents other subsystems from
>> concurrently performing DMA transfers and avoids disturbance to data path.
>> Change MAX_TRE macro to 5 from 3 because of these two additional TREs.
>>
>> Since the GPIOs are also shared for the i2c bus, do not touch GPIO
>> configuration while going to runtime suspend and only turn off the
>> clocks. This will allow other SS to continue to transfer the data.
>>
>> This feature needs to be controlled by DTSI flag to make it flexible
>> based on the usecase, hence during probe check the same from i2c driver.
>>
>> Export function geni_se_clks_off() to call explicitly instead of
>> geni_se_resources_off() to not modify TLMM configuration as other SS might
>> perform the transfer while APPS SS can go to sleep.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>> v1 -> v2:
>> - Addressed review comments.
> 
> The biggest one ("too many changes across the board") is still not
> addressed and the patch will not be further reviewed until that is done.
> 
> Each subsystem has different owners and each change requires an explanation
> (maintainers always "expect your patch to be wrong" and you need to
> convince them otherwise through commit messages)
> 
Sure, I got it. Will send patch dividing logically between i2c, dma.
I have already responded in just previous Mail to seek clarity as below.
It was :
"Please correct me if this is wrong. The overall change is for i2c in 
GSI DMA mode. This also requires changes in resource control like TLMM 
changes. But it's more like integrated feature.
Are you suggesting to make 3 sub-patches under same change ? "



> Konrad

