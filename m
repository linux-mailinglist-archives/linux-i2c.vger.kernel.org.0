Return-Path: <linux-i2c+bounces-12373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F74B31062
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 09:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5753B2616
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 07:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B74E2EAB89;
	Fri, 22 Aug 2025 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaZO5eSs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7442EAB6F
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847644; cv=none; b=L2slJDWQo6TCU3rGzV/0Ll+6SyyPcJ70P3T6bJj/s8DOGvkiTMBFiGg9IbCzQzFUMTVYaAlwAp2gipxB6Kabv6MvByaa/mSVFSIB43tpxEjN25buzHb8ACWpi7YiqjT0R+wWjcsBDy2mEwOuOiRl2SZeUhC/XhtDu0xT8B6Z0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847644; c=relaxed/simple;
	bh=GgBWYLwIhcgI3QDStgGEVL7eoOZD31LRsQ3SBSLrkKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=flm4yfM44U+eqP2rwR8pzxiVlmr5YLk72XLIE54rWiAM6C98vXLg60iCcMtkt8aGE/fY1oC1U+1mI0uUXE1NGUtCNeBF9zkTo5QjTlALq1BjYbCVKWjzAKNtQAyqIgJJnEopEjVHzGG69Nhlwpv/bHxi292vDDh9P6GebvAwM7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaZO5eSs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uThp022112
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QFiKBH82XpC
	Ko70Azor9TJGS5zXafi5oJj0FIl2hYP8=; b=EaZO5eSsgewJe3QZWVZy2DiUWPc
	oB0g6xPYDZ3vGoXSA/KzIVRd2i3sDBbuy6MgIKVPij3Z7Wa9tVSK/yC7OSJDYq3v
	WDbuFQOi3bU/8h2pJ/Qc/hC5B9/jefaB1pKXMgLnqsbcyJ7BCtoexk7gF5Mp9QZb
	MRI5vdP0Q9RnSZySciAUlmWj8dCsYXdZCUEfUNsR95DrDFNqb+GkzFqlH95jgjQ0
	30spIZ+DylsTylkutSoGxzRGvvINKL+Fe7rALcYbRle51pYo1REWAYoH8E6xCZQE
	IGulfrUqmQvHpxcEt9a3qweQdNsDzCxh4u6JistnfzkzFwV8hDVx1njAGqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52908ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47174bdce2so1535293a12.2
        for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 00:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847640; x=1756452440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFiKBH82XpCKo70Azor9TJGS5zXafi5oJj0FIl2hYP8=;
        b=pO6j1AmiznyAVZ62SLiUf1N5vRLfC9iMfkJy+xnz5W/s/DJva+CTwlbsm9b7dTO44l
         WZrMaMZ5MlJK6k2zMgiZA4zjRdPXJxbyll9Ck6A+kIL1Rk9Yb9LivdhE+Rmwa7Ld3X7S
         pkRW1Ub3tZJ/dpSv5Wiy27BJ8q/lhSPu7Zx62Q5sFCxj0FhiD+gQJp2iM8o+kU+2Hsj9
         1Nf5gYM8mYSXEUQVBbEY2qwroPCKveE75WS1n/nu8axB2VPFhfjJvRuVkzJfHmNLNCiI
         H591wIYJjh0A76SWkSFJRe4FSXL4upIh8U03KpCNCJBUzuewg6OK5SDacsso/0J+RY0X
         L2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVTCwkQj//6QCl4yG82UaeyB8Mx4oxnjzJ/ckdm1lRAgBlFIqmWc6QJpxtCaQGqZHza+C343DSjV8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqVWtlKGAq5hph4DzFQveZ0ZQJJT7gQQ++Y62mkRSGXIkrok/u
	C1Z9pcjqEusKaDnXVg2jYpj+sm9PIXno7v4ZpqOqoUqh4mEd6CARr6vBnaNuu3Pi7S6Yt3b85GA
	JcxmF3/epnFLmWuNyEir5EKxkzmScBD6jETJGAZ7jHxa63/JpIRFTKcYejE/UKjA=
X-Gm-Gg: ASbGnctbgC0yRt/0DbYfpVPcu8czxzEn2jn6icgl/lVER8cLOG7S6nXA5N+qoj0eVPj
	BfkaBOdMXR5zqbdjac7LOPjoCkhqqsA1RHE5ybkB1ySxNraGm28pnHjdnSg2K0QPmfo4ZmUVDbI
	n4DfGmf4LRso1oVV/sOrBePDe3ANz4X03wjKVcq/yUQFL8qtgc4tXbp5RJ9VFFvZLeueyojpBBj
	eWEHu2S3fHoxLXqFazMRyyBoQN+jnYdwdvXtKpJHTSFCxLgtKrykRdYls3OkQ1BXqyqKovNdjv3
	BzF6BHxyT2sbQ7PveXJAPIi2jEFI3YeDEYmieQAapMFr81B/CtVBLdsuQgHP0ODxIOJPsOcxqjV
	J
X-Received: by 2002:a05:6a21:6d98:b0:238:3f54:78e7 with SMTP id adf61e73a8af0-24340d7233emr3138832637.45.1755847639375;
        Fri, 22 Aug 2025 00:27:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELAOm6tV4LKLPuoyulx2ZCK8Zs8ar884kRzdrOR7bEx+99QmMsQudEQUE+TMzKq61Dah4nhQ==
X-Received: by 2002:a05:6a21:6d98:b0:238:3f54:78e7 with SMTP id adf61e73a8af0-24340d7233emr3138779637.45.1755847638723;
        Fri, 22 Aug 2025 00:27:18 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fe3047sm6416367a12.17.2025.08.22.00.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:27:18 -0700 (PDT)
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
Subject: [PATCH v6 3/6] soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
Date: Fri, 22 Aug 2025 12:56:48 +0530
Message-Id: <20250822072651.510027-4-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a81bd9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=XUbWVaD3ytd7QKR5zbQA:9 a=4X4QlWh5XKUCARAt:21 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 60QTV4HPYLWZZUnPb1xDzK87qXpKXJ6k
X-Proofpoint-ORIG-GUID: 60QTV4HPYLWZZUnPb1xDzK87qXpKXJ6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1eKVG3tzUYlR
 FHRY+udEYyDrMAveFTh7KD0H2t5YdT8RW/TWhL7Xdli2oiXm8OOMBFTiDFz0Hjy69PEG+1wC8mh
 RemSD878LNdchyWL+6VqWqk3MYNrGkyS/la1j58OjA2ZkIBmuBIxNj+TJaY16elwhRoodPBmGY4
 2NgrXkdMHwMsq8UjPREC8wrrwzvOCrjOj5A3b8ap9H5iCXXwyIDsX3Y88AOvmATk32gh+QqX6FS
 vTI7aU5rT3HfMl1MdA50YSDt8Ird+KQTXbWuWaSag/KmMgJn17e8sfDv7ovsjIIlqx4lzwDc2Qr
 NEGt/XZebV+bvpXzE3IEtuBzO6jGO89A//gs7M9lKmEcAr17Xox4mJZsq+M8tBNfI92/ZPOQZmH
 tfwXEHMKpHZFqDfZZ/53VEse5BWhng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

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
 drivers/soc/qcom/qcom-geni-se.c  | 461 ++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/geni-se.h |   4 +
 2 files changed, 462 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index e8ab2833815e..d40b6d0395d0 100644
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
@@ -891,6 +988,364 @@ int geni_icc_disable(struct geni_se *se)
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
+			dev_err(dev, "Firmware size (%zu) is smaller than expected offset + size (%u + %u)\n",
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
+
+		if (le32_to_cpu(sefw->magic) != SE_MAGIC_NUM || le32_to_cpu(sefw->version) != 1)
+			continue;
+
+		if (le32_to_cpu(sefw->serial_protocol) != protocol)
+			continue;
+
+		if (sefw->fw_size_in_items % 2 != 0)
+			sefw->fw_size_in_items++;
+
+		if (sefw->fw_size_in_items >= MAX_GENI_CFG_RAMn_CNT) {
+			dev_err(dev, "Corrupt firmware: fw_size_in_items (%u) exceeds max allowed RAMn count (%u)\n",
+				sefw->fw_size_in_items, MAX_GENI_CFG_RAMn_CNT);
+			continue;
+		}
+
+		if (sefw->fw_offset + sefw->fw_size_in_items * sizeof(u32) > phdr->p_filesz ||
+		    sefw->cfg_idx_offset + sefw->cfg_size_in_items * sizeof(u8) > phdr->p_filesz ||
+		    sefw->cfg_val_offset + sefw->cfg_size_in_items * sizeof(u32) > phdr->p_filesz) {
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
+	writel(hdr->cfg_version, se->base + SE_GENI_INIT_CFG_REVISION);
+	writel(hdr->cfg_version, se->base + SE_GENI_S_INIT_CFG_REVISION);
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


