Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFEE4E7257
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 12:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357606AbiCYLgZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 07:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357112AbiCYLgA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 07:36:00 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64336D4460;
        Fri, 25 Mar 2022 04:34:20 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5637A20013;
        Fri, 25 Mar 2022 11:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648208058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HUpLm117R6qk/dVKFhWwKw0DOB6khYAmxgji50KW67s=;
        b=Yip7aUAf6QKSRIUfebg75F7lbIEZuHnFlsuQ5u1HR5EQawmloYET9ySHQVEDTlokV2pCPG
        BBeDo3NiHiugqObDF8eZ95WFAo5KF/GHG7AsF0XZC1hVPWxgJLE7AJomQNu9gKR+RNAP9P
        MbAYFDjtSZnTrJJ/abL22Ki1SBehfPJfXvqWtVTPHVnYdc8dz7byYWT/AXPRjmTvn9z4Y7
        chIoIrAI6upZJTfrGjU4ooYk9fQ0pokDLsXu5wNc6VTHyYl89szRg1ap8/YblkHdGs65u2
        zHSDt++i26DnlQYh7Yjbmz7I7iVIf1NMBQQcGWuH73ys75wc5ZEqY1EeYW8Iqg==
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Subject: [PATCH v3 9/9] i2c: mux: add support for fwnode
Date:   Fri, 25 Mar 2022 12:31:48 +0100
Message-Id: <20220325113148.588163-10-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325113148.588163-1-clement.leger@bootlin.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Modify i2c_mux_add_adapter() to use the fwnode API to create mux
adapters with fwnode based devices. This allows to have a node agnostic
support for i2c muxes.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/i2c/i2c-mux.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 774507b54b57..98d735349bd6 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -24,7 +24,7 @@
 #include <linux/i2c-mux.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
@@ -347,38 +347,35 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	else
 		priv->adap.class = class;
 
-	/*
-	 * Try to populate the mux adapter's of_node, expands to
-	 * nothing if !CONFIG_OF.
-	 */
-	if (muxc->dev->of_node) {
-		struct device_node *dev_node = muxc->dev->of_node;
-		struct device_node *mux_node, *child = NULL;
+	/* Try to populate the mux adapter's device node */
+	if (dev_fwnode(muxc->dev) && !has_acpi_companion(muxc->dev)) {
+		struct fwnode_handle *dev_node = dev_fwnode(muxc->dev);
+		struct fwnode_handle *mux_node, *child = NULL;
 		u32 reg;
 
 		if (muxc->arbitrator)
-			mux_node = of_get_child_by_name(dev_node, "i2c-arb");
+			mux_node = fwnode_get_named_child_node(dev_node, "i2c-arb");
 		else if (muxc->gate)
-			mux_node = of_get_child_by_name(dev_node, "i2c-gate");
+			mux_node = fwnode_get_named_child_node(dev_node, "i2c-gate");
 		else
-			mux_node = of_get_child_by_name(dev_node, "i2c-mux");
+			mux_node = fwnode_get_named_child_node(dev_node, "i2c-mux");
 
 		if (mux_node) {
 			/* A "reg" property indicates an old-style DT entry */
-			if (!of_property_read_u32(mux_node, "reg", &reg)) {
-				of_node_put(mux_node);
+			if (!fwnode_property_read_u32(mux_node, "reg", &reg)) {
+				fwnode_handle_put(mux_node);
 				mux_node = NULL;
 			}
 		}
 
 		if (!mux_node)
-			mux_node = of_node_get(dev_node);
+			mux_node = fwnode_handle_get(dev_node);
 		else if (muxc->arbitrator || muxc->gate)
-			child = of_node_get(mux_node);
+			child = fwnode_handle_get(mux_node);
 
 		if (!child) {
-			for_each_child_of_node(mux_node, child) {
-				ret = of_property_read_u32(child, "reg", &reg);
+			fwnode_for_each_child_node(mux_node, child) {
+				ret = fwnode_property_read_u32(child, "reg", &reg);
 				if (ret)
 					continue;
 				if (chan_id == reg)
@@ -386,8 +383,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			}
 		}
 
-		priv->adap.dev.of_node = child;
-		of_node_put(mux_node);
+		device_set_node(&priv->adap.dev, child);
+		fwnode_handle_put(mux_node);
 	}
 
 	/*
@@ -444,7 +441,7 @@ void i2c_mux_del_adapters(struct i2c_mux_core *muxc)
 	while (muxc->num_adapters) {
 		struct i2c_adapter *adap = muxc->adapter[--muxc->num_adapters];
 		struct i2c_mux_priv *priv = adap->algo_data;
-		struct device_node *np = adap->dev.of_node;
+		struct fwnode_handle *fwnode = dev_fwnode(&adap->dev);
 
 		muxc->adapter[muxc->num_adapters] = NULL;
 
@@ -454,7 +451,7 @@ void i2c_mux_del_adapters(struct i2c_mux_core *muxc)
 
 		sysfs_remove_link(&priv->adap.dev.kobj, "mux_device");
 		i2c_del_adapter(adap);
-		of_node_put(np);
+		fwnode_handle_put(fwnode);
 		kfree(priv);
 	}
 }
-- 
2.34.1

