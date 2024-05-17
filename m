Return-Path: <linux-i2c+bounces-3564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C978C8709
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 15:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32BF11F21C5E
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 13:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DB750A67;
	Fri, 17 May 2024 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="JDHKZcgV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8C2524BE
	for <linux-i2c@vger.kernel.org>; Fri, 17 May 2024 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715951716; cv=none; b=BuFJy+H5HwHLQNXWNOO0Bfw0bD/ywRSj57vpGwN3HV8KBEdHz1PPPiVsKMqGlPiROveSwTIH8KlWFTymMZedH2DA672X9tPQ30kmpTCaZwh4FhSsu1VSP05h0do/jU3ED4VdszUyeTNiso/gpQ2Sz65rhzjN1TxJ64k6ME4Aqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715951716; c=relaxed/simple;
	bh=RsFQ+OoWI70l8JgaWfMkVQEqy2Jyx6j6QbNtAz2F3Og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vm5NRkUEQkKq/2WKI2td+4O+qivZhghIgCAcoXcK9z6H62AwqOzukuv29R2DPPudn46Fd8BrGBFUFKq1mE8x4Pgiz2OPRyiMNfutHCiolMLPmGb4QlbQFjAQ7YuRHvau5Q9WPrtD9TzkQMCkrOcbqKK6T1Yp4nSXYllOw+lNmrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=JDHKZcgV; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: broonie@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715951712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=furiSTSuRDcRd2X5RjG7qZBiz4mVfyegHighaEnbVrw=;
	b=JDHKZcgVd02Cb1jDAPb5lrgjO495Vpvj9ji4ic/EfRVzYyJQNEjMkzTNbvvHUEtnaliot9
	26zTd5DMIHj+qdqgSOoLzNOrGrBK99F4imlHxN9jhghXnM3Nf8IPXAk+Biawbp2ltvPraM
	e/jgiNIMiZp7oDb8hfl24NGNfL2OtOhHVDYENNXgJUIHz9kSHpusr4Thc7Xo6iV9m4Yd4I
	ijir9dYa/zPXHhAHbEV0iJm/d8Vo2BSww8dNlDV8dZY3PeEzwz2Vs/pzPuVEQPasS2A+QG
	CUyKyKvkMU0R2HdTOnnRDTO1sn/2WvgYyiL8eKWHCioYt6ytpxak/IwW6JWRYg==
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: rafael@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: brgl@bgdev.pl
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: perex@perex.cz
X-Envelope-To: tiwai@suse.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: linux-i2c@vger.kernel.org
X-Envelope-To: alsi@bang-olufsen.dk
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 17 May 2024 15:02:16 +0200
Subject: [PATCH 09/13] i2c: add AD24xx I2C controller driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-9-b8647554c67b@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/a2b/Kconfig             |   1 +
 drivers/clk/Kconfig             |   2 +-
 drivers/i2c/busses/Kconfig      |   7 +++
 drivers/i2c/busses/Makefile     |   1 +
 drivers/i2c/busses/i2c-ad24xx.c | 121 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/a2b/Kconfig b/drivers/a2b/Kconfig
index 08acf5728023..e3c38520a90a 100644
--- a/drivers/a2b/Kconfig
+++ b/drivers/a2b/Kconfig
@@ -36,6 +36,7 @@ config A2B_AD24XX_NODE
        imply GPIO_AD24XX
        imply SND_SOC_AD24XX
        imply COMMON_CLK_AD24XX
+       imply I2C_AD24XX
        help
          Say Y here to enable support for AD24xx A2B transceiver nodes. This
          applies to both main nodes and subordinate nodes. Supported models
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index a3d54b077e68..460762f44434 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -258,7 +258,7 @@ config COMMON_CLK_LAN966X
 	  within the SoC.
 
 config COMMON_CLK_AD24XX
-	bool "Clock driver for Analog Devices Inc. AD24xx"
+	tristate "Clock driver for Analog Devices Inc. AD24xx"
 	depends on A2B_AD24XX_NODE
 	help
 	  This driver supports the clock output functionality of AD24xx series
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fe6e8a1bb607..d1f303bd7c90 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1387,6 +1387,13 @@ config I2C_ACORN
 
 	  If you don't know, say Y.
 
+config I2C_AD24XX
+	tristate "Analog Devices Inc. AD24xx I2C controller support"
+	depends on A2B_AD24XX_NODE
+	help
+	  Say yes if you want to support the I2C controller function of AD24xx
+	  A2B transceiver chips.
+
 config I2C_ELEKTOR
 	tristate "Elektor ISA card"
 	depends on ISA && HAS_IOPORT_MAP && BROKEN_ON_SMP
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3d65934f5eb4..892a32b02267 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -145,6 +145,7 @@ obj-$(CONFIG_I2C_VIPERBOARD)	+= i2c-viperboard.o
 
 # Other I2C/SMBus bus drivers
 obj-$(CONFIG_I2C_ACORN)		+= i2c-acorn.o
+obj-$(CONFIG_I2C_AD24XX)	+= i2c-ad24xx.o
 obj-$(CONFIG_I2C_BCM_KONA)	+= i2c-bcm-kona.o
 obj-$(CONFIG_I2C_BRCMSTB)	+= i2c-brcmstb.o
 obj-$(CONFIG_I2C_CROS_EC_TUNNEL)	+= i2c-cros-ec-tunnel.o
diff --git a/drivers/i2c/busses/i2c-ad24xx.c b/drivers/i2c/busses/i2c-ad24xx.c
new file mode 100644
index 000000000000..ad9657df25fb
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ad24xx.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AD24xx I2C controller (master) driver
+ *
+ * Copyright (c) 2023-2024 Alvin Šipraga <alsi@bang-olufsen.dk>
+ */
+
+#include <linux/a2b/a2b.h>
+#include <linux/a2b/ad24xx.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+
+struct ad24xx_i2c_adapter {
+	struct device *dev;
+	struct a2b_func *func;
+	struct a2b_node *node;
+	struct i2c_adapter adap;
+};
+
+static int ad24xx_i2c_adapter_xfer(struct i2c_adapter *adap,
+				  struct i2c_msg *msgs, int num)
+{
+	struct ad24xx_i2c_adapter *ada = i2c_get_adapdata(adap);
+	struct a2b_node *node = ada->node;
+
+	return a2b_node_i2c_xfer(node, msgs, num);
+}
+
+static u32 ad24xx_i2c_adapter_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_adapter_quirks ad24xx_i2c_adapter_quirks = {
+	.flags = I2C_AQ_COMB | I2C_AQ_COMB_SAME_ADDR,
+};
+
+static const struct i2c_algorithm ad24xx_i2c_adapter_algo = {
+	.master_xfer = ad24xx_i2c_adapter_xfer,
+	.functionality = ad24xx_i2c_adapter_functionality,
+};
+
+static int ad24xx_i2c_adapter_probe(struct device *dev)
+{
+	struct a2b_func *func = to_a2b_func(dev);
+	struct device_node *np = dev->of_node;
+	struct ad24xx_i2c_adapter *ada;
+	unsigned int val = 0;
+	u32 bus_speed;
+	int ret;
+
+	ada = devm_kzalloc(dev, sizeof(*ada), GFP_KERNEL);
+	if (!ada)
+		return -ENOMEM;
+
+	ada->dev = dev;
+	ada->func = func;
+	ada->node = func->node;
+
+	ada->adap.owner = THIS_MODULE;
+	ada->adap.algo = &ad24xx_i2c_adapter_algo;
+	ada->adap.dev.parent = dev;
+	ada->adap.dev.of_node = dev->of_node;
+	ada->adap.quirks = &ad24xx_i2c_adapter_quirks;
+	strscpy(ada->adap.name, dev_name(dev), sizeof(ada->adap.name));
+	i2c_set_adapdata(&ada->adap, ada);
+
+	ret = of_property_read_u32(np, "clock-frequency", &bus_speed);
+	if (ret)
+		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
+
+	if (bus_speed != I2C_MAX_STANDARD_MODE_FREQ &&
+	    bus_speed != I2C_MAX_FAST_MODE_FREQ)
+		return -EINVAL;
+
+	val |= FIELD_PREP(A2B_I2CCFG_DATARATE_MASK,
+			  bus_speed == I2C_MAX_FAST_MODE_FREQ ? 1 : 0);
+	val |= FIELD_PREP(A2B_I2CCFG_FRAMERATE_MASK,
+			  func->node->bus->sff == A2B_SFF_44100 ? 1 : 0);
+
+	ret = a2b_node_write(func->node, A2B_I2CCFG, val);
+	if (ret)
+		return ret;
+
+	ret = devm_i2c_add_adapter(dev, &ada->adap);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id ad24xx_i2c_adapter_of_match_table[] = {
+	{ .compatible = "adi,ad2401-i2c" },
+	{ .compatible = "adi,ad2402-i2c" },
+	{ .compatible = "adi,ad2403-i2c" },
+	{ .compatible = "adi,ad2410-i2c" },
+	{ .compatible = "adi,ad2420-i2c" },
+	{ .compatible = "adi,ad2421-i2c" },
+	{ .compatible = "adi,ad2422-i2c" },
+	{ .compatible = "adi,ad2425-i2c" },
+	{ .compatible = "adi,ad2426-i2c" },
+	{ .compatible = "adi,ad2427-i2c" },
+	{ .compatible = "adi,ad2428-i2c" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ad24xx_i2c_adapter_of_match_table);
+
+static struct a2b_driver ad24xx_i2c_adapter_driver = {
+	.driver = {
+		.name = "ad24xx-i2c-adapter",
+		.of_match_table = ad24xx_i2c_adapter_of_match_table,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = ad24xx_i2c_adapter_probe,
+};
+module_a2b_driver(ad24xx_i2c_adapter_driver);
+
+MODULE_AUTHOR("Alvin Šipraga <alsi@bang-olufsen.dk>");
+MODULE_DESCRIPTION("AD24xx I2C controller driver");
+MODULE_LICENSE("GPL");

-- 
2.44.0


