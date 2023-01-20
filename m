Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A91986758A9
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 16:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjATPem (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 10:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjATPel (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 10:34:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5F910431;
        Fri, 20 Jan 2023 07:34:36 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A134514;
        Fri, 20 Jan 2023 16:34:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674228874;
        bh=f8aZpbDmFj9ADKQ3S6PU3aQU//zwxqgqfW4zRd8oOGs=;
        h=From:To:Cc:Subject:Date:From;
        b=ZNgISX9ZDecMshMkzgEBR+VUSYPIztGGuP57RVdfAyUhClvkP3iG5tqgK7/tNimRf
         iaPR8C4zCKJ3mzm8VrK+E7TCfeYS9cnE4ddzwv3sesDgTnLj3SF0Ny+HVgfkdumzxH
         vNyJf2JCh0/KGwwfTYuPw3NfqEhjMXfyZxdB7r9Y=
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
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v8 0/7] i2c-atr and FPDLink
Date:   Fri, 20 Jan 2023 17:34:10 +0200
Message-Id: <20230120153417.1156207-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

Hi,

You can find v7 from:

https://lore.kernel.org/all/20230118124031.788940-1-tomi.valkeinen@ideasonboard.com/

Diff to v7 included below.

Main changes in v8:
- Added missing 'link-frequencies' to ti,ds90ub960.yaml
- Dropped ATR select/deselect ops
- Don't use devm_kzalloc() in i2c_atr_new()
- Fixed the reported error handling paths (mainly adding
  fwnode_handle_puts)
- Dropped all WARNs
- Plenty of cosmetic/style changes

I saw the suggestion to change the i2c_atr to be embedded in the main
driver's private data struct. That change has not been done in this
version.

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
 .../bindings/media/i2c/ti,ds90ub960.yaml      |  431 ++
 Documentation/i2c/index.rst                   |    1 +
 Documentation/i2c/muxes/i2c-atr.rst           |   83 +
 MAINTAINERS                                   |   16 +
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  532 ++
 drivers/media/i2c/Kconfig                     |   47 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub913.c                 |  851 ++++
 drivers/media/i2c/ds90ub953.c                 | 1572 ++++++
 drivers/media/i2c/ds90ub960.c                 | 4278 +++++++++++++++++
 include/linux/i2c-atr.h                       |  113 +
 include/media/i2c/ds90ub9xx.h                 |   16 +
 16 files changed, 8220 insertions(+)
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

Interdiff against v7:
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 1ba22450cdba..bb921caa85a7 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -190,9 +190,12 @@ properties:
               data-lanes:
                 minItems: 1
                 maxItems: 4
+              link-frequencies:
+                maxItems: 1
 
             required:
               - data-lanes
+              - link-frequencies
 
       port@5:
         $ref: /schemas/graph.yaml#/$defs/port-base
@@ -208,9 +211,12 @@ properties:
               data-lanes:
                 minItems: 1
                 maxItems: 4
+              link-frequencies:
+                maxItems: 1
 
             required:
               - data-lanes
+              - link-frequencies
 
     required:
       - port@0
@@ -273,12 +279,12 @@ examples:
             };
           };
 
-          /* Port 2, unused */
+          /* Port 2, unconnected */
           port@2 {
             reg = <2>;
           };
 
-          /* Port 3, unused */
+          /* Port 3, unconnected */
           port@3 {
             reg = <3>;
           };
@@ -293,7 +299,7 @@ examples:
             };
           };
 
-          /* Port 5, unused */
+          /* Port 5, unconnected */
           port@5 {
             reg = <5>;
           };
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 1d43cf3824eb..c872647ae808 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -16,8 +16,8 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 
-#define ATR_MAX_ADAPTERS 99	/* Just a sanity limit */
-#define ATR_MAX_SYMLINK_LEN 16	/* Longest name is 10 chars: "channel-99" */
+#define ATR_MAX_ADAPTERS 100	/* Just a sanity limit */
+#define ATR_MAX_SYMLINK_LEN 11	/* Longest name is 10 chars: "channel-99" */
 
 /**
  * struct i2c_atr_cli2alias_pair - Holds the alias assigned to a client.
@@ -179,18 +179,12 @@ static int i2c_atr_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	struct i2c_adapter *parent = atr->parent;
 	int ret;
 
-	/* Switch to the right atr port */
-	if (atr->ops->select) {
-		ret = atr->ops->select(atr, chan->chan_id);
-		if (ret < 0)
-			goto out_deselect;
-	}
-
 	/* Translate addresses */
 	mutex_lock(&chan->orig_addrs_lock);
+
 	ret = i2c_atr_map_msgs(chan, msgs, num);
 	if (ret < 0)
-		goto out_unlock_deselect;
+		goto err_unlock;
 
 	/* Perform the transfer */
 	ret = i2c_transfer(parent, msgs, num);
@@ -198,13 +192,9 @@ static int i2c_atr_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	/* Restore addresses */
 	i2c_atr_unmap_msgs(chan, msgs, num);
 
-out_unlock_deselect:
+err_unlock:
 	mutex_unlock(&chan->orig_addrs_lock);
 
-out_deselect:
-	if (atr->ops->deselect)
-		atr->ops->deselect(atr, chan->chan_id);
-
 	return ret;
 }
 
@@ -216,7 +206,6 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_adapter *parent = atr->parent;
 	struct i2c_atr_cli2alias_pair *c2a;
-	int ret = 0;
 
 	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list, addr);
 	if (!c2a) {
@@ -224,15 +213,8 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		return -ENXIO;
 	}
 
-	if (atr->ops->select)
-		ret = atr->ops->select(atr, chan->chan_id);
-	if (!ret)
-		ret = i2c_smbus_xfer(parent, c2a->alias, flags, read_write,
-				     command, size, data);
-	if (atr->ops->deselect)
-		atr->ops->deselect(atr, chan->chan_id);
-
-	return ret;
+	return i2c_smbus_xfer(parent, c2a->alias, flags, read_write, command,
+			      size, data);
 }
 
 static u32 i2c_atr_functionality(struct i2c_adapter *adap)
@@ -372,8 +354,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	if (!ops || !ops->attach_client || !ops->detach_client)
 		return ERR_PTR(-EINVAL);
 
-	atr = devm_kzalloc(dev, struct_size(atr, adapter, max_adapters),
-			   GFP_KERNEL);
+	atr = kzalloc(struct_size(atr, adapter, max_adapters), GFP_KERNEL);
 	if (!atr)
 		return ERR_PTR(-ENOMEM);
 
@@ -405,6 +386,7 @@ void i2c_atr_delete(struct i2c_atr *atr)
 {
 	bus_unregister_notifier(&i2c_bus_type, &atr->i2c_nb);
 	mutex_destroy(&atr->lock);
+	kfree(atr);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, I2C_ATR);
 
@@ -502,15 +484,18 @@ EXPORT_SYMBOL_NS_GPL(i2c_atr_add_adapter, I2C_ATR);
 void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 {
 	char symlink_name[ATR_MAX_SYMLINK_LEN];
-
-	struct i2c_adapter *adap = atr->adapter[chan_id];
-	struct i2c_atr_chan *chan = adap->algo_data;
-	struct fwnode_handle *fwnode = dev_fwnode(&adap->dev);
+	struct i2c_adapter *adap;
+	struct i2c_atr_chan *chan;
+	struct fwnode_handle *fwnode;
 	struct device *dev = atr->dev;
 
+	adap = atr->adapter[chan_id];
 	if (!adap)
 		return;
 
+	chan = adap->algo_data;
+	fwnode = dev_fwnode(&adap->dev);
+
 	dev_dbg(dev, "Removing ATR child bus %d\n", i2c_adapter_id(adap));
 
 	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index befa78128a9a..60a07b5bace3 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -337,7 +337,7 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			dev_err(&priv->client->dev,
 				"Failed to find stream from source frame desc\n");
 			ret = -EPIPE;
-			goto out;
+			goto out_unlock;
 		}
 
 		fd->entry[fd->num_entries].stream = route->source_stream;
@@ -349,7 +349,7 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->num_entries++;
 	}
 
-out:
+out_unlock:
 	v4l2_subdev_unlock_state(state);
 
 	return ret;
@@ -626,7 +626,7 @@ static int ub913_parse_dt(struct ub913_data *priv)
 	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
 						    UB913_PAD_SINK, 0, 0);
 	if (!ep_fwnode) {
-		dev_err(dev, "No sink endpoint\n");
+		dev_err_probe(dev, -ENOENT, "No sink endpoint\n");
 		return -ENOENT;
 	}
 
@@ -636,7 +636,7 @@ static int ub913_parse_dt(struct ub913_data *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (ret) {
-		dev_err(dev, "OF: failed to parse pclk-sample: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to parse 'pclk-sample'\n");
 		return ret;
 	}
 
@@ -706,7 +706,7 @@ static int ub913_subdev_init(struct ub913_data *priv)
 
 	ret = v4l2_subdev_init_finalize(&priv->sd);
 	if (ret)
-		goto err_entity_cleanup;
+		goto err_fwnode_put;
 
 	ret = ub913_v4l2_notifier_register(priv);
 	if (ret) {
@@ -727,6 +727,8 @@ static int ub913_subdev_init(struct ub913_data *priv)
 	ub913_v4l2_nf_unregister(priv);
 err_subdev_cleanup:
 	v4l2_subdev_cleanup(&priv->sd);
+err_fwnode_put:
+	fwnode_handle_put(priv->sd.fwnode);
 err_entity_cleanup:
 	media_entity_cleanup(&priv->sd.entity);
 
@@ -738,6 +740,7 @@ static void ub913_subdev_uninit(struct ub913_data *priv)
 	v4l2_async_unregister_subdev(&priv->sd);
 	ub913_v4l2_nf_unregister(priv);
 	v4l2_subdev_cleanup(&priv->sd);
+	fwnode_handle_put(priv->sd.fwnode);
 	media_entity_cleanup(&priv->sd.entity);
 }
 
@@ -764,7 +767,7 @@ static int ub913_probe(struct i2c_client *client)
 
 	/*
 	 * ub913 can also work without ext clock, but that is not supported by
-	 * the driver yet
+	 * the driver yet.
 	 */
 	priv->clkin = devm_clk_get(dev, "clkin");
 	if (IS_ERR(priv->clkin))
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index ec33e16da3d1..738652f2294b 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -18,7 +18,6 @@
 #include <linux/kernel.h>
 #include <linux/math64.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/property.h>
 #include <linux/rational.h>
 #include <linux/regmap.h>
@@ -52,8 +51,8 @@
 #define UB953_REG_CLKOUT_CTRL0			0x06
 #define UB953_REG_CLKOUT_CTRL1			0x07
 
-#define UB953_REG_SCL_HIGH_TIME			0x0B
-#define UB953_REG_SCL_LOW_TIME			0x0C
+#define UB953_REG_SCL_HIGH_TIME			0x0b
+#define UB953_REG_SCL_LOW_TIME			0x0c
 
 #define UB953_REG_LOCAL_GPIO_DATA		0x0d
 #define UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(n)		BIT(4 + (n))
@@ -74,9 +73,9 @@
 #define UB953_REG_CRC_ERR_CNT2			0x56
 
 #define UB953_REG_CSI_ERR_CNT			0x5c
-#define UB953_REG_CSI_ERR_STATUS		0x5D
-#define UB953_REG_CSI_ERR_DLANE01		0x5E
-#define UB953_REG_CSI_ERR_DLANE23		0x5F
+#define UB953_REG_CSI_ERR_STATUS		0x5d
+#define UB953_REG_CSI_ERR_DLANE01		0x5e
+#define UB953_REG_CSI_ERR_DLANE23		0x5f
 #define UB953_REG_CSI_ERR_CLK_LANE		0x60
 #define UB953_REG_CSI_PKT_HDR_VC_ID		0x61
 #define UB953_REG_PKT_HDR_WC_LSB		0x62
@@ -104,12 +103,12 @@
 #define UB953_IND_PGEN_BAR_SIZE0		0x07
 #define UB953_IND_PGEN_ACT_LPF1			0x08
 #define UB953_IND_PGEN_ACT_LPF0			0x09
-#define UB953_IND_PGEN_TOT_LPF1			0x0A
-#define UB953_IND_PGEN_TOT_LPF0			0x0B
-#define UB953_IND_PGEN_LINE_PD1			0x0C
-#define UB953_IND_PGEN_LINE_PD0			0x0D
-#define UB953_IND_PGEN_VBP			0x0E
-#define UB953_IND_PGEN_VFP			0x0F
+#define UB953_IND_PGEN_TOT_LPF1			0x0a
+#define UB953_IND_PGEN_TOT_LPF0			0x0b
+#define UB953_IND_PGEN_LINE_PD1			0x0c
+#define UB953_IND_PGEN_LINE_PD0			0x0d
+#define UB953_IND_PGEN_VBP			0x0e
+#define UB953_IND_PGEN_VFP			0x0f
 #define UB953_IND_PGEN_COLOR(n)			(0x10 + (n)) /* n <= 15 */
 
 /* Note: Only sync mode supported for now */
@@ -160,7 +159,7 @@ struct ub953_data {
 
 	enum ub953_mode		mode;
 
-	struct ds90ub9xx_platform_data *plat_data;
+	const struct ds90ub9xx_platform_data	*plat_data;
 };
 
 static inline struct ub953_data *sd_to_ub953(struct v4l2_subdev *sd)
@@ -180,12 +179,15 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val)
 	mutex_lock(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
-	if (ret)
+	if (ret) {
 		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
 			reg, ret);
-	else
-		*val = v;
+		goto out_unlock;
+	}
 
+	*val = v;
+
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -207,7 +209,7 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val)
 	return ret;
 }
 
-static int _ub953_select_ind_reg_block(struct ub953_data *priv, u8 block)
+static int ub953_select_ind_reg_block(struct ub953_data *priv, u8 block)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
@@ -235,16 +237,16 @@ __maybe_unused static int ub953_read_ind(struct ub953_data *priv, u8 block,
 
 	mutex_lock(&priv->reg_lock);
 
-	ret = _ub953_select_ind_reg_block(priv, block);
+	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when reading %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out;
+		goto out_unlock;
 	}
 
 	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
@@ -252,12 +254,12 @@ __maybe_unused static int ub953_read_ind(struct ub953_data *priv, u8 block,
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_DATA failed when reading %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out;
+		goto out_unlock;
 	}
 
 	*val = v;
 
-out:
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -269,16 +271,16 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 
 	mutex_lock(&priv->reg_lock);
 
-	ret = _ub953_select_ind_reg_block(priv, block);
+	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when writing %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out;
+		goto out_unlock;
 	}
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
@@ -288,7 +290,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 			block, reg, ret);
 	}
 
-out:
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -300,27 +302,27 @@ static int ub953_write_ind16(struct ub953_data *priv, u8 block, u8 reg, u16 val)
 
 	mutex_lock(&priv->reg_lock);
 
-	ret = _ub953_select_ind_reg_block(priv, block);
+	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val >> 8);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg + 1);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val & 0xff);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
-out:
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -503,7 +505,6 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_frame_desc *fd)
 {
 	struct ub953_data *priv = sd_to_ub953(sd);
-	const struct v4l2_subdev_krouting *routing;
 	struct v4l2_mbus_frame_desc source_fd;
 	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
@@ -523,9 +524,7 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	routing = &state->routing;
-
-	for_each_active_route(routing, route) {
+	for_each_active_route(&state->routing, route) {
 		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
 		unsigned int i;
 
@@ -543,7 +542,7 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			dev_err(&priv->client->dev,
 				"Failed to find stream from source frame desc\n");
 			ret = -EPIPE;
-			goto out;
+			goto out_unlock;
 		}
 
 		fd->entry[fd->num_entries].stream = route->source_stream;
@@ -558,7 +557,7 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->num_entries++;
 	}
 
-out:
+out_unlock:
 	v4l2_subdev_unlock_state(state);
 
 	return ret;
@@ -1268,25 +1267,20 @@ static int ub953_parse_dt(struct ub953_data *priv)
 
 	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
 						    UB953_PAD_SINK, 0, 0);
-	if (!ep_fwnode) {
-		dev_err(dev, "OF: no endpoint\n");
-		return -ENOENT;
-	}
+	if (!ep_fwnode)
+		return dev_err_probe(dev, -ENOENT, "no endpoint found\n");
 
 	ret = fwnode_property_count_u32(ep_fwnode, "data-lanes");
 
 	fwnode_handle_put(ep_fwnode);
 
-	if (ret <= 0) {
-		dev_err(dev, "failed to parse property 'data-lanes': %d\n",
-			ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to parse property 'data-lanes'\n");
 
-	if (ret != 1 && ret != 2 && ret != 4) {
-		dev_err(dev, "bad number of data-lanes: %d\n", ret);
-		return -EINVAL;
-	}
+	if (ret != 1 && ret != 2 && ret != 4)
+		return dev_err_probe(dev, -EINVAL,
+				     "bad number of data-lanes: %d\n", ret);
 
 	priv->num_data_lanes = ret;
 
@@ -1324,7 +1318,7 @@ static int ub953_hw_init(struct ub953_data *priv)
 		break;
 	default:
 		return dev_err_probe(dev, -EIO,
-				     "Illegal mode in mode register\n");
+				     "Invalid mode in mode register\n");
 	}
 
 	dev_dbg(dev, "mode from %s: %#x\n", mode_override ? "reg" : "strap",
@@ -1366,8 +1360,7 @@ static int ub953_subdev_init(struct ub953_data *priv)
 
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub953_subdev_ops);
 
-	v4l2_ctrl_handler_init(&priv->ctrl_handler,
-			       ARRAY_SIZE(ub953_tpg_qmenu) - 1);
+	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
 	priv->sd.ctrl_handler = &priv->ctrl_handler;
 
 	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &ub953_ctrl_ops,
@@ -1375,9 +1368,11 @@ static int ub953_subdev_init(struct ub953_data *priv)
 				     ARRAY_SIZE(ub953_tpg_qmenu) - 1, 0, 0,
 				     ub953_tpg_qmenu);
 
-	if (priv->ctrl_handler.error)
-		return dev_err_probe(dev, priv->ctrl_handler.error,
-				     "Failed to set up v4l2 controls\n");
+	if (priv->ctrl_handler.error) {
+		ret = priv->ctrl_handler.error;
+		dev_err_probe(dev, ret, "Failed to set up v4l2 controls\n");
+		goto err_remove_ctrls;
+	}
 
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
@@ -1406,7 +1401,7 @@ static int ub953_subdev_init(struct ub953_data *priv)
 
 	ret = v4l2_subdev_init_finalize(&priv->sd);
 	if (ret)
-		goto err_entity_cleanup;
+		goto err_fwnode_put;
 
 	ret = ub953_v4l2_notifier_register(priv);
 	if (ret) {
@@ -1427,6 +1422,8 @@ static int ub953_subdev_init(struct ub953_data *priv)
 	ub953_v4l2_notifier_unregister(priv);
 err_free_state:
 	v4l2_subdev_cleanup(&priv->sd);
+err_fwnode_put:
+	fwnode_handle_put(priv->sd.fwnode);
 err_entity_cleanup:
 	media_entity_cleanup(&priv->sd.entity);
 err_remove_ctrls:
@@ -1440,6 +1437,7 @@ static void ub953_subdev_uninit(struct ub953_data *priv)
 	v4l2_async_unregister_subdev(&priv->sd);
 	ub953_v4l2_notifier_unregister(priv);
 	v4l2_subdev_cleanup(&priv->sd);
+	fwnode_handle_put(priv->sd.fwnode);
 	media_entity_cleanup(&priv->sd.entity);
 	v4l2_ctrl_handler_free(&priv->ctrl_handler);
 }
@@ -1456,9 +1454,7 @@ static int ub953_probe(struct i2c_client *client)
 
 	priv->client = client;
 
-	priv->hw_data = of_device_get_match_data(dev);
-	if (!priv->hw_data)
-		return -ENODEV;
+	priv->hw_data = device_get_match_data(dev);
 
 	priv->plat_data = dev_get_platdata(&client->dev);
 	if (!priv->plat_data)
@@ -1544,8 +1540,8 @@ static const struct ub953_hw_data ds90ub971_hw = {
 };
 
 static const struct i2c_device_id ub953_id[] = {
-	{ "ds90ub953-q1", 0 },
-	{ "ds90ub971-q1", 0 },
+	{ "ds90ub953-q1", (kernel_ulong_t)&ds90ub953_hw },
+	{ "ds90ub971-q1", (kernel_ulong_t)&ds90ub971_hw },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ub953_id);
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 2cefb3744901..eb391f0259b3 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -19,7 +19,6 @@
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -31,6 +30,8 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-subdev.h>
 
+#define MHZ(v) ((u32)((v) * 1000000U))
+
 #define UB960_POLL_TIME_MS	500
 
 #define UB960_MAX_RX_NPORTS	4
@@ -147,7 +148,13 @@
 #define UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT	0
 
 #define UB960_XR_AEQ_CTL1			0x42
-#define UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_SHIFT	4
+#define UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_FPD_CLK	BIT(6)
+#define UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_ENCODING	BIT(5)
+#define UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_PARITY	BIT(4)
+#define UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_MASK        \
+	(UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_FPD_CLK |  \
+	 UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_ENCODING | \
+	 UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_PARITY)
 #define UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN	BIT(0)
 
 #define UB960_XR_AEQ_ERR_THOLD			0x43
@@ -160,9 +167,14 @@
 #define UB960_RR_BCC_STATUS_SLAVE_ERR		BIT(2)
 #define UB960_RR_BCC_STATUS_SLAVE_TO		BIT(1)
 #define UB960_RR_BCC_STATUS_RESP_ERR		BIT(0)
+#define UB960_RR_BCC_STATUS_ERROR_MASK                                    \
+	(UB960_RR_BCC_STATUS_SEQ_ERROR | UB960_RR_BCC_STATUS_MASTER_ERR | \
+	 UB960_RR_BCC_STATUS_MASTER_TO | UB960_RR_BCC_STATUS_SLAVE_ERR |  \
+	 UB960_RR_BCC_STATUS_SLAVE_TO | UB960_RR_BCC_STATUS_RESP_ERR)
 
 #define UB960_RR_FPD3_CAP			0x4A
 #define UB960_RR_RAW_EMBED_DTYPE		0x4B
+#define UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT	6
 
 #define UB960_SR_FPD3_PORT_SEL			0x4C
 
@@ -173,6 +185,10 @@
 #define UB960_RR_RX_PORT_STS1_PARITY_ERROR	BIT(2)
 #define UB960_RR_RX_PORT_STS1_PORT_PASS		BIT(1)
 #define UB960_RR_RX_PORT_STS1_LOCK_STS		BIT(0)
+#define UB960_RR_RX_PORT_STS1_ERROR_MASK       \
+	(UB960_RR_RX_PORT_STS1_BCC_CRC_ERROR | \
+	 UB960_RR_RX_PORT_STS1_BCC_SEQ_ERROR | \
+	 UB960_RR_RX_PORT_STS1_PARITY_ERROR)
 
 #define UB960_RR_RX_PORT_STS2			0x4E
 #define UB960_RR_RX_PORT_STS2_LINE_LEN_UNSTABLE	BIT(7)
@@ -183,6 +199,8 @@
 #define UB960_RR_RX_PORT_STS2_FREQ_STABLE	BIT(2)
 #define UB960_RR_RX_PORT_STS2_CABLE_FAULT	BIT(1)
 #define UB960_RR_RX_PORT_STS2_LINE_CNT_CHG	BIT(0)
+#define UB960_RR_RX_PORT_STS2_ERROR_MASK       \
+	UB960_RR_RX_PORT_STS2_BUFFER_ERROR
 
 #define UB960_RR_RX_FREQ_HIGH			0x4F
 #define UB960_RR_RX_FREQ_LOW			0x50
@@ -196,6 +214,7 @@
 
 #define UB960_RR_BCC_CONFIG			0x58
 #define UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH	BIT(6)
+#define UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK	GENMASK(2, 0)
 
 #define UB960_RR_DATAPATH_CTL1			0x59
 #define UB960_RR_DATAPATH_CTL2			0x5A
@@ -207,10 +226,17 @@
 #define UB960_RR_SLAVE_ALIAS(n)			(0x65 + (n))
 
 #define UB960_RR_PORT_CONFIG			0x6D
+#define UB960_RR_PORT_CONFIG_FPD3_MODE_MASK	GENMASK(1, 0)
+
 #define UB960_RR_BC_GPIO_CTL(n)			(0x6E + (n)) /* n < 2 */
 #define UB960_RR_RAW10_ID			0x70
+#define UB960_RR_RAW10_ID_VC_SHIFT		6
+#define UB960_RR_RAW10_ID_DT_SHIFT		0
+
 #define UB960_RR_RAW12_ID			0x71
 #define UB960_RR_CSI_VC_MAP			0x72
+#define UB960_RR_CSI_VC_MAP_SHIFT(x)		((x) * 2)
+
 #define UB960_RR_LINE_COUNT_HI			0x73
 #define UB960_RR_LINE_COUNT_LO			0x74
 #define UB960_RR_LINE_LEN_1			0x75
@@ -224,9 +250,15 @@
 #define UB960_RR_CSI_RX_STS_CKSUM_ERR		BIT(2)
 #define UB960_RR_CSI_RX_STS_ECC2_ERR		BIT(1)
 #define UB960_RR_CSI_RX_STS_ECC1_ERR		BIT(0)
+#define UB960_RR_CSI_RX_STS_ERROR_MASK                                    \
+	(UB960_RR_CSI_RX_STS_LENGTH_ERR | UB960_RR_CSI_RX_STS_CKSUM_ERR | \
+	 UB960_RR_CSI_RX_STS_ECC2_ERR | UB960_RR_CSI_RX_STS_ECC1_ERR)
 
 #define UB960_RR_CSI_ERR_COUNTER		0x7B
 #define UB960_RR_PORT_CONFIG2			0x7C
+#define UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_MASK GENMASK(7, 6)
+#define UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_SHIFT 6
+
 #define UB960_RR_PORT_CONFIG2_LV_POL_LOW	BIT(1)
 #define UB960_RR_PORT_CONFIG2_FV_POL_LOW	BIT(0)
 
@@ -267,6 +299,8 @@
 #define UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR		BIT(2)
 
 #define UB960_RR_AEQ_STATUS			0xD3
+#define UB960_RR_AEQ_STATUS_STATUS_2		GENMASK(5, 3)
+#define UB960_RR_AEQ_STATUS_STATUS_1		GENMASK(2, 0)
 
 #define UB960_RR_AEQ_BYPASS			0xD4
 #define UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT	5
@@ -336,8 +370,10 @@
 #define UB960_MIN_AEQ_STROBE_POS -7
 #define UB960_MAX_AEQ_STROBE_POS 7
 
-#define UB960_MIN_MANUAL_STROBE_POS -(7 + 6)
-#define UB960_MAX_MANUAL_STROBE_POS (7 + 6)
+#define UB960_MANUAL_STROBE_EXTRA_DELAY 6
+
+#define UB960_MIN_MANUAL_STROBE_POS -(7 + UB960_MANUAL_STROBE_EXTRA_DELAY)
+#define UB960_MAX_MANUAL_STROBE_POS (7 + UB960_MANUAL_STROBE_EXTRA_DELAY)
 #define UB960_NUM_MANUAL_STROBE_POS (UB960_MAX_MANUAL_STROBE_POS - UB960_MIN_MANUAL_STROBE_POS + 1)
 
 #define UB960_MIN_EQ_LEVEL 0
@@ -584,12 +620,15 @@ static int ub960_read(struct ub960_data *priv, u8 reg, u8 *val)
 	mutex_lock(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
-	else
-		*val = v;
+		goto out_unlock;
+	}
+
+	*val = v;
 
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -639,7 +678,7 @@ static int _ub960_rxport_select(struct ub960_data *priv, u8 nport)
 		return 0;
 
 	ret = regmap_write(priv->regmap, UB960_SR_FPD3_PORT_SEL,
-			   (nport << 4) | (1 << nport));
+			   (nport << 4) | BIT(nport));
 	if (ret) {
 		dev_err(dev, "%s: cannot select rxport %d (%d)!\n", __func__,
 			nport, ret);
@@ -663,12 +702,15 @@ static int ub960_rxport_read(struct ub960_data *priv, u8 nport, u8 reg, u8 *val)
 	_ub960_rxport_select(priv, nport);
 
 	ret = regmap_read(priv->regmap, reg, &v);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
-	else
-		*val = v;
+		goto out_unlock;
+	}
+
+	*val = v;
 
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -704,7 +746,6 @@ static int ub960_rxport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
 	_ub960_rxport_select(priv, nport);
 
 	ret = regmap_update_bits(priv->regmap, reg, mask, val);
-
 	if (ret)
 		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
 			__func__, reg, ret);
@@ -724,7 +765,7 @@ static int _ub960_csiport_select(struct ub960_data *priv, u8 nport)
 		return 0;
 
 	ret = regmap_write(priv->regmap, UB960_SR_CSI_PORT_SEL,
-			   (nport << 4) | (1 << nport));
+			   (nport << 4) | BIT(nport));
 	if (ret) {
 		dev_err(dev, "%s: cannot select csi port %d (%d)!\n", __func__,
 			nport, ret);
@@ -749,12 +790,15 @@ static int ub960_csiport_read(struct ub960_data *priv, u8 nport, u8 reg,
 	_ub960_csiport_select(priv, nport);
 
 	ret = regmap_read(priv->regmap, reg, &v);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
-	else
-		*val = v;
+		goto out_unlock;
+	}
+
+	*val = v;
 
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -791,7 +835,6 @@ static int ub960_csiport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
 	_ub960_csiport_select(priv, nport);
 
 	ret = regmap_update_bits(priv->regmap, reg, mask, val);
-
 	if (ret)
 		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
 			__func__, reg, ret);
@@ -830,14 +873,14 @@ static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val)
 
 	ret = _ub960_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when reading %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out;
+		goto out_unlock;
 	}
 
 	ret = regmap_read(priv->regmap, UB960_SR_IND_ACC_DATA, &v);
@@ -845,12 +888,12 @@ static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val)
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_DATA failed when reading %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out;
+		goto out_unlock;
 	}
 
 	*val = v;
 
-out:
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -863,24 +906,26 @@ static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val)
 	mutex_lock(&priv->reg_lock);
 
 	ret = _ub960_select_ind_reg_block(priv, block);
+	if (ret)
+		goto out_unlock;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when writing %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out;
+		goto out_unlock;
 	}
 
-	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_DATA failed when writing %u:%x02x\n: %d\n",
 			block, reg, ret);
-		goto out;
+		goto out_unlock;
 	}
 
-	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val);
-
-out:
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -894,25 +939,25 @@ static int ub960_write_ind16(struct ub960_data *priv, u8 block, u8 reg, u16 val)
 
 	ret = _ub960_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val >> 8);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg + 1);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val & 0xff);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
-out:
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -922,28 +967,31 @@ static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
 				 u8 mask, u8 val)
 {
 	int ret;
-	u32 v;
 
 	mutex_lock(&priv->reg_lock);
 
 	ret = _ub960_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out;
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
-	if (ret)
-		goto out;
-
-	ret = regmap_read(priv->regmap, UB960_SR_IND_ACC_DATA, &v);
-	if (ret)
-		goto out;
-
-	v &= ~mask;
-	v |= val;
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Write to IND_ACC_ADDR failed when updating %u:%x02x: %d\n",
+			block, reg, ret);
+		goto out_unlock;
+	}
 
-	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, v);
+	ret = regmap_update_bits(priv->regmap, UB960_SR_IND_ACC_DATA, mask,
+				 val);
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Write to IND_ACC_DATA failed when updating %u:%x02x: %d\n",
+			block, reg, ret);
+		goto out_unlock;
+	}
 
-out:
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -992,13 +1040,13 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	if (!entry) {
 		dev_err(dev, "rx%u: alias pool exhausted\n", rxport->nport);
 		ret = -EADDRNOTAVAIL;
-		goto out;
+		goto out_unlock;
 	}
 
-	if (port_reg_idx_mask == (1 << UB960_MAX_PORT_ALIASES) - 1) {
+	if (port_reg_idx_mask == GENMASK(UB960_MAX_PORT_ALIASES - 1, 0)) {
 		dev_err(dev, "rx%u: all aliases in use\n", rxport->nport);
 		ret = -EADDRNOTAVAIL;
-		goto out;
+		goto out_unlock;
 	}
 
 	alias = entry->alias_id;
@@ -1022,7 +1070,7 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	dev_dbg(dev, "rx%u: client 0x%02x mapped at alias 0x%02x (%s)\n",
 		rxport->nport, client->addr, alias, client->name);
 
-out:
+out_unlock:
 	mutex_unlock(&priv->atr_alias_table.lock);
 	return ret;
 }
@@ -1055,7 +1103,7 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	if (pool_idx == priv->atr_alias_table.num_entries) {
 		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
 			rxport->nport, client->addr);
-		goto out;
+		goto out_unlock;
 	}
 
 	alias = entry->alias_id;
@@ -1071,7 +1119,7 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	dev_dbg(dev, "rx%u: client 0x%02x unmapped from alias 0x%02x (%s)\n",
 		rxport->nport, client->addr, alias, client->name);
 
-out:
+out_unlock:
 	mutex_unlock(&priv->atr_alias_table.lock);
 }
 
@@ -1103,7 +1151,7 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 	priv->txports[nport] = txport;
 
 	ret = fwnode_property_count_u32(ep_fwnode, "data-lanes");
-	if (ret <= 0) {
+	if (ret < 0) {
 		dev_err(dev, "tx%u: failed to parse 'data-lanes': %d\n", nport,
 			ret);
 		goto err_free_txport;
@@ -1111,20 +1159,6 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 
 	txport->num_data_lanes = ret;
 
-	ret = fwnode_property_count_u64(ep_fwnode, "link-frequencies");
-	if (ret < 0) {
-		dev_err(dev, "tx%u: failed to parse 'link-frequencies': %d\n",
-			nport, ret);
-		goto err_free_txport;
-	}
-
-	if (ret != 1) {
-		dev_err(dev,
-			"tx%u: 'link-frequencies' must contain a single frequency: %d\n",
-			nport, ret);
-		goto err_free_txport;
-	}
-
 	ret = fwnode_property_read_u64(ep_fwnode, "link-frequencies", &freq);
 	if (ret) {
 		dev_err(dev, "tx%u: failed to read 'link-frequencies': %d\n",
@@ -1135,10 +1169,10 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 	priv->tx_link_freq[0] = freq;
 	priv->tx_data_rate = freq * 2;
 
-	if (priv->tx_data_rate != 1600000000 &&
-	    priv->tx_data_rate != 1200000000 &&
-	    priv->tx_data_rate != 800000000 &&
-	    priv->tx_data_rate != 400000000) {
+	if (priv->tx_data_rate != MHZ(1600) &&
+	    priv->tx_data_rate != MHZ(1200) &&
+	    priv->tx_data_rate != MHZ(800) &&
+	    priv->tx_data_rate != MHZ(400)) {
 		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
 		return -EINVAL;
 	}
@@ -1160,14 +1194,14 @@ static void ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
 	int ret;
 
 	ret = ub960_csiport_read(priv, nport, UB960_TR_CSI_TX_ISR, &csi_tx_isr);
+	if (ret)
+		return;
 
-	if (!ret) {
-		if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR)
-			dev_warn(dev, "TX%u: CSI_SYNC_ERROR\n", nport);
+	if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR)
+		dev_warn(dev, "TX%u: CSI_SYNC_ERROR\n", nport);
 
-		if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR)
-			dev_warn(dev, "TX%u: CSI_PASS_ERROR\n", nport);
-	}
+	if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR)
+		dev_warn(dev, "TX%u: CSI_PASS_ERROR\n", nport);
 }
 
 /* -----------------------------------------------------------------------------
@@ -1193,8 +1227,8 @@ static int ub960_rxport_enable_vpocs(struct ub960_data *priv)
 	return 0;
 
 err_disable_vpocs:
-	for (; nport > 0; --nport) {
-		struct ub960_rxport *rxport = priv->rxports[nport - 1];
+	while (nport--) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport || !rxport->vpoc)
 			continue;
@@ -1253,12 +1287,16 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
 		       UB960_IR_RX_ANA_STROBE_SET_CLK, &v);
 
-	clk_delay = v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY ? 0 : 6;
+	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
+			    0 :
+			    UB960_MANUAL_STROBE_EXTRA_DELAY;
 
 	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
 		       UB960_IR_RX_ANA_STROBE_SET_DATA, &v);
 
-	data_delay = v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY ? 0 : 6;
+	data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
+			     0 :
+			     UB960_MANUAL_STROBE_EXTRA_DELAY;
 
 	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v);
 	if (ret)
@@ -1282,17 +1320,13 @@ static void ub960_rxport_set_strobe_pos(struct ub960_data *priv,
 {
 	u8 clk_delay, data_delay;
 
-	if (WARN_ON(strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
-		    strobe_pos > UB960_MAX_MANUAL_STROBE_POS))
-		return;
-
 	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
 	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
 
-	if (strobe_pos < -7)
-		clk_delay = abs(strobe_pos) - 6;
-	else if (strobe_pos > 7)
-		data_delay = strobe_pos - 6;
+	if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
+		clk_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
+	else if (strobe_pos > UB960_MAX_AEQ_STROBE_POS)
+		data_delay = strobe_pos - UB960_MANUAL_STROBE_EXTRA_DELAY;
 	else if (strobe_pos < 0)
 		clk_delay = abs(strobe_pos) | UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
 	else if (strobe_pos > 0)
@@ -1308,11 +1342,9 @@ static void ub960_rxport_set_strobe_pos(struct ub960_data *priv,
 static void ub960_rxport_set_strobe_range(struct ub960_data *priv,
 					  s8 strobe_min, s8 strobe_max)
 {
-	WARN_ON(strobe_min < UB960_MIN_AEQ_STROBE_POS);
-	WARN_ON(strobe_max > UB960_MAX_AEQ_STROBE_POS);
-
-	strobe_min += 7;
-	strobe_max += 7;
+	/* Convert the signed strobe pos to positive zero based value */
+	strobe_min -= UB960_MIN_AEQ_STROBE_POS;
+	strobe_max -= UB960_MIN_AEQ_STROBE_POS;
 
 	ub960_write(priv, UB960_XR_SFILTER_CFG,
 		    ((u8)strobe_min << UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) |
@@ -1329,7 +1361,8 @@ static int ub960_rxport_get_eq_level(struct ub960_data *priv,
 	if (ret)
 		return ret;
 
-	*eq_level = (v & 0x7) + ((v >> 3) & 0x7);
+	*eq_level = (v & UB960_RR_AEQ_STATUS_STATUS_1) +
+		    (v & UB960_RR_AEQ_STATUS_STATUS_2);
 
 	return 0;
 }
@@ -1338,26 +1371,24 @@ static void ub960_rxport_set_eq_level(struct ub960_data *priv,
 				      unsigned int nport, u8 eq_level)
 {
 	u8 eq_stage_1_select_value, eq_stage_2_select_value;
+	const unsigned int eq_stage_max = 7;
 	u8 v;
 
-	if (eq_level <= 7) {
+	if (eq_level <= eq_stage_max) {
 		eq_stage_1_select_value = eq_level;
 		eq_stage_2_select_value = 0;
 	} else {
-		eq_stage_1_select_value = 7;
-		eq_stage_2_select_value = eq_level - 7;
+		eq_stage_1_select_value = eq_stage_max;
+		eq_stage_2_select_value = eq_level - eq_stage_max;
 	}
 
-	WARN_ON(eq_stage_1_select_value > 7);
-	WARN_ON(eq_stage_2_select_value > 7);
-
 	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
 
 	v &= ~(UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
 	       UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK);
 	v |= eq_stage_1_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT;
 	v |= eq_stage_2_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT;
-	v |= UB960_RR_AEQ_BYPASS_ENABLE; /* Enable AEQ Bypass */
+	v |= UB960_RR_AEQ_BYPASS_ENABLE;
 
 	ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v);
 }
@@ -1388,7 +1419,7 @@ static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
 	} else {
 		/* Enable SFILTER and error control */
 		ub960_write(priv, UB960_XR_AEQ_CTL1,
-			    (0x7 << UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_SHIFT) |
+			    UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_MASK |
 				    UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN);
 
 		/* Set AEQ strobe range */
@@ -1472,8 +1503,10 @@ static int ub960_rxport_link_ok(struct ub960_data *priv, unsigned int nport,
 
 	parity_errors = (v1 << 8) | v2;
 
-	errors = (rx_port_sts1 & 0x2c) || (rx_port_sts2 & 0x20) ||
-		 (bcc_sts & 0x3f) || (csi_rx_sts & 0xf) || csi_err_cnt ||
+	errors = (rx_port_sts1 & UB960_RR_RX_PORT_STS1_ERROR_MASK) ||
+		 (rx_port_sts2 & UB960_RR_RX_PORT_STS2_ERROR_MASK) ||
+		 (bcc_sts & UB960_RR_BCC_STATUS_ERROR_MASK) ||
+		 (csi_rx_sts & UB960_RR_CSI_RX_STS_ERROR_MASK) || csi_err_cnt ||
 		 parity_errors;
 
 	*ok = !errors;
@@ -1621,7 +1654,6 @@ static unsigned long ub960_calc_bc_clk_rate_ub960(struct ub960_data *priv,
 		break;
 
 	default:
-		WARN_ON(true);
 		return 0;
 	}
 
@@ -1644,7 +1676,6 @@ static unsigned long ub960_calc_bc_clk_rate_ub9702(struct ub960_data *priv,
 		return 9437500;
 
 	default:
-		WARN_ON(true);
 		return 0;
 	}
 }
@@ -1716,17 +1747,17 @@ static int ub960_rxport_add_serializers(struct ub960_data *priv)
 	return 0;
 
 err_remove_sers:
-	for (; nport > 0; --nport) {
-		struct ub960_rxport *rxport = priv->rxports[nport - 1];
+	while (nport--) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport)
 			continue;
 
-		rxport = priv->rxports[nport - 1];
+		rxport = priv->rxports[nport];
 		if (!rxport)
 			continue;
 
-		ub960_rxport_remove_serializer(priv, nport - 1);
+		ub960_rxport_remove_serializer(priv, nport);
 	}
 
 	return ret;
@@ -1756,7 +1787,7 @@ static void ub960_init_tx_port(struct ub960_data *priv,
 	 * From the datasheet: "initial CSI Skew-Calibration
 	 * sequence [...] should be set when operating at 1.6 Gbps"
 	 */
-	if (priv->tx_data_rate == 1600000000)
+	if (priv->tx_data_rate == MHZ(1600))
 		csi_ctl |= UB960_TR_CSI_CTL_CSI_CAL_EN;
 
 	csi_ctl |= (4 - txport->num_data_lanes) << 4;
@@ -1773,19 +1804,19 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 	/* TX ports */
 
 	switch (priv->tx_data_rate) {
-	case 1600000000:
+	case MHZ(1600):
 	default:
 		speed_select = 0;
 		pll_div = 0x10;
 		break;
-	case 1200000000:
+	case MHZ(1200):
 		speed_select = 1;
 		break;
-	case 800000000:
+	case MHZ(800):
 		speed_select = 2;
 		pll_div = 0x10;
 		break;
-	case 400000000:
+	case MHZ(400):
 		speed_select = 3;
 		pll_div = 0x10;
 		break;
@@ -1797,17 +1828,17 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div);
 
 		switch (priv->tx_data_rate) {
-		case 1600000000:
+		case MHZ(1600):
 		default:
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x80);
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4B, 0x2A);
 			break;
-		case 800000000:
+		case MHZ(800):
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x90);
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4F, 0x2A);
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4B, 0x2A);
 			break;
-		case 400000000:
+		case MHZ(400):
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xA0);
 			break;
 		}
@@ -1858,32 +1889,34 @@ static void ub960_init_rx_port_ub960(struct ub960_data *priv,
 		break;
 
 	default:
-		WARN_ON(true);
 		return;
 	}
 
-	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK,
 				 bc_freq_val);
 
 	switch (rxport->rx_mode) {
-	default:
-		WARN_ON(true);
-		fallthrough;
-
 	case RXPORT_MODE_RAW10:
 		/* FPD3_MODE = RAW10 Mode (DS90UB913A-Q1 / DS90UB933-Q1 compatible) */
-		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG, 0x3,
+		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG,
+					 UB960_RR_PORT_CONFIG_FPD3_MODE_MASK,
 					 0x3);
 
 		/*
-		 * RAW10_8BIT_CTL = 0b11 : 8-bit processing using lower 8 bits
-		 * 0b10 : 8-bit processing using upper 8 bits
+		 * RAW10_8BIT_CTL = 0b10 : 8-bit processing using upper 8 bits
 		 */
 		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
-					 0x3 << 6, 0x2 << 6);
+			UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_MASK,
+			0x2 << UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_SHIFT);
 
 		break;
 
+	case RXPORT_MODE_RAW12_HF:
+	case RXPORT_MODE_RAW12_LF:
+		/* Not implemented */
+		return;
+
 	case RXPORT_MODE_CSI2_SYNC:
 	case RXPORT_MODE_CSI2_ASYNC:
 		/* CSI-2 Mode (DS90UB953-Q1 compatible) */
@@ -1951,7 +1984,6 @@ static void ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
 		break;
 
 	default:
-		WARN_ON(true);
 		return;
 	}
 
@@ -1980,7 +2012,7 @@ static void ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
 
 	/* RX port to half-rate */
 	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
-			  1 << (nport * 2));
+			  BIT(nport * 2));
 }
 
 static void ub960_init_rx_port_ub9702_fpd4_aeq(struct ub960_data *priv,
@@ -2045,7 +2077,6 @@ static void ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
 		break;
 
 	default:
-		WARN_ON(true);
 		return;
 	}
 
@@ -2091,10 +2122,6 @@ static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
 		ub960_init_rx_port_ub9702_fpd4(priv, rxport);
 
 	switch (rxport->rx_mode) {
-	default:
-		WARN_ON(true);
-		fallthrough;
-
 	case RXPORT_MODE_RAW10:
 		/*
 		 * RAW10_8BIT_CTL = 0b11 : 8-bit processing using lower 8 bits
@@ -2105,6 +2132,11 @@ static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
 
 		break;
 
+	case RXPORT_MODE_RAW12_HF:
+	case RXPORT_MODE_RAW12_LF:
+		/* Not implemented */
+		return;
+
 	case RXPORT_MODE_CSI2_SYNC:
 	case RXPORT_MODE_CSI2_ASYNC:
 
@@ -2283,7 +2315,7 @@ static void ub960_get_vc_maps(struct ub960_data *priv,
 			      struct v4l2_subdev_state *state, u8 *vc)
 {
 	const struct v4l2_subdev_krouting *routing = &state->routing;
-	u8 cur_vc[UB960_MAX_TX_NPORTS] = { 0 };
+	u8 cur_vc[UB960_MAX_TX_NPORTS] = { };
 	u8 handled_mask = 0;
 	unsigned int i;
 
@@ -2292,7 +2324,6 @@ static void ub960_get_vc_maps(struct ub960_data *priv,
 		unsigned int rx, tx;
 
 		rx = ub960_pad_to_port(priv, route->sink_pad);
-
 		if (BIT(rx) & handled_mask)
 			continue;
 
@@ -2360,8 +2391,8 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 		u8 meta_dt;
 		u32 meta_lines;
 		u32 tx_port;
-	} rx_data[UB960_MAX_RX_NPORTS] = { 0 };
-	u8 vc_map[UB960_MAX_RX_NPORTS] = { 0 };
+	} rx_data[UB960_MAX_RX_NPORTS] = { };
+	u8 vc_map[UB960_MAX_RX_NPORTS] = { };
 
 	ub960_get_vc_maps(priv, state, vc_map);
 
@@ -2432,19 +2463,20 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 			continue;
 
 		switch (rxport->rx_mode) {
-		default:
-			WARN_ON(true);
-			fallthrough;
-
 		case RXPORT_MODE_RAW10:
 			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
-					   rx_data[nport].pixel_dt | (vc << 6));
+				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT));
 
 			ub960_rxport_write(priv, rxport->nport,
-					   UB960_RR_RAW_EMBED_DTYPE,
-					   (rx_data[nport].meta_lines << 6) |
-						   rx_data[nport].meta_dt);
+				UB960_RR_RAW_EMBED_DTYPE,
+				(rx_data[nport].meta_lines << UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT) |
+					rx_data[nport].meta_dt);
+
+			break;
 
+		case RXPORT_MODE_RAW12_HF:
+		case RXPORT_MODE_RAW12_LF:
+			/* Not implemented */
 			break;
 
 		case RXPORT_MODE_CSI2_SYNC:
@@ -2452,8 +2484,10 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 			if (!priv->hw_data->is_ub9702) {
 				/* Map all VCs from this port to the same VC */
 				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
-						   (vc << 6) | (vc << 4) |
-							   (vc << 2) | (vc << 0));
+						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
+						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
+						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
+						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)));
 			} else {
 				unsigned int i;
 
@@ -2485,16 +2519,13 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 static void ub960_update_streaming_status(struct ub960_data *priv)
 {
 	unsigned int i;
-	bool streaming = false;
 
 	for (i = 0; i < UB960_MAX_NPORTS; ++i) {
-		if (priv->stream_enable_mask[i]) {
-			streaming = true;
+		if (priv->stream_enable_mask[i])
 			break;
-		}
 	}
 
-	priv->streaming = streaming;
+	priv->streaming = i < UB960_MAX_NPORTS;
 }
 
 static int ub960_enable_streams(struct v4l2_subdev *sd,
@@ -2506,7 +2537,7 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 	const struct v4l2_subdev_krouting *routing;
 	unsigned int source_stream;
 	int ret;
-	u64 sink_streams[UB960_MAX_RX_NPORTS] = { 0 };
+	u64 sink_streams[UB960_MAX_RX_NPORTS] = { };
 	unsigned int nport;
 	unsigned int failed_port;
 
@@ -2607,7 +2638,8 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 			priv->rxports[nport]->source_sd,
 			priv->rxports[nport]->source_sd_pad,
 			sink_streams[nport]);
-		WARN_ON(ret);
+		if (ret)
+			dev_err(dev, "Failed to disable streams: %d\n", ret);
 
 		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
 
@@ -2636,7 +2668,7 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
 	const struct v4l2_subdev_krouting *routing;
 	int ret;
 	unsigned int source_stream;
-	u64 sink_streams[UB960_MAX_RX_NPORTS] = { 0 };
+	u64 sink_streams[UB960_MAX_RX_NPORTS] = { };
 	unsigned int nport;
 
 	dev_dbg(dev, "Disable streams %u:%#llx\n", source_pad,
@@ -2681,7 +2713,8 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
 			priv->rxports[nport]->source_sd,
 			priv->rxports[nport]->source_sd_pad,
 			sink_streams[nport]);
-		WARN_ON(ret);
+		if (ret)
+			dev_err(dev, "Failed to disable streams: %d\n", ret);
 
 		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
 
@@ -2709,7 +2742,7 @@ static int ub960_s_stream(struct v4l2_subdev *sd, int enable)
 	const struct v4l2_subdev_krouting *routing;
 	struct v4l2_subdev_state *state;
 	struct v4l2_subdev_route *route;
-	u64 pad_stream_masks[UB960_MAX_TX_NPORTS] = { 0 };
+	u64 pad_stream_masks[UB960_MAX_TX_NPORTS] = { };
 	unsigned int nport;
 	int ret = 0;
 
@@ -2731,15 +2764,15 @@ static int ub960_s_stream(struct v4l2_subdev *sd, int enable)
 				pad_stream_masks[nport]);
 
 			if (ret) {
-				for (; nport > 0; --nport) {
-					if (pad_stream_masks[nport - 1] == 0)
+				while (nport--) {
+					if (pad_stream_masks[nport] == 0)
 						continue;
 
 					ub960_disable_streams(
 						sd, state,
 						priv->hw_data->num_rxports +
-							nport - 1,
-						pad_stream_masks[nport - 1]);
+							nport,
+						pad_stream_masks[nport]);
 				}
 
 				break;
@@ -2827,7 +2860,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	struct v4l2_subdev_state *state;
 	int ret = 0;
 	struct device *dev = &priv->client->dev;
-	u8 vc_map[UB960_MAX_RX_NPORTS] = { 0 };
+	u8 vc_map[UB960_MAX_RX_NPORTS] = { };
 
 	if (!ub960_pad_is_source(priv, pad))
 		return -EINVAL;
@@ -2861,7 +2894,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			dev_err(dev,
 				"Failed to get source frame desc for pad %u\n",
 				route->sink_pad);
-			goto out;
+			goto out_unlock;
 		}
 
 		for (i = 0; i < source_fd.num_entries; ++i)
@@ -2874,7 +2907,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			dev_err(dev,
 				"Failed to find stream from source frame desc\n");
 			ret = -EPIPE;
-			goto out;
+			goto out_unlock;
 		}
 
 		fd->entry[fd->num_entries].stream = route->source_stream;
@@ -2896,14 +2929,14 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 			if (!fmt) {
 				ret = -EINVAL;
-				goto out;
+				goto out_unlock;
 			}
 
 			ub960_fmt = ub960_find_format(fmt->code);
 			if (!ub960_fmt) {
 				dev_err(dev, "Unable to find format\n");
 				ret = -EINVAL;
-				goto out;
+				goto out_unlock;
 			}
 
 			fd->entry[fd->num_entries].bus.csi2.dt =
@@ -2913,7 +2946,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->num_entries++;
 	}
 
-out:
+out_unlock:
 	v4l2_subdev_unlock_state(state);
 
 	return ret;
@@ -2995,7 +3028,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 	struct v4l2_subdev_state *state;
 	unsigned int nport;
 	u8 v = 0, v1 = 0, v2 = 0;
-	char id[7];
+	u8 id[7];
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
@@ -3275,31 +3308,30 @@ static irqreturn_t ub960_handle_events(int irq, void *arg)
 	struct ub960_data *priv = arg;
 	unsigned int i;
 	u8 int_sts;
+	u8 fwd_sts;
 	int ret;
 
 	ret = ub960_read(priv, UB960_SR_INTERRUPT_STS, &int_sts);
+	if (ret || !int_sts)
+		return IRQ_NONE;
 
-	if (!ret && int_sts) {
-		u8 fwd_sts;
+	dev_dbg(&priv->client->dev, "INTERRUPT_STS %x\n", int_sts);
 
-		dev_dbg(&priv->client->dev, "INTERRUPT_STS %x\n", int_sts);
+	ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts);
 
-		ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts);
+	dev_dbg(&priv->client->dev, "FWD_STS %#02x\n", fwd_sts);
 
-		dev_dbg(&priv->client->dev, "FWD_STS %#02x\n", fwd_sts);
-
-		for (i = 0; i < priv->hw_data->num_txports; ++i) {
-			if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i))
-				ub960_csi_handle_events(priv, i);
-		}
+	for (i = 0; i < priv->hw_data->num_txports; ++i) {
+		if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i))
+			ub960_csi_handle_events(priv, i);
+	}
 
-		for (i = 0; i < priv->hw_data->num_rxports; i++) {
-			if (!priv->rxports[i])
-				continue;
+	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
+		if (!priv->rxports[i])
+			continue;
 
-			if (int_sts & UB960_SR_INTERRUPT_STS_IS_RX(i))
-				ub960_rxport_handle_events(priv, i);
-		}
+		if (int_sts & UB960_SR_INTERRUPT_STS_IS_RX(i))
+			ub960_rxport_handle_events(priv, i);
 	}
 
 	return IRQ_HANDLED;
@@ -3469,7 +3501,7 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 		dev_err(dev, "rx%u: illegal 'strobe-pos' value: %d\n", nport,
 			strobe_pos);
 	} else {
-		// NOTE: ignored unless global manual strobe pos is set
+		/* NOTE: ignored unless global manual strobe pos is set */
 		rxport->eq.strobe_pos = strobe_pos;
 		if (!priv->strobe.manual)
 			dev_warn(dev,
@@ -3620,12 +3652,14 @@ ub960_fwnode_get_link_by_regs(struct fwnode_handle *links_fwnode,
 	fwnode_for_each_child_node(links_fwnode, link_fwnode) {
 		u32 link_num;
 
-		if (strncmp(fwnode_get_name(link_fwnode), "link@", 5) != 0)
+		if (!str_has_prefix(fwnode_get_name(link_fwnode), "link@"))
 			continue;
 
 		ret = fwnode_property_read_u32(link_fwnode, "reg", &link_num);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(link_fwnode);
 			return NULL;
+		}
 
 		if (nport == link_num) {
 			fwnode_handle_put(link_fwnode);
@@ -3823,8 +3857,8 @@ static int ub960_v4l2_notifier_register(struct ub960_data *priv)
 					       rxport->source_ep_fwnode,
 					       struct ub960_asd);
 		if (IS_ERR(asd)) {
-			dev_err(dev, "Failed to add subdev for source %u: %ld",
-				i, PTR_ERR(asd));
+			dev_err(dev, "Failed to add subdev for source %u: %pe",
+				i, asd);
 			v4l2_async_nf_cleanup(&priv->notifier);
 			return PTR_ERR(asd);
 		}
@@ -3857,8 +3891,7 @@ static int ub960_create_subdev(struct ub960_data *priv)
 	int ret;
 
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub960_subdev_ops);
-	v4l2_ctrl_handler_init(&priv->ctrl_handler,
-			       ARRAY_SIZE(ub960_tpg_qmenu) - 1);
+	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
 	priv->sd.ctrl_handler = &priv->ctrl_handler;
 
 	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &ub960_ctrl_ops,
@@ -4011,14 +4044,13 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	u8 refclk_freq;
 
 	ret = regulator_enable(priv->vddio);
-	if (ret) {
-		dev_err(dev, "failed to enable VDDIO regulator\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to enable VDDIO regulator\n");
 
 	ret = clk_prepare_enable(priv->refclk);
 	if (ret) {
-		dev_err(dev, "Failed to enable refclk: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to enable refclk\n");
 		goto err_disable_vddio;
 	}
 
@@ -4036,7 +4068,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	/* Runtime check register accessibility */
 	ret = ub960_read(priv, UB960_SR_REV_MASK, &rev_mask);
 	if (ret) {
-		dev_err(dev, "Cannot read first register (%d), abort\n", ret);
+		dev_err_probe(dev, ret, "Cannot read first register, abort\n");
 		goto err_pd_gpio;
 	}
 
@@ -4061,9 +4093,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	return 0;
 
 err_pd_gpio:
-	if (priv->pd_gpio)
-		gpiod_set_value_cansleep(priv->pd_gpio, 1);
-
+	gpiod_set_value_cansleep(priv->pd_gpio, 1);
 	clk_disable_unprepare(priv->refclk);
 err_disable_vddio:
 	regulator_disable(priv->vddio);
@@ -4073,11 +4103,8 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 
 static void ub960_disable_core_hw(struct ub960_data *priv)
 {
-	if (priv->pd_gpio)
-		gpiod_set_value_cansleep(priv->pd_gpio, 1);
-
+	gpiod_set_value_cansleep(priv->pd_gpio, 1);
 	clk_disable_unprepare(priv->refclk);
-
 	regulator_disable(priv->vddio);
 }
 
@@ -4093,9 +4120,7 @@ static int ub960_probe(struct i2c_client *client)
 
 	priv->client = client;
 
-	priv->hw_data = of_device_get_match_data(dev);
-	if (!priv->hw_data)
-		return -ENODEV;
+	priv->hw_data = device_get_match_data(dev);
 
 	mutex_init(&priv->reg_lock);
 	mutex_init(&priv->atr_alias_table.lock);
@@ -4144,7 +4169,7 @@ static int ub960_probe(struct i2c_client *client)
 
 	ub960_reset(priv, false);
 
-	ub960_rxport_wait_locks(priv, 0xf, NULL);
+	ub960_rxport_wait_locks(priv, GENMASK(3, 0), NULL);
 
 	/*
 	 * Clear any errors caused by switching the RX port settings while
@@ -4222,8 +4247,8 @@ static const struct ub960_hw_data ds90ub9702_hw = {
 };
 
 static const struct i2c_device_id ub960_id[] = {
-	{ "ds90ub960-q1", 0 },
-	{ "ds90ub9702-q1", 0 },
+	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
+	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ub960_id);
@@ -4241,7 +4266,6 @@ static struct i2c_driver ds90ub960_driver = {
 	.id_table	= ub960_id,
 	.driver = {
 		.name	= "ds90ub960",
-		.owner = THIS_MODULE,
 		.of_match_table = ub960_dt_ids,
 	},
 };
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 10a313ab2105..721d08a6ff9b 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -20,8 +20,6 @@ struct i2c_atr;
 
 /**
  * struct i2c_atr_ops - Callbacks from ATR to the device driver.
- * @select:        Ask the driver to select a child bus (optional)
- * @deselect:      Ask the driver to deselect a child bus (optional)
  * @attach_client: Notify the driver of a new device connected on a child
  *                 bus. The driver must choose an I2C alias, configure the
  *                 hardware to use it and return it in `alias_id`.
@@ -32,8 +30,6 @@ struct i2c_atr;
  * All these functions return 0 on success, a negative error code otherwise.
  */
 struct i2c_atr_ops {
-	int (*select)(struct i2c_atr *atr, u32 chan_id);
-	int (*deselect)(struct i2c_atr *atr, u32 chan_id);
 	int (*attach_client)(struct i2c_atr *atr, u32 chan_id,
 			     const struct i2c_client *client, u16 *alias_id);
 	void (*detach_client)(struct i2c_atr *atr, u32 chan_id,

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

