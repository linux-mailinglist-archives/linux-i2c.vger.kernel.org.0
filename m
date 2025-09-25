Return-Path: <linux-i2c+bounces-13191-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB1BA1F95
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 01:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98EC27430C5
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 23:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E83189BB6;
	Thu, 25 Sep 2025 23:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPjecwLX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C62EC54B
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 23:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758843027; cv=none; b=BImaM4VQEqZekzL5vKGfriEgnwbLu+jdv3xIdXqx7DBcR3LwXHAd4SB+tri3C4MQEOmrwGQiTLWprCLZvzdvrUcs9bhxbBbvaePGI6YRaYTV1FubNohE3Vzds5DnYxLPY5F+V85SDNQR4y0BFt/zYY1q+oQT5yyBqFUZ1lKw10Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758843027; c=relaxed/simple;
	bh=FD4Vyz4jMpX28voAixvyLvNQmzE3IZTAqlaRGDNH7o4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ncd9G7msT8g/mG19t8B59bcCkY5TEQaDa0by/Tyl2yo1n+6+YnUT8o34vd5N5zZxfG3tB5w5TiQIO9dmFn76Jrll7pH/SsGZIRccaYiuj1ngjY2pbQoa2QI6VLfpQvlR8ggmtHN5Gy3iDivoR261qSMBrWsdqhqLmWQPMXVDiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPjecwLX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so1059818f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 16:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758843022; x=1759447822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KAxae+zjwIAMMKKsbRgXBy1ypRvp3JNFUJvUpvy97I=;
        b=HPjecwLXwNUcmkjDd2Fq0tElWJt9ySa4hBqnBHwX5H/NUOqqyu5O8rPdHVWTUpsTjH
         UoVR3ledqPeCprV8FuIRGEKe0JHtKjIraOwlf7SOuHU7Z57rdTJW3sFebUCvgjg5D4bA
         h+G4SU+xsjehM9HcJgjV47crnIo/SUIy2QzaeOJ2u7y8lQABqXFludInn4XRXrDdH6/M
         wODsesNT+6QsY6Ip9ZhhU6UuoEHm7qtROGIM24ah432ECcACmLx6TPN/y+Hy0pd6hRdw
         Pm67kYFx8I//QyrfA15a16HSogGT5Fsqr0IzwGcPJ2gZfgcm3ip1hR9B8nTqFK1/zgmL
         qvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758843022; x=1759447822;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KAxae+zjwIAMMKKsbRgXBy1ypRvp3JNFUJvUpvy97I=;
        b=UeYOZZZLAlwAKoMs6YppJZ6RaI+0PS83Yz3oVVoVaD665t3TDjEb+cGq8SAokS12+/
         sgZhseBhf+7z3zcRcHEn9aj3b3BdIpwOg+BnkUyAo6kyLkNAe1lszVi/87QYblEx2EO7
         msOXiTMdclq4CmNDk0w5V3ocgqV+D+zbAPGUKlBVxnijYsb8XgLWvbZD+rSfQ+3iO2zh
         xCsObkcDHme8XvLejCVXdgCvwyY0L7/oQHfF55OlTB1FN1pTlMW0RZP5yz6o1D0wD9T9
         Pt4AU1L8sGgoTuMOSA8/38ORqf6xTThQW06OfQoOOa76DNux5N0A0LWe+hAtDg7ymqX3
         IiBg==
X-Gm-Message-State: AOJu0Yx63zwQrNuva1tTwmcB6UfLtJutIKnD/hSd7U48NyH65rZUUa/p
	ia2Hk+K+gfdMr4qEqXOpu5yE/jvIvvbL58xweIrojds7tsGkpF+45yO6O0O7J1+CJgg=
X-Gm-Gg: ASbGncuIatw1Ve0tgltzLn4iCDbkR1KjYHraVv5NJxO7AI+yd4fp2jB6x5ogCt8WOmy
	9z3deEUGo6QnEdhndN2CGY/AdvP+DtfX5ZpNL7aW4lg8I1KviKIb8/nkdl2ZPiMXi5XtxV9ygVS
	t8mNR2NhuExj0ikcwPqNLPecIBE71vO6NXzfJHDaJgsInBmHev+gVDv6oYZuGJE8ew7/Y+bJSDE
	lH70qiFI9Bzzk26/4KNpIWqouo6uBGKnexNLeF+YSzUlxsDCJ03nYDcpBLpaGfMbcREUZ9KGZfm
	oQQ/UPdRsQiet4I27FBG1d8wX1WJVdAwkllQ0CGkZ9E9vlzMnkIZDxf3X7FxjgEsu8I/pGbOS32
	7UEIIcMncusDuzMJNIHX3PTYA8xHvw9htdtEkGhtUSY2O5OMGx6h/8Hibwh6m5T4jhkISvPtNuS
	uN1Q3bfe4KQaY0tjQzbrk+
X-Google-Smtp-Source: AGHT+IGC9a0lH9w3IAePHQ4GfkN4XCx0pWX8+aWIuxX3qvMeS23yvLiNMCVGoJ0jucMKDV3uFROeJg==
X-Received: by 2002:a5d:5d02:0:b0:3ec:1edb:97af with SMTP id ffacd0b85a97d-40e4b9455e8mr4903955f8f.34.1758843021973;
        Thu, 25 Sep 2025 16:30:21 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc9247e85sm4931481f8f.60.2025.09.25.16.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 16:30:21 -0700 (PDT)
Message-ID: <2d637645-cc92-4b3e-b041-39fdb2e68773@linaro.org>
Date: Fri, 26 Sep 2025 00:30:19 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: qcom: camss: csid: Add support for CSID 1080
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <KPKeewNxMYHc69f7f0abCqplL1uS_gnfQUrfniSoqlut0oQHdAje7zYZYiQQ6PgcVWLTQlhdKW7Mw2oN38ZtEA==@protonmail.internalid>
 <20250924-knp-cam-v1-5-b72d6deea054@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-cam-v1-5-b72d6deea054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 01:02, Jingyi Wang wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add more detailed resource information for CSID devices along with the
> driver for CSID 1080 that is responsible for CSID register
> configuration, module reset and IRQ handling for BUF_DONE events.
> 
> In this CSID version, RUP and AUP update values are split into two
> registers along with a SET register. Accordingly , enhance the CSID
> interface to accommodate both the legacy combined reg_update and the
> split RUP and AUP updates.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   .../media/platform/qcom/camss/camss-csid-1080.c    | 379 +++++++++++++++++++++
>   .../media/platform/qcom/camss/camss-csid-1080.h    |  25 ++
>   drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
>   drivers/media/platform/qcom/camss/camss.c          |  80 +++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   6 files changed, 494 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 23960d02877d..3a7ed4f5a004 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -8,6 +8,7 @@ qcom-camss-objs += \
>   		camss-csid-4-7.o \
>   		camss-csid-340.o \
>   		camss-csid-680.o \
> +		camss-csid-1080.o \
>   		camss-csid-gen2.o \
>   		camss-csid-gen3.o \
>   		camss-csiphy-2ph-1-0.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> new file mode 100644
> index 000000000000..ab5944d4ff34
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> @@ -0,0 +1,379 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-csid-1080.c
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
> +#include <linux/types.h>
> +#include <linux/v4l2-controls.h>
> +#include "camss.h"
> +#include "camss-csid.h"
> +#include "camss-csid-1080.h"
> +
> +/* Reset and Command Registers */
> +#define CSID_RST_CFG				0x108
> +#define		RST_MODE				BIT(0)
> +#define		RST_LOCATION				BIT(4)
> +
> +/* Reset and Command Registers */
> +#define CSID_RST_CMD				0x10C
> +#define		SELECT_HW_RST				BIT(0)
> +#define		SELECT_IRQ_RST				BIT(2)
> +#define CSID_IRQ_CMD				0x110
> +#define		IRQ_CMD_CLEAR				BIT(0)
> +
> +/* Register Update Commands, RUP/AUP */
> +#define CSID_RUP_CMD				0x114
> +#define		RUP_RDIN				BIT(8)
> +#define CSID_AUP_CMD				0x118
> +#define		AUP_RDIN				BIT(8)
> +#define CSID_RUP_AUP_CMD			0x11C
> +#define		RUP_SET					BIT(0)
> +#define		MUP					BIT(4)
> +
> +/* Top level interrupt registers */
> +#define CSID_TOP_IRQ_STATUS			0x180
> +#define CSID_TOP_IRQ_MASK			0x184
> +#define CSID_TOP_IRQ_CLEAR			0x188
> +#define CSID_TOP_IRQ_SET			0x18C
> +#define		INFO_RST_DONE				BIT(0)
> +#define		CSI2_RX_IRQ_STATUS			BIT(2)
> +#define		BUF_DONE_IRQ_STATUS			BIT(3)
> +#define		RDIn_IRQ_STATUS_OFFSET			16
> +#define		TOP_IRQ_STATUS_2			BIT(31)
> +
> +/* Buffer done interrupt registers */
> +#define CSID_BUF_DONE_IRQ_STATUS		0x1A0
> +#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET		16
> +#define CSID_BUF_DONE_IRQ_MASK			0x1A4
> +#define CSID_BUF_DONE_IRQ_CLEAR			0x1A8
> +#define CSID_BUF_DONE_IRQ_SET			0x1AC
> +
> +/* CSI2 RX interrupt registers */
> +#define CSID_CSI2_RX_IRQ_STATUS			0x1B0
> +#define CSID_CSI2_RX_IRQ_MASK			0x1B4
> +#define CSID_CSI2_RX_IRQ_CLEAR			0x1B8
> +#define CSID_CSI2_RX_IRQ_SET			0x1BC
> +
> +/* CSI2 RX Configuration */
> +#define CSID_CSI2_RX_CFG0			0x880
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL		20
> +#define CSID_CSI2_RX_CFG1			0x884
> +#define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
> +#define		CSI2_RX_CFG1_VC_MODE			BIT(2)
> +
> +/* CSIPHY to hardware PHY selector mapping */
> +#define CSID_CSIPHY_ID_BASE_OFFSET		1

Please align to the existing namespace and now that I look at it, try to 
aggregate some of these defines into one place.

Its a bit mindless repeating defines/code in silos within the same driver.

e.g.

grep -r -e CSID_CSIPHY_ID_BASE_OFFSET -e CSI2_RX_CFG0_PHY_SEL_BASE_IDX 
drivers/media/platform/qcom/camss/*
drivers/media/platform/qcom/camss/camss-csid-1080.c:#define 
CSID_CSIPHY_ID_BASE_OFFSET		1
drivers/media/platform/qcom/camss/camss-csid-1080.c:	val |= 
(phy->csiphy_id + CSID_CSIPHY_ID_BASE_OFFSET)
drivers/media/platform/qcom/camss/camss-csid-680.c:#define	 
CSI2_RX_CFG0_PHY_SEL_BASE_IDX			1
drivers/media/platform/qcom/camss/camss-csid-680.c:	val |= 
(phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << 
CSI2_RX_CFG0_PHY_NUM_SEL;
drivers/media/platform/qcom/camss/camss-csid-gen3.c:#define 
CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
drivers/media/platform/qcom/camss/camss-csid-gen3.c:	val |= 
(phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << 
CSI2_RX_CFG0_PHY_NUM_SEL;

Expectation for v2 here is to review defines ensure the names are 
consistent with what's upstream and where possible moving common defines 
into one header.
  > +
> +#define MSM_CSID_MAX_SRC_STREAMS_1080		(csid_is_lite(csid) ? 4 : 5)
> +
> +/* RDI Configuration */
> +#define CSID_RDI_CFG0(rdi) \
> +	((csid_is_lite(csid) ? 0x3080 : 0x5480) + 0x200 * (rdi))
> +#define		RDI_CFG0_RETIME_BS			BIT(5)
> +#define		RDI_CFG0_TIMESTAMP_EN			BIT(6)
> +#define		RDI_CFG0_TIMESTAMP_STB_SEL		BIT(8)
> +#define		RDI_CFG0_DECODE_FORMAT			12
> +#define		RDI_CFG0_DT				16
> +#define		RDI_CFG0_VC				22
> +#define		RDI_CFG0_EN				BIT(31)
> +
> +/* RDI Control and Configuration */
> +#define CSID_RDI_CTRL(rdi) \
> +	((csid_is_lite(csid) ? 0x3088 : 0x5488) + 0x200 * (rdi))
> +#define		RDI_CTRL_START_CMD			BIT(0)
> +
> +#define CSID_RDI_CFG1(rdi) \
> +	((csid_is_lite(csid) ? 0x3094 : 0x5494) + 0x200 * (rdi))
> +#define		RDI_CFG1_DROP_H_EN			BIT(5)
> +#define		RDI_CFG1_DROP_V_EN			BIT(6)
> +#define		RDI_CFG1_CROP_H_EN			BIT(7)
> +#define		RDI_CFG1_CROP_V_EN			BIT(8)
> +#define		RDI_CFG1_PACKING_FORMAT_MIPI		BIT(15)
> +
> +/* RDI Pixel Store Configuration */
> +#define CSID_RDI_PIX_STORE_CFG0(rdi)		(0x5498 + 0x200 * (rdi))
> +#define		RDI_PIX_STORE_CFG0_EN			BIT(0)
> +#define		RDI_PIX_STORE_CFG0_MIN_HBI		1
> +
> +/* RDI IRQ Status in wrapper */
> +#define CSID_RDIN_IRQ_STATUS(rdi)		(0x224 + (0x10 * (rdi)))
> +#define CSID_RDIN_IRQ_MASK(rdi)			(0x228 + (0x10 * (rdi)))
> +#define CSID_RDIN_IRQ_CLEAR(rdi)		(0x22C + (0x10 * (rdi)))
> +#define		INFO_RUP_DONE				BIT(23)
> +
> +static void __csid_aup_rup_trigger(struct csid_device *csid)
> +{
> +	/* trigger SET in combined register */
> +	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
> +}
> +
> +static void __csid_aup_update(struct csid_device *csid, int port_id)
> +{
> +	csid->aup_update |= AUP_RDIN << port_id;
> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->rup_update |= RUP_RDIN << port_id;
> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy)
> +{
> +	int val;
> +
> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |= (phy->csiphy_id + CSID_CSIPHY_ID_BASE_OFFSET)
> +	       << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +}
> +
> +static void __csid_configure_rx_vc(struct csid_device *csid,
> +				   struct csid_phy_config *phy, int vc)
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
> +
> +	if (enable)
> +		val = RDI_CTRL_START_CMD;
> +
> +	writel(val, csid->base + CSID_RDI_CTRL(rdi));
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
> +	val = RDI_CFG0_TIMESTAMP_EN;
> +	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
> +	val |= RDI_CFG0_RETIME_BS;
> +
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |= vc << RDI_CFG0_VC;
> +	val |= format->data_type << RDI_CFG0_DT;
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +
> +	val = RDI_CFG1_PACKING_FORMAT_MIPI;
> +	writel(val, csid->base + CSID_RDI_CFG1(vc));
> +
> +	/* Configure pixel store using dedicated register in 1080 */
> +	if (!csid_is_lite(csid))
> +		__csid_configure_rdi_pix_store(csid, vc);
> +
> +	val = 0;
> +	writel(val, csid->base + CSID_RDI_CTRL(vc));
> +
> +	val = readl(csid->base + CSID_RDI_CFG0(vc));
> +
> +	if (enable)
> +		val |= RDI_CFG0_EN;
> +
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +}
> +
> +static void csid_configure_stream_1080(struct csid_device *csid, u8 enable)
> +{
> +	u8 i;
> +	u8 vc;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (vc = 0; vc < MSM_CSID_MAX_SRC_STREAMS_1080; vc++) {
> +		if (csid->phy.en_vc & BIT(vc)) {
> +			__csid_configure_rdi_stream(csid, enable, vc);
> +			__csid_configure_rx_vc(csid, &csid->phy, vc);
> +
> +			for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++)
> +				__csid_aup_update(csid, vc);
> +
> +			__csid_reg_update(csid, vc);
> +
> +			__csid_ctrl_rdi(csid, enable, vc);
> +		}
> +	}
> +}
> +
> +static int csid_configure_testgen_pattern_1080(struct csid_device *csid,
> +					       s32 val)
> +{
> +	return 0;
> +}
> +
> +static void csid_subdev_reg_update_1080(struct csid_device *csid, int port_id,
> +					bool clear)
> +{
> +	/* No explicit clear required */
> +	if (!clear)
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
> +static irqreturn_t csid_isr_1080(int irq, void *dev)
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
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			val = readl(csid->base + CSID_RDIN_IRQ_STATUS(i));
> +			writel(val, csid->base + CSID_RDIN_IRQ_CLEAR(i));
> +
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
> +				/*
> +				 * buf done and RUP IRQ have been moved to CSID from VFE.
> +				 * Once CSID received buf done, need notify VFE of this
> +				 * event and trigger VFE to handle buf done process.
> +				 */
> +				camss_buf_done(csid->camss, csid->id, i);
> +			}
> +		}
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
> +static int csid_reset_1080(struct csid_device *csid)
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
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			/* only need to clear Buffer Done IRQ Status here,
> +			 * RUP Done IRQ Status will be cleared once isr
> +			 * strobe generated by CSID_RST_CMD
> +			 */

I like this self-documenting code BTW, thanks for the commentary effort.

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
> +	}
> +
> +	return 0;
> +}
> +
> +static void csid_subdev_init_1080(struct csid_device *csid)
> +{
> +	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
> +}
> +
> +const struct csid_hw_ops csid_ops_1080 = {
> +	.configure_stream = csid_configure_stream_1080,
> +	.configure_testgen_pattern = csid_configure_testgen_pattern_1080,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr_1080,
> +	.reset = csid_reset_1080,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init_1080,
> +	.reg_update = csid_subdev_reg_update_1080,
> +};

Awaiting access to the register list for this part however, where is

__csid_configure_wrapper(struct csid_device *csid){}

Is this mux not required on your hardware ?

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.h b/drivers/media/platform/qcom/camss/camss-csid-1080.h
> new file mode 100644
> index 000000000000..f526f3168e33
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * camss-csid-1080.h
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 3
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#ifndef __QC_MSM_CAMSS_CSID_1080_H__
> +#define __QC_MSM_CAMSS_CSID_1080_H__
> +
> +#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
> +#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
> +#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
> +#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x4
> +#define DECODE_FORMAT_UNCOMPRESSED_16_BIT	0x5
> +#define DECODE_FORMAT_UNCOMPRESSED_20_BIT	0x6
> +#define DECODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
> +#define DECODE_FORMAT_PAYLOAD_ONLY		0xf
> +
> +#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
> +#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
> +#define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
> +
> +#endif /* __QC_MSM_CAMSS_CSID_1080_H__ */

This header is a 1:1 drivers/media/platform/qcom/camss/camss-csid-gen3.h 
of its completely redundant.

Please go through your submission and rationalise the copy/pasting.

---
bod

