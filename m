Return-Path: <linux-i2c+bounces-3841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 627DF8FD867
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAD9D28700D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FA415FCED;
	Wed,  5 Jun 2024 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hXUhAGMK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E2715F3FF;
	Wed,  5 Jun 2024 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622618; cv=none; b=gpfvT0jBh9VhAmjequNzCvCQ9VR/WYljj5aFa4lcjVtTEE09ncIQjQwux2q0E2aLrK5mdjjQe1ldvc5KVppzg1ZFR8c8JsldUK+zfjuI1XNZ0yAjPsDHwoyDo/tis77uFOAlJkHUN7wq42MNxg/MdYEl1mQJIuieGgZzEJFaaXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622618; c=relaxed/simple;
	bh=SJUTkBqyyZTlwDRg7ldRmAZztx4EwiyDcC6kI4kRcwc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nGOmXlQBQ/b/0x5lZ+358MTLSkQZaclibOzQLNf0y5bl6g40/xW9Y4jYpbAG/XsQO6Bt7BvHcpmw8PY3pUeP4044qpn5WCmjDiomkdPqqDAKgSpavh5DcOtLMqVO5+J3T3wts7/PNFB6OHq5ExWO6BcIgybJHoJt/PNh2e1Bh08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hXUhAGMK; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455L0VDJ020583;
	Wed, 5 Jun 2024 21:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=IS0irjXh2U091zKbKR7d+9rVvpukYBODxtV/+wXMALY=;
 b=hXUhAGMKEm00byhlnN0F2jBp+2w6KChNiERs8h5fwjUP4LnFJt1wRJ+cpJbZZsAXJo6+
 QFgzg/qzmlzcrTwCt2yqqsXd9D/xtWH5l9rsDSamcHlXML3VB8LyO1HG58LY8QYZeC2o
 hxoNGpylv9l1rwnKfujDgZghTjz0fJi71i5iSxm0u5ufNwH7g49QWs+Ls78viYQMYyrr
 eSknqPZWFDR+HFi3ux0znkUFriW6+DwMOzjSwtMzRZa60RSbGd8LSg7yGiUbmhPZOkCN
 QVoQxw2NB01NKWKzBM0K6+ewja6JcGYi7NEFR4reGzHigQQZ6c0X0EvZl42Y6iw+mLwp oQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyhyr1mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:22 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455JVcND031129;
	Wed, 5 Jun 2024 21:23:21 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppntg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:21 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNH6A60883398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:19 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C27F058059;
	Wed,  5 Jun 2024 21:23:17 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50A915806B;
	Wed,  5 Jun 2024 21:23:17 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:17 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 14/40] fsi: hub: Use common initialization and link enable
Date: Wed,  5 Jun 2024 16:22:46 -0500
Message-Id: <20240605212312.349188-15-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: aed_HAX7kPUDtVtMm45WxMVTt_-_BYov
X-Proofpoint-GUID: aed_HAX7kPUDtVtMm45WxMVTt_-_BYov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=911 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

Set up an FSI regmap for the hub master to use the new common
master initialization and link enable procedures.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-hub.c | 142 ++++++-----------------------------
 1 file changed, 23 insertions(+), 119 deletions(-)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index eea8649fee74d..91ad6b7728fa2 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -9,6 +9,7 @@
 #include <linux/fsi.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include "fsi-master.h"
@@ -16,8 +17,6 @@
 
 #define FSI_ENGID_HUB_MASTER		0x1c
 
-#define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
-
 /*
  * FSI hub master support
  *
@@ -78,134 +77,33 @@ static int hub_master_break(struct fsi_master *master, int link)
 	return hub_master_write(master, link, 0, addr, &cmd, sizeof(cmd));
 }
 
-static int hub_master_link_enable(struct fsi_master *master, int link,
-				  bool enable)
-{
-	struct fsi_master_hub *hub = to_fsi_master_hub(master);
-	int idx, bit;
-	__be32 reg;
-	int rc;
-
-	idx = link / 32;
-	bit = link % 32;
-
-	reg = cpu_to_be32(0x80000000 >> bit);
-
-	if (!enable)
-		return fsi_device_write(hub->upstream, FSI_MCENP0 + (4 * idx),
-					&reg, 4);
-
-	rc = fsi_device_write(hub->upstream, FSI_MSENP0 + (4 * idx), &reg, 4);
-	if (rc)
-		return rc;
-
-	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
-
-	return 0;
-}
-
 static void hub_master_release(struct device *dev)
 {
 	struct fsi_master_hub *hub = to_fsi_master_hub(to_fsi_master(dev));
 
+	regmap_exit(hub->master.map);
 	kfree(hub);
 }
 
-/* mmode encoders */
-static inline u32 fsi_mmode_crs0(u32 x)
-{
-	return (x & FSI_MMODE_CRS0MASK) << FSI_MMODE_CRS0SHFT;
-}
-
-static inline u32 fsi_mmode_crs1(u32 x)
-{
-	return (x & FSI_MMODE_CRS1MASK) << FSI_MMODE_CRS1SHFT;
-}
-
-static int hub_master_init(struct fsi_master_hub *hub)
-{
-	struct fsi_device *dev = hub->upstream;
-	__be32 reg;
-	int rc;
-
-	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
-			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
-	rc = fsi_device_write(dev, FSI_MRESP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	/* Initialize the MFSI (hub master) engine */
-	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
-			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
-	rc = fsi_device_write(dev, FSI_MRESP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM);
-	rc = fsi_device_write(dev, FSI_MECTRL, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(FSI_MMODE_EIP | FSI_MMODE_ECRC | FSI_MMODE_EPC
-			| fsi_mmode_crs0(1) | fsi_mmode_crs1(1)
-			| FSI_MMODE_P8_TO_LSB);
-	rc = fsi_device_write(dev, FSI_MMODE, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(0xffff0000);
-	rc = fsi_device_write(dev, FSI_MDLYR, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(~0);
-	rc = fsi_device_write(dev, FSI_MSENP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	/* Leave enabled long enough for master logic to set up */
-	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
-
-	rc = fsi_device_write(dev, FSI_MCENP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	rc = fsi_device_read(dev, FSI_MAEB, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK);
-	rc = fsi_device_write(dev, FSI_MRESP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	rc = fsi_device_read(dev, FSI_MLEVP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	/* Reset the master bridge */
-	reg = cpu_to_be32(FSI_MRESB_RST_GEN);
-	rc = fsi_device_write(dev, FSI_MRESB0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(FSI_MRESB_RST_ERR);
-	return fsi_device_write(dev, FSI_MRESB0, &reg, sizeof(reg));
-}
-
 static int hub_master_probe(struct device *dev)
 {
+	struct regmap_config hub_master_regmap_config;
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct fsi_master_hub *hub;
+	struct regmap *map;
 	uint32_t reg, links;
-	__be32 __reg;
 	int rc;
 
-	rc = fsi_device_read(fsi_dev, FSI_MVER, &__reg, sizeof(__reg));
+	fsi_master_regmap_config(&hub_master_regmap_config);
+	hub_master_regmap_config.reg_base = fsi_dev->addr;
+	map = regmap_init_fsi(fsi_dev, &hub_master_regmap_config);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	rc = regmap_read(map, FSI_MVER, &reg);
 	if (rc)
-		return rc;
+		goto err_regmap;
 
-	reg = be32_to_cpu(__reg);
 	links = (reg >> 8) & 0xff;
 	dev_dbg(dev, "hub version %08x (%d links)\n", reg, links);
 
@@ -213,7 +111,7 @@ static int hub_master_probe(struct device *dev)
 			FSI_HUB_LINK_SIZE * links);
 	if (rc) {
 		dev_err(dev, "can't claim slave address range for links");
-		return rc;
+		goto err_regmap;
 	}
 
 	hub = kzalloc(sizeof(*hub), GFP_KERNEL);
@@ -229,22 +127,24 @@ static int hub_master_probe(struct device *dev)
 	hub->master.dev.parent = dev;
 	hub->master.dev.release = hub_master_release;
 	hub->master.dev.of_node = of_node_get(dev_of_node(dev));
+	hub->master.map = map;
 
 	hub->master.idx = fsi_dev->slave->link + 1;
 	hub->master.n_links = links;
-	hub->master.flags = FSI_MASTER_FLAG_NO_BREAK_SID;
+	hub->master.flags = FSI_MASTER_FLAG_NO_BREAK_SID | FSI_MASTER_FLAG_INTERRUPT;
 	hub->master.read = hub_master_read;
 	hub->master.write = hub_master_write;
 	hub->master.send_break = hub_master_break;
-	hub->master.link_enable = hub_master_link_enable;
 
 	dev_set_drvdata(dev, hub);
 
-	hub_master_init(hub);
+	rc = fsi_master_init(&hub->master, fsi_dev->slave->master->clock_frequency);
+	if (rc)
+		goto err_free;
 
 	rc = fsi_master_register(&hub->master);
 	if (rc)
-		goto err_release;
+		goto err_free;
 
 	/* At this point, fsi_master_register performs the device_initialize(),
 	 * and holds the sole reference on master.dev. This means the device
@@ -256,9 +156,13 @@ static int hub_master_probe(struct device *dev)
 	get_device(&hub->master.dev);
 	return 0;
 
+err_free:
+	kfree(hub);
 err_release:
 	fsi_slave_release_range(fsi_dev->slave, FSI_HUB_LINK_OFFSET,
 			FSI_HUB_LINK_SIZE * links);
+err_regmap:
+	regmap_exit(map);
 	return rc;
 }
 
-- 
2.39.3


