Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5E06EA81D
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 12:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbjDUKTG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Apr 2023 06:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjDUKTF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Apr 2023 06:19:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE7F1FD0;
        Fri, 21 Apr 2023 03:19:01 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9E8275B;
        Fri, 21 Apr 2023 12:18:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682072331;
        bh=93YRfTBTlVub7gB3shSi4kdbiy4shArh7vDnsljENow=;
        h=From:To:Cc:Subject:Date:From;
        b=JEfVGYy3zRkv3yn70OxpblUdx1GW++MHFGfwx4BksxvvgVxc0Z8TgujU9so7iJAgs
         ta1uxqtlf//E+BIBlRfe117P7fjWBE3jzLxxLgXVYoSDXtliGwx40YPmXZmPx+8sek
         7JjDOBqG460zYOmc0w9BVjiM8eHRHh4yvan9jIN0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 0/7] i2c-atr and FPDLink
Date:   Fri, 21 Apr 2023 13:18:26 +0300
Message-Id: <20230421101833.345984-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

You can find v10 from:

https://lore.kernel.org/all/20230222132907.594690-1-tomi.valkeinen@ideasonboard.com/

Diff to v10 included below.

Changes in v11:
- Rename Documentation/i2c/muxes/i2c-atr.rst to Documentation/i2c/i2c-address-translators.rst
- Change documentation according to reviews
- Minor fixes for the issues reported in reviews
- Rename i2c_atr_cli2alias_pair to i2c_atr_alias_pair
- Added Documentation/devicetree/bindings/i2c/i2c-atr.yaml
- i2c-alias-pool is now handled in i2c-atr. i2c-atr reads the pool from
  DT and manages the reservation of aliases.

 Tomi

Luca Ceresoli (1):
  i2c: add I2C Address Translator (ATR) support

Tomi Valkeinen (6):
  dt-bindings: media: add TI DS90UB913 FPD-Link III Serializer
  dt-bindings: media: add TI DS90UB953 FPD-Link III Serializer
  dt-bindings: media: add TI DS90UB960 FPD-Link III Deserializer
  media: i2c: add DS90UB960 driver
  media: i2c: add DS90UB913 driver
  media: i2c: add DS90UB953 driver

 .../devicetree/bindings/i2c/i2c-atr.yaml      |   34 +
 .../bindings/media/i2c/ti,ds90ub913.yaml      |  133 +
 .../bindings/media/i2c/ti,ds90ub953.yaml      |  134 +
 .../bindings/media/i2c/ti,ds90ub960.yaml      |  423 ++
 Documentation/i2c/i2c-address-translators.rst |   96 +
 Documentation/i2c/index.rst                   |    1 +
 MAINTAINERS                                   |   16 +
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  684 +++
 drivers/media/i2c/Kconfig                     |   47 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub913.c                 |  906 ++++
 drivers/media/i2c/ds90ub953.c                 | 1400 ++++++
 drivers/media/i2c/ds90ub960.c                 | 4049 +++++++++++++++++
 include/linux/i2c-atr.h                       |  116 +
 include/media/i2c/ds90ub9xx.h                 |   22 +
 17 files changed, 8074 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-atr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
 create mode 100644 Documentation/i2c/i2c-address-translators.rst
 create mode 100644 drivers/i2c/i2c-atr.c
 create mode 100644 drivers/media/i2c/ds90ub913.c
 create mode 100644 drivers/media/i2c/ds90ub953.c
 create mode 100644 drivers/media/i2c/ds90ub960.c
 create mode 100644 include/linux/i2c-atr.h
 create mode 100644 include/media/i2c/ds90ub9xx.h

Interdiff against v10:
diff --git a/Documentation/devicetree/bindings/i2c/i2c-atr.yaml b/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
new file mode 100644
index 000000000000..d7f73d98110d
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-atr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common i2c address translator properties.
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+
+description:
+  An I2C Address Translator (ATR) is a device with an I2C slave parent
+  ("upstream") port and N I2C master child ("downstream") ports, and
+  forwards transactions from upstream to the appropriate downstream port
+  with a modified slave address. The address used on the parent bus is
+  called the "alias" and is (potentially) different from the physical
+  slave address of the child bus. Address translation is done by the
+  hardware.
+
+properties:
+  i2c-alias-pool:
+    $ref: /schemas/types.yaml#/definitions/uint16-array
+    description:
+      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
+      used to access the remote peripherals on the serializer's I2C bus. The
+      addresses must be available, not used by any other peripheral. Each
+      remote peripheral is assigned an alias from the pool, and transactions to
+      that address will be forwarded to the remote peripheral, with the address
+      translated to the remote peripheral's real address. This property is not
+      needed if there are no I2C addressable remote peripherals.
+
+additionalProperties: true
+...
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index bb921caa85a7..1d5362bea09a 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -37,15 +37,7 @@ properties:
       Specifier for the GPIO connected to the PDB pin.
 
   i2c-alias-pool:
-    $ref: /schemas/types.yaml#/definitions/uint16-array
-    description:
-      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
-      used to access the remote peripherals on the serializer's I2C bus. The
-      addresses must be available, not used by any other peripheral. Each
-      remote peripheral is assigned an alias from the pool, and transactions to
-      that address will be forwarded to the remote peripheral, with the address
-      translated to the remote peripheral's real address. This property is not
-      needed if there are no I2C addressable remote peripherals.
+    $ref: /schemas/i2c/i2c-atr.yaml#/properties/i2c-alias-pool
 
   links:
     type: object
diff --git a/Documentation/i2c/muxes/i2c-atr.rst b/Documentation/i2c/i2c-address-translators.rst
similarity index 82%
rename from Documentation/i2c/muxes/i2c-atr.rst
rename to Documentation/i2c/i2c-address-translators.rst
index da226fd4de63..b22ce9f41ecf 100644
--- a/Documentation/i2c/muxes/i2c-atr.rst
+++ b/Documentation/i2c/i2c-address-translators.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-=====================
-Kernel driver i2c-atr
-=====================
+=======================
+I2C Address Translators
+=======================
 
 Author: Luca Ceresoli <luca@lucaceresoli.net>
 Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
@@ -23,15 +23,14 @@ An ATR looks similar to an i2c-mux except:
  - there is normally no need to select the child port; the alias used on the
    parent bus implies it
 
-The ATR functionality can be provided by a chip with many other
-features. This file provides a helper to implement an ATR within your
-driver.
+The ATR functionality can be provided by a chip with many other features.
+The kernel i2c-atr provides a helper to implement an ATR within a driver.
 
 The ATR creates a new I2C "child" adapter on each child bus. Adding
 devices on the child bus ends up in invoking the driver code to select
 an available alias. Maintaining an appropriate pool of available aliases
 and picking one for each new device is up to the driver implementer. The
-ATR maintains an table of currently assigned alias and uses it to modify
+ATR maintains a table of currently assigned alias and uses it to modify
 all I2C transactions directed to devices on the child buses.
 
 A typical example follows.
@@ -66,7 +65,7 @@ Alias table:
 
 Transaction:
 
- - Slave X driver sends a transaction (on adapter B), slave address 0x10
+ - Slave X driver requests a transaction (on adapter B), slave address 0x10
  - ATR driver finds slave X is on bus B and has alias 0x20, rewrites
    messages with address 0x20, forwards to adapter A
  - Physical I2C transaction on bus A, slave address 0x20
@@ -83,13 +82,13 @@ Transaction:
 
 Usage:
 
- 1. In your driver (typically in the probe function) add an ATR by
-    calling i2c_atr_new() passing your attach/detach callbacks
+ 1. In the driver (typically in the probe function) add an ATR by
+    calling i2c_atr_new() passing attach/detach callbacks
  2. When the attach callback is called pick an appropriate alias,
-    configure it in your chip and return the chosen alias in the
+    configure it in the chip and return the chosen alias in the
     alias_id parameter
  3. When the detach callback is called, deconfigure the alias from
-    your chip and put it back in the pool for later usage
+    the chip and put the alias back in the pool for later usage
 
 I2C ATR functions and data structures
 -------------------------------------
diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index aaf33d1315f4..2b213d4ce89c 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -16,9 +16,9 @@ Introduction
    instantiating-devices
    busses/index
    i2c-topology
-   muxes/i2c-atr
    muxes/i2c-mux-gpio
    i2c-sysfs
+   i2c-address-translators
 
 Writing device drivers
 ======================
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 5ab890b83670..402182a04efd 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -15,19 +15,20 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 
 #define ATR_MAX_ADAPTERS 100	/* Just a sanity limit */
 #define ATR_MAX_SYMLINK_LEN 11	/* Longest name is 10 chars: "channel-99" */
 
 /**
- * struct i2c_atr_cli2alias_pair - Holds the alias assigned to a client.
+ * struct i2c_atr_alias_pair - Holds the alias assigned to a client.
  * @node:   List node
  * @client: Pointer to the client on the child bus
  * @alias:  I2C alias address assigned by the driver.
  *          This is the address that will be used to issue I2C transactions
  *          on the parent (physical) bus.
  */
-struct i2c_atr_cli2alias_pair {
+struct i2c_atr_alias_pair {
 	struct list_head node;
 	const struct i2c_client *client;
 	u16 alias;
@@ -38,7 +39,7 @@ struct i2c_atr_cli2alias_pair {
  * @adap:            The &struct i2c_adapter for the channel
  * @atr:             The parent I2C ATR
  * @chan_id:         The ID of this channel
- * @alias_list:      List of @struct i2c_atr_cli2alias_pair containing the
+ * @alias_list:      List of @struct i2c_atr_alias_pair containing the
  *                   assigned aliases
  * @orig_addrs_lock: Mutex protecting @orig_addrs
  * @orig_addrs:      Buffer used to store the original addresses during transmit
@@ -66,6 +67,11 @@ struct i2c_atr_chan {
  * @algo:      The &struct i2c_algorithm for adapters
  * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
  * @max_adapters: Maximum number of adapters this I2C ATR can have
+ * @num_aliases: Number of aliases in the aliases array
+ * @aliases:   The aliases array
+ * @alias_mask_lock: Lock protecting alias_use_mask
+ * @alias_use_mask: Bitmask for used aliases in aliases array
+ * @i2c_nb:    Notifier for remote client add & del events
  * @adapter:   Array of adapters
  */
 struct i2c_atr {
@@ -80,16 +86,22 @@ struct i2c_atr {
 	struct mutex lock;
 	int max_adapters;
 
+	size_t num_aliases;
+	const u16 *aliases;
+	/* Protects alias_use_mask */
+	spinlock_t alias_mask_lock;
+	unsigned long *alias_use_mask;
+
 	struct notifier_block i2c_nb;
 
 	struct i2c_adapter *adapter[];
 };
 
-static struct i2c_atr_cli2alias_pair *
+static struct i2c_atr_alias_pair *
 i2c_atr_find_mapping_by_client(const struct list_head *list,
 			       const struct i2c_client *client)
 {
-	struct i2c_atr_cli2alias_pair *c2a;
+	struct i2c_atr_alias_pair *c2a;
 
 	list_for_each_entry(c2a, list, node) {
 		if (c2a->client == client)
@@ -99,10 +111,10 @@ i2c_atr_find_mapping_by_client(const struct list_head *list,
 	return NULL;
 }
 
-static struct i2c_atr_cli2alias_pair *
+static struct i2c_atr_alias_pair *
 i2c_atr_find_mapping_by_addr(const struct list_head *list, u16 phys_addr)
 {
-	struct i2c_atr_cli2alias_pair *c2a;
+	struct i2c_atr_alias_pair *c2a;
 
 	list_for_each_entry(c2a, list, node) {
 		if (c2a->client->addr == phys_addr)
@@ -123,7 +135,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 			    int num)
 {
 	struct i2c_atr *atr = chan->atr;
-	static struct i2c_atr_cli2alias_pair *c2a;
+	static struct i2c_atr_alias_pair *c2a;
 	int i;
 
 	/* Ensure we have enough room to save the original addresses */
@@ -148,6 +160,10 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 		if (!c2a) {
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
 				msgs[i].addr);
+
+			while (i--)
+				msgs[i].addr = chan->orig_addrs[i];
+
 			return -ENXIO;
 		}
 
@@ -159,7 +175,8 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 
 /*
  * Restore all message address aliases with the original addresses. This
- * function is internal for use in i2c_atr_master_xfer().
+ * function is internal for use in i2c_atr_master_xfer() and for this reason it
+ * needs no null and size checks on orig_addr.
  *
  * @see i2c_atr_map_msgs()
  */
@@ -206,7 +223,7 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	struct i2c_atr_chan *chan = adap->algo_data;
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_adapter *parent = atr->parent;
-	struct i2c_atr_cli2alias_pair *c2a;
+	struct i2c_atr_alias_pair *c2a;
 
 	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list, addr);
 	if (!c2a) {
@@ -256,34 +273,84 @@ static const struct i2c_lock_operations i2c_atr_lock_ops = {
 	.unlock_bus =  i2c_atr_unlock_bus,
 };
 
+static int i2c_atr_reserve_alias(struct i2c_atr *atr)
+{
+	unsigned long idx;
+
+	spin_lock(&atr->alias_mask_lock);
+
+	idx = find_first_zero_bit(atr->alias_use_mask, atr->num_aliases);
+	if (idx >= atr->num_aliases) {
+		spin_unlock(&atr->alias_mask_lock);
+		dev_err(atr->dev, "failed to find a free alias\n");
+		return -EBUSY;
+	}
+
+	set_bit(idx, atr->alias_use_mask);
+
+	spin_unlock(&atr->alias_mask_lock);
+
+	return atr->aliases[idx];
+}
+
+static void i2c_atr_release_alias(struct i2c_atr *atr, u16 alias)
+{
+	unsigned int idx;
+
+	spin_lock(&atr->alias_mask_lock);
+
+	for (idx = 0; idx < atr->num_aliases; ++idx) {
+		if (atr->aliases[idx] == alias) {
+			clear_bit(idx, atr->alias_use_mask);
+			spin_unlock(&atr->alias_mask_lock);
+			return;
+		}
+	}
+
+	spin_unlock(&atr->alias_mask_lock);
+
+	 /* This should never happen */
+	dev_warn(atr->dev, "Unable to find mapped alias\n");
+}
+
 static int i2c_atr_attach_client(struct i2c_adapter *adapter,
 				 const struct i2c_client *client)
 {
 	struct i2c_atr_chan *chan = adapter->algo_data;
 	struct i2c_atr *atr = chan->atr;
-	struct i2c_atr_cli2alias_pair *c2a;
-	u16 alias_id;
+	struct i2c_atr_alias_pair *c2a;
+	u16 alias;
 	int ret;
 
+	ret = i2c_atr_reserve_alias(atr);
+	if (ret < 0)
+		return ret;
+
+	alias = ret;
+
 	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
-	if (!c2a)
-		return -ENOMEM;
+	if (!c2a) {
+		ret = -ENOMEM;
+		goto err_release_alias;
+	}
 
-	ret = atr->ops->attach_client(atr, chan->chan_id, client, &alias_id);
+	ret = atr->ops->attach_client(atr, chan->chan_id, client, alias);
 	if (ret)
 		goto err_free;
 
 	dev_dbg(atr->dev, "chan%u: client 0x%02x mapped at alias 0x%02x (%s)\n",
-		chan->chan_id, client->addr, alias_id, client->name);
+		chan->chan_id, client->addr, alias, client->name);
 
 	c2a->client = client;
-	c2a->alias = alias_id;
+	c2a->alias = alias;
 	list_add(&c2a->node, &chan->alias_list);
 
 	return 0;
 
 err_free:
 	kfree(c2a);
+err_release_alias:
+	i2c_atr_release_alias(atr, alias);
 
 	return ret;
 }
@@ -293,7 +360,7 @@ static void i2c_atr_detach_client(struct i2c_adapter *adapter,
 {
 	struct i2c_atr_chan *chan = adapter->algo_data;
 	struct i2c_atr *atr = chan->atr;
-	struct i2c_atr_cli2alias_pair *c2a;
+	struct i2c_atr_alias_pair *c2a;
 
 	atr->ops->detach_client(atr, chan->chan_id, client);
 
@@ -304,6 +371,8 @@ static void i2c_atr_detach_client(struct i2c_adapter *adapter,
 		return;
 	}
 
+	i2c_atr_release_alias(atr, c2a->alias);
+
 	dev_dbg(atr->dev,
 		"chan%u: client 0x%02x unmapped from alias 0x%02x (%s)\n",
 		chan->chan_id, client->addr, c2a->alias, client->name);
@@ -354,6 +423,54 @@ static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
+{
+	struct device *dev = atr->dev;
+	unsigned long *alias_use_mask;
+	size_t num_aliases;
+	u16 *aliases;
+	int ret;
+
+	ret = fwnode_property_count_u16(dev_fwnode(dev), "i2c-alias-pool");
+	if (ret < 0) {
+		dev_err(dev, "Failed to count 'i2c-alias-pool' property: %d\n",
+			ret);
+		return ret;
+	}
+
+	num_aliases = ret;
+
+	if (!num_aliases)
+		return 0;
+
+	aliases = kcalloc(num_aliases, sizeof(*aliases), GFP_KERNEL);
+	if (!aliases)
+		return -ENOMEM;
+
+	ret = fwnode_property_read_u16_array(dev_fwnode(dev), "i2c-alias-pool",
+					     aliases, num_aliases);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read 'i2c-alias-pool' property: %d\n",
+			ret);
+		kfree(aliases);
+		return ret;
+	}
+
+	alias_use_mask = bitmap_zalloc(num_aliases, GFP_KERNEL);
+	if (!alias_use_mask) {
+		kfree(aliases);
+		return -ENOMEM;
+	}
+
+	atr->num_aliases = num_aliases;
+	atr->aliases = aliases;
+	atr->alias_use_mask = alias_use_mask;
+
+	dev_dbg(dev, "i2c-alias-pool has %zu aliases", atr->num_aliases);
+
+	return 0;
+}
+
 struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 			    const struct i2c_atr_ops *ops, int max_adapters)
 {
@@ -371,6 +488,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	mutex_init(&atr->lock);
+	spin_lock_init(&atr->alias_mask_lock);
 
 	atr->parent = parent;
 	atr->dev = dev;
@@ -383,20 +501,38 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 		atr->algo.smbus_xfer = i2c_atr_smbus_xfer;
 	atr->algo.functionality = i2c_atr_functionality;
 
+	ret = i2c_atr_parse_alias_pool(atr);
+	if (ret)
+		goto err_destroy_mutex;
+
 	atr->i2c_nb.notifier_call = i2c_atr_bus_notifier_call;
 	ret = bus_register_notifier(&i2c_bus_type, &atr->i2c_nb);
-	if (ret) {
-		mutex_destroy(&atr->lock);
-		return ERR_PTR(ret);
-	}
+	if (ret)
+		goto err_free_aliases;
 
 	return atr;
+
+err_free_aliases:
+	bitmap_free(atr->alias_use_mask);
+	kfree(atr->aliases);
+err_destroy_mutex:
+	mutex_destroy(&atr->lock);
+	kfree(atr);
+
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_atr_new, I2C_ATR);
 
 void i2c_atr_delete(struct i2c_atr *atr)
 {
+	unsigned int i;
+
+	for (i = 0; i < atr->max_adapters; ++i)
+		WARN_ON(atr->adapter[i]);
+
 	bus_unregister_notifier(&i2c_bus_type, &atr->i2c_nb);
+	bitmap_free(atr->alias_use_mask);
+	kfree(atr->aliases);
 	mutex_destroy(&atr->lock);
 	kfree(atr);
 }
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index a77908da5c38..1e3827a60029 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -600,7 +600,7 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	for (i = 0; i < sizeof(id); i++)
 		ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i]);
 
-	dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
+	dev_info(dev, "ID '%.*s'\n", (int)sizeof(id), id);
 
 	ub953_read(priv, UB953_REG_GENERAL_STATUS, &v);
 	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index c9dfe2ea0dfb..ff939300c918 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -466,6 +466,8 @@ struct ub960_rxport {
 			} manual;
 		};
 	} eq;
+
+	const struct i2c_client *aliased_clients[UB960_MAX_PORT_ALIASES];
 };
 
 struct ub960_asd {
@@ -485,16 +487,6 @@ struct ub960_txport {
 	u32 num_data_lanes;
 };
 
-struct atr_alias_table_entry {
-	u16 alias_id;	/* Alias ID from DT */
-
-	u8 nport;
-	u8 slave_id;	/* i2c client's local i2c address */
-	u8 port_reg_idx;
-
-	bool in_use;
-};
-
 struct ub960_data {
 	const struct ub960_hw_data	*hw_data;
 	struct i2c_client	*client; /* for shared local registers */
@@ -521,14 +513,7 @@ struct ub960_data {
 	u32 tx_data_rate;		/* Nominal data rate (Gb/s) */
 	s64 tx_link_freq[1];
 
-	struct {
-		struct i2c_atr *atr;
-
-		/* Protects fields below in this struct */
-		struct mutex lock;
-		size_t num_aliases;
-		struct atr_alias_table_entry *aliases;
-	} atr;
+	struct i2c_atr *atr;
 
 	struct {
 		u8 rxport;
@@ -674,7 +659,7 @@ static int ub960_read16(struct ub960_data *priv, u8 reg, u16 *val)
 
 	mutex_lock(&priv->reg_lock);
 
-	ret = regmap_bulk_read(priv->regmap, reg, &__v, 2);
+	ret = regmap_bulk_read(priv->regmap, reg, &__v, sizeof(__v));
 	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
@@ -797,7 +782,7 @@ static int ub960_rxport_read16(struct ub960_data *priv, u8 nport, u8 reg,
 	if (ret)
 		goto out_unlock;
 
-	ret = regmap_bulk_read(priv->regmap, reg, &__v, 2);
+	ret = regmap_bulk_read(priv->regmap, reg, &__v, sizeof(__v));
 	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
@@ -1038,72 +1023,34 @@ static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
  */
 
 static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
-				   const struct i2c_client *client,
-				   u16 *alias_id)
+				   const struct i2c_client *client, u16 alias)
 {
 	struct ub960_data *priv = i2c_atr_get_driver_data(atr);
 	struct ub960_rxport *rxport = priv->rxports[chan_id];
 	struct device *dev = &priv->client->dev;
-	struct atr_alias_table_entry *entry = NULL;
 	unsigned int reg_idx;
-	unsigned int pool_idx;
-	u16 alias;
-	int ret = 0;
-	u8 port_reg_idx_mask = 0;
-
-	mutex_lock(&priv->atr.lock);
-
-	/*
-	 * Go through the alias table and:
-	 *	1. Look for an unreserved entry
-	 *	2. Construct a bitmask of port's used alias entries
-	 */
-
-	for (pool_idx = 0; pool_idx < priv->atr.num_aliases; pool_idx++) {
-		struct atr_alias_table_entry *e;
-
-		e = &priv->atr.aliases[pool_idx];
-
-		if (!entry && !e->in_use)
-			entry = e;
 
-		if (e->in_use && e->nport == rxport->nport)
-			port_reg_idx_mask |= BIT(e->port_reg_idx);
+	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_idx++) {
+		if (!rxport->aliased_clients[reg_idx])
+			break;
 	}
 
-	if (!entry) {
+	if (reg_idx == ARRAY_SIZE(rxport->aliased_clients)) {
 		dev_err(dev, "rx%u: alias pool exhausted\n", rxport->nport);
-		ret = -EADDRNOTAVAIL;
-		goto out_unlock;
-	}
-
-	if (port_reg_idx_mask == GENMASK(UB960_MAX_PORT_ALIASES - 1, 0)) {
-		dev_err(dev, "rx%u: all aliases in use\n", rxport->nport);
-		ret = -EADDRNOTAVAIL;
-		goto out_unlock;
+		return -EADDRNOTAVAIL;
 	}
 
-	alias = entry->alias_id;
-
-	reg_idx = ffz(port_reg_idx_mask);
-
-	entry->in_use = true;
-	entry->nport = rxport->nport;
-	entry->slave_id = client->addr;
-	entry->port_reg_idx = reg_idx;
-
-	/* Map alias to slave */
+	rxport->aliased_clients[reg_idx] = client;
 
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
 			   client->addr << 1);
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
 			   alias << 1);
 
-	*alias_id = alias; /* tell the atr which alias we chose */
+	dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
+		rxport->nport, client->addr, alias, reg_idx);
 
-out_unlock:
-	mutex_unlock(&priv->atr.lock);
-	return ret;
+	return 0;
 }
 
 static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
@@ -1112,38 +1059,25 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	struct ub960_data *priv = i2c_atr_get_driver_data(atr);
 	struct ub960_rxport *rxport = priv->rxports[chan_id];
 	struct device *dev = &priv->client->dev;
-	struct atr_alias_table_entry *entry;
 	unsigned int reg_idx;
-	unsigned int pool_idx;
-
-	mutex_lock(&priv->atr.lock);
 
-	/* Find alias mapped to this client */
-
-	for (pool_idx = 0; pool_idx < priv->atr.num_aliases; pool_idx++) {
-		entry = &priv->atr.aliases[pool_idx];
-
-		if (entry->in_use && entry->nport == rxport->nport &&
-		    entry->slave_id == client->addr)
+	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_idx++) {
+		if (rxport->aliased_clients[reg_idx] == client)
 			break;
 	}
 
-	if (pool_idx == priv->atr.num_aliases) {
+	if (reg_idx == ARRAY_SIZE(rxport->aliased_clients)) {
 		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
 			rxport->nport, client->addr);
-		goto out_unlock;
+		return;
 	}
 
-	reg_idx = entry->port_reg_idx;
-
-	/* Unmap */
+	rxport->aliased_clients[reg_idx] = NULL;
 
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
 
-	entry->in_use = false;
-
-out_unlock:
-	mutex_unlock(&priv->atr.lock);
+	dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport->nport,
+		client->addr, reg_idx);
 }
 
 static const struct i2c_atr_ops ub960_atr_ops = {
@@ -1156,20 +1090,20 @@ static int ub960_init_atr(struct ub960_data *priv)
 	struct device *dev = &priv->client->dev;
 	struct i2c_adapter *parent_adap = priv->client->adapter;
 
-	priv->atr.atr = i2c_atr_new(parent_adap, dev, &ub960_atr_ops,
-				    priv->hw_data->num_rxports);
-	if (IS_ERR(priv->atr.atr))
-		return PTR_ERR(priv->atr.atr);
+	priv->atr = i2c_atr_new(parent_adap, dev, &ub960_atr_ops,
+				priv->hw_data->num_rxports);
+	if (IS_ERR(priv->atr))
+		return PTR_ERR(priv->atr);
 
-	i2c_atr_set_driver_data(priv->atr.atr, priv);
+	i2c_atr_set_driver_data(priv->atr, priv);
 
 	return 0;
 }
 
 static void ub960_uninit_atr(struct ub960_data *priv)
 {
-	i2c_atr_delete(priv->atr.atr);
-	priv->atr.atr = NULL;
+	i2c_atr_delete(priv->atr);
+	priv->atr = NULL;
 }
 
 /* -----------------------------------------------------------------------------
@@ -1714,7 +1648,7 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 	};
 
 	ser_pdata->port = nport;
-	ser_pdata->atr = priv->atr.atr;
+	ser_pdata->atr = priv->atr;
 	if (priv->hw_data->is_ub9702)
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
 	else
@@ -3017,7 +2951,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 	for (i = 0; i < sizeof(id); i++)
 		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
 
-	dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
+	dev_info(dev, "ID '%.*s'\n", (int)sizeof(id), id);
 
 	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
 		struct ub960_txport *txport = priv->txports[nport];
@@ -3246,56 +3180,6 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
 	}
 }
 
-static int ub960_parse_dt_base(struct ub960_data *priv)
-{
-	struct device *dev = &priv->client->dev;
-	size_t table_size;
-	unsigned int i;
-	u16 *aliases;
-	int ret;
-
-	ret = fwnode_property_count_u16(dev_fwnode(dev), "i2c-alias-pool");
-	if (ret < 0) {
-		dev_err(dev, "Failed to count 'i2c-alias-pool' property: %d\n",
-			ret);
-		return ret;
-	}
-
-	table_size = ret;
-	priv->atr.num_aliases = ret;
-
-	if (!table_size)
-		return 0;
-
-	priv->atr.aliases = devm_kcalloc(dev, table_size,
-					 sizeof(*priv->atr.aliases),
-					 GFP_KERNEL);
-	if (!priv->atr.aliases)
-		return -ENOMEM;
-
-	aliases = kcalloc(table_size, sizeof(u16), GFP_KERNEL);
-	if (!aliases)
-		return -ENOMEM;
-
-	ret = fwnode_property_read_u16_array(dev_fwnode(dev), "i2c-alias-pool",
-					     aliases, table_size);
-	if (ret < 0) {
-		dev_err(dev, "Failed to read 'i2c-alias-pool' property: %d\n",
-			ret);
-		kfree(aliases);
-		return ret;
-	}
-
-	for (i = 0; i < table_size; i++)
-		priv->atr.aliases[i].alias_id = aliases[i];
-
-	kfree(aliases);
-
-	dev_dbg(dev, "i2c-alias-pool has %zu aliases", table_size);
-
-	return 0;
-}
-
 static int
 ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 				      struct fwnode_handle *link_fwnode,
@@ -3634,10 +3518,6 @@ static int ub960_parse_dt(struct ub960_data *priv)
 {
 	int ret;
 
-	ret = ub960_parse_dt_base(priv);
-	if (ret)
-		return ret;
-
 	ret = ub960_parse_dt_rxports(priv);
 	if (ret)
 		return ret;
@@ -4006,7 +3886,6 @@ static int ub960_probe(struct i2c_client *client)
 	priv->hw_data = device_get_match_data(dev);
 
 	mutex_init(&priv->reg_lock);
-	mutex_init(&priv->atr.lock);
 
 	INIT_DELAYED_WORK(&priv->poll_work, ub960_handler_work);
 
@@ -4103,7 +3982,6 @@ static int ub960_probe(struct i2c_client *client)
 err_disable_core_hw:
 	ub960_disable_core_hw(priv);
 err_mutex_destroy:
-	mutex_destroy(&priv->atr.lock);
 	mutex_destroy(&priv->reg_lock);
 	return ret;
 }
@@ -4122,7 +4000,6 @@ static void ub960_remove(struct i2c_client *client)
 	ub960_rxport_free_ports(priv);
 	ub960_txport_free_ports(priv);
 	ub960_disable_core_hw(priv);
-	mutex_destroy(&priv->atr.lock);
 	mutex_destroy(&priv->reg_lock);
 }
 
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 7596f70ce1ab..4d5da161c225 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -21,8 +21,8 @@ struct i2c_atr;
 /**
  * struct i2c_atr_ops - Callbacks from ATR to the device driver.
  * @attach_client: Notify the driver of a new device connected on a child
- *                 bus. The driver must choose an I2C alias, configure the
- *                 hardware to use it and return it in `alias_id`.
+ *                 bus, with the alias assigned to it. The driver must
+ *                 configure the hardware to use the alias.
  * @detach_client: Notify the driver of a device getting disconnected. The
  *                 driver must configure the hardware to stop using the
  *                 alias.
@@ -31,7 +31,7 @@ struct i2c_atr;
  */
 struct i2c_atr_ops {
 	int (*attach_client)(struct i2c_atr *atr, u32 chan_id,
-			     const struct i2c_client *client, u16 *alias_id);
+			     const struct i2c_client *client, u16 alias);
 	void (*detach_client)(struct i2c_atr *atr, u32 chan_id,
 			      const struct i2c_client *client);
 };
@@ -57,7 +57,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
  * i2c_atr_delete - Delete an I2C ATR helper.
  * @atr: I2C ATR helper to be deleted.
  *
- * Precondition: all the adapters added with i2c_atr_add_adapter() mumst be
+ * Precondition: all the adapters added with i2c_atr_add_adapter() must be
  * removed by calling i2c_atr_del_adapter().
  */
 void i2c_atr_delete(struct i2c_atr *atr);
-- 
2.34.1

