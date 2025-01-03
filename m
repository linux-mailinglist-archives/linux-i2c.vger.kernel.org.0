Return-Path: <linux-i2c+bounces-8888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D9A008DA
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C40F41884FAE
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 11:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6591F9F4F;
	Fri,  3 Jan 2025 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3pswhuf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7CB1F9F4B
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735904813; cv=none; b=bhe2Lc+nIxxgrpOoCJPn6j52KyLyg0p9DxpClL0XqnmC6nR6oZm/0tFTEGS+tMh7qkaDJLpIqOLvu4HiQGlyeuBnwDeRNUBJSEZmPOUPlpduyYE+V+cmeug1IqkGUevT+FYjrkag3iqUwNvae/iO5Cu6fzYFerx48sVdEkoe7Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735904813; c=relaxed/simple;
	bh=qsxVMo5JWpz5OGrYTHQct2hIenf6onh7s3UZU9UwjmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=du4KpuL8y9Z6meljQQtEw+3m7N71PhyszQZtPq0urXbiBukJeZrip6BljsnZIv8F2JdALFsE7JwJKJJ/Yr3c5+JorXZbXJGgfuliaUtAjYpnwcPTQLivTFeVSrFFBK3d1K4hmszEIHdJ/yRIfQY/6qgJSLKAT+X5bZWJRMJhLZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3pswhuf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5031hb6Q016513
	for <linux-i2c@vger.kernel.org>; Fri, 3 Jan 2025 11:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PAEhP8UE05fQxF97K1IDja7FJ7MMGL08102ZSAbOrK0=; b=d3pswhufyWF1Vye2
	RWwkZ6nRF5wy+RQJPXzbHzzyFSNiiswil78wp04O3Zq03UpvBW+KxfjuyVRkQV+T
	U+gwqZQA8vtUnSP/kr/KiGCciPF1ePN741ls767Je6FstVzdOPv6TvYxf05o3BbB
	vQEr93V6z78SyW6GfnTtpfGq+ucyGpdNDz++vHwmQT7pxkPTYx4yXmkw2ScM6Jzg
	owIUS0i834ujScZEw4ZMuXSnQo3aHjVUvdwka4P8+yBhrsZrInPWrflBiFkEeByx
	SNlRRKt+tlPPAZcPSkHsRPHtU6b+0zsInn3uhVmEQPpi3Vsn9OESnvIxyrXCkS7l
	lX7ZrQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43x6g0h6vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2025 11:46:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8e7016630so33933896d6.1
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2025 03:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735904810; x=1736509610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAEhP8UE05fQxF97K1IDja7FJ7MMGL08102ZSAbOrK0=;
        b=lgU3veqwH9Be+3mIpbQjd67xBIFdkGNAJl6xDTW3WC1o4wZuZ52R7OGkgIVNgAUoia
         GAYV9cjOjh4hnCfowY8gE2BvQbMISr1nBeVphh7kK0FQnEk7Bh+y9SQEWhKFEpVs1bn6
         /Ao7nPekEXaYBeLKef3V1TdVN6/wfX+0Dj5K+yXjKYAosaQK1CiGpSy3IgQy+O1Ckucd
         NLPTm5GeCu7cFBW1S22uAsRW8c+m8hO0m6bUGIdaDDXK17hd2DL5ToBsQlLwo+5rTeOa
         Y8jxGVuBCDN00rBcxYJN15wJDCNxmRcrGfqLugAh60MH8QTKh2QXajkyijQzFaVjFXSf
         3ijw==
X-Forwarded-Encrypted: i=1; AJvYcCXQsXglvv+5x5+WjsNvtaN61L6K1B2plYcxTUoJhUlMLgq+FIPmDT27blhCQKue5EkmiYZ1YT+VDjM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4G4SleX+xYlSuWN6S6zvpui3SsbDV063xNuTPgPptVMBml2Wv
	ia7Nzf6JLnYqyn0XoIU8ataiJaWLMeJZcEUdgijT3+vCXOlenXICtP1FFTsnQn+GqXdQL1qm/jL
	rk67aYiNhbqUCZx2GCxge1CrR9diXLmtkm06ASckJELqUvBLxN6dMOuIMGUE=
X-Gm-Gg: ASbGncvsRB0tQ9s1FZpPqEP1ghcPRx/Dh23nn7k47O8zXYL/xfWdnV23jquFu8fauiy
	ITXD9bT9qugg123L9zKAsQ/0pPFvgtekqoZumV+3ZNDmvV8ddY2zVFTT4dzVt9eOwyeEeaj7Ecl
	Sz4NVRTGS/Gea+e9LplezxJUyaMJ4It5Fdnquhnrs2vWaYliesHezpGUj3oGYiSMJ1ybQ5f+p8i
	ddKUkV+sUm6VxV81tZxvPM8je7K3nwREnmgg6vdjyAWxWv7j4fWRCPRflqafShnz3LOzVS17IMW
	DPC1Q/hjrgFbVImT66/h/sAWagXWfslcnh8=
X-Received: by 2002:a05:620a:8005:b0:7b6:5e36:224c with SMTP id af79cd13be357-7b9ba716af5mr2740044685a.3.1735904809793;
        Fri, 03 Jan 2025 03:46:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGkgkHEXHgJB97KC6g8ncpRmzgUuiK1vzhINpo+hNCP8WWHql0hysgKibRKEugtw9zKaBQ9w==
X-Received: by 2002:a05:620a:8005:b0:7b6:5e36:224c with SMTP id af79cd13be357-7b9ba716af5mr2740043085a.3.1735904809398;
        Fri, 03 Jan 2025 03:46:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaef76c461asm1301650866b.125.2025.01.03.03.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:46:48 -0800 (PST)
Message-ID: <848ff34e-6d8e-4e53-b4e0-5e534836c67d@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 12:46:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Prefix
 regulator-fixed label
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
 <20250103-fp5-cam-eeprom-v1-4-88dee1b36f8e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-4-88dee1b36f8e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _Mp00RPSqR2gO0A0xc64hdOUVp34Il6R
X-Proofpoint-ORIG-GUID: _Mp00RPSqR2gO0A0xc64hdOUVp34Il6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 mlxlogscore=971 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030104

On 3.01.2025 12:12 PM, Luca Weiss wrote:
> Add the common vreg_ prefix to the labels of the regulator-fixed. Also
> make sure the nodes are sorted alphabetically.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

