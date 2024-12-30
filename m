Return-Path: <linux-i2c+bounces-8840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 862039FE8F3
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 17:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6783D1882325
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 16:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BDD1AAA05;
	Mon, 30 Dec 2024 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCJiqH/9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF98A1AA1F1
	for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735575086; cv=none; b=ku8kJKdrnbMDYZK9Gts25J3MtJcyCdXvIfzbWF/ML4XzkKeyml3QaFNEcZU9Rcqx77aRAZe81mKNXJ0s9BLQ3Da7xM3j7lOdLOIZr9o0o9NwQfYVycQO0BauH/lizE/1a5NFUIa12DIQ0pm3qnhYk0BN0kJK3iiyYLMcDa2+kec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735575086; c=relaxed/simple;
	bh=JtCmiPvBP5gUbpCS4zWrWQBq6FGEw68MNkxNFmHNPGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cbQN1JTbwA744HqIxsHlHI9XKG2KRobxR1tEmxx+iFg25/VgdUyUQMlV9i5S4nngRCxboeV8QogRX2Or0ORt2Kyemn9O1d+IrvoUEg/wG+Rshm8NB16t0sJ+pSYV4gOXIoJah9YsOff3eqMnMBJ4W5MCrK900Hk1smDXSGOVovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCJiqH/9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU80sfj012100
	for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 16:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ks3jFbBC7Vdbuo+s8/8nsb/ifjGqQncIJ1kwzj1u4z8=; b=UCJiqH/9DrhIv49T
	mUmjoEaeFrthywiCjP+inXx2NwwzMzhrvwS+q+qh+X5hr4w8wmyJzr+rC5QiAQfY
	v5whfMJGnMK56YcAQkdXfNOtw2V0Ka20YYHHc6wtkpP/kz/1clxkoF6fb0n5b0lX
	v8eOykQQNz1FqmCU+O0Jg21peImB6rXiKTtipgp8O+hFWdin+dIp6OVZXD5KAivu
	vLcypNTLfy400a+2O09jkSY2ejfY57NjNbmvny5HChIya/D4MkNkxELHEHh0Z13v
	ZpoovTj+2Cc1FAHL7Uhmwpx419N3eZVw75uGYzYHPFfRlXX/1vnE0Qw11nkbK9KE
	2II0dg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uqmqh1by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 16:11:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f15481bbso23510416d6.1
        for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 08:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735575082; x=1736179882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks3jFbBC7Vdbuo+s8/8nsb/ifjGqQncIJ1kwzj1u4z8=;
        b=WgMh+VL9bhr4MOFcsrRy0KqdfRDRdVac4/7vaC/Yi9IFcFImkSeD/0h/KQ9W6GJeRW
         fFHqZY2TSR4s3hJ5i3vbJUeUjJR4P7BpCML59jeIddpu4+52zk6Ttq/neycPzjY52fWZ
         U0u7NTECuivsD+Pw70c7qMI1rG2XlBxWSRJc1GDqJYkITuRQEwdqYXuTHcXMdyLG1N7L
         ddWABOovpCYy78aZppTYYxYwt/SFO8G0P433JpH3WbkfsUUkmhjOS3Mk0yWa3szBF4aE
         syWIr+sUhHHDFUj50Lw5phwMZSVSU2nAm/lb1/y2DPv0JwPP6fS98BorZ5uHCU3PHPwm
         gpgQ==
X-Gm-Message-State: AOJu0YzvSs2fA5mZUfyj+BZl/k73gklMmNlz7xsgEn/zDn3JO9p+H8N5
	lFdfLomSF44dl+G/7E8JU72Qe89mlNesTaEyH/rGepG0OB1vlpnbwtpg+ZIgx/wsQmu0lDx381t
	rDrdnubJPNHQh4l/E9VLAY2i1awZ/vQ2ePt+7414Pet1VKEr1j1/nT3JpeFg=
X-Gm-Gg: ASbGncvech+AfXHNgVTPnuL1zrrifNP3/dq7rfvJAjVQGp/fcP3S17P8U4j6fR9Ty0T
	YF6BX9gy1iKo5Y03kv6F85ij7agcO1+LjCk7Ej+Ai6zJaNuIPdOsAayEPKBEjkHmySB3iG8fR2b
	kSa1PEsJWys0oNQ9D6y0iIDkjMI+7Vw4n8rUfNbGdIPKXv+DR6E/H+661u1VMudFgnHNLRkyQek
	ZwQRRBludZ1YmyRJgV1Z9A6Gbdrze1F+V/HF8Ynlm0Ho3vYQtaQUWnnbMclUvnfRC8YWnd73uSr
	F7K0WTTGIvO5TcbQQUZijI7ZoViHIyeUU+M=
X-Received: by 2002:a05:620a:2a09:b0:7a9:a632:48ad with SMTP id af79cd13be357-7b9ba7d3bc9mr1976756785a.11.1735575081798;
        Mon, 30 Dec 2024 08:11:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2BVxJ+jl0wNFz54SkuMhcOIsWCBO+gH+vcL/CRqGxPgW44umlm1mhoWx6DWa8/uF2ZB/AfQ==
X-Received: by 2002:a05:620a:2a09:b0:7a9:a632:48ad with SMTP id af79cd13be357-7b9ba7d3bc9mr1976753585a.11.1735575081432;
        Mon, 30 Dec 2024 08:11:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b6bsm1493145766b.93.2024.12.30.08.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 08:11:21 -0800 (PST)
Message-ID: <8bea9d64-66f0-4923-8961-dbf06cae377e@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 17:11:19 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-6-06fdd5a7d5bb@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-6-06fdd5a7d5bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p3uN_9_snhjMF7yUd-4a1XFlo4fZ9NPn
X-Proofpoint-ORIG-GUID: p3uN_9_snhjMF7yUd-4a1XFlo4fZ9NPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=987 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300140

On 27.12.2024 2:11 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

