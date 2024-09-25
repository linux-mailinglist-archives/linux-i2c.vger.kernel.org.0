Return-Path: <linux-i2c+bounces-6968-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 604569852E2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 08:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 914411C211F3
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 06:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431D61553A7;
	Wed, 25 Sep 2024 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LYlmOXiI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F295647;
	Wed, 25 Sep 2024 06:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727245398; cv=none; b=dH6tAVmpb89SZ518P9YlZDLbnvbiu4LIQCKtl+S7iIdU6d0ZBdS+lmHnq6ZHfWQO3C16h2NP/y6SCwIaF0CP6J/c0lmbwFx6O5RBKfqfQdT6heTPBBza6bn9mcJBof35k31QSehtF/hKO1is3KQVwRxAMUxf9c+k3gpCEOWeXbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727245398; c=relaxed/simple;
	bh=OPO4GfkZopm0NxOO+Qag+70lBkOTWWxYxIsSPWzoOj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sdwr4ZxVHtYP+RuA6t0d3YmLP+hDBH4aaW1BVKhpTSCqvYuUo0suB2KVxrrdV5GT+v+usFVNbEhlt2WgmhAhyxrpyKFrURPQXu4gkZ/+syKyqmSg8Hb55sYCwdecRV5IecsRL2aUWL/TM3sH4wb9X42LrxPIobeqbkgF4cOKdT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LYlmOXiI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHjGo9011775;
	Wed, 25 Sep 2024 06:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4/Ij+5raxYRNCITAjG8zZzaBBR3VWmVlE7fJcgTTlw=; b=LYlmOXiIhZ7CgINz
	mZPkB+Q48f6Pl0el4KkMsE3z81t7lLzCPfi/uvFxikpCDY7DkU+fdy9/12YFjcjs
	CrNs5qAmAqO5XUXyTNyFPOVY7r8g/Ba153htgZNcx/Fx54ENxX3a7mPhbG2UkXNP
	4ZVTQ3NssD8B4HTKTwEhghYlRZbmkpMVPU1gpSFKSWA851f9jAPrvHm3UlniX2OF
	kFfqTyqQ4tZgGidWSyqK95wAtri+y9ScWI8b1DzCRQrNLaRAbSyb/sGrZnJODtbe
	steZZ3rVbgCDykhLnsUt05Ps8Ihvbp5aimfRUqLxG6sQiw4KIkSYlECdq6p0TsU3
	JlaefQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph6u7a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 06:23:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P6NAvc030830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 06:23:10 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 23:23:08 -0700
Message-ID: <f42907f5-b870-4578-9d66-1fc97c725775@quicinc.com>
Date: Wed, 25 Sep 2024 11:52:59 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: qcom-geni: add 32MHz I2C SE clock support for
 IPQ5424
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
 <4de5ead0-0d66-4e57-85bb-cd8a6ca29fcf@linaro.org>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <4de5ead0-0d66-4e57-85bb-cd8a6ca29fcf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6a_v1a4iLYp6JpaHgMvbsC4YMkaxagwx
X-Proofpoint-ORIG-GUID: 6a_v1a4iLYp6JpaHgMvbsC4YMkaxagwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxlogscore=999
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250043



On 9/25/2024 11:09 AM, Vladimir Zapolskiy wrote:
> Hello Manikanta,
> 
> On 9/24/24 09:50, Manikanta Mylavarapu wrote:
>> The IPQ5424 I2C SE clock operates at a frequency of 32MHz. Since the
>> existing map table is based on 19.2MHz, this patch incorporate the
>> clock map table to derive the SCL clock from the 32MHz SE clock.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 212336f724a6..bbd9ecf09f4b 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -71,6 +71,7 @@ enum geni_i2c_err_code {
>>     #define I2C_AUTO_SUSPEND_DELAY    250
>>   #define KHZ(freq)        (1000 * freq)
>> +#define MHZ(freq)        (1000000 * freq)
> 
> pleae drop this new macro, please use freq * HZ_PER_MHZ instead of MHZ(freq).
> 
> KHZ(freq) macro should be also replaced by HZ_PER_KHZ, but it's a separate change.
> 

Okay, sure.

Thanks & Regards,
Manikanta.

> -- 
> Best wishes,
> Vladimir


