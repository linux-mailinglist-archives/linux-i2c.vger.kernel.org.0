Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8073915815C
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 18:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgBJR3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 12:29:33 -0500
Received: from sauhun.de ([88.99.104.3]:43988 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727558AbgBJR3c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Feb 2020 12:29:32 -0500
Received: from localhost (p54B33161.dip0.t-ipconnect.de [84.179.49.97])
        by pokefinder.org (Postfix) with ESMTPSA id 809A52C07F4;
        Mon, 10 Feb 2020 18:29:30 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.com>,
        Robert Richter <rrichter@marvell.com>,
        George Cherian <gcherian@marvell.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] i2c: convert SMBus alert setup function to return an ERRPTR
Date:   Mon, 10 Feb 2020 18:29:25 +0100
Message-Id: <20200210172929.6001-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
References: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
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
function is renamed to i2c_install_smbus_alert().

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/smbus-protocol.rst     |  2 +-
 drivers/i2c/busses/i2c-parport.c         | 11 +++++++----
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 11 ++++++++---
 drivers/i2c/busses/i2c-xlp9xx.c          | 10 +++++++---
 drivers/i2c/i2c-core-smbus.c             | 22 +++++++++++-----------
 drivers/i2c/i2c-smbus.c                  |  2 +-
 include/linux/i2c-smbus.h                |  2 +-
 7 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index c122ed239f7f..4783670a0420 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -274,7 +274,7 @@ to know which slave triggered the interrupt.
 This is implemented the following way in the Linux kernel:
 
 * I2C bus drivers which support SMBus alert should call
-  i2c_setup_smbus_alert() to setup SMBus alert support.
+  i2c_install_smbus_alert() to install SMBus alert support.
 * I2C drivers for devices which can trigger SMBus alerts should implement
   the optional alert() callback.
 
diff --git a/drivers/i2c/busses/i2c-parport.c b/drivers/i2c/busses/i2c-parport.c
index 81eb441b2387..1aee13e2d3da 100644
--- a/drivers/i2c/busses/i2c-parport.c
+++ b/drivers/i2c/busses/i2c-parport.c
@@ -333,13 +333,16 @@ static void i2c_parport_attach(struct parport *port)
 
 	/* Setup SMBus alert if supported */
 	if (adapter_parm[type].smbus_alert) {
-		adapter->ara = i2c_setup_smbus_alert(&adapter->adapter,
-						     &adapter->alert_data);
-		if (adapter->ara)
+		struct i2c_client *ara;
+
+		ara = i2c_install_smbus_alert(&adapter->adapter, &adapter->alert_data);
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
index 19f8eec38717..8626a97739e1 100644
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
+	ara = i2c_install_smbus_alert(&i2c->adap, &i2c->alert_data);
+	if (IS_ERR(ara))
+		return PTR_ERR(ara);
+
+	i2c->ara = ara;
+
 	return 0;
 }
 
diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
index 8a873975cf12..3e57723e1194 100644
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
+	ara = i2c_install_smbus_alert(&priv->adapter, &priv->alert_data);
+	if (IS_ERR(ara))
+		return PTR_ERR(ara);
+
+	priv->ara = ara;
 
 	return 0;
 }
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 3ac426a8ab5a..06f2e4d78d3c 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -666,12 +666,12 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
 EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data_or_emulated);
 
 /**
- * i2c_setup_smbus_alert - Setup SMBus alert support
+ * i2c_install_smbus_alert - Install SMBus alert support
  * @adapter: the target adapter
  * @setup: setup data for the SMBus alert handler
  * Context: can sleep
  *
- * Setup handling of the SMBus alert protocol on a given I2C bus segment.
+ * Install handling of the SMBus alert protocol on a given I2C bus segment.
  *
  * Handling can be done either through our IRQ handler, or by the
  * adapter (from its handler, periodic polling, or whatever).
@@ -682,20 +682,20 @@ EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data_or_emulated);
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
+struct i2c_client *i2c_install_smbus_alert(struct i2c_adapter *adapter,
+					   struct i2c_smbus_alert_setup *setup)
 {
 	struct i2c_board_info ara_board_info = {
 		I2C_BOARD_INFO("smbus_alert", 0x0c),
 		.platform_data = setup,
 	};
 
-	return i2c_new_device(adapter, &ara_board_info);
+	return i2c_new_client_device(adapter, &ara_board_info);
 }
-EXPORT_SYMBOL_GPL(i2c_setup_smbus_alert);
+EXPORT_SYMBOL_GPL(i2c_install_smbus_alert);
 
 #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_OF)
 int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
@@ -710,9 +710,9 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 	else if (irq < 0)
 		return irq;
 
-	client = i2c_setup_smbus_alert(adapter, NULL);
-	if (!client)
-		return -ENODEV;
+	client = i2c_install_smbus_alert(adapter, NULL);
+	if (IS_ERR(client))
+		return PTR_ERR(client);
 
 	return 0;
 }
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 7e2f5d0eacdb..174a89d3e415 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -184,7 +184,7 @@ static struct i2c_driver smbalert_driver = {
  * corresponding I2C device driver's alert function.
  *
  * It is assumed that ara is a valid i2c client previously returned by
- * i2c_setup_smbus_alert().
+ * i2c_install_smbus_alert().
  */
 int i2c_handle_smbus_alert(struct i2c_client *ara)
 {
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index 585ad6fc3847..409da1e478d6 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -31,7 +31,7 @@ struct i2c_smbus_alert_setup {
 	int			irq;
 };
 
-struct i2c_client *i2c_setup_smbus_alert(struct i2c_adapter *adapter,
+struct i2c_client *i2c_install_smbus_alert(struct i2c_adapter *adapter,
 					 struct i2c_smbus_alert_setup *setup);
 int i2c_handle_smbus_alert(struct i2c_client *ara);
 
-- 
2.20.1

