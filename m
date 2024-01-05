Return-Path: <linux-i2c+bounces-1125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8FB824F5A
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 08:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A048F1F2261E
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 07:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745CB20B19;
	Fri,  5 Jan 2024 07:52:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D69120B18
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704441111-086e230f2811770001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id QBiXmutqAqHe9lGT (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 05 Jan 2024 15:51:51 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 15:51:50 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 5 Jan 2024 15:51:50 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>
Subject: [PATCH v7 2/6] i2c: wmt: split out common files
Date: Fri, 5 Jan 2024 15:51:45 +0800
X-ASG-Orig-Subj: [PATCH v7 2/6] i2c: wmt: split out common files
Message-ID: <6ad69f15119b1ab8afc781d31bd4c4557df85ba6.1704440251.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1704441111
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 25048
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.119008
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

v6->v7:
	1. adjust the patch sequence: move the split file patch to the front
	2. rename i2c-wmt-plt.c to i2c-viai2c-wmt.c
	3. remove '#define wmt_i2c viai2c', use viai2c directly
	Link: https://lore.kernel.org/all/1871ceb5c3d6804c6a7f7a38327919861985c066.1703830854.git.hanshu-oc@zhaoxin.com/

Since the I2C IP of both wmt and zhaoxin originates from VIA,
it is better to separate the common code first.
The common driver is named as i2c-viai2c-common.c.
Old i2c-wmt.c renamed to i2c-viai2c-wmt.c.

The MAINTAINERS file will be updated accordingly in upcoming commits.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 MAINTAINERS                            |   2 +-
 drivers/i2c/busses/Makefile            |   1 +
 drivers/i2c/busses/i2c-viai2c-common.c | 221 +++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h |  71 +++++
 drivers/i2c/busses/i2c-viai2c-wmt.c    | 143 +++++++++
 drivers/i2c/busses/i2c-wmt.c           | 422 -------------------------
 6 files changed, 437 insertions(+), 423 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-viai2c-wmt.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9104430e148e..a73ccc8e89d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2988,7 +2988,7 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c
-F:	drivers/i2c/busses/i2c-wmt.c
+F:	drivers/i2c/busses/i2c-viai2c-wmt.c
 F:	drivers/mmc/host/wmt-sdmmc.c
 F:	drivers/pwm/pwm-vt8500.c
 F:	drivers/rtc/rtc-vt8500.c
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3757b9391e60..06ceb4775cbd 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -120,6 +120,7 @@ obj-$(CONFIG_I2C_TEGRA_BPMP)	+= i2c-tegra-bpmp.o
 obj-$(CONFIG_I2C_UNIPHIER)	+= i2c-uniphier.o
 obj-$(CONFIG_I2C_UNIPHIER_F)	+= i2c-uniphier-f.o
 obj-$(CONFIG_I2C_VERSATILE)	+= i2c-versatile.o
+i2c-wmt-objs := i2c-viai2c-wmt.o i2c-viai2c-common.o
 obj-$(CONFIG_I2C_WMT)		+= i2c-wmt.o
 i2c-octeon-objs := i2c-octeon-core.o i2c-octeon-platdrv.o
 obj-$(CONFIG_I2C_OCTEON)	+= i2c-octeon.o
diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
new file mode 100644
index 000000000000..fa47a4d9549c
--- /dev/null
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/of_irq.h>
+#include "i2c-viai2c-common.h"
+
+int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev)
+{
+	unsigned long timeout;
+
+	timeout = jiffies + WMT_I2C_TIMEOUT;
+	while (!(readw(i2c_dev->base + REG_CSR) & CSR_READY_MASK)) {
+		if (time_after(jiffies, timeout)) {
+			dev_warn(i2c_dev->dev, "timeout waiting for bus ready\n");
+			return -EBUSY;
+		}
+		msleep(20);
+	}
+
+	return 0;
+}
+
+int wmt_check_status(struct wmt_i2c_dev *i2c_dev)
+{
+	int ret = 0;
+	unsigned long wait_result;
+
+	wait_result = wait_for_completion_timeout(&i2c_dev->complete,
+						msecs_to_jiffies(500));
+	if (!wait_result)
+		return -ETIMEDOUT;
+
+	if (i2c_dev->cmd_status & ISR_NACK_ADDR)
+		ret = -EIO;
+
+	if (i2c_dev->cmd_status & ISR_SCL_TIMEOUT)
+		ret = -ETIMEDOUT;
+
+	return ret;
+}
+
+static int wmt_i2c_write(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg, int last)
+{
+	u16 val, tcr_val = i2c_dev->tcr;
+	int ret;
+	int xfer_len = 0;
+
+	if (pmsg->len == 0) {
+		/*
+		 * We still need to run through the while (..) once, so
+		 * start at -1 and break out early from the loop
+		 */
+		xfer_len = -1;
+		writew(0, i2c_dev->base + REG_CDR);
+	} else {
+		writew(pmsg->buf[0] & 0xFF, i2c_dev->base + REG_CDR);
+	}
+
+	if (!(pmsg->flags & I2C_M_NOSTART)) {
+		val = readw(i2c_dev->base + REG_CR);
+		val &= ~CR_TX_END;
+		val |= CR_CPU_RDY;
+		writew(val, i2c_dev->base + REG_CR);
+	}
+
+	reinit_completion(&i2c_dev->complete);
+
+	tcr_val |= (TCR_MASTER_WRITE | (pmsg->addr & TCR_SLAVE_ADDR_MASK));
+
+	writew(tcr_val, i2c_dev->base + REG_TCR);
+
+	if (pmsg->flags & I2C_M_NOSTART) {
+		val = readw(i2c_dev->base + REG_CR);
+		val |= CR_CPU_RDY;
+		writew(val, i2c_dev->base + REG_CR);
+	}
+
+	while (xfer_len < pmsg->len) {
+		ret = wmt_check_status(i2c_dev);
+		if (ret)
+			return ret;
+
+		xfer_len++;
+
+		val = readw(i2c_dev->base + REG_CSR);
+		if ((val & CSR_RCV_ACK_MASK) == CSR_RCV_NOT_ACK) {
+			dev_dbg(i2c_dev->dev, "write RCV NACK error\n");
+			return -EIO;
+		}
+
+		if (pmsg->len == 0) {
+			val = CR_TX_END | CR_CPU_RDY | CR_ENABLE;
+			writew(val, i2c_dev->base + REG_CR);
+			break;
+		}
+
+		if (xfer_len == pmsg->len) {
+			if (last != 1)
+				writew(CR_ENABLE, i2c_dev->base + REG_CR);
+		} else {
+			writew(pmsg->buf[xfer_len] & 0xFF, i2c_dev->base +
+								REG_CDR);
+			writew(CR_CPU_RDY | CR_ENABLE, i2c_dev->base + REG_CR);
+		}
+	}
+
+	return 0;
+}
+
+static int wmt_i2c_read(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg)
+{
+	u16 val, tcr_val = i2c_dev->tcr;
+	int ret;
+	u32 xfer_len = 0;
+
+	val = readw(i2c_dev->base + REG_CR);
+	val &= ~(CR_TX_END | CR_TX_NEXT_NO_ACK);
+
+	if (!(pmsg->flags & I2C_M_NOSTART))
+		val |= CR_CPU_RDY;
+
+	if (pmsg->len == 1)
+		val |= CR_TX_NEXT_NO_ACK;
+
+	writew(val, i2c_dev->base + REG_CR);
+
+	reinit_completion(&i2c_dev->complete);
+
+	tcr_val |= TCR_MASTER_READ | (pmsg->addr & TCR_SLAVE_ADDR_MASK);
+
+	writew(tcr_val, i2c_dev->base + REG_TCR);
+
+	if (pmsg->flags & I2C_M_NOSTART) {
+		val = readw(i2c_dev->base + REG_CR);
+		val |= CR_CPU_RDY;
+		writew(val, i2c_dev->base + REG_CR);
+	}
+
+	while (xfer_len < pmsg->len) {
+		ret = wmt_check_status(i2c_dev);
+		if (ret)
+			return ret;
+
+		pmsg->buf[xfer_len] = readw(i2c_dev->base + REG_CDR) >> 8;
+		xfer_len++;
+
+		val = readw(i2c_dev->base + REG_CR) | CR_CPU_RDY;
+		if (xfer_len == pmsg->len - 1)
+			val |= CR_TX_NEXT_NO_ACK;
+		writew(val, i2c_dev->base + REG_CR);
+	}
+
+	return 0;
+}
+
+int wmt_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+{
+	struct i2c_msg *pmsg;
+	int i;
+	int ret = 0;
+	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
+
+	for (i = 0; ret >= 0 && i < num; i++) {
+		pmsg = &msgs[i];
+		if (!(pmsg->flags & I2C_M_NOSTART)) {
+			ret = wmt_i2c_wait_bus_not_busy(i2c_dev);
+			if (ret < 0)
+				return ret;
+		}
+
+		if (pmsg->flags & I2C_M_RD)
+			ret = wmt_i2c_read(i2c_dev, pmsg);
+		else
+			ret = wmt_i2c_write(i2c_dev, pmsg, (i + 1) == num);
+	}
+
+	return (ret < 0) ? ret : i;
+}
+
+static irqreturn_t wmt_i2c_isr(int irq, void *data)
+{
+	struct wmt_i2c_dev *i2c_dev = data;
+
+	/* save the status and write-clear it */
+	i2c_dev->cmd_status = readw(i2c_dev->base + REG_ISR);
+	writew(i2c_dev->cmd_status, i2c_dev->base + REG_ISR);
+
+	complete(&i2c_dev->complete);
+
+	return IRQ_HANDLED;
+}
+
+int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev)
+{
+	int err;
+	struct wmt_i2c_dev *i2c_dev;
+	struct device_node *np = pdev->dev.of_node;
+
+	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
+	if (!i2c_dev)
+		return -ENOMEM;
+
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(i2c_dev->base))
+		return PTR_ERR(i2c_dev->base);
+
+	i2c_dev->irq = irq_of_parse_and_map(np, 0);
+	if (!i2c_dev->irq)
+		return -EINVAL;
+
+	err = devm_request_irq(&pdev->dev, i2c_dev->irq, wmt_i2c_isr,
+					0, pdev->name, i2c_dev);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				"failed to request irq %i\n", i2c_dev->irq);
+
+	i2c_dev->dev = &pdev->dev;
+	init_completion(&i2c_dev->complete);
+	platform_set_drvdata(pdev, i2c_dev);
+
+	*pi2c_dev = i2c_dev;
+	return 0;
+}
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
new file mode 100644
index 000000000000..fcff8e4456eb
--- /dev/null
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -0,0 +1,71 @@
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
+#define REG_CR		0x00
+#define REG_TCR		0x02
+#define REG_CSR		0x04
+#define REG_ISR		0x06
+#define REG_IMR		0x08
+#define REG_CDR		0x0A
+#define REG_TR		0x0C
+#define REG_MCR		0x0E
+
+/* REG_CR Bit fields */
+#define CR_TX_NEXT_ACK		0x0000
+#define CR_ENABLE		0x0001
+#define CR_TX_NEXT_NO_ACK	0x0002
+#define CR_TX_END		0x0004
+#define CR_CPU_RDY		0x0008
+#define SLAV_MODE_SEL		0x8000
+
+/* REG_TCR Bit fields */
+#define TCR_STANDARD_MODE	0x0000
+#define TCR_MASTER_WRITE	0x0000
+#define TCR_HS_MODE		0x2000
+#define TCR_MASTER_READ		0x4000
+#define TCR_FAST_MODE		0x8000
+#define TCR_SLAVE_ADDR_MASK	0x007F
+
+/* REG_ISR Bit fields */
+#define ISR_NACK_ADDR		0x0001
+#define ISR_BYTE_END		0x0002
+#define ISR_SCL_TIMEOUT		0x0004
+#define ISR_WRITE_ALL		0x0007
+
+/* REG_IMR Bit fields */
+#define IMR_ENABLE_ALL		0x0007
+
+/* REG_CSR Bit fields */
+#define CSR_RCV_NOT_ACK		0x0001
+#define CSR_RCV_ACK_MASK	0x0001
+#define CSR_READY_MASK		0x0002
+
+#define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
+
+struct wmt_i2c_dev {
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
+int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev);
+int wmt_check_status(struct wmt_i2c_dev *i2c_dev);
+int wmt_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
+int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev);
+
+#endif
diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
new file mode 100644
index 000000000000..1a80f38d0b88
--- /dev/null
+++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
@@ -0,0 +1,143 @@
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
+#define REG_SLAVE_CR	0x10
+#define REG_SLAVE_SR	0x12
+#define REG_SLAVE_ISR	0x14
+#define REG_SLAVE_IMR	0x16
+#define REG_SLAVE_DR	0x18
+#define REG_SLAVE_TR	0x1A
+
+/* REG_TR */
+#define SCL_TIMEOUT(x)		(((x) & 0xFF) << 8)
+#define TR_STD			0x0064
+#define TR_HS			0x0019
+
+/* REG_MCR */
+#define MCR_APB_96M		7
+#define MCR_APB_166M		12
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
+static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
+{
+	int err;
+
+	err = clk_prepare_enable(i2c_dev->clk);
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to enable clock\n");
+		return err;
+	}
+
+	err = clk_set_rate(i2c_dev->clk, 20000000);
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to set clock = 20Mhz\n");
+		clk_disable_unprepare(i2c_dev->clk);
+		return err;
+	}
+
+	writew(0, i2c_dev->base + REG_CR);
+	writew(MCR_APB_166M, i2c_dev->base + REG_MCR);
+	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
+	writew(IMR_ENABLE_ALL, i2c_dev->base + REG_IMR);
+	writew(CR_ENABLE, i2c_dev->base + REG_CR);
+	readw(i2c_dev->base + REG_CSR);		/* read clear */
+	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
+
+	if (i2c_dev->tcr == TCR_FAST_MODE)
+		writew(SCL_TIMEOUT(128) | TR_HS, i2c_dev->base + REG_TR);
+	else
+		writew(SCL_TIMEOUT(128) | TR_STD, i2c_dev->base + REG_TR);
+
+	return 0;
+}
+
+static int wmt_i2c_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct wmt_i2c_dev *i2c_dev;
+	struct i2c_adapter *adap;
+	int err;
+	u32 clk_rate;
+
+	err = wmt_i2c_init(pdev, &i2c_dev);
+	if (err)
+		return err;
+
+	i2c_dev->clk = of_clk_get(np, 0);
+	if (IS_ERR(i2c_dev->clk)) {
+		dev_err(&pdev->dev, "unable to request clock\n");
+		return PTR_ERR(i2c_dev->clk);
+	}
+
+	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
+	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
+		i2c_dev->tcr = TCR_FAST_MODE;
+
+	adap = &i2c_dev->adapter;
+	i2c_set_adapdata(adap, i2c_dev);
+	strscpy(adap->name, "WMT I2C adapter", sizeof(adap->name));
+	adap->owner = THIS_MODULE;
+	adap->algo = &wmt_i2c_algo;
+	adap->dev.parent = &pdev->dev;
+	adap->dev.of_node = pdev->dev.of_node;
+
+	err = wmt_i2c_reset_hardware(i2c_dev);
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
+	struct wmt_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+
+	/* Disable interrupts, clock and delete adapter */
+	writew(0, i2c_dev->base + REG_IMR);
+	clk_disable_unprepare(i2c_dev->clk);
+	i2c_del_adapter(&i2c_dev->adapter);
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
index f1888f100d83..000000000000
--- a/drivers/i2c/busses/i2c-wmt.c
+++ /dev/null
@@ -1,422 +0,0 @@
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
-#define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
-
-struct wmt_i2c_dev {
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
-	unsigned long wait_result;
-
-	wait_result = wait_for_completion_timeout(&i2c_dev->complete,
-						msecs_to_jiffies(500));
-	if (!wait_result)
-		return -ETIMEDOUT;
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
-static int wmt_i2c_write(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg,
-			 int last)
-{
-	u16 val, tcr_val = i2c_dev->tcr;
-	int ret;
-	int xfer_len = 0;
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
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
-	}
-
-	reinit_completion(&i2c_dev->complete);
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
-static int wmt_i2c_read(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg)
-{
-	u16 val, tcr_val = i2c_dev->tcr;
-	int ret;
-	u32 xfer_len = 0;
-
-	val = readw(i2c_dev->base + REG_CR);
-	val &= ~(CR_TX_END | CR_TX_NEXT_NO_ACK);
-
-	if (!(pmsg->flags & I2C_M_NOSTART))
-		val |= CR_CPU_RDY;
-
-	if (pmsg->len == 1)
-		val |= CR_TX_NEXT_NO_ACK;
-
-	writew(val, i2c_dev->base + REG_CR);
-
-	reinit_completion(&i2c_dev->complete);
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
-
-	while (xfer_len < pmsg->len) {
-		ret = wmt_check_status(i2c_dev);
-		if (ret)
-			return ret;
-
-		pmsg->buf[xfer_len] = readw(i2c_dev->base + REG_CDR) >> 8;
-		xfer_len++;
-
-		val = readw(i2c_dev->base + REG_CR) | CR_CPU_RDY;
-		if (xfer_len == pmsg->len - 1)
-			val |= CR_TX_NEXT_NO_ACK;
-		writew(val, i2c_dev->base + REG_CR);
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
-	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-
-	for (i = 0; ret >= 0 && i < num; i++) {
-		pmsg = &msgs[i];
-		if (!(pmsg->flags & I2C_M_NOSTART)) {
-			ret = wmt_i2c_wait_bus_not_busy(i2c_dev);
-			if (ret < 0)
-				return ret;
-		}
-
-		if (pmsg->flags & I2C_M_RD)
-			ret = wmt_i2c_read(i2c_dev, pmsg);
-		else
-			ret = wmt_i2c_write(i2c_dev, pmsg, (i + 1) == num);
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
-static int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev)
-{
-	int err;
-	struct wmt_i2c_dev *i2c_dev;
-	struct device_node *np = pdev->dev.of_node;
-
-	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
-	if (!i2c_dev)
-		return -ENOMEM;
-
-	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(i2c_dev->base))
-		return PTR_ERR(i2c_dev->base);
-
-	i2c_dev->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c_dev->irq)
-		return -EINVAL;
-
-	err = devm_request_irq(&pdev->dev, i2c_dev->irq, wmt_i2c_isr,
-					0, pdev->name, i2c_dev);
-	if (err)
-		return dev_err_probe(&pdev->dev, err,
-				"failed to request irq %i\n", i2c_dev->irq);
-
-	i2c_dev->dev = &pdev->dev;
-	init_completion(&i2c_dev->complete);
-	platform_set_drvdata(pdev, i2c_dev);
-
-	*pi2c_dev = i2c_dev;
-	return 0;
-}
-
-static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
-{
-	int err;
-
-	err = clk_prepare_enable(i2c_dev->clk);
-	if (err) {
-		dev_err(i2c_dev->dev, "failed to enable clock\n");
-		return err;
-	}
-
-	err = clk_set_rate(i2c_dev->clk, 20000000);
-	if (err) {
-		dev_err(i2c_dev->dev, "failed to set clock = 20Mhz\n");
-		clk_disable_unprepare(i2c_dev->clk);
-		return err;
-	}
-
-	writew(0, i2c_dev->base + REG_CR);
-	writew(MCR_APB_166M, i2c_dev->base + REG_MCR);
-	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
-	writew(IMR_ENABLE_ALL, i2c_dev->base + REG_IMR);
-	writew(CR_ENABLE, i2c_dev->base + REG_CR);
-	readw(i2c_dev->base + REG_CSR);		/* read clear */
-	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
-
-	if (i2c_dev->tcr == TCR_FAST_MODE)
-		writew(SCL_TIMEOUT(128) | TR_HS, i2c_dev->base + REG_TR);
-	else
-		writew(SCL_TIMEOUT(128) | TR_STD, i2c_dev->base + REG_TR);
-
-	return 0;
-}
-
-static int wmt_i2c_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct wmt_i2c_dev *i2c_dev;
-	struct i2c_adapter *adap;
-	int err;
-	u32 clk_rate;
-
-	err = wmt_i2c_init(pdev, &i2c_dev);
-	if (err)
-		return err;
-
-	i2c_dev->clk = of_clk_get(np, 0);
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "unable to request clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
-
-	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
-	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
-		i2c_dev->tcr = TCR_FAST_MODE;
-
-	adap = &i2c_dev->adapter;
-	i2c_set_adapdata(adap, i2c_dev);
-	strscpy(adap->name, "WMT I2C adapter", sizeof(adap->name));
-	adap->owner = THIS_MODULE;
-	adap->algo = &wmt_i2c_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
-
-	err = wmt_i2c_reset_hardware(i2c_dev);
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
-	struct wmt_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
-
-	/* Disable interrupts, clock and delete adapter */
-	writew(0, i2c_dev->base + REG_IMR);
-	clk_disable_unprepare(i2c_dev->clk);
-	i2c_del_adapter(&i2c_dev->adapter);
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


