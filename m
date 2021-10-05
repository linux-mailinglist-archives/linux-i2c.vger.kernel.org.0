Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0850421B25
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 02:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhJEAeU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 20:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhJEAeT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 20:34:19 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB742C061745;
        Mon,  4 Oct 2021 17:32:29 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id o59-20020a9d2241000000b0054745f28c69so23775581ota.13;
        Mon, 04 Oct 2021 17:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ipz7xffc8Dx6gOQOlB5rGtaa9WYEn6G5MvPEhjCtxRY=;
        b=eaLMgQj6EE8Zaw1EDqnTOZwv3twmHnsUIHj3YwqHeFz8cjm79zIiFO4wOAdOMxDih7
         nXjzGxU3yb2++SHML96tEt80+MiKhKIyjj7E4esRw1gl26OZPSQyJEsw/AP5KATGqjzQ
         ZFP6MkP3l1fYmMrxgmUHvdRisyFklb219+dZl0nxkRr6IoHm8BD3pWdLShgCBajM4c1q
         DcdU2EklA/lxaM9y+MPgQnD0msHDZ3RAO8C23+aj3vz1BcyDWssjpsCAAY65tJF+jh9J
         OUP7LB0N5oBzJ5RUPWL2xVKCHb2ErE8kHBwGWDjYgiD56jsCpW84HKQD5wZnc/UDgPIE
         0Nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ipz7xffc8Dx6gOQOlB5rGtaa9WYEn6G5MvPEhjCtxRY=;
        b=7/232zYKtKqpAWHJp8DUjL8OqRPNjqqxxlRbTJWDe4+iE7UMlc0PhbokCx1Z+ewU4D
         WChm4KaHdc09zJGH/O3MiBrnY56Af655p8arom0bkn7vGTFeFFpSZQ4TJr2sPdn9/303
         kXLZocvHqoX0B/ceYWLLitOi/A7F/OvhJjTe/e9Z5/6+GTYiZdDC5wkMhKXRYIgn/hyi
         nAh0hK98sXiUKB60oFzTjYQjv6l0SqQF9mWEjHHUFz+P7UgkpmuThx1BJHoc7levl34w
         O1kD0JuvCGPxfm8Dib/mJ1VN1+8FHM47w3kfhRqfTEeRR7Oq+5TSOcpmoCTEw1GiiCYG
         1sNg==
X-Gm-Message-State: AOAM5306Rk4pSCJh+iA08GCKeheZD1L0HffyEov+V8AnlozYg4J02/UT
        /3guvrfgVie8Rhz4xx4/uA==
X-Google-Smtp-Source: ABdhPJzIOPKlNmd5AV7rhHjDJnlCHwmmSEo/rLeIIPwrAVi/5hc9YwaOqgwz2QIetb/qIe5k43/rYw==
X-Received: by 2002:a05:6830:128d:: with SMTP id z13mr12178858otp.19.1633393949139;
        Mon, 04 Oct 2021 17:32:29 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id s16sm3134877otq.78.2021.10.04.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:32:27 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:1ce5:3fb4:8fe9:30d1])
        by serve.minyard.net (Postfix) with ESMTPA id AA50B1800F1;
        Tue,  5 Oct 2021 00:32:26 +0000 (UTC)
From:   minyard@acm.org
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org, Corey Minyard <cminyard@mvista.com>,
        Corey Minyard <minyard@acm.org>
Subject: [PATCH 1/3] i2c:imx: Add timer for handling the stop condition
Date:   Mon,  4 Oct 2021 19:32:14 -0500
Message-Id: <20211005003216.2670632-2-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005003216.2670632-1-minyard@acm.org>
References: <20211005003216.2670632-1-minyard@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Most IMX I2C interfaces don't generate an interrupt on a stop condition,
so it won't generate a timely stop event on a slave mode transfer.
Some users, like IPMB, need a timely stop event to work properly.

So, add a timer and add the proper handling to generate a stop event in
slave mode if the interface goes idle.

Signed-off-by: Corey Minyard <minyard@acm.org>
Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
---
 drivers/i2c/busses/i2c-imx.c | 78 +++++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3576b63a6c03..97369fe48b30 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -37,6 +37,8 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -210,6 +212,10 @@ struct imx_i2c_struct {
 	struct imx_i2c_dma	*dma;
 	struct i2c_client	*slave;
 	enum i2c_slave_event last_slave_event;
+
+	/* For checking slave events. */
+	spinlock_t	  slave_lock;
+	struct timer_list slave_timer;
 };
 
 static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
@@ -680,7 +686,7 @@ static void i2c_imx_slave_event(struct imx_i2c_struct *i2c_imx,
 
 static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
 {
-	u8 val;
+	u8 val = 0;
 
 	while (i2c_imx->last_slave_event != I2C_SLAVE_STOP) {
 		switch (i2c_imx->last_slave_event) {
@@ -701,10 +707,11 @@ static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
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
@@ -712,6 +719,16 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
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
@@ -737,16 +754,9 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
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
@@ -755,15 +765,32 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
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
+	mod_timer(&i2c_imx->slave_timer, jiffies + 1);
 	return IRQ_HANDLED;
 }
 
+static void i2c_imx_slave_timeout(struct timer_list *t)
+{
+	struct imx_i2c_struct *i2c_imx = from_timer(i2c_imx, t, slave_timer);
+	unsigned int ctl, status;
+	unsigned long flags;
+
+	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	i2c_imx_slave_handle(i2c_imx, status, ctl);
+	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
+}
+
 static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
 {
 	int temp;
@@ -843,7 +870,9 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
+	unsigned long flags;
 
+	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
 	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 
@@ -851,14 +880,20 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
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
@@ -1378,6 +1413,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (!i2c_imx)
 		return -ENOMEM;
 
+	spin_lock_init(&i2c_imx->slave_lock);
+	timer_setup(&i2c_imx->slave_timer, i2c_imx_slave_timeout, 0);
+
 	match = device_get_match_data(&pdev->dev);
 	if (match)
 		i2c_imx->hwdata = match;
@@ -1491,6 +1529,8 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	del_timer_sync(&i2c_imx->slave_timer);
+
 	/* remove adapter */
 	dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
 	i2c_del_adapter(&i2c_imx->adapter);
-- 
2.25.1

