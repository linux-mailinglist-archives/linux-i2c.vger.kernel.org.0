Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09152768080
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jul 2023 18:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjG2QJb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jul 2023 12:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG2QJa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jul 2023 12:09:30 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C6DA8;
        Sat, 29 Jul 2023 09:09:28 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b974031aeaso46606431fa.0;
        Sat, 29 Jul 2023 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690646967; x=1691251767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbEEA9qXyvX3XujqVFRIZGMjgglFAqEEswNtYLrXuTo=;
        b=nIzeeEyyT1FdwntjJwtwHUHRdvpfgn78lYesfZjg2d9iwVG7DOhuDHyfCfqjH5NjcE
         7nhCJC6Ame7FMZUStq2nutjMT2v4Uhpm4ZNwwUvZJIrZXtmvrGC7ovyW72ZV2wXo3oPt
         GEkrWcgRf9vm+dRXaxBdOzyv9BlzI+im/NK1Ingfu7viB1VOphgAxsDNHMoVG3bXu0z/
         1YcSp+v+15rQhOur57TyHa/HiQAhNKZvFpIeyar6nsX9Iaaq1pF6iun/ElGhtOiIODVR
         fVOqWQr6yLEj6CC3M827gOSLOOC6L1a/b8Rr1saKwInysL/Zyo5IQjs3d8tHwKPkVFsk
         C0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690646967; x=1691251767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbEEA9qXyvX3XujqVFRIZGMjgglFAqEEswNtYLrXuTo=;
        b=BkARENSbMSk/Tq2nh7Trpso10lGWvI7FKIBiEN4f7scJw3DF3rq1OuO7EWOS3WGROt
         YXkOuf/9+HxAnymeafpwNCYJKil2MBhYJyVZxH+RFV4wHz6pJDtWIMsDZmR74EtoaOL1
         HAtctpFvIuuN4KOgRrDknSUICWAQthUmh5bkmFcewtvMKjXuP0J/2jTD6AlkUKxzL2mm
         dS7s1ZFbCH3bdBFsByC7PpiFAmBhhsRDWeBd7QACPAzw8j0sBcQBi9ZoFl4I9xBsTlnH
         E9wYu7U6GkKZ2nLpWnsz7JlKJMhNZ+3ER42MuBjznkkfUr50RIn06+WKQ4aymmWqtcSh
         JDYg==
X-Gm-Message-State: ABy/qLZmZBbEoTny2el3pEb2bXWR0A+Hzub6xWMrtut9ZHWON50RuHk/
        2BdOaJp3czYLzJMVO4+bXV8=
X-Google-Smtp-Source: APBJJlHZcCpr61JKtjLJ57EQz6jhVLQTMItY5z+7/vtqG650jRabDW3OhmTdW/BZ0hpPNS7aTla+4w==
X-Received: by 2002:a2e:7c18:0:b0:2b6:e8a0:a7f8 with SMTP id x24-20020a2e7c18000000b002b6e8a0a7f8mr3739684ljc.31.1690646966493;
        Sat, 29 Jul 2023 09:09:26 -0700 (PDT)
Received: from xeon.. ([188.163.112.48])
        by smtp.gmail.com with ESMTPSA id f10-20020a2ea0ca000000b002b6daa3fa2csm1346886ljm.69.2023.07.29.09.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 09:09:26 -0700 (PDT)
From:   Svyatoslav Ryhel <clamor95@gmail.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
Date:   Sat, 29 Jul 2023 19:08:57 +0300
Message-Id: <20230729160857.6332-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729160857.6332-1-clamor95@gmail.com>
References: <20230729160857.6332-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Implement driver for hot-plugged I2C busses, where some devices on
a bus are hot-pluggable and their presence is indicated by GPIO line.

This feature is mainly used by the ASUS Transformers family. The
Transformers have a connector that's used for USB, charging or for
attaching a dock-keyboard (which also has a battery and a touchpad).
This connector probably (can't be verified since no datasheets or
special equipment is available) has an I2C bus lines and a "detect"
line (pulled low on the dock side) among the pins. I guess there
is either no additional chip or a transparent bridge/buffer chip,
but nothing that could be controlled by software. For DT this setup
could be modelled like an I2C gate or 2-port mux with enable joining
two I2C buses (one "closer" to the CPU as a parent).

Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/i2c/Kconfig            |  11 ++
 drivers/i2c/Makefile           |   1 +
 drivers/i2c/i2c-hotplug-gpio.c | 266 +++++++++++++++++++++++++++++++++
 3 files changed, 278 insertions(+)
 create mode 100644 drivers/i2c/i2c-hotplug-gpio.c

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 438905e2a1d0..3e3f7675ea4a 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -98,6 +98,17 @@ config I2C_SMBUS
 source "drivers/i2c/algos/Kconfig"
 source "drivers/i2c/busses/Kconfig"
 
+config I2C_HOTPLUG_GPIO
+	tristate "Hot-plugged I2C bus detected by GPIO"
+	depends on GPIOLIB
+	depends on OF
+	help
+	  If you say yes to this option, support will be included for
+	  hot-plugging I2C devices with presence detected by GPIO pin value.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-hotplug-gpio.
+
 config I2C_STUB
 	tristate "I2C/SMBus Test Stub"
 	depends on m
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index c1d493dc9bac..9fd44310835a 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
 obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
 obj-$(CONFIG_I2C_MUX)		+= i2c-mux.o
 obj-y				+= algos/ busses/ muxes/
+obj-$(CONFIG_I2C_HOTPLUG_GPIO)	+= i2c-hotplug-gpio.o
 obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
 obj-$(CONFIG_I2C_SLAVE_EEPROM)	+= i2c-slave-eeprom.o
 obj-$(CONFIG_I2C_SLAVE_TESTUNIT)	+= i2c-slave-testunit.o
diff --git a/drivers/i2c/i2c-hotplug-gpio.c b/drivers/i2c/i2c-hotplug-gpio.c
new file mode 100644
index 000000000000..18c2d7f44d29
--- /dev/null
+++ b/drivers/i2c/i2c-hotplug-gpio.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * I2C hotplug gate controlled by GPIO
+ */
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
+	struct i2c_adapter	 adap;
+	struct i2c_adapter	*parent;
+	struct device		*dev;
+	struct gpio_desc	*gpio;
+	int			 irq;
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
+	.lock_bus =    i2c_hotplug_lock_bus,
+	.trylock_bus = i2c_hotplug_trylock_bus,
+	.unlock_bus =  i2c_hotplug_unlock_bus,
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
+static void devm_i2c_put_adapter(void *adapter)
+{
+	i2c_put_adapter(adapter);
+}
+
+static int i2c_hotplug_gpio_probe(struct platform_device *pdev)
+{
+	struct device_node *parent_np;
+	struct i2c_adapter *parent;
+	struct i2c_hotplug_priv *priv;
+	bool is_i2c, is_smbus;
+	int ret;
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
+	ret = devm_add_action_or_reset(&pdev->dev, devm_i2c_put_adapter,
+				       parent);
+	if (ret)
+		return ret;
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
+		priv->adap.bus_recovery_info = &i2c_hotplug_recovery_info;
+
+	if (!priv->adap.algo)
+		return -EINVAL;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return dev_err_probe(&pdev->dev, priv->irq,
+				     "failed to get IRQ %d\n", priv->irq);
+
+	ret = devm_request_threaded_irq(&pdev->dev, priv->irq, NULL,
+					i2c_hotplug_interrupt,
+					IRQF_ONESHOT | IRQF_SHARED,
+					"i2c-hotplug", priv);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register IRQ %d\n", priv->irq);
+
+	irq_wake_thread(priv->irq, priv);
+
+	return 0;
+}
+
+static int i2c_hotplug_gpio_remove(struct platform_device *pdev)
+{
+	struct i2c_hotplug_priv *priv = platform_get_drvdata(pdev);
+
+	i2c_hotplug_deactivate(priv);
+
+	return 0;
+}
+
+static const struct of_device_id i2c_hotplug_gpio_of_match[] = {
+	{ .compatible = "i2c-hotplug-gpio" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, i2c_hotplug_gpio_of_match);
+
+static struct platform_driver i2c_hotplug_gpio_driver = {
+	.probe	= i2c_hotplug_gpio_probe,
+	.remove	= i2c_hotplug_gpio_remove,
+	.driver	= {
+		.name	= "i2c-hotplug-gpio",
+		.of_match_table = i2c_hotplug_gpio_of_match,
+	},
+};
+
+module_platform_driver(i2c_hotplug_gpio_driver);
+
+MODULE_DESCRIPTION("Hot-plugged I2C bus detected by GPIO");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_LICENSE("GPL");
-- 
2.39.2

