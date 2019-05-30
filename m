Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8639730327
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 22:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfE3UNB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 May 2019 16:13:01 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35968 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfE3UNB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 May 2019 16:13:01 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so1947424wrs.3
        for <linux-i2c@vger.kernel.org>; Thu, 30 May 2019 13:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ViFMQAf2WDsJwO1vElsDb0JkszfiO6AKCi1zDV0EetY=;
        b=gsLyxpGM8cOdinX926XsdnIW+zXTbSiKsExJuzkkiGluymjM0M98lKCgtuQ2j2uCO1
         r6CrlrqNUPqotrC/cchLuI1VsVfIw1AprGx0Y+08us6yE1Q7CoxYiGwysDQe550IJKVc
         LDFF7kav4ooF2u2+rh1pgGp9iEXqszV+crv7+n/bJP5cXgOLA3Q8LwYVjVtoD1yag2dR
         LujEyJ4eRVKanmj+czOJesoWjjnONIup02JqnLpTZR9nHc1tO+MKu0iiN0aYMCFj1J/m
         uYIXDr0zgpOSMU0vBnyWXAlkWnVnqBoL2evglncWFVFX2/xV4VZPkCcJTgleqLQZ9MwD
         sElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ViFMQAf2WDsJwO1vElsDb0JkszfiO6AKCi1zDV0EetY=;
        b=bwGUzYZ+qru2fTqguFcqxMWFQ6OhwV/rfXT4v+L1uv+RH65HIazBus3VO7o+I6btqi
         z6+LACaZAfWBWV8N0lhrQD2h/7zqTsQSLsQm7C+V9WIAK36kEjPpPz+cwjvdmWGBG6ET
         y9G+LKVIfEkzstfNEbschknwCFL6STklx6ImGxsHDHBCmr2XJS0s+flRCdZb7PRQi4ZL
         v/sguh16yOiMIexjAosdlawMthEzJ6v02AtfVbjACWalIn0/vuih/dfKFCysf+8+aqj+
         PfuDbca5mph8nzgAQN3jHS+VswkzzTjdf9s/OxJqLbTHCffrmOKuElYHeWJfJY6/MJxF
         P4CA==
X-Gm-Message-State: APjAAAXxqBLbDVKehpnYbat6YEn4/2/SvQiY2mq3Fiw6X7+mNiuo7OaV
        FBDq6C5tHwGAsCbA0/MYvKiETQ==
X-Google-Smtp-Source: APXvYqyh95hWMkelXH3SPd8Qrlk0PRV2z0JkShGUxcZItDEiDA2O1I589ZmGvn9Bp/5CpdVn7zKSOA==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr3967158wri.190.1559247179285;
        Thu, 30 May 2019 13:12:59 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id 3sm2280554wmj.21.2019.05.30.13.12.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 30 May 2019 13:12:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>
Subject: [PATCH] i2c: mux/i801: Switch to use descriptor passing
Date:   Thu, 30 May 2019 22:12:52 +0200
Message-Id: <20190530201252.11922-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This switches the i801 GPIO mux to use GPIO descriptors for
handling the GPIO lines. The previous hack which was reaching
inside the GPIO chips etc cannot live on. We pass descriptors
along with the GPIO mux device at creation instead.

The GPIO mux was only used by way of platform data with a
platform device from one place in the kernel: the i801 i2c bus
driver. Let's just associate the GPIO descriptor table with
the actual device like everyone else and dynamically create
a descriptor table passed along with the GPIO i2c mux.

This enables simplification of the GPIO i2c mux driver to
use only the descriptor API and the OF probe path gets
simplified in the process.

The i801 driver was registering the GPIO i2c mux with
PLATFORM_DEVID_AUTO which would make it hard to predict the
device name and assign the descriptor table properly, but
this seems to be a mistake to begin with: all of the
GPIO mux devices are hardcoded to look up GPIO lines from
the "gpio_ich" GPIO chip. If there are more than one mux,
there is certainly more than one gpio chip as well, and
then we have more serious problems. Switch to
PLATFORM_DEVID_NONE instead. There can be only one.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Folks, you surely see what I am trying to do. Would
appreciate help fixing any bugs (it compiles).
---
 drivers/i2c/busses/i2c-i801.c              |  31 ++++--
 drivers/i2c/muxes/i2c-mux-gpio.c           | 109 +++++----------------
 include/linux/platform_data/i2c-mux-gpio.h |   7 --
 3 files changed, 51 insertions(+), 96 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 679c6c41f64b..5bf5e16df888 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -107,7 +107,7 @@
 #include <linux/pm_runtime.h>
 
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
-#include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_data/i2c-mux-gpio.h>
 #endif
 
@@ -1259,6 +1259,8 @@ static int i801_add_mux(struct i801_priv *priv)
 	const struct i801_mux_config *mux_config;
 	struct i2c_mux_gpio_platform_data gpio_data;
 	int err;
+	struct gpiod_lookup_table *lookup;
+	int i;
 
 	if (!priv->mux_drvdata)
 		return 0;
@@ -1270,14 +1272,31 @@ static int i801_add_mux(struct i801_priv *priv)
 	gpio_data.values = mux_config->values;
 	gpio_data.n_values = mux_config->n_values;
 	gpio_data.classes = mux_config->classes;
-	gpio_data.gpio_chip = mux_config->gpio_chip;
-	gpio_data.gpios = mux_config->gpios;
-	gpio_data.n_gpios = mux_config->n_gpios;
 	gpio_data.idle = I2C_MUX_GPIO_NO_IDLE;
 
-	/* Register the mux device */
+	/* Register GPIO descriptor lookup table */
+	lookup = devm_kzalloc(dev,
+			      struct_size(lookup, table, mux_config->n_gpios),
+			      GFP_KERNEL);
+	if (!lookup)
+		return -ENOMEM;
+	lookup->dev_id = "i2c-mux-gpio";
+	for (i = 0; i < mux_config->n_gpios; i++) {
+		lookup->table[i].chip_label = mux_config->gpio_chip;
+		lookup->table[i].chip_hwnum = mux_config->gpios[i];
+		lookup->table[i].con_id = NULL;
+	}
+	gpiod_add_lookup_table(lookup);
+
+	/*
+	 * Register the mux device, we use PLATFORM_DEVID_NONE here
+	 * because since we are referring to the GPIO chip by name we are
+	 * anyways in deep trouble if there is more than one of these
+	 * devices, and there should likely only be one platform controller
+	 * hub.
+	 */
 	priv->mux_pdev = platform_device_register_data(dev, "i2c-mux-gpio",
-				PLATFORM_DEVID_AUTO, &gpio_data,
+				PLATFORM_DEVID_NONE, &gpio_data,
 				sizeof(struct i2c_mux_gpio_platform_data));
 	if (IS_ERR(priv->mux_pdev)) {
 		err = PTR_ERR(priv->mux_pdev);
diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 13882a2a4f60..044d44807fdd 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -14,13 +14,13 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
+#include <linux/bits.h>
+#include <linux/gpio/consumer.h>
 #include "../../gpio/gpiolib.h"
-#include <linux/of_gpio.h>
 
 struct gpiomux {
 	struct i2c_mux_gpio_platform_data data;
-	unsigned gpio_base;
+	int ngpios;
 	struct gpio_desc **gpios;
 };
 
@@ -30,7 +30,7 @@ static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
 
 	values[0] = val;
 
-	gpiod_set_array_value_cansleep(mux->data.n_gpios, mux->gpios, NULL,
+	gpiod_set_array_value_cansleep(mux->ngpios, mux->gpios, NULL,
 				       values);
 }
 
@@ -52,12 +52,6 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
 	return 0;
 }
 
-static int match_gpio_chip_by_label(struct gpio_chip *chip,
-					      void *data)
-{
-	return !strcmp(chip->label, data);
-}
-
 #ifdef CONFIG_OF
 static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
 					struct platform_device *pdev)
@@ -103,29 +97,6 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
 	if (of_property_read_u32(np, "idle-state", &mux->data.idle))
 		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
 
-	mux->data.n_gpios = of_gpio_named_count(np, "mux-gpios");
-	if (mux->data.n_gpios < 0) {
-		dev_err(&pdev->dev, "Missing mux-gpios property in the DT.\n");
-		return -EINVAL;
-	}
-
-	gpios = devm_kcalloc(&pdev->dev,
-			     mux->data.n_gpios, sizeof(*mux->data.gpios),
-			     GFP_KERNEL);
-	if (!gpios) {
-		dev_err(&pdev->dev, "Cannot allocate gpios array");
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < mux->data.n_gpios; i++) {
-		ret = of_get_named_gpio(np, "mux-gpios", i);
-		if (ret < 0)
-			return ret;
-		gpios[i] = ret;
-	}
-
-	mux->data.gpios = gpios;
-
 	return 0;
 }
 #else
@@ -142,8 +113,8 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	struct gpiomux *mux;
 	struct i2c_adapter *parent;
 	struct i2c_adapter *root;
-	unsigned initial_state, gpio_base;
-	int i, ret;
+	unsigned initial_state;
+	int i, ngpios, ret;
 
 	mux = devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
 	if (!mux)
@@ -158,29 +129,19 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 			sizeof(mux->data));
 	}
 
-	/*
-	 * If a GPIO chip name is provided, the GPIO pin numbers provided are
-	 * relative to its base GPIO number. Otherwise they are absolute.
-	 */
-	if (mux->data.gpio_chip) {
-		struct gpio_chip *gpio;
-
-		gpio = gpiochip_find(mux->data.gpio_chip,
-				     match_gpio_chip_by_label);
-		if (!gpio)
-			return -EPROBE_DEFER;
-
-		gpio_base = gpio->base;
-	} else {
-		gpio_base = 0;
+	ngpios = gpiod_count(&pdev->dev, NULL);
+	if (!ngpios) {
+		dev_err(&pdev->dev, "no gpios provided\n");
+		return -EINVAL;
 	}
+	mux->ngpios = ngpios;
 
 	parent = i2c_get_adapter(mux->data.parent);
 	if (!parent)
 		return -EPROBE_DEFER;
 
 	muxc = i2c_mux_alloc(parent, &pdev->dev, mux->data.n_values,
-			     mux->data.n_gpios * sizeof(*mux->gpios), 0,
+			     ngpios * sizeof(*mux->gpios), 0,
 			     i2c_mux_gpio_select, NULL);
 	if (!muxc) {
 		ret = -ENOMEM;
@@ -194,7 +155,6 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	root = i2c_root_adapter(&parent->dev);
 
 	muxc->mux_locked = true;
-	mux->gpio_base = gpio_base;
 
 	if (mux->data.idle != I2C_MUX_GPIO_NO_IDLE) {
 		initial_state = mux->data.idle;
@@ -203,34 +163,27 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 		initial_state = mux->data.values[0];
 	}
 
-	for (i = 0; i < mux->data.n_gpios; i++) {
+	for (i = 0; i < ngpios; i++) {
 		struct device *gpio_dev;
-		struct gpio_desc *gpio_desc;
-
-		ret = gpio_request(gpio_base + mux->data.gpios[i], "i2c-mux-gpio");
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to request GPIO %d\n",
-				mux->data.gpios[i]);
-			goto err_request_gpio;
-		}
-
-		ret = gpio_direction_output(gpio_base + mux->data.gpios[i],
-					    initial_state & (1 << i));
-		if (ret) {
-			dev_err(&pdev->dev,
-				"Failed to set direction of GPIO %d to output\n",
-				mux->data.gpios[i]);
-			i++;	/* gpio_request above succeeded, so must free */
-			goto err_request_gpio;
+		struct gpio_desc *gpiod;
+		enum gpiod_flags flag;
+
+		if (initial_state & BIT(i))
+			flag = GPIOD_OUT_HIGH;
+		else
+			flag = GPIOD_OUT_LOW;
+		gpiod = devm_gpiod_get_index(&pdev->dev, NULL, i, flag);
+		if (IS_ERR(gpiod)) {
+			ret = PTR_ERR(gpiod);
+			goto alloc_failed;
 		}
 
-		gpio_desc = gpio_to_desc(gpio_base + mux->data.gpios[i]);
-		mux->gpios[i] = gpio_desc;
+		mux->gpios[i] = gpiod;
 
 		if (!muxc->mux_locked)
 			continue;
 
-		gpio_dev = &gpio_desc->gdev->dev;
+		gpio_dev = &gpiod->gdev->dev;
 		muxc->mux_locked = i2c_root_adapter(gpio_dev) == root;
 	}
 
@@ -253,10 +206,6 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 
 add_adapter_failed:
 	i2c_mux_del_adapters(muxc);
-	i = mux->data.n_gpios;
-err_request_gpio:
-	for (; i > 0; i--)
-		gpio_free(gpio_base + mux->data.gpios[i - 1]);
 alloc_failed:
 	i2c_put_adapter(parent);
 
@@ -266,14 +215,8 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 static int i2c_mux_gpio_remove(struct platform_device *pdev)
 {
 	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
-	struct gpiomux *mux = i2c_mux_priv(muxc);
-	int i;
 
 	i2c_mux_del_adapters(muxc);
-
-	for (i = 0; i < mux->data.n_gpios; i++)
-		gpio_free(mux->gpio_base + mux->data.gpios[i]);
-
 	i2c_put_adapter(muxc->parent);
 
 	return 0;
diff --git a/include/linux/platform_data/i2c-mux-gpio.h b/include/linux/platform_data/i2c-mux-gpio.h
index 4406108201fe..28f288eed652 100644
--- a/include/linux/platform_data/i2c-mux-gpio.h
+++ b/include/linux/platform_data/i2c-mux-gpio.h
@@ -22,10 +22,6 @@
  *	position
  * @n_values: Number of multiplexer positions (busses to instantiate)
  * @classes: Optional I2C auto-detection classes
- * @gpio_chip: Optional GPIO chip name; if set, GPIO pin numbers are given
- *	relative to the base GPIO number of that chip
- * @gpios: Array of GPIO numbers used to control MUX
- * @n_gpios: Number of GPIOs used to control MUX
  * @idle: Bitmask to write to MUX when idle or GPIO_I2CMUX_NO_IDLE if not used
  */
 struct i2c_mux_gpio_platform_data {
@@ -34,9 +30,6 @@ struct i2c_mux_gpio_platform_data {
 	const unsigned *values;
 	int n_values;
 	const unsigned *classes;
-	char *gpio_chip;
-	const unsigned *gpios;
-	int n_gpios;
 	unsigned idle;
 };
 
-- 
2.20.1

