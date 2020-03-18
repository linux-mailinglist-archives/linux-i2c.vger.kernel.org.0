Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBE9189E83
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Mar 2020 16:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgCRPBL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Mar 2020 11:01:11 -0400
Received: from sauhun.de ([88.99.104.3]:48488 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726726AbgCRPBI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Mar 2020 11:01:08 -0400
Received: from localhost (p54B333FA.dip0.t-ipconnect.de [84.179.51.250])
        by pokefinder.org (Postfix) with ESMTPSA id 960812C2E7F;
        Wed, 18 Mar 2020 16:01:06 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH v2 4/6] i2c: of: error message unification
Date:   Wed, 18 Mar 2020 16:00:57 +0100
Message-Id: <20200318150059.21714-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
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
- drop error string for callers of of_i2c_register_device because it
  already reports enough (thanks to Tang Bin for the report!)

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/i2c-core-of.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 710704cd583e..f2d09ea0d336 100644
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
+		pr_err("failure registering %pOF (%ld)\n", node, PTR_ERR(client));
 
 	return client;
 }
@@ -88,7 +90,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 	if (!adap->dev.of_node)
 		return;
 
-	dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
+	dev_dbg(&adap->dev, "walking child nodes\n");
 
 	bus = of_get_child_by_name(adap->dev.of_node, "i2c-bus");
 	if (!bus)
@@ -99,12 +101,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 			continue;
 
 		client = of_i2c_register_device(adap, node);
-		if (IS_ERR(client)) {
-			dev_err(&adap->dev,
-				 "Failed to create I2C device for %pOF\n",
-				 node);
+		if (IS_ERR(client))
 			of_node_clear_flag(node, OF_POPULATED);
-		}
 	}
 
 	of_node_put(bus);
@@ -243,8 +241,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 
 		client = of_i2c_register_device(adap, rd->dn);
 		if (IS_ERR(client)) {
-			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
-				 rd->dn);
 			put_device(&adap->dev);
 			of_node_clear_flag(rd->dn, OF_POPULATED);
 			return notifier_from_errno(PTR_ERR(client));
-- 
2.20.1

