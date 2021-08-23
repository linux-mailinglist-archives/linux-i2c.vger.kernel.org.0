Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92A03F52F4
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 23:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbhHWVnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 17:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbhHWVnC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Aug 2021 17:43:02 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82A3C06175F
        for <linux-i2c@vger.kernel.org>; Mon, 23 Aug 2021 14:42:18 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 19CD582C2C;
        Mon, 23 Aug 2021 23:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1629754937;
        bh=Iozl/1Vu3QETYuwoTOyVg9yzpnCMEX0kBJLxqlhhOr0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WC3j7EnZqNb1jHPAZDMah88Y0RhQIVGzqkJU2fxkpPpVOeNX3+0u8llAJWkCQlUpz
         +WG3iJFe+S5a1NY+IIIOv2MBpEEbYGJ/0QSl4l0v0YcMlOCjw0zYtBPSIrG7YtuD3/
         py+5ptg9qHWcALxzDoJm6kdxD7qaLseN+GIXREoGuo9TYfHTmq9UMNJSS3LZWkZfKO
         CatsMl1cOTsbVoVTzPlEE+gLsOaAU4iaBFdgKyMAnIrPJJeZKtNkDy7qve6FqfJBnQ
         ESfd0oH7I4fHjuZXCz7bXFH1MQhOgor7k/Q04KHEO4a1n244dFQT1w32a0HWxOiPjv
         wzLaEow5aM2EQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 4/6] i2c: xiic: Switch from waitqueue to completion
Date:   Mon, 23 Aug 2021 23:41:43 +0200
Message-Id: <20210823214145.295104-5-marex@denx.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823214145.295104-1-marex@denx.de>
References: <20210823214145.295104-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There will never be threads queueing up in the xiic_xmit(), use
completion synchronization primitive to wait for the interrupt
handler thread to complete instead as it is much better fit and
there is no need to overload it for this purpose.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: Wolfram Sang <wsa@kernel.org>
---
V2: Add separate timeout for the transfer completion, since on SMP zynqmp
    it can happen that the interrupt handler thread is preempted for longer
    than a second (measurements indicate below 2 seconds most of the time).
    So add a separate timeout and make it long to give this a chance.
---
 drivers/i2c/busses/i2c-xiic.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index aecdeec579977..f7277629923ff 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -23,7 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
-#include <linux/wait.h>
+#include <linux/completion.h>
 #include <linux/platform_data/i2c-xiic.h>
 #include <linux/io.h>
 #include <linux/slab.h>
@@ -48,7 +48,7 @@ enum xiic_endian {
  * struct xiic_i2c - Internal representation of the XIIC I2C bus
  * @dev: Pointer to device structure
  * @base: Memory base of the HW registers
- * @wait: Wait queue for callers
+ * @completion:	Completion for callers
  * @adap: Kernel adapter representation
  * @tx_msg: Messages from above to be sent
  * @lock: Mutual exclusion
@@ -64,7 +64,7 @@ enum xiic_endian {
 struct xiic_i2c {
 	struct device *dev;
 	void __iomem *base;
-	wait_queue_head_t wait;
+	struct completion completion;
 	struct i2c_adapter adap;
 	struct i2c_msg *tx_msg;
 	struct mutex lock;
@@ -160,6 +160,9 @@ struct xiic_i2c {
 #define XIIC_PM_TIMEOUT		1000	/* ms */
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
+/* timeout waiting for the controller finish transfers */
+#define XIIC_XFER_TIMEOUT	(msecs_to_jiffies(10000))
+
 /*
  * The following constant is used for the device global interrupt enable
  * register, to enable all interrupts for the device, this is the only bit
@@ -367,7 +370,7 @@ static void xiic_wakeup(struct xiic_i2c *i2c, int code)
 	i2c->rx_msg = NULL;
 	i2c->nmsgs = 0;
 	i2c->state = code;
-	wake_up(&i2c->wait);
+	complete(&i2c->completion);
 }
 
 static irqreturn_t xiic_process(int irq, void *dev_id)
@@ -689,6 +692,7 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 	i2c->tx_msg = msgs;
 	i2c->rx_msg = NULL;
 	i2c->nmsgs = num;
+	init_completion(&i2c->completion);
 
 	ret = xiic_reinit(i2c);
 	if (!ret)
@@ -715,23 +719,23 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	err = xiic_start_xfer(i2c, msgs, num);
 	if (err < 0) {
 		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
-		goto out;
+		return err;
 	}
 
-	if (wait_event_timeout(i2c->wait, (i2c->state == STATE_ERROR) ||
-		(i2c->state == STATE_DONE), HZ)) {
-		mutex_lock(&i2c->lock);
-		err = (i2c->state == STATE_DONE) ? num : -EIO;
-		goto out;
-	} else {
-		mutex_lock(&i2c->lock);
+	err = wait_for_completion_timeout(&i2c->completion, XIIC_XFER_TIMEOUT);
+	mutex_lock(&i2c->lock);
+	if (err == 0) {	/* Timeout */
 		i2c->tx_msg = NULL;
 		i2c->rx_msg = NULL;
 		i2c->nmsgs = 0;
 		err = -ETIMEDOUT;
-		goto out;
+	} else if (err < 0) {	/* Completion error */
+		i2c->tx_msg = NULL;
+		i2c->rx_msg = NULL;
+		i2c->nmsgs = 0;
+	} else {
+		err = (i2c->state == STATE_DONE) ? num : -EIO;
 	}
-out:
 	mutex_unlock(&i2c->lock);
 	pm_runtime_mark_last_busy(i2c->dev);
 	pm_runtime_put_autosuspend(i2c->dev);
@@ -793,7 +797,6 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	i2c->adap.dev.of_node = pdev->dev.of_node;
 
 	mutex_init(&i2c->lock);
-	init_waitqueue_head(&i2c->wait);
 
 	i2c->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
-- 
2.32.0

