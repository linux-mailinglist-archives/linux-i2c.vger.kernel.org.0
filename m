Return-Path: <linux-i2c+bounces-14926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9C6CFA58E
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 19:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E01733FD104
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 18:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1A934AAF0;
	Tue,  6 Jan 2026 18:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSlNYL2Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWkKgAG7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F2B217F24
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767722838; cv=none; b=InbTcAj2se5zOyA92px0jTZ8lcSoByNKw0J0tnw3Q7+8flIe1FzZr0UJMML/sDM5E8rGUVNKdOMl4QdYKr4tGoDAsngw5KtkPpC0gqPuDX/RX1goHTBFuHGY3GZ3si9LnoxxZCd+D3JyMD1rq/kpwSB/g+saQ7Q3XpRTn4djiEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767722838; c=relaxed/simple;
	bh=WEBmTC3MTR/VD6ucIBgq/hU9X35PyCbYWrhZKXrTJTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWDUSO2hwysI5WhD9DJBFNZEJW+Jw2FbW25RYjiuPLe32nwHQ8Sc2MaoS0XeHQwYfeh1FpPtn4ZoZCWUS7moC/actjPE9170CvLMRzUJk7Lgx7e3qwKJB73tBQPOsBaTXvtExr+CJzEopOtovqP42BJN6UblsbdUoKOqBL6ioV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSlNYL2Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWkKgAG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606HkHOt266812
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 18:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8urX9Kp7e73uchS0ZI19pCQb4Zt5d70hZpS2+YtYII=; b=pSlNYL2ZPOSycxOk
	d4e6DU4sGgea2EX+3dQP9ZV0AdfR+EgWFKkihyDhJzticw9sd1hWhqDl6NKdiJMR
	jndgt/uX0EEZ7KOiVyfqHzpZsEtLsIMtx4WUH63o5vIBU2qWQKdJKX7v8VzOzpta
	Laq5WqCukZTTLUKTOuqUbR4p9x4wyxG0GPEcTsR55PEAcdlLHZ2GC6vriPsCMGOK
	Cpu9xyV2BWlMhTfmi5E6kCx5DPl15LsvB+5fn8vuGBMEy8ckQo4owCml6CITgByv
	uZYC8HMVkBgkaxbWZ0gXYGck/8b3oZlgr0g4wpQeE01pvTXksi02EG2cr0AD+xdV
	pNKxwQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh736r29j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 18:07:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae56205588so551164eec.1
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 10:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767722833; x=1768327633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g8urX9Kp7e73uchS0ZI19pCQb4Zt5d70hZpS2+YtYII=;
        b=XWkKgAG7NSpcM3ARtUg9+a/gqpNmUBc7+AhVKU5ok6seeHyDZqwH8jzCF/gjKjCxKE
         b1rlxZH7zVWkr6vTc1cd/kpG6Abd59OegtpyibBmtYKD8ms5MyDLcBHUdp2uPtFZnSh+
         dleIhDTNTN45IVZSMCiMDbowqas2RvCO5qcZ8dwUP1kpxwcS/gxGgRBY8jMB0LvqCM46
         4WDas9ykQhPLZgacjOV+aAQohj6UUCL1NMyyXGQxd1Ybb7QTld8264Fs+Gc/wRWGWGrz
         dVeSSQH8UieBrp3445AOfmBX6eaDdtWVx+/5Arw43DLzEpZLiifziEKPAGQDIr55dsR5
         U34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767722833; x=1768327633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8urX9Kp7e73uchS0ZI19pCQb4Zt5d70hZpS2+YtYII=;
        b=g5Cr4QV/+JCgdV72sPHpQlG1cAQ4RQPRovCqvo7mzf89AZdtDM0sfsXQbGTsSfGH3M
         qHS3aNd0Ysg5mzQ1rvU7rrWFF2QZSvhhYwJut5x/2KZkxQ7MTJ0AsPZK8ecZkGoNAbvR
         VPXeTUdXzlgnDRSlsBBb1qqqlGvwCytGqpyfsq/7YCqDJLMn+A9RSYD9F6psMhrLOHNt
         z19DjthjLdCIngEkOm/pLfyPFw4HEBsGiYuVVRYl/VZgVECVhK2q1pFhDdVAft0UKNKP
         OXlzySWsluld3V2DY7yxpxrfQwcnFTxP+fmYeiPF05cIPcQ7jBPKkDmq3fEog2aUtxFb
         A6qw==
X-Gm-Message-State: AOJu0YwKu/d2jF9+XShRvwQ/MakMXudPiCa3mJqIdZBKZ79PHS0FJuFq
	wg6fKydP9t1ZsMUWRclAcPGvQw59Z1wR9J8zHvKlI+5ZrhMsZmagPoXeZvJSeWsi+c8Cges4FcG
	3Yc2wvvQDzkBcmTnGjpFR+2QGE+lgo/Ha7gagg2zn1cevXDmNfmSvfnDi7ZGt/JA=
X-Gm-Gg: AY/fxX5HN7JCdPs+R7T9mbo2eWtcDB5JBTziTJJKOJw04Zmqyi6QVNkRUky5VaAVPsN
	neY3gZTlp8+HJYTcDPBnLQdiZC9Zg7jq9q51a24OezRN1i7iPEy78N9GzkDlYKF+v2VqYKU6hev
	SyeURXvbRdqHcx4s82lQF2p4veJEdbmiNuxqyH39SeX8q93r3MCKYL8cWUezWWoq1sojDJ6IBOM
	kXdmzEK7s0g1chooAQhLPcgGa/RT0DfAIG1Lka9qubnkmNBQCn3wlIqCrASjP1c0IaeRQykfcbf
	EKYQFFJRRAklueDwb8k4jJ+iRZfKzCMEMdNWwlm6IudACA+2HHN5EZW5o5RIiJBNx/MTChsPUHT
	v9DcJSeZkj7VyTNDDXE96Ss7iWQxLgTBfOmVEJjnMGuCB
X-Received: by 2002:a05:7301:5f01:b0:2b0:5306:1770 with SMTP id 5a478bee46e88-2b16f920888mr2960652eec.22.1767722832344;
        Tue, 06 Jan 2026 10:07:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgAmfVzt+qi8IMCYbi03BQJmAl8eOLeJ85RLhK4zQuk27SfxRvhrJGPxzX/XMTOF4+TT1qSQ==
X-Received: by 2002:a05:7301:5f01:b0:2b0:5306:1770 with SMTP id 5a478bee46e88-2b16f920888mr2960610eec.22.1767722831583;
        Tue, 06 Jan 2026 10:07:11 -0800 (PST)
Received: from [172.20.10.12] ([172.56.240.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a1383sm4207649eec.9.2026.01.06.10.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:07:10 -0800 (PST)
Message-ID: <cfcde38a-9551-4d39-abdb-0f15905b4242@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:07:08 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: qcom: camss: csid: Add support for CSID 980
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
 <20251126-add-support-for-camss-on-sm8750-v1-5-646fee2eb720@oss.qualcomm.com>
 <209403e8-cc49-44aa-b1c7-00f73743ca64@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <209403e8-cc49-44aa-b1c7-00f73743ca64@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ba7VE7t2 c=1 sm=1 tr=0 ts=695d4f51 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=J3Fo5nLEaHaPiRlpdRcYgw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w2hxb-C64A6f_Vx0jScA:9
 a=NcUdggg_KHL8fQNa:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 9KYMSypglJHaoBEpfWEuMP7_6YcT9HuD
X-Proofpoint-ORIG-GUID: 9KYMSypglJHaoBEpfWEuMP7_6YcT9HuD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1NyBTYWx0ZWRfX3yVuGlHV36J6
 yKOHdFPcZngCtu8fulKJVZMm2M8bwCr1vPmrWVuyF7OVIaXK85de2So5gGXFvnP3ZcDn1JUHyc6
 KzeuaBptgbotIf89S2xSAznPKstqYSPNS40ibnltOxNaAcJVO6rkrtTFWcMBx6V36Gp4L7GL78e
 nZNylm+kYJ8r72P8t08s7gnFDCP7d8JF+UsQLVODqElwnV7owkQnk9efKKg0yR2n/ey1dGvFjiN
 QzmORbpfVxFuQg6Z3fjgPanxfH6L07Xpck8oZsrf93rGx9EZ+Sdtt4LiarEH3Tqp+AEq3z62VzO
 c4q2gI3xilLb8Fwn8UkGDRq5wh7NohximoaGEvpNG58+Eukb1W2FX25PFL75i6ldmQJr/2i4uh2
 S5IR0+hyCyJKpvkZCIGsYRwnCv4GhEZSlSASUqjSCxNgZ5ZNolUjhE8WRdY8NjEmefkd3g4DiIH
 GX5eaXRJSDrpG7CtLjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060157


On 11/27/2025 2:01 AM, Bryan O'Donoghue wrote:
> On 26/11/2025 09:38, Hangxiang Ma wrote:
>> Add more detailed resource information for CSID devices along with the
>> driver for CSID 980 that is responsible for CSID register
>> configuration, module reset and IRQ handling for BUF_DONE events.
>>
>> In SM8750, RUP and AUP updates for the CSID Full modules are split into
>> two registers along with a SET register. However, CSID Lite modules
>> still use a single register to update RUP and AUP without the additional
>> SET register. Handled the difference in the driver.
>>
>> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>   drivers/media/platform/qcom/camss/camss-csid-980.c | 428 
>> +++++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
>>   drivers/media/platform/qcom/camss/camss.c          |  80 ++++
>>   4 files changed, 510 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile 
>> b/drivers/media/platform/qcom/camss/Makefile
>> index a0abbca2b83d..74e12ec65427 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -8,6 +8,7 @@ qcom-camss-objs += \
>>           camss-csid-4-7.o \
>>           camss-csid-340.o \
>>           camss-csid-680.o \
>> +        camss-csid-980.o \
>>           camss-csid-1080.o \
>>           camss-csid-gen2.o \
>>           camss-csid-gen3.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-980.c 
>> b/drivers/media/platform/qcom/camss/camss-csid-980.c
>> new file mode 100644
>> index 000000000000..0656a912505a
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-980.c
>> @@ -0,0 +1,428 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * camss-csid-980.c
>> + *
>> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#include <linux/completion.h>
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +#include "camss.h"
>> +#include "camss-csid.h"
>> +#include "camss-csid-gen3.h"
>> +
>> +/* Reset and Command Registers */
>> +#define CSID_RST_CFG                0xC
>> +#define        RST_MODE                BIT(0)
>> +#define        RST_LOCATION                BIT(4)
>> +
>> +/* Reset and Command Registers */
>> +#define CSID_RST_CMD                0x10
>> +#define        SELECT_HW_RST                BIT(0)
>> +#define        SELECT_IRQ_RST                BIT(2)
>> +#define CSID_IRQ_CMD                0x14
>> +#define        IRQ_CMD_CLEAR                BIT(0)
>> +
>> +/* Register Update Commands, RUP/AUP */
>> +#define CSID_RUP_CMD                0x18
>> +#define CSID_AUP_CMD                0x1C
>> +#define        CSID_RUP_AUP_RDI(rdi)            (BIT(8) << (rdi))
>> +#define CSID_RUP_AUP_CMD            0x20
>> +#define        RUP_SET                    BIT(0)
>> +#define        MUP                    BIT(4)
>> +
>> +#define CSID_LITE_RUP_AUP_CMD            0x18
>> +#define        CSID_LITE_RUP_RDI(rdi)        (BIT(4) << (rdi))
>> +#define        CSID_LITE_AUP_RDI(rdi)        (BIT(20) << (rdi))
>> +
>> +/* Top level interrupt registers */
>> +#define CSID_TOP_IRQ_STATUS            (csid_is_lite(csid) ? 0x7C : 
>> 0x84)
>> +#define CSID_TOP_IRQ_MASK            (csid_is_lite(csid) ? 0x80 : 0x88)
>> +#define CSID_TOP_IRQ_CLEAR            (csid_is_lite(csid) ? 0x84 : 
>> 0x8C)
>> +#define CSID_TOP_IRQ_SET            (csid_is_lite(csid) ? 0x88 : 0x90)
>> +#define        INFO_RST_DONE                BIT(0)
>> +#define        CSI2_RX_IRQ_STATUS            BIT(2)
>> +#define        BUF_DONE_IRQ_STATUS BIT(csid_is_lite(csid) ? 13 : 3)
>> +
>> +/* Buffer done interrupt registers */
>> +#define CSID_BUF_DONE_IRQ_STATUS        (csid_is_lite(csid) ? 0x8C : 
>> 0xA4)
>> +#define        BUF_DONE_IRQ_STATUS_RDI_OFFSET (csid_is_lite(csid) ? 
>> 1 : 16)
>> +#define CSID_BUF_DONE_IRQ_MASK            (csid_is_lite(csid) ? 0x90 
>> : 0xA8)
>> +#define CSID_BUF_DONE_IRQ_CLEAR            (csid_is_lite(csid) ? 
>> 0x94 : 0xAC)
>> +#define CSID_BUF_DONE_IRQ_SET            (csid_is_lite(csid) ? 0x98 
>> : 0xB0)
>> +
>> +/* CSI2 RX interrupt registers */
>> +#define CSID_CSI2_RX_IRQ_STATUS            (csid_is_lite(csid) ? 
>> 0x9C : 0xB4)
>> +#define CSID_CSI2_RX_IRQ_MASK            (csid_is_lite(csid) ? 0xA0 
>> : 0xB8)
>> +#define CSID_CSI2_RX_IRQ_CLEAR            (csid_is_lite(csid) ? 0xA4 
>> : 0xBC)
>> +#define CSID_CSI2_RX_IRQ_SET            (csid_is_lite(csid) ? 0xA8 : 
>> 0xC0)
>> +
>> +/* CSI2 RX Configuration */
>> +#define CSID_CSI2_RX_CFG0            (csid_is_lite(csid) ? 0x200 : 
>> 0x400)
>> +#define        CSI2_RX_CFG0_NUM_ACTIVE_LANES        0
>> +#define        CSI2_RX_CFG0_DL0_INPUT_SEL        4
>> +#define        CSI2_RX_CFG0_PHY_NUM_SEL        20
>> +#define CSID_CSI2_RX_CFG1            (csid_is_lite(csid) ? 0x204 : 
>> 0x404)
>> +#define        CSI2_RX_CFG1_ECC_CORRECTION_EN        BIT(0)
>> +#define        CSI2_RX_CFG1_VC_MODE            BIT(2)
>> +
>> +#define MSM_CSID_MAX_SRC_STREAMS_980        (csid_is_lite(csid) ? 4 
>> : 5)
>> +
>> +#define CSID_RDI_CFG0(rdi)                                  \
>> +    ({                                                  \
>> +        __typeof__(rdi) _rdi = (rdi);               \
>> +        csid_is_lite(csid) ? 0x500 + 0x100 * _rdi : \
>> +                     0xE00 + 0x200 * _rdi;  \
>> +    })
>> +#define        RDI_CFG0_RETIME_BS            BIT(5)
>> +#define        RDI_CFG0_TIMESTAMP_EN            BIT(6)
>> +#define        RDI_CFG0_TIMESTAMP_STB_SEL        BIT(8)
>> +#define        RDI_CFG0_DECODE_FORMAT            12
>> +#define        RDI_CFG0_DT                16
>> +#define        RDI_CFG0_VC                22
>> +#define        RDI_CFG0_DT_ID                27
>> +#define        RDI_CFG0_EN                BIT(31)
>> +
>> +/* RDI Control and Configuration */
>> +#define CSID_RDI_CTRL(rdi)                                  \
>> +    ({                                                  \
>> +        __typeof__(rdi) _rdi = (rdi);               \
>> +        csid_is_lite(csid) ? 0x504 + 0x100 * _rdi : \
>> +                     0xE04 + 0x200 * _rdi;  \
>> +    })
>> +#define        RDI_CTRL_START_CMD            BIT(0)
>> +
>> +#define CSID_RDI_CFG1(rdi)                                  \
>> +    ({                                                  \
>> +        __typeof__(rdi) _rdi = (rdi);               \
>> +        csid_is_lite(csid) ? 0x510 + 0x100 * _rdi : \
>> +                     0xE10 + 0x200 * _rdi;  \
>> +    })
>> +#define        RDI_CFG1_DROP_H_EN            BIT(5)
>> +#define        RDI_CFG1_DROP_V_EN            BIT(6)
>> +#define        RDI_CFG1_CROP_H_EN            BIT(7)
>> +#define        RDI_CFG1_CROP_V_EN            BIT(8)
>> +#define        RDI_CFG1_PACKING_FORMAT_MIPI        BIT(15)
>> +
>> +/* RDI Pixel Store Configuration */
>> +#define CSID_RDI_PIX_STORE_CFG0(rdi)        (0xE14 + 0x200 * (rdi))
>> +#define        RDI_PIX_STORE_CFG0_EN            BIT(0)
>> +#define        RDI_PIX_STORE_CFG0_MIN_HBI        1
>> +
>> +/* RDI IRQ Status in wrapper */
>> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi) \
>> +    (csid_is_lite(csid) ? 0xEC : 0x114 + 0x10 * (rdi))
>> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi) \
>> +    (csid_is_lite(csid) ? 0xF4 : 0x11C + 0x10 * (rdi))
>> +#define        INFO_RUP_DONE                BIT(23)
>> +
>> +static void __csid_full_aup_rup_trigger(struct csid_device *csid)
>> +{
>> +    /* trigger SET in combined register */
>> +    writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
>> +}
>> +
>> +static void __csid_aup_update(struct csid_device *csid, int port_id)
>> +{
>> +    if (!csid_is_lite(csid)) {
>> +        csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
>> +        writel(csid->aup_update, csid->base + CSID_AUP_CMD);
>> +
>> +        __csid_full_aup_rup_trigger(csid);
>> +    } else {
>> +        csid->reg_update |= CSID_LITE_AUP_RDI(port_id);
>> +        writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
>> +    }
>
> This is backwards logic
>
> if (csid_is_lite()) {
>     /* do stuff */
> } else {
>     /* do other stuff */
> }
>
> Please add a comment to the code to explain why 
> __csid_full_aup_rup_trigger is omitted in one case.
Ack.
>
>> +}
>> +
>> +static void __csid_rup_update(struct csid_device *csid, int port_id)
>> +{
>> +    if (!csid_is_lite(csid)) {
>> +        csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
>> +        writel(csid->rup_update, csid->base + CSID_RUP_CMD);
>> +
>> +        __csid_full_aup_rup_trigger(csid);
>> +    } else {
>> +        csid->reg_update |= CSID_LITE_RUP_RDI(port_id);
>> +        writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
>> +    }
>> +}
>> +
>> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
>> +{
>> +    /* Hardware clears the registers upon consuming the settings */
>> +    if (csid_is_lite(csid)) {
>> +        csid->reg_update &= ~CSID_LITE_RUP_RDI(port_id);
>> +        csid->reg_update &= ~CSID_LITE_AUP_RDI(port_id);
>> +    } else {
>> +        csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
>> +        csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
>> +    }
>> +}
>
> Please be consistent with if (csid_is_lite())
Ack
>> +
>> +static void __csid_configure_rx(struct csid_device *csid,
>> +                struct csid_phy_config *phy)
>> +{
>> +    int val;
>> +
>> +    val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>> +    val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>> +    val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
>> +           << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +    writel(val, csid->base + CSID_CSI2_RX_CFG0);
>> +
>> +    val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
>> +    writel(val, csid->base + CSID_CSI2_RX_CFG1);
>> +}
>> +
>> +static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
>> +{
>> +    int val;
>> +
>> +    if (vc > 3) {
>> +        val = readl(csid->base + CSID_CSI2_RX_CFG1);
>> +        val |= CSI2_RX_CFG1_VC_MODE;
>> +        writel(val, csid->base + CSID_CSI2_RX_CFG1);
>> +    }
>> +}
>> +
>> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 
>> rdi)
>> +{
>> +    int val = 0;
>> +    u32 rdi_ctrl_offset = CSID_RDI_CTRL(rdi);
>> +
>> +    if (enable)
>> +        val = RDI_CTRL_START_CMD;
>> +
>> +    writel(val, csid->base + rdi_ctrl_offset);
>> +}
>> +
>> +static void __csid_configure_rdi_pix_store(struct csid_device *csid, 
>> u8 rdi)
>> +{
>> +    u32 val;
>> +
>> +    /* Configure pixel store to allow absorption of hblanking or 
>> idle time.
>> +     * This helps with horizontal crop and prevents line buffer 
>> conflicts.
>> +     * Reset state is 0x8 which has MIN_HBI=4, we keep the default 
>> MIN_HBI
>> +     * and just enable the pixel store functionality.
>> +     */
>> +    val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
>> +    writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
>> +}
>> +
>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 
>> enable, u8 vc)
>> +{
>> +    u32 val;
>> +    u8 lane_cnt = csid->phy.lane_cnt;
>> +
>> +    /* Source pads matching RDI channels on hardware.
>> +     * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
>> +     */
>> +    struct v4l2_mbus_framefmt *input_format = 
>> &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
>> +    const struct csid_format_info *format = 
>> csid_get_fmt_entry(csid->res->formats->formats,
>> + csid->res->formats->nformats,
>> +                                   input_format->code);
>> +
>> +    if (!lane_cnt)
>> +        lane_cnt = 4;
>> +
>> +    /*
>> +     * DT_ID is a two bit bitfield that is concatenated with
>> +     * the four least significant bits of the five bit VC
>> +     * bitfield to generate an internal CID value.
>> +     *
>> +     * CSID_RDI_CFG0(vc)
>> +     * DT_ID : 28:27
>> +     * VC    : 26:22
>> +     * DT    : 21:16
>> +     *
>> +     * CID   : VC 3:0 << 2 | DT_ID 1:0
>> +     */
>> +    u8 dt_id = vc & 0x03;
>> +    u32 rdi_cfg0_offset = CSID_RDI_CFG0(vc);
>> +    u32 rdi_cfg1_offset = CSID_RDI_CFG1(vc);
>> +    u32 rdi_ctrl_offset = CSID_RDI_CTRL(vc);
>> +
>> +    val = RDI_CFG0_TIMESTAMP_EN;
>> +    val |= RDI_CFG0_TIMESTAMP_STB_SEL;
>> +    val |= RDI_CFG0_RETIME_BS;
>> +
>> +    /* note: for non-RDI path, this should be format->decode_format */
>> +    val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> +    val |= vc << RDI_CFG0_VC;
>> +    val |= format->data_type << RDI_CFG0_DT;
>> +    val |= dt_id << RDI_CFG0_DT_ID;
>> +    writel(val, csid->base + rdi_cfg0_offset);
>> +
>> +    val = RDI_CFG1_PACKING_FORMAT_MIPI;
>> +    writel(val, csid->base + rdi_cfg1_offset);
>> +
>> +    /* Configure pixel store using dedicated register in 980 */
>> +    if (!csid_is_lite(csid))
>> +        __csid_configure_rdi_pix_store(csid, vc);
>> +
>> +    val = 0;
>> +    writel(val, csid->base + rdi_ctrl_offset);
>> +
>> +    val = readl(csid->base + rdi_cfg0_offset);
>> +
>> +    if (enable)
>> +        val |= RDI_CFG0_EN;
>> +
>> +    writel(val, csid->base + rdi_cfg0_offset);
>> +}
>> +
>> +static void csid_configure_stream_980(struct csid_device *csid, u8 
>> enable)
>> +{
>> +    u8 vc, i;
>> +
>> +    __csid_configure_rx(csid, &csid->phy);
>> +
>> +    for (vc = 0; vc < MSM_CSID_MAX_SRC_STREAMS_980; vc++) {
>> +        if (csid->phy.en_vc & BIT(vc)) {
>> +            __csid_configure_rdi_stream(csid, enable, vc);
>> +            __csid_configure_rx_vc(csid, vc);
>> +
>> +            for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
>> +                __csid_aup_update(csid, vc);
>> +                __csid_rup_update(csid, vc);
>> +            }
>> +
>> +            __csid_ctrl_rdi(csid, enable, vc);
>> +        }
>> +    }
>> +}
>> +
>> +static int csid_configure_testgen_pattern_980(struct csid_device *csid,
>> +                          s32 val)
>> +{
>> +    return 0;
>> +}
>> +
>> +static void csid_subdev_reg_update_980(struct csid_device *csid, int 
>> port_id,
>> +                       bool clear)
>> +{
>> +    if (clear)
>> +        __csid_aup_rup_clear(csid, port_id);
>> +    else
>> +        __csid_aup_update(csid, port_id);
>> +}
>> +
>> +/**
>> + * csid_isr - CSID module interrupt service routine
>> + * @irq: Interrupt line
>> + * @dev: CSID device
>> + *
>> + * Return IRQ_HANDLED on success
>> + */
>> +static irqreturn_t csid_isr_980(int irq, void *dev)
>> +{
>> +    struct csid_device *csid = dev;
>> +    u32 val, buf_done_val;
>> +    u8 reset_done;
>> +    int i;
>> +
>> +    val = readl(csid->base + CSID_TOP_IRQ_STATUS);
>> +    writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
>> +
>> +    reset_done = val & INFO_RST_DONE;
>> +
>> +    buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
>> +    writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>> +
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>> +            writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>> +
>> +            if (val & INFO_RUP_DONE)
>> +                csid_subdev_reg_update_980(csid, i, true);
>> +
>> +            if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
>> +                camss_buf_done(csid->camss, csid->id, i);
>> +        }
>> +    }
>> +
>> +    val = IRQ_CMD_CLEAR;
>> +    writel(val, csid->base + CSID_IRQ_CMD);
>> +
>> +    if (reset_done)
>> +        complete(&csid->reset_complete);
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +/**
>> + * csid_reset - Trigger reset on CSID module and wait to complete
>> + * @csid: CSID device
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int csid_reset_980(struct csid_device *csid)
>> +{
>> +    unsigned long time;
>> +    u32 val;
>> +    int i;
>> +
>> +    reinit_completion(&csid->reset_complete);
>> +
>> +    val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
>> +    writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
>> +    writel(val, csid->base + CSID_TOP_IRQ_MASK);
>> +
>> +    val = 0;
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            /*
>> +             * Only need to clear buf done IRQ status here,
>> +             * RUP done IRQ status will be cleared once isr
>> +             * strobe generated by CSID_RST_CMD
>> +             */
>> +            val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
>> +        }
>> +    }
>> +    writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>> +    writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
>> +
>> +    /* Clear all IRQ status with CLEAR bits set */
>> +    val = IRQ_CMD_CLEAR;
>> +    writel(val, csid->base + CSID_IRQ_CMD);
>> +
>> +    val = RST_LOCATION | RST_MODE;
>> +    writel(val, csid->base + CSID_RST_CFG);
>> +
>> +    val = SELECT_HW_RST | SELECT_IRQ_RST;
>> +    writel(val, csid->base + CSID_RST_CMD);
>> +
>> +    time = wait_for_completion_timeout(&csid->reset_complete,
>> + msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
>> +
>> +    if (!time) {
>> +        dev_err(csid->camss->dev, "CSID reset timeout\n");
>> +        return -EIO;
>
> -ETIMEDOUT;
Ack
>
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void csid_subdev_init_980(struct csid_device *csid)
>> +{
>> +    csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
>> +}
>> +
>> +const struct csid_hw_ops csid_ops_980 = {
>> +    .configure_stream = csid_configure_stream_980,
>> +    .configure_testgen_pattern = csid_configure_testgen_pattern_980,
>> +    .hw_version = csid_hw_version,
>> +    .isr = csid_isr_980,
>> +    .reset = csid_reset_980,
>> +    .src_pad_code = csid_src_pad_code,
>> +    .subdev_init = csid_subdev_init_980,
>> +    .reg_update = csid_subdev_reg_update_980,
>> +};
>> +
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h 
>> b/drivers/media/platform/qcom/camss/camss-csid.h
>> index 6c214b487003..c77c61ab9c3a 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -223,6 +223,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
>>   extern const struct csid_hw_ops csid_ops_4_7;
>>   extern const struct csid_hw_ops csid_ops_340;
>>   extern const struct csid_hw_ops csid_ops_680;
>> +extern const struct csid_hw_ops csid_ops_980;
>>   extern const struct csid_hw_ops csid_ops_1080;
>>   extern const struct csid_hw_ops csid_ops_gen2;
>>   extern const struct csid_hw_ops csid_ops_gen3;
>> diff --git a/drivers/media/platform/qcom/camss/camss.c 
>> b/drivers/media/platform/qcom/camss/camss.c
>> index bfc942635682..9dea343c1ac5 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -3975,6 +3975,84 @@ static const struct camss_subdev_resources 
>> csiphy_res_8750[] = {
>>       },
>>   };
>>   +static const struct camss_subdev_resources csid_res_8750[] = {
>> +    /* CSID0 */
>> +    {
>> +        .regulators = {},
>
> You don't need to initialise to the empty set.
Ack
>
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid0" },
>> +        .interrupt = { "csid0" },
>> +        .csid = {
>> +            .is_lite = false,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_980,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID1 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid1" },
>> +        .interrupt = { "csid1" },
>> +        .csid = {
>> +            .is_lite = false,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_980,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID2 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid2" },
>> +        .interrupt = { "csid2" },
>> +        .csid = {
>> +            .is_lite = false,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_980,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID_LITE0 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid_lite0" },
>> +        .interrupt = { "csid_lite0" },
>> +        .csid = {
>> +            .is_lite = true,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_980,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID_LITE1 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid_lite1" },
>> +        .interrupt = { "csid_lite1" },
>> +        .csid = {
>> +            .is_lite = true,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_980,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    }
>> +};
>> +
>>   static const struct resources_icc icc_res_sm8750[] = {
>>       {
>>           .name = "ahb",
>> @@ -5406,8 +5484,10 @@ static const struct camss_resources 
>> sm8750_resources = {
>>       .version = CAMSS_8750,
>>       .pd_name = "top",
>>       .csiphy_res = csiphy_res_8750,
>> +    .csid_res = csid_res_8750,
>>       .icc_res = icc_res_sm8750,
>>       .csiphy_num = ARRAY_SIZE(csiphy_res_8750),
>> +    .csid_num = ARRAY_SIZE(csid_res_8750),
>>       .icc_path_num = ARRAY_SIZE(icc_res_sm8750),
>>   };
>>
>

