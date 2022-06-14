Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE8254AE0C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 12:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243248AbiFNKOW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 06:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242905AbiFNKON (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 06:14:13 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C98A4615B;
        Tue, 14 Jun 2022 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655201651; x=1686737651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pgiEnpbzfxx0xiXD6WVAkT4RHdqsHlan76yu59uc6B8=;
  b=BejxgrJ7HShSO5ow+qM2AnSmwEZcRjRdi0tw7VpngJgA/0kWPKknEjHb
   zcxN5E5vf2oWXrdYNQ1XI956DfNuT3nNYgLMAXBuQdsdhZM0jInsvYLVB
   TGlN8du97LHHSHDToBa5K4oLkgvhj3k+DLl/5rqCg7Yp8+R3uACBbNLj1
   iC0sjwGPbOfkQzfoDf7RiW2lNUVDh4+UQY6X7nQL0un4GM6Hs+86k6i69
   s4RNO9hPfdAUtwcZNX6CUkt1qPmQY5487Dt0/aVmuQIXLm4pWZAGhmIoS
   X5Snibc/i8h8MEZ5du8tReM3J7g2X11napL0dkACMGiybdm76HV9fJb2q
   g==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="99927268"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 03:14:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 03:14:10 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 14 Jun 2022 03:14:07 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <andrew@sanpeople.com>,
        <mhoffman@lightlink.com>, <khali@linux-fr.org>, <wsa@kernel.org>,
        <peda@axentia.se>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [RESEND 1/3] i2c: at91: move i2c_recover_bus() outside of at91_do_twi_transfer()
Date:   Tue, 14 Jun 2022 13:13:45 +0300
Message-ID: <20220614101347.16910-2-codrin.ciubotariu@microchip.com>
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

This patch doesn't add a functional change, it just separates the recovery
from the transfer itself.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Removed 'Fixes' tag

 drivers/i2c/busses/i2c-at91-master.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index c0c35785a0dc..34df1614bc37 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -639,13 +639,6 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 			       AT91_TWI_THRCLR | AT91_TWI_LOCKCLR);
 	}
 
-	/*
-	 * some faulty I2C slave devices might hold SDA down;
-	 * we can send a bus clear command, hoping that the pins will be
-	 * released
-	 */
-	i2c_recover_bus(&dev->adapter);
-
 	return ret;
 }
 
@@ -716,7 +709,17 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 	ret = at91_do_twi_transfer(dev);
 	i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
 
-	ret = (ret < 0) ? ret : num;
+	if (ret < 0) {
+		/*
+		 * some faulty I2C slave devices might hold SDA down;
+		 * we can send a bus clear command, hoping that the pins will be
+		 * released
+		 */
+		i2c_recover_bus(&dev->adapter);
+	} else {
+		ret = num;
+	}
+
 out:
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
-- 
2.34.1

