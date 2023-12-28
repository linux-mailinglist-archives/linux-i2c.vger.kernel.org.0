Return-Path: <linux-i2c+bounces-1032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DDF81F44F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 04:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC421C216BF
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 03:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E3D4409;
	Thu, 28 Dec 2023 03:17:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF743C16
	for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 03:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703733469-1eb14e0c7e06b50002-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id 1Rg8FPJqDa6Y98hh (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 28 Dec 2023 11:17:49 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Dec
 2023 11:17:49 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 28 Dec 2023 11:17:48 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <cobechen@zhaoxin.com>, <hanshu-oc@zhaoxin.com>
Subject: [PATCH v5 5/8] i2c: wmt: rename with prefix VIAI2C_ and viai2c_
Date: Thu, 28 Dec 2023 11:17:43 +0800
X-ASG-Orig-Subj: [PATCH v5 5/8] i2c: wmt: rename with prefix VIAI2C_ and viai2c_
Message-ID: <97b910b812f9e5e720f45fa776384f63c4f8da5c.1703733126.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Scan-Msg-Size: 14082
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118654
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Since the I2C IP of both wmt and zhaoxin come from VIA.
So, rename common register, function and variable's name
to VIAI2C_ and viai2c_.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 118 ++++++++++++-------------
 drivers/i2c/busses/i2c-viai2c-common.h |  60 ++++++-------
 drivers/i2c/busses/i2c-wmt-plt.c       |  30 ++++---
 3 files changed, 105 insertions(+), 103 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 76058d6853a7..60a4d4ccaf12 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -2,15 +2,15 @@
 #include <linux/of_irq.h>
 #include "i2c-viai2c-common.h"
 
-#define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
+#define VIAI2C_TIMEOUT		(msecs_to_jiffies(1000))
 
-static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c *i2c)
+static int viai2c_wait_bus_ready(struct viai2c *i2c)
 {
 	unsigned long timeout;
 	void __iomem *base = i2c->base;
 
-	timeout = jiffies + WMT_I2C_TIMEOUT;
-	while (!(readw(base + WMTI2C_REG_CSR) & WMTI2C_CSR_READY_MASK)) {
+	timeout = jiffies + VIAI2C_TIMEOUT;
+	while (!(readw(base + VIAI2C_REG_CSR) & VIAI2C_CSR_READY_MASK)) {
 		if (time_after(jiffies, timeout)) {
 			dev_warn(i2c->dev,
 					"timeout waiting for bus ready\n");
@@ -22,7 +22,7 @@ static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c *i2c)
 	return 0;
 }
 
-static int wmt_check_status(struct wmt_i2c *i2c)
+static int viai2c_wait_status(struct viai2c *i2c)
 {
 	int ret = 0;
 	unsigned long wait_result;
@@ -32,29 +32,29 @@ static int wmt_check_status(struct wmt_i2c *i2c)
 	if (!wait_result)
 		return -ETIMEDOUT;
 
-	if (i2c->cmd_status & WMTI2C_ISR_NACK_ADDR)
+	if (i2c->cmd_status & VIAI2C_ISR_NACK_ADDR)
 		ret = -EIO;
 
-	if (i2c->cmd_status & WMTI2C_ISR_SCL_TIMEOUT)
+	if (i2c->cmd_status & VIAI2C_ISR_SCL_TIMEOUT)
 		ret = -ETIMEDOUT;
 
 	return ret;
 }
 
-static irqreturn_t wmt_i2c_isr(int irq, void *data)
+static irqreturn_t viai2c_isr(int irq, void *data)
 {
-	struct wmt_i2c *i2c = data;
+	struct viai2c *i2c = data;
 
 	/* save the status and write-clear it */
-	i2c->cmd_status = readw(i2c->base + WMTI2C_REG_ISR);
-	writew(i2c->cmd_status, i2c->base + WMTI2C_REG_ISR);
+	i2c->cmd_status = readw(i2c->base + VIAI2C_REG_ISR);
+	writew(i2c->cmd_status, i2c->base + VIAI2C_REG_ISR);
 
 	complete(&i2c->complete);
 
 	return IRQ_HANDLED;
 }
 
-static int wmt_i2c_write(struct wmt_i2c *i2c, struct i2c_msg *pmsg,
+static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg,
 			 int last)
 {
 	u16 val, tcr_val = i2c->tcr;
@@ -68,143 +68,143 @@ static int wmt_i2c_write(struct wmt_i2c *i2c, struct i2c_msg *pmsg,
 		 * start at -1 and break out early from the loop
 		 */
 		xfer_len = -1;
-		writew(0, base + WMTI2C_REG_CDR);
+		writew(0, base + VIAI2C_REG_CDR);
 	} else {
-		writew(pmsg->buf[0] & 0xFF, base + WMTI2C_REG_CDR);
+		writew(pmsg->buf[0] & 0xFF, base + VIAI2C_REG_CDR);
 	}
 
 	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		val = readw(base + WMTI2C_REG_CR);
-		val &= ~WMTI2C_CR_TX_END;
-		val |= WMTI2C_CR_CPU_RDY;
-		writew(val, base + WMTI2C_REG_CR);
+		val = readw(base + VIAI2C_REG_CR);
+		val &= ~VIAI2C_CR_TX_END;
+		val |= VIAI2C_CR_CPU_RDY;
+		writew(val, base + VIAI2C_REG_CR);
 	}
 
 	reinit_completion(&i2c->complete);
 
-	tcr_val |= (WMTI2C_TCR_MASTER_WRITE
-		| (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK));
+	tcr_val |= (VIAI2C_TCR_MASTER_WRITE
+		| (pmsg->addr & VIAI2C_TCR_SLAVE_ADDR_MASK));
 
-	writew(tcr_val, base + WMTI2C_REG_TCR);
+	writew(tcr_val, base + VIAI2C_REG_TCR);
 
 	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(base + WMTI2C_REG_CR);
-		val |= WMTI2C_CR_CPU_RDY;
-		writew(val, base + WMTI2C_REG_CR);
+		val = readw(base + VIAI2C_REG_CR);
+		val |= VIAI2C_CR_CPU_RDY;
+		writew(val, base + VIAI2C_REG_CR);
 	}
 
 	while (xfer_len < pmsg->len) {
-		ret = wmt_check_status(i2c);
+		ret = viai2c_wait_status(i2c);
 		if (ret)
 			return ret;
 
 		xfer_len++;
 
-		val = readw(base + WMTI2C_REG_CSR);
-		if (val & WMTI2C_CSR_RCV_NOT_ACK) {
+		val = readw(base + VIAI2C_REG_CSR);
+		if (val & VIAI2C_CSR_RCV_NOT_ACK) {
 			dev_dbg(i2c->dev, "write RCV NACK error\n");
 			return -EIO;
 		}
 
 		if (pmsg->len == 0) {
-			val = WMTI2C_CR_TX_END | WMTI2C_CR_CPU_RDY
-				| WMTI2C_CR_ENABLE;
-			writew(val, base + WMTI2C_REG_CR);
+			val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY
+				| VIAI2C_CR_ENABLE;
+			writew(val, base + VIAI2C_REG_CR);
 			break;
 		}
 
 		if (xfer_len == pmsg->len) {
 			if (last != 1)
-				writew(WMTI2C_CR_ENABLE, base + WMTI2C_REG_CR);
+				writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
 		} else {
 			writew(pmsg->buf[xfer_len] & 0xFF,
-					base + WMTI2C_REG_CDR);
-			writew(WMTI2C_CR_CPU_RDY | WMTI2C_CR_ENABLE,
-					base + WMTI2C_REG_CR);
+					base + VIAI2C_REG_CDR);
+			writew(VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE,
+					base + VIAI2C_REG_CR);
 		}
 	}
 
 	return 0;
 }
 
-static int wmt_i2c_read(struct wmt_i2c *i2c, struct i2c_msg *pmsg)
+static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 {
 	u16 val, tcr_val = i2c->tcr;
 	int ret;
 	u32 xfer_len = 0;
 	void __iomem *base = i2c->base;
 
-	val = readw(base + WMTI2C_REG_CR);
-	val &= ~(WMTI2C_CR_TX_END | WMTI2C_CR_TX_NEXT_NO_ACK);
+	val = readw(base + VIAI2C_REG_CR);
+	val &= ~(VIAI2C_CR_TX_END | VIAI2C_CR_RX_END);
 
 	if (!(pmsg->flags & I2C_M_NOSTART))
-		val |= WMTI2C_CR_CPU_RDY;
+		val |= VIAI2C_CR_CPU_RDY;
 
 	if (pmsg->len == 1)
-		val |= WMTI2C_CR_TX_NEXT_NO_ACK;
+		val |= VIAI2C_CR_RX_END;
 
-	writew(val, base + WMTI2C_REG_CR);
+	writew(val, base + VIAI2C_REG_CR);
 
 	reinit_completion(&i2c->complete);
 
-	tcr_val |= WMTI2C_TCR_MASTER_READ
-		| (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK);
+	tcr_val |= VIAI2C_TCR_MASTER_READ
+		| (pmsg->addr & VIAI2C_TCR_SLAVE_ADDR_MASK);
 
-	writew(tcr_val, base + WMTI2C_REG_TCR);
+	writew(tcr_val, base + VIAI2C_REG_TCR);
 
 	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(base + WMTI2C_REG_CR);
-		val |= WMTI2C_CR_CPU_RDY;
-		writew(val, base + WMTI2C_REG_CR);
+		val = readw(base + VIAI2C_REG_CR);
+		val |= VIAI2C_CR_CPU_RDY;
+		writew(val, base + VIAI2C_REG_CR);
 	}
 
 	while (xfer_len < pmsg->len) {
-		ret = wmt_check_status(i2c);
+		ret = viai2c_wait_status(i2c);
 		if (ret)
 			return ret;
 
-		pmsg->buf[xfer_len] = readw(base + WMTI2C_REG_CDR) >> 8;
+		pmsg->buf[xfer_len] = readw(base + VIAI2C_REG_CDR) >> 8;
 		xfer_len++;
 
-		val = readw(base + WMTI2C_REG_CR) | WMTI2C_CR_CPU_RDY;
+		val = readw(base + VIAI2C_REG_CR) | VIAI2C_CR_CPU_RDY;
 		if (xfer_len == pmsg->len - 1)
-			val |= WMTI2C_CR_TX_NEXT_NO_ACK;
-		writew(val, base + WMTI2C_REG_CR);
+			val |= VIAI2C_CR_RX_END;
+		writew(val, base + VIAI2C_REG_CR);
 	}
 
 	return 0;
 }
 
-int wmt_i2c_xfer(struct i2c_adapter *adap,
+int viai2c_xfer(struct i2c_adapter *adap,
 			struct i2c_msg msgs[],
 			int num)
 {
 	struct i2c_msg *pmsg;
 	int i;
 	int ret = 0;
-	struct wmt_i2c *i2c = i2c_get_adapdata(adap);
+	struct viai2c *i2c = i2c_get_adapdata(adap);
 
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 		if (!(pmsg->flags & I2C_M_NOSTART)) {
-			ret = wmt_i2c_wait_bus_not_busy(i2c);
+			ret = viai2c_wait_bus_ready(i2c);
 			if (ret < 0)
 				return ret;
 		}
 
 		if (pmsg->flags & I2C_M_RD)
-			ret = wmt_i2c_read(i2c, pmsg);
+			ret = viai2c_read(i2c, pmsg);
 		else
-			ret = wmt_i2c_write(i2c, pmsg, (i + 1) == num);
+			ret = viai2c_write(i2c, pmsg, (i + 1) == num);
 	}
 
 	return (ret < 0) ? ret : i;
 }
 
-int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c)
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
 {
 	int err;
-	struct wmt_i2c *i2c;
+	struct viai2c *i2c;
 	struct device_node *np = pdev->dev.of_node;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
@@ -219,7 +219,7 @@ int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c)
 	if (!i2c->irq)
 		return -EINVAL;
 
-	err = devm_request_irq(&pdev->dev, i2c->irq, wmt_i2c_isr,
+	err = devm_request_irq(&pdev->dev, i2c->irq, viai2c_isr,
 					0, pdev->name, i2c);
 	if (err)
 		return dev_err_probe(&pdev->dev, err,
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index e57da0dc68a5..f171f81e4d0f 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -12,44 +12,44 @@
 #include <linux/platform_device.h>
 
 /* REG_CR Bit fields */
-#define WMTI2C_REG_CR		0x00
-#define WMTI2C_CR_TX_NEXT_ACK		0x0000
-#define WMTI2C_CR_ENABLE		0x0001
-#define WMTI2C_CR_TX_NEXT_NO_ACK	0x0002
-#define WMTI2C_CR_TX_END		0x0004
-#define WMTI2C_CR_CPU_RDY		0x0008
+#define VIAI2C_REG_CR		0x00
+#define VIAI2C_CR_ENABLE		BIT(0)
+#define VIAI2C_CR_RX_END		BIT(1)
+#define VIAI2C_CR_TX_END		BIT(2)
+#define VIAI2C_CR_CPU_RDY		BIT(3)
+#define VIAI2C_CR_END_MASK		GENMASK(2, 1)
 
 /* REG_TCR Bit fields */
-#define WMTI2C_REG_TCR		0x02
-#define WMTI2C_TCR_STANDARD_MODE	0x0000
-#define WMTI2C_TCR_MASTER_WRITE		0x0000
-#define WMTI2C_TCR_HS_MODE		0x2000
-#define WMTI2C_TCR_MASTER_READ		0x4000
-#define WMTI2C_TCR_FAST_MODE		0x8000
-#define WMTI2C_TCR_SLAVE_ADDR_MASK	0x007F
+#define VIAI2C_REG_TCR		0x02
+#define VIAI2C_TCR_MASTER_WRITE		0x0000
+#define VIAI2C_TCR_HS_MODE		BIT(13)
+#define VIAI2C_TCR_MASTER_READ		BIT(14)
+#define VIAI2C_TCR_FAST			BIT(15)
+#define VIAI2C_TCR_SLAVE_ADDR_MASK	GENMASK(6, 0)
 
 /* REG_CSR Bit fields */
-#define WMTI2C_REG_CSR		0x04
-#define WMTI2C_CSR_RCV_NOT_ACK		0x0001
-#define WMTI2C_CSR_RCV_ACK_MASK		0x0001
-#define WMTI2C_CSR_READY_MASK		0x0002
+#define VIAI2C_REG_CSR		0x04
+#define VIAI2C_CSR_RCV_NOT_ACK		BIT(0)
+#define VIAI2C_CSR_RCV_ACK_MASK		BIT(0)
+#define VIAI2C_CSR_READY_MASK		BIT(1)
 
 /* REG_ISR Bit fields */
-#define WMTI2C_REG_ISR		0x06
-#define WMTI2C_ISR_NACK_ADDR		0x0001
-#define WMTI2C_ISR_BYTE_END		0x0002
-#define WMTI2C_ISR_SCL_TIMEOUT		0x0004
-#define WMTI2C_ISR_WRITE_ALL		0x0007
+#define VIAI2C_REG_ISR		0x06
+#define VIAI2C_ISR_NACK_ADDR		BIT(0)
+#define VIAI2C_ISR_BYTE_END		BIT(1)
+#define VIAI2C_ISR_SCL_TIMEOUT		BIT(2)
+#define VIAI2C_ISR_MASK_ALL		GENMASK(2, 0)
 
 /* REG_IMR Bit fields */
-#define WMTI2C_REG_IMR		0x08
-#define WMTI2C_IMR_ENABLE_ALL		0x0007
+#define VIAI2C_REG_IMR		0x08
+#define VIAI2C_IMR_BYTE			BIT(1)
+#define VIAI2C_IMR_ENABLE_ALL		GENMASK(2, 0)
 
-#define WMTI2C_REG_CDR		0x0A
-#define WMTI2C_REG_TR		0x0C
-#define WMTI2C_REG_MCR		0x0E
+#define VIAI2C_REG_CDR		0x0A
+#define VIAI2C_REG_TR		0x0C
+#define VIAI2C_REG_MCR		0x0E
 
-struct wmt_i2c {
+struct viai2c {
 	struct i2c_adapter	adapter;
 	struct completion	complete;
 	struct device		*dev;
@@ -60,7 +60,7 @@ struct wmt_i2c {
 	u16			cmd_status;
 };
 
-int wmt_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
-int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c);
+int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c);
 
 #endif
diff --git a/drivers/i2c/busses/i2c-wmt-plt.c b/drivers/i2c/busses/i2c-wmt-plt.c
index e0ffccf8a40a..8f506888cff7 100644
--- a/drivers/i2c/busses/i2c-wmt-plt.c
+++ b/drivers/i2c/busses/i2c-wmt-plt.c
@@ -22,13 +22,15 @@
 #define WMTI2C_MCR_APB_96M		7
 #define WMTI2C_MCR_APB_166M		12
 
+#define wmt_i2c				viai2c
+
 static u32 wmt_i2c_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_NOSTART;
 }
 
 static const struct i2c_algorithm wmt_i2c_algo = {
-	.master_xfer	= wmt_i2c_xfer,
+	.master_xfer	= viai2c_xfer,
 	.functionality	= wmt_i2c_func,
 };
 
@@ -50,18 +52,18 @@ static int wmt_i2c_reset_hardware(struct wmt_i2c *i2c)
 		return err;
 	}
 
-	writew(0, base + WMTI2C_REG_CR);
-	writew(WMTI2C_MCR_APB_166M, base + WMTI2C_REG_MCR);
-	writew(WMTI2C_ISR_WRITE_ALL, base + WMTI2C_REG_ISR);
-	writew(WMTI2C_IMR_ENABLE_ALL, base + WMTI2C_REG_IMR);
-	writew(WMTI2C_CR_ENABLE, base + WMTI2C_REG_CR);
-	readw(base + WMTI2C_REG_CSR);		/* read clear */
-	writew(WMTI2C_ISR_WRITE_ALL, base + WMTI2C_REG_ISR);
+	writew(0, base + VIAI2C_REG_CR);
+	writew(WMTI2C_MCR_APB_166M, base + VIAI2C_REG_MCR);
+	writew(VIAI2C_ISR_MASK_ALL, base + VIAI2C_REG_ISR);
+	writew(VIAI2C_IMR_ENABLE_ALL, base + VIAI2C_REG_IMR);
+	writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
+	readw(base + VIAI2C_REG_CSR);		/* read clear */
+	writew(VIAI2C_ISR_MASK_ALL, base + VIAI2C_REG_ISR);
 
-	if (i2c->tcr == WMTI2C_TCR_FAST_MODE)
-		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS, base + WMTI2C_REG_TR);
+	if (i2c->tcr == VIAI2C_TCR_FAST)
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS, base + VIAI2C_REG_TR);
 	else
-		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD, base + WMTI2C_REG_TR);
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD, base + VIAI2C_REG_TR);
 
 	return 0;
 }
@@ -74,7 +76,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	int err;
 	u32 clk_rate;
 
-	err = wmt_i2c_init(pdev, &i2c);
+	err = viai2c_init(pdev, &i2c);
 	if (err)
 		return err;
 
@@ -86,7 +88,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 
 	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
 	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
-		i2c->tcr = WMTI2C_TCR_FAST_MODE;
+		i2c->tcr = VIAI2C_TCR_FAST;
 
 	adap = &i2c->adapter;
 	i2c_set_adapdata(adap, i2c);
@@ -110,7 +112,7 @@ static void wmt_i2c_remove(struct platform_device *pdev)
 	struct wmt_i2c *i2c = platform_get_drvdata(pdev);
 
 	/* Disable interrupts, clock and delete adapter */
-	writew(0, i2c->base + WMTI2C_REG_IMR);
+	writew(0, i2c->base + VIAI2C_REG_IMR);
 	clk_disable_unprepare(i2c->clk);
 	i2c_del_adapter(&i2c->adapter);
 }
-- 
2.34.1


