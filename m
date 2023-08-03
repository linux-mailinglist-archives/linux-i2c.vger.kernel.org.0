Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2738976DE9E
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 04:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjHCC5s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 22:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232700AbjHCC5r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 22:57:47 -0400
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F97E42
        for <linux-i2c@vger.kernel.org>; Wed,  2 Aug 2023 19:57:44 -0700 (PDT)
X-ASG-Debug-ID: 1691031459-086e23186908ec0002-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id Vw6mZ8ceta2zxGft (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 03 Aug 2023 10:57:40 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 3 Aug
 2023 10:57:39 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 3 Aug 2023 10:57:39 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>, <TonyWWang@zhaoxin.com>
Subject: [RFC 1/2] i2c: separate i2c-viai2c-common from i2c-wmt
Date:   Thu, 3 Aug 2023 10:57:37 +0800
X-ASG-Orig-Subj: [RFC 1/2] i2c: separate i2c-viai2c-common from i2c-wmt
Message-ID: <be5a428bf6859698c2d99412ae2f540f93140700.1691030850.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691030850.git.hanshu-oc@zhaoxin.com>
References: <cover.1691030850.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1691031459
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 22298
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.112239
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

export common definitions to i2c-viai2c-common.{c,h}:
1. export common marcos and use prefix VIAI2C rename them.
2. export common functions and use prefix via_i2c rename them.
3. rename data structure wmt_i2c_dev to via_i2c and export it.
4. remove some redundant code.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/Kconfig             |   4 +
 drivers/i2c/busses/Makefile            |   1 +
 drivers/i2c/busses/i2c-viai2c-common.c | 233 ++++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h |  65 ++++
 drivers/i2c/busses/i2c-wmt.c           | 402 ++-----------------------
 5 files changed, 333 insertions(+), 372 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 9cfe8fc509d7..d0dd0a892d50 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1178,9 +1178,13 @@ config I2C_VERSATILE
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-versatile.
 
+config I2C_VIA_COMMON
+	tristate
+
 config I2C_WMT
 	tristate "Wondermedia WM8xxx SoC I2C bus support"
 	depends on ARCH_VT8500 || COMPILE_TEST
+	select I2C_VIA_COMMON
 	help
 	  Say yes if you want to support the I2C bus on Wondermedia 8xxx-series
 	  SoCs.
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index af56fe2c75c0..62b2ed4862e0 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -120,6 +120,7 @@ obj-$(CONFIG_I2C_TEGRA_BPMP)	+= i2c-tegra-bpmp.o
 obj-$(CONFIG_I2C_UNIPHIER)	+= i2c-uniphier.o
 obj-$(CONFIG_I2C_UNIPHIER_F)	+= i2c-uniphier-f.o
 obj-$(CONFIG_I2C_VERSATILE)	+= i2c-versatile.o
+obj-$(CONFIG_I2C_VIA_COMMON)	+= i2c-viai2c-common.o
 obj-$(CONFIG_I2C_WMT)		+= i2c-wmt.o
 i2c-octeon-objs := i2c-octeon-core.o i2c-octeon-platdrv.o
 obj-$(CONFIG_I2C_OCTEON)	+= i2c-octeon.o
diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
new file mode 100644
index 000000000000..671117caba75
--- /dev/null
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Common driver for VIA i2c drivers
+ */
+#include <linux/of_irq.h>
+#include "i2c-viai2c-common.h"
+
+int via_i2c_wait_bus_ready(struct via_i2c *i2c)
+{
+	unsigned long timeout;
+
+	timeout = jiffies + VIAI2C_TIMEOUT;
+	while (!(readw(i2c->base + VIAI2C_CSR) & VIAI2C_CSR_READY_MASK)) {
+		if (time_after(jiffies, timeout)) {
+			dev_warn(i2c->dev, "timeout waiting for bus ready\n");
+			return -EBUSY;
+		}
+		msleep(20);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(via_i2c_wait_bus_ready);
+
+int via_i2c_wait_event(struct via_i2c *i2c, u16 event)
+{
+	if (!wait_for_completion_timeout(&i2c->complete, VIAI2C_TIMEOUT)) {
+		dev_err(i2c->dev, "wait timeout(SW)\n");
+		return -ETIMEDOUT;
+	}
+
+	if (i2c->event & event)
+		return 0;
+
+	return -EIO;
+}
+EXPORT_SYMBOL(via_i2c_wait_event);
+
+static int via_i2c_write(struct via_i2c *i2c, struct i2c_msg *pmsg, int last)
+{
+	int xfer_len = 0;
+	u16 val, tcr_val = i2c->tcr;
+	void __iomem *base = i2c->base;
+
+	if (pmsg->len == 0) {
+		/*
+		 * We still need to run through the while (..) once, so
+		 * start at -1 and break out early from the loop
+		 */
+		xfer_len = -1;
+		writew(0, base + VIAI2C_CDR);
+	} else {
+		writew(pmsg->buf[0], base + VIAI2C_CDR);
+	}
+
+	if (!(pmsg->flags & I2C_M_NOSTART)) {
+		val = readb(base + VIAI2C_CR);
+		val &= ~VIAI2C_CR_TX_END;
+		val |= VIAI2C_CR_CPU_RDY;
+		writeb(val, base + VIAI2C_CR);
+	}
+
+	reinit_completion(&i2c->complete);
+
+	tcr_val |= (pmsg->addr & VIAI2C_TCR_ADDR_MASK);
+
+	writew(tcr_val, base + VIAI2C_TCR);
+
+	if (pmsg->flags & I2C_M_NOSTART) {
+		val = readb(base + VIAI2C_CR);
+		val |= VIAI2C_CR_CPU_RDY;
+		writeb(val, base + VIAI2C_CR);
+	}
+
+	while (xfer_len < pmsg->len) {
+		int err;
+
+		err = via_i2c_wait_event(i2c, VIAI2C_ISR_BYTE_END);
+		if (err)
+			return err;
+
+		xfer_len++;
+
+		val = readw(base + VIAI2C_CSR);
+		if (val & VIAI2C_CSR_RCV_NACK) {
+			dev_dbg(i2c->dev, "write RCV NACK error\n");
+			return -EIO;
+		}
+
+		if (pmsg->len == 0) {
+			val = VIAI2C_CR_TX_END | VIAI2C_CR_CONTINUE_MASK;
+			writeb(val, base + VIAI2C_CR);
+			break;
+		}
+
+		if (xfer_len == pmsg->len) {
+			if (last != 1)
+				writeb(VIAI2C_CR_ENABLE, base + VIAI2C_CR);
+		} else {
+			writeb(pmsg->buf[xfer_len] & 0xFF, base + VIAI2C_CDR);
+			writeb(VIAI2C_CR_CONTINUE_MASK, base + VIAI2C_CR);
+		}
+	}
+
+	return 0;
+}
+
+static int via_i2c_read(struct via_i2c *i2c, struct i2c_msg *pmsg)
+{
+	u32 xfer_len = 0;
+	u16 val, tcr_val = i2c->tcr;
+	void __iomem *base = i2c->base;
+
+	val = readb(base + VIAI2C_CR);
+	val &= ~VIAI2C_CR_KILL_MASK;
+	if (!(pmsg->flags & I2C_M_NOSTART))
+		val |= VIAI2C_CR_CPU_RDY;
+	if (pmsg->len == 1)
+		val |= VIAI2C_CR_TX_NEXT_NO_ACK;
+	writeb(val, base + VIAI2C_CR);
+
+	reinit_completion(&i2c->complete);
+
+	tcr_val |= VIAI2C_TCR_READ | (pmsg->addr & VIAI2C_TCR_ADDR_MASK);
+
+	writew(tcr_val, base + VIAI2C_TCR);
+
+	if (pmsg->flags & I2C_M_NOSTART) {
+		val = readb(base + VIAI2C_CR);
+		val |= VIAI2C_CR_CPU_RDY;
+		writeb(val, base + VIAI2C_CR);
+	}
+
+	while (xfer_len < pmsg->len) {
+		int err;
+
+		err = via_i2c_wait_event(i2c, VIAI2C_ISR_BYTE_END);
+		if (err)
+			return err;
+
+		pmsg->buf[xfer_len] = readw(base + VIAI2C_CDR) >> 8;
+		xfer_len++;
+
+		val = readb(base + VIAI2C_CR) | VIAI2C_CR_CPU_RDY;
+		if (xfer_len == pmsg->len - 1)
+			val |= VIAI2C_CR_TX_NEXT_NO_ACK;
+		writeb(val, base + VIAI2C_CR);
+	}
+
+	return 0;
+}
+
+int via_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+{
+	int i;
+	int ret = 0;
+	struct via_i2c *i2c = i2c_get_adapdata(adap);
+
+	for (i = 0; ret >= 0 && i < num; i++) {
+		struct i2c_msg * pmsg = &msgs[i];
+
+		if (!(pmsg->flags & I2C_M_NOSTART)) {
+			ret = via_i2c_wait_bus_ready(i2c);
+			if (ret < 0)
+				return ret;
+		}
+
+		if (pmsg->flags & I2C_M_RD)
+			ret = via_i2c_read(i2c, pmsg);
+		else
+			ret = via_i2c_write(i2c, pmsg, (i + 1) == num);
+	}
+
+	return (ret < 0) ? ret : i;
+}
+EXPORT_SYMBOL(via_i2c_xfer);
+
+static irqreturn_t via_i2c_isr(int irq, void *data)
+{
+	struct via_i2c *i2c = data;
+
+	/* save the status and write-clear it */
+	i2c->event = readw(i2c->base + VIAI2C_ISR);
+	writew(i2c->event, i2c->base + VIAI2C_ISR);
+
+	complete(&i2c->complete);
+
+	return IRQ_HANDLED;
+}
+
+int via_i2c_init(struct platform_device *pdev, struct via_i2c **pi2c)
+{
+	int err;
+	int irq_flags;
+	struct via_i2c *i2c;
+	struct device_node *np = pdev->dev.of_node;
+
+	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(i2c->base))
+		return PTR_ERR(i2c->base);
+
+	if (np) {
+		irq_flags = 0;
+		i2c->irq = irq_of_parse_and_map(np, 0);
+	} else {
+		irq_flags = IRQF_SHARED;
+		i2c->irq = platform_get_irq(pdev, 0);
+	}
+	if (i2c->irq < 0)
+		return i2c->irq;
+
+	err = devm_request_irq(&pdev->dev, i2c->irq, via_i2c_isr,
+				irq_flags, "i2c", i2c);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+                                "failure requesting irq %d\n", i2c->irq);
+
+	i2c->dev = &pdev->dev;
+	platform_set_drvdata(pdev, i2c);
+	init_completion(&i2c->complete);
+
+	*pi2c = i2c;
+
+	return 0;
+}
+EXPORT_SYMBOL(via_i2c_init);
+
+MODULE_DESCRIPTION("Common driver for VIA i2c drivers");
+MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
new file mode 100644
index 000000000000..39deda1c42c4
--- /dev/null
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef I2C_VIA_COMMON_H
+#define I2C_VIA_COMMON_H
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define VIAI2C_CR		0x00
+#define VIAI2C_CR_ENABLE		BIT(0)
+#define VIAI2C_CR_TX_NEXT_NO_ACK	BIT(1)
+#define VIAI2C_CR_TX_END		BIT(2)
+#define VIAI2C_CR_CPU_RDY		BIT(3)
+#define VIAI2C_CR_KILL_MASK		GENMASK(2, 1)
+#define VIAI2C_CR_CONTINUE_MASK		(BIT(3) | BIT(0))
+
+#define VIAI2C_TCR		0x02
+#define VIAI2C_TCR_HS_MODE		BIT(13)
+#define VIAI2C_TCR_READ			BIT(14)
+#define VIAI2C_TCR_FAST		BIT(15)
+#define VIAI2C_TCR_ADDR_MASK		GENMASK(6, 0)
+
+#define VIAI2C_CSR		0x04
+#define VIAI2C_CSR_RCV_NACK		BIT(0)
+#define VIAI2C_CSR_READY_MASK		BIT(1)
+
+#define VIAI2C_ISR		0x06
+#define VIAI2C_ISR_NACK_ADDR		BIT(0)
+#define VIAI2C_ISR_BYTE_END		BIT(1)
+#define VIAI2C_ISR_SCL_TIMEOUT		BIT(2)
+#define VIAI2C_ISR_WRITE_ALL		GENMASK(2, 0)
+
+#define VIAI2C_IMR		0x08
+#define VIAI2C_IMR_ADDRNACK		BIT(0)
+#define VIAI2C_IMR_BYTE			BIT(1)
+#define VIAI2C_IMR_SCL_TIMEOUT		BIT(2)
+#define VIAI2C_IMR_EN_ALL		GENMASK(2, 0)
+
+#define VIAI2C_CDR		0x0A
+#define VIAI2C_TR		0x0C
+#define VIAI2C_MCR		0x0E
+
+#define VIAI2C_TIMEOUT		(msecs_to_jiffies(1000))
+
+struct via_i2c {
+	struct i2c_adapter	adapter;
+	struct completion	complete;
+	struct device		*dev;
+	void __iomem		*base;
+	struct clk		*clk;
+	int			irq;
+	u16			event;
+	u16			tcr;
+};
+
+int via_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
+int via_i2c_wait_bus_ready(struct via_i2c *i2c);
+int via_i2c_wait_event(struct via_i2c *i2c, u16 event);
+int via_i2c_init(struct platform_device *pdev, struct via_i2c **pi2c);
+
+#endif
diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index 76118abc6e10..e445155d1a60 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -7,309 +7,21 @@
  *  Derived from GPLv2+ licensed source:
  *  - Copyright (C) 2008 WonderMedia Technologies, Inc.
  */
-
 #include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/err.h>
-#include <linux/i2c.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/platform_device.h>
-
-#define REG_CR		0x00
-#define REG_TCR		0x02
-#define REG_CSR		0x04
-#define REG_ISR		0x06
-#define REG_IMR		0x08
-#define REG_CDR		0x0A
-#define REG_TR		0x0C
-#define REG_MCR		0x0E
-#define REG_SLAVE_CR	0x10
-#define REG_SLAVE_SR	0x12
-#define REG_SLAVE_ISR	0x14
-#define REG_SLAVE_IMR	0x16
-#define REG_SLAVE_DR	0x18
-#define REG_SLAVE_TR	0x1A
-
-/* REG_CR Bit fields */
-#define CR_TX_NEXT_ACK		0x0000
-#define CR_ENABLE		0x0001
-#define CR_TX_NEXT_NO_ACK	0x0002
-#define CR_TX_END		0x0004
-#define CR_CPU_RDY		0x0008
-#define SLAV_MODE_SEL		0x8000
-
-/* REG_TCR Bit fields */
-#define TCR_STANDARD_MODE	0x0000
-#define TCR_MASTER_WRITE	0x0000
-#define TCR_HS_MODE		0x2000
-#define TCR_MASTER_READ		0x4000
-#define TCR_FAST_MODE		0x8000
-#define TCR_SLAVE_ADDR_MASK	0x007F
-
-/* REG_ISR Bit fields */
-#define ISR_NACK_ADDR		0x0001
-#define ISR_BYTE_END		0x0002
-#define ISR_SCL_TIMEOUT		0x0004
-#define ISR_WRITE_ALL		0x0007
-
-/* REG_IMR Bit fields */
-#define IMR_ENABLE_ALL		0x0007
-
-/* REG_CSR Bit fields */
-#define CSR_RCV_NOT_ACK		0x0001
-#define CSR_RCV_ACK_MASK	0x0001
-#define CSR_READY_MASK		0x0002
-
-/* REG_TR */
-#define SCL_TIMEOUT(x)		(((x) & 0xFF) << 8)
-#define TR_STD			0x0064
-#define TR_HS			0x0019
-
-/* REG_MCR */
-#define MCR_APB_96M		7
-#define MCR_APB_166M		12
-
-#define I2C_MODE_STANDARD	0
-#define I2C_MODE_FAST		1
-
-#define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
-
-struct wmt_i2c_dev {
-	struct i2c_adapter	adapter;
-	struct completion	complete;
-	struct device		*dev;
-	void __iomem		*base;
-	struct clk		*clk;
-	int			mode;
-	int			irq;
-	u16			cmd_status;
-};
-
-static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev)
-{
-	unsigned long timeout;
-
-	timeout = jiffies + WMT_I2C_TIMEOUT;
-	while (!(readw(i2c_dev->base + REG_CSR) & CSR_READY_MASK)) {
-		if (time_after(jiffies, timeout)) {
-			dev_warn(i2c_dev->dev, "timeout waiting for bus ready\n");
-			return -EBUSY;
-		}
-		msleep(20);
-	}
-
-	return 0;
-}
-
-static int wmt_check_status(struct wmt_i2c_dev *i2c_dev)
-{
-	int ret = 0;
-
-	if (i2c_dev->cmd_status & ISR_NACK_ADDR)
-		ret = -EIO;
-
-	if (i2c_dev->cmd_status & ISR_SCL_TIMEOUT)
-		ret = -ETIMEDOUT;
-
-	return ret;
-}
-
-static int wmt_i2c_write(struct i2c_adapter *adap, struct i2c_msg *pmsg,
-			 int last)
-{
-	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	u16 val, tcr_val;
-	int ret;
-	unsigned long wait_result;
-	int xfer_len = 0;
-
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		ret = wmt_i2c_wait_bus_not_busy(i2c_dev);
-		if (ret < 0)
-			return ret;
-	}
-
-	if (pmsg->len == 0) {
-		/*
-		 * We still need to run through the while (..) once, so
-		 * start at -1 and break out early from the loop
-		 */
-		xfer_len = -1;
-		writew(0, i2c_dev->base + REG_CDR);
-	} else {
-		writew(pmsg->buf[0] & 0xFF, i2c_dev->base + REG_CDR);
-	}
-
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		val = readw(i2c_dev->base + REG_CR);
-		val &= ~CR_TX_END;
-		writew(val, i2c_dev->base + REG_CR);
-
-		val = readw(i2c_dev->base + REG_CR);
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
-	}
-
-	reinit_completion(&i2c_dev->complete);
-
-	if (i2c_dev->mode == I2C_MODE_STANDARD)
-		tcr_val = TCR_STANDARD_MODE;
-	else
-		tcr_val = TCR_FAST_MODE;
-
-	tcr_val |= (TCR_MASTER_WRITE | (pmsg->addr & TCR_SLAVE_ADDR_MASK));
-
-	writew(tcr_val, i2c_dev->base + REG_TCR);
-
-	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(i2c_dev->base + REG_CR);
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
-	}
-
-	while (xfer_len < pmsg->len) {
-		wait_result = wait_for_completion_timeout(&i2c_dev->complete,
-							msecs_to_jiffies(500));
-
-		if (wait_result == 0)
-			return -ETIMEDOUT;
-
-		ret = wmt_check_status(i2c_dev);
-		if (ret)
-			return ret;
-
-		xfer_len++;
-
-		val = readw(i2c_dev->base + REG_CSR);
-		if ((val & CSR_RCV_ACK_MASK) == CSR_RCV_NOT_ACK) {
-			dev_dbg(i2c_dev->dev, "write RCV NACK error\n");
-			return -EIO;
-		}
-
-		if (pmsg->len == 0) {
-			val = CR_TX_END | CR_CPU_RDY | CR_ENABLE;
-			writew(val, i2c_dev->base + REG_CR);
-			break;
-		}
-
-		if (xfer_len == pmsg->len) {
-			if (last != 1)
-				writew(CR_ENABLE, i2c_dev->base + REG_CR);
-		} else {
-			writew(pmsg->buf[xfer_len] & 0xFF, i2c_dev->base +
-								REG_CDR);
-			writew(CR_CPU_RDY | CR_ENABLE, i2c_dev->base + REG_CR);
-		}
-	}
-
-	return 0;
-}
-
-static int wmt_i2c_read(struct i2c_adapter *adap, struct i2c_msg *pmsg,
-			int last)
-{
-	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	u16 val, tcr_val;
-	int ret;
-	unsigned long wait_result;
-	u32 xfer_len = 0;
-
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		ret = wmt_i2c_wait_bus_not_busy(i2c_dev);
-		if (ret < 0)
-			return ret;
-	}
-
-	val = readw(i2c_dev->base + REG_CR);
-	val &= ~CR_TX_END;
-	writew(val, i2c_dev->base + REG_CR);
-
-	val = readw(i2c_dev->base + REG_CR);
-	val &= ~CR_TX_NEXT_NO_ACK;
-	writew(val, i2c_dev->base + REG_CR);
-
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		val = readw(i2c_dev->base + REG_CR);
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
-	}
-
-	if (pmsg->len == 1) {
-		val = readw(i2c_dev->base + REG_CR);
-		val |= CR_TX_NEXT_NO_ACK;
-		writew(val, i2c_dev->base + REG_CR);
-	}
-
-	reinit_completion(&i2c_dev->complete);
-
-	if (i2c_dev->mode == I2C_MODE_STANDARD)
-		tcr_val = TCR_STANDARD_MODE;
-	else
-		tcr_val = TCR_FAST_MODE;
-
-	tcr_val |= TCR_MASTER_READ | (pmsg->addr & TCR_SLAVE_ADDR_MASK);
-
-	writew(tcr_val, i2c_dev->base + REG_TCR);
-
-	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(i2c_dev->base + REG_CR);
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
-	}
+#include "i2c-via-common.h"
 
-	while (xfer_len < pmsg->len) {
-		wait_result = wait_for_completion_timeout(&i2c_dev->complete,
-							msecs_to_jiffies(500));
+#define wmt_i2c_dev		via_i2c
 
-		if (!wait_result)
-			return -ETIMEDOUT;
+/* VIAI2C_TR */
+#define WMT_SCL_TOUT		(((128) & 0xFF) << 8)
+#define WMT_TR_STD		0x0064
+#define WMT_TR_HS		0x0019
 
-		ret = wmt_check_status(i2c_dev);
-		if (ret)
-			return ret;
-
-		pmsg->buf[xfer_len] = readw(i2c_dev->base + REG_CDR) >> 8;
-		xfer_len++;
-
-		if (xfer_len == pmsg->len - 1) {
-			val = readw(i2c_dev->base + REG_CR);
-			val |= (CR_TX_NEXT_NO_ACK | CR_CPU_RDY);
-			writew(val, i2c_dev->base + REG_CR);
-		} else {
-			val = readw(i2c_dev->base + REG_CR);
-			val |= CR_CPU_RDY;
-			writew(val, i2c_dev->base + REG_CR);
-		}
-	}
-
-	return 0;
-}
-
-static int wmt_i2c_xfer(struct i2c_adapter *adap,
-			struct i2c_msg msgs[],
-			int num)
-{
-	struct i2c_msg *pmsg;
-	int i, is_last;
-	int ret = 0;
-
-	for (i = 0; ret >= 0 && i < num; i++) {
-		is_last = ((i + 1) == num);
-
-		pmsg = &msgs[i];
-		if (pmsg->flags & I2C_M_RD)
-			ret = wmt_i2c_read(adap, pmsg, is_last);
-		else
-			ret = wmt_i2c_write(adap, pmsg, is_last);
-	}
-
-	return (ret < 0) ? ret : i;
-}
+/* VIAI2C_MCR */
+#define WMT_MCR_APB_96M		7
+#define WMT_MCR_APB_166M	12
 
 static u32 wmt_i2c_func(struct i2c_adapter *adap)
 {
@@ -317,23 +29,10 @@ static u32 wmt_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm wmt_i2c_algo = {
-	.master_xfer	= wmt_i2c_xfer,
+	.master_xfer	= via_i2c_xfer,
 	.functionality	= wmt_i2c_func,
 };
 
-static irqreturn_t wmt_i2c_isr(int irq, void *data)
-{
-	struct wmt_i2c_dev *i2c_dev = data;
-
-	/* save the status and write-clear it */
-	i2c_dev->cmd_status = readw(i2c_dev->base + REG_ISR);
-	writew(i2c_dev->cmd_status, i2c_dev->base + REG_ISR);
-
-	complete(&i2c_dev->complete);
-
-	return IRQ_HANDLED;
-}
-
 static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
 {
 	int err;
@@ -351,18 +50,18 @@ static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
 		return err;
 	}
 
-	writew(0, i2c_dev->base + REG_CR);
-	writew(MCR_APB_166M, i2c_dev->base + REG_MCR);
-	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
-	writew(IMR_ENABLE_ALL, i2c_dev->base + REG_IMR);
-	writew(CR_ENABLE, i2c_dev->base + REG_CR);
-	readw(i2c_dev->base + REG_CSR);		/* read clear */
-	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
+	writew(0, i2c_dev->base + VIAI2C_CR);
+	writew(WMT_MCR_APB_166M, i2c_dev->base + VIAI2C_MCR);
+	writew(VIAI2C_ISR_WRITE_ALL, i2c_dev->base + VIAI2C_ISR);
+	writew(VIAI2C_IMR_EN_ALL, i2c_dev->base + VIAI2C_IMR);
+	writew(VIAI2C_CR_ENABLE, i2c_dev->base + VIAI2C_CR);
+	readw(i2c_dev->base + VIAI2C_CSR);		/* read clear */
+	writew(VIAI2C_ISR_WRITE_ALL, i2c_dev->base + VIAI2C_ISR);
 
-	if (i2c_dev->mode == I2C_MODE_STANDARD)
-		writew(SCL_TIMEOUT(128) | TR_STD, i2c_dev->base + REG_TR);
+	if (i2c_dev->tcr == VIAI2C_TCR_FAST)
+		writew(WMT_SCL_TOUT | WMT_TR_HS, i2c_dev->base + VIAI2C_TR);
 	else
-		writew(SCL_TIMEOUT(128) | TR_HS, i2c_dev->base + REG_TR);
+		writew(WMT_SCL_TOUT | WMT_TR_STD, i2c_dev->base + VIAI2C_TR);
 
 	return 0;
 }
@@ -375,39 +74,18 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	int err;
 	u32 clk_rate;
 
-	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
-	if (!i2c_dev)
-		return -ENOMEM;
-
-	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(i2c_dev->base))
-		return PTR_ERR(i2c_dev->base);
-
-	i2c_dev->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c_dev->irq) {
-		dev_err(&pdev->dev, "irq missing or invalid\n");
-		return -EINVAL;
-	}
+	err = via_i2c_init(pdev, &i2c_dev);
+	if (err)
+		return err;
 
 	i2c_dev->clk = of_clk_get(np, 0);
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "unable to request clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
+				"unable to request clock\n");
 
-	i2c_dev->mode = I2C_MODE_STANDARD;
 	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
 	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
-		i2c_dev->mode = I2C_MODE_FAST;
-
-	i2c_dev->dev = &pdev->dev;
-
-	err = devm_request_irq(&pdev->dev, i2c_dev->irq, wmt_i2c_isr, 0,
-							"i2c", i2c_dev);
-	if (err) {
-		dev_err(&pdev->dev, "failed to request irq %i\n", i2c_dev->irq);
-		return err;
-	}
+		i2c_dev->tcr = VIAI2C_TCR_FAST;
 
 	adap = &i2c_dev->adapter;
 	i2c_set_adapdata(adap, i2c_dev);
@@ -417,31 +95,12 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->dev.of_node = pdev->dev.of_node;
 
-	init_completion(&i2c_dev->complete);
-
 	err = wmt_i2c_reset_hardware(i2c_dev);
-	if (err) {
-		dev_err(&pdev->dev, "error initializing hardware\n");
-		return err;
-	}
-
-	err = i2c_add_adapter(adap);
 	if (err)
-		return err;
-
-	platform_set_drvdata(pdev, i2c_dev);
-
-	return 0;
-}
-
-static void wmt_i2c_remove(struct platform_device *pdev)
-{
-	struct wmt_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+		return dev_err_probe(&pdev->dev, err,
+				"error initializing hardware\n");
 
-	/* Disable interrupts, clock and delete adapter */
-	writew(0, i2c_dev->base + REG_IMR);
-	clk_disable_unprepare(i2c_dev->clk);
-	i2c_del_adapter(&i2c_dev->adapter);
+	return devm_i2c_add_adapter(&pdev->dev, &i2c_dev->adapter);
 }
 
 static const struct of_device_id wmt_i2c_dt_ids[] = {
@@ -451,7 +110,6 @@ static const struct of_device_id wmt_i2c_dt_ids[] = {
 
 static struct platform_driver wmt_i2c_driver = {
 	.probe		= wmt_i2c_probe,
-	.remove_new	= wmt_i2c_remove,
 	.driver		= {
 		.name	= "wmt-i2c",
 		.of_match_table = wmt_i2c_dt_ids,
-- 
2.34.1

