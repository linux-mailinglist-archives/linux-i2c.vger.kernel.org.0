Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDBDDC8BBD
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2019 16:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbfJBOrJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Oct 2019 10:47:09 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:54017 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbfJBOrI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Oct 2019 10:47:08 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 01E98200005;
        Wed,  2 Oct 2019 14:47:04 +0000 (UTC)
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Date:   Wed,  2 Oct 2019 16:46:56 +0200
Message-Id: <20191002144658.7718-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implement i2c bus recovery when slaves devices might hold SDA low.
In this case re-assign SCL/SDA to gpios and issue 9 dummy clock pulses
until the slave release SDA.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 drivers/i2c/busses/i2c-at91-master.c | 63 ++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-at91.h        |  8 ++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index a3fcc35ffd3b..df5bb93f952d 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -18,11 +18,13 @@
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/dma-atmel.h>
 #include <linux/pm_runtime.h>
@@ -768,6 +770,63 @@ static int at91_twi_configure_dma(struct at91_twi_dev *dev, u32 phy_addr)
 	return ret;
 }
 
+static void at91_prepare_twi_recovery(struct i2c_adapter *adap)
+{
+	struct at91_twi_dev *dev = i2c_get_adapdata(adap);
+
+	pinctrl_select_state(dev->pinctrl, dev->pinctrl_pins_gpio);
+}
+
+static void at91_unprepare_twi_recovery(struct i2c_adapter *adap)
+{
+	struct at91_twi_dev *dev = i2c_get_adapdata(adap);
+
+	pinctrl_select_state(dev->pinctrl, dev->pinctrl_pins_default);
+}
+
+static int at91_init_twi_recovery_info(struct platform_device *pdev,
+				       struct at91_twi_dev *dev)
+{
+	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
+
+	dev->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (!dev->pinctrl || IS_ERR(dev->pinctrl)) {
+		dev_info(dev->dev, "can't get pinctrl, bus recovery not supported\n");
+		return PTR_ERR(dev->pinctrl);
+	}
+
+	dev->pinctrl_pins_default = pinctrl_lookup_state(dev->pinctrl,
+							 PINCTRL_STATE_DEFAULT);
+	dev->pinctrl_pins_gpio = pinctrl_lookup_state(dev->pinctrl,
+						      "gpio");
+	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
+	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl",
+					  GPIOD_OUT_HIGH_OPEN_DRAIN);
+	if (PTR_ERR(rinfo->scl_gpiod) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	if (IS_ERR(rinfo->sda_gpiod) ||
+		   IS_ERR(rinfo->scl_gpiod) ||
+		   IS_ERR(dev->pinctrl_pins_default) ||
+		   IS_ERR(dev->pinctrl_pins_gpio)) {
+		dev_info(&pdev->dev, "recovery information incomplete\n");
+		return -EINVAL;
+	}
+
+	dev_info(&pdev->dev, "using scl%s for recovery\n",
+		 rinfo->sda_gpiod ? ",sda" : "");
+
+	rinfo->prepare_recovery = at91_prepare_twi_recovery;
+	rinfo->unprepare_recovery = at91_unprepare_twi_recovery;
+	rinfo->recover_bus = i2c_generic_scl_recovery;
+	dev->adapter.bus_recovery_info = rinfo;
+
+	return 0;
+}
+
 int at91_twi_probe_master(struct platform_device *pdev,
 			  u32 phy_addr, struct at91_twi_dev *dev)
 {
@@ -795,6 +854,10 @@ int at91_twi_probe_master(struct platform_device *pdev,
 
 	at91_calc_twi_clock(dev);
 
+	rc = at91_init_twi_recovery_info(pdev, dev);
+	if (rc == -EPROBE_DEFER)
+		return rc;
+
 	dev->adapter.algo = &at91_twi_algorithm;
 	dev->adapter.quirks = &at91_twi_quirks;
 
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index 499b506f6128..b89dab55e776 100644
--- a/drivers/i2c/busses/i2c-at91.h
+++ b/drivers/i2c/busses/i2c-at91.h
@@ -141,6 +141,10 @@ struct at91_twi_dev {
 	u32 fifo_size;
 	struct at91_twi_dma dma;
 	bool slave_detected;
+	struct i2c_bus_recovery_info rinfo;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_pins_default;
+	struct pinctrl_state *pinctrl_pins_gpio;
 #ifdef CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL
 	unsigned smr;
 	struct i2c_client *slave;
@@ -158,6 +162,10 @@ void at91_init_twi_bus_master(struct at91_twi_dev *dev);
 int at91_twi_probe_master(struct platform_device *pdev, u32 phy_addr,
 			  struct at91_twi_dev *dev);
 
+void at91_twi_prepare_recovery(struct i2c_adapter *adap);
+void at91_twi_unprepare_recovery(struct i2c_adapter *adap);
+void at91_twi_init_recovery_info(struct at91_twi_dev *dev);
+
 #ifdef CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL
 void at91_init_twi_bus_slave(struct at91_twi_dev *dev);
 int at91_twi_probe_slave(struct platform_device *pdev, u32 phy_addr,
-- 
2.23.0

