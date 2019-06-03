Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFC233ACC
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 00:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfFCWI2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 18:08:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50183 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbfFCWI1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 18:08:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id f204so8782809wme.0
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jun 2019 15:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dpgg5uxmbeNRaEe85CeogYmO9X8ugq0tC4oT2YMZB6o=;
        b=U6ZhAVLTjozLdQqMKKcT5yM3SwFxt1iNTFc6zxXkcHKHMMXbHU2MhKMOM4E04yRWuj
         IWMHz4Gztt+MmR7cJbioTlzWU53dLr72gKN8eQcxacfhMs2FqkZIQmeV+InPl9V9Gk+B
         y3GkkCpeHjvqmCbz0NrLVNFCylmaNP8Ax0Vk4yTJkxP7zdcJdiI7ldAX1nVuGmPPLThm
         HdIz60zoWbH2q60U+DFMgBWQhGsx/VtKL+RG+gjg4wBwz0q16JwthPxNs6OMw/cj5L8F
         tv9p+6LX/awRjRuk0bGSUVHOzncs7jujJZvoHYbXDrqsEFMpSWVGLZq/GyALBThN6usC
         kimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dpgg5uxmbeNRaEe85CeogYmO9X8ugq0tC4oT2YMZB6o=;
        b=KxFWxHUJgnIPMiv8KkiQbKI/iVxUwhBU/BQaLwrpYsp59VWxHHC2BxBOyRh0bJ1MYD
         BpVNHD88oWMJ3VCmvPteZPlx0B2xXbf646PYGkV/sUg+x2g64Zc3A21vHnVbDhTn1EJ6
         XLxpUbRX1WzpH8Lyd5bcfx4lJxUtLdnFjADSMLe3UkjVvyCNj73daYL72dtPk4Zcbtcq
         4XU7u8yvlMkh//ymwF7k3fZT4br5RSkprRouJGiNzorGM9VrhabJ2BTK5BwXfia9um4D
         diNhx9iLgaA94jNOvQIvGjdMWbm2GvDXVRPZX6IP+fVCnHK87O8C1S6K0kj4d+SUthxz
         wL9A==
X-Gm-Message-State: APjAAAVx6ExIYGYmaEjZbBVkaNhaQlXgslxgHF5HckjKKrC4LZBAkxu3
        2dwrtqhDBayjhsLnM/E51Bx/7w==
X-Google-Smtp-Source: APXvYqyMvqwKctnP3IMhK1JoZQ70leVAwnfbRsSrM+y2g9k26+02nkG/OijsIpg7hlqTPvIQ4A6pBg==
X-Received: by 2002:a05:600c:21c6:: with SMTP id x6mr3832325wmj.102.1559599704122;
        Mon, 03 Jun 2019 15:08:24 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id h17sm13237573wrq.79.2019.06.03.15.08.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 15:08:22 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>
Subject: [PATCH v3] i2c: mux/i801: Switch to use descriptor passing
Date:   Tue,  4 Jun 2019 00:08:19 +0200
Message-Id: <20190603220819.31701-1-linus.walleij@linaro.org>
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
ChangeLog v2->v3:
- Reorder variable declarations to inverse christmas tree.
- Stash away GPIO lookup table reference and make sure to
  remove it on deletion and on error path.
- Insert some nasty FIXME comments about poking around
  in gpiolib internals.
ChangeLog v1->v2:
- Found some unused vars when compiling for DT, mea culpa.

Folks, you surely see what I am trying to do. Would
appreciate help fixing any bugs (it compiles).
---
 drivers/i2c/busses/i2c-i801.c              |  37 +++++--
 drivers/i2c/muxes/i2c-mux-gpio.c           | 115 ++++++---------------
 include/linux/platform_data/i2c-mux-gpio.h |   7 --
 3 files changed, 60 insertions(+), 99 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 679c6c41f64b..4e1ca34e00d8 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -107,7 +107,7 @@
 #include <linux/pm_runtime.h>
 
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
-#include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_data/i2c-mux-gpio.h>
 #endif
 
@@ -274,6 +274,7 @@ struct i801_priv {
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
 	const struct i801_mux_config *mux_drvdata;
 	struct platform_device *mux_pdev;
+	struct gpiod_lookup_table *lookup;
 #endif
 	struct platform_device *tco_pdev;
 
@@ -1258,7 +1259,8 @@ static int i801_add_mux(struct i801_priv *priv)
 	struct device *dev = &priv->adapter.dev;
 	const struct i801_mux_config *mux_config;
 	struct i2c_mux_gpio_platform_data gpio_data;
-	int err;
+	struct gpiod_lookup_table *lookup;
+	int err, i;
 
 	if (!priv->mux_drvdata)
 		return 0;
@@ -1270,17 +1272,36 @@ static int i801_add_mux(struct i801_priv *priv)
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
+	priv->lookup = lookup;
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
+		gpiod_remove_lookup_table(lookup);
 		priv->mux_pdev = NULL;
 		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
 		return err;
@@ -1293,6 +1314,8 @@ static void i801_del_mux(struct i801_priv *priv)
 {
 	if (priv->mux_pdev)
 		platform_device_unregister(priv->mux_pdev);
+	if (priv->lookup)
+		gpiod_remove_lookup_table(priv->lookup);
 }
 
 static unsigned int i801_get_adapter_class(struct i801_priv *priv)
diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 13882a2a4f60..b9578f668fb2 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -14,13 +14,14 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
+#include <linux/bits.h>
+#include <linux/gpio/consumer.h>
+/* FIXME: stop poking around inside gpiolib */
 #include "../../gpio/gpiolib.h"
-#include <linux/of_gpio.h>
 
 struct gpiomux {
 	struct i2c_mux_gpio_platform_data data;
-	unsigned gpio_base;
+	int ngpios;
 	struct gpio_desc **gpios;
 };
 
@@ -30,7 +31,7 @@ static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
 
 	values[0] = val;
 
-	gpiod_set_array_value_cansleep(mux->data.n_gpios, mux->gpios, NULL,
+	gpiod_set_array_value_cansleep(mux->ngpios, mux->gpios, NULL,
 				       values);
 }
 
@@ -52,12 +53,6 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
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
@@ -65,8 +60,8 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *adapter_np, *child;
 	struct i2c_adapter *adapter;
-	unsigned *values, *gpios;
-	int i = 0, ret;
+	unsigned *values;
+	int i = 0;
 
 	if (!np)
 		return -ENODEV;
@@ -103,29 +98,6 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
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
@@ -142,8 +114,8 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	struct gpiomux *mux;
 	struct i2c_adapter *parent;
 	struct i2c_adapter *root;
-	unsigned initial_state, gpio_base;
-	int i, ret;
+	unsigned initial_state;
+	int i, ngpios, ret;
 
 	mux = devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
 	if (!mux)
@@ -158,29 +130,19 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
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
@@ -194,7 +156,6 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	root = i2c_root_adapter(&parent->dev);
 
 	muxc->mux_locked = true;
-	mux->gpio_base = gpio_base;
 
 	if (mux->data.idle != I2C_MUX_GPIO_NO_IDLE) {
 		initial_state = mux->data.idle;
@@ -203,34 +164,28 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
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
+		/* FIXME: find a proper way to access the GPIO device */
+		gpio_dev = &gpiod->gdev->dev;
 		muxc->mux_locked = i2c_root_adapter(gpio_dev) == root;
 	}
 
@@ -253,10 +208,6 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 
 add_adapter_failed:
 	i2c_mux_del_adapters(muxc);
-	i = mux->data.n_gpios;
-err_request_gpio:
-	for (; i > 0; i--)
-		gpio_free(gpio_base + mux->data.gpios[i - 1]);
 alloc_failed:
 	i2c_put_adapter(parent);
 
@@ -266,14 +217,8 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
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

