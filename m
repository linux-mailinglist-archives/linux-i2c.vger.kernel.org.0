Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B979D614BAB
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 14:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbiKANV4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 09:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbiKANVb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 09:21:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30EA1B9F1;
        Tue,  1 Nov 2022 06:21:10 -0700 (PDT)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAEB8338E;
        Tue,  1 Nov 2022 14:21:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667308863;
        bh=aaF0uijIMZbPhKEVAPTc7OEKd8B63ra18ptyRpxbaa8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vf+ghi27baHud8VcoVEqHsgsPiVUvWUS+ar+vH/U6EBQoQawnDPeCMGUZf4p4Y9rl
         +yV9U5sGnNQF8nA7KMh/gk70Qtefphx5GlX9osvwJ02ALNul/HSH2yQy1J+kvktVb5
         tVuXFrKMsyPf1ZziYCqYHgNbtTIoXmk+ihZ/OElA=
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
Subject: [PATCH v4 8/8] media: i2c: add DS90UB953 driver
Date:   Tue,  1 Nov 2022 15:20:32 +0200
Message-Id: <20221101132032.1542416-9-tomi.valkeinen@ideasonboard.com>
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

Add driver for TI DS90UB953 FPDLink-3 Serializer.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/Kconfig     |    6 +
 drivers/media/i2c/Makefile    |    1 +
 drivers/media/i2c/ds90ub953.c | 1607 +++++++++++++++++++++++++++++++++
 3 files changed, 1614 insertions(+)
 create mode 100644 drivers/media/i2c/ds90ub953.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 17185fd107d6..1563fa0abf0e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1615,6 +1615,12 @@ config VIDEO_DS90UB913
 	  Device driver for the Texas Instruments DS90UB913
 	  FPD-Link III Serializer.
 
+config VIDEO_DS90UB953
+	tristate "TI DS90UB953 Serializer"
+	help
+	  Device driver for the Texas Instruments DS90UB953
+	  FPD-Link III Serializer.
+
 endmenu
 
 endif # VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 376886f2ded6..377cdf6fa30b 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -144,3 +144,4 @@ obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
 obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
 obj-$(CONFIG_VIDEO_DS90UB960)	+= ds90ub960.o
 obj-$(CONFIG_VIDEO_DS90UB913)	+= ds90ub913.o
+obj-$(CONFIG_VIDEO_DS90UB953)	+= ds90ub953.o
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
new file mode 100644
index 000000000000..c7f5d08e07ef
--- /dev/null
+++ b/drivers/media/i2c/ds90ub953.c
@@ -0,0 +1,1607 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Texas Instruments DS90UB953 video serializer
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
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/rational.h>
+#include <linux/regmap.h>
+
+#include <media/i2c/ds90ub9xx.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#define UB953_PAD_SINK			0
+#define UB953_PAD_SOURCE		1
+
+#define UB953_NUM_GPIOS			4
+
+#define UB953_REG_RESET_CTL			0x01
+#define UB953_REG_RESET_CTL_DIGITAL_RESET_1	BIT(1)
+#define UB953_REG_RESET_CTL_DIGITAL_RESET_0	BIT(0)
+
+#define UB953_REG_GENERAL_CFG			0x02
+#define UB953_REG_MODE_SEL			0x03
+
+#define UB953_REG_CLKOUT_CTRL0			0x06
+#define UB953_REG_CLKOUT_CTRL1			0x07
+
+#define UB953_REG_SCL_HIGH_TIME			0x0B
+#define UB953_REG_SCL_LOW_TIME			0x0C
+
+#define UB953_REG_LOCAL_GPIO_DATA		0x0d
+#define UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(n)		BIT(4 + (n))
+#define UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(n)	BIT(0 + (n))
+
+#define UB953_REG_GPIO_INPUT_CTRL		0x0e
+#define UB953_REG_GPIO_INPUT_CTRL_OUT_EN(n)	BIT(4 + (n))
+#define UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(n)	BIT(0 + (n))
+
+#define UB953_REG_REV_MASK_ID			0x50
+#define UB953_REG_GENERAL_STATUS		0x52
+
+#define UB953_REG_GPIO_PIN_STS			0x53
+#define UB953_REG_GPIO_PIN_STS_GPIO_STS(n)	BIT(0 + (n))
+
+#define UB953_REG_BIST_ERR_CNT			0x54
+#define UB953_REG_CRC_ERR_CNT1			0x55
+#define UB953_REG_CRC_ERR_CNT2			0x56
+
+#define UB953_REG_CSI_ERR_CNT			0x5c
+#define UB953_REG_CSI_ERR_STATUS		0x5D
+#define UB953_REG_CSI_ERR_DLANE01		0x5E
+#define UB953_REG_CSI_ERR_DLANE23		0x5F
+#define UB953_REG_CSI_ERR_CLK_LANE		0x60
+#define UB953_REG_CSI_PKT_HDR_VC_ID		0x61
+#define UB953_REG_PKT_HDR_WC_LSB		0x62
+#define UB953_REG_PKT_HDR_WC_MSB		0x63
+#define UB953_REG_CSI_ECC			0x64
+
+#define UB953_REG_IND_ACC_CTL			0xb0
+#define UB953_REG_IND_ACC_ADDR			0xb1
+#define UB953_REG_IND_ACC_DATA			0xb2
+
+#define UB953_REG_FPD3_RX_ID(n)			(0xf0 + (n))
+
+/* Indirect register blocks */
+#define UB953_IND_TARGET_PAT_GEN		0x00
+#define UB953_IND_TARGET_FPD3_TX		0x01
+#define UB953_IND_TARGET_DIE_ID			0x02
+
+#define UB953_IND_PGEN_CTL			0x01
+#define UB953_IND_PGEN_CTL_PGEN_ENABLE		BIT(0)
+#define UB953_IND_PGEN_CFG			0x02
+#define UB953_IND_PGEN_CSI_DI			0x03
+#define UB953_IND_PGEN_LINE_SIZE1		0x04
+#define UB953_IND_PGEN_LINE_SIZE0		0x05
+#define UB953_IND_PGEN_BAR_SIZE1		0x06
+#define UB953_IND_PGEN_BAR_SIZE0		0x07
+#define UB953_IND_PGEN_ACT_LPF1			0x08
+#define UB953_IND_PGEN_ACT_LPF0			0x09
+#define UB953_IND_PGEN_TOT_LPF1			0x0A
+#define UB953_IND_PGEN_TOT_LPF0			0x0B
+#define UB953_IND_PGEN_LINE_PD1			0x0C
+#define UB953_IND_PGEN_LINE_PD0			0x0D
+#define UB953_IND_PGEN_VBP			0x0E
+#define UB953_IND_PGEN_VFP			0x0F
+#define UB953_IND_PGEN_COLOR(n)			(0x10 + (n)) /* n <= 15 */
+
+/* Note: Only sync mode supported for now */
+enum ub953_mode {
+	/* FPD-Link 3 CSI-2 synchronous mode */
+	UB953_MODE_SYNC,
+	/* FPD-Link 3 CSI-2 non-synchronous mode, external ref clock */
+	UB953_MODE_NONSYNC_EXT,
+	/* FPD-Link 3 CSI-2 non-synchronous mode, internal ref clock */
+	UB953_MODE_NONSYNC_INT,
+	/* FPD-Link 3 DVP mode */
+	UB953_MODE_DVP,
+};
+
+struct ub953_hw_data {
+	const char *model;
+	bool ub971;
+};
+
+struct ub953_data {
+	const struct ub953_hw_data	*hw_data;
+
+	struct i2c_client	*client;
+	struct regmap		*regmap;
+
+	u32			num_data_lanes;
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
+	struct v4l2_ctrl_handler   ctrl_handler;
+
+	u64			enabled_source_streams;
+
+	struct device_node	*tx_ep_np;
+
+	/* lock for register access */
+	struct mutex		reg_lock;
+
+	u8			current_indirect_target;
+
+	struct clk_hw		clkout_clk_hw;
+
+	enum ub953_mode		mode;
+
+	struct ds90ub9xx_platform_data *plat_data;
+
+	/* Have we succefully called i2c_atr_add_adapter() */
+	bool			has_i2c_adapter;
+};
+
+static inline struct ub953_data *sd_to_ub953(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ub953_data, sd);
+}
+
+/*
+ * HW Access
+ */
+
+static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val)
+{
+	unsigned int v;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = regmap_read(priv->regmap, reg, &v);
+	if (ret)
+		dev_err(&priv->client->dev,
+			"Cannot read register 0x%02x: %d!\n", reg, ret);
+	else
+		*val = v;
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub953_write(struct ub953_data *priv, u8 reg, u8 val)
+{
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = regmap_write(priv->regmap, reg, val);
+	if (ret)
+		dev_err(&priv->client->dev,
+			"Cannot write register 0x%02x: %d!\n", reg, ret);
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int _ub953_select_ind_reg_block(struct ub953_data *priv, u8 block)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	if (priv->current_indirect_target == block)
+		return 0;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_CTL, block << 2);
+	if (ret) {
+		dev_err(dev, "%s: cannot select indirect target %u (%d)!\n",
+			__func__, block, ret);
+		return ret;
+	}
+
+	priv->current_indirect_target = block;
+
+	return 0;
+}
+
+__maybe_unused
+static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val)
+{
+	unsigned int v;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = _ub953_select_ind_reg_block(priv, block);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
+	if (ret)
+		goto out;
+
+	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
+	if (ret)
+		goto out;
+
+	*val = v;
+
+out:
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
+{
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = _ub953_select_ind_reg_block(priv, block);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
+
+out:
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub953_write_ind16(struct ub953_data *priv, u8 block, u8 reg, u16 val)
+{
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = _ub953_select_ind_reg_block(priv, block);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val >> 8);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg + 1);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val & 0xff);
+	if (ret)
+		goto out;
+
+out:
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+/*
+ * GPIO chip
+ */
+static int ub953_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ub953_data *priv = gpiochip_get_data(gc);
+	int ret;
+	u8 v;
+
+	ret = ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &v);
+	if (ret)
+		return ret;
+
+	if (v & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset))
+		return GPIO_LINE_DIRECTION_IN;
+	else
+		return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int ub953_gpio_direction_in(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ub953_data *priv = gpiochip_get_data(gc);
+
+	return regmap_update_bits(
+		priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
+		UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
+			UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
+		UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset));
+}
+
+static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
+				    int value)
+{
+	struct ub953_data *priv = gpiochip_get_data(gc);
+	int ret;
+
+	ret = regmap_update_bits(
+		priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
+		UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
+		value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) : 0);
+
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(
+		priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
+		UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
+			UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
+		UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset));
+}
+
+static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ub953_data *priv = gpiochip_get_data(gc);
+	int ret;
+	u8 v;
+
+	ret = ub953_read(priv, UB953_REG_GPIO_PIN_STS, &v);
+	if (ret)
+		return ret;
+
+	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS(offset));
+}
+
+static void ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct ub953_data *priv = gpiochip_get_data(gc);
+
+	regmap_update_bits(
+		priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
+		UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
+		value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) : 0);
+}
+
+static int ub953_gpio_of_xlate(struct gpio_chip *gc,
+			       const struct of_phandle_args *gpiospec,
+			       u32 *flags)
+{
+	if (flags)
+		*flags = gpiospec->args[1];
+
+	return gpiospec->args[0];
+}
+
+static int ub953_gpiochip_probe(struct ub953_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct gpio_chip *gc = &priv->gpio_chip;
+	int ret;
+
+	/* Set all GPIOs to local input mode */
+	ub953_write(priv, UB953_REG_LOCAL_GPIO_DATA, 0);
+	ub953_write(priv, UB953_REG_GPIO_INPUT_CTRL, 0xf);
+
+	scnprintf(priv->gpio_chip_name, sizeof(priv->gpio_chip_name), "%s",
+		  dev_name(dev));
+
+	gc->label = priv->gpio_chip_name;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->base = -1;
+	gc->can_sleep = 1;
+	gc->ngpio = UB953_NUM_GPIOS;
+	gc->get_direction = ub953_gpio_get_direction;
+	gc->direction_input = ub953_gpio_direction_in;
+	gc->direction_output = ub953_gpio_direction_out;
+	gc->get = ub953_gpio_get;
+	gc->set = ub953_gpio_set;
+	gc->of_xlate = ub953_gpio_of_xlate;
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
+static void ub953_gpiochip_remove(struct ub953_data *priv)
+{
+	gpiochip_remove(&priv->gpio_chip);
+}
+
+/*
+ * V4L2
+ */
+
+static int _ub953_set_routing(struct v4l2_subdev *sd,
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
+static int ub953_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     enum v4l2_subdev_format_whence which,
+			     struct v4l2_subdev_krouting *routing)
+{
+	struct ub953_data *priv = sd_to_ub953(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->enabled_source_streams)
+		return -EBUSY;
+
+	return _ub953_set_routing(sd, state, routing);
+}
+
+static int ub953_get_source_frame_desc(struct ub953_data *priv,
+				       struct v4l2_mbus_frame_desc *desc)
+{
+	struct media_pad *pad;
+	int ret;
+
+	pad = media_pad_remote_pad_first(&priv->pads[UB953_PAD_SINK]);
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
+static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_frame_desc *fd)
+{
+	struct ub953_data *priv = sd_to_ub953(sd);
+	const struct v4l2_subdev_krouting *routing;
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	if (pad != 1) /* first tx pad */
+		return -EINVAL;
+
+	ret = ub953_get_source_frame_desc(priv, &source_fd);
+	if (ret)
+		return ret;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	routing = &state->routing;
+
+	memset(fd, 0, sizeof(*fd));
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	for_each_active_route(routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		unsigned int j;
+
+		if (route->source_pad != pad)
+			continue;
+
+		for (j = 0; j < source_fd.num_entries; ++j)
+			if (source_fd.entry[j].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[j];
+				break;
+			}
+
+		if (!source_entry) {
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
+		fd->entry[fd->num_entries].length = source_entry->length;
+		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
+		fd->entry[fd->num_entries].bus.csi2.vc =
+			source_entry->bus.csi2.vc;
+		fd->entry[fd->num_entries].bus.csi2.dt =
+			source_entry->bus.csi2.dt;
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
+static int ub953_set_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *state,
+			 struct v4l2_subdev_format *format)
+{
+	struct ub953_data *priv = sd_to_ub953(sd);
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
+static int ub953_init_cfg(struct v4l2_subdev *sd,
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
+	return _ub953_set_routing(sd, state, &routing);
+}
+
+static int ub953_log_status(struct v4l2_subdev *sd)
+{
+	struct ub953_data *priv = sd_to_ub953(sd);
+	struct device *dev = &priv->client->dev;
+	u8 v = 0, v1 = 0, v2 = 0;
+	unsigned int i;
+	char id[7];
+	u8 gpio_local_data;
+	u8 gpio_input_ctrl;
+	u8 gpio_pin_sts;
+
+	for (i = 0; i < 6; ++i)
+		ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i]);
+	id[6] = 0;
+
+	dev_info(dev, "ID '%s'\n", id);
+
+	ub953_read(priv, UB953_REG_GENERAL_STATUS, &v);
+	dev_info(dev, "GENERAL_STATUS %#x\n", v);
+
+	ub953_read(priv, UB953_REG_CRC_ERR_CNT1, &v1);
+	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2);
+	dev_info(dev, "CRC error count %u\n", v1 | (v2 << 8));
+
+	ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v);
+	dev_info(dev, "CSI error count %u\n", v);
+
+	ub953_read(priv, UB953_REG_CSI_ERR_STATUS, &v);
+	dev_info(dev, "CSI_ERR_STATUS %#x\n", v);
+
+	ub953_read(priv, UB953_REG_CSI_ERR_DLANE01, &v);
+	dev_info(dev, "CSI_ERR_DLANE01 %#x\n", v);
+
+	ub953_read(priv, UB953_REG_CSI_ERR_DLANE23, &v);
+	dev_info(dev, "CSI_ERR_DLANE23 %#x\n", v);
+
+	ub953_read(priv, UB953_REG_CSI_ERR_CLK_LANE, &v);
+	dev_info(dev, "CSI_ERR_CLK_LANE %#x\n", v);
+
+	ub953_read(priv, UB953_REG_CSI_PKT_HDR_VC_ID, &v);
+	dev_info(dev, "CSI packet header VC %u ID %u\n", v >> 6, v & 0x3f);
+
+	ub953_read(priv, UB953_REG_PKT_HDR_WC_LSB, &v1);
+	ub953_read(priv, UB953_REG_PKT_HDR_WC_MSB, &v2);
+	dev_info(dev, "CSI packet header WC %u\n", (v2 << 8) | v1);
+
+	ub953_read(priv, UB953_REG_CSI_ECC, &v);
+	dev_info(dev, "CSI ECC %#x\n", v);
+
+	ub953_read(priv, UB953_REG_LOCAL_GPIO_DATA, &gpio_local_data);
+	ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl);
+	ub953_read(priv, UB953_REG_GPIO_PIN_STS, &gpio_pin_sts);
+
+	for (i = 0; i < UB953_NUM_GPIOS; ++i) {
+		dev_info(dev,
+			 "GPIO%u: remote: %u is_input: %u is_output: %u val: %u sts: %u\n",
+			 i,
+			 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(i)),
+			 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(i)),
+			 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_OUT_EN(i)),
+			 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(i)),
+			 !!(gpio_pin_sts & UB953_REG_GPIO_PIN_STS_GPIO_STS(i)));
+	}
+
+	return 0;
+}
+
+static int ub953_enable_streams(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state, u32 pad,
+				u64 streams_mask)
+{
+	struct ub953_data *priv = sd_to_ub953(sd);
+	struct media_pad *remote_pad;
+	u64 sink_streams;
+	int ret;
+
+	if (streams_mask & priv->enabled_source_streams)
+		return -EALREADY;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(
+		state, UB953_PAD_SOURCE, UB953_PAD_SINK, &streams_mask);
+
+	remote_pad = media_pad_remote_pad_first(&priv->pads[UB953_PAD_SINK]);
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
+static int ub953_disable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct ub953_data *priv = sd_to_ub953(sd);
+	struct media_pad *remote_pad;
+	int ret;
+	u64 sink_streams;
+
+	if ((streams_mask & priv->enabled_source_streams) != streams_mask)
+		return -EALREADY;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(
+		state, UB953_PAD_SOURCE, UB953_PAD_SINK, &streams_mask);
+
+	remote_pad = media_pad_remote_pad_first(&priv->pads[UB953_PAD_SINK]);
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
+static const struct v4l2_subdev_pad_ops ub953_pad_ops = {
+	.enable_streams = ub953_enable_streams,
+	.disable_streams = ub953_disable_streams,
+	.set_routing = ub953_set_routing,
+	.get_frame_desc = ub953_get_frame_desc,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ub953_set_fmt,
+	.init_cfg = ub953_init_cfg,
+};
+
+static const struct v4l2_subdev_core_ops ub953_subdev_core_ops = {
+	.log_status		= ub953_log_status,
+	.subscribe_event	= v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops ub953_subdev_ops = {
+	.core = &ub953_subdev_core_ops,
+	.pad = &ub953_pad_ops,
+};
+
+static const struct media_entity_operations ub953_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+enum {
+	TEST_PATTERN_DISABLED = 0,
+	TEST_PATTERN_V_COLOR_BARS_1,
+	TEST_PATTERN_V_COLOR_BARS_2,
+	TEST_PATTERN_V_COLOR_BARS_4,
+	TEST_PATTERN_V_COLOR_BARS_8,
+};
+
+static const char *const ub953_tpg_qmenu[] = {
+	"Disabled",
+	"1 vertical color bar",
+	"2 vertical color bars",
+	"4 vertical color bars",
+	"8 vertical color bars",
+};
+
+static void ub953_enable_tpg(struct ub953_data *priv, int tpg_num)
+{
+	struct v4l2_subdev *sd = &priv->sd;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	u8 vbp, vfp;
+	u16 blank_lines;
+	u16 width;
+	u16 height;
+
+	u16 bytespp = 2; /* For MEDIA_BUS_FMT_UYVY8_1X16 */
+	u8 cbars_idx = tpg_num - TEST_PATTERN_V_COLOR_BARS_1;
+	u8 num_cbars = 1 << cbars_idx;
+
+	u16 line_size; /* Line size [bytes] */
+	u16 bar_size; /* cbar size [bytes] */
+	u16 act_lpf; /* active lines/frame */
+	u16 tot_lpf; /* tot lines/frame */
+	u16 line_pd; /* Line period in 10-ns units */
+
+	u16 fps = 30;
+
+	vbp = 33;
+	vfp = 10;
+	blank_lines = vbp + vfp + 2; /* total blanking lines */
+
+	state = v4l2_subdev_get_locked_active_state(sd);
+
+	fmt = v4l2_subdev_state_get_stream_format(state, UB953_PAD_SOURCE, 0);
+
+	width = fmt->width;
+	height = fmt->height;
+
+	line_size = width * bytespp;
+	bar_size = line_size / num_cbars;
+	act_lpf = height;
+	tot_lpf = act_lpf + blank_lines;
+	line_pd = 100000000 / fps / tot_lpf;
+
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CTL,
+			UB953_IND_PGEN_CTL_PGEN_ENABLE);
+
+	/* YUV422 8bit: 2 bytes/block, CSI-2 data type 0x1e */
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CFG,
+			cbars_idx << 4 | 0x2);
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CSI_DI,
+			0x1e);
+
+	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
+			  UB953_IND_PGEN_LINE_SIZE1, line_size);
+	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
+			  UB953_IND_PGEN_BAR_SIZE1, bar_size);
+	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
+			  UB953_IND_PGEN_ACT_LPF1, act_lpf);
+	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
+			  UB953_IND_PGEN_TOT_LPF1, tot_lpf);
+	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
+			  UB953_IND_PGEN_LINE_PD1, line_pd);
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VBP,
+			vbp);
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VFP,
+			vfp);
+}
+
+static void ub953_disable_tpg(struct ub953_data *priv)
+{
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CTL,
+			0x0);
+}
+
+static int ub953_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ub953_data *priv =
+		container_of(ctrl->handler, struct ub953_data, ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		if (ctrl->val == 0)
+			ub953_disable_tpg(priv);
+		else
+			ub953_enable_tpg(priv, ctrl->val);
+		break;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops ub953_ctrl_ops = {
+	.s_ctrl = ub953_s_ctrl,
+};
+
+static int ub953_notify_bound(struct v4l2_async_notifier *notifier,
+			      struct v4l2_subdev *source_subdev,
+			      struct v4l2_async_subdev *asd)
+{
+	struct ub953_data *priv = sd_to_ub953(notifier->sd);
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
+	ret = media_create_pad_link(
+		&source_subdev->entity, src_pad, &priv->sd.entity, 0,
+		MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
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
+static void ub953_notify_unbind(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *source_subdev,
+				struct v4l2_async_subdev *asd)
+{
+	struct ub953_data *priv = sd_to_ub953(notifier->sd);
+	struct device *dev = &priv->client->dev;
+
+	dev_dbg(dev, "Unbind %s\n", source_subdev->name);
+}
+
+static const struct v4l2_async_notifier_operations ub953_notify_ops = {
+	.bound = ub953_notify_bound,
+	.unbind = ub953_notify_unbind,
+};
+
+static int ub953_v4l2_notifier_register(struct ub953_data *priv)
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
+	priv->notifier.ops = &ub953_notify_ops;
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
+static void ub953_v4l2_notifier_unregister(struct ub953_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+
+	dev_dbg(dev, "Unregister async notif\n");
+
+	v4l2_async_nf_unregister(&priv->notifier);
+	v4l2_async_nf_cleanup(&priv->notifier);
+}
+
+/*
+ * Probing
+ */
+
+static int ub953_i2c_master_init(struct ub953_data *priv)
+{
+	/* i2c fast mode */
+	u32 ref = 26250000;
+	u32 scl_high = 915; /* ns */
+	u32 scl_low = 1641; /* ns */
+	int ret;
+
+	scl_high = div64_u64((u64)scl_high * ref, 1000000000) - 5;
+	scl_low = div64_u64((u64)scl_low * ref, 1000000000) - 5;
+
+	ret = ub953_write(priv, UB953_REG_SCL_HIGH_TIME, scl_high);
+	if (ret)
+		return ret;
+
+	ret = ub953_write(priv, UB953_REG_SCL_LOW_TIME, scl_low);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ub953_parse_dt(struct ub953_data *priv)
+{
+	struct device_node *np = priv->client->dev.of_node;
+	struct device *dev = &priv->client->dev;
+	struct device_node *ep_np;
+	int ret;
+
+	if (!np) {
+		dev_err(dev, "OF: no device tree node!\n");
+		return -ENOENT;
+	}
+
+	ep_np = of_graph_get_endpoint_by_regs(np, 0, 0);
+	if (!ep_np) {
+		dev_err(dev, "OF: no endpoint\n");
+		return -ENOENT;
+	}
+
+	ret = of_property_count_u32_elems(ep_np, "data-lanes");
+	if (ret <= 0) {
+		dev_err(dev, "OF: failed to parse data-lanes: %d\n", ret);
+		return ret;
+	}
+
+	if (ret != 1 && ret != 2 && ret != 4) {
+		dev_err(dev, "OF: bad number of data-lanes: %d\n", ret);
+		return -EINVAL;
+	}
+
+	priv->num_data_lanes = ret;
+
+	return 0;
+}
+
+static const struct regmap_config ub953_regmap_config = {
+	.name = "ds90ub953",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_format_endian = REGMAP_ENDIAN_DEFAULT,
+	.val_format_endian = REGMAP_ENDIAN_DEFAULT,
+};
+
+static u64 ub953_get_fc_rate(struct ub953_data *priv)
+{
+	if (priv->hw_data->ub971) {
+		switch (priv->mode) {
+		case UB953_MODE_SYNC:
+			return priv->plat_data->bc_rate * 160ull;
+		default:
+			/* Not supported */
+			return 0;
+		}
+	} else {
+		switch (priv->mode) {
+		case UB953_MODE_SYNC:
+			return priv->plat_data->bc_rate / 2 * 160ull;
+		default:
+			/* Not supported */
+			return 0;
+		}
+	}
+}
+
+static unsigned long ub953_calc_clkout_ub953(struct ub953_data *priv,
+					     unsigned long target, u64 fc,
+					     u8 *hs_div, u8 *m, u8 *n)
+{
+	/*
+	 * We always use 4 as a pre-divider (HS_CLK_DIV = 2).
+	 *
+	 * According to the datasheet:
+	 * - "HS_CLK_DIV typically should be set to either 16, 8, or 4 (default)."
+	 * - "if it is not possible to have an integer ratio of N/M, it is best to
+	 *    select a smaller value for HS_CLK_DIV.
+	 *
+	 * For above reasons the default HS_CLK_DIV seems the best in the average
+	 * case. Use always that value to keep the code simple.
+	 */
+	static const unsigned long hs_clk_div = 4;
+
+	u64 fc_divided;
+	unsigned long mul, div;
+	unsigned long res;
+
+	/* clkout = fc / hs_clk_div * m / n */
+
+	fc_divided = div_u64(fc, hs_clk_div);
+
+	rational_best_approximation(target, fc_divided, (1 << 5) - 1,
+				    (1 << 8) - 1, &mul, &div);
+
+	res = div_u64(fc_divided * mul, div);
+
+	*hs_div = hs_clk_div;
+	*m = mul;
+	*n = div;
+
+	return res;
+}
+
+static unsigned long ub953_calc_clkout_ub971(struct ub953_data *priv,
+					     unsigned long target, u64 fc,
+					     u8 *m, u8 *n)
+{
+	u64 fc_divided;
+	unsigned long mul, div;
+	unsigned long res;
+
+	/* clkout = fc * m / (8 * n) */
+
+	fc_divided = div_u64(fc, 8);
+
+	rational_best_approximation(target, fc_divided, (1 << 5) - 1,
+				    (1 << 8) - 1, &mul, &div);
+
+	res = div_u64(fc_divided * mul, div);
+
+	*m = mul;
+	*n = div;
+
+	return res;
+}
+
+static unsigned long ub953_clkout_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
+	struct device *dev = &priv->client->dev;
+	u8 ctrl0, ctrl1;
+	u32 mul, div;
+	u64 fc_rate;
+	u32 hs_clk_div;
+	u64 rate;
+	int ret;
+
+	ret = ub953_read(priv, UB953_REG_CLKOUT_CTRL0, &ctrl0);
+	if (ret) {
+		dev_err(dev, "Failed to read CLKOUT_CTRL0: %d\n", ret);
+		return 0;
+	}
+
+	ret = ub953_read(priv, UB953_REG_CLKOUT_CTRL1, &ctrl1);
+	if (ret) {
+		dev_err(dev, "Failed to read CLKOUT_CTRL1: %d\n", ret);
+		return 0;
+	}
+
+	fc_rate = ub953_get_fc_rate(priv);
+
+	if (priv->hw_data->ub971) {
+		mul = ctrl0 & 0x1f;
+		div = ctrl1;
+
+		if (div == 0)
+			return 0;
+
+		rate = div_u64(fc_rate * mul, 8 * div);
+
+		dev_dbg(dev, "clkout: fc rate %llu, mul %u, div %u = %llu\n",
+			fc_rate, mul, div, rate);
+	} else {
+		mul = ctrl0 & 0x1f;
+		hs_clk_div = 1 << (ctrl0 >> 5);
+		div = ctrl1;
+
+		if (div == 0)
+			return 0;
+
+		rate = div_u64(div_u64(fc_rate, hs_clk_div) * mul, div);
+
+		dev_dbg(dev,
+			"clkout: fc rate %llu, hs_clk_div %u, mul %u, div %u = %llu\n",
+			fc_rate, hs_clk_div, mul, div, rate);
+	}
+
+	return rate;
+}
+
+static long ub953_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *parent_rate)
+{
+	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
+	struct device *dev = &priv->client->dev;
+	unsigned long res;
+	u64 fc_rate;
+	u8 hs_div, m, n;
+
+	fc_rate = ub953_get_fc_rate(priv);
+
+	if (priv->hw_data->ub971) {
+		res = ub953_calc_clkout_ub971(priv, rate, fc_rate, &m, &n);
+
+		dev_dbg(dev,
+			"%s %llu * %u / (8 * %u) = %lu (requested %lu)",
+			__func__, fc_rate, m, n, res, rate);
+	} else {
+		res = ub953_calc_clkout_ub953(priv, rate, fc_rate, &hs_div, &m, &n);
+
+		dev_dbg(dev,
+			"%s %llu / %u * %u / %u = %lu (requested %lu)",
+			__func__, fc_rate, hs_div, m, n, res, rate);
+	}
+
+	return res;
+}
+
+static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
+	u64 fc_rate;
+	u8 hs_div, m, n;
+	unsigned long res;
+
+	fc_rate = ub953_get_fc_rate(priv);
+
+	if (priv->hw_data->ub971) {
+		res = ub953_calc_clkout_ub971(priv, rate, fc_rate, &m, &n);
+
+		ub953_write(priv, UB953_REG_CLKOUT_CTRL0, m);
+		ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
+	} else {
+		res = ub953_calc_clkout_ub953(priv, rate, fc_rate, &hs_div, &m, &n);
+
+		ub953_write(priv, UB953_REG_CLKOUT_CTRL0, (__ffs(hs_div) << 5) | m);
+		ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
+	}
+
+	dev_dbg(&priv->client->dev,
+		"%s %lu (requested %lu)\n", __func__, res, rate);
+
+	return 0;
+}
+
+static const struct clk_ops ub953_clkout_ops = {
+	.recalc_rate	= ub953_clkout_recalc_rate,
+	.round_rate	= ub953_clkout_round_rate,
+	.set_rate	= ub953_clkout_set_rate,
+};
+
+static void ub953_init_clkout_ub953(struct ub953_data *priv)
+{
+	u64 fc_rate;
+	u8 hs_div, m, n;
+
+	fc_rate = ub953_get_fc_rate(priv);
+
+	ub953_calc_clkout_ub953(priv, 25000000, fc_rate, &hs_div, &m, &n);
+
+	ub953_write(priv, UB953_REG_CLKOUT_CTRL0, (__ffs(hs_div) << 5) | m);
+	ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
+}
+
+static void ub953_init_clkout_ub971(struct ub953_data *priv)
+{
+	u64 fc_rate;
+	u8 m, n;
+
+	fc_rate = ub953_get_fc_rate(priv);
+
+	ub953_calc_clkout_ub971(priv, 25000000, fc_rate, &m, &n);
+
+	ub953_write(priv, UB953_REG_CLKOUT_CTRL0, m);
+	ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
+}
+
+static int ub953_register_clkout(struct ub953_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	const struct clk_init_data init = {
+		.name = kasprintf(GFP_KERNEL, "ds90%s.%s.clk_out",
+				  priv->hw_data->model, dev_name(dev)),
+		.ops = &ub953_clkout_ops,
+	};
+	int ret;
+
+	/* Initialize clkout to 25MHz by default */
+	if (priv->hw_data->ub971)
+		ub953_init_clkout_ub971(priv);
+	else
+		ub953_init_clkout_ub953(priv);
+
+	priv->clkout_clk_hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &priv->clkout_clk_hw);
+	kfree(init.name);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register clock HW\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					  &priv->clkout_clk_hw);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Cannot add OF clock provider\n");
+
+	return 0;
+}
+
+static int ub953_add_i2c_adapter(struct ub953_data *priv)
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
+static void ub953_remove_i2c_adapter(struct ub953_data *priv)
+{
+	if (priv->has_i2c_adapter)
+		i2c_atr_del_adapter(priv->plat_data->atr,
+				    priv->plat_data->port);
+}
+
+static int ub953_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ub953_data *priv;
+	int ret;
+	u8 v;
+	bool mode_override;
+
+	dev_dbg(dev, "probing, addr 0x%02x\n", client->addr);
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
+	if (!priv->plat_data) {
+		dev_err(dev, "Platform data missing\n");
+		return -ENODEV;
+	}
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
+		dev_err(dev, "Failed to init regmap\n");
+		ret = PTR_ERR(priv->regmap);
+		goto err_mutex_destroy;
+	}
+
+	ret = ub953_parse_dt(priv);
+	if (ret)
+		goto err_mutex_destroy;
+
+	ret = ub953_read(priv, UB953_REG_MODE_SEL, &v);
+	if (ret)
+		goto err_mutex_destroy;
+
+	if (!(v & BIT(3))) {
+		dev_err(dev, "Mode value not stabilized\n");
+		ret = -ENODEV;
+		goto err_mutex_destroy;
+	}
+
+	mode_override = v & BIT(4);
+
+	switch (v & 0x7) {
+	case 0:
+		priv->mode = UB953_MODE_SYNC;
+		break;
+	case 2:
+		priv->mode = UB953_MODE_NONSYNC_EXT;
+		break;
+	case 3:
+		priv->mode = UB953_MODE_NONSYNC_INT;
+		break;
+	case 5:
+		priv->mode = UB953_MODE_DVP;
+		break;
+	default:
+		dev_err(dev, "Illegal mode in mode register\n");
+		ret = -ENODEV;
+		goto err_mutex_destroy;
+	}
+
+	dev_dbg(dev, "mode from %s: %#x\n", mode_override ? "reg" : "strap",
+		priv->mode);
+
+	if (priv->mode != UB953_MODE_SYNC) {
+		dev_err(dev, "Only synchronous mode supported\n");
+		ret = -ENODEV;
+		goto err_mutex_destroy;
+	}
+
+	ret = ub953_read(priv, UB953_REG_REV_MASK_ID, &v);
+	if (ret) {
+		dev_err(dev, "Failed to read revision: %d", ret);
+		goto err_mutex_destroy;
+	}
+
+	dev_info(dev, "Found %s rev/mask %#04x\n", priv->hw_data->model, v);
+
+	ret = ub953_read(priv, UB953_REG_GENERAL_CFG, &v);
+	if (ret)
+		goto err_mutex_destroy;
+
+	dev_dbg(dev, "i2c strap setting %s V\n", (v & 1) ? "1.8" : "3.3");
+
+	ret = ub953_i2c_master_init(priv);
+	if (ret) {
+		dev_err(dev, "i2c init failed: %d\n", ret);
+		goto err_mutex_destroy;
+	}
+
+	ret = ub953_gpiochip_probe(priv);
+	if (ret) {
+		dev_err(dev, "Failed to init gpiochip\n");
+		goto err_mutex_destroy;
+	}
+
+	ub953_write(priv, UB953_REG_GENERAL_CFG,
+		    (1 << 6) | /* continuous clk */
+		    ((priv->num_data_lanes - 1) << 4) |
+		    (1 << 1)); /* CRC TX gen */
+
+	ret = ub953_register_clkout(priv);
+	if (ret) {
+		dev_err(dev, "Failed to register clkout\n");
+		goto err_gpiochip_remove;
+	}
+
+	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub953_subdev_ops);
+
+	v4l2_ctrl_handler_init(&priv->ctrl_handler,
+			       ARRAY_SIZE(ub953_tpg_qmenu) - 1);
+	priv->sd.ctrl_handler = &priv->ctrl_handler;
+
+	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &ub953_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ub953_tpg_qmenu) - 1, 0, 0,
+				     ub953_tpg_qmenu);
+
+	if (priv->ctrl_handler.error) {
+		ret = priv->ctrl_handler.error;
+		goto err_gpiochip_remove;
+	}
+
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS |
+		V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	priv->sd.entity.ops = &ub953_entity_ops;
+
+	priv->pads[0].flags = MEDIA_PAD_FL_SINK;
+	priv->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
+	if (ret) {
+		dev_err(dev, "Failed to init pads\n");
+		goto err_remove_ctrls;
+	}
+
+	priv->tx_ep_np = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);
+	priv->sd.fwnode = of_fwnode_handle(priv->tx_ep_np);
+
+	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
+
+	ret = v4l2_subdev_init_finalize(&priv->sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = ub953_v4l2_notifier_register(priv);
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
+	ret = ub953_add_i2c_adapter(priv);
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
+	ub953_v4l2_notifier_unregister(priv);
+err_free_state:
+	v4l2_subdev_cleanup(&priv->sd);
+err_entity_cleanup:
+	if (priv->tx_ep_np)
+		of_node_put(priv->tx_ep_np);
+
+	media_entity_cleanup(&priv->sd.entity);
+err_remove_ctrls:
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
+err_gpiochip_remove:
+	ub953_gpiochip_remove(priv);
+err_mutex_destroy:
+	mutex_destroy(&priv->reg_lock);
+
+	return ret;
+}
+
+static void ub953_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ub953_data *priv = sd_to_ub953(sd);
+
+	dev_dbg(&client->dev, "Removing\n");
+
+	ub953_remove_i2c_adapter(priv);
+
+	v4l2_async_unregister_subdev(&priv->sd);
+
+	ub953_v4l2_notifier_unregister(priv);
+
+	v4l2_subdev_cleanup(&priv->sd);
+
+	of_node_put(priv->tx_ep_np);
+
+	media_entity_cleanup(&priv->sd.entity);
+
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
+
+	ub953_gpiochip_remove(priv);
+	mutex_destroy(&priv->reg_lock);
+}
+
+static const struct ub953_hw_data ds90ub953_hw = {
+	.model = "ub953",
+};
+
+static const struct ub953_hw_data ds90ub971_hw = {
+	.model = "ub971",
+	.ub971 = true,
+};
+
+static const struct i2c_device_id ub953_id[] = {
+	{ "ds90ub953-q1", 0 },
+	{ "ds90ub971-q1", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ub953_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id ub953_dt_ids[] = {
+	{ .compatible = "ti,ds90ub953-q1", .data = &ds90ub953_hw },
+	{ .compatible = "ti,ds90ub971-q1", .data = &ds90ub971_hw },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ub953_dt_ids);
+#endif
+
+static struct i2c_driver ds90ub953_driver = {
+	.probe_new	= ub953_probe,
+	.remove		= ub953_remove,
+	.id_table	= ub953_id,
+	.driver = {
+		.name	= "ds90ub953",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(ub953_dt_ids),
+	},
+};
+
+module_i2c_driver(ds90ub953_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Texas Instruments DS90UB953 serializer driver");
+MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
+MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
-- 
2.34.1

