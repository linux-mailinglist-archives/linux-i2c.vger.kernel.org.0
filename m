Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0DC418806
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Sep 2021 12:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhIZKBp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Sep 2021 06:01:45 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:36755 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230396AbhIZKBf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Sep 2021 06:01:35 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 23A02580FDB;
        Sun, 26 Sep 2021 05:59:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 26 Sep 2021 05:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=E5gQC5MWzZAJm
        rjvaWXcsPDVP/qqg20G3GfbqZGgj6w=; b=izSg/ggC41ZlBQxh1kHDQ7J1n/FqE
        yeeTSYfIkMETUeGmKcI72FWepcJoIQBDGFlxuEuZCbGqcN1ygRP92RQnZMPcy7st
        fNNrBR81U++f8xmuX4FJyWcj26E/quYHrOoWnpwqGeNZzudkjezdQu///S8LSj1O
        6o5niBtCGyyAjhA10Ixsq79TGvZXkc+NTQoJ50fVEj+E9Cpo0eyeppYWIWdfHsi2
        h/mFHp2LRWlo8uey3hAgtQ/z2InNecVLHvXT5oC8UXhyV36BGWyR66iwIO2H4li3
        xEk7XT6daTppygBomkT67fqcdo2ByZ8+e2ppsOPNEwo2Dsi8IoUWq7ibg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=E5gQC5MWzZAJmrjvaWXcsPDVP/qqg20G3GfbqZGgj6w=; b=U0qHg7C9
        OWcalaoWxC3w+/sKc2ZsJdQWY3p41988bkagHbZfEsQ8vwc3hzKIfmXZy/hry0aD
        795dZlLYUICzeKTKyH2bUcCdUkOzXWXlolrUVSf6uV38JBavdO0diWTjJwAp2lgN
        p/BZjToaLw0WU+DhkGDssLqpQKuVShB22pj6KzLAdjrG2tv1sEHrgtlmbvH/DFvD
        itJuUdoErEF6SrpaSc7ViSA6t7S9h7afdX2nIQkXmHaKvA8FqXMNfpXppZRJDQTd
        XlY9u/1id8Daev+3eEoGA6uL/h8Kqx1Ry81lnts2H8RQKQu1Ajpu+AaKMOIuMgOO
        AYn/omc5g2ilWQ==
X-ME-Sender: <xms:n0RQYTsfMem00duyvMnL5U-no-XpCombbcG3TFCLImwBN_hW0s8oUQ>
    <xme:n0RQYUdqU6iuApNmxrVeB44Dx-QNTsAVARwSJBIaflujUaV9FFe5gpuDgERiqGehA
    4tytvMqZ3oKOzvRXe8>
X-ME-Received: <xmr:n0RQYWxi1B9DAzA1Hori2DiYr0dmWjUjIwTmR5y3hiNe0XQ9GJjH-L2bpvtHPP84aOZgwXZORgp4a4tZP_fu4Z7VwL3mLlVyb0Ys6-zsAN5fqHQp2qJ_fgM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
    rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
    necuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
    hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:n0RQYSNcTgbekjC_Lu4rgdZfdgExRrQCvva3kB8CvDD541Y9bobmvA>
    <xmx:n0RQYT9xrJzv1T1LVXr8yG90jCX1NPqbd50Cnv8u08GTwEOZkF_5pQ>
    <xmx:n0RQYSVuJSzob4ME5bgt2hnznmLxXsm3EAKKRf8JMgjpd03eoQKkCA>
    <xmx:n0RQYZfVa3O3V83mbSGPUccPKfhG-FX2DKaFQarcLgzsE8H-6UKq9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:57 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>
Cc:     Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] i2c: pasemi: Add Apple platform driver
Date:   Sun, 26 Sep 2021 11:58:46 +0200
Message-Id: <20210926095847.38261-10-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

With all the previous preparations we can now finally add
the platform driver to support the PASemi-based controllers
in Apple SoCs. This does not work on the M1 yet but should
work on the early iPhones already.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 MAINTAINERS                           |   1 +
 drivers/i2c/busses/Kconfig            |  11 +++
 drivers/i2c/busses/Makefile           |   2 +
 drivers/i2c/busses/i2c-pasemi-apple.c | 122 ++++++++++++++++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-pasemi-apple.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 380a680db92f..6e952158b6e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1738,6 +1738,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	arch/arm64/boot/dts/apple/
+F:	drivers/i2c/busses/i2c-pasemi-apple.c
 F:	drivers/irqchip/irq-apple-aic.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e17790fe35a7..cf4dae07e319 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -856,6 +856,17 @@ config I2C_PASEMI
 	help
 	  Supports the PA Semi PWRficient on-chip SMBus interfaces.
 
+config I2C_APPLE
+	tristate "Apple SMBus platform driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default ARCH_APPLE
+	help
+	  Say Y here if you want to use the I2C controller present on Apple
+	  Silicon chips such as the M1.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-apple.
+
 config I2C_PCA_PLATFORM
 	tristate "PCA9564/PCA9665 as platform device"
 	select I2C_ALGOPCA
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 0ab1b4cb2228..474fe2c520d0 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -86,6 +86,8 @@ obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
 i2c-pasemi-objs := i2c-pasemi-core.o i2c-pasemi-pci.o
 obj-$(CONFIG_I2C_PASEMI)	+= i2c-pasemi.o
+i2c-apple-objs := i2c-pasemi-core.o i2c-pasemi-apple.o
+obj-$(CONFIG_I2C_APPLE)	+= i2c-apple.o
 obj-$(CONFIG_I2C_PCA_PLATFORM)	+= i2c-pca-platform.o
 obj-$(CONFIG_I2C_PNX)		+= i2c-pnx.o
 obj-$(CONFIG_I2C_PXA)		+= i2c-pxa.o
diff --git a/drivers/i2c/busses/i2c-pasemi-apple.c b/drivers/i2c/busses/i2c-pasemi-apple.c
new file mode 100644
index 000000000000..c87f8e516eff
--- /dev/null
+++ b/drivers/i2c/busses/i2c-pasemi-apple.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 The Asahi Linux Contributors
+ *
+ * PA Semi PWRficient SMBus host driver for Apple SoCs
+ */
+
+#include <linux/clk.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include "i2c-pasemi-core.h"
+
+struct pasemi_apple_i2c_data {
+	struct pasemi_smbus smbus;
+	struct clk *clk_ref;
+	struct pinctrl *pctrl;
+};
+
+static int pasemi_apple_i2c_calc_clk_div(struct pasemi_apple_i2c_data *data,
+					 u32 frequency)
+{
+	unsigned long clk_rate = clk_get_rate(data->clk_ref);
+
+	if (!clk_rate)
+		return -EINVAL;
+
+	data->smbus.clk_div = DIV_ROUND_UP(clk_rate, 16 * frequency);
+	if (data->smbus.clk_div < 4)
+		return dev_err_probe(data->smbus.dev, -EINVAL,
+				     "Bus frequency %d is too fast.\n",
+				     frequency);
+	if (data->smbus.clk_div > 0xff)
+		return dev_err_probe(data->smbus.dev, -EINVAL,
+				     "Bus frequency %d is too slow.\n",
+				     frequency);
+
+	return 0;
+}
+
+static int pasemi_apple_i2c_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pasemi_apple_i2c_data *data;
+	struct pasemi_smbus *smbus;
+	u32 frequency;
+	int error;
+
+	data = devm_kzalloc(dev, sizeof(struct pasemi_apple_i2c_data),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	smbus = &data->smbus;
+	smbus->dev = dev;
+
+	smbus->ioaddr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(smbus->ioaddr))
+		return PTR_ERR(smbus->ioaddr);
+
+	if (of_property_read_u32(dev->of_node, "clock-frequency", &frequency))
+		frequency = I2C_MAX_STANDARD_MODE_FREQ;
+
+	data->clk_ref = devm_clk_get(dev, NULL);
+	if (IS_ERR(data->clk_ref))
+		return PTR_ERR(data->clk_ref);
+
+	error = clk_prepare_enable(data->clk_ref);
+	if (error)
+		return error;
+
+	error = pasemi_apple_i2c_calc_clk_div(data, frequency);
+	if (error)
+		goto out_clk_disable;
+
+	smbus->adapter.dev.of_node = pdev->dev.of_node;
+	error = pasemi_i2c_common_probe(smbus);
+	if (error)
+		goto out_clk_disable;
+
+	platform_set_drvdata(pdev, data);
+
+	return 0;
+
+out_clk_disable:
+	clk_disable_unprepare(data->clk_ref);
+
+	return error;
+}
+
+static int pasemi_apple_i2c_remove(struct platform_device *pdev)
+{
+	struct pasemi_apple_i2c_data *data = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(data->clk_ref);
+	return 0;
+}
+
+static const struct of_device_id pasemi_apple_i2c_of_match[] = {
+	{ .compatible = "apple,t8103-i2c" },
+	{ .compatible = "apple,i2c" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, pasemi_apple_i2c_of_match);
+
+static struct platform_driver pasemi_apple_i2c_driver = {
+	.driver	= {
+		.name			= "i2c-apple",
+		.of_match_table		= pasemi_apple_i2c_of_match,
+	},
+	.probe	= pasemi_apple_i2c_probe,
+	.remove	= pasemi_apple_i2c_remove,
+};
+module_platform_driver(pasemi_apple_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
+MODULE_DESCRIPTION("Apple/PASemi SMBus platform driver");
-- 
2.25.1

