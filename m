Return-Path: <linux-i2c+bounces-6820-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC797AD59
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 10:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2414E1C202CA
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 08:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43DB17AE0B;
	Tue, 17 Sep 2024 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PBtMUpvs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCC8178397;
	Tue, 17 Sep 2024 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726563220; cv=none; b=lJ13sy7w9oZ4SbWwMmQ4qrRPhFSVpU/hhhAixL9e/xyJnDQPlpmH1Fu9Vs0BpgNIauI93zLETx90R/DUMy+msTGn6C1r5nimIQwlsI7xq3V4j3o55yOUZvEZykPBJoMTs0L+8sPiCpAVJx5t3tdwihwapVeIol+tDBRFGvwRT1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726563220; c=relaxed/simple;
	bh=d46UyFg31sQdtl+sD0JkuMUtCzrEA2Rn4kzIuAmWtPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ElGSkag3JFlgliSBxwW7qVCrHilQBGXf4jdcweywVE1hY7fKWrdcOh9ubTEYydPO65ujVHZUwHk0lvDOBdIShwZvMUr86sm3A0g+bp1b5ZW9sfvsIFBLhA6rNc4F/5DbWtsAMrUK2yFkjTF+gTDNAMrOIRQmg5o3ixYsYVPhsxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PBtMUpvs; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC972240013;
	Tue, 17 Sep 2024 08:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726563216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HXAI/3ju1VCCwHCAXzm98BOlwNQZ+fS3qOU0jxqqHME=;
	b=PBtMUpvsQ6u8B6br9fNHriTcfs27bbqmsPcDiOOvE/K0+CWYRz7KkOmv96eLDMjFhye0BJ
	MCDjrTItCm0F/ZfRddlYvKkPyhQKl+4xrPd+REuiksVuV4kPnSjeBO4evplsR19lgrZ93x
	TCLy9AKbH6uRdSbIjbtG5p6y95P2awGt0h5p1EJ1q3qPCm2uFFxHGEOf7XqlU7SqD+YPTP
	ryjavBsToaMvdfQ12aiYGivWaPmNIFOB300pqtuW8GFCT0ST8IBlHs1nU/OyHraG1R05b/
	Np1MCqZWxZlXqI2duqti4I5eJsScFndC6D9/zsfCIV8mpF9MC6NSw/+fE/V2Zg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 17 Sep 2024 10:53:12 +0200
Subject: [PATCH v4 8/8] misc: add ge-addon-connector driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-hotplug-drm-bridge-v4-8-bc4dfee61be6@bootlin.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
In-Reply-To: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: luca.ceresoli@bootlin.com

Add a driver to support the runtime hot-pluggable add-on connector on the
GE SUNH device. This connector allows connecting and disconnecting an
add-on to/from the main device to augment its features. Connection and
disconnection can happen at runtime at any moment without notice.

Different add-on models can be connected, and each has an EEPROM with a
model identifier at a fixed address.

The add-on hardware is added and removed using device tree overlay loading
and unloading.

Co-developed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v4:
 - rename 'nobus-devices' to 'devices' as per new bindings
 - remove the 'powergood' GPIO, removed from hardware design
 - rename "base" and "addon" overlays to "overlay 0" and "overlay 1" as the
   "addon" name is ambiguous
 - remove unused enum sunh_conn_overlay_level entries, then move the only
   remaining enum value to a define

Changed in v3:
 - update to the new overlay representation that now does not include the
   target node; instead the target node is the connector node itself and is
   now passed by the connector driver to of_overlay_fdt_apply(), so the
   overlay is now decoupled from the base device tree
 - update to explicitely probe devices not reachable by the CPU on any
   physical bus (which probe as platform devices) which are now inside a
   'nobus-devices' subnode of the connector node
 - change how the DRM bridge is populated to use the new device tree
   representation, having the video ports inside the 'dsi' node

   **NOTE** this specific change opens up a question about the
            .of_node_reused flag: setting it to true might be wrong now as
            the bridge will be handed the 'dsi' subnode of the connector
            node; however not setting it to true prevents the hotplug
            bridge module autoloading due to the alias string changing from
            "platform:hotplug-dsi-bridge" to "of:NdsiT(null)".

 - remove dev_info() and uninformative dev_dbg() calls
 - Kconfig: use 'depends on' instead of 'select'
 - Kconfig: improve help text and add module name

This patch first appeared in v2.
---
 MAINTAINERS                      |   1 +
 drivers/misc/Kconfig             |  18 ++
 drivers/misc/Makefile            |   1 +
 drivers/misc/ge-sunh-connector.c | 481 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 501 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 95a05eb75202..7dec59888df2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10278,6 +10278,7 @@ F:	drivers/iio/pressure/mprls0025pa*
 HOTPLUG CONNECTOR FOR GE SUNH ADDONS
 M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 S:	Maintained
+F:	drivers/misc/ge-sunh-connector.c
 F:	Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
 
 HP BIOSCFG DRIVER
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 41c54051347a..e2a5bcce0073 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -600,6 +600,24 @@ config MARVELL_CN10K_DPI
 	  To compile this driver as a module, choose M here: the module
 	  will be called mrvl_cn10k_dpi.
 
+config GE_SUNH_CONNECTOR
+	tristate "GE SUNH hotplug add-on connector"
+	depends on OF_OVERLAY
+	depends on NVMEM
+	depends on DRM_HOTPLUG_BRIDGE
+	select FW_LOADER
+	help
+	  Driver for the runtime hot-pluggable add-on connector on the GE
+	  SUNH device. This connector allows connecting an add-on to the
+	  main device to augment its features, and to later disconnect
+	  it. Connection and disconnection can be done at runtime at any
+	  moment without notice. Different add-on models can be connected,
+	  and each has an EEPROM with a model identifier at a fixed
+	  address.
+
+	  To compile this driver as a module, choose M here.
+	  The module will be called ge-sunh-connector.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index c2f990862d2b..69747b048046 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -70,4 +70,5 @@ obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
 obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
 obj-$(CONFIG_MARVELL_CN10K_DPI)	+= mrvl_cn10k_dpi.o
+obj-$(CONFIG_GE_SUNH_CONNECTOR)	+= ge-sunh-connector.o
 obj-y				+= keba/
diff --git a/drivers/misc/ge-sunh-connector.c b/drivers/misc/ge-sunh-connector.c
new file mode 100644
index 000000000000..0e6064a9a519
--- /dev/null
+++ b/drivers/misc/ge-sunh-connector.c
@@ -0,0 +1,481 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GE SUNH hotplug add-on connector
+ *
+ * Driver for the runtime hot-pluggable add-on connector on the GE SUNH
+ * device. Add-on connection is detected via GPIOs (+ a debugfs
+ * trigger). On connection, a "base" DT overlay is added that describes
+ * enough to reach the NVMEM cell with the model ID. Based on the ID, an
+ * add-on-specific overlay is loaded on top to describe everything else.
+ *
+ * Copyright (C) 2024, GE HealthCare
+ *
+ * Authors:
+ * Luca Ceresoli <luca.ceresoli@bootlin.com>
+ * Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/workqueue.h>
+
+#define SUNH_CONN_OVERLAY_N_LEVELS       2
+
+struct sunh_conn {
+	struct device *dev;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *plugged_gpio;
+
+	bool plugged;
+	int ovcs_id[SUNH_CONN_OVERLAY_N_LEVELS];
+	struct mutex ovl_mutex; // serialize overlay code
+	struct notifier_block nvmem_nb;
+	struct work_struct nvmem_notifier_work;
+
+	struct platform_device *hpb_pdev;
+	struct dentry *debugfs_root;
+};
+
+/*
+ * Populate all platform devices that are not on any bus.
+ *
+ * Populate devices without any I/O access from the CPU, (e.g. fixed
+ * regulators and gpio regulators). In the normal case of a device tree
+ * without runtime-loaded overlays these are direct children of the root
+ * node and as such they are populated as a special case.
+ *
+ * Within the hotplug connector they need to be at a deeper level of the
+ * tree. Moreover they are "segregated" in the "devices" node which allows
+ * to avoid trying of_platform_default_populate() on other kind of nodes.
+ *
+ * No need to depopulate them in this driver: of_platform_notify() will do
+ * that on overlay removal.
+ *
+ * In case a generalized framework for OF_based hotplug connector drivers
+ * will exist in the future, this function is definitely meant for the
+ * framework.
+ */
+static int sunh_conn_populate_nobus_devices(struct sunh_conn *conn)
+{
+	struct device_node *nobus_devs_dn;
+	int err;
+
+	nobus_devs_dn = of_get_child_by_name(conn->dev->of_node, "devices");
+	if (!nobus_devs_dn)
+		return 0;
+
+	err = of_platform_default_populate(nobus_devs_dn, NULL, conn->dev);
+	if (err)
+		dev_err(conn->dev, "Failed to populate nobus devices\n");
+
+	of_node_put(nobus_devs_dn);
+	return err;
+}
+
+static int sunh_conn_insert_overlay(struct sunh_conn *conn,
+				    unsigned int level,
+				    const char *filename)
+{
+	const struct firmware *fw;
+	int err;
+
+	err = request_firmware(&fw, filename, conn->dev);
+	if (err)
+		return dev_err_probe(conn->dev, err, "Error requesting overlay %s", filename);
+
+	dev_dbg(conn->dev, "insert overlay %d: %s", level, filename);
+	err = of_overlay_fdt_apply(fw->data, fw->size, &conn->ovcs_id[level], conn->dev->of_node);
+	if (err)
+		dev_err_probe(conn->dev, err, "Failed to apply overlay %s\n", filename);
+	else
+		err = sunh_conn_populate_nobus_devices(conn);
+
+	if (err) {
+		int err2;
+
+		/* changeset may be partially applied */
+		err2 = of_overlay_remove(&conn->ovcs_id[level]);
+		if (err2 < 0)
+			dev_err_probe(conn->dev, err2,
+				      "Failed to remove failed overlay %s\n", filename);
+	}
+
+	release_firmware(fw);
+
+	return err;
+}
+
+/* Load the overlay common to all add-ons (enough to read the model ID) */
+static int sunh_conn_load_overlay_0(struct sunh_conn *conn)
+{
+	int err = 0;
+
+	mutex_lock(&conn->ovl_mutex);
+
+	if (conn->ovcs_id[0] != 0) {
+		dev_dbg(conn->dev, "base overlay already loaded\n");
+		goto out_unlock;
+	}
+
+	err = sunh_conn_insert_overlay(conn, 0, "imx8mp-sundv1-addon-base.dtbo");
+
+out_unlock:
+	mutex_unlock(&conn->ovl_mutex);
+	return err;
+}
+
+/* Load the model-specific overlay describing everything not in the overlay 0 */
+static int sunh_conn_load_overlay_1(struct sunh_conn *conn)
+{
+	u8 addon_id;
+	const char *filename;
+	int err;
+
+	mutex_lock(&conn->ovl_mutex);
+
+	if (conn->ovcs_id[0] == 0) {
+		dev_dbg(conn->dev, "base overlay not loaded\n");
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (conn->ovcs_id[1] != 0) {
+		dev_dbg(conn->dev, "addon overlay already loaded\n");
+		err = -EEXIST;
+		goto out_unlock;
+	}
+
+	err = nvmem_cell_read_u8(conn->dev, "id", &addon_id);
+	if (err)
+		goto out_unlock;
+
+	dev_dbg(conn->dev, "Found add-on ID %d\n", addon_id);
+
+	switch (addon_id) {
+	case 23:
+		filename = "imx8mp-sundv1-addon-13.dtbo";
+		break;
+	case 24:
+		filename = "imx8mp-sundv1-addon-15.dtbo";
+		break;
+	case 25:
+		filename = "imx8mp-sundv1-addon-18.dtbo";
+		break;
+	default:
+		dev_warn(conn->dev, "Unknown add-on ID %d\n", addon_id);
+		err = -ENODEV;
+		goto out_unlock;
+	}
+
+	err = sunh_conn_insert_overlay(conn, 1, filename);
+
+out_unlock:
+	mutex_unlock(&conn->ovl_mutex);
+	return err;
+}
+
+static void sunh_conn_unload_overlays(struct sunh_conn *conn)
+{
+	int level = SUNH_CONN_OVERLAY_N_LEVELS;
+	int err;
+
+	mutex_lock(&conn->ovl_mutex);
+	while (level) {
+		level--;
+
+		if (conn->ovcs_id[level] == 0)
+			continue;
+
+		dev_dbg(conn->dev, "remove overlay %d (ovcs id %d)",
+			level, conn->ovcs_id[level]);
+
+		err = of_overlay_remove(&conn->ovcs_id[level]);
+		if (err)
+			dev_err_probe(conn->dev, err, "Failed to remove overlay %d\n", level);
+	}
+	mutex_unlock(&conn->ovl_mutex);
+}
+
+static void sunh_conn_reset(struct sunh_conn *conn, bool keep_reset)
+{
+	gpiod_set_value_cansleep(conn->reset_gpio, 1);
+
+	if (keep_reset)
+		return;
+
+	mdelay(10);
+	gpiod_set_value_cansleep(conn->reset_gpio, 0);
+	mdelay(10);
+}
+
+static int sunh_conn_detach(struct sunh_conn *conn)
+{
+	/* Cancel any pending NVMEM notification jobs */
+	cancel_work_sync(&conn->nvmem_notifier_work);
+
+	/* Unload previouly loaded overlays */
+	sunh_conn_unload_overlays(conn);
+
+	/* Set reset signal to have it set on next plug */
+	sunh_conn_reset(conn, true);
+
+	return 0;
+}
+
+static int sunh_conn_attach(struct sunh_conn *conn)
+{
+	int err;
+
+	/* Reset the plugged board in order to start from a stable state */
+	sunh_conn_reset(conn, false);
+
+	err = sunh_conn_load_overlay_0(conn);
+	if (err)
+		goto err;
+
+	/*
+	 * -EPROBE_DEFER can be due to NVMEM cell not yet available, so
+	 * don't give up, an NVMEM event could arrive later
+	 */
+	err = sunh_conn_load_overlay_1(conn);
+	if (err && err != -EPROBE_DEFER)
+		goto err;
+
+	return 0;
+
+err:
+	sunh_conn_detach(conn);
+	return err;
+}
+
+static int sunh_conn_handle_event(struct sunh_conn *conn, bool plugged)
+{
+	int err;
+
+	if (plugged == conn->plugged)
+		return 0;
+
+	dev_dbg(conn->dev, "%s\n", plugged ? "connected" : "disconnected");
+
+	err = (plugged ?
+	       sunh_conn_attach(conn) :
+	       sunh_conn_detach(conn));
+
+	conn->plugged = plugged;
+
+	return err;
+}
+
+/*
+ * Return the current status of the connector as reported by the hardware,
+ * logging any errors.
+ */
+static int sunh_conn_get_connector_status(struct sunh_conn *conn)
+{
+	int val = gpiod_get_value_cansleep(conn->plugged_gpio);
+
+	if (val < 0)
+		dev_err(conn->dev, "Error reading plugged GPIO (%d)\n", val);
+
+	return val;
+}
+
+static irqreturn_t sunh_conn_gpio_irq(int irq, void *data)
+{
+	struct sunh_conn *conn = data;
+	int conn_status;
+
+	conn_status = sunh_conn_get_connector_status(conn);
+	if (conn_status >= 0)
+		sunh_conn_handle_event(conn, conn_status);
+
+	return IRQ_HANDLED;
+}
+
+static int plugged_read(void *dat, u64 *val)
+{
+	struct sunh_conn *conn = dat;
+
+	*val = conn->plugged;
+
+	return 0;
+}
+
+static int plugged_write(void *dat, u64 val)
+{
+	struct sunh_conn *conn = dat;
+
+	if (val > 1)
+		return -EINVAL;
+
+	return sunh_conn_handle_event(conn, val);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(plugged_fops, plugged_read, plugged_write, "%lld\n");
+
+static void sunh_conn_nvmem_notifier_work(struct work_struct *work)
+{
+	struct sunh_conn *conn = container_of(work, struct sunh_conn, nvmem_notifier_work);
+
+	sunh_conn_load_overlay_1(conn);
+}
+
+static int sunh_conn_nvmem_notifier(struct notifier_block *nb, unsigned long action, void *arg)
+{
+	struct sunh_conn *conn = container_of(nb, struct sunh_conn, nvmem_nb);
+
+	if (action == NVMEM_CELL_ADD)
+		queue_work(system_power_efficient_wq, &conn->nvmem_notifier_work);
+
+	return NOTIFY_OK;
+}
+
+static int sunh_conn_register_drm_bridge(struct sunh_conn *conn)
+{
+	struct device *dev = conn->dev;
+	struct device_node *dsi_np;
+
+	dsi_np = of_get_child_by_name(dev->of_node, "dsi");
+	if (!dsi_np)
+		return dev_err_probe(dev, -ENOENT, "dsi node not found");
+
+	const struct platform_device_info hpb_info = {
+		.parent = dev,
+		.fwnode = of_fwnode_handle(dsi_np),
+		.of_node_reused = true,
+		.name = "hotplug-dsi-bridge",
+		.id = PLATFORM_DEVID_NONE,
+	};
+
+	conn->hpb_pdev = platform_device_register_full(&hpb_info);
+	of_node_put(dsi_np); // platform core gets/puts the device node
+	if (IS_ERR(conn->hpb_pdev))
+		return dev_err_probe(dev, PTR_ERR(conn->hpb_pdev),
+				     "Error registering DRM bridge\n");
+
+	return 0;
+}
+
+static void sunh_conn_unregister_drm_bridge(struct sunh_conn *conn)
+{
+	platform_device_unregister(conn->hpb_pdev);
+}
+
+static int sunh_conn_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sunh_conn *conn;
+	int conn_status;
+	int err;
+
+	/* Cannot load overlay from filesystem before rootfs is mounted */
+	if (system_state < SYSTEM_RUNNING)
+		return -EPROBE_DEFER;
+
+	conn = devm_kzalloc(dev, sizeof(*conn), GFP_KERNEL);
+	if (!conn)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, conn);
+	conn->dev = dev;
+
+	mutex_init(&conn->ovl_mutex);
+	INIT_WORK(&conn->nvmem_notifier_work, sunh_conn_nvmem_notifier_work);
+
+	conn->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(conn->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(conn->reset_gpio),
+				     "Error getting reset GPIO\n");
+
+	conn->plugged_gpio = devm_gpiod_get_optional(dev, "plugged", GPIOD_IN);
+	if (IS_ERR(conn->plugged_gpio))
+		return dev_err_probe(dev, PTR_ERR(conn->plugged_gpio),
+				     "Error getting plugged GPIO\n");
+
+	err = sunh_conn_register_drm_bridge(conn);
+	if (err)
+		return err;
+
+	conn->nvmem_nb.notifier_call = sunh_conn_nvmem_notifier;
+	err = nvmem_register_notifier(&conn->nvmem_nb);
+	if (err) {
+		dev_err_probe(dev, err, "Error registering NVMEM notifier\n");
+		goto err_unregister_drm_bridge;
+	}
+
+	if (conn->plugged_gpio) {
+		err = devm_request_threaded_irq(dev, gpiod_to_irq(conn->plugged_gpio),
+						NULL, sunh_conn_gpio_irq,
+						IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						dev_name(dev), conn);
+		if (err) {
+			dev_err_probe(dev, err, "Error getting plugged GPIO IRQ\n");
+			goto err_nvmem_unregister_notifier;
+		}
+	}
+
+	conn_status = sunh_conn_get_connector_status(conn);
+	if (conn_status < 0) {
+		err = conn_status;
+		goto err_nvmem_unregister_notifier;
+	}
+
+	/* Ensure initial state is known and overlay loaded if plugged */
+	sunh_conn_handle_event(conn, conn_status);
+
+	conn->debugfs_root = debugfs_create_dir(dev_name(dev), NULL);
+	debugfs_create_file("plugged", 0644, conn->debugfs_root, conn, &plugged_fops);
+
+	return 0;
+
+err_nvmem_unregister_notifier:
+	nvmem_unregister_notifier(&conn->nvmem_nb);
+	cancel_work_sync(&conn->nvmem_notifier_work);
+err_unregister_drm_bridge:
+	sunh_conn_unregister_drm_bridge(conn);
+	return err;
+}
+
+static void sunh_conn_remove(struct platform_device *pdev)
+{
+	struct sunh_conn *conn = platform_get_drvdata(pdev);
+
+	debugfs_remove(conn->debugfs_root);
+	sunh_conn_detach(conn);
+
+	nvmem_unregister_notifier(&conn->nvmem_nb);
+	cancel_work_sync(&conn->nvmem_notifier_work);
+
+	sunh_conn_unregister_drm_bridge(conn);
+}
+
+static const struct of_device_id sunh_conn_dt_ids[] = {
+	{ .compatible = "ge,sunh-addon-connector" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, sunh_conn_dt_ids);
+
+static struct platform_driver sunh_conn_driver = {
+	.driver = {
+		.name = "sunh-addon-connector",
+		.of_match_table = sunh_conn_dt_ids,
+	},
+	.probe = sunh_conn_probe,
+	.remove_new = sunh_conn_remove,
+};
+module_platform_driver(sunh_conn_driver);
+
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("GE SUNH hotplug add-on connector");
+MODULE_LICENSE("GPL");

-- 
2.34.1


