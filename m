Return-Path: <linux-i2c+bounces-13502-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B9BDC604
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 05:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C90018922F7
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 03:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7571D2C15A5;
	Wed, 15 Oct 2025 03:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzFxxCy2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD4273804
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 03:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760499855; cv=none; b=o2oWZTf6YlHzv9zGsgrw9CL0ZelSIoFC+Nx35cqKrkJuV+OQRCuZUoe4+zNpDS6qKbz8Cz+bq8qyD3iFw/T2Pm0bORvM9hrUjXFUKFMpg8GtRR3oJyO7x0axQlL6q9e+47TTMQoBABAgBQLS2cRIf7SyIi1pz5g+7sMlVe9KxSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760499855; c=relaxed/simple;
	bh=vqy/w+iqbzDnRdb3vWhWE5L5o18Z3IRNtzxou0yGu/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7aAYP25fDj7ZQyiUJ9ff1xyUwJ0FnIxaBPVt/8F+9XEtg6l+j6+SZV7oiGWKrUbOxUpk/n3o2qHKJwILziaZT7UHPf45OP5V4BnzT2BpKwTee9762pAv//2Vzld8W5IbxKO/ATslOGlOo7x4QI2B7H2+6zFNAGBs59czWaqDis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzFxxCy2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sZOI017038
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 03:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GeQNWABtfknzHs1mossYxOW1hb3oBaVaay5QRuuz+cg=; b=jzFxxCy2UMCdRUkQ
	sOkPWrH45kgmvgWvaWh0R1XmfKeMcaNKufMUl1n50aAzvk6A7h8hGnjo5zbJlR9y
	Sdks1OUcCWMOWZDGi8o0fQlbbJiROcvuNBac0UfnUwmJovq7mqOHr4AVdZPH9iOR
	rD7Kc2COzydx6OW9CHpI8r0GbfMupfG970RYAb3ADZQcbgCpuS1Hakr3Le5tDuh7
	BsizlQ4ZsAYDE+q+zYBcVrd0vJOjakrSwuZHZGnHQVfG/sDrWkEmBgrHRnLSreSD
	Up6xGreSvMQxFnag4q65ce81E+I11kKhk0YD1Wt0UANfxzwrS/wPKskdDiTU6ioR
	hMn3xQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkaxyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 03:44:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so10122143a91.3
        for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 20:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760499850; x=1761104650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GeQNWABtfknzHs1mossYxOW1hb3oBaVaay5QRuuz+cg=;
        b=NvesBa1ZuH5FJsO6C2ALfTWnG7zU+Itnw7kh/XqrrhKzanA/qMIdWY7Zgxe+8Os2TE
         itFaVlaj4SMbMxKyGQpNqI/Yf99ypIrK3PLKnSt2utdFJrhsoA9ymVLTrWk30WNePXPc
         d6FgpfF5V70fPSrSghUsjQMlRX7E1gZxwTqJACRjkIH8cQN5rbDvUFUdyeJVd90tg4v6
         n0itKQU5i18DVSYZ4XLkwn1spN36ImyPwRDzq64k8pQRTqCIjXmrLvO2jB31lTFEo1+S
         p3CB+0ZvHBf2RCegpd04eUmq7fEVYcqaH3+oNjvuNiyvv5POHwt17wHmMkrfMpESMdUg
         XsLw==
X-Gm-Message-State: AOJu0Yxg4YSqEuGs/d/IY191l4mnt5HHd4duQPA5yvXWTBMDnwzvpiq8
	YxHxjBWhWx8FqBs6lkJqN7XKS1wLyxAsaLBdZDhFDvxz7sw2GtJQqWwHeaAuZKg23bGIetm1R4o
	POpig0An/1i9Gj3L9DV6lKHC77SxOxucbZdn76ftKZKZmxrpdFFhqvxjc/PlKUG8=
X-Gm-Gg: ASbGncuYQw5hUrnyqds3vc+RWXKdUnwhiV6Ek9QgINqt8X5U2vV5xyfg0AzhIDoSTjB
	WYhBcDyg8a73mtqgKwbtZZ95TuH+rW5YGW1s0/X2RXRdolf6CtSW2L/1vYM6R3gjOQv9uHAeTKs
	4/u9yEVajyd94sfzlZnFmHUGK9ILka+RpkxgWHCnW+ifCo7j3sWoT9qMZyvhksmdbRXto1z5PSH
	AKUFutgUtibzjixFeup92kjuEB0cRZntOYEmAG+dBruw3xTOc0HtGF7z8nHJfugHqTfan3aJhPe
	/ppN4rAvCP0Y3gknVNb3E8JXwxSVGZcpIfVMz/Sm1WvNWQXQ0VT9eTu+2afeqYwaM66Tlu6wnLb
	dc4Q7OmPeICtQdSE+AQ4IBgtJH+dJbwjzM5w=
X-Received: by 2002:a17:90b:4a84:b0:32e:a10b:ce48 with SMTP id 98e67ed59e1d1-33b51114f9emr39416496a91.12.1760499850084;
        Tue, 14 Oct 2025 20:44:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLaHmnIBlLTGa0AuhRVF7oPm397znTIehBpZal7z1s0ivUPUJ3C2LyWIKJvuzEAh+GbLUOkQ==
X-Received: by 2002:a17:90b:4a84:b0:32e:a10b:ce48 with SMTP id 98e67ed59e1d1-33b51114f9emr39416461a91.12.1760499849489;
        Tue, 14 Oct 2025 20:44:09 -0700 (PDT)
Received: from [10.133.33.56] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678ddfeb7fsm13681723a12.19.2025.10.14.20.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 20:44:09 -0700 (PDT)
Message-ID: <a053f88e-cb4c-4e96-92e6-abd0e2128922@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 11:44:02 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: qcom: camss: csid: Add support for CSID 1080
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
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
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <KPKeewNxMYHc69f7f0abCqplL1uS_gnfQUrfniSoqlut0oQHdAje7zYZYiQQ6PgcVWLTQlhdKW7Mw2oN38ZtEA==@protonmail.internalid>
 <20250924-knp-cam-v1-5-b72d6deea054@oss.qualcomm.com>
 <2d637645-cc92-4b3e-b041-39fdb2e68773@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <2d637645-cc92-4b3e-b041-39fdb2e68773@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Is3wtLbL_refPopCipigABnvtnsokW4k
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ef188b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=p9LRCBOq5s8Grmz1RNEA:9 a=2R3um2TrW1gAKgbj:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Is3wtLbL_refPopCipigABnvtnsokW4k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5mMJx2D3qD/i
 t+s/LdmfrCKqmYorvHgo7ciGsYHNvi96vKH912oKCnWsocjAOQ+jrJBykXTTwsFMt+Th2nhihuf
 w6/FaHPUgeM5w9cm0P4qdbdsOTVI1kYJp7GrauGjb913lT3amwbIQbLMmorEWDAaHxATKvEUFFQ
 rnlj6Z1SHWAIIXnv67smaqAIaJTdnWC7dF6DooPDPvEQ0CBYNRA5HIJheEUThzD/gayAiDp41ba
 fJW1grCIhIXikm+NcrSpqr94qXlfAHZmlaQjBvotCUIYakmfpCABSiLBvxETei9ifUBHxlh2Tdd
 j6IQH3JNiRgWXeiCwMH0ibhJQHc6QXLucRnmtsvUGJQFStoiKjA9Jn1fm16kF30R2O25geL0KCe
 Fh6D7mYrBZ+iVF+qy95cWM9Q+PpeiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 9/26/2025 7:30 AM, Bryan O'Donoghue wrote:

> On 25/09/2025 01:02, Jingyi Wang wrote:
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> Add more detailed resource information for CSID devices along with the
>> driver for CSID 1080 that is responsible for CSID register
>> configuration, module reset and IRQ handling for BUF_DONE events.
>>
>> In this CSID version, RUP and AUP update values are split into two
>> registers along with a SET register. Accordingly , enhance the CSID
>> interface to accommodate both the legacy combined reg_update and the
>> split RUP and AUP updates.
>>
>> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>   .../media/platform/qcom/camss/camss-csid-1080.c    | 379 
>> +++++++++++++++++++++
>>   .../media/platform/qcom/camss/camss-csid-1080.h    |  25 ++
>>   drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
>>   drivers/media/platform/qcom/camss/camss.c          |  80 +++++
>>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>>   6 files changed, 494 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile 
>> b/drivers/media/platform/qcom/camss/Makefile
>> index 23960d02877d..3a7ed4f5a004 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -8,6 +8,7 @@ qcom-camss-objs += \
>>           camss-csid-4-7.o \
>>           camss-csid-340.o \
>>           camss-csid-680.o \
>> +        camss-csid-1080.o \
>>           camss-csid-gen2.o \
>>           camss-csid-gen3.o \
>>           camss-csiphy-2ph-1-0.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c 
>> b/drivers/media/platform/qcom/camss/camss-csid-1080.c
>> new file mode 100644
>> index 000000000000..ab5944d4ff34
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
>> @@ -0,0 +1,379 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * camss-csid-1080.c
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
>> +#include <linux/types.h>
>> +#include <linux/v4l2-controls.h>
>> +#include "camss.h"
>> +#include "camss-csid.h"
>> +#include "camss-csid-1080.h"
>> +
>> +/* Reset and Command Registers */
>> +#define CSID_RST_CFG                0x108
>> +#define        RST_MODE                BIT(0)
>> +#define        RST_LOCATION                BIT(4)
>> +
>> +/* Reset and Command Registers */
>> +#define CSID_RST_CMD                0x10C
>> +#define        SELECT_HW_RST                BIT(0)
>> +#define        SELECT_IRQ_RST                BIT(2)
>> +#define CSID_IRQ_CMD                0x110
>> +#define        IRQ_CMD_CLEAR                BIT(0)
>> +
>> +/* Register Update Commands, RUP/AUP */
>> +#define CSID_RUP_CMD                0x114
>> +#define        RUP_RDIN                BIT(8)
>> +#define CSID_AUP_CMD                0x118
>> +#define        AUP_RDIN                BIT(8)
>> +#define CSID_RUP_AUP_CMD            0x11C
>> +#define        RUP_SET                    BIT(0)
>> +#define        MUP                    BIT(4)
>> +
>> +/* Top level interrupt registers */
>> +#define CSID_TOP_IRQ_STATUS            0x180
>> +#define CSID_TOP_IRQ_MASK            0x184
>> +#define CSID_TOP_IRQ_CLEAR            0x188
>> +#define CSID_TOP_IRQ_SET            0x18C
>> +#define        INFO_RST_DONE                BIT(0)
>> +#define        CSI2_RX_IRQ_STATUS            BIT(2)
>> +#define        BUF_DONE_IRQ_STATUS            BIT(3)
>> +#define        RDIn_IRQ_STATUS_OFFSET            16
>> +#define        TOP_IRQ_STATUS_2            BIT(31)
>> +
>> +/* Buffer done interrupt registers */
>> +#define CSID_BUF_DONE_IRQ_STATUS        0x1A0
>> +#define        BUF_DONE_IRQ_STATUS_RDI_OFFSET        16
>> +#define CSID_BUF_DONE_IRQ_MASK            0x1A4
>> +#define CSID_BUF_DONE_IRQ_CLEAR            0x1A8
>> +#define CSID_BUF_DONE_IRQ_SET            0x1AC
>> +
>> +/* CSI2 RX interrupt registers */
>> +#define CSID_CSI2_RX_IRQ_STATUS            0x1B0
>> +#define CSID_CSI2_RX_IRQ_MASK            0x1B4
>> +#define CSID_CSI2_RX_IRQ_CLEAR            0x1B8
>> +#define CSID_CSI2_RX_IRQ_SET            0x1BC
>> +
>> +/* CSI2 RX Configuration */
>> +#define CSID_CSI2_RX_CFG0            0x880
>> +#define        CSI2_RX_CFG0_NUM_ACTIVE_LANES        0
>> +#define        CSI2_RX_CFG0_DL0_INPUT_SEL        4
>> +#define        CSI2_RX_CFG0_PHY_NUM_SEL        20
>> +#define CSID_CSI2_RX_CFG1            0x884
>> +#define        CSI2_RX_CFG1_ECC_CORRECTION_EN        BIT(0)
>> +#define        CSI2_RX_CFG1_VC_MODE            BIT(2)
>> +
>> +/* CSIPHY to hardware PHY selector mapping */
>> +#define CSID_CSIPHY_ID_BASE_OFFSET        1
>
> Please align to the existing namespace and now that I look at it, try 
> to aggregate some of these defines into one place.
>
> Its a bit mindless repeating defines/code in silos within the same 
> driver.
>
> e.g.
>
> grep -r -e CSID_CSIPHY_ID_BASE_OFFSET -e CSI2_RX_CFG0_PHY_SEL_BASE_IDX 
> drivers/media/platform/qcom/camss/*
> drivers/media/platform/qcom/camss/camss-csid-1080.c:#define 
> CSID_CSIPHY_ID_BASE_OFFSET        1
> drivers/media/platform/qcom/camss/camss-csid-1080.c:    val |= 
> (phy->csiphy_id + CSID_CSIPHY_ID_BASE_OFFSET)
> drivers/media/platform/qcom/camss/camss-csid-680.c:#define 
> CSI2_RX_CFG0_PHY_SEL_BASE_IDX            1
> drivers/media/platform/qcom/camss/camss-csid-680.c:    val |= 
> (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << 
> CSI2_RX_CFG0_PHY_NUM_SEL;
> drivers/media/platform/qcom/camss/camss-csid-gen3.c:#define 
> CSI2_RX_CFG0_PHY_SEL_BASE_IDX    1
> drivers/media/platform/qcom/camss/camss-csid-gen3.c:    val |= 
> (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << 
> CSI2_RX_CFG0_PHY_NUM_SEL;
>
> Expectation for v2 here is to review defines ensure the names are 
> consistent with what's upstream and where possible moving common 
> defines into one header.
>  > +

Ack

>> +#define MSM_CSID_MAX_SRC_STREAMS_1080        (csid_is_lite(csid) ? 4 
>> : 5)
>> +
>> +/* RDI Configuration */
>> +#define CSID_RDI_CFG0(rdi) \
>> +    ((csid_is_lite(csid) ? 0x3080 : 0x5480) + 0x200 * (rdi))
>> +#define        RDI_CFG0_RETIME_BS            BIT(5)
>> +#define        RDI_CFG0_TIMESTAMP_EN            BIT(6)
>> +#define        RDI_CFG0_TIMESTAMP_STB_SEL        BIT(8)
>> +#define        RDI_CFG0_DECODE_FORMAT            12
>> +#define        RDI_CFG0_DT                16
>> +#define        RDI_CFG0_VC                22
>> +#define        RDI_CFG0_EN                BIT(31)
>> +
>> +/* RDI Control and Configuration */
>> +#define CSID_RDI_CTRL(rdi) \
>> +    ((csid_is_lite(csid) ? 0x3088 : 0x5488) + 0x200 * (rdi))
>> +#define        RDI_CTRL_START_CMD            BIT(0)
>> +
>> +#define CSID_RDI_CFG1(rdi) \
>> +    ((csid_is_lite(csid) ? 0x3094 : 0x5494) + 0x200 * (rdi))
>> +#define        RDI_CFG1_DROP_H_EN            BIT(5)
>> +#define        RDI_CFG1_DROP_V_EN            BIT(6)
>> +#define        RDI_CFG1_CROP_H_EN            BIT(7)
>> +#define        RDI_CFG1_CROP_V_EN            BIT(8)
>> +#define        RDI_CFG1_PACKING_FORMAT_MIPI        BIT(15)
>> +
>> +/* RDI Pixel Store Configuration */
>> +#define CSID_RDI_PIX_STORE_CFG0(rdi)        (0x5498 + 0x200 * (rdi))
>> +#define        RDI_PIX_STORE_CFG0_EN            BIT(0)
>> +#define        RDI_PIX_STORE_CFG0_MIN_HBI        1
>> +
>> +/* RDI IRQ Status in wrapper */
>> +#define CSID_RDIN_IRQ_STATUS(rdi)        (0x224 + (0x10 * (rdi)))
>> +#define CSID_RDIN_IRQ_MASK(rdi)            (0x228 + (0x10 * (rdi)))
>> +#define CSID_RDIN_IRQ_CLEAR(rdi)        (0x22C + (0x10 * (rdi)))
>> +#define        INFO_RUP_DONE                BIT(23)
>> +
>> +static void __csid_aup_rup_trigger(struct csid_device *csid)
>> +{
>> +    /* trigger SET in combined register */
>> +    writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
>> +}
>> +
>> +static void __csid_aup_update(struct csid_device *csid, int port_id)
>> +{
>> +    csid->aup_update |= AUP_RDIN << port_id;
>> +    writel(csid->aup_update, csid->base + CSID_AUP_CMD);
>> +
>> +    __csid_aup_rup_trigger(csid);
>> +}
>> +
>> +static void __csid_reg_update(struct csid_device *csid, int port_id)
>> +{
>> +    csid->rup_update |= RUP_RDIN << port_id;
>> +    writel(csid->rup_update, csid->base + CSID_RUP_CMD);
>> +
>> +    __csid_aup_rup_trigger(csid);
>> +}
>> +
>> +static void __csid_configure_rx(struct csid_device *csid,
>> +                struct csid_phy_config *phy)
>> +{
>> +    int val;
>> +
>> +    val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>> +    val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>> +    val |= (phy->csiphy_id + CSID_CSIPHY_ID_BASE_OFFSET)
>> +           << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +    writel(val, csid->base + CSID_CSI2_RX_CFG0);
>> +
>> +    val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
>> +    writel(val, csid->base + CSID_CSI2_RX_CFG1);
>> +}
>> +
>> +static void __csid_configure_rx_vc(struct csid_device *csid,
>> +                   struct csid_phy_config *phy, int vc)
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
>> +
>> +    if (enable)
>> +        val = RDI_CTRL_START_CMD;
>> +
>> +    writel(val, csid->base + CSID_RDI_CTRL(rdi));
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
>> +    val = RDI_CFG0_TIMESTAMP_EN;
>> +    val |= RDI_CFG0_TIMESTAMP_STB_SEL;
>> +    val |= RDI_CFG0_RETIME_BS;
>> +
>> +    /* note: for non-RDI path, this should be format->decode_format */
>> +    val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> +    val |= vc << RDI_CFG0_VC;
>> +    val |= format->data_type << RDI_CFG0_DT;
>> +    writel(val, csid->base + CSID_RDI_CFG0(vc));
>> +
>> +    val = RDI_CFG1_PACKING_FORMAT_MIPI;
>> +    writel(val, csid->base + CSID_RDI_CFG1(vc));
>> +
>> +    /* Configure pixel store using dedicated register in 1080 */
>> +    if (!csid_is_lite(csid))
>> +        __csid_configure_rdi_pix_store(csid, vc);
>> +
>> +    val = 0;
>> +    writel(val, csid->base + CSID_RDI_CTRL(vc));
>> +
>> +    val = readl(csid->base + CSID_RDI_CFG0(vc));
>> +
>> +    if (enable)
>> +        val |= RDI_CFG0_EN;
>> +
>> +    writel(val, csid->base + CSID_RDI_CFG0(vc));
>> +}
>> +
>> +static void csid_configure_stream_1080(struct csid_device *csid, u8 
>> enable)
>> +{
>> +    u8 i;
>> +    u8 vc;
>> +
>> +    __csid_configure_rx(csid, &csid->phy);
>> +
>> +    for (vc = 0; vc < MSM_CSID_MAX_SRC_STREAMS_1080; vc++) {
>> +        if (csid->phy.en_vc & BIT(vc)) {
>> +            __csid_configure_rdi_stream(csid, enable, vc);
>> +            __csid_configure_rx_vc(csid, &csid->phy, vc);
>> +
>> +            for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++)
>> +                __csid_aup_update(csid, vc);
>> +
>> +            __csid_reg_update(csid, vc);
>> +
>> +            __csid_ctrl_rdi(csid, enable, vc);
>> +        }
>> +    }
>> +}
>> +
>> +static int csid_configure_testgen_pattern_1080(struct csid_device 
>> *csid,
>> +                           s32 val)
>> +{
>> +    return 0;
>> +}
>> +
>> +static void csid_subdev_reg_update_1080(struct csid_device *csid, 
>> int port_id,
>> +                    bool clear)
>> +{
>> +    /* No explicit clear required */
>> +    if (!clear)
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
>> +static irqreturn_t csid_isr_1080(int irq, void *dev)
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
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++)
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            val = readl(csid->base + CSID_RDIN_IRQ_STATUS(i));
>> +            writel(val, csid->base + CSID_RDIN_IRQ_CLEAR(i));
>> +
>> +            if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + 
>> i)) {
>> +                /*
>> +                 * buf done and RUP IRQ have been moved to CSID from 
>> VFE.
>> +                 * Once CSID received buf done, need notify VFE of this
>> +                 * event and trigger VFE to handle buf done process.
>> +                 */
>> +                camss_buf_done(csid->camss, csid->id, i);
>> +            }
>> +        }
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
>> +static int csid_reset_1080(struct csid_device *csid)
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
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            /* only need to clear Buffer Done IRQ Status here,
>> +             * RUP Done IRQ Status will be cleared once isr
>> +             * strobe generated by CSID_RST_CMD
>> +             */
>
> I like this self-documenting code BTW, thanks for the commentary effort.
Thanks. Will keep it.

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
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void csid_subdev_init_1080(struct csid_device *csid)
>> +{
>> +    csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
>> +}
>> +
>> +const struct csid_hw_ops csid_ops_1080 = {
>> +    .configure_stream = csid_configure_stream_1080,
>> +    .configure_testgen_pattern = csid_configure_testgen_pattern_1080,
>> +    .hw_version = csid_hw_version,
>> +    .isr = csid_isr_1080,
>> +    .reset = csid_reset_1080,
>> +    .src_pad_code = csid_src_pad_code,
>> +    .subdev_init = csid_subdev_init_1080,
>> +    .reg_update = csid_subdev_reg_update_1080,
>> +};
>
> Awaiting access to the register list for this part however, where is
>
> __csid_configure_wrapper(struct csid_device *csid){}
>
> Is this mux not required on your hardware ?
This is not required for Apollo architecture and that there is no 
CSID_SWAPPER_TOP register space.
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.h 
>> b/drivers/media/platform/qcom/camss/camss-csid-1080.h
>> new file mode 100644
>> index 000000000000..f526f3168e33
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * camss-csid-1080.h
>> + *
>> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module 
>> Generation 3
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#ifndef __QC_MSM_CAMSS_CSID_1080_H__
>> +#define __QC_MSM_CAMSS_CSID_1080_H__
>> +
>> +#define DECODE_FORMAT_UNCOMPRESSED_8_BIT    0x1
>> +#define DECODE_FORMAT_UNCOMPRESSED_10_BIT    0x2
>> +#define DECODE_FORMAT_UNCOMPRESSED_12_BIT    0x3
>> +#define DECODE_FORMAT_UNCOMPRESSED_14_BIT    0x4
>> +#define DECODE_FORMAT_UNCOMPRESSED_16_BIT    0x5
>> +#define DECODE_FORMAT_UNCOMPRESSED_20_BIT    0x6
>> +#define DECODE_FORMAT_UNCOMPRESSED_24_BIT    0x7
>> +#define DECODE_FORMAT_PAYLOAD_ONLY        0xf
>> +
>> +#define PLAIN_FORMAT_PLAIN8    0x0 /* supports DPCM, 
>> UNCOMPRESSED_6/8_BIT */
>> +#define PLAIN_FORMAT_PLAIN16    0x1 /* supports DPCM, 
>> UNCOMPRESSED_10/16_BIT */
>> +#define PLAIN_FORMAT_PLAIN32    0x2 /* supports UNCOMPRESSED_20_BIT */
>> +
>> +#endif /* __QC_MSM_CAMSS_CSID_1080_H__ */
>
> This header is a 1:1 
> drivers/media/platform/qcom/camss/camss-csid-gen3.h of its completely 
> redundant.
>
> Please go through your submission and rationalise the copy/pasting.
Ack




