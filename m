Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E85962D485
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 08:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239274AbiKQH7t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 02:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239082AbiKQH7s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 02:59:48 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E3361F00A;
        Wed, 16 Nov 2022 23:59:45 -0800 (PST)
Received: from loongson.cn (unknown [10.180.13.64])
        by gateway (Coremail) with SMTP id _____8AxXbbw6XVj6jYIAA--.11479S3;
        Thu, 17 Nov 2022 15:59:44 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.64])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtuPr6XVjnc4VAA--.57405S2;
        Thu, 17 Nov 2022 15:59:43 +0800 (CST)
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yinbo Zhu <zhuyinbo@loongson.cn>
Subject: [PATCH v1 1/2] i2c: loongson: add bus driver for the loongson i2c controller
Date:   Thu, 17 Nov 2022 15:59:37 +0800
Message-Id: <20221117075938.23379-1-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtuPr6XVjnc4VAA--.57405S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3ZF4DZr15ur4xKr4UXrWrZrb_yoW8AF18Ko
        WxWrn3XrW8Xr10q34Y9r45WrW8XFW5Cwn0yr4fAwnrCaySqrn8tFyDKw13Jr1xCFyYqr4r
        AF97tF4rXayft393n29KB7ZKAUJUUUUP529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
        J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
        UUB21xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFV
        AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_Gc
        Wl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAaw2AFwI0_Jw0_GFyle2I262IYc4CY
        6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
        C2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC
        6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
        Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
        1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
        Wlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj
        6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
        0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
        JbIYCTnIWIevJa73UjIFyTuYvjxUcxhLUUUUU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This bus driver supports the Loongson i2c hardware controller in the
Loongson platforms and supports to use DTS and ACPI framework to
register i2c adapter device resources.

The Loongson i2c controller supports operating frequencty is 50MHZ
and supports the maximum transmission rate is 400kbps.

Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
---
 MAINTAINERS                       |   6 +
 drivers/i2c/busses/Kconfig        |  10 +
 drivers/i2c/busses/Makefile       |   1 +
 drivers/i2c/busses/i2c-loongson.c | 569 ++++++++++++++++++++++++++++++
 4 files changed, 586 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-loongson.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 62c5499e4159..e45c678eb40e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12060,6 +12060,12 @@ F:	Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
 F:	drivers/gpio/gpio-loongson.c
 F:	include/linux/platform_data/gpio-loongson.h
 
+LOONGSON SERIES I2C DRIVER
+M:	Yinbo Zhu <zhuyinbo@loongson.cn>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-loongson.c
+
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
 M:	Sathya Prakash <sathya.prakash@broadcom.com>
 M:	Sreekanth Reddy <sreekanth.reddy@broadcom.com>
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e50f9603d189..25b22b54504a 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -751,6 +751,16 @@ config I2C_KEMPLD
 	  This driver can also be built as a module. If so, the module
 	  will be called i2c-kempld.
 
+config I2C_LOONGSON
+        tristate "Loongson I2C controller"
+        depends on LOONGARCH || COMPILE_TEST
+        help
+          If you say yes to this option, support will be included for the
+          built-in I2C interface on the Loongson series Platform.
+
+          This driver can also be built as a module. If so, the module
+          will be called i2c-loongson.
+
 config I2C_LPC2K
 	tristate "I2C bus support for NXP LPC2K/LPC178x/18xx/43xx"
 	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index e73cdb1d2b5a..28a3fd18ffaf 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_I2C_IMX_LPI2C)	+= i2c-imx-lpi2c.o
 obj-$(CONFIG_I2C_IOP3XX)	+= i2c-iop3xx.o
 obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
 obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
+obj-$(CONFIG_I2C_LOONGSON)	+= i2c-loongson.o
 obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
 obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
 obj-$(CONFIG_I2C_MICROCHIP_CORE)	+= i2c-microchip-corei2c.o
diff --git a/drivers/i2c/busses/i2c-loongson.c b/drivers/i2c/busses/i2c-loongson.c
new file mode 100644
index 000000000000..80dc15329399
--- /dev/null
+++ b/drivers/i2c/busses/i2c-loongson.c
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Author: Yinbo Zhu <zhuyinbo@loongson.cn>
+ * Copyright (C) 2022 Loongson Technology Corporation Limited
+ */
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/completion.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+
+#define LOONGSON_I2C_PRER_LO_REG	0x0
+#define LOONGSON_I2C_PRER_HI_REG	0x1
+#define LOONGSON_I2C_CTR_REG		0x2
+#define LOONGSON_I2C_TXR_REG		0x3
+#define LOONGSON_I2C_RXR_REG		0x3
+#define LOONGSON_I2C_CR_REG		0x4
+#define LOONGSON_I2C_SR_REG		0x4
+#define LOONGSON_I2C_BLTOP_REG		0x5
+#define LOONGSON_I2C_SADDR_REG		0x7
+
+#define CTR_EN				0x80
+#define CTR_IEN				0x40
+#define CTR_TXROK			0x90
+#define CTR_RXROK			0x88
+
+#define CR_START			0x81
+#define CR_STOP				0x41
+#define CR_READ				0x21
+#define CR_WRITE			0x11
+#define CR_ACK				0x8
+#define CR_IACK				0x1
+
+#define SR_NOACK			0x80
+#define SR_BUSY				0x40
+#define SR_AL				0x20
+#define SR_SLAVE_ADDRESSED		0x10
+#define SR_SLAVE_RW			0x8
+#define SR_TIP				0x2
+#define SR_IF				0x1
+
+#define i2c_readb(addr)			readb(dev->base + addr)
+#define i2c_writeb(val, addr)		writeb(val, dev->base + addr)
+
+static bool repeated_start = 1;
+module_param(repeated_start, bool, 0600);
+MODULE_PARM_DESC(repeated_start,
+		"Compatible with devices that support repeated start");
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+enum loongson_i2c_slave_state {
+	LOONGSON_I2C_SLAVE_STOP,
+	LOONGSON_I2C_SLAVE_START,
+	LOONGSON_I2C_SLAVE_READ_REQUESTED,
+	LOONGSON_I2C_SLAVE_READ_PROCESSED,
+	LOONGSON_I2C_SLAVE_WRITE_REQUESTED,
+	LOONGSON_I2C_SLAVE_WRITE_RECEIVED,
+};
+#endif
+
+struct loongson_i2c_dev {
+	spinlock_t		lock;
+	unsigned int		suspended:1;
+	struct device		*dev;
+	void __iomem		*base;
+	int			irq;
+	u32			speed_hz;
+	struct completion	cmd_complete;
+	struct resource		*ioarea;
+	struct i2c_adapter	adapter;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	struct i2c_client	*slave;
+	enum loongson_i2c_slave_state	slave_state;
+#endif
+};
+
+static int loongson_i2c_stop(struct loongson_i2c_dev *dev)
+{
+	unsigned long time_left;
+
+again:
+	i2c_writeb(CR_STOP, LOONGSON_I2C_CR_REG);
+	time_left = wait_for_completion_timeout(
+			&dev->cmd_complete, (&dev->adapter)->timeout);
+	if (!time_left)
+		return -ETIMEDOUT;
+
+	while (i2c_readb(LOONGSON_I2C_SR_REG) & SR_BUSY)
+		goto again;
+
+	return 0;
+}
+
+static int loongson_i2c_start(
+		struct loongson_i2c_dev *dev, int dev_addr, int flags)
+{
+	unsigned long time_left;
+	int retry = 5;
+	unsigned char addr = (dev_addr & 0x7f) << 1;
+
+	addr |= (flags & I2C_M_RD) ? 1 : 0;
+
+start:
+	mdelay(1);
+	i2c_writeb(addr, LOONGSON_I2C_TXR_REG);
+	i2c_writeb((CR_START | CR_WRITE), LOONGSON_I2C_CR_REG);
+	time_left = wait_for_completion_timeout(
+		&dev->cmd_complete,
+		(&dev->adapter)->timeout);
+	if (!time_left)
+		return -ETIMEDOUT;
+
+	if (i2c_readb(LOONGSON_I2C_SR_REG) & SR_NOACK) {
+		if (loongson_i2c_stop(dev) < 0)
+			return -1;
+
+		while (retry--)
+			goto start;
+		return 0;
+	}
+
+	return 1;
+}
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void loongson_i2c_slave_init(
+			struct loongson_i2c_dev *dev, u16 slave_addr)
+{
+	i2c_writeb(slave_addr & 0x7f, LOONGSON_I2C_SADDR_REG);
+
+	i2c_writeb(0xc0, LOONGSON_I2C_CTR_REG);
+}
+
+static int loongson_i2c_reg_slave(struct i2c_client *client)
+{
+	unsigned long flags;
+	struct loongson_i2c_dev *dev = i2c_get_adapdata(client->adapter);
+
+	if (dev->slave)
+		return -EINVAL;
+
+	loongson_i2c_slave_init(dev, client->addr);
+
+	dev->slave = client;
+	dev->slave_state = LOONGSON_I2C_SLAVE_STOP;
+
+	return 0;
+}
+
+static int loongson_i2c_unreg_slave(struct i2c_client *client)
+{
+	unsigned long flags;
+	struct loongson_i2c_dev *dev = i2c_get_adapdata(client->adapter);
+
+	if (!dev->slave)
+		return -EINVAL;
+
+	i2c_writeb(0xa0, LOONGSON_I2C_CTR_REG);
+
+	dev->slave = NULL;
+
+	return 0;
+}
+#endif
+
+static void loongson_i2c_reginit(struct loongson_i2c_dev *dev)
+{
+	u16 prer_val;
+	u32 pclk;
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (dev->slave) {
+		loongson_i2c_slave_init(dev, dev->slave->addr);
+		return;
+	}
+#endif
+	if (!dev->speed_hz) {
+		prer_val = 0x12c;
+	} else {
+		pclk = 50000000;
+		prer_val = pclk / (5 * dev->speed_hz) - 1;
+	}
+
+	i2c_writeb(i2c_readb(LOONGSON_I2C_CR_REG) |
+					0x01, LOONGSON_I2C_CR_REG);
+	i2c_writeb(i2c_readb(LOONGSON_I2C_CTR_REG) & ~0x80,
+					LOONGSON_I2C_CTR_REG);
+	i2c_writeb(prer_val & 0xFF, LOONGSON_I2C_PRER_LO_REG);
+	i2c_writeb((prer_val & 0xFF00) >> 8, LOONGSON_I2C_PRER_HI_REG);
+	i2c_writeb(i2c_readb(LOONGSON_I2C_CTR_REG) |
+					0xe0, LOONGSON_I2C_CTR_REG);
+}
+
+static int loongson_i2c_read(
+		struct loongson_i2c_dev *dev, unsigned char *buf, int count)
+{
+	int i;
+	unsigned long time_left;
+
+	for (i = 0; i < count; i++) {
+		i2c_writeb((i == count - 1) ?
+			(CR_READ | CR_ACK) : CR_READ, LOONGSON_I2C_CR_REG);
+
+		time_left = wait_for_completion_timeout(
+				&dev->cmd_complete, (&dev->adapter)->timeout);
+		if (!time_left)
+			return -ETIMEDOUT;
+
+		buf[i] = i2c_readb(LOONGSON_I2C_RXR_REG);
+	}
+
+	return i;
+}
+
+static int loongson_i2c_write(
+		struct loongson_i2c_dev *dev, unsigned char *buf, int count)
+{
+	int i;
+	unsigned long time_left;
+
+	for (i = 0; i < count; i++) {
+		i2c_writeb(buf[i], LOONGSON_I2C_TXR_REG);
+		i2c_writeb(CR_WRITE, LOONGSON_I2C_CR_REG);
+		time_left = wait_for_completion_timeout(
+				&dev->cmd_complete, (&dev->adapter)->timeout);
+		if (!time_left)
+			return -ETIMEDOUT;
+
+		if (i2c_readb(LOONGSON_I2C_SR_REG) & SR_NOACK) {
+			if (loongson_i2c_stop(dev) < 0)
+				return -1;
+			return 0;
+		}
+	}
+
+	return i;
+}
+
+static int loongson_i2c_doxfer(
+		struct loongson_i2c_dev *dev, struct i2c_msg *msgs, int num)
+{
+	int i, err;
+	struct i2c_msg *m = msgs;
+
+	for (i = 0; i < num; i++) {
+		reinit_completion(&dev->cmd_complete);
+		err = loongson_i2c_start(dev, m->addr, m->flags);
+		if (err <= 0)
+			return err;
+
+		if ((m->flags & I2C_M_RD) &&
+			(loongson_i2c_read(dev, m->buf, m->len) < 0))
+			return -1;
+
+		if ((!(m->flags & I2C_M_RD)) &&
+			(loongson_i2c_write(dev, m->buf, m->len) < 0))
+			return -1;
+
+		++m;
+
+		if (!repeated_start && loongson_i2c_stop(dev) < 0)
+			return -1;
+	}
+
+	if (repeated_start && loongson_i2c_stop(dev) < 0)
+		return -1;
+
+	return i;
+}
+
+static int loongson_i2c_xfer(
+		struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	int ret;
+	int retry;
+	struct loongson_i2c_dev *dev;
+
+	dev = i2c_get_adapdata(adap);
+	for (retry = 0; retry < adap->retries; retry++) {
+		ret = loongson_i2c_doxfer(dev, msgs, num);
+		if (ret != -EAGAIN)
+			return ret;
+
+		udelay(100);
+	}
+
+	return -EREMOTEIO;
+}
+
+static unsigned int loongson_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm loongson_i2c_algo = {
+	.master_xfer	= loongson_i2c_xfer,
+	.functionality	= loongson_i2c_func,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave	= loongson_i2c_reg_slave,
+	.unreg_slave	= loongson_i2c_unreg_slave,
+#endif
+};
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static bool loongson_i2c_slave_irq(struct loongson_i2c_dev *dev)
+{
+	u32 stat;
+	struct i2c_client *slave = dev->slave;
+	u8 value;
+
+	stat = i2c_readb(LOONGSON_I2C_SR_REG);
+
+	if (stat & SR_SLAVE_ADDRESSED) {
+		dev->slave_state = LOONGSON_I2C_SLAVE_START;
+		i2c_writeb(CTR_RXROK | CTR_IEN, LOONGSON_I2C_CTR_REG);
+	}
+
+	if (dev->slave_state == LOONGSON_I2C_SLAVE_STOP)
+		return IRQ_NONE;
+
+	if (dev->slave_state == LOONGSON_I2C_SLAVE_START)
+		if (stat & SR_SLAVE_RW)
+			dev->slave_state =
+				LOONGSON_I2C_SLAVE_READ_REQUESTED;
+		else
+			dev->slave_state =
+				LOONGSON_I2C_SLAVE_WRITE_REQUESTED;
+
+	if (stat & SR_NOACK)
+		dev->slave_state = LOONGSON_I2C_SLAVE_STOP;
+
+	value = i2c_readb(LOONGSON_I2C_RXR_REG);
+	switch (dev->slave_state) {
+	case LOONGSON_I2C_SLAVE_READ_REQUESTED:
+		dev->slave_state = LOONGSON_I2C_SLAVE_READ_PROCESSED;
+		i2c_slave_event(
+			slave, LOONGSON_I2C_SLAVE_READ_REQUESTED, &value);
+		i2c_writeb(value, LOONGSON_I2C_TXR_REG);
+		i2c_writeb(CTR_TXROK | CTR_IEN, LOONGSON_I2C_CTR_REG);
+		break;
+	case LOONGSON_I2C_SLAVE_READ_PROCESSED:
+		i2c_slave_event(
+			slave, LOONGSON_I2C_SLAVE_READ_PROCESSED, &value);
+		i2c_writeb(value, LOONGSON_I2C_TXR_REG);
+		i2c_writeb(CTR_TXROK | CTR_IEN, LOONGSON_I2C_CTR_REG);
+		break;
+	case LOONGSON_I2C_SLAVE_WRITE_REQUESTED:
+		dev->slave_state = LOONGSON_I2C_SLAVE_WRITE_RECEIVED;
+		i2c_slave_event(
+			slave, LOONGSON_I2C_SLAVE_WRITE_REQUESTED, &value);
+		break;
+	case LOONGSON_I2C_SLAVE_WRITE_RECEIVED:
+		i2c_slave_event(
+			slave, LOONGSON_I2C_SLAVE_WRITE_RECEIVED, &value);
+		i2c_writeb(CTR_RXROK | CTR_IEN, LOONGSON_I2C_CTR_REG);
+		break;
+	case LOONGSON_I2C_SLAVE_STOP:
+		i2c_slave_event(slave, LOONGSON_I2C_SLAVE_STOP, &value);
+		i2c_writeb(0, LOONGSON_I2C_TXR_REG);
+		i2c_writeb(CTR_TXROK | CTR_IEN, LOONGSON_I2C_CTR_REG);
+		break;
+	default:
+		dev_err(dev->dev,
+			"unhandled slave_state: %d\n", dev->slave_state);
+		break;
+	}
+
+out:
+	return IRQ_HANDLED;
+}
+#endif
+
+static irqreturn_t loongson_i2c_isr(int this_irq, void *dev_id)
+{
+	unsigned char iflag;
+	struct loongson_i2c_dev *dev = dev_id;
+
+	iflag = i2c_readb(LOONGSON_I2C_SR_REG);
+
+	if (iflag & SR_IF) {
+		i2c_writeb(CR_IACK, LOONGSON_I2C_CR_REG);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		if (dev->slave)
+			loongson_i2c_slave_irq(dev);
+#endif
+		if (!(iflag & SR_TIP))
+			complete(&dev->cmd_complete);
+	} else
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static int loongson_i2c_probe(struct platform_device *pdev)
+{
+	struct loongson_i2c_dev	*dev;
+	struct i2c_adapter	*adap;
+	struct resource		*mem, *ioarea;
+	int			r, irq;
+	u32			bus_speed;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR(mem))
+		return dev_err_probe(
+			&pdev->dev, PTR_ERR(mem), "no mem resource\n");
+
+	ioarea = request_mem_region(mem->start, resource_size(mem),
+			pdev->name);
+	if (IS_ERR(ioarea))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ioarea),
+					"i2c region already claimed\n");
+
+	bus_speed = i2c_acpi_find_bus_speed(&pdev->dev);
+	if (!bus_speed)
+		device_property_read_u32(&pdev->dev, "clock-frequency",
+					&bus_speed);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq <= 0)
+		return dev_err_probe(&pdev->dev, irq, "no irq resource\n");
+
+	dev = kzalloc(sizeof(struct loongson_i2c_dev), GFP_KERNEL);
+	if (!dev) {
+		r = -ENOMEM;
+		goto err_release_region;
+	}
+
+	init_completion(&dev->cmd_complete);
+
+	dev->dev = &pdev->dev;
+	dev->irq = irq;
+	dev->speed_hz = bus_speed;
+	dev->base = ioremap(mem->start, resource_size(mem));
+	if (!dev->base) {
+		r = -ENOMEM;
+		goto err_free_mem;
+	}
+
+	platform_set_drvdata(pdev, dev);
+
+	loongson_i2c_reginit(dev);
+
+	r = request_irq(
+		dev->irq, loongson_i2c_isr, IRQF_SHARED, "loongson-i2c", dev);
+	if (r) {
+		dev_err(&pdev->dev, "failed to request i2c irq %i\n", dev->irq);
+		goto err_request_irq;
+	}
+
+	adap = &dev->adapter;
+	i2c_set_adapdata(adap, dev);
+	adap->nr = pdev->id;
+	strscpy(adap->name, pdev->name, sizeof(adap->name));
+	adap->owner = THIS_MODULE;
+	adap->class = I2C_CLASS_HWMON;
+	adap->retries = 5;
+	adap->algo = &loongson_i2c_algo;
+	adap->dev.parent = &pdev->dev;
+	adap->dev.of_node = pdev->dev.of_node;
+	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+	adap->timeout = msecs_to_jiffies(100);
+
+	r = i2c_add_adapter(adap);
+	if (r) {
+		dev_err(dev->dev, "failed to add i2c adapter\n");
+		goto err_iounmap;
+	}
+
+	return 0;
+
+err_iounmap:
+	iounmap(dev->base);
+err_request_irq:
+err_free_mem:
+	platform_set_drvdata(pdev, NULL);
+	kfree(dev);
+err_release_region:
+	release_mem_region(mem->start, resource_size(mem));
+
+	return r;
+}
+
+static int loongson_i2c_remove(struct platform_device *pdev)
+{
+	struct loongson_i2c_dev	*dev = platform_get_drvdata(pdev);
+	struct resource		*mem;
+
+	platform_set_drvdata(pdev, NULL);
+	i2c_del_adapter(&dev->adapter);
+	iounmap(dev->base);
+	kfree(dev);
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	release_mem_region(mem->start, resource_size(mem));
+
+	return 0;
+}
+
+static int loongson_i2c_suspend_noirq(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct loongson_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+
+	i2c_dev->suspended = 1;
+
+	return 0;
+}
+
+static int loongson_i2c_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct loongson_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+
+	i2c_dev->suspended = 0;
+	loongson_i2c_reginit(i2c_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops loongson_i2c_pm_ops = {
+	.suspend_noirq	= loongson_i2c_suspend_noirq,
+	.resume		= loongson_i2c_resume,
+};
+
+static const struct of_device_id loongson_i2c_id_table[] = {
+	{.compatible = "loongson,ls2k-i2c"},
+	{.compatible = "loongson,ls7a-i2c"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, loongson_i2c_id_table);
+
+static const struct acpi_device_id loongson_i2c_acpi_match[] = {
+	{"LOON0004"},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, loongson_i2c_acpi_match);
+
+static struct platform_driver loongson_i2c_driver = {
+	.driver	= {
+		.name	= "loongson-i2c",
+		.owner	= THIS_MODULE,
+		.pm	= &loongson_i2c_pm_ops,
+		.of_match_table = of_match_ptr(loongson_i2c_id_table),
+		.acpi_match_table = ACPI_PTR(loongson_i2c_acpi_match),
+	},
+	.probe		= loongson_i2c_probe,
+	.remove		= loongson_i2c_remove,
+};
+
+static int __init loongson_i2c_init_driver(void)
+{
+	return platform_driver_register(&loongson_i2c_driver);
+}
+subsys_initcall(loongson_i2c_init_driver);
+
+static void __exit loongson_i2c_exit_driver(void)
+{
+	platform_driver_unregister(&loongson_i2c_driver);
+}
+module_exit(loongson_i2c_exit_driver);
+
+MODULE_DESCRIPTION("Loongson i2c driver");
+MODULE_LICENSE("GPL");
-- 
2.20.1

