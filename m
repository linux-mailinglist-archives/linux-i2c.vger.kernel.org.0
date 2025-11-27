Return-Path: <linux-i2c+bounces-14321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A87D1C8DAB4
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 11:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 946354E5D3D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C9E2E9729;
	Thu, 27 Nov 2025 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L441Icp3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D528150F
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764237675; cv=none; b=bteXuk3i1UEy/hUIySEX6sq6JySoQa07hZiIJYjmJMr/elaytSoG4Rpfi99oMk/pobjqr4sNdZyRL3gKyWxSc60OeJTeOMtCy1rWz2v2QzWY9zvWNYKkIRsWMxoeszlwWxxL2M6DmQodzeMQkbNDLPAUfpjHyMIYylCCunZffjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764237675; c=relaxed/simple;
	bh=Tl565wd4AFei1r9DwCU+Sv2MgIn/XtesfWSymkidJZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTItHfFrgpEMd6BH1Dyd6t5xz6nox0XTaN//Pfbq40Rjmt26JNP0CbGPz32SUQDQrrsC5egkniYW9qdgABygLNfdsWzr/xDqB2tpY9Q+zLqgi6h6PCizfXXtbbXIToqq6EXK3MLLLG0XAOGBQ4QAgcS8peICfgkOipFHexPtYBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L441Icp3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so396764f8f.2
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 02:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764237670; x=1764842470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJnkEu147dxO1NAhGqlvgI5HMAT4xXYnlM/JoYR7Qe4=;
        b=L441Icp36Lj4US8vN44F3PjmBsC/8i9rkT50V4/zg3LPymzAX/ua4wOSmDcUkxOp7c
         GlEcUE9n5qe2abDJgYnMtKV9qfYrChO7N746aNrQdV95aJfinuS1P8PeFWAHZBaKjY8n
         a/V0HDObqBtiFG0CZSZWoxMIaaGYEy5qrSVRlk5gsa4CDJC7fLfd9W3EA9Vh/hR8tZq9
         XUrMxNpFeszW1StzkSBbzWx+ReIOYkab67a/f/pp5S9K5ail45QqMPe/c6X7rHCsCsgT
         /zCFES1rrfunjHNezqWZRq0GI5tsedPAfLEMK9G5+zD+FSt9zQrDuCIMtRCFUd2EAXy+
         QUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237670; x=1764842470;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJnkEu147dxO1NAhGqlvgI5HMAT4xXYnlM/JoYR7Qe4=;
        b=kcjjV5vxD50YWZIrwPDlp+Yz+w6e8RalofV3vVUEpGbzkc/FPhntd3ndckfXaaCtdz
         nqMtL5STb7aG5oChTiTP8FBz5tOetwgFWuNiiCaYNQpzqU/DBDzQqTKdS04AqGDJ+gPm
         1pVK/FdOrdBTiMJz2NFlGoptf4ypwgBpk2epWGTYnt2IZmg55M5k5oiIXa5sAbvVp75b
         XWY0l35fNwdTgb3zBf29YR0HixQ95FmfjGkF/0F4EmrY7eLVcGIKbxrmw9fzRov408ZH
         ZvneJd+khTOEmTnrym7ou3GDCCbvHYmUdMRi76R0P5mJncBHbNdthOi+4Egv7lIZSoLY
         kKqg==
X-Gm-Message-State: AOJu0Yyud+z4TqK1kCUZjgrWVsViIx6p7GalXR+/yhbJaHa7aOovrZdR
	nO6ip1ckOhBXl/BzmBh/oddvlw96Jlc6h/t1cLJLcel7XmMWWvb0xYj1dN6GqdH6GSg=
X-Gm-Gg: ASbGncvXf/1jHvOqeJrQdAw6twS72ODvSEcOEIGAzsIFxDVToRTvMQjOplvlI65jYkf
	6cnJAguBZZMcPMOMQl5QNPjHwn4I7dglujayco5wUkUuBhwwM/7UsXa3+GBiqcYswjN333lLZFf
	kkBcTCVsHKumIW6YUpKyNZjEe6Hhx9igHCwnPIkDaDbyRb+ZjcYhBrvCx9p1/EnarN/2kWYVVwK
	G2ha8qhk5cuOGoaPT92kqCZoKAd7NmDn0+83Rrko1ekdOXfrTKoZ6GQg7fkDQ0GafWc0RUv5MqT
	eugvM4btGitj6pr9B5/wfBFO63NeZUCQbntHoazliT57RJPveROrtj+D+16KrCFxDi/r5yH5rSQ
	t2laLBZR1CrbcZ1ZqAytvhKKo8MuTdJsaFIsV+sI1/+zSTa5dbFYaa55toaCk640S3G4FicCSwE
	Bp7hV7sxUk3bvVxFrrwho9Kw2jiKJelneTY0EHTtkb8G2lOUiOTZvE
X-Google-Smtp-Source: AGHT+IGaigWayMEX1yKvOy7zk46da1kSIJon99lF+7HztyUi8MD+pWrwYzcWlNjEG2RAQUCnCtxu1w==
X-Received: by 2002:a5d:5e01:0:b0:42b:3e20:f1b0 with SMTP id ffacd0b85a97d-42cc1ac9b39mr22612795f8f.7.1764237670294;
        Thu, 27 Nov 2025 02:01:10 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1caa5d02sm2498589f8f.36.2025.11.27.02.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:01:09 -0800 (PST)
Message-ID: <209403e8-cc49-44aa-b1c7-00f73743ca64@linaro.org>
Date: Thu, 27 Nov 2025 10:01:07 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: qcom: camss: csid: Add support for CSID 980
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-5-646fee2eb720@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-5-646fee2eb720@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2025 09:38, Hangxiang Ma wrote:
> Add more detailed resource information for CSID devices along with the
> driver for CSID 980 that is responsible for CSID register
> configuration, module reset and IRQ handling for BUF_DONE events.
> 
> In SM8750, RUP and AUP updates for the CSID Full modules are split into
> two registers along with a SET register. However, CSID Lite modules
> still use a single register to update RUP and AUP without the additional
> SET register. Handled the difference in the driver.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   drivers/media/platform/qcom/camss/camss-csid-980.c | 428 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
>   drivers/media/platform/qcom/camss/camss.c          |  80 ++++
>   4 files changed, 510 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index a0abbca2b83d..74e12ec65427 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -8,6 +8,7 @@ qcom-camss-objs += \
>   		camss-csid-4-7.o \
>   		camss-csid-340.o \
>   		camss-csid-680.o \
> +		camss-csid-980.o \
>   		camss-csid-1080.o \
>   		camss-csid-gen2.o \
>   		camss-csid-gen3.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-980.c b/drivers/media/platform/qcom/camss/camss-csid-980.c
> new file mode 100644
> index 000000000000..0656a912505a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-980.c
> @@ -0,0 +1,428 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-csid-980.c
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include "camss.h"
> +#include "camss-csid.h"
> +#include "camss-csid-gen3.h"
> +
> +/* Reset and Command Registers */
> +#define CSID_RST_CFG				0xC
> +#define		RST_MODE				BIT(0)
> +#define		RST_LOCATION				BIT(4)
> +
> +/* Reset and Command Registers */
> +#define CSID_RST_CMD				0x10
> +#define		SELECT_HW_RST				BIT(0)
> +#define		SELECT_IRQ_RST				BIT(2)
> +#define CSID_IRQ_CMD				0x14
> +#define		IRQ_CMD_CLEAR				BIT(0)
> +
> +/* Register Update Commands, RUP/AUP */
> +#define CSID_RUP_CMD				0x18
> +#define CSID_AUP_CMD				0x1C
> +#define		CSID_RUP_AUP_RDI(rdi)			(BIT(8) << (rdi))
> +#define CSID_RUP_AUP_CMD			0x20
> +#define		RUP_SET					BIT(0)
> +#define		MUP					BIT(4)
> +
> +#define CSID_LITE_RUP_AUP_CMD			0x18
> +#define		CSID_LITE_RUP_RDI(rdi)		(BIT(4) << (rdi))
> +#define		CSID_LITE_AUP_RDI(rdi)		(BIT(20) << (rdi))
> +
> +/* Top level interrupt registers */
> +#define CSID_TOP_IRQ_STATUS			(csid_is_lite(csid) ? 0x7C : 0x84)
> +#define CSID_TOP_IRQ_MASK			(csid_is_lite(csid) ? 0x80 : 0x88)
> +#define CSID_TOP_IRQ_CLEAR			(csid_is_lite(csid) ? 0x84 : 0x8C)
> +#define CSID_TOP_IRQ_SET			(csid_is_lite(csid) ? 0x88 : 0x90)
> +#define		INFO_RST_DONE				BIT(0)
> +#define		CSI2_RX_IRQ_STATUS			BIT(2)
> +#define		BUF_DONE_IRQ_STATUS			BIT(csid_is_lite(csid) ? 13 : 3)
> +
> +/* Buffer done interrupt registers */
> +#define CSID_BUF_DONE_IRQ_STATUS		(csid_is_lite(csid) ? 0x8C : 0xA4)
> +#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET		(csid_is_lite(csid) ? 1 : 16)
> +#define CSID_BUF_DONE_IRQ_MASK			(csid_is_lite(csid) ? 0x90 : 0xA8)
> +#define CSID_BUF_DONE_IRQ_CLEAR			(csid_is_lite(csid) ? 0x94 : 0xAC)
> +#define CSID_BUF_DONE_IRQ_SET			(csid_is_lite(csid) ? 0x98 : 0xB0)
> +
> +/* CSI2 RX interrupt registers */
> +#define CSID_CSI2_RX_IRQ_STATUS			(csid_is_lite(csid) ? 0x9C : 0xB4)
> +#define CSID_CSI2_RX_IRQ_MASK			(csid_is_lite(csid) ? 0xA0 : 0xB8)
> +#define CSID_CSI2_RX_IRQ_CLEAR			(csid_is_lite(csid) ? 0xA4 : 0xBC)
> +#define CSID_CSI2_RX_IRQ_SET			(csid_is_lite(csid) ? 0xA8 : 0xC0)
> +
> +/* CSI2 RX Configuration */
> +#define CSID_CSI2_RX_CFG0			(csid_is_lite(csid) ? 0x200 : 0x400)
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL		20
> +#define CSID_CSI2_RX_CFG1			(csid_is_lite(csid) ? 0x204 : 0x404)
> +#define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
> +#define		CSI2_RX_CFG1_VC_MODE			BIT(2)
> +
> +#define MSM_CSID_MAX_SRC_STREAMS_980		(csid_is_lite(csid) ? 4 : 5)
> +
> +#define CSID_RDI_CFG0(rdi)                                  \
> +	({                                                  \
> +		__typeof__(rdi) _rdi = (rdi);               \
> +		csid_is_lite(csid) ? 0x500 + 0x100 * _rdi : \
> +				     0xE00 + 0x200 * _rdi;  \
> +	})
> +#define		RDI_CFG0_RETIME_BS			BIT(5)
> +#define		RDI_CFG0_TIMESTAMP_EN			BIT(6)
> +#define		RDI_CFG0_TIMESTAMP_STB_SEL		BIT(8)
> +#define		RDI_CFG0_DECODE_FORMAT			12
> +#define		RDI_CFG0_DT				16
> +#define		RDI_CFG0_VC				22
> +#define		RDI_CFG0_DT_ID				27
> +#define		RDI_CFG0_EN				BIT(31)
> +
> +/* RDI Control and Configuration */
> +#define CSID_RDI_CTRL(rdi)                                  \
> +	({                                                  \
> +		__typeof__(rdi) _rdi = (rdi);               \
> +		csid_is_lite(csid) ? 0x504 + 0x100 * _rdi : \
> +				     0xE04 + 0x200 * _rdi;  \
> +	})
> +#define		RDI_CTRL_START_CMD			BIT(0)
> +
> +#define CSID_RDI_CFG1(rdi)                                  \
> +	({                                                  \
> +		__typeof__(rdi) _rdi = (rdi);               \
> +		csid_is_lite(csid) ? 0x510 + 0x100 * _rdi : \
> +				     0xE10 + 0x200 * _rdi;  \
> +	})
> +#define		RDI_CFG1_DROP_H_EN			BIT(5)
> +#define		RDI_CFG1_DROP_V_EN			BIT(6)
> +#define		RDI_CFG1_CROP_H_EN			BIT(7)
> +#define		RDI_CFG1_CROP_V_EN			BIT(8)
> +#define		RDI_CFG1_PACKING_FORMAT_MIPI		BIT(15)
> +
> +/* RDI Pixel Store Configuration */
> +#define CSID_RDI_PIX_STORE_CFG0(rdi)		(0xE14 + 0x200 * (rdi))
> +#define		RDI_PIX_STORE_CFG0_EN			BIT(0)
> +#define		RDI_PIX_STORE_CFG0_MIN_HBI		1
> +
> +/* RDI IRQ Status in wrapper */
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi) \
> +	(csid_is_lite(csid) ? 0xEC : 0x114 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi) \
> +	(csid_is_lite(csid) ? 0xF4 : 0x11C + 0x10 * (rdi))
> +#define		INFO_RUP_DONE				BIT(23)
> +
> +static void __csid_full_aup_rup_trigger(struct csid_device *csid)
> +{
> +	/* trigger SET in combined register */
> +	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
> +}
> +
> +static void __csid_aup_update(struct csid_device *csid, int port_id)
> +{
> +	if (!csid_is_lite(csid)) {
> +		csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
> +		writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +		__csid_full_aup_rup_trigger(csid);
> +	} else {
> +		csid->reg_update |= CSID_LITE_AUP_RDI(port_id);
> +		writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
> +	}

This is backwards logic

if (csid_is_lite()) {
	/* do stuff */
} else {
	/* do other stuff */
}

Please add a comment to the code to explain why 
__csid_full_aup_rup_trigger is omitted in one case.

> +}
> +
> +static void __csid_rup_update(struct csid_device *csid, int port_id)
> +{
> +	if (!csid_is_lite(csid)) {
> +		csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
> +		writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +		__csid_full_aup_rup_trigger(csid);
> +	} else {
> +		csid->reg_update |= CSID_LITE_RUP_RDI(port_id);
> +		writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
> +	}
> +}
> +
> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	if (csid_is_lite(csid)) {
> +		csid->reg_update &= ~CSID_LITE_RUP_RDI(port_id);
> +		csid->reg_update &= ~CSID_LITE_AUP_RDI(port_id);
> +	} else {
> +		csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
> +		csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
> +	}
> +}

Please be consistent with if (csid_is_lite())
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy)
> +{
> +	int val;
> +
> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +	       << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +}
> +
> +static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
> +{
> +	int val;
> +
> +	if (vc > 3) {
> +		val = readl(csid->base + CSID_CSI2_RX_CFG1);
> +		val |= CSI2_RX_CFG1_VC_MODE;
> +		writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +	}
> +}
> +
> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
> +{
> +	int val = 0;
> +	u32 rdi_ctrl_offset = CSID_RDI_CTRL(rdi);
> +
> +	if (enable)
> +		val = RDI_CTRL_START_CMD;
> +
> +	writel(val, csid->base + rdi_ctrl_offset);
> +}
> +
> +static void __csid_configure_rdi_pix_store(struct csid_device *csid, u8 rdi)
> +{
> +	u32 val;
> +
> +	/* Configure pixel store to allow absorption of hblanking or idle time.
> +	 * This helps with horizontal crop and prevents line buffer conflicts.
> +	 * Reset state is 0x8 which has MIN_HBI=4, we keep the default MIN_HBI
> +	 * and just enable the pixel store functionality.
> +	 */
> +	val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
> +	writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
> +}
> +
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
> +{
> +	u32 val;
> +	u8 lane_cnt = csid->phy.lane_cnt;
> +
> +	/* Source pads matching RDI channels on hardware.
> +	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
> +	 */
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
> +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +
> +	if (!lane_cnt)
> +		lane_cnt = 4;
> +
> +	/*
> +	 * DT_ID is a two bit bitfield that is concatenated with
> +	 * the four least significant bits of the five bit VC
> +	 * bitfield to generate an internal CID value.
> +	 *
> +	 * CSID_RDI_CFG0(vc)
> +	 * DT_ID : 28:27
> +	 * VC    : 26:22
> +	 * DT    : 21:16
> +	 *
> +	 * CID   : VC 3:0 << 2 | DT_ID 1:0
> +	 */
> +	u8 dt_id = vc & 0x03;
> +	u32 rdi_cfg0_offset = CSID_RDI_CFG0(vc);
> +	u32 rdi_cfg1_offset = CSID_RDI_CFG1(vc);
> +	u32 rdi_ctrl_offset = CSID_RDI_CTRL(vc);
> +
> +	val = RDI_CFG0_TIMESTAMP_EN;
> +	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
> +	val |= RDI_CFG0_RETIME_BS;
> +
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |= vc << RDI_CFG0_VC;
> +	val |= format->data_type << RDI_CFG0_DT;
> +	val |= dt_id << RDI_CFG0_DT_ID;
> +	writel(val, csid->base + rdi_cfg0_offset);
> +
> +	val = RDI_CFG1_PACKING_FORMAT_MIPI;
> +	writel(val, csid->base + rdi_cfg1_offset);
> +
> +	/* Configure pixel store using dedicated register in 980 */
> +	if (!csid_is_lite(csid))
> +		__csid_configure_rdi_pix_store(csid, vc);
> +
> +	val = 0;
> +	writel(val, csid->base + rdi_ctrl_offset);
> +
> +	val = readl(csid->base + rdi_cfg0_offset);
> +
> +	if (enable)
> +		val |= RDI_CFG0_EN;
> +
> +	writel(val, csid->base + rdi_cfg0_offset);
> +}
> +
> +static void csid_configure_stream_980(struct csid_device *csid, u8 enable)
> +{
> +	u8 vc, i;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (vc = 0; vc < MSM_CSID_MAX_SRC_STREAMS_980; vc++) {
> +		if (csid->phy.en_vc & BIT(vc)) {
> +			__csid_configure_rdi_stream(csid, enable, vc);
> +			__csid_configure_rx_vc(csid, vc);
> +
> +			for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
> +				__csid_aup_update(csid, vc);
> +				__csid_rup_update(csid, vc);
> +			}
> +
> +			__csid_ctrl_rdi(csid, enable, vc);
> +		}
> +	}
> +}
> +
> +static int csid_configure_testgen_pattern_980(struct csid_device *csid,
> +					      s32 val)
> +{
> +	return 0;
> +}
> +
> +static void csid_subdev_reg_update_980(struct csid_device *csid, int port_id,
> +				       bool clear)
> +{
> +	if (clear)
> +		__csid_aup_rup_clear(csid, port_id);
> +	else
> +		__csid_aup_update(csid, port_id);
> +}
> +
> +/**
> + * csid_isr - CSID module interrupt service routine
> + * @irq: Interrupt line
> + * @dev: CSID device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t csid_isr_980(int irq, void *dev)
> +{
> +	struct csid_device *csid = dev;
> +	u32 val, buf_done_val;
> +	u8 reset_done;
> +	int i;
> +
> +	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +
> +	reset_done = val & INFO_RST_DONE;
> +
> +	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> +	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +			if (val & INFO_RUP_DONE)
> +				csid_subdev_reg_update_980(csid, i, true);
> +
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
> +				camss_buf_done(csid->camss, csid->id, i);
> +		}
> +	}
> +
> +	val = IRQ_CMD_CLEAR;
> +	writel(val, csid->base + CSID_IRQ_CMD);
> +
> +	if (reset_done)
> +		complete(&csid->reset_complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/**
> + * csid_reset - Trigger reset on CSID module and wait to complete
> + * @csid: CSID device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csid_reset_980(struct csid_device *csid)
> +{
> +	unsigned long time;
> +	u32 val;
> +	int i;
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	val = 0;
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			/*
> +			 * Only need to clear buf done IRQ status here,
> +			 * RUP done IRQ status will be cleared once isr
> +			 * strobe generated by CSID_RST_CMD
> +			 */
> +			val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
> +		}
> +	}
> +	writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
> +
> +	/* Clear all IRQ status with CLEAR bits set */
> +	val = IRQ_CMD_CLEAR;
> +	writel(val, csid->base + CSID_IRQ_CMD);
> +
> +	val = RST_LOCATION | RST_MODE;
> +	writel(val, csid->base + CSID_RST_CFG);
> +
> +	val = SELECT_HW_RST | SELECT_IRQ_RST;
> +	writel(val, csid->base + CSID_RST_CMD);
> +
> +	time = wait_for_completion_timeout(&csid->reset_complete,
> +					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
> +
> +	if (!time) {
> +		dev_err(csid->camss->dev, "CSID reset timeout\n");
> +		return -EIO;

-ETIMEDOUT;

> +	}
> +
> +	return 0;
> +}
> +
> +static void csid_subdev_init_980(struct csid_device *csid)
> +{
> +	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
> +}
> +
> +const struct csid_hw_ops csid_ops_980 = {
> +	.configure_stream = csid_configure_stream_980,
> +	.configure_testgen_pattern = csid_configure_testgen_pattern_980,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr_980,
> +	.reset = csid_reset_980,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init_980,
> +	.reg_update = csid_subdev_reg_update_980,
> +};
> +
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 6c214b487003..c77c61ab9c3a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -223,6 +223,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
>   extern const struct csid_hw_ops csid_ops_4_7;
>   extern const struct csid_hw_ops csid_ops_340;
>   extern const struct csid_hw_ops csid_ops_680;
> +extern const struct csid_hw_ops csid_ops_980;
>   extern const struct csid_hw_ops csid_ops_1080;
>   extern const struct csid_hw_ops csid_ops_gen2;
>   extern const struct csid_hw_ops csid_ops_gen3;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index bfc942635682..9dea343c1ac5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3975,6 +3975,84 @@ static const struct camss_subdev_resources csiphy_res_8750[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csid_res_8750[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},

You don't need to initialise to the empty set.

> +		.clock = { "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.is_lite = false,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_980,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.is_lite = false,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_980,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.is_lite = false,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_980,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID_LITE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_980,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID_LITE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_980,
> +			.formats = &csid_formats_gen2
> +		}
> +	}
> +};
> +
>   static const struct resources_icc icc_res_sm8750[] = {
>   	{
>   		.name = "ahb",
> @@ -5406,8 +5484,10 @@ static const struct camss_resources sm8750_resources = {
>   	.version = CAMSS_8750,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_8750,
> +	.csid_res = csid_res_8750,
>   	.icc_res = icc_res_sm8750,
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
> +	.csid_num = ARRAY_SIZE(csid_res_8750),
>   	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
>   };
>   
> 


