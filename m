Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B8D13BEF1
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 12:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730247AbgAOLys (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 06:54:48 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:22077 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730150AbgAOLyr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jan 2020 06:54:47 -0500
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 0Jne71fz3fOV3ZZt5BsM5wLuw60rSz7cuqSE11x/ik1wiObpQcIIn6JxRZxT/pzmgJObQF5O1q
 zXnG/xfDEPLDTFJmDePyD1UVTkUSBM0scfiHal8cJTwDEgIJ+CzVTeiRy2jFrzsz7vh31YUAqb
 NPe5GvdAWMXUN0FRW05WqspaSeJ1W029U9ondr5oI8VcD8EmRQDtYX+Rr8QUh2El25DzNPK4ze
 tlt0JcleTMmPBhQ608EV1aG9iVkzJ4mD5y3z86Tfr+ELaBCz6VyYST5j/ehPLN4UdolX7+vIz3
 i14=
X-IronPort-AV: E=Sophos;i="5.70,322,1574146800"; 
   d="scan'208";a="60862992"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jan 2020 04:54:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 15 Jan 2020 04:54:46 -0700
Received: from rob-ult-m19940.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 15 Jan 2020 04:54:43 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <robh@kernel.org>,
        <peda@axentia.se>, <linux@armlinux.org.uk>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH v3 2/6] i2c: at91: implement i2c bus recovery
Date:   Wed, 15 Jan 2020 13:54:18 +0200
Message-ID: <20200115115422.17097-3-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
References: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kamel Bouhara <kamel.bouhara@bootlin.com>

Implement i2c bus recovery when slaves devices might hold SDA low.
In this case re-assign SCL/SDA to gpios and issue 9 dummy clock pulses
until the slave release SDA.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v3:
 - removed unnecessary condition from info print;
 - removed unneded declarations;

Changes in v2:
 - called i2c_recover_bus() after an error occurs, if SDA is down;
 - release gpios if recovery information is incomplete;

 drivers/i2c/busses/i2c-at91-master.c | 78 ++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-at91.h        |  4 ++
 2 files changed, 82 insertions(+)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 7a862e00b475..0aba51a7df32 100644
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
@@ -478,6 +480,7 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 	unsigned long time_left;
 	bool has_unre_flag = dev->pdata->has_unre_flag;
 	bool has_alt_cmd = dev->pdata->has_alt_cmd;
+	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
 
 	/*
 	 * WARNING: the TXCOMP bit in the Status Register is NOT a clear on
@@ -637,6 +640,13 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 		at91_twi_write(dev, AT91_TWI_CR,
 			       AT91_TWI_THRCLR | AT91_TWI_LOCKCLR);
 	}
+
+	if (rinfo->get_sda && !(rinfo->get_sda(&dev->adapter))) {
+		dev_dbg(dev->dev,
+			"SDA is down; clear bus using gpio\n");
+		i2c_recover_bus(&dev->adapter);
+	}
+
 	return ret;
 }
 
@@ -806,6 +816,70 @@ static int at91_twi_configure_dma(struct at91_twi_dev *dev, u32 phy_addr)
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
+	    IS_ERR(rinfo->scl_gpiod) ||
+	    IS_ERR(dev->pinctrl_pins_default) ||
+	    IS_ERR(dev->pinctrl_pins_gpio)) {
+		dev_info(&pdev->dev, "recovery information incomplete\n");
+		if (!IS_ERR(rinfo->sda_gpiod)) {
+			gpiod_put(rinfo->sda_gpiod);
+			rinfo->sda_gpiod = NULL;
+		}
+		if (!IS_ERR(rinfo->scl_gpiod)) {
+			gpiod_put(rinfo->scl_gpiod);
+			rinfo->scl_gpiod = NULL;
+		}
+		return -EINVAL;
+	}
+
+	dev_info(&pdev->dev, "using scl, sda for recovery\n");
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
@@ -838,6 +912,10 @@ int at91_twi_probe_master(struct platform_device *pdev,
 						     "i2c-analog-filter");
 	at91_calc_twi_clock(dev);
 
+	rc = at91_init_twi_recovery_info(pdev, dev);
+	if (rc == -EPROBE_DEFER)
+		return rc;
+
 	dev->adapter.algo = &at91_twi_algorithm;
 	dev->adapter.quirks = &at91_twi_quirks;
 
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index 977a67bc0f88..f57a6cab96b4 100644
--- a/drivers/i2c/busses/i2c-at91.h
+++ b/drivers/i2c/busses/i2c-at91.h
@@ -151,6 +151,10 @@ struct at91_twi_dev {
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
-- 
2.20.1

