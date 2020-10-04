Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E699F2829C3
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Oct 2020 11:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgJDJS3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Oct 2020 05:18:29 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:58218 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDJS3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Oct 2020 05:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1601803108; x=1633339108;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mJB4PM3W0XuShCHCsKFfKvn4aRYMv9WtYMDh2EN4KAQ=;
  b=yDGgT0k3NRsjt2MIbnLidrCzCzv06XvdKj4/ggimHWuTesC/bHnSEwfr
   2u3Wwg+m+SVXn8nNgsFrcv8O0o6wf+ZFo5pG7vK6+6LYy18Z7cJmV6APG
   cH72YS4qbI0N+r8cEDtFLneBWwc0VCt8IBePsXjYA2YGEgITJeUF9C9lO
   4KmX19uQGtUCVTI6Z6IKLyf3XPxVLkgfoJqSritGip8aXPFgmZBxBpUrg
   MdUqIQINdHz/hDAA17q3VjIfsd+XBSjz05VxQMYfuSEEiMY4y2wcBU530
   muZF+0CJh0PCfD3FE4pUDhL8hkztWo3E45tAM+qK/WpFz1ysTdTyejUdF
   A==;
IronPort-SDR: QLQWuDl11RWXHKKAGVpBcDJOOYMq4XVZsRb0kIxvXe5q3AyqeGPjZYYfZHmnC+S/1lDdC/8KcM
 cSEfw8FLzs+EFYOQTqduCXe8PnOdZoToxb8qyYC313yfIXjNFSC69KoABxX0WRku9UlAJ16PYw
 rYhs/BIFzOf51iqfC15GgJKm9cB6udGFKXk62CwKwgJML+Yu9NKTbtwIMeVzMPGzYhPq4x2vm6
 9gqp/eZQc24hSWcV6ic9eBY5BtUOY6pd/Bnzqljp0C0bFbs6AO7p/Ty4CeAQtqxcieFn8q8UDM
 VKc=
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; 
   d="scan'208";a="28646518"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2020 02:18:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 4 Oct 2020 02:17:39 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Sun, 4 Oct 2020 02:18:22 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <wsa@kernel.org>, <rmk+kernel@armlinux.org.uk>,
        <alpawi@amazon.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH v2] i2c: pxa: move to generic GPIO recovery
Date:   Sun, 4 Oct 2020 12:16:56 +0300
Message-ID: <20201004091656.1004575-1-codrin.ciubotariu@microchip.com>
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

Changes in v2:
 - readded the pinctrl state change to default from the
   unprepare_recovery callback;

 drivers/i2c/busses/i2c-pxa.c | 73 +++---------------------------------
 1 file changed, 6 insertions(+), 67 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 35ca2c02c9b9..006cc1d5931f 100644
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
@@ -1347,76 +1342,20 @@ static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
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

