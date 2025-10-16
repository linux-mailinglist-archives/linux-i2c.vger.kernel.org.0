Return-Path: <linux-i2c+bounces-13556-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D067BE134D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 03:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7ACB19A40BD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 01:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0D51EDA26;
	Thu, 16 Oct 2025 01:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hd8BpW63"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186491DDC0B
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 01:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760579867; cv=none; b=tuvHS3KAQHqioVNxn9X1HiexI4tVpsbq+U1mvAa9lOalCWtFzTCkOGvYE96We9N1hyH8aZr2BDgwhlWYPFPrkZ8Uw5wsrbn4ivPMg2Glf54rFRTrNf3MShNXSXy8TZBMaRr7L5AlED11gu6/j06x1PodtxJaEM5HFhpeKRhDtYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760579867; c=relaxed/simple;
	bh=IlqfZYOkclJozio66DYG7OYgRXYQlBuKL8VU6g3WR5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPr3CWrroUxVnmN+YNSmdktevv9BUOMkRbfGMFJ2P8rHF0NddwuN/SZNnSiklJX8UHVNYsGyvOSuMVEtgdu6v3wFLcblY/eaQHJnthVI8iavsOKhhbkMeknna5K0ZzIqQbQSqVVNXHxJ7wlIEabKWuXQZTLjF9pk7g2nEJOAuc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hd8BpW63; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FHiTJf024767
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 01:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFKFkzfdP4tXFi/0ymgZNK4f9HBW4SXK15XqkMQS4eg=; b=Hd8BpW63ejTcRndk
	ioLHaXxOS69bC50fLat0MRB4ixQS80B43f6oTy2U43UJD4G/Vu1+gKLNRe4qzteP
	zu9sp8LdFQlVH/2PddvqoIbLD12IphHiLeZsB81fXDSNNyS1sN+OGRwbz8k6gD8W
	gQP/VnOsmH3IUdvOLXT4AxDgFoFnERYJqWgf4B/vN9+fBgk8ikzCD4lCiSf5uK2A
	TG70lVtpBoBNjtSJJgY0l7JwRbO40/DvSKLyEA2faBv4bsx/NeKYavAP/US+jr2z
	UyA4mE98TZUXKD0Qp6j1TBCMFBK+si1WjVAAWTy+gvQ7plOWGwTt+tnQy8rw2tg0
	4lulvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0xhn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 01:57:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6a2459e80dso159546a12.1
        for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 18:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760579864; x=1761184664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFKFkzfdP4tXFi/0ymgZNK4f9HBW4SXK15XqkMQS4eg=;
        b=bkzDQkGfOrIG5abed5KkMI7KDKRlKis+/tQrKm8xAa4x3kkpbyYq29lkHlqwrrhHLE
         8Am8V4jcQwJwpFbz2VWjM0z3JEQT+qsm15xndzYn2H0Km8YnDDB8opKJ5+1DwmSMaw2A
         esdNOKM7aQupRG/hs/5OXDiPReWqEgr6QlJTEuMyf2ixgHUaNHqGPztDcHK9/I1qJq3T
         Pypq21353x5V7NMMW7WU2EcKYGRNiCBdNVXrNq0rDK1MgJxwyUfS2ffSwy4iAEWAkXO2
         m8qMXgp26WE6zN8FsPVTxCisQcKWlFDEWZG4deHN41BSkOQBETbOenWRhYMzIbhfuEM5
         xlkA==
X-Gm-Message-State: AOJu0YzoPdEIfFwF5Sth6Zil1wK9tBzNMlojaZezPQ1Dz/jnvGRrhyt7
	y7fN4RL1eQHgFS6h+5ey+459afdLS0zsy70qqXV0/04QMu/K/9FBns+vNWBLtHNRjlhrXHw3nQg
	4v6910XH/3phcXwQYHEs75hESEmDUCJeMHzJmCk/7wsoi5R7GOT1l+tgskbV6qB0=
X-Gm-Gg: ASbGnctiuNNvp2JojBis3xzHgjBSHCBkoYTh8N6JvrNz4mFKSzhm/7VQPjd60aEoh3p
	/YjLoB4jA0Kt9MXwQ8scq8yRf/8MHn9hyegCuBa+sNSdDz6XuuVeV+JvzzxcKEqcx7dGFOOJSus
	jy9e74ODKG6WMK6SGWUnatLTi9j+2dXEv7VhbzgodEpMC4h2wshkaO5DoOyUQPjjL/3Xd/nUKo7
	k1UBUZGTMdx8AP5Z00qX9N0CqZZclRNcKQ8/yHP6yJ8ZfD22iYMVVgsAxtV/WAHIZ2X7mBu5Xeq
	74EeLzwpyv1NzJuPiXR/Vuylcy+JD8lIGBWLNGCxVvA8KpvICZ+VzBZtHQx+B4bd87iQLX9OKDz
	Bn9JJP3o7RaHH1NAiyORWCCyY1qOwQmjpJbqhA2CeVn6EvaX7ypiDqKhN6ZGvg5hnkivZ+w==
X-Received: by 2002:a17:903:24f:b0:279:373b:407f with SMTP id d9443c01a7336-290918cbe15mr26360845ad.5.1760579864405;
        Wed, 15 Oct 2025 18:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnvLDZlV6wBkfvT/qOi99EG5lDHNY9fLIFApqLJJBI0OqJ12Q8JQrRLN+J+RuPFy68M+KAyg==
X-Received: by 2002:a17:903:24f:b0:279:373b:407f with SMTP id d9443c01a7336-290918cbe15mr26360465ad.5.1760579863918;
        Wed, 15 Oct 2025 18:57:43 -0700 (PDT)
Received: from [10.133.33.56] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aa32c4sm10285605ad.79.2025.10.15.18.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 18:57:43 -0700 (PDT)
Message-ID: <49eaf7ec-ac71-4bf3-9a4e-25fa633d815e@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 09:56:05 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
 <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX21oylsumNCum
 KSbPL/NJq7Al6I838YnHmqhL/83WrWln6ysgHhq+4JjCz9E7zvrE0MPRqVgU4N/UbB4iWmSnefN
 cMppn5Eoi/Vk7gy4vKglDC6oX4t3DdoWrxzcPu+HHnGRkdAOiYvitWA749kBSIvorU6hU7e0f3e
 JY3bSwPYHhztyb4eKUnePsXrzskcUHCr+LVkr0QFzkuST6Wl225WjDGHidjdZnKYqwTtHoD+VVj
 b59xHeSANo2Xg8c0ZXFCMUBnGHJ8JmoEa91YjaMVh6L1YMZg727dWf0ZP0Z0FMo6AWp440+UpHh
 DpfFks6VvgLZiAWQUrXgRo6p3GYkWddF4dc67ALWQ==
X-Proofpoint-GUID: Fm2bXH9NezcYzymc9gxXM7rKiPO_5So9
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f05119 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QmC_9Nfu3_VqyKKViBAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Fm2bXH9NezcYzymc9gxXM7rKiPO_5So9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/16/2025 3:30 AM, Vladimir Zapolskiy wrote:

> On 10/15/25 05:56, Hangxiang Ma wrote:
>> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
>> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
>> aggregated into 'qcom,qcm2290-cci' node.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml 
>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index 9bc99d736343..0140c423f6f4 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -25,6 +25,7 @@ properties:
>>         - items:
>>             - enum:
>> +              - qcom,kaanapali-cci
>>                 - qcom,qcm2290-cci
>>                 - qcom,sa8775p-cci
>>                 - qcom,sc7280-cci
>> @@ -128,6 +129,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,kaanapali-cci
>>                 - qcom,qcm2290-cci
>>       then:
>>         properties:
>> @@ -136,7 +138,9 @@ allOf:
>>             maxItems: 2
>>           clock-names:
>>             items:
>> -            - const: ahb
>> +            - enum:
>> +                - ahb
>> +                - cam_top_ahb
> 
> Why is not to give the clock "ahb" name like on QCM2290?
> 
> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
> and name "ahb" is good for both, I believe.
> 
>>               - const: cci
>>     - if:
>>
> 

On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. GCC 
clock domain doesn't manage the AHB clock but CAMCC does. I think it's 
better to create a new and more complete clock name to denote the 
differences between them.

---
Hangxiang

