Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7C81F83CF
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 17:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgFMPIL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 11:08:11 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:50978 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgFMPIG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Jun 2020 11:08:06 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49kgvS5y4cz1qrML;
        Sat, 13 Jun 2020 17:08:04 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49kgvS5Bk3z1qql0;
        Sat, 13 Jun 2020 17:08:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id dv66w5MZP4FQ; Sat, 13 Jun 2020 17:08:03 +0200 (CEST)
X-Auth-Info: R2OM82t5qXRRWGO1bX4Ahdms9Qj2AlLK0AYZRHtlrJw=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 13 Jun 2020 17:08:03 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 4/5] i2c: xiic: Switch from waitqueue to completion
Date:   Sat, 13 Jun 2020 17:07:50 +0200
Message-Id: <20200613150751.114595-4-marex@denx.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200613150751.114595-1-marex@denx.de>
References: <20200613150751.114595-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
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
 drivers/i2c/busses/i2c-xiic.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 87eca9d46afd9..e4c3427b2f3f5 100644
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
  * @dev:	Pointer to device structure
  * @base:	Memory base of the HW registers
- * @wait:	Wait queue for callers
+ * @completion:	Completion for callers
  * @adap:	Kernel adapter representation
  * @tx_msg:	Messages from above to be sent
  * @lock:	Mutual exclusion
@@ -63,7 +63,7 @@ enum xiic_endian {
 struct xiic_i2c {
 	struct device		*dev;
 	void __iomem		*base;
-	wait_queue_head_t	wait;
+	struct completion	completion;
 	struct i2c_adapter	adap;
 	struct i2c_msg		*tx_msg;
 	struct mutex		lock;
@@ -365,7 +365,7 @@ static void xiic_wakeup(struct xiic_i2c *i2c, int code)
 	i2c->rx_msg = NULL;
 	i2c->nmsgs = 0;
 	i2c->state = code;
-	wake_up(&i2c->wait);
+	complete(&i2c->completion);
 }
 
 static irqreturn_t xiic_process(int irq, void *dev_id)
@@ -677,6 +677,7 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 
 	i2c->tx_msg = msgs;
 	i2c->nmsgs = num;
+	init_completion(&i2c->completion);
 
 	ret = xiic_reinit(i2c);
 	if (!ret)
@@ -703,23 +704,24 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
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
+	err = wait_for_completion_interruptible_timeout(&i2c->completion,
+							XIIC_I2C_TIMEOUT);
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
@@ -781,7 +783,6 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	i2c->adap.dev.of_node = pdev->dev.of_node;
 
 	mutex_init(&i2c->lock);
-	init_waitqueue_head(&i2c->wait);
 
 	i2c->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk)) {
-- 
2.26.2

