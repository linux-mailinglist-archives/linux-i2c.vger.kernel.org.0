Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC99244E78E
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 14:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhKLNm4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 08:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234942AbhKLNmz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Nov 2021 08:42:55 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4361FC061767;
        Fri, 12 Nov 2021 05:40:05 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id i9so9054006qki.3;
        Fri, 12 Nov 2021 05:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=66lyOHJS0qzIRBJKO7oDKOp0vo3S4sIdoEglqerUYVo=;
        b=or8W/C4Mjt0QBhnQjKWNlO++QNvzMcoXrKVcqvuIRzgb9mDyOAGUUzwRk+VVriOguI
         BOOM1H4rxmY0QK/8E2oRiWjGjCQJWdbvAUydI8bzLCKjKphwn9yTSCB8+xWpppAGmEG2
         0Yant00ErQv/hZqywMaBZs6JugONvzagztCW4/+mM/3+MFqTeKMNcKUxqW89rMcIrlP/
         bUN0Pt5p7keRfeLTxLD0XyxEjhrCGjbGAy5UlMfQRJ8ObA5DtjQvuT34+XSWonJ59+VP
         PdEBk7MUtSzQd9OU7wMDS+sRESyKLfyFWT+sm1uv/EWiZcmZrdh0bWPKwNDQKBNNQuJx
         7a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=66lyOHJS0qzIRBJKO7oDKOp0vo3S4sIdoEglqerUYVo=;
        b=MsdVg8iAnPnTi4J/LXHU62n+Qgyt39dJwbzx+v8MRSgCUdDGoGfZGR4rrKvaUjbs4a
         QpC6XWT9qQ8PUhI+QPDtyzbhFGc/NgqRkWi7VuunAgpuZFko6IvYSVO07ABfjFHJEJ+K
         tqZOohOHRXb8Mlr9wJkA4+YDH5y3TC5vQNIDrC2RGpIqp+86hQC2BLLg/JOIZRtXid+7
         dbzKvPC+rPuiSb3GRSMlcA83cktNkvaJcDtXFFIv7B6Q5wbFWzfyjQQwIlCmBgH3x8er
         QNVcLye61xGMvWEIwcVgxX03jijFPG4gD/1NR7Wrw7gXti55UPLnr+y/YWQEay4geTOs
         tW5w==
X-Gm-Message-State: AOAM531LBFkfzowZg1VM4dFkySP3i/b7AdG+t2TSkNppJEq5i3q61GAl
        S5cYGEG7CvYxv/hxACM9RpowKBV61A==
X-Google-Smtp-Source: ABdhPJyJ3/JFig3z6XJpZbo8wtP429IIl5HYXLjY82kR2w51cV+U3uCKk5dgAOuCJN4Ul3/DlI15GA==
X-Received: by 2002:a05:620a:2a0f:: with SMTP id o15mr12779399qkp.444.1636724404207;
        Fri, 12 Nov 2021 05:40:04 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id u11sm2755436qko.33.2021.11.12.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:40:03 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:3da4:ae9:63f5:5ac8])
        by serve.minyard.net (Postfix) with ESMTPA id BED071800BB;
        Fri, 12 Nov 2021 13:40:02 +0000 (UTC)
From:   minyard@acm.org
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corey Minyard <minyard@acm.org>,
        Andrew Manley <andrew.manley@sealingtech.com>
Subject: [PATCH v2 1/2] i2c:imx: Add timer for handling the stop condition
Date:   Fri, 12 Nov 2021 07:39:55 -0600
Message-Id: <20211112133956.655179-2-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112133956.655179-1-minyard@acm.org>
References: <20211112133956.655179-1-minyard@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Corey Minyard <minyard@acm.org>

Most IMX I2C interfaces don't generate an interrupt on a stop condition,
so it won't generate a timely stop event on a slave mode transfer.
Some users, like IPMB, need a timely stop event to work properly.

So, add a timer and add the proper handling to generate a stop event in
slave mode if the interface goes idle.

Signed-off-by: Corey Minyard <minyard@acm.org>
Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 92 ++++++++++++++++++++++++++++--------
 1 file changed, 73 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3576b63a6c03..27f969b3dc07 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -37,6 +37,8 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/spinlock.h>
+#include <linux/hrtimer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -51,6 +53,8 @@
 /* This will be the driver name the kernel reports */
 #define DRIVER_NAME "imx-i2c"
 
+#define I2C_IMX_CHECK_DELAY 30000 /* Time to check for bus idle, in NS */
+
 /*
  * Enable DMA if transfer byte size is bigger than this threshold.
  * As the hardware request, it must bigger than 4 bytes.\
@@ -210,6 +214,10 @@ struct imx_i2c_struct {
 	struct imx_i2c_dma	*dma;
 	struct i2c_client	*slave;
 	enum i2c_slave_event last_slave_event;
+
+	/* For checking slave events. */
+	spinlock_t     slave_lock;
+	struct hrtimer slave_timer;
 };
 
 static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
@@ -680,7 +688,7 @@ static void i2c_imx_slave_event(struct imx_i2c_struct *i2c_imx,
 
 static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
 {
-	u8 val;
+	u8 val = 0;
 
 	while (i2c_imx->last_slave_event != I2C_SLAVE_STOP) {
 		switch (i2c_imx->last_slave_event) {
@@ -701,10 +709,11 @@ static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
 	}
 }
 
-static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
-				     unsigned int status, unsigned int ctl)
+/* Returns true if the timer should be restarted, false if not. */
+static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
+					unsigned int status, unsigned int ctl)
 {
-	u8 value;
+	u8 value = 0;
 
 	if (status & I2SR_IAL) { /* Arbitration lost */
 		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
@@ -712,6 +721,16 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
 			return IRQ_HANDLED;
 	}
 
+	if (!(status & I2SR_IBB)) {
+		/* No master on the bus, that could mean a stop condition. */
+		i2c_imx_slave_finish_op(i2c_imx);
+		return IRQ_HANDLED;
+	}
+
+	if (!(status & I2SR_ICF))
+		/* Data transfer still in progress, ignore this. */
+		goto out;
+
 	if (status & I2SR_IAAS) { /* Addressed as a slave */
 		i2c_imx_slave_finish_op(i2c_imx);
 		if (status & I2SR_SRW) { /* Master wants to read from us*/
@@ -737,16 +756,9 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
 			imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
 		}
 	} else if (!(ctl & I2CR_MTX)) { /* Receive mode */
-		if (status & I2SR_IBB) { /* No STOP signal detected */
-			value = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
-			i2c_imx_slave_event(i2c_imx,
-					    I2C_SLAVE_WRITE_RECEIVED, &value);
-		} else { /* STOP signal is detected */
-			dev_dbg(&i2c_imx->adapter.dev,
-				"STOP signal detected");
-			i2c_imx_slave_event(i2c_imx,
-					    I2C_SLAVE_STOP, &value);
-		}
+		value = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_imx_slave_event(i2c_imx,
+				    I2C_SLAVE_WRITE_RECEIVED, &value);
 	} else if (!(status & I2SR_RXAK)) { /* Transmit mode received ACK */
 		ctl |= I2CR_MTX;
 		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
@@ -755,15 +767,43 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
 				    I2C_SLAVE_READ_PROCESSED, &value);
 
 		imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
-	} else { /* Transmit mode received NAK */
+	} else { /* Transmit mode received NAK, operation is done */
 		ctl &= ~I2CR_MTX;
 		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
 		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_imx_slave_finish_op(i2c_imx);
+		return IRQ_HANDLED;
 	}
 
+out:
+	/*
+	 * No need to check the return value here.  If it returns 0 or
+	 * 1, then everything is fine.  If it returns -1, then the
+	 * timer is running in the handler.  This will still work,
+	 * though it may be redone (or already have been done) by the
+	 * timer function.
+	 */
+	hrtimer_try_to_cancel(&i2c_imx->slave_timer);
+	hrtimer_forward_now(&i2c_imx->slave_timer, I2C_IMX_CHECK_DELAY);
+	hrtimer_restart(&i2c_imx->slave_timer);
 	return IRQ_HANDLED;
 }
 
+static enum hrtimer_restart i2c_imx_slave_timeout(struct hrtimer *t)
+{
+	struct imx_i2c_struct *i2c_imx = container_of(t, struct imx_i2c_struct,
+						      slave_timer);
+	unsigned int ctl, status;
+	unsigned long flags;
+
+	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	i2c_imx_slave_handle(i2c_imx, status, ctl);
+	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
+	return HRTIMER_NORESTART;
+}
+
 static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
 {
 	int temp;
@@ -843,7 +883,9 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
+	unsigned long flags;
 
+	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
 	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 
@@ -851,14 +893,20 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
 		if (i2c_imx->slave) {
 			if (!(ctl & I2CR_MSTA)) {
-				return i2c_imx_slave_isr(i2c_imx, status, ctl);
-			} else if (i2c_imx->last_slave_event !=
-				   I2C_SLAVE_STOP) {
-				i2c_imx_slave_finish_op(i2c_imx);
+				irqreturn_t ret;
+
+				ret = i2c_imx_slave_handle(i2c_imx,
+							   status, ctl);
+				spin_unlock_irqrestore(&i2c_imx->slave_lock,
+						       flags);
+				return ret;
 			}
+			i2c_imx_slave_finish_op(i2c_imx);
 		}
+		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
 		return i2c_imx_master_isr(i2c_imx, status);
 	}
+	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
 
 	return IRQ_NONE;
 }
@@ -1378,6 +1426,10 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (!i2c_imx)
 		return -ENOMEM;
 
+	spin_lock_init(&i2c_imx->slave_lock);
+	hrtimer_init(&i2c_imx->slave_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
+	i2c_imx->slave_timer.function = i2c_imx_slave_timeout;
+
 	match = device_get_match_data(&pdev->dev);
 	if (match)
 		i2c_imx->hwdata = match;
@@ -1491,6 +1543,8 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	hrtimer_cancel(&i2c_imx->slave_timer);
+
 	/* remove adapter */
 	dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
 	i2c_del_adapter(&i2c_imx->adapter);
-- 
2.25.1

