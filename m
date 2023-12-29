Return-Path: <linux-i2c+bounces-1060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 875B181FD35
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 07:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94BA31C20CE1
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 06:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BEE6135;
	Fri, 29 Dec 2023 06:30:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE34567D
	for <linux-i2c@vger.kernel.org>; Fri, 29 Dec 2023 06:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703831441-1eb14e0c7d09100002-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id sI97ejTWBtLoPyPt (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 29 Dec 2023 14:30:42 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Dec
 2023 14:30:41 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 29 Dec 2023 14:30:41 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <cobechen@zhaoxin.com>, <hanshu-oc@zhaoxin.com>
Subject: [PATCH v6 3/8] i2c: wmt: adjust line length to meet style
Date: Fri, 29 Dec 2023 14:30:34 +0800
X-ASG-Orig-Subj: [PATCH v6 3/8] i2c: wmt: adjust line length to meet style
Message-ID: <c417d693bbdb3a4b804c1c3ba03e57bf4e8c33e1.1703830854.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Scan-Msg-Size: 13761
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118704
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

v4->v5:
	add previous prototype 'static' for wmt_i2c_init().

Tweaked a few formatting things:
rename wmt_i2c_dev to wmt_i2c, i2c_dev to i2c, etc. 

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-wmt.c | 199 ++++++++++++++++++-----------------
 1 file changed, 104 insertions(+), 95 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index 95d739fde34f..76fba4ffa126 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -76,7 +76,7 @@
 
 #define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
 
-struct wmt_i2c_dev {
+struct wmt_i2c {
 	struct i2c_adapter	adapter;
 	struct completion	complete;
 	struct device		*dev;
@@ -87,14 +87,16 @@ struct wmt_i2c_dev {
 	u16			cmd_status;
 };
 
-static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev)
+static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c *i2c)
 {
 	unsigned long timeout;
+	void __iomem *base = i2c->base;
 
 	timeout = jiffies + WMT_I2C_TIMEOUT;
-	while (!(readw(i2c_dev->base + WMTI2C_REG_CSR) & WMTI2C_CSR_READY_MASK)) {
+	while (!(readw(base + WMTI2C_REG_CSR) & WMTI2C_CSR_READY_MASK)) {
 		if (time_after(jiffies, timeout)) {
-			dev_warn(i2c_dev->dev, "timeout waiting for bus ready\n");
+			dev_warn(i2c->dev,
+					"timeout waiting for bus ready\n");
 			return -EBUSY;
 		}
 		msleep(20);
@@ -103,31 +105,32 @@ static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev)
 	return 0;
 }
 
-static int wmt_check_status(struct wmt_i2c_dev *i2c_dev)
+static int wmt_check_status(struct wmt_i2c *i2c)
 {
 	int ret = 0;
 	unsigned long wait_result;
 
-	wait_result = wait_for_completion_timeout(&i2c_dev->complete,
+	wait_result = wait_for_completion_timeout(&i2c->complete,
 						msecs_to_jiffies(500));
 	if (!wait_result)
 		return -ETIMEDOUT;
 
-	if (i2c_dev->cmd_status & WMTI2C_ISR_NACK_ADDR)
+	if (i2c->cmd_status & WMTI2C_ISR_NACK_ADDR)
 		ret = -EIO;
 
-	if (i2c_dev->cmd_status & WMTI2C_ISR_SCL_TIMEOUT)
+	if (i2c->cmd_status & WMTI2C_ISR_SCL_TIMEOUT)
 		ret = -ETIMEDOUT;
 
 	return ret;
 }
 
-static int wmt_i2c_write(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg,
+static int wmt_i2c_write(struct wmt_i2c *i2c, struct i2c_msg *pmsg,
 			 int last)
 {
-	u16 val, tcr_val = i2c_dev->tcr;
+	u16 val, tcr_val = i2c->tcr;
 	int ret;
 	int xfer_len = 0;
+	void __iomem *base = i2c->base;
 
 	if (pmsg->len == 0) {
 		/*
@@ -135,69 +138,73 @@ static int wmt_i2c_write(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg,
 		 * start at -1 and break out early from the loop
 		 */
 		xfer_len = -1;
-		writew(0, i2c_dev->base + WMTI2C_REG_CDR);
+		writew(0, base + WMTI2C_REG_CDR);
 	} else {
-		writew(pmsg->buf[0] & 0xFF, i2c_dev->base + WMTI2C_REG_CDR);
+		writew(pmsg->buf[0] & 0xFF, base + WMTI2C_REG_CDR);
 	}
 
 	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		val = readw(i2c_dev->base + WMTI2C_REG_CR);
+		val = readw(base + WMTI2C_REG_CR);
 		val &= ~WMTI2C_CR_TX_END;
 		val |= WMTI2C_CR_CPU_RDY;
-		writew(val, i2c_dev->base + WMTI2C_REG_CR);
+		writew(val, base + WMTI2C_REG_CR);
 	}
 
-	reinit_completion(&i2c_dev->complete);
+	reinit_completion(&i2c->complete);
 
-	tcr_val |= (WMTI2C_TCR_MASTER_WRITE | (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK));
+	tcr_val |= (WMTI2C_TCR_MASTER_WRITE
+		| (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK));
 
-	writew(tcr_val, i2c_dev->base + WMTI2C_REG_TCR);
+	writew(tcr_val, base + WMTI2C_REG_TCR);
 
 	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(i2c_dev->base + WMTI2C_REG_CR);
+		val = readw(base + WMTI2C_REG_CR);
 		val |= WMTI2C_CR_CPU_RDY;
-		writew(val, i2c_dev->base + WMTI2C_REG_CR);
+		writew(val, base + WMTI2C_REG_CR);
 	}
 
 	while (xfer_len < pmsg->len) {
-		ret = wmt_check_status(i2c_dev);
+		ret = wmt_check_status(i2c);
 		if (ret)
 			return ret;
 
 		xfer_len++;
 
-		val = readw(i2c_dev->base + WMTI2C_REG_CSR);
-		if ((val & WMTI2C_CSR_RCV_ACK_MASK) == WMTI2C_CSR_RCV_NOT_ACK) {
-			dev_dbg(i2c_dev->dev, "write RCV NACK error\n");
+		val = readw(base + WMTI2C_REG_CSR);
+		if (val & WMTI2C_CSR_RCV_NOT_ACK) {
+			dev_dbg(i2c->dev, "write RCV NACK error\n");
 			return -EIO;
 		}
 
 		if (pmsg->len == 0) {
-			val = WMTI2C_CR_TX_END | WMTI2C_CR_CPU_RDY | WMTI2C_CR_ENABLE;
-			writew(val, i2c_dev->base + WMTI2C_REG_CR);
+			val = WMTI2C_CR_TX_END | WMTI2C_CR_CPU_RDY
+				| WMTI2C_CR_ENABLE;
+			writew(val, base + WMTI2C_REG_CR);
 			break;
 		}
 
 		if (xfer_len == pmsg->len) {
 			if (last != 1)
-				writew(WMTI2C_CR_ENABLE, i2c_dev->base + WMTI2C_REG_CR);
+				writew(WMTI2C_CR_ENABLE, base + WMTI2C_REG_CR);
 		} else {
-			writew(pmsg->buf[xfer_len] & 0xFF, i2c_dev->base +
-								WMTI2C_REG_CDR);
-			writew(WMTI2C_CR_CPU_RDY | WMTI2C_CR_ENABLE, i2c_dev->base + WMTI2C_REG_CR);
+			writew(pmsg->buf[xfer_len] & 0xFF,
+					base + WMTI2C_REG_CDR);
+			writew(WMTI2C_CR_CPU_RDY | WMTI2C_CR_ENABLE,
+					base + WMTI2C_REG_CR);
 		}
 	}
 
 	return 0;
 }
 
-static int wmt_i2c_read(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg)
+static int wmt_i2c_read(struct wmt_i2c *i2c, struct i2c_msg *pmsg)
 {
-	u16 val, tcr_val = i2c_dev->tcr;
+	u16 val, tcr_val = i2c->tcr;
 	int ret;
 	u32 xfer_len = 0;
+	void __iomem *base = i2c->base;
 
-	val = readw(i2c_dev->base + WMTI2C_REG_CR);
+	val = readw(base + WMTI2C_REG_CR);
 	val &= ~(WMTI2C_CR_TX_END | WMTI2C_CR_TX_NEXT_NO_ACK);
 
 	if (!(pmsg->flags & I2C_M_NOSTART))
@@ -206,32 +213,33 @@ static int wmt_i2c_read(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg)
 	if (pmsg->len == 1)
 		val |= WMTI2C_CR_TX_NEXT_NO_ACK;
 
-	writew(val, i2c_dev->base + WMTI2C_REG_CR);
+	writew(val, base + WMTI2C_REG_CR);
 
-	reinit_completion(&i2c_dev->complete);
+	reinit_completion(&i2c->complete);
 
-	tcr_val |= WMTI2C_TCR_MASTER_READ | (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK);
+	tcr_val |= WMTI2C_TCR_MASTER_READ
+		| (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK);
 
-	writew(tcr_val, i2c_dev->base + WMTI2C_REG_TCR);
+	writew(tcr_val, base + WMTI2C_REG_TCR);
 
 	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(i2c_dev->base + WMTI2C_REG_CR);
+		val = readw(base + WMTI2C_REG_CR);
 		val |= WMTI2C_CR_CPU_RDY;
-		writew(val, i2c_dev->base + WMTI2C_REG_CR);
+		writew(val, base + WMTI2C_REG_CR);
 	}
 
 	while (xfer_len < pmsg->len) {
-		ret = wmt_check_status(i2c_dev);
+		ret = wmt_check_status(i2c);
 		if (ret)
 			return ret;
 
-		pmsg->buf[xfer_len] = readw(i2c_dev->base + WMTI2C_REG_CDR) >> 8;
+		pmsg->buf[xfer_len] = readw(base + WMTI2C_REG_CDR) >> 8;
 		xfer_len++;
 
-		val = readw(i2c_dev->base + WMTI2C_REG_CR) | WMTI2C_CR_CPU_RDY;
+		val = readw(base + WMTI2C_REG_CR) | WMTI2C_CR_CPU_RDY;
 		if (xfer_len == pmsg->len - 1)
 			val |= WMTI2C_CR_TX_NEXT_NO_ACK;
-		writew(val, i2c_dev->base + WMTI2C_REG_CR);
+		writew(val, base + WMTI2C_REG_CR);
 	}
 
 	return 0;
@@ -244,20 +252,20 @@ static int wmt_i2c_xfer(struct i2c_adapter *adap,
 	struct i2c_msg *pmsg;
 	int i;
 	int ret = 0;
-	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
+	struct wmt_i2c *i2c = i2c_get_adapdata(adap);
 
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 		if (!(pmsg->flags & I2C_M_NOSTART)) {
-			ret = wmt_i2c_wait_bus_not_busy(i2c_dev);
+			ret = wmt_i2c_wait_bus_not_busy(i2c);
 			if (ret < 0)
 				return ret;
 		}
 
 		if (pmsg->flags & I2C_M_RD)
-			ret = wmt_i2c_read(i2c_dev, pmsg);
+			ret = wmt_i2c_read(i2c, pmsg);
 		else
-			ret = wmt_i2c_write(i2c_dev, pmsg, (i + 1) == num);
+			ret = wmt_i2c_write(i2c, pmsg, (i + 1) == num);
 	}
 
 	return (ret < 0) ? ret : i;
@@ -275,78 +283,79 @@ static const struct i2c_algorithm wmt_i2c_algo = {
 
 static irqreturn_t wmt_i2c_isr(int irq, void *data)
 {
-	struct wmt_i2c_dev *i2c_dev = data;
+	struct wmt_i2c *i2c = data;
 
 	/* save the status and write-clear it */
-	i2c_dev->cmd_status = readw(i2c_dev->base + WMTI2C_REG_ISR);
-	writew(i2c_dev->cmd_status, i2c_dev->base + WMTI2C_REG_ISR);
+	i2c->cmd_status = readw(i2c->base + WMTI2C_REG_ISR);
+	writew(i2c->cmd_status, i2c->base + WMTI2C_REG_ISR);
 
-	complete(&i2c_dev->complete);
+	complete(&i2c->complete);
 
 	return IRQ_HANDLED;
 }
 
-static int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev)
+static int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c)
 {
 	int err;
-	struct wmt_i2c_dev *i2c_dev;
+	struct wmt_i2c *i2c;
 	struct device_node *np = pdev->dev.of_node;
 
-	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
-	if (!i2c_dev)
+	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
 		return -ENOMEM;
 
-	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(i2c_dev->base))
-		return PTR_ERR(i2c_dev->base);
+	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(i2c->base))
+		return PTR_ERR(i2c->base);
 
-	i2c_dev->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c_dev->irq)
+	i2c->irq = irq_of_parse_and_map(np, 0);
+	if (!i2c->irq)
 		return -EINVAL;
 
-	err = devm_request_irq(&pdev->dev, i2c_dev->irq, wmt_i2c_isr,
-					0, pdev->name, i2c_dev);
+	err = devm_request_irq(&pdev->dev, i2c->irq, wmt_i2c_isr,
+					0, pdev->name, i2c);
 	if (err)
 		return dev_err_probe(&pdev->dev, err,
-				"failed to request irq %i\n", i2c_dev->irq);
+				"failed to request irq %i\n", i2c->irq);
 
-	i2c_dev->dev = &pdev->dev;
-	init_completion(&i2c_dev->complete);
-	platform_set_drvdata(pdev, i2c_dev);
+	i2c->dev = &pdev->dev;
+	init_completion(&i2c->complete);
+	platform_set_drvdata(pdev, i2c);
 
-	*pi2c_dev = i2c_dev;
+	*pi2c = i2c;
 	return 0;
 }
 
-static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
+static int wmt_i2c_reset_hardware(struct wmt_i2c *i2c)
 {
 	int err;
+	void __iomem *base = i2c->base;
 
-	err = clk_prepare_enable(i2c_dev->clk);
+	err = clk_prepare_enable(i2c->clk);
 	if (err) {
-		dev_err(i2c_dev->dev, "failed to enable clock\n");
+		dev_err(i2c->dev, "failed to enable clock\n");
 		return err;
 	}
 
-	err = clk_set_rate(i2c_dev->clk, 20000000);
+	err = clk_set_rate(i2c->clk, 20000000);
 	if (err) {
-		dev_err(i2c_dev->dev, "failed to set clock = 20Mhz\n");
-		clk_disable_unprepare(i2c_dev->clk);
+		dev_err(i2c->dev, "failed to set clock = 20Mhz\n");
+		clk_disable_unprepare(i2c->clk);
 		return err;
 	}
 
-	writew(0, i2c_dev->base + WMTI2C_REG_CR);
-	writew(WMTI2C_MCR_APB_166M, i2c_dev->base + WMTI2C_REG_MCR);
-	writew(WMTI2C_ISR_WRITE_ALL, i2c_dev->base + WMTI2C_REG_ISR);
-	writew(WMTI2C_IMR_ENABLE_ALL, i2c_dev->base + WMTI2C_REG_IMR);
-	writew(WMTI2C_CR_ENABLE, i2c_dev->base + WMTI2C_REG_CR);
-	readw(i2c_dev->base + WMTI2C_REG_CSR);		/* read clear */
-	writew(WMTI2C_ISR_WRITE_ALL, i2c_dev->base + WMTI2C_REG_ISR);
+	writew(0, base + WMTI2C_REG_CR);
+	writew(WMTI2C_MCR_APB_166M, base + WMTI2C_REG_MCR);
+	writew(WMTI2C_ISR_WRITE_ALL, base + WMTI2C_REG_ISR);
+	writew(WMTI2C_IMR_ENABLE_ALL, base + WMTI2C_REG_IMR);
+	writew(WMTI2C_CR_ENABLE, base + WMTI2C_REG_CR);
+	readw(base + WMTI2C_REG_CSR);		/* read clear */
+	writew(WMTI2C_ISR_WRITE_ALL, base + WMTI2C_REG_ISR);
 
-	if (i2c_dev->tcr == WMTI2C_TCR_FAST_MODE)
-		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS, i2c_dev->base + WMTI2C_REG_TR);
+	if (i2c->tcr == WMTI2C_TCR_FAST_MODE)
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS, base + WMTI2C_REG_TR);
 	else
-		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD, i2c_dev->base + WMTI2C_REG_TR);
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD, base + WMTI2C_REG_TR);
 
 	return 0;
 }
@@ -354,34 +363,34 @@ static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
 static int wmt_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct wmt_i2c_dev *i2c_dev;
+	struct wmt_i2c *i2c;
 	struct i2c_adapter *adap;
 	int err;
 	u32 clk_rate;
 
-	err = wmt_i2c_init(pdev, &i2c_dev);
+	err = wmt_i2c_init(pdev, &i2c);
 	if (err)
 		return err;
 
-	i2c_dev->clk = of_clk_get(np, 0);
-	if (IS_ERR(i2c_dev->clk)) {
+	i2c->clk = of_clk_get(np, 0);
+	if (IS_ERR(i2c->clk)) {
 		dev_err(&pdev->dev, "unable to request clock\n");
-		return PTR_ERR(i2c_dev->clk);
+		return PTR_ERR(i2c->clk);
 	}
 
 	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
 	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
-		i2c_dev->tcr = WMTI2C_TCR_FAST_MODE;
+		i2c->tcr = WMTI2C_TCR_FAST_MODE;
 
-	adap = &i2c_dev->adapter;
-	i2c_set_adapdata(adap, i2c_dev);
+	adap = &i2c->adapter;
+	i2c_set_adapdata(adap, i2c);
 	strscpy(adap->name, "WMT I2C adapter", sizeof(adap->name));
 	adap->owner = THIS_MODULE;
 	adap->algo = &wmt_i2c_algo;
 	adap->dev.parent = &pdev->dev;
 	adap->dev.of_node = pdev->dev.of_node;
 
-	err = wmt_i2c_reset_hardware(i2c_dev);
+	err = wmt_i2c_reset_hardware(i2c);
 	if (err) {
 		dev_err(&pdev->dev, "error initializing hardware\n");
 		return err;
@@ -392,12 +401,12 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 
 static void wmt_i2c_remove(struct platform_device *pdev)
 {
-	struct wmt_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+	struct wmt_i2c *i2c = platform_get_drvdata(pdev);
 
 	/* Disable interrupts, clock and delete adapter */
-	writew(0, i2c_dev->base + WMTI2C_REG_IMR);
-	clk_disable_unprepare(i2c_dev->clk);
-	i2c_del_adapter(&i2c_dev->adapter);
+	writew(0, i2c->base + WMTI2C_REG_IMR);
+	clk_disable_unprepare(i2c->clk);
+	i2c_del_adapter(&i2c->adapter);
 }
 
 static const struct of_device_id wmt_i2c_dt_ids[] = {
-- 
2.34.1


