Return-Path: <linux-i2c+bounces-10071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6856A76490
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Mar 2025 12:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B2FB3A8420
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Mar 2025 10:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC941DFE0B;
	Mon, 31 Mar 2025 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MfKK/x1O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6821DF75C;
	Mon, 31 Mar 2025 10:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418416; cv=none; b=CFnuDBHwzVawOAxralZVfXOGKvs24V2+OeM0qhD2c3j4ic6EzBC8qgywGwIGaOGYQm42bPAx8PXYmEYV6NTxom12V75PoKxqPwNvwK3zwJIlNA9lAtshZ2gEvF5MuqjZCR8mBqYw1O6iUY95G/oeJQX0ODtPOWYp4AsJKzMfSDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418416; c=relaxed/simple;
	bh=NhwyardprVCmuw774cE4hr/od+EEP9VLqM9MW3h8zkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fPM7YXwmndzoEz7Vx+JGGHWYQp5M6nD57yCDZkM2bfWrQujSNOklw3FWQqRKQgshx5bOsoPP+0kUcH9P+k3mgyZVPKgCUJbnqzvGrKuB9C80RMSxj92LsnHrBt3jAxqxC+Hphw/7wd5C0hSxlZE7jw0F3QGbPQZXreN3FofHBOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MfKK/x1O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kch4007220;
	Mon, 31 Mar 2025 10:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lP4ZFq6O3GQ0rqen1PGXQQwqO4043MwrF85ueeiAh5k=; b=MfKK/x1OXCVzt3CF
	BKZdmaFsQQiJhfMjRKLLFru/rjWHeLnxU19yxOSR+CXirLJE8Zi9LAafZLsR2I/y
	33xpre5yOy0wI5cQfjZpSxph1K1YB82Z0v0ecs9Gz+82aMVkyjrVSsyXAif1H0H9
	5J+ImqhVxJ0eSQjcbvJwL/pywNNkW5b5Z64WkqTWHQT4v9rVP/9eByMgus9t7MvF
	ZDc8y70kpPVEMoe3/GG8Ud9TgUlSWuEl66xo+2eK7v83V2cpPZH5sdQZ3dThayi9
	yRa4M7jGva8g8XFOLglQ67lvMZGbB+hrbkTIInql5o7fdoK0rr7JgBzvtT33+YaZ
	oasfgA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9894ahh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 10:53:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52VArDYs009864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 10:53:13 GMT
Received: from [10.216.38.66] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 03:53:10 -0700
Message-ID: <5e659c8f-19ec-4584-b173-ba388f914648@quicinc.com>
Date: Mon, 31 Mar 2025 16:23:06 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] i2c: atr: Remove (explicitly) unused header
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Zijlstra
	<peterz@infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Luca Ceresoli
	<luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250331071646.3987361-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250331071646.3987361-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67ea741a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=k5inw1NC26jJ-vcA_Q0A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rChmuHYVYe4ffafdD_Va_NX2oBSepGO4
X-Proofpoint-ORIG-GUID: rChmuHYVYe4ffafdD_Va_NX2oBSepGO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=997 clxscore=1011 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310077



On 3/31/2025 12:46 PM, Andy Shevchenko wrote:
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
> 
> Note, that fwnode API for drivers is provided in property.h
> which is included here.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   drivers/i2c/i2c-atr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index 8fe9ddff8e96..783fb8df2ebe 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -8,12 +8,12 @@
>    * Originally based on i2c-mux.c
>    */
>   
> -#include <linux/fwnode.h>
>   #include <linux/i2c-atr.h>
>   #include <linux/i2c.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/property.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   


