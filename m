Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A620B2745F3
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 18:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgIVQBu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 12:01:50 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:14555 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgIVQBu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 12:01:50 -0400
X-Greylist: delayed 534 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 12:01:46 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600790505;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=YsYTrKB/LkL8TDlaW2oaFPLQH0sq35CmW7sEH7lxBss=;
        b=SSJcX3pEKRcvwFgQQfCvKqMgEmfUP32ihXceNUlEP8sJMEGuDRfOUBWHu2VXhBGKAo
        szWXmiHy9oTBH3Z4mAY0/JwaTAG2PXRWVaUYdNjcN3OocZ7K7ptHmq+tTS55AHL+z+Mn
        bW5DB2jln4asyvnE9H7TYKqN3YA57AuxKYUFnPX3xVLT4qh4qbfJa8JaQ7/AFUWFCKH7
        G1r8Pzl9+9KLPpTHYjlTEUJgdW2KUlHUz01mXbz/jCI+F6ON0Xk9l1SisMOUc8k5pI1n
        ncKiR1LHDHIiJOq9q1gmS/ag6fuGtqD4PyL+cybVd220b0Y2aOW+MTi1BhKpM1wBUCYo
        qCeg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR+mpEYCHo"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id e0624aw8MFnjIe0
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 22 Sep 2020 17:49:45 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, linux-i2c@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] i2c: sh_mobile: implement atomic transfers
Date:   Tue, 22 Sep 2020 17:49:43 +0200
Message-Id: <20200922154943.29574-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
similar boards.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi!

This is a rebased version of v2 with a minor issue fixed. It does not
resolve the runtime PM issue that may arise (see "watchdog: da9063: wake up
parent ahead of reboot", https://patchwork.kernel.org/patch/11749121/ ), but
in practice it works, and our understanding so far is that this will have to
be resolved outside this driver and should IMO not block this patch.

CU
Uli


Changes since v2:
- rebase
- make sure time_left is updated

Changes since v1:
- don't disable runtime PM operations for atomic transfers
- rename xfer() to sh_mobile_xfer()
- rename timeout to time_left in sh_mobile_xfer() and simplify logic
- minor style tweaks
- rebase
- add Tested-by's



 drivers/i2c/busses/i2c-sh_mobile.c | 96 ++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index cab725559999..2891810fd78d 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -129,6 +129,7 @@ struct sh_mobile_i2c_data {
 	int sr;
 	bool send_stop;
 	bool stop_after_dma;
+	bool atomic_xfer;
 
 	struct resource *res;
 	struct dma_chan *dma_tx;
@@ -330,13 +331,15 @@ static unsigned char i2c_op(struct sh_mobile_i2c_data *pd, enum sh_mobile_i2c_op
 		ret = iic_rd(pd, ICDR);
 		break;
 	case OP_RX_STOP: /* enable DTE interrupt, issue stop */
-		iic_wr(pd, ICIC,
-		       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+		if (!pd->atomic_xfer)
+			iic_wr(pd, ICIC,
+			       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
 		iic_wr(pd, ICCR, ICCR_ICE | ICCR_RACK);
 		break;
 	case OP_RX_STOP_DATA: /* enable DTE interrupt, read data, issue stop */
-		iic_wr(pd, ICIC,
-		       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+		if (!pd->atomic_xfer)
+			iic_wr(pd, ICIC,
+			       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
 		ret = iic_rd(pd, ICDR);
 		iic_wr(pd, ICCR, ICCR_ICE | ICCR_RACK);
 		break;
@@ -429,7 +432,8 @@ static irqreturn_t sh_mobile_i2c_isr(int irq, void *dev_id)
 
 	if (wakeup) {
 		pd->sr |= SW_DONE;
-		wake_up(&pd->wait);
+		if (!pd->atomic_xfer)
+			wake_up(&pd->wait);
 	}
 
 	/* defeat write posting to avoid spurious WAIT interrupts */
@@ -581,12 +585,14 @@ static void start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
 	pd->pos = -1;
 	pd->sr = 0;
 
-	pd->dma_buf = i2c_get_dma_safe_msg_buf(pd->msg, 8);
-	if (pd->dma_buf)
-		sh_mobile_i2c_xfer_dma(pd);
-
-	/* Enable all interrupts to begin with */
-	iic_wr(pd, ICIC, ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+	if (!pd->atomic_xfer) {
+		pd->dma_buf = i2c_get_dma_safe_msg_buf(pd->msg, 8);
+		if (pd->dma_buf)
+			sh_mobile_i2c_xfer_dma(pd);
+		/* Enable all interrupts to begin with */
+		iic_wr(pd, ICIC,
+		       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+	}
 }
 
 static int poll_dte(struct sh_mobile_i2c_data *pd)
@@ -637,15 +643,13 @@ static int poll_busy(struct sh_mobile_i2c_data *pd)
 	return i ? 0 : -ETIMEDOUT;
 }
 
-static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
-			      struct i2c_msg *msgs,
-			      int num)
+static int sh_mobile_xfer(struct sh_mobile_i2c_data *pd,
+			 struct i2c_msg *msgs, int num)
 {
-	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
 	struct i2c_msg	*msg;
 	int err = 0;
 	int i;
-	long timeout;
+	long time_left;
 
 	/* Wake up device and enable clock */
 	pm_runtime_get_sync(pd->dev);
@@ -662,15 +666,36 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 		if (do_start)
 			i2c_op(pd, OP_START);
 
-		/* The interrupt handler takes care of the rest... */
-		timeout = wait_event_timeout(pd->wait,
-				       pd->sr & (ICSR_TACK | SW_DONE),
-				       adapter->timeout);
+		if (pd->atomic_xfer) {
+			unsigned long j = jiffies + pd->adap.timeout;
+
+			time_left = time_before_eq(jiffies, j);
+			while (time_left &&
+			       !(pd->sr & (ICSR_TACK | SW_DONE))) {
+				unsigned char sr = iic_rd(pd, ICSR);
+
+				if (sr & (ICSR_AL   | ICSR_TACK |
+					  ICSR_WAIT | ICSR_DTE)) {
+					sh_mobile_i2c_isr(0, pd);
+					udelay(150);
+				} else {
+					cpu_relax();
+				}
+				time_left = time_before_eq(jiffies, j);
+			}
+		} else {
+			/* The interrupt handler takes care of the rest... */
+			time_left = wait_event_timeout(pd->wait,
+					pd->sr & (ICSR_TACK | SW_DONE),
+					pd->adap.timeout);
+
+			/* 'stop_after_dma' tells if DMA xfer was complete */
+			i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg,
+						 pd->stop_after_dma);
 
-		/* 'stop_after_dma' tells if DMA transfer was complete */
-		i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg, pd->stop_after_dma);
+		}
 
-		if (!timeout) {
+		if (!time_left) {
 			dev_err(pd->dev, "Transfer request timed out\n");
 			if (pd->dma_direction != DMA_NONE)
 				sh_mobile_i2c_cleanup_dma(pd);
@@ -696,14 +721,35 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 	return err ?: num;
 }
 
+static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
+			      struct i2c_msg *msgs,
+			      int num)
+{
+	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
+
+	pd->atomic_xfer = false;
+	return sh_mobile_xfer(pd, msgs, num);
+}
+
+static int sh_mobile_i2c_xfer_atomic(struct i2c_adapter *adapter,
+				     struct i2c_msg *msgs,
+				     int num)
+{
+	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
+
+	pd->atomic_xfer = true;
+	return sh_mobile_xfer(pd, msgs, num);
+}
+
 static u32 sh_mobile_i2c_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
 }
 
 static const struct i2c_algorithm sh_mobile_i2c_algorithm = {
-	.functionality	= sh_mobile_i2c_func,
-	.master_xfer	= sh_mobile_i2c_xfer,
+	.functionality = sh_mobile_i2c_func,
+	.master_xfer = sh_mobile_i2c_xfer,
+	.master_xfer_atomic = sh_mobile_i2c_xfer_atomic,
 };
 
 static const struct i2c_adapter_quirks sh_mobile_i2c_quirks = {
-- 
2.20.1

