Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A812E0F1A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Dec 2020 20:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgLVTvj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Dec 2020 14:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgLVTvi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Dec 2020 14:51:38 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89953C0613D6
        for <linux-i2c@vger.kernel.org>; Tue, 22 Dec 2020 11:50:58 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id y8so7944347plp.8
        for <linux-i2c@vger.kernel.org>; Tue, 22 Dec 2020 11:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=platinasystems-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnrWzcZcKCPPQwHRjj320KhXxSg0ErADEbe3H1rw//0=;
        b=gGUrUFMiw4JWsWifL0TXf2jyogF2W8pHnJa+hyI4msW+Mh9cnxp6FXcKIxFRNMD4Jj
         DH8BAGHgXF6wc4ZqBJzj2PVQzGyaZdAPRPBr77Ibt2uPXm6Wmgjl0i8G5MQt+jXDGHx1
         EJRJN+g0KIrsQZP02GadFsj42H1BN/PBaNLuph4my0rmWq/xt3GF0AhQjCbK1Ght+hNT
         uAfsziMBPy9G4q/NfE0dknSHClk1pSZZjZLF+yCa/scL2yFYMfH1gtTYyLjTlfGfg89a
         n1jHUIsvZp9tXlP6b7HhmVQCzgUPXfv2OQlVzFEXYBSttDt6/XkQmYyOB4TaQ2BPLgeF
         PMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnrWzcZcKCPPQwHRjj320KhXxSg0ErADEbe3H1rw//0=;
        b=dLohhSIuq+qVEofk3CI4XgzZpkekw21ryuZw4GHxs9Tu1Fd2AMCuvr8cV+HCJOCfbD
         WkC6P6qADHcLqqEVLiuJG+/blMufR0Srg4RrphoJAPKSeOO0aInTrojDs4qfRK5pk0ZB
         +CoOBhTy2nMxo7x4v5eAIIz+qwILNOclAtujbxecGp/5xNfcaGdDJykWGt0Cr9pqjl5y
         U5RwrH4E1redjHl8DKg4fUL8m/HHgtJXMkBtcj7cBgJ/UgfIjJIE7pn+fUXcYFKIhKxd
         KaygYF8zSFNUydzPzA5Pfv9k4TbFdG2JRJ8Z/nULu0cpkVdV+NDpTmkscf8Qn+9U4nnt
         b4MA==
X-Gm-Message-State: AOAM533Wzwu2LyDhvWrmL6iFNW9LjPLWzUqwbyqwX8Im0E8rh2hICXms
        u6la0ZLogoKW/LG5epaPaMGcSg==
X-Google-Smtp-Source: ABdhPJwcc+tKiFWFDEimn0YEP31KJTEdUFiu3Aj7QQrs+YsH75VI7hSfoHDyKmNPOdLKF1L/tN9FdQ==
X-Received: by 2002:a17:90a:8985:: with SMTP id v5mr22935126pjn.27.1608666657981;
        Tue, 22 Dec 2020 11:50:57 -0800 (PST)
Received: from localhost.localdomain ([207.53.255.56])
        by smtp.gmail.com with ESMTPSA id b72sm20770253pfb.129.2020.12.22.11.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 11:50:57 -0800 (PST)
From:   Kevin Paul Herbert <kph@platinasystems.com>
To:     biwen.li@nxp.com, leoyang.li@nxp.com, linux@rempel-privat.de,
        kernel@pengutronix.de, wsa@the-dreams.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        xiaoning.wang@nxp.com, o.rempel@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, xiaobo.xie@nxp.com,
        linux-arm-kernel@lists.infradead.org, biwen.li@oss.nxp.com,
        kph@platinasystems.com
Subject: [PATCH] i2c-imx.c: Synthesize end of transaction events without idle interrupts
Date:   Tue, 22 Dec 2020 11:48:50 -0800
Message-Id: <20201222194850.2274527-1-kph@platinasystems.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Only the Layerscape SoCs have interrupts on bus idle, which facilitate
sending events which complete slave bus transactions.

Add support for synthesizing missing events. If we see a master request,
or a newly addressed slave request, if the last event sent to the backend
was I2C_SLAVE_READ_REQUESTED, send the backend a I2C_SLAVE_READ_PROCESSED
followed by I2C_SLAVE_STOP. For all other events, send an I2C_SLAVE_STOP.

Signed-off-by: Kevin Paul Herbert <kph@platinasystems.com>
---
 drivers/i2c/busses/i2c-imx.c | 59 +++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index b444fbf1a262..b3e2a6a7fc19 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -209,6 +209,7 @@ struct imx_i2c_struct {
 
 	struct imx_i2c_dma	*dma;
 	struct i2c_client	*slave;
+	enum i2c_slave_event last_slave_event;
 };
 
 static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
@@ -662,6 +663,36 @@ static void i2c_imx_enable_bus_idle(struct imx_i2c_struct *i2c_imx)
 	}
 }
 
+static void i2c_imx_slave_event(struct imx_i2c_struct *i2c_imx,
+				enum i2c_slave_event event, u8 *val)
+{
+	i2c_slave_event(i2c_imx->slave, event, val);
+	i2c_imx->last_slave_event = event;
+}
+
+static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
+{
+	u8 val;
+
+	while (i2c_imx->last_slave_event != I2C_SLAVE_STOP) {
+		switch (i2c_imx->last_slave_event) {
+		case I2C_SLAVE_READ_REQUESTED:
+			i2c_imx_slave_event(i2c_imx, I2C_SLAVE_READ_PROCESSED,
+					    &val);
+			break;
+
+		case I2C_SLAVE_WRITE_REQUESTED:
+		case I2C_SLAVE_READ_PROCESSED:
+		case I2C_SLAVE_WRITE_RECEIVED:
+			i2c_imx_slave_event(i2c_imx, I2C_SLAVE_STOP, &val);
+			break;
+
+		case I2C_SLAVE_STOP:
+			break;
+		}
+	}
+}
+
 static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
 				     unsigned int status, unsigned int ctl)
 {
@@ -674,9 +705,11 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
 	}
 
 	if (status & I2SR_IAAS) { /* Addressed as a slave */
+		i2c_imx_slave_finish_op(i2c_imx);
 		if (status & I2SR_SRW) { /* Master wants to read from us*/
 			dev_dbg(&i2c_imx->adapter.dev, "read requested");
-			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_READ_REQUESTED, &value);
+			i2c_imx_slave_event(i2c_imx,
+					    I2C_SLAVE_READ_REQUESTED, &value);
 
 			/* Slave transmit */
 			ctl |= I2CR_MTX;
@@ -686,7 +719,8 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
 			imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
 		} else { /* Master wants to write to us */
 			dev_dbg(&i2c_imx->adapter.dev, "write requested");
-			i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_REQUESTED, &value);
+			i2c_imx_slave_event(i2c_imx,
+					    I2C_SLAVE_WRITE_REQUESTED, &value);
 
 			/* Slave receive */
 			ctl &= ~I2CR_MTX;
@@ -697,17 +731,20 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
 	} else if (!(ctl & I2CR_MTX)) { /* Receive mode */
 		if (status & I2SR_IBB) { /* No STOP signal detected */
 			value = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
-			i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_RECEIVED, &value);
+			i2c_imx_slave_event(i2c_imx,
+					    I2C_SLAVE_WRITE_RECEIVED, &value);
 		} else { /* STOP signal is detected */
 			dev_dbg(&i2c_imx->adapter.dev,
 				"STOP signal detected");
-			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
+			i2c_imx_slave_event(i2c_imx,
+					    I2C_SLAVE_STOP, &value);
 		}
 	} else if (!(status & I2SR_RXAK)) { /* Transmit mode received ACK */
 		ctl |= I2CR_MTX;
 		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
 
-		i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_READ_PROCESSED, &value);
+		i2c_imx_slave_event(i2c_imx,
+				    I2C_SLAVE_READ_PROCESSED, &value);
 
 		imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
 	} else { /* Transmit mode received NAK */
@@ -748,6 +785,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 		return -EBUSY;
 
 	i2c_imx->slave = client;
+	i2c_imx->last_slave_event = I2C_SLAVE_STOP;
 
 	/* Resume */
 	ret = pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
@@ -800,10 +838,17 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 
 	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
 	if (status & I2SR_IIF) {
 		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
-		if (i2c_imx->slave && !(ctl & I2CR_MSTA))
-			return i2c_imx_slave_isr(i2c_imx, status, ctl);
+		if (i2c_imx->slave) {
+			if (!(ctl & I2CR_MSTA)) {
+				return i2c_imx_slave_isr(i2c_imx, status, ctl);
+			} else if (i2c_imx->last_slave_event !=
+				   I2C_SLAVE_STOP) {
+				i2c_imx_slave_finish_op(i2c_imx);
+			}
+		}
 		return i2c_imx_master_isr(i2c_imx, status);
 	}
 
-- 
2.25.1

