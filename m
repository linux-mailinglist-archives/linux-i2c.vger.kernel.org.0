Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE5BD90352
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 15:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfHPNnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 09:43:02 -0400
Received: from enpas.org ([46.38.239.100]:33716 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727382AbfHPNnB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 09:43:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 458E31006F0;
        Fri, 16 Aug 2019 13:42:58 +0000 (UTC)
From:   Max Staudt <max@enpas.org>
To:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        glaubitz@physik.fu-berlin.de, Max Staudt <max@enpas.org>
Subject: [PATCH v4 3/3] i2c/busses/i2c-icy: Add LTC2990 present on 2019 board revision
Date:   Fri, 16 Aug 2019 15:43:30 +0200
Message-Id: <20190816134330.7727-3-max@enpas.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190816134330.7727-1-max@enpas.org>
References: <20190816134330.7727-1-max@enpas.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since the 2019 a1k.org community re-print of these PCBs sports an
LTC2990 hwmon chip as an example use case, let this driver autoprobe
for that as well. If it is present, modprobing ltc2990 is sufficient.

The property_entry enables the three additional inputs available on
this particular board:

  in1 will be the voltage of the 5V rail, divided by 2.
  in2 will be the voltage of the 12V rail, divided by 4.
  temp3 will be measured using a PCB loop next the chip.

v4: Style
    Added other possible addresses for LTC2990.

v3: Merged with initial LTC2990 support on ICY.
    Moved defaults from platform_data to swnode.
    Added note to Kconfig.

Signed-off-by: Max Staudt <max@enpas.org>
---
 drivers/i2c/busses/Kconfig   |  3 +++
 drivers/i2c/busses/i2c-icy.c | 58 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 9e57e1101..a311d07f3 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1311,6 +1311,9 @@ config I2C_ICY
 	  This support is also available as a module.  If so, the module
 	  will be called i2c-icy.
 
+	  If you have a 2019 edition board with an LTC2990 sensor at address
+	  0x4c, loading the module 'ltc2990' is sufficient to enable it.
+
 config I2C_MLXCPLD
 	tristate "Mellanox I2C driver"
 	depends on X86_64
diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index edac515da..c30431653 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -54,6 +54,8 @@ struct icy_i2c {
 
 	void __iomem *reg_s0;
 	void __iomem *reg_s1;
+	struct fwnode_handle *ltc2990_fwnode;
+	struct i2c_client *ltc2990_client;
 };
 
 
@@ -100,11 +102,35 @@ static void icy_pcf_waitforpin(void *data)
 /*
  * Main i2c-icy part
  */
+static unsigned short const icy_ltc2990_addresses[] = {
+	0x4c, 0x4d, 0x4e, 0x4f, I2C_CLIENT_END
+};
+
+/*
+ * Additional sensors exposed once this property is applied:
+ *
+ * in1 will be the voltage of the 5V rail, divided by 2.
+ * in2 will be the voltage of the 12V rail, divided by 4.
+ * temp3 will be measured using a PCB loop next the chip.
+ */
+static const u32 icy_ltc2990_meas_mode[] = {0, 3};
+
+static const struct property_entry icy_ltc2990_props[] = {
+	PROPERTY_ENTRY_U32_ARRAY("lltc,meas-mode", icy_ltc2990_meas_mode),
+	{ }
+};
+
+
 static int icy_probe(struct zorro_dev *z,
 			 const struct zorro_device_id *ent)
 {
 	struct icy_i2c *i2c;
 	struct i2c_algo_pcf_data *algo_data;
+	struct fwnode_handle *new_fwnode;
+	struct i2c_board_info ltc2990_info = {
+		.type		= "ltc2990",
+		.addr		= 0x4c,
+	};
 
 
 	i2c = devm_kzalloc(&z->dev, sizeof(*i2c), GFP_KERNEL);
@@ -147,6 +173,35 @@ static int icy_probe(struct zorro_dev *z,
 	dev_info(&z->dev, "ICY I2C controller at %pa, IRQ not implemented\n",
 		 &z->resource.start);
 
+	/*
+	 * The 2019 a1k.org PCBs have an LTC2990 at 0x4c, so start
+	 * it automatically once ltc2990 is modprobed.
+	 *
+	 * in0 is the voltage of the internal 5V power supply.
+	 * temp1 is the temperature inside the chip.
+	 *
+	 * See property_entry above for in1, in2, temp3.
+	 */
+	new_fwnode = fwnode_create_software_node(icy_ltc2990_props, NULL);
+	if (IS_ERR(new_fwnode)) {
+		dev_info(&z->dev, "Failed to create fwnode for LTC2990, error: %ld\n",
+			 PTR_ERR(new_fwnode));
+	} else {
+		/*
+		 * Store the fwnode so we can destroy it on .remove().
+		 * Only store it on success, as fwnode_remove_software_node()
+		 * is NULL safe, but not PTR_ERR safe.
+		 */
+		i2c->ltc2990_fwnode = new_fwnode;
+		ltc2990_info.fwnode = new_fwnode;
+
+		i2c->ltc2990_client =
+			i2c_new_probed_device(&i2c->adapter,
+					      &ltc2990_info,
+					      icy_ltc2990_addresses,
+					      NULL);
+	}
+
 	return 0;
 }
 
@@ -154,6 +209,9 @@ static void icy_remove(struct zorro_dev *z)
 {
 	struct icy_i2c *i2c = dev_get_drvdata(&z->dev);
 
+	i2c_unregister_device(i2c->ltc2990_client);
+	fwnode_remove_software_node(i2c->ltc2990_fwnode);
+
 	i2c_del_adapter(&i2c->adapter);
 }
 
-- 
2.11.0

