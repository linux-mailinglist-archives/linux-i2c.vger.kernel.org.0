Return-Path: <linux-i2c+bounces-3859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2A8FD8A4
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4981F215FD
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0985F16C69C;
	Wed,  5 Jun 2024 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Btpihl/N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A88163A80;
	Wed,  5 Jun 2024 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622622; cv=none; b=gUNIc3eMHabF4hk44Cz5FJ7Ol4yO4lquAcTHRliK3FJOeQnN6kJXxoHMVN/GumctnZBa5P2dX3ckLJHHAlIdrNt4BdlfrMR/0Ewc/R4WCvq5NW9wKDwo236kXXcwqkhid0r/kIjSnjTIG5R4GYIKierDkOSwHnsGJLQ2mliQa3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622622; c=relaxed/simple;
	bh=AhnSzDLDOWLJZ6wOtscN8EKiHKe2AkmW1DojbzM9uJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lcER1j61whJSYOMnQa2kMG2v4fS0iiORnMY+W28IQvHrW/Uzl2mRPbigw2FynqVkv9s8371J9JBhiWnd8diZpQ++IKglNqbMw2pp7SfOorjjv1cUnM9kMDFjJeyjhAebz359eAVBRMECjjtku6v6z0/Ld4zuAH/B+d3Uzzz0q1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Btpihl/N; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LD6W4013583;
	Wed, 5 Jun 2024 21:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=i2C43nvKw0UyLSXoCA7myzkhI4FP4JjR32/Jp3Q/4S8=;
 b=Btpihl/NvYPKRC/Sx9j0ltMMv+2LkMaXHW2CNOX+DGSpiuwX8AvVg5UD+ywKjNenXw6g
 8Ajagcol0ZGROx92fD7SB1RiTEIk9tD0OKyGGeMly7g6P7uerStxbwevCfYwEEpCpZ6n
 kR1yxXOEl3KnYZyQiJonM9b+BZgJZEhG7Bwitaf+6vR9t4qd9xLcoaQq1inUaKRJiJx3
 ClfaVNe653M90IlXOw1omxsU1ahyDPzHaKkiad5QFw8bKSG08VGSEdvQ9UzqVnbHn26/
 vVjss1aZWxSKIHxPM/SSO5LENkboy5QwWPIpugYNcv1Lk1MbfvJjoPnqzfPM8Acervv3 GA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyqf00rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:22 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455JVcNE031129;
	Wed, 5 Jun 2024 21:23:21 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppntm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:21 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNIv725101028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:20 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 194B258061;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C90C35805F;
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
Subject: [PATCH v4 15/40] fsi: aspeed: Use common initialization and link enable
Date: Wed,  5 Jun 2024 16:22:47 -0500
Message-Id: <20240605212312.349188-16-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 0ICrE9JqL5knykLLl9bEzW0UNobcK2Vk
X-Proofpoint-ORIG-GUID: 0ICrE9JqL5knykLLl9bEzW0UNobcK2Vk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050160

Create a regmap for accessing the master registers over OPB
to use the new common master initialization and link enable procedures.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v2:
 - Add AST2700 direct AHB access of master registers

 drivers/fsi/fsi-master-aspeed.c | 173 +++++++++++++-------------------
 1 file changed, 68 insertions(+), 105 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 3d15e867237df..a67f185bb8814 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -27,6 +27,7 @@ struct fsi_master_aspeed {
 	struct mutex		lock;	/* protect HW access */
 	struct device		*dev;
 	void __iomem		*base;
+	void __iomem		*ctrl;
 	struct clk		*clk;
 	struct gpio_desc	*cfam_reset_gpio;
 };
@@ -95,14 +96,6 @@ static const u32 fsi_base = 0xa0000000;
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
@@ -333,35 +326,6 @@ static int aspeed_master_write(struct fsi_master *master, int link,
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
@@ -389,72 +353,54 @@ static void aspeed_master_release(struct device *dev)
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
+	return opb_writel(context, ctrl_base + reg, cpu_to_be32(val));
+}
 
-	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK);
-	opb_writel(aspeed, ctrl_base + FSI_MRESP0, reg);
+static const struct regmap_bus regmap_aspeed_opb = {
+	.reg_write = regmap_aspeed_opb_write,
+	.reg_read = regmap_aspeed_opb_read,
+};
 
-	opb_readl(aspeed, ctrl_base + FSI_MLEVP0, NULL);
+static int regmap_ast2700_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct fsi_master_aspeed *aspeed = context;
 
-	/* Reset the master bridge */
-	reg = cpu_to_be32(FSI_MRESB_RST_GEN);
-	opb_writel(aspeed, ctrl_base + FSI_MRESB0, reg);
+	*val = readl(aspeed->ctrl + reg);
+	return 0;
+}
 
-	reg = cpu_to_be32(FSI_MRESB_RST_ERR);
-	opb_writel(aspeed, ctrl_base + FSI_MRESB0, reg);
+static int regmap_ast2700_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct fsi_master_aspeed *aspeed = context;
 
+	writel(val, aspeed->ctrl + reg);
 	return 0;
 }
 
+static const struct regmap_bus regmap_ast2700 = {
+	.reg_write = regmap_ast2700_write,
+	.reg_read = regmap_ast2700_read,
+};
+
 static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *attr,
 				const char *buf, size_t count)
 {
@@ -466,7 +412,7 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
 	usleep_range(900, 1000);
 	gpiod_set_value(aspeed->cfam_reset_gpio, 0);
 	usleep_range(900, 1000);
-	opb_writel(aspeed, ctrl_base + FSI_MRESP0, cpu_to_be32(FSI_MRESP_RST_ALL_MASTER));
+	regmap_write(aspeed->master.map, FSI_MRESP0, FSI_MRESP_RST_ALL_MASTER);
 	mutex_unlock(&aspeed->lock);
 	trace_fsi_master_aspeed_cfam_reset(false);
 
@@ -526,14 +472,6 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
 
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
@@ -549,9 +487,13 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
 	const struct fsi_master_aspeed_data *md = of_device_get_match_data(&pdev->dev);
 	u32 opb_retry_counter = md ? md->opb_retry_counter : OPB_RC_DEFAULT;
+	const struct regmap_bus *bus = &regmap_aspeed_opb;
+	struct regmap_config aspeed_master_regmap_config;
 	struct fsi_master_aspeed *aspeed;
-	int rc, links, reg;
-	__be32 raw;
+	u32 opb_ctrl_base = ctrl_base;
+	struct resource *res;
+	unsigned int reg;
+	int rc, links;
 
 	rc = tacoma_cabled_fsi_fixup(&pdev->dev);
 	if (rc) {
@@ -571,6 +513,17 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 		goto err_free_aspeed;
 	}
 
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctrl");
+	if (res) {
+		aspeed->ctrl = devm_ioremap_resource(&pdev->dev, res);
+		if (!IS_ERR(aspeed->ctrl)) {
+			/* Access FSI controller over AHB */
+			opb_ctrl_base = res->start;
+			opb_retry_counter &= ~OPB_RC_CTRL_OPB;
+			bus = &regmap_ast2700;
+		}
+	}
+
 	aspeed->clk = devm_clk_get(aspeed->dev, NULL);
 	if (IS_ERR(aspeed->clk)) {
 		dev_err(aspeed->dev, "couldn't get clock\n");
@@ -594,7 +547,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 
 	writel(opb_retry_counter, aspeed->base + OPB_RETRY_COUNTER);
 
-	writel(ctrl_base, aspeed->base + OPB_CTRL_BASE);
+	writel(opb_ctrl_base, aspeed->base + OPB_CTRL_BASE);
 	writel(fsi_base, aspeed->base + OPB_FSI_BASE);
 
 	/* Set read data order */
@@ -611,13 +564,19 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	 */
 	writel(0x1, aspeed->base + OPB0_SELECT);
 
-	rc = opb_readl(aspeed, ctrl_base + FSI_MVER, &raw);
+	fsi_master_regmap_config(&aspeed_master_regmap_config);
+	aspeed->master.map = regmap_init(&pdev->dev, bus, aspeed, &aspeed_master_regmap_config);
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
 
@@ -626,20 +585,22 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
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
@@ -651,6 +612,8 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	get_device(&aspeed->master.dev);
 	return 0;
 
+err_regmap:
+	regmap_exit(aspeed->master.map);
 err_release:
 	clk_disable_unprepare(aspeed->clk);
 err_free_aspeed:
-- 
2.39.3


