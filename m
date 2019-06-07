Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB04C38A3D
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 14:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbfFGM12 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 08:27:28 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45830 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728526AbfFGM11 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 08:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=PD6GLknV1SI5PIWh9FWuJx6saUPEh08dowMbcFVLCPQ=; b=A5MnLMe0y7kf
        zRX5Q4GLvBEUCppxFeN5zlsVaz4hmmjEvpQiQP016GLREYbJV8D5e1CHkrmhfEqxUF//94DdsWp0s
        5S+KQ07wA467RVlkFvnS0sAeYskFu5JrjqiP6pSxxl+WYoDmbTL2hRwu+pwYExxJE4J5+B+RfB4lX
        StZPw=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hZDxn-0002BO-Gj; Fri, 07 Jun 2019 12:27:19 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 0C2F5440046; Fri,  7 Jun 2019 13:27:18 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Vitor Soares <Vitor.Soares@synopsys.com>
Cc:     bbrezillon@kernel.org, broonie@kernel.org,
        gregkh@linuxfoundation.org, Joao.Pinto@synopsys.com,
        linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        lorenzo.bianconi83@gmail.com, Mark Brown <broonie@kernel.org>,
        rafael@kernel.org, Vitor Soares <vitor.soares@synopsys.com>
Subject: Applied "regmap: add i3c bus support" to the regmap tree
In-Reply-To: <ff5e96bdd6b2789122afe1980bb20cfa22900760.1559831663.git.vitor.soares@synopsys.com>
X-Patchwork-Hint: ignore
Message-Id: <20190607122718.0C2F5440046@finisterre.sirena.org.uk>
Date:   Fri,  7 Jun 2019 13:27:17 +0100 (BST)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patch

   regmap: add i3c bus support

has been applied to the regmap tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 6445500b43129baac36c56d629cf1dd9e1104167 Mon Sep 17 00:00:00 2001
From: Vitor Soares <Vitor.Soares@synopsys.com>
Date: Thu, 6 Jun 2019 17:12:02 +0200
Subject: [PATCH] regmap: add i3c bus support

Add basic support for i3c bus.
This is a simple implementation that only give support
for SDR Read and Write commands.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/Kconfig      |  6 +++-
 drivers/base/regmap/Makefile     |  1 +
 drivers/base/regmap/regmap-i3c.c | 60 ++++++++++++++++++++++++++++++++
 include/linux/regmap.h           | 20 +++++++++++
 4 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 drivers/base/regmap/regmap-i3c.c

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index 6ad5ef48b61e..c8bbf5322720 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -4,7 +4,7 @@
 # subsystems should select the appropriate symbols.
 
 config REGMAP
-	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ)
+	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_I3C)
 	select IRQ_DOMAIN if REGMAP_IRQ
 	bool
 
@@ -49,3 +49,7 @@ config REGMAP_SOUNDWIRE
 config REGMAP_SCCB
 	tristate
 	depends on I2C
+
+config REGMAP_I3C
+	tristate
+	depends on I3C
diff --git a/drivers/base/regmap/Makefile b/drivers/base/regmap/Makefile
index f5b4e8851d00..ff6c7d8ec1cd 100644
--- a/drivers/base/regmap/Makefile
+++ b/drivers/base/regmap/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_REGMAP_IRQ) += regmap-irq.o
 obj-$(CONFIG_REGMAP_W1) += regmap-w1.o
 obj-$(CONFIG_REGMAP_SOUNDWIRE) += regmap-sdw.o
 obj-$(CONFIG_REGMAP_SCCB) += regmap-sccb.o
+obj-$(CONFIG_REGMAP_I3C) += regmap-i3c.o
diff --git a/drivers/base/regmap/regmap-i3c.c b/drivers/base/regmap/regmap-i3c.c
new file mode 100644
index 000000000000..1578fb506683
--- /dev/null
+++ b/drivers/base/regmap/regmap-i3c.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Synopsys, Inc. and/or its affiliates.
+
+#include <linux/regmap.h>
+#include <linux/i3c/device.h>
+#include <linux/i3c/master.h>
+#include <linux/module.h>
+
+static int regmap_i3c_write(void *context, const void *data, size_t count)
+{
+	struct device *dev = context;
+	struct i3c_device *i3c = dev_to_i3cdev(dev);
+	struct i3c_priv_xfer xfers[] = {
+		{
+			.rnw = false,
+			.len = count,
+			.data.out = data,
+		},
+	};
+
+	return i3c_device_do_priv_xfers(i3c, xfers, 1);
+}
+
+static int regmap_i3c_read(void *context,
+			   const void *reg, size_t reg_size,
+			   void *val, size_t val_size)
+{
+	struct device *dev = context;
+	struct i3c_device *i3c = dev_to_i3cdev(dev);
+	struct i3c_priv_xfer xfers[2];
+
+	xfers[0].rnw = false;
+	xfers[0].len = reg_size;
+	xfers[0].data.out = reg;
+
+	xfers[1].rnw = true;
+	xfers[1].len = val_size;
+	xfers[1].data.in = val;
+
+	return i3c_device_do_priv_xfers(i3c, xfers, 2);
+}
+
+static struct regmap_bus regmap_i3c = {
+	.write = regmap_i3c_write,
+	.read = regmap_i3c_read,
+};
+
+struct regmap *__devm_regmap_init_i3c(struct i3c_device *i3c,
+				      const struct regmap_config *config,
+				      struct lock_class_key *lock_key,
+				      const char *lock_name)
+{
+	return __devm_regmap_init(&i3c->dev, &regmap_i3c, &i3c->dev, config,
+				  lock_key, lock_name);
+}
+EXPORT_SYMBOL_GPL(__devm_regmap_init_i3c);
+
+MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
+MODULE_DESCRIPTION("Regmap I3C Module");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index daeec7dbd65c..f65984d98b07 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -25,6 +25,7 @@ struct module;
 struct clk;
 struct device;
 struct i2c_client;
+struct i3c_device;
 struct irq_domain;
 struct slim_device;
 struct spi_device;
@@ -624,6 +625,10 @@ struct regmap *__devm_regmap_init_slimbus(struct slim_device *slimbus,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
+struct regmap *__devm_regmap_init_i3c(struct i3c_device *i3c,
+				 const struct regmap_config *config,
+				 struct lock_class_key *lock_key,
+				 const char *lock_name);
 /*
  * Wrapper for regmap_init macros to include a unique lockdep key and name
  * for each call. No-op if CONFIG_LOCKDEP is not set.
@@ -982,6 +987,21 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
 #define devm_regmap_init_slimbus(slimbus, config)			\
 	__regmap_lockdep_wrapper(__devm_regmap_init_slimbus, #config,	\
 				slimbus, config)
+
+/**
+ * devm_regmap_init_i3c() - Initialise managed register map
+ *
+ * @i3c: Device that will be interacted with
+ * @config: Configuration for register map
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer
+ * to a struct regmap.  The regmap will be automatically freed by the
+ * device management code.
+ */
+#define devm_regmap_init_i3c(i3c, config)				\
+	__regmap_lockdep_wrapper(__devm_regmap_init_i3c, #config,	\
+				i3c, config)
+
 int regmap_mmio_attach_clk(struct regmap *map, struct clk *clk);
 void regmap_mmio_detach_clk(struct regmap *map);
 void regmap_exit(struct regmap *map);
-- 
2.20.1

