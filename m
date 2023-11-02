Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10307DEB0A
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 03:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348190AbjKBCyO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 22:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348186AbjKBCyN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 22:54:13 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8895D12B
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 19:54:09 -0700 (PDT)
X-ASG-Debug-ID: 1698893646-1eb14e538d03ae0001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id ZcJhODkvCPA2OEjV (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 02 Nov 2023 10:54:06 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 2 Nov
 2023 10:54:06 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 2 Nov 2023 10:54:05 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>
Subject: [PATCH v3 08/12] i2c: wmt: rename marcos with prefix WMTI2C_
Date:   Thu, 2 Nov 2023 10:53:58 +0800
X-ASG-Orig-Subj: [PATCH v3 08/12] i2c: wmt: rename marcos with prefix WMTI2C_
Message-ID: <248fe879a97e16c58b9d6e24b44cd51c4b9a82df.1698889581.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1698893646
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 10537
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.116192
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

Tweaked a few formatting things: rename marcos with prefix WMTI2C_

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-wmt.c | 174 +++++++++++++++++------------------
 1 file changed, 87 insertions(+), 87 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index b2fb2e7e4f0d..ec9e4bfc52b0 100644
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
 
@@ -344,18 +344,18 @@ static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
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
@@ -380,7 +380,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 
 	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
 	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
-		i2c_dev->tcr = TCR_FAST_MODE;
+		i2c_dev->tcr = WMTI2C_TCR_FAST_MODE;
 
 	adap = &i2c_dev->adapter;
 	i2c_set_adapdata(adap, i2c_dev);
-- 
2.34.1

