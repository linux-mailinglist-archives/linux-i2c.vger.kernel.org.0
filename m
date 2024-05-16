Return-Path: <linux-i2c+bounces-3541-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F568C7C61
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EEA11F21DB0
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF6015ECE8;
	Thu, 16 May 2024 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="JfUkLGqR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281D815F417;
	Thu, 16 May 2024 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883592; cv=none; b=H8sEvw+Zzly2YFqIBAXlLtF/qZW1zHdFondCcTgcfty5y6Rl47blnM/69MS2EAQqV03k1KVb552/k3/lK+6TRF960Rh3k94dF3ktvZjU9FgYphJZk1quOzGk+V/iaFzogp6Opb2IJSjOlVSHU4hFZYZmCcChtOO/cWej/6JqDIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883592; c=relaxed/simple;
	bh=qaKSN57DFhgzUoIJwygcbsMbYI7rqB3nhHlVwwQrD0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pVQoVVzChrp1fFXCX1a/etaN3tEv40jP/PyN/uWyPnjNzNAKI91iDGCfqRtmuZTdWuGLLwH5iCKC3I8fSte0vjX+Z2Qthcec5Z8asxgbJrZpPZ7kFuhsoyOuJ9r2l+CDsjU+lPCOAJ0UswaItCSYCDsbmRgT5elwm8CnVEEL5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=JfUkLGqR; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHgglc003311;
	Thu, 16 May 2024 18:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7144/LG2eNgprd/415eaf17snNBOk8+YXJ4liDEExS4=;
 b=JfUkLGqR0w44sdi7TCORDZY4JSPiNwMHvZTFE1EhV6dmOnkT+PxQ8pweSdJYxXQMTibb
 h7hgdnmb2GiyLOsWMsFBziAO6Qmy2MsnoY1/+/bp8dCJ6u5N6CDe/cr0MXd7C+dH7sBh
 1IXs6/9GtUAqgy88VxNy+ORTN7xjWTPZlIvNlDrkJgR4SaA0/Y7UYg7tVS4voAYKlWaP
 gXdOxg8zQt1BqqTlyEu/cbpQlVnlAqXfE3R3ttaWQKbBX6k2wkNFpMGx0KYM6Cu5ei36
 NGnnjNZCPQbriycKsVc6vKGaU/jCOsZuUrXJlbd/11zgwwiqJ/lNyEeHW8kHVHC8l22s Kw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5pse82hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:18 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GIAFtW002257;
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0pkfun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:18 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJF9D4391626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:17 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CF9A58052;
	Thu, 16 May 2024 18:19:13 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E88858087;
	Thu, 16 May 2024 18:19:13 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:13 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 20/40] fsi: aspeed: Switch to spinlock
Date: Thu, 16 May 2024 13:18:47 -0500
Message-Id: <20240516181907.3468796-21-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: eKL6peb-uWDAiGtkcxoarInplCb8X2xR
X-Proofpoint-GUID: eKL6peb-uWDAiGtkcxoarInplCb8X2xR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=990 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

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


