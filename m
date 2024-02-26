Return-Path: <linux-i2c+bounces-1992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D18E6867D05
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0014D1C2A537
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B01132C17;
	Mon, 26 Feb 2024 16:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SAtcD5/9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40F0131E42;
	Mon, 26 Feb 2024 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966433; cv=none; b=B1RvX2fw7SG0smc0HRCQaS5p2xoxd7KrHNfE2NPharIz5dG0zmNMTJb/9G6rtp6L7o4eXtuukXbrKAWHRZSpqou1SMiesdMOhkz0aGzEaajI42clpTGHWR+Dy/yFdWTBHhHvLph43H3D42K1hqN0O9ODhSheDGNw3LmRWHV1Ll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966433; c=relaxed/simple;
	bh=06noxcBj+0w/9K5t6WqaO8FUweWGJp65GITzL1ijo5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=skup/f4Dt23t8tW5CqoUSqr0Y1NHSteWMfs7zFHwEPtKBoH38dw5mdlxZLkX5/pI4Vnzcj+7UKP4Q47SItleompeqBq9aCkhQHyX6l3mZNPWLVEwRgDHmB+/7TBSdO8jzbOfFo2YB3dWEJEPyP+4K55n0cbxRZ0e+qLmQXZUhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SAtcD5/9; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QF2mUE022255;
	Mon, 26 Feb 2024 16:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Wt8UWHHJz1+fM4oAB+F4OGgkDBnjm6htdEah2gI4GTI=;
 b=SAtcD5/985Nvt1QZ4/I1M1WNWG5DNwozj/OyiaVy21RlZ+yegxXFDUA/51ThRoD1M7aB
 rjZBuYR+G42gLTC5iUX7g8wPKXqxmyh3l+VYBxeBteKJIwoeyAuWX7qtAhjViDvrxHBX
 JbiR30URGMLVmKSDB31H9JfxjUo42vz8OThdVcDTgv+F2eegz0dJaJHQorsvDugNnXQi
 zOVTWvY2M8AgYEfIijFPabm/jdkSDMsTHwDlMAKgUB22E+NkFozO0RS1OUt6wGCfKT/M
 m8BTMmR9CRtzYTkK15jCcFiuH41yWL5Tn/mGe0L/gCIfSCPSwPdqZkkUq6nteZPJS6kf GA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgvp6bk5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:38 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFvbiV012371;
	Mon, 26 Feb 2024 16:53:36 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfwg21xwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:36 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrYH019530298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:36 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E67758043;
	Mon, 26 Feb 2024 16:53:34 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D58658053;
	Mon, 26 Feb 2024 16:53:33 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:33 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 14/31] fsi: aspeed: Use common initialization and link enable
Date: Mon, 26 Feb 2024 10:53:04 -0600
Message-Id: <20240226165321.91976-15-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: qQyfIO1IPjbs2PUq4nX-k2kfazlcghbO
X-Proofpoint-GUID: qQyfIO1IPjbs2PUq4nX-k2kfazlcghbO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402260128

Create a regmap for accessing the master registers over OPB
to use the new common master initialization and link enable procedures.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 146 ++++++++------------------------
 1 file changed, 37 insertions(+), 109 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index d6e923b8f501..2258980e4c47 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -90,14 +90,6 @@ static const u32 fsi_base = 0xa0000000;
 #define CREATE_TRACE_POINTS
 #include <trace/events/fsi_master_aspeed.h>
 
-#define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
-
-/* Run the bus at maximum speed by default */
-#define FSI_DIVISOR_DEFAULT            1
-#define FSI_DIVISOR_CABLED             2
-static u16 aspeed_fsi_divisor = FSI_DIVISOR_DEFAULT;
-module_param_named(bus_div,aspeed_fsi_divisor, ushort, 0);
-
 #define OPB_POLL_TIMEOUT		500
 
 static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
@@ -328,35 +320,6 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 	return ret;
 }
 
-static int aspeed_master_link_enable(struct fsi_master *master, int link,
-				     bool enable)
-{
-	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
-	int idx, bit, ret;
-	__be32 reg;
-
-	idx = link / 32;
-	bit = link % 32;
-
-	reg = cpu_to_be32(0x80000000 >> bit);
-
-	mutex_lock(&aspeed->lock);
-
-	if (!enable) {
-		ret = opb_writel(aspeed, ctrl_base + FSI_MCENP0 + (4 * idx), reg);
-		goto done;
-	}
-
-	ret = opb_writel(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx), reg);
-	if (ret)
-		goto done;
-
-	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
-done:
-	mutex_unlock(&aspeed->lock);
-	return ret;
-}
-
 static int aspeed_master_term(struct fsi_master *master, int link, uint8_t id)
 {
 	uint32_t addr;
@@ -384,72 +347,33 @@ static void aspeed_master_release(struct device *dev)
 	struct fsi_master_aspeed *aspeed =
 		to_fsi_master_aspeed(to_fsi_master(dev));
 
+	regmap_exit(aspeed->master.map);
 	kfree(aspeed);
 }
 
-/* mmode encoders */
-static inline u32 fsi_mmode_crs0(u32 x)
+static int regmap_aspeed_opb_read(void *context, unsigned int reg, unsigned int *val)
 {
-	return (x & FSI_MMODE_CRS0MASK) << FSI_MMODE_CRS0SHFT;
-}
+	__be32 v;
+	int ret;
 
-static inline u32 fsi_mmode_crs1(u32 x)
-{
-	return (x & FSI_MMODE_CRS1MASK) << FSI_MMODE_CRS1SHFT;
+	ret = opb_readl(context, ctrl_base + reg, &v);
+	if (ret)
+		return ret;
+
+	*val = be32_to_cpu(v);
+	return 0;
 }
 
-static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
+static int regmap_aspeed_opb_write(void *context, unsigned int reg, unsigned int val)
 {
-	__be32 reg;
-
-	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
-			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
-	opb_writel(aspeed, ctrl_base + FSI_MRESP0, reg);
-
-	/* Initialize the MFSI (hub master) engine */
-	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
-			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
-	opb_writel(aspeed, ctrl_base + FSI_MRESP0, reg);
-
-	reg = cpu_to_be32(FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM);
-	opb_writel(aspeed, ctrl_base + FSI_MECTRL, reg);
-
-	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC | FSI_MMODE_RELA
-			| fsi_mmode_crs0(aspeed_fsi_divisor)
-			| fsi_mmode_crs1(aspeed_fsi_divisor)
-			| FSI_MMODE_P8_TO_LSB);
-	dev_info(aspeed->dev, "mmode set to %08x (divisor %d)\n",
-			be32_to_cpu(reg), aspeed_fsi_divisor);
-	opb_writel(aspeed, ctrl_base + FSI_MMODE, reg);
-
-	reg = cpu_to_be32(0xffff0000);
-	opb_writel(aspeed, ctrl_base + FSI_MDLYR, reg);
-
-	reg = cpu_to_be32(~0);
-	opb_writel(aspeed, ctrl_base + FSI_MSENP0, reg);
-
-	/* Leave enabled long enough for master logic to set up */
-	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
-
-	opb_writel(aspeed, ctrl_base + FSI_MCENP0, reg);
-
-	opb_readl(aspeed, ctrl_base + FSI_MAEB, NULL);
-
-	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK);
-	opb_writel(aspeed, ctrl_base + FSI_MRESP0, reg);
-
-	opb_readl(aspeed, ctrl_base + FSI_MLEVP0, NULL);
-
-	/* Reset the master bridge */
-	reg = cpu_to_be32(FSI_MRESB_RST_GEN);
-	opb_writel(aspeed, ctrl_base + FSI_MRESB0, reg);
-
-	reg = cpu_to_be32(FSI_MRESB_RST_ERR);
-	opb_writel(aspeed, ctrl_base + FSI_MRESB0, reg);
-
-	return 0;
+	return opb_writel(context, ctrl_base + reg, cpu_to_be32(val));
 }
 
+static const struct regmap_bus regmap_aspeed_opb = {
+	.reg_write = regmap_aspeed_opb_write,
+	.reg_read = regmap_aspeed_opb_read,
+};
+
 static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *attr,
 				const char *buf, size_t count)
 {
@@ -521,14 +445,6 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
 
 	/* If the routing GPIO is high we should set the mux to low. */
 	if (gpio) {
-		/*
-		 * Cable signal integrity means we should run the bus
-		 * slightly slower. Do not override if a kernel param
-		 * has already overridden.
-		 */
-		if (aspeed_fsi_divisor == FSI_DIVISOR_DEFAULT)
-			aspeed_fsi_divisor = FSI_DIVISOR_CABLED;
-
 		gpiod_direction_output(mux_gpio, 0);
 		dev_info(dev, "FSI configured for external cable\n");
 	} else {
@@ -544,9 +460,10 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
 	const struct fsi_master_aspeed_data *md = of_device_get_match_data(&pdev->dev);
 	u32 opb_retry_counter = md ? md->opb_retry_counter : OPB_RETRY_COUNTER_AST2600;
+	struct regmap_config aspeed_master_regmap_config;
 	struct fsi_master_aspeed *aspeed;
-	int rc, links, reg;
-	__be32 raw;
+	unsigned int reg;
+	int rc, links;
 
 	rc = tacoma_cabled_fsi_fixup(&pdev->dev);
 	if (rc) {
@@ -606,13 +523,20 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	 */
 	writel(0x1, aspeed->base + OPB0_SELECT);
 
-	rc = opb_readl(aspeed, ctrl_base + FSI_MVER, &raw);
+	fsi_master_regmap_config(&aspeed_master_regmap_config);
+	aspeed->master.map = regmap_init(&pdev->dev, &regmap_aspeed_opb, aspeed,
+					 &aspeed_master_regmap_config);
+	if (IS_ERR(aspeed->master.map)) {
+		rc = PTR_ERR(aspeed->master.map);
+		goto err_release;
+	}
+
+	rc = regmap_read(aspeed->master.map, FSI_MVER, &reg);
 	if (rc) {
 		dev_err(&pdev->dev, "failed to read hub version\n");
-		goto err_release;
+		goto err_regmap;
 	}
 
-	reg = be32_to_cpu(raw);
 	links = (reg >> 8) & 0xff;
 	dev_info(&pdev->dev, "hub version %08x (%d links)\n", reg, links);
 
@@ -621,20 +545,22 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	aspeed->master.dev.of_node = of_node_get(dev_of_node(&pdev->dev));
 
 	aspeed->master.n_links = links;
+	aspeed->master.flags = FSI_MASTER_FLAG_RELA;
 	aspeed->master.read = aspeed_master_read;
 	aspeed->master.write = aspeed_master_write;
 	aspeed->master.send_break = aspeed_master_break;
 	aspeed->master.term = aspeed_master_term;
-	aspeed->master.link_enable = aspeed_master_link_enable;
 
 	dev_set_drvdata(&pdev->dev, aspeed);
 
 	mutex_init(&aspeed->lock);
-	aspeed_master_init(aspeed);
+	rc = fsi_master_init(&aspeed->master, clk_get_rate(aspeed->clk));
+	if (rc)
+		goto err_regmap;
 
 	rc = fsi_master_register(&aspeed->master);
 	if (rc)
-		goto err_release;
+		goto err_regmap;
 
 	/* At this point, fsi_master_register performs the device_initialize(),
 	 * and holds the sole reference on master.dev. This means the device
@@ -646,6 +572,8 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	get_device(&aspeed->master.dev);
 	return 0;
 
+err_regmap:
+	regmap_exit(aspeed->master.map);
 err_release:
 	clk_disable_unprepare(aspeed->clk);
 err_free_aspeed:
-- 
2.39.3


