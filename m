Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E78263CF04
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Nov 2022 06:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233798AbiK3F7R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Nov 2022 00:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbiK3F7G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Nov 2022 00:59:06 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1349F65D3;
        Tue, 29 Nov 2022 21:59:02 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8BxXesl8YZjKEgCAA--.5377S3;
        Wed, 30 Nov 2022 13:59:01 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxd1cj8YZj1kwiAA--.1548S2;
        Wed, 30 Nov 2022 13:59:00 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: [PATCH V4 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
Date:   Wed, 30 Nov 2022 13:56:20 +0800
Message-Id: <f6cc2dbe5cd190031ab4f772d1cf250934288546.1669777792.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669777792.git.zhoubinbin@loongson.cn>
References: <cover.1669777792.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxd1cj8YZj1kwiAA--.1548S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvAXoW3CryfKrWfZw4kGw45Jr4fKrg_yoW8JrWrAo
        WxXFsxXr48J34UC3y0kr1qqFW7Zayv93sxKw1fZr97ZFyjyF15tF92kw15G3WIgr45KrZ5
        Zrn3ta1fXF4fA347n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
        J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
        UUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
        0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
        JwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4
        CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0E
        x4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x
        0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCF
        I7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcI
        k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j
        6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVWrXDUUUU
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
 drivers/i2c/busses/i2c-ls2x.c | 402 ++++++++++++++++++++++++++++++++++
 3 files changed, 414 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ls2x.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e50f9603d189..0e342cd5b079 100644
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
+	  This driver can also be built as a module.  If so, the module
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
index 000000000000..b532e672dba5
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ls2x.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Loongson-2K/Loongson LS7A I2C master mode driver
+ *
+ * Copyright (C) 2013 Loongson Technology Corporation Limited.
+ * Copyright (C) 2014-2017 Lemote, Inc.
+ * Copyright (C) 2018-2022 Loongson Technology Corporation Limited.
+ *
+ * Originally written by liushaozong
+ *
+ * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
+ */
+
+#include <linux/bits.h>
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/units.h>
+
+/* I2C Registers */
+#define I2C_LS2X_PRER_LO	0x0 /* Freq Division Low Byte Register */
+#define I2C_LS2X_PRER_HI	0x1 /* Freq Division High Byte Register */
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
+#define LS2X_SR_NOACK		BIT(7)
+#define LS2X_SR_BUSY		BIT(6)
+#define LS2X_SR_AL		BIT(5)
+#define LS2X_SR_TIP		BIT(1)
+#define LS2X_SR_IF		BIT(0)
+
+#define LS2X_I2C_MAX_RETRIES	5
+
+struct ls2x_i2c_priv {
+	struct i2c_adapter	adapter;
+	struct device		*dev;
+	void __iomem		*base;
+	struct i2c_timings	i2c_t;
+	struct completion	cmd_complete;
+	unsigned int		suspended:1;
+};
+
+static int ls2x_i2c_xfer_byte(struct i2c_adapter *adap, u8 txdata,
+				  u8 *rxdatap)
+{
+	u8 rxdata;
+	unsigned long time_left;
+	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	writeb(txdata, priv->base + I2C_LS2X_CR);
+
+	time_left = wait_for_completion_timeout(&priv->cmd_complete,
+						adap->timeout);
+	if (unlikely(!time_left)) {
+		dev_err(&adap->dev, "transaction timeout\n");
+		return -ETIMEDOUT;
+	}
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
+	return ls2x_i2c_send_byte(adap, (LS2X_CR_START | LS2X_CR_WRITE));
+}
+
+static int ls2x_i2c_rx(struct i2c_adapter *adap, u8 *buf, u16 len)
+{
+	unsigned long time_left;
+	int cmd = LS2X_CR_READ;
+	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	while (len--) {
+		writeb(cmd | (len ? 0 : LS2X_CR_ACK), priv->base + I2C_LS2X_CR);
+
+		time_left = wait_for_completion_timeout(&priv->cmd_complete,
+							adap->timeout);
+		if (unlikely(!time_left)) {
+			dev_err(priv->dev, "transaction timeout\n");
+			return -ETIMEDOUT;
+		}
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
+			struct i2c_msg *msg, bool stop)
+{
+	int ret;
+	bool is_read = msg->flags & I2C_M_RD;
+
+	/* Contains steps to send start condition and address */
+	ret = ls2x_i2c_start(adap, msg);
+	if (ret)
+		return ret;
+
+	if (is_read)
+		ret = ls2x_i2c_rx(adap, msg->buf, msg->len);
+	else
+		ret = ls2x_i2c_tx(adap, msg->buf, msg->len);
+
+	/* could not acquire bus. bail out without STOP */
+	if (ret == -EAGAIN)
+		return ret;
+
+	if (stop)
+		ret = ls2x_i2c_stop(adap);
+
+	return ret;
+}
+
+static int ls2x_i2c_doxfer(struct i2c_adapter *adap,
+			struct i2c_msg *msgs, int num)
+{
+	int ret;
+	struct i2c_msg *msg, *emsg = msgs + num;
+
+	for (msg = msgs; msg < emsg; msg++) {
+		/* Emit STOP if it is the last message or I2C_M_STOP is set */
+		bool stop = (msg + 1 == emsg) || (msg->flags & I2C_M_STOP);
+
+		ret = ls2x_i2c_xfer_one(adap, msg, stop);
+		if (ret)
+			return ret;
+	}
+
+	return num;
+}
+
+static int ls2x_i2c_xfer(struct i2c_adapter *adap,
+			struct i2c_msg *msgs, int num)
+{
+	int ret, retry;
+	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	for (retry = 0; retry < adap->retries; retry++) {
+		ret = ls2x_i2c_doxfer(adap, msgs, num);
+		if (ret != -EAGAIN)
+			return ret;
+
+		dev_dbg(priv->dev, "Retrying transmission (%d)\n", retry);
+		udelay(100);
+	}
+
+	return -EREMOTEIO;
+}
+
+static unsigned int ls2x_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm ls2x_i2c_algo = {
+	.master_xfer	= ls2x_i2c_xfer,
+	.functionality	= ls2x_i2c_func,
+};
+
+/*
+ * Interrupt service routine.
+ * This gets called whenever an I2C interrupt occurs.
+ */
+static irqreturn_t ls2x_i2c_irq_handler(int this_irq, void *dev_id)
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
+ * The I2C controller has a fixed I2C bus frequency by default, but to
+ * be compatible with more client devices, we can obtain the set I2C
+ * bus frequency from ACPI or FDT.
+ */
+static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
+{
+	u16 val = 0x12c; /* Default value of I2C divider latch register */
+	struct i2c_timings *t = &priv->i2c_t;
+	u32 acpi_speed = i2c_acpi_find_bus_speed(priv->dev);
+
+	i2c_parse_fw_timings(priv->dev, t, false);
+
+	if (acpi_speed || t->bus_freq_hz)
+		val = 10 * HZ_PER_MHZ / max(t->bus_freq_hz, acpi_speed) - 1;
+
+	/* Set LS2X I2C frequency */
+	writel(val, priv->base + I2C_LS2X_PRER_LO);
+}
+
+static void ls2x_i2c_reginit(struct ls2x_i2c_priv *priv)
+{
+	u8 data;
+
+	/* Enable operations about frequency divider register */
+	data = readb(priv->base + I2C_LS2X_CTR);
+	writeb(data & ~0x80, priv->base + I2C_LS2X_CTR);
+
+	ls2x_i2c_adjust_bus_speed(priv);
+
+	/* Set to normal I2C operating mode and enable interrupts */
+	data = readb(priv->base + I2C_LS2X_CTR);
+	writeb(data | 0xe0, priv->base + I2C_LS2X_CTR);
+}
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
+	platform_set_drvdata(pdev, priv);
+	init_completion(&priv->cmd_complete);
+	priv->dev = dev;
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
+	r = devm_request_irq(dev, irq, ls2x_i2c_irq_handler,
+				IRQF_SHARED, "ls2x-i2c", priv);
+	if (r < 0)
+		return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);
+
+	ls2x_i2c_reginit(priv);
+
+	/* Add the i2c adapter */
+	adap = &priv->adapter;
+	i2c_set_adapdata(adap, priv);
+	adap->nr = pdev->id;
+	adap->owner = THIS_MODULE;
+	adap->class = I2C_CLASS_HWMON;
+	adap->retries = LS2X_I2C_MAX_RETRIES;
+	adap->algo = &ls2x_i2c_algo;
+	adap->dev.parent = dev;
+	adap->dev.of_node = pdev->dev.of_node;
+	device_set_node(&adap->dev, dev_fwnode(dev));
+	strscpy(adap->name, pdev->name, sizeof(adap->name));
+
+	/* i2c device drivers may be active on return from add_adapter() */
+	r = i2c_add_adapter(adap);
+	if (r)
+		return dev_err_probe(dev, r, "Failure adding adapter\n");
+
+	return 0;
+}
+
+static int ls2x_i2c_remove(struct platform_device *pdev)
+{
+	struct ls2x_i2c_priv *priv = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&priv->adapter);
+	return 0;
+}
+
+static int ls2x_i2c_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct ls2x_i2c_priv *priv = platform_get_drvdata(pdev);
+
+	priv->suspended = 1;
+
+	return 0;
+}
+
+static int ls2x_i2c_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct ls2x_i2c_priv *priv = platform_get_drvdata(pdev);
+
+	priv->suspended = 0;
+	ls2x_i2c_reginit(priv);
+
+	return 0;
+}
+
+static const struct dev_pm_ops ls2x_i2c_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(ls2x_i2c_suspend, ls2x_i2c_resume)
+};
+
+static const struct of_device_id ls2x_i2c_id_table[] = {
+	{ .compatible = "loongson,ls2k-i2c" },
+	{ .compatible = "loongson,ls7a-i2c" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ls2x_i2c_id_table);
+
+static const struct acpi_device_id ls2x_i2c_acpi_match[] = {
+	{ "LOON0004" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ls2x_i2c_acpi_match);
+
+static struct platform_driver ls2x_i2c_driver = {
+	.probe		= ls2x_i2c_probe,
+	.remove		= ls2x_i2c_remove,
+	.driver		= {
+		.name	= "ls2x-i2c",
+		.pm	= pm_sleep_ptr(&ls2x_i2c_pm_ops),
+		.of_match_table = ls2x_i2c_id_table,
+		.acpi_match_table = ls2x_i2c_acpi_match,
+	},
+};
+
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
+MODULE_ALIAS("platform:ls2x-i2c");
-- 
2.31.1

