Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB3146695
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 19:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfFNRzV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 13:55:21 -0400
Received: from foss.arm.com ([217.140.110.172]:39582 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727604AbfFNRzU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 13:55:20 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B91BED6E;
        Fri, 14 Jun 2019 10:55:18 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 155873F718;
        Fri, 14 Jun 2019 10:55:15 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        suzuki.poulose@arm.com,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-i2c@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-spi@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Takashi Iwai <tiwai@suse.com>, Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v2 17/28] drivers: Introduce bus_find_device_by_of_node() helper
Date:   Fri, 14 Jun 2019 18:54:12 +0100
Message-Id: <1560534863-15115-18-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a wrapper to bus_find_device() to search for a device
by the of_node pointer, reusing the generic match function.
Also convert the existing users to make use of the new helper.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-i2c@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-spi@vger.kernel.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c             |  7 +------
 drivers/hwtracing/coresight/of_coresight.c | 11 ++---------
 drivers/i2c/i2c-core-of.c                  |  7 +------
 drivers/nvmem/core.c                       |  7 +------
 drivers/of/of_mdio.c                       |  8 +-------
 drivers/of/platform.c                      |  7 +------
 drivers/spi/spi.c                          |  9 ++-------
 include/linux/device.h                     | 12 ++++++++++++
 sound/soc/rockchip/rk3399_gru_sound.c      |  9 ++-------
 9 files changed, 23 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index ad19df0..bd2498b 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -93,11 +93,6 @@ static struct bus_type mipi_dsi_bus_type = {
 	.pm = &mipi_dsi_device_pm_ops,
 };
 
-static int of_device_match(struct device *dev, const void *data)
-{
-	return dev->of_node == data;
-}
-
 /**
  * of_find_mipi_dsi_device_by_node() - find the MIPI DSI device matching a
  *    device tree node
@@ -110,7 +105,7 @@ struct mipi_dsi_device *of_find_mipi_dsi_device_by_node(struct device_node *np)
 {
 	struct device *dev;
 
-	dev = bus_find_device(&mipi_dsi_bus_type, NULL, np, of_device_match);
+	dev = bus_find_device_by_of_node(&mipi_dsi_bus_type, np);
 
 	return dev ? to_mipi_dsi_device(dev) : NULL;
 }
diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
index 3fc200e..f417f76 100644
--- a/drivers/hwtracing/coresight/of_coresight.c
+++ b/drivers/hwtracing/coresight/of_coresight.c
@@ -18,11 +18,6 @@
 #include <asm/smp_plat.h>
 
 
-static int of_dev_node_match(struct device *dev, const void *data)
-{
-	return dev->of_node == data;
-}
-
 static struct device *
 of_coresight_get_endpoint_device(struct device_node *endpoint)
 {
@@ -32,8 +27,7 @@ of_coresight_get_endpoint_device(struct device_node *endpoint)
 	 * If we have a non-configurable replicator, it will be found on the
 	 * platform bus.
 	 */
-	dev = bus_find_device(&platform_bus_type, NULL,
-			      endpoint, of_dev_node_match);
+	dev = bus_find_device_by_of_node(&platform_bus_type, endpoint);
 	if (dev)
 		return dev;
 
@@ -41,8 +35,7 @@ of_coresight_get_endpoint_device(struct device_node *endpoint)
 	 * We have a configurable component - circle through the AMBA bus
 	 * looking for the device that matches the endpoint node.
 	 */
-	return bus_find_device(&amba_bustype, NULL,
-			       endpoint, of_dev_node_match);
+	return bus_find_device_by_of_node(&amba_bustype, endpoint);
 }
 
 static inline bool of_coresight_legacy_ep_is_input(struct device_node *ep)
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 2eb59a2..74a4126 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -112,11 +112,6 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 	of_node_put(bus);
 }
 
-static int of_dev_node_match(struct device *dev, const void *data)
-{
-	return dev->of_node == data;
-}
-
 static int of_dev_or_parent_node_match(struct device *dev, const void *data)
 {
 	if (dev->of_node == data)
@@ -134,7 +129,7 @@ struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
 	struct device *dev;
 	struct i2c_client *client;
 
-	dev = bus_find_device(&i2c_bus_type, NULL, node, of_dev_node_match);
+	dev = bus_find_device_by_of_node(&i2c_bus_type, node);
 	if (!dev)
 		return NULL;
 
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index ac5d945..057d1ff 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -76,11 +76,6 @@ static struct bus_type nvmem_bus_type = {
 	.name		= "nvmem",
 };
 
-static int of_nvmem_match(struct device *dev, const void *nvmem_np)
-{
-	return dev->of_node == nvmem_np;
-}
-
 static struct nvmem_device *of_nvmem_find(struct device_node *nvmem_np)
 {
 	struct device *d;
@@ -88,7 +83,7 @@ static struct nvmem_device *of_nvmem_find(struct device_node *nvmem_np)
 	if (!nvmem_np)
 		return NULL;
 
-	d = bus_find_device(&nvmem_bus_type, NULL, nvmem_np, of_nvmem_match);
+	d = bus_find_device_by_of_node(&nvmem_bus_type, nvmem_np);
 
 	if (!d)
 		return NULL;
diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 44f5349..000b957 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -280,12 +280,6 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 }
 EXPORT_SYMBOL(of_mdiobus_register);
 
-/* Helper function for of_phy_find_device */
-static int of_phy_match(struct device *dev, const void *phy_np)
-{
-	return dev->of_node == phy_np;
-}
-
 /**
  * of_phy_find_device - Give a PHY node, find the phy_device
  * @phy_np: Pointer to the phy's device tree node
@@ -301,7 +295,7 @@ struct phy_device *of_phy_find_device(struct device_node *phy_np)
 	if (!phy_np)
 		return NULL;
 
-	d = bus_find_device(&mdio_bus_type, NULL, phy_np, of_phy_match);
+	d = bus_find_device_by_of_node(&mdio_bus_type, phy_np);
 	if (d) {
 		mdiodev = to_mdio_device(d);
 		if (mdiodev->flags & MDIO_DEVICE_FLAG_PHY)
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 008d79e..de11905 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -37,11 +37,6 @@ static const struct of_device_id of_skipped_node_table[] = {
 	{} /* Empty terminated list */
 };
 
-static int of_dev_node_match(struct device *dev, const void *data)
-{
-	return dev->of_node == data;
-}
-
 /**
  * of_find_device_by_node - Find the platform_device associated with a node
  * @np: Pointer to device tree node
@@ -55,7 +50,7 @@ struct platform_device *of_find_device_by_node(struct device_node *np)
 {
 	struct device *dev;
 
-	dev = bus_find_device(&platform_bus_type, NULL, np, of_dev_node_match);
+	dev = bus_find_device_by_of_node(&platform_bus_type, np);
 	return dev ? to_platform_device(dev) : NULL;
 }
 EXPORT_SYMBOL(of_find_device_by_node);
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index a256be5..cc4d83e 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3538,16 +3538,11 @@ EXPORT_SYMBOL_GPL(spi_write_then_read);
 /*-------------------------------------------------------------------------*/
 
 #if IS_ENABLED(CONFIG_OF)
-static int __spi_of_device_match(struct device *dev, const void *data)
-{
-	return dev->of_node == data;
-}
-
 /* must call put_device() when done with returned spi_device device */
 struct spi_device *of_find_spi_device_by_node(struct device_node *node)
 {
-	struct device *dev = bus_find_device(&spi_bus_type, NULL, node,
-						__spi_of_device_match);
+	struct device *dev = bus_find_device_by_of_node(&spi_bus_type, node);
+
 	return dev ? to_spi_device(dev) : NULL;
 }
 EXPORT_SYMBOL_GPL(of_find_spi_device_by_node);
diff --git a/include/linux/device.h b/include/linux/device.h
index b1b8c90..35f51d6 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -189,6 +189,18 @@ static inline struct device *bus_find_device_by_name(struct bus_type *bus,
 	return bus_find_device(bus, start, name, device_match_name);
 }
 
+/**
+ * bus_find_device_by_of_node : device iterator for locating a particular device
+ * matching the of_node.
+ * @bus: bus type
+ * @np: of_node of the device to match.
+ */
+static inline struct device *
+bus_find_device_by_of_node(struct bus_type *bus, const struct device_node *np)
+{
+	return bus_find_device(bus, NULL, np, device_match_of_node);
+}
+
 struct device *subsys_find_device_by_id(struct bus_type *bus, unsigned int id,
 					struct device *hint);
 int bus_for_each_drv(struct bus_type *bus, struct device_driver *start,
diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index c04c9ed..2fb7f8e 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -405,11 +405,6 @@ static const struct dailink_match_data dailink_match[] = {
 	},
 };
 
-static int of_dev_node_match(struct device *dev, const void *data)
-{
-	return dev->of_node == data;
-}
-
 static int rockchip_sound_codec_node_match(struct device_node *np_codec)
 {
 	struct device *dev;
@@ -421,8 +416,8 @@ static int rockchip_sound_codec_node_match(struct device_node *np_codec)
 			continue;
 
 		if (dailink_match[i].bus_type) {
-			dev = bus_find_device(dailink_match[i].bus_type, NULL,
-					      np_codec, of_dev_node_match);
+			dev = bus_find_device_by_of_node(dailink_match[i].bus_type,
+							 np_codec);
 			if (!dev)
 				continue;
 			put_device(dev);
-- 
2.7.4

