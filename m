Return-Path: <linux-i2c+bounces-7020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 561ED986DE2
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 09:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1C60B2381C
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 07:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28818224D6;
	Thu, 26 Sep 2024 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CuTEymBx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EDC18E361;
	Thu, 26 Sep 2024 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336594; cv=none; b=LzhsRJkGm9lhsIt02rS3CRIlZpu6F6IW2lfEMSz90Ac7owwBHjJw0asA8I+pMG6gK197kaThZJkQh1ztCOfEGJbB6wnGMLKS0iZbJ5KpFcPJkL7iZn/bEEzfSkvW6rq9dOi5RSMMqDU8A2otXTz4pN78pgFjMEVlLredl92wQ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336594; c=relaxed/simple;
	bh=M02+wGHzZHv7cXVW0yK/bFWEVFGdwkAKJk2ssJO3lt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eRcldZHbw0qLs7+0sBz8RGdHow4rOtxFpNKiOXiDMNk9vfl5yBSXbzZZmpnyjB4SQ6HUZoobznQybDgfxkuf58RyZCHfuRlDJvpBS4/DCeGAqJ98jWrS7ZmcO3PljKsWQCan75GuFtRCteMccPaVnsmQdRngVike2JmBBvJcpXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CuTEymBx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q7QKTU008220;
	Thu, 26 Sep 2024 07:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZfd325LM+9L2V+b1kGxKDA5JYHnuGiGHfzmQAqPFGA=; b=CuTEymBxV41opLOL
	CL5Vc+u2PNcESmYpjGo4q5oz3HhzReACHsRWPsfJYdS8D35GZaQrXL/p/NpcMWn0
	mXbjDPp/PtUFM0neJlHpaRAR1uLsfmt1Ie2GHfz/lZcJsWQSYj6yjQ5OOxc2mSDE
	iyB10SKFb6fV5gZVj7IgXeaymwXgrzwgiTLoxOFRg9m9u+4Z/kjV45NdwRaLmoaM
	TLV+whHkk3s0Dwi+FFlg4hmBmMZ5i0CAjw1l8cmEnll6I14zHEgsEOFs0l5gK/o/
	CTUSo63A9pvpEmYU7uIT8vCTKaEPSu3b9q7QnUfD/6RGEDR+A6x5AfusAZ6lI75+
	NqeJ2A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skuexpvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 07:43:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q7hAMq025120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 07:43:10 GMT
Received: from [10.151.37.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Sep
 2024 00:43:07 -0700
Message-ID: <66719d1d-71a5-429b-b3b0-84cfb3cf8ded@quicinc.com>
Date: Thu, 26 Sep 2024 13:13:04 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
 <732bdb12-a52b-4abe-8edb-afed44406011@quicinc.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <732bdb12-a52b-4abe-8edb-afed44406011@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9TYxtOGwuqT8tak2YR9yrhbtAQma3NWg
X-Proofpoint-ORIG-GUID: 9TYxtOGwuqT8tak2YR9yrhbtAQma3NWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260050



On 9/26/2024 11:44 AM, Mukesh Kumar Savaliya wrote:
> Hi Manikanta, My suggestion:
> 
> i2c: qcom-geni: Support systems with 32MHz serial engine clock
> [Derive i2c clock from 32MHz Sourced clock]
> 

As per Bjorn suggestion, i used this commit title "i2c: qcom-geni: Support systems with 32MHz serial engine clock".

> On 9/26/2024 9:13 AM, Manikanta Mylavarapu wrote:
>> In existing socs, I2C serial engine is sourced from XO (19.2MHz).
>> Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).
>>
>> The existing map table is based on 19.2MHz. This patch incorporate
> incorporate/s/incorporates

Okay, sure.

Thanks & Regards,
Manikanta.

