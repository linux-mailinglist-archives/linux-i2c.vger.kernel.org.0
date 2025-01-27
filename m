Return-Path: <linux-i2c+bounces-9217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B39A1D5CA
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 13:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90A3E164E59
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 12:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264D61FF1A5;
	Mon, 27 Jan 2025 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TgcghL3V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B971FC107;
	Mon, 27 Jan 2025 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737979762; cv=none; b=M8k3LmTOFQwUR32Uj//5cUW1lhtwrPSsTRKAL5nbEIuC4HEgKUKHuTBI4tne9US+R+4rHJHAw2k/wUXp6oEe4k5w8Rs7kR+k1iqOJmzfDJlVOVhY+pq9ZHs2Z54NV6jBrGSmeyYze9IHGn63txPI+imhNzGti7f1NSAigp+nxqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737979762; c=relaxed/simple;
	bh=FOQoxHBvMjfNvxIcgBf+wq1cMdBAPpMv54l3vAi92k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GDIq+BRvrrA7Z3XJYUO9mW4RhrqHIWL6ezyfgMQcctaGz9wA1+6HTvXhNy/qb30DGyblrjIvSar7q0fSXoLd3s3JoG6VqYj+SDQjTJliyeJyenkMDo4kikksGTo3B2bRU0fyBRP1dt8AX449xU8zPcuxAjhA+VrD/Uc2oZ2TTfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TgcghL3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R6KgM5032452;
	Mon, 27 Jan 2025 12:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	na05SEpgfaxGfrxhKnt+IH3a64DodzYD8/1rEC9sw5I=; b=TgcghL3VA3zXWzTc
	L/K9w8ae59bWUWsrYUg/xIsUimB2GgePa+Ame3aLjlrT3cPQHc7WHakm5zji9GOI
	vDwI/DWw2nB3aaxRvLo9VQg0Q3Fil/ufJdz7LvfXYBNwtt/7G4noBJZnSkgxZVvt
	XhuLv23Yq54+y2rU65QyuAjvo4zpvK59VqqNZHJWyHvuKnJJM3IEbrgtSMwHOPBZ
	p79g4xdvGwAVdlz2nQMwQZUsq4BmMjZwuQh4uPR1Z3Vg065UXP8v/MMnptzIynEP
	TJvRFmqSu3+dYQxYroyyEYBeAxkhg2u6sgDJC9Sa9vjCKYtcWOtJ/3lDWlYfyDwJ
	f3Gr5g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e4su0rgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 12:09:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50RC9CYo029618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 12:09:12 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 Jan
 2025 04:09:06 -0800
Message-ID: <b1462fe7-fada-47a4-9b2d-6e7396e9ba6d@quicinc.com>
Date: Mon, 27 Jan 2025 17:37:46 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, <andi.shyti@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <broonie@kernel.or>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
CC: <quic_anupkulk@quicinc.com>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-6-quic_vdadhani@quicinc.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250124105309.295769-6-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tn5bNlQpb2JixZRrNeVBUZlX-cLK4_2Y
X-Proofpoint-GUID: tn5bNlQpb2JixZRrNeVBUZlX-cLK4_2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_05,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270097



On 1/24/2025 4:23 PM, Viken Dadhaniya wrote:
> Load the firmware to QUP SE based on the 'firmware-name' property specified
> in devicetree. Populate Serial engine and base address details in the probe
> function of the protocol driver and pass to firmware load routine.
> 
> Skip the firmware loading if the firmware is already loaded in Serial
> Engine's firmware memory area.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> 
> v1 -> v2:
> 
> - Remove the fixed firmware path and add logic to read the path from the device tree.
> - Remove code related to the 'qcom,load-firmware' property.
> - Resolve kernel test robot warnings.
> - Update the commit message.
> - Update Copyright year.
> 
> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-5-quic_vdadhani@quicinc.com/
> ---
> ---
>   drivers/soc/qcom/qcom-geni-se.c      | 444 +++++++++++++++++++++++++++
>   include/linux/soc/qcom/geni-se.h     |  17 +
>   include/linux/soc/qcom/qup-fw-load.h | 179 +++++++++++
>   3 files changed, 640 insertions(+)
>   create mode 100644 include/linux/soc/qcom/qup-fw-load.h
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 4cb959106efa..069b3f50de75 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   
>   /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
>   #define __DISABLE_TRACE_MMIO__
> @@ -15,6 +16,7 @@
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
>   #include <linux/soc/qcom/geni-se.h>
> +#include <linux/soc/qcom/qup-fw-load.h>
>   
>   /**
>    * DOC: Overview
> @@ -110,6 +112,9 @@ struct geni_se_desc {
>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>   						"qup-memory"};
>   
> +static const char * const protocol_name[] = { "None", "SPI", "UART",
> +					      "I2C", "I3C", "SPI SLAVE"};
> +
>   #define QUP_HW_VER_REG			0x4
>   
>   /* Common SE registers */
> @@ -891,6 +896,445 @@ int geni_icc_disable(struct geni_se *se)
>   }
>   EXPORT_SYMBOL_GPL(geni_icc_disable);
>   
> +/**
> + * elf_phdr_valid: Function to validate elf header.
> + * @phdr: A pointer to a elf header.
> + *
> + * This function validates elf header by comparing fields
> + * stored in p_flags and payload type.
> + *
> + * return: true for success and false for failure/error case.
> + */
> +static bool elf_phdr_valid(const struct elf32_phdr *phdr)
> +{
> +	if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
> +		return false;
> +
> +	if (phdr->p_type == PT_LOAD &&
> +	    (MI_PBT_PAGE_MODE_VALUE(phdr->p_flags) == MI_PBT_NON_PAGED_SEGMENT) &&
> +	    (MI_PBT_SEGMENT_TYPE_VALUE(phdr->p_flags) != MI_PBT_HASH_SEGMENT) &&
> +	    (MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) != MI_PBT_NOTUSED_SEGMENT) &&
> +	    (MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) != MI_PBT_SHARED_SEGMENT))
> +		return true;
> +
> +	return false;
> +}
> +
> +/**
> + * valid_seg_size: Function to validate segment size.
> + * @pelfseg: A pointer to a elf header.
> + * @p_filesz: A pointer to file size.
> + *
> + * This function validates elf segment size by comparing file size
> + *
> + * return: Return true if segment is valid and false if segment is invalid.
> + */
> +static bool valid_seg_size(struct elf_se_hdr *pelfseg, Elf32_Word p_filesz)
> +{
> +	if (p_filesz >= pelfseg->fw_offset +
> +			pelfseg->fw_size_in_items * sizeof(u32) &&
> +	    p_filesz >= pelfseg->cfg_idx_offset +
> +			pelfseg->cfg_size_in_items * sizeof(u8) &&
> +	    p_filesz >= pelfseg->cfg_val_offset +
> +			pelfseg->cfg_size_in_items * sizeof(u32))
> +		return true;
> +	return false;
> +}
> +
> +/**
> + * read_elf: Function to read elf file.
> + * @rsc: A pointer to SE resources structure.
> + * @fw: A pointer to the fw buffer.
> + * @pelfseg: A pointer to SE specific elf header.
> + * @phdr: pointer to one of the valid headers from list from fw buffer.
> + *
> + * This function reads the ELF file and outputs the pointer to header
> + * data which contains the FW data and any other details.
> + *
> + * return: Return 0 if no error, else return error value.
> + */
> +static int read_elf(struct qup_se_rsc *rsc, const struct firmware *fw,
> +		    struct elf_se_hdr **pelfseg, struct elf32_phdr **phdr)
> +{
> +	struct elf32_phdr *phdrs;
> +	const struct elf32_hdr *ehdr;
> +	const u8 *addr;
> +	int i;
> +
> +	ehdr = (struct elf32_hdr *)fw->data;
> +
> +	if (ehdr->e_phnum < 2)
> +		return -EINVAL;
> +
> +	phdrs = (struct elf32_phdr *)(ehdr + 1);
> +
> +	for (i = 0; i < ehdr->e_phnum; i++) {
> +		*phdr = &phdrs[i];
> +		if (!elf_phdr_valid(*phdr))
> +			continue;
> +
> +		if ((*phdr)->p_filesz >= sizeof(struct elf_se_hdr)) {
> +			addr =  fw->data + (*phdr)->p_offset;
> +			*pelfseg = (struct elf_se_hdr *)addr;
> +
> +			if ((*pelfseg)->magic == MAGIC_NUM_SE &&
> +			    (*pelfseg)->version == 1 &&
> +			    valid_seg_size(*pelfseg, (*phdr)->p_filesz))
> +				if ((*pelfseg)->serial_protocol == rsc->protocol &&
> +				    (*pelfseg)->serial_protocol != GENI_SE_NONE)
> +					return 0;
> +		}
> +	}
> +	return -EINVAL;
> +}
> +
> +/**
> + * geni_config_common_control: Function to configure common cgc
> + * and disable high priority interrupt.
> + * @rsc: A pointer to a structure representing SE related resources.
> + *
> + * This function configures cgc and disables high priority interrupt
> + * until current low priority interrupts are handled.
> + *
> + * return: None.
> + */
> +static void geni_config_common_control(struct qup_se_rsc *rsc)
> +{
> +	/*
> +	 * Disable high priority interrupt until current
> +	 * low priority interrupts are handled.
> +	 */
> +	setbits32(rsc->se->wrapper->base + QUPV3_COMMON_CFG,
> +		  FAST_SWITCH_TO_HIGH_DISABLE_BMASK);
> +
> +	/*
> +	 * Set AHB_M_CLK_CGC_ON to indicate hardware controls
> +	 * se-wrapper cgc clock.
> +	 */
> +	setbits32(rsc->se->wrapper->base + QUPV3_SE_AHB_M_CFG,
> +		  AHB_M_CLK_CGC_ON_BMASK);
> +
> +	/* Let hardware to control common cgc. */
> +	setbits32(rsc->se->wrapper->base + QUPV3_COMMON_CGC_CTRL,
> +		  COMMON_CSR_SLV_CLK_CGC_ON_BMASK);
> +}
> +
> +/**
> + * geni_configure_xfer_mode: Function to set transfer mode.
> + * @rsc: A pointer to a structure representing SE related resources.
> + *
> + * This function sets transfer mode FIFO or DMA according to mode
> + * specified by protocol driver..
> + *
> + * return: Return 0 if no error, else return error value.
> + */
> +static int geni_configure_xfer_mode(struct qup_se_rsc *rsc)
> +{
> +	/* Configure SE FIFO, DMA or GSI mode. */
> +	switch (rsc->mode) {
> +	case GENI_GPI_DMA:
> +		setbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
> +		writel_relaxed(0x0, rsc->se->base + SE_IRQ_EN);
> +		writel_relaxed(SE_GSI_EVENT_EN_BMSK, rsc->se->base + SE_GSI_EVENT_EN);
> +		break;
> +
> +	case GENI_SE_FIFO:
> +		clrbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
> +		writel_relaxed(SE_IRQ_EN_RMSK, rsc->se->base + SE_IRQ_EN);
> +		writel_relaxed(0x0, rsc->se->base + SE_GSI_EVENT_EN);
> +		break;
> +
> +	case GENI_SE_DMA:
> +		setbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
> +		writel_relaxed(SE_IRQ_EN_RMSK, rsc->se->base + SE_IRQ_EN);
> +		writel_relaxed(0x0, rsc->se->base + SE_GSI_EVENT_EN);
> +		break;
> +
> +	default:
> +		dev_err(rsc->se->dev, "invalid se mode: %d\n", rsc->mode);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * geni_enable_interrupts: Function to enable interrupts
> + * @rsc: A pointer to a structure representing SE related resources.
> + *
> + * This function enables required interrupt during firmware load process.
> + *
> + * return: None.
> + */
> +static void geni_enable_interrupts(struct qup_se_rsc *rsc)
> +{
> +	u32 reg_value;
> +
> +	/* Enable required interrupts. */
> +	writel_relaxed(M_COMMON_GENI_M_IRQ_EN, rsc->se->base + GENI_M_IRQ_ENABLE);
> +
> +	reg_value = S_CMD_OVERRUN_EN | S_ILLEGAL_CMD_EN |
> +				S_CMD_CANCEL_EN | S_CMD_ABORT_EN |
> +				S_GP_IRQ_0_EN | S_GP_IRQ_1_EN |
> +				S_GP_IRQ_2_EN | S_GP_IRQ_3_EN |
> +				S_RX_FIFO_WR_ERR_EN | S_RX_FIFO_RD_ERR_EN;
> +	writel_relaxed(reg_value, rsc->se->base + GENI_S_IRQ_ENABLE);
> +
> +	/* DMA mode configuration. */
> +	reg_value = DMA_TX_IRQ_EN_SET_RESET_DONE_EN_SET_BMSK |
> +		    DMA_TX_IRQ_EN_SET_SBE_EN_SET_BMSK |
> +		    DMA_TX_IRQ_EN_SET_DMA_DONE_EN_SET_BMSK;
> +	writel_relaxed(reg_value, rsc->se->base + DMA_TX_IRQ_EN_SET);
> +	reg_value = DMA_RX_IRQ_EN_SET_FLUSH_DONE_EN_SET_BMSK |
> +		    DMA_RX_IRQ_EN_SET_RESET_DONE_EN_SET_BMSK |
> +		    DMA_RX_IRQ_EN_SET_SBE_EN_SET_BMSK |
> +		    DMA_RX_IRQ_EN_SET_DMA_DONE_EN_SET_BMSK;
> +	writel_relaxed(reg_value, rsc->se->base + DMA_RX_IRQ_EN_SET);
> +}
> +
> +/**
> + * geni_flash_fw_revision: Function to flash revision
> + * @rsc: A pointer to a structure representing SE related resources.
> + * @hdr: A pointer to ELF header of Serial Engine.
> + * This function flash firmware revision and protocol in respective register.
> + *
> + * return: None.
> + */
> +static void geni_flash_fw_revision(struct qup_se_rsc *rsc, struct elf_se_hdr *hdr)
> +{
> +	u32 reg_value;
> +
> +	/* Flash firmware revision register. */
> +	reg_value = (hdr->serial_protocol << FW_REV_PROTOCOL_SHFT) |
> +		    (hdr->fw_version & 0xFF << FW_REV_VERSION_SHFT);
> +	writel_relaxed(reg_value, rsc->se->base + SE_GENI_FW_REVISION);
> +
> +	reg_value = (hdr->serial_protocol << FW_REV_PROTOCOL_SHFT) |
> +		    (hdr->fw_version & 0xFF << FW_REV_VERSION_SHFT);
> +
> +	writel_relaxed(reg_value, rsc->se->base + SE_S_FW_REVISION);
> +}
> +
> +/**
> + * geni_load_se_fw: Function to load serial engine specific firmware
> + * @rsc: A pointer to a structure representing SE related resources.
> + * @fw: A pointer to Firmware structure.
> + *
> + * This function loads the protocol FW at the IRAM of the SE.
> + *
> + * return: Return 0 if no error, else return error value.
> + */
> +static int geni_load_se_fw(struct qup_se_rsc *rsc, const struct firmware *fw)
> +{
> +	const u32 *fw_val_arr, *cfg_val_arr;
> +	const u8 *cfg_idx_arr;
> +	u32 i, reg_value, mask, ramn_cnt;
> +	int ret = 0;
> +	struct elf_se_hdr *hdr;
> +	struct elf32_phdr *phdr;
> +
> +	ret = geni_icc_set_bw(rsc->se);
> +	if (ret) {
> +		dev_err(rsc->se->dev, "%s: Failed to set ICC BW %d\n",  __func__, ret);
> +		return ret;
> +	}
> +
> +	ret = geni_icc_enable(rsc->se);
> +	if (ret) {
> +		dev_err(rsc->se->dev, "%s: Failed to enable ICC %d\n",  __func__, ret);
> +		return ret;
> +	}
> +
> +	ret =  geni_se_resources_on(rsc->se);
> +	if (ret) {
> +		dev_err(rsc->se->dev, "%s: Failed to enable common clocks %d\n",  __func__, ret);
> +		goto err;
> +	}
> +
> +	ret = read_elf(rsc, fw, &hdr, &phdr);
> +	if (ret) {
> +		dev_err(rsc->se->dev, "%s: elf parsing failed ret: %d\n",  __func__, ret);
> +		goto err;
> +	}
> +
> +	fw_val_arr = (const u32 *)((u8 *)hdr + hdr->fw_offset);
> +	cfg_idx_arr = (const u8 *)hdr + hdr->cfg_idx_offset;
> +	cfg_val_arr = (const u32 *)((u8 *)hdr + hdr->cfg_val_offset);
> +
> +	geni_config_common_control(rsc);
> +
> +	/* Allows to drive corresponding data according to hardware value. */
> +	writel_relaxed(0x0, rsc->se->base + GENI_OUTPUT_CTRL);
> +
> +	/* Set SCLK and HCLK to program RAM */
> +	setbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK
> +			| GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
> +	writel_relaxed(0x0, rsc->se->base + SE_GENI_CLK_CTRL);
> +	clrbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK
> +			| GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
> +
> +	/* Enable required clocks for DMA CSR, TX and RX. */
> +	reg_value = DMA_GENERAL_CFG_AHB_SEC_SLV_CLK_CGC_ON_BMSK |
> +		       DMA_GENERAL_CFG_DMA_AHB_SLV_CLK_CGC_ON_BMSK |
> +		       DMA_GENERAL_CFG_DMA_TX_CLK_CGC_ON_BMSK |
> +		       DMA_GENERAL_CFG_DMA_RX_CLK_CGC_ON_BMSK;
> +
> +	setbits32(rsc->se->base + DMA_GENERAL_CFG, reg_value);
> +
> +	/* Let hardware to control CGC by default. */
> +	writel_relaxed(DEFAULT_CGC_EN, rsc->se->base + GENI_CGC_CTRL);
> +
> +	/* Set version of the configuration register part of firmware. */
> +	writel_relaxed(hdr->cfg_version, rsc->se->base + GENI_INIT_CFG_REVISION);
> +	writel_relaxed(hdr->cfg_version, rsc->se->base + GENI_S_INIT_CFG_REVISION);
> +
> +	/* Configure geni primitive table. */
> +	for (i = 0; i < hdr->cfg_size_in_items; i++)
> +		writel_relaxed(cfg_val_arr[i], rsc->se->base +
> +			       GENI_CFG_REG0 + (cfg_idx_arr[i] * sizeof(u32)));
> +
> +	/* Configure condition for assertion of RX_RFR_WATERMARK condition. */
> +	reg_value = readl_relaxed(rsc->se->base + QUPV3_SE_HW_PARAM_1);
> +	mask = (reg_value >> RX_FIFO_WIDTH_BIT) & RX_FIFO_WIDTH_MASK;
> +	writel_relaxed(mask - 2, rsc->se->base + GENI_RX_RFR_WATERMARK_REG);
> +
> +	/* Let hardware to control CGC */
> +	setbits32(rsc->se->base + GENI_OUTPUT_CTRL, DEFAULT_IO_OUTPUT_CTRL_MSK);
> +
> +	ret = geni_configure_xfer_mode(rsc);
> +	if (ret)
> +		goto err_resource;
> +
> +	geni_enable_interrupts(rsc);
> +
> +	geni_flash_fw_revision(rsc, hdr);
> +
> +	ramn_cnt = hdr->fw_size_in_items;
> +	if (hdr->fw_size_in_items % 2 != 0)
> +		ramn_cnt++;
> +
> +	if (ramn_cnt >= MAX_GENI_CFG_RAMn_CNT)
> +		goto err_resource;
> +
> +	/* Program RAM address space. */
> +	memcpy((rsc->se->base + SE_GENI_CFG_RAMN), fw_val_arr,
> +	       ramn_cnt * sizeof(u32));
> +
> +	/* Put default values on GENI's output pads. */
> +	writel_relaxed(0x1, rsc->se->base + GENI_FORCE_DEFAULT_REG);
> +
> +	/* High to low SCLK and HCLK to finish RAM. */
> +	setbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK
> +				| GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
> +	setbits32(rsc->se->base + SE_GENI_CLK_CTRL, GENI_CLK_CTRL_SER_CLK_SEL_BMSK);
> +	clrbits32(rsc->se->base + GENI_CGC_CTRL,
> +		  (GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
> +		   GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK));
> +
> +	/* Serial engine DMA interface is enabled. */
> +	setbits32(rsc->se->base + SE_DMA_IF_EN, DMA_IF_EN_DMA_IF_EN_BMSK);
> +
> +	/* Enable or disable FIFO interface of the serial engine. */
> +	if (rsc->mode == GENI_SE_FIFO)
> +		clrbits32(rsc->se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
> +	else
> +		setbits32(rsc->se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
> +
> +err_resource:
> +	geni_se_resources_off(rsc->se);
> +err:
> +	geni_icc_disable(rsc->se);
> +	return ret;
> +}
> +
> +/**
> + * qup_fw_load: Function to initiate firmware load
> + * @rsc: A pointer to a structure representing SE related resources.
> + *
> + * This function is called for loading the firmware into a particular
> + * SE. This is achieved by reading the associated ELF file, copying
> + * the data in the ELF file into buffer in kernel space using
> + * request_firmware API's. The data is then written in the SE's
> + * IRAM register and the buffers are freed after.  Overall, this
> + * function handles firmware loading and parsing for a specific protocol.
> + *
> + * return: Return 0 if no error, else return error value.
> + */
> +static int qup_fw_load(struct qup_se_rsc *rsc, const char *fw_name)
> +{
> +	int ret;
> +	const struct firmware *fw;
> +	struct device *dev = rsc->se->dev;
> +
> +	ret = request_firmware(&fw, fw_name, dev);
> +	if (ret) {
> +		dev_err(dev, "request_firmware failed for %d: %d\n", rsc->protocol, ret);
> +		return ret;
> +	}
> +
> +	ret = (rsc->protocol != GENI_SE_NONE) ? geni_load_se_fw(rsc, fw) : -EINVAL;
> +
> +	release_firmware(fw);
> +
> +	return ret;
> +}
> +
> +/**
> + * geni_load_se_firmware: Function to initiate firmware loading.
> + * @se: Serial engine details.
> + * @protocol: protocol from spi, i2c or uart for which firmware to
> + * be loaded
> + *
> + * This function is called from the probe function of protocol driver.
> + * if dtsi properties are configured to load QUP firmware and firmware
> + * is already not loaded, it will start firmware loading. if dtsi
> + * properties are not defined,it will skip loading firmware assuming
> + * it is already loaded by TZ.
> + *
> + * return: Return 0 if no error, else return error value.
> + */
> +int geni_load_se_firmware(struct geni_se *se,
> +			  enum geni_se_protocol_type protocol)
> +{
> +	struct qup_se_rsc rsc;
> +	const char *fw_name;
> +	int ret;
> +
> +	ret = device_property_read_string(se->wrapper->dev, "firmware-name", &fw_name);
> +	if (ret)
> +		return  -EINVAL;
> +
> +	rsc.se = se;
> +	rsc.protocol = protocol;
> +
> +	/* Set default xfer mode to FIFO*/
> +	rsc.mode = GENI_SE_FIFO;
This needs to be moved after reading  "qcom,xfer-mode", there you can 
override.
Also please mention UART doesn't support GPI_DMA mode hence can override 
with SE_FIFO.
> +	of_property_read_u32(se->dev->of_node, "qcom,xfer-mode", &rsc.mode);
> +	switch (rsc.mode) {
> +	case GENI_SE_FIFO:
> +	case GENI_SE_DMA:
> +	case GENI_GPI_DMA:
> +		break;
> +	default:
> +		dev_err(se->dev, "Invalid xfer mode specified: %d\n", rsc.mode);
> +		return -EINVAL;
> +	}
> +
> +	ret = qup_fw_load(&rsc, fw_name);
> +	if (ret) {
> +		dev_err(se->dev,  "Firmware Loading failed for proto: %s Error: %d\n",
> +			protocol_name[rsc.protocol], ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(se->dev, "Firmware load for %s protocol is Success for xfer mode %d\n",
> +		protocol_name[rsc.protocol], rsc.mode);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(geni_load_se_firmware);
> +
>   static int geni_se_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
> index 2996a3c28ef3..289fa6675d2b 100644
> --- a/include/linux/soc/qcom/geni-se.h
> +++ b/include/linux/soc/qcom/geni-se.h
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
>    * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #ifndef _LINUX_QCOM_GENI_SE
> @@ -72,6 +73,19 @@ struct geni_se {
>   	struct geni_icc_path icc_paths[3];
>   };
>   
> +/**
> + * struct qup_se_rsc - Structure containing se details protocol and xfer mode
> + *
> + * @mode: transfer mode se fifo, dma or gsi.
> + * @protocol: Protocol spi or i2c or serial.
> + * @se: Pointer to the concerned serial engine.
> + */
> +struct qup_se_rsc {
> +	struct geni_se *se;
> +	enum geni_se_xfer_mode mode;
> +	enum geni_se_protocol_type protocol;
> +};
> +
>   /* Common SE registers */
>   #define GENI_FORCE_DEFAULT_REG		0x20
>   #define GENI_OUTPUT_CTRL		0x24
> @@ -531,5 +545,8 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag);
>   int geni_icc_enable(struct geni_se *se);
>   
>   int geni_icc_disable(struct geni_se *se);
> +
> +int geni_load_se_firmware(struct geni_se *se,
> +			  enum geni_se_protocol_type protocol);
>   #endif
>   #endif
> diff --git a/include/linux/soc/qcom/qup-fw-load.h b/include/linux/soc/qcom/qup-fw-load.h
> new file mode 100644
> index 000000000000..b9b58e81f5cb
> --- /dev/null
> +++ b/include/linux/soc/qcom/qup-fw-load.h
> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#ifndef _LINUX_QCOM_QUP_FW_LOAD
> +#define _LINUX_QCOM_QUP_FW_LOAD
> +
> +#include <linux/device.h>
> +#include <linux/elf.h>
> +#include <linux/firmware.h>
> +#include <linux/kernel.h>
> +
> +/*Magic numbers*/
> +#define MAGIC_NUM_SE			0x57464553
> +
> +/* Common SE registers*/
> +#define GENI_INIT_CFG_REVISION		0x0
> +#define GENI_S_INIT_CFG_REVISION	0x4
> +#define GENI_FORCE_DEFAULT_REG		0x20
> +#define GENI_CGC_CTRL			0x28
> +#define GENI_CFG_REG0			0x100
> +
> +#define	QUPV3_SE_HW_PARAM_1		0xE28
> +#define	RX_FIFO_WIDTH_BIT		24
> +#define	RX_FIFO_WIDTH_MASK		0x3F
> +
> +/*Same registers as GENI_DMA_MODE_EN*/
> +#define QUPV3_SE_GENI_DMA_MODE_EN	0x258
> +#define GENI_M_IRQ_ENABLE		0x614
> +#define GENI_S_IRQ_ENABLE		0x644
> +#define GENI_RX_RFR_WATERMARK_REG	0x814
> +#define DMA_TX_IRQ_EN_SET		0xC4C
> +#define DMA_RX_IRQ_EN_SET		0xD4C
> +#define DMA_GENERAL_CFG			0xE30
> +#define SE_GENI_FW_REVISION		0x1000
> +#define SE_S_FW_REVISION		0x1004
> +#define SE_GENI_CFG_RAMN		0x1010
> +#define SE_GENI_CLK_CTRL		0x2000
> +#define SE_DMA_IF_EN			0x2004
> +#define SE_FIFO_IF_DISABLE		0x2008
> +
> +#define MAX_GENI_CFG_RAMn_CNT		455
> +
> +#define MI_PBT_NON_PAGED_SEGMENT	0x0
> +#define MI_PBT_HASH_SEGMENT		0x2
> +#define MI_PBT_NOTUSED_SEGMENT		0x3
> +#define MI_PBT_SHARED_SEGMENT		0x4
> +#define MI_PBT_FLAG_PAGE_MODE_MASK	0x100000
> +#define MI_PBT_FLAG_PAGE_MODE_SHIFT	0x14
> +#define MI_PBT_FLAG_SEGMENT_TYPE_MASK	0x7000000
> +#define MI_PBT_FLAG_SEGMENT_TYPE_SHIFT	0x18
> +#define MI_PBT_FLAG_ACCESS_TYPE_MASK	0xE00000
> +#define MI_PBT_FLAG_ACCESS_TYPE_SHIFT	0x15
> +
> +#define MI_PBT_PAGE_MODE_VALUE(x) \
> +	(((x) & MI_PBT_FLAG_PAGE_MODE_MASK) >> \
> +	  MI_PBT_FLAG_PAGE_MODE_SHIFT)
> +
> +#define MI_PBT_SEGMENT_TYPE_VALUE(x) \
> +	(((x) & MI_PBT_FLAG_SEGMENT_TYPE_MASK) >> \
> +		MI_PBT_FLAG_SEGMENT_TYPE_SHIFT)
> +
> +#define MI_PBT_ACCESS_TYPE_VALUE(x) \
> +	(((x) & MI_PBT_FLAG_ACCESS_TYPE_MASK) >> \
> +	  MI_PBT_FLAG_ACCESS_TYPE_SHIFT)
> +
> +/* GENI_FORCE_DEFAULT_REG fields */
> +#define FORCE_DEFAULT			BIT(0)
> +
> +/* FW_REVISION_RO fields */
> +#define FW_REV_PROTOCOL_SHFT		8
> +#define FW_REV_VERSION_SHFT		0
> +
> +#define GENI_FW_REVISION_RO		0x68
> +#define GENI_S_FW_REVISION_RO		0x6C
> +
> +/* SE_GENI_DMA_MODE_EN */
> +#define GENI_DMA_MODE_EN		BIT(0)
> +
> +/* GENI_M_IRQ_EN fields */
> +#define M_CMD_DONE_EN			BIT(0)
> +#define M_IO_DATA_DEASSERT_EN		BIT(22)
> +#define M_IO_DATA_ASSERT_EN		BIT(23)
> +#define M_RX_FIFO_RD_ERR_EN		BIT(24)
> +#define M_RX_FIFO_WR_ERR_EN		BIT(25)
> +#define M_RX_FIFO_WATERMARK_EN		BIT(26)
> +#define M_RX_FIFO_LAST_EN		BIT(27)
> +#define M_TX_FIFO_RD_ERR_EN		BIT(28)
> +#define M_TX_FIFO_WR_ERR_EN		BIT(29)
> +#define M_TX_FIFO_WATERMARK_EN		BIT(30)
> +#define M_COMMON_GENI_M_IRQ_EN	(GENMASK(6, 1) | \
> +				M_IO_DATA_DEASSERT_EN | \
> +				M_IO_DATA_ASSERT_EN | M_RX_FIFO_RD_ERR_EN | \
> +				M_RX_FIFO_WR_ERR_EN | M_TX_FIFO_RD_ERR_EN | \
> +				M_TX_FIFO_WR_ERR_EN)
> +
> +/* GENI_S_IRQ_EN fields */
> +#define S_CMD_OVERRUN_EN		BIT(1)
> +#define S_ILLEGAL_CMD_EN		BIT(2)
> +#define S_CMD_CANCEL_EN			BIT(4)
> +#define S_CMD_ABORT_EN			BIT(5)
> +#define S_GP_IRQ_0_EN			BIT(9)
> +#define S_GP_IRQ_1_EN			BIT(10)
> +#define S_GP_IRQ_2_EN			BIT(11)
> +#define S_GP_IRQ_3_EN			BIT(12)
> +#define S_RX_FIFO_RD_ERR_EN		BIT(24)
> +#define S_RX_FIFO_WR_ERR_EN		BIT(25)
> +#define S_COMMON_GENI_S_IRQ_EN	(GENMASK(5, 1) | GENMASK(13, 9) | \
> +				 S_RX_FIFO_RD_ERR_EN | S_RX_FIFO_WR_ERR_EN)
> +
> +#define GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK		0x00000200
> +#define GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK		0x00000100
> +
> +#define GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK		0x00000001
> +
> +#define DMA_TX_IRQ_EN_SET_RESET_DONE_EN_SET_BMSK	0x00000008
> +#define DMA_TX_IRQ_EN_SET_SBE_EN_SET_BMSK		0x00000004
> +#define DMA_TX_IRQ_EN_SET_DMA_DONE_EN_SET_BMSK		0x00000001
> +
> +#define DMA_RX_IRQ_EN_SET_FLUSH_DONE_EN_SET_BMSK	0x00000010
> +#define DMA_RX_IRQ_EN_SET_RESET_DONE_EN_SET_BMSK	0x00000008
> +#define DMA_RX_IRQ_EN_SET_SBE_EN_SET_BMSK		0x00000004
> +#define DMA_RX_IRQ_EN_SET_DMA_DONE_EN_SET_BMSK		0x00000001
> +
> +#define DMA_GENERAL_CFG_AHB_SEC_SLV_CLK_CGC_ON_BMSK	0x00000008
> +#define DMA_GENERAL_CFG_DMA_AHB_SLV_CLK_CGC_ON_BMSK	0x00000004
> +#define DMA_GENERAL_CFG_DMA_TX_CLK_CGC_ON_BMSK		0x00000002
> +#define DMA_GENERAL_CFG_DMA_RX_CLK_CGC_ON_BMSK		0x00000001
> +
> +#define GENI_CLK_CTRL_SER_CLK_SEL_BMSK			0x00000001
> +#define DMA_IF_EN_DMA_IF_EN_BMSK			0x00000001
> +#define SE_GSI_EVENT_EN_BMSK				0x0000000f
> +#define SE_IRQ_EN_RMSK					0x0000000f
> +
> +#define QUPV3_COMMON_CFG				0x0120
> +#define FAST_SWITCH_TO_HIGH_DISABLE_BMASK		0x00000001
> +
> +#define QUPV3_SE_AHB_M_CFG				0x0118
> +#define AHB_M_CLK_CGC_ON_BMASK				0x00000001
> +
> +#define QUPV3_COMMON_CGC_CTRL				0x021C
> +#define COMMON_CSR_SLV_CLK_CGC_ON_BMASK			0x00000001
> +
> +/* access ports */
> +#define setbits32(_addr, _v) out_be32((_addr), in_be32(_addr) |  (_v))
> +#define clrbits32(_addr, _v) out_be32((_addr), in_be32(_addr) & ~(_v))
> +
> +#define out_be32(a, v) writel_relaxed(v, a)
> +#define in_be32(a) readl_relaxed(a)
> +
> +/**
> + * struct elf_se_hdr - firmware configurations
> + *
> + * @magic: set to 'SEFW'
> + * @version: A 32-bit value indicating the structure’s version number
> + * @core_version: QUPV3_HW_VERSION
> + * @serial_protocol: Programmed into GENI_FW_REVISION
> + * @fw_version: Programmed into GENI_FW_REVISION
> + * @cfg_version: Programmed into GENI_INIT_CFG_REVISION
> + * @fw_size_in_items: Number of (uint32_t) GENI_FW_RAM words
> + * @fw_offset: Byte offset of GENI_FW_RAM array
> + * @cfg_size_in_items: Number of GENI_FW_CFG index/value pairs
> + * @cfg_idx_offset: Byte offset of GENI_FW_CFG index array
> + * @cfg_val_offset: Byte offset of GENI_FW_CFG values array
> + */
> +struct elf_se_hdr {
> +	u32 magic;
> +	u32 version;
> +	u32 core_version;
> +	u16 serial_protocol;
> +	u16 fw_version;
> +	u16 cfg_version;
> +	u16 fw_size_in_items;
> +	u16 fw_offset;
> +	u16 cfg_size_in_items;
> +	u16 cfg_idx_offset;
> +	u16 cfg_val_offset;
> +};
> +#endif /* _LINUX_QCOM_QUP_FW_LOAD */


