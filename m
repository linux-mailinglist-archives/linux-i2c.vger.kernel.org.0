Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6714F27B19A
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Sep 2020 18:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgI1QPU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Sep 2020 12:15:20 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:20051 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgI1QPU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Sep 2020 12:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1601309715;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=82YNZrCouK0tS/oPB7QV5S2qE790lfjqhzC6k+FTLbs=;
        b=XX+dM/DaY+9WMC/wVOhMUwIkvOweL6QpGH2pyjhAVzfw7EyeNVijG8N5wDKuUoa0XM
        X+XCACJvlgb9WveZL3iRAKlmgvujD4NzzJXIZDL2QImmwd/9+/ZvVvYdBq4YcxYYPtdN
        NDtJ87zuPRsutjp1fWgWcvBhERiRaB1xnz03WAin+JMuxpbl4U3ZnF+AEuDo8j55i8A2
        GZbIZblR3JNOlimawE+q/KQmYSCVXgjeZqQgQcM44Vfkk9fVH3/MM6dXLIRGiHWQD0+p
        vfml733vU9HBYqTj8zm6oKARmeXZ6Tq48xKUSqK+fWI3mVMfuIfdnXeMHBCQF+/LlTgr
        RFbw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82REaKQSJA=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id e0624aw8SG9Bjou
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 28 Sep 2020 18:09:11 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, linux-i2c@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4] i2c: sh_mobile: implement atomic transfers
Date:   Mon, 28 Sep 2020 17:59:50 +0200
Message-Id: <20200928155950.1185-1-uli+renesas@fpond.eu>
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

Another minor change in the atomic code path in start_ch() as suggested by
Geert. All power management-related issues have been decided to be solved
outside this driver, so we should be done here.

CU
Uli


Changes since v3:
- cut atomic_xfer code path short in start_ch()

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



 drivers/i2c/busses/i2c-sh_mobile.c | 86 +++++++++++++++++++++++-------
 1 file changed, 66 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index cab725559999..f253f82cbcc8 100644
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
@@ -581,10 +585,12 @@ static void start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
 	pd->pos = -1;
 	pd->sr = 0;
 
+	if (pd->atomic_xfer)
+		return;
+
 	pd->dma_buf = i2c_get_dma_safe_msg_buf(pd->msg, 8);
 	if (pd->dma_buf)
 		sh_mobile_i2c_xfer_dma(pd);
-
 	/* Enable all interrupts to begin with */
 	iic_wr(pd, ICIC, ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
 }
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

