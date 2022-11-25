Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5706385B7
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Nov 2022 09:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiKYI6C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Nov 2022 03:58:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiKYI6A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Nov 2022 03:58:00 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5D69E1CB13;
        Fri, 25 Nov 2022 00:57:55 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8AxuPGRg4BjzOIAAA--.2311S3;
        Fri, 25 Nov 2022 16:57:53 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_eGQg4BjEhQaAA--.1503S2;
        Fri, 25 Nov 2022 16:57:53 +0800 (CST)
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
Subject: [PATCH V3 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
Date:   Fri, 25 Nov 2022 16:55:20 +0800
Message-Id: <822356908305580d601e5b3e424371ed7f220b85.1669359515.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669359515.git.zhoubinbin@loongson.cn>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_eGQg4BjEhQaAA--.1503S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvAXoW3CryfKF18ArWxuF17AF4rGrg_yoW8JrW3Co
        WfWrsIqr48JryUC3ykCr1jqFW3Z3yv9wn8Kw1fWr97ZFyjqrn8tF929w15X3WIgrW5KrZ5
        Arn7tw4fXF4fA347n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
        J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
        UUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
        0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
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
 drivers/i2c/busses/i2c-ls2x.c | 415 ++++++++++++++++++++++++++++++++++
 3 files changed, 427 insertions(+)
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
index 000000000000..362dfc3f9103
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ls2x.c
@@ -0,0 +1,414 @@
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
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
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
+#define LS2X_CR_START		BIT(7)
+#define LS2X_CR_STOP		BIT(6)
+#define LS2X_CR_READ		BIT(5)
+#define LS2X_CR_WRITE		BIT(4)
+#define LS2X_CR_ACK		BIT(3)
+#define LS2X_CR_IACK		BIT(0)
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
+/* LS2X I2C clock frequency 50M */
+#define HZ_PER_MHZ		(50 * 1000000)
+
+struct ls2x_i2c_dev {
+	struct device		*dev;
+	void __iomem		*base;
+	int			irq;
+	u32			bus_clk_rate;
+	struct completion	cmd_complete;
+	struct i2c_adapter	adapter;
+	unsigned int		suspended:1;
+};
+
+static int ls2x_i2c_xfer_byte(struct i2c_adapter *adap, u8 txdata,
+				  u8 *rxdatap)
+{
+	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
+	unsigned long time_left;
+	u8 rxdata;
+
+	writeb(txdata, dev->base + I2C_LS2X_CR);
+
+	time_left = wait_for_completion_timeout(&dev->cmd_complete,
+						adap->timeout);
+	if (unlikely(!time_left)) {
+		dev_err(&adap->dev, "transaction timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	rxdata = readb(dev->base + I2C_LS2X_SR);
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
+	if (unlikely(rxdata & LS2X_SR_NOACK))
+		return -ENXIO;
+
+	return 0;
+}
+
+static int ls2x_i2c_stop(struct i2c_adapter *adap)
+{
+	return ls2x_i2c_send_byte(adap, LS2X_CR_STOP);
+}
+
+static int ls2x_i2c_start(struct i2c_adapter *adap, struct i2c_msg *msgs)
+{
+	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
+	unsigned char addr = i2c_8bit_addr_from_msg(msgs);
+
+	reinit_completion(&dev->cmd_complete);
+
+	addr |= (msgs->flags & I2C_M_RD) ? 1 : 0;
+	writeb(addr, dev->base + I2C_LS2X_TXR);
+
+	return ls2x_i2c_send_byte(adap, (LS2X_CR_START | LS2X_CR_WRITE));
+}
+
+static int ls2x_i2c_rx(struct i2c_adapter *adap, u8 *buf, u16 len)
+{
+	unsigned long time_left;
+	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
+	int cmd = LS2X_CR_READ;
+
+	while (len--) {
+		if (len == 0)
+			cmd |= LS2X_CR_ACK;
+
+		writeb(cmd, dev->base + I2C_LS2X_CR);
+		time_left = wait_for_completion_timeout(&dev->cmd_complete,
+							adap->timeout);
+		if (unlikely(!time_left)) {
+			dev_err(dev->dev, "transaction timeout\n");
+			return -ETIMEDOUT;
+		}
+
+		*buf++ = readb(dev->base + I2C_LS2X_RXR);
+	}
+
+	return 0;
+}
+
+static int ls2x_i2c_tx(struct i2c_adapter *adap, u8 *buf, u16 len)
+{
+	int ret;
+	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	while (len--) {
+		writeb(*buf++, dev->base + I2C_LS2X_TXR);
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
+	int ret, ret2;
+	bool is_read = msg->flags & I2C_M_RD;
+
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
+		ret2 = ls2x_i2c_stop(adap);
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
+		/* Emit STOP if it is the last message or I2C_M_STOP is set. */
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
+	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	for (retry = 0; retry < adap->retries; retry++) {
+
+		ret = ls2x_i2c_doxfer(adap, msgs, num);
+		if (ret != -EAGAIN)
+			return ret;
+
+		dev_dbg(dev->dev, "Retrying transmission (%d)\n", retry);
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
+static irqreturn_t ls2x_i2c_isr(int this_irq, void *dev_id)
+{
+	unsigned char iflag;
+	struct ls2x_i2c_dev *dev = dev_id;
+
+	iflag = readb(dev->base + I2C_LS2X_SR);
+
+	if (iflag & LS2X_SR_IF) {
+		writeb(LS2X_CR_IACK, dev->base + I2C_LS2X_CR);
+		complete(&dev->cmd_complete);
+	} else
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static void ls2x_i2c_reginit(struct ls2x_i2c_dev *dev)
+{
+	u8 data;
+	/* default value of I2C divider latch register */
+	u16 val = 0x12c;
+
+	/* Enable operations about frequency divider register */
+	data = readb(dev->base + I2C_LS2X_CTR);
+	writeb(data & ~0x80, dev->base + I2C_LS2X_CTR);
+
+	if (dev->bus_clk_rate)
+		val = HZ_PER_MHZ / (5 * dev->bus_clk_rate) - 1;
+
+	/* Set LS2x I2C frequency */
+	writeb(val, dev->base + I2C_LS2X_PRER_LO);
+	writeb((val & 0xff00) >> 8, dev->base + I2C_LS2X_PRER_HI);
+
+	/* Set to normal I2C operating mode and enable interrupts */
+	data = readb(dev->base + I2C_LS2X_CTR);
+	writeb(data | 0xe0, dev->base + I2C_LS2X_CTR);
+}
+
+static int ls2x_i2c_probe(struct platform_device *pdev)
+{
+	int r;
+	struct ls2x_i2c_dev *dev;
+	struct i2c_adapter *adap;
+
+	dev = devm_kzalloc(&pdev->dev,
+			sizeof(struct ls2x_i2c_dev), GFP_KERNEL);
+	if (unlikely(!dev))
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, dev);
+	init_completion(&dev->cmd_complete);
+	dev->dev = &pdev->dev;
+
+	/* Map hardware registers */
+	dev->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->base))
+		return PTR_ERR(dev->base);
+
+	dev->irq = platform_get_irq(pdev, 0);
+	if (unlikely(dev->irq <= 0))
+		return -ENODEV;
+
+	r = devm_request_irq(&pdev->dev, dev->irq, ls2x_i2c_isr,
+			      IRQF_SHARED, "ls2x-i2c", dev);
+	if (unlikely(r)) {
+		dev_err(dev->dev, "failure requesting irq %i\n", dev->irq);
+		return r;
+	}
+
+	/*
+	 * The I2C controller has a fixed I2C bus frequency by default, but to
+	 * be compatible with more client devices, we can obtain the set I2C
+	 * bus frequency from ACPI or FDT.
+	 */
+	dev->bus_clk_rate = i2c_acpi_find_bus_speed(&pdev->dev);
+	if (!dev->bus_clk_rate)
+		device_property_read_u32(&pdev->dev, "clock-frequency",
+					&dev->bus_clk_rate);
+
+	ls2x_i2c_reginit(dev);
+
+	/* Add the i2c adapter */
+	adap = &dev->adapter;
+	i2c_set_adapdata(adap, dev);
+	adap->nr = pdev->id;
+	strscpy(adap->name, pdev->name, sizeof(adap->name));
+	adap->owner = THIS_MODULE;
+	adap->class = I2C_CLASS_HWMON;
+	adap->retries = LS2X_I2C_MAX_RETRIES;
+	adap->algo = &ls2x_i2c_algo;
+	adap->dev.parent = &pdev->dev;
+	adap->dev.of_node = pdev->dev.of_node;
+	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+
+	/* i2c device drivers may be active on return from add_adapter() */
+	r = i2c_add_adapter(adap);
+	if (r) {
+		dev_err(dev->dev, "failure adding adapter\n");
+		return r;
+	}
+
+	return 0;
+}
+
+static int ls2x_i2c_remove(struct platform_device *pdev)
+{
+	struct ls2x_i2c_dev *dev = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&dev->adapter);
+	return 0;
+}
+
+static int __maybe_unused ls2x_i2c_suspend_noirq(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct ls2x_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+
+	i2c_dev->suspended = 1;
+
+	return 0;
+}
+
+static int __maybe_unused ls2x_i2c_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct ls2x_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+
+	i2c_dev->suspended = 0;
+	ls2x_i2c_reginit(i2c_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops ls2x_i2c_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(ls2x_i2c_suspend_noirq, ls2x_i2c_resume)
+};
+
+static const struct of_device_id ls2x_i2c_id_table[] = {
+	{ .compatible = "loongson,ls2k-i2c" },
+	{ .compatible = "loongson,ls7a-i2c" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ls2x_i2c_id_table);
+
+static const struct acpi_device_id ls2x_i2c_acpi_match[] = {
+	{ "LOON0004", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ls2x_i2c_acpi_match);
+
+static struct platform_driver ls2x_i2c_driver = {
+	.probe		= ls2x_i2c_probe,
+	.remove		= ls2x_i2c_remove,
+	.driver		= {
+		.name	= "ls2x-i2c",
+		.owner	= THIS_MODULE,
+		.pm	= &ls2x_i2c_dev_pm_ops,
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

