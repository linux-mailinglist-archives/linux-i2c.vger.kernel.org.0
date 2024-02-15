Return-Path: <linux-i2c+bounces-1784-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E27C857009
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2570B21CD9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE9B1487F0;
	Thu, 15 Feb 2024 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="P/cT8Tkn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30743146906;
	Thu, 15 Feb 2024 22:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034909; cv=none; b=WUUCqCupKIOqYIg95/6Iae/QiT/07NOiOjN5ehNO8FjDTLtdcUsEaMH6zcUIYzyRz55DZXGbX5VcnNhjiwCZMfCmh+QuEyN8i48vhE468hhu4lRXGMtNpa0ouoKWe/Q5e6xxhAWzxoYdGnKAs+frjp+K52uxxvaLnbM96lUeexg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034909; c=relaxed/simple;
	bh=vMXLZdWtNXhO12KyFpb6gqzuEGpjA+RzS5g5kNb3j6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k+cFT2n0uy/5TXm9d2DDtCtfR7vcnehOZ49sYqMxOApMIwT2zcgl8XFVJ/y2cZuRUoxtyj+ZUTCKPwvyyKhj9wRMeXpvn1lRVlk1gp0BexucpamoyfytAY4DwD0BigbVhkd30llP9STZvxFvAqmACrqXmrYFEpI8UJjUXlq2r54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=P/cT8Tkn; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FK0sSO029381;
	Thu, 15 Feb 2024 22:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ETtwT8LcMCJW+mcR7ZD5Qq2B6I2ZwqYbef+CZ36s+uQ=;
 b=P/cT8Tkniy6tjjfK7Ahp1PYULCUzd2CmKz8ncZo/UXc2Er35U/y0F3oMwIDUpff9+kDw
 85dRjVoP5kAvK0PKTUI+Flu40pNk8t2iUjC25CBDJOV8cPki1vjT3OuL/6KTUYTJqqCq
 wOE4JINt6VyDYDRh07YN8AOORc5kpEN9ykLcyohQaPA//q2S3iqB2kwUiWetTuGhysjJ
 FC3QaY9ITlA2gsb1XHGosmuzHtqEsSaDqrYmcUMLTArYyTlQU6s2xyz2M3js1EbU/ETh
 0rt5zGnx4zkCy7MJzIxqPGcX2AsyO1kE63ug1GHQ7qLifdldlo7U9l4dP28K1EiZOAvk GQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9q0v5yec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:13 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLHWtA009935;
	Thu, 15 Feb 2024 22:08:12 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6p6374qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:12 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM89Ro53281072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:11 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 107E45805A;
	Thu, 15 Feb 2024 22:08:09 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8F7E58076;
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
Subject: [PATCH 20/33] fsi: aspeed: Switch to spinlock
Date: Thu, 15 Feb 2024 16:07:46 -0600
Message-Id: <20240215220759.976998-21-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: kCcQoYcjx-H77gRE48q4mt9faj7S84xb
X-Proofpoint-GUID: kCcQoYcjx-H77gRE48q4mt9faj7S84xb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

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


