Return-Path: <linux-i2c+bounces-3519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A64AD8C7BFB
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7C81F2167F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C5E15821F;
	Thu, 16 May 2024 18:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sBJAxE5Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E824E15746D;
	Thu, 16 May 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883574; cv=none; b=neknQf6Pf3THOF/SotvvXOQ+H3/ajnuP4x9jkNpsxE5sN7ANYliLHmeQ4pE+hMPOgObtznnCgXzf7UfXUvcubMomlmlY12MOnH+ejWpmZkoKDoHZx7qi2a3cDnvlLe/PJKVudcvH3e7c7v18uSg52n7sWWg1pZ4+41Z8HU7Zdk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883574; c=relaxed/simple;
	bh=VhedKvPFFiUAnj/wYMChhGaaPqdpO862oYKVIuAtwT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s55vn3i+9TvQFRJ9Vr8pi9dXlQd1HD3H3x77vEpQ+y13upsGrbVOipmMrSpBxW3XmkCfytxSAmanUrd0f9n1ySimLS9xQI+Z6DOSw/Vl3toUMZfbjT0oGsSTJvBtG8jjrCNhTCA/+MLrgCETsleex7+PkkvXNVSuPoOHRNiGwqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sBJAxE5Z; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GICPfw024570;
	Thu, 16 May 2024 18:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=n2ELCBKlduOnR5wTkTQugicJX8taWF2bAtKMB7UJJcw=;
 b=sBJAxE5ZoH6IdcpM1X7hY97NnK7sToMDpUx1x6/cCDi60IPOBRJU3mVdmt4wI+lppWE0
 PLZhSbMCzsxktvtrR2CTzwNkW6Gub0pCFMzz880+iD1j8Sn0lhwNx48SgFgpz27ezyhk
 FVaNeqbPjkhsoxirDtTGXb3PpkywGWHiVZMaz9dJbrHT6tgwR8Ilrq8ieQnC9G+iWZA+
 M/zYy+BvqAFHMPP/WS9gU+SpVKBFL/HELiYMi3v3pJ2QSbO6pVE8WxTxPLLgu6yl4Len
 3V/7OVHD22NG2MytKVbhwIObh/ZsJvX28x9IeUOdgOGaicRAXvU+zdXVHW06G1uKA9OF 1g== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5q79g0bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:19 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHkRCF006189;
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmud37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:18 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJFjv49807692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:17 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59FA858075;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B4D658077;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 26/40] i2c: fsi: Calculate clock divider from local bus frequency
Date: Thu, 16 May 2024 13:18:53 -0500
Message-Id: <20240516181907.3468796-27-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: bPWYMTGIlqxK3UuxeMX-IKBR1b99g0vy
X-Proofpoint-GUID: bPWYMTGIlqxK3UuxeMX-IKBR1b99g0vy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 mlxlogscore=977
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Use the new FSI device local bus clock to calculate the proper
i2c clock divder and look up an optional clock-frequency property
from device tree. Change the default clock divider to 7 now that
the default local bus clock divider has been reduced as well.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v2:
 - Change minimum clock div to 3
 - Use DIV_ROUND_UP instead of re-implementing it
 - Better logic for checking for clock-frequency property

 drivers/i2c/busses/i2c-fsi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 10332693edf0d..2404ace8c56fa 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -27,7 +27,8 @@
 
 #define FSI_ENGID_I2C		0x7
 
-#define I2C_DEFAULT_CLK_DIV	6
+#define I2C_DEFAULT_CLK_DIV	7
+#define I2C_DEFAULT_CLK_RATE	400000
 
 /* i2c registers */
 #define I2C_FSI_FIFO		0x00
@@ -150,6 +151,7 @@ struct fsi_i2c_master {
 	u8			fifo_size;
 	struct list_head	ports;
 	struct mutex		lock;
+	u32			clock_div;
 };
 
 struct fsi_i2c_port {
@@ -194,7 +196,7 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 	if (rc)
 		return rc;
 
-	mode |= FIELD_PREP(I2C_MODE_CLKDIV, I2C_DEFAULT_CLK_DIV);
+	mode |= FIELD_PREP(I2C_MODE_CLKDIV, i2c->clock_div);
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
 		return rc;
@@ -680,6 +682,7 @@ static int fsi_i2c_probe(struct device *dev)
 	struct fsi_i2c_port *port;
 	struct device_node *np;
 	u32 port_no, ports, stat;
+	u32 lbus;
 	int rc;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -689,6 +692,19 @@ static int fsi_i2c_probe(struct device *dev)
 	mutex_init(&i2c->lock);
 	i2c->fsi = to_fsi_dev(dev);
 	INIT_LIST_HEAD(&i2c->ports);
+	i2c->clock_div = I2C_DEFAULT_CLK_DIV;
+
+	lbus = fsi_device_local_bus_frequency(i2c->fsi);
+	if (lbus) {
+		u32 clock;
+
+		if (device_property_read_u32(dev, "clock-frequency", &clock) || !clock)
+			clock = I2C_DEFAULT_CLK_RATE;
+
+		i2c->clock_div = DIV_ROUND_UP(DIV_ROUND_UP(lbus, clock), 4) - 1;
+		if (i2c->clock_div <= 2)
+			i2c->clock_div = 3;
+	}
 
 	rc = fsi_i2c_dev_init(i2c);
 	if (rc)
-- 
2.39.3


