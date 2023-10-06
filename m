Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B76827BC24F
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Oct 2023 00:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbjJFWoz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 18:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233825AbjJFWoy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 18:44:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BDDFA;
        Fri,  6 Oct 2023 15:44:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84B6C433C8;
        Fri,  6 Oct 2023 22:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696632292;
        bh=jjDB+XxqgQWiiig+d8iWQegK4BdmQYMDUpf29huX4GI=;
        h=From:To:Cc:Subject:Date:From;
        b=qRFo1vXaPt7JYkc9Fi7mtlDFJuRpCFy55IvyjZQpGXESsPOsd+YQ3JSRd7t3HgLeS
         W8PuO7BybiipeveeFgjvfdUpSoPPBcddhnxmUpcihSFvF9Dm/KM5vPB1oVChEBKBJo
         u55YV7ofvjX5BvssgjflrAv3RBCB1NJlhSpks6Jf5NdgGEdWxKdAJyEnGvC/cyl9UN
         afG1yhSfmKFrUOO4K7S/fvXVOssjQWDPTobqXWjaMuu0h1009LR7WhoFiYK6kt+wpa
         NijyGdrzRyBk/FRsGch46lbZqJYy1P+CCnZglL2JTu2Du4arskXzgsN5DvlrhAL2ys
         2IkVbogDb35tQ==
Received: (nullmailer pid 443100 invoked by uid 1000);
        Fri, 06 Oct 2023 22:44:49 -0000
From:   Rob Herring <robh@kernel.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] i2c: Use device_get_match_data()
Date:   Fri,  6 Oct 2023 17:44:46 -0500
Message-Id: <20231006224446.443015-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 11 +++++------
 drivers/i2c/busses/i2c-omap.c    |  8 +++-----
 drivers/i2c/busses/i2c-pxa.c     |  7 +++----
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index fd8403b07fa6..dc160cbc3155 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -19,11 +19,10 @@
 #include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/delay.h>
@@ -859,7 +858,7 @@ static int
 mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
 		  struct device *dev)
 {
-	const struct of_device_id *device;
+	const struct mv64xxx_i2c_regs *data;
 	struct device_node *np = dev->of_node;
 	u32 bus_freq, tclk;
 	int rc = 0;
@@ -897,11 +896,11 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
 	 */
 	drv_data->adapter.timeout = HZ;
 
-	device = of_match_device(mv64xxx_i2c_of_match_table, dev);
-	if (!device)
+	data = device_get_match_data(dev);
+	if (!data)
 		return -ENODEV;
 
-	memcpy(&drv_data->reg_offsets, device->data, sizeof(drv_data->reg_offsets));
+	memcpy(&drv_data->reg_offsets, data, sizeof(drv_data->reg_offsets));
 
 	/*
 	 * For controllers embedded in new SoCs activate the
diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 58fd6fa3edf1..42165ef57946 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -25,11 +25,11 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/platform_data/i2c-omap.h>
 #include <linux/pm_runtime.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/property.h>
 
 /* I2C controller revisions */
 #define OMAP_I2C_OMAP1_REV_2		0x20
@@ -1358,7 +1358,6 @@ omap_i2c_probe(struct platform_device *pdev)
 	const struct omap_i2c_bus_platform_data *pdata =
 		dev_get_platdata(&pdev->dev);
 	struct device_node	*node = pdev->dev.of_node;
-	const struct of_device_id *match;
 	int irq;
 	int r;
 	u32 rev;
@@ -1376,11 +1375,10 @@ omap_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(omap->base))
 		return PTR_ERR(omap->base);
 
-	match = of_match_device(of_match_ptr(omap_i2c_of_match), &pdev->dev);
-	if (match) {
+	if (pdev->dev.of_node) {
 		u32 freq = I2C_MAX_STANDARD_MODE_FREQ;
 
-		pdata = match->data;
+		pdata = device_get_match_data(&pdev->dev);
 		omap->flags = pdata->flags;
 
 		of_property_read_u32(node, "clock-frequency", &freq);
diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 29be05af826b..1d7648242749 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -32,6 +32,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/i2c-pxa.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 /* I2C register field definitions */
@@ -1252,10 +1253,8 @@ static int i2c_pxa_probe_dt(struct platform_device *pdev, struct pxa_i2c *i2c,
 			    enum pxa_i2c_types *i2c_types)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *of_id =
-			of_match_device(i2c_pxa_dt_ids, &pdev->dev);
 
-	if (!of_id)
+	if (!pdev->dev.of_node)
 		return 1;
 
 	/* For device tree we always use the dynamic or alias-assigned ID */
@@ -1264,7 +1263,7 @@ static int i2c_pxa_probe_dt(struct platform_device *pdev, struct pxa_i2c *i2c,
 	i2c->use_pio = of_property_read_bool(np, "mrvl,i2c-polling");
 	i2c->fast_mode = of_property_read_bool(np, "mrvl,i2c-fast-mode");
 
-	*i2c_types = (enum pxa_i2c_types)(of_id->data);
+	*i2c_types = (enum pxa_i2c_types)device_get_match_data(&pdev->dev);
 
 	return 0;
 }
-- 
2.40.1

