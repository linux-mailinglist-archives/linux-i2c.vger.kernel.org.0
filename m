Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB4E173E0E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2020 18:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgB1RMe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Feb 2020 12:12:34 -0500
Received: from sauhun.de ([88.99.104.3]:60038 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726890AbgB1RMd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Feb 2020 12:12:33 -0500
Received: from localhost (p54B3301B.dip0.t-ipconnect.de [84.179.48.27])
        by pokefinder.org (Postfix) with ESMTPSA id 86A6F2C1F3E;
        Fri, 28 Feb 2020 18:12:31 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Robert Richter <rrichter@marvell.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/2] i2c: convert SMBus alert setup function to return an ERRPTR
Date:   Fri, 28 Feb 2020 18:12:20 +0100
Message-Id: <20200228171221.5412-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228171221.5412-1-wsa+renesas@sang-engineering.com>
References: <20200228171221.5412-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Only few drivers use this call, so drivers and I2C core are converted at
once with this patch. By simply using i2c_new_client_device() instead of
i2c_new_device(), we easily can return an ERRPTR for this function as
well. To make out of tree users aware that something changed, the
function is renamed to i2c_new_smbus_alert_device().

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/smbus-protocol.rst     |  2 +-
 drivers/i2c/busses/i2c-parport.c         | 12 ++++++++----
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 11 ++++++++---
 drivers/i2c/busses/i2c-xlp9xx.c          | 10 +++++++---
 drivers/i2c/i2c-core-smbus.c             | 21 ++++++++-------------
 drivers/i2c/i2c-smbus.c                  |  2 +-
 include/linux/i2c-smbus.h                |  4 ++--
 7 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index c122ed239f7f..c2e29633071e 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -274,7 +274,7 @@ to know which slave triggered the interrupt.
 This is implemented the following way in the Linux kernel:
 
 * I2C bus drivers which support SMBus alert should call
-  i2c_setup_smbus_alert() to setup SMBus alert support.
+  i2c_new_smbus_alert_device() to install SMBus alert support.
 * I2C drivers for devices which can trigger SMBus alerts should implement
   the optional alert() callback.
 
diff --git a/drivers/i2c/busses/i2c-parport.c b/drivers/i2c/busses/i2c-parport.c
index 81eb441b2387..a535889acca6 100644
--- a/drivers/i2c/busses/i2c-parport.c
+++ b/drivers/i2c/busses/i2c-parport.c
@@ -333,13 +333,17 @@ static void i2c_parport_attach(struct parport *port)
 
 	/* Setup SMBus alert if supported */
 	if (adapter_parm[type].smbus_alert) {
-		adapter->ara = i2c_setup_smbus_alert(&adapter->adapter,
-						     &adapter->alert_data);
-		if (adapter->ara)
+		struct i2c_client *ara;
+
+		ara = i2c_new_smbus_alert_device(&adapter->adapter,
+						 &adapter->alert_data);
+		if (!IS_ERR(ara)) {
+			adapter->ara = ara;
 			parport_enable_irq(port);
-		else
+		} else {
 			dev_warn(&adapter->pdev->dev,
 				 "Failed to register ARA client\n");
+		}
 	}
 
 	/* Add the new adapter to the list */
diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 19f8eec38717..7d3b9d66ad36 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -118,6 +118,8 @@ static void thunder_i2c_clock_disable(struct device *dev, struct clk *clk)
 static int thunder_i2c_smbus_setup_of(struct octeon_i2c *i2c,
 				      struct device_node *node)
 {
+	struct i2c_client *ara;
+
 	if (!node)
 		return -EINVAL;
 
@@ -125,9 +127,12 @@ static int thunder_i2c_smbus_setup_of(struct octeon_i2c *i2c,
 	if (!i2c->alert_data.irq)
 		return -EINVAL;
 
-	i2c->ara = i2c_setup_smbus_alert(&i2c->adap, &i2c->alert_data);
-	if (!i2c->ara)
-		return -ENODEV;
+	ara = i2c_new_smbus_alert_device(&i2c->adap, &i2c->alert_data);
+	if (IS_ERR(ara))
+		return PTR_ERR(ara);
+
+	i2c->ara = ara;
+
 	return 0;
 }
 
diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
index 8a873975cf12..823945bc3249 100644
--- a/drivers/i2c/busses/i2c-xlp9xx.c
+++ b/drivers/i2c/busses/i2c-xlp9xx.c
@@ -491,12 +491,16 @@ static int xlp9xx_i2c_get_frequency(struct platform_device *pdev,
 static int xlp9xx_i2c_smbus_setup(struct xlp9xx_i2c_dev *priv,
 				  struct platform_device *pdev)
 {
+	struct i2c_client *ara;
+
 	if (!priv->alert_data.irq)
 		return -EINVAL;
 
-	priv->ara = i2c_setup_smbus_alert(&priv->adapter, &priv->alert_data);
-	if (!priv->ara)
-		return -ENODEV;
+	ara = i2c_new_smbus_alert_device(&priv->adapter, &priv->alert_data);
+	if (IS_ERR(ara))
+		return PTR_ERR(ara);
+
+	priv->ara = ara;
 
 	return 0;
 }
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 3ac426a8ab5a..fd2b961f113e 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -666,7 +666,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
 EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data_or_emulated);
 
 /**
- * i2c_setup_smbus_alert - Setup SMBus alert support
+ * i2c_new_smbus_alert_device - get ara client for SMBus alert support
  * @adapter: the target adapter
  * @setup: setup data for the SMBus alert handler
  * Context: can sleep
@@ -682,25 +682,24 @@ EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data_or_emulated);
  * should have said it's level triggered.
  *
  * This returns the ara client, which should be saved for later use with
- * i2c_handle_smbus_alert() and ultimately i2c_unregister_device(); or NULL
- * to indicate an error.
+ * i2c_handle_smbus_alert() and ultimately i2c_unregister_device(); or an
+ * ERRPTR to indicate an error.
  */
-struct i2c_client *i2c_setup_smbus_alert(struct i2c_adapter *adapter,
-					 struct i2c_smbus_alert_setup *setup)
+struct i2c_client *i2c_new_smbus_alert_device(struct i2c_adapter *adapter,
+					      struct i2c_smbus_alert_setup *setup)
 {
 	struct i2c_board_info ara_board_info = {
 		I2C_BOARD_INFO("smbus_alert", 0x0c),
 		.platform_data = setup,
 	};
 
-	return i2c_new_device(adapter, &ara_board_info);
+	return i2c_new_client_device(adapter, &ara_board_info);
 }
-EXPORT_SYMBOL_GPL(i2c_setup_smbus_alert);
+EXPORT_SYMBOL_GPL(i2c_new_smbus_alert_device);
 
 #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_OF)
 int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 {
-	struct i2c_client *client;
 	int irq;
 
 	irq = of_property_match_string(adapter->dev.of_node, "interrupt-names",
@@ -710,11 +709,7 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 	else if (irq < 0)
 		return irq;
 
-	client = i2c_setup_smbus_alert(adapter, NULL);
-	if (!client)
-		return -ENODEV;
-
-	return 0;
+	return PTR_ERR_OR_ZERO(i2c_new_smbus_alert_device(adapter, NULL));
 }
 EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
 #endif
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 7e2f5d0eacdb..809bcf8387d0 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -184,7 +184,7 @@ static struct i2c_driver smbalert_driver = {
  * corresponding I2C device driver's alert function.
  *
  * It is assumed that ara is a valid i2c client previously returned by
- * i2c_setup_smbus_alert().
+ * i2c_new_smbus_alert_device().
  */
 int i2c_handle_smbus_alert(struct i2c_client *ara)
 {
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index 585ad6fc3847..802aac0d2010 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -31,8 +31,8 @@ struct i2c_smbus_alert_setup {
 	int			irq;
 };
 
-struct i2c_client *i2c_setup_smbus_alert(struct i2c_adapter *adapter,
-					 struct i2c_smbus_alert_setup *setup);
+struct i2c_client *i2c_new_smbus_alert_device(struct i2c_adapter *adapter,
+					      struct i2c_smbus_alert_setup *setup);
 int i2c_handle_smbus_alert(struct i2c_client *ara);
 
 #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_OF)
-- 
2.20.1

