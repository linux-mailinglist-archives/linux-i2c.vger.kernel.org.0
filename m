Return-Path: <linux-i2c+bounces-8151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B309D5FCC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 14:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7EFC282F3D
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 13:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1FE1CD1F;
	Fri, 22 Nov 2024 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKboz4EF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF0C5223
	for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2024 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732282850; cv=none; b=MBxOSZ0fYQxny32krKDQaOkWdaU1nir5VNUukcq8pVVay37fx97xYBhGkF5lzdSudPZ2z5VQNitKq3K5YOfDM73VjQzgr7l4SrcdMUtb3GK++qBWyg9Wr+kA4Nl+4U4gpCzcMoUxB1xfnm1YcIT8QvUwxei+neC4FdlLWA9HGtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732282850; c=relaxed/simple;
	bh=Kp/24QwYbDI+D/YE1SXVqEO9Lm13GmtYqS9Ue9eTfOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=crzoON6zeXVhXERkrbsoKiRPA7X8HgpVRiJn0T5tfcjq4uKmSM5pEZgdQLFs4C5H5OabjUtFLSnIOHzUUiHhRmU+o7WzL3z/31iGLF3Im5+p2rgIt9Kzw4FRNQrpbQW6VVNaoILr9uK1ZbjZfvXcUwEfLhqnEqfuowT15pvJbsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKboz4EF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMBIUoM019414
	for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2024 13:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9YxKM1aS6D02+szZVaQt14eLLw2dbeFbZpQyV+FRSfw=; b=TKboz4EFVHG/nWqa
	7Tc+cQOEtZVSBkxUi29I6qj3As3zRVkfh58f/39j5BWVa3HbT6ozNLkNfmv3nNWh
	oJs1cgNEcRxofu8f5bwyqp9FWK9vUY5ysT+JyoVVOWXS/eL2ZPZL31WgdaS4yV4M
	rtyzxn1pQpNNQbCwntIogxP66he8oCLE79hQCBbuG0bZFy6m6/R8AKOTr51mkPnB
	xMGjGMm6a88OcR1GeKYU2pwJxm1zQR7IBsLkb/L8aKA5c/u0k78JRhAC0RlYQDof
	BpGA8F/6PK0K6jYEkeJDUdK2rCIjmSn1JKY1vmiD5K8dwgxwO7k7eXrMU5RarBxR
	3K08+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431sv2nax7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2024 13:40:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b1440702f2so15120985a.1
        for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2024 05:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282847; x=1732887647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YxKM1aS6D02+szZVaQt14eLLw2dbeFbZpQyV+FRSfw=;
        b=VxRSWXcdVwxDtvdgqoCH+9FkC9FSi5Q4phlXKlFSZpX68QxUm2rH2THAYwfoYJNE3H
         j8YHSmabliHfHK6OzxV19dh2QR8IhrWVwgc/3rnsrX4Y6JxXY2fb8hp5WsXPmb4xDh83
         IsvLPnRqH00DBpo2CsZhMc6pjQIIrhemiq8ER7suFvCgA18pORlZj6NubFFCqDhcPUo8
         507W2I4sQlf8s7YPUQ+ISDu3AeY1JOKMzE5fPtD8p5F26+Vj6ZFKEXLIR4qyVCyFASGL
         H/GFlKguzfWaSTPdye8PG3zggu+7wsGlEbpaYAWnUnQTrDN+6X6ldZ0jkakgnNEZjwdL
         yz2g==
X-Forwarded-Encrypted: i=1; AJvYcCUJMUvNYeAI8OuNiWvFNrbDKUzdi7BKeHv8hjUj0fDkDD4flyFt2HB1OWOszv4z7fEdzbJezihw+2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdk9Ad6xehvvIv0IWf8DiDS6sWxIW7OENhns/wUYTFBRQusE7l
	/izJOa/E7MFTLh0M7ec4Fc5evUz/EIMU4c8BzZ3p0qVCUt1gxFh596r8MzDbqE9yDNivIs71wfM
	pNhYnppxqleqHnqJxGiiBaC6jWKeaamJs22lCBGBLnMpykelKc5SQr/0Nvj4=
X-Gm-Gg: ASbGncsNXLfxdFy2HSkoZsM+RHhlsz2nz/K/x5atfpHzznw8xUkDEbnRXGaWMyzpYxh
	OGr7Zt1VOKuvGumdFKbsDEz6KXVqHFIhBdE0f774HriLMyIuZkzUDx1KmcMEK5p2aLiJwJDS5sv
	LEX1Dqo1jtMgZUzGAsiHPEs8amSgQI3m2kF8491NNc/yRH3e9HakYrANMuUw7dOFr7Lii5mbVe/
	b1MI6102u9Ywz7RRbpoGM5BrSAyoGHbeJthilPJEXqEbHoq4IxKuGmxrDk3mApZEWHC7FeZKAXB
	Uwc/gHNWU9VsoMMpC0nLLDRcCVndvDQ=
X-Received: by 2002:a05:620a:1a90:b0:7b1:aeb3:8cc8 with SMTP id af79cd13be357-7b5143e2d53mr174436485a.0.1732282846689;
        Fri, 22 Nov 2024 05:40:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXGNumdZdSYybkI01sEQNxSeLwadn5nIEeM0rXqU3TOxlAdFxpisS54Pj9uZRXr9K53cdmWQ==
X-Received: by 2002:a05:620a:1a90:b0:7b1:aeb3:8cc8 with SMTP id af79cd13be357-7b5143e2d53mr174434485a.0.1732282846324;
        Fri, 22 Nov 2024 05:40:46 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52ffd3sm101578566b.101.2024.11.22.05.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 05:40:45 -0800 (PST)
Message-ID: <4d2a9f76-f6e6-4897-9569-6d325a6e62cb@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 14:40:42 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dmaengine: gpi: Add Lock and Unlock TRE support to
 access I2C exclusively
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
 <20241113161413.3821858-3-quic_msavaliy@quicinc.com>
 <87cc1f1e-85d2-40cb-b3b3-8935004f4f98@oss.qualcomm.com>
 <5a39b6d0-600f-455f-9ba7-29787f9085ce@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a39b6d0-600f-455f-9ba7-29787f9085ce@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EJqZcu_K2esHBY1XlPW2lAyy5wuMIyjB
X-Proofpoint-ORIG-GUID: EJqZcu_K2esHBY1XlPW2lAyy5wuMIyjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220114

On 18.11.2024 6:46 AM, Mukesh Kumar Savaliya wrote:
> Thanks Konrad for the review !
> 
> On 11/16/2024 12:53 AM, Konrad Dybcio wrote:
>> On 13.11.2024 5:14 PM, Mukesh Kumar Savaliya wrote:
>>> GSI DMA provides specific TREs(Transfer ring element) namely Lock and
>>> Unlock TRE. It provides mutually exclusive access to I2C controller from
>>> any of the processor(Apps,ADSP). Lock prevents other subsystems from
>>> concurrently performing DMA transfers and avoids disturbance to data path.
>>> Basically for shared I2C usecase, lock the SE(Serial Engine) for one of
>>> the processor, complete the transfer, unlock the SE.
>>>
>>> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
>>> TRE for the last transfer.
>>>
>>> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---

[...]

>>>   +    /* create lock tre for first tranfser */
>>> +    if (i2c->shared_se && i2c->first_msg) {
>>
>> Does the first/last logic handle errors well? i.e. what if we
>> have >= 3 transfers and:
>>
>> 1) the first transfer succeeds but the last doesn't
>> 2) the first transfer succeeds, the second one doesn't and the lock
>>     is submitted again
>> 3) the unlock never suceeds
>>
> geni_i2c_gpi_xfer() takes care of any of the error. Upon error, it does dma_engine_terminate_sync() which resets all the pipes. Internal downstream also has same implementation.

Okay, this sounds reassuring.

Since the TRE would be locked to APSS, I'm guessing we don't ever need
to worry about gpi_terminate_all() being executed halfway through a
non-APSS transaction?

Konrad

