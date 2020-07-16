Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C44221DE2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 10:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgGPIJC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 04:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgGPIJA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 04:09:00 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFEAC08C5C0
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 01:09:00 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id k27so4472856pgm.2
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aCGGactJae57qbbpYq++cFizr8LPhk+6s9WIHNZJ04M=;
        b=gyYRQVs7B8rmkhComuQRCcJpLDEtIx8vxhDmau+6R2aE5Q5MdT3CM/RdY/j0v9jZF+
         KwtzTbBXKD0F3ABDzmqXSEvGouXyCrNujVr9fZ/sCrw6ata/aQq/hOHhf1npzTRchpRS
         +L4OsbBx5DEXz/FYoqJCpx0QOUST0xnjM69Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aCGGactJae57qbbpYq++cFizr8LPhk+6s9WIHNZJ04M=;
        b=bXOQCThGfJKKrlXYHAFQbUg6scvqu2WP9YuFuP4IfuOOxVZIxTisBxbEj/1mvhMfx7
         hPX3lDWIv8WCVoqyPiyMHguJ9tMR/pgLlH3SrkcpEt4d8gnJk05qVyHPmmhERAOBz38Z
         EJmEmXE47ucEEpqKtyPxmTkAIZ8KfPwIDishCxlFgP14apH6muv3LmqphuaoMD+i6hWu
         dqYwCZ5+V9ZKF0xUJJRg3Df4jTQJ1b42Ys7QlO9IJdQH1iAvRQtd52RTbOwWUe1ne+ZQ
         GEgpE0KDhJi6nQtUuP2oozhyI3uQACHIBng/n/LSMlDkAl5h3+2w+/FMPANR8lCnYehc
         hg3w==
X-Gm-Message-State: AOAM532iL+6CtEr+jQpUctNMjeCQaEYZgl98s/iR/F8TxMnTvGLycctY
        3CtoQwIooOlXwb1Ola4F5oNQBygIst8=
X-Google-Smtp-Source: ABdhPJzY89owDrFh1Z8KnO6xelQRBmWpGhbIDfhY7bcls9gGw1PkpgX/IgpGYwIRWXuRLq7oDoIdPw==
X-Received: by 2002:aa7:9f8f:: with SMTP id z15mr2592603pfr.73.1594886939485;
        Thu, 16 Jul 2020 01:08:59 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id a3sm4353085pgd.73.2020.07.16.01.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 01:08:58 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH V1 2/2] i2c: iproc: add slave pec support
Date:   Thu, 16 Jul 2020 13:38:36 +0530
Message-Id: <20200716080836.2279-3-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716080836.2279-1-rayagonda.kokatanur@broadcom.com>
References: <20200716080836.2279-1-rayagonda.kokatanur@broadcom.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Iproc supports PEC computation and checking in both Master
and Slave mode.

This patch adds support for PEC in slave mode.

Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 50 +++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 8a3c98866fb7..51c8b165bb5e 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -93,6 +93,7 @@
 #define S_CMD_STATUS_MASK            0x07
 #define S_CMD_STATUS_SUCCESS         0x0
 #define S_CMD_STATUS_TIMEOUT         0x5
+#define S_CMD_PEC_SHIFT              8
 
 #define IE_OFFSET                    0x38
 #define IE_M_RX_FIFO_FULL_SHIFT      31
@@ -138,7 +139,9 @@
 #define S_RX_OFFSET                  0x4c
 #define S_RX_STATUS_SHIFT            30
 #define S_RX_STATUS_MASK             0x03
-#define S_RX_PEC_ERR_SHIFT           29
+#define S_RX_PEC_ERR_SHIFT           28
+#define S_RX_PEC_ERR_MASK            0x3
+#define S_RX_PEC_ERR                 0x1
 #define S_RX_DATA_SHIFT              0
 #define S_RX_DATA_MASK               0xff
 
@@ -205,6 +208,8 @@ struct bcm_iproc_i2c_dev {
 	/* bytes that have been read */
 	unsigned int rx_bytes;
 	unsigned int thld_bytes;
+
+	bool en_s_pec;
 };
 
 /*
@@ -321,6 +326,24 @@ static void bcm_iproc_i2c_check_slave_status(
 	}
 }
 
+static int bcm_iproc_smbus_check_slave_pec(struct bcm_iproc_i2c_dev *iproc_i2c,
+					   u32 val)
+{
+	u8 err_status;
+	int ret = 0;
+
+	if (!iproc_i2c->en_s_pec)
+		return ret;
+
+	err_status = (u8)((val >> S_RX_PEC_ERR_SHIFT) & S_RX_PEC_ERR_MASK);
+	if (err_status == S_RX_PEC_ERR) {
+		dev_err(iproc_i2c->device, "Slave PEC error\n");
+		ret = -EBADMSG;
+	}
+
+	return ret;
+}
+
 static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
 				    u32 status)
 {
@@ -347,6 +370,8 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
 			iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
 
 			val = BIT(S_CMD_START_BUSY_SHIFT);
+			if (iproc_i2c->en_s_pec)
+				val |= BIT(S_CMD_PEC_SHIFT);
 			iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
 
 			/*
@@ -361,9 +386,19 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
 			value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
 			i2c_slave_event(iproc_i2c->slave,
 					I2C_SLAVE_WRITE_RECEIVED, &value);
-			if (rx_status == I2C_SLAVE_RX_END)
-				i2c_slave_event(iproc_i2c->slave,
-						I2C_SLAVE_STOP, &value);
+			if (rx_status == I2C_SLAVE_RX_END) {
+				int ret;
+
+				ret = bcm_iproc_smbus_check_slave_pec(iproc_i2c,
+								      val);
+				if (!ret)
+					i2c_slave_event(iproc_i2c->slave,
+							I2C_SLAVE_STOP, &value);
+				else
+					i2c_slave_event(iproc_i2c->slave,
+							I2C_SLAVE_PEC_ERR,
+							&value);
+			}
 		}
 	} else if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
 		/* Master read other than start */
@@ -372,6 +407,8 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
 
 		iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
 		val = BIT(S_CMD_START_BUSY_SHIFT);
+		if (iproc_i2c->en_s_pec)
+			val |= BIT(S_CMD_PEC_SHIFT);
 		iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
 	}
 
@@ -1065,6 +1102,11 @@ static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave)
 	if (slave->flags & I2C_CLIENT_TEN)
 		return -EAFNOSUPPORT;
 
+	/* Enable partial slave HW PEC support if requested by the client */
+	iproc_i2c->en_s_pec = !!(slave->flags & I2C_CLIENT_PEC);
+	if (iproc_i2c->en_s_pec)
+		dev_info(iproc_i2c->device, "Enable PEC\n");
+
 	iproc_i2c->slave = slave;
 	bcm_iproc_i2c_slave_init(iproc_i2c, false);
 	return 0;
-- 
2.17.1

