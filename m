Return-Path: <linux-i2c+bounces-3514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B96C8C7BEB
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0590B22BE6
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2344157E74;
	Thu, 16 May 2024 18:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NP3iUm1b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B00156F5F;
	Thu, 16 May 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883573; cv=none; b=ChIfhuulAzyyD4oRnAemLomYj+l97qf6O8XLX47nGx/Eax1YboO443EaOkP/x6zL0nN6SYkKx/zzJBKP+FtmAl2J1wf0glwDudU/ca0ypZvG1DKpO1FKlgWBC9Zhd035ePsbsxy9hTtgMOTSt7nGrgwXjHROEWIaZwUsr2d9dPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883573; c=relaxed/simple;
	bh=3CmP8SDqXBiFId98haK+7Undt4Hf31Bd450GNQU9UOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rVexyJIA94N//t6+tOi+j6BVAd9y/jtxB7oAf+c/fDNVXXDb2csUW9YELrTf3kDCADONqg3Ors7T4pWmDa6yncjod8zr4XrdMlMWMuB0X0agGS1FyXipmOjMnGBuhna3XvAF7qDlb9dGz/K8AWySbiRcxvKvHSyfZ4iPyvTmRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NP3iUm1b; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGGCpY016278;
	Thu, 16 May 2024 18:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dqdJlR5MaTztZMJgWYsXAeJqjv1L5VBfiwva68G3Zto=;
 b=NP3iUm1blKdCpvnXHDrLH11TD6Ymg20NEoUjZuNbW3hyE0mouwzB64CpqUAXEECPBz3g
 uDzwZO5QqkK4GW76Zwy1GX2EOe2TEyIv01WuOYqBMwMc2+5Ww6gvjrCnKDuQ9Ou1Qa6C
 S5p3atVGprmLOneb2yWgjPo7Q241kV3ZVg3o5RkFPRHnuqrxl/0ED6Q0poToFcSrzUa9
 Gx/AfW7NXvMHojm086iIWw3EEf6zTxa8XzALr+2K6TbdqJnUN5f7wg12AtsHbLfgyj4q
 PwkubH3W/RQhitbtYZJake0EnRejmtICnNePfD122TRihK+3hnZUhefBEDp6klnjE8eP Ag== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5g6jh6u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:16 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GIAFtV002257;
	Thu, 16 May 2024 18:19:15 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0pkfuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:15 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJD7D19202620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:15 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0082D58056;
	Thu, 16 May 2024 18:19:13 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B649058052;
	Thu, 16 May 2024 18:19:12 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:12 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 18/40] fsi: aspeed: Don't clear all IRQs during OPB transfers
Date: Thu, 16 May 2024 13:18:45 -0500
Message-Id: <20240516181907.3468796-19-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u2pDWQQhoxsFKEfFhDC_C6Oq6MKpP5WB
X-Proofpoint-GUID: u2pDWQQhoxsFKEfFhDC_C6Oq6MKpP5WB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

In order to support FSI interrupts, the OPB transfer functions should
not clear all the IRQs pending. Instead, just write the OPB ACK bit
to the IRQ status register. As commented, this register invisibly
masks the interrupt once the interrupt condition is cleared. Fix this
by writing 0 before each OPB transfer.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 04aa5cb9b6fad..f840c7c4a56b9 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -47,6 +47,11 @@ static const u32 fsi_base = 0xa0000000;
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
@@ -113,13 +118,14 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
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
@@ -165,13 +171,14 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
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
@@ -530,8 +537,6 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	}
 
 	writel(0x1, aspeed->base + OPB_CLK_SYNC);
-	writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
-			aspeed->base + OPB_IRQ_MASK);
 
 	writel(opb_retry_counter, aspeed->base + OPB_RETRY_COUNTER);
 
-- 
2.39.3


