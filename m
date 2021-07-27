Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C673D7422
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 13:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236318AbhG0LQR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 07:16:17 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:22370 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236472AbhG0LQQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 07:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1627384576; x=1658920576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qvjts8FHdUOt3MATa6RJ6cMOmBfjlcKN7y0bK5Yzco4=;
  b=ivGPv9UdaVPfWviQTXPdl0BlwjU8zEYNjYChWgnxBoKjLEWcOO30cdOX
   W3Uyy6n4+MM3BiS/pN9dR/kXfyz7SjL2D5yTQn8TxAebANN2vng3gf/Ku
   /RjG+fcYPP3l+CkvA4/w0s4bHhGyn2RHyfoYLsmkOuNu5kqvpaPy2Hnj3
   vJUTEYcIYKIO+1jiqtI3sSnKnlRLlvLYX3N84S9jvMnHPPUNF7v6Va7AK
   8DGM1fULdPOVn374VHHVsSashTXOVVvo4E6xSpIhpZUuxM20cA3bsOf7B
   ek3NTL5BOZKsrkvJKughpZSby1JuH1T9Vj/XNgdvRkKYibHoO+943GFnr
   w==;
IronPort-SDR: WtDyj/QDN48Sivi6Ul4lXOOi3UKaNVkCHPYxgbY3F0Zh90lwCtuXquHe/h38v3JhVqYjwvj90y
 zYgiMKW0yrO1Bq/69HB1qGFYOSnwFES7kF9+TAzbGd/M1nFMlzZQwjVnPinNHmVgpAHEn+V+2B
 bfP+s3u6JuxXUnb5aqFBYh2mzvoPSwD1PVza0tlE4SAD76tBkU6QJ73Eea4TsPL7aHlVzOMo8/
 xIznVYLS0QtYCkyTr7dgNgVTZP47H+LI+IOtXqTgUoSyXyFgZ6SzUSE62orTCCf9iVcuOZhSAA
 u4uKGmhxhZIheHjAWCr/GvoU
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; 
   d="scan'208";a="137698107"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2021 04:16:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 04:16:15 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 27 Jul 2021 04:16:12 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <andrew@sanpeople.com>,
        <mhoffman@lightlink.com>, <khali@linux-fr.org>, <wsa@kernel.org>,
        "Codrin Ciubotariu" <codrin.ciubotariu@microchip.com>
Subject: [PATCH 2/3] i2c: at91: keep the controller disabled when it is not used
Date:   Tue, 27 Jul 2021 14:15:53 +0300
Message-ID: <20210727111554.1338832-3-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727111554.1338832-1-codrin.ciubotariu@microchip.com>
References: <20210727111554.1338832-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The controller (master mode) should be disabled when it is not used, to
avoid potential glitches on the bus. The controller must be disabled
only when the controller is not running.
This fixes an issue on Microchip's SAMA5D4 platform when pinctrl changes
the I2C's pin states between GPIO and I2C, done when GPIO recovery is used.

Fixes: 813e30e9ab91 ("i2c: New Atmel AT91 bus driver")
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 drivers/i2c/busses/i2c-at91-master.c | 34 ++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 0352dc09d697..1f91829438fd 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -38,7 +38,7 @@ void at91_init_twi_bus_master(struct at91_twi_dev *dev)
 	/* FIFO should be enabled immediately after the software reset */
 	if (dev->fifo_size)
 		at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_FIFOEN);
-	at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_MSEN);
+	at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_MSDIS);
 	at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_SVDIS);
 	at91_twi_write(dev, AT91_TWI_CWGR, dev->twi_cwgr_reg);
 
@@ -593,7 +593,6 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 	if (time_left == 0) {
 		dev->transfer_status |= at91_twi_read(dev, AT91_TWI_SR);
 		dev_err(dev->dev, "controller timed out\n");
-		at91_init_twi_bus(dev);
 		ret = -ETIMEDOUT;
 		goto error;
 	}
@@ -642,6 +641,26 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 	return ret;
 }
 
+static void at91_twi_disable(struct at91_twi_dev *dev)
+{
+	/* return if previous operation is completed */
+	if (!(at91_twi_read(dev, AT91_TWI_SR) & AT91_TWI_TXCOMP)) {
+		/* wait for previous command to complete before disabling the controller */
+		dev_dbg(dev->dev, "wait for command to complete...\n");
+		reinit_completion(&dev->cmd_complete);
+		dev->transfer_status = 0;
+		at91_twi_write(dev, AT91_TWI_IER, AT91_TWI_TXCOMP);
+		wait_for_completion_timeout(&dev->cmd_complete, dev->adapter.timeout);
+		if (!(dev->transfer_status & AT91_TWI_TXCOMP)) {
+			dev_dbg(dev->dev, "IP still busy, resetting the controller...\n");
+			at91_init_twi_bus(dev);
+			return;
+		}
+	}
+
+	at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_MSDIS);
+}
+
 static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 {
 	struct at91_twi_dev *dev = i2c_get_adapdata(adap);
@@ -656,6 +675,8 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 	if (ret < 0)
 		goto out;
 
+	at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_MSEN);
+
 	if (num == 2) {
 		int internal_address = 0;
 		int i;
@@ -699,13 +720,22 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 	ret = at91_do_twi_transfer(dev);
 
 	if (ret < 0) {
+		/* disable controller before using GPIO recovery */
+		if (!dev->pdata->has_clear_cmd)
+			at91_twi_disable(dev);
+
 		/*
 		 * some faulty I2C slave devices might hold SDA down;
 		 * we can send a bus clear command, hoping that the pins will be
 		 * released
 		 */
 		i2c_recover_bus(&dev->adapter);
+
+		/* disable controller if not disabled before */
+		if (dev->pdata->has_clear_cmd)
+			at91_twi_disable(dev);
 	} else {
+		at91_twi_disable(dev);
 		ret = num;
 	}
 
-- 
2.30.2

