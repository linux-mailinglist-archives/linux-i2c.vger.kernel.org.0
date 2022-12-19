Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7305D650B9D
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 13:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbiLSM3o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 07:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiLSM3R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 07:29:17 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C42FD1147E;
        Mon, 19 Dec 2022 04:28:27 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8DxfevoWKBj2v4GAA--.15906S3;
        Mon, 19 Dec 2022 20:28:24 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOXYWKBjtOIEAA--.21337S5;
        Mon, 19 Dec 2022 20:28:23 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V7 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
Date:   Mon, 19 Dec 2022 20:28:33 +0800
Message-Id: <d44eb07245020431f98fd08e0c05b6926fb31b24.1671451604.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1671451604.git.zhoubinbin@loongson.cn>
References: <cover.1671451604.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtOXYWKBjtOIEAA--.21337S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3CryfKrWfZw47tFW7Ar18Xwb_yoWkKFy7pF
        45C345Gr4jvr1Sgrs7JFn8uF13Wws3XFyktay3Xa13ZrnrAryDZws7try0yFn5GFykWrWf
        JayDCF45CFW2qrUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
        Aaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
        O2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
        WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
        Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
        WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
        JbIYCTnIWIevJa73UjIFyTuYvjxU4YLvDUUUU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This I2C module is integrated into the Loongson-2K SoCs and Loongson
LS7A bridge chip.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/i2c/busses/Kconfig    |  11 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-ls2x.c | 369 ++++++++++++++++++++++++++++++++++
 3 files changed, 381 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ls2x.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e50f9603d189..908096a762ca 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -888,6 +888,17 @@ config I2C_OWL
 	  Say Y here if you want to use the I2C bus controller on
 	  the Actions Semiconductor Owl SoC's.
 
+config I2C_LS2X
+	tristate "Loongson LS2X I2C adapter"
+	depends on MACH_LOONGSON64 || COMPILE_TEST
+	help
+	  If you say yes to this option, support will be included for the
+	  I2C interface on the Loongson-2K SoCs and Loongson LS7A bridge
+	  chip.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-ls2x.
+
 config I2C_PASEMI
 	tristate "PA Semi SMBus interface"
 	depends on PPC_PASEMI && PCI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index e73cdb1d2b5a..df332ec3c489 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_I2C_MV64XXX)	+= i2c-mv64xxx.o
 obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
 obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
 obj-$(CONFIG_I2C_NPCM)		+= i2c-npcm7xx.o
+obj-$(CONFIG_I2C_LS2X)		+= i2c-ls2x.o
 obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
 obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
new file mode 100644
index 000000000000..dd0ea95d144d
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ls2x.c
@@ -0,0 +1,369 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Loongson-2K/Loongson LS7A I2C master mode driver
+ *
+ * Copyright (C) 2013 Loongson Technology Corporation Limited.
+ * Copyright (C) 2014-2017 Lemote, Inc.
+ * Copyright (C) 2018-2022 Loongson Technology Corporation Limited.
+ *
+ * Originally written by liushaozong
+ * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
+ */
+
+#include <linux/bits.h>
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/units.h>
+
+/* I2C Registers */
+#define I2C_LS2X_PRER		0x0 /* Freq Division Register(16 bits) */
+#define I2C_LS2X_CTR		0x2 /* Control Register */
+#define I2C_LS2X_TXR		0x3 /* Transport Data Register */
+#define I2C_LS2X_RXR		0x3 /* Receive Data Register */
+#define I2C_LS2X_CR		0x4 /* Command Control Register */
+#define I2C_LS2X_SR		0x4 /* State Register */
+
+/* Command Control Register Bit */
+#define LS2X_CR_START		BIT(7) /* Start signal */
+#define LS2X_CR_STOP		BIT(6) /* Stop signal */
+#define LS2X_CR_READ		BIT(5) /* Read signal */
+#define LS2X_CR_WRITE		BIT(4) /* Write signal */
+#define LS2X_CR_ACK		BIT(3) /* Response signal */
+#define LS2X_CR_IACK		BIT(0) /* Interrupt response signal */
+
+/* State Register Bit */
+#define LS2X_SR_NOACK		BIT(7) /* Receive NACK */
+#define LS2X_SR_BUSY		BIT(6) /* Bus busy state */
+#define LS2X_SR_AL		BIT(5) /* Arbitration lost */
+#define LS2X_SR_TIP		BIT(1) /* Transmission state */
+#define LS2X_SR_IF		BIT(0) /* Interrupt flag */
+
+/* Control Register Bit */
+#define LS2X_CTR_EN		BIT(7) /* 0: I2c frequency setting 1: Normal */
+#define LS2X_CTR_IEN		BIT(6) /* Enable i2c interrupt */
+#define LS2X_CTR_MST		BIT(5) /* 0: Slave mode 1: Master mode */
+#define CTR_READY_MASK		GENMASK(7, 5)
+
+/* The PCLK frequency from LPB */
+#define LS2X_I2C_PCLK_FREQ	(50 * HZ_PER_MHZ)
+
+/* The default bus frequency, which is an empirical value */
+#define LS2X_I2C_FREQ_STD	(33 * HZ_PER_KHZ)
+
+struct ls2x_i2c_priv {
+	struct i2c_adapter	adapter;
+	void __iomem		*base;
+	struct i2c_timings	i2c_t;
+	struct completion	cmd_complete;
+};
+
+/*
+ * Interrupt service routine.
+ * This gets called whenever an I2C interrupt occurs.
+ */
+static irqreturn_t ls2x_i2c_isr(int this_irq, void *dev_id)
+{
+	struct ls2x_i2c_priv *priv = dev_id;
+
+	if (!(readb(priv->base + I2C_LS2X_SR) & LS2X_SR_IF))
+		return IRQ_NONE;
+
+	writeb(LS2X_CR_IACK, priv->base + I2C_LS2X_CR);
+	complete(&priv->cmd_complete);
+	return IRQ_HANDLED;
+}
+
+/*
+ * The LS2X I2C controller supports standard mode and fast mode,
+ * so the maximum bus frequency is '400kHz'.
+ * The bus frequency is set to the empirical value of '33KHz' by default,
+ * but it can also be taken from ACPI or FDT for compatibility with more
+ * devices.
+ */
+static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
+{
+	struct i2c_timings *t = &priv->i2c_t;
+	struct device *dev = priv->adapter.dev.parent;
+	u32 acpi_speed = i2c_acpi_find_bus_speed(dev);
+
+	i2c_parse_fw_timings(dev, t, false);
+
+	if (acpi_speed || t->bus_freq_hz)
+		t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
+	else
+		t->bus_freq_hz = LS2X_I2C_FREQ_STD;
+
+	/* Calculate and set LS2X I2C frequency */
+	writew(LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1,
+	       priv->base + I2C_LS2X_PRER);
+}
+
+static void ls2x_i2c_init(struct ls2x_i2c_priv *priv)
+{
+	/* Enable operations about frequency divider register */
+	writeb(readb(priv->base + I2C_LS2X_CR) | LS2X_CR_IACK,
+	       priv->base + I2C_LS2X_CR);
+	writeb(readb(priv->base + I2C_LS2X_CTR) & ~LS2X_CTR_EN,
+	       priv->base + I2C_LS2X_CTR);
+
+	ls2x_i2c_adjust_bus_speed(priv);
+
+	/* Set the normal I2C operating mode and enable interrupts */
+	writeb(readb(priv->base + I2C_LS2X_CTR) | CTR_READY_MASK,
+	       priv->base + I2C_LS2X_CTR);
+}
+
+static int ls2x_i2c_xfer_byte(struct i2c_adapter *adap, u8 txdata, u8 *rxdatap)
+{
+	u8 rxdata;
+	unsigned long time_left;
+	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	writeb(txdata, priv->base + I2C_LS2X_CR);
+
+	time_left = wait_for_completion_timeout(&priv->cmd_complete,
+						adap->timeout);
+	if (!time_left)
+		return -ETIMEDOUT;
+
+	rxdata = readb(priv->base + I2C_LS2X_SR);
+	if (rxdatap)
+		*rxdatap = rxdata;
+
+	return 0;
+}
+
+static int ls2x_i2c_send_byte(struct i2c_adapter *adap, u8 txdata)
+{
+	int ret;
+	u8 rxdata;
+
+	ret = ls2x_i2c_xfer_byte(adap, txdata, &rxdata);
+	if (ret)
+		return ret;
+
+	if (rxdata & LS2X_SR_AL)
+		return -EAGAIN;
+
+	if (rxdata & LS2X_SR_NOACK)
+		return -ENXIO;
+
+	return 0;
+}
+
+static int ls2x_i2c_stop(struct i2c_adapter *adap)
+{
+	int ret = ls2x_i2c_send_byte(adap, LS2X_CR_STOP);
+
+	return (ret == -ENXIO) ? 0 : ret;
+}
+
+static int ls2x_i2c_start(struct i2c_adapter *adap, struct i2c_msg *msgs)
+{
+	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	reinit_completion(&priv->cmd_complete);
+
+	writeb(i2c_8bit_addr_from_msg(msgs), priv->base + I2C_LS2X_TXR);
+	return ls2x_i2c_send_byte(adap, LS2X_CR_START | LS2X_CR_WRITE);
+}
+
+static int ls2x_i2c_rx(struct i2c_adapter *adap, u8 *buf, u16 len)
+{
+	unsigned long time_left;
+	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	while (len--) {
+		writeb(LS2X_CR_READ | (len ? 0 : LS2X_CR_ACK),
+		       priv->base + I2C_LS2X_CR);
+
+		time_left = wait_for_completion_timeout(&priv->cmd_complete,
+							adap->timeout);
+		if (!time_left)
+			return -ETIMEDOUT;
+
+		*buf++ = readb(priv->base + I2C_LS2X_RXR);
+	}
+
+	return 0;
+}
+
+static int ls2x_i2c_tx(struct i2c_adapter *adap, u8 *buf, u16 len)
+{
+	int ret;
+	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	while (len--) {
+		writeb(*buf++, priv->base + I2C_LS2X_TXR);
+
+		ret = ls2x_i2c_send_byte(adap, LS2X_CR_WRITE);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ls2x_i2c_xfer_one(struct i2c_adapter *adap,
+			     struct i2c_msg *msg, bool stop)
+{
+	int ret;
+	bool is_read = msg->flags & I2C_M_RD;
+	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	/* Contains steps to send start condition and address */
+	ret = ls2x_i2c_start(adap, msg);
+	if (!ret) {
+		if (is_read)
+			ret = ls2x_i2c_rx(adap, msg->buf, msg->len);
+		else
+			ret = ls2x_i2c_tx(adap, msg->buf, msg->len);
+
+		if (!ret && stop)
+			ret = ls2x_i2c_stop(adap);
+	}
+
+	if (ret == -ENXIO)
+		ls2x_i2c_stop(adap);
+	else if (ret < 0)
+		ls2x_i2c_init(priv);
+
+	return ret;
+}
+
+static int ls2x_i2c_master_xfer(struct i2c_adapter *adap,
+				struct i2c_msg *msgs, int num)
+{
+	int ret;
+	struct i2c_msg *msg, *emsg = msgs + num;
+
+	for (msg = msgs; msg < emsg; msg++) {
+		ret = ls2x_i2c_xfer_one(adap, msg, msg == (emsg - 1));
+		if (ret)
+			return ret;
+	}
+
+	return num;
+}
+
+static unsigned int ls2x_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm ls2x_i2c_algo = {
+	.master_xfer	= ls2x_i2c_master_xfer,
+	.functionality	= ls2x_i2c_func,
+};
+
+static int ls2x_i2c_probe(struct platform_device *pdev)
+{
+	int r, irq;
+	struct i2c_adapter *adap;
+	struct ls2x_i2c_priv *priv;
+	struct device *dev = &pdev->dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Map hardware registers */
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	/* Add the i2c adapter */
+	adap = &priv->adapter;
+	adap->nr = pdev->id;
+	adap->owner = THIS_MODULE;
+	adap->retries = 5;
+	adap->algo = &ls2x_i2c_algo;
+	adap->dev.parent = dev;
+	device_set_node(&adap->dev, dev_fwnode(dev));
+	i2c_set_adapdata(adap, priv);
+	strscpy(adap->name, pdev->name, sizeof(adap->name));
+	init_completion(&priv->cmd_complete);
+	platform_set_drvdata(pdev, priv);
+
+	ls2x_i2c_init(priv);
+
+	r = devm_request_irq(dev, irq, ls2x_i2c_isr, IRQF_SHARED, "ls2x-i2c",
+			     priv);
+	if (r < 0)
+		return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);
+
+	return devm_i2c_add_adapter(dev, adap);
+}
+
+static int ls2x_i2c_suspend(struct device *dev)
+{
+	struct ls2x_i2c_priv *priv = dev_get_drvdata(dev);
+
+	/* Disable I2C interrupt */
+	writeb(readb(priv->base + I2C_LS2X_CTR) & ~LS2X_CTR_IEN,
+	       priv->base + I2C_LS2X_CTR);
+
+	return 0;
+}
+
+static int ls2x_i2c_resume(struct device *dev)
+{
+	ls2x_i2c_init(dev_get_drvdata(dev));
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ls2x_i2c_pm_ops,
+				 ls2x_i2c_suspend, ls2x_i2c_resume, NULL);
+
+static const struct of_device_id ls2x_i2c_id_table[] = {
+	{ .compatible = "loongson,ls2k-i2c" },
+	{ .compatible = "loongson,ls7a-i2c" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ls2x_i2c_id_table);
+
+static const struct acpi_device_id ls2x_i2c_acpi_match[] = {
+	{ "LOON0004" }, /* Loongson LS7A */
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ls2x_i2c_acpi_match);
+
+static struct platform_driver ls2x_i2c_driver = {
+	.probe		= ls2x_i2c_probe,
+	.driver		= {
+		.name	= "ls2x-i2c",
+		.pm	= pm_sleep_ptr(&ls2x_i2c_pm_ops),
+		.of_match_table = ls2x_i2c_id_table,
+		.acpi_match_table = ls2x_i2c_acpi_match,
+	},
+};
+
+/* The DC subsystem depends on it, we should initialize it earlier */
+static int __init ls2x_i2c_init_driver(void)
+{
+	return platform_driver_register(&ls2x_i2c_driver);
+}
+subsys_initcall(ls2x_i2c_init_driver);
+
+static void __exit ls2x_i2c_exit_driver(void)
+{
+	platform_driver_unregister(&ls2x_i2c_driver);
+}
+module_exit(ls2x_i2c_exit_driver);
+
+MODULE_DESCRIPTION("Loongson LS2X I2C Bus driver");
+MODULE_AUTHOR("Loongson Technology Corporation Limited");
+MODULE_LICENSE("GPL");
-- 
2.31.1

