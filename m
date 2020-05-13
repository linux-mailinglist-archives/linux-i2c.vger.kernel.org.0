Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE561D0C51
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 11:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgEMJdS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 05:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726922AbgEMJdS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 May 2020 05:33:18 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0729DC061A0C;
        Wed, 13 May 2020 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LBba5VXHze45hNA5zDZghhEo1vlWTJF2wD+lff9GVY8=; b=yk8Zck/iq4eUR7VNi/x85YWkcO
        FkP7Qq4M/gDWMzYYRynl5u16aS6wxz6N9xHx3vPVJ6omQBWIlO41L8GWhtJkVWmfiK99gBm1KlvvD
        ks00WUDbjEehGGq/EOcIqUIorq6DZ/Px/SHtCgvI+IvcJLpCs+WihGBQVZqgThMvhL12lAVRVdl4e
        5C93A2LTrNAPYo9WNoiopn7mcTfesNWl/0VantQ/VOi/PO6UAFK/ivdotAnHq+TWCA/WLGflMq76Q
        uvPAkLjoh/EnAbsYHVgQ/5qhBiEBLRaX7CUQEP2Pnh6lIWaLfL/rWtZZveEbmvMx8NFsz/zbLx3ad
        CJ9PKg+A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:45148 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jYnlI-000424-TR; Wed, 13 May 2020 10:33:13 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jYnlI-0002Nw-83; Wed, 13 May 2020 10:33:12 +0100
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Subject: [PATCH] i2c: pxa: implement generic i2c bus recovery
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jYnlI-0002Nw-83@rmk-PC.armlinux.org.uk>
Date:   Wed, 13 May 2020 10:33:12 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implement generic GPIO-based I2C bus recovery for the PXA I2C driver.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 176 +++++++++++++++++++++++++++++++----
 1 file changed, 159 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 0e194d6cd1b5..a7885b8b5031 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -20,6 +20,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -28,6 +29,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/i2c-pxa.h>
 #include <linux/slab.h>
@@ -260,6 +262,11 @@ struct pxa_i2c {
 	bool			highmode_enter;
 	u32			fm_mask;
 	u32			hs_mask;
+
+	struct i2c_bus_recovery_info recovery;
+	struct pinctrl		*pinctrl;
+	struct pinctrl_state	*pinctrl_default;
+	struct pinctrl_state	*pinctrl_recovery;
 };
 
 #define _IBMR(i2c)	((i2c)->reg_ibmr)
@@ -559,13 +566,8 @@ static void i2c_pxa_set_slave(struct pxa_i2c *i2c, int errcode)
 #define i2c_pxa_set_slave(i2c, err)	do { } while (0)
 #endif
 
-static void i2c_pxa_reset(struct pxa_i2c *i2c)
+static void i2c_pxa_do_reset(struct pxa_i2c *i2c)
 {
-	pr_debug("Resetting I2C Controller Unit\n");
-
-	/* abort any transfer currently under way */
-	i2c_pxa_abort(i2c);
-
 	/* reset according to 9.8 */
 	writel(ICR_UR, _ICR(i2c));
 	writel(I2C_ISR_INIT, _ISR(i2c));
@@ -584,12 +586,25 @@ static void i2c_pxa_reset(struct pxa_i2c *i2c)
 #endif
 
 	i2c_pxa_set_slave(i2c, 0);
+}
 
+static void i2c_pxa_enable(struct pxa_i2c *i2c)
+{
 	/* enable unit */
 	writel(readl(_ICR(i2c)) | ICR_IUE, _ICR(i2c));
 	udelay(100);
 }
 
+static void i2c_pxa_reset(struct pxa_i2c *i2c)
+{
+	pr_debug("Resetting I2C Controller Unit\n");
+
+	/* abort any transfer currently under way */
+	i2c_pxa_abort(i2c);
+	i2c_pxa_do_reset(i2c);
+	i2c_pxa_enable(i2c);
+}
+
 
 #ifdef CONFIG_I2C_PXA_SLAVE
 /*
@@ -1043,6 +1058,7 @@ static int i2c_pxa_do_xfer(struct pxa_i2c *i2c, struct i2c_msg *msg, int num)
 	ret = i2c_pxa_wait_bus_not_busy(i2c);
 	if (ret) {
 		dev_err(&i2c->adap.dev, "i2c_pxa: timeout waiting for bus free\n");
+		i2c_recover_bus(&i2c->adap);
 		goto out;
 	}
 
@@ -1088,6 +1104,7 @@ static int i2c_pxa_do_xfer(struct pxa_i2c *i2c, struct i2c_msg *msg, int num)
 
 	if (!timeout && i2c->msg_num) {
 		i2c_pxa_scream_blue_murder(i2c, "timeout with active message");
+		i2c_recover_bus(&i2c->adap);
 		ret = I2C_RETRY;
 	}
 
@@ -1277,6 +1294,129 @@ static int i2c_pxa_probe_pdata(struct platform_device *pdev,
 	return 0;
 }
 
+static void i2c_pxa_prepare_recovery(struct i2c_adapter *adap)
+{
+	struct pxa_i2c *i2c = adap->algo_data;
+	u32 ibmr = readl(_IBMR(i2c));
+
+	/*
+	 * Program the GPIOs to reflect the current I2C bus state while
+	 * we transition to recovery; this avoids glitching the bus.
+	 */
+	gpiod_set_value(i2c->recovery.scl_gpiod, ibmr & IBMR_SCLS);
+	gpiod_set_value(i2c->recovery.sda_gpiod, ibmr & IBMR_SDAS);
+
+	WARN_ON(pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery));
+}
+
+static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
+{
+	struct pxa_i2c *i2c = adap->algo_data;
+	u32 isr;
+
+	/*
+	 * The bus should now be free. Clear up the I2C controller before
+	 * handing control of the bus back to avoid the bus changing state.
+	 */
+	isr = readl(_ISR(i2c));
+	if (isr & (ISR_UB | ISR_IBB)) {
+		dev_dbg(&i2c->adap.dev,
+			"recovery: resetting controller, ISR=0x%08x\n", isr);
+		i2c_pxa_do_reset(i2c);
+	}
+
+	WARN_ON(pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default));
+
+	dev_dbg(&i2c->adap.dev, "recovery: IBMR 0x%08x ISR 0x%08x\n",
+	        readl(_IBMR(i2c)), readl(_ISR(i2c)));
+
+	i2c_pxa_enable(i2c);
+}
+
+static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
+{
+	struct i2c_bus_recovery_info *bri = &i2c->recovery;
+	struct device *dev = i2c->adap.dev.parent;
+
+	/*
+	 * When slave mode is enabled, we are not the only master on the bus.
+	 * Bus recovery can only be performed when we are the master, which
+	 * we can't be certain of. Therefore, when slave mode is enabled, do
+	 * not configure bus recovery.
+	 */
+	if (IS_ENABLED(CONFIG_I2C_PXA_SLAVE))
+		return 0;
+
+	i2c->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(i2c->pinctrl))
+		return PTR_ERR(i2c->pinctrl);
+
+	if (!i2c->pinctrl)
+		return 0;
+
+	i2c->pinctrl_default = pinctrl_lookup_state(i2c->pinctrl,
+						    PINCTRL_STATE_DEFAULT);
+	i2c->pinctrl_recovery = pinctrl_lookup_state(i2c->pinctrl, "recovery");
+
+	if (IS_ERR(i2c->pinctrl_default) || IS_ERR(i2c->pinctrl_recovery)) {
+		dev_info(dev, "missing pinmux recovery information: %ld %ld\n",
+			 PTR_ERR(i2c->pinctrl_default),
+			 PTR_ERR(i2c->pinctrl_recovery));
+		return 0;
+	}
+
+	/*
+	 * Claiming GPIOs can influence the pinmux state, and may glitch the
+	 * I2C bus. Do this carefully.
+	 */
+	bri->scl_gpiod = devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
+	if (bri->scl_gpiod == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+	if (IS_ERR(bri->scl_gpiod)) {
+		dev_info(dev, "missing scl gpio recovery information: %pe\n",
+			 bri->scl_gpiod);
+		return 0;
+	}
+
+	/*
+	 * We have SCL. Pull SCL low and wait a bit so that SDA glitches
+	 * have no effect.
+	 */
+	gpiod_direction_output(bri->scl_gpiod, 0);
+	udelay(10);
+	bri->sda_gpiod = devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH_OPEN_DRAIN);
+
+	/* Wait a bit in case of a SDA glitch, and then release SCL. */
+	udelay(10);
+	gpiod_direction_output(bri->scl_gpiod, 1);
+
+	if (bri->sda_gpiod == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	if (IS_ERR(bri->sda_gpiod)) {
+		dev_info(dev, "missing sda gpio recovery information: %pe\n",
+			 bri->sda_gpiod);
+		return 0;
+	}
+
+	bri->prepare_recovery = i2c_pxa_prepare_recovery;
+	bri->unprepare_recovery = i2c_pxa_unprepare_recovery;
+	bri->recover_bus = i2c_generic_scl_recovery;
+
+	i2c->adap.bus_recovery_info = bri;
+
+	/*
+	 * Claiming GPIOs can change the pinmux state, which confuses the
+	 * pinctrl since pinctrl's idea of the current setting is unaffected
+	 * by the pinmux change caused by claiming the GPIO. Work around that
+	 * by switching pinctrl to the GPIO state here. We do it this way to
+	 * avoid glitching the I2C bus.
+	 */
+	pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery);
+
+	return pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default);
+}
+
 static int i2c_pxa_probe(struct platform_device *dev)
 {
 	struct i2c_pxa_platform_data *plat = dev_get_platdata(&dev->dev);
@@ -1289,6 +1429,16 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	if (!i2c)
 		return -ENOMEM;
 
+	/* Default adapter num to device id; i2c_pxa_probe_dt can override. */
+	i2c->adap.nr = dev->id;
+	i2c->adap.owner   = THIS_MODULE;
+	i2c->adap.retries = 5;
+	i2c->adap.algo_data = i2c;
+	i2c->adap.dev.parent = &dev->dev;
+#ifdef CONFIG_OF
+	i2c->adap.dev.of_node = dev->dev.of_node;
+#endif
+
 	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
 	i2c->reg_base = devm_ioremap_resource(&dev->dev, res);
 	if (IS_ERR(i2c->reg_base))
@@ -1298,8 +1448,9 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	if (irq < 0)
 		return irq;
 
-	/* Default adapter num to device id; i2c_pxa_probe_dt can override. */
-	i2c->adap.nr = dev->id;
+	ret = i2c_pxa_init_recovery(i2c);
+	if (ret)
+		return ret;
 
 	ret = i2c_pxa_probe_dt(dev, i2c, &i2c_type);
 	if (ret > 0)
@@ -1307,9 +1458,6 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	if (ret < 0)
 		return ret;
 
-	i2c->adap.owner   = THIS_MODULE;
-	i2c->adap.retries = 5;
-
 	spin_lock_init(&i2c->lock);
 	init_waitqueue_head(&i2c->wait);
 
@@ -1375,12 +1523,6 @@ static int i2c_pxa_probe(struct platform_device *dev)
 
 	i2c_pxa_reset(i2c);
 
-	i2c->adap.algo_data = i2c;
-	i2c->adap.dev.parent = &dev->dev;
-#ifdef CONFIG_OF
-	i2c->adap.dev.of_node = dev->dev.of_node;
-#endif
-
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret < 0)
 		goto ereqirq;
-- 
2.20.1

