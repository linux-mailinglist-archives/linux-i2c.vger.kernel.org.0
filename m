Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 500DE4E4F23
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 10:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243266AbiCWJWJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 05:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243155AbiCWJVe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 05:21:34 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8D276299;
        Wed, 23 Mar 2022 02:20:04 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 23D70E0013;
        Wed, 23 Mar 2022 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648027203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IdtHSEns/kbR1RODo7rJJZ+DXlhGmh7K4+UmBU92PnA=;
        b=dP3l4sbb5I/4rhP4pmiry0rI0zvRAFSE9BB/4exbOI4ydLrMXFPSqZ9yLgeZ/qvb2l78s2
        c3hOTz+MzcoNmgchICpwDzLDM2fNa50W3fOzIswf2B3oEO2w20HqxzP5+qCMXQDE6iINsv
        uyafRd5EV8FcFgYb9e1EkR3oc9DdZ4nnsqJKQ260AnbH2BO/dB1uWv1GaMuaob+qtx6PPh
        xezo3mq5MHViShOblF8BHCU1nVKqs/AfG64Q//U5zbJoh/ppyKPfIEaXZXZMayEBwmjzVz
        l1Yfuf9x/V4eeCn0lhGOEwlQw5SI50X79y4WqqaEE3ZUjlzdwo2b8iH9SlMJlA==
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
        linux-i2c@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Subject: [PATCH v2 6/7] i2c: mux: pinctrl: remove CONFIG_OF dependency and use fwnode API
Date:   Wed, 23 Mar 2022 10:18:09 +0100
Message-Id: <20220323091810.329217-7-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323091810.329217-1-clement.leger@bootlin.com>
References: <20220323091810.329217-1-clement.leger@bootlin.com>
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

In order to use i2c muxes with all types of nodes, switch to fwnode
API. The fwnode layer will allow to use this with both device_node and
software_node.

This commits is simply replacing the use of "of_" prefixed functions
with there fwnode equivalent.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/i2c/muxes/Kconfig           |  1 -
 drivers/i2c/muxes/i2c-mux-pinctrl.c | 23 ++++++++++++-----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index 1708b1a82da2..d9cb15cfba3e 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -77,7 +77,6 @@ config I2C_MUX_PCA954x
 config I2C_MUX_PINCTRL
 	tristate "pinctrl-based I2C multiplexer"
 	depends on PINCTRL
-	depends on OF || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for an I2C
 	  multiplexer that uses the pinctrl subsystem, i.e. pin multiplexing.
diff --git a/drivers/i2c/muxes/i2c-mux-pinctrl.c b/drivers/i2c/muxes/i2c-mux-pinctrl.c
index f1bb00a11ad6..d9c0241e8790 100644
--- a/drivers/i2c/muxes/i2c-mux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-mux-pinctrl.c
@@ -53,19 +53,20 @@ static struct i2c_adapter *i2c_mux_pinctrl_root_adapter(
 
 static struct i2c_adapter *i2c_mux_pinctrl_parent_adapter(struct device *dev)
 {
-	struct device_node *np = dev->of_node;
-	struct device_node *parent_np;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct fwnode_handle *parent_fwnode;
 	struct i2c_adapter *parent;
 
-	parent_np = of_parse_phandle(np, "i2c-parent", 0);
-	if (!parent_np) {
+	parent_fwnode = fwnode_find_reference(fwnode, "i2c-parent", 0);
+	if (!parent_fwnode) {
 		dev_err(dev, "Cannot parse i2c-parent\n");
 		return ERR_PTR(-ENODEV);
 	}
-	parent = of_find_i2c_adapter_by_node(parent_np);
-	of_node_put(parent_np);
-	if (!parent)
+	parent = fwnode_find_i2c_adapter_by_node(parent_fwnode);
+	if (!parent) {
+		dev_err(dev, "Cannot find i2c-parent\n");
 		return ERR_PTR(-EPROBE_DEFER);
+	}
 
 	return parent;
 }
@@ -73,7 +74,7 @@ static struct i2c_adapter *i2c_mux_pinctrl_parent_adapter(struct device *dev)
 static int i2c_mux_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct i2c_mux_core *muxc;
 	struct i2c_mux_pinctrl *mux;
 	struct i2c_adapter *parent;
@@ -81,7 +82,7 @@ static int i2c_mux_pinctrl_probe(struct platform_device *pdev)
 	int num_names, i, ret;
 	const char *name;
 
-	num_names = of_property_count_strings(np, "pinctrl-names");
+	num_names = fwnode_property_string_array_count(fwnode, "pinctrl-names");
 	if (num_names < 0) {
 		dev_err(dev, "Cannot parse pinctrl-names: %d\n",
 			num_names);
@@ -111,8 +112,8 @@ static int i2c_mux_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < num_names; i++) {
-		ret = of_property_read_string_index(np, "pinctrl-names", i,
-						    &name);
+		ret = fwnode_property_read_string_index(fwnode, "pinctrl-names", i,
+							&name);
 		if (ret < 0) {
 			dev_err(dev, "Cannot parse pinctrl-names: %d\n", ret);
 			goto err_put_parent;
-- 
2.34.1

