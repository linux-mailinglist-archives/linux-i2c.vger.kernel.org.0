Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3763B148A2
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 12:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfEFK6D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 06:58:03 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:29080 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbfEFK6D (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 06:58:03 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id 437564E220;
        Mon,  6 May 2019 12:57:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id PYT77TyZ6PcB; Mon,  6 May 2019 12:57:47 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Steven Liu <steven_liu@mediatek.com>,
        Jan Breuer <jan.breuer@jaybee.cz>,
        John Crispin <john@phrozen.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver
Date:   Mon,  6 May 2019 12:57:46 +0200
Message-Id: <20190506105746.16397-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds a driver for the I2C controller found on the MediaTek
MT7621/7628/7688 SoC's. The base version of this driver was done by
Steven Liu (according to the copyright and MODULE_AUTHOR lines). It
can be found in the OpenWRT repositories (v4.14 at the time I looked).

The base driver had many issues, which are disccussed here:

https://en.forum.labs.mediatek.com/t/openwrt-15-05-loads-non-working-i2c-kernel-module-for-mt7688/1286/3

From this link an enhanced driver version (complete rewrite, mayor
changes: support clock stretching, repeated start, ACK handling and
unlimited message length) from Jan Breuer can be found here:

https://gist.github.com/j123b567/9b555b635c2b4069d716b24198546954

This patch now adds this enhanced I2C driver to mainline.

Changes by Stefan Roese for upstreaming:
- Add devicetree bindings
- checkpatch clean
- Use module_platform_driver()
- Minor cosmetic enhancements

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Steven Liu <steven_liu@mediatek.com>
Cc: Jan Breuer <jan.breuer@jaybee.cz>
Cc: John Crispin <john@phrozen.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2:
- Configure I2C controller to open-drain instead of push-pull, as
  noticed and suggested by Jan (misleading bit description)

 .../devicetree/bindings/i2c/i2c-mt7621.txt    |  25 ++
 drivers/i2c/busses/Kconfig                    |   8 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-mt7621.c               | 385 ++++++++++++++++++
 4 files changed, 419 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
 create mode 100644 drivers/i2c/busses/i2c-mt7621.c

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt b/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
new file mode 100644
index 000000000000..bc36f0eb94cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
@@ -0,0 +1,25 @@
+MediaTek MT7621/MT7628 I2C master controller
+
+Required properties:
+
+- compatible: Should be one of the following:
+  - "mediatek,mt7621-i2c": for MT7621/MT7628/MT7688 platforms
+- #address-cells: should be 1.
+- #size-cells: should be 0.
+- reg: Address and length of the register set for the device
+- resets: phandle to the reset controller asserting this device in
+          reset
+  See ../reset/reset.txt for details.
+
+Optional properties :
+
+Example:
+
+i2c: i2c@900 {
+	compatible = "mediatek,mt7621-i2c";
+	reg = <0x900 0x100>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	resets = <&rstctrl 16>;
+	reset-names = "i2c";
+};
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index f8979abb9a19..fa6c85d4b378 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -886,6 +886,14 @@ config I2C_RK3X
 	  This driver can also be built as a module. If so, the module will
 	  be called i2c-rk3x.
 
+config I2C_MT7621
+	tristate "MT7621/MT7628 I2C Controller"
+	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || COMPILE_TEST
+	select OF_I2C
+	help
+	  Say Y here to include support for I2C controller in the
+	  MediaTek MT7621/MT7628 SoCs.
+
 config HAVE_S3C2410_I2C
 	bool
 	help
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 5f0cb6915969..7d3fc2456ce8 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
 obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
 obj-$(CONFIG_I2C_MPC)		+= i2c-mpc.o
 obj-$(CONFIG_I2C_MT65XX)	+= i2c-mt65xx.o
+obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
 obj-$(CONFIG_I2C_MV64XXX)	+= i2c-mv64xxx.o
 obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
 obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
new file mode 100644
index 000000000000..fcacbfbc8c47
--- /dev/null
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * drivers/i2c/busses/i2c-mt7621.c
+ *
+ * Copyright (C) 2013 Steven Liu <steven_liu@mediatek.com>
+ * Copyright (C) 2016 Michael Lee <igvtee@gmail.com>
+ * Copyright (C) 2018 Jan Breuer <jan.breuer@jaybee.cz>
+ *
+ * Improve driver for i2cdetect from i2c-tools to detect i2c devices on the bus.
+ * (C) 2014 Sittisak <sittisaks@hotmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/reset.h>
+
+#define REG_SM0CFG2_REG		0x28
+#define REG_SM0CTL0_REG		0x40
+#define REG_SM0CTL1_REG		0x44
+#define REG_SM0D0_REG		0x50
+#define REG_SM0D1_REG		0x54
+#define REG_PINTEN_REG		0x5C
+#define REG_PINTST_REG		0x60
+#define REG_PINTCL_REG		0x64
+
+/* REG_SM0CFG2_REG */
+#define SM0CFG2_IS_AUTOMODE	BIT(0)
+
+/* REG_SM0CTL0_REG */
+#define SM0CTL0_ODRAIN		BIT(31)
+#define SM0CTL0_CLK_DIV_MASK	(0x7FF << 16)
+#define SM0CTL0_CLK_DIV_MAX	0x7ff
+#define SM0CTL0_CS_STATUS       BIT(4)
+#define SM0CTL0_SCL_STATE       BIT(3)
+#define SM0CTL0_SDA_STATE       BIT(2)
+#define SM0CTL0_EN              BIT(1)
+#define SM0CTL0_SCL_STRETCH     BIT(0)
+
+/* REG_SM0CTL1_REG */
+#define SM0CTL1_ACK_MASK	(0xFF << 16)
+#define SM0CTL1_PGLEN_MASK	(0x7 << 8)
+#define SM0CTL1_PGLEN(x)	(((x - 1) << 8) & SM0CTL1_PGLEN_MASK)
+#define SM0CTL1_READ		(5 << 4)
+#define SM0CTL1_READ_LAST	(4 << 4)
+#define SM0CTL1_STOP		(3 << 4)
+#define SM0CTL1_WRITE		(2 << 4)
+#define SM0CTL1_START		(1 << 4)
+#define SM0CTL1_MODE_MASK	(0x7 << 4)
+#define SM0CTL1_TRI		BIT(0)
+
+/* timeout waiting for I2C devices to respond (clock streching) */
+#define TIMEOUT_MS              1000
+#define DELAY_INTERVAL_US       100
+
+struct mtk_i2c {
+	void __iomem *base;
+	struct device *dev;
+	struct i2c_adapter adap;
+	u32 cur_clk;
+	u32 clk_div;
+	u32 flags;
+};
+
+static void mtk_i2c_w32(struct mtk_i2c *i2c, u32 val, unsigned int reg)
+{
+	iowrite32(val, i2c->base + reg);
+}
+
+static u32 mtk_i2c_r32(struct mtk_i2c *i2c, unsigned int reg)
+{
+	return ioread32(i2c->base + reg);
+}
+
+static int poll_down_timeout(void __iomem *addr, u32 mask)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(TIMEOUT_MS);
+	int current_delay = 1;
+
+	do {
+		if (!(readl_relaxed(addr) & mask))
+			return 0;
+
+		if (current_delay > 0 && current_delay < 10)
+			udelay(current_delay);
+		else if (current_delay >= 10)
+			usleep_range(current_delay, current_delay + 50);
+
+		current_delay *= current_delay;
+		if (current_delay > DELAY_INTERVAL_US)
+			current_delay = DELAY_INTERVAL_US;
+	} while (time_before(jiffies, timeout));
+
+	return (readl_relaxed(addr) & mask) ? -EAGAIN : 0;
+}
+
+static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
+{
+	int ret;
+
+	ret = poll_down_timeout(i2c->base + REG_SM0CTL1_REG, SM0CTL1_TRI);
+	if (ret < 0)
+		dev_dbg(i2c->dev, "idle err(%d)\n", ret);
+
+	return ret;
+}
+
+static void mtk_i2c_reset(struct mtk_i2c *i2c)
+{
+	int ret;
+
+	ret = device_reset(i2c->adap.dev.parent);
+	if (ret)
+		dev_err(i2c->dev, "I2C reset failed!\n");
+
+	barrier();
+	/*
+	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
+	 * configure open-drain mode, this bit needs to be cleared.
+	 */
+	mtk_i2c_w32(i2c, ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) |
+		    SM0CTL0_EN | SM0CTL0_SCL_STRETCH, REG_SM0CTL0_REG);
+	mtk_i2c_w32(i2c, 0, REG_SM0CFG2_REG);
+}
+
+static void mtk_i2c_dump_reg(struct mtk_i2c *i2c)
+{
+	dev_dbg(i2c->dev,
+		"SM0CFG2 %08x, SM0CTL0 %08x, SM0CTL1 %08x, SM0D0 %08x, SM0D1 %08x\n",
+		mtk_i2c_r32(i2c, REG_SM0CFG2_REG),
+		mtk_i2c_r32(i2c, REG_SM0CTL0_REG),
+		mtk_i2c_r32(i2c, REG_SM0CTL1_REG),
+		mtk_i2c_r32(i2c, REG_SM0D0_REG),
+		mtk_i2c_r32(i2c, REG_SM0D1_REG));
+}
+
+static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
+{
+	u32 ack = readl_relaxed(i2c->base + REG_SM0CTL1_REG);
+	u32 ack_expected = (expected << 16) & SM0CTL1_ACK_MASK;
+
+	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
+}
+
+static int mtk_i2c_master_start(struct mtk_i2c *i2c)
+{
+	mtk_i2c_w32(i2c, SM0CTL1_START | SM0CTL1_TRI, REG_SM0CTL1_REG);
+	return mtk_i2c_wait_idle(i2c);
+}
+
+static int mtk_i2c_master_stop(struct mtk_i2c *i2c)
+{
+	mtk_i2c_w32(i2c, SM0CTL1_STOP | SM0CTL1_TRI, REG_SM0CTL1_REG);
+	return mtk_i2c_wait_idle(i2c);
+}
+
+static int mtk_i2c_master_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
+{
+	mtk_i2c_w32(i2c, cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
+		    REG_SM0CTL1_REG);
+	return mtk_i2c_wait_idle(i2c);
+}
+static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+		int num)
+{
+	struct mtk_i2c *i2c;
+	struct i2c_msg *pmsg;
+	u16 addr;
+	int i, j, ret, len, page_len;
+	u32 cmd;
+	u32 data[2];
+
+	i2c = i2c_get_adapdata(adap);
+
+	for (i = 0; i < num; i++) {
+		pmsg = &msgs[i];
+
+		dev_dbg(i2c->dev, "addr: 0x%x, len: %d, flags: 0x%x\n",
+				pmsg->addr, pmsg->len, pmsg->flags);
+
+		/* wait hardware idle */
+		ret = mtk_i2c_wait_idle(i2c);
+		if (ret)
+			goto err_timeout;
+
+		/* start sequence */
+		ret = mtk_i2c_master_start(i2c);
+		if (ret)
+			goto err_timeout;
+
+		/* write address */
+		if (pmsg->flags & I2C_M_TEN) {
+			/* 10 bits address */
+			addr = 0xf0 | ((pmsg->addr >> 7) & 0x06);
+			addr |= (pmsg->addr & 0xff) << 8;
+			if (pmsg->flags & I2C_M_RD)
+				addr |= 1;
+			mtk_i2c_w32(i2c, addr, REG_SM0D0_REG);
+			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 2);
+			if (ret)
+				goto err_timeout;
+		} else {
+			/* 7 bits address */
+			addr = pmsg->addr << 1;
+			if (pmsg->flags & I2C_M_RD)
+				addr |= 1;
+			mtk_i2c_w32(i2c, addr, REG_SM0D0_REG);
+			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 1);
+			if (ret)
+				goto err_timeout;
+		}
+
+		/* check address ACK */
+		if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
+			ret = mtk_i2c_check_ack(i2c, BIT(0));
+			if (ret)
+				goto err_ack;
+		}
+
+		/* transfer data */
+		j = 0;
+		for (len = pmsg->len; len > 0; len -= 8) {
+			page_len = (len >= 8) ? 8 : len;
+
+			if (pmsg->flags & I2C_M_RD) {
+				cmd = (len > 8) ?
+					SM0CTL1_READ : SM0CTL1_READ_LAST;
+			} else {
+				memcpy(data, &pmsg->buf[j], page_len);
+				mtk_i2c_w32(i2c, data[0], REG_SM0D0_REG);
+				mtk_i2c_w32(i2c, data[1], REG_SM0D1_REG);
+				cmd = SM0CTL1_WRITE;
+			}
+
+			ret = mtk_i2c_master_cmd(i2c, cmd, page_len);
+			if (ret)
+				goto err_timeout;
+
+			if (pmsg->flags & I2C_M_RD) {
+				data[0] = mtk_i2c_r32(i2c, REG_SM0D0_REG);
+				data[1] = mtk_i2c_r32(i2c, REG_SM0D1_REG);
+				memcpy(&pmsg->buf[j], data, page_len);
+			} else {
+				if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
+					ret = mtk_i2c_check_ack(
+						i2c, (1 << page_len) - 1);
+					if (ret)
+						goto err_ack;
+				}
+			}
+			j += 8;
+		}
+	}
+
+	ret = mtk_i2c_master_stop(i2c);
+	if (ret)
+		goto err_timeout;
+
+	/* the return value is number of executed messages */
+	ret = i;
+
+	return ret;
+
+err_ack:
+	ret = mtk_i2c_master_stop(i2c);
+	if (ret)
+		goto err_timeout;
+	return -ENXIO;
+
+err_timeout:
+	mtk_i2c_dump_reg(i2c);
+	mtk_i2c_reset(i2c);
+	return ret;
+}
+
+static u32 mtk_i2c_func(struct i2c_adapter *a)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm mtk_i2c_algo = {
+	.master_xfer	= mtk_i2c_master_xfer,
+	.functionality	= mtk_i2c_func,
+};
+
+static const struct of_device_id i2c_mtk_dt_ids[] = {
+	{ .compatible = "mediatek,mt7621-i2c" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, i2c_mtk_dt_ids);
+
+static void mtk_i2c_init(struct mtk_i2c *i2c)
+{
+	i2c->clk_div = 40000000 / i2c->cur_clk - 1;
+	if (i2c->clk_div < 99)
+		i2c->clk_div = 99;
+	if (i2c->clk_div > SM0CTL0_CLK_DIV_MAX)
+		i2c->clk_div = SM0CTL0_CLK_DIV_MAX;
+
+	mtk_i2c_reset(i2c);
+}
+
+static int mtk_i2c_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct mtk_i2c *i2c;
+	struct i2c_adapter *adap;
+	const struct of_device_id *match;
+	int ret;
+
+	match = of_match_device(i2c_mtk_dt_ids, &pdev->dev);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "no memory resource found\n");
+		return -ENODEV;
+	}
+
+	i2c = devm_kzalloc(&pdev->dev, sizeof(struct mtk_i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(i2c->base))
+		return PTR_ERR(i2c->base);
+
+	i2c->dev = &pdev->dev;
+
+	if (of_property_read_u32(pdev->dev.of_node,
+				"clock-frequency", &i2c->cur_clk))
+		i2c->cur_clk = 100000;
+
+	adap = &i2c->adap;
+	adap->owner = THIS_MODULE;
+	adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adap->algo = &mtk_i2c_algo;
+	adap->retries = 3;
+	adap->dev.parent = &pdev->dev;
+	i2c_set_adapdata(adap, i2c);
+	adap->dev.of_node = pdev->dev.of_node;
+	strlcpy(adap->name, dev_name(&pdev->dev), sizeof(adap->name));
+
+	platform_set_drvdata(pdev, i2c);
+
+	mtk_i2c_init(i2c);
+
+	ret = i2c_add_adapter(adap);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to add adapter\n");
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "clock %u kHz\n", i2c->cur_clk/1000);
+
+	return ret;
+}
+
+static int mtk_i2c_remove(struct platform_device *pdev)
+{
+	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&i2c->adap);
+
+	return 0;
+}
+
+static struct platform_driver mtk_i2c_driver = {
+	.probe		= mtk_i2c_probe,
+	.remove		= mtk_i2c_remove,
+	.driver		= {
+		.owner	= THIS_MODULE,
+		.name	= "i2c-mt7621",
+		.of_match_table = i2c_mtk_dt_ids,
+	},
+};
+
+module_platform_driver(mtk_i2c_driver);
+
+MODULE_AUTHOR("Steven Liu <steven_liu@mediatek.com>");
+MODULE_DESCRIPTION("MT7621 I2C host driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:MT7621-I2C");
-- 
2.21.0

