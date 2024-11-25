Return-Path: <linux-i2c+bounces-8177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755D9D7AD3
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 06:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44C66281F15
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 05:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007CD38DD8;
	Mon, 25 Nov 2024 05:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZXAIb9Qh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E232500C8;
	Mon, 25 Nov 2024 05:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732510922; cv=none; b=tCtrq5JIXdG/RA5lxSdPxnQyzYcvB6u7Ks+kQPxgKIjfSEEGeBE1JB2UZcmPmmoICF2GoIu2WzulKF1umpaPlON9bCCXLJUWzdAvjTvbXterAoMKtAzi02LQeniaKqLVZkPFsn37CZiHn5iZNTX6uKlTf0XER5zkHpP/Vs3RqaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732510922; c=relaxed/simple;
	bh=QiPt2Irvj/6t97+JwrxnOBClvQCcx+6Sy5W3+yneGa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KwU4x/KsW0C0qnNwkg2TaHYwM0ITw9omC3ievQjtyZNU5PGQluxW4bkOiqCWtJjAuH9yn/TS7+i+i4tvZd1D6ywLaTFVIIs27ukXCGiRAtFAN5eVkd3LU6oZscweOo9G5f+2yv6tGwBLryQlrxK9qjHd9+vp5xWloxXo/6CBci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZXAIb9Qh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP0BK6C011648;
	Mon, 25 Nov 2024 05:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJ2sfujBYpBb1b9Xk6SYgxMIs8xHWugstDXeXBbNhLo=; b=ZXAIb9QhDYHV9T/m
	ilTC5YRMVshZHHEpryYGulJpLPX366yP58tv0PvixJUbvxzmqfhNHz3RGNUD12zE
	HswU+Qv8kXSzh1W4ygcz2945eehS535fvX4ZZbKaEpFO1w3/hc4XSnNyzDnm18bu
	4dfG07SDQU4nE3qA1WKpzRwiMIGeMnFXEfitRowgeMqki2WpQao53CX8UJ1bm/7C
	EZVMcBtdVGOzu8PoJwMW19iKDxW19cxk2hQAPogppXm2GovYqvWXT/N4CwzzZNA8
	751xWoy98m1O0Y14gz6t21Qm+A/y/dM6bD4kxS8pruD4SE11QlNhocn+hEuog8hq
	Tmjuvg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334dmunf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:01:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP51qrZ028808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:01:52 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 21:01:46 -0800
Message-ID: <12337d5f-63ad-43f1-a9e0-87eb2e3abf61@quicinc.com>
Date: Mon, 25 Nov 2024 10:31:43 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dmaengine: gpi: Add Lock and Unlock TRE support to
 access I2C exclusively
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
 <20241113161413.3821858-3-quic_msavaliy@quicinc.com>
 <87cc1f1e-85d2-40cb-b3b3-8935004f4f98@oss.qualcomm.com>
 <5a39b6d0-600f-455f-9ba7-29787f9085ce@quicinc.com>
 <4d2a9f76-f6e6-4897-9569-6d325a6e62cb@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <4d2a9f76-f6e6-4897-9569-6d325a6e62cb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tVE1Ze_QIByJAJTp5vRmgdrkgSiPdo05
X-Proofpoint-ORIG-GUID: tVE1Ze_QIByJAJTp5vRmgdrkgSiPdo05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250041

Hi Konrad, Thanks !

On 11/22/2024 7:10 PM, Konrad Dybcio wrote:
> On 18.11.2024 6:46 AM, Mukesh Kumar Savaliya wrote:
>> Thanks Konrad for the review !
>>
>> On 11/16/2024 12:53 AM, Konrad Dybcio wrote:
>>> On 13.11.2024 5:14 PM, Mukesh Kumar Savaliya wrote:
>>>> GSI DMA provides specific TREs(Transfer ring element) namely Lock and
>>>> Unlock TRE. It provides mutually exclusive access to I2C controller from
>>>> any of the processor(Apps,ADSP). Lock prevents other subsystems from
>>>> concurrently performing DMA transfers and avoids disturbance to data path.
>>>> Basically for shared I2C usecase, lock the SE(Serial Engine) for one of
>>>> the processor, complete the transfer, unlock the SE.
>>>>
>>>> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
>>>> TRE for the last transfer.
>>>>
>>>> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
> 
> [...]
> 
>>>>    +    /* create lock tre for first tranfser */
>>>> +    if (i2c->shared_se && i2c->first_msg) {
>>>
>>> Does the first/last logic handle errors well? i.e. what if we
>>> have >= 3 transfers and:
>>>
>>> 1) the first transfer succeeds but the last doesn't
>>> 2) the first transfer succeeds, the second one doesn't and the lock
>>>      is submitted again
>>> 3) the unlock never suceeds
>>>
>> geni_i2c_gpi_xfer() takes care of any of the error. Upon error, it does dma_engine_terminate_sync() which resets all the pipes. Internal downstream also has same implementation.
> 
> Okay, this sounds reassuring.
> 
> Since the TRE would be locked to APSS, I'm guessing we don't ever need
> to worry about gpi_terminate_all() being executed halfway through a
> non-APSS transaction?
> 
Right.
> Konrad

