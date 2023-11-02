Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17267DEB2C
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 04:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346646AbjKBDKu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 23:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbjKBDKs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 23:10:48 -0400
X-Greylist: delayed 990 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Nov 2023 20:10:42 PDT
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A549110
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 20:10:42 -0700 (PDT)
X-ASG-Debug-ID: 1698893646-086e236fed038f0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id ZfaOfCkwuLEFd2Bk (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 02 Nov 2023 10:54:07 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 2 Nov
 2023 10:54:06 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 2 Nov 2023 10:54:06 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>
Subject: [PATCH v3 10/12] i2c: wmt: split out common files
Date:   Thu, 2 Nov 2023 10:54:00 +0800
X-ASG-Orig-Subj: [PATCH v3 10/12] i2c: wmt: split out common files
Message-ID: <4828df34481090f188e4d311c92b970e91b43d45.1698889581.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1698893647
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 24402
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.116190
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

Since the I2C IP of both wmt and zhaoxin come from VIA,
the common driver is named as i2c-viai2c-common.c.
Old i2c-wmt.c renamed to i2c-wmt-plt.c.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/Makefile            |   2 +
 drivers/i2c/busses/i2c-viai2c-common.c | 232 +++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h |  72 +++++
 drivers/i2c/busses/i2c-wmt-plt.c       | 139 ++++++++
 drivers/i2c/busses/i2c-wmt.c           | 431 -------------------------
 5 files changed, 445 insertions(+), 431 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-wmt-plt.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index af56fe2c75c0..19262f4d30fe 100644
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
index 000000000000..45ac56941bee
--- /dev/null
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/of_irq.h>
+#include "i2c-viai2c-common.h"
+
+#define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
+
+int viai2c_wait_bus_ready(struct viai2c *i2c)
+{
+	unsigned long timeout;
+	void __iomem *base = i2c->base;
+
+	timeout = jiffies + WMT_I2C_TIMEOUT;
+	while (!(readw(base + VIAI2C_REG_CSR) & VIAI2C_CSR_READY_MASK)) {
+		if (time_after(jiffies, timeout)) {
+			dev_warn(i2c->dev, "timeout waiting for bus ready\n");
+			return -EBUSY;
+		}
+		msleep(20);
+	}
+
+	return 0;
+}
+
+int viai2c_wait_status(struct viai2c *i2c, u8 status)
+{
+	unsigned long wait_result;
+
+	wait_result = wait_for_completion_timeout(&i2c->complete,
+						msecs_to_jiffies(500));
+	if (!wait_result)
+		return -ETIMEDOUT;
+
+	if (i2c->cmd_status & status)
+		return 0;
+
+	return -EIO;
+}
+
+static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, bool last)
+{
+	u16 val, tcr_val = i2c->tcr;
+	int xfer_len = 0;
+	void __iomem *base = i2c->base;
+
+	if (pmsg->len == 0) {
+		/*
+		 * We still need to run through the while (..) once, so
+		 * start at -1 and break out early from the loop
+		 */
+		xfer_len = -1;
+		writew(0, base + VIAI2C_REG_CDR);
+	} else {
+		writew(pmsg->buf[0] & 0xFF, base + VIAI2C_REG_CDR);
+	}
+
+	if (!(pmsg->flags & I2C_M_NOSTART)) {
+		val = readw(base + VIAI2C_REG_CR);
+		val &= ~VIAI2C_CR_TX_END;
+		val |= VIAI2C_CR_CPU_RDY;
+		writew(val, base + VIAI2C_REG_CR);
+	}
+
+	reinit_completion(&i2c->complete);
+	writew(tcr_val | pmsg->addr, base + VIAI2C_REG_TCR);
+
+	if (pmsg->flags & I2C_M_NOSTART) {
+		val = readw(base + VIAI2C_REG_CR);
+		val |= VIAI2C_CR_CPU_RDY;
+		writew(val, base + VIAI2C_REG_CR);
+	}
+
+	while (xfer_len < pmsg->len) {
+		int err;
+
+		err = viai2c_wait_status(i2c, VIAI2C_ISR_BYTE_END);
+		if (err)
+			return err;
+
+		xfer_len++;
+
+		val = readw(base + VIAI2C_REG_CSR);
+		if (val & VIAI2C_CSR_RCV_NOT_ACK) {
+			dev_dbg(i2c->dev, "write RCV NACK error\n");
+			return -EIO;
+		}
+
+		if (pmsg->len == 0) {
+			val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY
+				| VIAI2C_CR_ENABLE;
+			writew(val, base + VIAI2C_REG_CR);
+			break;
+		}
+
+		if (xfer_len == pmsg->len) {
+			if (!last)
+				writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
+		} else {
+			writew(pmsg->buf[xfer_len] & 0xFF,
+					base + VIAI2C_REG_CDR);
+			writew(VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE,
+					base + VIAI2C_REG_CR);
+		}
+	}
+
+	return 0;
+}
+
+static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
+{
+	u16 val, tcr_val = i2c->tcr;
+	u32 xfer_len = 0;
+	void __iomem *base = i2c->base;
+
+	val = readw(base + VIAI2C_REG_CR);
+	val &= ~(VIAI2C_CR_TX_END | VIAI2C_CR_RX_END);
+
+	if (!(pmsg->flags & I2C_M_NOSTART))
+		val |= VIAI2C_CR_CPU_RDY;
+
+	if (pmsg->len == 1)
+		val |= VIAI2C_CR_RX_END;
+
+	writew(val, base + VIAI2C_REG_CR);
+
+	reinit_completion(&i2c->complete);
+
+	tcr_val |= VIAI2C_TCR_MASTER_READ | pmsg->addr;
+
+	writew(tcr_val, base + VIAI2C_REG_TCR);
+
+	if (pmsg->flags & I2C_M_NOSTART) {
+		val = readw(base + VIAI2C_REG_CR);
+		val |= VIAI2C_CR_CPU_RDY;
+		writew(val, base + VIAI2C_REG_CR);
+	}
+
+	while (xfer_len < pmsg->len) {
+		int err;
+
+		err = viai2c_wait_status(i2c, VIAI2C_ISR_BYTE_END);
+		if (err)
+			return err;
+
+		pmsg->buf[xfer_len] = readw(base + VIAI2C_REG_CDR) >> 8;
+		xfer_len++;
+
+		val = readw(base + VIAI2C_REG_CR) | VIAI2C_CR_CPU_RDY;
+		if (xfer_len == pmsg->len - 1)
+			val |= VIAI2C_CR_RX_END;
+		writew(val, base + VIAI2C_REG_CR);
+	}
+
+	return 0;
+}
+
+int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+{
+	struct i2c_msg *pmsg;
+	int i;
+	int ret = 0;
+	struct viai2c *i2c = i2c_get_adapdata(adap);
+
+	for (i = 0; ret >= 0 && i < num; i++) {
+		pmsg = &msgs[i];
+		if (!(pmsg->flags & I2C_M_NOSTART)) {
+			ret = viai2c_wait_bus_ready(i2c);
+			if (ret < 0)
+				return ret;
+		}
+
+		if (pmsg->flags & I2C_M_RD)
+			ret = viai2c_read(i2c, pmsg);
+		else
+			ret = viai2c_write(i2c, pmsg, i == (num - 1));
+	}
+
+	return (ret < 0) ? ret : i;
+}
+
+static irqreturn_t viai2c_isr(int irq, void *data)
+{
+	struct viai2c *i2c = data;
+
+	/* save the status and write-clear it */
+	i2c->cmd_status = readw(i2c->base + VIAI2C_REG_ISR);
+	writew(i2c->cmd_status, i2c->base + VIAI2C_REG_ISR);
+
+	complete(&i2c->complete);
+
+	return IRQ_HANDLED;
+}
+
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
+{
+	int err;
+	int irq_flags;
+	struct viai2c *i2c;
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
+		if (!i2c->irq)
+			return -EINVAL;
+	} else {
+		irq_flags = IRQF_SHARED;
+		i2c->irq = platform_get_irq(pdev, 0);
+		if (i2c->irq < 0)
+			return i2c->irq;
+	}
+
+	err = devm_request_irq(&pdev->dev, i2c->irq, viai2c_isr,
+					irq_flags, pdev->name, i2c);
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
index 000000000000..f3dcc609679e
--- /dev/null
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -0,0 +1,72 @@
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
+#define VIAI2C_REG_CR		0x00
+#define VIAI2C_CR_ENABLE		BIT(0)
+#define VIAI2C_CR_RX_END		BIT(1)
+#define VIAI2C_CR_TX_END		BIT(2)
+#define VIAI2C_CR_END_MASK		GENMASK(2, 1)
+#define VIAI2C_CR_CPU_RDY		BIT(3)
+
+/* REG_TCR Bit fields */
+#define VIAI2C_REG_TCR		0x02
+#define VIAI2C_TCR_HS_MODE		BIT(13)
+#define VIAI2C_TCR_MASTER_READ		BIT(14)
+#define VIAI2C_TCR_FAST			BIT(15)
+
+/* REG_CSR Bit fields */
+#define VIAI2C_REG_CSR		0x04
+#define VIAI2C_CSR_RCV_NOT_ACK		BIT(0)
+#define VIAI2C_CSR_READY_MASK		BIT(1)
+
+/* REG_ISR Bit fields */
+#define VIAI2C_REG_ISR		0x06
+#define VIAI2C_ISR_NACK_ADDR		BIT(0)
+#define VIAI2C_ISR_BYTE_END		BIT(1)
+#define VIAI2C_ISR_SCL_TIMEOUT		BIT(2)
+#define VIAI2C_ISR_MASK_ALL		GENMASK(2, 0)
+
+/* REG_IMR Bit fields */
+#define VIAI2C_REG_IMR		0x08
+#define VIAI2C_IMR_ADDRNACK		BIT(0)
+#define VIAI2C_IMR_BYTE			BIT(1)
+#define VIAI2C_IMR_SCL_TIMEOUT		BIT(2)
+#define VIAI2C_IMR_ENABLE_ALL		GENMASK(2, 0)
+
+#define VIAI2C_REG_CDR		0x0A
+#define VIAI2C_REG_TR		0x0C
+#define VIAI2C_REG_MCR		0x0E
+
+enum {
+	VIAI2C_PLAT_WMT = 1,
+};
+
+struct viai2c {
+	struct i2c_adapter	adapter;
+	struct completion	complete;
+	struct device		*dev;
+	void __iomem		*base;
+	struct clk		*clk;
+	u16			tcr;
+	int			irq;
+	u16			cmd_status;
+	u8			platform;
+};
+
+int viai2c_wait_bus_ready(struct viai2c *i2c);
+int viai2c_wait_status(struct viai2c *i2c, u8 status);
+int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c);
+
+#endif
diff --git a/drivers/i2c/busses/i2c-wmt-plt.c b/drivers/i2c/busses/i2c-wmt-plt.c
new file mode 100644
index 000000000000..1789156a656e
--- /dev/null
+++ b/drivers/i2c/busses/i2c-wmt-plt.c
@@ -0,0 +1,139 @@
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
+#define WMTI2C_REG_SLAVE_CR	0x10
+#define WMTI2C_REG_SLAVE_SR	0x12
+#define WMTI2C_REG_SLAVE_ISR	0x14
+#define WMTI2C_REG_SLAVE_IMR	0x16
+#define WMTI2C_REG_SLAVE_DR	0x18
+#define WMTI2C_REG_SLAVE_TR	0x1A
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
+#define wmt_i2c viai2c
+
+static u32 wmt_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_NOSTART;
+}
+
+static const struct i2c_algorithm wmt_i2c_algo = {
+	.master_xfer	= viai2c_xfer,
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
+	writew(0, base + VIAI2C_REG_CR);
+	writew(WMTI2C_MCR_APB_166M, base + VIAI2C_REG_MCR);
+	writew(VIAI2C_ISR_MASK_ALL, base + VIAI2C_REG_ISR);
+	writew(VIAI2C_IMR_ENABLE_ALL, base + VIAI2C_REG_IMR);
+	writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
+	readw(base + VIAI2C_REG_CSR);		/* read clear */
+	writew(VIAI2C_ISR_MASK_ALL, base + VIAI2C_REG_ISR);
+
+	if (i2c->tcr == VIAI2C_TCR_FAST)
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS,
+				base + VIAI2C_REG_TR);
+	else
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD,
+				base + VIAI2C_REG_TR);
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
+	err = viai2c_init(pdev, &i2c);
+	if (err)
+		return err;
+
+	i2c->platform = VIAI2C_PLAT_WMT;
+
+	i2c->clk = of_clk_get(np, 0);
+	if (IS_ERR(i2c->clk)) {
+		dev_err(&pdev->dev, "unable to request clock\n");
+		return PTR_ERR(i2c->clk);
+	}
+
+	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
+	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
+		i2c->tcr = VIAI2C_TCR_FAST;
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
+	return devm_i2c_add_adapter(&pdev->dev, &i2c->adapter);
+}
+
+static const struct of_device_id wmt_i2c_dt_ids[] = {
+	{ .compatible = "wm,wm8505-i2c" },
+	{ /* Sentinel */ },
+};
+
+static struct platform_driver wmt_i2c_driver = {
+	.probe		= wmt_i2c_probe,
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
index 3dea153c62aa..000000000000
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
-int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c)
-{
-	int err;
-	int irq_flags;
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
-	if (np) {
-		irq_flags = 0;
-		i2c->irq = irq_of_parse_and_map(np, 0);
-		if (!i2c->irq)
-			return -EINVAL;
-	} else {
-		irq_flags = IRQF_SHARED;
-		i2c->irq = platform_get_irq(pdev, 0);
-		if (i2c->irq < 0)
-			return i2c->irq;
-	}
-
-	err = devm_request_irq(&pdev->dev, i2c->irq, wmt_i2c_isr,
-					irq_flags, pdev->name, i2c);
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
-		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS,
-				base + WMTI2C_REG_TR);
-	else
-		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD,
-				base + WMTI2C_REG_TR);
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
-	return devm_i2c_add_adapter(&pdev->dev, &i2c->adapter);
-}
-
-static const struct of_device_id wmt_i2c_dt_ids[] = {
-	{ .compatible = "wm,wm8505-i2c" },
-	{ /* Sentinel */ },
-};
-
-static struct platform_driver wmt_i2c_driver = {
-	.probe		= wmt_i2c_probe,
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

