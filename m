Return-Path: <linux-i2c+bounces-9747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8FA550A8
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 17:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 614B63B2CD0
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 16:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D00221578;
	Thu,  6 Mar 2025 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mFi7ZcbM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ACC21ABC8;
	Thu,  6 Mar 2025 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278228; cv=none; b=eCYGlTaejwLx4tdmDDqdkV+NNFx+RGfPYNyrS6Fht6TNUkPjkjvNcTkcX44Bwu1apzQMY7aLSSlZsSZPvkJaIvAHBLV2qEVyqu1NbLNTSJ6XG5475fHtqF1IJ8ueRoWAYZLWxSwOoG4mkyiEF/b0wbWSGA94UC2A0SwoMl/lCYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278228; c=relaxed/simple;
	bh=YXsCDNdfwcTwfqTgDarAINIHtF+dO2Z99ZURrLrvNdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EIJGRCQhUi035MPgObvOi7YP0XLVi1An5FkDKsVQqPRZBICup//OM4IQy/S+p7BxgO0D3Ejy1wn+Sr6h51sJ2d5EyD3zx5hQ0ddEP+vna2CwhXNJFiAdL5WFF3a8iNIrTBQI/gLqQ2W0GWyGrOYKty1n9YUBv/EYRX4D1PW1KHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mFi7ZcbM; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A528B44409;
	Thu,  6 Mar 2025 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741278223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLgoYS62L+oNdp8H4TVlp1NHks1PEunaf/V3R1dml34=;
	b=mFi7ZcbMzkN1l2VacAqihbpleD0Sf5Tm6Y+5FdhoatF8WfdE5XNWWmqtig8b08zUdogh2U
	tJlauP6b7SS04bkBiRdyVRSpTms2swDjTnuW7PO8h62oHR4DO3/iMSRNycc1y1tNa47PYP
	FQm9q7cAEP+qyW4kG6ZBwdqFqQzVRg59EU5dHTlXowZr94LouTErzOKTlvmk8hpxD0L70W
	BYKL9fOJpmM6F9QqdDNoSDTJ/BZeZ8BQ5oJI6HrdZMOrlgkuD4/VJux+tAwVSnG/L/V4n/
	TL9v4MZpj/TFTgq7aEcyFMpknqtRFvylck9hlWWQBs9JocviRGc8KlafZm3kmg==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Thu, 06 Mar 2025 17:23:30 +0100
Subject: [PATCH v9 9/9] misc: add FPC202 dual port controller driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-fpc202-v9-9-2779af6780f6@bootlin.com>
References: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>
In-Reply-To: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Cosmin Tanislav <demonsingur@gmail.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekleeifeetleffueehvedtteekhfffhfetffekgfethfekveduuedtuefgffehgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddufegnpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmr
 ghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

The TI FPC202 dual port controller serves as a low-speed signal aggregator
for common port types such as SFP, QSFP, Mini-SAS HD, and others.

It aggregates GPIO and I2C signals across two downstream ports, acting as
both a GPIO controller and an I2C address translator for up to two logical
devices per port.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 MAINTAINERS              |   1 +
 drivers/misc/Kconfig     |  12 ++
 drivers/misc/Makefile    |   1 +
 drivers/misc/ti_fpc202.c | 438 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 452 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4bb13de2b8ebad5180e2bde607dac40f35c51782..7d2b08d0b0ad5390eb8528eb7ddc9da8b2729026 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23714,6 +23714,7 @@ M:	Romain Gantois <romain.gantois@bootlin.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/misc/ti,fpc202.yaml
+F:	drivers/misc/ti_fpc202.c
 
 TI FPD-LINK DRIVERS
 M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 56bc72c7ce4a998f6b9b3ed90a0845b52715f405..2822dd3e965e487072399930130b11055d8f7dda 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -114,6 +114,18 @@ config RPMB
 
 	  If unsure, select N.
 
+config TI_FPC202
+	tristate "TI FPC202 Dual Port Controller"
+	depends on I2C
+	select GPIOLIB
+	select I2C_ATR
+	help
+	  If you say yes here you get support for the Texas Instruments FPC202
+	  Dual Port Controller.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called fpc202.
+
 config TIFM_CORE
 	tristate "TI Flash Media interface support"
 	depends on PCI
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 545aad06d088563aaddf7d2f3b82d995e817fde0..2e27d4b7590313fab8da3dc311f492359ef44ee8 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_ATMEL_SSC)		+= atmel-ssc.o
 obj-$(CONFIG_DUMMY_IRQ)		+= dummy-irq.o
 obj-$(CONFIG_ICS932S401)	+= ics932s401.o
 obj-$(CONFIG_LKDTM)		+= lkdtm/
+obj-$(CONFIG_TI_FPC202)		+= ti_fpc202.o
 obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
 obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
 obj-$(CONFIG_PHANTOM)		+= phantom.o
diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
new file mode 100644
index 0000000000000000000000000000000000000000..b9c9ee4bfc4edba102b3bf7ae33a2b68c19c83ec
--- /dev/null
+++ b/drivers/misc/ti_fpc202.c
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ti_fpc202.c - FPC202 Dual Port Controller driver
+ *
+ * Copyright (C) 2024 Bootlin
+ *
+ */
+
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/i2c-atr.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+
+#define FPC202_NUM_PORTS 2
+#define FPC202_ALIASES_PER_PORT 2
+
+/*
+ * GPIO: port mapping
+ *
+ * 0: P0_S0_IN_A
+ * 1: P0_S1_IN_A
+ * 2: P1_S0_IN_A
+ * 3: P1_S1_IN_A
+ * 4: P0_S0_IN_B
+ * ...
+ * 8: P0_S0_IN_C
+ * ...
+ * 12: P0_S0_OUT_A
+ * ...
+ * 16: P0_S0_OUT_B
+ * ...
+ * 19: P1_S1_OUT_B
+ *
+ */
+
+#define FPC202_GPIO_COUNT 20
+#define FPC202_GPIO_P0_S0_IN_B  4
+#define FPC202_GPIO_P0_S0_OUT_A 12
+
+#define FPC202_REG_IN_A_INT    0x6
+#define FPC202_REG_IN_C_IN_B   0x7
+#define FPC202_REG_OUT_A_OUT_B 0x8
+
+#define FPC202_REG_OUT_A_OUT_B_VAL 0xa
+
+#define FPC202_REG_MOD_DEV(port, dev) (0xb4 + ((port) * 4) + (dev))
+#define FPC202_REG_AUX_DEV(port, dev) (0xb6 + ((port) * 4) + (dev))
+
+/*
+ * The FPC202 doesn't support turning off address translation on a single port.
+ * So just set an invalid I2C address as the translation target when no client
+ * address is attached.
+ */
+#define FPC202_REG_DEV_INVALID 0
+
+/* Even aliases are assigned to device 0 and odd aliases to device 1 */
+#define fpc202_dev_num_from_alias(alias) ((alias) % 2)
+
+struct fpc202_priv {
+	struct i2c_client *client;
+	struct i2c_atr *atr;
+	struct gpio_desc *en_gpio;
+	struct gpio_chip gpio;
+
+	/* Lock REG_MOD/AUX_DEV and addr_caches during attach/detach */
+	struct mutex reg_dev_lock;
+
+	/* Cached device addresses for both ports and their devices */
+	u8 addr_caches[2][2];
+
+	/* Keep track of which ports were probed */
+	DECLARE_BITMAP(probed_ports, FPC202_NUM_PORTS);
+};
+
+static void fpc202_fill_alias_table(struct i2c_client *client, u16 *aliases, int port_id)
+{
+	u16 first_alias;
+	int i;
+
+	/*
+	 * There is a predefined list of aliases for each FPC202 I2C
+	 * self-address.  This allows daisy-chained FPC202 units to
+	 * automatically take on different sets of aliases.
+	 * Each port of an FPC202 unit is assigned two aliases from this list.
+	 */
+	first_alias = 0x10 + 4 * port_id + 8 * ((u16)client->addr - 2);
+
+	for (i = 0; i < FPC202_ALIASES_PER_PORT; i++)
+		aliases[i] = first_alias + i;
+}
+
+static int fpc202_gpio_get_dir(int offset)
+{
+	return offset < FPC202_GPIO_P0_S0_OUT_A ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+}
+
+static int fpc202_read(struct fpc202_priv *priv, u8 reg)
+{
+	int val;
+
+	val = i2c_smbus_read_byte_data(priv->client, reg);
+	return val;
+}
+
+static int fpc202_write(struct fpc202_priv *priv, u8 reg, u8 value)
+{
+	return i2c_smbus_write_byte_data(priv->client, reg, value);
+}
+
+static void fpc202_set_enable(struct fpc202_priv *priv, int enable)
+{
+	if (!priv->en_gpio)
+		return;
+
+	gpiod_set_value(priv->en_gpio, enable);
+}
+
+static void fpc202_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
+{
+	struct fpc202_priv *priv = gpiochip_get_data(chip);
+	int ret;
+	u8 val;
+
+	if (fpc202_gpio_get_dir(offset) == GPIO_LINE_DIRECTION_IN)
+		return;
+
+	ret = fpc202_read(priv, FPC202_REG_OUT_A_OUT_B_VAL);
+	if (ret < 0) {
+		dev_err(&priv->client->dev, "Failed to set GPIO %d value! err %d\n", offset, ret);
+		return;
+	}
+
+	val = (u8)ret;
+
+	if (value)
+		val |= BIT(offset - FPC202_GPIO_P0_S0_OUT_A);
+	else
+		val &= ~BIT(offset - FPC202_GPIO_P0_S0_OUT_A);
+
+	fpc202_write(priv, FPC202_REG_OUT_A_OUT_B_VAL, val);
+}
+
+static int fpc202_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct fpc202_priv *priv = gpiochip_get_data(chip);
+	u8 reg, bit;
+	int ret;
+
+	if (offset < FPC202_GPIO_P0_S0_IN_B) {
+		reg = FPC202_REG_IN_A_INT;
+		bit = BIT(4 + offset);
+	} else if (offset < FPC202_GPIO_P0_S0_OUT_A) {
+		reg = FPC202_REG_IN_C_IN_B;
+		bit = BIT(offset - FPC202_GPIO_P0_S0_IN_B);
+	} else {
+		reg = FPC202_REG_OUT_A_OUT_B_VAL;
+		bit = BIT(offset - FPC202_GPIO_P0_S0_OUT_A);
+	}
+
+	ret = fpc202_read(priv, reg);
+	if (ret < 0)
+		return ret;
+
+	return !!(((u8)ret) & bit);
+}
+
+static int fpc202_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	if (fpc202_gpio_get_dir(offset) == GPIO_LINE_DIRECTION_OUT)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int fpc202_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
+					int value)
+{
+	struct fpc202_priv *priv = gpiochip_get_data(chip);
+	int ret;
+	u8 val;
+
+	if (fpc202_gpio_get_dir(offset) == GPIO_LINE_DIRECTION_IN)
+		return -EINVAL;
+
+	fpc202_gpio_set(chip, offset, value);
+
+	ret = fpc202_read(priv, FPC202_REG_OUT_A_OUT_B);
+	if (ret < 0)
+		return ret;
+
+	val = (u8)ret | BIT(offset - FPC202_GPIO_P0_S0_OUT_A);
+
+	return fpc202_write(priv, FPC202_REG_OUT_A_OUT_B, val);
+}
+
+/*
+ * Set the translation table entry associated with a port and device number.
+ *
+ * Each downstream port of the FPC202 has two fixed aliases corresponding to
+ * device numbers 0 and 1. If one of these aliases is found in an incoming I2C
+ * transfer, it will be translated to the address given by the corresponding
+ * translation table entry.
+ */
+static int fpc202_write_dev_addr(struct fpc202_priv *priv, u32 port_id, int dev_num, u16 addr)
+{
+	int ret, reg_mod, reg_aux;
+	u8 val;
+
+	guard(mutex)(&priv->reg_dev_lock);
+
+	reg_mod = FPC202_REG_MOD_DEV(port_id, dev_num);
+	reg_aux = FPC202_REG_AUX_DEV(port_id, dev_num);
+	val = addr & 0x7f;
+
+	ret = fpc202_write(priv, reg_mod, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * The FPC202 datasheet is unclear about the role of the AUX registers.
+	 * Empirically, writing to them as well seems to be necessary for
+	 * address translation to function properly.
+	 */
+	ret = fpc202_write(priv, reg_aux, val);
+
+	priv->addr_caches[port_id][dev_num] = val;
+
+	return ret;
+}
+
+static int fpc202_attach_addr(struct i2c_atr *atr, u32 chan_id,
+			      u16 addr, u16 alias)
+{
+	struct fpc202_priv *priv = i2c_atr_get_driver_data(atr);
+
+	dev_dbg(&priv->client->dev, "attaching address 0x%02x to alias 0x%02x\n", addr, alias);
+
+	return fpc202_write_dev_addr(priv, chan_id, fpc202_dev_num_from_alias(alias), addr);
+}
+
+static void fpc202_detach_addr(struct i2c_atr *atr, u32 chan_id,
+			       u16 addr)
+{
+	struct fpc202_priv *priv = i2c_atr_get_driver_data(atr);
+	int dev_num, reg_mod, val;
+
+	for (dev_num = 0; dev_num < 2; dev_num++) {
+		reg_mod = FPC202_REG_MOD_DEV(chan_id, dev_num);
+
+		mutex_lock(&priv->reg_dev_lock);
+
+		val = priv->addr_caches[chan_id][dev_num];
+
+		mutex_unlock(&priv->reg_dev_lock);
+
+		if (val < 0) {
+			dev_err(&priv->client->dev, "failed to read register 0x%x while detaching address 0x%02x\n",
+				reg_mod, addr);
+			return;
+		}
+
+		if (val == (addr & 0x7f)) {
+			fpc202_write_dev_addr(priv, chan_id, dev_num, FPC202_REG_DEV_INVALID);
+			return;
+		}
+	}
+}
+
+static const struct i2c_atr_ops fpc202_atr_ops = {
+	.attach_addr = fpc202_attach_addr,
+	.detach_addr = fpc202_detach_addr,
+};
+
+static int fpc202_probe_port(struct fpc202_priv *priv, struct device_node *i2c_handle, int port_id)
+{
+	u16 aliases[FPC202_ALIASES_PER_PORT] = { };
+	struct device *dev = &priv->client->dev;
+	struct i2c_atr_adap_desc desc = { };
+	int ret = 0;
+
+	desc.chan_id = port_id;
+	desc.parent = dev;
+	desc.bus_handle = of_node_to_fwnode(i2c_handle);
+	desc.num_aliases = FPC202_ALIASES_PER_PORT;
+
+	fpc202_fill_alias_table(priv->client, aliases, port_id);
+	desc.aliases = aliases;
+
+	ret = i2c_atr_add_adapter(priv->atr, &desc);
+	if (ret)
+		return ret;
+
+	set_bit(port_id, priv->probed_ports);
+
+	ret = fpc202_write_dev_addr(priv, port_id, 0, FPC202_REG_DEV_INVALID);
+	if (ret)
+		return ret;
+
+	return fpc202_write_dev_addr(priv, port_id, 1, FPC202_REG_DEV_INVALID);
+}
+
+static void fpc202_remove_port(struct fpc202_priv *priv, int port_id)
+{
+	i2c_atr_del_adapter(priv->atr, port_id);
+	clear_bit(port_id, priv->probed_ports);
+}
+
+static int fpc202_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device_node *i2c_handle;
+	struct fpc202_priv *priv;
+	int ret, port_id;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->reg_dev_lock);
+
+	priv->client = client;
+	i2c_set_clientdata(client, priv);
+
+	priv->en_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->en_gpio)) {
+		ret = PTR_ERR(priv->en_gpio);
+		dev_err(dev, "failed to fetch enable GPIO! err %d\n", ret);
+		goto destroy_mutex;
+	}
+
+	priv->gpio.label = "gpio-fpc202";
+	priv->gpio.base = -1;
+	priv->gpio.direction_input = fpc202_gpio_direction_input;
+	priv->gpio.direction_output = fpc202_gpio_direction_output;
+	priv->gpio.set = fpc202_gpio_set;
+	priv->gpio.get = fpc202_gpio_get;
+	priv->gpio.ngpio = FPC202_GPIO_COUNT;
+	priv->gpio.parent = dev;
+	priv->gpio.owner = THIS_MODULE;
+
+	ret = gpiochip_add_data(&priv->gpio, priv);
+	if (ret) {
+		priv->gpio.parent = NULL;
+		dev_err(dev, "failed to add gpiochip err %d\n", ret);
+		goto disable_gpio;
+	}
+
+	priv->atr = i2c_atr_new(client->adapter, dev, &fpc202_atr_ops, 2);
+	if (IS_ERR(priv->atr)) {
+		ret = PTR_ERR(priv->atr);
+		dev_err(dev, "failed to create i2c atr err %d\n", ret);
+		goto disable_gpio;
+	}
+
+	i2c_atr_set_driver_data(priv->atr, priv);
+
+	bitmap_zero(priv->probed_ports, FPC202_NUM_PORTS);
+
+	for_each_child_of_node(dev->of_node, i2c_handle) {
+		ret = of_property_read_u32(i2c_handle, "reg", &port_id);
+		if (ret) {
+			if (ret == -EINVAL)
+				continue;
+
+			dev_err(dev, "failed to read 'reg' property of child node, err %d\n", ret);
+			goto unregister_chans;
+		}
+
+		if (port_id > FPC202_NUM_PORTS) {
+			dev_err(dev, "port ID %d is out of range!\n", port_id);
+			ret = -EINVAL;
+			goto unregister_chans;
+		}
+
+		ret = fpc202_probe_port(priv, i2c_handle, port_id);
+		if (ret) {
+			dev_err(dev, "Failed to probe port %d, err %d\n", port_id, ret);
+			goto unregister_chans;
+		}
+	}
+
+	goto out;
+
+unregister_chans:
+	for_each_set_bit(port_id, priv->probed_ports, FPC202_NUM_PORTS)
+		fpc202_remove_port(priv, port_id);
+
+	i2c_atr_delete(priv->atr);
+disable_gpio:
+	fpc202_set_enable(priv, 0);
+	gpiochip_remove(&priv->gpio);
+destroy_mutex:
+	mutex_destroy(&priv->reg_dev_lock);
+out:
+	return ret;
+}
+
+static void fpc202_remove(struct i2c_client *client)
+{
+	struct fpc202_priv *priv = i2c_get_clientdata(client);
+	int port_id;
+
+	for_each_set_bit(port_id, priv->probed_ports, FPC202_NUM_PORTS)
+		fpc202_remove_port(priv, port_id);
+
+	mutex_destroy(&priv->reg_dev_lock);
+
+	i2c_atr_delete(priv->atr);
+
+	fpc202_set_enable(priv, 0);
+	gpiochip_remove(&priv->gpio);
+}
+
+static const struct of_device_id fpc202_of_match[] = {
+	{ .compatible = "ti,fpc202" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, fpc202_of_match);
+
+static struct i2c_driver fpc202_driver = {
+	.driver = {
+		.name = "fpc202",
+		.of_match_table = fpc202_of_match,
+	},
+	.probe = fpc202_probe,
+	.remove = fpc202_remove,
+};
+
+module_i2c_driver(fpc202_driver);
+
+MODULE_AUTHOR("Romain Gantois <romain.gantois@bootlin.com>");
+MODULE_DESCRIPTION("TI FPC202 Dual Port Controller driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("I2C_ATR");

-- 
2.48.1


