Return-Path: <linux-i2c+bounces-1774-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F461856FE3
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD80728210E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4FE145FF8;
	Thu, 15 Feb 2024 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bYjpVES5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB167145342;
	Thu, 15 Feb 2024 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034905; cv=none; b=XVJXZch0K1SZKU0pmMk3EUiBnjfiwZukVwjj0rkjL7CjOzV7dzlM9CP4YQXqyecwsJrFqEZjmO1+OkSd2e/7h5HCxonMzdReIWJQPXV6QAGfqeqo38r2Gu/EO6kmv3l7MAVu0BlNhkEYsD1VMGy+Akj7jX0uUClgPWhHcioFzkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034905; c=relaxed/simple;
	bh=NGXJUu33Lr1l9NXaZa1510h0VGdsd6eNUEVT355jTIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o76b/ELuviBHUcVxO0V9jPWCdzCSVBIxms2pFuVjqwaYTHcm0OuCd2u9Y+7Kn2Q3brififT0tFuRy5kIDVANuPiiElpyDkOaNOB36QxX70E3xoi6xboZmBcEDrqUymmp9Ti4PrdQIyjAfBjiZ3HlC86Wr70ArRPhsTqIpGEczYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bYjpVES5; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FKV1KB020929;
	Thu, 15 Feb 2024 22:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gaRn11yQSzCtGgfOHG0WfDL4IGGOB1/y2J4JPHKXeY0=;
 b=bYjpVES54VvNdAivXZqMmH46h/Rkn4j8PMJ8vJa0DthRR2UfYUq6PBOgYzQUtMrsYf0G
 Ovq52PoYU/ADRBHt8S9AnpOfQdZ3K4jFhgWBN6g7ETzj02Ax0S9X97PolKmGdkqt+XeP
 El96X0bCLWFZomDCmaK0QoinHQd7FCNKR/ETMih7/9xPpM3F3Fy2LcAnY9r5SW5I8oYv
 YfXCLGEIEonCigaHla05nuGN9LZx0cZ40erCQlgGyy3vbl2dZjOOLiJmtfNVa4mV2ENl
 pNr5Xse7TS4klDKgV83bSPkOgoN/TpCVkCarovF0fjz5ezEF8ZRfyQgTufTFaum57bNC nQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9q0v5yck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:10 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLbR6U032605;
	Thu, 15 Feb 2024 22:08:09 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kftyudu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:09 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM87F349414650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:09 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D31F58080;
	Thu, 15 Feb 2024 22:08:05 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 315E758082;
	Thu, 15 Feb 2024 22:08:05 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:05 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 10/33] fsi: aspeed: Add AST2700 support
Date: Thu, 15 Feb 2024 16:07:36 -0600
Message-Id: <20240215220759.976998-11-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: lUQIpHZRxAjufZhvUTa8aRO5RhMkXiqI
X-Proofpoint-GUID: lUQIpHZRxAjufZhvUTa8aRO5RhMkXiqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

AST2700 requires a few bits set differently in the OPB retry
counter register, so add some match data and set the register
accordingly.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f0a19cd451a0..d6e923b8f501 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -18,6 +18,10 @@
 
 #include "fsi-master.h"
 
+struct fsi_master_aspeed_data {
+	u32 opb_retry_counter;
+};
+
 struct fsi_master_aspeed {
 	struct fsi_master	master;
 	struct mutex		lock;	/* protect HW access */
@@ -60,6 +64,8 @@ static const u32 fsi_base = 0xa0000000;
 #define OPB1_READ_ORDER2	0x60
 
 #define OPB_RETRY_COUNTER	0x64
+#define OPB_RETRY_COUNTER_AST2600	0x00000010
+#define OPB_RETRY_COUNTER_AST2700	0x000c0010
 
 /* OPBn_STATUS */
 #define STATUS_HALFWORD_ACK	BIT(0)
@@ -536,6 +542,8 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
 
 static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
+	const struct fsi_master_aspeed_data *md = of_device_get_match_data(&pdev->dev);
+	u32 opb_retry_counter = md ? md->opb_retry_counter : OPB_RETRY_COUNTER_AST2600;
 	struct fsi_master_aspeed *aspeed;
 	int rc, links, reg;
 	__be32 raw;
@@ -579,8 +587,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
 			aspeed->base + OPB_IRQ_MASK);
 
-	/* TODO: determine an appropriate value */
-	writel(0x10, aspeed->base + OPB_RETRY_COUNTER);
+	writel(opb_retry_counter, aspeed->base + OPB_RETRY_COUNTER);
 
 	writel(ctrl_base, aspeed->base + OPB_CTRL_BASE);
 	writel(fsi_base, aspeed->base + OPB_FSI_BASE);
@@ -656,8 +663,23 @@ static int fsi_master_aspeed_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct fsi_master_aspeed_data fsi_master_ast2600_data = {
+	.opb_retry_counter = OPB_RETRY_COUNTER_AST2600,
+};
+
+static const struct fsi_master_aspeed_data fsi_master_ast2700_data = {
+	.opb_retry_counter = OPB_RETRY_COUNTER_AST2700,
+};
+
 static const struct of_device_id fsi_master_aspeed_match[] = {
-	{ .compatible = "aspeed,ast2600-fsi-master" },
+	{
+		.compatible = "aspeed,ast2600-fsi-master",
+		.data = &fsi_master_ast2600_data,
+	},
+	{
+		.compatible = "aspeed,ast2700-fsi-master",
+		.data = &fsi_master_ast2700_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, fsi_master_aspeed_match);
-- 
2.39.3


