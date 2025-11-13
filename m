Return-Path: <linux-i2c+bounces-14073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04990C56642
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 09:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F31DB348DB1
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 08:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41856330D32;
	Thu, 13 Nov 2025 08:48:55 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72EC2C1589;
	Thu, 13 Nov 2025 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763023735; cv=none; b=Y94j0e4pxChkWvlgTZ9pKfWNHup+vjYY/QZYOOrpuLSr7YLhu2Y/zXGY8gfgQPjG28v0TvQzmIC3W2i1UGtW3GIGZbHHFOSv5ivZ+keTMdDc87XKP1Ba4edlNm8UUWKifFX4tUcQk9iJsE7mx5tjviJW8tYznQn/cIohsXNISoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763023735; c=relaxed/simple;
	bh=vIYoFt+dYAEQdMJvkmAfTYppKiVzDcVak5wU5CbF4Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aydEWukDS94QNs9WVUcNJM6SoAErYEfRtZ8uA7sWRz92UEKLm1SFiTV7bNlRGkB9sJYBPX1bV9paIxHaxqG2yQ0V1udPRfu0SAgGIAaPblpzGxnGDbwblSA3PBGsJReo1iZlOfrd/FJdgUpjsVMrXho4h+bCkZ1JC+gdso4XB/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8AxxtBwmxVpr8oiAA--.8489S3;
	Thu, 13 Nov 2025 16:48:48 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJAxQMJimxVpkYAxAQ--.3356S4;
	Thu, 13 Nov 2025 16:48:43 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
Date: Thu, 13 Nov 2025 16:48:24 +0800
Message-ID: <8899e0bf2a008003208dbcb63b4a40ae116fe5d8.1763018288.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1763018288.git.zhoubinbin@loongson.cn>
References: <cover.1763018288.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxQMJimxVpkYAxAQ--.3356S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEFCGkVcy8C9AAAsb
X-Coremail-Antispam: 1Uk129KBj9fXoW3tF13tr1DZFW8Zr4kuw47KFX_yoW8Cryruo
	WF93Wftr45Jw18u342k34jyr4xXF95Ar1DCw4xJrs7Jryjy3WUKFWkKw13Ca43CryUtr4f
	ZF95tFWxCFs3t3s8l-sFpf9Il3svdjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYG7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EoGPUUUUU==

This I2C module is integrated into the Loongson-2K0300 SoCs.

It provides multi-master functionality and controls all I2C bus-specific
timing, protocols, arbitration, and timing. It supports both standard
and fast modes.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS                      |   1 +
 drivers/i2c/busses/Kconfig       |  10 +
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-ls2x-v2.c | 513 +++++++++++++++++++++++++++++++
 4 files changed, 525 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ls2x-v2.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ddecf1ef3bed..8badab5d774d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14601,6 +14601,7 @@ M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
+F:	drivers/i2c/busses/i2c-ls2x-v2.c
 F:	drivers/i2c/busses/i2c-ls2x.c
 
 LOONGSON PWM DRIVER
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fd81e49638aa..f52abbe20ce5 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -855,6 +855,16 @@ config I2C_LS2X
 	  This driver can also be built as a module. If so, the module
 	  will be called i2c-ls2x.
 
+config I2C_LS2X_V2
+	tristate "Loongson-2 Fast Speed I2C adapter"
+	depends on LOONGARCH || COMPILE_TEST
+	help
+	  If you say yes to this option, support will be included for the
+	  I2C interface on the Loongson-2K0300 SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-ls2x-v2.
+
 config I2C_MLXBF
         tristate "Mellanox BlueField I2C controller"
         depends on (MELLANOX_PLATFORM && ARM64) || COMPILE_TEST
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index fb985769f5ff..8cdfc30b79e9 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -80,6 +80,7 @@ obj-$(CONFIG_I2C_KEBA)		+= i2c-keba.o
 obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
 obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
 obj-$(CONFIG_I2C_LS2X)		+= i2c-ls2x.o
+obj-$(CONFIG_I2C_LS2X_V2)	+= i2c-ls2x-v2.o
 obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
 obj-$(CONFIG_I2C_MICROCHIP_CORE)	+= i2c-microchip-corei2c.o
 obj-$(CONFIG_I2C_MPC)		+= i2c-mpc.o
diff --git a/drivers/i2c/busses/i2c-ls2x-v2.c b/drivers/i2c/busses/i2c-ls2x-v2.c
new file mode 100644
index 000000000000..e3b2a7ffe67e
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ls2x-v2.c
@@ -0,0 +1,513 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Loongson-2K fast I2C controller driver
+ *
+ * Copyright (C) 2025 Loongson Technology Corporation Limited
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/iopoll.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/units.h>
+
+/* Loongson-2 fast I2C offset registers */
+#define LOONGSON2_I2C_CR1	0x00	/* I2C control 1 register */
+#define LOONGSON2_I2C_CR2	0x04	/* I2C control 2 register */
+#define LOONGSON2_I2C_OAR	0x08	/* I2C slave address register */
+#define LOONGSON2_I2C_DR	0x10	/* I2C data register */
+#define LOONGSON2_I2C_SR1	0x14	/* I2C status 1 register */
+#define LOONGSON2_I2C_SR2	0x18	/* I2C status 2 register */
+#define LOONGSON2_I2C_CCR	0x1C	/* I2C clock control register */
+#define LOONGSON2_I2C_TRISE	0x20	/* I2C trise register */
+#define LOONGSON2_I2C_FLTR	0x24
+
+/* Bitfields of I2C control 1 register */
+#define LOONGSON2_I2C_CR1_PE		BIT(0)
+#define LOONGSON2_I2C_CR1_START		BIT(8)
+#define LOONGSON2_I2C_CR1_STOP		BIT(9)
+#define LOONGSON2_I2C_CR1_ACK		BIT(10)
+#define LOONGSON2_I2C_CR1_POS		BIT(11)
+
+#define LOONGSON2_I2C_CR1_OP_MASK	(LOONGSON2_I2C_CR1_START | LOONGSON2_I2C_CR1_STOP)
+
+/* Bitfields of I2C control 2 register */
+#define LOONGSON2_I2C_CR2_FREQ		GENMASK(5, 0)
+#define LOONGSON2_I2C_CR2_ITERREN	BIT(8)
+#define LOONGSON2_I2C_CR2_ITEVTEN	BIT(9)
+#define LOONGSON2_I2C_CR2_ITBUFEN	BIT(10)
+
+#define LOONGSON2_I2C_CR2_IRQ_MASK	(LOONGSON2_I2C_CR2_ITBUFEN | \
+					 LOONGSON2_I2C_CR2_ITEVTEN | \
+					 LOONGSON2_I2C_CR2_ITERREN)
+
+/* Bitfields of I2C status 1 register */
+#define LOONGSON2_I2C_SR1_SB		BIT(0)
+#define LOONGSON2_I2C_SR1_ADDR		BIT(1)
+#define LOONGSON2_I2C_SR1_BTF		BIT(2)
+#define LOONGSON2_I2C_SR1_RXNE		BIT(6)
+#define LOONGSON2_I2C_SR1_TXE		BIT(7)
+#define LOONGSON2_I2C_SR1_BERR		BIT(8)
+#define LOONGSON2_I2C_SR1_ARLO		BIT(9)
+#define LOONGSON2_I2C_SR1_AF		BIT(10)
+
+#define LOONGSON2_I2C_SR1_ITEVTEN_MASK	(LOONGSON2_I2C_SR1_BTF | \
+					 LOONGSON2_I2C_SR1_ADDR | \
+					 LOONGSON2_I2C_SR1_SB)
+#define LOONGSON2_I2C_SR1_ITBUFEN_MASK	(LOONGSON2_I2C_SR1_TXE | LOONGSON2_I2C_SR1_RXNE)
+#define LOONGSON2_I2C_SR1_ITERREN_MASK	(LOONGSON2_I2C_SR1_AF | \
+					 LOONGSON2_I2C_SR1_ARLO | \
+					 LOONGSON2_I2C_SR1_BERR)
+
+/* Bitfields of I2C status 2 register */
+#define LOONGSON2_I2C_SR2_BUSY		BIT(1)
+
+/* Bitfields of I2C clock control register */
+#define LOONGSON2_I2C_CCR_CCR		GENMASK(11, 0)
+#define LOONGSON2_I2C_CCR_DUTY		BIT(14)
+#define LOONGSON2_I2C_CCR_FS		BIT(15)
+
+/* Bitfields of I2C trise register */
+#define LOONGSON2_I2C_TRISE_SCL		GENMASK(5, 0)
+
+#define LOONGSON2_I2C_FREE_SLEEP_US	1000
+#define LOONGSON2_I2C_FREE_TIMEOUT_US	5000
+
+/*
+ * struct loongson2_i2c_msg - client specific data
+ * @addr: 8-bit slave addr, including r/w bit
+ * @count: number of bytes to be transferred
+ * @buf: data buffer
+ * @stop: last I2C msg to be sent, i.e. STOP to be generated
+ * @result: result of the transfer
+ */
+struct loongson2_i2c_msg {
+	u8 addr;
+	u32 count;
+	u8 *buf;
+	bool stop;
+	int result;
+};
+
+/*
+ * struct loongson2_i2c_priv - private data of the controller
+ * @adapter: I2C adapter for this controller
+ * @dev: device for this controller
+ * @complete: completion of I2C message
+ * @regmap: regmap of the I2C device
+ * @i2c_t: I2C timing information
+ * @msg: I2C transfer information
+ */
+struct loongson2_i2c_priv {
+	struct i2c_adapter adapter;
+	struct device *dev;
+	struct completion complete;
+	struct regmap *regmap;
+	struct i2c_timings i2c_t;
+	struct loongson2_i2c_msg msg;
+};
+
+static void loongson2_i2c_disable_irq(struct loongson2_i2c_priv *priv)
+{
+	regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I2C_CR2_IRQ_MASK, 0);
+}
+
+static int loongson2_i2c_wait_free_bus(struct loongson2_i2c_priv *priv)
+{
+	u32 status;
+	int ret;
+
+	ret = regmap_read_poll_timeout(priv->regmap, LOONGSON2_I2C_SR2, status,
+				       !(status & LOONGSON2_I2C_SR2_BUSY),
+				       LOONGSON2_I2C_FREE_SLEEP_US,
+				       LOONGSON2_I2C_FREE_TIMEOUT_US);
+	if (ret) {
+		dev_dbg(priv->dev, "I2C bus free failed.\n");
+		ret = -EBUSY;
+	}
+
+	return ret;
+}
+
+static void loongson2_i2c_write_byte(struct loongson2_i2c_priv *priv, u8 byte)
+{
+	regmap_write(priv->regmap, LOONGSON2_I2C_DR, byte);
+}
+
+static void loongson2_i2c_read_msg(struct loongson2_i2c_priv *priv)
+{
+	struct loongson2_i2c_msg *msg = &priv->msg;
+	u32 rbuf;
+
+	regmap_read(priv->regmap, LOONGSON2_I2C_DR, &rbuf);
+	*msg->buf++ = rbuf;
+	msg->count--;
+}
+
+static void loongson2_i2c_terminate_xfer(struct loongson2_i2c_priv *priv)
+{
+	struct loongson2_i2c_msg *msg = &priv->msg;
+
+	loongson2_i2c_disable_irq(priv);
+	regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_OP_MASK,
+			   msg->stop ? LOONGSON2_I2C_CR1_STOP : LOONGSON2_I2C_CR1_START);
+	complete(&priv->complete);
+}
+
+static void loongson2_i2c_handle_write(struct loongson2_i2c_priv *priv)
+{
+	struct loongson2_i2c_msg *msg = &priv->msg;
+
+	if (msg->count) {
+		loongson2_i2c_write_byte(priv, *msg->buf++);
+		msg->count--;
+		if (!msg->count)
+			regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2,
+					   LOONGSON2_I2C_CR2_ITBUFEN, 0);
+	} else {
+		loongson2_i2c_terminate_xfer(priv);
+	}
+}
+
+static void loongson2_i2c_handle_read(struct loongson2_i2c_priv *priv, int flag)
+{
+	struct loongson2_i2c_msg *msg = &priv->msg;
+	bool changed;
+	int i;
+
+	switch (msg->count) {
+	case 1:
+		/* only transmit 1 bytes condition */
+		loongson2_i2c_disable_irq(priv);
+		loongson2_i2c_read_msg(priv);
+		complete(&priv->complete);
+		break;
+	case 2:
+		if (flag != 1) {
+			/* ensure only transmit 2 bytes condition */
+			regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2,
+					   LOONGSON2_I2C_CR2_ITBUFEN, 0);
+			break;
+		}
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_OP_MASK,
+				   msg->stop ? LOONGSON2_I2C_CR1_STOP : LOONGSON2_I2C_CR1_START);
+
+		loongson2_i2c_disable_irq(priv);
+
+		for (i = 2; i > 0; i--)
+			loongson2_i2c_read_msg(priv);
+
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_POS, 0);
+		complete(&priv->complete);
+		break;
+	case 3:
+		regmap_update_bits_check(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I2C_CR2_ITBUFEN,
+					 0, &changed);
+		if (changed)
+			break;
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_ACK, 0);
+		fallthrough;
+	default:
+		loongson2_i2c_read_msg(priv);
+	}
+}
+
+static void loongson2_i2c_handle_rx_addr(struct loongson2_i2c_priv *priv)
+{
+	struct loongson2_i2c_msg *msg = &priv->msg;
+
+	switch (msg->count) {
+	case 0:
+		loongson2_i2c_terminate_xfer(priv);
+		break;
+	case 1:
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1,
+				   LOONGSON2_I2C_CR1_ACK | LOONGSON2_I2C_CR1_POS, 0);
+		/* start or stop */
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_OP_MASK,
+				   msg->stop ? LOONGSON2_I2C_CR1_STOP : LOONGSON2_I2C_CR1_START);
+		break;
+	case 2:
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_ACK, 0);
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_POS,
+				   LOONGSON2_I2C_CR1_POS);
+		break;
+
+	default:
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_ACK,
+				   LOONGSON2_I2C_CR1_ACK);
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_POS, 0);
+	}
+}
+
+static irqreturn_t loongson2_i2c_isr_error(u32 status, void *data)
+{
+	struct loongson2_i2c_priv *priv = data;
+	struct loongson2_i2c_msg *msg = &priv->msg;
+
+	/* Arbitration lost */
+	if (status & LOONGSON2_I2C_SR1_ARLO) {
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_SR1, LOONGSON2_I2C_SR1_ARLO, 0);
+		msg->result = -EAGAIN;
+	}
+
+	/*
+	 * Acknowledge failure:
+	 * In master transmitter mode a Stop must be generated by software
+	 */
+	if (status & LOONGSON2_I2C_SR1_AF) {
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_STOP,
+				   LOONGSON2_I2C_CR1_STOP);
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_SR1, LOONGSON2_I2C_SR1_AF, 0);
+		msg->result = -EIO;
+	}
+
+	/* Bus error */
+	if (status & LOONGSON2_I2C_SR1_BERR) {
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_SR1, LOONGSON2_I2C_SR1_BERR, 0);
+		msg->result = -EIO;
+	}
+
+	loongson2_i2c_disable_irq(priv);
+	complete(&priv->complete);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t loongson2_i2c_isr_event(int irq, void *data)
+{
+	u32 possible_status = LOONGSON2_I2C_SR1_ITEVTEN_MASK;
+	struct loongson2_i2c_priv *priv = data;
+	struct loongson2_i2c_msg *msg = &priv->msg;
+	u32 status, ien, event, cr2;
+
+	regmap_read(priv->regmap, LOONGSON2_I2C_SR1, &status);
+	if (status & LOONGSON2_I2C_SR1_ITERREN_MASK)
+		return loongson2_i2c_isr_error(status, data);
+
+	regmap_read(priv->regmap, LOONGSON2_I2C_CR2, &cr2);
+	ien = cr2 & LOONGSON2_I2C_CR2_IRQ_MASK;
+
+	/* Update possible_status if buffer interrupt is enabled */
+	if (ien & LOONGSON2_I2C_CR2_ITBUFEN)
+		possible_status |= LOONGSON2_I2C_SR1_ITBUFEN_MASK;
+
+	event = status & possible_status;
+	if (!event) {
+		dev_dbg(priv->dev, "spurious evt irq (status=0x%08x, ien=0x%08x)\n", status, ien);
+		return IRQ_NONE;
+	}
+
+	/* Start condition generated */
+	if (event & LOONGSON2_I2C_SR1_SB)
+		loongson2_i2c_write_byte(priv, msg->addr);
+
+	/* I2C Address sent */
+	if (event & LOONGSON2_I2C_SR1_ADDR) {
+		if (msg->addr & I2C_M_RD)
+			loongson2_i2c_handle_rx_addr(priv);
+		/* Clear ADDR flag */
+		regmap_read(priv->regmap, LOONGSON2_I2C_SR2, &status);
+		/* Enable buffer interrupts for RX/TX not empty events */
+		regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I2C_CR2_ITBUFEN,
+				   LOONGSON2_I2C_CR2_ITBUFEN);
+	}
+
+	if (msg->addr & I2C_M_RD) {
+		/* RX not empty */
+		if (event & LOONGSON2_I2C_SR1_RXNE)
+			loongson2_i2c_handle_read(priv, 0);
+
+		if (event & LOONGSON2_I2C_SR1_BTF)
+			loongson2_i2c_handle_read(priv, 1);
+	} else {
+		/* TX empty */
+		if (event & LOONGSON2_I2C_SR1_TXE)
+			loongson2_i2c_handle_write(priv);
+
+		if (event & LOONGSON2_I2C_SR1_BTF)
+			loongson2_i2c_handle_write(priv);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int loongson2_i2c_xfer_msg(struct loongson2_i2c_priv *priv, struct i2c_msg *msg,
+				  bool is_stop)
+{
+	struct loongson2_i2c_msg *l_msg = &priv->msg;
+	unsigned long timeout;
+	int ret;
+
+	l_msg->addr   = i2c_8bit_addr_from_msg(msg);
+	l_msg->buf    = msg->buf;
+	l_msg->count  = msg->len;
+	l_msg->stop   = is_stop;
+	l_msg->result = 0;
+
+	reinit_completion(&priv->complete);
+
+	/* Enable events and errors interrupts */
+	regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2,
+			   LOONGSON2_I2C_CR2_ITEVTEN | LOONGSON2_I2C_CR2_ITERREN,
+			   LOONGSON2_I2C_CR2_ITEVTEN | LOONGSON2_I2C_CR2_ITERREN);
+
+	timeout = wait_for_completion_timeout(&priv->complete, priv->adapter.timeout);
+	ret = l_msg->result;
+
+	if (!timeout)
+		ret = -ETIMEDOUT;
+
+	return ret;
+}
+
+static int loongson2_i2c_xfer(struct i2c_adapter *i2c_adap, struct i2c_msg msgs[], int num)
+{
+	struct loongson2_i2c_priv *priv = i2c_get_adapdata(i2c_adap);
+	int ret = 0, i;
+
+	ret = loongson2_i2c_wait_free_bus(priv);
+	if (ret)
+		return ret;
+
+	/* START generation */
+	regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_START,
+			   LOONGSON2_I2C_CR1_START);
+
+	for (i = 0; i < num && !ret; i++)
+		ret = loongson2_i2c_xfer_msg(priv, &msgs[i], i == num - 1);
+
+	return (ret < 0) ? ret : num;
+}
+
+static u32 loongson2_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm loongson2_i2c_algo = {
+	.master_xfer = loongson2_i2c_xfer,
+	.functionality = loongson2_i2c_func,
+};
+
+static void loongson2_i2c_adjust_bus_speed(struct loongson2_i2c_priv *priv)
+{
+	struct device *dev = priv->adapter.dev.parent;
+	struct i2c_timings *t = &priv->i2c_t;
+	u32 val, ccr = 0;
+
+	t->bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
+
+	i2c_parse_fw_timings(dev, t, false);
+
+	if (t->bus_freq_hz >= I2C_MAX_FAST_MODE_FREQ) {
+		val = DIV_ROUND_UP(t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ * 3);
+
+		/* Select Fast mode */
+		ccr |= LOONGSON2_I2C_CCR_FS;
+	} else {
+		val = DIV_ROUND_UP(t->bus_freq_hz, I2C_MAX_STANDARD_MODE_FREQ * 2);
+	}
+
+	ccr |= FIELD_GET(LOONGSON2_I2C_CCR_CCR, val);
+	regmap_write(priv->regmap, LOONGSON2_I2C_CCR, ccr);
+
+	/* reference clock determination the configure val(0x3f) */
+	regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I2C_CR2_FREQ,
+			   LOONGSON2_I2C_CR2_FREQ);
+	regmap_update_bits(priv->regmap, LOONGSON2_I2C_TRISE, LOONGSON2_I2C_TRISE_SCL,
+			   LOONGSON2_I2C_TRISE_SCL);
+
+	/* Enable I2C */
+	regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C_CR1_PE,
+			   LOONGSON2_I2C_CR1_PE);
+}
+
+static const struct regmap_config loongson2_i2c_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = LOONGSON2_I2C_TRISE,
+};
+
+static int loongson2_i2c_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct loongson2_i2c_priv *priv;
+	struct i2c_adapter *adap;
+	void __iomem *base;
+	int irq, ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "devm_platform_ioremap_resource failed\n");
+
+	priv->regmap = devm_regmap_init_mmio(dev, base,
+					     &loongson2_i2c_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "devm_regmap_init_mmio failed\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return -EINVAL;
+
+	priv->dev = dev;
+
+	adap = &priv->adapter;
+	adap->retries = 5;
+	adap->nr = pdev->id;
+	adap->dev.parent = dev;
+	adap->owner = THIS_MODULE;
+	adap->algo = &loongson2_i2c_algo;
+	adap->timeout = 2 * HZ;
+	device_set_node(&adap->dev, dev_fwnode(dev));
+	i2c_set_adapdata(adap, priv);
+	strscpy(adap->name, pdev->name, sizeof(adap->name));
+	init_completion(&priv->complete);
+	platform_set_drvdata(pdev, priv);
+
+	loongson2_i2c_adjust_bus_speed(priv);
+
+	ret = devm_request_irq(dev, irq,  loongson2_i2c_isr_event, IRQF_SHARED, pdev->name, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to request irq %d\n", irq);
+
+	return devm_i2c_add_adapter(dev, adap);
+}
+
+static const struct of_device_id loongson2_i2c_id_table[] = {
+	{ .compatible = "loongson,ls2k0300-i2c" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, loongson2_i2c_id_table);
+
+static struct platform_driver loongson2_i2c_driver = {
+	.driver = {
+		.name = "loongson2-i2c-v2",
+		.of_match_table = loongson2_i2c_id_table,
+	},
+	.probe = loongson2_i2c_probe,
+};
+
+module_platform_driver(loongson2_i2c_driver);
+
+MODULE_DESCRIPTION("Loongson-2K0300 I2C bus driver");
+MODULE_AUTHOR("Loongson Technology Corporation Limited");
+MODULE_LICENSE("GPL");
-- 
2.47.3


