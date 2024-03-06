Return-Path: <linux-i2c+bounces-2222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F5A873DE9
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFBB1282B50
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 17:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE8F13E7C9;
	Wed,  6 Mar 2024 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Zio+a3KE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D43013BAE8;
	Wed,  6 Mar 2024 17:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747974; cv=none; b=o+m4K+GbSucSBJv/sd8148SqgnvyqKkOqFX6jLqscMAswoO9EhBpMSCZU6uD8Z6x5+9FACXSBbhLz5pPb8nYaMfI70fZAMxqsYbmXiFPq4ubJEi+O8WH4MlYhLi08l39SZHOL9kwLKOXaatGUorTqZrjDyPf6tSH4RntbqFrndg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747974; c=relaxed/simple;
	bh=wgh9N+CBwM+aLjQ27FC0mOmFRQB+O0TwEfCz4geWpIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5taDnps7b5Uku/HLMUbWJlU8UZssEFJ9MO5Ra6ZW3yMctWv4hfc49talMz0VunnwNNbRexdZp/fPAUzrzUP36cCMaG2TT79kU9FI99qEtpKf+T4mdyyXBmtypLMHdvX6OD2n6hXwxVOeBSegjPclwaHXSr0vDBS0dac/wMFKoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Zio+a3KE; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 344424000C;
	Wed,  6 Mar 2024 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709747968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EX9mJDEuqhUN3QW7p56boj+54Mj8nqPeRzDwy82z70=;
	b=Zio+a3KEXeQf48OxvYj7ANhA3w9M6odw+pGds9x6jNnUAP3WmOqyj/VNrZkXU8etxXVGld
	7eTgLVs2Ij+gvy/3Dqoczmymq0qJ9OUB4ukHODzCbFXs6QiGqFVwwLI720iwlbKVELvBye
	kz6BMOOICV7ioSLjzxzchvj6Ply91GZZcLahCOoJtC6vZKWT5O7jl/OvgrdjwkXVUgjH2Z
	5R4HCOIgNy0MJ76skYpJQgWSq7LrEUKi+/S15Aslu41USRz+8Yr1whWsEQZbUH6AtLdyyu
	q0nckTBXSz6wnAlMtrmU9uo60dtpGauTc5zUp1I+PCRV3dfjFPl55uJjgzXnWA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Mar 2024 18:59:28 +0100
Subject: [PATCH v3 08/11] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240306-mbly-i2c-v3-8-605f866aa4ec@bootlin.com>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
In-Reply-To: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
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

We add #include <linux/mfd/syscon.h> and <linux/regmap.h>.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 90 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 2e738b18677e..7d039bd36aa6 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -6,6 +6,12 @@
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
@@ -22,6 +28,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 #define DRIVER_NAME "nmk-i2c"
 
@@ -110,6 +118,15 @@ enum i2c_freq_mode {
 	I2C_FREQ_MODE_FAST_PLUS,	/* up to 1 Mb/s */
 };
 
+/* Mobileye EyeQ5 offset into a shared register region (called OLB) */
+#define NMK_I2C_EYEQ5_OLB_IOCR2			0x0B8
+
+enum i2c_eyeq5_speed {
+	I2C_EYEQ5_SPEED_FAST,
+	I2C_EYEQ5_SPEED_FAST_PLUS,
+	I2C_EYEQ5_SPEED_HIGH_SPEED,
+};
+
 /**
  * struct i2c_vendor_data - per-vendor variations
  * @has_mtdws: variant has the MTDWS bit
@@ -174,6 +191,7 @@ struct i2c_nmk_client {
  * @xfer_wq: xfer done wait queue.
  * @xfer_done: xfer done boolean.
  * @result: controller propogated result.
+ * @has_32b_bus: controller is on a bus that only supports 32-bit accesses.
  */
 struct nmk_i2c_dev {
 	struct i2c_vendor_data		*vendor;
@@ -192,6 +210,7 @@ struct nmk_i2c_dev {
 	struct wait_queue_head		xfer_wq;
 	bool				xfer_done;
 	int				result;
+	bool				has_32b_bus;
 };
 
 /* controller's abort causes */
@@ -215,6 +234,24 @@ static inline void i2c_clr_bit(void __iomem *reg, u32 mask)
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
@@ -523,7 +560,7 @@ static void fill_tx_fifo(struct nmk_i2c_dev *priv, int no_bytes)
 			(priv->cli.count != 0);
 			count--) {
 		/* write to the Tx FIFO */
-		writeb(*priv->cli.buffer, priv->virtbase + I2C_TFR);
+		nmk_i2c_writeb(priv, *priv->cli.buffer, I2C_TFR);
 		priv->cli.buffer++;
 		priv->cli.count--;
 		priv->cli.xfer_bytes++;
@@ -792,7 +829,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	case I2C_IT_RXFNF:
 		for (count = rft; count > 0; count--) {
 			/* Read the Rx FIFO */
-			*priv->cli.buffer = readb(priv->virtbase + I2C_RFR);
+			*priv->cli.buffer = nmk_i2c_readb(priv, I2C_RFR);
 			priv->cli.buffer++;
 		}
 		priv->cli.count -= rft;
@@ -802,7 +839,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	/* Rx FIFO full */
 	case I2C_IT_RXFF:
 		for (count = MAX_I2C_FIFO_THRESHOLD; count > 0; count--) {
-			*priv->cli.buffer = readb(priv->virtbase + I2C_RFR);
+			*priv->cli.buffer = nmk_i2c_readb(priv, I2C_RFR);
 			priv->cli.buffer++;
 		}
 		priv->cli.count -= MAX_I2C_FIFO_THRESHOLD;
@@ -818,7 +855,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 				if (priv->cli.count == 0)
 					break;
 				*priv->cli.buffer =
-					readb(priv->virtbase + I2C_RFR);
+					nmk_i2c_readb(priv, I2C_RFR);
 				priv->cli.buffer++;
 				priv->cli.count--;
 				priv->cli.xfer_bytes++;
@@ -996,6 +1033,44 @@ static void nmk_i2c_of_probe(struct device_node *np,
 		priv->timeout_usecs = 200 * USEC_PER_MSEC;
 }
 
+static const unsigned int nmk_i2c_eyeq5_masks[] = {
+	GENMASK(5, 4),
+	GENMASK(7, 6),
+	GENMASK(9, 8),
+	GENMASK(11, 10),
+	GENMASK(13, 12),
+};
+
+static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
+{
+	struct device *dev = &priv->adev->dev;
+	struct device_node *np = dev->of_node;
+	unsigned int mask, speed_mode;
+	struct regmap *olb;
+	unsigned int id;
+
+	priv->has_32b_bus = true;
+
+	olb = syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &id);
+	if (IS_ERR(olb))
+		return PTR_ERR(olb);
+	if (id >= ARRAY_SIZE(nmk_i2c_eyeq5_masks))
+		return -ENOENT;
+
+	if (priv->clk_freq <= 400000)
+		speed_mode = I2C_EYEQ5_SPEED_FAST;
+	else if (priv->clk_freq <= 1000000)
+		speed_mode = I2C_EYEQ5_SPEED_FAST_PLUS;
+	else
+		speed_mode = I2C_EYEQ5_SPEED_HIGH_SPEED;
+
+	mask = nmk_i2c_eyeq5_masks[id];
+	regmap_update_bits(olb, NMK_I2C_EYEQ5_OLB_IOCR2,
+			   mask, speed_mode << __fls(mask));
+
+	return 0;
+}
+
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	int ret = 0;
@@ -1012,8 +1087,15 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 
 	priv->vendor = vendor;
 	priv->adev = adev;
+	priv->has_32b_bus = false;
 	nmk_i2c_of_probe(np, priv);
 
+	if (of_device_is_compatible(np, "mobileye,eyeq5-i2c")) {
+		ret = nmk_i2c_eyeq5_probe(priv);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed OLB lookup\n");
+	}
+
 	if (priv->tft > max_fifo_threshold) {
 		dev_warn(dev, "requested TX FIFO threshold %u, adjusted down to %u\n",
 			 priv->tft, max_fifo_threshold);

-- 
2.44.0


