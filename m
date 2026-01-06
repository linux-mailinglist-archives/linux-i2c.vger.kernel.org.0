Return-Path: <linux-i2c+bounces-14927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B08CFA212
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 19:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5896A3064A81
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 18:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C581734D92E;
	Tue,  6 Jan 2026 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcefwmau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHCbJqSv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CC134BA40
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 18:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767723485; cv=none; b=Etk0/cus7tHhFTAn5zFyhAys2BcJ6mMPl6K51RjN6TGSClbjpf9n7gbGwGpK2XIGzjqmki/o9Zd6VrxpTZGDQgktaTP018JP2tgn/fmpCjEWTr0LgM3O84fOPv02mXXiRShtmhuXb9Ea8Y2JGEsgrWL/6xsjm7S3gVyeJCz2W2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767723485; c=relaxed/simple;
	bh=L4Z35bGG0CcgSyx1i7w/t/AMaMyDcOiY2k3J4gLV5e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oigYVWxOMnQX4vFsm8lo+rWeIDgSdKnYXczZn64ylD+gzVFfQR3FgNiHHAQOxfmcC7sxQgVBRG2zuIrEh27dFd5g2n7JqVevV0QW8StwMACYAPt8O8JqeJjnzLFhkqVSZV095xvKWwGSN9kM/IJYwNOShLxZYCCH5Wd4t4SCa0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcefwmau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHCbJqSv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606EfmNQ322896
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 18:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWOxW6dZpPv77v61yzH0wXPaMdYUxG9e1psWqaHVUgk=; b=dcefwmauQzwidCnS
	ZN9i2ZaJ7f6aKYgwpd4dIMN01X8a3YryU8P5KKBVWPfNM6HQZ/LpdGmOu1Cppw1d
	6Xhly2z1C3+Tclh9bNN1fSx2Ddmn30APbQiL4xM+aVTarH0dCGEHyaBBdwtPiJT9
	y28W0EJ/6ScOrExXiKju/MYzfd9Jg3D+Aq1mzMtWUNEhcxrMPjAWvyyzeLV9N/em
	eny+13qvPe6Vu8tas4DZ375Gx8a5q79WEAxvAf+46s+B1YA4lmqSnuYVrHrzOTw/
	1ururmjDI6aLnB7YM9xtUA+X+xx0Cul9VhQr9TyMbYtTCo3Z6hBqCIS/IssrNUky
	NTMuEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh4crgp42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 18:17:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae546fa935so2220873eec.1
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 10:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767723476; x=1768328276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dWOxW6dZpPv77v61yzH0wXPaMdYUxG9e1psWqaHVUgk=;
        b=DHCbJqSvt0JrwROX0klRSSN9GykEHVRnC5xIYvpFcP3DRF2FNOSp0tlvFGGDNyVlcn
         s1uIDYu1d8NWc5TXVuZ9SuejkEYXsVYy2otS6oLe8W1spV3FCIG4iVOX3aqQUGK2gUeT
         JdzK6EYmbaVsY43tgIBfo0qinJeOszLIDTbVWhUdxnAXOXEQnk19AgjxVVqXmZMhQLaC
         +ttJonWifMH2yBMTkxcr4wQVVC4UfPB7b30+eewViwNSZ8HOusdZgJE83X5jNw8V0eyA
         0Ec8oGaDUWjEylXznALU46qBM1Vh70HSrXEU+SEnbaXS3R0/wUdm/6yE6ln6JI9LHmj/
         nbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767723476; x=1768328276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWOxW6dZpPv77v61yzH0wXPaMdYUxG9e1psWqaHVUgk=;
        b=QmBOWp6MlMVUDa4DEOF+gKMRihOnQYHBH1Mt+kaTqHawoOCCsNgL35wKQfmfNkqyUg
         Ok+ngJUc8KTbDFhNp7XCI/YCw9wiHxdIBjf2qgq7En+HXNq9as5ysItkEpY8vsbMXfrx
         YtN5UTvFr25edEZzan+QXXRRBVjjA9rY5WAaABuF/T3avqNybzAJgcrPDEhyhpDFIoRo
         453jkiw/P1XrjsAS31MdeoOnWxs3otvr6hFWQtQB6DXOTEjLsZBz2QM3SgyDZd1hU7Jn
         mNFiJT+dFnKm7/rRBZDvOiT+Zb51DKGkn6eFc/ypiSR4rNKfMoq4LkNVJ+O8NUAPkiKk
         V7Og==
X-Gm-Message-State: AOJu0YyKHqcjY8EUtLipLy6ym0iX1C5AViTh2F1v+4KU8zuiqgQ4elPv
	ihCE28xZq1nNA+woIZjY2zFBvOpgvvotYL3BTeQ3oIlRjz/LEMHTBxenV9/N5yF0nsdRg6qFNVZ
	LvIGK3dLoc9GsdRfpVgahzo1B05iIweSYLG1PTpLAO3W5FEcisgRJW1r24ZYbAxI=
X-Gm-Gg: AY/fxX5YBjC+aIwiVSFuUlSntgG4dAfDhPQ/Zv89S4RQSUdMKqJN6PW+XmT5rVzaJ27
	ymz5J64OsladHBH5f1OqysVyDk48c8Rf3tmfIMZHj4WwgrpkmuuSS0lQrY5BQ2dnl69XFJ5Elam
	BwJg1lCGfqE0N/o890+QWn8u13hdmb99Rsi5r6BwzNZl+jdZDjKfng/YJTLCostO9yuS4INLChR
	RXqEPg/6ZxsO6KEol4BqX1swUs0Ma3mOSJLW8cJNoX36Anv7bbpHlB05DmOrcuCnMVK0fztILsr
	ZElO6MZR7KJSVZPIgeNeLECm6iRKCmafJ0xBdUFQUHPahBhembxYWn4Y2AHHbSJAY8hagdBFdtu
	aIONElwV9fKPSSrZDKG1pJwMsmbYiyAQ61/ueVEtCX0aQ
X-Received: by 2002:a05:7300:ce81:b0:2a4:3593:645b with SMTP id 5a478bee46e88-2b16f86c5efmr2146337eec.11.1767723475754;
        Tue, 06 Jan 2026 10:17:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHP386AXDRvMEtrPnl8MFey1VtGZQDD6Lkw3SE2oGZGmjPap5ltB2KFkafGwlXnNVE3VU6Tsw==
X-Received: by 2002:a05:7300:ce81:b0:2a4:3593:645b with SMTP id 5a478bee46e88-2b16f86c5efmr2146320eec.11.1767723475101;
        Tue, 06 Jan 2026 10:17:55 -0800 (PST)
Received: from [172.20.10.12] ([172.56.240.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673b2esm4461606eec.6.2026.01.06.10.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:17:53 -0800 (PST)
Message-ID: <0b212187-168b-4757-b5a5-afe3ff0922e7@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:17:50 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: camss: vfe: Add support for VFE gen4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-6-646fee2eb720@oss.qualcomm.com>
 <f0b1709f-c1cd-451e-85ac-ad8deb716d54@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <f0b1709f-c1cd-451e-85ac-ad8deb716d54@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9FwEOni c=1 sm=1 tr=0 ts=695d51d4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=J3Fo5nLEaHaPiRlpdRcYgw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=r50mcWQs5pZ2MhLbZpYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Q0u7h2I_4bB_2XTeCNXCOsUqJI9FxO4h
X-Proofpoint-GUID: Q0u7h2I_4bB_2XTeCNXCOsUqJI9FxO4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1OCBTYWx0ZWRfX0fujqo+QZ08K
 YOcT9YjYLfvZKRJA/m7NQe39ncsv4nm/1NMwL2ajLtZR11LUMDixGfRKX5vumRuVMfSfU21IfLd
 bZy6V1tkkfVC33liMr1NLcy2hSi/5XJk1rprj8/TBXGhImIgy99ouKXTFrOtu3dFmJOBpm2Y1Re
 yMfe0WyVPP56wnvzmE84FGccc4fdp0EhtClEWP0DZOdLrRmLI/SFn/PFpIzcQtrg3ypB3pgNLGD
 3gMjgkmY/l9jWxty0LMkugUx8jmlJ3dKAnsfQT/dAwpB2EZBjk/MsT5DgWouF+Xib0tjY2hVOZ6
 NjvSVsNsV3qWTiERIqwFbnE12p/2PyUcXcZ4gsDx3DBTTO75ryYD8FPIQ5B39WqYBhtWGT7ueFj
 wgf7FZVEe3GcdwQvgzVBnPzF21s0RQZUgxV9+XXNb4jjTgTxecXLZWr/i73tvhCz69fi/7SiQWO
 U6gDU/mBRdrcSjExOHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060158


On 11/27/2025 2:04 AM, Bryan O'Donoghue wrote:
> On 26/11/2025 09:38, Hangxiang Ma wrote:
>> Add support for Video Front End (VFE) that is on the SM8750 SoCs. The
>> bus_wr configuration and the registers offsets closely match with the
>> driver that had been added for Kaanapali. Hence, rename the previously
>> added driver as 'gen4' and use that for both to avoid redundancy. Handle
>> the minor differences in the driver using the chipset version.
>
> Specify you are renaming a file and dropping the 1080 postfix in its 
> naming convention.
We renamed this already in Kaanapali patches. Will rebase this on that.
>
>>
>> This change limits SM8750 VFE output lines to 3 for now as constrained
>> by the CAMSS driver framework.
>
> What does that mean ?

This is coming from

enum vfe_line_id {
     VFE_LINE_NONE = -1,
     VFE_LINE_RDI0 = 0,
     VFE_LINE_RDI1 = 1,
     VFE_LINE_RDI2 = 2,
     VFE_LINE_PIX = 3,
     VFE_LINE_NUM_MAX = 4
};

The way the VFE driver is currently implemented, expanding the RDIX 
enums might break previous generations if they were using 
'VFE_LINE_PIX'. If there is a need for more than 3 RDIs, we need to 
cleanly fix this, probably in a dedicated patch. Please advise. Thanks.

>
>>
>> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   4 +-
>>   .../camss/{camss-vfe-1080.c => camss-vfe-gen4.c}   |  60 +++++----
>>   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>>   drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +-
>>   drivers/media/platform/qcom/camss/camss.c          | 150 
>> ++++++++++++++++++++-
>>   5 files changed, 182 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile 
>> b/drivers/media/platform/qcom/camss/Makefile
>> index 74e12ec65427..6e54d2d11ed3 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -23,9 +23,9 @@ qcom-camss-objs += \
>>           camss-vfe-340.o \
>>           camss-vfe-480.o \
>>           camss-vfe-680.o \
>> -        camss-vfe-1080.o \
>> -        camss-vfe-gen3.o \
>>           camss-vfe-gen1.o \
>> +        camss-vfe-gen3.o \
>> +        camss-vfe-gen4.o \
>>           camss-vfe-vbif.o \
>>           camss-vfe.o \
>>           camss-video.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c 
>> b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
>> similarity index 75%
>> rename from drivers/media/platform/qcom/camss/camss-vfe-1080.c
>> rename to drivers/media/platform/qcom/camss/camss-vfe-gen4.c
>> index 9ad3dee2e80b..d0218950c05c 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe-1080.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
>> @@ -1,8 +1,8 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>> - * camss-vfe-1080.c
>> + * camss-vfe-gen4.c
>>    *
>> - * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v1080
>> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen4
>>    *
>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>> @@ -13,8 +13,12 @@
>>   #include "camss.h"
>>   #include "camss-vfe.h"
>>   -/* VFE-1080 Bus Register Base Addresses */
>> -#define BUS_REG_BASE                (vfe_is_lite(vfe) ? 0x800 : 0x1000)
>> +#define IS_VFE_980(vfe) ((vfe)->camss->res->version == CAMSS_8750)
>> +
>> +#define BUS_REG_BASE_980    (vfe_is_lite(vfe) ? 0x200 : 0x800)
>> +#define BUS_REG_BASE_1080    (vfe_is_lite(vfe) ? 0x800 : 0x1000)
>> +#define BUS_REG_BASE \
>> +        (IS_VFE_980(vfe) ? BUS_REG_BASE_980 : BUS_REG_BASE_1080)
>>     #define VFE_BUS_WM_CGC_OVERRIDE            (BUS_REG_BASE + 0x08)
>>   #define        WM_CGC_OVERRIDE_ALL            (0x7FFFFFF)
>> @@ -55,7 +59,7 @@
>>    * DISPLAY_DS2_C        6
>>    * FD_Y                7
>>    * FD_C                8
>> - * PIXEL_RAW            9
>> + * RAW_OUT(1080)/IR_OUT(980)    9
>>    * STATS_AEC_BG            10
>>    * STATS_AEC_BHIST        11
>>    * STATS_TINTLESS_BG        12
>> @@ -86,7 +90,7 @@
>>    */
>>   #define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
>>   -static void vfe_wm_start_1080(struct vfe_device *vfe, u8 wm, 
>> struct vfe_line *line)
>> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct 
>> vfe_line *line)
>>   {
>>       struct v4l2_pix_format_mplane *pix =
>>           &line->video_out.active_fmt.fmt.pix_mp;
>> @@ -121,14 +125,14 @@ static void vfe_wm_start_1080(struct vfe_device 
>> *vfe, u8 wm, struct vfe_line *li
>>       writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
>>   }
>>   -static void vfe_wm_stop_1080(struct vfe_device *vfe, u8 wm)
>> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
>>   {
>>       wm = RDI_WM(wm);
>>       writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
>>   }
>>   -static void vfe_wm_update_1080(struct vfe_device *vfe, u8 wm, u32 
>> addr,
>> -                   struct vfe_line *line)
>> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>> +              struct vfe_line *line)
>>   {
>>       wm = RDI_WM(wm);
>>       writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
>> @@ -136,62 +140,62 @@ static void vfe_wm_update_1080(struct 
>> vfe_device *vfe, u8 wm, u32 addr,
>>       dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, 
>> addr);
>>   }
>>   -static void vfe_reg_update_1080(struct vfe_device *vfe, enum 
>> vfe_line_id line_id)
>> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id 
>> line_id)
>>   {
>>       int port_id = line_id;
>>         camss_reg_update(vfe->camss, vfe->id, port_id, false);
>>   }
>>   -static inline void vfe_reg_update_clear_1080(struct vfe_device *vfe,
>> -                         enum vfe_line_id line_id)
>> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>> +                    enum vfe_line_id line_id)
>>   {
>>       int port_id = line_id;
>>         camss_reg_update(vfe->camss, vfe->id, port_id, true);
>>   }
>>   -static const struct camss_video_ops vfe_video_ops_1080 = {
>> +static const struct camss_video_ops vfe_video_ops = {
>>       .queue_buffer = vfe_queue_buffer_v2,
>>       .flush_buffers = vfe_flush_buffers,
>>   };
>>   -static void vfe_subdev_init_1080(struct device *dev, struct 
>> vfe_device *vfe)
>> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>>   {
>> -    vfe->video_ops = vfe_video_ops_1080;
>> +    vfe->video_ops = vfe_video_ops;
>>   }
>>   -static void vfe_global_reset_1080(struct vfe_device *vfe)
>> +static void vfe_global_reset(struct vfe_device *vfe)
>>   {
>>       vfe_isr_reset_ack(vfe);
>>   }
>>   -static irqreturn_t vfe_isr_1080(int irq, void *dev)
>> +static irqreturn_t vfe_isr(int irq, void *dev)
>>   {
>>       /* nop */
>>       return IRQ_HANDLED;
>>   }
>>   -static int vfe_halt_1080(struct vfe_device *vfe)
>> +static int vfe_halt(struct vfe_device *vfe)
>>   {
>>       /* rely on vfe_disable_output() to stop the VFE */
>>       return 0;
>>   }
>>   -const struct vfe_hw_ops vfe_ops_1080 = {
>> -    .global_reset = vfe_global_reset_1080,
>> +const struct vfe_hw_ops vfe_ops_gen4 = {
>> +    .global_reset = vfe_global_reset,
>>       .hw_version = vfe_hw_version,
>> -    .isr = vfe_isr_1080,
>> +    .isr = vfe_isr,
>>       .pm_domain_off = vfe_pm_domain_off,
>>       .pm_domain_on = vfe_pm_domain_on,
>> -    .reg_update = vfe_reg_update_1080,
>> -    .reg_update_clear = vfe_reg_update_clear_1080,
>> -    .subdev_init = vfe_subdev_init_1080,
>> +    .reg_update = vfe_reg_update,
>> +    .reg_update_clear = vfe_reg_update_clear,
>> +    .subdev_init = vfe_subdev_init,
>>       .vfe_disable = vfe_disable,
>>       .vfe_enable = vfe_enable_v2,
>> -    .vfe_halt = vfe_halt_1080,
>> -    .vfe_wm_start = vfe_wm_start_1080,
>> -    .vfe_wm_stop = vfe_wm_stop_1080,
>> +    .vfe_halt = vfe_halt,
>> +    .vfe_wm_start = vfe_wm_start,
>> +    .vfe_wm_stop = vfe_wm_stop,
>>       .vfe_buf_done = vfe_buf_done,
>> -    .vfe_wm_update = vfe_wm_update_1080,
>> +    .vfe_wm_update = vfe_wm_update,
>>   };
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
>> b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 399be8b70fed..b8aa4b7d1a8d 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -350,6 +350,7 @@ static u32 vfe_src_pad_code(struct vfe_line 
>> *line, u32 sink_code,
>>       case CAMSS_845:
>>       case CAMSS_8550:
>>       case CAMSS_8650:
>> +    case CAMSS_8750:
>>       case CAMSS_8775P:
>>       case CAMSS_KAANAPALI:
>>       case CAMSS_X1E80100:
>> @@ -2012,6 +2013,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>>       case CAMSS_845:
>>       case CAMSS_8550:
>>       case CAMSS_8650:
>> +    case CAMSS_8750:
>>       case CAMSS_8775P:
>>       case CAMSS_KAANAPALI:
>>       case CAMSS_X1E80100:
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h 
>> b/drivers/media/platform/qcom/camss/camss-vfe.h
>> index 118cac5daf37..c402ef170c81 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -249,8 +249,8 @@ extern const struct vfe_hw_ops vfe_ops_170;
>>   extern const struct vfe_hw_ops vfe_ops_340;
>>   extern const struct vfe_hw_ops vfe_ops_480;
>>   extern const struct vfe_hw_ops vfe_ops_680;
>> -extern const struct vfe_hw_ops vfe_ops_1080;
>>   extern const struct vfe_hw_ops vfe_ops_gen3;
>> +extern const struct vfe_hw_ops vfe_ops_gen4;
>>     int vfe_get(struct vfe_device *vfe);
>>   void vfe_put(struct vfe_device *vfe);
>> diff --git a/drivers/media/platform/qcom/camss/camss.c 
>> b/drivers/media/platform/qcom/camss/camss.c
>> index 9dea343c1ac5..48d8f282d780 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -245,7 +245,7 @@ static const struct camss_subdev_resources 
>> vfe_res_kaanapali[] = {
>>               .reg_update_after_csid_config = true,
>>               .has_pd = true,
>>               .pd_name = "vfe0",
>> -            .hw_ops = &vfe_ops_1080,
>> +            .hw_ops = &vfe_ops_gen4,
>>               .formats_rdi = &vfe_formats_rdi_845,
>>               .formats_pix = &vfe_formats_pix_845
>>           }
>> @@ -274,7 +274,7 @@ static const struct camss_subdev_resources 
>> vfe_res_kaanapali[] = {
>>               .reg_update_after_csid_config = true,
>>               .has_pd = true,
>>               .pd_name = "vfe1",
>> -            .hw_ops = &vfe_ops_1080,
>> +            .hw_ops = &vfe_ops_gen4,
>>               .formats_rdi = &vfe_formats_rdi_845,
>>               .formats_pix = &vfe_formats_pix_845
>>           }
>> @@ -303,7 +303,7 @@ static const struct camss_subdev_resources 
>> vfe_res_kaanapali[] = {
>>               .reg_update_after_csid_config = true,
>>               .has_pd = true,
>>               .pd_name = "vfe2",
>> -            .hw_ops = &vfe_ops_1080,
>> +            .hw_ops = &vfe_ops_gen4,
>>               .formats_rdi = &vfe_formats_rdi_845,
>>               .formats_pix = &vfe_formats_pix_845
>>           }
>> @@ -327,7 +327,7 @@ static const struct camss_subdev_resources 
>> vfe_res_kaanapali[] = {
>>               .line_num = 4,
>>               .is_lite = true,
>>               .reg_update_after_csid_config = true,
>> -            .hw_ops = &vfe_ops_1080,
>> +            .hw_ops = &vfe_ops_gen4,
>>               .formats_rdi = &vfe_formats_rdi_845,
>>               .formats_pix = &vfe_formats_pix_845
>>           }
>> @@ -351,7 +351,7 @@ static const struct camss_subdev_resources 
>> vfe_res_kaanapali[] = {
>>               .line_num = 4,
>>               .is_lite = true,
>>               .reg_update_after_csid_config = true,
>> -            .hw_ops = &vfe_ops_1080,
>> +            .hw_ops = &vfe_ops_gen4,
>>               .formats_rdi = &vfe_formats_rdi_845,
>>               .formats_pix = &vfe_formats_pix_845
>>           }
>> @@ -4053,6 +4053,144 @@ static const struct camss_subdev_resources 
>> csid_res_8750[] = {
>>       }
>>   };
>>   +static const struct camss_subdev_resources vfe_res_8750[] = {
>> +    /* VFE0 - TFE Full */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_hf_axi", "vfe0_fast_ahb", "vfe0",
>> +               "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
>> +               "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
>> +        .clock_rate = { { 0 },
>> +                { 0 },
>> +                { 360280000, 480000000, 630000000, 716000000,
>> +                  833000000 },
>> +                { 0 },
>> +                { 0 },
>> +                { 0 },
>> +                { 200000000, 300000000, 400000000, 480000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "vfe0" },
>> +        .interrupt = { "vfe0" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
>> +            .reg_update_after_csid_config = true,
>> +            .has_pd = true,
>> +            .pd_name = "vfe0",
>> +            .hw_ops = &vfe_ops_gen4,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE1 - TFE Full */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_hf_axi", "vfe1_fast_ahb", "vfe1",
>> +               "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
>> +               "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
>> +        .clock_rate = { { 0 },
>> +                { 0 },
>> +                { 360280000, 480000000, 630000000, 716000000,
>> +                  833000000 },
>> +                { 0 },
>> +                { 0 },
>> +                { 0 },
>> +                { 200000000, 300000000, 400000000, 480000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "vfe1" },
>> +        .interrupt = { "vfe1" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
>> +            .reg_update_after_csid_config = true,
>> +            .has_pd = true,
>> +            .pd_name = "vfe1",
>> +            .hw_ops = &vfe_ops_gen4,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE2 - TFE Full */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_hf_axi", "vfe2_fast_ahb", "vfe2",
>> +               "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
>> +               "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
>> +        .clock_rate = { { 0 },
>> +                { 0 },
>> +                { 360280000, 480000000, 630000000, 716000000,
>> +                  833000000 },
>> +                { 0 },
>> +                { 0 },
>> +                { 0 },
>> +                { 200000000, 300000000, 400000000, 480000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "vfe2" },
>> +        .interrupt = { "vfe2" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
>> +            .reg_update_after_csid_config = true,
>> +            .has_pd = true,
>> +            .pd_name = "vfe2",
>> +            .hw_ops = &vfe_ops_gen4,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE_LITE0 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
>> +               "camnoc_rt_vfe_lite", "camnoc_rt_axi",
>> +               "camnoc_nrt_axi", "qdss_debug_xo" },
>> +        .clock_rate = { { 0 },
>> +                { 0 },
>> +                { 266666667, 400000000, 480000000 },
>> +                { 0 },
>> +                { 200000000, 300000000, 400000000, 480000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "vfe_lite0" },
>> +        .interrupt = { "vfe_lite0" },
>> +        .vfe = {
>> +            .line_num = 4,
>> +            .is_lite = true,
>> +            .reg_update_after_csid_config = true,
>> +            .hw_ops = &vfe_ops_gen4,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE_LITE1 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
>> +               "camnoc_rt_vfe_lite", "camnoc_rt_axi",
>> +               "camnoc_nrt_axi", "qdss_debug_xo" },
>> +        .clock_rate = { { 0 },
>> +                { 0 },
>> +                { 266666667, 400000000, 480000000 },
>> +                { 0 },
>> +                { 200000000, 300000000, 400000000, 480000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "vfe_lite1" },
>> +        .interrupt = { "vfe_lite1" },
>> +        .vfe = {
>> +            .line_num = 4,
>> +            .is_lite = true,
>> +            .reg_update_after_csid_config = true,
>> +            .hw_ops = &vfe_ops_gen4,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    }
>> +};
>> +
>>   static const struct resources_icc icc_res_sm8750[] = {
>>       {
>>           .name = "ahb",
>> @@ -5485,9 +5623,11 @@ static const struct camss_resources 
>> sm8750_resources = {
>>       .pd_name = "top",
>>       .csiphy_res = csiphy_res_8750,
>>       .csid_res = csid_res_8750,
>> +    .vfe_res = vfe_res_8750,
>>       .icc_res = icc_res_sm8750,
>>       .csiphy_num = ARRAY_SIZE(csiphy_res_8750),
>>       .csid_num = ARRAY_SIZE(csid_res_8750),
>> +    .vfe_num = ARRAY_SIZE(vfe_res_8750),
>>       .icc_path_num = ARRAY_SIZE(icc_res_sm8750),
>>   };
>>
>
> Once done.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

