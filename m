Return-Path: <linux-i2c+bounces-13453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F8BBCF82E
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 18:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50BAE189D1B2
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 16:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9210027E043;
	Sat, 11 Oct 2025 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W10YKKel"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054C5266560
	for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760199289; cv=none; b=izGfOU4EimfbVXNx40ihXn8l8ZOfvhBhgrVMEKbkMGc/xtru2hK6LAaf2AlyfR3k0pa25se2A4C7y1lryhCiCqtvG8tvI1oEI/gSIFVE+hSq7qldlWfIM+LRn2/bCzHZyL7YNwyCu3zq7REl9DBI1QeBkIbwz94BTW0UCAI1YVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760199289; c=relaxed/simple;
	bh=dXIun9a79G5jAOcHfxlNdIuwXwsfJITm+BAAABZWPXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTyFHIY5Lg0fB7p/479u5CevRBpqlv0zBeIQ1PvA2jHybQaJ0zYujV/DQv0ogJIV7puvOltYDQ7hEAZhfMwiqx229qaAzpADSsQkP1zxifR+iE936PMryFG+dk6HvpMQU9dBPFteap7o/OIdnqn9D0PPNdjHavWLw+je5qTKOlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W10YKKel; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B4eEXN004758
	for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 16:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEdVXHWDgWFj0dyaaHRuy50qTxNpuKmmrby17kDzkbQ=; b=W10YKKelNKA1wwbi
	k/BwkW2TgV9QgPnXfUVrVFUD5SHWZHe/ikhMFZ4MQ74j7RuFNc+CTqUN6wIHYU8U
	CPLRnWdEGxZMp7woEyJlwDCblV8uRZvJiPAR881dnDgBTTLaCFBPSCU7Yg5g3MS6
	+PX7kM9HJDyyQeAD5KyscUTU69Lcn49v99NqxIQH2cos8wSwAtY5E/qy7BeP1COf
	6uxeNG0PhuMMXm0UPMquEFC0ZKziipJC1uukgjfi6w9k9WfyjOak0vwMFW0yDXSM
	5lSL3SPgiY+g8YIZ+dQNPwLsvvHtkcZ7VKXQyvwDuxwShHc0JXp0uowTKNS/U7Yl
	IpR2gQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfrsqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 16:14:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8572f379832so166474085a.3
        for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 09:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760199286; x=1760804086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEdVXHWDgWFj0dyaaHRuy50qTxNpuKmmrby17kDzkbQ=;
        b=rZRlnfICPJneoaZvUNzU43rmPQbiBNHwH0DrpF4WT2pBQe3fEgcBfMQS3PscZw24Pu
         nHVv4nRrOkSE1O90YMHXNvNFk3VyltqK0s+RuKw9H9WMEoTDLQSHEteoLtjRa1TM8RoA
         CQkzs8njv6cOzIrY74dbbD481tsNCbd2ApG2KqnBiz4BL5tjKEKFYt5bmMqxNVIoxYtH
         jRvU5E6aS6PsJC+S9/idGtDqWwgQxPER0uIjEvvOIkshMeFJTu+1N+FvaBpTQ4QaHTnz
         QZwBYmn8XQ65czzwtZ6wm2xXSjwA73qCg5EygtIPVE83Ld9vLC6wRymsNTuyWWA2NipG
         hycg==
X-Forwarded-Encrypted: i=1; AJvYcCVSgf9549vcll+JiqViONVgFY5IIHdXbVefQV2eOutsk9lgAG2NDdw/5rqXG3QKBXJ4S8KhvQ00jic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9NsgkZaEmwee8c6KEb0WwnlzM9U6oKr9bIFI7BPugajJ1tGEj
	6joAt5A0ZqXvHVTsbd8n01+cjY8kx3H02JJGX9ljRqT+STPKCCOmouONvuFlSoTRnztlavH5RRZ
	idcv6TvrMUnyFU4RtzVcONbCnv2OFXh1/rftClXQXzhTTkxIDApL4CF6EjSWI/aIpGuDcZkM=
X-Gm-Gg: ASbGncuaje4ZJqf2Hx1vgOX6JT3A0prseaWEVEFI90lZpo6UbhIszy9toCX3zauPSLi
	rKB3D8mFtqDPy25WiMwWcCxUw39B/W1ZXkOOseJ6H1IIKycaSBDi9A/YUh1Ez6ZnYsIfbBQW0Q9
	jzFe8xie/XajdZwUFS1d9qBvRUWwX1g7PEvb6K7+5M0T+2E5t5Zk8Es/jIeRCYnHsx46Um1fRab
	DXJxNHkABBQawr/BrO+MzXXyy85dwk5qXFPtdLIZM6mMGLeBacNb6C56/KOWqsT/EB8PbRbxP+N
	eG8D/tz6bEKyENJxHLbo2XJdaglRrCYT5qYTToTNJl7cuNbKkHJ6WwqzLuq9TnpTOI3LteX1bcm
	jL1qYkvs6KBP9Y50uuIfpqA==
X-Received: by 2002:a05:620a:4609:b0:86a:3188:bb40 with SMTP id af79cd13be357-88353e1de97mr1470264085a.8.1760199285710;
        Sat, 11 Oct 2025 09:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdXAg/xzGRvcQbpISEqpqAwBRcd/3t/DWxb6MpCZ4p0XQK3CnaFf8fCioETBvpvGLnw3G7Jg==
X-Received: by 2002:a05:620a:4609:b0:86a:3188:bb40 with SMTP id af79cd13be357-88353e1de97mr1470261385a.8.1760199285219;
        Sat, 11 Oct 2025 09:14:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9a406cesm517706466b.90.2025.10.11.09.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 09:14:44 -0700 (PDT)
Message-ID: <dfa9078d-7c08-4fc1-9926-e5996d10a1c2@oss.qualcomm.com>
Date: Sat, 11 Oct 2025 18:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i2c-boardinfo: Annotate code used in init phase only
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
 <29ec0082-4dd4-4120-acd2-44b35b4b9487@oss.qualcomm.com>
 <aOoydT_I7d3khXuh@ninjato>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aOoydT_I7d3khXuh@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX5SusiQGnBdlF
 Y9uqMs7Bme0+HT10CNByBay/hZyICtgqkJE3riY8dbvFfMmS+I4us8d9a2OeoIllsjvEI+lkX9i
 JsiyEYNiEBt1OnqEZzvGxg+rWhsFISXHGmNO9FbCru5pu0OoqCbhkb4kYfjfa/N+LitYNbNtcqO
 erNWoauGAa6XbKfR9OOESXQuxgeenlUcal8Jo2bB5XF/WcC9KSvtWhRKQFvEyhFQULB4vHdPsI9
 HJ8TO8ESyh2nZ+6hkUTqmmsqq3DKctCACI7RCx/2wBmOWAQHFxQkxlHCyMsyJKanZlq7atuj2tN
 EREK9VZHTryytW7IwrRsg4WraLuUYkBPMTZ2JVK0eb+wkhe7HJwjcwOTjAVC8NhbpX4p6ZfeE9s
 xsnpNEeSLOt2lDeTww4u8GXPk4Mj8A==
X-Proofpoint-GUID: 9mSxp96zpXK9O2Tl0ohQuwVrgO5zbfu8
X-Proofpoint-ORIG-GUID: 9mSxp96zpXK9O2Tl0ohQuwVrgO5zbfu8
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ea8277 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=uWCIaohOBZLpiXFHXEsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On 10/11/25 12:33 PM, Wolfram Sang wrote:
> Hi Konrad,
> 
>> Hi, this seems to break booting on Qualcomm X1E80100 Surface Laptop 7
>> (arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi)
>>
>> gcc-14.2 and clang-20.x
>>
>> Funnily enough when I build this (albeit on another computer, but also
>> with clang-20.x) and boot another X1E80100-based device (x1-crd.dtsi
>> in the same DT dir), it boots up fine
> 
> I reverted the commit now, but please if you can find out more details
> about the boot regression, this would be extremly helpful (maybe
> earlycon helps?).

I'll try to poke at it the upcoming week, thanks

Konrad

