Return-Path: <linux-i2c+bounces-10028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF10A70FF2
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 05:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E238E7A5E04
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 04:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF5A4086A;
	Wed, 26 Mar 2025 04:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KbjRNdC9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07363CB;
	Wed, 26 Mar 2025 04:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742964376; cv=none; b=iTKPFZLNpLuyfONt4ZWSiOq8VsyM4e0CduszYQ7/GVHJcSK7/Pe1BskURoIYwNYn5UeIekDXxxzgA2gsvdPOCxoUCxYLrMfs9zGKvX8dgBztsYofiFVqZrc0QjTqzHJs1lk+nTJQxBGfmwNZo1Y68ur8ZSsZOZzv89F4mpTVnsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742964376; c=relaxed/simple;
	bh=Wcep9kaIOaUUIs55MqLF0K7L284XXKAQIiInb57Qzbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EuoGkVdYB6k9Odf/qk/QSUnxyfZLZjSNPYa9T7Q0al+o0Olycb4XVBuUeQgEan+j7G2r8mK2dymSyw5GS6dTWmUiJLxFlIh6J2kdYfJdtN2iaVcGErlIi3ss9dPUmLeeZFKzjcJJHpPaAOK4HznDiy2qcJJlQI3Cka8Nik1otkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KbjRNdC9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGahFA018583;
	Wed, 26 Mar 2025 04:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	weWf/etmMjUF0Qb0F8flw9F+ix2U8LpDumfAERq0wIo=; b=KbjRNdC9g+pJre7T
	8v4jMcyHIMePqKPaXihKmoO45L27P6ejDBpny+VfK5k4FJyoPVJ29NhB9BkhqIRC
	4YhftUvL/kqDLMpxY1ldfDgKgHwXawTRm48ESOsEbBaC/yuavIaM9kWz7s4UhjJQ
	N9Yl+Bvvz2EnBt3Ql5sT2wgi0YQ8p/4ONUOT7Fi2XfjikQvKWR8foXxv+ZphG4ZE
	64H8q3aQA3GM8nfVoDrs5OJ9RU+SC4XntoltuQ1Cv/H+IyBV7zqW2hSwOZ7Duo+Z
	Gkj9l5wl7o4SG+1gGQBI8k86bmWub4EWGnIlTp01tZ1lOxBzioiJw++vyOPXNsk9
	WpOZDA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9heu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 04:46:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q4k0He006920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 04:46:00 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 21:45:57 -0700
Message-ID: <4025b7b8-e4ea-4853-83d9-7f9fd0d0f159@quicinc.com>
Date: Wed, 26 Mar 2025 10:15:54 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] i2c: npcm: Add clock toggle recovery
To: <mohammed.0.elbadry@gmail.com>
CC: Tali Perry <tali.perry1@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Andi
 Shyti <andi.shyti@kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
 <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ujOo-8RAHsdOMXFr2ttSnhpHxo-yvLlT
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e38689 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=vFwDpYeKrAHsOwN9NGAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ujOo-8RAHsdOMXFr2ttSnhpHxo-yvLlT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1011 mlxlogscore=676 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260026


On 3/25/2025 2:28 AM, mohammed.0.elbadry@gmail.com wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> Hi,
> 
> During init of the bus, the module checks that the bus is idle.
> If one of the lines are stuck try to toggle them first.
> 
As such there is one file change and single patch. You may go ahead 
without cover-letter. Just my thought.
> Fixes: 76487532f797 (i2c: npcm: Add slave enable/disable function)
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
> ---
> 
> Tali Perry (1):
>    i2c: npcm: Add clock toggle recovery
> 
>   drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 


