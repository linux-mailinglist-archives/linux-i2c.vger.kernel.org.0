Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68166287E3C
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 23:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730210AbgJHVou (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 17:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728913AbgJHVor (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Oct 2020 17:44:47 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659A3C0613D2;
        Thu,  8 Oct 2020 14:44:46 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id md26so10177215ejb.10;
        Thu, 08 Oct 2020 14:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+vRhCjiVUVFH3G124IdR61piZRspREO/rEPWGy9BWxg=;
        b=OE2IBRjWd1oAfXKOsWiOL4VCsAwNQrmacHLACHq020C/pF8A01mqO3kz8WdRidTioQ
         YEb40WH5hgxYNl85yufupO6XKmskcdIawqcuqX0O1gbS5N3WpaVdENN+8QMG+z1m4jJQ
         YfxA6d2aEJybfDES/B6qKYxc/1jw7Z1Nd4jIl5WnIvT9Gp/atbnFJr6KtQVmUfuoDa7O
         AheSmt3DnF/gyYENcUhfgQ+AaZmqbYVshRhWUkf/Rev6ESSij5O+2+lAJT1cBH/iTyys
         NhrKVlGG7vXrYmCf5H54lQ9pR82+7QOnzcIG6uGlgSext2FQrtX+R6aW7pW9In5zvU+w
         aQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+vRhCjiVUVFH3G124IdR61piZRspREO/rEPWGy9BWxg=;
        b=q2la0vWN/UBj/jifIJfonjaa2b/oS17YQSf5kVie0HGrHT2d8uNRT7FO/jikvkZdUR
         c6lR03p6KYDIjHRPoH9eDXb/qI2GrB4amHSAMoDne8Uk+qfOD4H1AjuL8ZtLzkk+5Vvr
         Jf/MWnVDQzJHrW0rOj5Qczr2szprDaTawWBcuu1VcN8OjWTjWs8TdwD4bWVTeEW3gZ3O
         /FOdwcWU9tCeBRMmmE6f3uyDfuI1jXhVmYraQQQsBsw55zd8eR/sJD3QVyfmZAalwwaw
         Px7D5yAmDNejbyahfGISJ0qZHCPpt4SU7z7A5Ok7H+DOJdL92aFkNsRaX1CJnu9Qfv0t
         zHQg==
X-Gm-Message-State: AOAM530QGbzFU0Ic/LsCLM3HTyaEO/T0nxM/2EEKAH+3O6HhQhioPjKE
        XkeYOUdwXdyfAcV72+Rgm2A=
X-Google-Smtp-Source: ABdhPJycEWkipjHPOyuKr4qGRzpT/wp+WtXANx4UquZVnTc2ogQ5cZOicR7zj7rC27AN5WotS68Bbg==
X-Received: by 2002:a17:906:515:: with SMTP id j21mr10816344eja.105.1602193485084;
        Thu, 08 Oct 2020 14:44:45 -0700 (PDT)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id i8sm4831800ejg.84.2020.10.08.14.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 14:44:44 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: [PATCH 2/3] i2c: owl: Add support for atomic transfers
Date:   Fri,  9 Oct 2020 00:44:40 +0300
Message-Id: <1af37112fafd6cf069dfe864560f77996f57d80d.1602190168.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/i2c/busses/i2c-owl.c | 76 ++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index a163b8f308c1..547132768119 100644
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
 
@@ -161,15 +164,11 @@ static void owl_i2c_set_freq(struct owl_i2c_dev *i2c_dev)
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
@@ -179,7 +178,7 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
 		/* Clear NACK error bit by writing "1" */
 		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_FIFOSTAT,
 				   OWL_I2C_FIFOSTAT_RNB, true);
-		goto stop;
+		return;
 	}
 
 	/* Handle bus error */
@@ -189,7 +188,7 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
 		/* Clear BUS error bit by writing "1" */
 		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_STAT,
 				   OWL_I2C_STAT_BEB, true);
-		goto stop;
+		return;
 	}
 
 	/* Handle FIFO read */
@@ -207,13 +206,23 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
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
@@ -241,8 +250,8 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
 	return 0;
 }
 
-static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			       int num)
+static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			       int num, bool atomic)
 {
 	struct owl_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	struct i2c_msg *msg;
@@ -286,11 +295,12 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
@@ -358,20 +368,33 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
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
@@ -385,9 +408,22 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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

