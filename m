Return-Path: <linux-i2c+bounces-1058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F0781FD34
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 07:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5E31C20CBC
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 06:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2151A6101;
	Fri, 29 Dec 2023 06:30:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE5A5688
	for <linux-i2c@vger.kernel.org>; Fri, 29 Dec 2023 06:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703831441-1eb14e0c7d09100001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id 9WuB4t8D6Vp7VGzt (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 29 Dec 2023 14:30:41 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Dec
 2023 14:30:41 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 29 Dec 2023 14:30:40 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <cobechen@zhaoxin.com>, <hanshu-oc@zhaoxin.com>
Subject: [PATCH v6 2/8] i2c: wmt: rename marcos with prefix WMTI2C_
Date: Fri, 29 Dec 2023 14:30:33 +0800
X-ASG-Orig-Subj: [PATCH v6 2/8] i2c: wmt: rename marcos with prefix WMTI2C_
Message-ID: <75978a2c47f17bf6871b92803e9c075e52aed1b6.1703830854.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1703831441
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 10901
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118704
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Tweaked a few formatting things: rename marcos with prefix WMTI2C_

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-wmt.c | 176 +++++++++++++++++------------------
 1 file changed, 88 insertions(+), 88 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index f1888f100d83..95d739fde34f 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -20,59 +20,59 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
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
+#define WMTI2C_REG_CR		0x00
+#define WMTI2C_REG_TCR		0x02
+#define WMTI2C_REG_CSR		0x04
+#define WMTI2C_REG_ISR		0x06
+#define WMTI2C_REG_IMR		0x08
+#define WMTI2C_REG_CDR		0x0A
+#define WMTI2C_REG_TR		0x0C
+#define WMTI2C_REG_MCR		0x0E
+#define WMTI2C_REG_SLAVE_CR	0x10
+#define WMTI2C_REG_SLAVE_SR	0x12
+#define WMTI2C_REG_SLAVE_ISR	0x14
+#define WMTI2C_REG_SLAVE_IMR	0x16
+#define WMTI2C_REG_SLAVE_DR	0x18
+#define WMTI2C_REG_SLAVE_TR	0x1A
 
 /* REG_CR Bit fields */
-#define CR_TX_NEXT_ACK		0x0000
-#define CR_ENABLE		0x0001
-#define CR_TX_NEXT_NO_ACK	0x0002
-#define CR_TX_END		0x0004
-#define CR_CPU_RDY		0x0008
-#define SLAV_MODE_SEL		0x8000
+#define WMTI2C_CR_TX_NEXT_ACK		0x0000
+#define WMTI2C_CR_ENABLE		0x0001
+#define WMTI2C_CR_TX_NEXT_NO_ACK	0x0002
+#define WMTI2C_CR_TX_END		0x0004
+#define WMTI2C_CR_CPU_RDY		0x0008
+#define WMTI2C_SLAV_MODE_SEL		0x8000
 
 /* REG_TCR Bit fields */
-#define TCR_STANDARD_MODE	0x0000
-#define TCR_MASTER_WRITE	0x0000
-#define TCR_HS_MODE		0x2000
-#define TCR_MASTER_READ		0x4000
-#define TCR_FAST_MODE		0x8000
-#define TCR_SLAVE_ADDR_MASK	0x007F
+#define WMTI2C_TCR_STANDARD_MODE	0x0000
+#define WMTI2C_TCR_MASTER_WRITE		0x0000
+#define WMTI2C_TCR_HS_MODE		0x2000
+#define WMTI2C_TCR_MASTER_READ		0x4000
+#define WMTI2C_TCR_FAST_MODE		0x8000
+#define WMTI2C_TCR_SLAVE_ADDR_MASK	0x007F
 
 /* REG_ISR Bit fields */
-#define ISR_NACK_ADDR		0x0001
-#define ISR_BYTE_END		0x0002
-#define ISR_SCL_TIMEOUT		0x0004
-#define ISR_WRITE_ALL		0x0007
+#define WMTI2C_ISR_NACK_ADDR		0x0001
+#define WMTI2C_ISR_BYTE_END		0x0002
+#define WMTI2C_ISR_SCL_TIMEOUT		0x0004
+#define WMTI2C_ISR_WRITE_ALL		0x0007
 
 /* REG_IMR Bit fields */
-#define IMR_ENABLE_ALL		0x0007
+#define WMTI2C_IMR_ENABLE_ALL		0x0007
 
 /* REG_CSR Bit fields */
-#define CSR_RCV_NOT_ACK		0x0001
-#define CSR_RCV_ACK_MASK	0x0001
-#define CSR_READY_MASK		0x0002
+#define WMTI2C_CSR_RCV_NOT_ACK		0x0001
+#define WMTI2C_CSR_RCV_ACK_MASK		0x0001
+#define WMTI2C_CSR_READY_MASK		0x0002
 
 /* REG_TR */
-#define SCL_TIMEOUT(x)		(((x) & 0xFF) << 8)
-#define TR_STD			0x0064
-#define TR_HS			0x0019
+#define WMTI2C_SCL_TIMEOUT(x)		(((x) & 0xFF) << 8)
+#define WMTI2C_TR_STD			0x0064
+#define WMTI2C_TR_HS			0x0019
 
 /* REG_MCR */
-#define MCR_APB_96M		7
-#define MCR_APB_166M		12
+#define WMTI2C_MCR_APB_96M		7
+#define WMTI2C_MCR_APB_166M		12
 
 #define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
 
@@ -92,7 +92,7 @@ static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev)
 	unsigned long timeout;
 
 	timeout = jiffies + WMT_I2C_TIMEOUT;
-	while (!(readw(i2c_dev->base + REG_CSR) & CSR_READY_MASK)) {
+	while (!(readw(i2c_dev->base + WMTI2C_REG_CSR) & WMTI2C_CSR_READY_MASK)) {
 		if (time_after(jiffies, timeout)) {
 			dev_warn(i2c_dev->dev, "timeout waiting for bus ready\n");
 			return -EBUSY;
@@ -113,10 +113,10 @@ static int wmt_check_status(struct wmt_i2c_dev *i2c_dev)
 	if (!wait_result)
 		return -ETIMEDOUT;
 
-	if (i2c_dev->cmd_status & ISR_NACK_ADDR)
+	if (i2c_dev->cmd_status & WMTI2C_ISR_NACK_ADDR)
 		ret = -EIO;
 
-	if (i2c_dev->cmd_status & ISR_SCL_TIMEOUT)
+	if (i2c_dev->cmd_status & WMTI2C_ISR_SCL_TIMEOUT)
 		ret = -ETIMEDOUT;
 
 	return ret;
@@ -135,28 +135,28 @@ static int wmt_i2c_write(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg,
 		 * start at -1 and break out early from the loop
 		 */
 		xfer_len = -1;
-		writew(0, i2c_dev->base + REG_CDR);
+		writew(0, i2c_dev->base + WMTI2C_REG_CDR);
 	} else {
-		writew(pmsg->buf[0] & 0xFF, i2c_dev->base + REG_CDR);
+		writew(pmsg->buf[0] & 0xFF, i2c_dev->base + WMTI2C_REG_CDR);
 	}
 
 	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		val = readw(i2c_dev->base + REG_CR);
-		val &= ~CR_TX_END;
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
+		val = readw(i2c_dev->base + WMTI2C_REG_CR);
+		val &= ~WMTI2C_CR_TX_END;
+		val |= WMTI2C_CR_CPU_RDY;
+		writew(val, i2c_dev->base + WMTI2C_REG_CR);
 	}
 
 	reinit_completion(&i2c_dev->complete);
 
-	tcr_val |= (TCR_MASTER_WRITE | (pmsg->addr & TCR_SLAVE_ADDR_MASK));
+	tcr_val |= (WMTI2C_TCR_MASTER_WRITE | (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK));
 
-	writew(tcr_val, i2c_dev->base + REG_TCR);
+	writew(tcr_val, i2c_dev->base + WMTI2C_REG_TCR);
 
 	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(i2c_dev->base + REG_CR);
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
+		val = readw(i2c_dev->base + WMTI2C_REG_CR);
+		val |= WMTI2C_CR_CPU_RDY;
+		writew(val, i2c_dev->base + WMTI2C_REG_CR);
 	}
 
 	while (xfer_len < pmsg->len) {
@@ -166,25 +166,25 @@ static int wmt_i2c_write(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg,
 
 		xfer_len++;
 
-		val = readw(i2c_dev->base + REG_CSR);
-		if ((val & CSR_RCV_ACK_MASK) == CSR_RCV_NOT_ACK) {
+		val = readw(i2c_dev->base + WMTI2C_REG_CSR);
+		if ((val & WMTI2C_CSR_RCV_ACK_MASK) == WMTI2C_CSR_RCV_NOT_ACK) {
 			dev_dbg(i2c_dev->dev, "write RCV NACK error\n");
 			return -EIO;
 		}
 
 		if (pmsg->len == 0) {
-			val = CR_TX_END | CR_CPU_RDY | CR_ENABLE;
-			writew(val, i2c_dev->base + REG_CR);
+			val = WMTI2C_CR_TX_END | WMTI2C_CR_CPU_RDY | WMTI2C_CR_ENABLE;
+			writew(val, i2c_dev->base + WMTI2C_REG_CR);
 			break;
 		}
 
 		if (xfer_len == pmsg->len) {
 			if (last != 1)
-				writew(CR_ENABLE, i2c_dev->base + REG_CR);
+				writew(WMTI2C_CR_ENABLE, i2c_dev->base + WMTI2C_REG_CR);
 		} else {
 			writew(pmsg->buf[xfer_len] & 0xFF, i2c_dev->base +
-								REG_CDR);
-			writew(CR_CPU_RDY | CR_ENABLE, i2c_dev->base + REG_CR);
+								WMTI2C_REG_CDR);
+			writew(WMTI2C_CR_CPU_RDY | WMTI2C_CR_ENABLE, i2c_dev->base + WMTI2C_REG_CR);
 		}
 	}
 
@@ -197,27 +197,27 @@ static int wmt_i2c_read(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg)
 	int ret;
 	u32 xfer_len = 0;
 
-	val = readw(i2c_dev->base + REG_CR);
-	val &= ~(CR_TX_END | CR_TX_NEXT_NO_ACK);
+	val = readw(i2c_dev->base + WMTI2C_REG_CR);
+	val &= ~(WMTI2C_CR_TX_END | WMTI2C_CR_TX_NEXT_NO_ACK);
 
 	if (!(pmsg->flags & I2C_M_NOSTART))
-		val |= CR_CPU_RDY;
+		val |= WMTI2C_CR_CPU_RDY;
 
 	if (pmsg->len == 1)
-		val |= CR_TX_NEXT_NO_ACK;
+		val |= WMTI2C_CR_TX_NEXT_NO_ACK;
 
-	writew(val, i2c_dev->base + REG_CR);
+	writew(val, i2c_dev->base + WMTI2C_REG_CR);
 
 	reinit_completion(&i2c_dev->complete);
 
-	tcr_val |= TCR_MASTER_READ | (pmsg->addr & TCR_SLAVE_ADDR_MASK);
+	tcr_val |= WMTI2C_TCR_MASTER_READ | (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK);
 
-	writew(tcr_val, i2c_dev->base + REG_TCR);
+	writew(tcr_val, i2c_dev->base + WMTI2C_REG_TCR);
 
 	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(i2c_dev->base + REG_CR);
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
+		val = readw(i2c_dev->base + WMTI2C_REG_CR);
+		val |= WMTI2C_CR_CPU_RDY;
+		writew(val, i2c_dev->base + WMTI2C_REG_CR);
 	}
 
 	while (xfer_len < pmsg->len) {
@@ -225,13 +225,13 @@ static int wmt_i2c_read(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg)
 		if (ret)
 			return ret;
 
-		pmsg->buf[xfer_len] = readw(i2c_dev->base + REG_CDR) >> 8;
+		pmsg->buf[xfer_len] = readw(i2c_dev->base + WMTI2C_REG_CDR) >> 8;
 		xfer_len++;
 
-		val = readw(i2c_dev->base + REG_CR) | CR_CPU_RDY;
+		val = readw(i2c_dev->base + WMTI2C_REG_CR) | WMTI2C_CR_CPU_RDY;
 		if (xfer_len == pmsg->len - 1)
-			val |= CR_TX_NEXT_NO_ACK;
-		writew(val, i2c_dev->base + REG_CR);
+			val |= WMTI2C_CR_TX_NEXT_NO_ACK;
+		writew(val, i2c_dev->base + WMTI2C_REG_CR);
 	}
 
 	return 0;
@@ -278,8 +278,8 @@ static irqreturn_t wmt_i2c_isr(int irq, void *data)
 	struct wmt_i2c_dev *i2c_dev = data;
 
 	/* save the status and write-clear it */
-	i2c_dev->cmd_status = readw(i2c_dev->base + REG_ISR);
-	writew(i2c_dev->cmd_status, i2c_dev->base + REG_ISR);
+	i2c_dev->cmd_status = readw(i2c_dev->base + WMTI2C_REG_ISR);
+	writew(i2c_dev->cmd_status, i2c_dev->base + WMTI2C_REG_ISR);
 
 	complete(&i2c_dev->complete);
 
@@ -335,18 +335,18 @@ static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
 		return err;
 	}
 
-	writew(0, i2c_dev->base + REG_CR);
-	writew(MCR_APB_166M, i2c_dev->base + REG_MCR);
-	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
-	writew(IMR_ENABLE_ALL, i2c_dev->base + REG_IMR);
-	writew(CR_ENABLE, i2c_dev->base + REG_CR);
-	readw(i2c_dev->base + REG_CSR);		/* read clear */
-	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
+	writew(0, i2c_dev->base + WMTI2C_REG_CR);
+	writew(WMTI2C_MCR_APB_166M, i2c_dev->base + WMTI2C_REG_MCR);
+	writew(WMTI2C_ISR_WRITE_ALL, i2c_dev->base + WMTI2C_REG_ISR);
+	writew(WMTI2C_IMR_ENABLE_ALL, i2c_dev->base + WMTI2C_REG_IMR);
+	writew(WMTI2C_CR_ENABLE, i2c_dev->base + WMTI2C_REG_CR);
+	readw(i2c_dev->base + WMTI2C_REG_CSR);		/* read clear */
+	writew(WMTI2C_ISR_WRITE_ALL, i2c_dev->base + WMTI2C_REG_ISR);
 
-	if (i2c_dev->tcr == TCR_FAST_MODE)
-		writew(SCL_TIMEOUT(128) | TR_HS, i2c_dev->base + REG_TR);
+	if (i2c_dev->tcr == WMTI2C_TCR_FAST_MODE)
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS, i2c_dev->base + WMTI2C_REG_TR);
 	else
-		writew(SCL_TIMEOUT(128) | TR_STD, i2c_dev->base + REG_TR);
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD, i2c_dev->base + WMTI2C_REG_TR);
 
 	return 0;
 }
@@ -371,7 +371,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 
 	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
 	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
-		i2c_dev->tcr = TCR_FAST_MODE;
+		i2c_dev->tcr = WMTI2C_TCR_FAST_MODE;
 
 	adap = &i2c_dev->adapter;
 	i2c_set_adapdata(adap, i2c_dev);
@@ -395,7 +395,7 @@ static void wmt_i2c_remove(struct platform_device *pdev)
 	struct wmt_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	/* Disable interrupts, clock and delete adapter */
-	writew(0, i2c_dev->base + REG_IMR);
+	writew(0, i2c_dev->base + WMTI2C_REG_IMR);
 	clk_disable_unprepare(i2c_dev->clk);
 	i2c_del_adapter(&i2c_dev->adapter);
 }
-- 
2.34.1


