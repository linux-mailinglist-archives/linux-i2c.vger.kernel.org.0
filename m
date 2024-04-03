Return-Path: <linux-i2c+bounces-2737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F95896461
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 08:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AD17283E5E
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 06:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3125339E;
	Wed,  3 Apr 2024 06:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jdFvEb5N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E6B52F97;
	Wed,  3 Apr 2024 06:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712124568; cv=none; b=n5N9O4mim/S1pjQUPOxYJ7I+tX1c6jVXU5VD8LcrWk3DKJofwx8vuP/ohlEdnvCpnUVx+frFxZeac6adrcw9qRAFc79R16sUO6npa1A+bnu8GDrKRGDl6KCfAYYKOeCK6jPcvYp+V28izDTnpl4qOTAYk9iKNcnqjGLjmImLtPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712124568; c=relaxed/simple;
	bh=izMLc91bowDxW9Tjsy0vZYr3WyGkeX7InHMj70ZkfW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=swBzfpJV8QxKd0tRF+sw4AbOqRkWyzhxE+2bU5fpxx+cOh+l9Gg4Q/ogWGmV3d2VX7LiyPRxUk/GsAOa/XR5toWGuLpYb25i9L/dKRP11yQ9UJP7yfKkfQ8fvTTy/+t06S6iV/4DWp62wyzs7itv03NjUM+Eohf+UvZUQGzZBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jdFvEb5N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4332V7Y1032487;
	Wed, 3 Apr 2024 06:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=tw2EuVW7kGe2p0WIoxVHTmkZOIUejipnGI/ECyFl0rM=; b=jd
	FvEb5NExUHt1bPCKJan4UAJ3FAvrVuLrC6lpT/HKCu5p1ZCdYg0hoUwyndmDxVSl
	007hT+MIpsWQFdXbgTIwtNuSJHKN+mWKa6V+lu7pNFYJtXrvEPAcIf7Ey6mbG5fW
	36sBQhbTk9r0YFHhXW3vOjqTTlkahTZ6gdwOJzElRWCuIbvN/pQL6v10kFFGX0+J
	XAq23QQMl8vvhziZRmlWBwSSevsjlfhlyeS+B1mXAbs1TbI4Wj3ghYpwouJmfJ/t
	+n6/RU7B2TOXV6LuL5Pdd8TWMnC8EORbyBTiw9tS+ZPpevep+qMnHpIUTcA+PNE7
	e4muSDti6n+UqMxN1Gyg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8gn5jd92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 06:09:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43369Ld0004442
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 06:09:21 GMT
Received: from [10.218.22.190] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 23:09:17 -0700
Message-ID: <71ab7b0e-52bf-404b-9e0a-de73dbd36ad4@quicinc.com>
Date: Wed, 3 Apr 2024 11:39:13 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>, <wsa@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <quic_vdadhani@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
 <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
 <ZgbwJAb7Ffktf554@matsya>
 <a76mmz5xrfipqpmq2ltsyobwc54dyw2d55gb4vta5d746dwb3i@5mm2ew5uudi3>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <a76mmz5xrfipqpmq2ltsyobwc54dyw2d55gb4vta5d746dwb3i@5mm2ew5uudi3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y_Kc-J9ABGCLSP7LgPMkYDYgrFKQnBrJ
X-Proofpoint-ORIG-GUID: y_Kc-J9ABGCLSP7LgPMkYDYgrFKQnBrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_05,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030039

Thanks Vinod and Andi !

It had time and also there was a comment to get sign off from DMA 
maintainers, we have had review and discussion on DMA part too.

Hi Vinod, Since this is already merged, do you have preference to revert 
OR making a new change if any BUG OR design issue ? I can also fix the 
changes you suggest and raise a new patch in case of any real bug OR 
design expectations.


On 4/2/2024 10:14 PM, Andi Shyti wrote:
> Hi Vinod,
> 
> On Fri, Mar 29, 2024 at 10:15:24PM +0530, Vinod Koul wrote:
>> On 28-03-24, 08:36, Andi Shyti wrote:
>>> Hi
>>>
>>> On Wed, 13 Mar 2024 10:56:39 +0530, Mukesh Kumar Savaliya wrote:
>>>> I2C driver currently reports "DMA txn failed" error even though it's
>>>> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
>>>> on the bus instead of generic transfer failure which doesn't give any
>>>> specific clue.
>>>>
>>>> Make Changes inside i2c driver callback handler function
>>>> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
>>>> stores the error status during error interrupt.
>>>>
>>>> [...]
>>>
>>> Applied to i2c/i2c-host-next on
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/local tree
>>
>> You applied changes to dmaengine driver without my ack! I dont agree to
>> the approach here, we could do better
> 
> this must be an error from b4 ty. The changes have been added to
> 
> pub/scm/linux/kernel/git/andi.shyti/linux.git
> 
> branch i2c/i2c-host, As it has been agreed from very long.
> 
> Anyway, the changes are in -next. What do we do now? Do I revert
> it? Mukesh, can you please agree with Vinod?
> 
> Andi

