Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E06E3671D5D
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 14:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjARNQz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 08:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjARNQW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 08:16:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1012E7D651;
        Wed, 18 Jan 2023 04:40:59 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78005188D;
        Wed, 18 Jan 2023 13:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674045656;
        bh=fuJiYqY9s2sFHlnBRxhSmatb7zhGB9NfP0gFrwqDISw=;
        h=From:To:Cc:Subject:Date:From;
        b=lXdYuG88SqpjNZTy1UEG9ZKBvYwCHwypS/Dolt6ymkAV/DbBuf1p4OocBhgNbziCC
         gzGFZW+0KjXYVj6a3rWwiFdno1PCbfdIRy1YALNN7Guc/jspIFob+4duIDiZkTxFnC
         8y4SQeinM4uaAnUj5Pq0WFkJwKq5gy0/D2RvkRzY=
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
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 0/7] i2c-atr and FPDLink
Date:   Wed, 18 Jan 2023 14:40:24 +0200
Message-Id: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_FILL_THIS_FORM_SHORT autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

You can find the v6 from:

https://lore.kernel.org/all/20230105140307.272052-1-tomi.valkeinen@ideasonboard.com/

Main changes:

* i2c-atr: Use bus notifier. This allows us to drop the patch that adds
  the attach_client/detach_client callbacks. On the downside, it removes
  the option for error handling if the translation setup fails, and also
  doesn't provide us the pointer to the i2c_board_info. I belive both
  are acceptable downsides.

* Use fwnode in the fpdlink drivers instead of OF

* Addressed all the review comments (I hope)

* Lots of cosmetic or minor fixes which I came up while doing the fwnode
  change

Diff to v6 below.

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

 .../bindings/media/i2c/ti,ds90ub913.yaml      |  133 +
 .../bindings/media/i2c/ti,ds90ub953.yaml      |  134 +
 .../bindings/media/i2c/ti,ds90ub960.yaml      |  425 ++
 Documentation/i2c/index.rst                   |    1 +
 Documentation/i2c/muxes/i2c-atr.rst           |   83 +
 MAINTAINERS                                   |   16 +
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  547 +++
 drivers/media/i2c/Kconfig                     |   47 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub913.c                 |  848 ++++
 drivers/media/i2c/ds90ub953.c                 | 1576 ++++++
 drivers/media/i2c/ds90ub960.c                 | 4254 +++++++++++++++++
 include/linux/i2c-atr.h                       |  117 +
 include/media/i2c/ds90ub9xx.h                 |   16 +
 16 files changed, 8210 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
 create mode 100644 Documentation/i2c/muxes/i2c-atr.rst
 create mode 100644 drivers/i2c/i2c-atr.c
 create mode 100644 drivers/media/i2c/ds90ub913.c
 create mode 100644 drivers/media/i2c/ds90ub953.c
 create mode 100644 drivers/media/i2c/ds90ub960.c
 create mode 100644 include/linux/i2c-atr.h
 create mode 100644 include/media/i2c/ds90ub9xx.h

Interdiff against v6:
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 664799ae55be..1ba22450cdba 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -88,7 +88,7 @@ properties:
               - 4 # CSI2 NON-SYNC
             description:
               FPD-Link Input Mode. This should reflect the hardware and the
-              default mode of the connected camera module.
+              default mode of the connected device.
 
           ti,cdr-mode:
             $ref: /schemas/types.yaml#/definitions/uint32
@@ -97,7 +97,7 @@ properties:
               - 1 # FPD-Link IV
             description:
               FPD-Link CDR Mode. This should reflect the hardware and the
-              default mode of the connected camera module.
+              default mode of the connected device.
 
           ti,strobe-pos:
             $ref: /schemas/types.yaml#/definitions/int32
@@ -212,6 +212,14 @@ properties:
             required:
               - data-lanes
 
+    required:
+      - port@0
+      - port@1
+      - port@2
+      - port@3
+      - port@4
+      - port@5
+
 required:
   - compatible
   - reg
@@ -265,6 +273,16 @@ examples:
             };
           };
 
+          /* Port 2, unused */
+          port@2 {
+            reg = <2>;
+          };
+
+          /* Port 3, unused */
+          port@3 {
+            reg = <3>;
+          };
+
           /* Port 4, CSI-2 TX */
           port@4 {
             reg = <4>;
@@ -274,6 +292,11 @@ examples:
               remote-endpoint = <&csi2_phy0>;
             };
           };
+
+          /* Port 5, unused */
+          port@5 {
+            reg = <5>;
+          };
         };
 
         links {
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 0668c98886ad..1d43cf3824eb 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -80,6 +80,8 @@ struct i2c_atr {
 	struct mutex lock;
 	int max_adapters;
 
+	struct notifier_block i2c_nb;
+
 	struct i2c_adapter *adapter[];
 };
 
@@ -272,7 +274,6 @@ static const struct i2c_lock_operations i2c_atr_lock_ops = {
 };
 
 static int i2c_atr_attach_client(struct i2c_adapter *adapter,
-				 const struct i2c_board_info *info,
 				 const struct i2c_client *client)
 {
 	struct i2c_atr_chan *chan = adapter->algo_data;
@@ -285,8 +286,7 @@ static int i2c_atr_attach_client(struct i2c_adapter *adapter,
 	if (!c2a)
 		return -ENOMEM;
 
-	ret = atr->ops->attach_client(atr, chan->chan_id, info, client,
-				      &alias_id);
+	ret = atr->ops->attach_client(atr, chan->chan_id, client, &alias_id);
 	if (ret)
 		goto err_free;
 
@@ -318,15 +318,53 @@ static void i2c_atr_detach_client(struct i2c_adapter *adapter,
 	}
 }
 
-static const struct i2c_attach_operations i2c_atr_attach_ops = {
-	.attach_client = i2c_atr_attach_client,
-	.detach_client = i2c_atr_detach_client,
-};
+static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
+				     unsigned long event, void *device)
+{
+	struct i2c_atr *atr = container_of(nb, struct i2c_atr, i2c_nb);
+	struct device *dev = device;
+	struct i2c_client *client;
+	u32 chan_id;
+	int ret;
+
+	client = i2c_verify_client(dev);
+	if (!client)
+		return NOTIFY_DONE;
+
+	/* Is the client in one of our adapters? */
+	for (chan_id = 0; chan_id < atr->max_adapters; ++chan_id) {
+		if (client->adapter == atr->adapter[chan_id])
+			break;
+	}
+
+	if (chan_id == atr->max_adapters)
+		return NOTIFY_DONE;
+
+	switch (event) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		ret = i2c_atr_attach_client(client->adapter, client);
+		if (ret)
+			dev_err(atr->dev,
+				"Failed to attach remote client '%s': %d\n",
+				dev_name(dev), ret);
+		break;
+
+	case BUS_NOTIFY_DEL_DEVICE:
+		i2c_atr_detach_client(client->adapter, client);
+		break;
+
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
 
 struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 			    const struct i2c_atr_ops *ops, int max_adapters)
 {
 	struct i2c_atr *atr;
+	int ret;
 
 	if (max_adapters > ATR_MAX_ADAPTERS)
 		return ERR_PTR(-EINVAL);
@@ -352,12 +390,20 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 		atr->algo.smbus_xfer = i2c_atr_smbus_xfer;
 	atr->algo.functionality = i2c_atr_functionality;
 
+	atr->i2c_nb.notifier_call = i2c_atr_bus_notifier_call;
+	ret = bus_register_notifier(&i2c_bus_type, &atr->i2c_nb);
+	if (ret) {
+		mutex_destroy(&atr->lock);
+		return ERR_PTR(ret);
+	}
+
 	return atr;
 }
 EXPORT_SYMBOL_NS_GPL(i2c_atr_new, I2C_ATR);
 
 void i2c_atr_delete(struct i2c_atr *atr)
 {
+	bus_unregister_notifier(&i2c_bus_type, &atr->i2c_nb);
 	mutex_destroy(&atr->lock);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, I2C_ATR);
@@ -400,7 +446,6 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 	chan->adap.timeout = parent->timeout;
 	chan->adap.quirks = parent->quirks;
 	chan->adap.lock_ops = &i2c_atr_lock_ops;
-	chan->adap.attach_ops = &i2c_atr_attach_ops;
 
 	if (bus_handle) {
 		device_set_node(&chan->adap.dev, fwnode_handle_get(bus_handle));
@@ -423,6 +468,8 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 		fwnode_handle_put(atr_node);
 	}
 
+	atr->adapter[chan_id] = &chan->adap;
+
 	ret = i2c_add_adapter(&chan->adap);
 	if (ret) {
 		dev_err(dev, "failed to add atr-adapter %u (error=%d)\n",
@@ -442,8 +489,6 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 
 	dev_dbg(dev, "Added ATR child bus %d\n", i2c_adapter_id(&chan->adap));
 
-	atr->adapter[chan_id] = &chan->adap;
-
 	return 0;
 
 err_fwnode_put:
@@ -468,14 +513,15 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 
 	dev_dbg(dev, "Removing ATR child bus %d\n", i2c_adapter_id(adap));
 
-	atr->adapter[chan_id] = NULL;
-
 	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
 		 chan->chan_id);
 	sysfs_remove_link(&dev->kobj, symlink_name);
 	sysfs_remove_link(&chan->adap.dev.kobj, "atr_device");
 
 	i2c_del_adapter(adap);
+
+	atr->adapter[chan_id] = NULL;
+
 	fwnode_handle_put(fwnode);
 	mutex_destroy(&chan->orig_addrs_lock);
 	kfree(chan->orig_addrs);
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 8a0888ba89e5..7539b0740351 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -916,7 +916,6 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
-	const struct i2c_attach_operations *attach_ops;
 	struct i2c_client	*client;
 	int			status;
 
@@ -968,24 +967,15 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		}
 	}
 
-	attach_ops = adap->attach_ops;
-
-	if (attach_ops && attach_ops->attach_client &&
-	    attach_ops->attach_client(adap, info, client))
-		goto out_remove_swnode;
-
 	status = device_register(&client->dev);
 	if (status)
-		goto out_detach_client;
+		goto out_remove_swnode;
 
 	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
 		client->name, dev_name(&client->dev));
 
 	return client;
 
-out_detach_client:
-	if (attach_ops && attach_ops->detach_client)
-		attach_ops->detach_client(adap, client);
 out_remove_swnode:
 	device_remove_software_node(&client->dev);
 out_err_put_of_node:
@@ -1007,18 +997,9 @@ EXPORT_SYMBOL_GPL(i2c_new_client_device);
  */
 void i2c_unregister_device(struct i2c_client *client)
 {
-	const struct i2c_attach_operations *attach_ops;
-	struct i2c_adapter *adap;
-
 	if (IS_ERR_OR_NULL(client))
 		return;
 
-	adap = client->adapter;
-	attach_ops = adap->attach_ops;
-
-	if (attach_ops && attach_ops->detach_client)
-		attach_ops->detach_client(adap, client);
-
 	if (client->dev.of_node) {
 		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
 		of_node_put(client->dev.of_node);
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 29594c724307..0590312ec751 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1602,40 +1602,40 @@ endmenu
 menu "Video serializers and deserializers"
 
 config VIDEO_DS90UB913
-	tristate "TI DS90UB913 Serializer"
+	tristate "TI DS90UB913 FPD-Link III Serializer"
 	depends on OF && I2C && VIDEO_DEV
+	select I2C_ATR
 	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
-	select REGMAP_I2C
 	select OF_GPIO
-	select I2C_ATR
+	select REGMAP_I2C
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Device driver for the Texas Instruments DS90UB913
 	  FPD-Link III Serializer.
 
 config VIDEO_DS90UB953
-	tristate "TI DS90UB953 Serializer"
+	tristate "TI FPD-Link III/IV CSI-2 Serializers"
 	depends on OF && I2C && VIDEO_DEV
+	select I2C_ATR
 	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
-	select REGMAP_I2C
 	select OF_GPIO
-	select I2C_ATR
+	select REGMAP_I2C
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Device driver for the Texas Instruments DS90UB953
 	  FPD-Link III Serializer and DS90UB971 FPD-Link IV Serializer.
 
 config VIDEO_DS90UB960
-	tristate "TI DS90UB960 Deserializer"
+	tristate "TI FPD-Link III/IV Deserializers"
 	depends on OF && I2C && VIDEO_DEV
+	select I2C_ATR
 	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
-	select REGMAP_I2C
 	select OF_GPIO
-	select I2C_ATR
+	select REGMAP_I2C
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Device driver for the Texas Instruments DS90UB960
 	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 0a60afb09cd3..befa78128a9a 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -5,19 +5,19 @@
  * Based on a driver from Luca Ceresoli <luca@lucaceresoli.net>
  *
  * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>
- * Copyright (c) 2022 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ * Copyright (c) 2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  */
 
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/fwnode.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c-atr.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_graph.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <media/i2c/ds90ub9xx.h>
@@ -41,8 +41,9 @@
 #define UB913_REG_GENERAL_CFG_PCLK_RISING	BIT(0)
 
 #define UB913_REG_MODE_SEL			0x05
-#define UB913_REG_MODE_SEL_MODE_UP_TO_DATE	BIT(4)
 #define UB913_REG_MODE_SEL_MODE_OVERRIDE	BIT(5)
+#define UB913_REG_MODE_SEL_MODE_UP_TO_DATE	BIT(4)
+#define UB913_REG_MODE_SEL_MODE_MASK		GENMASK(3, 0)
 
 #define UB913_REG_CRC_ERRORS_LSB		0x0a
 #define UB913_REG_CRC_ERRORS_MSB		0x0b
@@ -67,7 +68,6 @@ struct ub913_data {
 	struct clk		*clkin;
 
 	struct gpio_chip	gpio_chip;
-	char			gpio_chip_name[64];
 
 	struct v4l2_subdev	sd;
 	struct media_pad	pads[2];
@@ -75,11 +75,10 @@ struct ub913_data {
 	struct v4l2_async_notifier	notifier;
 
 	struct v4l2_subdev	*source_sd;
+	u16			source_sd_pad;
 
 	u64			enabled_source_streams;
 
-	struct device_node	*tx_ep_np;
-
 	struct clk_hw		*clkout_clk_hw;
 
 	struct ds90ub9xx_platform_data *plat_data;
@@ -132,20 +131,14 @@ static int ub913_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 				    int value)
 {
 	struct ub913_data *priv = gpiochip_get_data(gc);
-	unsigned int reg_idx;
-	unsigned int field_idx;
-	int ret;
-
-	reg_idx = offset / 2;
-	field_idx = offset % 2;
-
-	ret = regmap_update_bits(
-		priv->regmap, UB913_REG_GPIO_CFG(reg_idx),
-		UB913_REG_GPIO_CFG_MASK(field_idx),
-		UB913_REG_GPIO_CFG_ENABLE(field_idx) |
-			(value ? UB913_REG_GPIO_CFG_OUT_VAL(field_idx) : 0));
-
-	return ret;
+	unsigned int reg_idx = offset / 2;
+	unsigned int field_idx = offset % 2;
+
+	return regmap_update_bits(priv->regmap, UB913_REG_GPIO_CFG(reg_idx),
+				  UB913_REG_GPIO_CFG_MASK(field_idx),
+				  UB913_REG_GPIO_CFG_ENABLE(field_idx) |
+					  (value ? UB913_REG_GPIO_CFG_OUT_VAL(field_idx) :
+						   0));
 }
 
 static void ub913_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
@@ -172,20 +165,16 @@ static int ub913_gpiochip_probe(struct ub913_data *priv)
 	/* Initialize GPIOs 0 and 1 to local control, tri-state */
 	ub913_write(priv, UB913_REG_GPIO_CFG(0), 0);
 
-	scnprintf(priv->gpio_chip_name, sizeof(priv->gpio_chip_name), "%s",
-		  dev_name(dev));
-
-	gc->label = priv->gpio_chip_name;
+	gc->label = dev_name(dev);
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 	gc->base = -1;
-	gc->can_sleep = 1;
+	gc->can_sleep = true;
 	gc->ngpio = UB913_NUM_GPIOS;
 	gc->get_direction = ub913_gpio_get_direction;
 	gc->direction_output = ub913_gpio_direction_out;
 	gc->set = ub913_gpio_set;
 	gc->of_xlate = ub913_gpio_of_xlate;
-	gc->of_node = priv->client->dev.of_node;
 	gc->of_gpio_n_cells = 2;
 
 	ret = gpiochip_add_data(gc, priv);
@@ -219,19 +208,14 @@ static int ub913_enable_streams(struct v4l2_subdev *sd,
 				u64 streams_mask)
 {
 	struct ub913_data *priv = sd_to_ub913(sd);
-	struct media_pad *remote_pad;
 	u64 sink_streams;
 	int ret;
 
-	if (streams_mask & priv->enabled_source_streams)
-		return -EALREADY;
-
-	sink_streams = v4l2_subdev_state_xlate_streams(
-		state, UB913_PAD_SOURCE, UB913_PAD_SINK, &streams_mask);
-
-	remote_pad = media_pad_remote_pad_first(&priv->pads[UB913_PAD_SINK]);
+	sink_streams = v4l2_subdev_state_xlate_streams(state, UB913_PAD_SOURCE,
+						       UB913_PAD_SINK,
+						       &streams_mask);
 
-	ret = v4l2_subdev_enable_streams(priv->source_sd, remote_pad->index,
+	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
 					 sink_streams);
 	if (ret)
 		return ret;
@@ -246,19 +230,14 @@ static int ub913_disable_streams(struct v4l2_subdev *sd,
 				 u64 streams_mask)
 {
 	struct ub913_data *priv = sd_to_ub913(sd);
-	struct media_pad *remote_pad;
-	int ret;
 	u64 sink_streams;
+	int ret;
 
-	if ((streams_mask & priv->enabled_source_streams) != streams_mask)
-		return -EALREADY;
-
-	sink_streams = v4l2_subdev_state_xlate_streams(
-		state, UB913_PAD_SOURCE, UB913_PAD_SINK, &streams_mask);
-
-	remote_pad = media_pad_remote_pad_first(&priv->pads[UB913_PAD_SINK]);
+	sink_streams = v4l2_subdev_state_xlate_streams(state, UB913_PAD_SOURCE,
+						       UB913_PAD_SINK,
+						       &streams_mask);
 
-	ret = v4l2_subdev_disable_streams(priv->source_sd, remote_pad->index,
+	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
 					  sink_streams);
 	if (ret)
 		return ret;
@@ -317,24 +296,6 @@ static int ub913_set_routing(struct v4l2_subdev *sd,
 	return _ub913_set_routing(sd, state, routing);
 }
 
-static int ub913_get_source_frame_desc(struct ub913_data *priv,
-				       struct v4l2_mbus_frame_desc *desc)
-{
-	struct media_pad *pad;
-	int ret;
-
-	pad = media_pad_remote_pad_first(&priv->pads[UB913_PAD_SINK]);
-	if (!pad)
-		return -EPIPE;
-
-	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc, pad->index,
-			       desc);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_frame_desc *fd)
 {
@@ -348,27 +309,29 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	if (pad != UB913_PAD_SOURCE)
 		return -EINVAL;
 
-	ret = ub913_get_source_frame_desc(priv, &source_fd);
+	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
+			       priv->source_sd_pad, &source_fd);
 	if (ret)
 		return ret;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	routing = &state->routing;
-
 	memset(fd, 0, sizeof(*fd));
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
 
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	routing = &state->routing;
+
 	for_each_active_route(routing, route) {
 		unsigned int i;
 
 		if (route->source_pad != pad)
 			continue;
 
-		for (i = 0; i < source_fd.num_entries; ++i)
+		for (i = 0; i < source_fd.num_entries; ++i) {
 			if (source_fd.entry[i].stream == route->sink_stream)
 				break;
+		}
 
 		if (i == source_fd.num_entries) {
 			dev_err(&priv->client->dev,
@@ -454,23 +417,24 @@ static int ub913_log_status(struct v4l2_subdev *sd)
 	u8 v, v1, v2;
 
 	ub913_read(priv, UB913_REG_MODE_SEL, &v);
-	dev_info(dev, "MODE_SEL %#x\n", v);
+	dev_info(dev, "MODE_SEL %#02x\n", v);
 
 	ub913_read(priv, UB913_REG_CRC_ERRORS_LSB, &v1);
 	ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &v2);
 	dev_info(dev, "CRC errors %u\n", v1 | (v2 << 8));
 
-	ub913_read(priv, UB913_REG_GENERAL_STATUS, &v);
-	dev_info(dev, "GENERAL_STATUS %#x\n", v);
-
-	ub913_read(priv, UB913_REG_PLL_OVR, &v);
-	dev_info(dev, "PLL_OVR %#x\n", v);
-
 	/* clear CRC errors */
 	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
-	ub913_write(priv, UB913_REG_GENERAL_CFG, v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET);
+	ub913_write(priv, UB913_REG_GENERAL_CFG,
+		    v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET);
 	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
 
+	ub913_read(priv, UB913_REG_GENERAL_STATUS, &v);
+	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
+
+	ub913_read(priv, UB913_REG_PLL_OVR, &v);
+	dev_info(dev, "PLL_OVR %#02x\n", v);
+
 	return 0;
 }
 
@@ -482,7 +446,7 @@ static const struct v4l2_subdev_pad_ops ub913_pad_ops = {
 	.enable_streams = ub913_enable_streams,
 	.disable_streams = ub913_disable_streams,
 	.set_routing = ub913_set_routing,
-	.get_frame_desc	= ub913_get_frame_desc,
+	.get_frame_desc = ub913_get_frame_desc,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub913_set_fmt,
 	.init_cfg = ub913_init_cfg,
@@ -503,7 +467,6 @@ static int ub913_notify_bound(struct v4l2_async_notifier *notifier,
 {
 	struct ub913_data *priv = sd_to_ub913(notifier->sd);
 	struct device *dev = &priv->client->dev;
-	unsigned int src_pad;
 	int ret;
 
 	ret = media_entity_get_fwnode_pad(&source_subdev->entity,
@@ -516,15 +479,16 @@ static int ub913_notify_bound(struct v4l2_async_notifier *notifier,
 	}
 
 	priv->source_sd = source_subdev;
-	src_pad = ret;
+	priv->source_sd_pad = ret;
 
-	ret = media_create_pad_link(&source_subdev->entity, src_pad,
+	ret = media_create_pad_link(&source_subdev->entity, priv->source_sd_pad,
 				    &priv->sd.entity, UB913_PAD_SINK,
 				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
+					    MEDIA_LNK_FL_IMMUTABLE);
 	if (ret) {
 		dev_err(dev, "Unable to link %s:%u -> %s:0\n",
-			source_subdev->name, src_pad, priv->sd.name);
+			source_subdev->name, priv->source_sd_pad,
+			priv->sd.name);
 		return ret;
 	}
 
@@ -539,22 +503,22 @@ static int ub913_v4l2_notifier_register(struct ub913_data *priv)
 {
 	struct device *dev = &priv->client->dev;
 	struct v4l2_async_subdev *asd;
-	struct device_node *ep_node;
+	struct fwnode_handle *ep_fwnode;
 	int ret;
 
-	ep_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
-	if (!ep_node) {
+	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+						    UB913_PAD_SINK, 0, 0);
+	if (!ep_fwnode) {
 		dev_err(dev, "No graph endpoint\n");
 		return -ENODEV;
 	}
 
 	v4l2_async_nf_init(&priv->notifier);
 
-	asd = v4l2_async_nf_add_fwnode_remote(&priv->notifier,
-					      of_fwnode_handle(ep_node),
+	asd = v4l2_async_nf_add_fwnode_remote(&priv->notifier, ep_fwnode,
 					      struct v4l2_async_subdev);
 
-	of_node_put(ep_node);
+	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
 		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
@@ -587,6 +551,8 @@ static int ub913_register_clkout(struct ub913_data *priv)
 	int ret;
 
 	name = kasprintf(GFP_KERNEL, "ds90ub913.%s.clk_out", dev_name(dev));
+	if (!name)
+		return -ENOMEM;
 
 	priv->clkout_clk_hw = devm_clk_hw_register_fixed_factor(dev, name,
 		__clk_get_name(priv->clkin), 0, 1, 2);
@@ -653,25 +619,21 @@ static int ub913_add_i2c_adapter(struct ub913_data *priv)
 
 static int ub913_parse_dt(struct ub913_data *priv)
 {
-	struct device_node *np = priv->client->dev.of_node;
 	struct device *dev = &priv->client->dev;
+	struct fwnode_handle *ep_fwnode;
 	int ret;
-	struct device_node *ep_np;
 
-	if (!np) {
-		dev_err(dev, "OF: no device tree node!\n");
+	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+						    UB913_PAD_SINK, 0, 0);
+	if (!ep_fwnode) {
+		dev_err(dev, "No sink endpoint\n");
 		return -ENOENT;
 	}
 
-	ep_np = of_graph_get_endpoint_by_regs(np, 0, 0);
-	if (!ep_np) {
-		dev_err(dev, "OF: no endpoint\n");
-		return -ENOENT;
-	}
-
-	ret = of_property_read_u32(ep_np, "pclk-sample", &priv->pclk_polarity);
+	ret = fwnode_property_read_u32(ep_fwnode, "pclk-sample",
+				       &priv->pclk_polarity);
 
-	of_node_put(ep_np);
+	fwnode_handle_put(ep_fwnode);
 
 	if (ret) {
 		dev_err(dev, "OF: failed to parse pclk-sample: %d\n", ret);
@@ -681,84 +643,45 @@ static int ub913_parse_dt(struct ub913_data *priv)
 	return 0;
 }
 
-static int ub913_probe(struct i2c_client *client)
+static int ub913_hw_init(struct ub913_data *priv)
 {
-	struct device *dev = &client->dev;
-	struct ub913_data *priv;
-	int ret;
-	u8 v;
+	struct device *dev = &priv->client->dev;
 	bool mode_override;
 	u8 mode;
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->client = client;
-
-	priv->plat_data = dev_get_platdata(&client->dev);
-	if (!priv->plat_data) {
-		dev_err(dev, "Platform data missing\n");
-		return -ENODEV;
-	}
-
-	priv->regmap = devm_regmap_init_i2c(client, &ub913_regmap_config);
-	if (IS_ERR(priv->regmap)) {
-		dev_err(dev, "Failed to init regmap\n");
-		return PTR_ERR(priv->regmap);
-	}
-
-	/* ub913 can also work without ext clock, but that is not supported */
-	priv->clkin = devm_clk_get(dev, "clkin");
-	if (IS_ERR(priv->clkin)) {
-		ret = PTR_ERR(priv->clkin);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Cannot get CLKIN (%d)", ret);
-		return ret;
-	}
-
-	ret = ub913_parse_dt(priv);
-	if (ret)
-		return ret;
+	int ret;
+	u8 v;
 
 	ret = ub913_read(priv, UB913_REG_MODE_SEL, &v);
 	if (ret)
 		return ret;
 
-	if (!(v & UB913_REG_MODE_SEL_MODE_UP_TO_DATE)) {
-		dev_err(dev, "Mode value not stabilized\n");
-		return -ENODEV;
-	}
+	if (!(v & UB913_REG_MODE_SEL_MODE_UP_TO_DATE))
+		return dev_err_probe(dev, -ENODEV,
+				     "Mode value not stabilized\n");
 
 	mode_override = v & UB913_REG_MODE_SEL_MODE_OVERRIDE;
-	mode = v & 0xf;
+	mode = v & UB913_REG_MODE_SEL_MODE_MASK;
 
 	dev_dbg(dev, "mode from %s: %#x\n",
 		mode_override ? "reg" : "deserializer", mode);
 
 	ret = ub913_i2c_master_init(priv);
-	if (ret) {
-		dev_err(dev, "i2c master init failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = ub913_gpiochip_probe(priv);
-	if (ret) {
-		dev_err(dev, "Failed to init gpiochip\n");
-		return ret;
-	}
-
-	ret = ub913_register_clkout(priv);
-	if (ret) {
-		dev_err(dev, "Failed to register clkout\n");
-		goto err_gpiochip_remove;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "i2c master init failed\n");
 
 	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
 	v &= ~UB913_REG_GENERAL_CFG_PCLK_RISING;
 	v |= priv->pclk_polarity ? UB913_REG_GENERAL_CFG_PCLK_RISING : 0;
 	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
 
+	return 0;
+}
+
+static int ub913_subdev_init(struct ub913_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub913_subdev_ops);
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
@@ -768,14 +691,18 @@ static int ub913_probe(struct i2c_client *client)
 	priv->pads[1].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
-	if (ret) {
-		dev_err(dev, "Failed to init pads\n");
-		goto err_gpiochip_remove;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init pads\n");
 
-	priv->tx_ep_np = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);
-	if (priv->tx_ep_np)
-		priv->sd.fwnode = of_fwnode_handle(priv->tx_ep_np);
+	priv->sd.fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+							  UB913_PAD_SOURCE, 0,
+							  0);
+
+	if (!priv->sd.fwnode) {
+		ret = -ENODEV;
+		dev_err_probe(dev, ret, "Missing TX endpoint\n");
+		goto err_entity_cleanup;
+	}
 
 	ret = v4l2_subdev_init_finalize(&priv->sd);
 	if (ret)
@@ -783,35 +710,99 @@ static int ub913_probe(struct i2c_client *client)
 
 	ret = ub913_v4l2_notifier_register(priv);
 	if (ret) {
-		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
-		goto err_free_state;
+		dev_err_probe(dev, ret,
+			      "v4l2 subdev notifier register failed\n");
+		goto err_subdev_cleanup;
 	}
 
 	ret = v4l2_async_register_subdev(&priv->sd);
 	if (ret) {
-		dev_err(dev, "v4l2_async_register_subdev error: %d\n", ret);
+		dev_err_probe(dev, ret, "v4l2_async_register_subdev error\n");
 		goto err_unreg_notif;
 	}
 
-	ret = ub913_add_i2c_adapter(priv);
-	if (ret) {
-		dev_err(dev, "failed to add remote i2c adapter\n");
-		goto err_unreg_async_subdev;
-	}
-
 	return 0;
 
-err_unreg_async_subdev:
-	v4l2_async_unregister_subdev(&priv->sd);
 err_unreg_notif:
 	ub913_v4l2_nf_unregister(priv);
-err_free_state:
+err_subdev_cleanup:
 	v4l2_subdev_cleanup(&priv->sd);
 err_entity_cleanup:
-	if (priv->tx_ep_np)
-		of_node_put(priv->tx_ep_np);
+	media_entity_cleanup(&priv->sd.entity);
+
+	return ret;
+}
 
+static void ub913_subdev_uninit(struct ub913_data *priv)
+{
+	v4l2_async_unregister_subdev(&priv->sd);
+	ub913_v4l2_nf_unregister(priv);
+	v4l2_subdev_cleanup(&priv->sd);
 	media_entity_cleanup(&priv->sd.entity);
+}
+
+static int ub913_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ub913_data *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+
+	priv->plat_data = dev_get_platdata(&client->dev);
+	if (!priv->plat_data)
+		return dev_err_probe(dev, -ENODEV, "Platform data missing\n");
+
+	priv->regmap = devm_regmap_init_i2c(client, &ub913_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "Failed to init regmap\n");
+
+	/*
+	 * ub913 can also work without ext clock, but that is not supported by
+	 * the driver yet
+	 */
+	priv->clkin = devm_clk_get(dev, "clkin");
+	if (IS_ERR(priv->clkin))
+		return dev_err_probe(dev, PTR_ERR(priv->clkin),
+				     "Cannot get CLKIN\n");
+
+	ret = ub913_parse_dt(priv);
+	if (ret)
+		return ret;
+
+	ret = ub913_hw_init(priv);
+	if (ret)
+		return ret;
+
+	ret = ub913_gpiochip_probe(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init gpiochip\n");
+
+	ret = ub913_register_clkout(priv);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register clkout\n");
+		goto err_gpiochip_remove;
+	}
+
+	ret = ub913_subdev_init(priv);
+	if (ret)
+		goto err_gpiochip_remove;
+
+	ret = ub913_add_i2c_adapter(priv);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to add remote i2c adapter\n");
+		goto err_subdev_uninit;
+	}
+
+	return 0;
+
+err_subdev_uninit:
+	ub913_subdev_uninit(priv);
 err_gpiochip_remove:
 	ub913_gpiochip_remove(priv);
 
@@ -823,19 +814,9 @@ static void ub913_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ub913_data *priv = sd_to_ub913(sd);
 
-	i2c_atr_del_adapter(priv->plat_data->atr,
-			    priv->plat_data->port);
-
-	v4l2_async_unregister_subdev(&priv->sd);
-
-	ub913_v4l2_nf_unregister(priv);
-
-	v4l2_subdev_cleanup(&priv->sd);
+	i2c_atr_del_adapter(priv->plat_data->atr, priv->plat_data->port);
 
-	if (priv->tx_ep_np)
-		of_node_put(priv->tx_ep_np);
-
-	media_entity_cleanup(&priv->sd.entity);
+	ub913_subdev_uninit(priv);
 
 	ub913_gpiochip_remove(priv);
 }
@@ -843,13 +824,11 @@ static void ub913_remove(struct i2c_client *client)
 static const struct i2c_device_id ub913_id[] = { { "ds90ub913a-q1", 0 }, {} };
 MODULE_DEVICE_TABLE(i2c, ub913_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id ub913_dt_ids[] = {
-	{ .compatible = "ti,ds90ub913a-q1", },
+	{ .compatible = "ti,ds90ub913a-q1" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, ub913_dt_ids);
-#endif
 
 static struct i2c_driver ds90ub913_driver = {
 	.probe_new	= ub913_probe,
@@ -857,15 +836,13 @@ static struct i2c_driver ds90ub913_driver = {
 	.id_table	= ub913_id,
 	.driver = {
 		.name	= "ds90ub913a",
-		.owner = THIS_MODULE,
-		.of_match_table = of_match_ptr(ub913_dt_ids),
+		.of_match_table = ub913_dt_ids,
 	},
 };
-
 module_i2c_driver(ds90ub913_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("Texas Instruments DS90UB913 serializer driver");
+MODULE_DESCRIPTION("Texas Instruments DS90UB913 FPD-Link III Serializer Driver");
 MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
 MODULE_IMPORT_NS(I2C_ATR);
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 251dc8e8adfa..ec33e16da3d1 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -5,21 +5,21 @@
  * Based on a driver from Luca Ceresoli <luca@lucaceresoli.net>
  *
  * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>
- * Copyright (c) 2022 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ * Copyright (c) 2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  */
 
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/fwnode.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c-atr.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/math64.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_graph.h>
+#include <linux/property.h>
 #include <linux/rational.h>
 #include <linux/regmap.h>
 
@@ -126,7 +126,7 @@ enum ub953_mode {
 
 struct ub953_hw_data {
 	const char *model;
-	bool ub971;
+	bool is_ub971;
 };
 
 struct ub953_data {
@@ -138,7 +138,6 @@ struct ub953_data {
 	u32			num_data_lanes;
 
 	struct gpio_chip	gpio_chip;
-	char			gpio_chip_name[64];
 
 	struct v4l2_subdev	sd;
 	struct media_pad	pads[2];
@@ -146,13 +145,12 @@ struct ub953_data {
 	struct v4l2_async_notifier	notifier;
 
 	struct v4l2_subdev	*source_sd;
+	u16			source_sd_pad;
 
 	struct v4l2_ctrl_handler   ctrl_handler;
 
 	u64			enabled_source_streams;
 
-	struct device_node	*tx_ep_np;
-
 	/* lock for register access */
 	struct mutex		reg_lock;
 
@@ -183,8 +181,8 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val)
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret)
-		dev_err(&priv->client->dev,
-			"Cannot read register 0x%02x: %d!\n", reg, ret);
+		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
+			reg, ret);
 	else
 		*val = v;
 
@@ -202,7 +200,7 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val)
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(&priv->client->dev,
-			"Cannot write register 0x%02x: %d!\n", reg, ret);
+			"Cannot write register 0x%02x: %d\n", reg, ret);
 
 	mutex_unlock(&priv->reg_lock);
 
@@ -219,7 +217,7 @@ static int _ub953_select_ind_reg_block(struct ub953_data *priv, u8 block)
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_CTL, block << 2);
 	if (ret) {
-		dev_err(dev, "%s: cannot select indirect target %u (%d)!\n",
+		dev_err(dev, "%s: cannot select indirect target %u (%d)\n",
 			__func__, block, ret);
 		return ret;
 	}
@@ -229,8 +227,8 @@ static int _ub953_select_ind_reg_block(struct ub953_data *priv, u8 block)
 	return 0;
 }
 
-__maybe_unused
-static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val)
+__maybe_unused static int ub953_read_ind(struct ub953_data *priv, u8 block,
+					 u8 reg, u8 *val)
 {
 	unsigned int v;
 	int ret;
@@ -242,12 +240,20 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val)
 		goto out;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
-	if (ret)
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Write to IND_ACC_ADDR failed when reading %u:%x02x: %d\n",
+			block, reg, ret);
 		goto out;
+	}
 
 	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
-	if (ret)
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Write to IND_ACC_DATA failed when reading %u:%x02x: %d\n",
+			block, reg, ret);
 		goto out;
+	}
 
 	*val = v;
 
@@ -268,10 +274,19 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 		goto out;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
-	if (ret)
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Write to IND_ACC_ADDR failed when writing %u:%x02x: %d\n",
+			block, reg, ret);
 		goto out;
+	}
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Write to IND_ACC_DATA failed when writing %u:%x02x\n: %d\n",
+			block, reg, ret);
+	}
 
 out:
 	mutex_unlock(&priv->reg_lock);
@@ -334,11 +349,10 @@ static int ub953_gpio_direction_in(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
 
-	return regmap_update_bits(
-		priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
-		UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
-			UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
-		UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset));
+	return regmap_update_bits(priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
+				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
+					  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
+				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset));
 }
 
 static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
@@ -347,19 +361,18 @@ static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 	struct ub953_data *priv = gpiochip_get_data(gc);
 	int ret;
 
-	ret = regmap_update_bits(
-		priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-		UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
-		value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) : 0);
+	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
+				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
+				 value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
+					 0);
 
 	if (ret)
 		return ret;
 
-	return regmap_update_bits(
-		priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
-		UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
-			UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
-		UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset));
+	return regmap_update_bits(priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
+				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
+					  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
+				  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset));
 }
 
 static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -379,10 +392,10 @@ static void ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
 
-	regmap_update_bits(
-		priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-		UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
-		value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) : 0);
+	regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
+			   UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
+			   value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
+				   0);
 }
 
 static int ub953_gpio_of_xlate(struct gpio_chip *gc,
@@ -405,14 +418,11 @@ static int ub953_gpiochip_probe(struct ub953_data *priv)
 	ub953_write(priv, UB953_REG_LOCAL_GPIO_DATA, 0);
 	ub953_write(priv, UB953_REG_GPIO_INPUT_CTRL, 0xf);
 
-	scnprintf(priv->gpio_chip_name, sizeof(priv->gpio_chip_name), "%s",
-		  dev_name(dev));
-
-	gc->label = priv->gpio_chip_name;
+	gc->label = dev_name(dev);
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 	gc->base = -1;
-	gc->can_sleep = 1;
+	gc->can_sleep = true;
 	gc->ngpio = UB953_NUM_GPIOS;
 	gc->get_direction = ub953_gpio_get_direction;
 	gc->direction_input = ub953_gpio_direction_in;
@@ -420,7 +430,6 @@ static int ub953_gpiochip_probe(struct ub953_data *priv)
 	gc->get = ub953_gpio_get;
 	gc->set = ub953_gpio_set;
 	gc->of_xlate = ub953_gpio_of_xlate;
-	gc->of_node = priv->client->dev.of_node;
 	gc->of_gpio_n_cells = 2;
 
 	ret = gpiochip_add_data(gc, priv);
@@ -490,24 +499,6 @@ static int ub953_set_routing(struct v4l2_subdev *sd,
 	return _ub953_set_routing(sd, state, routing);
 }
 
-static int ub953_get_source_frame_desc(struct ub953_data *priv,
-				       struct v4l2_mbus_frame_desc *desc)
-{
-	struct media_pad *pad;
-	int ret;
-
-	pad = media_pad_remote_pad_first(&priv->pads[UB953_PAD_SINK]);
-	if (!pad)
-		return -EPIPE;
-
-	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc, pad->index,
-			       desc);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_frame_desc *fd)
 {
@@ -521,18 +512,19 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	if (pad != UB953_PAD_SOURCE)
 		return -EINVAL;
 
-	ret = ub953_get_source_frame_desc(priv, &source_fd);
+	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
+			       priv->source_sd_pad, &source_fd);
 	if (ret)
 		return ret;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	routing = &state->routing;
-
 	memset(fd, 0, sizeof(*fd));
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	routing = &state->routing;
+
 	for_each_active_route(routing, route) {
 		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
 		unsigned int i;
@@ -540,11 +532,12 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		if (route->source_pad != pad)
 			continue;
 
-		for (i = 0; i < source_fd.num_entries; ++i)
+		for (i = 0; i < source_fd.num_entries; ++i) {
 			if (source_fd.entry[i].stream == route->sink_stream) {
 				source_entry = &source_fd.entry[i];
 				break;
 			}
+		}
 
 		if (!source_entry) {
 			dev_err(&priv->client->dev,
@@ -644,7 +637,7 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	dev_info(dev, "ID '%s'\n", id);
 
 	ub953_read(priv, UB953_REG_GENERAL_STATUS, &v);
-	dev_info(dev, "GENERAL_STATUS %#x\n", v);
+	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
 
 	ub953_read(priv, UB953_REG_CRC_ERR_CNT1, &v1);
 	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2);
@@ -654,16 +647,16 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	dev_info(dev, "CSI error count %u\n", v);
 
 	ub953_read(priv, UB953_REG_CSI_ERR_STATUS, &v);
-	dev_info(dev, "CSI_ERR_STATUS %#x\n", v);
+	dev_info(dev, "CSI_ERR_STATUS %#02x\n", v);
 
 	ub953_read(priv, UB953_REG_CSI_ERR_DLANE01, &v);
-	dev_info(dev, "CSI_ERR_DLANE01 %#x\n", v);
+	dev_info(dev, "CSI_ERR_DLANE01 %#02x\n", v);
 
 	ub953_read(priv, UB953_REG_CSI_ERR_DLANE23, &v);
-	dev_info(dev, "CSI_ERR_DLANE23 %#x\n", v);
+	dev_info(dev, "CSI_ERR_DLANE23 %#02x\n", v);
 
 	ub953_read(priv, UB953_REG_CSI_ERR_CLK_LANE, &v);
-	dev_info(dev, "CSI_ERR_CLK_LANE %#x\n", v);
+	dev_info(dev, "CSI_ERR_CLK_LANE %#02x\n", v);
 
 	ub953_read(priv, UB953_REG_CSI_PKT_HDR_VC_ID, &v);
 	dev_info(dev, "CSI packet header VC %u ID %u\n", v >> 6, v & 0x3f);
@@ -673,7 +666,7 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	dev_info(dev, "CSI packet header WC %u\n", (v2 << 8) | v1);
 
 	ub953_read(priv, UB953_REG_CSI_ECC, &v);
-	dev_info(dev, "CSI ECC %#x\n", v);
+	dev_info(dev, "CSI ECC %#02x\n", v);
 
 	ub953_read(priv, UB953_REG_LOCAL_GPIO_DATA, &gpio_local_data);
 	ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl);
@@ -698,19 +691,14 @@ static int ub953_enable_streams(struct v4l2_subdev *sd,
 				u64 streams_mask)
 {
 	struct ub953_data *priv = sd_to_ub953(sd);
-	struct media_pad *remote_pad;
 	u64 sink_streams;
 	int ret;
 
-	if (streams_mask & priv->enabled_source_streams)
-		return -EALREADY;
-
-	sink_streams = v4l2_subdev_state_xlate_streams(
-		state, UB953_PAD_SOURCE, UB953_PAD_SINK, &streams_mask);
+	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
+						       UB953_PAD_SINK,
+						       &streams_mask);
 
-	remote_pad = media_pad_remote_pad_first(&priv->pads[UB953_PAD_SINK]);
-
-	ret = v4l2_subdev_enable_streams(priv->source_sd, remote_pad->index,
+	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
 					 sink_streams);
 	if (ret)
 		return ret;
@@ -725,19 +713,14 @@ static int ub953_disable_streams(struct v4l2_subdev *sd,
 				 u64 streams_mask)
 {
 	struct ub953_data *priv = sd_to_ub953(sd);
-	struct media_pad *remote_pad;
-	int ret;
 	u64 sink_streams;
+	int ret;
 
-	if ((streams_mask & priv->enabled_source_streams) != streams_mask)
-		return -EALREADY;
-
-	sink_streams = v4l2_subdev_state_xlate_streams(
-		state, UB953_PAD_SOURCE, UB953_PAD_SINK, &streams_mask);
-
-	remote_pad = media_pad_remote_pad_first(&priv->pads[UB953_PAD_SINK]);
+	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
+						       UB953_PAD_SINK,
+						       &streams_mask);
 
-	ret = v4l2_subdev_disable_streams(priv->source_sd, remote_pad->index,
+	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
 					  sink_streams);
 	if (ret)
 		return ret;
@@ -758,9 +741,9 @@ static const struct v4l2_subdev_pad_ops ub953_pad_ops = {
 };
 
 static const struct v4l2_subdev_core_ops ub953_subdev_core_ops = {
-	.log_status		= ub953_log_status,
-	.subscribe_event	= v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
+	.log_status = ub953_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_ops ub953_subdev_ops = {
@@ -896,7 +879,6 @@ static int ub953_notify_bound(struct v4l2_async_notifier *notifier,
 {
 	struct ub953_data *priv = sd_to_ub953(notifier->sd);
 	struct device *dev = &priv->client->dev;
-	unsigned int src_pad;
 	int ret;
 
 	ret = media_entity_get_fwnode_pad(&source_subdev->entity,
@@ -909,14 +891,16 @@ static int ub953_notify_bound(struct v4l2_async_notifier *notifier,
 	}
 
 	priv->source_sd = source_subdev;
-	src_pad = ret;
+	priv->source_sd_pad = ret;
 
-	ret = media_create_pad_link(
-		&source_subdev->entity, src_pad, &priv->sd.entity, 0,
-		MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+	ret = media_create_pad_link(&source_subdev->entity, priv->source_sd_pad,
+				    &priv->sd.entity, 0,
+				    MEDIA_LNK_FL_ENABLED |
+					    MEDIA_LNK_FL_IMMUTABLE);
 	if (ret) {
 		dev_err(dev, "Unable to link %s:%u -> %s:0\n",
-			source_subdev->name, src_pad, priv->sd.name);
+			source_subdev->name, priv->source_sd_pad,
+			priv->sd.name);
 		return ret;
 	}
 
@@ -931,22 +915,22 @@ static int ub953_v4l2_notifier_register(struct ub953_data *priv)
 {
 	struct device *dev = &priv->client->dev;
 	struct v4l2_async_subdev *asd;
-	struct device_node *ep_node;
+	struct fwnode_handle *ep_fwnode;
 	int ret;
 
-	ep_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
-	if (!ep_node) {
+	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+						    UB953_PAD_SINK, 0, 0);
+	if (!ep_fwnode) {
 		dev_err(dev, "No graph endpoint\n");
 		return -ENODEV;
 	}
 
 	v4l2_async_nf_init(&priv->notifier);
 
-	asd = v4l2_async_nf_add_fwnode_remote(&priv->notifier,
-					      of_fwnode_handle(ep_node),
+	asd = v4l2_async_nf_add_fwnode_remote(&priv->notifier, ep_fwnode,
 					      struct v4l2_async_subdev);
 
-	of_node_put(ep_node);
+	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
 		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
@@ -1000,23 +984,15 @@ static int ub953_i2c_master_init(struct ub953_data *priv)
 
 static u64 ub953_get_fc_rate(struct ub953_data *priv)
 {
-	if (priv->hw_data->ub971) {
-		switch (priv->mode) {
-		case UB953_MODE_SYNC:
-			return priv->plat_data->bc_rate * 160ull;
-		default:
-			/* Not supported */
-			return 0;
-		}
-	} else {
-		switch (priv->mode) {
-		case UB953_MODE_SYNC:
-			return priv->plat_data->bc_rate / 2 * 160ull;
-		default:
-			/* Not supported */
-			return 0;
-		}
+	if (priv->mode != UB953_MODE_SYNC) {
+		/* Not supported */
+		return 0;
 	}
+
+	if (priv->hw_data->is_ub971)
+		return priv->plat_data->bc_rate * 160ull;
+	else
+		return priv->plat_data->bc_rate / 2 * 160ull;
 }
 
 static unsigned long ub953_calc_clkout_ub953(struct ub953_data *priv,
@@ -1105,7 +1081,7 @@ static unsigned long ub953_clkout_recalc_rate(struct clk_hw *hw,
 
 	fc_rate = ub953_get_fc_rate(priv);
 
-	if (priv->hw_data->ub971) {
+	if (priv->hw_data->is_ub971) {
 		mul = ctrl0 & 0x1f;
 		div = ctrl1;
 
@@ -1145,17 +1121,15 @@ static long ub953_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	fc_rate = ub953_get_fc_rate(priv);
 
-	if (priv->hw_data->ub971) {
+	if (priv->hw_data->is_ub971) {
 		res = ub953_calc_clkout_ub971(priv, rate, fc_rate, &m, &n);
 
-		dev_dbg(dev,
-			"%s %llu * %u / (8 * %u) = %lu (requested %lu)",
+		dev_dbg(dev, "%s %llu * %u / (8 * %u) = %lu (requested %lu)",
 			__func__, fc_rate, m, n, res, rate);
 	} else {
 		res = ub953_calc_clkout_ub953(priv, rate, fc_rate, &hs_div, &m, &n);
 
-		dev_dbg(dev,
-			"%s %llu / %u * %u / %u = %lu (requested %lu)",
+		dev_dbg(dev, "%s %llu / %u * %u / %u = %lu (requested %lu)",
 			__func__, fc_rate, hs_div, m, n, res, rate);
 	}
 
@@ -1172,7 +1146,7 @@ static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	fc_rate = ub953_get_fc_rate(priv);
 
-	if (priv->hw_data->ub971) {
+	if (priv->hw_data->is_ub971) {
 		res = ub953_calc_clkout_ub971(priv, rate, fc_rate, &m, &n);
 
 		ub953_write(priv, UB953_REG_CLKOUT_CTRL0, m);
@@ -1184,8 +1158,8 @@ static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 		ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
 	}
 
-	dev_dbg(&priv->client->dev,
-		"%s %lu (requested %lu)\n", __func__, res, rate);
+	dev_dbg(&priv->client->dev, "%s %lu (requested %lu)\n", __func__, res,
+		rate);
 
 	return 0;
 }
@@ -1232,8 +1206,11 @@ static int ub953_register_clkout(struct ub953_data *priv)
 	};
 	int ret;
 
+	if (!init.name)
+		return -ENOMEM;
+
 	/* Initialize clkout to 25MHz by default */
-	if (priv->hw_data->ub971)
+	if (priv->hw_data->is_ub971)
 		ub953_init_clkout_ub971(priv);
 	else
 		ub953_init_clkout_ub953(priv);
@@ -1285,33 +1262,29 @@ static const struct regmap_config ub953_regmap_config = {
 
 static int ub953_parse_dt(struct ub953_data *priv)
 {
-	struct device_node *np = priv->client->dev.of_node;
 	struct device *dev = &priv->client->dev;
-	struct device_node *ep_np;
+	struct fwnode_handle *ep_fwnode;
 	int ret;
 
-	if (!np) {
-		dev_err(dev, "OF: no device tree node!\n");
-		return -ENOENT;
-	}
-
-	ep_np = of_graph_get_endpoint_by_regs(np, 0, 0);
-	if (!ep_np) {
+	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+						    UB953_PAD_SINK, 0, 0);
+	if (!ep_fwnode) {
 		dev_err(dev, "OF: no endpoint\n");
 		return -ENOENT;
 	}
 
-	ret = of_property_count_u32_elems(ep_np, "data-lanes");
+	ret = fwnode_property_count_u32(ep_fwnode, "data-lanes");
 
-	of_node_put(ep_np);
+	fwnode_handle_put(ep_fwnode);
 
 	if (ret <= 0) {
-		dev_err(dev, "OF: failed to parse data-lanes: %d\n", ret);
+		dev_err(dev, "failed to parse property 'data-lanes': %d\n",
+			ret);
 		return ret;
 	}
 
 	if (ret != 1 && ret != 2 && ret != 4) {
-		dev_err(dev, "OF: bad number of data-lanes: %d\n", ret);
+		dev_err(dev, "bad number of data-lanes: %d\n", ret);
 		return -EINVAL;
 	}
 
@@ -1320,58 +1293,19 @@ static int ub953_parse_dt(struct ub953_data *priv)
 	return 0;
 }
 
-static int ub953_probe(struct i2c_client *client)
+static int ub953_hw_init(struct ub953_data *priv)
 {
-	struct device *dev = &client->dev;
-	struct ub953_data *priv;
+	struct device *dev = &priv->client->dev;
+	bool mode_override;
 	int ret;
 	u8 v;
-	bool mode_override;
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->client = client;
-
-	priv->hw_data = of_device_get_match_data(dev);
-	if (!priv->hw_data)
-		return -ENODEV;
-
-	priv->plat_data = dev_get_platdata(&client->dev);
-	if (!priv->plat_data) {
-		dev_err(dev, "Platform data missing\n");
-		return -ENODEV;
-	}
-
-	mutex_init(&priv->reg_lock);
-
-	/*
-	 * Initialize to invalid values so that the first reg writes will
-	 * configure the target.
-	 */
-	priv->current_indirect_target = 0xff;
-
-	priv->regmap = devm_regmap_init_i2c(client, &ub953_regmap_config);
-	if (IS_ERR(priv->regmap)) {
-		dev_err(dev, "Failed to init regmap\n");
-		ret = PTR_ERR(priv->regmap);
-		goto err_mutex_destroy;
-	}
-
-	ret = ub953_parse_dt(priv);
-	if (ret)
-		goto err_mutex_destroy;
 
 	ret = ub953_read(priv, UB953_REG_MODE_SEL, &v);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
-	if (!(v & UB953_REG_MODE_SEL_MODE_DONE)) {
-		dev_err(dev, "Mode value not stabilized\n");
-		ret = -ENODEV;
-		goto err_mutex_destroy;
-	}
+	if (!(v & UB953_REG_MODE_SEL_MODE_DONE))
+		return dev_err_probe(dev, -EIO, "Mode value not stabilized\n");
 
 	mode_override = v & UB953_REG_MODE_SEL_MODE_OVERRIDE;
 
@@ -1389,57 +1323,46 @@ static int ub953_probe(struct i2c_client *client)
 		priv->mode = UB953_MODE_DVP;
 		break;
 	default:
-		dev_err(dev, "Illegal mode in mode register\n");
-		ret = -ENODEV;
-		goto err_mutex_destroy;
+		return dev_err_probe(dev, -EIO,
+				     "Illegal mode in mode register\n");
 	}
 
 	dev_dbg(dev, "mode from %s: %#x\n", mode_override ? "reg" : "strap",
 		priv->mode);
 
-	if (priv->mode != UB953_MODE_SYNC) {
-		dev_err(dev, "Only synchronous mode supported\n");
-		ret = -ENODEV;
-		goto err_mutex_destroy;
-	}
+	if (priv->mode != UB953_MODE_SYNC)
+		return dev_err_probe(dev, -ENODEV,
+				     "Only synchronous mode supported\n");
 
 	ret = ub953_read(priv, UB953_REG_REV_MASK_ID, &v);
-	if (ret) {
-		dev_err(dev, "Failed to read revision: %d", ret);
-		goto err_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read revision");
 
 	dev_info(dev, "Found %s rev/mask %#04x\n", priv->hw_data->model, v);
 
 	ret = ub953_read(priv, UB953_REG_GENERAL_CFG, &v);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	dev_dbg(dev, "i2c strap setting %s V\n",
 		(v & UB953_REG_GENERAL_CFG_I2C_STRAP_MODE) ? "1.8" : "3.3");
 
 	ret = ub953_i2c_master_init(priv);
-	if (ret) {
-		dev_err(dev, "i2c init failed: %d\n", ret);
-		goto err_mutex_destroy;
-	}
-
-	ret = ub953_gpiochip_probe(priv);
-	if (ret) {
-		dev_err(dev, "Failed to init gpiochip\n");
-		goto err_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "i2c init failed\n");
 
 	ub953_write(priv, UB953_REG_GENERAL_CFG,
 		    UB953_REG_GENERAL_CFG_CONT_CLK |
 		    ((priv->num_data_lanes - 1) << UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT) |
 		    UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE);
 
-	ret = ub953_register_clkout(priv);
-	if (ret) {
-		dev_err(dev, "Failed to register clkout\n");
-		goto err_gpiochip_remove;
-	}
+	return 0;
+}
+
+static int ub953_subdev_init(struct ub953_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
 
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub953_subdev_ops);
 
@@ -1452,13 +1375,12 @@ static int ub953_probe(struct i2c_client *client)
 				     ARRAY_SIZE(ub953_tpg_qmenu) - 1, 0, 0,
 				     ub953_tpg_qmenu);
 
-	if (priv->ctrl_handler.error) {
-		ret = priv->ctrl_handler.error;
-		goto err_gpiochip_remove;
-	}
+	if (priv->ctrl_handler.error)
+		return dev_err_probe(dev, priv->ctrl_handler.error,
+				     "Failed to set up v4l2 controls\n");
 
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS |
-		V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &ub953_entity_ops;
 
@@ -1467,12 +1389,18 @@ static int ub953_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
 	if (ret) {
-		dev_err(dev, "Failed to init pads\n");
+		dev_err_probe(dev, ret, "Failed to init pads\n");
 		goto err_remove_ctrls;
 	}
 
-	priv->tx_ep_np = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);
-	priv->sd.fwnode = of_fwnode_handle(priv->tx_ep_np);
+	priv->sd.fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+							  UB953_PAD_SOURCE, 0,
+							  0);
+	if (!priv->sd.fwnode) {
+		ret = -ENODEV;
+		dev_err_probe(dev, ret, "Missing TX endpoint\n");
+		goto err_entity_cleanup;
+	}
 
 	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
 
@@ -1482,37 +1410,109 @@ static int ub953_probe(struct i2c_client *client)
 
 	ret = ub953_v4l2_notifier_register(priv);
 	if (ret) {
-		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
+		dev_err_probe(dev, ret,
+			      "v4l2 subdev notifier register failed\n");
 		goto err_free_state;
 	}
 
 	ret = v4l2_async_register_subdev(&priv->sd);
 	if (ret) {
-		dev_err(dev, "v4l2_async_register_subdev error: %d\n", ret);
+		dev_err_probe(dev, ret, "v4l2_async_register_subdev error\n");
 		goto err_unreg_notif;
 	}
 
-	ret = ub953_add_i2c_adapter(priv);
-	if (ret) {
-		dev_err(dev, "failed to add remote i2c adapter\n");
-		goto err_unreg_async_subdev;
-	}
-
 	return 0;
 
-err_unreg_async_subdev:
-	v4l2_async_unregister_subdev(&priv->sd);
 err_unreg_notif:
 	ub953_v4l2_notifier_unregister(priv);
 err_free_state:
 	v4l2_subdev_cleanup(&priv->sd);
 err_entity_cleanup:
-	if (priv->tx_ep_np)
-		of_node_put(priv->tx_ep_np);
-
 	media_entity_cleanup(&priv->sd.entity);
 err_remove_ctrls:
 	v4l2_ctrl_handler_free(&priv->ctrl_handler);
+
+	return ret;
+}
+
+static void ub953_subdev_uninit(struct ub953_data *priv)
+{
+	v4l2_async_unregister_subdev(&priv->sd);
+	ub953_v4l2_notifier_unregister(priv);
+	v4l2_subdev_cleanup(&priv->sd);
+	media_entity_cleanup(&priv->sd.entity);
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
+}
+
+static int ub953_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ub953_data *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+
+	priv->hw_data = of_device_get_match_data(dev);
+	if (!priv->hw_data)
+		return -ENODEV;
+
+	priv->plat_data = dev_get_platdata(&client->dev);
+	if (!priv->plat_data)
+		return dev_err_probe(dev, -ENODEV, "Platform data missing\n");
+
+	mutex_init(&priv->reg_lock);
+
+	/*
+	 * Initialize to invalid values so that the first reg writes will
+	 * configure the target.
+	 */
+	priv->current_indirect_target = 0xff;
+
+	priv->regmap = devm_regmap_init_i2c(client, &ub953_regmap_config);
+	if (IS_ERR(priv->regmap)) {
+		ret = PTR_ERR(priv->regmap);
+		dev_err_probe(dev, ret, "Failed to init regmap\n");
+		goto err_mutex_destroy;
+	}
+
+	ret = ub953_parse_dt(priv);
+	if (ret)
+		goto err_mutex_destroy;
+
+	ret = ub953_hw_init(priv);
+	if (ret)
+		goto err_mutex_destroy;
+
+	ret = ub953_gpiochip_probe(priv);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to init gpiochip\n");
+		goto err_mutex_destroy;
+	}
+
+	ret = ub953_register_clkout(priv);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register clkout\n");
+		goto err_gpiochip_remove;
+	}
+
+	ret = ub953_subdev_init(priv);
+	if (ret)
+		goto err_gpiochip_remove;
+
+	ret = ub953_add_i2c_adapter(priv);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to add remote i2c adapter\n");
+		goto err_subdev_uninit;
+	}
+
+	return 0;
+
+err_subdev_uninit:
+	ub953_subdev_uninit(priv);
 err_gpiochip_remove:
 	ub953_gpiochip_remove(priv);
 err_mutex_destroy:
@@ -1526,20 +1526,9 @@ static void ub953_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ub953_data *priv = sd_to_ub953(sd);
 
-	i2c_atr_del_adapter(priv->plat_data->atr,
-			    priv->plat_data->port);
-
-	v4l2_async_unregister_subdev(&priv->sd);
-
-	ub953_v4l2_notifier_unregister(priv);
-
-	v4l2_subdev_cleanup(&priv->sd);
-
-	of_node_put(priv->tx_ep_np);
+	i2c_atr_del_adapter(priv->plat_data->atr, priv->plat_data->port);
 
-	media_entity_cleanup(&priv->sd.entity);
-
-	v4l2_ctrl_handler_free(&priv->ctrl_handler);
+	ub953_subdev_uninit(priv);
 
 	ub953_gpiochip_remove(priv);
 	mutex_destroy(&priv->reg_lock);
@@ -1551,7 +1540,7 @@ static const struct ub953_hw_data ds90ub953_hw = {
 
 static const struct ub953_hw_data ds90ub971_hw = {
 	.model = "ub971",
-	.ub971 = true,
+	.is_ub971 = true,
 };
 
 static const struct i2c_device_id ub953_id[] = {
@@ -1561,14 +1550,12 @@ static const struct i2c_device_id ub953_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ub953_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id ub953_dt_ids[] = {
 	{ .compatible = "ti,ds90ub953-q1", .data = &ds90ub953_hw },
 	{ .compatible = "ti,ds90ub971-q1", .data = &ds90ub971_hw },
 	{}
 };
 MODULE_DEVICE_TABLE(of, ub953_dt_ids);
-#endif
 
 static struct i2c_driver ds90ub953_driver = {
 	.probe_new	= ub953_probe,
@@ -1577,14 +1564,13 @@ static struct i2c_driver ds90ub953_driver = {
 	.driver = {
 		.name	= "ds90ub953",
 		.owner = THIS_MODULE,
-		.of_match_table = of_match_ptr(ub953_dt_ids),
+		.of_match_table = ub953_dt_ids,
 	},
 };
-
 module_i2c_driver(ds90ub953_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("Texas Instruments DS90UB953 serializer driver");
+MODULE_DESCRIPTION("Texas Instruments FPD-Link III/IV CSI-2 Serializers Driver");
 MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
 MODULE_IMPORT_NS(I2C_ATR);
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index b532a93f3da7..2cefb3744901 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -3,12 +3,13 @@
  * Driver for the Texas Instruments DS90UB960-Q1 video deserializer
  *
  * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>
- * Copyright (c) 2022 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ * Copyright (c) 2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  */
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c-atr.h>
 #include <linux/i2c.h>
@@ -18,9 +19,8 @@
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_graph.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -348,8 +348,8 @@ struct ub960_hw_data {
 	const char *model;
 	u8 num_rxports;
 	u8 num_txports;
-	bool ub9702;
-	bool fpdlink4;
+	bool is_ub9702;
+	bool is_fpdlink4;
 };
 
 enum ub960_rxport_mode {
@@ -371,13 +371,14 @@ struct ub960_rxport {
 	struct ub960_data      *priv;
 	u8                      nport;	/* RX port number, and index in priv->rxport[] */
 
-	struct v4l2_subdev     *sd;	/* Connected subdev */
-	struct fwnode_handle   *fwnode;
+	struct v4l2_subdev     *source_sd;	/* Connected subdev */
+	u16			source_sd_pad;
+	struct fwnode_handle   *source_ep_fwnode;
 
 	enum ub960_rxport_mode  rx_mode;
 	enum ub960_rxport_cdr	cdr_mode;
 
-	struct device_node     *remote_of_node;	/* 'serializer' OF node */
+	struct fwnode_handle   *remote_fwnode;	/* 'serializer' fwnode */
 	struct i2c_client      *ser_client;	/* Serializer */
 	unsigned short          ser_alias;	/* Serializer i2c alias (lower 7 bits) */
 
@@ -507,7 +508,7 @@ enum {
 	TEST_PATTERN_V_COLOR_BARS_8,
 };
 
-static const char * const ub960_tpg_qmenu[] = {
+static const char *const ub960_tpg_qmenu[] = {
 	"Disabled",
 	"1 vertical color bar",
 	"2 vertical color bars",
@@ -832,12 +833,20 @@ static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val)
 		goto out;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
-	if (ret)
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Write to IND_ACC_ADDR failed when reading %u:%x02x: %d\n",
+			block, reg, ret);
 		goto out;
+	}
 
 	ret = regmap_read(priv->regmap, UB960_SR_IND_ACC_DATA, &v);
-	if (ret)
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Write to IND_ACC_DATA failed when reading %u:%x02x: %d\n",
+			block, reg, ret);
 		goto out;
+	}
 
 	*val = v;
 
@@ -854,12 +863,20 @@ static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val)
 	mutex_lock(&priv->reg_lock);
 
 	ret = _ub960_select_ind_reg_block(priv, block);
-	if (ret)
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Write to IND_ACC_ADDR failed when writing %u:%x02x: %d\n",
+			block, reg, ret);
 		goto out;
+	}
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
-	if (ret)
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Write to IND_ACC_DATA failed when writing %u:%x02x\n: %d\n",
+			block, reg, ret);
 		goto out;
+	}
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val);
 
@@ -937,7 +954,6 @@ static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
  */
 
 static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
-				   const struct i2c_board_info *info,
 				   const struct i2c_client *client,
 				   u16 *alias_id)
 {
@@ -951,7 +967,7 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	int ret = 0;
 	u8 port_reg_idx_mask = 0;
 
-	dev_dbg(dev, "rx%d: %s\n", chan_id, __func__);
+	dev_dbg(dev, "rx%u: %s\n", chan_id, __func__);
 
 	mutex_lock(&priv->atr_alias_table.lock);
 
@@ -974,13 +990,13 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	}
 
 	if (!entry) {
-		dev_err(dev, "rx%d: alias pool exhausted\n", rxport->nport);
+		dev_err(dev, "rx%u: alias pool exhausted\n", rxport->nport);
 		ret = -EADDRNOTAVAIL;
 		goto out;
 	}
 
 	if (port_reg_idx_mask == (1 << UB960_MAX_PORT_ALIASES) - 1) {
-		dev_err(dev, "rx%d: all aliases in use\n", rxport->nport);
+		dev_err(dev, "rx%u: all aliases in use\n", rxport->nport);
 		ret = -EADDRNOTAVAIL;
 		goto out;
 	}
@@ -1003,7 +1019,7 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 
 	*alias_id = alias; /* tell the atr which alias we chose */
 
-	dev_dbg(dev, "rx%d: client 0x%02x mapped at alias 0x%02x (%s)\n",
+	dev_dbg(dev, "rx%u: client 0x%02x mapped at alias 0x%02x (%s)\n",
 		rxport->nport, client->addr, alias, client->name);
 
 out:
@@ -1022,7 +1038,7 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	unsigned int pool_idx;
 	u16 alias = 0;
 
-	dev_dbg(dev, "rx%d: %s\n", chan_id, __func__);
+	dev_dbg(dev, "rx%u: %s\n", chan_id, __func__);
 
 	mutex_lock(&priv->atr_alias_table.lock);
 
@@ -1037,7 +1053,7 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	}
 
 	if (pool_idx == priv->atr_alias_table.num_entries) {
-		dev_err(dev, "rx%d: client 0x%02x is not mapped!\n",
+		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
 			rxport->nport, client->addr);
 		goto out;
 	}
@@ -1052,7 +1068,7 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 
 	entry->reserved = false;
 
-	dev_dbg(dev, "rx%d: client 0x%02x unmapped from alias 0x%02x (%s)\n",
+	dev_dbg(dev, "rx%u: client 0x%02x unmapped from alias 0x%02x (%s)\n",
 		rxport->nport, client->addr, alias, client->name);
 
 out:
@@ -1069,19 +1085,14 @@ static const struct i2c_atr_ops ub960_atr_ops = {
  */
 
 static int ub960_parse_dt_txport(struct ub960_data *priv,
-				 const struct device_node *np, u8 nport)
+				 const struct fwnode_handle *ep_fwnode,
+				 u8 nport)
 {
 	struct device *dev = &priv->client->dev;
 	struct ub960_txport *txport;
 	int ret;
 	u64 freq;
 
-	if (priv->txports[nport]) {
-		dev_err(dev, "OF: %s: duplicate tx port\n",
-			of_node_full_name(np));
-		return -EADDRINUSE;
-	}
-
 	txport = kzalloc(sizeof(*txport), GFP_KERNEL);
 	if (!txport)
 		return -ENOMEM;
@@ -1091,42 +1102,36 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 
 	priv->txports[nport] = txport;
 
-	ret = of_property_count_u32_elems(np, "data-lanes");
-
+	ret = fwnode_property_count_u32(ep_fwnode, "data-lanes");
 	if (ret <= 0) {
-		dev_err(dev, "OF: %s: failed to parse data-lanes: %d\n",
-			of_node_full_name(np), ret);
+		dev_err(dev, "tx%u: failed to parse 'data-lanes': %d\n", nport,
+			ret);
 		goto err_free_txport;
 	}
 
 	txport->num_data_lanes = ret;
 
-	ret = of_property_count_u64_elems(np, "link-frequencies");
+	ret = fwnode_property_count_u64(ep_fwnode, "link-frequencies");
 	if (ret < 0) {
-		dev_err(dev, "OF: %s: failed to parse link-frequencies: %d\n",
-			of_node_full_name(np), ret);
+		dev_err(dev, "tx%u: failed to parse 'link-frequencies': %d\n",
+			nport, ret);
 		goto err_free_txport;
 	}
 
 	if (ret != 1) {
-		dev_err(dev, "OF: %s: link-frequencies must contain a single frequency: %d\n",
-			of_node_full_name(np), ret);
+		dev_err(dev,
+			"tx%u: 'link-frequencies' must contain a single frequency: %d\n",
+			nport, ret);
 		goto err_free_txport;
 	}
 
-	ret = of_property_read_u64(np, "link-frequencies", &freq);
+	ret = fwnode_property_read_u64(ep_fwnode, "link-frequencies", &freq);
 	if (ret) {
-		dev_err(dev, "OF: %s: failed to read link frequency: %d\n",
-			of_node_full_name(np), ret);
+		dev_err(dev, "tx%u: failed to read 'link-frequencies': %d\n",
+			nport, ret);
 		goto err_free_txport;
 	}
 
-	if (of_property_read_u32(np, "link-frequencies", &priv->tx_data_rate) != 0) {
-		dev_err(dev, "OF: %s: missing \"data-rate\" node\n",
-			of_node_full_name(np));
-		return -EINVAL;
-	}
-
 	priv->tx_link_freq[0] = freq;
 	priv->tx_data_rate = freq * 2;
 
@@ -1134,12 +1139,11 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 	    priv->tx_data_rate != 1200000000 &&
 	    priv->tx_data_rate != 800000000 &&
 	    priv->tx_data_rate != 400000000) {
-		dev_err(dev, "OF: %s: invalid \"link-frequencies\" value\n",
-			of_node_full_name(np));
+		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "Nominal data rate: %u", priv->tx_data_rate);
+	dev_dbg(dev, "tx%u: nominal data rate: %u", nport, priv->tx_data_rate);
 
 	return 0;
 
@@ -1651,13 +1655,14 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 	struct device *dev = &priv->client->dev;
 	struct ds90ub9xx_platform_data *ser_pdata = &rxport->ser_platform_data;
 	struct i2c_board_info ser_info = {
-		.of_node = rxport->remote_of_node,
+		.of_node = to_of_node(rxport->remote_fwnode),
+		.fwnode = rxport->remote_fwnode,
 		.platform_data = ser_pdata,
 	};
 
 	ser_pdata->port = nport;
 	ser_pdata->atr = priv->atr;
-	if (priv->hw_data->ub9702)
+	if (priv->hw_data->is_ub9702)
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
 	else
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
@@ -1671,12 +1676,12 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 	rxport->ser_client =
 		i2c_new_client_device(priv->client->adapter, &ser_info);
 	if (!rxport->ser_client) {
-		dev_err(dev, "rx%d: cannot add %s i2c device", nport,
+		dev_err(dev, "rx%u: cannot add %s i2c device", nport,
 			ser_info.type);
 		return -EIO;
 	}
 
-	dev_dbg(dev, "rx%d: remote serializer at alias 0x%02x (%u-%04x)\n",
+	dev_dbg(dev, "rx%u: remote serializer at alias 0x%02x (%u-%04x)\n",
 		nport, rxport->ser_client->addr,
 		rxport->ser_client->adapter->nr, rxport->ser_client->addr);
 
@@ -1788,7 +1793,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 
 	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select);
 
-	if (priv->hw_data->ub9702) {
+	if (priv->hw_data->is_ub9702) {
 		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div);
 
 		switch (priv->tx_data_rate) {
@@ -1838,10 +1843,6 @@ static void ub960_init_rx_port_ub960(struct ub960_data *priv,
 	 */
 
 	switch (rxport->rx_mode) {
-	default:
-		WARN_ON(true);
-		fallthrough;
-
 	case RXPORT_MODE_RAW10:
 	case RXPORT_MODE_RAW12_HF:
 	case RXPORT_MODE_RAW12_LF:
@@ -1855,6 +1856,10 @@ static void ub960_init_rx_port_ub960(struct ub960_data *priv,
 	case RXPORT_MODE_CSI2_SYNC:
 		bc_freq_val = 6;
 		break;
+
+	default:
+		WARN_ON(true);
+		return;
 	}
 
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
@@ -1947,7 +1952,7 @@ static void ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
 
 	default:
 		WARN_ON(true);
-		break;
+		return;
 	}
 
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
@@ -2041,7 +2046,7 @@ static void ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
 
 	default:
 		WARN_ON(true);
-		break;
+		return;
 	}
 
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
@@ -2141,7 +2146,7 @@ static int ub960_init_rx_ports(struct ub960_data *priv)
 		if (!rxport)
 			continue;
 
-		if (priv->hw_data->ub9702)
+		if (priv->hw_data->is_ub9702)
 			ub960_init_rx_port_ub9702(priv, rxport);
 		else
 			ub960_init_rx_port_ub960(priv, rxport);
@@ -2181,66 +2186,66 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 
 		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
 		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
-		dev_err(dev, "RX%u parity errors: %u\n", nport, (v1 << 8) | v2);
+		dev_err(dev, "rx%u parity errors: %u\n", nport, (v1 << 8) | v2);
 	}
 
 	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_BCC_CRC_ERROR)
-		dev_err(dev, "RX%u BCC CRC error\n", nport);
+		dev_err(dev, "rx%u BCC CRC error\n", nport);
 
 	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_BCC_SEQ_ERROR)
-		dev_err(dev, "RX%u BCC SEQ error\n", nport);
+		dev_err(dev, "rx%u BCC SEQ error\n", nport);
 
 	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_LEN_UNSTABLE)
-		dev_err(dev, "RX%u line length unstable\n", nport);
+		dev_err(dev, "rx%u line length unstable\n", nport);
 
 	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_FPD3_ENCODE_ERROR)
-		dev_err(dev, "RX%u FPD3 encode error\n", nport);
+		dev_err(dev, "rx%u FPD3 encode error\n", nport);
 
 	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_BUFFER_ERROR)
-		dev_err(dev, "RX%u buffer error\n", nport);
+		dev_err(dev, "rx%u buffer error\n", nport);
 
 	if (csi_rx_sts)
-		dev_err(dev, "RX%u CSI error: %#02x\n", nport, csi_rx_sts);
+		dev_err(dev, "rx%u CSI error: %#02x\n", nport, csi_rx_sts);
 
 	if (csi_rx_sts & UB960_RR_CSI_RX_STS_ECC1_ERR)
-		dev_err(dev, "RX%u CSI ECC1 error\n", nport);
+		dev_err(dev, "rx%u CSI ECC1 error\n", nport);
 
 	if (csi_rx_sts & UB960_RR_CSI_RX_STS_ECC2_ERR)
-		dev_err(dev, "RX%u CSI ECC2 error\n", nport);
+		dev_err(dev, "rx%u CSI ECC2 error\n", nport);
 
 	if (csi_rx_sts & UB960_RR_CSI_RX_STS_CKSUM_ERR)
-		dev_err(dev, "RX%u CSI checksum error\n", nport);
+		dev_err(dev, "rx%u CSI checksum error\n", nport);
 
 	if (csi_rx_sts & UB960_RR_CSI_RX_STS_LENGTH_ERR)
-		dev_err(dev, "RX%u CSI length error\n", nport);
+		dev_err(dev, "rx%u CSI length error\n", nport);
 
 	if (bcc_sts)
-		dev_err(dev, "RX%u BCC error: %#02x\n", nport, bcc_sts);
+		dev_err(dev, "rx%u BCC error: %#02x\n", nport, bcc_sts);
 
 	if (bcc_sts & UB960_RR_BCC_STATUS_RESP_ERR)
-		dev_err(dev, "RX%u BCC response error", nport);
+		dev_err(dev, "rx%u BCC response error", nport);
 
 	if (bcc_sts & UB960_RR_BCC_STATUS_SLAVE_TO)
-		dev_err(dev, "RX%u BCC slave timeout", nport);
+		dev_err(dev, "rx%u BCC slave timeout", nport);
 
 	if (bcc_sts & UB960_RR_BCC_STATUS_SLAVE_ERR)
-		dev_err(dev, "RX%u BCC slave error", nport);
+		dev_err(dev, "rx%u BCC slave error", nport);
 
 	if (bcc_sts & UB960_RR_BCC_STATUS_MASTER_TO)
-		dev_err(dev, "RX%u BCC master timeout", nport);
+		dev_err(dev, "rx%u BCC master timeout", nport);
 
 	if (bcc_sts & UB960_RR_BCC_STATUS_MASTER_ERR)
-		dev_err(dev, "RX%u BCC master error", nport);
+		dev_err(dev, "rx%u BCC master error", nport);
 
 	if (bcc_sts & UB960_RR_BCC_STATUS_SEQ_ERROR)
-		dev_err(dev, "RX%u BCC sequence error", nport);
+		dev_err(dev, "rx%u BCC sequence error", nport);
 
 	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_LEN_CHG) {
 		u8 v1, v2;
 
 		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_1, &v1);
 		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_0, &v2);
-		dev_dbg(dev, "RX%u line len changed: %u\n", nport,
+		dev_dbg(dev, "rx%u line len changed: %u\n", nport,
 			(v1 << 8) | v2);
 	}
 
@@ -2249,16 +2254,24 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 
 		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_HI, &v1);
 		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_LO, &v2);
-		dev_dbg(dev, "RX%u line count changed: %u\n", nport,
+		dev_dbg(dev, "rx%u line count changed: %u\n", nport,
 			(v1 << 8) | v2);
 	}
 
 	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS_CHG) {
-		dev_dbg(dev, "RX%u: %s, %s, %s, %s\n", nport,
-			(rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS) ? "locked" : "unlocked",
-			(rx_port_sts1 & UB960_RR_RX_PORT_STS1_PORT_PASS) ? "passed" : "not passed",
-			(rx_port_sts2 & UB960_RR_RX_PORT_STS2_CABLE_FAULT) ? "no clock" : "clock ok",
-			(rx_port_sts2 & UB960_RR_RX_PORT_STS2_FREQ_STABLE) ? "stable freq" : "unstable freq");
+		dev_dbg(dev, "rx%u: %s, %s, %s, %s\n", nport,
+			(rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS) ?
+				"locked" :
+				"unlocked",
+			(rx_port_sts1 & UB960_RR_RX_PORT_STS1_PORT_PASS) ?
+				"passed" :
+				"not passed",
+			(rx_port_sts2 & UB960_RR_RX_PORT_STS2_CABLE_FAULT) ?
+				"no clock" :
+				"clock ok",
+			(rx_port_sts2 & UB960_RR_RX_PORT_STS2_FREQ_STABLE) ?
+				"stable freq" :
+				"unstable freq");
 	}
 }
 
@@ -2340,8 +2353,6 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 					       struct v4l2_subdev_state *state)
 {
 	const struct v4l2_subdev_krouting *routing = &state->routing;
-	unsigned int i;
-	unsigned int nport;
 	u8 fwd_ctl;
 	struct {
 		u32 num_streams;
@@ -2354,7 +2365,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 	ub960_get_vc_maps(priv, state, vc_map);
 
-	for (i = 0; i < routing->num_routes; ++i) {
+	for (unsigned int i = 0; i < routing->num_routes; ++i) {
 		struct v4l2_subdev_route *route = &routing->routes[i];
 		struct ub960_rxport *rxport;
 		struct ub960_txport *txport;
@@ -2384,7 +2395,8 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 		if (rx_data[nport].num_streams > 2)
 			return -EPIPE;
 
-		fmt = v4l2_subdev_state_get_stream_format(state, route->sink_pad,
+		fmt = v4l2_subdev_state_get_stream_format(state,
+							  route->sink_pad,
 							  route->sink_stream);
 		if (!fmt)
 			return -EPIPE;
@@ -2396,8 +2408,8 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 		if (ub960_fmt->meta) {
 			if (fmt->height > 3) {
 				dev_err(&priv->client->dev,
-					"Unsupported metadata height %u\n",
-					fmt->height);
+					"rx%u: unsupported metadata height %u\n",
+					nport, fmt->height);
 				return -EPIPE;
 			}
 
@@ -2412,7 +2424,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 	fwd_ctl = 0;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (unsigned int nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 		u8 vc = vc_map[nport];
 
@@ -2429,14 +2441,15 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 					   rx_data[nport].pixel_dt | (vc << 6));
 
 			ub960_rxport_write(priv, rxport->nport,
-				UB960_RR_RAW_EMBED_DTYPE,
-				(rx_data[nport].meta_lines << 6) | rx_data[nport].meta_dt);
+					   UB960_RR_RAW_EMBED_DTYPE,
+					   (rx_data[nport].meta_lines << 6) |
+						   rx_data[nport].meta_dt);
 
 			break;
 
 		case RXPORT_MODE_CSI2_SYNC:
 		case RXPORT_MODE_CSI2_ASYNC:
-			if (!priv->hw_data->ub9702) {
+			if (!priv->hw_data->is_ub9702) {
 				/* Map all VCs from this port to the same VC */
 				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
 						   (vc << 6) | (vc << 4) |
@@ -2447,7 +2460,8 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 				/* Map all VCs from this port to VC(nport) */
 				for (i = 0; i < 8; ++i)
 					ub960_rxport_write(priv, nport,
-						UB960_RR_VC_ID_MAP(i), nport);
+							   UB960_RR_VC_ID_MAP(i),
+							   nport);
 			}
 
 			break;
@@ -2545,9 +2559,6 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 	}
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
-		struct v4l2_subdev *source_sd;
-		struct media_pad *source_sd_pad;
-
 		if (!sink_streams[nport])
 			continue;
 
@@ -2565,11 +2576,10 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 		dev_dbg(dev, "Enable RX port %u streams %#llx\n", nport,
 			sink_streams[nport]);
 
-		source_sd_pad = media_pad_remote_pad_first(&priv->pads[nport]);
-		source_sd = priv->rxports[nport]->sd;
-
 		ret = v4l2_subdev_enable_streams(
-			source_sd, source_sd_pad->index, sink_streams[nport]);
+			priv->rxports[nport]->source_sd,
+			priv->rxports[nport]->source_sd_pad,
+			sink_streams[nport]);
 		if (ret) {
 			priv->stream_enable_mask[nport] &= ~sink_streams[nport];
 
@@ -2587,20 +2597,16 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 
 err:
 	for (nport = 0; nport < failed_port; ++nport) {
-		struct v4l2_subdev *source_sd;
-		struct media_pad *source_sd_pad;
-
 		if (!sink_streams[nport])
 			continue;
 
 		dev_dbg(dev, "Disable RX port %u streams %#llx\n", nport,
 			sink_streams[nport]);
 
-		source_sd_pad = media_pad_remote_pad_first(&priv->pads[nport]);
-		source_sd = priv->rxports[nport]->sd;
-
 		ret = v4l2_subdev_disable_streams(
-			source_sd, source_sd_pad->index, sink_streams[nport]);
+			priv->rxports[nport]->source_sd,
+			priv->rxports[nport]->source_sd_pad,
+			sink_streams[nport]);
 		WARN_ON(ret);
 
 		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
@@ -2665,20 +2671,16 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
 	}
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
-		struct v4l2_subdev *source_sd;
-		struct media_pad *source_sd_pad;
-
 		if (!sink_streams[nport])
 			continue;
 
 		dev_dbg(dev, "Disable RX port %u streams %#llx\n", nport,
 			sink_streams[nport]);
 
-		source_sd_pad = media_pad_remote_pad_first(&priv->pads[nport]);
-		source_sd = priv->rxports[nport]->sd;
-
 		ret = v4l2_subdev_disable_streams(
-			source_sd, source_sd_pad->index, sink_streams[nport]);
+			priv->rxports[nport]->source_sd,
+			priv->rxports[nport]->source_sd_pad,
+			sink_streams[nport]);
 		WARN_ON(ret);
 
 		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
@@ -2748,9 +2750,9 @@ static int ub960_s_stream(struct v4l2_subdev *sd, int enable)
 			if (pad_stream_masks[nport] == 0)
 				continue;
 
-			ub960_disable_streams(
-				sd, state, priv->hw_data->num_rxports + nport,
-				pad_stream_masks[nport]);
+			ub960_disable_streams(sd, state,
+					      priv->hw_data->num_rxports + nport,
+					      pad_stream_masks[nport]);
 		}
 	}
 
@@ -2816,27 +2818,6 @@ static int ub960_set_routing(struct v4l2_subdev *sd,
 	return _ub960_set_routing(sd, state, routing);
 }
 
-static int ub960_get_source_frame_desc(struct ub960_data *priv,
-				       struct v4l2_mbus_frame_desc *desc,
-				       u8 nport)
-{
-	struct v4l2_subdev *sd;
-	struct media_pad *pad;
-	int ret;
-
-	pad = media_pad_remote_pad_first(&priv->pads[nport]);
-	if (!pad)
-		return -EPIPE;
-
-	sd = priv->rxports[nport]->sd;
-
-	ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad->index, desc);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_frame_desc *fd)
 {
@@ -2851,37 +2832,41 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	if (!ub960_pad_is_source(priv, pad))
 		return -EINVAL;
 
+	memset(fd, 0, sizeof(*fd));
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
 	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
 
 	ub960_get_vc_maps(priv, state, vc_map);
 
 	routing = &state->routing;
 
-	memset(fd, 0, sizeof(*fd));
-
-	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
-
 	for_each_active_route(routing, route) {
 		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
 		struct v4l2_mbus_frame_desc source_fd;
-		unsigned int j;
-		unsigned int nrxport;
+		unsigned int nport;
+		unsigned int i;
 
 		if (route->source_pad != pad)
 			continue;
 
-		ret = ub960_get_source_frame_desc(priv, &source_fd,
-						  route->sink_pad);
+		nport = ub960_pad_to_port(priv, route->sink_pad);
+
+		ret = v4l2_subdev_call(priv->rxports[nport]->source_sd, pad,
+				       get_frame_desc,
+				       priv->rxports[nport]->source_sd_pad,
+				       &source_fd);
 		if (ret) {
 			dev_err(dev,
-				"Failed to get source frame desc for port %u\n",
+				"Failed to get source frame desc for pad %u\n",
 				route->sink_pad);
 			goto out;
 		}
 
-		for (j = 0; j < source_fd.num_entries; ++j)
-			if (source_fd.entry[j].stream == route->sink_stream) {
-				source_entry = &source_fd.entry[j];
+		for (i = 0; i < source_fd.num_entries; ++i)
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
 				break;
 			}
 
@@ -2897,9 +2882,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->entry[fd->num_entries].length = source_entry->length;
 		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
 
-		nrxport = ub960_pad_to_port(priv, route->sink_pad);
-
-		fd->entry[fd->num_entries].bus.csi2.vc = vc_map[nrxport];
+		fd->entry[fd->num_entries].bus.csi2.vc = vc_map[nport];
 
 		if (source_fd.type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
 			fd->entry[fd->num_entries].bus.csi2.dt =
@@ -2908,8 +2891,8 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			const struct ub960_format_info *ub960_fmt;
 			struct v4l2_mbus_framefmt *fmt;
 
-			fmt = v4l2_subdev_state_get_stream_format(
-				state, pad, route->source_stream);
+			fmt = v4l2_subdev_state_get_stream_format(state, pad,
+								  route->source_stream);
 
 			if (!fmt) {
 				ret = -EINVAL;
@@ -3012,12 +2995,11 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 	struct v4l2_subdev_state *state;
 	unsigned int nport;
 	u8 v = 0, v1 = 0, v2 = 0;
-	unsigned int i;
 	char id[7];
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	for (i = 0; i < 6; ++i)
+	for (unsigned int i = 0; i < 6; ++i)
 		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
 	id[6] = 0;
 
@@ -3034,7 +3016,8 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		}
 
 		ub960_csiport_read(priv, nport, UB960_TR_CSI_STS, &v);
-		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1), v & (u8)BIT(0));
+		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1),
+			 v & (u8)BIT(0));
 
 		ub960_read(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport), &v1);
 		ub960_read(priv, UB960_SR_CSI_FRAME_COUNT_LO(nport), &v2);
@@ -3073,13 +3056,14 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		else
 			dev_info(dev, "\tNot locked\n");
 
-		dev_info(dev, "\trx_port_sts1 %#x\n", v);
+		dev_info(dev, "\trx_port_sts1 %#02x\n", v);
 		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v);
-		dev_info(dev, "\trx_port_sts2 %#x\n", v);
+		dev_info(dev, "\trx_port_sts2 %#02x\n", v);
 
 		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
 		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);
-		dev_info(dev, "\tlink freq %u MHz\n", v1 * 1000000 + v2 * 1000000 / 256);
+		dev_info(dev, "\tlink freq %u MHz\n",
+			 v1 * 1000000 + v2 * 1000000 / 256);
 
 		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
 		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
@@ -3132,9 +3116,8 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
 		}
 
-		ub960_rxport_get_eq_level(priv, nport, &eq_level);
-
-		dev_info(dev, "\tEQ level %u\n", eq_level);
+		if (ub960_rxport_get_eq_level(priv, nport, &eq_level) == 0)
+			dev_info(dev, "\tEQ level %u\n", eq_level);
 
 		/* GPIOs */
 		for (i = 0; i < UB960_NUM_BC_GPIOS; ++i) {
@@ -3157,15 +3140,15 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 }
 
 static const struct v4l2_subdev_core_ops ub960_subdev_core_ops = {
-	.log_status		= ub960_log_status,
-	.subscribe_event	= v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
+	.log_status = ub960_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_ops ub960_subdev_ops = {
-	.core		= &ub960_subdev_core_ops,
-	.video		= &ub960_video_ops,
-	.pad		= &ub960_pad_ops,
+	.core = &ub960_subdev_core_ops,
+	.video = &ub960_video_ops,
+	.pad = &ub960_pad_ops,
 };
 
 static const struct media_entity_operations ub960_entity_ops = {
@@ -3303,7 +3286,7 @@ static irqreturn_t ub960_handle_events(int irq, void *arg)
 
 		ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts);
 
-		dev_dbg(&priv->client->dev, "FWD_STS %#x\n", fwd_sts);
+		dev_dbg(&priv->client->dev, "FWD_STS %#02x\n", fwd_sts);
 
 		for (i = 0; i < priv->hw_data->num_txports; ++i) {
 			if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i))
@@ -3359,8 +3342,8 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
 		if (!rxport)
 			continue;
 
-		fwnode_handle_put(rxport->fwnode);
-		of_node_put(rxport->remote_of_node);
+		fwnode_handle_put(rxport->source_ep_fwnode);
+		fwnode_handle_put(rxport->remote_fwnode);
 
 		kfree(rxport);
 		priv->rxports[nport] = NULL;
@@ -3369,13 +3352,12 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
 
 static int ub960_parse_dt_base(struct ub960_data *priv)
 {
-	struct device_node *np = priv->client->dev.of_node;
 	struct device *dev = &priv->client->dev;
 	size_t table_size;
 	u16 *aliases;
 	int ret;
 
-	ret = of_property_count_u16_elems(np, "i2c-alias-pool");
+	ret = fwnode_property_count_u16(dev_fwnode(dev), "i2c-alias-pool");
 	if (ret < 0) {
 		dev_err(dev, "Failed to count 'i2c-alias-pool' property: %d\n",
 			ret);
@@ -3398,8 +3380,8 @@ static int ub960_parse_dt_base(struct ub960_data *priv)
 	if (!aliases)
 		return -ENOMEM;
 
-	ret = of_property_read_u16_array(np, "i2c-alias-pool", aliases,
-					 table_size);
+	ret = fwnode_property_read_u16_array(dev_fwnode(dev), "i2c-alias-pool",
+					     aliases, table_size);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read 'i2c-alias-pool' property: %d\n",
 			ret);
@@ -3417,47 +3399,50 @@ static int ub960_parse_dt_base(struct ub960_data *priv)
 	return 0;
 }
 
-static int ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
-						 struct device_node *np,
-						 struct ub960_rxport *rxport)
+static int
+ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
+				      struct fwnode_handle *link_fwnode,
+				      struct ub960_rxport *rxport)
 {
 	struct device *dev = &priv->client->dev;
-	int ret;
+	unsigned int nport = rxport->nport;
 	u32 rx_mode;
 	u32 cdr_mode;
 	s32 strobe_pos;
 	u32 eq_level;
-	unsigned int nport = rxport->nport;
+	u32 ser_i2c_alias;
+	int ret;
 
-	ret = of_property_read_u32(np, "ti,cdr-mode", &cdr_mode);
+	ret = fwnode_property_read_u32(link_fwnode, "ti,cdr-mode", &cdr_mode);
 	if (ret == -EINVAL) {
 		cdr_mode = RXPORT_CDR_FPD3;
 	} else if (ret < 0) {
-		dev_err(dev, "Failed to get RX port CDR mode: %d\n", ret);
+		dev_err(dev, "rx%u: failed to read 'ti,cdr-mode': %d\n", nport,
+			ret);
 		return ret;
 	}
 
 	if (cdr_mode > RXPORT_CDR_LAST) {
-		dev_err(dev, "Bad RX port cdr %u\n", cdr_mode);
+		dev_err(dev, "rx%u: bad 'ti,cdr-mode' %u\n", nport, cdr_mode);
 		return -EINVAL;
 	}
 
-	if (!priv->hw_data->fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
-		dev_err(dev, "FPD-Link 4 CDR not supported on RX port %u\n",
-			nport);
+	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
+		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
 		return -EINVAL;
 	}
 
 	rxport->cdr_mode = cdr_mode;
 
-	ret = of_property_read_u32(np, "ti,rx-mode", &rx_mode);
+	ret = fwnode_property_read_u32(link_fwnode, "ti,rx-mode", &rx_mode);
 	if (ret < 0) {
-		dev_err(dev, "Missing RX port RX mode: %d\n", ret);
+		dev_err(dev, "rx%u: failed to read 'ti,rx-mode': %d\n", nport,
+			ret);
 		return ret;
 	}
 
 	if (rx_mode > RXPORT_MODE_LAST) {
-		dev_err(dev, "Bad RX port RX mode %u\n", rx_mode);
+		dev_err(dev, "rx%u: bad 'ti,rx-mode' %u\n", nport, rx_mode);
 		return -EINVAL;
 	}
 
@@ -3470,45 +3455,78 @@ static int ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 	rxport->eq.aeq.eq_level_min = UB960_MIN_EQ_LEVEL;
 	rxport->eq.aeq.eq_level_max = UB960_MAX_EQ_LEVEL;
 
-	ret = of_property_read_s32(np, "ti,strobe-pos", &strobe_pos);
+	ret = fwnode_property_read_u32(link_fwnode, "ti,strobe-pos",
+				       &strobe_pos);
 	if (ret) {
 		if (ret != -EINVAL) {
-			dev_err(dev, "Failed to read 'ti,strobe-pos': %d\n", ret);
+			dev_err(dev,
+				"rx%u: failed to read 'ti,strobe-pos': %d\n",
+				nport, ret);
 			return ret;
 		}
 	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
 		   strobe_pos > UB960_MAX_MANUAL_STROBE_POS) {
-		dev_err(dev, "Illegal 'strobe-pos' value: %d\n", strobe_pos);
+		dev_err(dev, "rx%u: illegal 'strobe-pos' value: %d\n", nport,
+			strobe_pos);
 	} else {
 		// NOTE: ignored unless global manual strobe pos is set
 		rxport->eq.strobe_pos = strobe_pos;
 		if (!priv->strobe.manual)
-			dev_warn(dev, "'ti,strobe-pos' ignored as 'ti,manual-strobe' not set\n");
+			dev_warn(dev,
+				 "rx%u: 'ti,strobe-pos' ignored as 'ti,manual-strobe' not set\n",
+				 nport);
 	}
 
-	ret = of_property_read_u32(np, "ti,eq-level", &eq_level);
+	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
 	if (ret) {
 		if (ret != -EINVAL) {
-			dev_err(dev, "Failed to read 'ti,eq-level': %d\n", ret);
+			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
+				nport, ret);
 			return ret;
 		}
 	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
-		dev_err(dev, "Illegal 'ti,eq-level' value: %d\n", eq_level);
+		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n", nport,
+			eq_level);
 	} else {
 		rxport->eq.manual_eq = true;
 		rxport->eq.manual.eq_level = eq_level;
 	}
 
+	ret = fwnode_property_read_u32(link_fwnode, "i2c-alias",
+				       &ser_i2c_alias);
+	if (ret) {
+		dev_err(dev, "rx%u: failed to read 'i2c-alias': %d\n", nport,
+			ret);
+		return ret;
+	}
+	rxport->ser_alias = ser_i2c_alias;
+
+	rxport->remote_fwnode = fwnode_get_named_child_node(link_fwnode, "serializer");
+	if (!rxport->remote_fwnode) {
+		dev_err(dev, "rx%u: missing 'serializer' node\n", nport);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-static int ub960_parse_dt_rxport_ep_properties(struct ub960_data *priv, struct ub960_rxport *rxport)
+static int ub960_parse_dt_rxport_ep_properties(struct ub960_data *priv,
+					       struct fwnode_handle *ep_fwnode,
+					       struct ub960_rxport *rxport)
 {
 	struct device *dev = &priv->client->dev;
-	struct device_node *ep_np;
+	unsigned int nport = rxport->nport;
 	int ret;
 	u32 v;
 
+	rxport->source_ep_fwnode = fwnode_graph_get_remote_endpoint(ep_fwnode);
+	if (!rxport->source_ep_fwnode) {
+		dev_err(dev, "rx%u: no remote endpoint\n", nport);
+		return -ENODEV;
+	}
+
+	/* We currently have properties only for RAW modes */
+
 	switch (rxport->rx_mode) {
 	case RXPORT_MODE_RAW10:
 	case RXPORT_MODE_RAW12_HF:
@@ -3518,59 +3536,40 @@ static int ub960_parse_dt_rxport_ep_properties(struct ub960_data *priv, struct u
 		return 0;
 	}
 
-	ep_np = of_graph_get_endpoint_by_regs(priv->client->dev.of_node,
-					      rxport->nport, 0);
-	if (!ep_np)
-		return -EINVAL;
-
-	ret = of_property_read_u32(ep_np, "hsync-active", &v);
+	ret = fwnode_property_read_u32(ep_fwnode, "hsync-active", &v);
 	if (ret) {
-		dev_err(dev, "Failed to parse 'hsync-active' for port %u: %d\n",
-			rxport->nport, ret);
-		goto err;
+		dev_err(dev, "rx%u: failed to parse 'hsync-active': %d\n",
+			nport, ret);
+		goto err_put_source_ep_fwnode;
 	}
 
 	rxport->lv_fv_pol |= v ? UB960_RR_PORT_CONFIG2_LV_POL_LOW : 0;
 
-	ret = of_property_read_u32(ep_np, "vsync-active", &v);
+	ret = fwnode_property_read_u32(ep_fwnode, "vsync-active", &v);
 	if (ret) {
-		dev_err(dev, "Failed to parse 'vsync-active' for port %u: %d\n",
-			rxport->nport, ret);
-		goto err;
+		dev_err(dev, "rx%u: failed to parse 'vsync-active': %d\n",
+			nport, ret);
+		goto err_put_source_ep_fwnode;
 	}
 
 	rxport->lv_fv_pol |= v ? UB960_RR_PORT_CONFIG2_FV_POL_LOW : 0;
 
 	return 0;
-err:
-	of_node_put(ep_np);
+
+err_put_source_ep_fwnode:
+	fwnode_handle_put(rxport->source_ep_fwnode);
 	return ret;
 }
 
-static int ub960_parse_dt_rxport(struct ub960_data *priv,
-				 struct device_node *np)
+static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
+				 struct fwnode_handle *link_fwnode,
+				 struct fwnode_handle *ep_fwnode)
 {
 	const char *vpoc_names[UB960_MAX_RX_NPORTS] = { "vpoc0", "vpoc1",
 							"vpoc2", "vpoc3" };
 	struct device *dev = &priv->client->dev;
-	unsigned int nport;
-	int ret;
 	struct ub960_rxport *rxport;
-	u32 ser_i2c_alias;
-	struct device_node *ep_np;
-	struct fwnode_handle *remote_ep_node;
-
-	ret = of_property_read_u32(np, "reg", &nport);
-	if (ret) {
-		dev_err(dev, "Failed to get link reg\n");
-		return ret;
-	}
-
-	if (priv->rxports[nport]) {
-		dev_err(dev, "OF: %s: reg value %d is duplicated\n",
-			of_node_full_name(np), nport);
-		return -EADDRINUSE;
-	}
+	int ret;
 
 	rxport = kzalloc(sizeof(*rxport), GFP_KERNEL);
 	if (!rxport)
@@ -3581,92 +3580,56 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv,
 	rxport->nport = nport;
 	rxport->priv = priv;
 
-	ret = ub960_parse_dt_rxport_link_properties(priv, np, rxport);
+	ret = ub960_parse_dt_rxport_link_properties(priv, link_fwnode, rxport);
 	if (ret)
 		goto err_free_rxport;
 
-	ret = of_property_read_u32(np, "i2c-alias", &ser_i2c_alias);
-	if (ret) {
-		dev_err(dev, "Failed to get serializer i2c-alias: %d\n", ret);
-		goto err_free_rxport;
-	}
-	rxport->ser_alias = ser_i2c_alias;
-
 	rxport->vpoc = devm_regulator_get_optional(dev, vpoc_names[nport]);
 	if (IS_ERR(rxport->vpoc)) {
 		ret = PTR_ERR(rxport->vpoc);
 		if (ret == -ENODEV) {
 			rxport->vpoc = NULL;
 		} else {
-			dev_err(dev, "Failed to get VPOC supply: %d\n", ret);
-			goto err_free_rxport;
+			dev_err(dev, "rx%u: failed to get VPOC supply: %d\n",
+				nport, ret);
+			goto err_put_remote_fwnode;
 		}
 	}
 
-	rxport->remote_of_node = of_get_child_by_name(np, "serializer");
-	if (!rxport->remote_of_node) {
-		dev_err(dev, "OF: %s: missing remote-chip child\n",
-			of_node_full_name(np));
-		ret = -EINVAL;
-		goto err_free_rxport;
-	}
-
-	/* We also parse the endpoint data here */
-
-	ep_np = of_graph_get_endpoint_by_regs(priv->client->dev.of_node, nport, 0);
-	if (!ep_np) {
-		dev_err(dev, "Missing OF graph endpoint for link %u\n", nport);
-		ret = -EINVAL;
-		goto err_ser_node_put;
-	}
-
-	remote_ep_node = fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep_np));
-
-	of_node_put(ep_np);
-
-	if (!remote_ep_node) {
-		dev_err(dev, "No remote endpoint for rxport%d\n", nport);
-		ret = -ENODEV;
-		goto err_ser_node_put;
-	}
-
-	rxport->fwnode = remote_ep_node;
-
-	ret = ub960_parse_dt_rxport_ep_properties(priv, rxport);
+	ret = ub960_parse_dt_rxport_ep_properties(priv, ep_fwnode, rxport);
 	if (ret)
-		goto err_remote_ep_node_put;
+		goto err_put_remote_fwnode;
 
 	return 0;
 
-err_remote_ep_node_put:
-	fwnode_handle_put(rxport->fwnode);
-err_ser_node_put:
-	of_node_put(rxport->remote_of_node);
+err_put_remote_fwnode:
+	fwnode_handle_put(rxport->remote_fwnode);
 err_free_rxport:
 	priv->rxports[nport] = NULL;
 	kfree(rxport);
 	return ret;
 }
 
-static struct device_node *
-ub960_of_get_link_by_regs(struct device_node *links_np, unsigned int nport)
+static struct fwnode_handle *
+ub960_fwnode_get_link_by_regs(struct fwnode_handle *links_fwnode,
+			      unsigned int nport)
 {
-	struct device_node *link_np;
+	struct fwnode_handle *link_fwnode;
 	int ret;
 
-	for_each_child_of_node(links_np, link_np) {
+	fwnode_for_each_child_node(links_fwnode, link_fwnode) {
 		u32 link_num;
 
-		if (!of_node_name_eq(link_np, "link"))
+		if (strncmp(fwnode_get_name(link_fwnode), "link@", 5) != 0)
 			continue;
 
-		ret = of_property_read_u32(link_np, "reg", &link_num);
+		ret = fwnode_property_read_u32(link_fwnode, "reg", &link_num);
 		if (ret)
 			return NULL;
 
 		if (nport == link_num) {
-			of_node_get(link_np);
-			return link_np;
+			fwnode_handle_put(link_fwnode);
+			return link_fwnode;
 		}
 	}
 
@@ -3675,15 +3638,14 @@ ub960_of_get_link_by_regs(struct device_node *links_np, unsigned int nport)
 
 static int ub960_parse_dt_rxports(struct ub960_data *priv)
 {
-	struct device_node *np = priv->client->dev.of_node;
 	struct device *dev = &priv->client->dev;
-	struct device_node *links_np;
+	struct fwnode_handle *links_fwnode;
 	unsigned int nport;
 	int ret;
 
-	links_np = of_get_child_by_name(np, "links");
-	if (!links_np) {
-		dev_err(dev, "links node missing\n");
+	links_fwnode = fwnode_get_named_child_node(dev_fwnode(dev), "links");
+	if (!links_fwnode) {
+		dev_err(dev, "'links' node missing\n");
 		return -ENODEV;
 	}
 
@@ -3691,51 +3653,62 @@ static int ub960_parse_dt_rxports(struct ub960_data *priv)
 	priv->strobe.min = 2;
 	priv->strobe.max = 3;
 
-	priv->strobe.manual = of_property_read_bool(links_np, "ti,manual-strobe");
+	priv->strobe.manual = fwnode_property_read_bool(links_fwnode, "ti,manual-strobe");
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
-		struct device_node *link_np;
+		struct fwnode_handle *link_fwnode;
+		struct fwnode_handle *ep_fwnode;
 
-		link_np = ub960_of_get_link_by_regs(links_np, nport);
-		if (!link_np)
+		link_fwnode = ub960_fwnode_get_link_by_regs(links_fwnode, nport);
+		if (!link_fwnode)
 			continue;
 
-		ret = ub960_parse_dt_rxport(priv, link_np);
+		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+							    nport, 0, 0);
+		if (!ep_fwnode) {
+			fwnode_handle_put(link_fwnode);
+			continue;
+		}
+
+		ret = ub960_parse_dt_rxport(priv, nport, link_fwnode,
+					    ep_fwnode);
 
-		of_node_put(link_np);
+		fwnode_handle_put(link_fwnode);
+		fwnode_handle_put(ep_fwnode);
 
 		if (ret) {
-			dev_err(dev, "Failed to parse link node\n");
+			dev_err(dev, "rx%u: failed to parse RX port\n", nport);
 			goto err_put_links;
 		}
 	}
 
-	of_node_put(links_np);
+	fwnode_handle_put(links_fwnode);
 
 	return 0;
 
 err_put_links:
-	of_node_put(links_np);
+	fwnode_handle_put(links_fwnode);
 
 	return ret;
 }
 
 static int ub960_parse_dt_txports(struct ub960_data *priv)
 {
-	struct device_node *np = priv->client->dev.of_node;
+	struct device *dev = &priv->client->dev;
 	u32 nport;
 	int ret;
 
 	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
-		struct device_node *ep_np;
+		struct fwnode_handle *ep_fwnode;
 
-		ep_np = of_graph_get_endpoint_by_regs(np, nport + priv->hw_data->num_rxports, 0);
-		if (!ep_np)
+		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+			nport + priv->hw_data->num_rxports, 0, 0);
+		if (!ep_fwnode)
 			continue;
 
-		ret = ub960_parse_dt_txport(priv, ep_np, nport);
+		ret = ub960_parse_dt_txport(priv, ep_fwnode, nport);
 
-		of_node_put(ep_np);
+		fwnode_handle_put(ep_fwnode);
 
 		if (ret)
 			break;
@@ -3746,15 +3719,8 @@ static int ub960_parse_dt_txports(struct ub960_data *priv)
 
 static int ub960_parse_dt(struct ub960_data *priv)
 {
-	struct device_node *np = priv->client->dev.of_node;
-	struct device *dev = &priv->client->dev;
 	int ret;
 
-	if (!np) {
-		dev_err(dev, "OF: no device tree node!\n");
-		return -ENOENT;
-	}
-
 	ret = ub960_parse_dt_base(priv);
 	if (ret)
 		return ret;
@@ -3783,35 +3749,37 @@ static int ub960_notify_bound(struct v4l2_async_notifier *notifier,
 	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
 	struct device *dev = &priv->client->dev;
 	u8 nport = rxport->nport;
-	unsigned int src_pad;
 	unsigned int i;
 	int ret;
 
-	ret = media_entity_get_fwnode_pad(&subdev->entity, rxport->fwnode,
+	ret = media_entity_get_fwnode_pad(&subdev->entity,
+					  rxport->source_ep_fwnode,
 					  MEDIA_PAD_FL_SOURCE);
 	if (ret < 0) {
 		dev_err(dev, "Failed to find pad for %s\n", subdev->name);
 		return ret;
 	}
 
-	rxport->sd = subdev;
-	src_pad = ret;
+	rxport->source_sd = subdev;
+	rxport->source_sd_pad = ret;
 
-	ret = media_create_pad_link(&rxport->sd->entity, src_pad,
-				    &priv->sd.entity, nport,
+	ret = media_create_pad_link(&rxport->source_sd->entity,
+				    rxport->source_sd_pad, &priv->sd.entity,
+				    nport,
 				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
+					    MEDIA_LNK_FL_IMMUTABLE);
 	if (ret) {
 		dev_err(dev, "Unable to link %s:%u -> %s:%u\n",
-			rxport->sd->name, src_pad, priv->sd.name, nport);
+			rxport->source_sd->name, rxport->source_sd_pad,
+			priv->sd.name, nport);
 		return ret;
 	}
 
-	dev_dbg(dev, "Bound %s pad: %u on index %u\n", subdev->name, src_pad,
-		nport);
+	dev_dbg(dev, "Bound %s pad: %u on index %u\n", subdev->name,
+		rxport->source_sd_pad, nport);
 
 	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
-		if (priv->rxports[i] && !priv->rxports[i]->sd) {
+		if (priv->rxports[i] && !priv->rxports[i]->source_sd) {
 			dev_dbg(dev, "Waiting for more subdevs to be bound\n");
 			return 0;
 		}
@@ -3828,7 +3796,7 @@ static void ub960_notify_unbind(struct v4l2_async_notifier *notifier,
 {
 	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
 
-	rxport->sd = NULL;
+	rxport->source_sd = NULL;
 }
 
 static const struct v4l2_async_notifier_operations ub960_notify_ops = {
@@ -3851,7 +3819,8 @@ static int ub960_v4l2_notifier_register(struct ub960_data *priv)
 		if (!rxport)
 			continue;
 
-		asd = v4l2_async_nf_add_fwnode(&priv->notifier, rxport->fwnode,
+		asd = v4l2_async_nf_add_fwnode(&priv->notifier,
+					       rxport->source_ep_fwnode,
 					       struct ub960_asd);
 		if (IS_ERR(asd)) {
 			dev_err(dev, "Failed to add subdev for source %u: %ld",
@@ -3906,14 +3875,15 @@ static int ub960_create_subdev(struct ub960_data *priv)
 		goto err_free_ctrl;
 	}
 
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS |
-		V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &ub960_entity_ops;
 
 	for (i = 0; i < priv->hw_data->num_rxports + priv->hw_data->num_txports; i++) {
 		priv->pads[i].flags = ub960_pad_is_sink(priv, i) ?
-			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+					      MEDIA_PAD_FL_SINK :
+					      MEDIA_PAD_FL_SOURCE;
 	}
 
 	ret = media_entity_pads_init(&priv->sd.entity,
@@ -4007,35 +3977,27 @@ static void ub960_reset(struct ub960_data *priv, bool reset_regs)
 static int ub960_get_hw_resources(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
-	int ret;
 
 	priv->regmap = devm_regmap_init_i2c(priv->client, &ub960_regmap_config);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
 	priv->vddio = devm_regulator_get(dev, "vddio");
-	if (IS_ERR(priv->vddio)) {
-		dev_err(dev, "cannot get VDDIO regulator\n");
-		return PTR_ERR(priv->vddio);
-	}
+	if (IS_ERR(priv->vddio))
+		return dev_err_probe(dev, PTR_ERR(priv->vddio),
+				     "cannot get VDDIO regulator\n");
 
 	/* get power-down pin from DT */
 	priv->pd_gpio =
 		devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->pd_gpio)) {
-		ret = PTR_ERR(priv->pd_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Cannot get powerdown GPIO (%d)", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->pd_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->pd_gpio),
+				     "Cannot get powerdown GPIO\n");
 
 	priv->refclk = devm_clk_get(dev, "refclk");
-	if (IS_ERR(priv->refclk)) {
-		ret = PTR_ERR(priv->refclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Cannot get REFCLK (%d)", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->refclk))
+		return dev_err_probe(dev, PTR_ERR(priv->refclk),
+				     "Cannot get REFCLK\n");
 
 	return 0;
 }
@@ -4056,7 +4018,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 
 	ret = clk_prepare_enable(priv->refclk);
 	if (ret) {
-		dev_err(dev, "Failed to renable refclk: %d\n", ret);
+		dev_err(dev, "Failed to enable refclk: %d\n", ret);
 		goto err_disable_vddio;
 	}
 
@@ -4159,7 +4121,7 @@ static int ub960_probe(struct i2c_client *client)
 		goto err_mutex_destroy;
 
 	/* release GPIO lock */
-	if (priv->hw_data->ub9702)
+	if (priv->hw_data->is_ub9702)
 		ub960_update_bits(priv, UB960_SR_RESET,
 				  UB960_SR_RESET_GPIO_LOCK_RELEASE,
 				  UB960_SR_RESET_GPIO_LOCK_RELEASE);
@@ -4255,25 +4217,23 @@ static const struct ub960_hw_data ds90ub9702_hw = {
 	.model = "ub9702",
 	.num_rxports = 4,
 	.num_txports = 2,
-	.ub9702 = true,
-	.fpdlink4 = true,
+	.is_ub9702 = true,
+	.is_fpdlink4 = true,
 };
 
 static const struct i2c_device_id ub960_id[] = {
 	{ "ds90ub960-q1", 0 },
 	{ "ds90ub9702-q1", 0 },
-	{ }
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, ub960_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id ub960_dt_ids[] = {
 	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
 	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
-	{ }
+	{}
 };
 MODULE_DEVICE_TABLE(of, ub960_dt_ids);
-#endif
 
 static struct i2c_driver ds90ub960_driver = {
 	.probe_new	= ub960_probe,
@@ -4282,14 +4242,13 @@ static struct i2c_driver ds90ub960_driver = {
 	.driver = {
 		.name	= "ds90ub960",
 		.owner = THIS_MODULE,
-		.of_match_table = of_match_ptr(ub960_dt_ids),
+		.of_match_table = ub960_dt_ids,
 	},
 };
-
 module_i2c_driver(ds90ub960_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("Texas Instruments DS90UB960-Q1 FPD-Link deserializer driver");
+MODULE_DESCRIPTION("Texas Instruments FPD-Link III/IV Deserializers Driver");
 MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
 MODULE_IMPORT_NS(I2C_ATR);
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 5b879115dfc6..10a313ab2105 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -35,7 +35,6 @@ struct i2c_atr_ops {
 	int (*select)(struct i2c_atr *atr, u32 chan_id);
 	int (*deselect)(struct i2c_atr *atr, u32 chan_id);
 	int (*attach_client)(struct i2c_atr *atr, u32 chan_id,
-			     const struct i2c_board_info *info,
 			     const struct i2c_client *client, u16 *alias_id);
 	void (*detach_client)(struct i2c_atr *atr, u32 chan_id,
 			      const struct i2c_client *client);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 9a385b6de388..f7c49bbdb8a1 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -584,21 +584,6 @@ struct i2c_lock_operations {
 	void (*unlock_bus)(struct i2c_adapter *adapter, unsigned int flags);
 };
 
-/**
- * struct i2c_attach_operations - callbacks to notify client attach/detach
- * @attach_client: Notify of new client being attached
- * @detach_client: Notify of new client being detached
- *
- * Both ops are optional.
- */
-struct i2c_attach_operations {
-	int  (*attach_client)(struct i2c_adapter *adapter,
-			      const struct i2c_board_info *info,
-			      const struct i2c_client *client);
-	void (*detach_client)(struct i2c_adapter *adapter,
-			      const struct i2c_client *client);
-};
-
 /**
  * struct i2c_timings - I2C timing information
  * @bus_freq_hz: the bus frequency in Hz
@@ -741,7 +726,6 @@ struct i2c_adapter {
 
 	/* data fields that are valid for all devices	*/
 	const struct i2c_lock_operations *lock_ops;
-	const struct i2c_attach_operations *attach_ops;
 	struct rt_mutex bus_lock;
 	struct rt_mutex mux_lock;
 

base-commit: 76dcd734eca23168cb008912c0f69ff408905235
prerequisite-patch-id: 341bbdcbd14f0b6f38c88f1390f9437873a03430
prerequisite-patch-id: e5d34269150d94ecb7fd670ad31e14aaae78e099
prerequisite-patch-id: 24ff7b1c013fa9acd8b93c2506eae39eb2a1021c
prerequisite-patch-id: 15edf6091d7c2d340f25711961bb8459addc8d58
prerequisite-patch-id: 9beff6fd1d22dbfe565931de81b27739e45ced05
prerequisite-patch-id: 37bc00c7315371c9a906af0d718ecedd871a43e0
prerequisite-patch-id: 8218595c50635ab48a9c8cd8c580da9f431d539f
prerequisite-patch-id: 7f163276a04d212d009ee6e96fb545d5b781cc44
prerequisite-patch-id: 0db299d92565612520411ef624e097131feb2d97
prerequisite-patch-id: 6b521ad1868b9a507930dd6a2e0e2d19b5947456
prerequisite-patch-id: d32e1105a1285cceac8fd8e84649070174a6b23e
prerequisite-patch-id: 2927a4ef079c55e7807cda150d4b9eb29978136a
prerequisite-patch-id: 77546a2e202557910e9a3635534163cc80134ea4
prerequisite-patch-id: 462fabb2b21019636e1f7e793dafc51caf40400e
prerequisite-patch-id: 604c8c3f3e7fab7698eb73795bae573f88b808db
prerequisite-patch-id: 75a3d7b072e718fb2bd854743b9b2023d68a822b
prerequisite-patch-id: a9c64a3360938ac230261ffc3e0cbd8cb66550d3
prerequisite-patch-id: a5c57341047e53ecaeb28181319700dd3ace62aa
prerequisite-patch-id: e9b8da97c9fea3cd3268adf8387cb3df179649e5
prerequisite-patch-id: 2767b8af9e0742b52b81b2dbce3b5ce5203e3610
-- 
2.34.1

