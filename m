Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA18665981
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jan 2023 11:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbjAKKyt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Jan 2023 05:54:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238580AbjAKKy2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Jan 2023 05:54:28 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7971B25CA;
        Wed, 11 Jan 2023 02:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:From:Reply-To:To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MQ2ghpLC5zmtsvhTVCnhSJVV6WMWnEgCHSlrYs5/Fjg=; b=O+5RlKj5TnL8MGdaJm9c9j9Gsa
        hcVUgWIKdVLBtc+uVrPnaVGAd3CAhitU9njxGRiAvL4442WRxWBmUxCYuftxinIkDDA8Dl9UrZT28
        F7jGKMvnvAgcbWGrPqCfi+uKy4V4HsSHqgr8TDy8wWDj8Br+ASeGWLWpxGBF3oF7AiOOXy8aLBcWz
        ZgzTsaBXe2lSbwgUpysIRGftya+OtGeaLBpdT1Kajh+gwpJSsP1UoT6O7tpom/QO1GTokYGQD/f3w
        6zfo0GFmjiGzC1YSvuQ1GrpZFgB2xZwUkxp4xbQuiawEicAw369RVhn4IEv0DAm2BOx7Aa4iMjGNC
        3zsfqYDg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47744 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1pFYkQ-00052p-UN; Wed, 11 Jan 2023 10:54:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1pFYkP-005uWJ-S0; Wed, 11 Jan 2023 10:54:21 +0000
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH] i2c: add fwnode APIs
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1pFYkP-005uWJ-S0@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Wed, 11 Jan 2023 10:54:21 +0000
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add fwnode APIs for finding and getting I2C adapters, which will be
used by the SFP code. These are passed the fwnode corresponding to
the adapter, and return the I2C adapter. It is the responsibility of
the caller to find the appropriate fwnode.

We keep the DT and ACPI interfaces, but where appropriate, recode them
to use the fwnode interfaces internally.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Wolfram,

Please provide an immutable branch for net-next to pull. I assume
that as we're doing this, we may as well merge the SFP changes via
net-next rather than the i2c tree. If you would still like the SFP
changes as well, I can re-send as a two patch series.

Thanks.

Changes since RFC v2:
- Move device tree veneers into i2c.h as inline functions.

 drivers/i2c/i2c-core-acpi.c | 13 +----
 drivers/i2c/i2c-core-base.c | 98 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/i2c-core-of.c   | 66 -------------------------
 include/linux/i2c.h         | 24 +++++++--
 4 files changed, 120 insertions(+), 81 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 4dd777cc0c89..d6037a328669 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -442,18 +442,7 @@ EXPORT_SYMBOL_GPL(i2c_acpi_find_adapter_by_handle);
 
 static struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
 {
-	struct device *dev;
-	struct i2c_client *client;
-
-	dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
-	if (!dev)
-		return NULL;
-
-	client = i2c_verify_client(dev);
-	if (!client)
-		put_device(dev);
-
-	return client;
+	return i2c_find_device_by_fwnode(acpi_fwnode_handle(adev));
 }
 
 static int i2c_acpi_notify(struct notifier_block *nb, unsigned long value,
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7539b0740351..c9eb34f2342c 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1012,6 +1012,35 @@ void i2c_unregister_device(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(i2c_unregister_device);
 
+/**
+ * i2c_find_device_by_fwnode() - find an i2c_client for the fwnode
+ * @fwnode: &struct fwnode_handle corresponding to the &struct i2c_client
+ *
+ * Look up and return the &struct i2c_client corresponding to the @fwnode.
+ * If no client can be found, or @fwnode is NULL, this returns NULL.
+ *
+ * The user must call put_device(&client->dev) once done with the i2c client.
+ */
+struct i2c_client *i2c_find_device_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct i2c_client *client;
+	struct device *dev;
+
+	if (!fwnode)
+		return NULL;
+
+	dev = bus_find_device_by_fwnode(&i2c_bus_type, fwnode);
+	if (!dev)
+		return NULL;
+
+	client = i2c_verify_client(dev);
+	if (!client)
+		put_device(dev);
+
+	return client;
+}
+EXPORT_SYMBOL(i2c_find_device_by_fwnode);
+
 
 static const struct i2c_device_id dummy_id[] = {
 	{ "dummy", 0 },
@@ -1762,6 +1791,75 @@ int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter)
 }
 EXPORT_SYMBOL_GPL(devm_i2c_add_adapter);
 
+static int i2c_dev_or_parent_fwnode_match(struct device *dev, const void *data)
+{
+	if (dev_fwnode(dev) == data)
+		return 1;
+
+	if (dev->parent && dev_fwnode(dev->parent) == data)
+		return 1;
+
+	return 0;
+}
+
+/**
+ * i2c_find_adapter_by_fwnode() - find an i2c_adapter for the fwnode
+ * @fwnode: &struct fwnode_handle corresponding to the &struct i2c_adapter
+ *
+ * Look up and return the &struct i2c_adapter corresponding to the @fwnode.
+ * If no adapter can be found, or @fwnode is NULL, this returns NULL.
+ *
+ * The user must call put_device(&adapter->dev) once done with the i2c adapter.
+ */
+struct i2c_adapter *i2c_find_adapter_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct i2c_adapter *adapter;
+	struct device *dev;
+
+	if (!fwnode)
+		return NULL;
+
+	dev = bus_find_device(&i2c_bus_type, NULL, fwnode,
+			      i2c_dev_or_parent_fwnode_match);
+	if (!dev)
+		return NULL;
+
+	adapter = i2c_verify_adapter(dev);
+	if (!adapter)
+		put_device(dev);
+
+	return adapter;
+}
+EXPORT_SYMBOL(i2c_find_adapter_by_fwnode);
+
+/**
+ * i2c_get_adapter_by_fwnode() - find an i2c_adapter for the fwnode
+ * @fwnode: &struct fwnode_handle corresponding to the &struct i2c_adapter
+ *
+ * Look up and return the &struct i2c_adapter corresponding to the @fwnode,
+ * and increment the adapter module's use count. If no adapter can be found,
+ * or @fwnode is NULL, this returns NULL.
+ *
+ * The user must call i2c_put_adapter(adapter) once done with the i2c adapter.
+ * Note that this is different from i2c_find_adapter_by_node().
+ */
+struct i2c_adapter *i2c_get_adapter_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct i2c_adapter *adapter;
+
+	adapter = i2c_find_adapter_by_fwnode(fwnode);
+	if (!adapter)
+		return NULL;
+
+	if (!try_module_get(adapter->owner)) {
+		put_device(&adapter->dev);
+		adapter = NULL;
+	}
+
+	return adapter;
+}
+EXPORT_SYMBOL(i2c_get_adapter_by_fwnode);
+
 static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
 			    u32 def_val, bool use_def)
 {
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 3ed74aa4b44b..bce6b796e04c 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -113,72 +113,6 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 	of_node_put(bus);
 }
 
-static int of_dev_or_parent_node_match(struct device *dev, const void *data)
-{
-	if (dev->of_node == data)
-		return 1;
-
-	if (dev->parent)
-		return dev->parent->of_node == data;
-
-	return 0;
-}
-
-/* must call put_device() when done with returned i2c_client device */
-struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
-{
-	struct device *dev;
-	struct i2c_client *client;
-
-	dev = bus_find_device_by_of_node(&i2c_bus_type, node);
-	if (!dev)
-		return NULL;
-
-	client = i2c_verify_client(dev);
-	if (!client)
-		put_device(dev);
-
-	return client;
-}
-EXPORT_SYMBOL(of_find_i2c_device_by_node);
-
-/* must call put_device() when done with returned i2c_adapter device */
-struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
-{
-	struct device *dev;
-	struct i2c_adapter *adapter;
-
-	dev = bus_find_device(&i2c_bus_type, NULL, node,
-			      of_dev_or_parent_node_match);
-	if (!dev)
-		return NULL;
-
-	adapter = i2c_verify_adapter(dev);
-	if (!adapter)
-		put_device(dev);
-
-	return adapter;
-}
-EXPORT_SYMBOL(of_find_i2c_adapter_by_node);
-
-/* must call i2c_put_adapter() when done with returned i2c_adapter device */
-struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node *node)
-{
-	struct i2c_adapter *adapter;
-
-	adapter = of_find_i2c_adapter_by_node(node);
-	if (!adapter)
-		return NULL;
-
-	if (!try_module_get(adapter->owner)) {
-		put_device(&adapter->dev);
-		adapter = NULL;
-	}
-
-	return adapter;
-}
-EXPORT_SYMBOL(of_get_i2c_adapter_by_node);
-
 static const struct of_device_id*
 i2c_of_match_device_sysfs(const struct of_device_id *matches,
 				  struct i2c_client *client)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index f7c49bbdb8a1..cfc59c3371cb 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -964,15 +964,33 @@ int i2c_handle_smbus_host_notify(struct i2c_adapter *adap, unsigned short addr);
 
 #endif /* I2C */
 
+/* must call put_device() when done with returned i2c_client device */
+struct i2c_client *i2c_find_device_by_fwnode(struct fwnode_handle *fwnode);
+
+/* must call put_device() when done with returned i2c_adapter device */
+struct i2c_adapter *i2c_find_adapter_by_fwnode(struct fwnode_handle *fwnode);
+
+/* must call i2c_put_adapter() when done with returned i2c_adapter device */
+struct i2c_adapter *i2c_get_adapter_by_fwnode(struct fwnode_handle *fwnode);
+
 #if IS_ENABLED(CONFIG_OF)
 /* must call put_device() when done with returned i2c_client device */
-struct i2c_client *of_find_i2c_device_by_node(struct device_node *node);
+static inline struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
+{
+	return i2c_find_device_by_fwnode(of_fwnode_handle(node));
+}
 
 /* must call put_device() when done with returned i2c_adapter device */
-struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node);
+static inline struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
+{
+	return i2c_find_adapter_by_fwnode(of_fwnode_handle(node));
+}
 
 /* must call i2c_put_adapter() when done with returned i2c_adapter device */
-struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node *node);
+static inline struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node *node)
+{
+	return i2c_get_adapter_by_fwnode(of_fwnode_handle(node));
+}
 
 const struct of_device_id
 *i2c_of_match_device(const struct of_device_id *matches,
-- 
2.30.2

