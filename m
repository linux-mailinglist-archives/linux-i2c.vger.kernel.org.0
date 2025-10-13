Return-Path: <linux-i2c+bounces-13468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4198BD1922
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 08:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A1F64EC06F
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 06:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AED20B21E;
	Mon, 13 Oct 2025 06:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEUJcelQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992F22E0412
	for <linux-i2c@vger.kernel.org>; Mon, 13 Oct 2025 06:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760335253; cv=none; b=OLpJOe1Uk7mduF8Wr1UdJQW7yWDrPIlL90czJSFR5JGJCoHU/mopXJauZYgfQ5CHCGP+488FYfLqpdXiphjyB2nVAXdCjBsP79/A1wAQO2kk0ZeFqVuSXNn9v73gU7fiZhFXU7JEXCHi8I2H4ivC7bUyaKLj9mjeQbTfIwSwXF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760335253; c=relaxed/simple;
	bh=n19cUIUifzb9e7i9WDr+ddZdeWjbqWFWgaplDIhF8iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RkJ/wPtP5zyNryVMK41b+DlLdTamTb9kxFmFlYy9n6Xr7b0+iFDuXCZZ5+4iVfzadlFag8gdTff9HusXuw8O2VrztnwGOmJ8mA9QF4uwzAiyeu01oWZ5eP1UgRT9hsY/qmHG6SfuVw7xpqH+sUa+JyyfTOvFX4nPCGkHiziP3u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEUJcelQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so710172166b.3
        for <linux-i2c@vger.kernel.org>; Sun, 12 Oct 2025 23:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760335246; x=1760940046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oi6MNQDMTUKU8TfoLzmAqqYXa8BYp1KgoMucS99LGk=;
        b=LEUJcelQqxlet4qiiNlIgJAitvMD9caftVj0RA3584NarQM7p8+db8XVw/Z/PHXmeh
         iSNDN/jRP4oE+ZdCWJyX0DaRd+rdfbMmnmnvm+uRATrElpVhWkwzqufhOtL/QYNOegBm
         7fCzwYZj05GFejnY6JmFC8mpTeqAy5JLFD/tqqdOnex0e0gWDKi0Pd+VmM2xeag/XX6v
         qIfcj/1Z+m50aD6sMgFXiR1WqkOkoceRIG+laOzuBw6gjBPFeTl9bwGZAqfxk9hiIGIv
         3zCcaA+7mOHyovtTWQLMehX03AawZBgUvepfahSCNalb+eSwQA6w4Vi+PC5Rr9kk4Ykh
         J04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335246; x=1760940046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oi6MNQDMTUKU8TfoLzmAqqYXa8BYp1KgoMucS99LGk=;
        b=s9Nc1656xAe96aVt6uW6UHZlUIH9hOKFLBvm5aBUtIXi4GKIctVYYAfqmfC20He8V0
         rQGMRjPYxOfNDZFaAsSI9fqogbZ6pyDj5UcZ420OSGhT9oVcgH5lmINL2FBXJ+hE7He4
         JTT7srTqjIXU/w5T62VbCFL7Gz61bSDU1jLSGIiIXm27SCG+JgxN+J+95mBQJmHa/2wz
         jFUKmJ6umAFH7ACydMIeQilMztgx8eOmJ3RhnK/LAvtF8wqDPqVAsII2kFjewmLwH3CY
         UpPbWmzVd+5yM7Uvn1k4FRiI7/sxhnrEQV2N2zxI0GSTf2Mcgft++EybDj3Uw2n74bpr
         sxFw==
X-Gm-Message-State: AOJu0YyDPKoOI96J0d4jqbRkMvncoPLEECdbHiTa3hPkvCtDd85PRi4Y
	yQBZOmxZ9IxHZxltXGI4pzmQdAKIE4B7mnKSRZactJZcO05Rmy+u3Jmf
X-Gm-Gg: ASbGncsmLudzHBCAUWBiwCfrLhka9L6SdOBXkCWiufqngMI6BI18+g5P8GiOvgKdzW2
	vPwHsAARycU/E2jhwM/j0ez9k17inuVOrXT4NXuE8FKbLmzfIwJj68yw6wl8p1B/+0O45wNfP/T
	Jvwqbt++RnwPRdCX5EKoh328iQzwIW4E9j88KppuRByFtS+GwlEu5KWc5byV5Dti1G0G1RF5GiP
	Jj4p47RiJxXYOHnQ+IoZmh6z2NMX5hBOkN7buKNf6eIxl55rpZ8YlyQPQf3Bbpp8IZaCJIsGc6q
	GA+rjBe88S7zMDt5WhwsKETEfDCW60quRvVqh9LS6G+YMLAevZ9MUDGBGRr6pfmFY5dSqCQcpE5
	NcG3MebAySbFw1nUU1k7HZS2miu5Lm+m7
X-Google-Smtp-Source: AGHT+IEUkL4yAWov+92CdIRc7OfTdboXAgYAX+Q/T2trgl0y/2hW7avdhCtycFVL6nZg4Vijdc6Ovw==
X-Received: by 2002:a17:907:7f0e:b0:b3f:33f6:fb57 with SMTP id a640c23a62f3a-b50a9d59a3bmr1870564166b.9.1760335245808;
        Sun, 12 Oct 2025 23:00:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacba7sm848329466b.5.2025.10.12.23.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 23:00:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
Date: Mon, 13 Oct 2025 09:00:17 +0300
Message-ID: <20251013060018.43851-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013060018.43851-1-clamor95@gmail.com>
References: <20251013060018.43851-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Add support for hot-plugged I2C busses, where some devices on the bus are
hot-pluggable and their presence is indicated by GPIO line.

This feature is used by the ASUS Transformers, Microsoft Surface RT/2 and
maybe more.

Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/i2c/muxes/Kconfig            |  11 ++
 drivers/i2c/muxes/Makefile           |   1 +
 drivers/i2c/muxes/i2c-hotplug-gpio.c | 263 +++++++++++++++++++++++++++
 3 files changed, 275 insertions(+)
 create mode 100644 drivers/i2c/muxes/i2c-hotplug-gpio.c

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index 6d2f66810cdc..0e410be5ce55 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -19,6 +19,17 @@ config I2C_ARB_GPIO_CHALLENGE
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-arb-gpio-challenge.
 
+config I2C_HOTPLUG_GPIO
+	tristate "Hot-plugged I2C bus detected by GPIO"
+	depends on GPIOLIB
+	depends on OF
+	help
+	  Say Y here if you want support for hot-plugging I2C devices
+	  with presence detected by GPIO pin value.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-hotplug-gpio.
+
 config I2C_MUX_GPIO
 	tristate "GPIO-based I2C multiplexer"
 	depends on GPIOLIB
diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
index 4b24f49515a7..36df41c8cf05 100644
--- a/drivers/i2c/muxes/Makefile
+++ b/drivers/i2c/muxes/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_I2C_ARB_GPIO_CHALLENGE)	+= i2c-arb-gpio-challenge.o
 
 obj-$(CONFIG_I2C_DEMUX_PINCTRL)		+= i2c-demux-pinctrl.o
 
+obj-$(CONFIG_I2C_HOTPLUG_GPIO)	+= i2c-hotplug-gpio.o
 obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
 obj-$(CONFIG_I2C_MUX_GPMUX)	+= i2c-mux-gpmux.o
 obj-$(CONFIG_I2C_MUX_LTC4306)	+= i2c-mux-ltc4306.o
diff --git a/drivers/i2c/muxes/i2c-hotplug-gpio.c b/drivers/i2c/muxes/i2c-hotplug-gpio.c
new file mode 100644
index 000000000000..7f56964e285e
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-hotplug-gpio.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+struct i2c_hotplug_priv {
+	struct i2c_adapter adap;
+	struct i2c_adapter *parent;
+	struct device *dev;
+	struct gpio_desc *gpio;
+	int irq;
+};
+
+static inline struct i2c_adapter *i2c_hotplug_parent(struct i2c_adapter *adap)
+{
+	struct i2c_hotplug_priv *priv = container_of(adap, struct i2c_hotplug_priv, adap);
+
+	return priv->parent;
+}
+
+static int i2c_hotplug_master_xfer(struct i2c_adapter *adap,
+				   struct i2c_msg msgs[], int num)
+{
+	struct i2c_adapter *parent = i2c_hotplug_parent(adap);
+
+	return parent->algo->master_xfer(parent, msgs, num);
+}
+
+static int i2c_hotplug_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+				  unsigned short flags, char read_write,
+				  u8 command, int protocol,
+				  union i2c_smbus_data *data)
+{
+	struct i2c_adapter *parent = i2c_hotplug_parent(adap);
+
+	return parent->algo->smbus_xfer(parent, addr, flags, read_write,
+					command, protocol, data);
+}
+
+static u32 i2c_hotplug_functionality(struct i2c_adapter *adap)
+{
+	u32 parent_func = i2c_get_functionality(i2c_hotplug_parent(adap));
+
+	return parent_func & ~I2C_FUNC_SLAVE;
+}
+
+static const struct i2c_algorithm i2c_hotplug_algo_i2c = {
+	.master_xfer = i2c_hotplug_master_xfer,
+	.functionality = i2c_hotplug_functionality,
+};
+
+static const struct i2c_algorithm i2c_hotplug_algo_smbus = {
+	.smbus_xfer = i2c_hotplug_smbus_xfer,
+	.functionality = i2c_hotplug_functionality,
+};
+
+static const struct i2c_algorithm i2c_hotplug_algo_both = {
+	.master_xfer = i2c_hotplug_master_xfer,
+	.smbus_xfer = i2c_hotplug_smbus_xfer,
+	.functionality = i2c_hotplug_functionality,
+};
+
+static const struct i2c_algorithm *const i2c_hotplug_algo[2][2] = {
+	/* non-I2C */
+	{ NULL, &i2c_hotplug_algo_smbus },
+	/* I2C */
+	{ &i2c_hotplug_algo_i2c, &i2c_hotplug_algo_both }
+};
+
+static void i2c_hotplug_lock_bus(struct i2c_adapter *adap, unsigned int flags)
+{
+	i2c_lock_bus(i2c_hotplug_parent(adap), flags);
+}
+
+static int i2c_hotplug_trylock_bus(struct i2c_adapter *adap,
+				   unsigned int flags)
+{
+	return i2c_trylock_bus(i2c_hotplug_parent(adap), flags);
+}
+
+static void i2c_hotplug_unlock_bus(struct i2c_adapter *adap,
+				   unsigned int flags)
+{
+	i2c_unlock_bus(i2c_hotplug_parent(adap), flags);
+}
+
+static const struct i2c_lock_operations i2c_hotplug_lock_ops = {
+	.lock_bus = i2c_hotplug_lock_bus,
+	.trylock_bus = i2c_hotplug_trylock_bus,
+	.unlock_bus = i2c_hotplug_unlock_bus,
+};
+
+static int i2c_hotplug_recover_bus(struct i2c_adapter *adap)
+{
+	return i2c_recover_bus(i2c_hotplug_parent(adap));
+}
+
+static struct i2c_bus_recovery_info i2c_hotplug_recovery_info = {
+	.recover_bus = i2c_hotplug_recover_bus,
+};
+
+static int i2c_hotplug_activate(struct i2c_hotplug_priv *priv)
+{
+	int ret;
+
+	if (priv->adap.algo_data)
+		return 0;
+
+	/*
+	 * Store the dev data in adapter dev, since
+	 * previous i2c_del_adapter might have wiped it.
+	 */
+	priv->adap.dev.parent = priv->dev;
+	priv->adap.dev.of_node = priv->dev->of_node;
+
+	dev_dbg(priv->adap.dev.parent, "connection detected");
+
+	ret = i2c_add_adapter(&priv->adap);
+	if (!ret)
+		priv->adap.algo_data = (void *)1;
+
+	return ret;
+}
+
+static void i2c_hotplug_deactivate(struct i2c_hotplug_priv *priv)
+{
+	if (!priv->adap.algo_data)
+		return;
+
+	dev_dbg(priv->adap.dev.parent, "disconnection detected");
+
+	i2c_del_adapter(&priv->adap);
+	priv->adap.algo_data = NULL;
+}
+
+static irqreturn_t i2c_hotplug_interrupt(int irq, void *dev_id)
+{
+	struct i2c_hotplug_priv *priv = dev_id;
+
+	/* debounce */
+	msleep(20);
+
+	if (gpiod_get_value_cansleep(priv->gpio))
+		i2c_hotplug_activate(priv);
+	else
+		i2c_hotplug_deactivate(priv);
+
+	return IRQ_HANDLED;
+}
+
+static void wrap_i2c_put_adapter(void *adapter)
+{
+	i2c_put_adapter(adapter);
+}
+
+static void wrap_i2c_hotplug_deactivate(void *priv)
+{
+	i2c_hotplug_deactivate(priv);
+}
+
+static int i2c_hotplug_gpio_probe(struct platform_device *pdev)
+{
+	struct device_node *parent_np;
+	struct i2c_adapter *parent;
+	struct i2c_hotplug_priv *priv;
+	bool is_i2c, is_smbus;
+	int err;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	priv->dev = &pdev->dev;
+
+	parent_np = of_parse_phandle(pdev->dev.of_node, "i2c-parent", 0);
+	if (IS_ERR(parent_np))
+		return dev_err_probe(&pdev->dev, PTR_ERR(parent_np),
+				     "cannot parse i2c-parent\n");
+
+	parent = of_find_i2c_adapter_by_node(parent_np);
+	of_node_put(parent_np);
+	if (IS_ERR(parent))
+		return dev_err_probe(&pdev->dev, PTR_ERR(parent),
+				     "failed to get parent I2C adapter\n");
+	priv->parent = parent;
+
+	err = devm_add_action_or_reset(&pdev->dev, wrap_i2c_put_adapter,
+				       parent);
+	if (err)
+		return err;
+
+	priv->gpio = devm_gpiod_get(&pdev->dev, "detect", GPIOD_IN);
+	if (IS_ERR(priv->gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->gpio),
+				     "failed to get detect GPIO\n");
+
+	is_i2c = parent->algo->master_xfer;
+	is_smbus = parent->algo->smbus_xfer;
+
+	snprintf(priv->adap.name, sizeof(priv->adap.name),
+		 "i2c-hotplug (master i2c-%d)", i2c_adapter_id(parent));
+	priv->adap.owner = THIS_MODULE;
+	priv->adap.algo = i2c_hotplug_algo[is_i2c][is_smbus];
+	priv->adap.algo_data = NULL;
+	priv->adap.lock_ops = &i2c_hotplug_lock_ops;
+	priv->adap.class = parent->class;
+	priv->adap.retries = parent->retries;
+	priv->adap.timeout = parent->timeout;
+	priv->adap.quirks = parent->quirks;
+	if (parent->bus_recovery_info)
+		/* .bus_recovery_info is not const, but won't be modified */
+		priv->adap.bus_recovery_info = (void *)&i2c_hotplug_recovery_info;
+
+	if (!priv->adap.algo)
+		return -EINVAL;
+
+	err = devm_add_action_or_reset(&pdev->dev, wrap_i2c_hotplug_deactivate, priv);
+	if (err)
+		return err;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return dev_err_probe(&pdev->dev, priv->irq,
+				     "failed to get IRQ %d\n", priv->irq);
+
+	err = devm_request_threaded_irq(&pdev->dev, priv->irq, NULL,
+					i2c_hotplug_interrupt,
+					IRQF_ONESHOT | IRQF_SHARED,
+					"i2c-hotplug", priv);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to register IRQ %d\n", priv->irq);
+
+	irq_wake_thread(priv->irq, priv);
+
+	return 0;
+}
+
+static const struct of_device_id i2c_hotplug_gpio_of_match[] = {
+	{ .compatible = "i2c-hotplug-gpio" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, i2c_hotplug_gpio_of_match);
+
+static struct platform_driver i2c_hotplug_gpio_driver = {
+	.driver	= {
+		.name = "i2c-hotplug-gpio",
+		.of_match_table = i2c_hotplug_gpio_of_match,
+	},
+	.probe = i2c_hotplug_gpio_probe,
+};
+
+module_platform_driver(i2c_hotplug_gpio_driver);
+
+MODULE_DESCRIPTION("Hot-plugged I2C bus detected by GPIO");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_LICENSE("GPL");
-- 
2.48.1


