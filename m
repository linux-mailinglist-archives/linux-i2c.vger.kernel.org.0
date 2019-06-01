Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3C3E32008
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 18:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfFAQ7i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jun 2019 12:59:38 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53389 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFAQ7i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Jun 2019 12:59:38 -0400
Received: by mail-wm1-f65.google.com with SMTP id d17so150825wmb.3
        for <linux-i2c@vger.kernel.org>; Sat, 01 Jun 2019 09:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wXurtyLeml5VgTFtaZxOAamwOfQYFBAkIqX1AW0P83w=;
        b=jQ9zom7A4z7LPLHPj2O6vfO8IFxT/KuMpyW5atfXAKhoV/cMcXlMlMwCjdkv1+k8yz
         EMoJFcNAVJSOp4LcdrUlUTOc9/RQ0Lw/o3z+ESe4VSUpJOObCKA6jRum1kvvnVMZTsRe
         bUzE3N7UsgClK0JR1sZHMyMFBKjvXwtCRpmZRg1qBGf+PqxHXlWEu5boiyeovNbOtxeA
         6/k+UAgUi/xZXmauT7ViAm2JLy6KiQQr06q00oCQDP6j/oYaBkXfetcSZXkJiwmmRWnq
         3Wi9V7FxFclL3lggoWHmhSas14eC2wkVL+rSK0pK0KCU8xEqm9JfL9sqaNum4oHKhKVQ
         zuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wXurtyLeml5VgTFtaZxOAamwOfQYFBAkIqX1AW0P83w=;
        b=hpXo5iQDzNNv0YNM+yLTd5NpakvDdRq/tPV6UwAPgusu762ivWsT3gmJAW05e/RThe
         gWMOC7i2sPysk3JlMOkzFAzEb6IouKP8wZ803uzaHZLpLwSZM5mYmWNMzM9kobJhtlaW
         +0Yk5wGFjlxmriswtgAjS6SV53gwASMEC0JHS2jKd5+FQgK4CPgQeNkf0O9vSA25oVeD
         xAQ1DxXj5MhUm1ww8FYHDfrSAfK6Avcr7BEwOFPEw9xN1mp6WGe2TkVsBsKylLhFAb5d
         hr1l7S0aVuT28hsG2I7e9FDAd9OCcRLNYS35utpgk/zzCv2B6zSUiF99Tz1ErfqkAsCw
         4+Lw==
X-Gm-Message-State: APjAAAV6OWz4lWYHtzCizPC0RzG2QKj4kmDa7teIG9DGvt3uRWY1O+uo
        gpG+0G2rbb9fvenopsQawjhocw==
X-Google-Smtp-Source: APXvYqwy9oPPO9gCNV22CUGkXYK6SX/h03b2Xx4/wMW9D5kxPTBT0RNUAaY9vlO5lksZizkqD5rcqw==
X-Received: by 2002:a1c:9904:: with SMTP id b4mr9256204wme.1.1559408375400;
        Sat, 01 Jun 2019 09:59:35 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id k125sm23029717wmb.34.2019.06.01.09.59.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 01 Jun 2019 09:59:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Doug Anderson <dianders@chromium.org>
Subject: [PATCH v2] i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
Date:   Sat,  1 Jun 2019 18:59:31 +0200
Message-Id: <20190601165931.17226-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of complex code picking GPIOs out of the device tree
and keeping track of polarity for each GPIO line, use descriptors
and pull polarity handling into the gpiolib.

We look for "our-claim" and "their-claim" since the gpiolib
code will try e.g. "our-claim-gpios" and "our-claim-gpio" in
turn to locate these GPIO lines from the device tree.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Print some errors if we fail to obtain GPIOs.
- Switch to devm_gpiod_get_index() and !IS_ERR() on the result
  to check for an unsupported multimaster set-up.
- Especially handle if the second master returns -EPROBE_DEFER
  even in the case of the optional GPIO that we explicitly bail
  out on if found, as it may be a sign that the GPIO controllers
  are not yet up.
---
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c | 79 ++++++++--------------
 1 file changed, 27 insertions(+), 52 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
index 812b8cff265f..a664f637bc3d 100644
--- a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
+++ b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
@@ -15,12 +15,11 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -28,22 +27,16 @@
 /**
  * struct i2c_arbitrator_data - Driver data for I2C arbitrator
  *
- * @our_gpio: GPIO we'll use to claim.
- * @our_gpio_release: 0 if active high; 1 if active low; AKA if the GPIO ==
- *   this then consider it released.
- * @their_gpio: GPIO that the other side will use to claim.
- * @their_gpio_release: 0 if active high; 1 if active low; AKA if the GPIO ==
- *   this then consider it released.
+ * @our_gpio: GPIO descriptor we'll use to claim.
+ * @their_gpio: GPIO descriptor that the other side will use to claim.
  * @slew_delay_us: microseconds to wait for a GPIO to go high.
  * @wait_retry_us: we'll attempt another claim after this many microseconds.
  * @wait_free_us: we'll give up after this many microseconds.
  */
 
 struct i2c_arbitrator_data {
-	int our_gpio;
-	int our_gpio_release;
-	int their_gpio;
-	int their_gpio_release;
+	struct gpio_desc *our_gpio;
+	struct gpio_desc *their_gpio;
 	unsigned int slew_delay_us;
 	unsigned int wait_retry_us;
 	unsigned int wait_free_us;
@@ -64,15 +57,15 @@ static int i2c_arbitrator_select(struct i2c_mux_core *muxc, u32 chan)
 	stop_time = jiffies + usecs_to_jiffies(arb->wait_free_us) + 1;
 	do {
 		/* Indicate that we want to claim the bus */
-		gpio_set_value(arb->our_gpio, !arb->our_gpio_release);
+		gpiod_set_value(arb->our_gpio, 1);
 		udelay(arb->slew_delay_us);
 
 		/* Wait for the other master to release it */
 		stop_retry = jiffies + usecs_to_jiffies(arb->wait_retry_us) + 1;
 		while (time_before(jiffies, stop_retry)) {
-			int gpio_val = !!gpio_get_value(arb->their_gpio);
+			int gpio_val = gpiod_get_value(arb->their_gpio);
 
-			if (gpio_val == arb->their_gpio_release) {
+			if (!gpio_val) {
 				/* We got it, so return */
 				return 0;
 			}
@@ -81,13 +74,13 @@ static int i2c_arbitrator_select(struct i2c_mux_core *muxc, u32 chan)
 		}
 
 		/* It didn't release, so give up, wait, and try again */
-		gpio_set_value(arb->our_gpio, arb->our_gpio_release);
+		gpiod_set_value(arb->our_gpio, 0);
 
 		usleep_range(arb->wait_retry_us, arb->wait_retry_us * 2);
 	} while (time_before(jiffies, stop_time));
 
 	/* Give up, release our claim */
-	gpio_set_value(arb->our_gpio, arb->our_gpio_release);
+	gpiod_set_value(arb->our_gpio, 0);
 	udelay(arb->slew_delay_us);
 	dev_err(muxc->dev, "Could not claim bus, timeout\n");
 	return -EBUSY;
@@ -103,7 +96,7 @@ static int i2c_arbitrator_deselect(struct i2c_mux_core *muxc, u32 chan)
 	const struct i2c_arbitrator_data *arb = i2c_mux_priv(muxc);
 
 	/* Release the bus and wait for the other master to notice */
-	gpio_set_value(arb->our_gpio, arb->our_gpio_release);
+	gpiod_set_value(arb->our_gpio, 0);
 	udelay(arb->slew_delay_us);
 
 	return 0;
@@ -116,8 +109,7 @@ static int i2c_arbitrator_probe(struct platform_device *pdev)
 	struct device_node *parent_np;
 	struct i2c_mux_core *muxc;
 	struct i2c_arbitrator_data *arb;
-	enum of_gpio_flags gpio_flags;
-	unsigned long out_init;
+	struct gpio_desc *dummy;
 	int ret;
 
 	/* We only support probing from device tree; no platform_data */
@@ -138,45 +130,28 @@ static int i2c_arbitrator_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, muxc);
 
-	/* Request GPIOs */
-	ret = of_get_named_gpio_flags(np, "our-claim-gpio", 0, &gpio_flags);
-	if (!gpio_is_valid(ret)) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Error getting our-claim-gpio\n");
-		return ret;
-	}
-	arb->our_gpio = ret;
-	arb->our_gpio_release = !!(gpio_flags & OF_GPIO_ACTIVE_LOW);
-	out_init = (gpio_flags & OF_GPIO_ACTIVE_LOW) ?
-		GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW;
-	ret = devm_gpio_request_one(dev, arb->our_gpio, out_init,
-				    "our-claim-gpio");
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Error requesting our-claim-gpio\n");
-		return ret;
+	/* Request GPIOs, our GPIO as unclaimed to begin with */
+	arb->our_gpio = devm_gpiod_get(dev, "our-claim", GPIOD_OUT_LOW);
+	if (IS_ERR(arb->our_gpio)) {
+		dev_err(dev, "could not get \"our-claim\" GPIO (%ld)\n",
+			PTR_ERR(arb->our_gpio));
+		return PTR_ERR(arb->our_gpio);
 	}
 
-	ret = of_get_named_gpio_flags(np, "their-claim-gpios", 0, &gpio_flags);
-	if (!gpio_is_valid(ret)) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Error getting their-claim-gpio\n");
-		return ret;
-	}
-	arb->their_gpio = ret;
-	arb->their_gpio_release = !!(gpio_flags & OF_GPIO_ACTIVE_LOW);
-	ret = devm_gpio_request_one(dev, arb->their_gpio, GPIOF_IN,
-				    "their-claim-gpio");
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Error requesting their-claim-gpio\n");
-		return ret;
+	arb->their_gpio = devm_gpiod_get(dev, "their-claim", GPIOD_IN);
+	if (IS_ERR(arb->their_gpio)) {
+		dev_err(dev, "could not get \"their-claim\" GPIO (%ld)\n",
+			PTR_ERR(arb->their_gpio));
+		return PTR_ERR(arb->their_gpio);
 	}
 
 	/* At the moment we only support a single two master (us + 1 other) */
-	if (gpio_is_valid(of_get_named_gpio(np, "their-claim-gpios", 1))) {
+	dummy = devm_gpiod_get_index(dev, "their-claim", 1, GPIOD_IN);
+	if (!IS_ERR(dummy)) {
 		dev_err(dev, "Only one other master is supported\n");
 		return -EINVAL;
+	} else if (PTR_ERR(dummy) == -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
 	}
 
 	/* Arbitration parameters */
-- 
2.20.1

