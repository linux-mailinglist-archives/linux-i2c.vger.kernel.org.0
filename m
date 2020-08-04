Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6902823B853
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Aug 2020 12:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbgHDKBw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Aug 2020 06:01:52 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:63702 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbgHDKBw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Aug 2020 06:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596535311; x=1628071311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UTkl8gzVaoJQcxgIONJKTZgCbuaBuh7DX1eIGuoNO/A=;
  b=Ndgs0/7FCeqrK2tHCfVH6dHSh2OLmByR7MiFRA99R/TI00XOrQrS8vOG
   tJ+uHY9XHbx6AGmIhJeU86gBTRpuRGyEWzFrPSWNrDpnCFmjCTtJ58alh
   fp06Y8l3Eo+p6bkTcx2aA0Jf1oZAJgW/I+7z/c7EOj8aP/CbXYzf2EvF8
   ne4pjA45YxMAz6ZU8LmPTYXjuEw9TJaYJy/NX9D5FjW2LO/iIG0lglg0x
   0fgWXJokx3jfEV3H0FtjvdzHiVjmFLrjzTg9RPgERJNsqg28+EVM4m0r1
   ZK5cYsKBi6xh7EClwuvLBZF7W8AppFPrvpXdok10Q4BCbaksCx4xsPFUU
   g==;
IronPort-SDR: IlQygYznqEUo5p0DFVNxQq3EiLrpcdWYNr7TniFy0457m9ZxbLm3BJBK3Nllh+/AumsmZy8lUE
 riQkIVvfQjYtaIdR3M+tnFfXnhi2/zjD2wUz6p99lh7HkZMAyWYC1ramRoSI55P/N2zLk3b0xE
 DQuwhY9+8wt4hbqQA9vQyla/wdfvOK7W3lAGtnGbjcJrn+uBQJ+WXiJSJHD5MGiZmLXDfimBXK
 XLhGshiyXkdTSVmGm9Ea8njbkgasm9Gpcdm4yo+uxrMOthFQxSgFT4lek/3HHpZg6t7iYwKIZw
 elI=
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="85757769"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2020 03:01:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 4 Aug 2020 03:01:19 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 4 Aug 2020 03:00:28 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <wsa@kernel.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH 2/4] i2c: core: add generic I2C GPIO recovery
Date:   Tue, 4 Aug 2020 12:59:24 +0300
Message-ID: <20200804095926.205643-3-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
References: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
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

Changes from RFC:
 - removed comment with "recovery" pinctrl state from description;
 - pinctrl state is changed to gpio after calling prepare_recovery()
   callback;
 - addressed requested changes on comments;
 - removed cleanup_pinctrl label from i2c_gpio_init_pinctrl_recovery()
 - added glitch protection for SDA line when its corresponding gpio is
   taken at initialization;

 drivers/i2c/i2c-core-base.c | 126 ++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  11 ++++
 2 files changed, 137 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 69217d2193da..cf0c5eb152e1 100644
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
@@ -181,6 +182,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 
 	if (bri->prepare_recovery)
 		bri->prepare_recovery(adap);
+	if (bri->pinctrl)
+		pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
 
 	/*
 	 * If we can set SDA, we will always create a STOP to ensure additional
@@ -236,6 +239,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 
 	if (bri->unprepare_recovery)
 		bri->unprepare_recovery(adap);
+	if (bri->pinctrl)
+		pinctrl_select_state(bri->pinctrl, bri->pins_default);
 
 	return ret;
 }
@@ -251,6 +256,125 @@ int i2c_recover_bus(struct i2c_adapter *adap)
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
+	 * populated
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
+		}
+	}
+
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
+	/*
+	 * don't touch the recovery information if the driver is not using
+	 * generic SCL recovery
+	 */
+	if (bri->recover_bus && bri->recover_bus != i2c_generic_scl_recovery)
+		return 0;
+
+	/*
+	 * pins might be taken as GPIO, so we should inform pinctrl about
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
+		/*
+		 * We have SCL. Pull SCL low and wait a bit so that SDA glitches
+		 * have no effect.
+		 */
+		gpiod_direction_output(bri->scl_gpiod, 0);
+		udelay(10);
+		gpiod = devm_gpiod_get(dev, "sda", GPIOD_IN);
+
+		/* Wait a bit in case of a SDA glitch, and then release SCL. */
+		udelay(10);
+		gpiod_direction_output(bri->scl_gpiod, 1);
+
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
@@ -259,6 +383,8 @@ static void i2c_init_recovery(struct i2c_adapter *adap)
 	if (!bri)
 		return;
 
+	i2c_gpio_init_recovery(adap);
+
 	if (!bri->recover_bus) {
 		err_str = "no recover_bus() found";
 		goto err;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 176bf971cbe0..93b6b698f150 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -606,6 +606,14 @@ struct i2c_timings {
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
@@ -622,6 +630,9 @@ struct i2c_bus_recovery_info {
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

