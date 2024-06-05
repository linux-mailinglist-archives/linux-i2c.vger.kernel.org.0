Return-Path: <linux-i2c+bounces-3844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E278FD872
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 656831F2190A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20291607A4;
	Wed,  5 Jun 2024 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="f+sxBKF1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066715FA73;
	Wed,  5 Jun 2024 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622618; cv=none; b=eWjwCwyUT+LUHLfWxbMgFFOsbddUZYMGHSk8CceqWrAQXQGP8+yJOdxpGWy5am7aOxPWjqXdL2uDpD4kZfZmmQICfNagrMc+NrXhUjjuMPEVjaA6upQyTUR2ZQSjUqFAl09m3Wgkeo79Brc6iI4j4HxQN0lD3e0ErnyDpBGJorM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622618; c=relaxed/simple;
	bh=etJOxAM38wpvm42idu/GhLs1AJz+49tbiRt1itlzSAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KWZwKpgwZyz5NQetm4F01Te75VRipSLb/zWnbnbxJr7vOkBpgZs48PG5+2z7bSCzIuW/38jZD3abnMwG0gJK0diNFDzCEPh7s29HAK9AHZu0aRavgXIxhtXa5FwiQ/Uz0TbiEAylOzMFyCXhgJO389d5yrmIGd0sZDYkAK+3BXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=f+sxBKF1; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LD0vZ012786;
	Wed, 5 Jun 2024 21:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=XynCFTEpJ9c9tpkSKwQRnpEBPBH5oxaR1GiqTnQE1Qk=;
 b=f+sxBKF14ZiykpJdr8KVMARIJa96s4ptA+0ASQOvFHQooAy0aZ6P+ISa8Fj1XIyVd1dE
 QHvKS2lbkvn2ZOOvqC71MRw715xwbtRGyifoMZoYVRgoNbEdWaTei7jxfSUj6BEDVhYq
 UFEshQS8MI2m3C2h1Z13oH7kyOO9F8BG/KZD55jkrgIVb4fDLrUPVHj3MAP8hC4zKNda
 57GTfIrlKbMhee/VyQ3NUJNuPUOTjyrQ8tdrd2UyZsJT12Drl2xWr4eo/mPB6qPWQOiR
 xqmy5CXTe08owp3Z8ATkt13K6kHpih+CvSe27H1/dubxzaEplUN0g8j61vDi5+8Hqx8R wA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyqf00re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:20 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455JUEw5031114;
	Wed, 5 Jun 2024 21:23:19 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppnt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:19 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNGaQ19923530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:18 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B7B358069;
	Wed,  5 Jun 2024 21:23:16 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2BCE58066;
	Wed,  5 Jun 2024 21:23:15 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 09/40] fsi: aspeed: Add AST2700 support
Date: Wed,  5 Jun 2024 16:22:41 -0500
Message-Id: <20240605212312.349188-10-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CMwTXUnHhq8T8B3lnqOzXQTyIJaOrBdC
X-Proofpoint-ORIG-GUID: CMwTXUnHhq8T8B3lnqOzXQTyIJaOrBdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050160

AST2700 requires a few bits set differently in the OPB retry
counter register, so add some match data and set the register
accordingly.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f0a19cd451a07..3d15e867237df 100644
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
@@ -81,6 +85,13 @@ static const u32 fsi_base = 0xa0000000;
 #define XFER_HALFWORD	(BIT(0))
 #define XFER_BYTE	(0)
 
+/* OPB_RETRY_COUNTER */
+#define OPB_RC_FSI_OPB		BIT(19)	/* Access FSI space over OPB, not AHB (AST27xx+) */
+#define OPB_RC_CTRL_OPB		BIT(18)	/* Access controller over OPB, not AHB (AST27xx+) */
+#define OPB_RC_XFER_ACK_EN	BIT(16)	/* Enable OPBx xfer ack bit without mask */
+#define OPB_RC_COUNT		GENMASK(15, 0)	/* Number of retries */
+#define OPB_RC_DEFAULT		0x10
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/fsi_master_aspeed.h>
 
@@ -536,6 +547,8 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
 
 static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
+	const struct fsi_master_aspeed_data *md = of_device_get_match_data(&pdev->dev);
+	u32 opb_retry_counter = md ? md->opb_retry_counter : OPB_RC_DEFAULT;
 	struct fsi_master_aspeed *aspeed;
 	int rc, links, reg;
 	__be32 raw;
@@ -579,8 +592,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
 			aspeed->base + OPB_IRQ_MASK);
 
-	/* TODO: determine an appropriate value */
-	writel(0x10, aspeed->base + OPB_RETRY_COUNTER);
+	writel(opb_retry_counter, aspeed->base + OPB_RETRY_COUNTER);
 
 	writel(ctrl_base, aspeed->base + OPB_CTRL_BASE);
 	writel(fsi_base, aspeed->base + OPB_FSI_BASE);
@@ -656,8 +668,23 @@ static int fsi_master_aspeed_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct fsi_master_aspeed_data fsi_master_ast2600_data = {
+	.opb_retry_counter = OPB_RC_DEFAULT,
+};
+
+static const struct fsi_master_aspeed_data fsi_master_ast2700_data = {
+	.opb_retry_counter = OPB_RC_FSI_OPB | OPB_RC_CTRL_OPB | OPB_RC_DEFAULT,
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


