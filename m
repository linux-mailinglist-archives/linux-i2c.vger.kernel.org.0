Return-Path: <linux-i2c+bounces-3870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 571178FD8D7
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 880E3B21DC4
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D37317E47C;
	Wed,  5 Jun 2024 21:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Hnz9qoQf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BA916C6A7;
	Wed,  5 Jun 2024 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622626; cv=none; b=UII7Unxy5pHXuZdGqMRXMWV59z5PKemRKOrl0tmIX40uuNFLJTNrrazewXqgVBmnQ7e3aWqD37rm8wZ5L+/lQLzMA8LHDDjF9+YsNj8NEI+2QI2Bkwfwwat8kbpaVUgS1VPW5JnAlHIPuK2rmiLd4zVJTyHvNNw7bGrGHyLWAF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622626; c=relaxed/simple;
	bh=qaKSN57DFhgzUoIJwygcbsMbYI7rqB3nhHlVwwQrD0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cmS4SrlMnfpf0Cq55JTkxnUKi81ePTKlpZuLL1ELoRANchsHXZKbYxsIFUEgF0xbquDweLrSdsANNnXqoV8aOHvR3x6yYraN79PQl632Jcgd9vGV/lY2yiAL2xKPfitmlK6WZ+Y9Udyi0jAhQyt6/MYhuKHhq4fsTLOsQb4snPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Hnz9qoQf; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KujBr001492;
	Wed, 5 Jun 2024 21:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=7144/LG2eNgprd/415eaf17snNBOk8+YXJ4liDEExS4=;
 b=Hnz9qoQfLlYK1z9pOG3ZjpNsxjMGqKoy5B44PYAjz19geFUXipws6KjO10JMJmM09rkb
 hG+YYFzhFQrMUEB5Bo2Hfv9oYTIbJifbh4ZPHbd2/00bbUV+FAxadR7GbFzZsO3UM0ZS
 Tkj+fzNwwLic/bGFn13YPugrKkLPQTsN/CYnlQBW3bmz4ugkq4+c0xH8rKAIfnNoy0y4
 5SLM3SA6OqBrQI7fSNK35QL4FVw+cImVNhStIn+lVpn9aF7VvuQm4C0iODqrbVfZj/bJ
 W6ahSSwr5snqa5g3PJKz0nbNdG0/pE0KIxf+Zb6TuCGhGieandJ+KKx5rXRSFoZGrtAz ig== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjwppgcg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:25 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455LKarF026550;
	Wed, 5 Jun 2024 21:23:25 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yggp366fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:25 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNL6f40042806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F84358060;
	Wed,  5 Jun 2024 21:23:19 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 423615806E;
	Wed,  5 Jun 2024 21:23:19 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 20/40] fsi: aspeed: Switch to spinlock
Date: Wed,  5 Jun 2024 16:22:52 -0500
Message-Id: <20240605212312.349188-21-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: tUwL7hjLp28dY9WByyu26kuCsCiScvUz
X-Proofpoint-GUID: tUwL7hjLp28dY9WByyu26kuCsCiScvUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 mlxlogscore=988 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

In preparation for interrupt support, switch to a spinlock rather
than a mutex.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 10ca23cf58c2e..176e596b4391b 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -8,11 +8,11 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/iopoll.h>
 #include <linux/gpio/consumer.h>
 
@@ -24,7 +24,7 @@ struct fsi_master_aspeed_data {
 
 struct fsi_master_aspeed {
 	struct fsi_master	master;
-	struct mutex		lock;	/* protect HW access */
+	spinlock_t		lock;	/* protect HW access */
 	struct device		*dev;
 	void __iomem		*base;
 	void __iomem		*ctrl;
@@ -251,6 +251,7 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 			uint8_t id, uint32_t addr, void *val, size_t size)
 {
 	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
+	unsigned long flags;
 	int ret;
 
 	if (id > 0x3)
@@ -259,7 +260,7 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 	addr |= id << 21;
 	addr += link * FSI_HUB_LINK_SIZE;
 
-	mutex_lock(&aspeed->lock);
+	spin_lock_irqsave(&aspeed->lock, flags);
 
 	switch (size) {
 	case 1:
@@ -278,7 +279,7 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 
 	ret = check_errors(aspeed, ret);
 done:
-	mutex_unlock(&aspeed->lock);
+	spin_unlock_irqrestore(&aspeed->lock, flags);
 	return ret;
 }
 
@@ -286,6 +287,7 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 			uint8_t id, uint32_t addr, const void *val, size_t size)
 {
 	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
+	unsigned long flags;
 	int ret;
 
 	if (id > 0x3)
@@ -294,7 +296,7 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 	addr |= id << 21;
 	addr += link * FSI_HUB_LINK_SIZE;
 
-	mutex_lock(&aspeed->lock);
+	spin_lock_irqsave(&aspeed->lock, flags);
 
 	switch (size) {
 	case 1:
@@ -313,7 +315,7 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 
 	ret = check_errors(aspeed, ret);
 done:
-	mutex_unlock(&aspeed->lock);
+	spin_unlock_irqrestore(&aspeed->lock, flags);
 	return ret;
 }
 
@@ -396,15 +398,16 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
 				const char *buf, size_t count)
 {
 	struct fsi_master_aspeed *aspeed = dev_get_drvdata(dev);
+	unsigned long flags;
 
 	trace_fsi_master_aspeed_cfam_reset(true);
-	mutex_lock(&aspeed->lock);
+	spin_lock_irqsave(&aspeed->lock, flags);
 	gpiod_set_value(aspeed->cfam_reset_gpio, 1);
-	usleep_range(900, 1000);
+	udelay(900);
 	gpiod_set_value(aspeed->cfam_reset_gpio, 0);
-	usleep_range(900, 1000);
+	udelay(900);
 	regmap_write(aspeed->master.map, FSI_MRESP0, FSI_MRESP_RST_ALL_MASTER);
-	mutex_unlock(&aspeed->lock);
+	spin_unlock_irqrestore(&aspeed->lock, flags);
 	trace_fsi_master_aspeed_cfam_reset(false);
 
 	return count;
@@ -498,6 +501,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	aspeed->dev = &pdev->dev;
+	spin_lock_init(&aspeed->lock);
 
 	aspeed->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(aspeed->base)) {
@@ -583,7 +587,6 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, aspeed);
 
-	mutex_init(&aspeed->lock);
 	rc = fsi_master_init(&aspeed->master, clk_get_rate(aspeed->clk));
 	if (rc)
 		goto err_regmap;
-- 
2.39.3


