Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7941BA760
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgD0PI6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727077AbgD0PI5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:08:57 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B34C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NSfbrc2h6GoASX/xB45+mQuEF2efPSUHIEJurHNWidw=; b=hWWw4/3xu3h3fw3epCyUJ/s6w+
        VmwI81S8omz7/NEgumk8eStbhUhV/v2jD3KLl5naT5yz+qpDsZLhMNReJgOGrwsGUOfeLlYtSnoRl
        jeySg7pD+37/RBA/Uuwi6wxnyY2wuQQM6/Hcx+KqfsCr00Bcn081kCJHqN+qelxEpYUH5/VyyFBF7
        KUqgHxTdW4eUOa0D8EgrYfvQYiudPUunv0RzxFVCfPPSkvtOluwuMVZE4MW8OJZFezsT6emkK22b6
        jBDEFbbUFKSv7dMgH1VUDERod/5v0EdC3Vm0nH6ky3NhqtlDYZw9nBag7WBcYIwtvH0SRShTkL07M
        rSyssIPg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:51784 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5NN-0003Xm-HN; Mon, 27 Apr 2020 16:08:53 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5NM-0001r5-VB; Mon, 27 Apr 2020 16:08:53 +0100
In-Reply-To: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 04/12] i2c: pxa: re-arrange functions to flow better
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT5NM-0001r5-VB@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 16:08:52 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Re-arrange the PXA I2C code to avoid forward declarations, and keep
similar functionality (e.g. the non-IRQ mode support) together. This
improves code readability.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 325 +++++++++++++++++------------------
 1 file changed, 162 insertions(+), 163 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 0354f6f23a7d..e77cbe325996 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -326,7 +326,6 @@ static void i2c_pxa_scream_blue_murder(struct pxa_i2c *i2c, const char *why)
 #endif /* ifdef DEBUG / else */
 
 static void i2c_pxa_master_complete(struct pxa_i2c *i2c, int ret);
-static irqreturn_t i2c_pxa_handler(int this_irq, void *dev_id);
 
 static inline int i2c_pxa_is_slavemode(struct pxa_i2c *i2c)
 {
@@ -741,34 +740,6 @@ static inline void i2c_pxa_stop_message(struct pxa_i2c *i2c)
 	writel(icr, _ICR(i2c));
 }
 
-static int i2c_pxa_pio_set_master(struct pxa_i2c *i2c)
-{
-	/* make timeout the same as for interrupt based functions */
-	long timeout = 2 * DEF_TIMEOUT;
-
-	/*
-	 * Wait for the bus to become free.
-	 */
-	while (timeout-- && readl(_ISR(i2c)) & (ISR_IBB | ISR_UB)) {
-		udelay(1000);
-		show_state(i2c);
-	}
-
-	if (timeout < 0) {
-		show_state(i2c);
-		dev_err(&i2c->adap.dev,
-			"i2c_pxa: timeout waiting for bus free\n");
-		return I2C_RETRY;
-	}
-
-	/*
-	 * Set master mode.
-	 */
-	writel(readl(_ICR(i2c)) | ICR_SCLE, _ICR(i2c));
-
-	return 0;
-}
-
 /*
  * PXA I2C send master code
  * 1. Load master code to IDBR and send it.
@@ -797,140 +768,6 @@ static int i2c_pxa_send_mastercode(struct pxa_i2c *i2c)
 	return (timeout == 0) ? I2C_RETRY : 0;
 }
 
-static int i2c_pxa_do_pio_xfer(struct pxa_i2c *i2c,
-			       struct i2c_msg *msg, int num)
-{
-	unsigned long timeout = 500000; /* 5 seconds */
-	int ret = 0;
-
-	ret = i2c_pxa_pio_set_master(i2c);
-	if (ret)
-		goto out;
-
-	i2c->msg = msg;
-	i2c->msg_num = num;
-	i2c->msg_idx = 0;
-	i2c->msg_ptr = 0;
-	i2c->irqlogidx = 0;
-
-	i2c_pxa_start_message(i2c);
-
-	while (i2c->msg_num > 0 && --timeout) {
-		i2c_pxa_handler(0, i2c);
-		udelay(10);
-	}
-
-	i2c_pxa_stop_message(i2c);
-
-	/*
-	 * We place the return code in i2c->msg_idx.
-	 */
-	ret = i2c->msg_idx;
-
-out:
-	if (timeout == 0) {
-		i2c_pxa_scream_blue_murder(i2c, "timeout");
-		ret = I2C_RETRY;
-	}
-
-	return ret;
-}
-
-/*
- * We are protected by the adapter bus mutex.
- */
-static int i2c_pxa_do_xfer(struct pxa_i2c *i2c, struct i2c_msg *msg, int num)
-{
-	long timeout;
-	int ret;
-
-	/*
-	 * Wait for the bus to become free.
-	 */
-	ret = i2c_pxa_wait_bus_not_busy(i2c);
-	if (ret) {
-		dev_err(&i2c->adap.dev, "i2c_pxa: timeout waiting for bus free\n");
-		goto out;
-	}
-
-	/*
-	 * Set master mode.
-	 */
-	ret = i2c_pxa_set_master(i2c);
-	if (ret) {
-		dev_err(&i2c->adap.dev, "i2c_pxa_set_master: error %d\n", ret);
-		goto out;
-	}
-
-	if (i2c->high_mode) {
-		ret = i2c_pxa_send_mastercode(i2c);
-		if (ret) {
-			dev_err(&i2c->adap.dev, "i2c_pxa_send_mastercode timeout\n");
-			goto out;
-			}
-	}
-
-	spin_lock_irq(&i2c->lock);
-
-	i2c->msg = msg;
-	i2c->msg_num = num;
-	i2c->msg_idx = 0;
-	i2c->msg_ptr = 0;
-	i2c->irqlogidx = 0;
-
-	i2c_pxa_start_message(i2c);
-
-	spin_unlock_irq(&i2c->lock);
-
-	/*
-	 * The rest of the processing occurs in the interrupt handler.
-	 */
-	timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
-	i2c_pxa_stop_message(i2c);
-
-	/*
-	 * We place the return code in i2c->msg_idx.
-	 */
-	ret = i2c->msg_idx;
-
-	if (!timeout && i2c->msg_num) {
-		i2c_pxa_scream_blue_murder(i2c, "timeout");
-		ret = I2C_RETRY;
-	}
-
- out:
-	return ret;
-}
-
-static int i2c_pxa_pio_xfer(struct i2c_adapter *adap,
-			    struct i2c_msg msgs[], int num)
-{
-	struct pxa_i2c *i2c = adap->algo_data;
-	int ret, i;
-
-	/* If the I2C controller is disabled we need to reset it
-	  (probably due to a suspend/resume destroying state). We do
-	  this here as we can then avoid worrying about resuming the
-	  controller before its users. */
-	if (!(readl(_ICR(i2c)) & ICR_IUE))
-		i2c_pxa_reset(i2c);
-
-	for (i = adap->retries; i >= 0; i--) {
-		ret = i2c_pxa_do_pio_xfer(i2c, msgs, num);
-		if (ret != I2C_RETRY)
-			goto out;
-
-		if (i2c_debug)
-			dev_dbg(&adap->dev, "Retrying transmission\n");
-		udelay(100);
-	}
-	i2c_pxa_scream_blue_murder(i2c, "exhausted retries");
-	ret = -EREMOTEIO;
- out:
-	i2c_pxa_set_slave(i2c, ret);
-	return ret;
-}
-
 /*
  * i2c_pxa_master_complete - complete the message and wake up.
  */
@@ -1138,6 +975,71 @@ static irqreturn_t i2c_pxa_handler(int this_irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * We are protected by the adapter bus mutex.
+ */
+static int i2c_pxa_do_xfer(struct pxa_i2c *i2c, struct i2c_msg *msg, int num)
+{
+	long timeout;
+	int ret;
+
+	/*
+	 * Wait for the bus to become free.
+	 */
+	ret = i2c_pxa_wait_bus_not_busy(i2c);
+	if (ret) {
+		dev_err(&i2c->adap.dev, "i2c_pxa: timeout waiting for bus free\n");
+		goto out;
+	}
+
+	/*
+	 * Set master mode.
+	 */
+	ret = i2c_pxa_set_master(i2c);
+	if (ret) {
+		dev_err(&i2c->adap.dev, "i2c_pxa_set_master: error %d\n", ret);
+		goto out;
+	}
+
+	if (i2c->high_mode) {
+		ret = i2c_pxa_send_mastercode(i2c);
+		if (ret) {
+			dev_err(&i2c->adap.dev, "i2c_pxa_send_mastercode timeout\n");
+			goto out;
+			}
+	}
+
+	spin_lock_irq(&i2c->lock);
+
+	i2c->msg = msg;
+	i2c->msg_num = num;
+	i2c->msg_idx = 0;
+	i2c->msg_ptr = 0;
+	i2c->irqlogidx = 0;
+
+	i2c_pxa_start_message(i2c);
+
+	spin_unlock_irq(&i2c->lock);
+
+	/*
+	 * The rest of the processing occurs in the interrupt handler.
+	 */
+	timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
+	i2c_pxa_stop_message(i2c);
+
+	/*
+	 * We place the return code in i2c->msg_idx.
+	 */
+	ret = i2c->msg_idx;
+
+	if (!timeout && i2c->msg_num) {
+		i2c_pxa_scream_blue_murder(i2c, "timeout");
+		ret = I2C_RETRY;
+	}
+
+ out:
+	return ret;
+}
 
 static int i2c_pxa_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
@@ -1175,6 +1077,103 @@ static const struct i2c_algorithm i2c_pxa_algorithm = {
 #endif
 };
 
+/* Non-interrupt mode support */
+static int i2c_pxa_pio_set_master(struct pxa_i2c *i2c)
+{
+	/* make timeout the same as for interrupt based functions */
+	long timeout = 2 * DEF_TIMEOUT;
+
+	/*
+	 * Wait for the bus to become free.
+	 */
+	while (timeout-- && readl(_ISR(i2c)) & (ISR_IBB | ISR_UB)) {
+		udelay(1000);
+		show_state(i2c);
+	}
+
+	if (timeout < 0) {
+		show_state(i2c);
+		dev_err(&i2c->adap.dev,
+			"i2c_pxa: timeout waiting for bus free\n");
+		return I2C_RETRY;
+	}
+
+	/*
+	 * Set master mode.
+	 */
+	writel(readl(_ICR(i2c)) | ICR_SCLE, _ICR(i2c));
+
+	return 0;
+}
+
+static int i2c_pxa_do_pio_xfer(struct pxa_i2c *i2c,
+			       struct i2c_msg *msg, int num)
+{
+	unsigned long timeout = 500000; /* 5 seconds */
+	int ret = 0;
+
+	ret = i2c_pxa_pio_set_master(i2c);
+	if (ret)
+		goto out;
+
+	i2c->msg = msg;
+	i2c->msg_num = num;
+	i2c->msg_idx = 0;
+	i2c->msg_ptr = 0;
+	i2c->irqlogidx = 0;
+
+	i2c_pxa_start_message(i2c);
+
+	while (i2c->msg_num > 0 && --timeout) {
+		i2c_pxa_handler(0, i2c);
+		udelay(10);
+	}
+
+	i2c_pxa_stop_message(i2c);
+
+	/*
+	 * We place the return code in i2c->msg_idx.
+	 */
+	ret = i2c->msg_idx;
+
+out:
+	if (timeout == 0) {
+		i2c_pxa_scream_blue_murder(i2c, "timeout");
+		ret = I2C_RETRY;
+	}
+
+	return ret;
+}
+
+static int i2c_pxa_pio_xfer(struct i2c_adapter *adap,
+			    struct i2c_msg msgs[], int num)
+{
+	struct pxa_i2c *i2c = adap->algo_data;
+	int ret, i;
+
+	/* If the I2C controller is disabled we need to reset it
+	  (probably due to a suspend/resume destroying state). We do
+	  this here as we can then avoid worrying about resuming the
+	  controller before its users. */
+	if (!(readl(_ICR(i2c)) & ICR_IUE))
+		i2c_pxa_reset(i2c);
+
+	for (i = adap->retries; i >= 0; i--) {
+		ret = i2c_pxa_do_pio_xfer(i2c, msgs, num);
+		if (ret != I2C_RETRY)
+			goto out;
+
+		if (i2c_debug)
+			dev_dbg(&adap->dev, "Retrying transmission\n");
+		udelay(100);
+	}
+	i2c_pxa_scream_blue_murder(i2c, "exhausted retries");
+	ret = -EREMOTEIO;
+ out:
+	i2c_pxa_set_slave(i2c, ret);
+	return ret;
+}
+
 static const struct i2c_algorithm i2c_pxa_pio_algorithm = {
 	.master_xfer	= i2c_pxa_pio_xfer,
 	.functionality	= i2c_pxa_functionality,
-- 
2.20.1

