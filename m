Return-Path: <linux-i2c+bounces-6981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 298299856D7
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 12:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEA44B231A3
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 10:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489B315884A;
	Wed, 25 Sep 2024 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EIx8CRsr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394414AD19;
	Wed, 25 Sep 2024 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727258602; cv=none; b=o/EkHnnU2rC4myZtctkOi2uYSB4JqkVzfIMAS6OsAG0hxPEuCy/qcyAkrmyXvkH1xZdF8gF5VOIGFyD3v90vpPw9j3A9ev5aB9BUGR8kFUXIBjjAeh5jbd4LiE8t4J+ehZPIHaUK7PVUm4tPdhJSLyjrDKdcOBq4d/nKTBMXuCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727258602; c=relaxed/simple;
	bh=s69keboGUHlf+37suSvqT/iA9rvuScu1jAYxi7Zyhco=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xo0JYFXJPJIRLuWECF4CSZypeoo1NHBGwbDsqDR3aE/VqSZFB6/ST76VS4/AaxzkNGLkkJNodAVn4Hmfc347XUobqrIdbgWs8zhxiSWUAZHf+1jIDDk5z8t0bGSPcOuSFw/AScgWAmUTxCKQK6uhpKpa3TZcKje/DiakS/pbsqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EIx8CRsr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P87bBk018305;
	Wed, 25 Sep 2024 10:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzeeDzU6j91DwviPpW+hSy7uQOfEknfDQi0UVxNov9Y=; b=EIx8CRsrvZKC1T4I
	NAL7irFXTf8m/hDqUkReJsqgaXtNPXtUyH+4A7DPYsPIFq+OCCb4LBLtQWsGc1cU
	4GIlu8NIpj84LrBI/3EthwaTAUeHqIy0g9V7Bzv/detJXq00a5TL+JkV98HsNkxs
	q6mrz7sfCMt3xSS7xNDCYBCj+N/sFdTh3pqeQ8yHWBakSRDW4d4wwOECys/+VaKb
	ObnbC2DmbtIdvk53hrY1R1HulzseVsFWtApkJbOSxcBU/FPK1TzKnM8GRaQfw5rf
	4cpZOL8vcKV2fIbtEYGTiKyP4UfxdfxRUJY031OKkJZa4y6hHN/y8sBNvXz+Defh
	CC+5Yg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn3sbjfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:03:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PA3HuJ025192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:03:17 GMT
Received: from [10.151.37.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 03:03:15 -0700
Message-ID: <e989c40b-e104-469b-84c1-f6c8e59ccfba@quicinc.com>
Date: Wed, 25 Sep 2024 15:33:12 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: qcom-geni: add 32MHz I2C SE clock support for
 IPQ5424
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
 <e14e2136-54eb-411d-afff-f6803a23ad6a@quicinc.com>
 <3c3647c1-8d6d-4038-8815-30c1570d856c@quicinc.com>
 <ad86f820-1e9f-4e15-b106-3e2136dbf438@quicinc.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <ad86f820-1e9f-4e15-b106-3e2136dbf438@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: t2lzNi4eM-VdOGQmNCCAuoHvvTXUoGoN
X-Proofpoint-ORIG-GUID: t2lzNi4eM-VdOGQmNCCAuoHvvTXUoGoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=820 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250068



On 9/25/2024 3:25 PM, Mukesh Kumar Savaliya wrote:
> Thanks manikanta !
> 
> On 9/25/2024 2:14 PM, Manikanta Mylavarapu wrote:
>>
>>
>> On 9/25/2024 1:06 PM, Mukesh Kumar Savaliya wrote:
>>> Hi Manikanta,
>>>
>>> On 9/24/2024 12:20 PM, Manikanta Mylavarapu wrote:
>>>> The IPQ5424 I2C SE clock operates at a frequency of 32MHz. Since the
>>> would it be better to say , I2C SE is sourced from 32MHZ ?
>>
>> Okay, sure.
>>
>>>> existing map table is based on 19.2MHz, this patch incorporate the
>>> based on 19.2MHz. this patch /,/.
>>
>> Okay, sure.
>>
>>>> clock map table to derive the SCL clock from the 32MHz SE clock.
>>> from the 32MHz Source Clock frequency.
>>> SE = Expand OR  (I2C Serial Engine Controller)
>>
>> Okay, sure.
>>
> Please also mention the reason why 32MHz got added ? Need to describe evolution to understand the purpose behind this change.

Okay, sure.

Thanks & Regards,
Manikanta.

