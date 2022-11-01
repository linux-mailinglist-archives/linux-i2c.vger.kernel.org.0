Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1CF614B95
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 14:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbiKANVC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 09:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiKANVB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 09:21:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB929F5BA;
        Tue,  1 Nov 2022 06:20:59 -0700 (PDT)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 235F11643;
        Tue,  1 Nov 2022 14:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667308856;
        bh=JBlah+yywOFdaVBeO1c5YpZ5zrmk8nZ9hOoraPtJRNg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uQRsz4s6h6v5KW2X+hwQVlbpAZ4g1pzET3bWDGCFcX0auYOFv87g0JkNyObxiu1il
         rPb4zJ9kX9xUSK/NUKNSXtqx+Pc+EunKjQWnkxj77XGJScF7Dml4WeNr/sd0yv9U1s
         vwb3Ke0TEw/zcWpe4WlQOWz/g7Hj+/qMJQVnsw5g=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 2/8] i2c: add I2C Address Translator (ATR) support
Date:   Tue,  1 Nov 2022 15:20:26 +0200
Message-Id: <20221101132032.1542416-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Luca Ceresoli <luca@lucaceresoli.net>

An ATR is a device that looks similar to an i2c-mux: it has an I2C
slave "upstream" port and N master "downstream" ports, and forwards
transactions from upstream to the appropriate downstream port. But is
is different in that the forwarded transaction has a different slave
address. The address used on the upstream bus is called the "alias"
and is (potentially) different from the physical slave address of the
downstream chip.

Add a helper file (just like i2c-mux.c for a mux or switch) to allow
implementing ATR features in a device driver. The helper takes care or
adapter creation/destruction and translates addresses at each transaction.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/i2c/index.rst         |   1 +
 Documentation/i2c/muxes/i2c-atr.rst |  78 +++++
 MAINTAINERS                         |   7 +
 drivers/i2c/Kconfig                 |   9 +
 drivers/i2c/Makefile                |   1 +
 drivers/i2c/i2c-atr.c               | 497 ++++++++++++++++++++++++++++
 include/linux/i2c-atr.h             |  80 +++++
 7 files changed, 673 insertions(+)
 create mode 100644 Documentation/i2c/muxes/i2c-atr.rst
 create mode 100644 drivers/i2c/i2c-atr.c
 create mode 100644 include/linux/i2c-atr.h

diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index 6270f1fd7d4e..3d177d4ec1d2 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -18,6 +18,7 @@ Introduction
    i2c-topology
    muxes/i2c-mux-gpio
    i2c-sysfs
+   muxes/i2c-atr
 
 Writing device drivers
 ======================
diff --git a/Documentation/i2c/muxes/i2c-atr.rst b/Documentation/i2c/muxes/i2c-atr.rst
new file mode 100644
index 000000000000..14597c9ec19b
--- /dev/null
+++ b/Documentation/i2c/muxes/i2c-atr.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================
+Kernel driver i2c-atr
+=====================
+
+Author: Luca Ceresoli <luca@lucaceresoli.net>
+
+Description
+-----------
+
+An I2C Address Translator (ATR) is a device with an I2C slave parent
+("upstream") port and N I2C master child ("downstream") ports, and
+forwards transactions from upstream to the appropriate downstream port
+with a modified slave address. The address used on the parent bus is
+called the "alias" and is (potentially) different from the physical
+slave address of the child bus. Address translation is done by the
+hardware.
+
+An ATR looks similar to an i2c-mux except:
+ - the address on the parent and child busses can be different
+ - there is normally no need to select the child port; the alias used on the
+   parent bus implies it
+
+The ATR functionality can be provided by a chip with many other
+features. This file provides a helper to implement an ATR within your
+driver.
+
+The ATR creates a new I2C "child" adapter on each child bus. Adding
+devices on the child bus ends up in invoking the driver code to select
+an available alias. Maintaining an appropriate pool of available aliases
+and picking one for each new device is up to the driver implementer. The
+ATR maintains an table of currently assigned alias and uses it to modify
+all I2C transactions directed to devices on the child buses.
+
+A typical example follows.
+
+Topology::
+
+                      Slave X @ 0x10
+              .-----.   |
+  .-----.     |     |---+---- B
+  | CPU |--A--| ATR |
+  `-----'     |     |---+---- C
+              `-----'   |
+                      Slave Y @ 0x10
+
+Alias table:
+
+.. table::
+
+   ======   =====
+   Client   Alias
+   ======   =====
+   X        0x20
+   Y        0x30
+   ======   =====
+
+Transaction:
+
+ - Slave X driver sends a transaction (on adapter B), slave address 0x10
+ - ATR driver rewrites messages with address 0x20, forwards to adapter A
+ - Physical I2C transaction on bus A, slave address 0x20
+ - ATR chip propagates transaction on bus B with address translated to 0x10
+ - Slave X chip replies on bus B
+ - ATR chip forwards reply on bus A
+ - ATR driver rewrites messages with address 0x10
+ - Slave X driver gets back the msgs[], with reply and address 0x10
+
+Usage:
+
+ 1. In your driver (typically in the probe function) add an ATR by
+    calling i2c_atr_new() passing your attach/detach callbacks
+ 2. When the attach callback is called pick an appropriate alias,
+    configure it in your chip and return the chosen alias in the
+    alias_id parameter
+ 3. When the detach callback is called, deconfigure the alias from
+    your chip and put it back in the pool for later usage
diff --git a/MAINTAINERS b/MAINTAINERS
index 379945f82a64..357de12cbca6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9568,6 +9568,13 @@ L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/i2c-core-acpi.c
 
+I2C ADDRESS TRANSLATOR (ATR)
+M:	Luca Ceresoli <luca@lucaceresoli.net>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/i2c-atr.c
+F:	include/linux/i2c-atr.h
+
 I2C CONTROLLER DRIVER FOR NVIDIA GPU
 M:	Ajay Gupta <ajayg@nvidia.com>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 438905e2a1d0..c6d1a345ea6d 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -71,6 +71,15 @@ config I2C_MUX
 
 source "drivers/i2c/muxes/Kconfig"
 
+config I2C_ATR
+	tristate "I2C Address Translator (ATR) support"
+	help
+	  Enable support for I2C Address Translator (ATR) chips.
+
+	  An ATR allows accessing multiple I2C busses from a single
+	  physical bus via address translation instead of bus selection as
+	  i2c-muxes do.
+
 config I2C_HELPER_AUTO
 	bool "Autoselect pertinent helper modules"
 	default y
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index c1d493dc9bac..3f71ce4711e3 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -13,6 +13,7 @@ i2c-core-$(CONFIG_OF) 		+= i2c-core-of.o
 obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
 obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
 obj-$(CONFIG_I2C_MUX)		+= i2c-mux.o
+obj-$(CONFIG_I2C_ATR)		+= i2c-atr.o
 obj-y				+= algos/ busses/ muxes/
 obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
 obj-$(CONFIG_I2C_SLAVE_EEPROM)	+= i2c-slave-eeprom.o
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
new file mode 100644
index 000000000000..5636bbd03b09
--- /dev/null
+++ b/drivers/i2c/i2c-atr.c
@@ -0,0 +1,497 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * I2C Address Translator
+ *
+ * Copyright (c) 2019,2022 Luca Ceresoli <luca@lucaceresoli.net>
+ *
+ * Originally based on i2c-mux.c
+ */
+
+#include <linux/i2c-atr.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+/**
+ * struct i2c_atr_cli2alias_pair - Hold the alias assigned to a client.
+ * @node:   List node
+ * @client: Pointer to the client on the child bus
+ * @alias:  I2C alias address assigned by the driver.
+ *          This is the address that will be used to issue I2C transactions
+ *          on the parent (physical) bus.
+ */
+struct i2c_atr_cli2alias_pair {
+	struct list_head node;
+	const struct i2c_client *client;
+	u16 alias;
+};
+
+/* Data for each channel (child bus) */
+struct i2c_atr_chan {
+	struct i2c_adapter adap;
+	struct i2c_atr *atr;
+	u32 chan_id;
+
+	struct list_head alias_list;
+
+	u16 *orig_addrs;
+	unsigned int orig_addrs_size;
+	struct mutex orig_addrs_lock; /* Lock orig_addrs during xfer */
+};
+
+static struct i2c_atr_cli2alias_pair *
+i2c_atr_find_mapping_by_client(const struct list_head *list,
+			       const struct i2c_client *client)
+{
+	struct i2c_atr_cli2alias_pair *c2a;
+
+	list_for_each_entry(c2a, list, node) {
+		if (c2a->client == client)
+			return c2a;
+	}
+
+	return NULL;
+}
+
+static struct i2c_atr_cli2alias_pair *
+i2c_atr_find_mapping_by_addr(const struct list_head *list, u16 phys_addr)
+{
+	struct i2c_atr_cli2alias_pair *c2a;
+
+	list_for_each_entry(c2a, list, node) {
+		if (c2a->client->addr == phys_addr)
+			return c2a;
+	}
+
+	return NULL;
+}
+
+/*
+ * Replace all message addresses with their aliases, saving the original
+ * addresses.
+ *
+ * This function is internal for use in i2c_atr_master_xfer(). It must be
+ * followed by i2c_atr_unmap_msgs() to restore the original addresses.
+ */
+static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
+			    int num)
+{
+	struct i2c_atr *atr = chan->atr;
+	static struct i2c_atr_cli2alias_pair *c2a;
+	int i;
+
+	/* Ensure we have enough room to save the original addresses */
+	if (unlikely(chan->orig_addrs_size < num)) {
+		void *new_buf = kmalloc_array(num, sizeof(chan->orig_addrs[0]),
+					      GFP_KERNEL);
+		if (new_buf == NULL)
+			return -ENOMEM;
+
+		kfree(chan->orig_addrs);
+		chan->orig_addrs = new_buf;
+		chan->orig_addrs_size = num;
+	}
+
+	for (i = 0; i < num; i++) {
+		chan->orig_addrs[i] = msgs[i].addr;
+
+		c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list,
+						   msgs[i].addr);
+		if (!c2a) {
+			dev_err(atr->dev, "client 0x%02x not mapped!\n",
+				msgs[i].addr);
+			return -ENXIO;
+		}
+
+		msgs[i].addr = c2a->alias;
+	}
+
+	return 0;
+}
+
+/*
+ * Restore all message address aliases with the original addresses. This
+ * function is internal for use in i2c_atr_master_xfer().
+ *
+ * @see i2c_atr_map_msgs()
+ */
+static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg msgs[],
+			       int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++)
+		msgs[i].addr = chan->orig_addrs[i];
+}
+
+static int i2c_atr_master_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
+			       int num)
+{
+	struct i2c_atr_chan *chan = adap->algo_data;
+	struct i2c_atr *atr = chan->atr;
+	struct i2c_adapter *parent = atr->parent;
+	int ret;
+
+	/* Switch to the right atr port */
+	if (atr->ops->select) {
+		ret = atr->ops->select(atr, chan->chan_id);
+		if (ret < 0)
+			goto out_deselect;
+	}
+
+	/* Translate addresses */
+	mutex_lock(&chan->orig_addrs_lock);
+	ret = i2c_atr_map_msgs(chan, msgs, num);
+	if (ret < 0)
+		goto out_unlock_deselect;
+
+	/* Perform the transfer */
+	ret = i2c_transfer(parent, msgs, num);
+
+	/* Restore addresses */
+	i2c_atr_unmap_msgs(chan, msgs, num);
+
+out_unlock_deselect:
+	mutex_unlock(&chan->orig_addrs_lock);
+
+out_deselect:
+	if (atr->ops->deselect)
+		atr->ops->deselect(atr, chan->chan_id);
+
+	return ret;
+}
+
+static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+			      unsigned short flags, char read_write, u8 command,
+			      int size, union i2c_smbus_data *data)
+{
+	struct i2c_atr_chan *chan = adap->algo_data;
+	struct i2c_atr *atr = chan->atr;
+	struct i2c_adapter *parent = atr->parent;
+	struct i2c_atr_cli2alias_pair *c2a;
+	int ret = 0;
+
+	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list, addr);
+	if (!c2a) {
+		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
+		return -ENXIO;
+	}
+
+	if (atr->ops->select)
+		ret = atr->ops->select(atr, chan->chan_id);
+	if (!ret)
+		ret = i2c_smbus_xfer(parent, c2a->alias, flags, read_write,
+				     command, size, data);
+	if (atr->ops->deselect)
+		atr->ops->deselect(atr, chan->chan_id);
+
+	return ret;
+}
+
+static u32 i2c_atr_functionality(struct i2c_adapter *adap)
+{
+	struct i2c_atr_chan *chan = adap->algo_data;
+	struct i2c_adapter *parent = chan->atr->parent;
+
+	return parent->algo->functionality(parent);
+}
+
+static void i2c_atr_lock_bus(struct i2c_adapter *adapter, unsigned int flags)
+{
+	struct i2c_atr_chan *chan = adapter->algo_data;
+	struct i2c_atr *atr = chan->atr;
+
+	mutex_lock(&atr->lock);
+}
+
+static int i2c_atr_trylock_bus(struct i2c_adapter *adapter, unsigned int flags)
+{
+	struct i2c_atr_chan *chan = adapter->algo_data;
+	struct i2c_atr *atr = chan->atr;
+
+	return mutex_trylock(&atr->lock);
+}
+
+static void i2c_atr_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
+{
+	struct i2c_atr_chan *chan = adapter->algo_data;
+	struct i2c_atr *atr = chan->atr;
+
+	mutex_unlock(&atr->lock);
+}
+
+static const struct i2c_lock_operations i2c_atr_lock_ops = {
+	.lock_bus =    i2c_atr_lock_bus,
+	.trylock_bus = i2c_atr_trylock_bus,
+	.unlock_bus =  i2c_atr_unlock_bus,
+};
+
+static int i2c_atr_attach_client(struct i2c_adapter *adapter,
+				 const struct i2c_board_info *info,
+				 const struct i2c_client *client)
+{
+	struct i2c_atr_chan *chan = adapter->algo_data;
+	struct i2c_atr *atr = chan->atr;
+	struct i2c_atr_cli2alias_pair *c2a;
+	u16 alias_id = 0;
+	int ret = 0;
+
+	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
+	if (!c2a)
+		return -ENOMEM;
+
+	ret = atr->ops->attach_client(atr, chan->chan_id, info, client,
+				      &alias_id);
+	if (ret)
+		goto err_free;
+	if (alias_id == 0) {
+		ret = -EINVAL;
+		goto err_free;
+	}
+
+	c2a->client = client;
+	c2a->alias = alias_id;
+	list_add(&c2a->node, &chan->alias_list);
+
+	return 0;
+
+err_free:
+	kfree(c2a);
+	return ret;
+}
+
+static void i2c_atr_detach_client(struct i2c_adapter *adapter,
+				  const struct i2c_client *client)
+{
+	struct i2c_atr_chan *chan = adapter->algo_data;
+	struct i2c_atr *atr = chan->atr;
+	struct i2c_atr_cli2alias_pair *c2a;
+
+	atr->ops->detach_client(atr, chan->chan_id, client);
+
+	c2a = i2c_atr_find_mapping_by_client(&chan->alias_list, client);
+	if (c2a) {
+		list_del(&c2a->node);
+		kfree(c2a);
+	}
+}
+
+static const struct i2c_attach_operations i2c_atr_attach_ops = {
+	.attach_client = i2c_atr_attach_client,
+	.detach_client = i2c_atr_detach_client,
+};
+
+/**
+ * i2c_atr_add_adapter - Create a child ("downstream") I2C bus.
+ * @atr:        The I2C ATR
+ * @chan_id:    Index of the new adapter (0 .. max_adapters-1).  This value is
+ *              passed to the callbacks in `struct i2c_atr_ops`.
+ * @bus_handle: The fwnode handle that points to the adapter's i2c
+ *              peripherals, or NULL.
+ *
+ * After calling this function a new i2c bus will appear. Adding and
+ * removing devices on the downstream bus will result in calls to the
+ * `attach_client` and `detach_client` callbacks for the driver to assign
+ * an alias to the device.
+ *
+ * The adapter's fwnode is set to 'bus_handle', or if 'bus_handle' is NULL the
+ * function looks for a child node whose 'reg' property matches the chan_id
+ * under the i2c-atr device's 'i2c-atr' node.
+
+ * Call i2c_atr_del_adapter() to remove the adapter.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
+			struct fwnode_handle *bus_handle)
+{
+	struct i2c_adapter *parent = atr->parent;
+	struct device *dev = atr->dev;
+	struct i2c_atr_chan *chan;
+	char *symlink_name;
+	int ret;
+
+	if (chan_id >= atr->max_adapters) {
+		dev_err(dev, "No room for more i2c-atr adapters\n");
+		return -EINVAL;
+	}
+
+	if (atr->adapter[chan_id]) {
+		dev_err(dev, "Adapter %d already present\n", chan_id);
+		return -EEXIST;
+	}
+
+	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
+
+	chan->atr = atr;
+	chan->chan_id = chan_id;
+	INIT_LIST_HEAD(&chan->alias_list);
+	mutex_init(&chan->orig_addrs_lock);
+
+	snprintf(chan->adap.name, sizeof(chan->adap.name), "i2c-%d-atr-%d",
+		 i2c_adapter_id(parent), chan_id);
+	chan->adap.owner = THIS_MODULE;
+	chan->adap.algo = &atr->algo;
+	chan->adap.algo_data = chan;
+	chan->adap.dev.parent = dev;
+	chan->adap.retries = parent->retries;
+	chan->adap.timeout = parent->timeout;
+	chan->adap.quirks = parent->quirks;
+	chan->adap.lock_ops = &i2c_atr_lock_ops;
+	chan->adap.attach_ops = &i2c_atr_attach_ops;
+
+	if (bus_handle) {
+		device_set_node(&chan->adap.dev, fwnode_handle_get(bus_handle));
+	} else {
+		struct fwnode_handle *atr_node;
+		struct fwnode_handle *child;
+		u32 reg;
+
+		atr_node = device_get_named_child_node(dev, "i2c-atr");
+
+		fwnode_for_each_child_node(atr_node, child) {
+			ret = fwnode_property_read_u32(child, "reg", &reg);
+			if (ret)
+				continue;
+			if (chan_id == reg)
+				break;
+		}
+
+		device_set_node(&chan->adap.dev, child);
+		fwnode_handle_put(atr_node);
+	}
+
+	ret = i2c_add_adapter(&chan->adap);
+	if (ret) {
+		dev_err(dev, "failed to add atr-adapter %u (error=%d)\n",
+			chan_id, ret);
+		goto err_add_adapter;
+	}
+
+	symlink_name = kasprintf(GFP_KERNEL, "channel-%u", chan_id);
+
+	WARN(sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device"),
+	     "can't create symlink to atr device\n");
+	WARN(sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name),
+	     "can't create symlink for channel %u\n", chan_id);
+
+	kfree(symlink_name);
+
+	dev_dbg(dev, "Added ATR child bus %d\n", i2c_adapter_id(&chan->adap));
+
+	atr->adapter[chan_id] = &chan->adap;
+	return 0;
+
+err_add_adapter:
+	mutex_destroy(&chan->orig_addrs_lock);
+	kfree(chan);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i2c_atr_add_adapter);
+
+/**
+ * i2c_atr_del_adapter - Remove a child ("downstream") I2C bus added by
+ * i2c_atr_del_adapter().
+ * @atr:     The I2C ATR
+ * @chan_id: Index of the `adapter to be removed (0 .. max_adapters-1)
+ */
+void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
+{
+	char symlink_name[20];
+
+	struct i2c_adapter *adap = atr->adapter[chan_id];
+	struct i2c_atr_chan *chan = adap->algo_data;
+	struct fwnode_handle *fwnode = adap->dev.fwnode;
+	struct device *dev = atr->dev;
+
+	if (atr->adapter[chan_id] == NULL) {
+		dev_err(dev, "Adapter %d does not exist\n", chan_id);
+		return;
+	}
+
+	dev_dbg(dev, "Removing ATR child bus %d\n", i2c_adapter_id(adap));
+
+	atr->adapter[chan_id] = NULL;
+
+	snprintf(symlink_name, sizeof(symlink_name),
+		 "channel-%u", chan->chan_id);
+	sysfs_remove_link(&dev->kobj, symlink_name);
+	sysfs_remove_link(&chan->adap.dev.kobj, "atr_device");
+
+	i2c_del_adapter(adap);
+	fwnode_handle_put(fwnode);
+	mutex_destroy(&chan->orig_addrs_lock);
+	kfree(chan->orig_addrs);
+	kfree(chan);
+}
+EXPORT_SYMBOL_GPL(i2c_atr_del_adapter);
+
+/**
+ * i2c_atr_new() - Allocate and initialize an I2C ATR helper.
+ * @parent:       The parent (upstream) adapter
+ * @dev:          The device acting as an ATR
+ * @ops:          Driver-specific callbacks
+ * @max_adapters: Maximum number of child adapters
+ *
+ * The new ATR helper is connected to the parent adapter but has no child
+ * adapters. Call i2c_atr_add_adapter() to add some.
+ *
+ * Call i2c_atr_delete() to remove.
+ *
+ * Return: pointer to the new ATR helper object, or ERR_PTR
+ */
+struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
+			    const struct i2c_atr_ops *ops, int max_adapters)
+{
+	struct i2c_atr *atr;
+	size_t atr_size;
+
+	if (!ops || !ops->attach_client || !ops->detach_client)
+		return ERR_PTR(-EINVAL);
+
+	atr_size = struct_size(atr, adapter, max_adapters);
+	if (atr_size == SIZE_MAX)
+		return ERR_PTR(-EOVERFLOW);
+
+	atr = devm_kzalloc(dev, atr_size, GFP_KERNEL);
+	if (!atr)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&atr->lock);
+
+	atr->parent = parent;
+	atr->dev = dev;
+	atr->ops = ops;
+	atr->max_adapters = max_adapters;
+
+	if (parent->algo->master_xfer)
+		atr->algo.master_xfer = i2c_atr_master_xfer;
+	if (parent->algo->smbus_xfer)
+		atr->algo.smbus_xfer = i2c_atr_smbus_xfer;
+	atr->algo.functionality = i2c_atr_functionality;
+
+	return atr;
+}
+EXPORT_SYMBOL_GPL(i2c_atr_new);
+
+/**
+ * i2c_atr_delete - Delete an I2C ATR helper.
+ * @atr: I2C ATR helper to be deleted.
+ *
+ * Precondition: all the adapters added with i2c_atr_add_adapter() mumst be
+ * removed by calling i2c_atr_del_adapter().
+ */
+void i2c_atr_delete(struct i2c_atr *atr)
+{
+	mutex_destroy(&atr->lock);
+}
+EXPORT_SYMBOL_GPL(i2c_atr_delete);
+
+MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
+MODULE_DESCRIPTION("I2C Address Translator");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
new file mode 100644
index 000000000000..19ac2f1db96b
--- /dev/null
+++ b/include/linux/i2c-atr.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * I2C Address Translator
+ *
+ * Copyright (c) 2019,2022 Luca Ceresoli <luca@lucaceresoli.net>
+ *
+ * Based on i2c-mux.h
+ */
+
+#ifndef _LINUX_I2C_ATR_H
+#define _LINUX_I2C_ATR_H
+
+#include <linux/i2c.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+struct device;
+struct i2c_atr;
+
+/**
+ * struct i2c_atr_ops - Callbacks from ATR to the device driver.
+ * @select:        Ask the driver to select a child bus (optional)
+ * @deselect:      Ask the driver to deselect a child bus (optional)
+ * @attach_client: Notify the driver of a new device connected on a child
+ *                 bus. The driver must choose an I2C alias, configure the
+ *                 hardware to use it and return it in `alias_id`.
+ * @detach_client: Notify the driver of a device getting disconnected. The
+ *                 driver must configure the hardware to stop using the
+ *                 alias.
+ *
+ * All these functions return 0 on success, a negative error code otherwise.
+ */
+struct i2c_atr_ops {
+	int (*select)(struct i2c_atr *atr, u32 chan_id);
+	int (*deselect)(struct i2c_atr *atr, u32 chan_id);
+	int (*attach_client)(struct i2c_atr *atr, u32 chan_id,
+			     const struct i2c_board_info *info,
+			     const struct i2c_client *client, u16 *alias_id);
+	void (*detach_client)(struct i2c_atr *atr, u32 chan_id,
+			      const struct i2c_client *client);
+};
+
+/**
+ * Helper to add I2C ATR features to a device driver.
+ */
+struct i2c_atr {
+	/* private: internal use only */
+
+	struct i2c_adapter *parent;
+	struct device *dev;
+	const struct i2c_atr_ops *ops;
+
+	void *priv;
+
+	struct i2c_algorithm algo;
+	struct mutex lock;
+	int max_adapters;
+
+	struct i2c_adapter *adapter[0];
+};
+
+struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
+			    const struct i2c_atr_ops *ops, int max_adapters);
+void i2c_atr_delete(struct i2c_atr *atr);
+
+static inline void i2c_atr_set_clientdata(struct i2c_atr *atr, void *data)
+{
+	atr->priv = data;
+}
+
+static inline void *i2c_atr_get_clientdata(struct i2c_atr *atr)
+{
+	return atr->priv;
+}
+
+int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
+			struct fwnode_handle *bus_np);
+void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id);
+
+#endif /* _LINUX_I2C_ATR_H */
-- 
2.34.1

