Return-Path: <linux-i2c+bounces-1770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DD7856FD4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 364A01C21009
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51E3145340;
	Thu, 15 Feb 2024 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QGLYCAQm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB1B1420D1;
	Thu, 15 Feb 2024 22:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034903; cv=none; b=g3bikaZQVssrvTofMbfzzQAI+a+wMrG85hVPi+HZ9JuOb8ZbMYQ9ztBu19DuXZ4Nkj5z3dXoiBezBuhjpDmcWacgfOv8/dzPAOcH6B7SlqoQcFMpEx75XOf5l8CwgEfkcHCYlJia2vA64mRTPiv8b2ka3MAMki5W8l9isieh/ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034903; c=relaxed/simple;
	bh=riOdEpyj6YoR7dLCa84jfGwhhYRmIX3Tq7kzf7ULdVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IgOWzwiPMl4jch0du0gIm+hl62eDPHQAJILiyvJwWfrVhhQb87BcGuKV4BFCRz3i/3F8aTUQtPWDD4FAkLkubYkSprq4tNbL/fHBoDxuhtBzmgnS/tMVVL2PZJwmKwrFyAZpVoz8539geoLEZCbUBhR+ztNuTZElzJzSomn4eyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QGLYCAQm; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM27QG029947;
	Thu, 15 Feb 2024 22:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EzykbgY8VklP3b8xENMmzzAd8qt59mCClFOsxoemn6M=;
 b=QGLYCAQmpDLoAJrB7S0WWQpFejEON6WyLZelVZ879SymIIXdae1KHvZAlAKWOPr4+szW
 vYePJO9dNBXf6XmkzDh7SdGfuERMg4xXPzvTTfeFkaHTYdBrpWHXbTCHiXwf9KlNvfjG
 etwwc2gt3rB5LW85oY9evMxU2hk0qpKfEc+McfKlvdbWC05YAOgKGjd90lPAsl/5OqYC
 46KsI3JhTda7OizEalS1N+UZ69HfGUEV3Er6I6vt5wSITdcc9jiyjZEwGG25KBOEK26c
 3OmPdNeiBVi0by+qGAMtfos6TPouWqrRyYDljNI8UgWKP0g91mv9e3n4Mtn0bWbymgET jw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9s0tjy2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:07 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLefR7032614;
	Thu, 15 Feb 2024 22:08:06 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kftyud7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:06 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM83IT19727000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:05 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1625258060;
	Thu, 15 Feb 2024 22:08:03 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF8AD5803F;
	Thu, 15 Feb 2024 22:08:02 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:02 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 03/33] fsi: Move slave definitions to fsi-slave.h
Date: Thu, 15 Feb 2024 16:07:29 -0600
Message-Id: <20240215220759.976998-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240215220759.976998-1-eajames@linux.ibm.com>
References: <20240215220759.976998-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YUZ5q9RnUGEB2EzKJCuk8rfcczQT5q2P
X-Proofpoint-ORIG-GUID: YUZ5q9RnUGEB2EzKJCuk8rfcczQT5q2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150171

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


