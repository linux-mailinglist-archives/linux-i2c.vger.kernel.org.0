Return-Path: <linux-i2c+bounces-15239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C7D32384
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 14:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBA25300BF8D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 13:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFD2287511;
	Fri, 16 Jan 2026 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgfXFS5S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVftt1GI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB95A28725A
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571905; cv=none; b=YFDKGl2fH9PvGb+Jx5kqkQeW/PTew5KdV5Uo1zYDmI5cj0uW+tuWNbkMdf2LidjmY/5ENgHm8TY8HwHCOgcibUEAqNe9JheO95lh86pCkEaVX1egkpYtlEZeYO/JZTIP84kEMQ7IGNLjMkEUUL8mzSuZ8T8lffIS2q8ZKmZx1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571905; c=relaxed/simple;
	bh=kfQSZHrSVdF5x1/EhlvZZ8On2MIbxaieC0nBq36IeUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsZ27un2gF2JQNrFHVmGcWUEGut5+6hn1UB0f5mfbUOBpC+dB+8MQUn9IL9eqCgAYVJ++v4oS/Rb3JHZUVJnY7W6KF8AqlLQLI/h3OO74xdDMVHYj6CVoBfYeUbIXo2B+Tr9x2Xh7I5W3QXm0/LikHSqh39gqWGXokPO5luUaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgfXFS5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVftt1GI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G85J3i2615385
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 13:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IajFANFp4pMuuPZKB8iLv8HMo1BZW4PXkR6TrNFXv14=; b=DgfXFS5SmidKS0C2
	Ynf2tWaTErOuTlC92hSvrMjVt/x+ikHkQ9dbHp//Pzf0d/kGE/yRE+a/0FJvZHNt
	+MBQt67r9af/ddpx+G4ERzuYLzSYb9wwUp4qoQff7QbxntPlckqIAkkXqczcmQ5e
	mTXo2qcoQeaVFF+nuWxbPfhtl/xZ+Oh9NDiqYQvGmVFC0SSj0sN9oJyoOqFY9+mW
	1aBwwRzhjLu2vzvOD5WuIkHfuD2OHN7Jaua7MweNiawwFJx/TrX80riNxrV1exH2
	qkYKUWH7h/KOivDYFoT7FQiB+/s1lHG88XcrT9D/TEFWsQ8EpiNioVyMDTdX/mGH
	3gUUUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977tdrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 13:58:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c1625bbc20so42658585a.2
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 05:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768571902; x=1769176702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IajFANFp4pMuuPZKB8iLv8HMo1BZW4PXkR6TrNFXv14=;
        b=DVftt1GIPpE75/qMzLk5Srcq3ezodJWUUnO6BHOntZ7OhUvi7yByhwqUb+RrzowEXR
         pB5or6D4YScZ1O4VcOXGdEZv7Ja7sIphNuGEHqJlaHYSpf96LX0T1gZoedpiOtbyp57m
         RnZh9ox9FNPJUm6lSudNY9FvdCRVUq6Jd7VTZckaeFHaKadjHpu4Robs0Bskd9in8L/g
         44ferOXpJUS6i2WainBp+bmILi5+EzdrANlc5bHBL2OMGDOqvdizm6xm1NghMNG5e/zW
         1BDdCKwb2QArHZr1F7Tj2a0+3CAtQkztr0dyPpTAqEfHvzTosD71JXGYYA371A3/Jg0A
         WSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768571902; x=1769176702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IajFANFp4pMuuPZKB8iLv8HMo1BZW4PXkR6TrNFXv14=;
        b=hUkLdmgU2Sp8kUeJJUM2Dy2RDOJD2LzchrVWvBqfIrOMIytuZXa5naj4KikdqXv7o3
         klpX1I5aP2Uh7/8c0s47n5AGCQoNhWEHB3gWQrKMljJTJBMAXcy+S7cIlwAxgHGkNB/S
         /GbmccpPjYIHdH5HSRivaAv/5GMKZd83VAxEGfXuPN6axdcpDHy9KjpIUSibMSPy4RVN
         3zdwnOaDV40DQhxlDOzh3drWpZ67L46jL9NI9syq/5XsHRvhJiocLxwn2FHRSeclNsuD
         HpIK71dx/mRLt2Qc4KgbRlXbI/0PAu/eue23qVUWUKVFsku95xQttEKWDGoYpDyh5Mg2
         jJ8A==
X-Forwarded-Encrypted: i=1; AJvYcCWMnIC4iecIf2G90OXHLFp/sweAtIXVZiiQrIJ19gGEnj0M5uXreXVYxPOmTY95Jm0ZDFn9owNZMWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFI5/jwvOu3JnPOMdgAWXMRPfw8YwHsdOMRzTGYUl8ygb2aHUs
	HB2DDF/TPIcFZ0nReHCnr53V3IuDLl2gazkuvsxy2hp0Pvdco8hjgqelm2jot/mwj78qPyvPRHY
	Ihznafa+Ygx7kduERw81UFnJqqWZlELAetV2YZK4I58SCjbuRKivmY+w6petnHJQ=
X-Gm-Gg: AY/fxX6zVeQtEH6SuuC4Ffao7IFSgAKCBNrLAfh4pGF4CN0x/JjD3u4lbw0lqaB0De7
	ZhoSLulqh6IqMeOsHLkCg+pPdIIIjrMuvYFXJzKOCKXSFF5uTm017B1Gy3JzpzGRk6YtQ6QulaT
	3DphaeWzYha+3uVTo2aRwLQPuo2DRx7DoEWxKZHyUqgqAWujpoaxX+Oy3U784rqO0JJF4XN88T7
	icCM8YsU+5VZckHqbfk0LAP8fEdR4M7Icsp34AHGVle3z7vG1G29zmF3/21W6pp0FhfIsedpboA
	9qI3KzmmkVenS01uBAJ7I2vLZ2QaM5/W4+PKAz12XxYrqiEUE9xvGpK5Cm8F1q7phDjFgQo4CFH
	A0C8NVzNPE1YUYIZpipLI9KRU9sKUf1oouJoKWGRoXQNZGPcOua9Akp+9yZmqOB3mZyk=
X-Received: by 2002:a05:620a:44c1:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6a678095bmr319993785a.6.1768571902376;
        Fri, 16 Jan 2026 05:58:22 -0800 (PST)
X-Received: by 2002:a05:620a:44c1:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6a678095bmr319991885a.6.1768571901943;
        Fri, 16 Jan 2026 05:58:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c38asm772659e87.84.2026.01.16.05.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 05:58:21 -0800 (PST)
Message-ID: <b558d5b3-78f7-41ae-8cfa-f54fcfbaaddf@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 14:58:18 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: eeprom: at24: Add compatible for Puya
 P24C128F
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z3g83il3HIek7q53HZQGl0IvWtGIcdvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA5OCBTYWx0ZWRfXyen68pJm8Mdy
 +Iz0XGh8ZOU4gMCn+9K3WI8+ChhB59B/SZ6Ez/WjpXSOZojKxiwh97KMQpHjehejNI9+7/4s27I
 12qbieq2N8txOMsViDHyzH9rb5GUPXppY3oy4kMSopuRZsq0X0veZ5yyB2ueu5JGdWbm+I2LDoM
 71rHZpNURnfmBRlxlwIbeW/ta/FF2KdcotS56rZ7g0xh3mgBKb/Nhyq9IdKGiZvFcLRw2DPS//H
 jCzqF4LAiXbh/8e8ETgOPPKw4ZU4R2yuZujcV2vrkBIDfumdzzVtm0O5aD+jheVh9Ct8jDYcENl
 2JameSQW/zuPR8vDL8LNYRGoeobKyjZE+qIvC+BKMVgb4WmLJeJ8D0Du+5/98taIZLqhI4zvKya
 Dn2Zt44PkpDyaYH4i0i5TA3acaXZd7kTQV5BTuQRVTANj7XWbqjVyAA5HgNa7roz+3cPmc+3iGx
 LC++I+wDOqjTGdHFxCQ==
X-Proofpoint-GUID: Z3g83il3HIek7q53HZQGl0IvWtGIcdvv
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=696a43fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_05,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160098

On 1/16/26 2:38 PM, Luca Weiss wrote:
> Add the compatible for an 128Kb EEPROM from Puya.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


