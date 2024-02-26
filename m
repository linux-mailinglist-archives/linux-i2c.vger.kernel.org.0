Return-Path: <linux-i2c+bounces-1989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E92867CF4
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E046E1F2B00D
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F56131727;
	Mon, 26 Feb 2024 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oj3hOWbO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7635C12FF86;
	Mon, 26 Feb 2024 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966429; cv=none; b=aLQ75w/4sjGgCtyS8k/DAfHbG4SpArM0HoUzVNe0qI3bqZWnFtUdtwCxaucQ4LBqWu9cH8jc+ahpPCc3+TWDmDkRoWhIic8RvVd3FiRK86JSIYC0RkM9c846p6TBeTHjFAtrBv/PSoKFZQomnXGxr8apzI6ArwQGX7n+f8ItrGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966429; c=relaxed/simple;
	bh=3nimcBkyHMSfym8s4tUd4i+bP6FP4+nFWT7XoE1U7e0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A3NfI5atuMWitk27pPqCpDm2lLn2sHSRORVEqzXI7z8kvE5QDkb7kvX4CfLxS9+RPIKKtpHv2G0F4eO0bJ2V0bCnDUnQ/C3c4I/TmUdn3wMp0HTdAPZmYQpr22T6+iRDCOdr2Mf76DLCYFjJFDF4KXhkNr3xmxdSDUAI977NEYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oj3hOWbO; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG15OI018815;
	Mon, 26 Feb 2024 16:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zrnHDAhdPUnbtmjsykKg9BbRlBjR1tZ8tUSGR8/dp0k=;
 b=oj3hOWbOMbkjNXKXEKIsbberAkFxEqyZbvpLWUj984XbaX91D2eJaNdcFGca8LzdiNiI
 elwXIe3S0YzHzm/EXz6lhnKW9TUdkqWZnS34QrrRUFIX762llvVBm8vn0WJL+tVj7M+s
 I27JSd+L7sluSJqLIPxUcfknbTLsacW/mjdUaAhnMD54DFA6x2mKehpnfYHGJoQ6cxPH
 5RXuGWz4qXrqvLd1sUPkf4QIIqO3at9lWMHApaMKP84udlqUh6uIcJC8q1LGQvK13Xo4
 zPopWx/dw6Q03y/kKUI9iSj3G6kqAdUhnYXYt4rfNMxr+p9dxbDBAvdeExq1gMEmPzgr ag== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgw0k3559-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:37 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG2Vib008792;
	Mon, 26 Feb 2024 16:53:36 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wftstarbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:35 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrXA628115624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:35 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36BAC58066;
	Mon, 26 Feb 2024 16:53:33 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EBD358053;
	Mon, 26 Feb 2024 16:53:32 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:32 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 13/31] fsi: hub: Use common initialization and link enable
Date: Mon, 26 Feb 2024 10:53:03 -0600
Message-Id: <20240226165321.91976-14-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 9JtxlGHNjdCSQi9QI3kM5SOlEskEtO_T
X-Proofpoint-ORIG-GUID: 9JtxlGHNjdCSQi9QI3kM5SOlEskEtO_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=838
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

Set up an FSI regmap for the hub master to use the new common
master initialization and link enable procedures.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-hub.c | 141 ++++++-----------------------------
 1 file changed, 23 insertions(+), 118 deletions(-)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 111bf7a11458..92aa07055c56 100644
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
@@ -229,22 +127,25 @@ static int hub_master_probe(struct device *dev)
 	hub->master.dev.parent = dev;
 	hub->master.dev.release = hub_master_release;
 	hub->master.dev.of_node = of_node_get(dev_of_node(dev));
+	hub->master.map = map;
 
 	hub->master.lbus_divider = 1;
 	hub->master.idx = fsi_dev->slave->link + 1;
 	hub->master.n_links = links;
+	hub->master.flags = FSI_MASTER_FLAG_INTERRUPT;
 	hub->master.read = hub_master_read;
 	hub->master.write = hub_master_write;
 	hub->master.send_break = hub_master_break;
-	hub->master.link_enable = hub_master_link_enable;
 
 	dev_set_drvdata(dev, hub);
 
-	hub_master_init(hub);
+	rc = fsi_master_init(&hub->master, fsi_device_local_bus_frequency(fsi_dev));
+	if (rc)
+		goto err_free;
 
 	rc = fsi_master_register(&hub->master);
 	if (rc)
-		goto err_release;
+		goto err_free;
 
 	/* At this point, fsi_master_register performs the device_initialize(),
 	 * and holds the sole reference on master.dev. This means the device
@@ -256,9 +157,13 @@ static int hub_master_probe(struct device *dev)
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


