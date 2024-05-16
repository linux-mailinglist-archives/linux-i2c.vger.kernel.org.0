Return-Path: <linux-i2c+bounces-3507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7198C7BCD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E2282837B0
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDDC156F36;
	Thu, 16 May 2024 18:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UbNlb/0C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9B1156C79;
	Thu, 16 May 2024 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883570; cv=none; b=Mv62FWANAuMebp8D2bhhQ7ANQHFwlsZqISI3QVr49AxZy9GESpLzutWSMRj8lFUAODVBs01V65dbewrWr+JYP442LjzjgRGJRH17t/taWm8fMsB0P2iL4KYpK+y1NCFgqo1Rmj4+wBl0/8LEMQCmL7U9f404OcwhUbd1828Hre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883570; c=relaxed/simple;
	bh=etJOxAM38wpvm42idu/GhLs1AJz+49tbiRt1itlzSAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gfQP5kFIUNXdHTon2WMbrpwpRc1IX+uH7Wuok+w06er+NZwC1GbliNbkqwin7Gs+QILeKDhBu+Z6Noi5AOm0Lyb4S19nkNhFHZ5O4AsjFy3M4t6sUJc1vcx31nPgzUv92U7jg24En3mFJKf3CcIIH1IScI4j0T0RfyXHrwdbtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UbNlb/0C; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GIAVoV020127;
	Thu, 16 May 2024 18:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XynCFTEpJ9c9tpkSKwQRnpEBPBH5oxaR1GiqTnQE1Qk=;
 b=UbNlb/0C3OIngSdOgNttHTnkcViPueARTXtk9ZJEI48mkOeAM3X2FH5cBsxN01CVo6qr
 KLE+44uIqoYWVSdNU5vw6qO4BhuWaRlNsHSdhVbCyCDZSSxMY/ym0zykY0XL5mz2tSb6
 XEQtuF/A0tdrPog7kHYq6pyEdQul5lu/AZNibjBjcsWoeNBYG5GjLUcgQc8G+8R9j6Nb
 5hM1/HoNM3WQMg5+D7e44KdxlOXpT1GniwrZHE7KHZHhlF61CYatevaGK8n0khQDcz7l
 71RItvHOjArY/dvUMi7TfjT4YlTyu5EhRLUFSQOAG+UkpPD4f0GvSCdJaXARAF4sMZxH ZA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5p6gg5n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:14 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHJBoU018844;
	Thu, 16 May 2024 18:19:13 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:13 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJAFP3146424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:12 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A92858082;
	Thu, 16 May 2024 18:19:10 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A0DA58056;
	Thu, 16 May 2024 18:19:10 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:09 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 09/40] fsi: aspeed: Add AST2700 support
Date: Thu, 16 May 2024 13:18:36 -0500
Message-Id: <20240516181907.3468796-10-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 6Q7YHWP0iAQWxCg7DKi3Mwv2jhNjmb1f
X-Proofpoint-ORIG-GUID: 6Q7YHWP0iAQWxCg7DKi3Mwv2jhNjmb1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

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


