Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF5B3185EF3
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Mar 2020 19:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgCOS1W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Mar 2020 14:27:22 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:65383 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727399AbgCOS1W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 15 Mar 2020 14:27:22 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 48gSZv3MCYzw;
        Sun, 15 Mar 2020 19:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1584296839; bh=TJhZMjKo+KUVLI0hpZAwAgnvG6QmmlkebUP9kQ5A0Pw=;
        h=Date:From:Subject:To:Cc:From;
        b=URgPaNbSehcK0b3g0w7qrGKyjwOt3HQxDowbAt9Q8ps+npME4rjALKnTQMbd6SVc8
         e8jGwuI29BMIQMiD4ccmWavbg8Hgrza1Oyqx0cMOxaeWbpOfd45vl02FWWTlyk95Io
         bIaIhMFr5jCgFW7QwhkPmbdwY1kt1u9ZrIwX/6UckkdArwdXpy8hyiowi2mnfgDggh
         hRAhMPka6TSQ6WSRKpM7ey3AnymA3rXGpiR0zfCfoSt7+2A+p2CvjlWyuJkBKuVQPp
         6Twe/YULZnq5naoviohjnsJhWfUM/zMxGfQ3SezFrGgH6lDEdi8ZQUyq9Klh255DoA
         gkZdLhh4W2iYw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 15 Mar 2020 19:27:18 +0100
Message-Id: <c05f76f74cd6a7ec2735c96861f9d5933631c112.1584296795.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] i2c: at91: support atomic write xfer
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implement basic support for atomic write - enough to get a simple
write to PMIC on shutdown. Only for chips having ALT_CMD register,
eg. SAMA5D2.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/i2c/busses/i2c-at91-master.c | 73 +++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index ba6fbb9c7390..67091616987f 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -15,6 +15,7 @@
 
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/err.h>
@@ -709,6 +710,73 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 	return ret;
 }
 
+static int at91_twi_xfer_atomic(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
+{
+	struct at91_twi_dev *dev = i2c_get_adapdata(adap);
+	unsigned long timeout;
+	__u32 stat;
+	int ret;
+
+	/* FIXME: only single write request supported to 7-bit addr */
+	if (num != 1)
+		return -EOPNOTSUPP;
+	if (msg->flags & I2C_M_RD)
+		return -EOPNOTSUPP;
+	if (msg->flags & I2C_M_TEN)
+		return -EOPNOTSUPP;
+	if (msg->len > dev->fifo_size && msg->len > 1)
+		return -EOPNOTSUPP;
+	if (!dev->pdata->has_alt_cmd)
+		return -EOPNOTSUPP;
+
+	ret = pm_runtime_get_sync(dev->dev);
+	if (ret < 0)
+		goto out;
+
+	/* Clear and disable pending interrupts, such as NACK. */
+	at91_twi_read(dev, AT91_TWI_SR);
+	at91_twi_write(dev, AT91_TWI_IDR, ~0);
+
+	at91_twi_write(dev, AT91_TWI_MMR, msg->addr << 16);
+
+	if (!msg->len) {
+		at91_twi_write(dev, AT91_TWI_CR,
+			       AT91_TWI_ACMDIS | AT91_TWI_QUICK);
+	} else {
+		size_t n = msg->len;
+		__u8 *p;
+
+		at91_twi_write(dev, AT91_TWI_CR,
+				    AT91_TWI_ACMEN |
+				    AT91_TWI_THRCLR | AT91_TWI_RHRCLR);
+		at91_twi_write(dev, AT91_TWI_ACR, AT91_TWI_ACR_DATAL(n));
+		for (p = msg->buf; n--; ++p)
+			writeb_relaxed(*p, dev->base + AT91_TWI_THR);
+	}
+
+	timeout = jiffies + (2 + msg->len) * HZ/1000;
+	for (;;) {
+		stat = at91_twi_read(dev, AT91_TWI_SR);
+		if (stat & AT91_TWI_TXCOMP)
+			break;
+		if (time_after(jiffies, timeout)) {
+			ret = -ETIMEDOUT;
+			goto out;
+		}
+		udelay(100);
+	}
+
+	if (stat & AT91_TWI_NACK)
+		ret = -EREMOTEIO;
+	else
+		ret = num;
+out:
+	pm_runtime_mark_last_busy(dev->dev);
+	pm_runtime_put_autosuspend(dev->dev);
+
+	return ret;
+}
+
 /*
  * The hardware can handle at most two messages concatenated by a
  * repeated start via it's internal address feature.
@@ -725,8 +793,9 @@ static u32 at91_twi_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm at91_twi_algorithm = {
-	.master_xfer	= at91_twi_xfer,
-	.functionality	= at91_twi_func,
+	.master_xfer		= at91_twi_xfer,
+	.master_xfer_atomic	= at91_twi_xfer_atomic,
+	.functionality		= at91_twi_func,
 };
 
 static int at91_twi_configure_dma(struct at91_twi_dev *dev, u32 phy_addr)
-- 
2.20.1

