Return-Path: <linux-i2c+bounces-1776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72687856FEA
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1683C2864A5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3711474A4;
	Thu, 15 Feb 2024 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Bvc9Jgzj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80902145FE3;
	Thu, 15 Feb 2024 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034907; cv=none; b=qdSoRRQtt6p8votZylQJHf9ItnoIRlZMopAfdXwnHY7xfRcQ338wVCTk4LSfUeh0sJTpJIIwMSqjKjhCE9zwOH9h3XHeT6vFHKtaJZEyf3DVUV7jFtpeEpDqArTIdezig9GpttuDqXzddj+RuuQBpBJ9q2WkHGgyLtWdieAoxXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034907; c=relaxed/simple;
	bh=N4MM9bu5cZzne7RyOcOdfSZDBM36xNIIHvybGlB7Shs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mmxefp3nj63wyJeIfTGsihMGcC2PmWkRj7Zw4vPUsAfcA55FF3n9Nnemep+Tk5Je9ZWy57Uhe003lt4+e5I/bvs7eUdhitP2ZCjjiuhzmxoCEYxtUkF0z8LRP6Sc8ryGLx69HOAcyvh3lFkpEX8+ce5qHGsq0Mg4IprkYN8p7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Bvc9Jgzj; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLVJKw012203;
	Thu, 15 Feb 2024 22:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bofokn5J04e0ZdqBwK6c6SN9GTgFjHTcEiDFXEpuQNw=;
 b=Bvc9JgzjfrEbiHjVe0L5qNBvZjzmotm8RgQ+0300xIrGSdybxscnoXV9GXPa+EGpw+xs
 kGmqWOGtVdVAjI+rIINO6dMQ/mfGzp+gMewUUPWs/VndEwO3fQUQBE/IqfKdQhx6tmyd
 wXEGRq8pH9kI4xgM63By4bmhnaNKxTR//PTMFXUTwwi7AIjIJIC22Gknu9RSTkBC7j5p
 P12whwU0b6BzsqhL6SX38eseLHv3sSvxctO/vpxoSRGQ+Da5GT8WAyduPcGA6MXmARuK
 Q1hbm81paJJqCu4MtNlvP2ZvleYKvZ9sGzpCrXpZKl0s4Y2BniNiLLjiB8Bn/0YXlCUk gw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9q0v5ydc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:11 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLN4qd009920;
	Thu, 15 Feb 2024 22:08:10 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6p6374qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:10 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM88NU51905198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:10 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 546B85803F;
	Thu, 15 Feb 2024 22:08:08 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1432D58079;
	Thu, 15 Feb 2024 22:08:08 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:08 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 18/33] fsi: aspeed: Don't clear all IRQs during OPB transfers
Date: Thu, 15 Feb 2024 16:07:44 -0600
Message-Id: <20240215220759.976998-19-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 5UIetqF6FNCMnR2m7GAX3Uay-smOZhuE
X-Proofpoint-GUID: 5UIetqF6FNCMnR2m7GAX3Uay-smOZhuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

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


