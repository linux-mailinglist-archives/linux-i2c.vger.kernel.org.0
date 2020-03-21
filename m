Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBD318E4AD
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Mar 2020 22:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbgCUVDj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Mar 2020 17:03:39 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:53389 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727184AbgCUVDj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 21 Mar 2020 17:03:39 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 48lCmR0rpQz7N;
        Sat, 21 Mar 2020 22:03:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1584824616; bh=tsS79R0QGq7AHtfKZ66fg1w4PDEYc0Ksv1+dYcvsHpQ=;
        h=Date:From:Subject:To:Cc:From;
        b=DGAt/QE/kpXzHWzdgv7tyCX9Z57MPer7iaa7TAHqxN+0L8mkCUYup2g/rHf79NBmx
         3WChkOx/rIddiRNFmv/eGGqg3B2MqXElA4PSu0B/oNIJYtU/lv7mXcCQKEMG+k+Qzx
         cMvaRAmF82KihVDHGt7c2TSQbqgt/b22obCAxYxNCz0ShhcjRD/cgHQir0dRe+iFn/
         VA0U2S67Tt2XlqzHm5zq0CUnwyzmX35WHL1ZfIF1UlLHYWep15hZzmX4zTjiu1muC7
         QlyLn/ZGCaKAaTa3OMT2996ytGeiM72WtUhZ6/K2TZibHDo7jIJrMGqoFZ9Ua8PzDB
         UzcFjQsQUVM/Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sat, 21 Mar 2020 22:03:34 +0100
Message-Id: <6466e066d7cbad20cb6a334ad8e37cdcf521c492.1584822011.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2] i2c: at91: support atomic write xfer
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implement basic support for atomic write - enough to get a simple
write to PMIC on shutdown. Only for chips having ALT_CMD register,
eg. SAMA5D2.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
v2: remove runtime-PM usage
    switch to readl*poll*atomic() for transfer completion wait
---
 drivers/i2c/busses/i2c-at91-master.c | 69 +++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index ba6fbb9c7390..d9226207157a 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -21,6 +21,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -709,6 +710,69 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 	return ret;
 }
 
+static int at91_twi_xfer_atomic(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
+{
+	struct at91_twi_dev *dev = i2c_get_adapdata(adap);
+	unsigned long timeout;
+	struct pinctrl *pins;
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
+	pins = pinctrl_get_select_default(&adap->dev);
+
+	ret = clk_prepare_enable(twi_dev->clk);
+	if (ret)
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
+	readl_relaxed_poll_timeout_atomic(dev->base + AT91_TWI_SR, stat,
+					  stat & AT91_TWI_TXCOMP, 100,
+					  (2 + msg->len) * 1000);
+	if (stat & AT91_TWI_NACK)
+		ret = -EREMOTEIO;
+	else
+		ret = num;
+
+	clk_disable_unprepare(twi_dev->clk);
+out:
+	if (!IS_ERR(pins))
+		pinctrl_put(pins);
+
+	return ret;
+}
+
 /*
  * The hardware can handle at most two messages concatenated by a
  * repeated start via it's internal address feature.
@@ -725,8 +789,9 @@ static u32 at91_twi_func(struct i2c_adapter *adapter)
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

