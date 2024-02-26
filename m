Return-Path: <linux-i2c+bounces-1985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A1E867CE2
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A41DF1C20A87
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B9012FB18;
	Mon, 26 Feb 2024 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Mq5wI1Oj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0D12EBFA;
	Mon, 26 Feb 2024 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966426; cv=none; b=TIvV0xCvwRKi13dolm/UuhA1yvGtYHRQbSFVWCct716Xwc/UmjG49HOSjrI4MTPDDEiuyfHgdojXOrQg5l6OoADIsUKpf+f04eBju8Z3P6zb+3/V3lGbyqf1d+E8UgRv4CgjFP7DCXPvKyX0uN4JCTwQGKjXD7gJsBRgIaqTq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966426; c=relaxed/simple;
	bh=NGXJUu33Lr1l9NXaZa1510h0VGdsd6eNUEVT355jTIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BUb47Qiq78MQe7DQ57gNk4LKXo2PF6kLmVVvW78c3zELjuFvcRMjUh3mpYL/ExjNEFctdV4E3WMhqkM6RTS3j5Vyf4SuleyS80uHx0/DQxxEAJixq+RFLYfihZF/6VO/UIB9oPcN0cSJEMsILoItFo25DNu2QH7smdGDTmYqj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Mq5wI1Oj; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG5cQ1025170;
	Mon, 26 Feb 2024 16:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gaRn11yQSzCtGgfOHG0WfDL4IGGOB1/y2J4JPHKXeY0=;
 b=Mq5wI1OjiWAZKmaxpk/moZ3UR6ltjpxkBtDjvC9B6JctRHu6N6ccbik43+U5uuMgq4cR
 I93if83MPgQh0fdvZjjwcayQN2wWWygs5hmWmio34HtCVgiWI0R3600Hx0pQ52+ri8z7
 hv+uLYLSu7Lb+Fkx90ozyz21oZuTxZlv/dBE/ivSRSCqiznLDMpkriQsemywJRtzlHJa
 rKR0xMntT/hB/e5A1EooFVNJnF72fq9shvNjFmSfo4xpw9Fy9JWAA//8LKPSGhu+KH/q
 wF7WvKI84xGnUMXWNtqTW1mdtvCC2uEcw/KcF1I12cfG0gfySGOpa8NN3lzyXTp2hJre Gw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgvsq33fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:33 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG5FVG008798;
	Mon, 26 Feb 2024 16:53:32 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wftstarb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:32 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrUr020775424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:32 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AC675806A;
	Mon, 26 Feb 2024 16:53:30 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51DAE58053;
	Mon, 26 Feb 2024 16:53:29 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:29 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 09/31] fsi: aspeed: Add AST2700 support
Date: Mon, 26 Feb 2024 10:52:59 -0600
Message-Id: <20240226165321.91976-10-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: JIO00IJkeUysRHl0uQhFXf0gZiyzFVlX
X-Proofpoint-ORIG-GUID: JIO00IJkeUysRHl0uQhFXf0gZiyzFVlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

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


