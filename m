Return-Path: <linux-i2c+bounces-1996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A8E867D1B
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2719287AC1
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A846813399D;
	Mon, 26 Feb 2024 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NVAAt5yw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125E1332BA;
	Mon, 26 Feb 2024 16:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966436; cv=none; b=Z3D14rYkFJ5E/IbN2z2YEKwctZuteLCHC7w6N8zB6O9l7tzRwUTozqkf/rP2OpD+h35axX3iHkrz3J/P4MlVz/1u7gcwDQh6i1hY8YdjxqTyuBGYONkPUj/J8kqdMIkZEiaAQ4i+sLHRpGOGwbHzMvc9H1xWDO5nAEG9CHHgTMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966436; c=relaxed/simple;
	bh=vMXLZdWtNXhO12KyFpb6gqzuEGpjA+RzS5g5kNb3j6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f/ZING6gbEB5MyxMLpe2a8adZW0ex3Zp55U48K+6dmvTbSuX66kNEAnH1EtgbSYfF8uX2jxzF3m/ks6y7vpnJJdy5AXO63DAoR/4PDCiQl4wirYM94xt3v0LI27uBClERQAvt+l2Lga2nMJBIG0XsdeNR15vXKZqWoU4U2LeShc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NVAAt5yw; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGSLjd015212;
	Mon, 26 Feb 2024 16:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ETtwT8LcMCJW+mcR7ZD5Qq2B6I2ZwqYbef+CZ36s+uQ=;
 b=NVAAt5ywdwvAyOYNqMPY6aGN/noDrEnpdCZFCpAXaYL84bc9Y2lv3v1lNEe+wXEzbpEn
 8B2dKkyCVOuAhptk92F9ADNkNPjykU4TrEam41IomdG5HMLG5DfOOD/sQ68iQ92MLzq1
 uvLf5faWJ06P5/XrdtXqA4mXMr5n4ni8xqLcM4TmlE+5kvPq2FOXYaNO16SwBjkJ3hjq
 06rssfKkcp0oo1AieCCt/OomzxJU3nY4h4BqJdUzHtrE/RvUMKWHycuS6b3tOezXsBJ/
 60FNZ/PlpED8i0PEqh4KbdExhnqQfsr1/O2Hh7fttPznnDntbCBwuJB+fXm4xRHD9ziw Mw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgx6g8npm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:42 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGBYAg012324;
	Mon, 26 Feb 2024 16:53:40 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfwg21xwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:40 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrcLc18350716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:40 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 178485805F;
	Mon, 26 Feb 2024 16:53:38 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E74658053;
	Mon, 26 Feb 2024 16:53:37 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 19/31] fsi: aspeed: Switch to spinlock
Date: Mon, 26 Feb 2024 10:53:09 -0600
Message-Id: <20240226165321.91976-20-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: Pv_sDwOsAvV0ykjEgHo9l94QyNTknLd6
X-Proofpoint-ORIG-GUID: Pv_sDwOsAvV0ykjEgHo9l94QyNTknLd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

In preparation for interrupt support, switch to a spinlock rather
than a mutex.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 83f84ee6d6f4..1cb5bf6c05d2 100644
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
 	struct clk		*clk;
@@ -245,6 +245,7 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 			uint8_t id, uint32_t addr, void *val, size_t size)
 {
 	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
+	unsigned long flags;
 	int ret;
 
 	if (id > 0x3)
@@ -253,7 +254,7 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 	addr |= id << 21;
 	addr += link * FSI_HUB_LINK_SIZE;
 
-	mutex_lock(&aspeed->lock);
+	spin_lock_irqsave(&aspeed->lock, flags);
 
 	switch (size) {
 	case 1:
@@ -272,7 +273,7 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 
 	ret = check_errors(aspeed, ret);
 done:
-	mutex_unlock(&aspeed->lock);
+	spin_unlock_irqrestore(&aspeed->lock, flags);
 	return ret;
 }
 
@@ -280,6 +281,7 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 			uint8_t id, uint32_t addr, const void *val, size_t size)
 {
 	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
+	unsigned long flags;
 	int ret;
 
 	if (id > 0x3)
@@ -288,7 +290,7 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 	addr |= id << 21;
 	addr += link * FSI_HUB_LINK_SIZE;
 
-	mutex_lock(&aspeed->lock);
+	spin_lock_irqsave(&aspeed->lock, flags);
 
 	switch (size) {
 	case 1:
@@ -307,7 +309,7 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 
 	ret = check_errors(aspeed, ret);
 done:
-	mutex_unlock(&aspeed->lock);
+	spin_unlock_irqrestore(&aspeed->lock, flags);
 	return ret;
 }
 
@@ -369,15 +371,16 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
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
 	opb_writel(aspeed, ctrl_base + FSI_MRESP0, cpu_to_be32(FSI_MRESP_RST_ALL_MASTER));
-	mutex_unlock(&aspeed->lock);
+	spin_unlock_irqrestore(&aspeed->lock, flags);
 	trace_fsi_master_aspeed_cfam_reset(false);
 
 	return count;
@@ -468,6 +471,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	aspeed->dev = &pdev->dev;
+	spin_lock_init(&aspeed->lock);
 
 	aspeed->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(aspeed->base)) {
@@ -543,7 +547,6 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, aspeed);
 
-	mutex_init(&aspeed->lock);
 	rc = fsi_master_init(&aspeed->master, clk_get_rate(aspeed->clk));
 	if (rc)
 		goto err_regmap;
-- 
2.39.3


