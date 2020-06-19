Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7245200B3E
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jun 2020 16:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733043AbgFSOUi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Jun 2020 10:20:38 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:7074 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732960AbgFSOUh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Jun 2020 10:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592576437; x=1624112437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uI1UnBBrQLzZH0Mkfly9+1y3fM2YZcptYMawirVUvR8=;
  b=aV2DOjK+6B5op7eis/yRF7eJYKmvMF+M7whIMNhbEgP+BdmST4LYWNC2
   7dt2mYrlEhYM2YtzQ/Bnt8o1+qiBLzGMSCl3puoU/MD6xHc3Kd99Gvc/+
   bL0sToFcevJJlIAoiyEUxzUMHfGMm1y1yOASU+TVisCqPh0uKJMn+pirq
   /FkfBwgrlYuxWdYUprvmPQWVlk7c2jPng5jUQktvyJSQ0cSJCo/kBouPr
   nyW2i3gxbgd/uLELL2+CjyudJloINMTAOFUwLBW0XziJKSV13q5CYPV67
   q3UnFL2+OJpLet4ekNzOXqeJNOlK+fFI5XQHqINA5IvENisFMEY9kiIXy
   A==;
IronPort-SDR: mvNZWlag1ym8Kr8AAds/dx0clS7q35JjuHLtGMklZfl7/wEHXAp0rqLKFGDKQOvLpp5cddlbA8
 Fjb1E5isi1WLhcWkmadmqMhcppC6owviTCsCbFVpAyT6VFHcxJP48hpcjjNsfnF87soCtg3ZDR
 K6OI/X5SYIShOOBsvIF7P2gI+k83zWHn/wWTrygpceK8+sfE5ovUUvhSIpLjQJNouPXvnp+9do
 isJ5FnI7NJ+TW+kfp5h3kGc34/LAZXpZh4bWPfaO/2dGUTLrxA+2KHtop04o91cM3QZyk7Y3nt
 7uI=
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; 
   d="scan'208";a="77180771"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2020 07:20:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 19 Jun 2020 07:20:28 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 19 Jun 2020 07:20:02 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <wsa@kernel.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [RFC PATCH 2/4] i2c: core: add generic I2C GPIO recovery
Date:   Fri, 19 Jun 2020 17:19:02 +0300
Message-ID: <20200619141904.910889-3-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Multiple I2C bus drivers use similar bindings to obtain information needed
for I2C recovery. For example, for platforms using device-tree, the
properties look something like this:

&i2c {
	...
	pinctrl-names = "default", "gpio";
	// or pinctrl-names = "default", "recovery";
	pinctrl-0 = <&pinctrl_i2c_default>;
	pinctrl-1 = <&pinctrl_i2c_gpio>;
	sda-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
	scl-gpios = <&pio 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
	...
}

For this reason, we can add this common initialization in the core. This
way, other I2C bus drivers will be able to support GPIO recovery just by
providing a pointer to platform's pinctrl and calling i2c_recover_bus()
when SDA is stuck low.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 drivers/i2c/i2c-core-base.c | 119 ++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  11 ++++
 2 files changed, 130 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d1f278f73011..4ee29fec4e93 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -32,6 +32,7 @@
 #include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_wakeirq.h>
@@ -179,6 +180,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	int i = 0, scl = 1, ret = 0;
 
+	if (bri->pinctrl)
+		pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
 	if (bri->prepare_recovery)
 		bri->prepare_recovery(adap);
 
@@ -236,6 +239,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 
 	if (bri->unprepare_recovery)
 		bri->unprepare_recovery(adap);
+	if (bri->pinctrl)
+		pinctrl_select_state(bri->pinctrl, bri->pins_default);
 
 	return ret;
 }
@@ -251,6 +256,118 @@ int i2c_recover_bus(struct i2c_adapter *adap)
 }
 EXPORT_SYMBOL_GPL(i2c_recover_bus);
 
+static void i2c_gpio_init_pinctrl_recovery(struct i2c_adapter *adap)
+{
+	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
+	struct device *dev = &adap->dev;
+	struct pinctrl *p = bri->pinctrl;
+
+	/*
+	 * we can't change states without pinctrl, so remove the states if
+	 * available
+	 */
+	if (!p) {
+		bri->pins_default = NULL;
+		bri->pins_gpio = NULL;
+		return;
+	}
+
+	if (!bri->pins_default) {
+		bri->pins_default = pinctrl_lookup_state(p,
+							 PINCTRL_STATE_DEFAULT);
+		if (IS_ERR(bri->pins_default)) {
+			dev_dbg(dev, PINCTRL_STATE_DEFAULT " state not found for GPIO recovery\n");
+			bri->pins_default = NULL;
+
+			goto cleanup_pinctrl;
+		}
+	}
+	if (!bri->pins_gpio) {
+		bri->pins_gpio = pinctrl_lookup_state(p, "gpio");
+		if (IS_ERR(bri->pins_gpio))
+			bri->pins_gpio = pinctrl_lookup_state(p, "recovery");
+
+		if (IS_ERR(bri->pins_gpio)) {
+			dev_dbg(dev, "no gpio or recovery state found for GPIO recovery\n");
+			bri->pins_gpio = NULL;
+
+			goto cleanup_pinctrl;
+		}
+	}
+
+cleanup_pinctrl:
+	/* for pinctrl state changes, we need all the information */
+	if (!bri->pins_default || !bri->pins_gpio) {
+		bri->pinctrl = NULL;
+		bri->pins_default = NULL;
+		bri->pins_gpio = NULL;
+	} else {
+		dev_info(dev, "using pinctrl states for GPIO recovery");
+	}
+}
+
+static int i2c_gpio_init_generic_recovery(struct i2c_adapter *adap)
+{
+	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
+	struct device *dev = &adap->dev;
+	struct gpio_desc *gpiod;
+	int ret = 0;
+
+	/* don't touch the recovery information if the driver is not using
+	 * generic SCL recovery
+	 */
+	if (bri->recover_bus && bri->recover_bus != i2c_generic_scl_recovery)
+		return 0;
+
+	/*
+	 * pins might be taken as GPIO, so we might as well inform pinctrl about
+	 * this and move the state to GPIO
+	 */
+	if (bri->pinctrl)
+		pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
+
+	/*
+	 * if there is incomplete or no recovery information, see if generic
+	 * GPIO recovery is available
+	 */
+	if (!bri->scl_gpiod) {
+		gpiod = devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
+		if (PTR_ERR(gpiod) == -EPROBE_DEFER) {
+			ret  = -EPROBE_DEFER;
+			goto cleanup_pinctrl_state;
+		}
+		if (!IS_ERR(gpiod)) {
+			bri->scl_gpiod = gpiod;
+			bri->recover_bus = i2c_generic_scl_recovery;
+			dev_info(dev, "using generic GPIOs for recovery\n");
+		}
+	}
+
+	/* SDA GPIOD line is optional, so we care about DEFER only */
+	if (!bri->sda_gpiod) {
+		gpiod = devm_gpiod_get(dev, "sda", GPIOD_IN);
+		if (PTR_ERR(gpiod) == -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
+			goto cleanup_pinctrl_state;
+		}
+		if (!IS_ERR(gpiod))
+			bri->sda_gpiod = gpiod;
+	}
+
+cleanup_pinctrl_state:
+	/* change the state of the pins back to their default state */
+	if (bri->pinctrl)
+		pinctrl_select_state(bri->pinctrl, bri->pins_default);
+
+	return ret;
+}
+
+static int i2c_gpio_init_recovery(struct i2c_adapter *adap)
+{
+	i2c_gpio_init_pinctrl_recovery(adap);
+	return i2c_gpio_init_generic_recovery(adap);
+}
+
 static void i2c_init_recovery(struct i2c_adapter *adap)
 {
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
@@ -259,6 +376,8 @@ static void i2c_init_recovery(struct i2c_adapter *adap)
 	if (!bri)
 		return;
 
+	i2c_gpio_init_recovery(adap);
+
 	if (!bri->recover_bus) {
 		err_str = "no recover_bus() found";
 		goto err;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index c10617bb980a..c62c9b48f719 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -611,6 +611,14 @@ struct i2c_timings {
  *	may configure padmux here for SDA/SCL line or something else they want.
  * @scl_gpiod: gpiod of the SCL line. Only required for GPIO recovery.
  * @sda_gpiod: gpiod of the SDA line. Only required for GPIO recovery.
+ * @pinctrl: pinctrl used by GPIO recovery to change the state of the I2C pins.
+ *      Optional.
+ * @pins_default: default state of SCL/SDA lines, when they are assigned to the
+ *      I2C bus. Optional. Populated internally for GPIO recovery, if a state with
+ *      the name PINCTRL_STATE_DEFAULT is found and pinctrl is valid.
+ * @pins_gpio: recovery state of SCL/SDA lines, when they are used as GPIOs.
+ *      Optional. Populated internally for GPIO recovery, if this state is called
+ *      "gpio" or "recovery" and pinctrl is valid.
  */
 struct i2c_bus_recovery_info {
 	int (*recover_bus)(struct i2c_adapter *adap);
@@ -627,6 +635,9 @@ struct i2c_bus_recovery_info {
 	/* gpio recovery */
 	struct gpio_desc *scl_gpiod;
 	struct gpio_desc *sda_gpiod;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pins_default;
+	struct pinctrl_state *pins_gpio;
 };
 
 int i2c_recover_bus(struct i2c_adapter *adap);
-- 
2.25.1

