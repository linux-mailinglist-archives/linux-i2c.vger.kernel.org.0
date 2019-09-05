Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9DDA99C7
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 06:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfIEErd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 00:47:33 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:61186 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbfIEErd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 00:47:33 -0400
X-Greylist: delayed 3675 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Sep 2019 00:47:30 EDT
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x854koYf010084;
        Thu, 5 Sep 2019 13:46:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x854koYf010084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567658811;
        bh=2zT1bjaiBT6Hk9ftaCoX240vdABU32UvGSR8I57jWyA=;
        h=From:To:Cc:Subject:Date:From;
        b=uyymq3PdGmUK64VEQuftOj+rfLg8OaIh5UQXVWhMidkbSRh49fEPLtYlFmFLPInkL
         hL+Q7Z8ScSWeBA2JroIvjO8smnUoYxKhGftqOW5ogxSKgkkJcAQ9rUfZOSB9kSWfxH
         Wek024D0KzK0HKtJiy0xdVNKN53Mz8ryFYKKfRGUo1SNAg39UrGxdMtsU13bLlClrG
         xz5PpHz64E2aMxXluB150sF0vDQ7hyOD2Mm8yN7BT25Gacc2LL9PD0fgj/X6P2o3Rq
         EXbCNAcPDXiXHU0lRA/4iYWpJ54XbAbm7CR0nINj/fIyKbSGawtZhrHDilRAEnJedW
         a+c2pqy/jzuMg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: uniphier(-f): remove all dev_dbg()
Date:   Thu,  5 Sep 2019 13:46:48 +0900
Message-Id: <20190905044648.7632-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I have fixed various bugs, and these drivers are (I hope) pretty
stable now. Remove all dev_dbg() for code clean-up.

If I end up with debugging the drivers again, I will locally revert
this commit. I no longer need the debug code in upstream.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/i2c/busses/i2c-uniphier-f.c | 22 +---------------------
 drivers/i2c/busses/i2c-uniphier.c   | 18 +++---------------
 2 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index fc5354845ffa..4241aac79e7e 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -108,7 +108,6 @@ static void uniphier_fi2c_fill_txfifo(struct uniphier_fi2c_priv *priv,
 		if (fifo_space-- <= 0)
 			break;
 
-		dev_dbg(&priv->adap.dev, "write data: %02x\n", *priv->buf);
 		writel(*priv->buf++, priv->membase + UNIPHIER_FI2C_DTTX);
 		priv->len--;
 	}
@@ -124,7 +123,6 @@ static void uniphier_fi2c_drain_rxfifo(struct uniphier_fi2c_priv *priv)
 			break;
 
 		*priv->buf++ = readl(priv->membase + UNIPHIER_FI2C_DTRX);
-		dev_dbg(&priv->adap.dev, "read data: %02x\n", priv->buf[-1]);
 		priv->len--;
 	}
 }
@@ -142,8 +140,6 @@ static void uniphier_fi2c_clear_irqs(struct uniphier_fi2c_priv *priv,
 
 static void uniphier_fi2c_stop(struct uniphier_fi2c_priv *priv)
 {
-	dev_dbg(&priv->adap.dev, "stop condition\n");
-
 	priv->enabled_irqs |= UNIPHIER_FI2C_INT_STOP;
 	uniphier_fi2c_set_irqs(priv);
 	writel(UNIPHIER_FI2C_CR_MST | UNIPHIER_FI2C_CR_STO,
@@ -160,21 +156,15 @@ static irqreturn_t uniphier_fi2c_interrupt(int irq, void *dev_id)
 	irq_status = readl(priv->membase + UNIPHIER_FI2C_INT);
 	irq_status &= priv->enabled_irqs;
 
-	dev_dbg(&priv->adap.dev,
-		"interrupt: enabled_irqs=%04x, irq_status=%04x\n",
-		priv->enabled_irqs, irq_status);
-
 	if (irq_status & UNIPHIER_FI2C_INT_STOP)
 		goto complete;
 
 	if (unlikely(irq_status & UNIPHIER_FI2C_INT_AL)) {
-		dev_dbg(&priv->adap.dev, "arbitration lost\n");
 		priv->error = -EAGAIN;
 		goto complete;
 	}
 
 	if (unlikely(irq_status & UNIPHIER_FI2C_INT_NA)) {
-		dev_dbg(&priv->adap.dev, "could not get ACK\n");
 		priv->error = -ENXIO;
 		if (priv->flags & UNIPHIER_FI2C_RD) {
 			/*
@@ -215,18 +205,14 @@ static irqreturn_t uniphier_fi2c_interrupt(int irq, void *dev_id)
 		if (unlikely(priv->flags & UNIPHIER_FI2C_MANUAL_NACK)) {
 			if (priv->len <= UNIPHIER_FI2C_FIFO_SIZE &&
 			    !(priv->flags & UNIPHIER_FI2C_BYTE_WISE)) {
-				dev_dbg(&priv->adap.dev,
-					"enable read byte count IRQ\n");
 				priv->enabled_irqs |= UNIPHIER_FI2C_INT_RB;
 				uniphier_fi2c_set_irqs(priv);
 				priv->flags |= UNIPHIER_FI2C_BYTE_WISE;
 			}
-			if (priv->len <= 1) {
-				dev_dbg(&priv->adap.dev, "set NACK\n");
+			if (priv->len <= 1)
 				writel(UNIPHIER_FI2C_CR_MST |
 				       UNIPHIER_FI2C_CR_NACK,
 				       priv->membase + UNIPHIER_FI2C_CR);
-			}
 		}
 
 		goto handled;
@@ -334,10 +320,6 @@ static int uniphier_fi2c_master_xfer_one(struct i2c_adapter *adap,
 	bool is_read = msg->flags & I2C_M_RD;
 	unsigned long time_left, flags;
 
-	dev_dbg(&adap->dev, "%s: addr=0x%02x, len=%d, repeat=%d, stop=%d\n",
-		is_read ? "receive" : "transmit", msg->addr, msg->len,
-		repeat, stop);
-
 	priv->len = msg->len;
 	priv->buf = msg->buf;
 	priv->enabled_irqs = UNIPHIER_FI2C_INT_FAULTS;
@@ -359,7 +341,6 @@ static int uniphier_fi2c_master_xfer_one(struct i2c_adapter *adap,
 	else
 		uniphier_fi2c_tx_init(priv, msg->addr, repeat);
 
-	dev_dbg(&adap->dev, "start condition\n");
 	/*
 	 * For a repeated START condition, writing a slave address to the FIFO
 	 * kicks the controller. So, the UNIPHIER_FI2C_CR register should be
@@ -383,7 +364,6 @@ static int uniphier_fi2c_master_xfer_one(struct i2c_adapter *adap,
 		uniphier_fi2c_recover(priv);
 		return -ETIMEDOUT;
 	}
-	dev_dbg(&adap->dev, "complete\n");
 
 	if (unlikely(priv->flags & UNIPHIER_FI2C_DEFER_STOP_COMP)) {
 		u32 status;
diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index a6d7a3709051..0270090c0360 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -71,7 +71,6 @@ static int uniphier_i2c_xfer_byte(struct i2c_adapter *adap, u32 txdata,
 	reinit_completion(&priv->comp);
 
 	txdata |= UNIPHIER_I2C_DTRM_IRQEN;
-	dev_dbg(&adap->dev, "write data: 0x%04x\n", txdata);
 	writel(txdata, priv->membase + UNIPHIER_I2C_DTRM);
 
 	time_left = wait_for_completion_timeout(&priv->comp, adap->timeout);
@@ -81,8 +80,6 @@ static int uniphier_i2c_xfer_byte(struct i2c_adapter *adap, u32 txdata,
 	}
 
 	rxdata = readl(priv->membase + UNIPHIER_I2C_DREC);
-	dev_dbg(&adap->dev, "read data: 0x%04x\n", rxdata);
-
 	if (rxdatap)
 		*rxdatap = rxdata;
 
@@ -98,14 +95,11 @@ static int uniphier_i2c_send_byte(struct i2c_adapter *adap, u32 txdata)
 	if (ret)
 		return ret;
 
-	if (unlikely(rxdata & UNIPHIER_I2C_DREC_LAB)) {
-		dev_dbg(&adap->dev, "arbitration lost\n");
+	if (unlikely(rxdata & UNIPHIER_I2C_DREC_LAB))
 		return -EAGAIN;
-	}
-	if (unlikely(rxdata & UNIPHIER_I2C_DREC_LRB)) {
-		dev_dbg(&adap->dev, "could not get ACK\n");
+
+	if (unlikely(rxdata & UNIPHIER_I2C_DREC_LRB))
 		return -ENXIO;
-	}
 
 	return 0;
 }
@@ -115,7 +109,6 @@ static int uniphier_i2c_tx(struct i2c_adapter *adap, u16 addr, u16 len,
 {
 	int ret;
 
-	dev_dbg(&adap->dev, "start condition\n");
 	ret = uniphier_i2c_send_byte(adap, addr << 1 |
 				     UNIPHIER_I2C_DTRM_STA |
 				     UNIPHIER_I2C_DTRM_NACK);
@@ -137,7 +130,6 @@ static int uniphier_i2c_rx(struct i2c_adapter *adap, u16 addr, u16 len,
 {
 	int ret;
 
-	dev_dbg(&adap->dev, "start condition\n");
 	ret = uniphier_i2c_send_byte(adap, addr << 1 |
 				     UNIPHIER_I2C_DTRM_STA |
 				     UNIPHIER_I2C_DTRM_NACK |
@@ -161,7 +153,6 @@ static int uniphier_i2c_rx(struct i2c_adapter *adap, u16 addr, u16 len,
 
 static int uniphier_i2c_stop(struct i2c_adapter *adap)
 {
-	dev_dbg(&adap->dev, "stop condition\n");
 	return uniphier_i2c_send_byte(adap, UNIPHIER_I2C_DTRM_STO |
 				      UNIPHIER_I2C_DTRM_NACK);
 }
@@ -173,9 +164,6 @@ static int uniphier_i2c_master_xfer_one(struct i2c_adapter *adap,
 	bool recovery = false;
 	int ret;
 
-	dev_dbg(&adap->dev, "%s: addr=0x%02x, len=%d, stop=%d\n",
-		is_read ? "receive" : "transmit", msg->addr, msg->len, stop);
-
 	if (is_read)
 		ret = uniphier_i2c_rx(adap, msg->addr, msg->len, msg->buf);
 	else
-- 
2.17.1

