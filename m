Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61216282553
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Oct 2020 18:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgJCQWH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Oct 2020 12:22:07 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:26458 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgJCQWH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 3 Oct 2020 12:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1601742127; x=1633278127;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bSJ5pW8Xo0q1O7vsir/uXxHmzq8pUP0MTm9cvt1lYQg=;
  b=crpt2sGJ2B5Q+6XglNuvGmYYYTGUV3rg/EVclgVWMiuo+p2NWe+Mykgi
   e6ZswJwZhb4bD9Yf7LoCQSKVYvy7P7s/hkPbbIu9mCgUz836YHLrZELxM
   V5P7P102oL3svgLNGbH57n0JSfsbVnr8mUJw69XBjXYdJNg3746N3dj7f
   l7C9b0xgDjZgvjn4yIQGzrkw4IsZNzsR5MIel6WIlXs+IpOwKoqtDHfzy
   Us7iCC7fnd9WN32BO1eSwqzyyOQzy3xTIQ/DR/yp5Brg6R2kjNd+6e8vZ
   5FCMuiqDP0b7sI1FtX3udA5WFUIPNmCivavdDlPPoYItiR3aktwRQ3NpJ
   w==;
IronPort-SDR: x758Rq0annDbmZ+aa1MJFDKioJnD8rDDjhDgMO3nDjphNui/woQTVlsAvxD/hf45rJf7lP5/S5
 rZ0xDJqlOmqgBVGHM1bnIBr1G5vGum37JuRER6gl/H8fuV5u5rxp2qf+nksrKJj3CFRS57h0zC
 cJ0Qbbu9ceK9lUtACjTPvuKP2fLkzFoo7Vys7PU9FP/XtGKuiWV7DCmdtqtiuKe2KX9F6bLqs7
 +TUyR95DL0NXOKX/WfiT0+SRAynshO5nu+AXa0dlGlAXHv8XTjElEkWwsJRoN9ffmMr9Omm8ih
 9+M=
X-IronPort-AV: E=Sophos;i="5.77,331,1596524400"; 
   d="scan'208";a="89013701"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Oct 2020 09:22:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 3 Oct 2020 09:22:06 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Sat, 3 Oct 2020 09:21:45 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <wsa@kernel.org>, <rmk+kernel@armlinux.org.uk>,
        <alpawi@amazon.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH] i2c: pxa: move to generic GPIO recovery
Date:   Sat, 3 Oct 2020 19:21:41 +0300
Message-ID: <20201003162141.925518-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Starting with
commit 75820314de26 ("i2c: core: add generic I2C GPIO recovery")
GPIO bus recovery is supported by the I2C core, so we can remove the
driver implementation and use that one instead.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

This patch is not tested.
The only different thing should be the fact that the pinctl state is
now switched back to the default state after the bus is enabled.

 drivers/i2c/busses/i2c-pxa.c | 75 +++---------------------------------
 1 file changed, 6 insertions(+), 69 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 35ca2c02c9b9..dd357b6e6c61 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -264,9 +264,6 @@ struct pxa_i2c {
 	u32			hs_mask;
 
 	struct i2c_bus_recovery_info recovery;
-	struct pinctrl		*pinctrl;
-	struct pinctrl_state	*pinctrl_default;
-	struct pinctrl_state	*pinctrl_recovery;
 };
 
 #define _IBMR(i2c)	((i2c)->reg_ibmr)
@@ -1305,8 +1302,6 @@ static void i2c_pxa_prepare_recovery(struct i2c_adapter *adap)
 	 */
 	gpiod_set_value(i2c->recovery.scl_gpiod, ibmr & IBMR_SCLS);
 	gpiod_set_value(i2c->recovery.sda_gpiod, ibmr & IBMR_SDAS);
-
-	WARN_ON(pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery));
 }
 
 static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
@@ -1325,8 +1320,6 @@ static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
 		i2c_pxa_do_reset(i2c);
 	}
 
-	WARN_ON(pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default));
-
 	dev_dbg(&i2c->adap.dev, "recovery: IBMR 0x%08x ISR 0x%08x\n",
 	        readl(_IBMR(i2c)), readl(_ISR(i2c)));
 
@@ -1347,76 +1340,20 @@ static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
 	if (IS_ENABLED(CONFIG_I2C_PXA_SLAVE))
 		return 0;
 
-	i2c->pinctrl = devm_pinctrl_get(dev);
-	if (PTR_ERR(i2c->pinctrl) == -ENODEV)
-		i2c->pinctrl = NULL;
-	if (IS_ERR(i2c->pinctrl))
-		return PTR_ERR(i2c->pinctrl);
-
-	if (!i2c->pinctrl)
-		return 0;
-
-	i2c->pinctrl_default = pinctrl_lookup_state(i2c->pinctrl,
-						    PINCTRL_STATE_DEFAULT);
-	i2c->pinctrl_recovery = pinctrl_lookup_state(i2c->pinctrl, "recovery");
-
-	if (IS_ERR(i2c->pinctrl_default) || IS_ERR(i2c->pinctrl_recovery)) {
-		dev_info(dev, "missing pinmux recovery information: %ld %ld\n",
-			 PTR_ERR(i2c->pinctrl_default),
-			 PTR_ERR(i2c->pinctrl_recovery));
-		return 0;
-	}
-
-	/*
-	 * Claiming GPIOs can influence the pinmux state, and may glitch the
-	 * I2C bus. Do this carefully.
-	 */
-	bri->scl_gpiod = devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
-	if (bri->scl_gpiod == ERR_PTR(-EPROBE_DEFER))
-		return -EPROBE_DEFER;
-	if (IS_ERR(bri->scl_gpiod)) {
-		dev_info(dev, "missing scl gpio recovery information: %pe\n",
-			 bri->scl_gpiod);
-		return 0;
-	}
-
-	/*
-	 * We have SCL. Pull SCL low and wait a bit so that SDA glitches
-	 * have no effect.
-	 */
-	gpiod_direction_output(bri->scl_gpiod, 0);
-	udelay(10);
-	bri->sda_gpiod = devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH_OPEN_DRAIN);
-
-	/* Wait a bit in case of a SDA glitch, and then release SCL. */
-	udelay(10);
-	gpiod_direction_output(bri->scl_gpiod, 1);
-
-	if (bri->sda_gpiod == ERR_PTR(-EPROBE_DEFER))
-		return -EPROBE_DEFER;
-
-	if (IS_ERR(bri->sda_gpiod)) {
-		dev_info(dev, "missing sda gpio recovery information: %pe\n",
-			 bri->sda_gpiod);
+	bri->pinctrl = devm_pinctrl_get(dev);
+	if (PTR_ERR(bri->pinctrl) == -ENODEV) {
+		bri->pinctrl = NULL;
 		return 0;
 	}
+	if (IS_ERR(bri->pinctrl))
+		return PTR_ERR(bri->pinctrl);
 
 	bri->prepare_recovery = i2c_pxa_prepare_recovery;
 	bri->unprepare_recovery = i2c_pxa_unprepare_recovery;
-	bri->recover_bus = i2c_generic_scl_recovery;
 
 	i2c->adap.bus_recovery_info = bri;
 
-	/*
-	 * Claiming GPIOs can change the pinmux state, which confuses the
-	 * pinctrl since pinctrl's idea of the current setting is unaffected
-	 * by the pinmux change caused by claiming the GPIO. Work around that
-	 * by switching pinctrl to the GPIO state here. We do it this way to
-	 * avoid glitching the I2C bus.
-	 */
-	pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery);
-
-	return pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default);
+	return 0;
 }
 
 static int i2c_pxa_probe(struct platform_device *dev)
-- 
2.25.1

