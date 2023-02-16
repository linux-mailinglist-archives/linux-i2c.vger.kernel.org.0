Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953726996A2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 15:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjBPOIL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 09:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjBPOIL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 09:08:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0AA212A8;
        Thu, 16 Feb 2023 06:08:06 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4FF310B;
        Thu, 16 Feb 2023 15:08:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676556483;
        bh=HbWNenI/G4zv4TW5L35QwXt13u4Au7tl//1zPBQlFis=;
        h=From:To:Cc:Subject:Date:From;
        b=qAKBUTvyvZTpFkVkse52w/eWpuj5nZrvRic0LfHluQTV4dygS/JQVVGOtl5iP4yRP
         sc4dKt8s3j5p8nSytSoPQt1uzFEdSk+qlZHoIp61yYRPu1EOjQWQ0orIjV8Fegjruu
         woiv/kOfWzzbnK+zjjvw/MFS1MPEusH+qBydRpNc=
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
Subject: [PATCH v9 0/8] i2c-atr and FPDLink
Date:   Thu, 16 Feb 2023 16:07:39 +0200
Message-Id: <20230216140747.445477-1-tomi.valkeinen@ideasonboard.com>
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

You can find v8 from:

https://lore.kernel.org/all/20230120153417.1156207-1-tomi.valkeinen@ideasonboard.com/

Diff to v8 included below.

Main changes in v9:
- Add "media: subdev: Split V4L2_SUBDEV_ROUTING_NO_STREAM_MIX" patch
- Improved i2c-atr docs
- Pass adapter_parent to i2c_atr_add_adapter(), so that the i2c-atr adapters can be children of the serializers (instead of being children of the deserializer as before).
- UB9xx: Validate formats
- UB913: Convert incoming 2X8 formats to 1X16 on the output side
- UB9xx: Use 1X16 instead of 2X8 formats in FPD-Link and CSI-2 busses
- UB953/UB960: Drop TPG (for now), as it was too hacky
- UB960: Add TODO list
- UB960: Use unnamed structures to group fields
- UB960: Simplify tracking of the current rxport/txport register page
- UB960: Rename *_csiport_* to *_txport_* to match the rxport naming
- UB960: Use v4l2_fwnode_endpoint_parse
- UB960: Add 16bit register accessors
- UB960: Verify that each source only provides streams using a single VC
- UB960: Drop the (unused) legacy s_stream
- UB960: Use V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
- Plenty of cosmetic/style changes

 Tomi

Luca Ceresoli (1):
  i2c: add I2C Address Translator (ATR) support

Tomi Valkeinen (7):
  media: subdev: Split V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
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
 Documentation/i2c/muxes/i2c-atr.rst           |   97 +
 MAINTAINERS                                   |   16 +
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  545 +++
 drivers/media/i2c/Kconfig                     |   47 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub913.c                 |  906 ++++
 drivers/media/i2c/ds90ub953.c                 | 1400 ++++++
 drivers/media/i2c/ds90ub960.c                 | 4181 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         |   17 +-
 include/linux/i2c-atr.h                       |  116 +
 include/media/i2c/ds90ub9xx.h                 |   22 +
 include/media/v4l2-subdev.h                   |   16 +-
 18 files changed, 8068 insertions(+), 7 deletions(-)
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

Interdiff against v8:
diff --git a/Documentation/i2c/muxes/i2c-atr.rst b/Documentation/i2c/muxes/i2c-atr.rst
index c7e060ca682d..da226fd4de63 100644
--- a/Documentation/i2c/muxes/i2c-atr.rst
+++ b/Documentation/i2c/muxes/i2c-atr.rst
@@ -5,6 +5,7 @@ Kernel driver i2c-atr
 =====================
 
 Author: Luca Ceresoli <luca@lucaceresoli.net>
+Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 
 Description
 -----------
@@ -47,24 +48,37 @@ Topology::
 
 Alias table:
 
+A, B and C are three physical I2C busses, electrically independent from
+each other. The ATR receives the transactions initiated on bus A and
+propagates them on bus B or bus C or none depending on the device address
+in the transaction and based on the alias table.
+
+Alias table:
+
 .. table::
 
-   ======   =====
-   Client   Alias
-   ======   =====
-   X        0x20
-   Y        0x30
-   ======   =====
+   ===============   =====
+   Client            Alias
+   ===============   =====
+   X (bus B, 0x10)   0x20
+   Y (bus C, 0x10)   0x30
+   ===============   =====
 
 Transaction:
 
  - Slave X driver sends a transaction (on adapter B), slave address 0x10
- - ATR driver rewrites messages with address 0x20, forwards to adapter A
+ - ATR driver finds slave X is on bus B and has alias 0x20, rewrites
+   messages with address 0x20, forwards to adapter A
  - Physical I2C transaction on bus A, slave address 0x20
- - ATR chip propagates transaction on bus B with address translated to 0x10
- - Slave X chip replies on bus B
- - ATR chip forwards reply on bus A
- - ATR driver rewrites messages with address 0x10
+ - ATR chip detects transaction on address 0x20, finds it in table,
+   propagates transaction on bus B with address translated to 0x10,
+   keeps clock streched on bus A waiting for reply
+ - Slave X chip (on bus B) detects transaction at its own physical
+   address 0x10 and replies normally
+ - ATR chip stops clock stretching and forwards reply on bus A,
+   with address translated back to 0x20
+ - ATR driver receives the reply, rewrites messages with address 0x10
+   as they were initially
  - Slave X driver gets back the msgs[], with reply and address 0x10
 
 Usage:
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index c872647ae808..a41e941ad972 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -130,6 +130,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 	if (unlikely(chan->orig_addrs_size < num)) {
 		u16 *new_buf;
 
+		/* We don't care about old data, hence no realloc() */
 		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);
 		if (!new_buf)
 			return -ENOMEM;
@@ -272,6 +273,9 @@ static int i2c_atr_attach_client(struct i2c_adapter *adapter,
 	if (ret)
 		goto err_free;
 
+	dev_dbg(atr->dev, "chan%u: client 0x%02x mapped at alias 0x%02x (%s)\n",
+		chan->chan_id, client->addr, alias_id, client->name);
+
 	c2a->client = client;
 	c2a->alias = alias_id;
 	list_add(&c2a->node, &chan->alias_list);
@@ -294,10 +298,15 @@ static void i2c_atr_detach_client(struct i2c_adapter *adapter,
 	atr->ops->detach_client(atr, chan->chan_id, client);
 
 	c2a = i2c_atr_find_mapping_by_client(&chan->alias_list, client);
-	if (c2a) {
-		list_del(&c2a->node);
-		kfree(c2a);
-	}
+	if (!c2a)
+		return; /* This shouldn't happen */
+
+	dev_dbg(atr->dev,
+		"chan%u: client 0x%02x unmapped from alias 0x%02x (%s)\n",
+		chan->chan_id, client->addr, c2a->alias, client->name);
+
+	list_del(&c2a->node);
+	kfree(c2a);
 }
 
 static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
@@ -391,6 +400,7 @@ void i2c_atr_delete(struct i2c_atr *atr)
 EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, I2C_ATR);
 
 int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
+			struct device *adapter_parent,
 			struct fwnode_handle *bus_handle)
 {
 	struct i2c_adapter *parent = atr->parent;
@@ -413,6 +423,9 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 	if (!chan)
 		return -ENOMEM;
 
+	if (!adapter_parent)
+		adapter_parent = dev;
+
 	chan->atr = atr;
 	chan->chan_id = chan_id;
 	INIT_LIST_HEAD(&chan->alias_list);
@@ -423,7 +436,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 	chan->adap.owner = THIS_MODULE;
 	chan->adap.algo = &atr->algo;
 	chan->adap.algo_data = chan;
-	chan->adap.dev.parent = dev;
+	chan->adap.dev.parent = adapter_parent;
 	chan->adap.retries = parent->retries;
 	chan->adap.timeout = parent->timeout;
 	chan->adap.quirks = parent->quirks;
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index efd5f717a5f7..6427ad971ca6 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -29,6 +29,9 @@ obj-$(CONFIG_VIDEO_CS3308) += cs3308.o
 obj-$(CONFIG_VIDEO_CS5345) += cs5345.o
 obj-$(CONFIG_VIDEO_CS53L32A) += cs53l32a.o
 obj-$(CONFIG_VIDEO_CX25840) += cx25840/
+obj-$(CONFIG_VIDEO_DS90UB913) += ds90ub913.o
+obj-$(CONFIG_VIDEO_DS90UB953) += ds90ub953.o
+obj-$(CONFIG_VIDEO_DS90UB960) += ds90ub960.o
 obj-$(CONFIG_VIDEO_DW9714) += dw9714.o
 obj-$(CONFIG_VIDEO_DW9768) += dw9768.o
 obj-$(CONFIG_VIDEO_DW9807_VCM) += dw9807-vcm.o
@@ -142,6 +145,3 @@ obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
 obj-$(CONFIG_VIDEO_VS6624) += vs6624.o
 obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
 obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
-obj-$(CONFIG_VIDEO_DS90UB913)	+= ds90ub913.o
-obj-$(CONFIG_VIDEO_DS90UB953)	+= ds90ub953.o
-obj-$(CONFIG_VIDEO_DS90UB960)	+= ds90ub960.o
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 60a07b5bace3..f7696bce7c77 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -91,6 +91,31 @@ static inline struct ub913_data *sd_to_ub913(struct v4l2_subdev *sd)
 	return container_of(sd, struct ub913_data, sd);
 }
 
+struct ub913_format_info {
+	u32 incode;
+	u32 outcode;
+};
+
+static const struct ub913_format_info ub913_formats[] = {
+	/* Only RAW10 with 8-bit payload is supported at the moment */
+	{ .incode = MEDIA_BUS_FMT_YUYV8_2X8, .outcode = MEDIA_BUS_FMT_YUYV8_1X16 },
+	{ .incode = MEDIA_BUS_FMT_UYVY8_2X8, .outcode = MEDIA_BUS_FMT_UYVY8_1X16 },
+	{ .incode = MEDIA_BUS_FMT_VYUY8_2X8, .outcode = MEDIA_BUS_FMT_VYUY8_1X16 },
+	{ .incode = MEDIA_BUS_FMT_YVYU8_2X8, .outcode = MEDIA_BUS_FMT_YVYU8_1X16 },
+};
+
+static const struct ub913_format_info *ub913_find_format(u32 incode)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ub913_formats); ++i) {
+		if (ub913_formats[i].incode == incode)
+			return &ub913_formats[i];
+	}
+
+	return NULL;
+}
+
 static int ub913_read(const struct ub913_data *priv, u8 reg, u8 *val)
 {
 	unsigned int v;
@@ -251,7 +276,7 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_krouting *routing)
 {
-	static const struct v4l2_mbus_framefmt format = {
+	static const struct v4l2_mbus_framefmt informat = {
 		.width = 640,
 		.height = 480,
 		.code = MEDIA_BUS_FMT_UYVY8_2X8,
@@ -261,6 +286,18 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
 		.xfer_func = V4L2_XFER_FUNC_SRGB,
 	};
+	static const struct v4l2_mbus_framefmt outformat = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
 	int ret;
 
 	/*
@@ -276,10 +313,19 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	ret = v4l2_subdev_set_routing(sd, state, routing);
 	if (ret)
 		return ret;
 
+	stream_configs = &state->stream_configs;
+
+	for (i = 0; i < stream_configs->num_configs; ++i) {
+		if (stream_configs->configs[i].pad == UB913_PAD_SINK)
+			stream_configs->configs[i].fmt = informat;
+		else
+			stream_configs->configs[i].fmt = outformat;
+	}
+
 	return 0;
 }
 
@@ -361,15 +407,22 @@ static int ub913_set_fmt(struct v4l2_subdev *sd,
 {
 	struct ub913_data *priv = sd_to_ub913(sd);
 	struct v4l2_mbus_framefmt *fmt;
+	const struct ub913_format_info *finfo;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
 	    priv->enabled_source_streams)
 		return -EBUSY;
 
-	/* No transcoding, source and sink formats must match. */
+	/* Source format is fully defined by the sink format, so not settable */
 	if (format->pad == UB913_PAD_SOURCE)
 		return v4l2_subdev_get_fmt(sd, state, format);
 
+	finfo = ub913_find_format(format->format.code);
+	if (!finfo) {
+		finfo = &ub913_formats[0];
+		format->format.code = finfo->incode;
+	}
+
 	/* Set sink format */
 	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
 						  format->stream);
@@ -378,12 +431,14 @@ static int ub913_set_fmt(struct v4l2_subdev *sd,
 
 	*fmt = format->format;
 
-	/* Propagate to source format */
+	/* Propagate to source format, and adjust the mbus code */
 	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
 							   format->stream);
 	if (!fmt)
 		return -EINVAL;
 
+	format->format.code = finfo->outcode;
+
 	*fmt = format->format;
 
 	return 0;
@@ -607,7 +662,7 @@ static int ub913_add_i2c_adapter(struct ub913_data *priv)
 		return 0;
 
 	ret = i2c_atr_add_adapter(priv->plat_data->atr, priv->plat_data->port,
-				  i2c_handle);
+				  dev, i2c_handle);
 
 	fwnode_handle_put(i2c_handle);
 
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 738652f2294b..6efe1460c976 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -146,8 +146,6 @@ struct ub953_data {
 	struct v4l2_subdev	*source_sd;
 	u16			source_sd_pad;
 
-	struct v4l2_ctrl_handler   ctrl_handler;
-
 	u64			enabled_source_streams;
 
 	/* lock for register access */
@@ -229,8 +227,8 @@ static int ub953_select_ind_reg_block(struct ub953_data *priv, u8 block)
 	return 0;
 }
 
-__maybe_unused static int ub953_read_ind(struct ub953_data *priv, u8 block,
-					 u8 reg, u8 *val)
+__maybe_unused
+static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val)
 {
 	unsigned int v;
 	int ret;
@@ -265,6 +263,7 @@ __maybe_unused static int ub953_read_ind(struct ub953_data *priv, u8 block,
 	return ret;
 }
 
+__maybe_unused
 static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 {
 	int ret;
@@ -273,14 +272,14 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when writing %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
@@ -290,39 +289,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 			block, reg, ret);
 	}
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
-	return ret;
-}
-
-static int ub953_write_ind16(struct ub953_data *priv, u8 block, u8 reg, u16 val)
-{
-	int ret;
-
-	mutex_lock(&priv->reg_lock);
-
-	ret = ub953_select_ind_reg_block(priv, block);
-	if (ret)
-		goto out_unlock;
-
-	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
-	if (ret)
-		goto out_unlock;
-
-	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val >> 8);
-	if (ret)
-		goto out_unlock;
-
-	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg + 1);
-	if (ret)
-		goto out_unlock;
-
-	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val & 0xff);
-	if (ret)
-		goto out_unlock;
-
-out_unlock:
+out:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -754,124 +721,6 @@ static const struct media_entity_operations ub953_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-enum {
-	TEST_PATTERN_DISABLED = 0,
-	TEST_PATTERN_V_COLOR_BARS_1,
-	TEST_PATTERN_V_COLOR_BARS_2,
-	TEST_PATTERN_V_COLOR_BARS_4,
-	TEST_PATTERN_V_COLOR_BARS_8,
-};
-
-static const char *const ub953_tpg_qmenu[] = {
-	"Disabled",
-	"1 vertical color bar",
-	"2 vertical color bars",
-	"4 vertical color bars",
-	"8 vertical color bars",
-};
-
-static int ub953_enable_tpg(struct ub953_data *priv, int tpg_num)
-{
-	struct v4l2_subdev *sd = &priv->sd;
-	struct v4l2_subdev_state *state;
-	struct v4l2_mbus_framefmt *fmt;
-	u8 vbp, vfp;
-	u16 blank_lines;
-	u16 width;
-	u16 height;
-
-	u16 bytespp = 2; /* For MEDIA_BUS_FMT_UYVY8_1X16 */
-	u8 cbars_idx = tpg_num - TEST_PATTERN_V_COLOR_BARS_1;
-	u8 num_cbars = 1 << cbars_idx;
-
-	u16 line_size; /* Line size [bytes] */
-	u16 bar_size; /* cbar size [bytes] */
-	u16 act_lpf; /* active lines/frame */
-	u16 tot_lpf; /* tot lines/frame */
-	u16 line_pd; /* Line period in 10-ns units */
-
-	u16 fps = 30;
-
-	vbp = 33;
-	vfp = 10;
-	blank_lines = vbp + vfp + 2; /* total blanking lines */
-
-	state = v4l2_subdev_get_locked_active_state(sd);
-
-	if (state->routing.num_routes != 1)
-		return -EINVAL;
-
-	fmt = v4l2_subdev_state_get_stream_format(state, UB953_PAD_SOURCE, 0);
-	if (!fmt)
-		return -EINVAL;
-
-	if (fmt->code != MEDIA_BUS_FMT_UYVY8_1X16)
-		return -EINVAL;
-
-	width = fmt->width;
-	height = fmt->height;
-
-	line_size = width * bytespp;
-	bar_size = line_size / num_cbars;
-	act_lpf = height;
-	tot_lpf = act_lpf + blank_lines;
-	line_pd = 100000000 / fps / tot_lpf;
-
-	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CTL,
-			UB953_IND_PGEN_CTL_PGEN_ENABLE);
-
-	/* YUV422 8bit: 2 bytes/block, CSI-2 data type 0x1e */
-	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CFG,
-			cbars_idx << 4 | 0x2);
-	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CSI_DI,
-			0x1e);
-
-	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
-			  UB953_IND_PGEN_LINE_SIZE1, line_size);
-	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
-			  UB953_IND_PGEN_BAR_SIZE1, bar_size);
-	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
-			  UB953_IND_PGEN_ACT_LPF1, act_lpf);
-	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
-			  UB953_IND_PGEN_TOT_LPF1, tot_lpf);
-	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
-			  UB953_IND_PGEN_LINE_PD1, line_pd);
-	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VBP,
-			vbp);
-	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VFP,
-			vfp);
-
-	return 0;
-}
-
-static void ub953_disable_tpg(struct ub953_data *priv)
-{
-	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CTL,
-			0x0);
-}
-
-static int ub953_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct ub953_data *priv =
-		container_of(ctrl->handler, struct ub953_data, ctrl_handler);
-	int ret = 0;
-
-	switch (ctrl->id) {
-	case V4L2_CID_TEST_PATTERN:
-		if (ctrl->val == 0)
-			ub953_disable_tpg(priv);
-		else
-			ret = ub953_enable_tpg(priv, ctrl->val);
-		break;
-	}
-
-	return ret;
-}
-
-static const struct v4l2_ctrl_ops ub953_ctrl_ops = {
-	.s_ctrl = ub953_s_ctrl,
-};
-
 static int ub953_notify_bound(struct v4l2_async_notifier *notifier,
 			      struct v4l2_subdev *source_subdev,
 			      struct v4l2_async_subdev *asd)
@@ -1241,7 +1090,7 @@ static int ub953_add_i2c_adapter(struct ub953_data *priv)
 		return 0;
 
 	ret = i2c_atr_add_adapter(priv->plat_data->atr, priv->plat_data->port,
-				  i2c_handle);
+				  dev, i2c_handle);
 
 	fwnode_handle_put(i2c_handle);
 
@@ -1360,20 +1209,6 @@ static int ub953_subdev_init(struct ub953_data *priv)
 
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub953_subdev_ops);
 
-	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
-	priv->sd.ctrl_handler = &priv->ctrl_handler;
-
-	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &ub953_ctrl_ops,
-				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(ub953_tpg_qmenu) - 1, 0, 0,
-				     ub953_tpg_qmenu);
-
-	if (priv->ctrl_handler.error) {
-		ret = priv->ctrl_handler.error;
-		dev_err_probe(dev, ret, "Failed to set up v4l2 controls\n");
-		goto err_remove_ctrls;
-	}
-
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
@@ -1383,10 +1218,8 @@ static int ub953_subdev_init(struct ub953_data *priv)
 	priv->pads[1].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to init pads\n");
-		goto err_remove_ctrls;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init pads\n");
 
 	priv->sd.fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
 							  UB953_PAD_SOURCE, 0,
@@ -1397,8 +1230,6 @@ static int ub953_subdev_init(struct ub953_data *priv)
 		goto err_entity_cleanup;
 	}
 
-	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
-
 	ret = v4l2_subdev_init_finalize(&priv->sd);
 	if (ret)
 		goto err_fwnode_put;
@@ -1426,8 +1257,6 @@ static int ub953_subdev_init(struct ub953_data *priv)
 	fwnode_handle_put(priv->sd.fwnode);
 err_entity_cleanup:
 	media_entity_cleanup(&priv->sd.entity);
-err_remove_ctrls:
-	v4l2_ctrl_handler_free(&priv->ctrl_handler);
 
 	return ret;
 }
@@ -1439,7 +1268,6 @@ static void ub953_subdev_uninit(struct ub953_data *priv)
 	v4l2_subdev_cleanup(&priv->sd);
 	fwnode_handle_put(priv->sd.fwnode);
 	media_entity_cleanup(&priv->sd.entity);
-	v4l2_ctrl_handler_free(&priv->ctrl_handler);
 }
 
 static int ub953_probe(struct i2c_client *client)
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index eb391f0259b3..1ae0c7cda7c7 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -6,6 +6,26 @@
  * Copyright (c) 2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  */
 
+/*
+ * (Possible) TODOs
+ *
+ * - PM for serializer and remote peripherals. We need to manage:
+ *   - VPOC
+ *     - Power domain? Regulator? Somehow any remote device should be able to
+ *       cause the VPOC to be turned on.
+ *   - Link between the deserializer and the serializer
+ *     - Related to VPOC management. We probably always want to turn on the VPOC
+ *       and then enable the link.
+ *   - Serializer's services: i2c, gpios, power
+ *     - The serializer needs to resume before the remote peripherals can
+ *       e.g. use the i2c.
+ *     - How to handle gpios? Reserving a gpio essentially keeps the provider
+ *       (serializer) always powered on.
+ * - Do we need a new bus for the FPD-Link? At the moment the serializers
+ *   are children of the same i2c-adapter where the deserializer resides.
+ * - i2c-atr could be made embeddable instead of allocatable.
+ */
+
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -26,8 +46,10 @@
 #include <linux/workqueue.h>
 
 #include <media/i2c/ds90ub9xx.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
 #define MHZ(v) ((u32)((v) * 1000000U))
@@ -39,7 +61,6 @@
 #define UB960_MAX_NPORTS	(UB960_MAX_RX_NPORTS + UB960_MAX_TX_NPORTS)
 
 #define UB960_MAX_PORT_ALIASES	8
-#define UB960_MAX_POOL_ALIASES	(UB960_MAX_RX_NPORTS * UB960_MAX_PORT_ALIASES)
 
 #define UB960_NUM_BC_GPIOS		4
 
@@ -47,13 +68,13 @@
  * Register map
  *
  * 0x00-0x32   Shared (UB960_SR)
- * 0x33-0x3A   CSI-2 TX (per-port paged on DS90UB960, shared on 954) (UB960_TR)
- * 0x4C        Shared (UB960_SR)
- * 0x4D-0x7F   FPD-Link RX, per-port paged (UB960_RR)
- * 0xB0-0xBF   Shared (UB960_SR)
- * 0xD0-0xDF   FPD-Link RX, per-port paged (UB960_RR)
- * 0xF0-0xF5   Shared (UB960_SR)
- * 0xF8-0xFB   Shared (UB960_SR)
+ * 0x33-0x3a   CSI-2 TX (per-port paged on DS90UB960, shared on 954) (UB960_TR)
+ * 0x4c        Shared (UB960_SR)
+ * 0x4d-0x7f   FPD-Link RX, per-port paged (UB960_RR)
+ * 0xb0-0xbf   Shared (UB960_SR)
+ * 0xd0-0xdf   FPD-Link RX, per-port paged (UB960_RR)
+ * 0xf0-0xf5   Shared (UB960_SR)
+ * 0xf8-0xfb   Shared (UB960_SR)
  * All others  Reserved
  *
  * Register prefixes:
@@ -78,12 +99,12 @@
 #define UB960_SR_BCC_WDOG_CTL			0x07
 #define UB960_SR_I2C_CTL1			0x08
 #define UB960_SR_I2C_CTL2			0x09
-#define UB960_SR_SCL_HIGH_TIME			0x0A
-#define UB960_SR_SCL_LOW_TIME			0x0B
-#define UB960_SR_RX_PORT_CTL			0x0C
-#define UB960_SR_IO_CTL				0x0D
-#define UB960_SR_GPIO_PIN_STS			0x0E
-#define UB960_SR_GPIO_INPUT_CTL			0x0F
+#define UB960_SR_SCL_HIGH_TIME			0x0a
+#define UB960_SR_SCL_LOW_TIME			0x0b
+#define UB960_SR_RX_PORT_CTL			0x0c
+#define UB960_SR_IO_CTL				0x0d
+#define UB960_SR_GPIO_PIN_STS			0x0e
+#define UB960_SR_GPIO_INPUT_CTL			0x0f
 #define UB960_SR_GPIO_PIN_CTL(n)		(0x10 + (n)) /* n < UB960_NUM_GPIOS */
 #define UB960_SR_GPIO_PIN_CTL_GPIO_OUT_SEL		5
 #define UB960_SR_GPIO_PIN_CTL_GPIO_OUT_SRC_SHIFT	2
@@ -91,12 +112,12 @@
 
 #define UB960_SR_FS_CTL				0x18
 #define UB960_SR_FS_HIGH_TIME_1			0x19
-#define UB960_SR_FS_HIGH_TIME_0			0x1A
-#define UB960_SR_FS_LOW_TIME_1			0x1B
-#define UB960_SR_FS_LOW_TIME_0			0x1C
-#define UB960_SR_MAX_FRM_HI			0x1D
-#define UB960_SR_MAX_FRM_LO			0x1E
-#define UB960_SR_CSI_PLL_CTL			0x1F
+#define UB960_SR_FS_HIGH_TIME_0			0x1a
+#define UB960_SR_FS_LOW_TIME_1			0x1b
+#define UB960_SR_FS_LOW_TIME_0			0x1c
+#define UB960_SR_MAX_FRM_HI			0x1d
+#define UB960_SR_MAX_FRM_LO			0x1e
+#define UB960_SR_CSI_PLL_CTL			0x1f
 
 #define UB960_SR_FWD_CTL1			0x20
 #define UB960_SR_FWD_CTL1_PORT_DIS(n)		BIT((n) + 4)
@@ -108,7 +129,6 @@
 #define UB960_SR_INTERRUPT_CTL_INT_EN		BIT(7)
 #define UB960_SR_INTERRUPT_CTL_IE_CSI_TX0	BIT(4)
 #define UB960_SR_INTERRUPT_CTL_IE_RX(n)		BIT((n)) /* rxport[n] IRQ */
-#define UB960_SR_INTERRUPT_CTL_ALL		0x83 /* TODO 0x93 to enable CSI */
 
 #define UB960_SR_INTERRUPT_STS			0x24
 #define UB960_SR_INTERRUPT_STS_INT		BIT(7)
@@ -120,10 +140,10 @@
 #define UB960_SR_TS_LINE_HI			0x27
 #define UB960_SR_TS_LINE_LO			0x28
 #define UB960_SR_TS_STATUS			0x29
-#define UB960_SR_TIMESTAMP_P0_HI		0x2A
-#define UB960_SR_TIMESTAMP_P0_LO		0x2B
-#define UB960_SR_TIMESTAMP_P1_HI		0x2C
-#define UB960_SR_TIMESTAMP_P1_LO		0x2D
+#define UB960_SR_TIMESTAMP_P0_HI		0x2a
+#define UB960_SR_TIMESTAMP_P0_LO		0x2b
+#define UB960_SR_TIMESTAMP_P1_HI		0x2c
+#define UB960_SR_TIMESTAMP_P1_LO		0x2d
 
 #define UB960_SR_CSI_PORT_SEL			0x32
 
@@ -141,7 +161,7 @@
 
 #define UB960_TR_CSI_TEST_CTL			0x38
 #define UB960_TR_CSI_TEST_PATT_HI		0x39
-#define UB960_TR_CSI_TEST_PATT_LO		0x3A
+#define UB960_TR_CSI_TEST_PATT_LO		0x3a
 
 #define UB960_XR_SFILTER_CFG			0x41
 #define UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT	4
@@ -172,13 +192,13 @@
 	 UB960_RR_BCC_STATUS_MASTER_TO | UB960_RR_BCC_STATUS_SLAVE_ERR |  \
 	 UB960_RR_BCC_STATUS_SLAVE_TO | UB960_RR_BCC_STATUS_RESP_ERR)
 
-#define UB960_RR_FPD3_CAP			0x4A
-#define UB960_RR_RAW_EMBED_DTYPE		0x4B
+#define UB960_RR_FPD3_CAP			0x4a
+#define UB960_RR_RAW_EMBED_DTYPE		0x4b
 #define UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT	6
 
-#define UB960_SR_FPD3_PORT_SEL			0x4C
+#define UB960_SR_FPD3_PORT_SEL			0x4c
 
-#define UB960_RR_RX_PORT_STS1			0x4D
+#define UB960_RR_RX_PORT_STS1			0x4d
 #define UB960_RR_RX_PORT_STS1_BCC_CRC_ERROR	BIT(5)
 #define UB960_RR_RX_PORT_STS1_LOCK_STS_CHG	BIT(4)
 #define UB960_RR_RX_PORT_STS1_BCC_SEQ_ERROR	BIT(3)
@@ -190,7 +210,7 @@
 	 UB960_RR_RX_PORT_STS1_BCC_SEQ_ERROR | \
 	 UB960_RR_RX_PORT_STS1_PARITY_ERROR)
 
-#define UB960_RR_RX_PORT_STS2			0x4E
+#define UB960_RR_RX_PORT_STS2			0x4e
 #define UB960_RR_RX_PORT_STS2_LINE_LEN_UNSTABLE	BIT(7)
 #define UB960_RR_RX_PORT_STS2_LINE_LEN_CHG	BIT(6)
 #define UB960_RR_RX_PORT_STS2_FPD3_ENCODE_ERROR	BIT(5)
@@ -202,7 +222,7 @@
 #define UB960_RR_RX_PORT_STS2_ERROR_MASK       \
 	UB960_RR_RX_PORT_STS2_BUFFER_ERROR
 
-#define UB960_RR_RX_FREQ_HIGH			0x4F
+#define UB960_RR_RX_FREQ_HIGH			0x4f
 #define UB960_RR_RX_FREQ_LOW			0x50
 #define UB960_RR_SENSOR_STS_0			0x51
 #define UB960_RR_SENSOR_STS_1			0x52
@@ -217,18 +237,18 @@
 #define UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK	GENMASK(2, 0)
 
 #define UB960_RR_DATAPATH_CTL1			0x59
-#define UB960_RR_DATAPATH_CTL2			0x5A
-#define UB960_RR_SER_ID				0x5B
-#define UB960_RR_SER_ALIAS_ID			0x5C
+#define UB960_RR_DATAPATH_CTL2			0x5a
+#define UB960_RR_SER_ID				0x5b
+#define UB960_RR_SER_ALIAS_ID			0x5c
 
 /* For these two register sets: n < UB960_MAX_PORT_ALIASES */
-#define UB960_RR_SLAVE_ID(n)			(0x5D + (n))
+#define UB960_RR_SLAVE_ID(n)			(0x5d + (n))
 #define UB960_RR_SLAVE_ALIAS(n)			(0x65 + (n))
 
-#define UB960_RR_PORT_CONFIG			0x6D
+#define UB960_RR_PORT_CONFIG			0x6d
 #define UB960_RR_PORT_CONFIG_FPD3_MODE_MASK	GENMASK(1, 0)
 
-#define UB960_RR_BC_GPIO_CTL(n)			(0x6E + (n)) /* n < 2 */
+#define UB960_RR_BC_GPIO_CTL(n)			(0x6e + (n)) /* n < 2 */
 #define UB960_RR_RAW10_ID			0x70
 #define UB960_RR_RAW10_ID_VC_SHIFT		6
 #define UB960_RR_RAW10_ID_DT_SHIFT		0
@@ -245,7 +265,7 @@
 #define UB960_RR_MAILBOX_1			0x78
 #define UB960_RR_MAILBOX_2			0x79
 
-#define UB960_RR_CSI_RX_STS			0x7A
+#define UB960_RR_CSI_RX_STS			0x7a
 #define UB960_RR_CSI_RX_STS_LENGTH_ERR		BIT(3)
 #define UB960_RR_CSI_RX_STS_CKSUM_ERR		BIT(2)
 #define UB960_RR_CSI_RX_STS_ECC2_ERR		BIT(1)
@@ -254,17 +274,17 @@
 	(UB960_RR_CSI_RX_STS_LENGTH_ERR | UB960_RR_CSI_RX_STS_CKSUM_ERR | \
 	 UB960_RR_CSI_RX_STS_ECC2_ERR | UB960_RR_CSI_RX_STS_ECC1_ERR)
 
-#define UB960_RR_CSI_ERR_COUNTER		0x7B
-#define UB960_RR_PORT_CONFIG2			0x7C
+#define UB960_RR_CSI_ERR_COUNTER		0x7b
+#define UB960_RR_PORT_CONFIG2			0x7c
 #define UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_MASK GENMASK(7, 6)
 #define UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_SHIFT 6
 
 #define UB960_RR_PORT_CONFIG2_LV_POL_LOW	BIT(1)
 #define UB960_RR_PORT_CONFIG2_FV_POL_LOW	BIT(0)
 
-#define UB960_RR_PORT_PASS_CTL			0x7D
-#define UB960_RR_SEN_INT_RISE_CTL		0x7E
-#define UB960_RR_SEN_INT_FALL_CTL		0x7F
+#define UB960_RR_PORT_PASS_CTL			0x7d
+#define UB960_RR_SEN_INT_RISE_CTL		0x7e
+#define UB960_RR_SEN_INT_FALL_CTL		0x7f
 
 #define UB960_SR_CSI_FRAME_COUNT_HI(n)		(0x90 + 8 * (n))
 #define UB960_SR_CSI_FRAME_COUNT_LO(n)		(0x91 + 8 * (n))
@@ -275,60 +295,60 @@
 #define UB960_SR_CSI_LINE_ERR_COUNT_HI(n)	(0x96 + 8 * (n))
 #define UB960_SR_CSI_LINE_ERR_COUNT_LO(n)	(0x97 + 8 * (n))
 
-#define UB960_XR_REFCLK_FREQ			0xA5	/* UB960 */
+#define UB960_XR_REFCLK_FREQ			0xa5	/* UB960 */
 
 #define UB960_RR_VC_ID_MAP(x)			(0xa0 + (x)) /* UB9702 */
 
-#define UB960_SR_IND_ACC_CTL			0xB0
+#define UB960_SR_IND_ACC_CTL			0xb0
 #define UB960_SR_IND_ACC_CTL_IA_AUTO_INC	BIT(1)
 
-#define UB960_SR_IND_ACC_ADDR			0xB1
-#define UB960_SR_IND_ACC_DATA			0xB2
-#define UB960_SR_BIST_CONTROL			0xB3
-#define UB960_SR_MODE_IDX_STS			0xB8
-#define UB960_SR_LINK_ERROR_COUNT		0xB9
-#define UB960_SR_FPD3_ENC_CTL			0xBA
-#define UB960_SR_FV_MIN_TIME			0xBC
-#define UB960_SR_GPIO_PD_CTL			0xBE
+#define UB960_SR_IND_ACC_ADDR			0xb1
+#define UB960_SR_IND_ACC_DATA			0xb2
+#define UB960_SR_BIST_CONTROL			0xb3
+#define UB960_SR_MODE_IDX_STS			0xb8
+#define UB960_SR_LINK_ERROR_COUNT		0xb9
+#define UB960_SR_FPD3_ENC_CTL			0xba
+#define UB960_SR_FV_MIN_TIME			0xbc
+#define UB960_SR_GPIO_PD_CTL			0xbe
 
 #define UB960_SR_FPD_RATE_CFG			0xc2	/* UB9702 */
 #define UB960_SR_CSI_PLL_DIV			0xc9	/* UB9702 */
 
-#define UB960_RR_PORT_DEBUG			0xD0
-#define UB960_RR_AEQ_CTL2			0xD2
+#define UB960_RR_PORT_DEBUG			0xd0
+#define UB960_RR_AEQ_CTL2			0xd2
 #define UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR		BIT(2)
 
-#define UB960_RR_AEQ_STATUS			0xD3
+#define UB960_RR_AEQ_STATUS			0xd3
 #define UB960_RR_AEQ_STATUS_STATUS_2		GENMASK(5, 3)
 #define UB960_RR_AEQ_STATUS_STATUS_1		GENMASK(2, 0)
 
-#define UB960_RR_AEQ_BYPASS			0xD4
+#define UB960_RR_AEQ_BYPASS			0xd4
 #define UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT	5
 #define UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK	GENMASK(7, 5)
 #define UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT	1
 #define UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK	GENMASK(3, 1)
 #define UB960_RR_AEQ_BYPASS_ENABLE			BIT(0)
 
-#define UB960_RR_AEQ_MIN_MAX			0xD5
+#define UB960_RR_AEQ_MIN_MAX			0xd5
 #define UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT	4
 #define UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT	0
 
-#define UB960_RR_SFILTER_STS_0			0xD6
-#define UB960_RR_SFILTER_STS_1			0xD7
-#define UB960_RR_PORT_ICR_HI			0xD8
-#define UB960_RR_PORT_ICR_LO			0xD9
-#define UB960_RR_PORT_ISR_HI			0xDA
-#define UB960_RR_PORT_ISR_LO			0xDB
-#define UB960_RR_FC_GPIO_STS			0xDC
-#define UB960_RR_FC_GPIO_ICR			0xDD
-#define UB960_RR_SEN_INT_RISE_STS		0xDE
-#define UB960_RR_SEN_INT_FALL_STS		0xDF
+#define UB960_RR_SFILTER_STS_0			0xd6
+#define UB960_RR_SFILTER_STS_1			0xd7
+#define UB960_RR_PORT_ICR_HI			0xd8
+#define UB960_RR_PORT_ICR_LO			0xd9
+#define UB960_RR_PORT_ISR_HI			0xda
+#define UB960_RR_PORT_ISR_LO			0xdb
+#define UB960_RR_FC_GPIO_STS			0xdc
+#define UB960_RR_FC_GPIO_ICR			0xdd
+#define UB960_RR_SEN_INT_RISE_STS		0xde
+#define UB960_RR_SEN_INT_FALL_STS		0xdf
 
 #define UB960_RR_CHANNEL_MODE			0xe4	/* UB9702 */
 
-#define UB960_SR_FPD3_RX_ID(n)			(0xF0 + (n))
+#define UB960_SR_FPD3_RX_ID(n)			(0xf0 + (n))
 
-#define UB960_SR_I2C_RX_ID(n)			(0xF8 + (n)) /* < UB960_FPD_RX_NPORTS */
+#define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n)) /* < UB960_FPD_RX_NPORTS */
 
 /* Indirect register blocks */
 #define UB960_IND_TARGET_PAT_GEN		0x00
@@ -349,12 +369,12 @@
 #define UB960_IR_PGEN_BAR_SIZE0			0x07
 #define UB960_IR_PGEN_ACT_LPF1			0x08
 #define UB960_IR_PGEN_ACT_LPF0			0x09
-#define UB960_IR_PGEN_TOT_LPF1			0x0A
-#define UB960_IR_PGEN_TOT_LPF0			0x0B
-#define UB960_IR_PGEN_LINE_PD1			0x0C
-#define UB960_IR_PGEN_LINE_PD0			0x0D
-#define UB960_IR_PGEN_VBP			0x0E
-#define UB960_IR_PGEN_VFP			0x0F
+#define UB960_IR_PGEN_TOT_LPF1			0x0a
+#define UB960_IR_PGEN_TOT_LPF0			0x0b
+#define UB960_IR_PGEN_LINE_PD1			0x0c
+#define UB960_IR_PGEN_LINE_PD0			0x0d
+#define UB960_IR_PGEN_VBP			0x0e
+#define UB960_IR_PGEN_VFP			0x0f
 #define UB960_IR_PGEN_COLOR(n)			(0x10 + (n)) /* n < 15 */
 
 #define UB960_IR_RX_ANA_STROBE_SET_CLK		0x08
@@ -368,16 +388,16 @@
 /* EQ related */
 
 #define UB960_MIN_AEQ_STROBE_POS -7
-#define UB960_MAX_AEQ_STROBE_POS 7
+#define UB960_MAX_AEQ_STROBE_POS  7
 
 #define UB960_MANUAL_STROBE_EXTRA_DELAY 6
 
 #define UB960_MIN_MANUAL_STROBE_POS -(7 + UB960_MANUAL_STROBE_EXTRA_DELAY)
-#define UB960_MAX_MANUAL_STROBE_POS (7 + UB960_MANUAL_STROBE_EXTRA_DELAY)
-#define UB960_NUM_MANUAL_STROBE_POS (UB960_MAX_MANUAL_STROBE_POS - UB960_MIN_MANUAL_STROBE_POS + 1)
+#define UB960_MAX_MANUAL_STROBE_POS  (7 + UB960_MANUAL_STROBE_EXTRA_DELAY)
+#define UB960_NUM_MANUAL_STROBE_POS  (UB960_MAX_MANUAL_STROBE_POS - UB960_MIN_MANUAL_STROBE_POS + 1)
 
-#define UB960_MIN_EQ_LEVEL 0
-#define UB960_MAX_EQ_LEVEL 14
+#define UB960_MIN_EQ_LEVEL  0
+#define UB960_MAX_EQ_LEVEL  14
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
 struct ub960_hw_data {
@@ -407,17 +427,23 @@ struct ub960_rxport {
 	struct ub960_data      *priv;
 	u8                      nport;	/* RX port number, and index in priv->rxport[] */
 
-	struct v4l2_subdev     *source_sd;	/* Connected subdev */
-	u16			source_sd_pad;
-	struct fwnode_handle   *source_ep_fwnode;
+	struct {
+		struct v4l2_subdev *sd;
+		u16 pad;
+		struct fwnode_handle *ep_fwnode;
+	} source;
+
+	/* Serializer */
+	struct {
+		struct fwnode_handle *fwnode;
+		struct i2c_client *client;
+		unsigned short alias; /* I2C alias (lower 7 bits) */
+		struct ds90ub9xx_platform_data pdata;
+	} ser;
 
 	enum ub960_rxport_mode  rx_mode;
 	enum ub960_rxport_cdr	cdr_mode;
 
-	struct fwnode_handle   *remote_fwnode;	/* 'serializer' fwnode */
-	struct i2c_client      *ser_client;	/* Serializer */
-	unsigned short          ser_alias;	/* Serializer i2c alias (lower 7 bits) */
-
 	u8			lv_fv_pol;	/* LV and FV polarities */
 
 	struct regulator	*vpoc;
@@ -439,8 +465,6 @@ struct ub960_rxport {
 			} manual;
 		};
 	} eq;
-
-	struct ds90ub9xx_platform_data ser_platform_data;
 };
 
 struct ub960_asd {
@@ -463,20 +487,12 @@ struct ub960_txport {
 struct atr_alias_table_entry {
 	u16 alias_id;	/* Alias ID from DT */
 
-	bool reserved;
+	bool in_use;
 	u8 nport;
 	u8 slave_id;	/* i2c client's local i2c address */
 	u8 port_reg_idx;
 };
 
-struct atr_alias_table {
-	/* Protects fields in this struct */
-	struct mutex lock;
-
-	size_t num_entries;
-	struct atr_alias_table_entry *entries;
-};
-
 struct ub960_data {
 	const struct ub960_hw_data	*hw_data;
 	struct i2c_client	*client; /* for shared local registers */
@@ -491,7 +507,6 @@ struct ub960_data {
 
 	struct gpio_desc	*pd_gpio;
 	struct delayed_work	poll_work;
-	struct i2c_atr		*atr;
 	struct ub960_rxport	*rxports[UB960_MAX_RX_NPORTS];
 	struct ub960_txport	*txports[UB960_MAX_TX_NPORTS];
 
@@ -504,15 +519,20 @@ struct ub960_data {
 	u32 tx_data_rate;		/* Nominal data rate (Gb/s) */
 	s64 tx_link_freq[1];
 
-	struct atr_alias_table	atr_alias_table;
-
-	u8 current_read_rxport;
-	u8 current_write_rxport_mask;
+	struct {
+		struct i2c_atr *atr;
 
-	u8 current_read_csiport;
-	u8 current_write_csiport_mask;
+		/* Protects fields below in this struct */
+		struct mutex lock;
+		size_t num_aliases;
+		struct atr_alias_table_entry *aliases;
+	} atr;
 
-	u8 current_indirect_target;
+	struct {
+		u8 rxport;
+		u8 txport;
+		u8 indirect_target;
+	} reg_current;
 
 	bool streaming;
 
@@ -529,29 +549,11 @@ struct ub960_data {
 	} strobe;
 };
 
-static void ub960_reset(struct ub960_data *priv, bool reset_regs);
-
 static inline struct ub960_data *sd_to_ub960(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct ub960_data, sd);
 }
 
-enum {
-	TEST_PATTERN_DISABLED = 0,
-	TEST_PATTERN_V_COLOR_BARS_1,
-	TEST_PATTERN_V_COLOR_BARS_2,
-	TEST_PATTERN_V_COLOR_BARS_4,
-	TEST_PATTERN_V_COLOR_BARS_8,
-};
-
-static const char *const ub960_tpg_qmenu[] = {
-	"Disabled",
-	"1 vertical color bar",
-	"2 vertical color bars",
-	"4 vertical color bars",
-	"8 vertical color bars",
-};
-
 static inline bool ub960_pad_is_sink(struct ub960_data *priv, u32 pad)
 {
 	return pad < priv->hw_data->num_rxports;
@@ -559,8 +561,7 @@ static inline bool ub960_pad_is_sink(struct ub960_data *priv, u32 pad)
 
 static inline bool ub960_pad_is_source(struct ub960_data *priv, u32 pad)
 {
-	return pad >= priv->hw_data->num_rxports &&
-	       pad < (priv->hw_data->num_rxports + priv->hw_data->num_txports);
+	return pad >= priv->hw_data->num_rxports;
 }
 
 static inline unsigned int ub960_pad_to_port(struct ub960_data *priv, u32 pad)
@@ -579,20 +580,15 @@ struct ub960_format_info {
 };
 
 static const struct ub960_format_info ub960_formats[] = {
-	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .bpp = 16, .datatype = 0x1e, },
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16, .datatype = 0x1e, },
-	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .bpp = 16, .datatype = 0x1e, },
-	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .bpp = 16, .datatype = 0x1e, },
-
-	/* Legacy */
-	{ .code = MEDIA_BUS_FMT_YUYV8_2X8, .bpp = 16, .datatype = 0x1e, },
-	{ .code = MEDIA_BUS_FMT_UYVY8_2X8, .bpp = 16, .datatype = 0x1e, },
-	{ .code = MEDIA_BUS_FMT_VYUY8_2X8, .bpp = 16, .datatype = 0x1e, },
-	{ .code = MEDIA_BUS_FMT_YVYU8_2X8, .bpp = 16, .datatype = 0x1e, },
-
-	/* RAW */
-	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, .datatype = 0x2c, },
-	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, .datatype = 0x2c, },
+	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .bpp = 16, .datatype = MIPI_CSI2_DT_YUV422_8B, },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16, .datatype = MIPI_CSI2_DT_YUV422_8B, },
+	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .bpp = 16, .datatype = MIPI_CSI2_DT_YUV422_8B, },
+	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .bpp = 16, .datatype = MIPI_CSI2_DT_YUV422_8B, },
+
+	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, .datatype = MIPI_CSI2_DT_RAW12, },
+	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .bpp = 12, .datatype = MIPI_CSI2_DT_RAW12, },
+	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .bpp = 12, .datatype = MIPI_CSI2_DT_RAW12, },
+	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, .datatype = MIPI_CSI2_DT_RAW12, },
 };
 
 static const struct ub960_format_info *ub960_find_format(u32 code)
@@ -668,13 +664,44 @@ static int ub960_update_bits(struct ub960_data *priv, u8 reg, u8 mask, u8 val)
 	return ret;
 }
 
-static int _ub960_rxport_select(struct ub960_data *priv, u8 nport)
+static int ub960_read16(struct ub960_data *priv, u8 reg, u16 *val)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned int v1, v2;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = regmap_read(priv->regmap, reg, &v1);
+	if (ret) {
+		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+		goto out_unlock;
+	}
+
+	ret = regmap_read(priv->regmap, reg + 1, &v2);
+	if (ret) {
+		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
+			__func__, reg + 1, ret);
+		goto out_unlock;
+	}
+
+	*val = (v1 << 8) | v2;
+
+out_unlock:
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_rxport_select(struct ub960_data *priv, u8 nport)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
-	if (priv->current_read_rxport == nport &&
-	    priv->current_write_rxport_mask == BIT(nport))
+	lockdep_assert_held(&priv->reg_lock);
+
+	if (priv->reg_current.rxport == nport)
 		return 0;
 
 	ret = regmap_write(priv->regmap, UB960_SR_FPD3_PORT_SEL,
@@ -685,8 +712,7 @@ static int _ub960_rxport_select(struct ub960_data *priv, u8 nport)
 		return ret;
 	}
 
-	priv->current_read_rxport = nport;
-	priv->current_write_rxport_mask = BIT(nport);
+	priv->reg_current.rxport = nport;
 
 	return 0;
 }
@@ -699,7 +725,9 @@ static int ub960_rxport_read(struct ub960_data *priv, u8 nport, u8 reg, u8 *val)
 
 	mutex_lock(&priv->reg_lock);
 
-	_ub960_rxport_select(priv, nport);
+	ret = ub960_rxport_select(priv, nport);
+	if (ret)
+		goto out_unlock;
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
@@ -723,13 +751,16 @@ static int ub960_rxport_write(struct ub960_data *priv, u8 nport, u8 reg, u8 val)
 
 	mutex_lock(&priv->reg_lock);
 
-	_ub960_rxport_select(priv, nport);
+	ret = ub960_rxport_select(priv, nport);
+	if (ret)
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
 			__func__, reg, ret);
 
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -743,43 +774,81 @@ static int ub960_rxport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
 
 	mutex_lock(&priv->reg_lock);
 
-	_ub960_rxport_select(priv, nport);
+	ret = ub960_rxport_select(priv, nport);
+	if (ret)
+		goto out_unlock;
 
 	ret = regmap_update_bits(priv->regmap, reg, mask, val);
 	if (ret)
 		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
 			__func__, reg, ret);
 
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
 }
 
-static int _ub960_csiport_select(struct ub960_data *priv, u8 nport)
+static int ub960_rxport_read16(struct ub960_data *priv, u8 nport, u8 reg,
+			       u16 *val)
 {
 	struct device *dev = &priv->client->dev;
+	unsigned int v1;
+	unsigned int v2;
 	int ret;
 
-	if (priv->current_read_csiport == nport &&
-	    priv->current_write_csiport_mask == BIT(nport))
+	mutex_lock(&priv->reg_lock);
+
+	ret = ub960_rxport_select(priv, nport);
+	if (ret)
+		goto out_unlock;
+
+	ret = regmap_read(priv->regmap, reg, &v1);
+	if (ret) {
+		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+		goto out_unlock;
+	}
+
+	ret = regmap_read(priv->regmap, reg + 1, &v2);
+	if (ret) {
+		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
+			__func__, reg + 1, ret);
+		goto out_unlock;
+	}
+
+	*val = (v1 << 8) | v2;
+
+out_unlock:
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_txport_select(struct ub960_data *priv, u8 nport)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	lockdep_assert_held(&priv->reg_lock);
+
+	if (priv->reg_current.txport == nport)
 		return 0;
 
 	ret = regmap_write(priv->regmap, UB960_SR_CSI_PORT_SEL,
 			   (nport << 4) | BIT(nport));
 	if (ret) {
-		dev_err(dev, "%s: cannot select csi port %d (%d)!\n", __func__,
+		dev_err(dev, "%s: cannot select tx port %d (%d)!\n", __func__,
 			nport, ret);
 		return ret;
 	}
 
-	priv->current_read_csiport = nport;
-	priv->current_write_csiport_mask = BIT(nport);
+	priv->reg_current.txport = nport;
 
 	return 0;
 }
 
-static int ub960_csiport_read(struct ub960_data *priv, u8 nport, u8 reg,
-			      u8 *val)
+static int ub960_txport_read(struct ub960_data *priv, u8 nport, u8 reg, u8 *val)
 {
 	struct device *dev = &priv->client->dev;
 	unsigned int v;
@@ -787,7 +856,9 @@ static int ub960_csiport_read(struct ub960_data *priv, u8 nport, u8 reg,
 
 	mutex_lock(&priv->reg_lock);
 
-	_ub960_csiport_select(priv, nport);
+	ret = ub960_txport_select(priv, nport);
+	if (ret)
+		goto out_unlock;
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
@@ -804,52 +875,59 @@ static int ub960_csiport_read(struct ub960_data *priv, u8 nport, u8 reg,
 	return ret;
 }
 
-static int ub960_csiport_write(struct ub960_data *priv, u8 nport, u8 reg,
-			       u8 val)
+static int ub960_txport_write(struct ub960_data *priv, u8 nport, u8 reg, u8 val)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
 	mutex_lock(&priv->reg_lock);
 
-	_ub960_csiport_select(priv, nport);
+	ret = ub960_txport_select(priv, nport);
+	if (ret)
+		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
 			__func__, reg, ret);
 
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
 }
 
-static int ub960_csiport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
-				     u8 mask, u8 val)
+static int ub960_txport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
+				    u8 mask, u8 val)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
 	mutex_lock(&priv->reg_lock);
 
-	_ub960_csiport_select(priv, nport);
+	ret = ub960_txport_select(priv, nport);
+	if (ret)
+		goto out_unlock;
 
 	ret = regmap_update_bits(priv->regmap, reg, mask, val);
 	if (ret)
 		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
 			__func__, reg, ret);
 
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
 }
 
-static int _ub960_select_ind_reg_block(struct ub960_data *priv, u8 block)
+static int ub960_select_ind_reg_block(struct ub960_data *priv, u8 block)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
-	if (priv->current_indirect_target == block)
+	lockdep_assert_held(&priv->reg_lock);
+
+	if (priv->reg_current.indirect_target == block)
 		return 0;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_CTL, block << 2);
@@ -859,25 +937,26 @@ static int _ub960_select_ind_reg_block(struct ub960_data *priv, u8 block)
 		return ret;
 	}
 
-	priv->current_indirect_target = block;
+	priv->reg_current.indirect_target = block;
 
 	return 0;
 }
 
 static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val)
 {
+	struct device *dev = &priv->client->dev;
 	unsigned int v;
 	int ret;
 
 	mutex_lock(&priv->reg_lock);
 
-	ret = _ub960_select_ind_reg_block(priv, block);
+	ret = ub960_select_ind_reg_block(priv, block);
 	if (ret)
 		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
 	if (ret) {
-		dev_err(&priv->client->dev,
+		dev_err(dev,
 			"Write to IND_ACC_ADDR failed when reading %u:%x02x: %d\n",
 			block, reg, ret);
 		goto out_unlock;
@@ -885,7 +964,7 @@ static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val)
 
 	ret = regmap_read(priv->regmap, UB960_SR_IND_ACC_DATA, &v);
 	if (ret) {
-		dev_err(&priv->client->dev,
+		dev_err(dev,
 			"Write to IND_ACC_DATA failed when reading %u:%x02x: %d\n",
 			block, reg, ret);
 		goto out_unlock;
@@ -901,17 +980,18 @@ static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val)
 
 static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val)
 {
+	struct device *dev = &priv->client->dev;
 	int ret;
 
 	mutex_lock(&priv->reg_lock);
 
-	ret = _ub960_select_ind_reg_block(priv, block);
+	ret = ub960_select_ind_reg_block(priv, block);
 	if (ret)
 		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
 	if (ret) {
-		dev_err(&priv->client->dev,
+		dev_err(dev,
 			"Write to IND_ACC_ADDR failed when writing %u:%x02x: %d\n",
 			block, reg, ret);
 		goto out_unlock;
@@ -919,8 +999,8 @@ static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val)
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val);
 	if (ret) {
-		dev_err(&priv->client->dev,
-			"Write to IND_ACC_DATA failed when writing %u:%x02x\n: %d\n",
+		dev_err(dev,
+			"Write to IND_ACC_DATA failed when writing %u:%x02x: %d\n",
 			block, reg, ret);
 		goto out_unlock;
 	}
@@ -931,52 +1011,21 @@ static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val)
 	return ret;
 }
 
-static int ub960_write_ind16(struct ub960_data *priv, u8 block, u8 reg, u16 val)
-{
-	int ret;
-
-	mutex_lock(&priv->reg_lock);
-
-	ret = _ub960_select_ind_reg_block(priv, block);
-	if (ret)
-		goto out_unlock;
-
-	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
-	if (ret)
-		goto out_unlock;
-
-	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val >> 8);
-	if (ret)
-		goto out_unlock;
-
-	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg + 1);
-	if (ret)
-		goto out_unlock;
-
-	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val & 0xff);
-	if (ret)
-		goto out_unlock;
-
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
-	return ret;
-}
-
 static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
 				 u8 mask, u8 val)
 {
+	struct device *dev = &priv->client->dev;
 	int ret;
 
 	mutex_lock(&priv->reg_lock);
 
-	ret = _ub960_select_ind_reg_block(priv, block);
+	ret = ub960_select_ind_reg_block(priv, block);
 	if (ret)
 		goto out_unlock;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
 	if (ret) {
-		dev_err(&priv->client->dev,
+		dev_err(dev,
 			"Write to IND_ACC_ADDR failed when updating %u:%x02x: %d\n",
 			block, reg, ret);
 		goto out_unlock;
@@ -985,7 +1034,7 @@ static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
 	ret = regmap_update_bits(priv->regmap, UB960_SR_IND_ACC_DATA, mask,
 				 val);
 	if (ret) {
-		dev_err(&priv->client->dev,
+		dev_err(dev,
 			"Write to IND_ACC_DATA failed when updating %u:%x02x: %d\n",
 			block, reg, ret);
 		goto out_unlock;
@@ -1015,9 +1064,7 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	int ret = 0;
 	u8 port_reg_idx_mask = 0;
 
-	dev_dbg(dev, "rx%u: %s\n", chan_id, __func__);
-
-	mutex_lock(&priv->atr_alias_table.lock);
+	mutex_lock(&priv->atr.lock);
 
 	/*
 	 * Go through the alias table and:
@@ -1025,15 +1072,15 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	 *	2. Construct a bitmask of port's used alias entries
 	 */
 
-	for (pool_idx = 0; pool_idx < priv->atr_alias_table.num_entries; pool_idx++) {
+	for (pool_idx = 0; pool_idx < priv->atr.num_aliases; ++pool_idx) {
 		struct atr_alias_table_entry *e;
 
-		e = &priv->atr_alias_table.entries[pool_idx];
+		e = &priv->atr.aliases[pool_idx];
 
-		if (!entry && !e->reserved)
+		if (!entry && !e->in_use)
 			entry = e;
 
-		if (e->reserved && e->nport == rxport->nport)
+		if (e->in_use && e->nport == rxport->nport)
 			port_reg_idx_mask |= BIT(e->port_reg_idx);
 	}
 
@@ -1053,7 +1100,7 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 
 	reg_idx = ffz(port_reg_idx_mask);
 
-	entry->reserved = true;
+	entry->in_use = true;
 	entry->nport = rxport->nport;
 	entry->slave_id = client->addr;
 	entry->port_reg_idx = reg_idx;
@@ -1067,11 +1114,8 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 
 	*alias_id = alias; /* tell the atr which alias we chose */
 
-	dev_dbg(dev, "rx%u: client 0x%02x mapped at alias 0x%02x (%s)\n",
-		rxport->nport, client->addr, alias, client->name);
-
 out_unlock:
-	mutex_unlock(&priv->atr_alias_table.lock);
+	mutex_unlock(&priv->atr.lock);
 	return ret;
 }
 
@@ -1084,43 +1128,35 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	struct atr_alias_table_entry *entry;
 	unsigned int reg_idx;
 	unsigned int pool_idx;
-	u16 alias = 0;
-
-	dev_dbg(dev, "rx%u: %s\n", chan_id, __func__);
 
-	mutex_lock(&priv->atr_alias_table.lock);
+	mutex_lock(&priv->atr.lock);
 
 	/* Find alias mapped to this client */
 
-	for (pool_idx = 0; pool_idx < priv->atr_alias_table.num_entries; pool_idx++) {
-		entry = &priv->atr_alias_table.entries[pool_idx];
+	for (pool_idx = 0; pool_idx < priv->atr.num_aliases; ++pool_idx) {
+		entry = &priv->atr.aliases[pool_idx];
 
-		if (entry->reserved && entry->nport == rxport->nport &&
+		if (entry->in_use && entry->nport == rxport->nport &&
 		    entry->slave_id == client->addr)
 			break;
 	}
 
-	if (pool_idx == priv->atr_alias_table.num_entries) {
+	if (pool_idx == priv->atr.num_aliases) {
 		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
 			rxport->nport, client->addr);
 		goto out_unlock;
 	}
 
-	alias = entry->alias_id;
-
 	reg_idx = entry->port_reg_idx;
 
 	/* Unmap */
 
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
 
-	entry->reserved = false;
-
-	dev_dbg(dev, "rx%u: client 0x%02x unmapped from alias 0x%02x (%s)\n",
-		rxport->nport, client->addr, alias, client->name);
+	entry->in_use = false;
 
 out_unlock:
-	mutex_unlock(&priv->atr_alias_table.lock);
+	mutex_unlock(&priv->atr.lock);
 }
 
 static const struct i2c_atr_ops ub960_atr_ops = {
@@ -1128,18 +1164,39 @@ static const struct i2c_atr_ops ub960_atr_ops = {
 	.detach_client = ub960_atr_detach_client,
 };
 
+static int ub960_init_atr(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct i2c_adapter *parent_adap = priv->client->adapter;
+
+	priv->atr.atr = i2c_atr_new(parent_adap, dev, &ub960_atr_ops,
+				    priv->hw_data->num_rxports);
+	if (IS_ERR(priv->atr.atr))
+		return PTR_ERR(priv->atr.atr);
+
+	i2c_atr_set_driver_data(priv->atr.atr, priv);
+
+	return 0;
+}
+
+static void ub960_uninit_atr(struct ub960_data *priv)
+{
+	i2c_atr_delete(priv->atr.atr);
+	priv->atr.atr = NULL;
+}
+
 /* -----------------------------------------------------------------------------
- * CSI ports
+ * TX ports
  */
 
 static int ub960_parse_dt_txport(struct ub960_data *priv,
-				 const struct fwnode_handle *ep_fwnode,
+				 struct fwnode_handle *ep_fwnode,
 				 u8 nport)
 {
 	struct device *dev = &priv->client->dev;
+	struct v4l2_fwnode_endpoint vep = {};
 	struct ub960_txport *txport;
 	int ret;
-	u64 freq;
 
 	txport = kzalloc(sizeof(*txport), GFP_KERNEL);
 	if (!txport)
@@ -1148,39 +1205,40 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 	txport->priv = priv;
 	txport->nport = nport;
 
-	priv->txports[nport] = txport;
-
-	ret = fwnode_property_count_u32(ep_fwnode, "data-lanes");
-	if (ret < 0) {
-		dev_err(dev, "tx%u: failed to parse 'data-lanes': %d\n", nport,
-			ret);
+	vep.bus_type = V4L2_MBUS_CSI2_DPHY;
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep_fwnode, &vep);
+	if (ret) {
+		dev_err(dev, "tx%u: failed to parse endpoint data\n", nport);
 		goto err_free_txport;
 	}
 
-	txport->num_data_lanes = ret;
+	txport->num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
 
-	ret = fwnode_property_read_u64(ep_fwnode, "link-frequencies", &freq);
-	if (ret) {
-		dev_err(dev, "tx%u: failed to read 'link-frequencies': %d\n",
-			nport, ret);
-		goto err_free_txport;
+	if (vep.nr_of_link_frequencies != 1) {
+		ret = -EINVAL;
+		goto err_free_vep;
 	}
 
-	priv->tx_link_freq[0] = freq;
-	priv->tx_data_rate = freq * 2;
+	priv->tx_link_freq[0] = vep.link_frequencies[0];
+	priv->tx_data_rate = priv->tx_link_freq[0] * 2;
 
 	if (priv->tx_data_rate != MHZ(1600) &&
 	    priv->tx_data_rate != MHZ(1200) &&
 	    priv->tx_data_rate != MHZ(800) &&
 	    priv->tx_data_rate != MHZ(400)) {
 		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_free_vep;
 	}
 
-	dev_dbg(dev, "tx%u: nominal data rate: %u", nport, priv->tx_data_rate);
+	v4l2_fwnode_endpoint_free(&vep);
+
+	priv->txports[nport] = txport;
 
 	return 0;
 
+err_free_vep:
+	v4l2_fwnode_endpoint_free(&vep);
 err_free_txport:
 	kfree(txport);
 
@@ -1193,7 +1251,7 @@ static void ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
 	u8 csi_tx_isr;
 	int ret;
 
-	ret = ub960_csiport_read(priv, nport, UB960_TR_CSI_TX_ISR, &csi_tx_isr);
+	ret = ub960_txport_read(priv, nport, UB960_TR_CSI_TX_ISR, &csi_tx_isr);
 	if (ret)
 		return;
 
@@ -1288,15 +1346,13 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 		       UB960_IR_RX_ANA_STROBE_SET_CLK, &v);
 
 	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
-			    0 :
-			    UB960_MANUAL_STROBE_EXTRA_DELAY;
+			    0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
 
 	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
 		       UB960_IR_RX_ANA_STROBE_SET_DATA, &v);
 
 	data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
-			     0 :
-			     UB960_MANUAL_STROBE_EXTRA_DELAY;
+			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
 
 	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v);
 	if (ret)
@@ -1457,10 +1513,9 @@ static int ub960_rxport_link_ok(struct ub960_data *priv, unsigned int nport,
 				bool *ok)
 {
 	u8 rx_port_sts1, rx_port_sts2;
-	unsigned int parity_errors;
+	u16 parity_errors;
 	u8 csi_rx_sts;
 	u8 csi_err_cnt;
-	u8 v1, v2;
 	u8 bcc_sts;
 	int ret;
 	bool errors;
@@ -1493,16 +1548,11 @@ static int ub960_rxport_link_ok(struct ub960_data *priv, unsigned int nport,
 	if (ret)
 		return ret;
 
-	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
-	if (ret)
-		return ret;
-
-	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
+	ret = ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI,
+				  &parity_errors);
 	if (ret)
 		return ret;
 
-	parity_errors = (v1 << 8) | v2;
-
 	errors = (rx_port_sts1 & UB960_RR_RX_PORT_STS1_ERROR_MASK) ||
 		 (rx_port_sts2 & UB960_RR_RX_PORT_STS2_ERROR_MASK) ||
 		 (bcc_sts & UB960_RR_BCC_STATUS_ERROR_MASK) ||
@@ -1530,8 +1580,11 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 	u8 nport;
 	int ret;
 
-	if (port_mask == 0)
+	if (port_mask == 0) {
+		if (lock_mask)
+			*lock_mask = 0;
 		return 0;
+	}
 
 	if (port_mask >= BIT(priv->hw_data->num_rxports))
 		return -EINVAL;
@@ -1555,6 +1608,11 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 			if (ret)
 				return ret;
 
+			/*
+			 * We want the link to be ok for two consecutive loops,
+			 * as a link could get established just before our test
+			 * and drop soon after.
+			 */
 			if (!ok || !(link_ok_mask & BIT(nport)))
 				missing++;
 
@@ -1579,7 +1637,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 	for_each_set_bit(nport, &port_mask, priv->hw_data->num_rxports) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 		s8 strobe_pos, eq_level;
-		u8 v1, v2;
+		u16 v;
 
 		if (!rxport)
 			continue;
@@ -1589,8 +1647,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 			continue;
 		}
 
-		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
-		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);
+		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v);
 
 		ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
 		if (ret)
@@ -1600,35 +1657,13 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 		if (ret)
 			return ret;
 
-		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %u Hz\n",
-			nport, strobe_pos, eq_level,
-			v1 * 1000000 + v2 * 1000000 / 256);
+		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %llu Hz\n",
+			nport, strobe_pos, eq_level, (v * 1000000ULL) >> 8);
 	}
 
 	return 0;
 }
 
-static int ub960_init_atr(struct ub960_data *priv)
-{
-	struct device *dev = &priv->client->dev;
-	struct i2c_adapter *parent_adap = priv->client->adapter;
-
-	priv->atr = i2c_atr_new(parent_adap, dev, &ub960_atr_ops,
-				priv->hw_data->num_rxports);
-	if (IS_ERR(priv->atr))
-		return PTR_ERR(priv->atr);
-
-	i2c_atr_set_driver_data(priv->atr, priv);
-
-	return 0;
-}
-
-static void ub960_uninit_atr(struct ub960_data *priv)
-{
-	i2c_atr_delete(priv->atr);
-	priv->atr = NULL;
-}
-
 static unsigned long ub960_calc_bc_clk_rate_ub960(struct ub960_data *priv,
 						  struct ub960_rxport *rxport)
 {
@@ -1684,37 +1719,37 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 {
 	struct ub960_rxport *rxport = priv->rxports[nport];
 	struct device *dev = &priv->client->dev;
-	struct ds90ub9xx_platform_data *ser_pdata = &rxport->ser_platform_data;
+	struct ds90ub9xx_platform_data *ser_pdata = &rxport->ser.pdata;
 	struct i2c_board_info ser_info = {
-		.of_node = to_of_node(rxport->remote_fwnode),
-		.fwnode = rxport->remote_fwnode,
+		.of_node = to_of_node(rxport->ser.fwnode),
+		.fwnode = rxport->ser.fwnode,
 		.platform_data = ser_pdata,
 	};
 
 	ser_pdata->port = nport;
-	ser_pdata->atr = priv->atr;
+	ser_pdata->atr = priv->atr.atr;
 	if (priv->hw_data->is_ub9702)
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
 	else
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
 
 	/*
-	 * Adding the serializer under rxport->adap would be cleaner, but it
-	 * would need tweaks to bypass the alias table. Adding to the
-	 * upstream adapter is way simpler.
+	 * The serializer is added under the same i2c adapter as the
+	 * deserializer. This is not quite right, as the serializer is behind
+	 * the FPD-Link.
 	 */
-	ser_info.addr = rxport->ser_alias;
-	rxport->ser_client =
+	ser_info.addr = rxport->ser.alias;
+	rxport->ser.client =
 		i2c_new_client_device(priv->client->adapter, &ser_info);
-	if (!rxport->ser_client) {
+	if (!rxport->ser.client) {
 		dev_err(dev, "rx%u: cannot add %s i2c device", nport,
 			ser_info.type);
 		return -EIO;
 	}
 
 	dev_dbg(dev, "rx%u: remote serializer at alias 0x%02x (%u-%04x)\n",
-		nport, rxport->ser_client->addr,
-		rxport->ser_client->adapter->nr, rxport->ser_client->addr);
+		nport, rxport->ser.client->addr,
+		rxport->ser.client->adapter->nr, rxport->ser.client->addr);
 
 	return 0;
 }
@@ -1723,8 +1758,8 @@ static void ub960_rxport_remove_serializer(struct ub960_data *priv, u8 nport)
 {
 	struct ub960_rxport *rxport = priv->rxports[nport];
 
-	i2c_unregister_device(rxport->ser_client);
-	rxport->ser_client = NULL;
+	i2c_unregister_device(rxport->ser.client);
+	rxport->ser.client = NULL;
 }
 
 /* Add serializer i2c devices for all initialized ports */
@@ -1750,10 +1785,6 @@ static int ub960_rxport_add_serializers(struct ub960_data *priv)
 	while (nport--) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 
-		if (!rxport)
-			continue;
-
-		rxport = priv->rxports[nport];
 		if (!rxport)
 			continue;
 
@@ -1792,7 +1823,7 @@ static void ub960_init_tx_port(struct ub960_data *priv,
 
 	csi_ctl |= (4 - txport->num_data_lanes) << 4;
 
-	ub960_csiport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl);
+	ub960_txport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl);
 }
 
 static int ub960_init_tx_ports(struct ub960_data *priv)
@@ -1831,20 +1862,20 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 		case MHZ(1600):
 		default:
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x80);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4B, 0x2A);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a);
 			break;
 		case MHZ(800):
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x90);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4F, 0x2A);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4B, 0x2A);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f, 0x2a);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a);
 			break;
 		case MHZ(400):
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xA0);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xa0);
 			break;
 		}
 	}
 
-	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
+	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
 		struct ub960_txport *txport = priv->txports[nport];
 
 		if (!txport)
@@ -1941,7 +1972,7 @@ static void ub960_init_rx_port_ub960(struct ub960_data *priv,
 
 	/* Enable I2C communication to the serializer via the alias addr */
 	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
-			   rxport->ser_alias << 1);
+			   rxport->ser.alias << 1);
 
 	/* Configure EQ related settings */
 	ub960_rxport_config_eq(priv, nport);
@@ -1992,19 +2023,19 @@ static void ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
 	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, fpd_func_mode);
 
 	/* set serdes_eq_mode = 1 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xA8, 0x80);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa8, 0x80);
 
 	/* enable serdes driver */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x0D, 0x7F);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x0d, 0x7f);
 
 	/* set serdes_eq_offset=4 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2B, 0x04);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04);
 
-	/* init default serdes_eq_max in 0xA9 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xA9, 0x23);
+	/* init default serdes_eq_max in 0xa9 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa9, 0x23);
 
-	/* init serdes_eq_min in 0xAA */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xAA, 0);
+	/* init serdes_eq_min in 0xaa */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xaa, 0);
 
 	/* serdes_driver_ctl2 control: DS90UB953-Q1/DS90UB933-Q1/DS90UB913A-Q1 */
 	ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b,
@@ -2025,25 +2056,25 @@ static void ub960_init_rx_port_ub9702_fpd4_aeq(struct ub960_data *priv,
 		u8 v;
 
 		/* AEQ init */
-		ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2C, &v);
+		ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2c, &v);
 
 		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, v);
 		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, v + 1);
 
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2B, 0x00);
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x00);
 	}
 
 	/* enable serdes_eq_ctl2 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x9E, 0x00);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x9e, 0x00);
 
 	/* enable serdes_eq_ctl1 */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x90, 0x40);
 
 	/* enable serdes_eq_en */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2E, 0x40);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2e, 0x40);
 
 	/* disable serdes_eq_override */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xF0, 0x00);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xf0, 0x00);
 
 	/* disable serdes_gain_override */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x71, 0x00);
@@ -2087,7 +2118,7 @@ static void ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
 	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, 0);
 
 	/* add serdes_eq_offset of 4 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2B, 0x04);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04);
 
 	/* FPD4 serdes_start_eq in 0x27: assign default */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, 0x0);
@@ -2097,12 +2128,12 @@ static void ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
 	/* set serdes_driver_mode into FPD IV mode */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x04, 0x00);
 	/* set FPD PBC drv into FPD IV mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1B, 0x00);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b, 0x00);
 
 	/* set serdes_system_init to 0x2f */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x21, 0x2f);
 	/* set serdes_system_rst in reset mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0xC1);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0xc1);
 
 	/* RX port to 7.55G mode */
 	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
@@ -2144,7 +2175,8 @@ static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
 	}
 
 	/* LV_POLARITY & FV_POLARITY */
-	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3, 0x1);
+	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3,
+				 rxport->lv_fv_pol);
 
 	/* Enable all interrupt sources from this port */
 	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07);
@@ -2157,7 +2189,7 @@ static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
 
 	/* Enable I2C communication to the serializer via the alias addr */
 	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
-			   rxport->ser_alias << 1);
+			   rxport->ser.alias << 1);
 
 	/* Enable RX port */
 	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport));
@@ -2172,7 +2204,7 @@ static int ub960_init_rx_ports(struct ub960_data *priv)
 {
 	unsigned int nport;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport)
@@ -2214,11 +2246,12 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 		return;
 
 	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_PARITY_ERROR) {
-		u8 v1, v2;
+		u16 v;
 
-		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
-		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
-		dev_err(dev, "rx%u parity errors: %u\n", nport, (v1 << 8) | v2);
+		ret = ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI,
+					  &v);
+		if (!ret)
+			dev_err(dev, "rx%u parity errors: %u\n", nport, v);
 	}
 
 	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_BCC_CRC_ERROR)
@@ -2273,21 +2306,20 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 		dev_err(dev, "rx%u BCC sequence error", nport);
 
 	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_LEN_CHG) {
-		u8 v1, v2;
+		u16 v;
 
-		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_1, &v1);
-		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_0, &v2);
-		dev_dbg(dev, "rx%u line len changed: %u\n", nport,
-			(v1 << 8) | v2);
+		ret = ub960_rxport_read16(priv, nport, UB960_RR_LINE_LEN_1, &v);
+		if (!ret)
+			dev_dbg(dev, "rx%u line len changed: %u\n", nport, v);
 	}
 
 	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_CNT_CHG) {
-		u8 v1, v2;
+		u16 v;
 
-		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_HI, &v1);
-		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_LO, &v2);
-		dev_dbg(dev, "rx%u line count changed: %u\n", nport,
-			(v1 << 8) | v2);
+		ret = ub960_rxport_read16(priv, nport, UB960_RR_LINE_COUNT_HI,
+					  &v);
+		if (!ret)
+			dev_dbg(dev, "rx%u line count changed: %u\n", nport, v);
 	}
 
 	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS_CHG) {
@@ -2311,16 +2343,31 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
  * V4L2
  */
 
+/*
+ * The current implementation only supports a simple VC mapping, where all VCs
+ * from a one RX port will be mapped to the same VC. Also, the hardware
+ * dictates that all streams from an RX port must go to a single TX port.
+ *
+ * This function decides the target VC numbers for each RX port with a simple
+ * algorithm, so that for each TX port, we get VC numbers starting from 0,
+ * and counting up.
+ *
+ * E.g. if all four RX ports are in use, of which the first two go to the
+ * first TX port and the secont two go to the second TX port, we would get
+ * the following VCs for the four RX ports: 0, 1, 0, 1.
+ *
+ * TODO: implement a more sophisticated VC mapping. As the driver cannot know
+ * what VCs the sinks expect (say, an FPGA with hardcoded VC routing), this
+ * probably needs to be somehow configurable. Device tree?
+ */
 static void ub960_get_vc_maps(struct ub960_data *priv,
 			      struct v4l2_subdev_state *state, u8 *vc)
 {
-	const struct v4l2_subdev_krouting *routing = &state->routing;
-	u8 cur_vc[UB960_MAX_TX_NPORTS] = { };
+	u8 cur_vc[UB960_MAX_TX_NPORTS] = {};
+	struct v4l2_subdev_route *route;
 	u8 handled_mask = 0;
-	unsigned int i;
 
-	for (i = 0; i < routing->num_routes; ++i) {
-		struct v4l2_subdev_route *route = &routing->routes[i];
+	for_each_active_route(&state->routing, route) {
 		unsigned int rx, tx;
 
 		rx = ub960_pad_to_port(priv, route->sink_pad);
@@ -2340,11 +2387,9 @@ static int ub960_enable_tx_port(struct ub960_data *priv, unsigned int nport)
 
 	dev_dbg(dev, "enable TX port %u\n", nport);
 
-	ub960_csiport_update_bits(priv, nport, UB960_TR_CSI_CTL,
-				  UB960_TR_CSI_CTL_CSI_ENABLE,
-				  UB960_TR_CSI_CTL_CSI_ENABLE);
-
-	return 0;
+	return ub960_txport_update_bits(priv, nport, UB960_TR_CSI_CTL,
+					UB960_TR_CSI_CTL_CSI_ENABLE,
+					UB960_TR_CSI_CTL_CSI_ENABLE);
 }
 
 static void ub960_disable_tx_port(struct ub960_data *priv, unsigned int nport)
@@ -2353,8 +2398,8 @@ static void ub960_disable_tx_port(struct ub960_data *priv, unsigned int nport)
 
 	dev_dbg(dev, "disable TX port %u\n", nport);
 
-	ub960_csiport_update_bits(priv, nport, UB960_TR_CSI_CTL,
-				  UB960_TR_CSI_CTL_CSI_ENABLE, 0);
+	ub960_txport_update_bits(priv, nport, UB960_TR_CSI_CTL,
+				 UB960_TR_CSI_CTL_CSI_ENABLE, 0);
 }
 
 static int ub960_enable_rx_port(struct ub960_data *priv, unsigned int nport)
@@ -2364,9 +2409,7 @@ static int ub960_enable_rx_port(struct ub960_data *priv, unsigned int nport)
 	dev_dbg(dev, "enable RX port %u\n", nport);
 
 	/* Enable forwarding */
-	ub960_update_bits(priv, UB960_SR_FWD_CTL1, BIT(4 + nport), 0);
-
-	return 0;
+	return ub960_update_bits(priv, UB960_SR_FWD_CTL1, BIT(4 + nport), 0);
 }
 
 static void ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
@@ -2380,10 +2423,56 @@ static void ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
 			  BIT(4 + nport));
 }
 
+/*
+ * The driver only supports using a single VC for each source. This function
+ * checks that each source only provides streams using a single VC.
+ */
+static int ub960_validate_stream_vcs(struct ub960_data *priv)
+{
+	unsigned int nport;
+	unsigned int i;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+		struct v4l2_mbus_frame_desc desc;
+		int ret;
+		u8 cur_vc;
+
+		if (!rxport)
+			continue;
+
+		ret = v4l2_subdev_call(rxport->source.sd, pad, get_frame_desc,
+				       rxport->source.pad, &desc);
+		if (ret)
+			return ret;
+
+		if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+			continue;
+
+		for (i = 0; i < desc.num_entries; ++i) {
+			u8 vc = desc.entry[i].bus.csi2.vc;
+
+			if (i == 0) {
+				cur_vc = vc;
+				continue;
+			}
+
+			if (vc == cur_vc)
+				continue;
+
+			dev_err(&priv->client->dev,
+				"rx%u: source with multiple virtual-channels is not supported\n",
+				nport);
+			return -ENODEV;
+		}
+	}
+
+	return 0;
+}
+
 static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 					       struct v4l2_subdev_state *state)
 {
-	const struct v4l2_subdev_krouting *routing = &state->routing;
 	u8 fwd_ctl;
 	struct {
 		u32 num_streams;
@@ -2391,13 +2480,19 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 		u8 meta_dt;
 		u32 meta_lines;
 		u32 tx_port;
-	} rx_data[UB960_MAX_RX_NPORTS] = { };
-	u8 vc_map[UB960_MAX_RX_NPORTS] = { };
+	} rx_data[UB960_MAX_RX_NPORTS] = {};
+	u8 vc_map[UB960_MAX_RX_NPORTS] = {};
+	struct v4l2_subdev_route *route;
+	unsigned int nport;
+	int ret;
+
+	ret = ub960_validate_stream_vcs(priv);
+	if (ret)
+		return ret;
 
 	ub960_get_vc_maps(priv, state, vc_map);
 
-	for (unsigned int i = 0; i < routing->num_routes; ++i) {
-		struct v4l2_subdev_route *route = &routing->routes[i];
+	for_each_active_route(&state->routing, route) {
 		struct ub960_rxport *rxport;
 		struct ub960_txport *txport;
 		struct v4l2_mbus_framefmt *fmt;
@@ -2455,7 +2550,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 	fwd_ctl = 0;
 
-	for (unsigned int nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 		u8 vc = vc_map[nport];
 
@@ -2534,24 +2629,11 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 {
 	struct ub960_data *priv = sd_to_ub960(sd);
 	struct device *dev = &priv->client->dev;
-	const struct v4l2_subdev_krouting *routing;
-	unsigned int source_stream;
-	int ret;
-	u64 sink_streams[UB960_MAX_RX_NPORTS] = { };
-	unsigned int nport;
+	u64 sink_streams[UB960_MAX_RX_NPORTS] = {};
+	struct v4l2_subdev_route *route;
 	unsigned int failed_port;
-
-	dev_dbg(dev, "Enable streams %u:%#llx\n", source_pad,
-		source_streams_mask);
-
-	if (priv->stream_enable_mask[source_pad] & source_streams_mask) {
-		dev_err(dev,
-			"cannot enable already enabled streams on pad %u mask %#llx\n",
-			source_pad, source_streams_mask);
-		return -EBUSY;
-	}
-
-	routing = &state->routing;
+	unsigned int nport;
+	int ret;
 
 	if (!priv->streaming) {
 		dev_dbg(dev, "Prepare for streaming\n");
@@ -2571,22 +2653,16 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 	priv->stream_enable_mask[source_pad] |= source_streams_mask;
 
 	/* Collect sink streams per pad which we need to enable */
-	for (source_stream = 0; source_stream < sizeof(source_streams_mask) * 8;
-	     ++source_stream) {
-		struct v4l2_subdev_route *route;
-
-		if (!(source_streams_mask & BIT_ULL(source_stream)))
+	for_each_active_route(&state->routing, route) {
+		if (route->source_pad != source_pad)
 			continue;
 
-		for_each_active_route(routing, route) {
-			if (!(route->source_pad == source_pad) ||
-			    !(route->source_stream == source_stream))
-				continue;
+		if (!(source_streams_mask & BIT_ULL(route->source_stream)))
+			continue;
 
-			nport = ub960_pad_to_port(priv, route->sink_pad);
+		nport = ub960_pad_to_port(priv, route->sink_pad);
 
-			sink_streams[nport] |= BIT_ULL(route->sink_stream);
-		}
+		sink_streams[nport] |= BIT_ULL(route->sink_stream);
 	}
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
@@ -2604,12 +2680,12 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 
 		priv->stream_enable_mask[nport] |= sink_streams[nport];
 
-		dev_dbg(dev, "Enable RX port %u streams %#llx\n", nport,
+		dev_dbg(dev, "enable RX port %u streams %#llx\n", nport,
 			sink_streams[nport]);
 
 		ret = v4l2_subdev_enable_streams(
-			priv->rxports[nport]->source_sd,
-			priv->rxports[nport]->source_sd_pad,
+			priv->rxports[nport]->source.sd,
+			priv->rxports[nport]->source.pad,
 			sink_streams[nport]);
 		if (ret) {
 			priv->stream_enable_mask[nport] &= ~sink_streams[nport];
@@ -2631,12 +2707,12 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 		if (!sink_streams[nport])
 			continue;
 
-		dev_dbg(dev, "Disable RX port %u streams %#llx\n", nport,
+		dev_dbg(dev, "disable RX port %u streams %#llx\n", nport,
 			sink_streams[nport]);
 
 		ret = v4l2_subdev_disable_streams(
-			priv->rxports[nport]->source_sd,
-			priv->rxports[nport]->source_sd_pad,
+			priv->rxports[nport]->source.sd,
+			priv->rxports[nport]->source.pad,
 			sink_streams[nport]);
 		if (ret)
 			dev_err(dev, "Failed to disable streams: %d\n", ret);
@@ -2665,53 +2741,34 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
 {
 	struct ub960_data *priv = sd_to_ub960(sd);
 	struct device *dev = &priv->client->dev;
-	const struct v4l2_subdev_krouting *routing;
-	int ret;
-	unsigned int source_stream;
-	u64 sink_streams[UB960_MAX_RX_NPORTS] = { };
+	u64 sink_streams[UB960_MAX_RX_NPORTS] = {};
+	struct v4l2_subdev_route *route;
 	unsigned int nport;
-
-	dev_dbg(dev, "Disable streams %u:%#llx\n", source_pad,
-		source_streams_mask);
-
-	if ((priv->stream_enable_mask[source_pad] & source_streams_mask) != source_streams_mask) {
-		dev_err(dev,
-			"cannot disable already disabled streams on pad %u mask %#llx\n",
-			source_pad, source_streams_mask);
-		return -EBUSY;
-	}
-
-	routing = &state->routing;
+	int ret;
 
 	/* Collect sink streams per pad which we need to disable */
-	for (source_stream = 0; source_stream < sizeof(source_streams_mask) * 8;
-	     ++source_stream) {
-		struct v4l2_subdev_route *route;
-
-		if (!(source_streams_mask & BIT_ULL(source_stream)))
+	for_each_active_route(&state->routing, route) {
+		if (route->source_pad != source_pad)
 			continue;
 
-		for_each_active_route(routing, route) {
-			if (!(route->source_pad == source_pad) ||
-			    !(route->source_stream == source_stream))
-				continue;
+		if (!(source_streams_mask & BIT_ULL(route->source_stream)))
+			continue;
 
-			nport = ub960_pad_to_port(priv, route->sink_pad);
+		nport = ub960_pad_to_port(priv, route->sink_pad);
 
-			sink_streams[nport] |= BIT_ULL(route->sink_stream);
-		}
+		sink_streams[nport] |= BIT_ULL(route->sink_stream);
 	}
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
 		if (!sink_streams[nport])
 			continue;
 
-		dev_dbg(dev, "Disable RX port %u streams %#llx\n", nport,
+		dev_dbg(dev, "disable RX port %u streams %#llx\n", nport,
 			sink_streams[nport]);
 
 		ret = v4l2_subdev_disable_streams(
-			priv->rxports[nport]->source_sd,
-			priv->rxports[nport]->source_sd_pad,
+			priv->rxports[nport]->source.sd,
+			priv->rxports[nport]->source.pad,
 			sink_streams[nport]);
 		if (ret)
 			dev_err(dev, "Failed to disable streams: %d\n", ret);
@@ -2736,76 +2793,14 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ub960_s_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct ub960_data *priv = sd_to_ub960(sd);
-	const struct v4l2_subdev_krouting *routing;
-	struct v4l2_subdev_state *state;
-	struct v4l2_subdev_route *route;
-	u64 pad_stream_masks[UB960_MAX_TX_NPORTS] = { };
-	unsigned int nport;
-	int ret = 0;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	routing = &state->routing;
-
-	for_each_active_route(routing, route)
-		pad_stream_masks[ub960_pad_to_port(priv, route->source_pad)] |=
-			BIT_ULL(route->source_stream);
-
-	if (enable) {
-		for (nport = 0; nport < UB960_MAX_TX_NPORTS; ++nport) {
-			if (pad_stream_masks[nport] == 0)
-				continue;
-
-			ret = ub960_enable_streams(
-				sd, state, priv->hw_data->num_rxports + nport,
-				pad_stream_masks[nport]);
-
-			if (ret) {
-				while (nport--) {
-					if (pad_stream_masks[nport] == 0)
-						continue;
-
-					ub960_disable_streams(
-						sd, state,
-						priv->hw_data->num_rxports +
-							nport,
-						pad_stream_masks[nport]);
-				}
-
-				break;
-			}
-		}
-	} else {
-		for (nport = 0; nport < UB960_MAX_TX_NPORTS; ++nport) {
-			if (pad_stream_masks[nport] == 0)
-				continue;
-
-			ub960_disable_streams(sd, state,
-					      priv->hw_data->num_rxports + nport,
-					      pad_stream_masks[nport]);
-		}
-	}
-
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
-}
-
-static const struct v4l2_subdev_video_ops ub960_video_ops = {
-	.s_stream = ub960_s_stream,
-};
-
 static int _ub960_set_routing(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_krouting *routing)
 {
-	const struct v4l2_mbus_framefmt format = {
+	static const struct v4l2_mbus_framefmt format = {
 		.width = 640,
 		.height = 480,
-		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.field = V4L2_FIELD_NONE,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.ycbcr_enc = V4L2_YCBCR_ENC_601,
@@ -2822,12 +2817,9 @@ static int _ub960_set_routing(struct v4l2_subdev *sd,
 	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
 		return -E2BIG;
 
-	/*
-	 * TODO: We need a new flag to validate that all streams from a sink pad
-	 * go to a single source pad.
-	 */
 	ret = v4l2_subdev_routing_validate(sd, routing,
-					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX);
 	if (ret)
 		return ret;
 
@@ -2855,12 +2847,11 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_frame_desc *fd)
 {
 	struct ub960_data *priv = sd_to_ub960(sd);
-	const struct v4l2_subdev_krouting *routing;
 	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
 	int ret = 0;
 	struct device *dev = &priv->client->dev;
-	u8 vc_map[UB960_MAX_RX_NPORTS] = { };
+	u8 vc_map[UB960_MAX_RX_NPORTS] = {};
 
 	if (!ub960_pad_is_source(priv, pad))
 		return -EINVAL;
@@ -2873,9 +2864,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	ub960_get_vc_maps(priv, state, vc_map);
 
-	routing = &state->routing;
-
-	for_each_active_route(routing, route) {
+	for_each_active_route(&state->routing, route) {
 		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
 		struct v4l2_mbus_frame_desc source_fd;
 		unsigned int nport;
@@ -2886,9 +2875,9 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 		nport = ub960_pad_to_port(priv, route->sink_pad);
 
-		ret = v4l2_subdev_call(priv->rxports[nport]->source_sd, pad,
+		ret = v4l2_subdev_call(priv->rxports[nport]->source.sd, pad,
 				       get_frame_desc,
-				       priv->rxports[nport]->source_sd_pad,
+				       priv->rxports[nport]->source.pad,
 				       &source_fd);
 		if (ret) {
 			dev_err(dev,
@@ -2897,11 +2886,12 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			goto out_unlock;
 		}
 
-		for (i = 0; i < source_fd.num_entries; ++i)
+		for (i = 0; i < source_fd.num_entries; ++i) {
 			if (source_fd.entry[i].stream == route->sink_stream) {
 				source_entry = &source_fd.entry[i];
 				break;
 			}
+		}
 
 		if (!source_entry) {
 			dev_err(dev,
@@ -2966,7 +2956,12 @@ static int ub960_set_fmt(struct v4l2_subdev *sd,
 	if (ub960_pad_is_source(priv, format->pad))
 		return v4l2_subdev_get_fmt(sd, state, format);
 
-	/* TODO: implement fmt validation */
+	/*
+	 * Default to the first format if the requested media bus code isn't
+	 * supported.
+	 */
+	if (!ub960_find_format(format->format.code))
+		format->format.code = ub960_formats[0].code;
 
 	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
 						  format->stream);
@@ -3027,12 +3022,14 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 	struct device *dev = &priv->client->dev;
 	struct v4l2_subdev_state *state;
 	unsigned int nport;
-	u8 v = 0, v1 = 0, v2 = 0;
+	unsigned int i;
+	u16 v16 = 0;
+	u8 v = 0;
 	u8 id[7];
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	for (unsigned int i = 0; i < 6; ++i)
+	for (i = 0; i < 6; ++i)
 		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
 	id[6] = 0;
 
@@ -3048,25 +3045,21 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			continue;
 		}
 
-		ub960_csiport_read(priv, nport, UB960_TR_CSI_STS, &v);
+		ub960_txport_read(priv, nport, UB960_TR_CSI_STS, &v);
 		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1),
 			 v & (u8)BIT(0));
 
-		ub960_read(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport), &v1);
-		ub960_read(priv, UB960_SR_CSI_FRAME_COUNT_LO(nport), &v2);
-		dev_info(dev, "\tframe counter %u\n", (v1 << 8) | v2);
+		ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport), &v16);
+		dev_info(dev, "\tframe counter %u\n", v16);
 
-		ub960_read(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport), &v1);
-		ub960_read(priv, UB960_SR_CSI_FRAME_ERR_COUNT_LO(nport), &v2);
-		dev_info(dev, "\tframe error counter %u\n", (v1 << 8) | v2);
+		ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport), &v16);
+		dev_info(dev, "\tframe error counter %u\n", v16);
 
-		ub960_read(priv, UB960_SR_CSI_LINE_COUNT_HI(nport), &v1);
-		ub960_read(priv, UB960_SR_CSI_LINE_COUNT_LO(nport), &v2);
-		dev_info(dev, "\tline counter %u\n", (v1 << 8) | v2);
+		ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport), &v16);
+		dev_info(dev, "\tline counter %u\n", v16);
 
-		ub960_read(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport), &v1);
-		ub960_read(priv, UB960_SR_CSI_LINE_ERR_COUNT_LO(nport), &v2);
-		dev_info(dev, "\tline error counter %u\n", (v1 << 8) | v2);
+		ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport), &v16);
+		dev_info(dev, "\tline error counter %u\n", v16);
 	}
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
@@ -3093,22 +3086,17 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v);
 		dev_info(dev, "\trx_port_sts2 %#02x\n", v);
 
-		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
-		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);
-		dev_info(dev, "\tlink freq %u MHz\n",
-			 v1 * 1000000 + v2 * 1000000 / 256);
+		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v16);
+		dev_info(dev, "\tlink freq %llu Hz\n", (v16 * 1000000ULL) >> 8);
 
-		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
-		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
-		dev_info(dev, "\tparity errors %u\n", (v1 << 8) | v2);
+		ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v16);
+		dev_info(dev, "\tparity errors %u\n", v16);
 
-		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_HI, &v1);
-		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_LO, &v2);
-		dev_info(dev, "\tlines per frame %u\n", (v1 << 8) | v2);
+		ub960_rxport_read16(priv, nport, UB960_RR_LINE_COUNT_HI, &v16);
+		dev_info(dev, "\tlines per frame %u\n", v16);
 
-		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_1, &v1);
-		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_0, &v2);
-		dev_info(dev, "\tbytes per line %u\n", (v1 << 8) | v2);
+		ub960_rxport_read16(priv, nport, UB960_RR_LINE_LEN_1, &v16);
+		dev_info(dev, "\tbytes per line %u\n", v16);
 
 		ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
 		dev_info(dev, "\tcsi_err_counter %u\n", v);
@@ -3180,7 +3168,6 @@ static const struct v4l2_subdev_core_ops ub960_subdev_core_ops = {
 
 static const struct v4l2_subdev_ops ub960_subdev_ops = {
 	.core = &ub960_subdev_core_ops,
-	.video = &ub960_video_ops,
 	.pad = &ub960_pad_ops,
 };
 
@@ -3190,115 +3177,6 @@ static const struct media_entity_operations ub960_entity_ops = {
 	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
 };
 
-static void ub960_enable_tpg(struct ub960_data *priv, int tpg_num)
-{
-	/*
-	 * Note: no need to write UB960_REG_IND_ACC_CTL: the only indirect
-	 * registers target we use is "CSI-2 Pattern Generator & Timing
-	 * Registers", which is the default
-	 */
-
-	/*
-	 * TPG can only provide a single stream per CSI TX port. If
-	 * multiple streams are currently enabled, only the first
-	 * one will use the TPG, other streams will be halted.
-	 */
-
-	struct v4l2_mbus_framefmt *fmt;
-	u8 vbp, vfp;
-	u16 blank_lines;
-	u16 width;
-	u16 height;
-
-	u16 bytespp = 2; /* For MEDIA_BUS_FMT_UYVY8_1X16 */
-	u8 cbars_idx = tpg_num - TEST_PATTERN_V_COLOR_BARS_1;
-	u8 num_cbars = 1 << cbars_idx;
-
-	u16 line_size;	/* Line size [bytes] */
-	u16 bar_size;	/* cbar size [bytes] */
-	u16 act_lpf;	/* active lines/frame */
-	u16 tot_lpf;	/* tot lines/frame */
-	u16 line_pd;	/* Line period in 10-ns units */
-
-	struct v4l2_subdev_state *state;
-
-	state = v4l2_subdev_get_locked_active_state(&priv->sd);
-
-	vbp = 33;
-	vfp = 10;
-	blank_lines = vbp + vfp + 2; /* total blanking lines */
-
-	fmt = v4l2_subdev_state_get_stream_format(state, 4, 0);
-	if (!fmt) {
-		dev_err(&priv->client->dev, "failed to enable TPG\n");
-		return;
-	}
-
-	width = fmt->width;
-	height = fmt->height;
-
-	line_size = width * bytespp;
-	bar_size = line_size / num_cbars;
-	act_lpf = height;
-	tot_lpf = act_lpf + blank_lines;
-	line_pd = 100000000 / 60 / tot_lpf;
-
-	/* Disable forwarding from FPD-3 RX ports */
-	ub960_read(priv, UB960_SR_FWD_CTL1, &priv->stored_fwd_ctl);
-	ub960_write(priv, UB960_SR_FWD_CTL1, 0xf << 4);
-
-	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CTL,
-			UB960_IR_PGEN_CTL_PGEN_ENABLE);
-
-	/* YUV422 8bit: 2 bytes/block, CSI-2 data type 0x1e */
-	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CFG,
-			cbars_idx << 4 | 0x2);
-	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CSI_DI,
-			0x1e);
-
-	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
-			  UB960_IR_PGEN_LINE_SIZE1, line_size);
-	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
-			  UB960_IR_PGEN_BAR_SIZE1, bar_size);
-	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
-			  UB960_IR_PGEN_ACT_LPF1, act_lpf);
-	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
-			  UB960_IR_PGEN_TOT_LPF1, tot_lpf);
-	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
-			  UB960_IR_PGEN_LINE_PD1, line_pd);
-	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_VBP, vbp);
-	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_VFP, vfp);
-}
-
-static void ub960_disable_tpg(struct ub960_data *priv)
-{
-	/* TPG off, enable forwarding from FPD-3 RX ports */
-	ub960_write(priv, UB960_SR_FWD_CTL1, priv->stored_fwd_ctl);
-
-	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CTL, 0x00);
-}
-
-static int ub960_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct ub960_data *priv =
-		container_of(ctrl->handler, struct ub960_data, ctrl_handler);
-
-	switch (ctrl->id) {
-	case V4L2_CID_TEST_PATTERN:
-		if (ctrl->val == 0)
-			ub960_disable_tpg(priv);
-		else
-			ub960_enable_tpg(priv, ctrl->val);
-		break;
-	}
-
-	return 0;
-}
-
-static const struct v4l2_ctrl_ops ub960_ctrl_ops = {
-	.s_ctrl = ub960_s_ctrl,
-};
-
 /* -----------------------------------------------------------------------------
  * Core
  */
@@ -3317,7 +3195,9 @@ static irqreturn_t ub960_handle_events(int irq, void *arg)
 
 	dev_dbg(&priv->client->dev, "INTERRUPT_STS %x\n", int_sts);
 
-	ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts);
+	ret = ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts);
+	if (ret)
+		return IRQ_NONE;
 
 	dev_dbg(&priv->client->dev, "FWD_STS %#02x\n", fwd_sts);
 
@@ -3353,7 +3233,7 @@ static void ub960_txport_free_ports(struct ub960_data *priv)
 {
 	unsigned int nport;
 
-	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
+	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
 		struct ub960_txport *txport = priv->txports[nport];
 
 		if (!txport)
@@ -3368,14 +3248,14 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
 {
 	unsigned int nport;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport)
 			continue;
 
-		fwnode_handle_put(rxport->source_ep_fwnode);
-		fwnode_handle_put(rxport->remote_fwnode);
+		fwnode_handle_put(rxport->source.ep_fwnode);
+		fwnode_handle_put(rxport->ser.fwnode);
 
 		kfree(rxport);
 		priv->rxports[nport] = NULL;
@@ -3386,6 +3266,7 @@ static int ub960_parse_dt_base(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
 	size_t table_size;
+	unsigned int i;
 	u16 *aliases;
 	int ret;
 
@@ -3397,15 +3278,15 @@ static int ub960_parse_dt_base(struct ub960_data *priv)
 	}
 
 	table_size = ret;
-	priv->atr_alias_table.num_entries = ret;
+	priv->atr.num_aliases = ret;
 
 	if (!table_size)
 		return 0;
 
-	priv->atr_alias_table.entries =
-		devm_kcalloc(dev, table_size,
-			     sizeof(struct atr_alias_table_entry), GFP_KERNEL);
-	if (!priv->atr_alias_table.entries)
+	priv->atr.aliases = devm_kcalloc(dev, table_size,
+					 sizeof(struct atr_alias_table_entry),
+					 GFP_KERNEL);
+	if (!priv->atr.aliases)
 		return -ENOMEM;
 
 	aliases = kcalloc(table_size, sizeof(u16), GFP_KERNEL);
@@ -3421,8 +3302,8 @@ static int ub960_parse_dt_base(struct ub960_data *priv)
 		return ret;
 	}
 
-	for (unsigned int i = 0; i < table_size; ++i)
-		priv->atr_alias_table.entries[i].alias_id = aliases[i];
+	for (i = 0; i < table_size; ++i)
+		priv->atr.aliases[i].alias_id = aliases[i];
 
 	kfree(aliases);
 
@@ -3445,12 +3326,12 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 	u32 ser_i2c_alias;
 	int ret;
 
+	cdr_mode = RXPORT_CDR_FPD3;
+
 	ret = fwnode_property_read_u32(link_fwnode, "ti,cdr-mode", &cdr_mode);
-	if (ret == -EINVAL) {
-		cdr_mode = RXPORT_CDR_FPD3;
-	} else if (ret < 0) {
-		dev_err(dev, "rx%u: failed to read 'ti,cdr-mode': %d\n", nport,
-			ret);
+	if (ret < 0 && ret != -EINVAL) {
+		dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
+			"ti,cdr-mode", ret);
 		return ret;
 	}
 
@@ -3468,8 +3349,8 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 
 	ret = fwnode_property_read_u32(link_fwnode, "ti,rx-mode", &rx_mode);
 	if (ret < 0) {
-		dev_err(dev, "rx%u: failed to read 'ti,rx-mode': %d\n", nport,
-			ret);
+		dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
+			"ti,rx-mode", ret);
 		return ret;
 	}
 
@@ -3478,6 +3359,17 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 		return -EINVAL;
 	}
 
+	switch (rx_mode) {
+	case RXPORT_MODE_RAW12_HF:
+	case RXPORT_MODE_RAW12_LF:
+	case RXPORT_MODE_CSI2_ASYNC:
+		dev_err(dev, "rx%u: unsupported 'ti,rx-mode' %u\n", nport,
+			rx_mode);
+		return -EINVAL;
+	default:
+		break;
+	}
+
 	rxport->rx_mode = rx_mode;
 
 	/* EQ & Strobe related */
@@ -3491,9 +3383,8 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 				       &strobe_pos);
 	if (ret) {
 		if (ret != -EINVAL) {
-			dev_err(dev,
-				"rx%u: failed to read 'ti,strobe-pos': %d\n",
-				nport, ret);
+			dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
+				"ti,strobe-pos", ret);
 			return ret;
 		}
 	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
@@ -3512,8 +3403,8 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
 	if (ret) {
 		if (ret != -EINVAL) {
-			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
-				nport, ret);
+			dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
+				"ti,eq-level", ret);
 			return ret;
 		}
 	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
@@ -3527,14 +3418,14 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 	ret = fwnode_property_read_u32(link_fwnode, "i2c-alias",
 				       &ser_i2c_alias);
 	if (ret) {
-		dev_err(dev, "rx%u: failed to read 'i2c-alias': %d\n", nport,
-			ret);
+		dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
+			"i2c-alias", ret);
 		return ret;
 	}
-	rxport->ser_alias = ser_i2c_alias;
+	rxport->ser.alias = ser_i2c_alias;
 
-	rxport->remote_fwnode = fwnode_get_named_child_node(link_fwnode, "serializer");
-	if (!rxport->remote_fwnode) {
+	rxport->ser.fwnode = fwnode_get_named_child_node(link_fwnode, "serializer");
+	if (!rxport->ser.fwnode) {
 		dev_err(dev, "rx%u: missing 'serializer' node\n", nport);
 		return -EINVAL;
 	}
@@ -3547,12 +3438,14 @@ static int ub960_parse_dt_rxport_ep_properties(struct ub960_data *priv,
 					       struct ub960_rxport *rxport)
 {
 	struct device *dev = &priv->client->dev;
+	struct v4l2_fwnode_endpoint vep = {};
 	unsigned int nport = rxport->nport;
+	bool hsync_hi;
+	bool vsync_hi;
 	int ret;
-	u32 v;
 
-	rxport->source_ep_fwnode = fwnode_graph_get_remote_endpoint(ep_fwnode);
-	if (!rxport->source_ep_fwnode) {
+	rxport->source.ep_fwnode = fwnode_graph_get_remote_endpoint(ep_fwnode);
+	if (!rxport->source.ep_fwnode) {
 		dev_err(dev, "rx%u: no remote endpoint\n", nport);
 		return -ENODEV;
 	}
@@ -3568,28 +3461,24 @@ static int ub960_parse_dt_rxport_ep_properties(struct ub960_data *priv,
 		return 0;
 	}
 
-	ret = fwnode_property_read_u32(ep_fwnode, "hsync-active", &v);
+	vep.bus_type = V4L2_MBUS_PARALLEL;
+	ret = v4l2_fwnode_endpoint_parse(ep_fwnode, &vep);
 	if (ret) {
-		dev_err(dev, "rx%u: failed to parse 'hsync-active': %d\n",
-			nport, ret);
+		dev_err(dev, "rx%u: failed to parse endpoint data\n", nport);
 		goto err_put_source_ep_fwnode;
 	}
 
-	rxport->lv_fv_pol |= v ? UB960_RR_PORT_CONFIG2_LV_POL_LOW : 0;
+	hsync_hi = !!(vep.bus.parallel.flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH);
+	vsync_hi = !!(vep.bus.parallel.flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH);
 
-	ret = fwnode_property_read_u32(ep_fwnode, "vsync-active", &v);
-	if (ret) {
-		dev_err(dev, "rx%u: failed to parse 'vsync-active': %d\n",
-			nport, ret);
-		goto err_put_source_ep_fwnode;
-	}
-
-	rxport->lv_fv_pol |= v ? UB960_RR_PORT_CONFIG2_FV_POL_LOW : 0;
+	/* LineValid and FrameValid are inverse to the h/vsync active */
+	rxport->lv_fv_pol = (hsync_hi ? UB960_RR_PORT_CONFIG2_LV_POL_LOW : 0) |
+			    (vsync_hi ? UB960_RR_PORT_CONFIG2_FV_POL_LOW : 0);
 
 	return 0;
 
 err_put_source_ep_fwnode:
-	fwnode_handle_put(rxport->source_ep_fwnode);
+	fwnode_handle_put(rxport->source.ep_fwnode);
 	return ret;
 }
 
@@ -3597,8 +3486,8 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
 				 struct fwnode_handle *link_fwnode,
 				 struct fwnode_handle *ep_fwnode)
 {
-	const char *vpoc_names[UB960_MAX_RX_NPORTS] = { "vpoc0", "vpoc1",
-							"vpoc2", "vpoc3" };
+	static const char *vpoc_names[UB960_MAX_RX_NPORTS] = { "vpoc0", "vpoc1",
+							       "vpoc2", "vpoc3" };
 	struct device *dev = &priv->client->dev;
 	struct ub960_rxport *rxport;
 	int ret;
@@ -3635,7 +3524,7 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
 	return 0;
 
 err_put_remote_fwnode:
-	fwnode_handle_put(rxport->remote_fwnode);
+	fwnode_handle_put(rxport->ser.fwnode);
 err_free_rxport:
 	priv->rxports[nport] = NULL;
 	kfree(rxport);
@@ -3661,10 +3550,8 @@ ub960_fwnode_get_link_by_regs(struct fwnode_handle *links_fwnode,
 			return NULL;
 		}
 
-		if (nport == link_num) {
-			fwnode_handle_put(link_fwnode);
+		if (nport == link_num)
 			return link_fwnode;
-		}
 	}
 
 	return NULL;
@@ -3733,10 +3620,11 @@ static int ub960_parse_dt_txports(struct ub960_data *priv)
 	int ret;
 
 	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
+		unsigned int port = nport + priv->hw_data->num_rxports;
 		struct fwnode_handle *ep_fwnode;
 
 		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
-			nport + priv->hw_data->num_rxports, 0, 0);
+							    port, 0, 0);
 		if (!ep_fwnode)
 			continue;
 
@@ -3787,40 +3675,34 @@ static int ub960_notify_bound(struct v4l2_async_notifier *notifier,
 	int ret;
 
 	ret = media_entity_get_fwnode_pad(&subdev->entity,
-					  rxport->source_ep_fwnode,
+					  rxport->source.ep_fwnode,
 					  MEDIA_PAD_FL_SOURCE);
 	if (ret < 0) {
 		dev_err(dev, "Failed to find pad for %s\n", subdev->name);
 		return ret;
 	}
 
-	rxport->source_sd = subdev;
-	rxport->source_sd_pad = ret;
+	rxport->source.sd = subdev;
+	rxport->source.pad = ret;
 
-	ret = media_create_pad_link(&rxport->source_sd->entity,
-				    rxport->source_sd_pad, &priv->sd.entity,
-				    nport,
+	ret = media_create_pad_link(&rxport->source.sd->entity,
+				    rxport->source.pad, &priv->sd.entity, nport,
 				    MEDIA_LNK_FL_ENABLED |
 					    MEDIA_LNK_FL_IMMUTABLE);
 	if (ret) {
 		dev_err(dev, "Unable to link %s:%u -> %s:%u\n",
-			rxport->source_sd->name, rxport->source_sd_pad,
+			rxport->source.sd->name, rxport->source.pad,
 			priv->sd.name, nport);
 		return ret;
 	}
 
-	dev_dbg(dev, "Bound %s pad: %u on index %u\n", subdev->name,
-		rxport->source_sd_pad, nport);
-
 	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
-		if (priv->rxports[i] && !priv->rxports[i]->source_sd) {
+		if (priv->rxports[i] && !priv->rxports[i]->source.sd) {
 			dev_dbg(dev, "Waiting for more subdevs to be bound\n");
 			return 0;
 		}
 	}
 
-	dev_dbg(dev, "All subdevs bound\n");
-
 	return 0;
 }
 
@@ -3830,7 +3712,7 @@ static void ub960_notify_unbind(struct v4l2_async_notifier *notifier,
 {
 	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
 
-	rxport->source_sd = NULL;
+	rxport->source.sd = NULL;
 }
 
 static const struct v4l2_async_notifier_operations ub960_notify_ops = {
@@ -3854,7 +3736,7 @@ static int ub960_v4l2_notifier_register(struct ub960_data *priv)
 			continue;
 
 		asd = v4l2_async_nf_add_fwnode(&priv->notifier,
-					       rxport->source_ep_fwnode,
+					       rxport->source.ep_fwnode,
 					       struct ub960_asd);
 		if (IS_ERR(asd)) {
 			dev_err(dev, "Failed to add subdev for source %u: %pe",
@@ -3891,14 +3773,10 @@ static int ub960_create_subdev(struct ub960_data *priv)
 	int ret;
 
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub960_subdev_ops);
+
 	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
 	priv->sd.ctrl_handler = &priv->ctrl_handler;
 
-	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &ub960_ctrl_ops,
-				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(ub960_tpg_qmenu) - 1, 0, 0,
-				     ub960_tpg_qmenu);
-
 	v4l2_ctrl_new_int_menu(&priv->ctrl_handler, NULL, V4L2_CID_LINK_FREQ,
 			       ARRAY_SIZE(priv->tx_link_freq) - 1, 0,
 			       priv->tx_link_freq);
@@ -3913,7 +3791,7 @@ static int ub960_create_subdev(struct ub960_data *priv)
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &ub960_entity_ops;
 
-	for (i = 0; i < priv->hw_data->num_rxports + priv->hw_data->num_txports; i++) {
+	for (i = 0; i < priv->hw_data->num_rxports + priv->hw_data->num_txports; ++i) {
 		priv->pads[i].flags = ub960_pad_is_sink(priv, i) ?
 					      MEDIA_PAD_FL_SINK :
 					      MEDIA_PAD_FL_SOURCE;
@@ -3935,7 +3813,7 @@ static int ub960_create_subdev(struct ub960_data *priv)
 	ret = ub960_v4l2_notifier_register(priv);
 	if (ret) {
 		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
-		goto err_free_state;
+		goto err_subdev_cleanup;
 	}
 
 	ret = v4l2_async_register_subdev(&priv->sd);
@@ -3948,7 +3826,7 @@ static int ub960_create_subdev(struct ub960_data *priv)
 
 err_unreg_notif:
 	ub960_v4l2_notifier_unregister(priv);
-err_free_state:
+err_subdev_cleanup:
 	v4l2_subdev_cleanup(&priv->sd);
 err_entity_cleanup:
 	media_entity_cleanup(&priv->sd.entity);
@@ -4057,10 +3935,10 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (priv->pd_gpio) {
 		gpiod_set_value_cansleep(priv->pd_gpio, 1);
 		/* wait min 2 ms for reset to complete */
-		usleep_range(2000, 5000);
+		fsleep(2000);
 		gpiod_set_value_cansleep(priv->pd_gpio, 0);
 		/* wait min 2 ms for power up to finish */
-		usleep_range(2000, 5000);
+		fsleep(2000);
 	}
 
 	ub960_reset(priv, true);
@@ -4088,7 +3966,18 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		clk_get_rate(priv->refclk) / 1000000);
 
 	/* Disable all RX ports by default */
-	ub960_write(priv, UB960_SR_RX_PORT_CTL, 0);
+	ret = ub960_write(priv, UB960_SR_RX_PORT_CTL, 0);
+	if (ret)
+		goto err_pd_gpio;
+
+	/* release GPIO lock */
+	if (priv->hw_data->is_ub9702) {
+		ret = ub960_update_bits(priv, UB960_SR_RESET,
+					UB960_SR_RESET_GPIO_LOCK_RELEASE,
+					UB960_SR_RESET_GPIO_LOCK_RELEASE);
+		if (ret)
+			goto err_pd_gpio;
+	}
 
 	return 0;
 
@@ -4112,6 +4001,9 @@ static int ub960_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ub960_data *priv;
+	unsigned int port_lock_mask;
+	unsigned int port_mask;
+	unsigned int nport;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -4123,7 +4015,7 @@ static int ub960_probe(struct i2c_client *client)
 	priv->hw_data = device_get_match_data(dev);
 
 	mutex_init(&priv->reg_lock);
-	mutex_init(&priv->atr_alias_table.lock);
+	mutex_init(&priv->atr.lock);
 
 	INIT_DELAYED_WORK(&priv->poll_work, ub960_handler_work);
 
@@ -4131,11 +4023,9 @@ static int ub960_probe(struct i2c_client *client)
 	 * Initialize these to invalid values so that the first reg writes will
 	 * configure the target.
 	 */
-	priv->current_indirect_target = 0xff;
-	priv->current_read_rxport = 0xff;
-	priv->current_write_rxport_mask = 0xff;
-	priv->current_read_csiport = 0xff;
-	priv->current_write_csiport_mask = 0xff;
+	priv->reg_current.indirect_target = 0xff;
+	priv->reg_current.rxport = 0xff;
+	priv->reg_current.txport = 0xff;
 
 	ret = ub960_get_hw_resources(priv);
 	if (ret)
@@ -4145,12 +4035,6 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_mutex_destroy;
 
-	/* release GPIO lock */
-	if (priv->hw_data->is_ub9702)
-		ub960_update_bits(priv, UB960_SR_RESET,
-				  UB960_SR_RESET_GPIO_LOCK_RELEASE,
-				  UB960_SR_RESET_GPIO_LOCK_RELEASE);
-
 	ret = ub960_parse_dt(priv);
 	if (ret)
 		goto err_disable_core_hw;
@@ -4169,7 +4053,26 @@ static int ub960_probe(struct i2c_client *client)
 
 	ub960_reset(priv, false);
 
-	ub960_rxport_wait_locks(priv, GENMASK(3, 0), NULL);
+	port_mask = 0;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+
+		if (!rxport)
+			continue;
+
+		port_mask |= BIT(nport);
+	}
+
+	ret = ub960_rxport_wait_locks(priv, port_mask, &port_lock_mask);
+	if (ret)
+		goto err_disable_vpocs;
+
+	if (port_mask != port_lock_mask) {
+		ret = -EIO;
+		dev_err_probe(dev, ret, "Failed to lock all RX ports\n");
+		goto err_disable_vpocs;
+	}
 
 	/*
 	 * Clear any errors caused by switching the RX port settings while
@@ -4209,7 +4112,7 @@ static int ub960_probe(struct i2c_client *client)
 err_disable_core_hw:
 	ub960_disable_core_hw(priv);
 err_mutex_destroy:
-	mutex_destroy(&priv->atr_alias_table.lock);
+	mutex_destroy(&priv->atr.lock);
 	mutex_destroy(&priv->reg_lock);
 	return ret;
 }
@@ -4228,7 +4131,7 @@ static void ub960_remove(struct i2c_client *client)
 	ub960_rxport_free_ports(priv);
 	ub960_txport_free_ports(priv);
 	ub960_disable_core_hw(priv);
-	mutex_destroy(&priv->atr_alias_table.lock);
+	mutex_destroy(&priv->atr.lock);
 	mutex_destroy(&priv->reg_lock);
 }
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index dd3c2d86f96e..e513b859a7df 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1661,10 +1661,11 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 		}
 
 		/*
-		 * V4L2_SUBDEV_ROUTING_NO_STREAM_MIX: Streams on the same pad
-		 * may not be routed to streams on different pads.
+		 * V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX: Streams on the same
+		 * sink pad may not be routed to streams on different source
+		 * pads.
 		 */
-		if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
+		if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
 			if (remote_pads[route->sink_pad] != U32_MAX &&
 			    remote_pads[route->sink_pad] != route->source_pad) {
 				dev_dbg(sd->dev,
@@ -1673,6 +1674,15 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				goto out;
 			}
 
+			remote_pads[route->sink_pad] = route->source_pad;
+		}
+
+		/*
+		 * V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX: Streams on the same
+		 * source pad may not be routed to streams on different sink
+		 * pads.
+		 */
+		if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
 			if (remote_pads[route->source_pad] != U32_MAX &&
 			    remote_pads[route->source_pad] != route->sink_pad) {
 				dev_dbg(sd->dev,
@@ -1681,7 +1691,6 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				goto out;
 			}
 
-			remote_pads[route->sink_pad] = route->source_pad;
 			remote_pads[route->source_pad] = route->sink_pad;
 		}
 
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 721d08a6ff9b..7596f70ce1ab 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -67,6 +67,8 @@ void i2c_atr_delete(struct i2c_atr *atr);
  * @atr:        The I2C ATR
  * @chan_id:    Index of the new adapter (0 .. max_adapters-1).  This value is
  *              passed to the callbacks in `struct i2c_atr_ops`.
+ * @adapter_parent: The device used as the parent of the new i2c adapter, or NULL
+ *                  to use the i2c-atr device as the parent.
  * @bus_handle: The fwnode handle that points to the adapter's i2c
  *              peripherals, or NULL.
  *
@@ -84,6 +86,7 @@ void i2c_atr_delete(struct i2c_atr *atr);
  * Return: 0 on success, a negative error code otherwise.
  */
 int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
+			struct device *adapter_parent,
 			struct fwnode_handle *bus_handle);
 
 /**
diff --git a/include/media/i2c/ds90ub9xx.h b/include/media/i2c/ds90ub9xx.h
index 42d47d732c03..0245198469ec 100644
--- a/include/media/i2c/ds90ub9xx.h
+++ b/include/media/i2c/ds90ub9xx.h
@@ -7,6 +7,12 @@
 
 struct i2c_atr;
 
+/**
+ * struct ds90ub9xx_platform_data - platform data for FPD-Link Serializers.
+ * @port: Deserializer RX port for this Serializer
+ * @atr: I2C ATR
+ * @bc_rate: back-channel clock rate
+ */
 struct ds90ub9xx_platform_data {
 	u32 port;
 	struct i2c_atr *atr;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 6a77aa9bb1da..f11103122e53 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1638,19 +1638,29 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
  * @V4L2_SUBDEV_ROUTING_NO_N_TO_1:
  *	multiple input streams may not be routed to the same output stream
  *	(stream merging)
- * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
- *	streams on the same pad may not be routed to streams on different pads
+ * @V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX:
+ *	streams on the same sink pad may not be routed to streams on different
+ *	source pads
+ * @V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX:
+ *	streams on the same source pad may not be routed to streams on different
+ *	sink pads
  * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
  *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
  *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
+ * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
+ *	streams on the same pad may not be routed to streams on different pads
  */
 enum v4l2_subdev_routing_restriction {
 	V4L2_SUBDEV_ROUTING_NO_1_TO_N = BIT(0),
 	V4L2_SUBDEV_ROUTING_NO_N_TO_1 = BIT(1),
-	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX = BIT(2),
+	V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX = BIT(2),
+	V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX = BIT(3),
 	V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 =
 		V4L2_SUBDEV_ROUTING_NO_1_TO_N |
 		V4L2_SUBDEV_ROUTING_NO_N_TO_1,
+	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX =
+		V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX |
+		V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX,
 };
 
 /**
-- 
2.34.1

