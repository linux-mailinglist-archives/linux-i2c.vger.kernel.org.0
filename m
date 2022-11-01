Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C327614BA3
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 14:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbiKANVc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 09:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiKANVV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 09:21:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7871AF38;
        Tue,  1 Nov 2022 06:21:07 -0700 (PDT)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A14E3311;
        Tue,  1 Nov 2022 14:21:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667308862;
        bh=Gyxug2On609My5qjpQfj/jvfv8KUIzuoIoscIqp5IB0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lpe9AOdMeUGKsHn34Ms7ZsZWBQ91Ufz713B1ZyC0IzGOnNgpP9p6eKaATRXTj1eE8
         /40sJzppAnJg8ZNZVNJdppgGHuhgkHgtfBJXZywAhlK3WdinlAQFkFkAjOHvETmekC
         40ODyP1Q1Nx6l36CNJKFHR08WcAE3lx/sFYUADFo=
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
Subject: [PATCH v4 7/8] media: i2c: add DS90UB913 driver
Date:   Tue,  1 Nov 2022 15:20:31 +0200
Message-Id: <20221101132032.1542416-8-tomi.valkeinen@ideasonboard.com>
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

Add driver for TI DS90UB913 FPDLink-3 Serializer.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/Kconfig     |   6 +
 drivers/media/i2c/Makefile    |   2 +-
 drivers/media/i2c/ds90ub913.c | 892 ++++++++++++++++++++++++++++++++++
 3 files changed, 899 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/i2c/ds90ub913.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 2a78889e3487..17185fd107d6 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1609,6 +1609,12 @@ config VIDEO_DS90UB960
 	  Device driver for the Texas Instruments DS90UB960
 	  FPD-Link III Deserializer
 
+config VIDEO_DS90UB913
+	tristate "TI DS90UB913 Serializer"
+	help
+	  Device driver for the Texas Instruments DS90UB913
+	  FPD-Link III Serializer.
+
 endmenu
 
 endif # VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 2735b00437bb..376886f2ded6 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -143,4 +143,4 @@ obj-$(CONFIG_VIDEO_VS6624) += vs6624.o
 obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
 obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
 obj-$(CONFIG_VIDEO_DS90UB960)	+= ds90ub960.o
-
+obj-$(CONFIG_VIDEO_DS90UB913)	+= ds90ub913.o
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
new file mode 100644
index 000000000000..6001a622e622
--- /dev/null
+++ b/drivers/media/i2c/ds90ub913.c
@@ -0,0 +1,892 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Texas Instruments DS90UB913 video serializer
+ *
+ * Based on a driver from Luca Ceresoli <luca@lucaceresoli.net>
+ *
+ * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>
+ * Copyright (c) 2022 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/driver.h>
+#include <linux/i2c-atr.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/regmap.h>
+
+#include <media/i2c/ds90ub9xx.h>
+#include <media/v4l2-subdev.h>
+
+#define UB913_PAD_SINK			0
+#define UB913_PAD_SOURCE		1
+
+/*
+ * UB913 has 4 gpios, but gpios 3 and 4 are reserved for external oscillator
+ * mode. Thus we only support 2 gpios for now.
+ */
+#define UB913_NUM_GPIOS			2
+
+#define UB913_REG_RESET_CTL			0x01
+#define UB913_REG_RESET_CTL_DIGITAL_RESET_1	BIT(1)
+#define UB913_REG_RESET_CTL_DIGITAL_RESET_0	BIT(0)
+
+#define UB913_REG_GENERAL_CFG			0x03
+#define UB913_REG_MODE_SEL			0x05
+
+#define UB913_REG_CRC_ERRORS_LSB		0x0a
+#define UB913_REG_CRC_ERRORS_MSB		0x0b
+
+#define UB913_REG_GENERAL_STATUS		0x0c
+
+#define UB913_REG_GPIO_CFG(n)			(0x0d + (n))
+#define UB913_REG_GPIO_CFG_ENABLE(n)		BIT(0 + (n) * 4)
+#define UB913_REG_GPIO_CFG_DIR_INPUT(n)		BIT(1 + (n) * 4)
+#define UB913_REG_GPIO_CFG_REMOTE_EN(n)		BIT(2 + (n) * 4)
+#define UB913_REG_GPIO_CFG_OUT_VAL(n)		BIT(3 + (n) * 4)
+#define UB913_REG_GPIO_CFG_MASK(n)		(0xf << ((n) * 4))
+
+#define UB913_REG_SCL_HIGH_TIME			0x11
+#define UB913_REG_SCL_LOW_TIME			0x12
+
+#define UB913_REG_PLL_OVR			0x35
+
+struct ub913_data {
+	struct i2c_client	*client;
+	struct regmap		*regmap;
+	struct clk		*clkin;
+
+	u32			gpio_func[UB913_NUM_GPIOS];
+
+	struct gpio_chip	gpio_chip;
+	char			gpio_chip_name[64];
+
+	struct v4l2_subdev	sd;
+	struct media_pad	pads[2];
+
+	struct v4l2_async_notifier	notifier;
+
+	struct v4l2_subdev	*source_sd;
+
+	u64			enabled_source_streams;
+
+	struct device_node	*tx_ep_np;
+
+	struct clk_hw		*clkout_clk_hw;
+
+	struct ds90ub9xx_platform_data *plat_data;
+
+	/* Have we succefully called i2c_atr_add_adapter() */
+	bool			has_i2c_adapter;
+};
+
+static inline struct ub913_data *sd_to_ub913(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ub913_data, sd);
+}
+
+static int ub913_read(const struct ub913_data *priv, u8 reg, u8 *val)
+{
+	unsigned int v;
+	int ret;
+
+	ret = regmap_read(priv->regmap, reg, &v);
+	if (ret < 0) {
+		dev_err(&priv->client->dev,
+			"Cannot read register 0x%02x: %d!\n", reg, ret);
+		return ret;
+	}
+
+	*val = v;
+	return 0;
+}
+
+static int ub913_write(const struct ub913_data *priv, u8 reg, u8 val)
+{
+	int ret;
+
+	ret = regmap_write(priv->regmap, reg, val);
+	if (ret < 0)
+		dev_err(&priv->client->dev,
+			"Cannot write register 0x%02x: %d!\n", reg, ret);
+
+	return ret;
+}
+
+/*
+ * GPIO chip
+ */
+static int ub913_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int ub913_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
+				    int value)
+{
+	struct ub913_data *priv = gpiochip_get_data(gc);
+	unsigned int reg_idx;
+	unsigned int field_idx;
+	int ret;
+
+	reg_idx = offset / 2;
+	field_idx = offset % 2;
+
+	ret = regmap_update_bits(
+		priv->regmap, UB913_REG_GPIO_CFG(reg_idx),
+		UB913_REG_GPIO_CFG_MASK(field_idx),
+		UB913_REG_GPIO_CFG_ENABLE(field_idx) |
+			(value ? UB913_REG_GPIO_CFG_OUT_VAL(field_idx) : 0));
+
+	return ret;
+}
+
+static void ub913_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	ub913_gpio_direction_out(gc, offset, value);
+}
+
+static int ub913_gpio_of_xlate(struct gpio_chip *gc,
+			       const struct of_phandle_args *gpiospec,
+			       u32 *flags)
+{
+	if (flags)
+		*flags = gpiospec->args[1];
+
+	return gpiospec->args[0];
+}
+
+static int ub913_gpiochip_probe(struct ub913_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct gpio_chip *gc = &priv->gpio_chip;
+	int ret;
+
+	/* Initialize GPIOs 0 and 1 to local control, tri-state */
+	ub913_write(priv, UB913_REG_GPIO_CFG(0), 0);
+
+	scnprintf(priv->gpio_chip_name, sizeof(priv->gpio_chip_name), "%s",
+		  dev_name(dev));
+
+	gc->label = priv->gpio_chip_name;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->base = -1;
+	gc->can_sleep = 1;
+	gc->ngpio = UB913_NUM_GPIOS;
+	gc->get_direction = ub913_gpio_get_direction;
+	gc->direction_output = ub913_gpio_direction_out;
+	gc->set = ub913_gpio_set;
+	gc->of_xlate = ub913_gpio_of_xlate;
+	gc->of_node = priv->client->dev.of_node;
+	gc->of_gpio_n_cells = 2;
+
+	ret = gpiochip_add_data(gc, priv);
+	if (ret) {
+		dev_err(dev, "Failed to add GPIOs: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ub913_gpiochip_remove(struct ub913_data *priv)
+{
+	gpiochip_remove(&priv->gpio_chip);
+}
+
+static int ub913_parse_dt(struct ub913_data *priv)
+{
+	struct device_node *np = priv->client->dev.of_node;
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	if (!np) {
+		dev_err(dev, "OF: no device tree node!\n");
+		return -ENOENT;
+	}
+
+	/* optional, if absent all GPIO pins are unused */
+	ret = of_property_read_u32_array(np, "gpio-functions", priv->gpio_func,
+					 ARRAY_SIZE(priv->gpio_func));
+	if (ret && ret != -EINVAL)
+		dev_err(dev, "DT: invalid gpio-functions property (%d)", ret);
+
+	return 0;
+}
+
+static const struct regmap_config ub913_regmap_config = {
+	.name = "ds90ub913",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_format_endian = REGMAP_ENDIAN_DEFAULT,
+	.val_format_endian = REGMAP_ENDIAN_DEFAULT,
+};
+
+/*
+ * V4L2
+ */
+
+static int ub913_enable_streams(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state, u32 pad,
+				u64 streams_mask)
+{
+	struct ub913_data *priv = sd_to_ub913(sd);
+	struct media_pad *remote_pad;
+	u64 sink_streams;
+	int ret;
+
+	if (streams_mask & priv->enabled_source_streams)
+		return -EALREADY;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(
+		state, UB913_PAD_SOURCE, UB913_PAD_SINK, &streams_mask);
+
+	remote_pad = media_pad_remote_pad_first(&priv->pads[UB913_PAD_SINK]);
+
+	ret = v4l2_subdev_enable_streams(priv->source_sd, remote_pad->index,
+					 sink_streams);
+	if (ret)
+		return ret;
+
+	priv->enabled_source_streams |= streams_mask;
+
+	return 0;
+}
+
+static int ub913_disable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct ub913_data *priv = sd_to_ub913(sd);
+	struct media_pad *remote_pad;
+	int ret;
+	u64 sink_streams;
+
+	if ((streams_mask & priv->enabled_source_streams) != streams_mask)
+		return -EALREADY;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(
+		state, UB913_PAD_SOURCE, UB913_PAD_SINK, &streams_mask);
+
+	remote_pad = media_pad_remote_pad_first(&priv->pads[UB913_PAD_SINK]);
+
+	ret = v4l2_subdev_disable_streams(priv->source_sd, remote_pad->index,
+					  sink_streams);
+	if (ret)
+		return ret;
+
+	priv->enabled_source_streams &= ~streams_mask;
+
+	return 0;
+}
+
+static int _ub913_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_krouting *routing)
+{
+	const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+	int ret;
+
+	/*
+	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
+	 * frame desc is made dynamically allocated.
+	 */
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ub913_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     enum v4l2_subdev_format_whence which,
+			     struct v4l2_subdev_krouting *routing)
+{
+	struct ub913_data *priv = sd_to_ub913(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->enabled_source_streams)
+		return -EBUSY;
+
+	return _ub913_set_routing(sd, state, routing);
+}
+
+static int ub913_get_source_frame_desc(struct ub913_data *priv,
+				       struct v4l2_mbus_frame_desc *desc)
+{
+	struct media_pad *pad;
+	int ret;
+
+	pad = media_pad_remote_pad_first(&priv->pads[UB913_PAD_SINK]);
+	if (!pad)
+		return -EPIPE;
+
+	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc, pad->index,
+			       desc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_frame_desc *fd)
+{
+	struct ub913_data *priv = sd_to_ub913(sd);
+	const struct v4l2_subdev_krouting *routing;
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	if (pad != 1) /* first tx pad */
+		return -EINVAL;
+
+	ret = ub913_get_source_frame_desc(priv, &source_fd);
+	if (ret)
+		return ret;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	routing = &state->routing;
+
+	memset(fd, 0, sizeof(*fd));
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
+
+	for_each_active_route(routing, route) {
+		unsigned int j;
+
+		if (route->source_pad != pad)
+			continue;
+
+		for (j = 0; j < source_fd.num_entries; ++j)
+			if (source_fd.entry[j].stream == route->sink_stream)
+				break;
+
+		if (j == source_fd.num_entries) {
+			dev_err(&priv->client->dev,
+				"Failed to find stream from source frame desc\n");
+			ret = -EPIPE;
+			goto out;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+
+		fd->entry[fd->num_entries].flags =
+			V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+		fd->entry[fd->num_entries].length = source_fd.entry[j].length;
+		fd->entry[fd->num_entries].pixelcode =
+			source_fd.entry[j].pixelcode;
+
+		fd->num_entries++;
+	}
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int ub913_set_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *state,
+			 struct v4l2_subdev_format *format)
+{
+	struct ub913_data *priv = sd_to_ub913(sd);
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    priv->enabled_source_streams)
+		return -EBUSY;
+
+	/* No transcoding, source and sink formats must match. */
+	if (format->pad == 1)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	/* Set sink format */
+	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
+						  format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	/* Propagate to source format */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	return 0;
+}
+
+static int ub913_init_cfg(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = 0,
+			.sink_stream = 0,
+			.source_pad = 1,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return _ub913_set_routing(sd, state, &routing);
+}
+
+static int ub913_log_status(struct v4l2_subdev *sd)
+{
+	struct ub913_data *priv = sd_to_ub913(sd);
+	struct device *dev = &priv->client->dev;
+	u8 v, v1, v2;
+
+	ub913_read(priv, UB913_REG_MODE_SEL, &v);
+	dev_info(dev, "MODE_SEL %#x\n", v);
+
+	ub913_read(priv, UB913_REG_CRC_ERRORS_LSB, &v1);
+	ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &v2);
+	dev_info(dev, "CRC errors %u\n", v1 | (v2 << 8));
+
+	ub913_read(priv, UB913_REG_GENERAL_STATUS, &v);
+	dev_info(dev, "GENERAL_STATUS %#x\n", v);
+
+	ub913_read(priv, UB913_REG_PLL_OVR, &v);
+	dev_info(dev, "PLL_OVR %#x\n", v);
+
+	/* clear CRC errors */
+	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
+	ub913_write(priv, UB913_REG_GENERAL_CFG, v | BIT(5));
+	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops ub913_subdev_core_ops = {
+	.log_status = ub913_log_status,
+};
+
+static const struct v4l2_subdev_pad_ops ub913_pad_ops = {
+	.enable_streams = ub913_enable_streams,
+	.disable_streams = ub913_disable_streams,
+	.set_routing = ub913_set_routing,
+	.get_frame_desc	= ub913_get_frame_desc,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ub913_set_fmt,
+	.init_cfg = ub913_init_cfg,
+};
+
+static const struct v4l2_subdev_ops ub913_subdev_ops = {
+	.core = &ub913_subdev_core_ops,
+	.pad = &ub913_pad_ops,
+};
+
+static const struct media_entity_operations ub913_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int ub913_notify_bound(struct v4l2_async_notifier *notifier,
+			      struct v4l2_subdev *source_subdev,
+			      struct v4l2_async_subdev *asd)
+{
+	struct ub913_data *priv = sd_to_ub913(notifier->sd);
+	struct device *dev = &priv->client->dev;
+	unsigned int src_pad;
+	int ret;
+
+	dev_dbg(dev, "Bind %s\n", source_subdev->name);
+
+	ret = media_entity_get_fwnode_pad(&source_subdev->entity,
+					  source_subdev->fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(dev, "Failed to find pad for %s\n",
+			source_subdev->name);
+		return ret;
+	}
+
+	priv->source_sd = source_subdev;
+	src_pad = ret;
+
+	ret = media_create_pad_link(&source_subdev->entity, src_pad,
+				    &priv->sd.entity, 0,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(dev, "Unable to link %s:%u -> %s:0\n",
+			source_subdev->name, src_pad, priv->sd.name);
+		return ret;
+	}
+
+	dev_dbg(dev, "Bound %s:%u\n", source_subdev->name, src_pad);
+
+	dev_dbg(dev, "All subdevs bound\n");
+
+	return 0;
+}
+
+static void ub913_notify_unbind(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *source_subdev,
+				struct v4l2_async_subdev *asd)
+{
+	struct ub913_data *priv = sd_to_ub913(notifier->sd);
+	struct device *dev = &priv->client->dev;
+
+	dev_dbg(dev, "Unbind %s\n", source_subdev->name);
+}
+
+static const struct v4l2_async_notifier_operations ub913_notify_ops = {
+	.bound = ub913_notify_bound,
+	.unbind = ub913_notify_unbind,
+};
+
+static int ub913_v4l2_notifier_register(struct ub913_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct v4l2_async_subdev *asd;
+	struct device_node *ep_node;
+	int ret;
+
+	dev_dbg(dev, "register async notif\n");
+
+	ep_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	if (!ep_node) {
+		dev_err(dev, "No graph endpoint\n");
+		return -ENODEV;
+	}
+
+	v4l2_async_nf_init(&priv->notifier);
+
+	asd = v4l2_async_nf_add_fwnode_remote(&priv->notifier,
+					      of_fwnode_handle(ep_node),
+					      struct v4l2_async_subdev);
+
+	of_node_put(ep_node);
+
+	if (IS_ERR(asd)) {
+		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		v4l2_async_nf_cleanup(&priv->notifier);
+		return PTR_ERR(asd);
+	}
+
+	priv->notifier.ops = &ub913_notify_ops;
+
+	ret = v4l2_async_subdev_nf_register(&priv->sd, &priv->notifier);
+	if (ret) {
+		dev_err(dev, "Failed to register subdev_notifier");
+		v4l2_async_nf_cleanup(&priv->notifier);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ub913_v4l2_nf_unregister(struct ub913_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+
+	dev_dbg(dev, "Unregister async notif\n");
+
+	v4l2_async_nf_unregister(&priv->notifier);
+	v4l2_async_nf_cleanup(&priv->notifier);
+}
+
+static int ub913_register_clkout(struct ub913_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	const char *name;
+	int ret;
+
+	name = kasprintf(GFP_KERNEL, "ds90ub913.%s.clk_out", dev_name(dev));
+
+	priv->clkout_clk_hw = devm_clk_hw_register_fixed_factor(dev, name,
+		__clk_get_name(priv->clkin), 0, 1, 2);
+
+	kfree(name);
+
+	if (IS_ERR(priv->clkout_clk_hw))
+		return dev_err_probe(dev, PTR_ERR(priv->clkout_clk_hw),
+				     "Cannot register clkout hw\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					  priv->clkout_clk_hw);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Cannot add OF clock provider\n");
+
+	return 0;
+}
+
+static int ub913_i2c_master_init(struct ub913_data *priv)
+{
+	/* i2c fast mode */
+	u32 scl_high = 600 + 300; /* high period + rise time, ns */
+	u32 scl_low = 1300 + 300; /* low period + fall time, ns */
+	unsigned long ref;
+	int ret;
+
+	ref = clk_get_rate(priv->clkin) / 2;
+
+	scl_high = div64_u64((u64)scl_high * ref, 1000000000);
+	scl_low = div64_u64((u64)scl_low * ref, 1000000000);
+
+	ret = ub913_write(priv, UB913_REG_SCL_HIGH_TIME, scl_high);
+	if (ret)
+		return ret;
+
+	ret = ub913_write(priv, UB913_REG_SCL_LOW_TIME, scl_low);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ub913_add_i2c_adapter(struct ub913_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct fwnode_handle *i2c_handle;
+	int ret;
+
+	i2c_handle = device_get_named_child_node(dev, "i2c");
+	if (!i2c_handle)
+		return 0;
+
+	ret = i2c_atr_add_adapter(priv->plat_data->atr, priv->plat_data->port,
+				  i2c_handle);
+
+	fwnode_handle_put(i2c_handle);
+
+	if (ret)
+		return ret;
+
+	priv->has_i2c_adapter = true;
+
+	return 0;
+}
+
+static void ub913_remove_i2c_adapter(struct ub913_data *priv)
+{
+	if (priv->has_i2c_adapter)
+		i2c_atr_del_adapter(priv->plat_data->atr,
+				    priv->plat_data->port);
+}
+
+static int ub913_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ub913_data *priv;
+	int ret;
+	u8 v;
+	bool mode_override;
+	u8 mode;
+
+	dev_dbg(dev, "probing, addr 0x%02x\n", client->addr);
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+
+	priv->plat_data = dev_get_platdata(&client->dev);
+	if (!priv->plat_data) {
+		dev_err(dev, "Platform data missing\n");
+		return -ENODEV;
+	}
+
+	priv->regmap = devm_regmap_init_i2c(client, &ub913_regmap_config);
+	if (IS_ERR(priv->regmap)) {
+		dev_err(dev, "Failed to init regmap\n");
+		return PTR_ERR(priv->regmap);
+	}
+
+	/* ub913 can also work without ext clock, but that is not supported */
+	priv->clkin = devm_clk_get(dev, "clkin");
+	if (IS_ERR(priv->clkin)) {
+		ret = PTR_ERR(priv->clkin);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Cannot get CLKIN (%d)", ret);
+		return ret;
+	}
+
+	ret = ub913_parse_dt(priv);
+	if (ret)
+		return ret;
+
+	ret = ub913_read(priv, UB913_REG_MODE_SEL, &v);
+	if (ret)
+		return ret;
+
+	if (!(v & BIT(4))) {
+		dev_err(dev, "Mode value not stabilized\n");
+		return -ENODEV;
+	}
+
+	mode_override = v & BIT(5);
+	mode = v & 0xf;
+
+	dev_dbg(dev, "mode from %s: %#x\n",
+		mode_override ? "reg" : "deserializer", mode);
+
+	ret = ub913_i2c_master_init(priv);
+	if (ret) {
+		dev_err(dev, "i2c master init failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = ub913_gpiochip_probe(priv);
+	if (ret) {
+		dev_err(dev, "Failed to init gpiochip\n");
+		return ret;
+	}
+
+	ret = ub913_register_clkout(priv);
+	if (ret) {
+		dev_err(dev, "Failed to register clkout\n");
+		goto err_gpiochip_remove;
+	}
+
+	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub913_subdev_ops);
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	priv->sd.entity.ops = &ub913_entity_ops;
+
+	priv->pads[0].flags = MEDIA_PAD_FL_SINK;
+	priv->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
+	if (ret) {
+		dev_err(dev, "Failed to init pads\n");
+		goto err_gpiochip_remove;
+	}
+
+	priv->tx_ep_np = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);
+	if (priv->tx_ep_np)
+		priv->sd.fwnode = of_fwnode_handle(priv->tx_ep_np);
+
+	ret = v4l2_subdev_init_finalize(&priv->sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = ub913_v4l2_notifier_register(priv);
+	if (ret) {
+		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
+		goto err_free_state;
+	}
+
+	ret = v4l2_async_register_subdev(&priv->sd);
+	if (ret) {
+		dev_err(dev, "v4l2_async_register_subdev error: %d\n", ret);
+		goto err_unreg_notif;
+	}
+
+	ret = ub913_add_i2c_adapter(priv);
+	if (ret) {
+		dev_err(dev, "failed to add remote i2c adapter\n");
+		goto err_unreg_async_subdev;
+	}
+
+	dev_dbg(dev, "Successfully probed\n");
+
+	return 0;
+
+err_unreg_async_subdev:
+	v4l2_async_unregister_subdev(&priv->sd);
+err_unreg_notif:
+	ub913_v4l2_nf_unregister(priv);
+err_free_state:
+	v4l2_subdev_cleanup(&priv->sd);
+err_entity_cleanup:
+	if (priv->tx_ep_np)
+		of_node_put(priv->tx_ep_np);
+
+	media_entity_cleanup(&priv->sd.entity);
+err_gpiochip_remove:
+	ub913_gpiochip_remove(priv);
+
+	return ret;
+}
+
+static void ub913_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ub913_data *priv = sd_to_ub913(sd);
+
+	dev_dbg(&client->dev, "Removing\n");
+
+	ub913_remove_i2c_adapter(priv);
+
+	v4l2_async_unregister_subdev(&priv->sd);
+
+	ub913_v4l2_nf_unregister(priv);
+
+	v4l2_subdev_cleanup(&priv->sd);
+
+	if (priv->tx_ep_np)
+		of_node_put(priv->tx_ep_np);
+
+	media_entity_cleanup(&priv->sd.entity);
+
+	ub913_gpiochip_remove(priv);
+}
+
+static const struct i2c_device_id ub913_id[] = { { "ds90ub913a-q1", 0 }, {} };
+MODULE_DEVICE_TABLE(i2c, ub913_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id ub913_dt_ids[] = {
+	{ .compatible = "ti,ds90ub913a-q1", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ub913_dt_ids);
+#endif
+
+static struct i2c_driver ds90ub913_driver = {
+	.probe_new	= ub913_probe,
+	.remove		= ub913_remove,
+	.id_table	= ub913_id,
+	.driver = {
+		.name	= "ds90ub913a",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(ub913_dt_ids),
+	},
+};
+
+module_i2c_driver(ds90ub913_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Texas Instruments DS90UB913 serializer driver");
+MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
+MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
-- 
2.34.1

