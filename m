Return-Path: <linux-i2c+bounces-7620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A71F9B25A7
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 07:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F75F1C21125
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 06:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C213318E740;
	Mon, 28 Oct 2024 06:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HZub/aH6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464018E03A;
	Mon, 28 Oct 2024 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730097184; cv=none; b=HLA/WjjALhznMxYl2TcafE34uWQzVXqDjMmM1CDZjq83mNPMG+lPvz4oM+nLiCFAzSqLwUvOSVglUZiZqWXqBBWAusBPo47BIOFc05XfyJN094t0QN+wzDqcoB9sZyvoPzxyKF6i7Oivj7M4blvlcCq3IEzDhhfPK6MXcnzCzhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730097184; c=relaxed/simple;
	bh=ity0EV1cPoWLrXYrBVTHkxJKANEMtY3hhXvfBPvjxvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LijSUaMoH1Lz20mqe+NowLpDuiUjn6lR2ohUnqgY5TnFQLfbfaLsQ1vl5pAib561yh3Vea6D9Y9ohy19ER4FaDTWM2O7Ftu0gMHZHjCyWWJFqYiAcpKSeeWRnLxtmxV7iv9nmkE8rsWyo2AAZ7NiCoAxrdsK1zHSmbdy66Wk17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HZub/aH6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RLTlG1027417;
	Mon, 28 Oct 2024 06:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Qw+FLHj+Dl+u0+4sab+m9r1yUWuDHpofhdSqmcUwdE=; b=HZub/aH6YSeiNUzF
	Eoh3VuSS5E0+603jKcd6ekiXrvRWUPSuLq76LbPB1RdWhRHtl3mZlID7dTJV2U0k
	LhB5ccKtkr/GnSqnuiKETGFmlTs8BsACX0wSye/4a59IohmlBOE5o3VOE6+7a3iJ
	NHu27uvrp1i4BT889Py9ukBO6ZUN2yb/DKko5tvNWkkDCB+GxBsCFLR84KWyq2CK
	PA+BH6VtaY5Zfx5sGPZGMplfAPJEfb+lULHtrdZQuFuK/Kc+nug605aT6fuoHVM3
	NbYs63uYree8U0UWQs66A7NPrX9SweFLPrThomnxvOf3WpUEmh6f/iPY5+5alJlG
	5TnFWQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4uwew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:32:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S6Wr7O027687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:32:53 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 23:32:47 -0700
Message-ID: <f9c0a0be-6d2c-415d-983a-dec5d20a3ecc@quicinc.com>
Date: Mon, 28 Oct 2024 12:02:44 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] dmaengine: qcom: gpi: Add provision to support TRE
 size as the fourth argument of dma-cells property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Andi Shyti
	<andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-4-quic_jseerapu@quicinc.com>
 <333948f0-44ff-424a-8d38-5fba719d2aeb@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <333948f0-44ff-424a-8d38-5fba719d2aeb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -_0h1Dh-XhPoAyQTSsPZnKyg0t7ImVbX
X-Proofpoint-ORIG-GUID: -_0h1Dh-XhPoAyQTSsPZnKyg0t7ImVbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280053



On 10/25/2024 11:47 PM, Konrad Dybcio wrote:
> On 15.10.2024 2:07 PM, Jyothi Kumar Seerapu wrote:
>> The current GPI driver hardcodes the channel TRE (Transfer Ring Element)
>> size to 64. For scenarios requiring high performance with multiple
>> messages in a transfer, use Block Event Interrupt (BEI).
>> This method triggers interrupt after specific message transfers and
>> the last message transfer, effectively reducing the number of interrupts.
>> For multiple transfers utilizing BEI, a channel TRE size of 64 is
>> insufficient and may lead to transfer failures, indicated by errors
>> related to unavailable memory space.
>>
>> Added provision to modify the channel TRE size via the device tree.
>> The Default channel TRE size is set to 64, but this value can update
>> in the device tree which will then be parsed by the GPI driver.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
> 
> 1. Is the total memory pool for these shared?
Total memory we need preallocate and so for each serial engine this 
mentioned channel TRE size be used for config, go, dma tres preparation.
> 
> 2. Is there any scenario where we want TRE size to be lower and
>     not higher? Are there any drawbacks to always keeping them at
>     SOME_MAX_VALUE?
We are keeping minimum channel tre size to 64 to make sure that enough 
size is present to handle the requested transfers.
> 
> 3. Is this something we should configure at boot time (in firmware)?
>     Perhaps this could be decided based on client device settings (which
>     may or may not require adding some field in the i2c framework)
> 
This memory is for software usecase and preallocated prior to GPI driver 
allocated this memory to channels and events handling.

I have reverted the changes related to adding new argument for dma-cells 
property and instead used existing value for channel TRE size in GPI 
driver, which is 64.

> 
> Konrad


