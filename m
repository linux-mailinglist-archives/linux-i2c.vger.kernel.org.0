Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD0A7DEB01
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 03:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348175AbjKBCyP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 22:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347897AbjKBCyN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 22:54:13 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF0183
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 19:54:09 -0700 (PDT)
X-ASG-Debug-ID: 1698893646-1eb14e538d03ae0002-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id 6nhHifHqUAnf0SeU (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 02 Nov 2023 10:54:06 +0800 (CST)
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
Subject: [PATCH v3 09/12] i2c: wmt: adjust line length to meet style
Date:   Thu, 2 Nov 2023 10:53:59 +0800
X-ASG-Orig-Subj: [PATCH v3 09/12] i2c: wmt: adjust line length to meet style
Message-ID: <4f1477e7354aba68cd9398fcfcc7698c77d5dc1f.1698889581.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Scan-Msg-Size: 13575
X-Barracuda-BRTS-Status: 0
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

Tweaked a few formatting things:
rename wmt_i2c_dev to wmt_i2c, i2c_dev to i2c, etc. 

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-wmt.c | 203 ++++++++++++++++++-----------------
 1 file changed, 107 insertions(+), 96 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index ec9e4bfc52b0..3dea153c62aa 100644
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
@@ -275,87 +283,90 @@ static const struct i2c_algorithm wmt_i2c_algo = {
 
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
 
-int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev)
+int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c)
 {
 	int err;
 	int irq_flags;
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
 
 	if (np) {
 		irq_flags = 0;
-		i2c_dev->irq = irq_of_parse_and_map(np, 0);
-		if (!i2c_dev->irq)
+		i2c->irq = irq_of_parse_and_map(np, 0);
+		if (!i2c->irq)
 			return -EINVAL;
 	} else {
 		irq_flags = IRQF_SHARED;
-		i2c_dev->irq = platform_get_irq(pdev, 0);
-		if (i2c_dev->irq < 0)
-			return i2c_dev->irq;
+		i2c->irq = platform_get_irq(pdev, 0);
+		if (i2c->irq < 0)
+			return i2c->irq;
 	}
 
-	err = devm_request_irq(&pdev->dev, i2c_dev->irq, wmt_i2c_isr,
-					irq_flags, pdev->name, i2c_dev);
+	err = devm_request_irq(&pdev->dev, i2c->irq, wmt_i2c_isr,
+					irq_flags, pdev->name, i2c);
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
-
-	if (i2c_dev->tcr == WMTI2C_TCR_FAST_MODE)
-		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS, i2c_dev->base + WMTI2C_REG_TR);
+	writew(0, base + WMTI2C_REG_CR);
+	writew(WMTI2C_MCR_APB_166M, base + WMTI2C_REG_MCR);
+	writew(WMTI2C_ISR_WRITE_ALL, base + WMTI2C_REG_ISR);
+	writew(WMTI2C_IMR_ENABLE_ALL, base + WMTI2C_REG_IMR);
+	writew(WMTI2C_CR_ENABLE, base + WMTI2C_REG_CR);
+	readw(base + WMTI2C_REG_CSR);		/* read clear */
+	writew(WMTI2C_ISR_WRITE_ALL, base + WMTI2C_REG_ISR);
+
+	if (i2c->tcr == WMTI2C_TCR_FAST_MODE)
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_HS,
+				base + WMTI2C_REG_TR);
 	else
-		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD, i2c_dev->base + WMTI2C_REG_TR);
+		writew(WMTI2C_SCL_TIMEOUT(128) | WMTI2C_TR_STD,
+				base + WMTI2C_REG_TR);
 
 	return 0;
 }
@@ -363,40 +374,40 @@ static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
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
 	}
 
-	return devm_i2c_add_adapter(&pdev->dev, &i2c_dev->adapter);
+	return devm_i2c_add_adapter(&pdev->dev, &i2c->adapter);
 }
 
 static const struct of_device_id wmt_i2c_dt_ids[] = {
-- 
2.34.1

