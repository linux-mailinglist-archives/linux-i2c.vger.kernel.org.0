Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF61261048
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 12:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbgIHKwf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 06:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729643AbgIHKwZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 06:52:25 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67ADC061755;
        Tue,  8 Sep 2020 03:52:12 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id z22so21813126ejl.7;
        Tue, 08 Sep 2020 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KLDlzIvUOFGGLRlrD8QQrAYMaG6PmpcCYV7mC0ZnwE4=;
        b=dzMP9yqV+fMeMKkA4sHsMY+quS506pMim1yIB7BqlY0WfNx5ZrF37IZA2RTVRMk+2E
         FY0aYpxZ5l7cmL9MmDrSfLK0gmXjVmNnS3QTxKDEIyDoDRC0SAPVHRB4AG6B6t6LuMo2
         4hnINJhaqGkqhX/0I8E2K+goPzHVkJKaHkBxqReFj3NRaEoz/kzsNPqERggyS4uM9mhO
         qeGa2TZcOXmjqRZZakQseCMKkSYEoeIGLtg+X2YVOPCvK0cZiW4cCKENZZB8py28XQvu
         rMBisoonm+cfRKcCTiTHCr73GtbsX0/R0002xamoOxgv2ERc5oUVyWHVL7asxoBk0Rg3
         T71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KLDlzIvUOFGGLRlrD8QQrAYMaG6PmpcCYV7mC0ZnwE4=;
        b=f4DSseZQS4aPA6D51URLqKOICQdX7DA6oWzllu6pdVjXnHWbg01PSJ6LkEk6sEXZnr
         1rx+iUFSr103k0zFZWyL7qK5/2DYGokswF0jnVoJAV0xVDauSP5g5QZELZmzt+8OnK17
         MX6rQx9X5/EHBYeqDOQN71MWmp79tK4I/aYen0dX7jgTHERbuo+zQ99PNY/hYGhkS64H
         8dAgIErzTmHDYwSTICX8WLKvsIvHdPRTcYBOZFMXerZ531aLPGuq/nfiQkGyqT+61fEv
         VUTzVdsDn26tNdARh3bwpXYHwmTL4lDikPaZUMqo4tH56W+mSYv0oM/9Drq4I4C63+0K
         tehQ==
X-Gm-Message-State: AOAM532UeYVs0DhjA8ODv7PxqvtmGmqt7VOoKKLcbSXZQFUOim2g7aCW
        T4vM0E/Cw3jUZiCIGtYOGb4=
X-Google-Smtp-Source: ABdhPJzo2L+4F6BUSjb6gqIxwVMaY322mcwjhr7xCEAcwrBYyLaUOQSG57KzRtGKiofFMjJtdjgYBg==
X-Received: by 2002:a17:906:2b4f:: with SMTP id b15mr26410621ejg.477.1599562331345;
        Tue, 08 Sep 2020 03:52:11 -0700 (PDT)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id bx24sm17618626ejb.51.2020.09.08.03.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 03:52:10 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: [PATCH v2 1/1] i2c: busses: Add support for atomic transfers in Actions Semi Owl driver
Date:   Tue,  8 Sep 2020 13:52:09 +0300
Message-Id: <b6c56858854805b0f03e29b7dde40b20796d5c93.1599561278.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Atomic transfers are required to properly power off a machine through
an I2C controlled PMIC, such as the Actions Semi ATC260x series.

System shutdown may happen with interrupts being disabled and, as a
consequence, the kernel may hang if the driver does not support atomic
transfers.

This functionality is essentially implemented by polling the FIFO
Status register until either Command Execute Completed or NACK Error
bits are set.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
Changes in v2:
 - Dropped unused return codes from owl_i2c_xfer_data(), per Mani's review
 - Rebased patch on v5.9-rc4

 drivers/i2c/busses/i2c-owl.c | 78 ++++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 672f1f239bd6..29605257831f 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -14,6 +14,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 
@@ -76,6 +77,7 @@
 #define OWL_I2C_FIFOCTL_TFR	BIT(2)
 
 /* I2Cc_FIFOSTAT Bit Mask */
+#define OWL_I2C_FIFOSTAT_CECB	BIT(0)
 #define OWL_I2C_FIFOSTAT_RNB	BIT(1)
 #define OWL_I2C_FIFOSTAT_RFE	BIT(2)
 #define OWL_I2C_FIFOSTAT_TFF	BIT(5)
@@ -83,7 +85,8 @@
 #define OWL_I2C_FIFOSTAT_RFD	GENMASK(15, 8)
 
 /* I2C bus timeout */
-#define OWL_I2C_TIMEOUT		msecs_to_jiffies(4 * 1000)
+#define OWL_I2C_TIMEOUT_MS	(4 * 1000)
+#define OWL_I2C_TIMEOUT		msecs_to_jiffies(OWL_I2C_TIMEOUT_MS)
 
 #define OWL_I2C_MAX_RETRIES	50
 
@@ -161,29 +164,25 @@ static void owl_i2c_set_freq(struct owl_i2c_dev *i2c_dev)
 	writel(OWL_I2C_DIV_FACTOR(val), i2c_dev->base + OWL_I2C_REG_CLKDIV);
 }
 
-static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
+static void owl_i2c_xfer_data(struct owl_i2c_dev *i2c_dev)
 {
-	struct owl_i2c_dev *i2c_dev = _dev;
 	struct i2c_msg *msg = i2c_dev->msg;
-	unsigned long flags;
 	unsigned int stat, fifostat;
 
-	spin_lock_irqsave(&i2c_dev->lock, flags);
-
 	i2c_dev->err = 0;
 
 	/* Handle NACK from slave */
 	fifostat = readl(i2c_dev->base + OWL_I2C_REG_FIFOSTAT);
 	if (fifostat & OWL_I2C_FIFOSTAT_RNB) {
 		i2c_dev->err = -ENXIO;
-		goto stop;
+		return;
 	}
 
 	/* Handle bus error */
 	stat = readl(i2c_dev->base + OWL_I2C_REG_STAT);
 	if (stat & OWL_I2C_STAT_BEB) {
 		i2c_dev->err = -EIO;
-		goto stop;
+		return;
 	}
 
 	/* Handle FIFO read */
@@ -196,18 +195,28 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
 	} else {
 		/* Handle the remaining bytes which were not sent */
 		while (!(readl(i2c_dev->base + OWL_I2C_REG_FIFOSTAT) &
-			 OWL_I2C_FIFOSTAT_TFF) && i2c_dev->msg_ptr < msg->len) {
+			OWL_I2C_FIFOSTAT_TFF) && i2c_dev->msg_ptr < msg->len) {
 			writel(msg->buf[i2c_dev->msg_ptr++],
 			       i2c_dev->base + OWL_I2C_REG_TXDAT);
 		}
 	}
+}
+
+static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
+{
+	struct owl_i2c_dev *i2c_dev = _dev;
+	unsigned long flags;
+
+	spin_lock_irqsave(&i2c_dev->lock, flags);
+
+	owl_i2c_xfer_data(i2c_dev);
 
-stop:
 	/* Clear pending interrupts */
 	owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_STAT,
 			   OWL_I2C_STAT_IRQP, true);
 
 	complete_all(&i2c_dev->msg_complete);
+
 	spin_unlock_irqrestore(&i2c_dev->lock, flags);
 
 	return IRQ_HANDLED;
@@ -235,8 +244,8 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
 	return 0;
 }
 
-static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			       int num)
+static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			       int num, bool atomic)
 {
 	struct owl_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	struct i2c_msg *msg;
@@ -280,11 +289,12 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		goto err_exit;
 	}
 
-	reinit_completion(&i2c_dev->msg_complete);
+	if (!atomic)
+		reinit_completion(&i2c_dev->msg_complete);
 
-	/* Enable I2C controller interrupt */
+	/* Enable/disable I2C controller interrupt */
 	owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
-			   OWL_I2C_CTL_IRQE, true);
+			   OWL_I2C_CTL_IRQE, !atomic);
 
 	/*
 	 * Select: FIFO enable, Master mode, Stop enable, Data count enable,
@@ -352,20 +362,33 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	spin_unlock_irqrestore(&i2c_dev->lock, flags);
 
-	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						adap->timeout);
+	if (atomic) {
+		/* Wait for Command Execute Completed or NACK Error bits */
+		ret = readl_poll_timeout_atomic(i2c_dev->base + OWL_I2C_REG_FIFOSTAT,
+						val, val & (OWL_I2C_FIFOSTAT_CECB |
+							    OWL_I2C_FIFOSTAT_RNB),
+						10, OWL_I2C_TIMEOUT_MS * 1000);
+	} else {
+		time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
+							adap->timeout);
+		if (!time_left)
+			ret = -ETIMEDOUT;
+	}
 
 	spin_lock_irqsave(&i2c_dev->lock, flags);
-	if (time_left == 0) {
+
+	if (ret) {
 		dev_err(&adap->dev, "Transaction timed out\n");
 		/* Send stop condition and release the bus */
 		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
 				   OWL_I2C_CTL_GBCC_STOP | OWL_I2C_CTL_RB,
 				   true);
-		ret = -ETIMEDOUT;
 		goto err_exit;
 	}
 
+	if (atomic)
+		owl_i2c_xfer_data(i2c_dev);
+
 	ret = i2c_dev->err < 0 ? i2c_dev->err : num;
 
 err_exit:
@@ -379,9 +402,22 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return ret;
 }
 
+static int owl_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			int num)
+{
+	return owl_i2c_xfer_common(adap, msgs, num, false);
+}
+
+static int owl_i2c_xfer_atomic(struct i2c_adapter *adap,
+			       struct i2c_msg *msgs, int num)
+{
+	return owl_i2c_xfer_common(adap, msgs, num, true);
+}
+
 static const struct i2c_algorithm owl_i2c_algorithm = {
-	.master_xfer    = owl_i2c_master_xfer,
-	.functionality  = owl_i2c_func,
+	.master_xfer	     = owl_i2c_xfer,
+	.master_xfer_atomic  = owl_i2c_xfer_atomic,
+	.functionality	     = owl_i2c_func,
 };
 
 static const struct i2c_adapter_quirks owl_i2c_quirks = {
-- 
2.28.0

