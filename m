Return-Path: <linux-i2c+bounces-1033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AF981F451
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 04:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07C91283ADA
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 03:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BDE4426;
	Thu, 28 Dec 2023 03:17:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB783C00
	for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 03:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703733469-1eb14e0c7e06b50001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id 1fqF2UWEtv3Af4BC (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 28 Dec 2023 11:17:49 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Dec
 2023 11:17:48 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 28 Dec 2023 11:17:48 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <cobechen@zhaoxin.com>, <hanshu-oc@zhaoxin.com>
Subject: [PATCH v5 4/8] i2c: wmt: split out common files
Date: Thu, 28 Dec 2023 11:17:42 +0800
X-ASG-Orig-Subj: [PATCH v5 4/8] i2c: wmt: split out common files
Message-ID: <6f823d07a6d282056551f3b356ba40e456360c20.1703733126.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703733126.git.hanshu-oc@zhaoxin.com>
References: <cover.1703733126.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1703733469
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 25021
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118654
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Since the I2C IP of both wmt and zhaoxin come from VIA,
the common driver is named as i2c-viai2c-common.c.
Old i2c-wmt.c renamed to i2c-wmt-plt.c.

The MAINTAINERS information will added in patch 0008.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 MAINTAINERS                            |   2 +-
 drivers/i2c/busses/Makefile            |   2 +
 drivers/i2c/busses/i2c-viai2c-common.c | 234 ++++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h |  66 ++++
 drivers/i2c/busses/i2c-wmt-plt.c       | 137 ++++++++
 drivers/i2c/busses/i2c-wmt.c           | 431 -------------------------
 6 files changed, 440 insertions(+), 432 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-wmt-plt.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9104430e148e..c3005c2c9dd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2988,7 +2988,7 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c
-F:	drivers/i2c/busses/i2c-wmt.c
+F:	drivers/i2c/busses/i2c-wmt-plt.c
 F:	drivers/mmc/host/wmt-sdmmc.c
 F:	drivers/pwm/pwm-vt8500.c
 F:	drivers/rtc/rtc-vt8500.c
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3757b9391e60..2ac59c585c08 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -120,7 +120,9 @@ obj-$(CONFIG_I2C_TEGRA_BPMP)	+= i2c-tegra-bpmp.o
 obj-$(CONFIG_I2C_UNIPHIER)	+= i2c-uniphier.o
 obj-$(CONFIG_I2C_UNIPHIER_F)	+= i2c-uniphier-f.o
 obj-$(CONFIG_I2C_VERSATILE)	+= i2c-versatile.o
+i2c-wmt-objs := i2c-wmt-plt.o i2c-viai2c-common.o
 obj-$(CONFIG_I2C_WMT)		+= i2c-wmt.o
+
 i2c-octeon-objs := i2c-octeon-core.o i2c-octeon-platdrv.o
 obj-$(CONFIG_I2C_OCTEON)	+= i2c-octeon.o
 i2c-thunderx-objs := i2c-octeon-core.o i2c-thunderx-pcidrv.o
diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
new file mode 100644
index 000000000000..76058d6853a7
--- /dev/null
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/of_irq.h>
+#include "i2c-viai2c-common.h"
+
+#define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
+
+static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c *i2c)
+{
+	unsigned long timeout;
+	void __iomem *base = i2c->base;
+
+	timeout = jiffies + WMT_I2C_TIMEOUT;
+	while (!(readw(base + WMTI2C_REG_CSR) & WMTI2C_CSR_READY_MASK)) {
+		if (time_after(jiffies, timeout)) {
+			dev_warn(i2c->dev,
+					"timeout waiting for bus ready\n");
+			return -EBUSY;
+		}
+		msleep(20);
+	}
+
+	return 0;
+}
+
+static int wmt_check_status(struct wmt_i2c *i2c)
+{
+	int ret = 0;
+	unsigned long wait_result;
+
+	wait_result = wait_for_completion_timeout(&i2c->complete,
+						msecs_to_jiffies(500));
+	if (!wait_result)
+		return -ETIMEDOUT;
+
+	if (i2c->cmd_status & WMTI2C_ISR_NACK_ADDR)
+		ret = -EIO;
+
+	if (i2c->cmd_status & WMTI2C_ISR_SCL_TIMEOUT)
+		ret = -ETIMEDOUT;
+
+	return ret;
+}
+
+static irqreturn_t wmt_i2c_isr(int irq, void *data)
+{
+	struct wmt_i2c *i2c = data;
+
+	/* save the status and write-clear it */
+	i2c->cmd_status = readw(i2c->base + WMTI2C_REG_ISR);
+	writew(i2c->cmd_status, i2c->base + WMTI2C_REG_ISR);
+
+	complete(&i2c->complete);
+
+	return IRQ_HANDLED;
+}
+
+static int wmt_i2c_write(struct wmt_i2c *i2c, struct i2c_msg *pmsg,
+			 int last)
+{
+	u16 val, tcr_val = i2c->tcr;
+	int ret;
+	int xfer_len = 0;
+	void __iomem *base = i2c->base;
+
+	if (pmsg->len == 0) {
+		/*
+		 * We still need to run through the while (..) once, so
+		 * start at -1 and break out early from the loop
+		 */
+		xfer_len = -1;
+		writew(0, base + WMTI2C_REG_CDR);
+	} else {
+		writew(pmsg->buf[0] & 0xFF, base + WMTI2C_REG_CDR);
+	}
+
+	if (!(pmsg->flags & I2C_M_NOSTART)) {
+		val = readw(base + WMTI2C_REG_CR);
+		val &= ~WMTI2C_CR_TX_END;
+		val |= WMTI2C_CR_CPU_RDY;
+		writew(val, base + WMTI2C_REG_CR);
+	}
+
+	reinit_completion(&i2c->complete);
+
+	tcr_val |= (WMTI2C_TCR_MASTER_WRITE
+		| (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK));
+
+	writew(tcr_val, base + WMTI2C_REG_TCR);
+
+	if (pmsg->flags & I2C_M_NOSTART) {
+		val = readw(base + WMTI2C_REG_CR);
+		val |= WMTI2C_CR_CPU_RDY;
+		writew(val, base + WMTI2C_REG_CR);
+	}
+
+	while (xfer_len < pmsg->len) {
+		ret = wmt_check_status(i2c);
+		if (ret)
+			return ret;
+
+		xfer_len++;
+
+		val = readw(base + WMTI2C_REG_CSR);
+		if (val & WMTI2C_CSR_RCV_NOT_ACK) {
+			dev_dbg(i2c->dev, "write RCV NACK error\n");
+			return -EIO;
+		}
+
+		if (pmsg->len == 0) {
+			val = WMTI2C_CR_TX_END | WMTI2C_CR_CPU_RDY
+				| WMTI2C_CR_ENABLE;
+			writew(val, base + WMTI2C_REG_CR);
+			break;
+		}
+
+		if (xfer_len == pmsg->len) {
+			if (last != 1)
+				writew(WMTI2C_CR_ENABLE, base + WMTI2C_REG_CR);
+		} else {
+			writew(pmsg->buf[xfer_len] & 0xFF,
+					base + WMTI2C_REG_CDR);
+			writew(WMTI2C_CR_CPU_RDY | WMTI2C_CR_ENABLE,
+					base + WMTI2C_REG_CR);
+		}
+	}
+
+	return 0;
+}
+
+static int wmt_i2c_read(struct wmt_i2c *i2c, struct i2c_msg *pmsg)
+{
+	u16 val, tcr_val = i2c->tcr;
+	int ret;
+	u32 xfer_len = 0;
+	void __iomem *base = i2c->base;
+
+	val = readw(base + WMTI2C_REG_CR);
+	val &= ~(WMTI2C_CR_TX_END | WMTI2C_CR_TX_NEXT_NO_ACK);
+
+	if (!(pmsg->flags & I2C_M_NOSTART))
+		val |= WMTI2C_CR_CPU_RDY;
+
+	if (pmsg->len == 1)
+		val |= WMTI2C_CR_TX_NEXT_NO_ACK;
+
+	writew(val, base + WMTI2C_REG_CR);
+
+	reinit_completion(&i2c->complete);
+
+	tcr_val |= WMTI2C_TCR_MASTER_READ
+		| (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK);
+
+	writew(tcr_val, base + WMTI2C_REG_TCR);
+
+	if (pmsg->flags & I2C_M_NOSTART) {
+		val = readw(base + WMTI2C_REG_CR);
+		val |= WMTI2C_CR_CPU_RDY;
+		writew(val, base + WMTI2C_REG_CR);
+	}
+
+	while (xfer_len < pmsg->len) {
+		ret = wmt_check_status(i2c);
+		if (ret)
+			return ret;
+
+		pmsg->buf[xfer_len] = readw(base + WMTI2C_REG_CDR) >> 8;
+		xfer_len++;
+
+		val = readw(base + WMTI2C_REG_CR) | WMTI2C_CR_CPU_RDY;
+		if (xfer_len == pmsg->len - 1)
+			val |= WMTI2C_CR_TX_NEXT_NO_ACK;
+		writew(val, base + WMTI2C_REG_CR);
+	}
+
+	return 0;
+}
+
+int wmt_i2c_xfer(struct i2c_adapter *adap,
+			struct i2c_msg msgs[],
+			int num)
+{
+	struct i2c_msg *pmsg;
+	int i;
+	int ret = 0;
+	struct wmt_i2c *i2c = i2c_get_adapdata(adap);
+
+	for (i = 0; ret >= 0 && i < num; i++) {
+		pmsg = &msgs[i];
+		if (!(pmsg->flags & I2C_M_NOSTART)) {
+			ret = wmt_i2c_wait_bus_not_busy(i2c);
+			if (ret < 0)
+				return ret;
+		}
+
+		if (pmsg->flags & I2C_M_RD)
+			ret = wmt_i2c_read(i2c, pmsg);
+		else
+			ret = wmt_i2c_write(i2c, pmsg, (i + 1) == num);
+	}
+
+	return (ret < 0) ? ret : i;
+}
+
+int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c)
+{
+	int err;
+	struct wmt_i2c *i2c;
+	struct device_node *np = pdev->dev.of_node;
+
+	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(i2c->base))
+		return PTR_ERR(i2c->base);
+
+	i2c->irq = irq_of_parse_and_map(np, 0);
+	if (!i2c->irq)
+		return -EINVAL;
+
+	err = devm_request_irq(&pdev->dev, i2c->irq, wmt_i2c_isr,
+					0, pdev->name, i2c);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				"failed to request irq %i\n", i2c->irq);
+
+	i2c->dev = &pdev->dev;
+	init_completion(&i2c->complete);
+	platform_set_drvdata(pdev, i2c);
+
+	*pi2c = i2c;
+	return 0;
+}
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
new file mode 100644
index 000000000000..e57da0dc68a5
--- /dev/null
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __I2C_VIAI2C_COMMON_H_
+#define __I2C_VIAI2C_COMMON_H_
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+
+/* REG_CR Bit fields */
+#define WMTI2C_REG_CR		0x00
+#define WMTI2C_CR_TX_NEXT_ACK		0x0000
+#define WMTI2C_CR_ENABLE		0x0001
+#define WMTI2C_CR_TX_NEXT_NO_ACK	0x0002
+#define WMTI2C_CR_TX_END		0x0004
+#define WMTI2C_CR_CPU_RDY		0x0008
+
+/* REG_TCR Bit fields */
+#define WMTI2C_REG_TCR		0x02
+#define WMTI2C_TCR_STANDARD_MODE	0x0000
+#define WMTI2C_TCR_MASTER_WRITE		0x0000
+#define WMTI2C_TCR_HS_MODE		0x2000
+#define WMTI2C_TCR_MASTER_READ		0x4000
+#define WMTI2C_TCR_FAST_MODE		0x8000
+#define WMTI2C_TCR_SLAVE_ADDR_MASK	0x007F
+
+/* REG_CSR Bit fields */
+#define WMTI2C_REG_CSR		0x04
+#define WMTI2C_CSR_RCV_NOT_ACK		0x0001
+#define WMTI2C_CSR_RCV_ACK_MASK		0x0001
+#define WMTI2C_CSR_READY_MASK		0x0002
+
+/* REG_ISR Bit fields */
+#define WMTI2C_REG_ISR		0x06
+#define WMTI2C_ISR_NACK_ADDR		0x0001
+#define WMTI2C_ISR_BYTE_END		0x0002
+#define WMTI2C_ISR_SCL_TIMEOUT		0x0004
+#define WMTI2C_ISR_WRITE_ALL		0x0007
+
+/* REG_IMR Bit fields */
+#define WMTI2C_REG_IMR		0x08
+#define WMTI2C_IMR_ENABLE_ALL		0x0007
+
+#define WMTI2C_REG_CDR		0x0A
+#define WMTI2C_REG_TR		0x0C
+#define WMTI2C_REG_MCR		0x0E
+
+struct wmt_i2c {
+	struct i2c_adapter	adapter;
+	struct completion	complete;
+	struct device		*dev;
+	void __iomem		*base;
+	struct clk		*clk;
+	u16			tcr;
+	int			irq;
+	u16			cmd_status;
+};
+
+int wmt_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
+int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c);
+
+#endif
diff --git a/drivers/i2c/busses/i2c-wmt-plt.c b/drivers/i2c/busses/i2c-wmt-plt.c
new file mode 100644
index 000000000000..e0ffccf8a40a
--- /dev/null
+++ b/drivers/i2c/busses/i2c-wmt-plt.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Wondermedia I2C Master Mode Driver
+ *
+ *  Copyright (C) 2012 Tony Prisk <linux@prisktech.co.nz>
+ *
+ *  Derived from GPLv2+ licensed source:
+ *  - Copyright (C) 2008 WonderMedia Technologies, Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include "i2c-viai2c-common.h"
+
+/* REG_TR */
+#define WMTI2C_SCL_TIMEOUT(x)		(((x) & 0xFF) << 8)
+#define WMTI2C_TR_STD			0x0064
+#define WMTI2C_TR_HS			0x0019
+
+/* REG_MCR */
+#define WMTI2C_MCR_APB_96M		7
+#define WMTI2C_MCR_APB_166M		12
+
+static u32 wmt_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_NOSTART;
+}
+
+static const struct i2c_algorithm wmt_i2c_algo = {
+	.master_xfer	= wmt_i2c_xfer,
+	.functionality	= wmt_i2c_func,
+};
+
+static int wmt_i2c_reset_hardware(struct wmt_i2c *i2c)
+{
+	int err;
+	void __iomem *base = i2c->base;
+
+	err = clk_prepare_enable(i2c->clk);
+	if (err) {
+		dev_err(i2c->dev, "failed to enable clock\n");
+		return err;
+	}
+
+	err = clk_set_rate(i2c->clk, 20000000);
+	if (err) {
+		dev_err(i2c->dev, "failed to set clock = 20Mhz\n");
+		clk_disable_unprepare(i2c->clk);
+		return err;
+	}
+
+	writew(0, base + WMTI2C_REG_CR);
+	writew(WMTI2C_MCR_APB_166M, base + WMTI2C_REG_MCR);
+	writew(WMTI2C_ISR_WRITE_ALL, base + WMTI2C_REG_ISR);
+	writew(WMTI2C_IMR_ENABLE_ALL, base + WMTI2C_REG_IMR);
+	writew(WMTI2C_CR_ENABLE, base + WMTI2C_REG_CR);
+	readw(base + WMTI2C_REG_CSR);		/* read clear */
+	writew(WMTI2C_ISR_WRITE_ALL, base + WMTI2C_REG_ISR);
+
+	if (i2c->tcr == WMTI2C_TCR_FAST_MODE)
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS, base + WMTI2C_REG_TR);
+	else
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD, base + WMTI2C_REG_TR);
+
+	return 0;
+}
+
+static int wmt_i2c_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct wmt_i2c *i2c;
+	struct i2c_adapter *adap;
+	int err;
+	u32 clk_rate;
+
+	err = wmt_i2c_init(pdev, &i2c);
+	if (err)
+		return err;
+
+	i2c->clk = of_clk_get(np, 0);
+	if (IS_ERR(i2c->clk)) {
+		dev_err(&pdev->dev, "unable to request clock\n");
+		return PTR_ERR(i2c->clk);
+	}
+
+	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
+	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
+		i2c->tcr = WMTI2C_TCR_FAST_MODE;
+
+	adap = &i2c->adapter;
+	i2c_set_adapdata(adap, i2c);
+	strscpy(adap->name, "WMT I2C adapter", sizeof(adap->name));
+	adap->owner = THIS_MODULE;
+	adap->algo = &wmt_i2c_algo;
+	adap->dev.parent = &pdev->dev;
+	adap->dev.of_node = pdev->dev.of_node;
+
+	err = wmt_i2c_reset_hardware(i2c);
+	if (err) {
+		dev_err(&pdev->dev, "error initializing hardware\n");
+		return err;
+	}
+
+	return i2c_add_adapter(adap);
+}
+
+static void wmt_i2c_remove(struct platform_device *pdev)
+{
+	struct wmt_i2c *i2c = platform_get_drvdata(pdev);
+
+	/* Disable interrupts, clock and delete adapter */
+	writew(0, i2c->base + WMTI2C_REG_IMR);
+	clk_disable_unprepare(i2c->clk);
+	i2c_del_adapter(&i2c->adapter);
+}
+
+static const struct of_device_id wmt_i2c_dt_ids[] = {
+	{ .compatible = "wm,wm8505-i2c" },
+	{ /* Sentinel */ },
+};
+
+static struct platform_driver wmt_i2c_driver = {
+	.probe		= wmt_i2c_probe,
+	.remove_new	= wmt_i2c_remove,
+	.driver		= {
+		.name	= "wmt-i2c",
+		.of_match_table = wmt_i2c_dt_ids,
+	},
+};
+
+module_platform_driver(wmt_i2c_driver);
+
+MODULE_DESCRIPTION("Wondermedia I2C master-mode bus adapter");
+MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, wmt_i2c_dt_ids);
diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
deleted file mode 100644
index 76fba4ffa126..000000000000
--- a/drivers/i2c/busses/i2c-wmt.c
+++ /dev/null
@@ -1,431 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Wondermedia I2C Master Mode Driver
- *
- *  Copyright (C) 2012 Tony Prisk <linux@prisktech.co.nz>
- *
- *  Derived from GPLv2+ licensed source:
- *  - Copyright (C) 2008 WonderMedia Technologies, Inc.
- */
-
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/err.h>
-#include <linux/i2c.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/platform_device.h>
-
-#define WMTI2C_REG_CR		0x00
-#define WMTI2C_REG_TCR		0x02
-#define WMTI2C_REG_CSR		0x04
-#define WMTI2C_REG_ISR		0x06
-#define WMTI2C_REG_IMR		0x08
-#define WMTI2C_REG_CDR		0x0A
-#define WMTI2C_REG_TR		0x0C
-#define WMTI2C_REG_MCR		0x0E
-#define WMTI2C_REG_SLAVE_CR	0x10
-#define WMTI2C_REG_SLAVE_SR	0x12
-#define WMTI2C_REG_SLAVE_ISR	0x14
-#define WMTI2C_REG_SLAVE_IMR	0x16
-#define WMTI2C_REG_SLAVE_DR	0x18
-#define WMTI2C_REG_SLAVE_TR	0x1A
-
-/* REG_CR Bit fields */
-#define WMTI2C_CR_TX_NEXT_ACK		0x0000
-#define WMTI2C_CR_ENABLE		0x0001
-#define WMTI2C_CR_TX_NEXT_NO_ACK	0x0002
-#define WMTI2C_CR_TX_END		0x0004
-#define WMTI2C_CR_CPU_RDY		0x0008
-#define WMTI2C_SLAV_MODE_SEL		0x8000
-
-/* REG_TCR Bit fields */
-#define WMTI2C_TCR_STANDARD_MODE	0x0000
-#define WMTI2C_TCR_MASTER_WRITE		0x0000
-#define WMTI2C_TCR_HS_MODE		0x2000
-#define WMTI2C_TCR_MASTER_READ		0x4000
-#define WMTI2C_TCR_FAST_MODE		0x8000
-#define WMTI2C_TCR_SLAVE_ADDR_MASK	0x007F
-
-/* REG_ISR Bit fields */
-#define WMTI2C_ISR_NACK_ADDR		0x0001
-#define WMTI2C_ISR_BYTE_END		0x0002
-#define WMTI2C_ISR_SCL_TIMEOUT		0x0004
-#define WMTI2C_ISR_WRITE_ALL		0x0007
-
-/* REG_IMR Bit fields */
-#define WMTI2C_IMR_ENABLE_ALL		0x0007
-
-/* REG_CSR Bit fields */
-#define WMTI2C_CSR_RCV_NOT_ACK		0x0001
-#define WMTI2C_CSR_RCV_ACK_MASK		0x0001
-#define WMTI2C_CSR_READY_MASK		0x0002
-
-/* REG_TR */
-#define WMTI2C_SCL_TIMEOUT(x)		(((x) & 0xFF) << 8)
-#define WMTI2C_TR_STD			0x0064
-#define WMTI2C_TR_HS			0x0019
-
-/* REG_MCR */
-#define WMTI2C_MCR_APB_96M		7
-#define WMTI2C_MCR_APB_166M		12
-
-#define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
-
-struct wmt_i2c {
-	struct i2c_adapter	adapter;
-	struct completion	complete;
-	struct device		*dev;
-	void __iomem		*base;
-	struct clk		*clk;
-	u16			tcr;
-	int			irq;
-	u16			cmd_status;
-};
-
-static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c *i2c)
-{
-	unsigned long timeout;
-	void __iomem *base = i2c->base;
-
-	timeout = jiffies + WMT_I2C_TIMEOUT;
-	while (!(readw(base + WMTI2C_REG_CSR) & WMTI2C_CSR_READY_MASK)) {
-		if (time_after(jiffies, timeout)) {
-			dev_warn(i2c->dev,
-					"timeout waiting for bus ready\n");
-			return -EBUSY;
-		}
-		msleep(20);
-	}
-
-	return 0;
-}
-
-static int wmt_check_status(struct wmt_i2c *i2c)
-{
-	int ret = 0;
-	unsigned long wait_result;
-
-	wait_result = wait_for_completion_timeout(&i2c->complete,
-						msecs_to_jiffies(500));
-	if (!wait_result)
-		return -ETIMEDOUT;
-
-	if (i2c->cmd_status & WMTI2C_ISR_NACK_ADDR)
-		ret = -EIO;
-
-	if (i2c->cmd_status & WMTI2C_ISR_SCL_TIMEOUT)
-		ret = -ETIMEDOUT;
-
-	return ret;
-}
-
-static int wmt_i2c_write(struct wmt_i2c *i2c, struct i2c_msg *pmsg,
-			 int last)
-{
-	u16 val, tcr_val = i2c->tcr;
-	int ret;
-	int xfer_len = 0;
-	void __iomem *base = i2c->base;
-
-	if (pmsg->len == 0) {
-		/*
-		 * We still need to run through the while (..) once, so
-		 * start at -1 and break out early from the loop
-		 */
-		xfer_len = -1;
-		writew(0, base + WMTI2C_REG_CDR);
-	} else {
-		writew(pmsg->buf[0] & 0xFF, base + WMTI2C_REG_CDR);
-	}
-
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		val = readw(base + WMTI2C_REG_CR);
-		val &= ~WMTI2C_CR_TX_END;
-		val |= WMTI2C_CR_CPU_RDY;
-		writew(val, base + WMTI2C_REG_CR);
-	}
-
-	reinit_completion(&i2c->complete);
-
-	tcr_val |= (WMTI2C_TCR_MASTER_WRITE
-		| (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK));
-
-	writew(tcr_val, base + WMTI2C_REG_TCR);
-
-	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(base + WMTI2C_REG_CR);
-		val |= WMTI2C_CR_CPU_RDY;
-		writew(val, base + WMTI2C_REG_CR);
-	}
-
-	while (xfer_len < pmsg->len) {
-		ret = wmt_check_status(i2c);
-		if (ret)
-			return ret;
-
-		xfer_len++;
-
-		val = readw(base + WMTI2C_REG_CSR);
-		if (val & WMTI2C_CSR_RCV_NOT_ACK) {
-			dev_dbg(i2c->dev, "write RCV NACK error\n");
-			return -EIO;
-		}
-
-		if (pmsg->len == 0) {
-			val = WMTI2C_CR_TX_END | WMTI2C_CR_CPU_RDY
-				| WMTI2C_CR_ENABLE;
-			writew(val, base + WMTI2C_REG_CR);
-			break;
-		}
-
-		if (xfer_len == pmsg->len) {
-			if (last != 1)
-				writew(WMTI2C_CR_ENABLE, base + WMTI2C_REG_CR);
-		} else {
-			writew(pmsg->buf[xfer_len] & 0xFF,
-					base + WMTI2C_REG_CDR);
-			writew(WMTI2C_CR_CPU_RDY | WMTI2C_CR_ENABLE,
-					base + WMTI2C_REG_CR);
-		}
-	}
-
-	return 0;
-}
-
-static int wmt_i2c_read(struct wmt_i2c *i2c, struct i2c_msg *pmsg)
-{
-	u16 val, tcr_val = i2c->tcr;
-	int ret;
-	u32 xfer_len = 0;
-	void __iomem *base = i2c->base;
-
-	val = readw(base + WMTI2C_REG_CR);
-	val &= ~(WMTI2C_CR_TX_END | WMTI2C_CR_TX_NEXT_NO_ACK);
-
-	if (!(pmsg->flags & I2C_M_NOSTART))
-		val |= WMTI2C_CR_CPU_RDY;
-
-	if (pmsg->len == 1)
-		val |= WMTI2C_CR_TX_NEXT_NO_ACK;
-
-	writew(val, base + WMTI2C_REG_CR);
-
-	reinit_completion(&i2c->complete);
-
-	tcr_val |= WMTI2C_TCR_MASTER_READ
-		| (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK);
-
-	writew(tcr_val, base + WMTI2C_REG_TCR);
-
-	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(base + WMTI2C_REG_CR);
-		val |= WMTI2C_CR_CPU_RDY;
-		writew(val, base + WMTI2C_REG_CR);
-	}
-
-	while (xfer_len < pmsg->len) {
-		ret = wmt_check_status(i2c);
-		if (ret)
-			return ret;
-
-		pmsg->buf[xfer_len] = readw(base + WMTI2C_REG_CDR) >> 8;
-		xfer_len++;
-
-		val = readw(base + WMTI2C_REG_CR) | WMTI2C_CR_CPU_RDY;
-		if (xfer_len == pmsg->len - 1)
-			val |= WMTI2C_CR_TX_NEXT_NO_ACK;
-		writew(val, base + WMTI2C_REG_CR);
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
-	int i;
-	int ret = 0;
-	struct wmt_i2c *i2c = i2c_get_adapdata(adap);
-
-	for (i = 0; ret >= 0 && i < num; i++) {
-		pmsg = &msgs[i];
-		if (!(pmsg->flags & I2C_M_NOSTART)) {
-			ret = wmt_i2c_wait_bus_not_busy(i2c);
-			if (ret < 0)
-				return ret;
-		}
-
-		if (pmsg->flags & I2C_M_RD)
-			ret = wmt_i2c_read(i2c, pmsg);
-		else
-			ret = wmt_i2c_write(i2c, pmsg, (i + 1) == num);
-	}
-
-	return (ret < 0) ? ret : i;
-}
-
-static u32 wmt_i2c_func(struct i2c_adapter *adap)
-{
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_NOSTART;
-}
-
-static const struct i2c_algorithm wmt_i2c_algo = {
-	.master_xfer	= wmt_i2c_xfer,
-	.functionality	= wmt_i2c_func,
-};
-
-static irqreturn_t wmt_i2c_isr(int irq, void *data)
-{
-	struct wmt_i2c *i2c = data;
-
-	/* save the status and write-clear it */
-	i2c->cmd_status = readw(i2c->base + WMTI2C_REG_ISR);
-	writew(i2c->cmd_status, i2c->base + WMTI2C_REG_ISR);
-
-	complete(&i2c->complete);
-
-	return IRQ_HANDLED;
-}
-
-static int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c)
-{
-	int err;
-	struct wmt_i2c *i2c;
-	struct device_node *np = pdev->dev.of_node;
-
-	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
-	if (!i2c)
-		return -ENOMEM;
-
-	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(i2c->base))
-		return PTR_ERR(i2c->base);
-
-	i2c->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c->irq)
-		return -EINVAL;
-
-	err = devm_request_irq(&pdev->dev, i2c->irq, wmt_i2c_isr,
-					0, pdev->name, i2c);
-	if (err)
-		return dev_err_probe(&pdev->dev, err,
-				"failed to request irq %i\n", i2c->irq);
-
-	i2c->dev = &pdev->dev;
-	init_completion(&i2c->complete);
-	platform_set_drvdata(pdev, i2c);
-
-	*pi2c = i2c;
-	return 0;
-}
-
-static int wmt_i2c_reset_hardware(struct wmt_i2c *i2c)
-{
-	int err;
-	void __iomem *base = i2c->base;
-
-	err = clk_prepare_enable(i2c->clk);
-	if (err) {
-		dev_err(i2c->dev, "failed to enable clock\n");
-		return err;
-	}
-
-	err = clk_set_rate(i2c->clk, 20000000);
-	if (err) {
-		dev_err(i2c->dev, "failed to set clock = 20Mhz\n");
-		clk_disable_unprepare(i2c->clk);
-		return err;
-	}
-
-	writew(0, base + WMTI2C_REG_CR);
-	writew(WMTI2C_MCR_APB_166M, base + WMTI2C_REG_MCR);
-	writew(WMTI2C_ISR_WRITE_ALL, base + WMTI2C_REG_ISR);
-	writew(WMTI2C_IMR_ENABLE_ALL, base + WMTI2C_REG_IMR);
-	writew(WMTI2C_CR_ENABLE, base + WMTI2C_REG_CR);
-	readw(base + WMTI2C_REG_CSR);		/* read clear */
-	writew(WMTI2C_ISR_WRITE_ALL, base + WMTI2C_REG_ISR);
-
-	if (i2c->tcr == WMTI2C_TCR_FAST_MODE)
-		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS, base + WMTI2C_REG_TR);
-	else
-		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD, base + WMTI2C_REG_TR);
-
-	return 0;
-}
-
-static int wmt_i2c_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct wmt_i2c *i2c;
-	struct i2c_adapter *adap;
-	int err;
-	u32 clk_rate;
-
-	err = wmt_i2c_init(pdev, &i2c);
-	if (err)
-		return err;
-
-	i2c->clk = of_clk_get(np, 0);
-	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "unable to request clock\n");
-		return PTR_ERR(i2c->clk);
-	}
-
-	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
-	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
-		i2c->tcr = WMTI2C_TCR_FAST_MODE;
-
-	adap = &i2c->adapter;
-	i2c_set_adapdata(adap, i2c);
-	strscpy(adap->name, "WMT I2C adapter", sizeof(adap->name));
-	adap->owner = THIS_MODULE;
-	adap->algo = &wmt_i2c_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
-
-	err = wmt_i2c_reset_hardware(i2c);
-	if (err) {
-		dev_err(&pdev->dev, "error initializing hardware\n");
-		return err;
-	}
-
-	return i2c_add_adapter(adap);
-}
-
-static void wmt_i2c_remove(struct platform_device *pdev)
-{
-	struct wmt_i2c *i2c = platform_get_drvdata(pdev);
-
-	/* Disable interrupts, clock and delete adapter */
-	writew(0, i2c->base + WMTI2C_REG_IMR);
-	clk_disable_unprepare(i2c->clk);
-	i2c_del_adapter(&i2c->adapter);
-}
-
-static const struct of_device_id wmt_i2c_dt_ids[] = {
-	{ .compatible = "wm,wm8505-i2c" },
-	{ /* Sentinel */ },
-};
-
-static struct platform_driver wmt_i2c_driver = {
-	.probe		= wmt_i2c_probe,
-	.remove_new	= wmt_i2c_remove,
-	.driver		= {
-		.name	= "wmt-i2c",
-		.of_match_table = wmt_i2c_dt_ids,
-	},
-};
-
-module_platform_driver(wmt_i2c_driver);
-
-MODULE_DESCRIPTION("Wondermedia I2C master-mode bus adapter");
-MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");
-MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, wmt_i2c_dt_ids);
-- 
2.34.1


