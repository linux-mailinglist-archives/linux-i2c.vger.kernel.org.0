Return-Path: <linux-i2c+bounces-1795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58354857037
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0EAA283249
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A9814F9C0;
	Thu, 15 Feb 2024 22:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oC0g9rws"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB4514AD09;
	Thu, 15 Feb 2024 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034915; cv=none; b=UpSLGWd6jmuETuFAPDyFJlaYl82CkajzGPj1H4rHbMJ8wqIu7G0zFaaxvgEg+JUpvht4S6JsfjB4GE48JUuD+M9funKTdvwuiYPZpzb0XkoK5+ukgQqZRkDcoCGT9XWbFIo6wKqaqTWTRs/xoByNfUCwjuY04idbjHeAasFWur8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034915; c=relaxed/simple;
	bh=06noxcBj+0w/9K5t6WqaO8FUweWGJp65GITzL1ijo5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C7JRisTjMgM8V2lfzlT4mV0WLwyro8Z4tFejei160HTq0boXLflMHPTcl6zdt9Ac9RudXCJno8iNtXzBrODC18CSkJ0lp8eYzMLhPqQo5oe5dftup2gm2WhHwHuSNSi4qtTkaai4Odt6m850nb5/CmziNawnZMO3Hz7xDbs1GKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oC0g9rws; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FKOjUR002615;
	Thu, 15 Feb 2024 22:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Wt8UWHHJz1+fM4oAB+F4OGgkDBnjm6htdEah2gI4GTI=;
 b=oC0g9rwsdqskmLoHwJx+0YT9SgwiUPsVDzhidXY8JRRBRP8zp9I67nnr1vzjVetyeO0L
 rcDhtyRDqXhQJyRq/WMrncm5hTXxqbOmjlcTtMrGvqPfEk92sl8AVjbZ73YVEHLpXZ0D
 W0cVghZUP4lYpA4O9okmgP+LPhkExcxmpQWG5cb/jzlBiwThw8ToJKw96txWK1iIjgMn
 kFUaP76npTnpHN28Cge/VjP5wtDxTNZ9MSft504KJBqr/uNerb6xemP0juNgzDcFvkC1
 PMFhgcNV4lToDOcYiH+Jv6HBNpZ1+6pXq/mq+DywaCtFB0apLaVqGtSrL3xUTZzbmXx+ vQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9q8n597q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:10 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJAQbI032596;
	Thu, 15 Feb 2024 22:08:09 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kftyudx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:09 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM87v914025408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:09 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5114058071;
	Thu, 15 Feb 2024 22:08:07 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F165E58089;
	Thu, 15 Feb 2024 22:08:06 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:06 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 15/33] fsi: aspeed: Use common initialization and link enable
Date: Thu, 15 Feb 2024 16:07:41 -0600
Message-Id: <20240215220759.976998-16-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: PpaRy4Hms_6nZR2-KaVSngRSZgIV4Kzk
X-Proofpoint-ORIG-GUID: PpaRy4Hms_6nZR2-KaVSngRSZgIV4Kzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

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


