Return-Path: <linux-i2c+bounces-2069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB5986D1B7
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E3D41F23691
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31DB13F430;
	Thu, 29 Feb 2024 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BQi7DEoh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF5E13441D;
	Thu, 29 Feb 2024 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230263; cv=none; b=G0mh2GaPk5eEM8VJ0AccgARAAt2ZQl4SxjnQ00Kqb6d4xdNIX0sQvGiVOhE667hPG1RPp0HtauY8EcpPVXzgiflRWLSpFV0EWy79JRFwY+GoL/AXqRbAXdEc+k1Qh6BVv8NguVMe3/jgvfH8vCEkvFahoAcSxkw4pt/P9yZZ898=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230263; c=relaxed/simple;
	bh=NqQc8qcB0z/vjSE2WkXamEFOpcnSH8x4TRBiVt2d7/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aK1MbkRHUqjlTKVVW0P2DmvMji4LwlUH5VRjkyJ7Vebta6rFzrdaxedfnGdrNLwiY0RSp+0Vy42skUlgmtq9QPIDc5Rg5eDuXaW5UH/3jzJpl55xZPy1UJcQ1tTnell5qgElpjkHh1JCquQkaNUl2UBs3tdz2EiC0HSbcv5GInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BQi7DEoh; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F3E86000E;
	Thu, 29 Feb 2024 18:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pOta+V7OJL6x1zp8zUhluMUBMsgdMQFzswvhqezMeI=;
	b=BQi7DEohiIRt2iE8wcUxfo+gBE9Znfh9s32OYg0akkZBHPxnPe0bGtdiNwF48LDduKgNa+
	DBfB9VvZ7i6KxLJxGxb+ExP64noB5O7StJ5tcVf7ndoZgXGE1bvCaC6qhLQe8e6fDXK0h4
	uc1mAfdIQMQC3/MQqaz4gs3MlGyQDVJTPJ01yoVS/jZZOh+UHTeeo5h39ERnHwfIRU3iUe
	qXwFgox5PN72eTC1kKFbrL9U/wxQE6wHbLITI2eRPDjU+EjtdQtrvrUD8cnYy6jPk85cyL
	L9r4/nGxKnp/esSEeC9FDOmjRg11afegSG9+GehedP/wZ9oz0PNjRAtKC9O7GQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 29 Feb 2024 19:10:57 +0100
Subject: [PATCH v2 09/11] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-mbly-i2c-v2-9-b32ed18c098c@bootlin.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Add compatible for the integration of the same DB8500 IP block into the
Mobileye EyeQ5 platform. Two quirks are present:

 - The memory bus only supports 32-bit accesses. Avoid writeb() and
   readb() by introducing helper functions that fallback to writel()
   and readl().

 - A register must be configured for the I2C speed mode; it is located
   in a shared register region called OLB. We access that memory region
   using a syscon & regmap that gets passed as a phandle (mobileye,olb).

   A two-bit enum per controller is written into the register; that
   requires us to know the global index of the I2C controller (cell arg
   to the mobileye,olb phandle).

We add #include <linux/mfd/syscon.h> and <linux/regmap.h> and sort
headers.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 95 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 84 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 2d3247979e45..e9a77377add4 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -6,22 +6,30 @@
  * I2C master mode controller driver, used in Nomadik 8815
  * and Ux500 platforms.
  *
+ * The Mobileye EyeQ5 platform is also supported; it uses
+ * the same Ux500/DB8500 IP block with two quirks:
+ *  - The memory bus only supports 32-bit accesses.
+ *  - A register must be configured for the I2C speed mode;
+ *    it is located in a shared register region called OLB.
+ *
  * Author: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
  * Author: Sachin Verma <sachin.verma@st.com>
  */
+#include <linux/amba/bus.h>
 #include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/module.h>
-#include <linux/amba/bus.h>
-#include <linux/slab.h>
 #include <linux/interrupt.h>
-#include <linux/i2c.h>
-#include <linux/err.h>
-#include <linux/clk.h>
 #include <linux/io.h>
-#include <linux/pm_runtime.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
 
 #define DRIVER_NAME "nmk-i2c"
 
@@ -110,6 +118,10 @@ enum i2c_freq_mode {
 	I2C_FREQ_MODE_FAST_PLUS,	/* up to 1 Mb/s */
 };
 
+/* Mobileye EyeQ5 offset into a shared register region (called OLB) */
+#define NMK_I2C_EYEQ5_OLB_IOCR2			0x0B8
+#define NMK_I2C_EYEQ5_OLB_IOCR2_SHIFT(id)	(4 + 2 * (id))
+
 /**
  * struct i2c_vendor_data - per-vendor variations
  * @has_mtdws: variant has the MTDWS bit
@@ -168,6 +180,7 @@ struct i2c_nmk_client {
  * @xfer_wq: xfer done wait queue.
  * @xfer_done: xfer done boolean.
  * @result: controller propogated result.
+ * @has_32b_bus: controller is on a bus that only supports 32-bit accesses.
  */
 struct nmk_i2c_dev {
 	struct i2c_vendor_data		*vendor;
@@ -186,6 +199,7 @@ struct nmk_i2c_dev {
 	struct wait_queue_head		xfer_wq;
 	bool				xfer_done;
 	int				result;
+	bool				has_32b_bus;
 };
 
 /* controller's abort causes */
@@ -209,6 +223,24 @@ static inline void i2c_clr_bit(void __iomem *reg, u32 mask)
 	writel(readl(reg) & ~mask, reg);
 }
 
+static inline u8 nmk_i2c_readb(const struct nmk_i2c_dev *priv,
+			       unsigned long reg)
+{
+	if (priv->has_32b_bus)
+		return readl(priv->virtbase + reg);
+	else
+		return readb(priv->virtbase + reg);
+}
+
+static inline void nmk_i2c_writeb(const struct nmk_i2c_dev *priv, u32 val,
+				unsigned long reg)
+{
+	if (priv->has_32b_bus)
+		writel(val, priv->virtbase + reg);
+	else
+		writeb(val, priv->virtbase + reg);
+}
+
 /**
  * flush_i2c_fifo() - This function flushes the I2C FIFO
  * @priv: private data of I2C Driver
@@ -514,7 +546,7 @@ static void fill_tx_fifo(struct nmk_i2c_dev *priv, int no_bytes)
 			(priv->cli.count != 0);
 			count--) {
 		/* write to the Tx FIFO */
-		writeb(*priv->cli.buffer, priv->virtbase + I2C_TFR);
+		nmk_i2c_writeb(priv, *priv->cli.buffer, I2C_TFR);
 		priv->cli.buffer++;
 		priv->cli.count--;
 		priv->cli.xfer_bytes++;
@@ -783,7 +815,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	case I2C_IT_RXFNF:
 		for (count = rft; count > 0; count--) {
 			/* Read the Rx FIFO */
-			*priv->cli.buffer = readb(priv->virtbase + I2C_RFR);
+			*priv->cli.buffer = nmk_i2c_readb(priv, I2C_RFR);
 			priv->cli.buffer++;
 		}
 		priv->cli.count -= rft;
@@ -793,7 +825,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	/* Rx FIFO full */
 	case I2C_IT_RXFF:
 		for (count = MAX_I2C_FIFO_THRESHOLD; count > 0; count--) {
-			*priv->cli.buffer = readb(priv->virtbase + I2C_RFR);
+			*priv->cli.buffer = nmk_i2c_readb(priv, I2C_RFR);
 			priv->cli.buffer++;
 		}
 		priv->cli.count -= MAX_I2C_FIFO_THRESHOLD;
@@ -809,7 +841,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 				if (priv->cli.count == 0)
 					break;
 				*priv->cli.buffer =
-					readb(priv->virtbase + I2C_RFR);
+					nmk_i2c_readb(priv, I2C_RFR);
 				priv->cli.buffer++;
 				priv->cli.count--;
 				priv->cli.xfer_bytes++;
@@ -985,6 +1017,38 @@ static void nmk_i2c_of_probe(struct device_node *np,
 		priv->timeout_usecs = 200 * USEC_PER_MSEC;
 }
 
+static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
+{
+	struct device *dev = &priv->adev->dev;
+	struct device_node *np = dev->of_node;
+	unsigned int shift, speed_mode;
+	struct regmap *olb;
+	unsigned int id;
+
+	priv->has_32b_bus = true;
+
+	olb = syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &id);
+	if (IS_ERR_OR_NULL(olb)) {
+		if (!olb)
+			olb = ERR_PTR(-ENOENT);
+		return dev_err_probe(dev, PTR_ERR(olb),
+				     "failed OLB lookup: %lu\n", PTR_ERR(olb));
+	}
+
+	if (priv->clk_freq <= 400000)
+		speed_mode = 0b00;
+	else if (priv->clk_freq <= 1000000)
+		speed_mode = 0b01;
+	else
+		speed_mode = 0b10;
+
+	shift = NMK_I2C_EYEQ5_OLB_IOCR2_SHIFT(id);
+	regmap_update_bits(olb, NMK_I2C_EYEQ5_OLB_IOCR2,
+			   0b11 << shift, speed_mode << shift);
+
+	return 0;
+}
+
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	int ret = 0;
@@ -1001,8 +1065,17 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 
 	priv->vendor = vendor;
 	priv->adev = adev;
+	priv->has_32b_bus = false;
 	nmk_i2c_of_probe(np, priv);
 
+	if (of_device_is_compatible(np, "mobileye,eyeq5-i2c")) {
+		ret = nmk_i2c_eyeq5_probe(priv);
+		if (ret) {
+			dev_info(dev, "%s: %d: %d\n", __func__, __LINE__, ret);
+			return ret;
+		}
+	}
+
 	if (priv->tft > max_fifo_threshold) {
 		dev_warn(dev, "requested TX FIFO threshold %u, adjusted down to %u\n",
 			 priv->tft, max_fifo_threshold);

-- 
2.44.0


