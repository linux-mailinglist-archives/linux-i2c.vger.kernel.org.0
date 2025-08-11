Return-Path: <linux-i2c+bounces-12236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E02B20796
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 13:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900BC2A35AC
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 11:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5DA2D29C3;
	Mon, 11 Aug 2025 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRje3tkf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708402D2394
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911588; cv=none; b=mA72JlMG/xsykq/lnI4pa9T2nHAM5ZkkoZXKSlPgCqIyJVx0sWZZvxwLTcRv+xaz5ZSomRBsEVNPrc1QUJAMemH1jMlG6wVUixRYPUviMcLMrWy9VaMTInDwIx62FObDlbWG4767wi4o3WuEUVP4CiDVLvMfuxql1+AgCWaDEYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911588; c=relaxed/simple;
	bh=eS4rihNg41CqQLMmI9woJNOTxbkZM5b3UZpiF2Tt2MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAImQAh+Nqp/jQDub1a8qCOxHw95eA48nagg0sXD3ao+WLBxwA2B7p7KojE6r3cWQkzvGp3E/0px7RKaGxNoDvOetq2x1jdMORwgtu0vpg/HfGLmG0vavIVBsuefFHexGBvDTfWEbMtFfWcwO+Q1/jAuW28XYnUSKIX4B38fmEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRje3tkf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dBvj025530
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 11:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jHNg0B9zA4M2W5qF7j5jLgoieY0vFIuRYMc68TZ4yU=; b=jRje3tkflwZVfifI
	wjIOsh+89MdA4lSahPDOEQQb3BAXSvjMr9C8pQmqbrdTYbJWszsfJEEKpIhMW/cc
	A0GUBASh98xrXokDD7oXeHU2oK3AYEnvFbvSb1M1tChjAsg884N58IA1F2n/L+O7
	xIoF7SDczevL7E4jKjX+0MgzCTGlgnzd9KbDynbRU+198/9KhKIeI2BqhZgB8nQM
	n0giHrYXMWRXpUZxsIqpzzSJUAIy43LzEBF2x4IzjtzY9gSUIrctJGccrH/srylz
	WMGRVqBpCph+0MFEdUksOISaZzyHqAdXiSJauiPpkmow/o0W6/gTOdv97bnbEgtp
	ZISG4Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwb748g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 11:26:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0adca3d85so6041901cf.2
        for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 04:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911585; x=1755516385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jHNg0B9zA4M2W5qF7j5jLgoieY0vFIuRYMc68TZ4yU=;
        b=tRQioT9xxE3uNk4vdIhQugajaOfFP9YKcnXlIDxjJmrAiXTabyQYS7LcW3yx30oDJH
         HjDBSuPxe2m0CWjic+qP3rNUSAKOOaMOnd2E/GreV30jQGxHQxWoi72oUfYHNcCTHbH5
         Ue9EHGL8TzoTS/LaqF/auHapRL7O4jVXGiSpaF1QA3c/482+Zg+ozIqC0zaSLrwSe8S5
         QEjQERpb8JZUQOgAJRiL98wwBLeI6zvg4MMEAnQv6eTDro/AcLZjBMVRl05f/EekoC7M
         Rl4IFXWEX7wCqAi9ESkjAbb+rGre/MIxESWtt2ntQVWJnBB2ltNOfZ1/IRL46jGDJC1L
         GfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhPsJ0fehSIP088foIwtpFueWjx7Bizi6jMAscIxrN4GufZTOhynI9+dvc7+SHKO/AQPBBUVK/51U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYuz2kzOD0Qv+9c4GBrnEP6iwqbPm5Zaq1Hd5BIaUHsF6UYyX3
	nikH9jBClfNHKr+RpuKbGW9Y9A0+kW6t3QBcnIP3WxDXByghWdUxWI1Y/rdiL9vCEzwW9GzVX0Z
	4uZsmObEzSw2PTYojcOsnJDyA+Rtzrg9bPC9h6yox9xgvjxPRuIra/HE/59T11Ac7905LPEU=
X-Gm-Gg: ASbGnctFQYodr3tP9f52xLhMoZra3QgvifTOKXLRwPlGzHzAUXcOEeje94jMnc4Fice
	esq6kAnZvZPU1cxEEi0WzzrwNiyEdn/Ks1NkglNO27duOPY5MZR1TOWH+ShNuEJXBSnfsqqZ0qI
	z0G9vYYO8sot9xI7XRi5bU7vgYb6ImOGgdYIu/cKUjKP3sPNHETmsgWW6Jlo/6a7Rt3OjYqjHKQ
	KOz+IWNp+5rF3C60GhyDcv1L+tijWfP3DTBYqNulhlitTJgS/Oz30wMzh8epspTGJ1TRE7cm59N
	DzCfViTEQQQlwzqZmnTFypA7DxDa/0ntCsegOqQ9a4+G+F5g117upcWTH7rwJN5DD3F3AYu8jNO
	kRVJeLfpHRPPN5cfTzQ==
X-Received: by 2002:a05:622a:52:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0bed54be4mr48750501cf.12.1754911585084;
        Mon, 11 Aug 2025 04:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdfPZCXPS0OYVaxZhGB2BQD/z043PUiTBUFlrOndzcMXZnRLOEaHOLYJWbIeIJ97eftPoMYQ==
X-Received: by 2002:a05:622a:52:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0bed54be4mr48750211cf.12.1754911584665;
        Mon, 11 Aug 2025 04:26:24 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21e44csm1987238866b.113.2025.08.11.04.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:24 -0700 (PDT)
Message-ID: <792a342e-0193-4180-b46a-4abc3a55db84@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:26:21 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: msm8953: Add CCI nodes
To: Luca Weiss <luca@lucaweiss.eu>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-5-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-5-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K6oiHzWI c=1 sm=1 tr=0 ts=6899d362 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=0h-2F_-C1axGQPG-8WYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: j8X7gB5f867Wops2AzGqOvOBzL-yui27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxMyBTYWx0ZWRfX7A4zcl54vO/R
 m2h0Tn/aCE78d2d/eAt2BMuq1EiTby9pRx3gAka1BKU/BhU8m1RDvZ5TSI70eN3nys2oY8H4cWG
 1rog0u26Lw05LAlbzZ+5iKHrS2kcG3iBOH6w+4TNuaJCkx6U8JJ19PDqs9nBmqUlcZAJ+r4qshO
 gwqTmPeugHbyeos9DsBNbZzjffbV1qHag1PaLxk1fnT6bvHL+vQzPTVtUgrn+J89rZ5TMs4BhL1
 DeQ44Qvs7NHuKXj1jAKZqJ56kjkUagMePXiMotsEyJPTrVwr0apV/YCs1N2w05pKPAwYt7iHCy2
 pwqvx7hAYIoX7ypAtyj5UJtZ/qXyilADWgvMo7mXW2lwBCWEkXqAqSsIS19twj3+1ggd5+TlxXz
 qoFerl8d
X-Proofpoint-ORIG-GUID: j8X7gB5f867Wops2AzGqOvOBzL-yui27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090013

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Add the nodes for the camera I2C bus on the MSM8953 SoC.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

