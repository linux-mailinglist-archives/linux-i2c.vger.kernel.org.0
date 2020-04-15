Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3CA1A93D7
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 09:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393646AbgDOHHN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 03:07:13 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:14676 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390575AbgDOHHK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 03:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586934429; x=1618470429;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S2+uH86s+bRjLfFJ3yBCLL1egwy14L/rjPzDHoi6Fho=;
  b=Zp+Q6FRAIwueiWscllfKgnw1Et7D/uXRD30UIxG0MnzRflSzWLUV9mEJ
   9aAAOZwlaNQtzZOKa+2giwbzre2IcFxP2Y3PtwSTqT5WSbwwTR+OlAvhv
   aVQq4UDJy7x1jVKxnaWoOaASNzj9cFQ4OsPqjJaRTyDID+VvNNRXn6Ilr
   AdFYJmnQW6ErKnb7iumnp1Hc6VpuVIcHmy8X9yjTycpnETT06puLKOaTb
   XxaS1Kg7yKTZRKk6Z1gFbnMVsEbz+Gcos+7ezDRHrTbcSMXpRCnwN9Zw8
   NSVmLiNAgPardw2fypRT6OX4YGIaxWZ0d4VhMkhOi8E7dbylBj4rXc3Yy
   A==;
IronPort-SDR: ghEsHiT3JE71rp0I25+n2BPG4MrpZKm6DBUQalg0bwdmRbJhZ1wfgzdmbZhVK6sQpdf9AV1v8z
 6SUjddGq5NXIzCvyuoSm5CNfwuEU9p8UhDeMXtDcxTrbadQ8XuFpHX151/4iLl1616LEuUZo0y
 U2F1A5QBohghEn9h6pqKZQBedK1LwOw9LqiAYiGLySHS/zO5PWRuaMjYgM/mtKTslgtONC1b7S
 1qHzMKXJDQ7+Y306sPA+Jd5hgYYep9UuUEaA6D8SLhDabGb5bG44k7zLcb0Vi8754sWwnYsfUF
 GN8=
X-IronPort-AV: E=Sophos;i="5.72,386,1580799600"; 
   d="scan'208";a="70388098"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Apr 2020 00:07:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 15 Apr 2020 00:06:52 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 15 Apr 2020 00:06:58 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-gpio@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <kamel.bouhara@bootlin.com>,
        <linux@armlinux.org.uk>, <linus.walleij@linaro.org>,
        <alan@softiron.com>, <wsa@the-dreams.de>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [RFC PATCH] i2c: at91: Fix pinmux after devm_gpiod_get() for bus recovery
Date:   Wed, 15 Apr 2020 10:06:43 +0300
Message-ID: <20200415070643.23663-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

devm_gpiod_get() usually calls gpio_request_enable() for non-strict pinmux
drivers. These puts the pins in GPIO mode, whithout notifying the pinctrl
driver. At this point, the I2C bus no longer owns the pins. To mux the
pins back to the I2C bus, we use the pinctrl driver to change the state
of the pins to GPIO, before using devm_gpiod_get(). After the pins are
received as GPIOs, we switch theer pinctrl state back to the default
one,

Fixes: d3d3fdcc4c90 ("i2c: at91: implement i2c bus recovery")
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 drivers/i2c/busses/i2c-at91-master.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 0aba51a7df32..43d85845c897 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -845,6 +845,18 @@ static int at91_init_twi_recovery_info(struct platform_device *pdev,
 							 PINCTRL_STATE_DEFAULT);
 	dev->pinctrl_pins_gpio = pinctrl_lookup_state(dev->pinctrl,
 						      "gpio");
+	if (IS_ERR(dev->pinctrl_pins_default) ||
+	    IS_ERR(dev->pinctrl_pins_gpio)) {
+		dev_info(&pdev->dev, "pinctrl states incomplete for recovery\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * pins will be taken as GPIO, so we might as well inform pinctrl about
+	 * this and move the state to GPIO
+	 */
+	pinctrl_select_state(dev->pinctrl, dev->pinctrl_pins_gpio);
+
 	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
 	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
@@ -855,9 +867,7 @@ static int at91_init_twi_recovery_info(struct platform_device *pdev,
 		return -EPROBE_DEFER;
 
 	if (IS_ERR(rinfo->sda_gpiod) ||
-	    IS_ERR(rinfo->scl_gpiod) ||
-	    IS_ERR(dev->pinctrl_pins_default) ||
-	    IS_ERR(dev->pinctrl_pins_gpio)) {
+	    IS_ERR(rinfo->scl_gpiod)) {
 		dev_info(&pdev->dev, "recovery information incomplete\n");
 		if (!IS_ERR(rinfo->sda_gpiod)) {
 			gpiod_put(rinfo->sda_gpiod);
@@ -870,6 +880,9 @@ static int at91_init_twi_recovery_info(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	/* change the state of the pins back to their default state */
+	pinctrl_select_state(dev->pinctrl, dev->pinctrl_pins_default);
+
 	dev_info(&pdev->dev, "using scl, sda for recovery\n");
 
 	rinfo->prepare_recovery = at91_prepare_twi_recovery;
-- 
2.20.1

