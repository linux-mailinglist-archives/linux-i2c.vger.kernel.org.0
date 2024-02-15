Return-Path: <linux-i2c+bounces-1759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDDD856A2B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B382B1C23FD3
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0401D136666;
	Thu, 15 Feb 2024 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lBMzkyOp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D661386BC;
	Thu, 15 Feb 2024 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015964; cv=none; b=dgQcuiYIoLnM4u+5eyZmUD78QmN6cCPxQKyEHsIFATRHS6dyg8uCAWlETkL/G4odU6VclE9w60c+WVr4RJSbUXGrDdgQj4/RMGAeYTX5jBBoB3QWgeN4yniozhsmt/Di0AIYlGfMk5k7Gcw79iYt7fjK2QEZ2q1nrtv+dwIM2PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015964; c=relaxed/simple;
	bh=8R9Ao+lgtkCyuSniKN+UVkQJ/9f7yDqduebAB9P/PtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsoDHDxlCyiSlcxYOWkCl8TWntFJmiKrDh5s08/fzZzdqHYBT3uANmKVbWDKWcCuHTWCOm27UoYdYSFlbBquAegp5BJ3VREa5uQ3v7ezn+CtKwuWblyNnJGvGZ9vd5Oo+e1LCuYdnaG6YXR8RkakW4VpEgL7oOgZOaCq5WOSAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lBMzkyOp; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFF20E0012;
	Thu, 15 Feb 2024 16:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksC5z+uQT8JX7fjtCfLqhFUJQnwzz+zL0ZliTFb1W/U=;
	b=lBMzkyOpDFvlhrVZrgierYbgIjaKk8uYd4Mg6POWHhf/fvmgCtVRID1T9hvMb8s+IAHMmY
	xDAgXA/XlkTZBq4VP1D5awK7LcvdC74dpMM5d+Bc2udUBfbHgXecGw3n0MPBaMWfQ7Mmbu
	NQvVrWFckor5TXHzty4x2nQOI4RKQ0umi1KuE2MF/xA+Qo/oXbEvxoC2RvpLjFOHpGZ+8e
	+UrKiwSg46JtzA7H8LsgtYqpGRdSCRjM2gpz+jcKEzZjzLBQth4DuO/5U4kTUIXVfdXv1C
	123wEjBROkK8w7ya6cAIHPD14OqCB1lqq6+nQYyYCb/pc4QwHYoh62wKaXKr3g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:17 +0100
Subject: [PATCH 10/13] i2c: nomadik: support Mobileye EyeQ5 I2C controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-10-19a336e91dca@bootlin.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
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
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Add compatible for the integration of the same DB8500 IP block into the
Mobileye EyeQ5 platform. Two quirks are present:

 - The memory bus only supports 32-bit accesses. One writeb() is done to
   fill the Tx FIFO which we replace with a writel().

 - A register must be configured for the I2C speed mode; it is located
   in a shared register region called OLB. We access that memory region
   using a syscon & regmap that gets passed as a phandle (mobileye,olb).

   A two-bit enum per controller is written into the register; that
   requires us to know the global index of the I2C
   controller (mobileye,id).

We add #include <linux/mfd/syscon.h> and <linux/regmap.h> and sort
headers.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 79 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 71 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 23e12c570457..eb076419dfa8 100644
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
@@ -514,7 +528,10 @@ static void fill_tx_fifo(struct nmk_i2c_dev *priv, int no_bytes)
 			(priv->cli.count != 0);
 			count--) {
 		/* write to the Tx FIFO */
-		writeb(*priv->cli.buffer, priv->virtbase + I2C_TFR);
+		if (priv->has_32b_bus)
+			writel(*priv->cli.buffer, priv->virtbase + I2C_TFR);
+		else
+			writeb(*priv->cli.buffer, priv->virtbase + I2C_TFR);
 		priv->cli.buffer++;
 		priv->cli.count--;
 		priv->cli.xfer_bytes++;
@@ -985,6 +1002,43 @@ static void nmk_i2c_of_probe(struct device_node *np,
 		priv->timeout_usecs = 200 * USEC_PER_MSEC;
 }
 
+static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
+{
+	struct device *dev = &priv->adev->dev;
+	struct device_node *np = dev->of_node;
+	unsigned int shift, speed_mode;
+	struct regmap *olb;
+	int ret;
+	u32 id;
+
+	priv->has_32b_bus = true;
+
+	olb = syscon_regmap_lookup_by_phandle(np, "mobileye,olb");
+	if (IS_ERR_OR_NULL(olb)) {
+		if (!olb)
+			olb = ERR_PTR(-ENOENT);
+		return dev_err_probe(dev, PTR_ERR(olb),
+				     "failed OLB lookup: %lu\n", PTR_ERR(olb));
+	}
+
+	ret = of_property_read_u32(np, "mobileye,id", &id);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed ID lookup: %d\n", ret);
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
@@ -1001,8 +1055,17 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 
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
2.43.1


