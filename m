Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4F35EA8AF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 16:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbiIZOkm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 10:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234900AbiIZOkE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 10:40:04 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5A88891D00;
        Mon, 26 Sep 2022 06:01:16 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.220])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx5OGUojFjdz4iAA--.62163S5;
        Mon, 26 Sep 2022 21:01:11 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
        WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V2 3/4] i2c: Add driver for Loongson-2K/LS7A I2C controller
Date:   Mon, 26 Sep 2022 21:00:06 +0800
Message-Id: <95903ff11e598c1888fd5183c4aed8f4c5460c68.1664193316.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1664193316.git.zhoubinbin@loongson.cn>
References: <cover.1664193316.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx5OGUojFjdz4iAA--.62163S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Zr48GFWDKrW8tFWxZrWfuFg_yoWkXw4DpF
        yrJa45Gr48JrnFgrWfGr15uFW3Xws3t3y8trWfG3W2vwn8J34DZas3tFyay3Z5WFykW3y7
        ZanFgFW3GFyjvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
        v7MxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
        IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
        pf9x0JU-ID7UUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This I2C module is integrated into the Loongson-2K SoC and the Loongson
LS7A bridge chip.

Initialize the i2c controller early. This is required in order to ensure
that core system devices such as the display controller(DC) attached via
I2C are available early in boot.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/i2c/busses/Kconfig    |   7 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-ls2x.c | 365 ++++++++++++++++++++++++++++++++++
 3 files changed, 373 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ls2x.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 7284206b278b..99b21935dc71 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -887,6 +887,13 @@ config I2C_OWL
 	  Say Y here if you want to use the I2C bus controller on
 	  the Actions Semiconductor Owl SoC's.
 
+config I2C_LS2X
+	tristate "Loongson LS2X I2C adapter"
+	depends on MACH_LOONGSON64 || COMPILE_TEST
+	help
+	  If you say yes to this option, support will be included for the
+	  I2C interface on the Loongson's LS2K/LS7A Platform-Bridge.
+
 config I2C_PASEMI
 	tristate "PA Semi SMBus interface"
 	depends on PPC_PASEMI && PCI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index c5cac15f075c..721841361e34 100644
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
index 000000000000..ab4c1b45d3d6
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ls2x.c
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Loongson-2K/7A I2C master mode driver
+ *
+ * Copyright (C) 2013 Loongson Technology Corporation Limited
+ * Copyright (C) 2014-2017 Lemote, Inc.
+ *
+ * Originally written by liushaozong
+ */
+
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/completion.h>
+#include <linux/platform_device.h>
+
+#define LS2X_I2C_PRER_LO_REG	0x0
+#define LS2X_I2C_PRER_HI_REG	0x1
+#define LS2X_I2C_CTR_REG	0x2
+#define LS2X_I2C_TXR_REG	0x3
+#define LS2X_I2C_RXR_REG	0x3
+#define LS2X_I2C_CR_REG		0x4
+#define LS2X_I2C_SR_REG		0x4
+
+#define LS2X_I2C_CMD_START	BIT(7)
+#define LS2X_I2C_CMD_STOP	BIT(6)
+#define LS2X_I2C_CMD_READ	BIT(5)
+#define LS2X_I2C_CMD_WRITE	BIT(4)
+#define LS2X_I2C_CMD_ACK	BIT(3)
+#define LS2X_I2C_CMD_IACK	BIT(0)
+
+#define LS2X_I2C_SR_NOACK	BIT(7)
+#define LS2X_I2C_SR_BUSY	BIT(6)
+#define LS2X_I2C_SR_AL		BIT(5)
+#define LS2X_I2C_SR_TIP		BIT(1)
+#define LS2X_I2C_SR_IF		BIT(0)
+
+#define I2C_MAX_RETRIES		5
+
+/* I2C clock frequency 50M */
+#define I2C_CLK_RATE_50M	(50 * 1000000)
+
+#define i2c_readb(addr)		readb(dev->base + addr)
+#define i2c_writeb(val, addr)	writeb(val, dev->base + addr)
+
+struct ls2x_i2c_dev {
+	unsigned int		suspended:1;
+	struct device		*dev;
+	void __iomem		*base;
+	int			irq;
+	u32			bus_clk_rate;
+	struct completion	cmd_complete;
+	struct i2c_adapter	adapter;
+};
+
+static void i2c_stop(struct ls2x_i2c_dev *dev)
+{
+again:
+	i2c_writeb(LS2X_I2C_CMD_STOP, LS2X_I2C_CR_REG);
+	wait_for_completion(&dev->cmd_complete);
+
+	i2c_readb(LS2X_I2C_SR_REG);
+
+	while (i2c_readb(LS2X_I2C_SR_REG) & LS2X_I2C_SR_BUSY)
+		goto again;
+}
+
+static int ls2x_i2c_start(struct ls2x_i2c_dev *dev,
+		     int dev_addr, int flags)
+{
+	int retry = I2C_MAX_RETRIES;
+	unsigned char addr = (dev_addr & 0x7f) << 1;
+
+	addr |= (flags & I2C_M_RD) ? 1 : 0;
+start:
+	mdelay(1);
+	i2c_writeb(addr, LS2X_I2C_TXR_REG);
+	dev_dbg(dev->dev, "%s <line%d>: i2c device address: 0x%x\n",
+			__func__, __LINE__, addr);
+
+	i2c_writeb((LS2X_I2C_CMD_START | LS2X_I2C_CMD_WRITE),
+			LS2X_I2C_CR_REG);
+	wait_for_completion(&dev->cmd_complete);
+
+	if (i2c_readb(LS2X_I2C_SR_REG) & LS2X_I2C_SR_NOACK) {
+		i2c_stop(dev);
+		while (retry--)
+			goto start;
+		dev_info(dev->dev, "There is no i2c device ack\n");
+		return 0;
+	}
+
+	return 1;
+}
+
+static void ls2x_i2c_reginit(struct ls2x_i2c_dev *dev)
+{
+	u16 val = 0x12c;
+
+	if (dev->bus_clk_rate)
+		val = I2C_CLK_RATE_50M / (5 * dev->bus_clk_rate) - 1;
+
+	i2c_writeb(0, LS2X_I2C_CTR_REG);
+	i2c_writeb(val & 0xff, LS2X_I2C_PRER_LO_REG);
+	i2c_writeb((val & 0xff00) >> 8, LS2X_I2C_PRER_HI_REG);
+	i2c_writeb(0xc0, LS2X_I2C_CTR_REG);
+}
+
+static int ls2x_i2c_read(struct ls2x_i2c_dev *dev,
+			unsigned char *buf, int count)
+{
+	int i;
+	int cmd = LS2X_I2C_CMD_READ;
+
+	for (i = 0; i < count; i++) {
+		if (i == count - 1)
+			cmd |= LS2X_I2C_CMD_ACK;
+
+		i2c_writeb(cmd, LS2X_I2C_CR_REG);
+		wait_for_completion(&dev->cmd_complete);
+
+		buf[i] = i2c_readb(LS2X_I2C_RXR_REG);
+		dev_dbg(dev->dev, "%s <line%d>: read buf[%d] <= %02x\n",
+				__func__, __LINE__, i, buf[i]);
+	}
+
+	return i;
+}
+
+static int ls2x_i2c_write(struct ls2x_i2c_dev *dev,
+			unsigned char *buf, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		i2c_writeb(buf[i], LS2X_I2C_TXR_REG);
+		dev_dbg(dev->dev, "%s <line%d>: write buf[%d] => %02x\n",
+				__func__, __LINE__, i, buf[i]);
+
+		i2c_writeb(LS2X_I2C_CMD_WRITE, LS2X_I2C_CR_REG);
+		wait_for_completion(&dev->cmd_complete);
+
+		if (i2c_readb(LS2X_I2C_SR_REG) & LS2X_I2C_SR_NOACK) {
+			dev_dbg(dev->dev, "%s <line%d>: device no ack\n",
+					__func__, __LINE__);
+			i2c_stop(dev);
+			return 0;
+		}
+	}
+
+	return i;
+}
+
+static int ls2x_i2c_doxfer(struct ls2x_i2c_dev *dev,
+			struct i2c_msg *msgs, int num)
+{
+	int i;
+	struct i2c_msg *m = msgs;
+
+	for (i = 0; i < num; i++) {
+		reinit_completion(&dev->cmd_complete);
+		if (!ls2x_i2c_start(dev, m->addr, m->flags))
+			return 0;
+
+		if (m->flags & I2C_M_RD)
+			ls2x_i2c_read(dev, m->buf, m->len);
+		else
+			ls2x_i2c_write(dev, m->buf, m->len);
+		++m;
+	}
+
+	i2c_stop(dev);
+
+	return i;
+}
+
+static int ls2x_i2c_xfer(struct i2c_adapter *adap,
+			struct i2c_msg *msgs, int num)
+{
+	int ret, retry;
+	struct ls2x_i2c_dev *dev;
+
+	dev = i2c_get_adapdata(adap);
+	for (retry = 0; retry < adap->retries; retry++) {
+		ret = ls2x_i2c_doxfer(dev, msgs, num);
+		if (ret != -EAGAIN)
+			return ret;
+
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
+	iflag = i2c_readb(LS2X_I2C_SR_REG);
+
+	if (iflag & LS2X_I2C_SR_IF) {
+		i2c_writeb(LS2X_I2C_CMD_IACK, LS2X_I2C_CR_REG);
+		complete(&dev->cmd_complete);
+	} else
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static int ls2x_i2c_probe(struct platform_device *pdev)
+{
+	int r;
+	struct ls2x_i2c_dev *dev;
+	struct i2c_adapter *adap;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(struct ls2x_i2c_dev), GFP_KERNEL);
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
+	adap->retries = I2C_MAX_RETRIES;
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
+#ifdef CONFIG_OF
+static const struct of_device_id ls2x_i2c_id_table[] = {
+	{.compatible = "loongson,ls2k-i2c"},
+	{.compatible = "loongson,ls7a-i2c"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, ls2x_i2c_id_table);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id ls2x_i2c_acpi_match[] = {
+	{"LOON0004"},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, ls2x_i2c_acpi_match);
+#endif
+
+static struct platform_driver ls2x_i2c_driver = {
+	.probe		= ls2x_i2c_probe,
+	.remove		= ls2x_i2c_remove,
+	.driver		= {
+		.name	= "ls2x-i2c",
+		.owner	= THIS_MODULE,
+		.pm	= &ls2x_i2c_dev_pm_ops,
+		.of_match_table = of_match_ptr(ls2x_i2c_id_table),
+		.acpi_match_table = ACPI_PTR(ls2x_i2c_acpi_match),
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
+MODULE_AUTHOR("Loongson Technology Corporation Limited");
+MODULE_DESCRIPTION("Loongson LS2X I2C bus adapter");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ls2x-i2c");
-- 
2.31.1

