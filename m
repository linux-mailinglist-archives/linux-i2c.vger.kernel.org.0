Return-Path: <linux-i2c+bounces-14347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8877BC9742E
	for <lists+linux-i2c@lfdr.de>; Mon, 01 Dec 2025 13:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B37F74E2210
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Dec 2025 12:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17BE309EFE;
	Mon,  1 Dec 2025 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3NJGuGP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtGi2OZB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B7309F04
	for <linux-i2c@vger.kernel.org>; Mon,  1 Dec 2025 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591630; cv=none; b=F6SFE8YFX9ENJuspuYXoagbRUX6r4GJYLICvvIISTr7D1htVnRQPWQilqc6rm8zrgapHAT0ppZEvLXIHK7wxQ0lVsiGkUdDJzHPpjfOj5hjj+uGlWP4KhbRsi4ZBcoPZBdXZ2AgCJQnZek4ALjdsZ+hqNQkrts8ZKu6zRDAjg3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591630; c=relaxed/simple;
	bh=eY2f/OQiXjvQ99EgQG+7NrC52FpWQ+O8IZO2TLGmBJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMXdnhfHfytJQn5bZyoob7QSEBAPe9umZXlbLVP778Pz5c6Z7PQEzAWpo1iECiTztyM6KA5Tm48ROk4WtwpzQn3bA4fk3YiKXI11Cw3qMyJwG2ntYV0J89Goi4do3rpUYSujrCc67MtFH0KMT+zYnXuv/RPVQfESCv4Ik8MpEuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3NJGuGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtGi2OZB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18gXt53433199
	for <linux-i2c@vger.kernel.org>; Mon, 1 Dec 2025 12:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eY2f/OQiXjvQ99EgQG+7NrC52FpWQ+O8IZO2TLGmBJw=; b=M3NJGuGPgS5tRI7J
	+bWh5iXyWN5ciH8Mo15hMRm19CPDbq1bBkcpt1H2rXLjVMSzXZ8LX7OwbSUf8v+Y
	GfjSALoKlJ1adGV6+l1x3DaJn6YqtXLlRNUFI5cuRkFmn2TqYVsDftXDJfAM3dXv
	6Nr5VYWkg//PH8uOnHmgCw9kHb/pLJJppRTcelVCXN6iRI/dNkuGJC9CED7j7CwI
	2DfBGJXpB29hSAdpNk4S8t3SUUTsY0zSH1a6kTI0M7V/uomdPF02ArXu7k37sUnK
	kV7klO9iLIxVyTgXk2jqBxwQmVSKDSZcv/1OcO/dS5Of/vFzwSXRsu0iE5q8UW62
	CjRyBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7re0kug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 12:20:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso8037481cf.2
        for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764591627; x=1765196427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eY2f/OQiXjvQ99EgQG+7NrC52FpWQ+O8IZO2TLGmBJw=;
        b=CtGi2OZBQSSrN1+0g1Rcg2g6crUsUwdjZLoWmvIlO0XSAybN6u7d/ZmTFShOT9Oe2V
         kfGMaRgINQnUkj24i6ENhohahq19HLE/yrS+k4bLySAotVFCq8063mK5skUV2nfPdV+q
         XlafhGhMY9gkEk+pQUe7EF86BdB8AFDtIc1/UBUXDvMJme+sBbQVM8y+HNI9YNkQt9Xb
         v6hnOSBaCNfpD7Krofsblvt1cGp27mmMVvr5L71kNxe7tiab2YYjlLUYuPHkgrcZvpSM
         dPi1i0+6foMPT1SA5NyeMnecSV7e0CLRcBAsPboG9yd3lZNjEeAPWb1KHPR4v6hCIF+d
         nj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591627; x=1765196427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eY2f/OQiXjvQ99EgQG+7NrC52FpWQ+O8IZO2TLGmBJw=;
        b=eGagHgYjRUDdT5FotakakpEAgYQsaPxZ/MN5BG/fD5ZNp5jvVUpOXq98suAv7F2Yjm
         xuRRbZeJIdlpThy+u+8Y3KsY3BMN77SbbMdFf+oh41FRn5x8easJeTIZuiK3ladu/lz8
         BgVA6OZ336F40iWYFBl17FAsUqKnUDDXnn7aFjW1pC4I76FY6m6VvvyygpcO5JFL39p7
         M3vAwimmPR7kekrFGpoa+s1w3CQyKDrPfG//+izdxukCDpmDqLptu8GqBXcFqA81v0nO
         utebogjNSmPe1/NNGKd83ux7XgyUklSaHU9Cp8lKos/PrW4CWRHPPM5p95j9GtLeQUBE
         nH6g==
X-Gm-Message-State: AOJu0YxJ5uzXeP11aI03eEKqzyPl+X4WvzreP/1SfXzQMSVuIoL7vUzo
	Svddk8SbbrxDWrwAHgZFBkr2xT4AdlNgO/XferZOLrThLIZ8HfrR0sTfoR1fe9R2VDJLblkJVWO
	rldfzgfISVhdFC4FeWIbR5ycHvvh/y3o+/cdlc8jpUXsf3DGkzI4OpPtYiv+tXrY=
X-Gm-Gg: ASbGncsxy+pam/UJokIm27REtvrAOx1Eh97aO/R5zQy7sVwrerrKG0CtnHjxG+QMbQZ
	jrM+kDNoUFQKaalWROzlBGBPWCHaxgjnLcPLoa80VCU0uTCWRG20nFl1YKf1SCk1uY/HG+q3Xg5
	qQRawji28xOkftn8pPccyEb6noXgJ/CX6b/52tWbzMff+otaZ5rA7owG3J+/B1nPJSEB7Ajsp3J
	ydlpII5wklo1500OiaPRaT8WxIv/cIl+ykGpQ1K/6cxCkTA9i3VRxVjVIxnGsoMnhnzmnMF/ln/
	3eTzlimOkshetNex6pcfWskJT3HaGLsyVe/ugc6t7g7f/bbzDP++8g0JYXy8SSEKKE+db97/qFW
	2//UbchgKPjnr7+hX1FjCFxUAJ1F9iBcp8C9uiBMIGtnvS9h+q4Am5PwWNAlZU2S469Q=
X-Received: by 2002:a05:622a:1388:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4ee589272d9mr392682061cf.8.1764591627373;
        Mon, 01 Dec 2025 04:20:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJKlfp8WVWHfI6G33XR+NIj+3I4kVuSnGH8T8BZFtRFo3N6WDtyo+7PMNn0O3wAizbedoOOA==
X-Received: by 2002:a05:622a:1388:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4ee589272d9mr392681551cf.8.1764591626827;
        Mon, 01 Dec 2025 04:20:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59e93acsm1186657866b.50.2025.12.01.04.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:20:26 -0800 (PST)
Message-ID: <ae056a82-e5d4-4a73-b478-37533ce2e0ed@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:20:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H9Jzs-KJoci3JbAoUkJ7_BTslnpbjaf0
X-Proofpoint-ORIG-GUID: H9Jzs-KJoci3JbAoUkJ7_BTslnpbjaf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMCBTYWx0ZWRfX1xWcfuU9hILN
 yuxbOyoazpOqCkhL9VJTY8+ZXik9Io5xOPvUqKML5go1wne4ysvr2Hj3NDFB/Vm0qHCffWhI5RT
 FTFyEJMZkt5kGC5t+z+Fam6o0/n0AlD/dLIyrSND0rxdmRYCs/hEDLMhwBWKz5rGTc3Ucvzgfus
 MU+YwBbtA0ZEsumbBjxplXwr1DS7/K4WM2Y7kiQ5xmJOEt9jb7DwSPHV7B2ttC7lpu2atv+EAwb
 5zX4ppsDAwFnNKZCtakBPwbFtPtZOOX0NGc0+6lBklZLM2FNfTmN8y8NupxZ2dG2UX/xxZInkvV
 Ld0RBAxgWHaGKT8ef3+9fSf1lzHs+QVLymxXaFhL7An7CHx+c/i8gz/NxexzsCX1P7v0qa72Of1
 q+fo7TcpYfJIF63M8pkT635CF43ZPQ==
X-Authority-Analysis: v=2.4 cv=BOa+bVQG c=1 sm=1 tr=0 ts=692d880c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yCSNFImgYS9KtUgOuK0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010100

On 12/1/25 7:25 AM, Hangxiang Ma wrote:
> The current value of '0xb0' that represents the offset to the status
> registers within the common registers of the CSIPHY has been changed on
> the newer SOCs and it requires generalizing the macro using a new
> variable 'common_status_offset'. This variable is initialized in the
> csiphy_init() function.

"offset" + "common_status_offset" is confusing

Let's maybe add some platform data where we store the actual offset of
the registers in question and pass a csiphy ptr as an argument

Konrad

