Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01D3426F28
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 18:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbhJHQjB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 12:39:01 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:42717 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233255AbhJHQii (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 12:38:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id D123758101B;
        Fri,  8 Oct 2021 12:36:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 08 Oct 2021 12:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=Xxf/oLBb94WpO
        qtFzUC5D0kmaoK2xnr3zs7/ZlJB6DQ=; b=C1F5K3unnEnj0ThmmGWCi/JVG8d2p
        eF8KUpeR+MISd0IiDaNmRZKjHJu+7vYJEJy4fatOTRzp4yJqfThLEb7WwmPVX6R+
        hXA1Q00xgojcKVH1cL8IOV/Id8rpTE6P6xcuO7BNxasLrAur08TDTHLofQ5EkDxq
        +TlqNVcq4Eq9P/YZt0XxLQnz9QlDdKz/4ck63vDI15CKHSo5Bvj4iLfXv+jmTBtP
        /W5scloZwFCFqV+JfMA84HsRWPpDp2dzLqCtAvEwD5AhYYLc3OEPxOQxP4xLkgy0
        IvnfeUeW0xwuNXLg0P9DL6GbrMMxNB2AhhBSfVhG2QprrGEHAuEJIi37Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=Xxf/oLBb94WpOqtFzUC5D0kmaoK2xnr3zs7/ZlJB6DQ=; b=g+eprF4x
        6sDwPQT54h2rD4vlfJHrHDJ/QyY7KDEwzsCLIXReh+WTt0SxWnNqOlun11r7vMq9
        IvqfXAd+CI/uE6mN3koX6y2JQZeHLVfD5SLtSxt7BIMzM4WZO0et/ui34o25IOfp
        eE/EpL0TY8hzmEhDXACmXPL8TCRYj6yK5xujq5CaQkgakNSIJMUm9ZrfziBwtxXO
        ZC7qlhfyR0g9jAa4PoJxmoyyZ87Jye8Jk71jzFZpLt016qR4ZgVg0AQkC1a6/O/3
        UuweHlV8JA6DCeFAPyJShmaJU2OcKPDa7Vxpf9M5HGlOrzsZoTkoyZa312MbC9pc
        zO81H0MZOIvG7Q==
X-ME-Sender: <xms:mnNgYT1pzNl3lwFPGFPN4TBd8qA5Ac4K6iPzqK8O8lCLtkMtu0VBUw>
    <xme:mnNgYSG5x5SbmGAwdjfsVChE2vSn7gMjYJW4DosFET-gZDxFQ2eH7r5i0z9xq9jfD
    mJ7lykrZODbNm30bIQ>
X-ME-Received: <xmr:mnNgYT7RKQlHWfusIaysh5563P6MNGcVpYatumUaXGqbKfWuHYjZgghErJAMseHQPbUonZlzv9L3O2pSCr4KYY13Xr_lM3KTxnwfb_y5YOS__HL_hYb3tyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
    ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
    jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:mnNgYY0312ZgCBuS7rCVKMPuL1O35GzkQxpeJGTiXZ1JLsvCJSs5nA>
    <xmx:mnNgYWEZy91IZbzf36YBCR9yYEIsgnuZjIaYpkdYhJn_ab8BaKbrDw>
    <xmx:mnNgYZ-QmewZKFVh75whBJUrefSfBPRiDVQPLbEbJe-qRYhbnoeQfA>
    <xmx:mnNgYUEQg1nlUk7fUKRSrNzlB9cBsD-BjGF-ZB15IgdvWlOP1FSEyg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:40 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] i2c: pasemi: Add Apple platform driver
Date:   Fri,  8 Oct 2021 18:35:31 +0200
Message-Id: <20211008163532.75569-11-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
References: <20211008163532.75569-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

With all the previous preparations we can now finally add
the platform driver to support the PASemi-based controllers
in Apple SoCs. This does not work on the M1 yet but should
work on the early iPhones already.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2:
 - renamed i2c-pasemi-apple.c to i2c-pasemi-platform.c and adjusted
   function names as well
 - removed unused struct pinctrl *pctrl which snuck into v1

 MAINTAINERS                              |   1 +
 drivers/i2c/busses/Kconfig               |  11 ++
 drivers/i2c/busses/Makefile              |   2 +
 drivers/i2c/busses/i2c-pasemi-platform.c | 122 +++++++++++++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-pasemi-platform.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 74aa85967ca3..8e0f1dc94b5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1740,6 +1740,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	arch/arm64/boot/dts/apple/
+F:	drivers/i2c/busses/i2c-pasemi-platform.c
 F:	drivers/irqchip/irq-apple-aic.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 1df19ccc310b..dce392839017 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -859,6 +859,17 @@ config I2C_PASEMI
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
index 0ab1b4cb2228..d85899fef8c7 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -86,6 +86,8 @@ obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
 i2c-pasemi-objs := i2c-pasemi-core.o i2c-pasemi-pci.o
 obj-$(CONFIG_I2C_PASEMI)	+= i2c-pasemi.o
+i2c-apple-objs := i2c-pasemi-core.o i2c-pasemi-platform.o
+obj-$(CONFIG_I2C_APPLE)	+= i2c-apple.o
 obj-$(CONFIG_I2C_PCA_PLATFORM)	+= i2c-pca-platform.o
 obj-$(CONFIG_I2C_PNX)		+= i2c-pnx.o
 obj-$(CONFIG_I2C_PXA)		+= i2c-pxa.o
diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c b/drivers/i2c/busses/i2c-pasemi-platform.c
new file mode 100644
index 000000000000..88a54aaf7e3c
--- /dev/null
+++ b/drivers/i2c/busses/i2c-pasemi-platform.c
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
+struct pasemi_platform_i2c_data {
+	struct pasemi_smbus smbus;
+	struct clk *clk_ref;
+};
+
+static int
+pasemi_platform_i2c_calc_clk_div(struct pasemi_platform_i2c_data *data,
+				 u32 frequency)
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
+static int pasemi_platform_i2c_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pasemi_platform_i2c_data *data;
+	struct pasemi_smbus *smbus;
+	u32 frequency;
+	int error;
+
+	data = devm_kzalloc(dev, sizeof(struct pasemi_platform_i2c_data),
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
+	error = pasemi_platform_i2c_calc_clk_div(data, frequency);
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
+static int pasemi_platform_i2c_remove(struct platform_device *pdev)
+{
+	struct pasemi_platform_i2c_data *data = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(data->clk_ref);
+	return 0;
+}
+
+static const struct of_device_id pasemi_platform_i2c_of_match[] = {
+	{ .compatible = "apple,t8103-i2c" },
+	{ .compatible = "apple,i2c" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, pasemi_platform_i2c_of_match);
+
+static struct platform_driver pasemi_platform_i2c_driver = {
+	.driver	= {
+		.name			= "i2c-apple",
+		.of_match_table		= pasemi_platform_i2c_of_match,
+	},
+	.probe	= pasemi_platform_i2c_probe,
+	.remove	= pasemi_platform_i2c_remove,
+};
+module_platform_driver(pasemi_platform_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
+MODULE_DESCRIPTION("Apple/PASemi SMBus platform driver");
-- 
2.25.1

