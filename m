Return-Path: <linux-i2c+bounces-10514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D74A95E3B
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 08:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 892E47A52A9
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 06:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7892E21B18C;
	Tue, 22 Apr 2025 06:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SYBylvLr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A964F50F;
	Tue, 22 Apr 2025 06:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303563; cv=none; b=DKFKWP+4+JfNU+w3en33itW4TwgD691q8NvZ8aoxPBm9J+5y85x4E8A5DJoM+aFMqZ3hG4V50IQwIen9f82e8PdzD/TJWHMrBmNbDje43iduM5ZhQg1Oz0n8B3JnsbHCzNJpkJUKvW9EGei1ppwqUve1CIyNF9yHjwEPKK6bz40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303563; c=relaxed/simple;
	bh=3bOFDqZN8mFfzHH7/oBFTkb4ylRc8sQAN164yjzSJJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dw34awO0zAwwrV6QCTFtVquL4MWDo+t6BbuBP4bMu6itBdl7KX9tqsEE3TpVIuk6Hh2Nyht5YDEBj022Pmc398dSeVuCRAUYJxdiRd3hasweLsiJIOgEjJKjhcAq3+Kqlhi6gnIENkCiX/WeeuMWD6Zxb/Bm0QlODHuJuxosOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SYBylvLr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4P07j008287;
	Tue, 22 Apr 2025 06:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mH3KFYXHmoelahwHcXBa7Aplg+FXOXJN/xBTrVHjFbc=; b=SYBylvLrFKtlSX/j
	RsZBvbOoOrTSedSVHmeHfFO02ujd38kIWlFAEVjWKAIBBmJDzaKNmuvJCrnxQGq/
	/EZ5Uu44QJ7RrQ6ru8Ho+I/WTZBYMI1d0s3hHVigm5v3DVXqUbeOsl+WKrAXil4G
	GB8BJs3aj71i4u7ck95G51OWkgi/euicZVnplw7ge97/n/MPLLd6LZNbyEJUCkeS
	TF/BrwjsatvvPqrBIYFXHxDHzX9SK0yLOto/QmidqL68l4Mm+NjIeO3UpEqJqlpN
	5021yZwnDgWqvyZL9nEra3EPvHiQAtJexsLVDoA7aO2wcSOoc/m5vBTepxceNSKQ
	3xrfzw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1ed3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 06:32:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53M6WWJl021849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 06:32:32 GMT
Received: from [10.50.21.133] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Apr
 2025 23:32:26 -0700
Message-ID: <ac2f3d9a-1dd5-48c0-abc3-b541720d244c@quicinc.com>
Date: Tue, 22 Apr 2025 12:02:23 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
To: Bjorn Andersson <andersson@kernel.org>
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <broonie@kernel.or>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <quic_msavaliy@quicinc.com>,
        <quic_anupkulk@quicinc.com>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
 <2kmnhxj3je366livo67btpbmjiyeyx4q23of42ng4co6xngemj@kitsdtqepgce>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <2kmnhxj3je366livo67btpbmjiyeyx4q23of42ng4co6xngemj@kitsdtqepgce>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=68073801 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=P8Qh-Th4AjyJXTUAxt8A:9
 a=KGXNd6_PMDzJ1iBM:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SpYblxVVzujVdRBRk9QC6XSz790MvqS6
X-Proofpoint-ORIG-GUID: SpYblxVVzujVdRBRk9QC6XSz790MvqS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_03,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220049



On 3/6/2025 4:57 AM, Bjorn Andersson wrote:
> On Mon, Mar 03, 2025 at 06:13:46PM +0530, Viken Dadhaniya wrote:
>> Load the firmware to QUP SE based on the 'firmware-name' property specified
> 
> Please start your commit message with a description of "the problem"
> you're trying to solve, explain that QUP firmware is typically loaded by
> the "bootloader" and that for <reason> you're adding support for loading
> firmware are load time. Please read and follow:
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
>> in devicetree. Populate Serial engine and base address details in the probe
>> function of the protocol driver and pass to firmware load routine.
> 
> Don't describe the code flow, describe how this fits into the bigger
> picture. E.g. that SE-functional drivers will load this at bootup.
> 
>>
>> Skip the firmware loading if the firmware is already loaded in Serial
>> Engine's firmware memory area.
>>
> 
> Above description should be clear enough that this is obvious.
> 
>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>> v2 -> v3:
>>
>> - Remove code related to the 'qcom,xfer-mode' property.
>> - Add logic to read the boolean property 'qcom,gsi-dma-allowed' and select the transfer mode.
>> - Hardcode FIFO mode for the serial driver as GSI mode is currently not supported.
>> - Update function descriptions as suggested.
>> - Enhance error handling and remove redundant if conditions.
>> - Drop the ternary operator.
>>
>> v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-6-quic_vdadhani@quicinc.com/
>>
>> v1 -> v2:
>>
>> - Remove the fixed firmware path and add logic to read the path from the device tree.
>> - Remove code related to the 'qcom,load-firmware' property.
>> - Resolve kernel test robot warnings.
>> - Update the commit message.
>> - Update Copyright year.
>>
>> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-5-quic_vdadhani@quicinc.com/
>> ---
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c      | 423 +++++++++++++++++++++++++++
>>   include/linux/soc/qcom/geni-se.h     |  18 ++
>>   include/linux/soc/qcom/qup-fw-load.h | 179 ++++++++++++
>>   3 files changed, 620 insertions(+)
>>   create mode 100644 include/linux/soc/qcom/qup-fw-load.h
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 4cb959106efa..345181ad6fcc 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> +// Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> Odd, this should be a multiline comment.
> 
>>   
>>   /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
>>   #define __DISABLE_TRACE_MMIO__
>> @@ -15,6 +16,7 @@
>>   #include <linux/pinctrl/consumer.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/soc/qcom/geni-se.h>
>> +#include <linux/soc/qcom/qup-fw-load.h>
>>   
>>   /**
>>    * DOC: Overview
>> @@ -110,6 +112,9 @@ struct geni_se_desc {
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>   						"qup-memory"};
>>   
>> +static const char * const protocol_name[] = { "None", "SPI", "UART",
>> +					      "I2C", "I3C", "SPI SLAVE"};
>> +
>>   #define QUP_HW_VER_REG			0x4
>>   
>>   /* Common SE registers */
>> @@ -891,6 +896,424 @@ int geni_icc_disable(struct geni_se *se)
>>   }
>>   EXPORT_SYMBOL_GPL(geni_icc_disable);
>>   
>> +/**
>> + * elf_phdr_valid() - Validate an ELF header.
>> + * @phdr: Pointer to the ELF header.
>> + *
>> + * Validate the ELF header by comparing the fields stored in p_flags and the payload type.
> 
> The interesting piece of information here would be what the definition
> of "valid" is - because you're not checking that the program header
> entry is valid, you're checking that it's a specific valid.
> 
>> + *
>> + * Return: true if the validation is successful, false otherwise.
>> + */
> 
> That said, I think you should just inline these checks in "read_elf()"
> below, preferably with a comment about what you're looking for.
> 
>> +static bool elf_phdr_valid(const struct elf32_phdr *phdr)
>> +{
>> +	if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
>> +		return false;
>> +
>> +	if (MI_PBT_PAGE_MODE_VALUE(phdr->p_flags) == MI_PBT_NON_PAGED_SEGMENT &&
>> +	    MI_PBT_SEGMENT_TYPE_VALUE(phdr->p_flags) != MI_PBT_HASH_SEGMENT &&
>> +	    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) != MI_PBT_NOTUSED_SEGMENT &&
>> +	    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) != MI_PBT_SHARED_SEGMENT)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +/**
>> + * valid_seg_size() - Validate the segment size.
>> + * @pelfseg: Pointer to the ELF header.
>> + * @p_filesz: Pointer to the file size.
>> + *
>> + * Validate the ELF segment size by comparing the file size.
>> + *
>> + * Return: true if the segment is valid, false if the segment is invalid.
>> + */
>> +static bool valid_seg_size(struct elf_se_hdr *pelfseg, Elf32_Word p_filesz)
>> +{
>> +	if (p_filesz >= pelfseg->fw_offset + pelfseg->fw_size_in_items * sizeof(u32) &&
>> +	    p_filesz >= pelfseg->cfg_idx_offset + pelfseg->cfg_size_in_items * sizeof(u8) &&
>> +	    p_filesz >= pelfseg->cfg_val_offset + pelfseg->cfg_size_in_items * sizeof(u32))
>> +		return true;
>> +	return false;
>> +}
>> +
>> +/**
>> + * read_elf() - Read an ELF file.
>> + * @rsc: Pointer to the SE resources structure.
>> + * @fw: Pointer to the firmware buffer.
>> + * @pelfseg: Pointer to the SE-specific ELF header.
>> + * @phdr: Pointer to one of the valid headers from the list in the firmware buffer.
>> + *
>> + * Read the ELF file and output a pointer to the header data, which
>> + * contains the firmware data and any other details.
>> + *
>> + * Return: 0 if successful, otherwise return an error value.
>> + */
>> +static int read_elf(struct qup_se_rsc *rsc, const struct firmware *fw,
> 
> I think this name is too generic, please prefix it with "geni_" to make
> it easier to search for.
> 
>> +		    struct elf_se_hdr **pelfseg, struct elf32_phdr **phdr)
>> +{
>> +	const struct elf32_hdr *ehdr = (const struct elf32_hdr *)fw->data;
>> +	struct elf32_phdr *phdrs = (struct elf32_phdr *)(ehdr + 1);
>> +	const u8 *addr;
>> +	int i;
>> +
>> +	ehdr = (struct elf32_hdr *)fw->data;
> 
> Please validate that fw->size is sufficient before accessing - here and
> in the loop.
> 
>> +
>> +	if (ehdr->e_phnum < 2)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < ehdr->e_phnum; i++) {
>> +		*phdr = &phdrs[i];
>> +		if (!elf_phdr_valid(*phdr))
>> +			continue;
>> +
>> +		if ((*phdr)->p_filesz >= sizeof(struct elf_se_hdr)) {
>> +			addr =  fw->data + (*phdr)->p_offset;
>> +			*pelfseg = (struct elf_se_hdr *)addr;
> 
> Don't assign *pelfseg until you've found a match.
> 
>> +
>> +			if ((*pelfseg)->magic == MAGIC_NUM_SE &&
>> +			    (*pelfseg)->version == 1 &&
>> +			    valid_seg_size(*pelfseg, (*phdr)->p_filesz) &&
>> +			    (*pelfseg)->serial_protocol == rsc->protocol &&
>> +			    (*pelfseg)->serial_protocol != GENI_SE_NONE)
> 
> There's so much going on in this one conditional. Turn this the way
> around:
> 
> if (phdr->p_filesz < sizeof(struct elf_se_hdr))
> 	continue;
> 
> if (se->magic != MAGIC_NUM_SE)
> 	continue;
> 
> ...
> 
> Makes is super easy to read and each one encapsulates one disqualifying
> factor.
> 
>> +				return 0;
>> +		}
>> +	}
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * geni_config_common_control() - Configure common CGC and disable high priority interrupt.
>> + * @rsc: Pointer to a structure representing SE-related resources.
>> + *
>> + * Configure the common CGC and disable high priority interrupts until the current low priority
>> + * interrupts are handled.
> 
> What do you mean with "low priority interrupt", this is called from the
> firmware loading operation - that doesn't sound like an interrupt at
> all.
> 
> It leaves me with the question about why interrupts should be disabled
> and why they should be disabled in a function called "config common
> control".
> 
> 
> Unless it makes the code easier to read, you should wrap it at 80
> characters. I don't think this sentence is easier to read in it's
> unwrapped form.
> 
>> + *
>> + * Return: None.
> 
> Drop this for void functions.
> 
>> + */
>> +static void geni_config_common_control(struct qup_se_rsc *rsc)
>> +{
>> +	/*
>> +	 * Disable high priority interrupt until current
>> +	 * low priority interrupts are handled.
>> +	 */
>> +	setbits32(rsc->se->wrapper->base + QUPV3_COMMON_CFG,
> 
> I find that the qup_se_rsc structure makes these functions overflow with
> pointer dereferences, and it makes it impossible to know if a function
> operates on 1, 2, or 3 of its members.
> 
> Please just pass the arguments around where necessary.
> 
>> +		  FAST_SWITCH_TO_HIGH_DISABLE_BMASK);
>> +
>> +	/*
>> +	 * Set AHB_M_CLK_CGC_ON to indicate hardware controls
>> +	 * se-wrapper cgc clock.
>> +	 */
>> +	setbits32(rsc->se->wrapper->base + QUPV3_SE_AHB_M_CFG,
>> +		  AHB_M_CLK_CGC_ON_BMASK);
>> +
>> +	/* Let hardware to control common cgc. */
>> +	setbits32(rsc->se->wrapper->base + QUPV3_COMMON_CGC_CTRL,
>> +		  COMMON_CSR_SLV_CLK_CGC_ON_BMASK);
>> +}
>> +
>> +/**
>> + * geni_configure_xfer_mode() - Set the transfer mode.
>> + * @rsc: Pointer to a structure representing SE-related resources.
>> + *
>> + * Set the transfer mode to either FIFO or DMA according to the mode specified by the protocol
>> + * driver.
>> + *
>> + * Return: 0 if successful, otherwise return an error value.
>> + */
>> +static int geni_configure_xfer_mode(struct qup_se_rsc *rsc)
>> +{
>> +	/* Configure SE FIFO, DMA or GSI mode. */
>> +	switch (rsc->mode) {
>> +	case GENI_GPI_DMA:
>> +		setbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
>> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
>> +		writel_relaxed(0x0, rsc->se->base + SE_IRQ_EN);
>> +		writel_relaxed(SE_GSI_EVENT_EN_BMSK, rsc->se->base + SE_GSI_EVENT_EN);
>> +		break;
>> +
>> +	case GENI_SE_FIFO:
>> +		clrbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
>> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
>> +		writel_relaxed(SE_IRQ_EN_RMSK, rsc->se->base + SE_IRQ_EN);
>> +		writel_relaxed(0x0, rsc->se->base + SE_GSI_EVENT_EN);
>> +		break;
>> +
>> +	case GENI_SE_DMA:
>> +		setbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
>> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
>> +		writel_relaxed(SE_IRQ_EN_RMSK, rsc->se->base + SE_IRQ_EN);
>> +		writel_relaxed(0x0, rsc->se->base + SE_GSI_EVENT_EN);
>> +		break;
>> +
>> +	default:
>> +		dev_err(rsc->se->dev, "invalid se mode: %d\n", rsc->mode);
> 
> Please make this error more descriptive so that it's easier for someone
> finding it in the kernel log to understand what the problem is.
> 
>> +		return -EINVAL;
>> +	}
>> +	return 0;
>> +}
>> +
>> +/**
>> + * geni_enable_interrupts() Enable interrupts.
>> + * @rsc: Pointer to a structure representing SE-related resources.
>> + *
>> + * Enable the required interrupts during the firmware load process.
>> + *
>> + * Return: None.
>> + */
>> +static void geni_enable_interrupts(struct qup_se_rsc *rsc)
>> +{
>> +	u32 reg_value;
>> +
>> +	/* Enable required interrupts. */
>> +	writel_relaxed(M_COMMON_GENI_M_IRQ_EN, rsc->se->base + GENI_M_IRQ_ENABLE);
>> +
>> +	reg_value = S_CMD_OVERRUN_EN | S_ILLEGAL_CMD_EN |
>> +				S_CMD_CANCEL_EN | S_CMD_ABORT_EN |
> 
> Please confirm that the indentation is correct here.
> 
>> +				S_GP_IRQ_0_EN | S_GP_IRQ_1_EN |
>> +				S_GP_IRQ_2_EN | S_GP_IRQ_3_EN |
>> +				S_RX_FIFO_WR_ERR_EN | S_RX_FIFO_RD_ERR_EN;
>> +	writel_relaxed(reg_value, rsc->se->base + GENI_S_IRQ_ENABLE);
>> +
>> +	/* DMA mode configuration. */
>> +	reg_value = DMA_TX_IRQ_EN_SET_RESET_DONE_EN_SET_BMSK |
>> +		    DMA_TX_IRQ_EN_SET_SBE_EN_SET_BMSK |
>> +		    DMA_TX_IRQ_EN_SET_DMA_DONE_EN_SET_BMSK;
>> +	writel_relaxed(reg_value, rsc->se->base + DMA_TX_IRQ_EN_SET);
>> +	reg_value = DMA_RX_IRQ_EN_SET_FLUSH_DONE_EN_SET_BMSK |
>> +		    DMA_RX_IRQ_EN_SET_RESET_DONE_EN_SET_BMSK |
>> +		    DMA_RX_IRQ_EN_SET_SBE_EN_SET_BMSK |
>> +		    DMA_RX_IRQ_EN_SET_DMA_DONE_EN_SET_BMSK;
>> +	writel_relaxed(reg_value, rsc->se->base + DMA_RX_IRQ_EN_SET);
>> +}
>> +
>> +/**
>> + * geni_flash_fw_revision() - Flash the firmware revision.
> 
> It's not really "flashing", it's more just "writing"...right?
> 
>> + * @rsc: Pointer to a structure representing SE-related resources.
>> + * @hdr: Pointer to the ELF header of the Serial Engine.
> 
> That's not the ELF header, it's the serial engine firmware header. That
> said, you only consume the serial_protocol and fw_version, so a function
> called "geni_write_fw_revision()" could perhaps just take those two
> values as parameters?
> 
>> + *
>> + * Flash the firmware revision and protocol into the respective register.
> 
> Again, no flashing, just writing.
> 
>> + *
>> + * Return: None.
>> + */
>> +static void geni_flash_fw_revision(struct qup_se_rsc *rsc, struct elf_se_hdr *hdr)
>> +{
>> +	u32 reg_value;
>> +
>> +	/* Flash firmware revision register. */
>> +	reg_value = (hdr->serial_protocol << FW_REV_PROTOCOL_SHFT) |
>> +		    (hdr->fw_version & 0xFF << FW_REV_VERSION_SHFT);
>> +	writel_relaxed(reg_value, rsc->se->base + SE_GENI_FW_REVISION);
>> +
>> +	reg_value = (hdr->serial_protocol << FW_REV_PROTOCOL_SHFT) |
>> +		    (hdr->fw_version & 0xFF << FW_REV_VERSION_SHFT);
>> +
>> +	writel_relaxed(reg_value, rsc->se->base + SE_S_FW_REVISION);
>> +}
>> +
>> +/**
>> + * geni_load_se_fw() - Load Serial Engine specific firmware.
>> + * @rsc: Pointer to a structure representing SE-related resources.
>> + * @fw: Pointer to the firmware structure.
>> + *
>> + * Load the protocol firmware into the IRAM of the Serial Engine.
>> + *
>> + * Return: 0 if successful, otherwise return an error value.
>> + */
>> +static int geni_load_se_fw(struct qup_se_rsc *rsc, const struct firmware *fw)
>> +{
>> +	const u32 *fw_val_arr, *cfg_val_arr;
>> +	const u8 *cfg_idx_arr;
>> +	u32 i, reg_value, mask, ramn_cnt;
>> +	int ret;
>> +	struct elf_se_hdr *hdr;
>> +	struct elf32_phdr *phdr;
>> +
>> +	ret = geni_icc_set_bw(rsc->se);
>> +	if (ret) {
>> +		dev_err(rsc->se->dev, "%s: Failed to set ICC BW %d\n", __func__, ret);
> 
> Drop the __func__ from all your printouts.
> 
>> +		return ret;
>> +	}
>> +
>> +	ret = geni_icc_enable(rsc->se);
>> +	if (ret) {
>> +		dev_err(rsc->se->dev, "%s: Failed to enable ICC %d\n", __func__, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = geni_se_resources_on(rsc->se);
> 
> Why do you turn on the buses and clocks before you're parsing the
> firmware file?
> 
>> +	if (ret) {
>> +		dev_err(rsc->se->dev, "%s: Failed to enable common clocks %d\n", __func__, ret);
>> +		goto err;
>> +	}
>> +
>> +	ret = read_elf(rsc, fw, &hdr, &phdr);
> 
> Why is phdr returned here? Makes read_elf() harder to read...
> 
>> +	if (ret) {
>> +		dev_err(rsc->se->dev, "%s: ELF parsing failed ret: %d\n", __func__, ret);
>> +		goto err;
>> +	}
>> +
>> +	fw_val_arr = (const u32 *)((u8 *)hdr + hdr->fw_offset);
> 
> Why is this a "firmware value array", isn't it the "firmware data"? Why
> is it chunks of u32? Does it also need to be written in words?
> 
>> +	cfg_idx_arr = (const u8 *)hdr + hdr->cfg_idx_offset;
>> +	cfg_val_arr = (const u32 *)((u8 *)hdr + hdr->cfg_val_offset);
>> +
>> +	geni_config_common_control(rsc);
>> +
>> +	/* Allows to drive corresponding data according to hardware value. */
>> +	writel_relaxed(0x0, rsc->se->base + GENI_OUTPUT_CTRL);
>> +
>> +	/* Set SCLK and HCLK to program RAM */
>> +	setbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
>> +			GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
>> +	writel_relaxed(0x0, rsc->se->base + SE_GENI_CLK_CTRL);
>> +	clrbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
>> +			GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
>> +
>> +	/* Enable required clocks for DMA CSR, TX and RX. */
>> +	reg_value = DMA_GENERAL_CFG_AHB_SEC_SLV_CLK_CGC_ON_BMSK |
>> +		DMA_GENERAL_CFG_DMA_AHB_SLV_CLK_CGC_ON_BMSK |
>> +		DMA_GENERAL_CFG_DMA_TX_CLK_CGC_ON_BMSK |
>> +		DMA_GENERAL_CFG_DMA_RX_CLK_CGC_ON_BMSK;
>> +
>> +	setbits32(rsc->se->base + DMA_GENERAL_CFG, reg_value);
>> +
>> +	/* Let hardware control CGC by default. */
>> +	writel_relaxed(DEFAULT_CGC_EN, rsc->se->base + GENI_CGC_CTRL);
>> +
>> +	/* Set version of the configuration register part of firmware. */
>> +	writel_relaxed(hdr->cfg_version, rsc->se->base + GENI_INIT_CFG_REVISION);
>> +	writel_relaxed(hdr->cfg_version, rsc->se->base + GENI_S_INIT_CFG_REVISION);
>> +
>> +	/* Configure GENI primitive table. */
>> +	for (i = 0; i < hdr->cfg_size_in_items; i++)
>> +		writel_relaxed(cfg_val_arr[i],
>> +			       rsc->se->base + GENI_CFG_REG0 + (cfg_idx_arr[i] * sizeof(u32)));
> 
> What goes into this configuration?
> 
>> +
>> +	/* Configure condition for assertion of RX_RFR_WATERMARK condition. */
>> +	reg_value = readl_relaxed(rsc->se->base + QUPV3_SE_HW_PARAM_1);
>> +	mask = (reg_value >> RX_FIFO_WIDTH_BIT) & RX_FIFO_WIDTH_MASK;
> 
> Based on the WIDTH_MASK, those 6 bits doesn't sound like a "BIT"... And
> is the RX_FIFO_WIDTH really a "mask"?
> 
>> +	writel_relaxed(mask - 2, rsc->se->base + GENI_RX_RFR_WATERMARK_REG);
> 
> mask - 2?
> 
> Use FIELD_GET() and name things with the intention of making it easy for
> others to understand what the code does.
> 
>> +
>> +	/* Let hardware control CGC */
>> +	setbits32(rsc->se->base + GENI_OUTPUT_CTRL, DEFAULT_IO_OUTPUT_CTRL_MSK);
>> +
>> +	ret = geni_configure_xfer_mode(rsc);
>> +	if (ret)
>> +		goto err_resource;
>> +
>> +	geni_enable_interrupts(rsc);
>> +
>> +	geni_flash_fw_revision(rsc, hdr);
>> +
>> +	ramn_cnt = hdr->fw_size_in_items;
>> +	if (hdr->fw_size_in_items % 2 != 0)
>> +		ramn_cnt++;
>> +
>> +	if (ramn_cnt >= MAX_GENI_CFG_RAMn_CNT)
>> +		goto err_resource;
> 
> As far as I can tell this error path is based entirely on the firmware
> being read from the file system, so you could have checked it before you
> turned on any resources - making a cleaner exit on failure.
> 
>> +
>> +	/* Program RAM address space. */
>> +	memcpy((void *)(rsc->se->base + SE_GENI_CFG_RAMN), fw_val_arr, ramn_cnt * sizeof(u32));
> 
> I presume this typecast to void * is to hide the fact that se->base is
> flagged as __iomem? Use memcpy_toio() intead.
> 
>> +
>> +	/* Put default values on GENI's output pads. */
>> +	writel_relaxed(0x1, rsc->se->base + GENI_FORCE_DEFAULT_REG);
>> +
>> +	/* High to low SCLK and HCLK to finish RAM. */
>> +	setbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
>> +			GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
>> +	setbits32(rsc->se->base + SE_GENI_CLK_CTRL, GENI_CLK_CTRL_SER_CLK_SEL_BMSK);
>> +	clrbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
>> +			GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
>> +
>> +	/* Serial engine DMA interface is enabled. */
>> +	setbits32(rsc->se->base + SE_DMA_IF_EN, DMA_IF_EN_DMA_IF_EN_BMSK);
>> +
>> +	/* Enable or disable FIFO interface of the serial engine. */
>> +	if (rsc->mode == GENI_SE_FIFO)
>> +		clrbits32(rsc->se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
>> +	else
>> +		setbits32(rsc->se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
>> +
>> +err_resource:
>> +	geni_se_resources_off(rsc->se);
>> +err:
>> +	geni_icc_disable(rsc->se);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * qup_fw_load() - Initiate firmware load.
>> + * @rsc: Pointer to a structure representing SE-related resources.
>> + *
>> + * Load the firmware into a specific SE. Read the associated ELF file,
>> + * copy the data into a buffer in kernel space using the request_firmware API, write the
>> + * data into the SE's IRAM register, and then free the buffers. Handle firmware loading
>> + * and parsing for a specific protocol.
>> + *
>> + * Return: 0 if successful, otherwise return an error value.
>> + */
>> +static int qup_fw_load(struct qup_se_rsc *rsc, const char *fw_name)
>> +{
>> +	int ret;
>> +	const struct firmware *fw;
>> +	struct device *dev = rsc->se->dev;
>> +
>> +	ret = request_firmware(&fw, fw_name, dev);
>> +	if (ret) {
>> +		dev_err(dev, "request_firmware failed for %d: %d\n", rsc->protocol, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = geni_load_se_fw(rsc, fw);
>> +
>> +	release_firmware(fw);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * geni_load_se_firmware() - Initiate firmware loading.
>> + * @se: Serial engine details.
>> + * @protocol: Protocol (SPI, I2C, or UART) for which the firmware is to be loaded.
>> + *
>> + * If the device tree properties are configured to load QUP firmware and the firmware
>> + * is not already loaded, start the firmware loading process. If the device tree properties
>> + * are not defined, skip loading the firmware, assuming it is already loaded by TZ.
>> + *
>> + * Return: 0 if successful, otherwise return an error value.
>> + */
>> +int geni_load_se_firmware(struct geni_se *se,
>> +			  enum geni_se_protocol_type protocol)
> 
> This line is 82 characters long if you don't line break it, but it's
> cleaner to read...so please unbreak it.
> 
>> +{
>> +	struct qup_se_rsc rsc;
>> +	const char *fw_name;
>> +	int ret;
>> +
>> +	ret = device_property_read_string(se->wrapper->dev, "firmware-name", &fw_name);
>> +	if (ret)
>> +		return  -EINVAL;
>> +
>> +	rsc.se = se;
>> +	rsc.protocol = protocol;
>> +	/* Set default xfer mode to FIFO */
> 
> This isn't the "default" mode, this is the else statement in the
> conditional below.
> 
>> +	rsc.mode = GENI_SE_FIFO;
>> +
>> +	if (of_property_read_bool(se->dev->of_node, "qcom,gsi-dma-allowed"))
>> +		rsc.mode = GENI_GPI_DMA;
> 
> if (of_property_present())
> 	sc.mode = GENI_GPI_DMA;
> else
> 	sc.mode = GENI_GPI_FIFO;
> 
> /* Comment about UART, because it's actually worth mentioning */
> if (serial)
> 
> 
>> +
>> +	/* GSI mode is not supported by the UART driver; therefore, setting FIFO mode */
>> +	if (protocol == GENI_SE_UART)
>> +		rsc.mode = GENI_SE_FIFO;
>> +
>> +	ret = qup_fw_load(&rsc, fw_name);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(se->dev, "Firmware load for %s protocol is successful for xfer mode %d\n",
>> +		protocol_name[rsc.protocol], rsc.mode);
> 
> How do you know that rsc.protocol < ARRAY_SIZE(protocol_name)?
> 
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(geni_load_se_firmware);
>> +
>>   static int geni_se_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
>> index 2996a3c28ef3..fd8cf5c6791f 100644
>> --- a/include/linux/soc/qcom/geni-se.h
>> +++ b/include/linux/soc/qcom/geni-se.h
>> @@ -1,6 +1,7 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   /*
>>    * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #ifndef _LINUX_QCOM_GENI_SE
>> @@ -36,6 +37,7 @@ enum geni_se_protocol_type {
>>   	GENI_SE_I2C,
>>   	GENI_SE_I3C,
>>   	GENI_SE_SPI_SLAVE,
>> +	GENI_SE_INVALID_PROTO = 255,
> 
> This is unused.
> 
>>   };
>>   
>>   struct geni_wrapper;
>> @@ -72,6 +74,19 @@ struct geni_se {
>>   	struct geni_icc_path icc_paths[3];
>>   };
>>   
>> +/**
>> + * struct qup_se_rsc - Structure containing se details protocol and xfer mode
>> + *
>> + * @mode: transfer mode se fifo, dma or gsi.
>> + * @protocol: Protocol spi or i2c or serial.
>> + * @se: Pointer to the concerned serial engine.
> 
> I'd like you to drop this struct, so it doesn't really matter...but
> order of parameters doesn't match the structure.
> 
>> + */
>> +struct qup_se_rsc {
>> +	struct geni_se *se;
>> +	enum geni_se_xfer_mode mode;
>> +	enum geni_se_protocol_type protocol;
>> +};
>> +
>>   /* Common SE registers */
>>   #define GENI_FORCE_DEFAULT_REG		0x20
>>   #define GENI_OUTPUT_CTRL		0x24
>> @@ -531,5 +546,8 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag);
>>   int geni_icc_enable(struct geni_se *se);
>>   
>>   int geni_icc_disable(struct geni_se *se);
>> +
>> +int geni_load_se_firmware(struct geni_se *se,
>> +			  enum geni_se_protocol_type protocol);
> 
> Unbreak the line.
> 
>>   #endif
>>   #endif
>> diff --git a/include/linux/soc/qcom/qup-fw-load.h b/include/linux/soc/qcom/qup-fw-load.h
>> new file mode 100644
>> index 000000000000..f139720987f9
>> --- /dev/null
>> +++ b/include/linux/soc/qcom/qup-fw-load.h
>> @@ -0,0 +1,179 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +#ifndef _LINUX_QCOM_QUP_FW_LOAD
>> +#define _LINUX_QCOM_QUP_FW_LOAD
>> +
>> +#include <linux/device.h>
>> +#include <linux/elf.h>
>> +#include <linux/firmware.h>
> 
> Why are device.h, elf.h and firmware.h included here, they are not used.
> 
>> +#include <linux/kernel.h>
>> +
>> +/*Magic numbers*/
>> +#define MAGIC_NUM_SE			0x57464553
> 
> Prefix things.
> 
>> +
>> +/* Common SE registers*/
>> +#define GENI_INIT_CFG_REVISION		0x0
>> +#define GENI_S_INIT_CFG_REVISION	0x4
>> +#define GENI_FORCE_DEFAULT_REG		0x20
> 
> A bunch of these registers and bitmasks area already defined in
> include/soc/qcom/geni-se.h why are they duplicated here?
> 
>> +#define GENI_CGC_CTRL			0x28
>> +#define GENI_CFG_REG0			0x100
>> +
>> +#define QUPV3_SE_HW_PARAM_1		0xE28
> 
> Lowercase hex digits please.
> 
>> +#define RX_FIFO_WIDTH_BIT		24
>> +#define RX_FIFO_WIDTH_MASK		0x3F
>> +
>> +/*Same registers as GENI_DMA_MODE_EN*/
>> +#define QUPV3_SE_GENI_DMA_MODE_EN	0x258
>> +#define GENI_M_IRQ_ENABLE		0x614
>> +#define GENI_S_IRQ_ENABLE		0x644
>> +#define GENI_RX_RFR_WATERMARK_REG	0x814
>> +#define DMA_TX_IRQ_EN_SET		0xC4C
>> +#define DMA_RX_IRQ_EN_SET		0xD4C
>> +#define DMA_GENERAL_CFG			0xE30
>> +#define SE_GENI_FW_REVISION		0x1000
>> +#define SE_S_FW_REVISION		0x1004
>> +#define SE_GENI_CFG_RAMN		0x1010
>> +#define SE_GENI_CLK_CTRL		0x2000
>> +#define SE_DMA_IF_EN			0x2004
>> +#define SE_FIFO_IF_DISABLE		0x2008
>> +
>> +#define MAX_GENI_CFG_RAMn_CNT		455
>> +
>> +#define MI_PBT_NON_PAGED_SEGMENT	0x0
>> +#define MI_PBT_HASH_SEGMENT		0x2
>> +#define MI_PBT_NOTUSED_SEGMENT		0x3
>> +#define MI_PBT_SHARED_SEGMENT		0x4
>> +#define MI_PBT_FLAG_PAGE_MODE_MASK	0x100000
>> +#define MI_PBT_FLAG_PAGE_MODE_SHIFT	0x14
>> +#define MI_PBT_FLAG_SEGMENT_TYPE_MASK	0x7000000
>> +#define MI_PBT_FLAG_SEGMENT_TYPE_SHIFT	0x18
>> +#define MI_PBT_FLAG_ACCESS_TYPE_MASK	0xE00000
>> +#define MI_PBT_FLAG_ACCESS_TYPE_SHIFT	0x15
>> +
>> +#define MI_PBT_PAGE_MODE_VALUE(x) \
>> +	(((x) & MI_PBT_FLAG_PAGE_MODE_MASK) >> \
>> +	  MI_PBT_FLAG_PAGE_MODE_SHIFT)
> 
> Please replace masking and shifting with FIELD_GET() from
> linux/bitfield.h.
> 
>> +
>> +#define MI_PBT_SEGMENT_TYPE_VALUE(x) \
>> +	(((x) & MI_PBT_FLAG_SEGMENT_TYPE_MASK) >> \
>> +		MI_PBT_FLAG_SEGMENT_TYPE_SHIFT)
>> +
>> +#define MI_PBT_ACCESS_TYPE_VALUE(x) \
>> +	(((x) & MI_PBT_FLAG_ACCESS_TYPE_MASK) >> \
>> +	  MI_PBT_FLAG_ACCESS_TYPE_SHIFT)
>> +
>> +/* GENI_FORCE_DEFAULT_REG fields */
>> +#define FORCE_DEFAULT			BIT(0)
>> +
>> +/* FW_REVISION_RO fields */
>> +#define FW_REV_PROTOCOL_SHFT		8
>> +#define FW_REV_VERSION_SHFT		0
>> +
>> +#define GENI_FW_REVISION_RO		0x68
>> +#define GENI_S_FW_REVISION_RO		0x6C
>> +
>> +/* SE_GENI_DMA_MODE_EN */
>> +#define GENI_DMA_MODE_EN		BIT(0)
>> +
>> +/* GENI_M_IRQ_EN fields */
>> +#define M_CMD_DONE_EN			BIT(0)
>> +#define M_IO_DATA_DEASSERT_EN		BIT(22)
>> +#define M_IO_DATA_ASSERT_EN		BIT(23)
>> +#define M_RX_FIFO_RD_ERR_EN		BIT(24)
>> +#define M_RX_FIFO_WR_ERR_EN		BIT(25)
>> +#define M_RX_FIFO_WATERMARK_EN		BIT(26)
>> +#define M_RX_FIFO_LAST_EN		BIT(27)
>> +#define M_TX_FIFO_RD_ERR_EN		BIT(28)
>> +#define M_TX_FIFO_WR_ERR_EN		BIT(29)
>> +#define M_TX_FIFO_WATERMARK_EN		BIT(30)
>> +#define M_COMMON_GENI_M_IRQ_EN	(GENMASK(6, 1) | \
>> +				M_IO_DATA_DEASSERT_EN | \
>> +				M_IO_DATA_ASSERT_EN | M_RX_FIFO_RD_ERR_EN | \
>> +				M_RX_FIFO_WR_ERR_EN | M_TX_FIFO_RD_ERR_EN | \
>> +				M_TX_FIFO_WR_ERR_EN)
>> +
>> +/* GENI_S_IRQ_EN fields */
>> +#define S_CMD_OVERRUN_EN		BIT(1)
>> +#define S_ILLEGAL_CMD_EN		BIT(2)
>> +#define S_CMD_CANCEL_EN			BIT(4)
>> +#define S_CMD_ABORT_EN			BIT(5)
>> +#define S_GP_IRQ_0_EN			BIT(9)
>> +#define S_GP_IRQ_1_EN			BIT(10)
>> +#define S_GP_IRQ_2_EN			BIT(11)
>> +#define S_GP_IRQ_3_EN			BIT(12)
>> +#define S_RX_FIFO_RD_ERR_EN		BIT(24)
>> +#define S_RX_FIFO_WR_ERR_EN		BIT(25)
>> +#define S_COMMON_GENI_S_IRQ_EN	(GENMASK(5, 1) | GENMASK(13, 9) | \
>> +				 S_RX_FIFO_RD_ERR_EN | S_RX_FIFO_WR_ERR_EN)
>> +
>> +#define GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK		0x00000200
>> +#define GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK		0x00000100
>> +
>> +#define GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK		0x00000001
>> +
>> +#define DMA_TX_IRQ_EN_SET_RESET_DONE_EN_SET_BMSK	0x00000008
>> +#define DMA_TX_IRQ_EN_SET_SBE_EN_SET_BMSK		0x00000004
>> +#define DMA_TX_IRQ_EN_SET_DMA_DONE_EN_SET_BMSK		0x00000001
>> +
>> +#define DMA_RX_IRQ_EN_SET_FLUSH_DONE_EN_SET_BMSK	0x00000010
>> +#define DMA_RX_IRQ_EN_SET_RESET_DONE_EN_SET_BMSK	0x00000008
>> +#define DMA_RX_IRQ_EN_SET_SBE_EN_SET_BMSK		0x00000004
>> +#define DMA_RX_IRQ_EN_SET_DMA_DONE_EN_SET_BMSK		0x00000001
>> +
>> +#define DMA_GENERAL_CFG_AHB_SEC_SLV_CLK_CGC_ON_BMSK	0x00000008
>> +#define DMA_GENERAL_CFG_DMA_AHB_SLV_CLK_CGC_ON_BMSK	0x00000004
>> +#define DMA_GENERAL_CFG_DMA_TX_CLK_CGC_ON_BMSK		0x00000002
>> +#define DMA_GENERAL_CFG_DMA_RX_CLK_CGC_ON_BMSK		0x00000001
>> +
>> +#define GENI_CLK_CTRL_SER_CLK_SEL_BMSK			0x00000001
>> +#define DMA_IF_EN_DMA_IF_EN_BMSK			0x00000001
>> +#define SE_GSI_EVENT_EN_BMSK				0x0000000f
>> +#define SE_IRQ_EN_RMSK					0x0000000f
>> +
>> +#define QUPV3_COMMON_CFG				0x0120
>> +#define FAST_SWITCH_TO_HIGH_DISABLE_BMASK		0x00000001
>> +
>> +#define QUPV3_SE_AHB_M_CFG				0x0118
>> +#define AHB_M_CLK_CGC_ON_BMASK				0x00000001
>> +
>> +#define QUPV3_COMMON_CGC_CTRL				0x021C
>> +#define COMMON_CSR_SLV_CLK_CGC_ON_BMASK			0x00000001
>> +
>> +/* access ports */
>> +#define setbits32(_addr, _v) out_be32((_addr), in_be32(_addr) |  (_v))
>> +#define clrbits32(_addr, _v) out_be32((_addr), in_be32(_addr) & ~(_v))
> 
> These names are way too generic.
> 
>> +
>> +#define out_be32(a, v) writel_relaxed(v, a)
>> +#define in_be32(a) readl_relaxed(a)
> 
> Don't create aliases.
> 
>> +
>> +/**
>> + * struct elf_se_hdr - firmware configurations
>> + *
>> + * @magic: set to 'SEFW'
>> + * @version: A 32-bit value indicating the structure’s version number
>> + * @core_version: QUPV3_HW_VERSION
>> + * @serial_protocol: Programmed into GENI_FW_REVISION
>> + * @fw_version: Programmed into GENI_FW_REVISION
>> + * @cfg_version: Programmed into GENI_INIT_CFG_REVISION
>> + * @fw_size_in_items: Number of (uint32_t) GENI_FW_RAM words
>> + * @fw_offset: Byte offset of GENI_FW_RAM array
>> + * @cfg_size_in_items: Number of GENI_FW_CFG index/value pairs
>> + * @cfg_idx_offset: Byte offset of GENI_FW_CFG index array
>> + * @cfg_val_offset: Byte offset of GENI_FW_CFG values array
>> + */
>> +struct elf_se_hdr {
> 
> This structure doesn't seem to relate to ELF at all, it seems to be the
> header for the serial engine configuration.
> 
> It happens to be packaged up in a ELF segment, but I don't see a reason
> for defining the format of the outer container here.

This structure is related to firmware written in an ELF file. I didn't 
understand your concern. Could you please clarify what is required here?

> 
>> +	u32 magic;
> 
> What endian is that u32? Please be specific.
> 
> Regards,
> Bjorn
> 
>> +	u32 version;
>> +	u32 core_version;
>> +	u16 serial_protocol;
>> +	u16 fw_version;
>> +	u16 cfg_version;
>> +	u16 fw_size_in_items;
>> +	u16 fw_offset;
>> +	u16 cfg_size_in_items;
>> +	u16 cfg_idx_offset;
>> +	u16 cfg_val_offset;
>> +};
>> +#endif /* _LINUX_QCOM_QUP_FW_LOAD */
>> -- 
>> 2.34.1
>>

