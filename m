Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A69D54AE06
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 12:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242115AbiFNKO0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 06:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242741AbiFNKOR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 06:14:17 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB5846676;
        Tue, 14 Jun 2022 03:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655201656; x=1686737656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bm/yjNGr7vqej9BOgwcKSYBI7QKfQf6sfv+L/ygDrJU=;
  b=T/1+5ayqmRFoLqa0mTpUpDC0gt8gXYoWWj5pzNBBxExjYzkFSw8yvNze
   KqmnanOj3SFQY/ZO2opm7cZB6rei6y/al8N6n04dxOsto0k9wIycCBiQ7
   VI4wCfKsTxEcwfMIfP9OZ/CPyHL4+pz4OlIsl7d6CETdJaxKvDpmiOAop
   z36sJQHG/EoYlajICcyMVbTJQ2Bze3ZQlm6IgZ6KhoUIp14o1V4SIxV1F
   T6La1TTRIr/SMHUSK4zf2+809mJhCB/EOdnaiBR4LFrQZslclk+hni6Yu
   4smd2EYZ0+YI9mpjXfTyx3C+dSgyMZm1Pu0VnjLQnXNTvltUthM2vzF8d
   w==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="160219951"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 03:14:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 03:14:14 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 14 Jun 2022 03:14:10 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <andrew@sanpeople.com>,
        <mhoffman@lightlink.com>, <khali@linux-fr.org>, <wsa@kernel.org>,
        <peda@axentia.se>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [RESEND 2/3] i2c: at91: keep the controller disabled when it is not used
Date:   Tue, 14 Jun 2022 13:13:46 +0300
Message-ID: <20220614101347.16910-3-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
References: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 34df1614bc37..14c2a4856978 100644
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
@@ -657,6 +676,8 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 	if (ret < 0)
 		goto out;
 
+	at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_MSEN);
+
 	if (num == 2) {
 		int internal_address = 0;
 		int i;
@@ -710,13 +731,22 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 	i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
 
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
2.34.1

