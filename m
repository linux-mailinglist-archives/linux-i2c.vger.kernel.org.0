Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E05A1664B5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2020 18:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728932AbgBTR0K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Feb 2020 12:26:10 -0500
Received: from sauhun.de ([88.99.104.3]:35158 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728856AbgBTRZ4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Feb 2020 12:25:56 -0500
Received: from localhost (p5486CC48.dip0.t-ipconnect.de [84.134.204.72])
        by pokefinder.org (Postfix) with ESMTPSA id 4E2892C1EC1;
        Thu, 20 Feb 2020 18:25:53 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 5/7] i2c: of: error message unification
Date:   Thu, 20 Feb 2020 18:24:01 +0100
Message-Id: <20200220172403.26062-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

- don't prefix the device if %pOF is provided. That information is
  enough.
- move the prefix to pr_fmt
- change prefix from "of_i2c" to "i2c_of" because the code was moved
  out of the of-domain long ago

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-of.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 710704cd583e..74b9f3fbb5ef 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -8,6 +8,8 @@
  * Copyright (C) 2013, 2018 Wolfram Sang <wsa@the-dreams.de>
  */
 
+#define pr_fmt(fmt) "i2c_of: " fmt
+
 #include <dt-bindings/i2c/i2c.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -28,7 +30,7 @@ int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
 
 	ret = of_property_read_u32(node, "reg", &addr);
 	if (ret) {
-		pr_err("of_i2c: invalid reg on %pOF\n", node);
+		pr_err("invalid reg on %pOF\n", node);
 		return ret;
 	}
 
@@ -66,7 +68,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 	struct i2c_board_info info;
 	int ret;
 
-	dev_dbg(&adap->dev, "of_i2c: register %pOF\n", node);
+	pr_debug("register %pOF\n", node);
 
 	ret = of_i2c_get_board_info(node, &info);
 	if (ret)
@@ -74,7 +76,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 
 	client = i2c_new_client_device(adap, &info);
 	if (IS_ERR(client))
-		dev_err(&adap->dev, "of_i2c: Failure registering %pOF\n", node);
+		pr_err("failure registering %pOF\n", node);
 
 	return client;
 }
@@ -88,7 +90,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 	if (!adap->dev.of_node)
 		return;
 
-	dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
+	dev_dbg(&adap->dev, "walking child nodes\n");
 
 	bus = of_get_child_by_name(adap->dev.of_node, "i2c-bus");
 	if (!bus)
@@ -100,9 +102,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 
 		client = of_i2c_register_device(adap, node);
 		if (IS_ERR(client)) {
-			dev_err(&adap->dev,
-				 "Failed to create I2C device for %pOF\n",
-				 node);
+			pr_err("failed to create I2C device for %pOF\n", node);
 			of_node_clear_flag(node, OF_POPULATED);
 		}
 	}
@@ -243,8 +243,7 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 
 		client = of_i2c_register_device(adap, rd->dn);
 		if (IS_ERR(client)) {
-			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
-				 rd->dn);
+			pr_err("failed to create client for '%pOF'\n", rd->dn);
 			put_device(&adap->dev);
 			of_node_clear_flag(rd->dn, OF_POPULATED);
 			return notifier_from_errno(PTR_ERR(client));
-- 
2.20.1

