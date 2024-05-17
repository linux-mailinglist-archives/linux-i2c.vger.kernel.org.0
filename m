Return-Path: <linux-i2c+bounces-3562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 832038C86F6
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 15:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 134A91F21D49
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 13:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E8A537E0;
	Fri, 17 May 2024 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="dOTaOKOX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E13A52F80
	for <linux-i2c@vger.kernel.org>; Fri, 17 May 2024 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715951190; cv=none; b=Ey3ZACino28wk7sy5Xri6hPLuANW4QdoNH+4+leyXtvGytGQYc2wPGn7cDVkZCK48jR1ejOjDYr6ivVbCTzWUUxDQRgne2VEikepkL2YBTtyp6skDexxYWJnIQJRRO9j24i1CW7MqHDXlORhbNPEvQh5kN5SYc1CF653rOAftgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715951190; c=relaxed/simple;
	bh=+BQrjQj8fvQHF8fbbT0PBaakRFsdp/Ftmf8qaj4dRD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZMtArNG6lv7s9c/v9sshUMYTb9h9Cgdb5w5HAcYQRSof8TLZoorSX+vleqGVaAClED6/kjGjEutGep3ZdSjbbbCuKqvYkYQnNKs9i8oyPpV/FqrgeoLwBH781N3kXe207AtiUhW+MkdSClEVtIAOeapdzmYTmZj3THAtt5HVn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=dOTaOKOX; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: broonie@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715951186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGwqzFatac3SdyxB8/u13aV/YQxtNfiylkMZnmEN/dw=;
	b=dOTaOKOXRY1/J9FXikk6Plm0TjP7QZu6iKqVOOSxBpP7jNKFg+rZoZNSIJ4SBzuxrfv6S4
	Txzj3GF4F4fLeAIOv8y6WrFGLTAft5DKHIRpn4KPbj26f7zEjh8b7CKvKVXkdalN6FU8FE
	rv6/nbPPMzwtJjBN8eriUY89iZQYM9H8RnU9y24aeLEb1ITyn1vkqbhW4/2u6WS0kVrfqD
	2/TfL3RD5lBAJ0SZs0vFiwc8DQzE2xDA61ctozaRV2fMSAwvyp2HetdPqS3y8tUcP/MOtL
	TrbECBNI6PEVyMzBKKSknGnjGCYWB1PxwRW2NneQQF/zNjI4x7UtVcOwuJrdiw==
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
Date: Fri, 17 May 2024 15:02:15 +0200
Subject: [PATCH 08/13] clk: add AD24xx clock driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-8-7e776c784e02@bang-olufsen.dk>
References: <20240517-a2b-v1-0-7e776c784e02@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-0-7e776c784e02@bang-olufsen.dk>
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

Analog Devices Inc. AD24xx series A2B transceivers support muxing IO
pins to a CLKOUT function. The clock supports division of the internal
PLL of the transceiver.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/a2b/Kconfig      |   1 +
 drivers/clk/Kconfig      |   7 +
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-ad24xx.c | 341 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 350 insertions(+)

diff --git a/drivers/a2b/Kconfig b/drivers/a2b/Kconfig
index 6ba5dc11c51d..08acf5728023 100644
--- a/drivers/a2b/Kconfig
+++ b/drivers/a2b/Kconfig
@@ -35,6 +35,7 @@ config A2B_AD24XX_NODE
        select REGMAP_A2B
        imply GPIO_AD24XX
        imply SND_SOC_AD24XX
+       imply COMMON_CLK_AD24XX
        help
          Say Y here to enable support for AD24xx A2B transceiver nodes. This
          applies to both main nodes and subordinate nodes. Supported models
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3e9099504fad..a3d54b077e68 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -257,6 +257,13 @@ config COMMON_CLK_LAN966X
 	  LAN966X SoC. GCK generates and supplies clock to various peripherals
 	  within the SoC.
 
+config COMMON_CLK_AD24XX
+	bool "Clock driver for Analog Devices Inc. AD24xx"
+	depends on A2B_AD24XX_NODE
+	help
+	  This driver supports the clock output functionality of AD24xx series
+	  A2B transceiver chips.
+
 config COMMON_CLK_ASPEED
 	bool "Clock driver for Aspeed BMC SoCs"
 	depends on ARCH_ASPEED || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 4abe16c8ccdf..cf5c867bf71a 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
 obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
+obj-$(CONFIG_COMMON_CLK_AD24XX)		+= clk-ad24xx.o
 obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
 obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
diff --git a/drivers/clk/clk-ad24xx.c b/drivers/clk/clk-ad24xx.c
new file mode 100644
index 000000000000..ed227c317faa
--- /dev/null
+++ b/drivers/clk/clk-ad24xx.c
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AD24xx clock driver
+ *
+ * Copyright (c) 2023 Alvin Šipraga <alsi@bang-olufsen.dk>
+ */
+
+#include <linux/a2b/a2b.h>
+#include <linux/a2b/ad24xx.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define AD24XX_NUM_CLKS 2
+
+/* Define some safe macros to make the code more readable */
+#define A2B_CLKCFG(_idx)        (!(_idx) ? A2B_CLK1CFG : A2B_CLK2CFG)
+
+#define A2B_CLKCFG_DIV_SHIFT    A2B_CLK1CFG_CLK1DIV_SHIFT
+#define A2B_CLKCFG_PDIV_SHIFT   A2B_CLK1CFG_CLK1PDIV_SHIFT
+
+#define A2B_CLKCFG_DIV_MASK     A2B_CLK1CFG_CLK1DIV_MASK
+#define A2B_CLKCFG_PDIV_MASK    A2B_CLK1CFG_CLK1PDIV_MASK
+#define A2B_CLKCFG_INV_MASK     A2B_CLK1CFG_CLK1INV_MASK
+#define A2B_CLKCFG_EN_MASK      A2B_CLK1CFG_CLK1EN_MASK
+
+static_assert(A2B_CLK1CFG_CLK1DIV_MASK  == A2B_CLK2CFG_CLK2DIV_MASK);
+static_assert(A2B_CLK1CFG_CLK1PDIV_MASK == A2B_CLK2CFG_CLK2PDIV_MASK);
+static_assert(A2B_CLK1CFG_CLK1INV_MASK  == A2B_CLK2CFG_CLK2INV_MASK);
+static_assert(A2B_CLK1CFG_CLK1EN_MASK   == A2B_CLK2CFG_CLK2EN_MASK);
+
+struct ad24xx_clkout {
+	struct clk_hw hw;
+	unsigned int idx;
+	bool registered;
+};
+
+struct ad24xx_clk {
+	struct device *dev;
+	struct a2b_func *func;
+	struct a2b_node *node;
+	struct regmap *regmap;
+	struct clk_hw *pll_hw;
+	struct ad24xx_clkout clkouts[AD24XX_NUM_CLKS];
+};
+
+static struct ad24xx_clkout *to_ad24xx_clkout(struct clk_hw *hw)
+{
+	return container_of(hw, struct ad24xx_clkout, hw);
+}
+
+static struct ad24xx_clk *to_ad24xx_clk(struct ad24xx_clkout *clkout)
+{
+	return container_of(clkout, struct ad24xx_clk, clkouts[clkout->idx]);
+}
+
+/*
+ * A CLKOUT signal is derived from the PLL frequency (2048 * SFF), going through
+ * a pre-divide step and a divide step.
+ *
+ * The pre-divide is either 2 or 32. The divisor is between 1 and 16.
+ *
+ * The pre-divide register PDIV is 1 bit and selects between 2 (0) or 32 (1).
+ * The divide register DIV is 4 bit and the resultant divisor is 2 * (DIV + 1).
+ */
+
+#define VAL(_pdiv, _div) \
+	(((_pdiv) << A2B_CLKCFG_PDIV_SHIFT) | ((_div) << A2B_CLKCFG_DIV_SHIFT))
+#define DIV(_div) (2 * ((_div) + 1))
+
+/* In total there are 6 bits to the value, with the 4th bit going unused */
+#define AD24XX_CLK_DIV_WIDTH 6
+static const struct clk_div_table ad24xx_clk_div_table[] = {
+	{ VAL(0, 0), 2 * DIV(0) },    { VAL(0, 1), 2 * DIV(1) },
+	{ VAL(0, 2), 2 * DIV(2) },    { VAL(0, 3), 2 * DIV(3) },
+	{ VAL(0, 4), 2 * DIV(4) },    { VAL(0, 5), 2 * DIV(5) },
+	{ VAL(0, 6), 2 * DIV(6) },    { VAL(0, 7), 2 * DIV(7) },
+	{ VAL(0, 8), 2 * DIV(8) },    { VAL(0, 9), 2 * DIV(9) },
+	{ VAL(0, 10), 2 * DIV(10) },  { VAL(0, 11), 2 * DIV(11) },
+	{ VAL(0, 12), 2 * DIV(12) },  { VAL(0, 13), 2 * DIV(13) },
+	{ VAL(0, 14), 2 * DIV(14) },  { VAL(0, 15), 2 * DIV(15) },
+	{ VAL(1, 0), 32 * DIV(0) },   { VAL(1, 1), 32 * DIV(1) },
+	{ VAL(1, 2), 32 * DIV(2) },   { VAL(1, 3), 32 * DIV(3) },
+	{ VAL(1, 4), 32 * DIV(4) },   { VAL(1, 5), 32 * DIV(5) },
+	{ VAL(1, 6), 32 * DIV(6) },   { VAL(1, 7), 32 * DIV(7) },
+	{ VAL(1, 8), 32 * DIV(8) },   { VAL(1, 9), 32 * DIV(9) },
+	{ VAL(1, 10), 32 * DIV(10) }, { VAL(1, 11), 32 * DIV(11) },
+	{ VAL(1, 12), 32 * DIV(12) }, { VAL(1, 13), 32 * DIV(13) },
+	{ VAL(1, 14), 32 * DIV(14) }, { VAL(1, 15), 32 * DIV(15) },
+	{ /* sentinel */ }
+};
+
+static int ad24xx_clk_prepare(struct clk_hw *hw)
+{
+	struct ad24xx_clkout *clkout = to_ad24xx_clkout(hw);
+	struct ad24xx_clk *adclk = to_ad24xx_clk(clkout);
+	unsigned int idx = clkout->idx;
+
+	return regmap_update_bits(adclk->regmap, A2B_CLKCFG(idx),
+				  A2B_CLKCFG_EN_MASK,
+				  FIELD_PREP(A2B_CLKCFG_EN_MASK, 1));
+}
+
+static void ad24xx_clk_unprepare(struct clk_hw *hw)
+{
+	struct ad24xx_clkout *clkout = to_ad24xx_clkout(hw);
+	struct ad24xx_clk *adclk = to_ad24xx_clk(clkout);
+	unsigned int idx = clkout->idx;
+
+	regmap_update_bits(adclk->regmap, A2B_CLKCFG(idx), A2B_CLKCFG_EN_MASK,
+			   FIELD_PREP(A2B_CLKCFG_EN_MASK, 0));
+}
+
+static unsigned long ad24xx_clk_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct ad24xx_clkout *clkout = to_ad24xx_clkout(hw);
+	struct ad24xx_clk *adclk = to_ad24xx_clk(clkout);
+	unsigned int idx = clkout->idx;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(adclk->regmap, A2B_CLKCFG(idx), &val);
+	if (ret)
+		return 0;
+
+	val &= A2B_CLKCFG_PDIV_MASK | A2B_CLKCFG_DIV_MASK;
+
+	return divider_recalc_rate(hw, parent_rate, val, ad24xx_clk_div_table,
+				   0, AD24XX_CLK_DIV_WIDTH);
+}
+
+static long ad24xx_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long *parent_rate)
+{
+	return divider_round_rate(hw, rate, parent_rate, ad24xx_clk_div_table,
+				  AD24XX_CLK_DIV_WIDTH, 0);
+}
+
+static int ad24xx_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return divider_determine_rate(hw, req, ad24xx_clk_div_table,
+				      AD24XX_CLK_DIV_WIDTH, 0);
+}
+
+static int ad24xx_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct ad24xx_clkout *clkout = to_ad24xx_clkout(hw);
+	struct ad24xx_clk *adclk = to_ad24xx_clk(clkout);
+	unsigned int idx = clkout->idx;
+	int val;
+
+	val = divider_get_val(rate, parent_rate, ad24xx_clk_div_table,
+			      AD24XX_CLK_DIV_WIDTH, 0);
+	if (val < 0)
+		return val;
+
+	return regmap_update_bits(adclk->regmap, A2B_CLKCFG(idx),
+				  A2B_CLKCFG_PDIV_MASK | A2B_CLKCFG_DIV_MASK,
+				  val);
+}
+
+static int ad24xx_clk_get_phase(struct clk_hw *hw)
+{
+	struct ad24xx_clkout *clkout = to_ad24xx_clkout(hw);
+	struct ad24xx_clk *adclk = to_ad24xx_clk(clkout);
+	unsigned int idx = clkout->idx;
+	unsigned int val;
+	bool invert;
+	int ret;
+
+	ret = regmap_read(adclk->regmap, A2B_CLKCFG(idx), &val);
+	if (ret)
+		return ret;
+
+	invert = FIELD_GET(A2B_CLKCFG_INV_MASK, val);
+
+	return invert ? 180 : 0;
+}
+
+static int ad24xx_clk_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct ad24xx_clkout *clkout = to_ad24xx_clkout(hw);
+	struct ad24xx_clk *adclk = to_ad24xx_clk(clkout);
+	unsigned int idx = clkout->idx;
+	bool invert = !!degrees;
+
+	if (degrees != 0 && degrees != 180)
+		return -EINVAL;
+
+	return regmap_update_bits(adclk->regmap, A2B_CLKCFG(idx),
+				  A2B_CLKCFG_INV_MASK,
+				  FIELD_PREP(A2B_CLKCFG_INV_MASK, invert));
+}
+
+static const struct clk_ops ad24xx_clk_ops = {
+	.prepare = ad24xx_clk_prepare,
+	.unprepare = ad24xx_clk_unprepare,
+	.recalc_rate = ad24xx_clk_recalc_rate,
+	.round_rate = ad24xx_clk_round_rate,
+	.determine_rate = ad24xx_clk_determine_rate,
+	.set_rate = ad24xx_clk_set_rate,
+	.get_phase = ad24xx_clk_get_phase,
+	.set_phase = ad24xx_clk_set_phase,
+};
+
+static const struct regmap_config ad24xx_clk_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static struct clk_hw *ad24xx_clk_of_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct ad24xx_clk *adclk = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= AD24XX_NUM_CLKS)
+		return ERR_PTR(-EINVAL);
+
+	if (!adclk->clkouts[idx].registered)
+		return ERR_PTR(-ENOENT);
+
+	return &adclk->clkouts[idx].hw;
+}
+
+static int ad24xx_clk_probe(struct device *dev)
+{
+	struct a2b_func *func = to_a2b_func(dev);
+	struct a2b_node *node = func->node;
+	struct device_node *np = dev->of_node;
+	char *pll_name;
+	const char *sync_clk_name;
+	struct ad24xx_clk *adclk;
+	int num_clks;
+	int ret;
+	int i;
+
+	/*
+	 * Older series AD240x and AD241x chips have a single discrete
+	 * A2B_CLKCFG register that behaves differently to the A2B_CLKnCFG
+	 * registers of the later AD242x series. This driver only supports the
+	 * latter right now.
+	 */
+	if (!(node->chip_info->caps & A2B_CHIP_CAP_CLKOUT))
+		return -ENODEV;
+
+	adclk = devm_kzalloc(dev, sizeof(*adclk), GFP_KERNEL);
+	if (!adclk)
+		return -ENOMEM;
+
+	adclk->regmap =
+		devm_regmap_init_a2b_func(func, &ad24xx_clk_regmap_config);
+	if (IS_ERR(adclk->regmap))
+		return PTR_ERR(adclk->regmap);
+
+	adclk->dev = dev;
+	adclk->func = func;
+	adclk->node = node;
+	dev_set_drvdata(dev, adclk);
+
+	num_clks = of_property_count_strings(np, "clock-output-names");
+	if (num_clks < 0 || num_clks > AD24XX_NUM_CLKS)
+		return -EINVAL;
+
+	/*
+	 * Register the PLL internally to use it as the parent of the CLKOUTs.
+	 * The PLL runs at 2048 times the SYNC clock rate.
+	 */
+	pll_name =
+		devm_kasprintf(dev, GFP_KERNEL, "%s_pll", dev_name(&node->dev));
+	if (!pll_name)
+		return -ENOMEM;
+	sync_clk_name = __clk_get_name(a2b_node_get_sync_clk(func->node));
+	adclk->pll_hw = devm_clk_hw_register_fixed_factor(
+		dev, pll_name, sync_clk_name, 0, 2048, 1);
+	if (IS_ERR(adclk->pll_hw))
+		return PTR_ERR(adclk->pll_hw);
+
+	for (i = 0; i < num_clks; i++) {
+		struct clk_init_data init = { };
+		const char *parent_names = clk_hw_get_name(adclk->pll_hw);
+		unsigned int idx = i;
+
+		/* Clock outputs can be skipped with the clock-indices property */
+		of_property_read_u32_index(np, "clock-indices", i, &idx);
+		if (idx > AD24XX_NUM_CLKS)
+			return -EINVAL;
+
+		ret = of_property_read_string_index(np, "clock-output-names", i,
+						    &init.name);
+		if (ret)
+			return ret;
+
+		init.ops = &ad24xx_clk_ops;
+		init.parent_names = &parent_names;
+		init.num_parents = 1;
+
+		adclk->clkouts[idx].hw.init = &init;
+		adclk->clkouts[idx].idx = idx;
+		adclk->clkouts[idx].registered = true;
+
+		ret = devm_clk_hw_register(dev, &adclk->clkouts[idx].hw);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, ad24xx_clk_of_get, adclk);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id ad24xx_clk_of_match_table[] = {
+	{ .compatible = "adi,ad2420-clk" },
+	{ .compatible = "adi,ad2421-clk" },
+	{ .compatible = "adi,ad2422-clk" },
+	{ .compatible = "adi,ad2425-clk" },
+	{ .compatible = "adi,ad2426-clk" },
+	{ .compatible = "adi,ad2427-clk" },
+	{ .compatible = "adi,ad2428-clk" },
+	{ .compatible = "adi,ad2429-clk" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ad24xx_clk_of_match_table);
+
+static struct a2b_driver ad24xx_clk_driver = {
+	.driver = {
+		.name = "ad24xx-clk",
+		.of_match_table = ad24xx_clk_of_match_table,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = ad24xx_clk_probe,
+};
+module_a2b_driver(ad24xx_clk_driver);
+
+MODULE_AUTHOR("Alvin Šipraga <alsi@bang-olufsen.dk>");
+MODULE_DESCRIPTION("AD24xx CLK driver");
+MODULE_LICENSE("GPL");

-- 
2.44.0


