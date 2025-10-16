Return-Path: <linux-i2c+bounces-13601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F1FBE5BA2
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 00:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A9174E2B84
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 22:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A28D2E03FE;
	Thu, 16 Oct 2025 22:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8c9orK5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76CF2D47EA
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 22:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760655316; cv=none; b=dq90Uf1j9Ux0AAGcTozB2nME/yA03SRFDAoD+0CccZFU40VbeCJgeJVaOm/g9k3tauzInwgq+9y9WR8GoZQmMwVHI5lZKkBF/cB9CeMH9OQRSaaAdNZJmpb3YYbUwguj0MIXvj2YvQ7wZHJViu9SDJQxp81JQkPKUW3GCBjuaec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760655316; c=relaxed/simple;
	bh=sbpEyPhNHDutkf0H8jW4qzzCrf6KUXz4mGCUPHIHKQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvIm7s+FPbUtpTbGD59JfotSEqA/aw5Ec/eUYqy6qrA8+rAUcJF2jcVDeY+HOx22H6KdmIlsTuLfZj2l7gY1uInqp9ZuyqyZD0xc57nlQRez2XWudV9ur/HWf1gS05+6dU4f5+aJ/9stK90Om1JM9MC47ZphUm2I9N/PlHfBOEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8c9orK5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLQXP002002
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 22:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eR7626PIeqBwAAavUzbk8TEnyorUToI+IQEWTmhbr/c=; b=a8c9orK5Y1xe5BU5
	36tnBffGLM2F1tfqxJJ3Wjwc4xqdQrkzeN9mMzc7/iY9AUb89HAm80x6En8inS/x
	gTxLYaoL1ZZ4MqJZXi3PjC+/Lmdo0XV8YodQ4Z51z8Ri3tuj6sztdkVbueMLL8qp
	xquFyfj35KvK/R4Ve/OQtcv90LH3zlTYeMVd3fqA0eUyuUeyRCFKj7klKQukBgWo
	VtF+N4cuP9JT7iTG1Z/UPz9XauF2WjPAZoqc/pVFuqHqmWt5/8FEMntSQPSUJazE
	sBTYujXM3z2wNiMMIH3AYCIDZt3of/Z+3wPK0v1sn6CxpEkgbsSPJkD997z+gqZZ
	R93SwA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8j1tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 22:55:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b57c2371182so1143564a12.1
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 15:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760655311; x=1761260111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eR7626PIeqBwAAavUzbk8TEnyorUToI+IQEWTmhbr/c=;
        b=nZqqelDmACAwtmauYaXx12CzLNvDDiHyBgPUiRLwxGbFPoRvReqrZ6D+0wH73RxMx6
         ruxJU5tcaVAiM8b99hEeEc9IGuz9+q6bQUJa4yM+qjDNxwjX2+mf5n2C4Mfc9jsSed76
         gczBQwtECjByESRCW5EM/9jljwYcXyIbca+tHvWQ0h0L5rhmg6AvQnTfVh3QIM8pOQ08
         m8t9S+BE+RHtYHdphSDhLVU22EQJRQ1hz47gpo7v11bL2wxAz0tWSCYW2FNyIU7yHp0s
         OdbsQOq9HThl8TIhX7spjTumlgfdcXInNxDxZLWY49HkLv5wJC/ySMmFQ/YfNLIA/ZrE
         QXsw==
X-Gm-Message-State: AOJu0YwRVQ/hE4FLNRkUkK0z4tvb8oO62cX153qrH2X3IvBPCoyAjOX1
	T1GJ4fYZSxXuCblWDAC1hUCA4kYsVSdI0JmvR2591ehE1kcY4x9txi64BWPZcXFiYckyv4KOo0w
	j6QZeRmFDO4Oe+Ft6ZE5Oy2Oao1DO1bdHeUsql7mYraJavXVE0T1r4PbNyzE6Vdc=
X-Gm-Gg: ASbGnctR+zr5JQ1YKbUNrnPplNZQwj3c6cAlVA+0YhKjNMy30kzHZ3kcdbHnesrTA84
	E4AGYlm3tXL5KuVp1ZdISjdVnMPw05xSmjY4X9BT6Xb9aGsVMKBkpfD+5bvhbyxhyAwKimXJeaV
	kAXqMqRNqJ7731zYAa7FfBzSMNzrp1QSdcR9iuSW/76WQ6a8xasi92LoKVjRlwYuIz+tElLadVc
	zH5m7MB8kckxoAKbmAHB+F9ZPVFUYQw380JX3nIHkfXTU+zhdHlD37xcmuSe/VPEqwq1jcN46Ms
	XaTMACugwB0mI4ZH5ZYkiUyLckSzHqbKvfnSWq62zIM3ob4H/wUrvx+EqUntte74jn4lOrIH6v5
	lanH5CjITmyXj+KPwmFc+8iGVAHOHy47Uvxs7qPDImIy6kKJUONFb5g==
X-Received: by 2002:a05:6a21:328a:b0:334:8dcb:567b with SMTP id adf61e73a8af0-334a8643d4amr2330726637.52.1760655310589;
        Thu, 16 Oct 2025 15:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0N+MGfLnNFkcFjWNeDMODK6A5fHmTMm/4fc5cxZFhXiR/SA5nbbDg244b0AelcD0qrXgumQ==
X-Received: by 2002:a05:6a21:328a:b0:334:8dcb:567b with SMTP id adf61e73a8af0-334a8643d4amr2330682637.52.1760655309995;
        Thu, 16 Oct 2025 15:55:09 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22bb1c97sm3923800a12.32.2025.10.16.15.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 15:55:09 -0700 (PDT)
Message-ID: <a2d5cff6-ca95-4993-9cbf-c4fed86dcc84@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 15:55:07 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: qcom: camss: csid: Add support for CSID
 1080
To: Bryan O'Donoghue <bod@kernel.org>,
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
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-5-f5745ba2dff9@oss.qualcomm.com>
 <5f0e081c-30f6-4ff9-b8d2-2af0d87efd23@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <5f0e081c-30f6-4ff9-b8d2-2af0d87efd23@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uyqS0thHW2xAE6c4TQhCUCtXmSGHRdCX
X-Proofpoint-ORIG-GUID: uyqS0thHW2xAE6c4TQhCUCtXmSGHRdCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXz3RknaNYRkrx
 MsEnmfJPEAnA6xJebuDEQag23CtOy9znG/qUD+SF8YfiIrXOAi5LblMpTH3vbyC6UlyAhh+1xjF
 SPpfmSJ01MYF7MlJKzyIDqtpcguUU+0dv+22Mwa2wktbqKRuvz9tsSmwjvik8rveyd9Th2lcXCH
 2Vb48i2A5PI1HzmltigoYeq9osL5Hr6okPwWobcCDixeB51i6KAbthhdefslBNnsF5hhfXKCrgT
 bK/TgtFosb++DX83f6RWXCJnadmpSRralM/PJlN6rQjx+MR/bNlNdu0N1PRMLx/cwDOmXR1hMhL
 HvbGkF2VUGS55Vp960sEQoPlWkvuyx36v0+S2cJa8Naz7S/F4FhEQKPawMhsIC94VFJhwO5uoPO
 9zYzO0nmxftqWOwFIRYP96F8uVy7jQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f177d0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=U01MuhJi62GbzjNfF2gA:9 a=I0FNV-lr8S-b0RcW:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017


On 10/16/2025 3:04 AM, Bryan O'Donoghue wrote:
> On 15/10/2025 03:56, Hangxiang Ma wrote:
>> Add more detailed resource information for CSID devices along with the
>> driver for CSID 1080 that is responsible for CSID register
>> configuration, module reset and IRQ handling for BUF_DONE events. And
>> aggregate a common definition 'CSI2_RX_CFG0_PHY_SEL_BASE_IDX' into csid
>> header file.
>>
>> In this CSID version, RUP and AUP update values are split into two
>> registers along with a SET register. Accordingly , enhance the CSID
>> interface to accommodate both the legacy combined reg_update and the
>> split RUP and AUP updates.
>>
>> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>   .../media/platform/qcom/camss/camss-csid-1080.c    | 371 
>> +++++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
>>   drivers/media/platform/qcom/camss/camss-csid.h     |  12 +-
>>   drivers/media/platform/qcom/camss/camss.c          |  80 +++++
>>   6 files changed, 463 insertions(+), 3 deletions(-)
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
>> index 000000000000..165fbf1998ed
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
>> @@ -0,0 +1,371 @@
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
>> +
>> +#include "camss.h"
>> +#include "camss-csid.h"
>> +#include "camss-csid-gen3.h"
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
>> +#define        INFO_RST_DONE                BIT(0)
>> +#define        CSI2_RX_IRQ_STATUS            BIT(2)
>> +#define        BUF_DONE_IRQ_STATUS            BIT(3)
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
>> +#define MSM_CSID_MAX_SRC_STREAMS_1080 (csid_is_lite(csid) ? 4 : 5)
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
>> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)        (0x224 + (0x10 * (rdi)))
>> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)            (0x228 + (0x10 * 
>> (rdi)))
>> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)        (0x22C + (0x10 * (rdi)))
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
>> +            __csid_configure_rx_vc(csid, vc);
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
>> +            val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>> +            writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
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
>> +            /* Only need to clear Buffer Done IRQ Status here,
>> +             * RUP Done IRQ Status will be cleared once isr
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
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c 
>> b/drivers/media/platform/qcom/camss/camss-csid-680.c
>> index 3ad3a174bcfb..86134a23cd4e 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>> @@ -101,7 +101,6 @@
>>   #define        CSI2_RX_CFG0_DL2_INPUT_SEL            12
>>   #define        CSI2_RX_CFG0_DL3_INPUT_SEL            16
>>   #define        CSI2_RX_CFG0_PHY_NUM_SEL            20
>> -#define        CSI2_RX_CFG0_PHY_SEL_BASE_IDX            1
>>   #define        CSI2_RX_CFG0_PHY_TYPE_SEL            24
>>     #define CSID_CSI2_RX_CFG1                    0x204
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c 
>> b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> index 664245cf6eb0..f09b5575572a 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> @@ -103,7 +103,6 @@
>>   #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi) (csid_is_lite(csid) && 
>> IS_CSID_690(csid) ?\
>>                               (0x34C + 0x100 * (rdi)) :\
>>                               (0x54C + 0x100 * (rdi)))
>> -#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX    1
>>     static void __csid_configure_rx(struct csid_device *csid,
>>                   struct csid_phy_config *phy, int vc)
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h 
>> b/drivers/media/platform/qcom/camss/camss-csid.h
>> index aedc96ed84b2..b5ceb456a394 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -27,8 +27,11 @@
>>   /* CSID hardware can demultiplex up to 4 outputs */
>>   #define MSM_CSID_MAX_SRC_STREAMS    4
>>   +/* CSIPHY to hardware PHY selector mapping */
>> +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
>>   #define CSID_RESET_TIMEOUT_MS 500
>>   +
>
> deadline
>
>>   enum csid_testgen_mode {
>>       CSID_PAYLOAD_MODE_DISABLED = 0,
>>       CSID_PAYLOAD_MODE_INCREMENTING = 1,
>> @@ -154,7 +157,13 @@ struct csid_device {
>>       void __iomem *base;
>>       u32 irq;
>>       char irq_name[30];
>> -    u32 reg_update;
>> +    union {
>> +        u32 reg_update;
>> +        struct {
>> +            u32 rup_update;
>> +            u32 aup_update;
>> +        };
>> +    };
>
> Hrmm. This code looks funny..
>
> Leaving the wisdom of a Union aside - I started looking at this code 
> to see if there was a circumstance where there might be a parallel 
> logical use.. but would be fine as rup_update and aup_update are 
> contiguous in the struct but, then I saw this.
>
> drivers/media/platform/qcom/camss/camss-csid-gen3.c: csid->reg_update 
> &= ~CSID_RUP_AUP_RDI(port_id);
> drivers/media/platform/qcom/camss/camss-csid-gen3.c: csid->reg_update 
> |= CSID_RUP_AUP_RDI(port_id);
>
> and this in your code
>
>
> λ ~/Development/qualcomm/qlt-kernel/ 
> linux-stable/master-reviews-oct15-25* grep aup_update 
> drivers/media/platform/qcom/camss/*
>
> drivers/media/platform/qcom/camss/camss-csid-1080.c:static void 
> __csid_aup_update(struct csid_device *csid, int port_id)
> drivers/media/platform/qcom/camss/camss-csid-1080.c: csid->aup_update 
> |= AUP_RDIN << port_id;
> drivers/media/platform/qcom/camss/camss-csid-1080.c: 
> writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> drivers/media/platform/qcom/camss/camss-csid-1080.c: 
> __csid_aup_update(csid, vc);
> drivers/media/platform/qcom/camss/camss-csid-1080.c: 
> __csid_aup_update(csid, port_id);
> drivers/media/platform/qcom/camss/camss-csid.h:            u32 
> aup_update;
>
> λ ~/Development/qualcomm/qlt-kernel/ 
> linux-stable/master-reviews-oct15-25* grep rup_update 
> drivers/media/platform/qcom/camss/*
>
> drivers/media/platform/qcom/camss/camss-csid-1080.c: csid->rup_update 
> |= RUP_RDIN << port_id;
> drivers/media/platform/qcom/camss/camss-csid-1080.c: 
> writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> drivers/media/platform/qcom/camss/camss-csid.h:            u32 
> rup_update;
>
> All that seems to happen here is bits get set that never get unset in 
> anyway.
>
> How is that correct ?
>
> ---
> bod
>
Actually, I partly agree with you here. Typically, on any architecture, 
software is only required to set the SET bits whenever there is a reg 
update for a path and the hardware takes care of clearing it after 
latching to the updated registers upon the next SOF. The only reason why 
we need to maintain a global variable is to make sure that if the 
RUP/AUP is set for one path and on another thread, we need to set 
RUP/AUP for another path within the same SOF time, if such a concurrency 
is supported with camss. The ideal place to clear the global flags is 
when RUP done is received but then we need to take care of the race 
condition between RUP/AUP set threads and clear threads. I don't see 
other drivers are doing that right now. Do you think it is reasonable to 
address this across the camss driver in a follow up and dedicated patch 
series? The way it is right now, I think there is no functional issue. 
Please correct me if I am wrong. Or we can clear the global variables 
for a path upon RUP done of that path, to be consistent with other 
drivers. Please advise.

