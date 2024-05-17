Return-Path: <linux-i2c+bounces-3559-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3388C86D5
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 14:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34BA128197A
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 12:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AB054BFE;
	Fri, 17 May 2024 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="wa81VU0r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2551004
	for <linux-i2c@vger.kernel.org>; Fri, 17 May 2024 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715950737; cv=none; b=XZZcmxsS9dnXIS6SKRDQWpZ/oYsN/rp4Bo/cZ24sum/MP0KXZ0R/ax27chPg+PDAksR5uZ9PVbM7vHj67Xo9AsyGoAefcPeGiCqlJ3WmbvugzKKGenWtdUjFgpM8/U2CVgNDVEJchSEacLHTVsIccLS30JorQIzwQo04FzDvy7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715950737; c=relaxed/simple;
	bh=0d39N4GPWNqxF0dFVCzjorEh1XiWOcRr2ujB+nVTEXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VATcP32w7FzTNr2YeTsKsj5YplbDa+wLZx6o0+LWGUVXFTSMm2gTXQIm01rAC6BaB3fdS6nasQj9DsMlo03QA19x++w0dZ3PAGpDSLAHpGS24UoS7mc+G7+XTtqdIhzy0uq4L+NS1FrV9sFXhwnoMjZTWxbQ7AJF7msHcs4imiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=wa81VU0r; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: linux-i2c@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715950729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZlgR///yHXui6cTc/6KXDaywf/me0E2mv4A04nqOmE=;
	b=wa81VU0r8x+nrJ00CtQUM/U0gA2ygVrJoSG7OFUWPcDKBmJmDF1WmMXJy8eZ56yxkiQiOr
	loKwswHpowGRP4aftRo64q2oWmia0Zao/1GYi5T9L07Tru6jMQQsLbJZlshZbO9ZoPj7l/
	mrIudK5rQ8nWhdwuwz5dmXetu1FK1UQk3dn3FaahlwHXdqMtsoU4Z89rmLtS3XmYFNGzjt
	14S4u6JB0utb+b+U8S4nUHRKgTFPPUuCxQEV2lsZ7Fxm4QQmtQ0vRlL4vK/0DyEQM+GTdn
	S9C5/ruov56mZIgKIjrhSbkNZXIFSXt/9SsSAvt0OgyFbKTxhI9mKhAUjzQF/w==
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: perex@perex.cz
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: broonie@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: alsi@bang-olufsen.dk
X-Envelope-To: rafael@kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: tiwai@suse.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: brgl@bgdev.pl
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 17 May 2024 14:58:03 +0200
Subject: [PATCH 05/13] a2b: add AD24xx node driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-5-b8647554c67b@bang-olufsen.dk>
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

This A2B node driver supports controlling both main and subordinate
AD24xx nodes. As well as implementing the required ops for an A2B node
driver, it also registers peripheral functions available on this series
of A2B transceivers: GPIO, codec, clock, and I2C controller. The
implementation of those functions is handled in discrete A2B drivers
placed in the relevant subsystems.

The core node op symbols are also exported to support the implementation
of more bespoke node drivers, such as for hardware which requires
additional hand-holding to properly integrate with the driver model. A
supporting header file is also added with prototypes for these
functions.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/a2b/Kconfig       |  14 +
 drivers/a2b/Makefile      |   3 +
 drivers/a2b/ad24xx-node.c | 887 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/a2b/ad24xx-node.h |  42 +++
 4 files changed, 946 insertions(+)

diff --git a/drivers/a2b/Kconfig b/drivers/a2b/Kconfig
index 120b1d491623..1f6d836463f3 100644
--- a/drivers/a2b/Kconfig
+++ b/drivers/a2b/Kconfig
@@ -18,11 +18,25 @@ config A2B_AD24XX_I2C
        tristate "Analog Devices Inc. AD24xx I2C interface support"
        depends on I2C
        select REGMAP_I2C
+       select A2B_AD24XX_NODE
        help
          Say Y here to enable I2C interface support for AD24xx A2B transceiver
          chips from Analog Devices Inc. Supported models include AD240x, AD241x,
          and AD242x.
 
+	 Selecting this option will also force AD24xx node support, which is
+	 required to operate the chip as a main node.
+
+	 If unsure, say N.
+
+config A2B_AD24XX_NODE
+       tristate "Analog Devices Inc. AD24xx node support"
+       select REGMAP_A2B
+       help
+         Say Y here to enable support for AD24xx A2B transceiver nodes. This
+         applies to both main nodes and subordinate nodes. Supported models
+         include AD240x, AD241x, and AD242x.
+
 	 If unsure, say N.
 
 endif # A2B
diff --git a/drivers/a2b/Makefile b/drivers/a2b/Makefile
index 07241524645c..171ffa237943 100644
--- a/drivers/a2b/Makefile
+++ b/drivers/a2b/Makefile
@@ -7,3 +7,6 @@ obj-$(CONFIG_A2B)			+= a2b.o
 
 # Interface drivers
 obj-$(CONFIG_A2B_AD24XX_I2C)		+= ad24xx-i2c.o
+
+# Node drivers
+obj-$(CONFIG_A2B_AD24XX_NODE)		+= ad24xx-node.o
diff --git a/drivers/a2b/ad24xx-node.c b/drivers/a2b/ad24xx-node.c
new file mode 100644
index 000000000000..c5716391936d
--- /dev/null
+++ b/drivers/a2b/ad24xx-node.c
@@ -0,0 +1,887 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AD24xx A2B transceiver node driver
+ *
+ * Copyright (c) 2023-2024 Alvin Šipraga <alsi@bang-olufsen.dk>
+ *
+ * Analog Devices Inc. documentation cited in some of the comments below:
+ *
+ * [1] AD2420(W)/6(W)/7(W)/8(W)/9(W) Automotive Audio Bus A2B Transceiver
+ *     Technical Reference, Revision 1.1, October 2019, Part Number 82-100138-01
+ *
+ * [2] Datasheet for AD2420(W)/AD2426(W)/AD2427(W)/AD2428(W)/AD2429(W) Rev. C,
+ *     July 2021
+ */
+
+#include <linux/a2b/a2b.h>
+#include <linux/a2b/ad24xx.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/regmap.h>
+
+#include "ad24xx-node.h"
+
+struct ad24xx_node {
+	struct device *dev;
+	struct a2b_node *node;
+	struct regmap *regmap;
+	struct irq_domain *irqdomain;
+	int irq;
+	struct completion running_completion;
+	struct completion discovery_completion;
+	struct a2b_func *func_gpio;
+	struct a2b_func *func_codec;
+	struct a2b_func *func_clk;
+	struct a2b_func *func_i2c;
+};
+
+#define A2B_CHIP_CAPS_AD242X                                      \
+	(A2B_CHIP_CAP_REDUCED_RATE | A2B_CHIP_CAP_CLKOUT |        \
+	 A2B_CHIP_CAP_BUS_MONITOR | A2B_CHIP_CAP_SUSTAIN |        \
+	 A2B_CHIP_CAP_DATA_RX_MASK | A2B_CHIP_CAP_GPIO_DISTANCE | \
+	 A2B_CHIP_CAP_MAILBOX)
+
+const struct a2b_chip_info ad24xx_chip_info[] = {
+	[A2B_AD2401] = {
+		.caps = A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_PDM,
+		.max_gpios = 7,
+	},
+	[A2B_AD2402] = {
+		.caps = A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_B_SIDE |
+			A2B_CHIP_CAP_PDM,
+		.max_gpios = 7,
+	},
+	[A2B_AD2403] = {
+		.caps = A2B_CHIP_CAP_MAIN |
+			A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_B_SIDE |
+			A2B_CHIP_CAP_I2S,
+		.max_subs = 8,
+		.max_gpios = 7,
+	},
+	[A2B_AD2410] = {
+		.caps = A2B_CHIP_CAP_MAIN |
+			A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_B_SIDE |
+			A2B_CHIP_CAP_I2S |
+			A2B_CHIP_CAP_PDM,
+		.max_subs = 8,
+		.max_gpios = 7,
+	},
+	[A2B_AD2420] = {
+		.caps = A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_PDM |
+			A2B_CHIP_CAPS_AD242X,
+		.max_gpios = 8,
+	},
+	[A2B_AD2421] = {
+		.caps = A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_PDM |
+			A2B_CHIP_CAPS_AD242X,
+		.max_gpios = 8,
+	},
+	[A2B_AD2422] = {
+		.caps = A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_B_SIDE |
+			A2B_CHIP_CAP_PDM |
+			A2B_CHIP_CAPS_AD242X,
+		.max_gpios = 8,
+	},
+	[A2B_AD2425] = {
+		.caps = A2B_CHIP_CAP_MAIN |
+			A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_B_SIDE |
+			A2B_CHIP_CAP_I2S |
+			A2B_CHIP_CAP_PDM |
+			A2B_CHIP_CAPS_AD242X,
+		.max_subs = 10,
+		.max_gpios = 8,
+	},
+	[A2B_AD2426] = {
+		.caps = A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_PDM |
+			A2B_CHIP_CAPS_AD242X,
+		.max_gpios = 8,
+	},
+	[A2B_AD2427] = {
+		.caps = A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_B_SIDE |
+			A2B_CHIP_CAP_PDM |
+			A2B_CHIP_CAPS_AD242X,
+		.max_gpios = 8,
+	},
+	[A2B_AD2428] = {
+		.caps = A2B_CHIP_CAP_MAIN |
+			A2B_CHIP_CAP_A_SIDE |
+			A2B_CHIP_CAP_B_SIDE |
+			A2B_CHIP_CAP_I2S |
+			A2B_CHIP_CAP_PDM |
+			A2B_CHIP_CAPS_AD242X,
+		.max_subs = 10,
+		.max_gpios = 8,
+	},
+	[A2B_AD2429] = {
+		.caps = A2B_CHIP_CAP_MAIN |
+			A2B_CHIP_CAP_B_SIDE |
+			A2B_CHIP_CAP_I2S |
+			A2B_CHIP_CAP_PDM |
+			A2B_CHIP_CAPS_AD242X,
+		.max_subs = 2,
+		.max_gpios = 8,
+	},
+};
+EXPORT_SYMBOL_GPL(ad24xx_chip_info);
+
+static int of_a2b_parse_tdm_slot_size(struct device_node *np,
+				      enum a2b_tdm_slot_size *tdm_slot_size)
+{
+	u32 slot_size;
+	int ret;
+
+	ret = of_property_read_u32(np, "adi,tdm-slot-size", &slot_size);
+	if (ret)
+		return ret;
+
+	if (slot_size == 16)
+		*tdm_slot_size = A2B_TDMSS_16;
+	else if (slot_size == 32)
+		*tdm_slot_size = A2B_TDMSS_32;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int of_a2b_parse_tdm_mode(struct device_node *np,
+				 enum a2b_tdm_mode *tdm_mode)
+{
+	u32 mode;
+	int ret;
+
+	ret = of_property_read_u32(np, "adi,tdm-mode", &mode);
+	if (ret)
+		return ret;
+
+	if (mode == 2)
+		*tdm_mode = A2B_TDMMODE_2;
+	else if (mode == 4)
+		*tdm_mode = A2B_TDMMODE_4;
+	else if (mode == 8)
+		*tdm_mode = A2B_TDMMODE_8;
+	else if (mode == 12)
+		*tdm_mode = A2B_TDMMODE_12;
+	else if (mode == 16)
+		*tdm_mode = A2B_TDMMODE_16;
+	else if (mode == 20)
+		*tdm_mode = A2B_TDMMODE_20;
+	else if (mode == 24)
+		*tdm_mode = A2B_TDMMODE_24;
+	else if (mode == 32)
+		*tdm_mode = A2B_TDMMODE_32;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct irq_chip ad24xx_node_irq_chip = {
+	.name = "ad24xx-node",
+};
+
+static int ad24xx_node_irqdomain_map(struct irq_domain *irqdomain,
+				     unsigned int irq, irq_hw_number_t hwirq)
+{
+	irq_set_chip_data(irq, irqdomain->host_data);
+	irq_set_chip_and_handler(irq, &ad24xx_node_irq_chip, handle_simple_irq);
+	irq_set_nested_thread(irq, 1);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static void ad24xx_node_irqdomain_unmap(struct irq_domain *irqdomain,
+					unsigned int irq)
+{
+	irq_set_nested_thread(irq, 0);
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
+}
+
+static int ad24xx_node_irqdomain_alloc(struct irq_domain *irqdomain,
+				       unsigned int virq, unsigned int nr_irqs,
+				       void *data)
+{
+	struct ad24xx_node *adn = irqdomain->host_data;
+	struct irq_fwspec *fwspec = data;
+	irq_hw_number_t hwirq = fwspec->param[0];
+
+	if (nr_irqs != 1)
+		return -EINVAL;
+
+	if (hwirq > AD24XX_MAX_GPIOS)
+		return -EINVAL;
+
+	return irq_domain_set_hwirq_and_chip(irqdomain, virq, hwirq,
+					     &ad24xx_node_irq_chip, adn);
+}
+
+static const struct irq_domain_ops ad24xx_node_irqdomain_ops = {
+	.alloc = ad24xx_node_irqdomain_alloc,
+	.free = irq_domain_free_irqs_common,
+	.map = ad24xx_node_irqdomain_map,
+	.unmap = ad24xx_node_irqdomain_unmap,
+	.xlate = irq_domain_xlate_onecell,
+};
+
+static void devm_ad24xx_node_release_irqdomain(void *data)
+{
+	struct irq_domain *irqdomain = data;
+	int virq;
+	int i;
+
+	for (i = 0; i < A2B_MAX_NODES; i++) {
+		virq = irq_find_mapping(irqdomain, i);
+		if (virq)
+			irq_dispose_mapping(virq);
+	}
+
+	irq_domain_remove(irqdomain);
+}
+
+static irqreturn_t ad24xx_node_irq_handler(int irq, void *data)
+{
+	struct ad24xx_node *adn = data;
+	struct a2b_node *node = adn->node;
+	struct device *dev = adn->dev;
+	unsigned int inttype;
+	unsigned int virq;
+	int ret;
+
+	ret = a2b_node_get_inttype(node, &inttype);
+	if (ret) {
+		dev_err_ratelimited(adn->dev,
+				    "failed to get interrupt type: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	dev_dbg_ratelimited(dev, "received interrupt of type %d\n", inttype);
+
+	switch (inttype) {
+	case A2B_INTTYPE_HDCNTERR:
+	case A2B_INTTYPE_DDERR:
+	case A2B_INTTYPE_CRCERR:
+	case A2B_INTTYPE_DPERR:
+	case A2B_INTTYPE_BECOVF:
+	case A2B_INTTYPE_SRFERR:
+	case A2B_INTTYPE_SRFCRCERR:
+	case A2B_INTTYPE_PWRERR_0:
+	case A2B_INTTYPE_PWRERR_1:
+	case A2B_INTTYPE_PWRERR_2:
+	case A2B_INTTYPE_PWRERR_3:
+	case A2B_INTTYPE_PWRERR_4:
+	case A2B_INTTYPE_PWRERR_5:
+	case A2B_INTTYPE_I2CERR:
+	case A2B_INTTYPE_ICRCERR:
+	case A2B_INTTYPE_PWRERR_6:
+	case A2B_INTTYPE_PWRERR_7:
+	case A2B_INTTYPE_IRQMSGERR:
+	case A2B_INTTYPE_STARTUPERR:
+	case A2B_INTTYPE_SLVINTTYPERR:
+		/* Error IRQ */
+		a2b_node_report_error(node, inttype);
+		return IRQ_HANDLED;
+	case A2B_INTTYPE_IO0PND:
+	case A2B_INTTYPE_IO1PND:
+	case A2B_INTTYPE_IO2PND:
+	case A2B_INTTYPE_IO3PND:
+	case A2B_INTTYPE_IO4PND:
+	case A2B_INTTYPE_IO5PND:
+	case A2B_INTTYPE_IO6PND:
+	case A2B_INTTYPE_IO7PND:
+		/* GPIO IRQ */
+		virq = irq_find_mapping(adn->irqdomain,
+					inttype - A2B_INTTYPE_IO0PND);
+		if (virq)
+			handle_nested_irq(virq);
+		return IRQ_NONE;
+	case A2B_INTTYPE_DSCDONE:
+		/* Discovery done IRQ */
+		complete(&adn->discovery_completion);
+		return IRQ_HANDLED;
+	case A2B_INTTYPE_MBOX0FULL:
+	case A2B_INTTYPE_MBOX0EMPTY:
+	case A2B_INTTYPE_MBOX1FULL:
+	case A2B_INTTYPE_MBOX1EMPTY:
+		/* Mailbox IRQ - unimplemented */
+		dev_info(dev, "unhandled mailbox interrupt %d\n", inttype);
+		return IRQ_NONE;
+	case A2B_INTTYPE_STBYDONE:
+		/* Standby IRQ - unimplemented */
+		dev_info(dev, "unhandled standby interrupt %d\n", inttype);
+		return IRQ_NONE;
+	case A2B_INTTYPE_MSTR_RUNNING:
+		/* Master (main) running IRQ */
+		complete(&adn->running_completion);
+		return IRQ_HANDLED;
+	default:
+		dev_warn(dev, "unhandled unknown interrupt %d\n", inttype);
+		return IRQ_NONE;
+	}
+}
+
+int ad24xx_node_set_respcycs(struct a2b_node *node, unsigned int respcycs)
+{
+	struct ad24xx_node *adn = node->priv;
+	int ret;
+
+	dev_dbg(&node->dev, "set RESPCYCS %d\n", respcycs);
+
+	ret = regmap_write(adn->regmap, A2B_RESPCYCS, respcycs);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ad24xx_node_set_respcycs);
+
+int ad24xx_node_set_switching(struct a2b_node *node, bool enable,
+			      enum a2b_swmode mode)
+{
+	struct ad24xx_node *adn = node->priv;
+	unsigned int val;
+	int ret;
+
+	/*
+	 * Use external switch mode 1 instead of 0. This indicates that the
+	 * downstream node is not using A2B bus power and is not properly
+	 * terminating the bias. See [1] section 7-11 "Switch Control Register"
+	 * for more information.
+	 */
+	if (node->swmode_1 && mode == A2B_SWMODE_0)
+		mode = A2B_SWMODE_1;
+
+	dev_dbg(&node->dev, "%s switching, mode %d\n",
+		enable ? "enable" : "disable", mode);
+
+	val = FIELD_PREP(A2B_SWCTL_ENSW_MASK, enable) |
+	      FIELD_PREP(A2B_SWCTL_MODE_MASK, mode);
+
+	ret = regmap_write(adn->regmap, A2B_SWCTL, val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ad24xx_node_set_switching);
+
+int ad24xx_node_discover(struct a2b_node *node, unsigned int respcycs)
+{
+	struct ad24xx_node *adn = node->priv;
+	int ret;
+	long timeout;
+
+	ret = regmap_write(adn->regmap, A2B_DISCVRY, respcycs);
+	if (ret)
+		return ret;
+
+	timeout = wait_for_completion_interruptible_timeout(
+		&adn->discovery_completion, msecs_to_jiffies(350));
+	reinit_completion(&adn->discovery_completion);
+	if (timeout < 0)
+		return timeout;
+	else if (timeout == 0) {
+		/*
+		 * On discovery timeout it is necessary to manually end the
+		 * discovery process by setting the ENDDSC bit. Empirically, the
+		 * following issues were observed when failing to do so:
+		 *
+		 *  - the A2B_DISCSTAT.DSCACT bit will remain indefinitely set;
+		 *  - the main node will fail to report a bus drop error
+		 *    properly; namely, it will signal SRFERRs but only set its
+		 *    LAST bit when switching is disabled;
+		 *  - subsequent attempts to rediscover the first subordinate
+		 *    node will succeed (insofar as a DSCDONE interrupt will
+		 *    arrive), but I2C access to the node's registers over the
+		 *    BUS client will always fail.
+		 */
+		ret = regmap_set_bits(adn->regmap, A2B_CONTROL,
+				      A2B_CONTROL_ENDDSC_MASK);
+		if (ret)
+			return ret;
+
+		return 1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ad24xx_node_discover);
+
+int ad24xx_node_new_structure(struct a2b_node *node,
+			      const struct a2b_slot_config *slot_config,
+			      bool dn_enable, bool up_enable)
+{
+	struct ad24xx_node *adn = node->priv;
+	unsigned int val;
+	int ret;
+
+	/*
+	 * Synchronize A2B slot sizes and formats with all downstream nodes. The
+	 * A2B_SLOTFMT register is main only and with auto-broadcast, meaning
+	 * that the written value is automatically propagated to all downstream
+	 * subordinate nodes.
+	 */
+	val = FIELD_PREP(A2B_SLOTFMT_DNSIZE_MASK,
+			 slot_config->size[A2B_DIR_DOWN]) |
+	      FIELD_PREP(A2B_SLOTFMT_DNFMT_MASK,
+			 slot_config->format[A2B_DIR_DOWN]) |
+	      FIELD_PREP(A2B_SLOTFMT_UPSIZE_MASK,
+			 slot_config->size[A2B_DIR_UP]) |
+	      FIELD_PREP(A2B_SLOTFMT_UPFMT_MASK,
+			 slot_config->format[A2B_DIR_UP]);
+
+	ret = regmap_write(adn->regmap, A2B_SLOTFMT, val);
+	if (ret)
+		return ret;
+
+	val = FIELD_PREP(A2B_DATCTL_DNS_MASK, dn_enable) |
+	      FIELD_PREP(A2B_DATCTL_UPS_MASK, up_enable);
+
+	ret = regmap_write(adn->regmap, A2B_DATCTL, val);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(adn->regmap, A2B_CONTROL,
+			      A2B_CONTROL_NEWSTRCT_MASK);
+	if (ret)
+		return ret;
+
+	/*
+	 * A new structure is applied within 5 superframe cycles unless
+	 * communication errors create delays, cf. [1] section 7-24 "Control
+	 * Register". Nominally this is about 100 us, so add a little extra to
+	 * account for any potential errors.
+	 */
+	usleep_range(200, 400);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ad24xx_node_new_structure);
+
+int ad24xx_node_is_last(struct a2b_node *node)
+{
+	struct ad24xx_node *adn = node->priv;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(adn->regmap, A2B_NODE, &val);
+	if (ret)
+		return ret;
+
+	return val & A2B_NODE_LAST_MASK ? 1 : 0;
+}
+EXPORT_SYMBOL_GPL(ad24xx_node_is_last);
+
+static int ad24xx_node_setup_pincfg(struct ad24xx_node *adn)
+{
+	struct device_node *np = adn->dev->of_node;
+	unsigned int val = 0;
+	unsigned int drvstr = 1; /* Chip default is high drive strength */
+	bool irqinv;
+	bool irqts;
+
+	of_property_read_u32(np, "adi,drive-strength", &drvstr);
+	irqinv = of_property_present(np, "adi,invert-interrupt");
+	irqts = of_property_present(np, "adi,tristate-interrupt");
+
+	val |= FIELD_PREP(A2B_PINCFG_DRVSTR_MASK, drvstr);
+	val |= FIELD_PREP(A2B_PINCFG_IRQINV_MASK, irqinv);
+	val |= FIELD_PREP(A2B_PINCFG_IRQTS_MASK, irqts);
+
+	return regmap_write(adn->regmap, A2B_PINCFG, val);
+}
+
+static int ad24xx_node_setup_i2sgcfg(struct ad24xx_node *adn)
+{
+	struct a2b_node *node = adn->node;
+	unsigned int val = 0;
+
+	val |= FIELD_PREP(A2B_I2SGCFG_TDMMODE_MASK, node->tdm_mode);
+	val |= FIELD_PREP(A2B_I2SGCFG_RXONDTX1_MASK, node->rx_on_dtx1);
+	val |= FIELD_PREP(A2B_I2SGCFG_TDMSS_MASK, node->tdm_slot_size);
+	val |= FIELD_PREP(A2B_I2SGCFG_ALT_MASK, node->alternating_sync);
+	val |= FIELD_PREP(A2B_I2SGCFG_EARLY_MASK, node->early_sync);
+	val |= FIELD_PREP(A2B_I2SGCFG_INV_MASK, node->invert_sync);
+
+	return regmap_write(adn->regmap, A2B_I2SGCFG, val);
+}
+
+static bool ad24xx_node_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case A2B_INTTYPE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config ad24xx_node_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.precious_reg = ad24xx_node_precious_reg,
+	.max_register = A2B_REG_MAX,
+};
+
+int ad24xx_node_setup(struct a2b_node *node)
+{
+	struct device *dev = &node->dev;
+	struct device_node *np = dev->of_node;
+	struct ad24xx_node *adn;
+	long timeout;
+	int ret;
+
+	adn = devm_kzalloc(dev, sizeof(*adn), GFP_KERNEL);
+	if (!adn)
+		return -ENOMEM;
+
+	adn->regmap =
+		devm_regmap_init_a2b_node(node, &ad24xx_node_regmap_config);
+	if (IS_ERR(adn->regmap))
+		return PTR_ERR(adn->regmap);
+
+	ret = of_a2b_parse_tdm_mode(np, &node->tdm_mode);
+	if (ret)
+		return -EINVAL;
+
+	ret = of_a2b_parse_tdm_slot_size(np, &node->tdm_slot_size);
+	if (ret)
+		return -EINVAL;
+
+	if (of_property_present(np, "adi,invert-sync"))
+		node->invert_sync = 1;
+	if (of_property_present(np, "adi,early-sync"))
+		node->early_sync = 1;
+	if (of_property_present(np, "adi,alternating-sync"))
+		node->alternating_sync = 1;
+	if (of_property_present(np, "adi,rx-on-dtx1"))
+		node->rx_on_dtx1 = 1;
+	if (of_property_present(np, "adi,a2b-external-switch-mode-1"))
+		node->swmode_1 = 1;
+
+	node->priv = adn;
+
+	adn->dev = dev;
+	adn->node = node;
+	init_completion(&adn->running_completion);
+	init_completion(&adn->discovery_completion);
+
+	/* Identify */
+	ret = regmap_read(adn->regmap, A2B_VENDOR, &node->vendor);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(adn->regmap, A2B_PRODUCT, &node->product);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(adn->regmap, A2B_VERSION, &node->version);
+	if (ret)
+		return ret;
+
+	/* IRQ domain for GPIOs */
+	adn->irqdomain = irq_domain_add_linear(adn->dev->of_node,
+					       AD24XX_MAX_GPIOS,
+					       &ad24xx_node_irqdomain_ops, adn);
+	if (!adn->irqdomain)
+		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(
+		adn->dev, devm_ad24xx_node_release_irqdomain, adn->irqdomain);
+	if (ret)
+		return ret;
+
+	/* IRQ */
+	adn->irq = of_irq_get(adn->dev->of_node, 0);
+	if (adn->irq <= 0)
+		return -EINVAL;
+
+	ret = devm_request_threaded_irq(adn->dev, adn->irq, NULL,
+					ad24xx_node_irq_handler, IRQF_ONESHOT,
+					"ad24xx-node", adn);
+	if (ret)
+		return ret;
+
+	/*
+	 * Perform a software reset - but only on the main node, as doing this
+	 * on subordinate nodes will require them to be re-discovered.
+	 */
+	if (is_a2b_main(node)) {
+		ret = regmap_set_bits(adn->regmap, A2B_CONTROL,
+				      A2B_CONTROL_SOFTRST_MASK);
+		if (ret)
+			return ret;
+	}
+
+	/* Pin configuration */
+	ret = ad24xx_node_setup_pincfg(adn);
+	if (ret)
+		return ret;
+
+	/* Enable interrupts */
+	ret = regmap_write(adn->regmap, A2B_INTMSK0, 0xFF);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(adn->regmap, A2B_INTMSK1, 0xFF);
+	if (ret)
+		return ret;
+
+	if (is_a2b_main(node)) {
+		/*
+		 * Enable master (main) bit and wait for the transceiver to lock
+		 * its PLL to the received SYNC signal.
+		 */
+		ret = regmap_set_bits(adn->regmap, A2B_CONTROL,
+				      A2B_CONTROL_MSTR_MASK);
+		if (ret)
+			return ret;
+
+		/*
+		 * Per the datasheet [2] Table 3, "Clock and Reset Timing (A2B
+		 * Master)", the typical PLL Lock Time t_PLK is 7.5 ms. Wait 30
+		 * ms to be on the safe side and avoid spurious timeouts.
+		 */
+		timeout = wait_for_completion_interruptible_timeout(
+			&adn->running_completion, msecs_to_jiffies(30));
+		reinit_completion(&adn->running_completion);
+		if (timeout < 0)
+			return timeout;
+		else if (timeout == 0)
+			return -ETIMEDOUT;
+
+		/*
+		 * Enable main-node-only interrupts, ...
+		 *
+		 * but NOT I2C Error interrupts, as we should expect the error
+		 * to be reported via the I2C adapter associated with the BUS
+		 * client of the main node. This prevents many spurious
+		 * interrupts during e.g. i2cdetect -r.
+		 */
+		ret = regmap_write(adn->regmap, A2B_INTMSK2, 0x0D);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Set the global I2S configuration. For main nodes, the Technical
+	 * Reference [1] is clear that this register must be set before
+	 * discovery and must not be modified thereafter. For subordinate nodes
+	 * there is no such restriction.
+	 */
+	ret = ad24xx_node_setup_i2sgcfg(adn);
+	if (ret)
+		return ret;
+
+	/* Register optional transceiver functions with the core */
+	np = of_get_child_by_name(node->dev.of_node, "gpio");
+	if (np)
+		adn->func_gpio = a2b_node_of_add_func(node, np);
+	of_node_put(np);
+	if (IS_ERR(adn->func_gpio))
+		return PTR_ERR(adn->func_gpio);
+
+	np = of_get_child_by_name(node->dev.of_node, "codec");
+	if (np)
+		adn->func_codec = a2b_node_of_add_func(node, np);
+	of_node_put(np);
+	if (IS_ERR(adn->func_codec)) {
+		ret = PTR_ERR(adn->func_codec);
+		goto err_codec;
+	}
+
+	np = of_get_child_by_name(node->dev.of_node, "clock");
+	if (np)
+		adn->func_clk = a2b_node_of_add_func(node, np);
+	of_node_put(np);
+	if (IS_ERR(adn->func_clk)) {
+		ret = PTR_ERR(adn->func_clk);
+		goto err_clk;
+	}
+
+	np = of_get_child_by_name(node->dev.of_node, "i2c");
+	if (np)
+		adn->func_i2c = a2b_node_of_add_func(node, np);
+	of_node_put(np);
+	if (IS_ERR(adn->func_i2c)) {
+		ret = PTR_ERR(adn->func_i2c);
+		goto err_i2c;
+	}
+
+	return 0;
+
+	/* Unregister optional functions on error */
+err_i2c:
+	if (adn->func_clk)
+		device_unregister(&adn->func_clk->dev);
+err_clk:
+	if (adn->func_codec)
+		device_unregister(&adn->func_codec->dev);
+err_codec:
+	if (adn->func_gpio)
+		device_unregister(&adn->func_gpio->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ad24xx_node_setup);
+
+void ad24xx_node_teardown(struct a2b_node *node)
+{
+	struct ad24xx_node *adn = node->priv;
+
+	if (adn->func_i2c)
+		device_unregister(&adn->func_i2c->dev);
+	if (adn->func_clk)
+		device_unregister(&adn->func_clk->dev);
+	if (adn->func_codec)
+		device_unregister(&adn->func_codec->dev);
+	if (adn->func_gpio)
+		device_unregister(&adn->func_gpio->dev);
+
+	/*
+	 * Reset the switch control register to disable any switching. This
+	 * might fail - particularly if this node is being torn down as a result
+	 * of a bus drop. But if the driver is just being unbound from the node
+	 * device, switching should be disabled so that on any rebind, the
+	 * discovery process can continue from this node. Otherwise there is a
+	 * possibility that the switching is never toggled off, which is a
+	 * prerequisite for rediscovery.
+	 */
+	regmap_write(adn->regmap, A2B_SWCTL, 0x00);
+
+	/*
+	 * Similarly, in case only an unbind is occurring, mask and clear all
+	 * pending interrupts to prevent spurious interrupts.
+	 */
+	regmap_write(adn->regmap, A2B_INTMSK0, 0x00);
+	regmap_write(adn->regmap, A2B_INTMSK1, 0x00);
+	regmap_write(adn->regmap, A2B_INTPND0, 0xFF);
+	regmap_write(adn->regmap, A2B_INTPND1, 0xFF);
+
+	if (is_a2b_main(node)) {
+		regmap_write(adn->regmap, A2B_INTMSK2, 0x00);
+		regmap_write(adn->regmap, A2B_INTPND2, 0xFF);
+	}
+}
+EXPORT_SYMBOL_GPL(ad24xx_node_teardown);
+
+static struct a2b_node_ops ad24xx_sub_ops = {
+	.set_respcycs = ad24xx_node_set_respcycs,
+	.set_switching = ad24xx_node_set_switching,
+	.is_last = ad24xx_node_is_last,
+	.setup = ad24xx_node_setup,
+	.teardown = ad24xx_node_teardown,
+};
+
+static struct a2b_node_ops ad24xx_main_ops = {
+	.set_respcycs = ad24xx_node_set_respcycs,
+	.set_switching = ad24xx_node_set_switching,
+	.discover = ad24xx_node_discover,
+	.new_structure = ad24xx_node_new_structure,
+	.is_last = ad24xx_node_is_last,
+	.setup = ad24xx_node_setup,
+	.teardown = ad24xx_node_teardown,
+};
+
+static int ad24xx_node_probe(struct device *dev)
+{
+	struct a2b_node *node = to_a2b_node(dev);
+	int ret;
+
+	node->ops = is_a2b_main(node) ? &ad24xx_main_ops : &ad24xx_sub_ops;
+	node->chip_info = of_device_get_match_data(dev);
+
+	ret = a2b_register_node(node);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void ad24xx_node_remove(struct device *dev)
+{
+	struct a2b_node *node = to_a2b_node(dev);
+
+	a2b_unregister_node(node);
+}
+
+static const struct of_device_id ad24xx_node_of_match_table[] = {
+	{
+		.compatible = "adi,ad2401-node",
+		.data = &ad24xx_chip_info[A2B_AD2401],
+	},
+	{
+		.compatible = "adi,ad2402-node",
+		.data = &ad24xx_chip_info[A2B_AD2402],
+	},
+	{
+		.compatible = "adi,ad2403-node",
+		.data = &ad24xx_chip_info[A2B_AD2403],
+	},
+	{
+		.compatible = "adi,ad2410-node",
+		.data = &ad24xx_chip_info[A2B_AD2410],
+	},
+	{
+		.compatible = "adi,ad2420-node",
+		.data = &ad24xx_chip_info[A2B_AD2420],
+	},
+	{
+		.compatible = "adi,ad2421-node",
+		.data = &ad24xx_chip_info[A2B_AD2421],
+	},
+	{
+		.compatible = "adi,ad2422-node",
+		.data = &ad24xx_chip_info[A2B_AD2422],
+	},
+	{
+		.compatible = "adi,ad2425-node",
+		.data = &ad24xx_chip_info[A2B_AD2425],
+	},
+	{
+		.compatible = "adi,ad2426-node",
+		.data = &ad24xx_chip_info[A2B_AD2426],
+	},
+	{
+		.compatible = "adi,ad2427-node",
+		.data = &ad24xx_chip_info[A2B_AD2427],
+	},
+	{
+		.compatible = "adi,ad2428-node",
+		.data = &ad24xx_chip_info[A2B_AD2428],
+	},
+	{
+		.compatible = "adi,ad2429-node",
+		.data = &ad24xx_chip_info[A2B_AD2429],
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ad24xx_node_of_match_table);
+
+static struct a2b_driver ad24xx_node_driver = {
+	.driver = {
+		.name = "ad24xx-node",
+		.of_match_table = ad24xx_node_of_match_table,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = ad24xx_node_probe,
+	.remove = ad24xx_node_remove,
+};
+module_a2b_driver(ad24xx_node_driver);
+
+MODULE_AUTHOR("Alvin Šipraga <alsi@bang-olufsen.dk>");
+MODULE_DESCRIPTION("AD24xx A2B transceiver node driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/a2b/ad24xx-node.h b/drivers/a2b/ad24xx-node.h
new file mode 100644
index 000000000000..15591f0b1a51
--- /dev/null
+++ b/drivers/a2b/ad24xx-node.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AD24xx A2B transceiver node driver extension header
+ *
+ * Copyright (c) 2023-2024 Alvin Šipraga <alsi@bang-olufsen.dk>
+ *
+ * Use this to derive your own custom A2B node driver.
+ */
+#ifndef _AD24XX_NODE_H
+#define _AD24XX_NODE_H
+
+#include <linux/a2b/a2b.h>
+
+enum ad24xx_chips {
+	A2B_AD2401,
+	A2B_AD2402,
+	A2B_AD2403,
+	A2B_AD2410,
+	A2B_AD2420,
+	A2B_AD2421,
+	A2B_AD2422,
+	A2B_AD2425,
+	A2B_AD2426,
+	A2B_AD2427,
+	A2B_AD2428,
+	A2B_AD2429,
+};
+
+extern const struct a2b_chip_info ad24xx_chip_info[];
+
+int ad24xx_node_set_respcycs(struct a2b_node *node, unsigned int respcycs);
+int ad24xx_node_set_switching(struct a2b_node *node, bool enable,
+			      enum a2b_swmode mode);
+int ad24xx_node_discover(struct a2b_node *node, unsigned int respcycs);
+int ad24xx_node_new_structure(struct a2b_node *node,
+			      const struct a2b_slot_config *slot_config,
+			      bool dn_enable, bool up_enable);
+int ad24xx_node_is_last(struct a2b_node *node);
+int ad24xx_node_setup(struct a2b_node *node);
+void ad24xx_node_teardown(struct a2b_node *node);
+
+#endif /* _AD24XX_NODE_H */

-- 
2.44.0


