Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD05E69F564
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Feb 2023 14:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbjBVN31 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Feb 2023 08:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbjBVN3Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Feb 2023 08:29:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5FF838E9E;
        Wed, 22 Feb 2023 05:29:21 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBDE74B0;
        Wed, 22 Feb 2023 14:29:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677072559;
        bh=22MCmKAGX8N5zGzQmVLynYxAHPqjV+0/Q9pkTuWBEb4=;
        h=From:To:Cc:Subject:Date:From;
        b=sZcaD4GnWiaSJJwqKv7zBmjSto1PNGXazs+x00RlofgVVlomo11OtJBoghL8motMr
         h+u5gLoe/NfvBuJQudVAQzphNWnIHWryZBzttDlo3s4qqQ92El5Xb6IiRA/THa/hyo
         2hxoENyv7cCo4u7Z1uDNglYRNvZnD4RPgwysp7A0=
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
Subject: [PATCH v10 0/8] i2c-atr and FPDLink
Date:   Wed, 22 Feb 2023 15:28:59 +0200
Message-Id: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
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

You can find v9 from:

https://lore.kernel.org/all/20230216140747.445477-1-tomi.valkeinen@ideasonboard.com/

Diff to v9 included below.

Main changes in v10:
- Switch pre-increments to post-increments
- Add macros for FPD3_RX_ID lengths
- Use regmap_bulk_read in 16 bit reg accessors

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
 drivers/i2c/i2c-atr.c                         |  548 +++
 drivers/media/i2c/Kconfig                     |   47 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub913.c                 |  906 ++++
 drivers/media/i2c/ds90ub953.c                 | 1400 ++++++
 drivers/media/i2c/ds90ub960.c                 | 4172 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         |   17 +-
 include/linux/i2c-atr.h                       |  116 +
 include/media/i2c/ds90ub9xx.h                 |   22 +
 include/media/v4l2-subdev.h                   |   16 +-
 18 files changed, 8062 insertions(+), 7 deletions(-)
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

Interdiff against v9:
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index a41e941ad972..5ab890b83670 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -298,8 +298,11 @@ static void i2c_atr_detach_client(struct i2c_adapter *adapter,
 	atr->ops->detach_client(atr, chan->chan_id, client);
 
 	c2a = i2c_atr_find_mapping_by_client(&chan->alias_list, client);
-	if (!c2a)
-		return; /* This shouldn't happen */
+	if (!c2a) {
+		 /* This should never happen */
+		dev_warn(atr->dev, "Unable to find address mapping\n");
+		return;
+	}
 
 	dev_dbg(atr->dev,
 		"chan%u: client 0x%02x unmapped from alias 0x%02x (%s)\n",
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index f7696bce7c77..203f7cceae23 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -108,7 +108,7 @@ static const struct ub913_format_info *ub913_find_format(u32 incode)
 {
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(ub913_formats); ++i) {
+	for (i = 0; i < ARRAY_SIZE(ub913_formats); i++) {
 		if (ub913_formats[i].incode == incode)
 			return &ub913_formats[i];
 	}
@@ -276,7 +276,7 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_krouting *routing)
 {
-	static const struct v4l2_mbus_framefmt informat = {
+	static const struct v4l2_mbus_framefmt in_format = {
 		.width = 640,
 		.height = 480,
 		.code = MEDIA_BUS_FMT_UYVY8_2X8,
@@ -286,7 +286,7 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
 		.xfer_func = V4L2_XFER_FUNC_SRGB,
 	};
-	static const struct v4l2_mbus_framefmt outformat = {
+	static const struct v4l2_mbus_framefmt out_format = {
 		.width = 640,
 		.height = 480,
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
@@ -319,11 +319,11 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 
 	stream_configs = &state->stream_configs;
 
-	for (i = 0; i < stream_configs->num_configs; ++i) {
+	for (i = 0; i < stream_configs->num_configs; i++) {
 		if (stream_configs->configs[i].pad == UB913_PAD_SINK)
-			stream_configs->configs[i].fmt = informat;
+			stream_configs->configs[i].fmt = in_format;
 		else
-			stream_configs->configs[i].fmt = outformat;
+			stream_configs->configs[i].fmt = out_format;
 	}
 
 	return 0;
@@ -374,7 +374,7 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		if (route->source_pad != pad)
 			continue;
 
-		for (i = 0; i < source_fd.num_entries; ++i) {
+		for (i = 0; i < source_fd.num_entries; i++) {
 			if (source_fd.entry[i].stream == route->sink_stream)
 				break;
 		}
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 6efe1460c976..a77908da5c38 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -87,6 +87,7 @@
 #define UB953_REG_IND_ACC_DATA			0xb2
 
 #define UB953_REG_FPD3_RX_ID(n)			(0xf0 + (n))
+#define UB953_REG_FPD3_RX_ID_LEN		6
 
 /* Indirect register blocks */
 #define UB953_IND_TARGET_PAT_GEN		0x00
@@ -272,14 +273,14 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 
 	ret = ub953_select_ind_reg_block(priv, block);
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
@@ -289,7 +290,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 			block, reg, ret);
 	}
 
-out:
+out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
 	return ret;
@@ -498,7 +499,7 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		if (route->source_pad != pad)
 			continue;
 
-		for (i = 0; i < source_fd.num_entries; ++i) {
+		for (i = 0; i < source_fd.num_entries; i++) {
 			if (source_fd.entry[i].stream == route->sink_stream) {
 				source_entry = &source_fd.entry[i];
 				break;
@@ -591,16 +592,15 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	struct device *dev = &priv->client->dev;
 	u8 v = 0, v1 = 0, v2 = 0;
 	unsigned int i;
-	char id[7];
+	char id[UB953_REG_FPD3_RX_ID_LEN];
 	u8 gpio_local_data;
 	u8 gpio_input_ctrl;
 	u8 gpio_pin_sts;
 
-	for (i = 0; i < 6; ++i)
+	for (i = 0; i < sizeof(id); i++)
 		ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i]);
-	id[6] = 0;
 
-	dev_info(dev, "ID '%s'\n", id);
+	dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
 
 	ub953_read(priv, UB953_REG_GENERAL_STATUS, &v);
 	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
@@ -638,7 +638,7 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl);
 	ub953_read(priv, UB953_REG_GPIO_PIN_STS, &gpio_pin_sts);
 
-	for (i = 0; i < UB953_NUM_GPIOS; ++i) {
+	for (i = 0; i < UB953_NUM_GPIOS; i++) {
 		dev_info(dev,
 			 "GPIO%u: remote: %u is_input: %u is_output: %u val: %u sts: %u\n",
 			 i,
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 1ae0c7cda7c7..c9dfe2ea0dfb 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -7,7 +7,7 @@
  */
 
 /*
- * (Possible) TODOs
+ * (Possible) TODOs:
  *
  * - PM for serializer and remote peripherals. We need to manage:
  *   - VPOC
@@ -347,6 +347,7 @@
 #define UB960_RR_CHANNEL_MODE			0xe4	/* UB9702 */
 
 #define UB960_SR_FPD3_RX_ID(n)			(0xf0 + (n))
+#define UB960_SR_FPD3_RX_ID_LEN			6
 
 #define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n)) /* < UB960_FPD_RX_NPORTS */
 
@@ -487,10 +488,11 @@ struct ub960_txport {
 struct atr_alias_table_entry {
 	u16 alias_id;	/* Alias ID from DT */
 
-	bool in_use;
 	u8 nport;
 	u8 slave_id;	/* i2c client's local i2c address */
 	u8 port_reg_idx;
+
+	bool in_use;
 };
 
 struct ub960_data {
@@ -595,7 +597,7 @@ static const struct ub960_format_info *ub960_find_format(u32 code)
 {
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(ub960_formats); ++i) {
+	for (i = 0; i < ARRAY_SIZE(ub960_formats); i++) {
 		if (ub960_formats[i].code == code)
 			return &ub960_formats[i];
 	}
@@ -667,26 +669,19 @@ static int ub960_update_bits(struct ub960_data *priv, u8 reg, u8 mask, u8 val)
 static int ub960_read16(struct ub960_data *priv, u8 reg, u16 *val)
 {
 	struct device *dev = &priv->client->dev;
-	unsigned int v1, v2;
+	__be16 __v;
 	int ret;
 
 	mutex_lock(&priv->reg_lock);
 
-	ret = regmap_read(priv->regmap, reg, &v1);
+	ret = regmap_bulk_read(priv->regmap, reg, &__v, 2);
 	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
 		goto out_unlock;
 	}
 
-	ret = regmap_read(priv->regmap, reg + 1, &v2);
-	if (ret) {
-		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
-			__func__, reg + 1, ret);
-		goto out_unlock;
-	}
-
-	*val = (v1 << 8) | v2;
+	*val = be16_to_cpu(__v);
 
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
@@ -793,8 +788,7 @@ static int ub960_rxport_read16(struct ub960_data *priv, u8 nport, u8 reg,
 			       u16 *val)
 {
 	struct device *dev = &priv->client->dev;
-	unsigned int v1;
-	unsigned int v2;
+	__be16 __v;
 	int ret;
 
 	mutex_lock(&priv->reg_lock);
@@ -803,21 +797,14 @@ static int ub960_rxport_read16(struct ub960_data *priv, u8 nport, u8 reg,
 	if (ret)
 		goto out_unlock;
 
-	ret = regmap_read(priv->regmap, reg, &v1);
+	ret = regmap_bulk_read(priv->regmap, reg, &__v, 2);
 	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
 		goto out_unlock;
 	}
 
-	ret = regmap_read(priv->regmap, reg + 1, &v2);
-	if (ret) {
-		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
-			__func__, reg + 1, ret);
-		goto out_unlock;
-	}
-
-	*val = (v1 << 8) | v2;
+	*val = be16_to_cpu(__v);
 
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
@@ -1072,7 +1059,7 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	 *	2. Construct a bitmask of port's used alias entries
 	 */
 
-	for (pool_idx = 0; pool_idx < priv->atr.num_aliases; ++pool_idx) {
+	for (pool_idx = 0; pool_idx < priv->atr.num_aliases; pool_idx++) {
 		struct atr_alias_table_entry *e;
 
 		e = &priv->atr.aliases[pool_idx];
@@ -1133,7 +1120,7 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 
 	/* Find alias mapped to this client */
 
-	for (pool_idx = 0; pool_idx < priv->atr.num_aliases; ++pool_idx) {
+	for (pool_idx = 0; pool_idx < priv->atr.num_aliases; pool_idx++) {
 		entry = &priv->atr.aliases[pool_idx];
 
 		if (entry->in_use && entry->nport == rxport->nport &&
@@ -1271,7 +1258,7 @@ static int ub960_rxport_enable_vpocs(struct ub960_data *priv)
 	unsigned int nport;
 	int ret;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport || !rxport->vpoc)
@@ -1301,7 +1288,7 @@ static void ub960_rxport_disable_vpocs(struct ub960_data *priv)
 {
 	unsigned int nport;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport || !rxport->vpoc)
@@ -1331,7 +1318,7 @@ static void ub960_clear_rx_errors(struct ub960_data *priv)
 {
 	unsigned int nport;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport)
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++)
 		ub960_rxport_clear_errors(priv, nport);
 }
 
@@ -1768,7 +1755,7 @@ static int ub960_rxport_add_serializers(struct ub960_data *priv)
 	unsigned int nport;
 	int ret;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport)
@@ -1798,7 +1785,7 @@ static void ub960_rxport_remove_serializers(struct ub960_data *priv)
 {
 	unsigned int nport;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport)
@@ -1875,7 +1862,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 		}
 	}
 
-	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
 		struct ub960_txport *txport = priv->txports[nport];
 
 		if (!txport)
@@ -2204,7 +2191,7 @@ static int ub960_init_rx_ports(struct ub960_data *priv)
 {
 	unsigned int nport;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport)
@@ -2432,11 +2419,11 @@ static int ub960_validate_stream_vcs(struct ub960_data *priv)
 	unsigned int nport;
 	unsigned int i;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 		struct v4l2_mbus_frame_desc desc;
 		int ret;
-		u8 cur_vc;
+		u8 vc;
 
 		if (!rxport)
 			continue;
@@ -2449,15 +2436,13 @@ static int ub960_validate_stream_vcs(struct ub960_data *priv)
 		if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
 			continue;
 
-		for (i = 0; i < desc.num_entries; ++i) {
-			u8 vc = desc.entry[i].bus.csi2.vc;
+		if (desc.num_entries == 0)
+			continue;
 
-			if (i == 0) {
-				cur_vc = vc;
-				continue;
-			}
+		vc = desc.entry[0].bus.csi2.vc;
 
-			if (vc == cur_vc)
+		for (i = 1; i < desc.num_entries; i++) {
+			if (vc == desc.entry[i].bus.csi2.vc)
 				continue;
 
 			dev_err(&priv->client->dev,
@@ -2550,7 +2535,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 	fwd_ctl = 0;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 		u8 vc = vc_map[nport];
 
@@ -2587,7 +2572,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 				unsigned int i;
 
 				/* Map all VCs from this port to VC(nport) */
-				for (i = 0; i < 8; ++i)
+				for (i = 0; i < 8; i++)
 					ub960_rxport_write(priv, nport,
 							   UB960_RR_VC_ID_MAP(i),
 							   nport);
@@ -2615,7 +2600,7 @@ static void ub960_update_streaming_status(struct ub960_data *priv)
 {
 	unsigned int i;
 
-	for (i = 0; i < UB960_MAX_NPORTS; ++i) {
+	for (i = 0; i < UB960_MAX_NPORTS; i++) {
 		if (priv->stream_enable_mask[i])
 			break;
 	}
@@ -2665,7 +2650,7 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 		sink_streams[nport] |= BIT_ULL(route->sink_stream);
 	}
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		if (!sink_streams[nport])
 			continue;
 
@@ -2703,7 +2688,7 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err:
-	for (nport = 0; nport < failed_port; ++nport) {
+	for (nport = 0; nport < failed_port; nport++) {
 		if (!sink_streams[nport])
 			continue;
 
@@ -2759,7 +2744,7 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
 		sink_streams[nport] |= BIT_ULL(route->sink_stream);
 	}
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		if (!sink_streams[nport])
 			continue;
 
@@ -2886,7 +2871,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			goto out_unlock;
 		}
 
-		for (i = 0; i < source_fd.num_entries; ++i) {
+		for (i = 0; i < source_fd.num_entries; i++) {
 			if (source_fd.entry[i].stream == route->sink_stream) {
 				source_entry = &source_fd.entry[i];
 				break;
@@ -3025,17 +3010,16 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 	unsigned int i;
 	u16 v16 = 0;
 	u8 v = 0;
-	u8 id[7];
+	u8 id[UB960_SR_FPD3_RX_ID_LEN];
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	for (i = 0; i < 6; ++i)
+	for (i = 0; i < sizeof(id); i++)
 		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
-	id[6] = 0;
 
-	dev_info(dev, "ID '%s'\n", id);
+	dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
 
-	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
 		struct ub960_txport *txport = priv->txports[nport];
 
 		dev_info(dev, "TX %u\n", nport);
@@ -3062,7 +3046,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		dev_info(dev, "\tline error counter %u\n", v16);
 	}
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 		u8 eq_level;
 		s8 strobe_pos;
@@ -3141,7 +3125,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			dev_info(dev, "\tEQ level %u\n", eq_level);
 
 		/* GPIOs */
-		for (i = 0; i < UB960_NUM_BC_GPIOS; ++i) {
+		for (i = 0; i < UB960_NUM_BC_GPIOS; i++) {
 			u8 ctl_reg;
 			u8 ctl_shift;
 
@@ -3201,12 +3185,12 @@ static irqreturn_t ub960_handle_events(int irq, void *arg)
 
 	dev_dbg(&priv->client->dev, "FWD_STS %#02x\n", fwd_sts);
 
-	for (i = 0; i < priv->hw_data->num_txports; ++i) {
+	for (i = 0; i < priv->hw_data->num_txports; i++) {
 		if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i))
 			ub960_csi_handle_events(priv, i);
 	}
 
-	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
+	for (i = 0; i < priv->hw_data->num_rxports; i++) {
 		if (!priv->rxports[i])
 			continue;
 
@@ -3233,7 +3217,7 @@ static void ub960_txport_free_ports(struct ub960_data *priv)
 {
 	unsigned int nport;
 
-	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
 		struct ub960_txport *txport = priv->txports[nport];
 
 		if (!txport)
@@ -3248,7 +3232,7 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
 {
 	unsigned int nport;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport)
@@ -3284,7 +3268,7 @@ static int ub960_parse_dt_base(struct ub960_data *priv)
 		return 0;
 
 	priv->atr.aliases = devm_kcalloc(dev, table_size,
-					 sizeof(struct atr_alias_table_entry),
+					 sizeof(*priv->atr.aliases),
 					 GFP_KERNEL);
 	if (!priv->atr.aliases)
 		return -ENOMEM;
@@ -3302,7 +3286,7 @@ static int ub960_parse_dt_base(struct ub960_data *priv)
 		return ret;
 	}
 
-	for (i = 0; i < table_size; ++i)
+	for (i = 0; i < table_size; i++)
 		priv->atr.aliases[i].alias_id = aliases[i];
 
 	kfree(aliases);
@@ -3387,12 +3371,15 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 				"ti,strobe-pos", ret);
 			return ret;
 		}
-	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
-		   strobe_pos > UB960_MAX_MANUAL_STROBE_POS) {
-		dev_err(dev, "rx%u: illegal 'strobe-pos' value: %d\n", nport,
-			strobe_pos);
 	} else {
-		/* NOTE: ignored unless global manual strobe pos is set */
+		if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
+		    strobe_pos > UB960_MAX_MANUAL_STROBE_POS) {
+			dev_err(dev, "rx%u: illegal 'strobe-pos' value: %d\n",
+				nport, strobe_pos);
+			return -EINVAL;
+		}
+
+		/* NOTE: ignored unless global manual strobe pos is also set */
 		rxport->eq.strobe_pos = strobe_pos;
 		if (!priv->strobe.manual)
 			dev_warn(dev,
@@ -3407,10 +3394,13 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 				"ti,eq-level", ret);
 			return ret;
 		}
-	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
-		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n", nport,
-			eq_level);
 	} else {
+		if (eq_level > UB960_MAX_EQ_LEVEL) {
+			dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n",
+				nport, eq_level);
+			return -EINVAL;
+		}
+
 		rxport->eq.manual_eq = true;
 		rxport->eq.manual.eq_level = eq_level;
 	}
@@ -3486,8 +3476,9 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
 				 struct fwnode_handle *link_fwnode,
 				 struct fwnode_handle *ep_fwnode)
 {
-	static const char *vpoc_names[UB960_MAX_RX_NPORTS] = { "vpoc0", "vpoc1",
-							       "vpoc2", "vpoc3" };
+	static const char *vpoc_names[UB960_MAX_RX_NPORTS] = {
+		"vpoc0", "vpoc1", "vpoc2", "vpoc3"
+	};
 	struct device *dev = &priv->client->dev;
 	struct ub960_rxport *rxport;
 	int ret;
@@ -3576,7 +3567,7 @@ static int ub960_parse_dt_rxports(struct ub960_data *priv)
 
 	priv->strobe.manual = fwnode_property_read_bool(links_fwnode, "ti,manual-strobe");
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct fwnode_handle *link_fwnode;
 		struct fwnode_handle *ep_fwnode;
 
@@ -3619,7 +3610,7 @@ static int ub960_parse_dt_txports(struct ub960_data *priv)
 	u32 nport;
 	int ret;
 
-	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
 		unsigned int port = nport + priv->hw_data->num_rxports;
 		struct fwnode_handle *ep_fwnode;
 
@@ -3696,7 +3687,7 @@ static int ub960_notify_bound(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
-	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
+	for (i = 0; i < priv->hw_data->num_rxports; i++) {
 		if (priv->rxports[i] && !priv->rxports[i]->source.sd) {
 			dev_dbg(dev, "Waiting for more subdevs to be bound\n");
 			return 0;
@@ -3728,7 +3719,7 @@ static int ub960_v4l2_notifier_register(struct ub960_data *priv)
 
 	v4l2_async_nf_init(&priv->notifier);
 
-	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
+	for (i = 0; i < priv->hw_data->num_rxports; i++) {
 		struct ub960_rxport *rxport = priv->rxports[i];
 		struct ub960_asd *asd;
 
@@ -3791,7 +3782,7 @@ static int ub960_create_subdev(struct ub960_data *priv)
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &ub960_entity_ops;
 
-	for (i = 0; i < priv->hw_data->num_rxports + priv->hw_data->num_txports; ++i) {
+	for (i = 0; i < priv->hw_data->num_rxports + priv->hw_data->num_txports; i++) {
 		priv->pads[i].flags = ub960_pad_is_sink(priv, i) ?
 					      MEDIA_PAD_FL_SINK :
 					      MEDIA_PAD_FL_SOURCE;
@@ -4055,7 +4046,7 @@ static int ub960_probe(struct i2c_client *client)
 
 	port_mask = 0;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 
 		if (!rxport)
-- 
2.34.1

