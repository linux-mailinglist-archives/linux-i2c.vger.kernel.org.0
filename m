Return-Path: <linux-i2c+bounces-1979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D82EF867CCD
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D845290842
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B364712E1F3;
	Mon, 26 Feb 2024 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="JHEsN4xr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BF812CD9B;
	Mon, 26 Feb 2024 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966423; cv=none; b=EwQZn4qcKM/ZVdchjZq8qlpSSrHKm0+cPTx4zqeDBkzT6RWkRlAFAeFcGc4bZK0P/bKh0bok7x9xQ+aQKfOTKooVV63J50txt3zj+qwro1z5zm8atsZXMFSYsGa0ziDuk6vX4WdsCnXybhAzfH4AX309Yq21+ZCWCl5zKc/gb7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966423; c=relaxed/simple;
	bh=riOdEpyj6YoR7dLCa84jfGwhhYRmIX3Tq7kzf7ULdVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AE7iUwNHt3R6HtkaQV9wso2ZCJxLCE1W2VQXx8r4/2on+3fMm8wvF2ES+QGKzCuiMNJXsoM3YbIplalHktQzgRs6Gkxj+Lrvn5xiyGVVj1rHkcOAU9tfw1KuaecDermVuGtYJYc9SIoTitY1Co80JPV/uwKuZNzp3d3hYsWmdCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=JHEsN4xr; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QF2jao021749;
	Mon, 26 Feb 2024 16:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EzykbgY8VklP3b8xENMmzzAd8qt59mCClFOsxoemn6M=;
 b=JHEsN4xra+lXfagUh1b5WyPlME0LtGEQ5XNaWiMOStmiK5g/FLYAjmBZ3GaS9fTdP6lN
 OiQ6842StqMzcO8OvogVnUGfrB4cwW7nB6RtfExbbdQkcLarPNfJDIqZ6AZXqy2TeiL7
 WS2ucQE3a1mEHpkk20AS/Y15j43XMakxSBo7NOzemdKyDvshdaXLzqmUbrc4+QXS79Y6
 j1yI6HL023M2OBu2g5dhqr7DdhGlLQwuLgMCq5GxFZOMbSuhd42ET8bAsiJdtv29uIDN
 z6om8a8BzB7kqVmmHTOD6/8OMKqXLhRyiffwUaecglDaip47/tl8nep2gSgJeOiUpk3s /w== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgvp6bjtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:27 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGTLCv021808;
	Mon, 26 Feb 2024 16:53:26 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfu5ytkqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:26 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrNWt15401550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:25 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 811735805F;
	Mon, 26 Feb 2024 16:53:23 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C64E458043;
	Mon, 26 Feb 2024 16:53:22 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:22 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 01/31] fsi: Move slave definitions to fsi-slave.h
Date: Mon, 26 Feb 2024 10:52:51 -0600
Message-Id: <20240226165321.91976-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240226165321.91976-1-eajames@linux.ibm.com>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kDm3yAE57BGX1UjRduOtHtmyUbHpZp_i
X-Proofpoint-GUID: kDm3yAE57BGX1UjRduOtHtmyUbHpZp_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402260128

Master drivers may need access to the slave definitions.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c  | 35 -----------------
 drivers/fsi/fsi-slave.h | 84 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 35 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 097d5a780264..7bf0c96fc017 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -45,41 +45,6 @@
 
 static const int engine_page_size = 0x400;
 
-#define FSI_SLAVE_BASE			0x800
-
-/*
- * FSI slave engine control register offsets
- */
-#define FSI_SMODE		0x0	/* R/W: Mode register */
-#define FSI_SISC		0x8	/* R/W: Interrupt condition */
-#define FSI_SSTAT		0x14	/* R  : Slave status */
-#define FSI_SLBUS		0x30	/* W  : LBUS Ownership */
-#define FSI_LLMODE		0x100	/* R/W: Link layer mode register */
-
-/*
- * SMODE fields
- */
-#define FSI_SMODE_WSC		0x80000000	/* Warm start done */
-#define FSI_SMODE_ECRC		0x20000000	/* Hw CRC check */
-#define FSI_SMODE_SID_SHIFT	24		/* ID shift */
-#define FSI_SMODE_SID_MASK	3		/* ID Mask */
-#define FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
-#define FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
-#define FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
-#define FSI_SMODE_SD_MASK	0xf		/* Send delay mask */
-#define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
-#define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
-
-/*
- * SLBUS fields
- */
-#define FSI_SLBUS_FORCE		0x80000000	/* Force LBUS ownership */
-
-/*
- * LLMODE fields
- */
-#define FSI_LLMODE_ASYNC	0x1
-
 #define FSI_SLAVE_SIZE_23b		0x800000
 
 static DEFINE_IDA(master_ida);
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index 1d63a585829d..dba65bd4e083 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -7,6 +7,90 @@
 #include <linux/cdev.h>
 #include <linux/device.h>
 
+#define FSI_SLAVE_BASE			0x800
+
+/*
+ * FSI slave engine control register offsets
+ */
+#define FSI_SMODE		0x0	/* R/W: Mode register */
+#define FSI_SISC		0x8	/* R  : Interrupt condition */
+#define FSI_SCISC		0x8	/* C  : Clear interrupt condition */
+#define FSI_SISM		0xc	/* R/W: Interrupt mask */
+#define FSI_SISS		0x10	/* R  : Interrupt status */
+#define FSI_SSISM		0x10	/* S  : Set interrupt mask */
+#define FSI_SCISM		0x14	/* C  : Clear interrupt mask */
+#define FSI_SSTAT		0x14	/* R  : Slave status */
+#define FSI_SI1S		0x1c	/* R  : Slave interrupt 1 status */
+#define FSI_SSI1M		0x1c	/* S  : Set slave interrupt 1 mask */
+#define FSI_SCI1M		0x20	/* C  : Clear slave interrupt 1 mask */
+#define FSI_SLBUS		0x30	/* W  : LBUS Ownership */
+#define FSI_SRSIC0		0x68	/* C  : Clear remote interrupt condition */
+#define FSI_SRSIC4		0x6c	/* C  : Clear remote interrupt condition */
+#define FSI_SRSIM0		0x70	/* R/W: Remote interrupt mask */
+#define FSI_SRSIM4		0x74	/* R/W: Remote interrupt mask */
+#define FSI_SRSIS0		0x78	/* R  : Remote interrupt status */
+#define FSI_SRSIS4		0x7c	/* R  : Remote interrupt status */
+#define FSI_LLMODE		0x100	/* R/W: Link layer mode register */
+
+/*
+ * SMODE fields
+ */
+#define FSI_SMODE_WSC		0x80000000	/* Warm start done */
+#define FSI_SMODE_ECRC		0x20000000	/* Hw CRC check */
+#define FSI_SMODE_SID_SHIFT	24		/* ID shift */
+#define FSI_SMODE_SID_MASK	3		/* ID Mask */
+#define FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
+#define FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
+#define FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
+#define FSI_SMODE_SD_MASK	0xf		/* Send delay mask */
+#define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
+#define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
+
+/*
+ * SISS fields
+ */
+#define FSI_SISS_CRC_ERROR		BIT(31)
+#define FSI_SISS_PROTO_ERROR		BIT(30)
+#define FSI_SISS_LBUS_PARITY_ERROR	BIT(29)
+#define FSI_SISS_LBUS_PROTO_ERROR	BIT(28)
+#define FSI_SISS_ACCESS_ERROR		BIT(27)
+#define FSI_SISS_LBUS_OWNERSHIP_ERROR	BIT(26)
+#define FSI_SISS_LBUS_OWNERSHIP_CHANGE	BIT(25)
+#define FSI_SISS_ASYNC_MODE_ERROR	BIT(14)
+#define FSI_SISS_OPB_ACCESS_ERROR	BIT(13)
+#define FSI_SISS_OPB_FENCED		BIT(12)
+#define FSI_SISS_OPB_PARITY_ERROR	BIT(11)
+#define FSI_SISS_OPB_PROTO_ERROR	BIT(10)
+#define FSI_SISS_OPB_TIMEOUT		BIT(9)
+#define FSI_SISS_OPB_ERROR_ACK		BIT(8)
+#define FSI_SISS_MFSI_MASTER_ERROR	BIT(3)
+#define FSI_SISS_MFSI_PORT_ERROR	BIT(2)
+#define FSI_SISS_MFSI_HP		BIT(1)
+#define FSI_SISS_MFSI_CR_PARITY_ERROR	BIT(0)
+#define FSI_SISS_ALL			0xfe007f00
+
+/*
+ * SI1S fields
+ */
+#define FSI_SI1S_SLAVE_BIT	31
+#define FSI_SI1S_SHIFT_BIT	30
+#define FSI_SI1S_SCOM_BIT	29
+#define FSI_SI1S_SCRATCH_BIT	28
+#define FSI_SI1S_I2C_BIT	27
+#define FSI_SI1S_SPI_BIT	26
+#define FSI_SI1S_SBEFIFO_BIT	25
+#define FSI_SI1S_MBOX_BIT	24
+
+/*
+ * SLBUS fields
+ */
+#define FSI_SLBUS_FORCE		0x80000000	/* Force LBUS ownership */
+
+/*
+ * LLMODE fields
+ */
+#define FSI_LLMODE_ASYNC	0x1
+
 struct fsi_master;
 
 struct fsi_slave {
-- 
2.39.3


