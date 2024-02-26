Return-Path: <linux-i2c+bounces-1994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF9867D0C
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84931F25EBB
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDFA133280;
	Mon, 26 Feb 2024 16:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZE2R0uCj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D817D13247F;
	Mon, 26 Feb 2024 16:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966433; cv=none; b=glL41t9WLrdlT1HpwuVxSZjujRq6GK6BGiJ5zAsOPzqc/GZIcQJYhEyS1/ngPUC8mi0MUy+Lw4oU7PWgiSx/62ICkaJQjXdb/hPi0M8QahRaPhVyFPeDcEjO5ZLPUGiN5mLHpn5/LkbTkgdq6Lb6JlwS/oforQ5brSJfMJUv/Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966433; c=relaxed/simple;
	bh=N4MM9bu5cZzne7RyOcOdfSZDBM36xNIIHvybGlB7Shs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P1Lyb4IQeLOysZmrnw+h1eHlcU8f9zHN5oiyAgwlnaulNrZBp1e1sTBg3lgxHH+yMQR8blxlKy42woENQcugqQB7HKT1z3yuXFSk5RAR0th5kC6MatrhZL4ag0uPMN3LNhv04u3ciJDoiMEttcfWzf4dV1aBZbt0Hh1Kcbhkl+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZE2R0uCj; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG12QL018641;
	Mon, 26 Feb 2024 16:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bofokn5J04e0ZdqBwK6c6SN9GTgFjHTcEiDFXEpuQNw=;
 b=ZE2R0uCjBWYbSJgXuxm4J0cQgi8W6Gw/sJiQKTkq/wKhykDBoaR22TGuFA176AwhmLPQ
 h/XtrxauD7qOTMWEUHXKK1wKbVDGQUM/QV/oQvvTe951PVHkIMK04McU0/xU2h1xowzi
 a1rfEebzxh5Va65hreWyMUTo5IvarutdSiCTyqkrnzOW4rwGhlBWJvt74Kqc/buMA5CE
 cZsGIIOtwKevXlg86va83XRc+v9Nxz/DgSTWFhID1kIhdbZlk5X8LSwPUHxTfMoAXW+u
 qo9eU10jO2jGb74loQ4E5LbFoVPG3QNjRI/c4GvLSCZUT5YqQIV8enEqt+47mw5NZsAG SQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgw0k3572-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:40 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFTLMl024122;
	Mon, 26 Feb 2024 16:53:39 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0k23fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:39 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrab410486322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:38 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 796A358043;
	Mon, 26 Feb 2024 16:53:36 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0A6A58053;
	Mon, 26 Feb 2024 16:53:35 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 17/31] fsi: aspeed: Don't clear all IRQs during OPB transfers
Date: Mon, 26 Feb 2024 10:53:07 -0600
Message-Id: <20240226165321.91976-18-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: fSFqiIdq4BF-TxVEQGCiL5QSwmKDinTZ
X-Proofpoint-ORIG-GUID: fSFqiIdq4BF-TxVEQGCiL5QSwmKDinTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

In order to support FSI interrupts, the OPB transfer functions should
not clear all the IRQs pending. Instead, just write the OPB ACK bit
to the IRQ status register. As commented, this register invisibly
masks the interrupt once the interrupt condition is cleared. Fix this
by writing 0 before each OPB transfer.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 1a91f3acdfcc..64a5407a15ec 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -46,6 +46,11 @@ static const u32 fsi_base = 0xa0000000;
 #define OPB_CLK_SYNC	0x3c
 #define OPB_IRQ_CLEAR	0x40
 #define OPB_IRQ_MASK	0x44
+/*
+ * This register does NOT behave in the expected manner. It is expected that writing 1b would clear
+ * the corresponding interrupt condition. However it also invisibly masks the interrupt! Writing 0b
+ * unmasks again.
+ */
 #define OPB_IRQ_STATUS	0x48
 
 #define OPB0_SELECT	0x10
@@ -64,8 +69,8 @@ static const u32 fsi_base = 0xa0000000;
 #define OPB1_READ_ORDER2	0x60
 
 #define OPB_RETRY_COUNTER	0x64
-#define OPB_RETRY_COUNTER_AST2600	0x00000010
-#define OPB_RETRY_COUNTER_AST2700	0x000c0010
+#define OPB_RETRY_COUNTER_AST2600	0x00010010
+#define OPB_RETRY_COUNTER_AST2700	0x000d0010
 
 /* OPBn_STATUS */
 #define STATUS_HALFWORD_ACK	BIT(0)
@@ -107,13 +112,14 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
 	writel_relaxed(transfer_size, base + OPB0_XFER_SIZE);
 	writel_relaxed(addr, base + OPB0_FSI_ADDR);
 	writel_relaxed(val, base + OPB0_FSI_DATA_W);
-	writel_relaxed(0x1, base + OPB_IRQ_CLEAR);
+	writel_relaxed(0, base + OPB_IRQ_STATUS);
 	writel(0x1, base + OPB_TRIGGER);
 
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
 				(reg & OPB0_XFER_ACK_EN) != 0,
 				0, OPB_POLL_TIMEOUT);
 
+	writel(OPB0_XFER_ACK_EN, base + OPB_IRQ_STATUS);
 	status = readl(base + OPB0_STATUS);
 
 	/* Return error when poll timed out */
@@ -159,13 +165,14 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	writel_relaxed(CMD_READ, base + OPB0_RW);
 	writel_relaxed(transfer_size, base + OPB0_XFER_SIZE);
 	writel_relaxed(addr, base + OPB0_FSI_ADDR);
-	writel_relaxed(0x1, base + OPB_IRQ_CLEAR);
+	writel_relaxed(0, aspeed->base + OPB_IRQ_STATUS);
 	writel(0x1, base + OPB_TRIGGER);
 
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
 			   (reg & OPB0_XFER_ACK_EN) != 0,
 			   0, OPB_POLL_TIMEOUT);
 
+	writel(OPB0_XFER_ACK_EN, base + OPB_IRQ_STATUS);
 	status = readl(base + OPB0_STATUS);
 
 	result = readl(base + OPB0_FSI_DATA_R);
@@ -489,8 +496,6 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	}
 
 	writel(0x1, aspeed->base + OPB_CLK_SYNC);
-	writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
-			aspeed->base + OPB_IRQ_MASK);
 
 	writel(opb_retry_counter, aspeed->base + OPB_RETRY_COUNTER);
 
-- 
2.39.3


