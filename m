Return-Path: <linux-i2c+bounces-10418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC415A8B8BE
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 14:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 435FA18925A8
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 12:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F075423D299;
	Wed, 16 Apr 2025 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VU1/ZC8L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A31DC993;
	Wed, 16 Apr 2025 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805994; cv=none; b=j3sseqgQlYVm43vewRLh2pYr9yIbwDS3YiLKWM5smrA9Bh9zyYZfDIje8P7mWmC44IFhSxjBE/krXXlC8bKhFWYtSPuN8RZCIsjLLxCM/HhdOP87wLdvR6MKpcrbljy8Mt9ZkHXgFv/KF8MeFRGyC1zwAsAZ9zW350QTHb4E4Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805994; c=relaxed/simple;
	bh=wlsv5J0qW4q1s1lnmnmj+z0jm/VZfCrj2ndlMJV+Obc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LQ7eRFKRWqx2CFGzcOGPdRhV4Xc6OCr10Q0S1oNx9dst6ffS5aWmYT7c2hm5aBBFSAgI5luweRcemmJyLCUArOu/0IjbsRuZc3sWHpQodTlqMlaaZSq4utL4ut6I1CE3n05ccrwVwxkdLIj5WTJ4sP9aJSTLB2LimaFT7z2AHJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VU1/ZC8L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mHSV020781;
	Wed, 16 Apr 2025 12:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ty2KUrwiSGBBrNtXXT8zeDW5ZJOkxCadkpAPfFJqnv4=; b=VU1/ZC8LvkA+dI4N
	85gjqVuFEQPzkhTULLET96L5K6BMwDM6hS1u72LYJd1CoQd7yqix1/mCVbtQDQMA
	3Cp7KITTUIF49O6MDenlH+gXZo81QY7dGEhZuJQ2R3bobpPWun/+btkNIExsVCC3
	LpsSGla4vZL0/YMWg0GQ6dW1me26HXcG8AbUxMRH851OuJ11imBPW/mdKcylv4+x
	b4qaMdoyxKdX7e66EVS2L2Ns2OFzi1NyvLiRfex1aj2CUq/qJxPr1moHRvRmtc3b
	MJDhIh+x/3iFehaqrLTsvhANerUtC+YJWgrUSzOV/4dVtbZqVzn3Pj6ax/cunLWU
	bNHt5w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpu914-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 12:19:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53GCJlue020074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 12:19:47 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 05:19:45 -0700
Message-ID: <cf67e195-cb7f-4474-9f93-96030fe76e12@quicinc.com>
Date: Wed, 16 Apr 2025 17:49:42 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] i2c: designware: Use better constants from units.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti
	<andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg
	<mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20250416101702.2128740-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250416101702.2128740-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SCAJDX8oxWOUvbHlJ5k9pWH9k2xFPvon
X-Proofpoint-GUID: SCAJDX8oxWOUvbHlJ5k9pWH9k2xFPvon
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67ffa063 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=pOyD9p4RhXsQ4LtHtzEA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160101



On 4/16/2025 3:47 PM, Andy Shevchenko wrote:
> When we use constants in a time or frequency related contexts,
> it's better to utilise the respective definitions that have
> encoded units in them. This will make code better to read and
> understand.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index d6e1ee935399..879719e91df2 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -34,7 +34,7 @@
>   
>   static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
>   {
> -	return clk_get_rate(dev->clk) / KILO;
> +	return clk_get_rate(dev->clk) / HZ_PER_KHZ;
>   }
>   
>   #ifdef CONFIG_OF
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>


