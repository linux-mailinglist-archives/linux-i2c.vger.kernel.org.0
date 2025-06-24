Return-Path: <linux-i2c+bounces-11562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6569FAE615B
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 11:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8F021B60ACF
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 09:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A10281510;
	Tue, 24 Jun 2025 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHeZb/u/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6411627F170;
	Tue, 24 Jun 2025 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758679; cv=none; b=Hmch127D+aRlBymFak++GB7F3tFpC1l62lcln5zE0IAt+ajsMfeYLC67Ta8X8HiOiIeYryHfSOXtUdsCpjL0yZDVcEa361QMMBi4pbRXUn+EA77m4M+1GFBPUKrI/GrShz1p25M+iewMMTI1hNdWPClLHOqCUcwANqm4k67JsSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758679; c=relaxed/simple;
	bh=PmowqnrxKiLFcZ5NJROrncZCJryLRWVB6WkiZ8X/sd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fSvD6WfFcU8yl7f5jDIF0WIg1ZpjfSdhQOFz7mH0UwF0sn61lulvklpJgAAN2fQBH3U8ql5uae6ndDmjWv8LNyCHPtcLIR9qcLmw7dGTJFzTxWYxalRVnqgEKYfD7L2w8j3MePC2Seyvsqgwb/BKeBps4TnDDl571+gN2GyEVXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHeZb/u/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O2rPxK017016;
	Tue, 24 Jun 2025 09:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9LZDKyOaj91
	AAxBD9+7vG7H23UbHRXNDpeG5ua1L+vA=; b=UHeZb/u/upWG5GmZ5IcXJsKBNP+
	/yyspkzKCWcUuOmyrVgRKUyt7NLrBsmkCiPl6VmelsqJjwgIWoedPF+YxxGugDWN
	btZ8MSyYawA5gWLf4WIUyiHxBlahRtqRY2ftA38lGZDmzuJUzUC9Dj6GDEHeVd9r
	ZzhevsokG1ppRkFtjc5xRZp5Jt0q3vlgmlQL+cNvaR1yCO2upPmzmmnjiqYIOIrA
	muEfrruEXjhBDcSIc/5NZzxLxPNJZg4TG9dgQB4iHQkjg1HzWGEACZhYT6Lpif9/
	9EMhS6SvWbpUgnA/XvHyGZt8tMS79FhGmdjh5EzdXWBYyWtqO6QTjNkSK7w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7tttsrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55O9p7TR024178;
	Tue, 24 Jun 2025 09:51:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntktdsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:09 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55O9p8DI024187;
	Tue, 24 Jun 2025 09:51:08 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55O9p8be024185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:08 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 11E7556E; Tue, 24 Jun 2025 15:21:08 +0530 (+0530)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v5 2/5] soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
Date: Tue, 24 Jun 2025 15:20:59 +0530
Message-Id: <20250624095102.1587580-3-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a7510 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=sClmPrBuAd1zpBMvlVoA:9 a=AqsFaLKkRaLYCVmb:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OB5hMMaNoslIqoTbDc5CmUe34Z5jZ73Z
X-Proofpoint-GUID: OB5hMMaNoslIqoTbDc5CmUe34Z5jZ73Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4MyBTYWx0ZWRfX+/Z9JCv+Vxow
 67HwRI7yHanPtEdaXPviaSBIqxbdreSQPvr6be3Zh7d4hw/SLJ9wEIyfFqHDp3NkGZsr1de9MiG
 hUeLm9d4RlxoxW2sGxQcDLFQT+LsQc3DEZFgesP/apnLXg+TuS8+DnAV7op+vWUmxbd8X0PhGnE
 925J1vMBpl7P+ye7x08VX9UDHIGQzo3Hozl+fu1bEJLAExbAPX1fLG/iDoKKg/1bAeOl47aasaz
 lTFqsUFuaWNuM3j2q5vqXBcxBDqTV8epVx7xlw2/+IBB+1sZ76VWZm8bddhhV/iP20DOzrUiMyY
 o7mwxR0hQFk7kApLrCjwLZ51p3QFOxT8AgUpBDvn7+Q07gq80YElFwKkvWbRYsvKF4Js4j7Vue/
 9d1J04qP2oGBvD2ScXoynqcJgZYIjc6vePznxkJN5XQ9pofWkb6jkn39bTrueRaPFiUhlzQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240083

In Qualcomm SoCs, firmware loading for Serial Engines (SE) within the QUP
hardware has traditionally been managed by TrustZone (TZ). This restriction
poses a significant challenge for developers, as it limits their ability to
enable various protocols on any of the SEs from the Linux side, reducing
flexibility.

Load the firmware to QUP SE based on the 'firmware-name' property specified
in devicetree at bootup time.

Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
v4 -> v5:

- Resolved kernel test robot error by including the missing bitfield header file.
- Updated the SE firmware ELF structure name for consistency.
- Specified _leb4 format for the magic number definition.
- Updated the email domain from 'quic' to 'oss'.

v4 Link: https://lore.kernel.org/all/20250503111029.3583807-3-quic_vdadhani@quicinc.com/

v3 -> v4:

- Update the commit message.
- Resolve kernel test robot warnings.
- Add a multiline comment in the Copyright section.
- Remove valid_seg_size and geni_config_common_control functions, and add the code inline.
- Rename read_elf function to geni_read_elf.
- Add a firmware size check.
- Assign *pelfseg after finding a match.
- Break one large condition check into multiple checks to improve code readability.
- Remove return type documentation for void functions.
- Update error messages to be more descriptive.
- Correct indentation.
- Rename geni_flash_fw_revision function to geni_write_fw_revision.
- Remove __func__ from all print statements.
- Move resource_on to the appropriate section after parsing the firmware file.
- Update variable names and function arguments as suggested.
- Use FIELD_GET, FIELD_PREP, and GENMASK.
- Use memcpy_toio() instead of memcpy.
- Remove duplicate registers and bitmask macros.
- Remove rsc struct and add required variables in geni_se struct.

v3 Link: https://lore.kernel.org/linux-arm-msm/20250303124349.3474185-7-quic_vdadhani@quicinc.com/

v2 -> v3:

- Remove code related to the 'qcom,xfer-mode' property.
- Add logic to read the boolean property 'qcom,gsi-dma-allowed' and select the transfer mode.
- Hardcode FIFO mode for the serial driver as GSI mode is currently not supported.
- Update function descriptions as suggested.
- Enhance error handling and remove redundant if conditions.
- Drop the ternary operator.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-6-quic_vdadhani@quicinc.com/

v1 -> v2:

- Remove the fixed firmware path and add logic to read the path from the device tree.
- Remove code related to the 'qcom,load-firmware' property.
- Resolve kernel test robot warnings.
- Update the commit message.
- Update Copyright year.

v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-5-quic_vdadhani@quicinc.com/
---
---
 drivers/soc/qcom/qcom-geni-se.c      | 407 +++++++++++++++++++++++++--
 include/linux/soc/qcom/geni-se.h     |  32 ++-
 include/linux/soc/qcom/qup-fw-load.h |  93 ++++++
 3 files changed, 510 insertions(+), 22 deletions(-)
 create mode 100644 include/linux/soc/qcom/qup-fw-load.h

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 4cb959106efa..ef4997a5fd63 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1,11 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+/*
+ *  Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ *  Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
 
 /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
 #define __DISABLE_TRACE_MMIO__
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/firmware.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -15,6 +19,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/soc/qcom/geni-se.h>
+#include <linux/soc/qcom/qup-fw-load.h>
 
 /**
  * DOC: Overview
@@ -80,9 +85,9 @@
  * common to all the serial engines and are independent of serial interfaces.
  */
 
-#define MAX_CLK_PERF_LEVEL 32
-#define MAX_CLKS 2
-
+#define MAX_CLK_PERF_LEVEL	32
+#define MAX_CLKS		2
+#define MAX_PROTOCOL		6
 /**
  * struct geni_wrapper - Data structure to represent the QUP Wrapper Core
  * @dev:		Device pointer of the QUP wrapper core
@@ -110,28 +115,23 @@ struct geni_se_desc {
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
+static const char * const protocol_name[MAX_PROTOCOL] = { "None", "SPI", "UART",
+							  "I2C", "I3C", "SPI SLAVE"};
+
 #define QUP_HW_VER_REG			0x4
 
 /* Common SE registers */
-#define GENI_INIT_CFG_REVISION		0x0
-#define GENI_S_INIT_CFG_REVISION	0x4
-#define GENI_OUTPUT_CTRL		0x24
-#define GENI_CGC_CTRL			0x28
 #define GENI_CLK_CTRL_RO		0x60
-#define GENI_FW_S_REVISION_RO		0x6c
 #define SE_GENI_BYTE_GRAN		0x254
 #define SE_GENI_TX_PACKING_CFG0		0x260
 #define SE_GENI_TX_PACKING_CFG1		0x264
 #define SE_GENI_RX_PACKING_CFG0		0x284
 #define SE_GENI_RX_PACKING_CFG1		0x288
-#define SE_GENI_M_GP_LENGTH		0x910
-#define SE_GENI_S_GP_LENGTH		0x914
 #define SE_DMA_TX_PTR_L			0xc30
 #define SE_DMA_TX_PTR_H			0xc34
 #define SE_DMA_TX_ATTR			0xc38
 #define SE_DMA_TX_LEN			0xc3c
 #define SE_DMA_TX_IRQ_EN		0xc48
-#define SE_DMA_TX_IRQ_EN_SET		0xc4c
 #define SE_DMA_TX_IRQ_EN_CLR		0xc50
 #define SE_DMA_TX_LEN_IN		0xc54
 #define SE_DMA_TX_MAX_BURST		0xc5c
@@ -140,9 +140,7 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 #define SE_DMA_RX_ATTR			0xd38
 #define SE_DMA_RX_LEN			0xd3c
 #define SE_DMA_RX_IRQ_EN		0xd48
-#define SE_DMA_RX_IRQ_EN_SET		0xd4c
 #define SE_DMA_RX_IRQ_EN_CLR		0xd50
-#define SE_DMA_RX_LEN_IN		0xd54
 #define SE_DMA_RX_MAX_BURST		0xd5c
 #define SE_DMA_RX_FLUSH			0xd60
 #define SE_GSI_EVENT_EN			0xe18
@@ -179,7 +177,7 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 /* SE_DMA_GENERAL_CFG */
 #define DMA_RX_CLK_CGC_ON		BIT(0)
 #define DMA_TX_CLK_CGC_ON		BIT(1)
-#define DMA_AHB_SLV_CFG_ON		BIT(2)
+#define DMA_AHB_SLV_CLK_CGC_ON		BIT(2)
 #define AHB_SEC_SLV_CLK_CGC_ON		BIT(3)
 #define DUMMY_RX_NON_BUFFERABLE		BIT(4)
 #define RX_DMA_ZERO_PADDING_EN		BIT(5)
@@ -220,12 +218,12 @@ static void geni_se_io_init(void __iomem *base)
 {
 	u32 val;
 
-	val = readl_relaxed(base + GENI_CGC_CTRL);
+	val = readl_relaxed(base + SE_GENI_CGC_CTRL);
 	val |= DEFAULT_CGC_EN;
-	writel_relaxed(val, base + GENI_CGC_CTRL);
+	writel_relaxed(val, base + SE_GENI_CGC_CTRL);
 
 	val = readl_relaxed(base + SE_DMA_GENERAL_CFG);
-	val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CFG_ON;
+	val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CLK_CGC_ON;
 	val |= DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
 	writel_relaxed(val, base + SE_DMA_GENERAL_CFG);
 
@@ -891,6 +889,379 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+/**
+ * geni_read_elf() - Read an ELF file.
+ * @se: Pointer to the SE resources structure.
+ * @fw: Pointer to the firmware buffer.
+ * @pelfseg: Pointer to the SE-specific ELF header.
+ *
+ * Read the ELF file and output a pointer to the header data, which
+ * contains the firmware data and any other details.
+ *
+ * Return: 0 if successful, otherwise return an error value.
+ */
+static int geni_read_elf(struct geni_se *se, const struct firmware *fw, struct se_fw_hdr **pelfseg)
+{
+	const struct elf32_hdr *ehdr;
+	struct elf32_phdr *phdrs, *phdr;
+	const struct se_fw_hdr *elfseg;
+	const u8 *addr;
+	int i;
+
+	if (!fw || fw->size < sizeof(struct elf32_hdr))
+		return -EINVAL;
+
+	ehdr = (struct elf32_hdr *)fw->data;
+	phdrs = (struct elf32_phdr *)(ehdr + 1);
+
+	if (ehdr->e_phnum < 2)
+		return -EINVAL;
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &phdrs[i];
+
+		if (fw->size < phdr->p_offset + phdr->p_filesz)
+			return -EINVAL;
+
+		if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
+			continue;
+
+		if (MI_PBT_PAGE_MODE_VALUE(phdr->p_flags) != MI_PBT_NON_PAGED_SEGMENT ||
+		    MI_PBT_SEGMENT_TYPE_VALUE(phdr->p_flags) == MI_PBT_HASH_SEGMENT ||
+		    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) == MI_PBT_NOTUSED_SEGMENT ||
+		    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) == MI_PBT_SHARED_SEGMENT)
+			continue;
+
+		if (phdr->p_filesz < sizeof(struct se_fw_hdr))
+			continue;
+
+		addr = fw->data + phdr->p_offset;
+		elfseg = (const struct se_fw_hdr *)addr;
+
+		if (cpu_to_le32(elfseg->magic) != MAGIC_NUM_SE || elfseg->version != 1)
+			continue;
+
+		if (phdr->p_filesz < elfseg->fw_offset +
+				     elfseg->fw_size_in_items * sizeof(u32) ||
+		    phdr->p_filesz < elfseg->cfg_idx_offset +
+				     elfseg->cfg_size_in_items * sizeof(u8) ||
+		    phdr->p_filesz < elfseg->cfg_val_offset +
+				     elfseg->cfg_size_in_items * sizeof(u32))
+			continue;
+
+		if (elfseg->serial_protocol != se->protocol)
+			continue;
+
+		*pelfseg = (struct se_fw_hdr *)addr;
+		return 0;
+	}
+	return -EINVAL;
+}
+
+/**
+ * geni_configure_xfer_mode() - Set the transfer mode.
+ * @se: Pointer to a structure representing SE-related resources.
+ *
+ * Set the transfer mode to either FIFO or DMA according to the mode specified by the protocol
+ * driver.
+ *
+ * Return: 0 if successful, otherwise return an error value.
+ */
+static int geni_configure_xfer_mode(struct geni_se *se)
+{
+	/* Configure SE FIFO, DMA or GSI mode. */
+	switch (se->mode) {
+	case GENI_GPI_DMA:
+		geni_setbits32(se->base + SE_GENI_DMA_MODE_EN, GENI_DMA_MODE_EN);
+		writel_relaxed(0x0, se->base + SE_IRQ_EN);
+		writel_relaxed(DMA_RX_EVENT_EN | DMA_TX_EVENT_EN |
+			       GENI_M_EVENT_EN | GENI_S_EVENT_EN,
+			       se->base + SE_GSI_EVENT_EN);
+		break;
+
+	case GENI_SE_FIFO:
+		geni_clrbits32(se->base + SE_GENI_DMA_MODE_EN, GENI_DMA_MODE_EN);
+		writel_relaxed(DMA_RX_IRQ_EN | DMA_TX_IRQ_EN | GENI_M_IRQ_EN | GENI_S_IRQ_EN,
+			       se->base + SE_IRQ_EN);
+		writel_relaxed(0x0, se->base + SE_GSI_EVENT_EN);
+		break;
+
+	case GENI_SE_DMA:
+		geni_setbits32(se->base + SE_GENI_DMA_MODE_EN, GENI_DMA_MODE_EN);
+		writel_relaxed(DMA_RX_IRQ_EN | DMA_TX_IRQ_EN | GENI_M_IRQ_EN | GENI_S_IRQ_EN,
+			       se->base + SE_IRQ_EN);
+		writel_relaxed(0x0, se->base + SE_GSI_EVENT_EN);
+		break;
+
+	default:
+		dev_err(se->dev, "Invalid geni-se transfer mode: %d\n", se->mode);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+/**
+ * geni_enable_interrupts() - Enable interrupts.
+ * @se: Pointer to a structure representing SE-related resources.
+ *
+ * Enable the required interrupts during the firmware load process.
+ *
+ */
+static void geni_enable_interrupts(struct geni_se *se)
+{
+	u32 reg_value;
+
+	/* Enable required interrupts. */
+	writel_relaxed(M_COMMON_GENI_M_IRQ_EN, se->base + SE_GENI_M_IRQ_EN);
+
+	reg_value = S_CMD_OVERRUN_EN | S_ILLEGAL_CMD_EN |
+		    S_CMD_CANCEL_EN | S_CMD_ABORT_EN |
+		    S_GP_IRQ_0_EN | S_GP_IRQ_1_EN |
+		    S_GP_IRQ_2_EN | S_GP_IRQ_3_EN |
+		    S_RX_FIFO_WR_ERR_EN | S_RX_FIFO_RD_ERR_EN;
+	writel_relaxed(reg_value, se->base + SE_GENI_S_IRQ_ENABLE);
+
+	/* DMA mode configuration. */
+	reg_value = RESET_DONE_EN | SBE_EN | DMA_DONE_EN;
+	writel_relaxed(reg_value, se->base + SE_DMA_TX_IRQ_EN_SET);
+	reg_value = FLUSH_DONE_EN | RESET_DONE_EN | SBE_EN | DMA_DONE_EN;
+	writel_relaxed(reg_value, se->base + SE_DMA_RX_IRQ_EN_SET);
+}
+
+/**
+ * geni_write_fw_revision() - Write the firmware revision.
+ * @se: Pointer to a structure representing SE-related resources.
+ * @serial_protocol: serial protocol type.
+ * @fw_version: QUP firmware version.
+ *
+ * Write the firmware revision and protocol into the respective register.
+ *
+ * Return: None.
+ */
+static void geni_write_fw_revision(struct geni_se *se, u16 serial_protocol, u16 fw_version)
+{
+	u32 reg_value;
+
+	reg_value = FIELD_PREP(FW_REV_PROTOCOL_MSK, serial_protocol);
+	reg_value |= FIELD_PREP(FW_REV_VERSION_MSK, fw_version);
+
+	writel_relaxed(reg_value, se->base + SE_GENI_FW_REVISION);
+	writel_relaxed(reg_value, se->base + SE_S_FW_REVISION);
+}
+
+/**
+ * geni_load_se_fw() - Load Serial Engine specific firmware.
+ * @se: Pointer to a structure representing SE-related resources.
+ * @fw: Pointer to the firmware structure.
+ *
+ * Load the protocol firmware into the IRAM of the Serial Engine.
+ *
+ * Return: 0 if successful, otherwise return an error value.
+ */
+static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw)
+{
+	const u32 *fw_data, *cfg_val_arr;
+	const u8 *cfg_idx_arr;
+	u32 i, reg_value, ramn_cnt;
+	int ret;
+	struct se_fw_hdr *hdr;
+
+	ret = geni_read_elf(se, fw, &hdr);
+	if (ret) {
+		dev_err(se->dev, "ELF parsing failed ret: %d\n", ret);
+		return ret;
+	}
+
+	ramn_cnt = hdr->fw_size_in_items;
+	if (hdr->fw_size_in_items % 2 != 0)
+		ramn_cnt++;
+
+	if (ramn_cnt >= MAX_GENI_CFG_RAMn_CNT)
+		return -EINVAL;
+
+	ret = geni_icc_set_bw(se);
+	if (ret)
+		return ret;
+
+	ret = geni_icc_enable(se);
+	if (ret)
+		return ret;
+
+	ret = geni_se_resources_on(se);
+	if (ret)
+		goto err;
+
+	ramn_cnt = hdr->fw_size_in_items;
+	if (hdr->fw_size_in_items % 2 != 0)
+		ramn_cnt++;
+
+	if (ramn_cnt >= MAX_GENI_CFG_RAMn_CNT)
+		goto err_resource;
+
+	fw_data = (const u32 *)((u8 *)hdr + hdr->fw_offset);
+	cfg_idx_arr = (const u8 *)hdr + hdr->cfg_idx_offset;
+	cfg_val_arr = (const u32 *)((u8 *)hdr + hdr->cfg_val_offset);
+
+	/* Disable high priority interrupt until current low priority interrupts are handled. */
+	geni_setbits32(se->wrapper->base + QUPV3_COMMON_CFG, FAST_SWITCH_TO_HIGH_DISABLE);
+
+	/* Set AHB_M_CLK_CGC_ON to indicate hardware controls se-wrapper cgc clock. */
+	geni_setbits32(se->wrapper->base + QUPV3_SE_AHB_M_CFG, AHB_M_CLK_CGC_ON);
+
+	/* Let hardware to control common cgc. */
+	geni_setbits32(se->wrapper->base + QUPV3_COMMON_CGC_CTRL, COMMON_CSR_SLV_CLK_CGC_ON);
+
+	/* Allows to drive corresponding data according to hardware value. */
+	writel_relaxed(0x0, se->base + GENI_OUTPUT_CTRL);
+
+	/* Set SCLK and HCLK to program RAM */
+	geni_setbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
+	writel_relaxed(0x0, se->base + SE_GENI_CLK_CTRL);
+	geni_clrbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
+
+	/* Enable required clocks for DMA CSR, TX and RX. */
+	reg_value = AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CLK_CGC_ON |
+		    DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
+	geni_setbits32(se->base + SE_DMA_GENERAL_CFG, reg_value);
+
+	/* Let hardware control CGC by default. */
+	writel_relaxed(DEFAULT_CGC_EN, se->base + SE_GENI_CGC_CTRL);
+
+	/* Set version of the configuration register part of firmware. */
+	writel_relaxed(hdr->cfg_version, se->base + SE_GENI_INIT_CFG_REVISION);
+	writel_relaxed(hdr->cfg_version, se->base + SE_GENI_S_INIT_CFG_REVISION);
+
+	/* Configure GENI primitive table. */
+	for (i = 0; i < hdr->cfg_size_in_items; i++)
+		writel_relaxed(cfg_val_arr[i],
+			       se->base + SE_GENI_CFG_REG0 + (cfg_idx_arr[i] * sizeof(u32)));
+
+	/* Configure condition for assertion of RX_RFR_WATERMARK condition. */
+	reg_value = geni_se_get_rx_fifo_depth(se);
+	writel_relaxed(reg_value - 2, se->base + SE_GENI_RX_RFR_WATERMARK_REG);
+
+	/* Let hardware control CGC */
+	geni_setbits32(se->base + GENI_OUTPUT_CTRL, DEFAULT_IO_OUTPUT_CTRL_MSK);
+
+	ret = geni_configure_xfer_mode(se);
+	if (ret)
+		goto err_resource;
+
+	geni_enable_interrupts(se);
+
+	geni_write_fw_revision(se, hdr->serial_protocol, hdr->fw_version);
+
+	ramn_cnt = hdr->fw_size_in_items;
+	if (hdr->fw_size_in_items % 2 != 0)
+		ramn_cnt++;
+
+	if (ramn_cnt >= MAX_GENI_CFG_RAMn_CNT)
+		goto err_resource;
+
+	/* Program RAM address space. */
+	memcpy_toio(se->base + SE_GENI_CFG_RAMN, fw_data, ramn_cnt * sizeof(u32));
+
+	/* Put default values on GENI's output pads. */
+	writel_relaxed(0x1, se->base + GENI_FORCE_DEFAULT_REG);
+
+	/* High to low SCLK and HCLK to finish RAM. */
+	geni_setbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
+	geni_setbits32(se->base + SE_GENI_CLK_CTRL, SER_CLK_SEL);
+	geni_clrbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
+
+	/* Serial engine DMA interface is enabled. */
+	geni_setbits32(se->base + SE_DMA_IF_EN, DMA_IF_EN);
+
+	/* Enable or disable FIFO interface of the serial engine. */
+	if (se->mode == GENI_SE_FIFO)
+		geni_clrbits32(se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
+	else
+		geni_setbits32(se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
+
+err_resource:
+	geni_se_resources_off(se);
+err:
+	geni_icc_disable(se);
+	return ret;
+}
+
+/**
+ * qup_fw_load() - Initiate firmware load.
+ * @se: Pointer to a structure representing SE-related resources.
+ * @fw_name: Name of the firmware.
+ *
+ * Load the firmware into a specific SE. Read the associated ELF file,
+ * copy the data into a buffer in kernel space using the request_firmware API, write the
+ * data into the SE's IRAM register, and then free the buffers. Handle firmware loading
+ * and parsing for a specific protocol.
+ *
+ * Return: 0 if successful, otherwise return an error value.
+ */
+static int qup_fw_load(struct geni_se *se, const char *fw_name)
+{
+	int ret;
+	const struct firmware *fw;
+	struct device *dev = se->dev;
+
+	ret = request_firmware(&fw, fw_name, dev);
+	if (ret) {
+		dev_err(dev, "request_firmware failed for %d: %d\n", se->protocol, ret);
+		return ret;
+	}
+
+	ret = geni_load_se_fw(se, fw);
+
+	release_firmware(fw);
+
+	return ret;
+}
+
+/**
+ * geni_load_se_firmware() - Initiate firmware loading.
+ * @se: Serial engine details.
+ * @protocol: Protocol (SPI, I2C, or UART) for which the firmware is to be loaded.
+ *
+ * If the device tree properties are configured to load QUP firmware and the firmware
+ * is not already loaded, start the firmware loading process. If the device tree properties
+ * are not defined, skip loading the firmware, assuming it is already loaded by TZ.
+ *
+ * Return: 0 if successful, otherwise return an error value.
+ */
+int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol)
+{
+	const char *fw_name;
+	int ret;
+
+	if (protocol >= MAX_PROTOCOL) {
+		dev_err(se->dev, "Invalid geni-se protocol: %d", protocol);
+		return  -EINVAL;
+	}
+
+	ret = device_property_read_string(se->wrapper->dev, "firmware-name", &fw_name);
+	if (ret)
+		return  -EINVAL;
+
+	se->protocol = protocol;
+
+	if (of_property_read_bool(se->dev->of_node, "qcom,enable-gsi-dma"))
+		se->mode = GENI_GPI_DMA;
+	else
+		se->mode = GENI_SE_FIFO;
+
+	/* GSI mode is not supported by the UART driver; therefore, setting FIFO mode */
+	if (protocol == GENI_SE_UART)
+		se->mode = GENI_SE_FIFO;
+
+	ret = qup_fw_load(se, fw_name);
+	if (ret)
+		return ret;
+
+	dev_dbg(se->dev, "Firmware load for %s protocol is successful for xfer mode %d\n",
+		protocol_name[se->protocol], se->mode);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(geni_load_se_firmware);
+
 static int geni_se_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 2996a3c28ef3..6b75171d65ec 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -1,11 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _LINUX_QCOM_GENI_SE
 #define _LINUX_QCOM_GENI_SE
 
+#include <linux/bitfield.h>
 #include <linux/interconnect.h>
 
 /**
@@ -36,6 +38,7 @@ enum geni_se_protocol_type {
 	GENI_SE_I2C,
 	GENI_SE_I3C,
 	GENI_SE_SPI_SLAVE,
+	GENI_SE_INVALID_PROTO = 255,
 };
 
 struct geni_wrapper;
@@ -61,6 +64,8 @@ struct geni_icc_path {
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @mode:		Transfer mode se fifo, dma or gsi.
+ * @protocol:		Protocol spi or i2c or serial.
  */
 struct geni_se {
 	void __iomem *base;
@@ -70,24 +75,32 @@ struct geni_se {
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	enum geni_se_xfer_mode mode;
+	enum geni_se_protocol_type protocol;
 };
 
 /* Common SE registers */
+#define SE_GENI_INIT_CFG_REVISION	0x0
+#define SE_GENI_S_INIT_CFG_REVISION	0x4
 #define GENI_FORCE_DEFAULT_REG		0x20
 #define GENI_OUTPUT_CTRL		0x24
+#define SE_GENI_CGC_CTRL		0x28
 #define SE_GENI_STATUS			0x40
 #define GENI_SER_M_CLK_CFG		0x48
 #define GENI_SER_S_CLK_CFG		0x4c
 #define GENI_IF_DISABLE_RO		0x64
-#define GENI_FW_REVISION_RO		0x68
+#define SE_GENI_FW_REVISION_RO		0x68
+#define SE_GENI_S_FW_REVISION_RO	0x6c
 #define SE_GENI_CLK_SEL			0x7c
 #define SE_GENI_CFG_SEQ_START		0x84
+#define SE_GENI_CFG_REG0		0x100
 #define SE_GENI_DMA_MODE_EN		0x258
 #define SE_GENI_M_CMD0			0x600
 #define SE_GENI_M_CMD_CTRL_REG		0x604
 #define SE_GENI_M_IRQ_STATUS		0x610
 #define SE_GENI_M_IRQ_EN		0x614
 #define SE_GENI_M_IRQ_CLEAR		0x618
+#define SE_GENI_S_IRQ_ENABLE		0x644
 #define SE_GENI_M_IRQ_EN_SET		0x61c
 #define SE_GENI_M_IRQ_EN_CLEAR		0x620
 #define SE_GENI_S_CMD0			0x630
@@ -109,13 +122,22 @@ struct geni_se {
 #define SE_GENI_S_GP_LENGTH		0x914
 #define SE_DMA_TX_IRQ_STAT		0xc40
 #define SE_DMA_TX_IRQ_CLR		0xc44
+#define SE_DMA_TX_IRQ_EN_SET		0xc4c
 #define SE_DMA_TX_FSM_RST		0xc58
 #define SE_DMA_RX_IRQ_STAT		0xd40
 #define SE_DMA_RX_IRQ_CLR		0xd44
+#define SE_DMA_RX_IRQ_EN_SET		0xd4c
 #define SE_DMA_RX_LEN_IN		0xd54
 #define SE_DMA_RX_FSM_RST		0xd58
 #define SE_HW_PARAM_0			0xe24
 #define SE_HW_PARAM_1			0xe28
+#define SE_DMA_GENERAL_CFG		0xe30
+#define SE_GENI_FW_REVISION		0x1000
+#define SE_S_FW_REVISION		0x1004
+#define SE_GENI_CFG_RAMN		0x1010
+#define SE_GENI_CLK_CTRL		0x2000
+#define SE_DMA_IF_EN			0x2004
+#define SE_FIFO_IF_DISABLE		0x2008
 
 /* GENI_FORCE_DEFAULT_REG fields */
 #define FORCE_DEFAULT	BIT(0)
@@ -137,7 +159,7 @@ struct geni_se {
 
 /* GENI_FW_REVISION_RO fields */
 #define FW_REV_PROTOCOL_MSK		GENMASK(15, 8)
-#define FW_REV_PROTOCOL_SHFT		8
+#define FW_REV_VERSION_MSK		GENMASK(7, 0)
 
 /* GENI_CLK_SEL fields */
 #define CLK_SEL_MSK			GENMASK(2, 0)
@@ -325,9 +347,9 @@ static inline u32 geni_se_read_proto(struct geni_se *se)
 {
 	u32 val;
 
-	val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
+	val = readl_relaxed(se->base + SE_GENI_FW_REVISION_RO);
 
-	return (val & FW_REV_PROTOCOL_MSK) >> FW_REV_PROTOCOL_SHFT;
+	return FIELD_GET(FW_REV_PROTOCOL_MSK, val);
 }
 
 /**
@@ -531,5 +553,7 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag);
 int geni_icc_enable(struct geni_se *se);
 
 int geni_icc_disable(struct geni_se *se);
+
+int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
diff --git a/include/linux/soc/qcom/qup-fw-load.h b/include/linux/soc/qcom/qup-fw-load.h
new file mode 100644
index 000000000000..94a6c4c10bcf
--- /dev/null
+++ b/include/linux/soc/qcom/qup-fw-load.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef _LINUX_QCOM_QUP_FW_LOAD
+#define _LINUX_QCOM_QUP_FW_LOAD
+
+#include <linux/kernel.h>
+
+/*Magic numbers*/
+#define MAGIC_NUM_SE			0x57464553
+
+#define MAX_GENI_CFG_RAMn_CNT		455
+
+#define MI_PBT_NON_PAGED_SEGMENT	0x0
+#define MI_PBT_HASH_SEGMENT		0x2
+#define MI_PBT_NOTUSED_SEGMENT		0x3
+#define MI_PBT_SHARED_SEGMENT		0x4
+
+#define MI_PBT_FLAG_PAGE_MODE		BIT(20)
+#define MI_PBT_FLAG_SEGMENT_TYPE	GENMASK(26, 24)
+#define MI_PBT_FLAG_ACCESS_TYPE		GENMASK(23, 21)
+
+#define MI_PBT_PAGE_MODE_VALUE(x) FIELD_GET(MI_PBT_FLAG_PAGE_MODE, x)
+
+#define MI_PBT_SEGMENT_TYPE_VALUE(x) FIELD_GET(MI_PBT_FLAG_SEGMENT_TYPE, x)
+
+#define MI_PBT_ACCESS_TYPE_VALUE(x) FIELD_GET(MI_PBT_FLAG_ACCESS_TYPE, x)
+
+#define M_COMMON_GENI_M_IRQ_EN	(GENMASK(6, 1) | \
+				M_IO_DATA_DEASSERT_EN | \
+				M_IO_DATA_ASSERT_EN | M_RX_FIFO_RD_ERR_EN | \
+				M_RX_FIFO_WR_ERR_EN | M_TX_FIFO_RD_ERR_EN | \
+				M_TX_FIFO_WR_ERR_EN)
+
+/* DMA_TX/RX_IRQ_EN fields */
+#define DMA_DONE_EN		BIT(0)
+#define SBE_EN			BIT(2)
+#define RESET_DONE_EN		BIT(3)
+#define FLUSH_DONE_EN		BIT(4)
+
+/* GENI_CLK_CTRL fields */
+#define SER_CLK_SEL		BIT(0)
+
+/* GENI_DMA_IF_EN fields */
+#define DMA_IF_EN		BIT(0)
+
+#define QUPV3_COMMON_CFG		0x120
+#define FAST_SWITCH_TO_HIGH_DISABLE	BIT(0)
+
+#define QUPV3_SE_AHB_M_CFG		0x118
+#define AHB_M_CLK_CGC_ON		BIT(0)
+
+#define QUPV3_COMMON_CGC_CTRL		0x21C
+#define COMMON_CSR_SLV_CLK_CGC_ON	BIT(0)
+
+/* access ports */
+#define geni_setbits32(_addr, _v) writel_relaxed(readl_relaxed(_addr) |  (_v), _addr)
+#define geni_clrbits32(_addr, _v) writel_relaxed(readl_relaxed(_addr) & ~(_v), _addr)
+
+/**
+ * struct se_fw_hdr - Serial Engine firmware configuration header
+ *
+ * This structure defines metadata for the Serial Engine (SE) firmware
+ * configuration. Although it is embedded within an ELF segment, it is
+ * not part of the ELF format itself.
+ *
+ * @magic: Set to 'SEFW'
+ * @version: Structure version number
+ * @core_version: QUPV3 hardware version
+ * @serial_protocol: Encoded in GENI_FW_REVISION
+ * @fw_version: Firmware version, from GENI_FW_REVISION
+ * @cfg_version: Configuration version, from GENI_INIT_CFG_REVISION
+ * @fw_size_in_items: Number of 32-bit words in GENI_FW_RAM
+ * @fw_offset: Byte offset to GENI_FW_RAM array
+ * @cfg_size_in_items: Number of GENI_FW_CFG index/value pairs
+ * @cfg_idx_offset: Byte offset to GENI_FW_CFG index array
+ * @cfg_val_offset: Byte offset to GENI_FW_CFG values array
+ */
+struct se_fw_hdr {
+	__le32 magic;
+	u32 version;
+	u32 core_version;
+	u16 serial_protocol;
+	u16 fw_version;
+	u16 cfg_version;
+	u16 fw_size_in_items;
+	u16 fw_offset;
+	u16 cfg_size_in_items;
+	u16 cfg_idx_offset;
+	u16 cfg_val_offset;
+};
+#endif /* _LINUX_QCOM_QUP_FW_LOAD */
-- 
2.34.1


