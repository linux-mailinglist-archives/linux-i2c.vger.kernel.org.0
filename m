Return-Path: <linux-i2c+bounces-12847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B9B527B7
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 06:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B37FC7B28A1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 04:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16F723A994;
	Thu, 11 Sep 2025 04:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYW/t4EY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E048023D7FB
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 04:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757565214; cv=none; b=W7mGN1MYfvcLGqsdoXCrXzPt2Ly7ct4tVY8M6mrvRRybof8TVnyQVcbhce/zHz3lZauqC6ZTRVQpJZ+PSMEPpCoIGJWeG7W/ATlnL5Z3/xDyOvMtCMIRkJJILI3hoOmeFlemqK3gZY7omPWq/MvrhjYk8W/cK9U6F/X7GF/tn6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757565214; c=relaxed/simple;
	bh=IuTTTz5P3pT6aIgjEgLPAZ4eCiWbYIdkJr6qIq4sSeU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KickEqpnJ/ih0TiLUUkVi9v5bsVTMt80BcKdAsVwi/+9PXC83L7JKJs6XweaPzDNRwYltQYSqymGuZ40u7dUHZ/GZ22QRgJyiBperR/5E0X0YbzOpTxA2ORzLN8zZBtLsb40ae0GwF/TjntWQAZoHe02WpPJQQYsjWxXCti0Rug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYW/t4EY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IbmF005468
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 04:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vG8gSd80zTK
	yqq0gSzZBIRZdPsyehnM9UQ31oy6XLek=; b=FYW/t4EYsNovxMxy8CE4J7jTurc
	gO9MAVZa9WowG0FShjw2D8F95YdbmerEBlpaM8S+gkXcJGZJms4sJUx2oPW6jKrB
	jg3IO3zKXHWfpWEAX6OdnroUbXbjrFLxdn7Jm3zetKG/xynaJUu4dpLGGMCEVF5I
	5HQWKubmOsPZPyobHL25QR6zB4RG2gHRNzTNN0pOrkLIe/pJbDAZoo8othu4BqkV
	t2dNKcKhuVAi2mweaUHj2P5iu9OH6CHrFfL1trsvLJOwxLuS6v9U6uzlxzAOFVKT
	Mb+CtbWA7kf1QcgU6DTPQDYmHnm79LEN6euraGq0eUt43nKkAlK1RPjo+Bg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2a9tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 04:33:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458345f5dso3813965ad.3
        for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 21:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757565208; x=1758170008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vG8gSd80zTKyqq0gSzZBIRZdPsyehnM9UQ31oy6XLek=;
        b=HpWGyte/lJUKM4ee3K+dXZWNUNutctKLn+t5OCEWFvLhejFUlUa95Z8PWGrD87NnAV
         jUVfeZQpv+ffryzR9A+gzMC1lu0/sK0wY9kV+mLofbxRLXQlj+ujAh0LvdxF2GZEtJH1
         lwikYU6D9EuqzkCtUGyjrLoUNjO8XSY+PMlOSuuJVtPd4Q7Zq/+6kZGqMq8ECVFyAzCd
         dFUcFppu2ppt1VIxerlVuNtyrKNq2gTM7OtgmCTJQq20GioG/pKkOWgloRSO+f70UJhH
         9P0n1F6Ec0L61ctb4T3q2uLe/rSOWtZtQ1Wfl7QxfUFyUSazQJUFx1ogcLI8eu3Ovm+u
         er5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRtnDHBO+5OIxaHZU2otzF+2spXNmbRvQbMrduyvzN69fEN1lyayLNmzvJh2ABBXqbe5NyjPQSsfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwBffoKLsuk2Ltm1Uiu6mL1LpMMpAcwVbyB46GBPaNDxvenL3H
	jKZHJmQyl+vMxJFa8yswFwJOyT9CO0lTFRZpTY6nZTsA+dTtpcZczqwYjU84i8ymwC1TdoKNl/N
	in+4xQsq83e7KeXE4WkSVeAk3XUkE9xL+tU+WwoVmAbY+z4Y4N+qAe+gJlZpOBVU=
X-Gm-Gg: ASbGncsPtAOh0USiWnp2x3K0JQj7p4i+7cA9OLlmjNblpU8snTvBgpC7Z/Q1T+Frzd0
	7j8guUYioaOWXPc3WIEJuE/sbhSN6wnnYt3WDQgTwTiUbNIkRA0zxvGyOcp9GppL9fA1D1OnbY0
	oU3m5ZkE+KcKvq7QQCvM6w19ZX9jj6lM9h9DPYUU2UseJgUJaIU1EuFFe9mZO6LtlACo+qbbQ8T
	Pq/vrAiTeP1v4tTVjxzKxtY9Ud1GcCORKmh7zG0SxoKKDJ6N6erk6QvqE0tXO+tEgNLNRMlJvma
	BfzvM60963CWwO09ndf69n4BI9NIedYU3xcgCLuA6W26LqZ2jJfgk6sxELTFgbtPeWW8949CRdZ
	x
X-Received: by 2002:a17:903:32ca:b0:24e:6362:8ca5 with SMTP id d9443c01a7336-2516e88795fmr223604495ad.17.1757565207927;
        Wed, 10 Sep 2025 21:33:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7cOx79OL11dICcsNYYB9X5Lo9hq+soLcYBnRc5wz9C2Vi1oo1p/1Aoh6nC1uM6ojxTg7OzA==
X-Received: by 2002:a17:903:32ca:b0:24e:6362:8ca5 with SMTP id d9443c01a7336-2516e88795fmr223604035ad.17.1757565207181;
        Wed, 10 Sep 2025 21:33:27 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a46csm4323975ad.91.2025.09.10.21.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 21:33:26 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, broonie@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v7 3/6] soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
Date: Thu, 11 Sep 2025 10:02:53 +0530
Message-Id: <20250911043256.3523057-4-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c25119 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=TIEv9Isvh9-nJ-6Hp_oA:9 a=4X4QlWh5XKUCARAt:21 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: K8jZ0fla0hAp5LP1C1gl4XSxzKm91YmZ
X-Proofpoint-GUID: K8jZ0fla0hAp5LP1C1gl4XSxzKm91YmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfXytU3iCCDK2FH
 ZBvEBvJbO5zCqLV8H73n/ljBy3mJnItaFzdxptXzvuKQWsEQmxzt0IJdsXCDxdvocISM0Uzj888
 XQDkkjA9cVGDVSNbT4n6LLhDXGqVIZnlZmgqoOKI9vbUiI8lH4Iopw59LaoR630uxS5VEaxAvPR
 dONiez7E43v/rjFYDMGSgz9eu2Us9JZ21E8LVJc1+BpLrkoJApZtaxyaLW0M0fk3Cc6Z/LnoBGB
 ZaWcse23kC9Qvj55MZDzye8GsqG9sR31JEdsRou2mCGLw25XSEpEN2alZ7hhnSKk2qgxhNejyln
 yMXpOShmjf0BHKpuGo+oIFAYBNq3w3K2rxL8uYtFZWGnppO8FrQAUJwVM1iKPCwkawIvUdQdJLb
 nXmPRgFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

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
v6 -> v7:

- Resolve kernel test robot warnings.
- Defer the probe if the firmware from the filesystem is not available during early boot time.

v6 Link: https://lore.kernel.org/all/20250822072651.510027-4-viken.dadhaniya@oss.qualcomm.com/

v5 -> v6:

- Moved contents of qup-fw-load.h into qcom-geni-se.c.
- Specified endianness for all members of the se_fw_hdr structure.
- Changed the return type and arguments of the geni_read_elf function.
- Renamed geni_read_elf to geni_find_protocol_fw for clarity.
- Added error logging for corrupt firmware.
- Passed SE mode and protocol type explicitly to all relevant functions.
- Replaced writel_relaxed with writel for stricter memory ordering.
- Renamed variable reg_val to reg for consistency.
- Moved firmware length validation logic into geni_find_protocol_fw.
- Updated function documentation for clarity and accuracy.
- Removed redundant firmware length check.
- Inlined the qup_fw_load function and removed its definition.
- Removed the MAX_PROTOCOL macro.
- Dropped mode and protocol fields from the geni_se structure.
- Moved unrelated firmware loading code into a separate patch.

v5 Link: https://lore.kernel.org/linux-i2c/20250624095102.1587580-3-viken.dadhaniya@oss.qualcomm.com/

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
 drivers/soc/qcom/qcom-geni-se.c  | 474 ++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/geni-se.h |   4 +
 2 files changed, 475 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index e8ab2833815e..cd1779b6a91a 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -8,7 +8,9 @@
 #define __DISABLE_TRACE_MMIO__
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/firmware.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -113,8 +115,80 @@ struct geni_se_desc {
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
+static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
+
+/**
+ * struct se_fw_hdr - Serial Engine firmware configuration header
+ *
+ * This structure defines the SE firmware header, which together with the
+ * firmware payload is stored in individual ELF segments.
+ *
+ * @magic: Set to 'SEFW'.
+ * @version: Structure version number.
+ * @core_version: QUPV3 hardware version.
+ * @serial_protocol: Encoded in GENI_FW_REVISION.
+ * @fw_version: Firmware version, from GENI_FW_REVISION.
+ * @cfg_version: Configuration version, from GENI_INIT_CFG_REVISION.
+ * @fw_size_in_items: Number of 32-bit words in GENI_FW_RAM.
+ * @fw_offset: Byte offset to GENI_FW_RAM array.
+ * @cfg_size_in_items: Number of GENI_FW_CFG index/value pairs.
+ * @cfg_idx_offset: Byte offset to GENI_FW_CFG index array.
+ * @cfg_val_offset: Byte offset to GENI_FW_CFG values array.
+ */
+struct se_fw_hdr {
+	__le32 magic;
+	__le32 version;
+	__le32 core_version;
+	__le16 serial_protocol;
+	__le16 fw_version;
+	__le16 cfg_version;
+	__le16 fw_size_in_items;
+	__le16 fw_offset;
+	__le16 cfg_size_in_items;
+	__le16 cfg_idx_offset;
+	__le16 cfg_val_offset;
+};
+
+/*Magic numbers*/
+#define SE_MAGIC_NUM			0x57464553
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
 /* Common QUPV3 registers */
 #define QUPV3_HW_VER_REG		0x4
+#define QUPV3_SE_AHB_M_CFG		0x118
+#define QUPV3_COMMON_CFG		0x120
+#define QUPV3_COMMON_CGC_CTRL		0x21c
+
+/* QUPV3_COMMON_CFG fields */
+#define FAST_SWITCH_TO_HIGH_DISABLE	BIT(0)
+
+/* QUPV3_SE_AHB_M_CFG fields */
+#define AHB_M_CLK_CGC_ON		BIT(0)
+
+/* QUPV3_COMMON_CGC_CTRL fields */
+#define COMMON_CSR_SLV_CLK_CGC_ON	BIT(0)
 
 /* Common SE registers */
 #define SE_GENI_INIT_CFG_REVISION	0x0
@@ -122,11 +196,13 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 #define SE_GENI_CGC_CTRL		0x28
 #define SE_GENI_CLK_CTRL_RO		0x60
 #define SE_GENI_FW_S_REVISION_RO	0x6c
+#define SE_GENI_CFG_REG0		0x100
 #define SE_GENI_BYTE_GRAN		0x254
 #define SE_GENI_TX_PACKING_CFG0		0x260
 #define SE_GENI_TX_PACKING_CFG1		0x264
 #define SE_GENI_RX_PACKING_CFG0		0x284
 #define SE_GENI_RX_PACKING_CFG1		0x288
+#define SE_GENI_S_IRQ_ENABLE		0x644
 #define SE_DMA_TX_PTR_L			0xc30
 #define SE_DMA_TX_PTR_H			0xc34
 #define SE_DMA_TX_ATTR			0xc38
@@ -148,6 +224,15 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 #define SE_GSI_EVENT_EN			0xe18
 #define SE_IRQ_EN			0xe1c
 #define SE_DMA_GENERAL_CFG		0xe30
+#define SE_GENI_FW_REVISION		0x1000
+#define SE_GENI_S_FW_REVISION		0x1004
+#define SE_GENI_CFG_RAMN		0x1010
+#define SE_GENI_CLK_CTRL		0x2000
+#define SE_DMA_IF_EN			0x2004
+#define SE_FIFO_IF_DISABLE		0x2008
+
+/* GENI_FW_REVISION_RO fields */
+#define FW_REV_VERSION_MSK		GENMASK(7, 0)
 
 /* GENI_OUTPUT_CTRL fields */
 #define DEFAULT_IO_OUTPUT_CTRL_MSK	GENMASK(6, 0)
@@ -186,6 +271,15 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 #define RX_DMA_IRQ_DELAY_MSK		GENMASK(8, 6)
 #define RX_DMA_IRQ_DELAY_SHFT		6
 
+/* GENI_CLK_CTRL fields */
+#define SER_CLK_SEL			BIT(0)
+
+/* GENI_DMA_IF_EN fields */
+#define DMA_IF_EN			BIT(0)
+
+#define geni_setbits32(_addr, _v) writel(readl(_addr) |  (_v), _addr)
+#define geni_clrbits32(_addr, _v) writel(readl(_addr) & ~(_v), _addr)
+
 /**
  * geni_se_get_qup_hw_version() - Read the QUP wrapper Hardware version
  * @se:	Pointer to the corresponding serial engine.
@@ -658,9 +752,12 @@ int geni_se_clk_freq_match(struct geni_se *se, unsigned long req_freq,
 }
 EXPORT_SYMBOL_GPL(geni_se_clk_freq_match);
 
-#define GENI_SE_DMA_DONE_EN BIT(0)
-#define GENI_SE_DMA_EOT_EN BIT(1)
-#define GENI_SE_DMA_AHB_ERR_EN BIT(2)
+#define GENI_SE_DMA_DONE_EN		BIT(0)
+#define GENI_SE_DMA_EOT_EN		BIT(1)
+#define GENI_SE_DMA_AHB_ERR_EN		BIT(2)
+#define GENI_SE_DMA_RESET_DONE_EN	BIT(3)
+#define GENI_SE_DMA_FLUSH_DONE		BIT(4)
+
 #define GENI_SE_DMA_EOT_BUF BIT(0)
 
 /**
@@ -891,6 +988,377 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+/**
+ * geni_find_protocol_fw() - Locate and validate SE firmware for a protocol.
+ * @dev: Pointer to the device structure.
+ * @fw: Pointer to the firmware image.
+ * @protocol: Expected serial engine protocol type.
+ *
+ * Identifies the appropriate firmware image or configuration required for a
+ * specific communication protocol instance running on a  Qualcomm GENI
+ * controller.
+ *
+ * Return: pointer to a valid 'struct se_fw_hdr' if found, or NULL otherwise.
+ */
+static struct se_fw_hdr *geni_find_protocol_fw(struct device *dev, const struct firmware *fw,
+					       enum geni_se_protocol_type protocol)
+{
+	const struct elf32_hdr *ehdr;
+	const struct elf32_phdr *phdrs;
+	const struct elf32_phdr	*phdr;
+	struct se_fw_hdr *sefw;
+	u32 fw_end, cfg_idx_end, cfg_val_end;
+	u16 fw_size;
+	int i;
+
+	if (!fw || fw->size < sizeof(struct elf32_hdr))
+		return NULL;
+
+	ehdr = (const struct elf32_hdr *)fw->data;
+	phdrs = (const struct elf32_phdr *)(fw->data + ehdr->e_phoff);
+
+	/*
+	 * The firmware is expected to have at least two program headers (segments).
+	 * One for metadata and the other for the actual protocol-specific firmware.
+	 */
+	if (ehdr->e_phnum < 2) {
+		dev_err(dev, "Invalid firmware: less than 2 program headers\n");
+		return NULL;
+	}
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &phdrs[i];
+
+		if (fw->size < phdr->p_offset + phdr->p_filesz) {
+			dev_err(dev, "Firmware size (%zu) < expected offset (%u) + size (%u)\n",
+				fw->size, phdr->p_offset, phdr->p_filesz);
+			return NULL;
+		}
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
+		sefw = (struct se_fw_hdr *)(fw->data + phdr->p_offset);
+		fw_size = le16_to_cpu(sefw->fw_size_in_items);
+		fw_end = le16_to_cpu(sefw->fw_offset) + fw_size * sizeof(u32);
+		cfg_idx_end = le16_to_cpu(sefw->cfg_idx_offset) +
+			      le16_to_cpu(sefw->cfg_size_in_items) * sizeof(u8);
+		cfg_val_end = le16_to_cpu(sefw->cfg_val_offset) +
+			      le16_to_cpu(sefw->cfg_size_in_items) * sizeof(u32);
+
+		if (le32_to_cpu(sefw->magic) != SE_MAGIC_NUM || le32_to_cpu(sefw->version) != 1)
+			continue;
+
+		if (le32_to_cpu(sefw->serial_protocol) != protocol)
+			continue;
+
+		if (fw_size % 2 != 0) {
+			fw_size++;
+			sefw->fw_size_in_items = cpu_to_le16(fw_size);
+		}
+
+		if (fw_size >= MAX_GENI_CFG_RAMn_CNT) {
+			dev_err(dev,
+				"Firmware size (%u) exceeds max allowed RAMn count (%u)\n",
+				fw_size, MAX_GENI_CFG_RAMn_CNT);
+			continue;
+		}
+
+		if (fw_end > phdr->p_filesz || cfg_idx_end > phdr->p_filesz ||
+		    cfg_val_end > phdr->p_filesz) {
+			dev_err(dev, "Truncated or corrupt SE FW segment found at index %d\n", i);
+			continue;
+		}
+
+		return sefw;
+	}
+
+	dev_err(dev, "Failed to get %s protocol firmware\n", protocol_name[protocol]);
+	return NULL;
+}
+
+/**
+ * geni_configure_xfer_mode() - Set the transfer mode.
+ * @se: Pointer to the concerned serial engine.
+ * @mode: SE data transfer mode.
+ *
+ * Set the transfer mode to either FIFO or DMA according to the mode specified
+ * by the protocol driver.
+ *
+ * Return: 0 if successful, otherwise return an error value.
+ */
+static int geni_configure_xfer_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
+{
+	/* Configure SE FIFO, DMA or GSI mode. */
+	switch (mode) {
+	case GENI_GPI_DMA:
+		geni_setbits32(se->base + SE_GENI_DMA_MODE_EN, GENI_DMA_MODE_EN);
+		writel(0x0, se->base + SE_IRQ_EN);
+		writel(DMA_RX_EVENT_EN | DMA_TX_EVENT_EN | GENI_M_EVENT_EN | GENI_S_EVENT_EN,
+		       se->base + SE_GSI_EVENT_EN);
+		break;
+
+	case GENI_SE_FIFO:
+		geni_clrbits32(se->base + SE_GENI_DMA_MODE_EN, GENI_DMA_MODE_EN);
+		writel(DMA_RX_IRQ_EN | DMA_TX_IRQ_EN | GENI_M_IRQ_EN | GENI_S_IRQ_EN,
+		       se->base + SE_IRQ_EN);
+		writel(0x0, se->base + SE_GSI_EVENT_EN);
+		break;
+
+	case GENI_SE_DMA:
+		geni_setbits32(se->base + SE_GENI_DMA_MODE_EN, GENI_DMA_MODE_EN);
+		writel(DMA_RX_IRQ_EN | DMA_TX_IRQ_EN | GENI_M_IRQ_EN | GENI_S_IRQ_EN,
+		       se->base + SE_IRQ_EN);
+		writel(0x0, se->base + SE_GSI_EVENT_EN);
+		break;
+
+	default:
+		dev_err(se->dev, "Invalid geni-se transfer mode: %d\n", mode);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+/**
+ * geni_enable_interrupts() - Enable interrupts.
+ * @se: Pointer to the concerned serial engine.
+ *
+ * Enable the required interrupts during the firmware load process.
+ */
+static void geni_enable_interrupts(struct geni_se *se)
+{
+	u32 val;
+
+	/* Enable required interrupts. */
+	writel(M_COMMON_GENI_M_IRQ_EN, se->base + SE_GENI_M_IRQ_EN);
+
+	val = S_CMD_OVERRUN_EN | S_ILLEGAL_CMD_EN | S_CMD_CANCEL_EN | S_CMD_ABORT_EN |
+	      S_GP_IRQ_0_EN | S_GP_IRQ_1_EN | S_GP_IRQ_2_EN | S_GP_IRQ_3_EN |
+	      S_RX_FIFO_WR_ERR_EN | S_RX_FIFO_RD_ERR_EN;
+	writel(val, se->base + SE_GENI_S_IRQ_ENABLE);
+
+	/* DMA mode configuration. */
+	val = GENI_SE_DMA_RESET_DONE_EN | GENI_SE_DMA_AHB_ERR_EN | GENI_SE_DMA_DONE_EN;
+	writel(val, se->base + SE_DMA_TX_IRQ_EN_SET);
+	val = GENI_SE_DMA_FLUSH_DONE | GENI_SE_DMA_RESET_DONE_EN | GENI_SE_DMA_AHB_ERR_EN |
+	      GENI_SE_DMA_DONE_EN;
+	writel(val, se->base + SE_DMA_RX_IRQ_EN_SET);
+}
+
+/**
+ * geni_write_fw_revision() - Write the firmware revision.
+ * @se: Pointer to the concerned serial engine.
+ * @serial_protocol: serial protocol type.
+ * @fw_version: QUP firmware version.
+ *
+ * Write the firmware revision and protocol into the respective register.
+ */
+static void geni_write_fw_revision(struct geni_se *se, u16 serial_protocol, u16 fw_version)
+{
+	u32 reg;
+
+	reg = FIELD_PREP(FW_REV_PROTOCOL_MSK, serial_protocol);
+	reg |= FIELD_PREP(FW_REV_VERSION_MSK, fw_version);
+
+	writel(reg, se->base + SE_GENI_FW_REVISION);
+	writel(reg, se->base + SE_GENI_S_FW_REVISION);
+}
+
+/**
+ * geni_load_se_fw() - Load Serial Engine specific firmware.
+ * @se: Pointer to the concerned serial engine.
+ * @fw: Pointer to the firmware structure.
+ * @mode: SE data transfer mode.
+ * @protocol: Protocol type to be used with the SE (e.g., UART, SPI, I2C).
+ *
+ * Load the protocol firmware into the IRAM of the Serial Engine.
+ *
+ * Return: 0 if successful, otherwise return an error value.
+ */
+static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
+			   enum geni_se_xfer_mode mode, enum geni_se_protocol_type protocol)
+{
+	const u32 *fw_data, *cfg_val_arr;
+	const u8 *cfg_idx_arr;
+	u32 i, reg_value;
+	int ret;
+	struct se_fw_hdr *hdr;
+
+	hdr = geni_find_protocol_fw(se->dev, fw, protocol);
+	if (!hdr)
+		return -EINVAL;
+
+	fw_data = (const u32 *)((u8 *)hdr + le16_to_cpu(hdr->fw_offset));
+	cfg_idx_arr = (const u8 *)hdr + le16_to_cpu(hdr->cfg_idx_offset);
+	cfg_val_arr = (const u32 *)((u8 *)hdr + le16_to_cpu(hdr->cfg_val_offset));
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
+		goto out_icc_disable;
+
+	/*
+	 * Disable high-priority interrupts until all currently executing
+	 * low-priority interrupts have been fully handled.
+	 */
+	geni_setbits32(se->wrapper->base + QUPV3_COMMON_CFG, FAST_SWITCH_TO_HIGH_DISABLE);
+
+	/* Set AHB_M_CLK_CGC_ON to indicate hardware controls se-wrapper cgc clock. */
+	geni_setbits32(se->wrapper->base + QUPV3_SE_AHB_M_CFG, AHB_M_CLK_CGC_ON);
+
+	/* Let hardware to control common cgc. */
+	geni_setbits32(se->wrapper->base + QUPV3_COMMON_CGC_CTRL, COMMON_CSR_SLV_CLK_CGC_ON);
+
+	/*
+	 * Setting individual bits in GENI_OUTPUT_CTRL activates corresponding output lines,
+	 * allowing the hardware to drive data as configured.
+	 */
+	writel(0x0, se->base + GENI_OUTPUT_CTRL);
+
+	/* Set SCLK and HCLK to program RAM */
+	geni_setbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
+	writel(0x0, se->base + SE_GENI_CLK_CTRL);
+	geni_clrbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
+
+	/* Enable required clocks for DMA CSR, TX and RX. */
+	reg_value = AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CLK_CGC_ON |
+		    DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
+	geni_setbits32(se->base + SE_DMA_GENERAL_CFG, reg_value);
+
+	/* Let hardware control CGC by default. */
+	writel(DEFAULT_CGC_EN, se->base + SE_GENI_CGC_CTRL);
+
+	/* Set version of the configuration register part of firmware. */
+	writel(le16_to_cpu(hdr->cfg_version), se->base + SE_GENI_INIT_CFG_REVISION);
+	writel(le16_to_cpu(hdr->cfg_version), se->base + SE_GENI_S_INIT_CFG_REVISION);
+
+	/* Configure GENI primitive table. */
+	for (i = 0; i < le16_to_cpu(hdr->cfg_size_in_items); i++)
+		writel(cfg_val_arr[i],
+		       se->base + SE_GENI_CFG_REG0 + (cfg_idx_arr[i] * sizeof(u32)));
+
+	/* Configure condition for assertion of RX_RFR_WATERMARK condition. */
+	reg_value = geni_se_get_rx_fifo_depth(se);
+	writel(reg_value - 2, se->base + SE_GENI_RX_RFR_WATERMARK_REG);
+
+	/* Let hardware control CGC */
+	geni_setbits32(se->base + GENI_OUTPUT_CTRL, DEFAULT_IO_OUTPUT_CTRL_MSK);
+
+	ret = geni_configure_xfer_mode(se, mode);
+	if (ret)
+		goto out_resources_off;
+
+	geni_enable_interrupts(se);
+
+	geni_write_fw_revision(se, le16_to_cpu(hdr->serial_protocol), le16_to_cpu(hdr->fw_version));
+
+	/* Program RAM address space. */
+	memcpy_toio(se->base + SE_GENI_CFG_RAMN, fw_data,
+		    le16_to_cpu(hdr->fw_size_in_items) * sizeof(u32));
+
+	/* Put default values on GENI's output pads. */
+	writel_relaxed(0x1, se->base + GENI_FORCE_DEFAULT_REG);
+
+	/* Toggle SCLK/HCLK from high to low to finalize RAM programming and apply config. */
+	geni_setbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
+	geni_setbits32(se->base + SE_GENI_CLK_CTRL, SER_CLK_SEL);
+	geni_clrbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
+
+	/* Serial engine DMA interface is enabled. */
+	geni_setbits32(se->base + SE_DMA_IF_EN, DMA_IF_EN);
+
+	/* Enable or disable FIFO interface of the serial engine. */
+	if (mode == GENI_SE_FIFO)
+		geni_clrbits32(se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
+	else
+		geni_setbits32(se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
+
+out_resources_off:
+	geni_se_resources_off(se);
+
+out_icc_disable:
+	geni_icc_disable(se);
+	return ret;
+}
+
+/**
+ * geni_load_se_firmware() - Load firmware for SE based on protocol
+ * @se: Pointer to the concerned serial engine.
+ * @protocol: Protocol type to be used with the SE (e.g., UART, SPI, I2C).
+ *
+ * Retrieves the firmware name from device properties and sets the transfer mode
+ * (FIFO or GSI DMA) based on device tree configuration. Enforces FIFO mode for
+ * UART protocol due to lack of GSI DMA support. Requests the firmware and loads
+ * it into the SE.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol)
+{
+	const char *fw_name;
+	const struct firmware *fw;
+	enum geni_se_xfer_mode mode = GENI_SE_FIFO;
+	int ret;
+
+	if (protocol >= ARRAY_SIZE(protocol_name)) {
+		dev_err(se->dev, "Invalid geni-se protocol: %d", protocol);
+		return -EINVAL;
+	}
+
+	ret = device_property_read_string(se->wrapper->dev, "firmware-name", &fw_name);
+	if (ret) {
+		dev_err(se->dev, "Failed to read firmware-name property: %d\n", ret);
+		return -EINVAL;
+	}
+
+	if (of_property_read_bool(se->dev->of_node, "qcom,enable-gsi-dma"))
+		mode = GENI_GPI_DMA;
+
+	/* GSI mode is not supported by the UART driver; therefore, setting FIFO mode */
+	if (protocol == GENI_SE_UART)
+		mode = GENI_SE_FIFO;
+
+	ret = request_firmware(&fw, fw_name, se->dev);
+	if (ret) {
+		if (ret == -ENOENT)
+			return -EPROBE_DEFER;
+
+		dev_err(se->dev, "Failed to request firmware '%s' for protocol %d: ret: %d\n",
+			fw_name, protocol, ret);
+		return ret;
+	}
+
+	ret = geni_load_se_fw(se, fw, mode, protocol);
+	release_firmware(fw);
+
+	if (ret) {
+		dev_err(se->dev, "Failed to load SE firmware for protocol %d: ret: %d\n",
+			protocol, ret);
+		return ret;
+	}
+
+	dev_dbg(se->dev, "Firmware load for %s protocol is successful for xfer mode: %d\n",
+		protocol_name[protocol], mode);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(geni_load_se_firmware);
+
 static int geni_se_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 2996a3c28ef3..0a984e2579fe 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _LINUX_QCOM_GENI_SE
@@ -36,6 +37,7 @@ enum geni_se_protocol_type {
 	GENI_SE_I2C,
 	GENI_SE_I3C,
 	GENI_SE_SPI_SLAVE,
+	GENI_SE_INVALID_PROTO = 255,
 };
 
 struct geni_wrapper;
@@ -531,5 +533,7 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag);
 int geni_icc_enable(struct geni_se *se);
 
 int geni_icc_disable(struct geni_se *se);
+
+int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
-- 
2.34.1


