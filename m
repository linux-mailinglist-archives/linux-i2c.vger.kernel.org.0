Return-Path: <linux-i2c+bounces-9155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B528A1A076
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2025 10:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45788188DE59
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2025 09:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFE220DD65;
	Thu, 23 Jan 2025 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNhlNwf2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FB820DD50;
	Thu, 23 Jan 2025 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737623514; cv=none; b=hzKw4ZGvZTdI+Cn8YZ7OinNaPtBhh0Ku4Ue2DQ7G2m1R7HbUBdCF6BgcYgfc+w75C1Fmh2oWbJSV1jmnFmqdlnuYhdjgZlf78VaRGn/rUbQeGzxj9vHEhB11y0QsagBgH+3wLRDWUkTPYOy/z6bralJvzuSG/soqj30MtujxXDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737623514; c=relaxed/simple;
	bh=LhJMaL4qpnxeMnZzDgOjvNeFMdmomJaYMIOuShYURt0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B0scZWXeThFV+d2/iokxAUQyLX8zhyzjlnH+Em3lvKrRxBlqJuE3s7f224S1dVsIlCvFOiMiGvYjzQlJtTtKOEolbq5VpvSntZVH+Oh0Z2BAgI5mw5BIQNv4k1T89r2TgeF8gr97EYZ+dDoGC6il3atPbo0Ocef3s0wSLDn2BJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNhlNwf2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21634338cfdso13639895ad.2;
        Thu, 23 Jan 2025 01:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737623511; x=1738228311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMl+b3PdsBCdO9/Oro0CyTWPZT4KT4o8lnQeKc81y0A=;
        b=RNhlNwf2fpKumceuvP6cn7rgPhGjJg/cRzsT1jPUhwuYiDZRq1nYwOFgSnCCoaLsmz
         lGVT8K4K0LrX6xdYYZ4g2OMxcNN1xe3Vdd6788GeOpiH45A11CKK3POZo86m1wPJ+edd
         Vp7+VDurhi6FX3QG+RhM21vHiaVOuY22muT7RLcF/xz3ynljpfF2ax0lmp2fDv9wDEhp
         Ib+OGjrf7okX/aMcgUhTPucXvbLgGNot1mDTJYgQRRW5NYREw5vHNi+zGpUYh2nlsQT5
         CwpQyVi4iGccHeykWGF0ADx2w98xV3CzJPrNO45hfShzVI5jb+G4iCD+tpZN8VNUXzo6
         JJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623511; x=1738228311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMl+b3PdsBCdO9/Oro0CyTWPZT4KT4o8lnQeKc81y0A=;
        b=AIBKqiq2d7v4cARkB/OEG4U1MS2p8tJHW+xvVOJNWT6e3B65GgsSIkDNqHp1zHuPp6
         DSJ3xIE8idiMgCdd8wJXnEWoad7Vr3AVuUXojSzmulxgSe+icr/rhzkHndiCtXjYQ7If
         o1ze3nLGQYIDIw4iwncV+MLQ97Y6mWsoCsM49yyWitCexQM3+mCPWSjakxHsExpqoUFK
         kuI/7tmoMiBGOMrwNQqbbQqTcQzXmrrv6HD0XTzf1v6A16jUp4JcSiQ3SrFwBTw+jB2G
         5223UUldUqgH9KNha0mrsF4up/P+htnfDbWgugsIjiLErEYuopEyuzmf97rmih56VCXQ
         vJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJTdw9zim6Tw/ckLNrY11gr7FYvM8wzUUuVMDrIP+W2n9VnMyHidnM40tnGUXe0oBcc53GrwlTx+ukemu9Cg4=@vger.kernel.org, AJvYcCUVMpWqBgJHg84IdySz+xpc5UGVYpo1N0Y2fK0/TFsNdROSgwnBC7lBqC70wZ8mM/CQACpN0WhEZqgX@vger.kernel.org, AJvYcCV1ej0des3bVNg5l4Fpq5ZRlNwoJRjYf8n+DaP2lO/w1BeNg0zjn+qsR3rWM9g1gKxNQt9N5pZ5qmYj@vger.kernel.org, AJvYcCWQ23xJQbp36HAbGYpPe3xNeseyqnEPWHDH/vgTnyTRCFYywvhCPNKFqm/lnCHPkUUeEye+sXddUJI=@vger.kernel.org, AJvYcCWZ1fKUSiJ4VaTKR+8oeCmzeBR5vud8/ZPwHgAndqRry68XXk5FzhSMwlRRkxFqa6OAWnQyuT+jn0VNXa4=@vger.kernel.org, AJvYcCWoCN23UeYlmoWjse9L6bOdyn+lLHfg0eOhGFrnr0uOBmrqF6SHmyotj0nzqMxo4+jQCKep/Cy5@vger.kernel.org, AJvYcCWwVjFjhBeZ3kuQJTs9TFHxKWK2N+aN0lHKkKmtv5eR7+9bU17fD5Sv7WnITX7UCgjp3KWddS2si6w3EQ==@vger.kernel.org, AJvYcCXBN/1roANi8SLkWA+3P1iYlfh7UBEv/LcKIVgKYDtLNU/51S0oXDjdr+p5riYiSI62wRRhJwXy9eVT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi7BQhWPVbptF5zFeVS6boIZmTaWpZChepGTq5/3wiYAKOzqHY
	gLJCCjC9PVhHOlfFSFjRXsQlnLsLAtlLbmu+8KwOocAGT8WUbUSP
X-Gm-Gg: ASbGnctBCKSCHxi0PzIgoFxkJYslzNTVYYtuIZJmLKF98CygY30Q5ROvVl1KgbAxFKh
	h+rdWIjFBmb0JrWNwjRejZjBW7PP8NVMBwMJz/SLEj6SDMLVzbATQaTgM1TqvD3mzONxbccRGIA
	xoxHT4sMS4xqhme7HDgNovi9bY7wxZ0mUgEzWKgOHvGNpxJaVzG3r3tQ9AIoHKxY7c/OhUUcfhy
	Vs2cj0Y6bzZRcy+cf8HiKpLeR6L1eAqgU0XG7fdaRxr1HHwKITRcDmg6UjPa/lgNwN6WoOiwXbD
	ggCpmDhzk4z8nGvkmz9+zQ8jQRlOL9JKevjdCznhushJgJkx
X-Google-Smtp-Source: AGHT+IHpyrG21lzXMKi528miecnbys7zzRjkQVvFL+IKTQFpum8FRo2gbDY+OjgVSd1bMLcaGygHyA==
X-Received: by 2002:a17:902:e84e:b0:216:6901:6847 with SMTP id d9443c01a7336-21c3563c777mr347884785ad.42.1737623511396;
        Thu, 23 Jan 2025 01:11:51 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb735esm109365365ad.64.2025.01.23.01.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 01:11:51 -0800 (PST)
From: Ming Yu <a0282524688@gmail.com>
To: tmyu0@nuvoton.com,
	lee@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andi.shyti@kernel.org,
	mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 2/7] gpio: Add Nuvoton NCT6694 GPIO support
Date: Thu, 23 Jan 2025 17:11:10 +0800
Message-Id: <20250123091115.2079802-3-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123091115.2079802-1-a0282524688@gmail.com>
References: <20250123091115.2079802-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver supports GPIO and IRQ functionality for NCT6694 MFD
device based on USB interface.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 MAINTAINERS                 |   1 +
 drivers/gpio/Kconfig        |  12 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-nct6694.c | 457 ++++++++++++++++++++++++++++++++++++
 4 files changed, 471 insertions(+)
 create mode 100644 drivers/gpio/gpio-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a008f6506e82..d4f87e8c71c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16805,6 +16805,7 @@ NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index add5ad29a673..9396de3ea86d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1461,6 +1461,18 @@ config GPIO_MAX77650
 	  GPIO driver for MAX77650/77651 PMIC from Maxim Semiconductor.
 	  These chips have a single pin that can be configured as GPIO.
 
+config GPIO_NCT6694
+	tristate "Nuvoton NCT6694 GPIO controller support"
+	depends on MFD_NCT6694
+	select GENERIC_IRQ_CHIP
+	select GPIOLIB_IRQCHIP
+	help
+	  This driver supports 8 GPIO pins per bank that can all be interrupt
+	  sources.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called gpio-nct6694.
+
 config GPIO_PALMAS
 	bool "TI PALMAS series PMICs GPIO"
 	depends on MFD_PALMAS
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index af3ba4d81b58..def8487540ab 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -121,6 +121,7 @@ obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
+obj-$(CONFIG_GPIO_NCT6694)		+= gpio-nct6694.o
 obj-$(CONFIG_GPIO_NOMADIK)		+= gpio-nomadik.o
 obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
new file mode 100644
index 000000000000..95c80b09d55e
--- /dev/null
+++ b/drivers/gpio/gpio-nct6694.c
@@ -0,0 +1,457 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 GPIO controller driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/bits.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+/*
+ * USB command module type for NCT6694 GPIO controller.
+ * This defines the module type used for communication with the NCT6694
+ * GPIO controller over the USB interface.
+ */
+#define NCT6694_GPIO_MOD	0xFF
+
+#define NCT6694_GPIO_VER	0x90
+#define NCT6694_GPIO_VALID	0x110
+#define NCT6694_GPI_DATA	0x120
+#define NCT6694_GPO_DIR		0x170
+#define NCT6694_GPO_TYPE	0x180
+#define NCT6694_GPO_DATA	0x190
+
+#define NCT6694_GPI_STS		0x130
+#define NCT6694_GPI_CLR		0x140
+#define NCT6694_GPI_FALLING	0x150
+#define NCT6694_GPI_RISING	0x160
+
+#define NCT6694_NR_GPIO		8
+
+struct nct6694_gpio_data {
+	struct nct6694 *nct6694;
+	struct gpio_chip gpio;
+	/* Mutex to synchronize access to private data */
+	struct mutex lock;
+	/* Mutex to protect IRQ access */
+	struct mutex irq_lock;
+	unsigned char reg_val;
+	unsigned char irq_trig_falling;
+	unsigned char irq_trig_rising;
+	/* Current gpio group */
+	unsigned char group;
+};
+
+static int nct6694_get_direction(struct gpio_chip *gpio, unsigned int offset)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPO_DIR + data->group),
+		.len = cpu_to_le16(sizeof(data->reg_val))
+	};
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	return !(BIT(offset) & data->reg_val);
+}
+
+static int nct6694_direction_input(struct gpio_chip *gpio, unsigned int offset)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPO_DIR + data->group),
+		.len = cpu_to_le16(sizeof(data->reg_val))
+	};
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	data->reg_val &= ~BIT(offset);
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
+}
+
+static int nct6694_direction_output(struct gpio_chip *gpio,
+				    unsigned int offset, int val)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPO_DIR + data->group),
+		.len = cpu_to_le16(sizeof(data->reg_val))
+	};
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	/* Set direction to output */
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	data->reg_val |= BIT(offset);
+	ret = nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	/* Then set output level */
+	cmd_hd.offset = cpu_to_le16(NCT6694_GPO_DATA + data->group);
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	if (val)
+		data->reg_val |= BIT(offset);
+	else
+		data->reg_val &= ~BIT(offset);
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
+}
+
+static int nct6694_get_value(struct gpio_chip *gpio, unsigned int offset)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPO_DIR + data->group),
+		.len = cpu_to_le16(sizeof(data->reg_val))
+	};
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	if (BIT(offset) & data->reg_val) {
+		cmd_hd.offset = cpu_to_le16(NCT6694_GPO_DATA + data->group);
+		ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+		if (ret < 0)
+			return ret;
+
+		return !!(BIT(offset) & data->reg_val);
+	}
+
+	cmd_hd.offset = cpu_to_le16(NCT6694_GPI_DATA + data->group);
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	return !!(BIT(offset) & data->reg_val);
+}
+
+static void nct6694_set_value(struct gpio_chip *gpio, unsigned int offset,
+			      int val)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPO_DATA + data->group),
+		.len = cpu_to_le16(sizeof(data->reg_val))
+	};
+
+	guard(mutex)(&data->lock);
+
+	nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+
+	if (val)
+		data->reg_val |= BIT(offset);
+	else
+		data->reg_val &= ~BIT(offset);
+
+	nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
+}
+
+static int nct6694_set_config(struct gpio_chip *gpio, unsigned int offset,
+			      unsigned long config)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPO_TYPE + data->group),
+		.len = cpu_to_le16(sizeof(data->reg_val))
+	};
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		data->reg_val |= BIT(offset);
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		data->reg_val &= ~BIT(offset);
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
+}
+
+static int nct6694_init_valid_mask(struct gpio_chip *gpio,
+				   unsigned long *valid_mask,
+				   unsigned int ngpios)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPIO_VALID + data->group),
+		.len = cpu_to_le16(sizeof(data->reg_val))
+	};
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	*valid_mask = data->reg_val;
+
+	return ret;
+}
+
+static irqreturn_t nct6694_irq_handler(int irq, void *priv)
+{
+	struct nct6694_gpio_data *data = priv;
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPI_STS + data->group),
+		.len = cpu_to_le16(sizeof(data->reg_val))
+	};
+	unsigned char status;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	if (ret)
+		return IRQ_NONE;
+
+	status = data->reg_val;
+
+	while (status) {
+		int bit = __ffs(status);
+
+		data->reg_val = BIT(bit);
+		handle_nested_irq(irq_find_mapping(data->gpio.irq.domain, bit));
+		status &= ~BIT(bit);
+		cmd_hd.offset = cpu_to_le16(NCT6694_GPI_CLR + data->group);
+		nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int nct6694_get_irq_trig(struct nct6694_gpio_data *data)
+{
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPI_FALLING + data->group),
+		.len = cpu_to_le16(sizeof(data->reg_val))
+	};
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, &data->irq_trig_falling);
+	if (ret)
+		return ret;
+
+	cmd_hd.offset = cpu_to_le16(NCT6694_GPI_RISING + data->group);
+	return nct6694_read_msg(data->nct6694, &cmd_hd, &data->irq_trig_rising);
+}
+
+static void nct6694_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gpio = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	gpiochip_disable_irq(gpio, hwirq);
+}
+
+static void nct6694_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gpio = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	gpiochip_enable_irq(gpio, hwirq);
+}
+
+static int nct6694_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gpio = irq_data_get_irq_chip_data(d);
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	guard(mutex)(&data->lock);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		data->irq_trig_rising |= BIT(hwirq);
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		data->irq_trig_falling |= BIT(hwirq);
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		data->irq_trig_rising |= BIT(hwirq);
+		data->irq_trig_falling |= BIT(hwirq);
+		break;
+
+	default:
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static void nct6694_irq_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gpio = irq_data_get_irq_chip_data(d);
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+
+	mutex_lock(&data->irq_lock);
+}
+
+static void nct6694_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gpio = irq_data_get_irq_chip_data(d);
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPI_FALLING + data->group),
+		.len = cpu_to_le16(sizeof(data->reg_val))
+	};
+
+	scoped_guard(mutex, &data->lock) {
+		nct6694_write_msg(data->nct6694, &cmd_hd, &data->irq_trig_falling);
+
+		cmd_hd.offset = cpu_to_le16(NCT6694_GPI_RISING + data->group);
+		nct6694_write_msg(data->nct6694, &cmd_hd, &data->irq_trig_rising);
+	}
+
+	mutex_unlock(&data->irq_lock);
+}
+
+static const struct irq_chip nct6694_irq_chip = {
+	.name			= "gpio-nct6694",
+	.irq_mask		= nct6694_irq_mask,
+	.irq_unmask		= nct6694_irq_unmask,
+	.irq_set_type		= nct6694_irq_set_type,
+	.irq_bus_lock		= nct6694_irq_bus_lock,
+	.irq_bus_sync_unlock	= nct6694_irq_bus_sync_unlock,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int nct6694_gpio_probe(struct platform_device *pdev)
+{
+	const struct mfd_cell *cell = mfd_get_cell(pdev);
+	struct device *dev = &pdev->dev;
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	struct nct6694_gpio_data *data;
+	struct gpio_irq_chip *girq;
+	int ret, irq, i;
+	char **names;
+
+	irq = irq_create_mapping(nct6694->domain,
+				 NCT6694_IRQ_GPIO0 + cell->id);
+	if (!irq)
+		return -EINVAL;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	names = devm_kcalloc(dev, NCT6694_NR_GPIO, sizeof(char *),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < NCT6694_NR_GPIO; i++) {
+		names[i] = devm_kasprintf(dev, GFP_KERNEL, "GPIO%X%d",
+					  cell->id, i);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	data->nct6694 = nct6694;
+	data->group = cell->id;
+
+	data->gpio.names		= (const char * const*)names;
+	data->gpio.label		= pdev->name;
+	data->gpio.direction_input	= nct6694_direction_input;
+	data->gpio.get			= nct6694_get_value;
+	data->gpio.direction_output	= nct6694_direction_output;
+	data->gpio.set			= nct6694_set_value;
+	data->gpio.get_direction	= nct6694_get_direction;
+	data->gpio.set_config		= nct6694_set_config;
+	data->gpio.init_valid_mask	= nct6694_init_valid_mask;
+	data->gpio.base			= -1;
+	data->gpio.can_sleep		= false;
+	data->gpio.owner		= THIS_MODULE;
+	data->gpio.ngpio		= NCT6694_NR_GPIO;
+
+	devm_mutex_init(dev, &data->lock);
+	devm_mutex_init(dev, &data->irq_lock);
+
+	ret = nct6694_get_irq_trig(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get irq trigger type\n");
+
+	girq = &data->gpio.irq;
+	gpio_irq_chip_set_chip(girq, &nct6694_irq_chip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	girq->threaded = true;
+
+	ret = devm_request_threaded_irq(dev, irq, NULL, nct6694_irq_handler,
+					IRQF_ONESHOT | IRQF_SHARED,
+					"gpio-nct6694", data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request irq\n");
+
+	return devm_gpiochip_add_data(dev, &data->gpio, data);
+}
+
+static struct platform_driver nct6694_gpio_driver = {
+	.driver = {
+		.name	= "gpio-nct6694",
+	},
+	.probe		= nct6694_gpio_probe,
+};
+
+module_platform_driver(nct6694_gpio_driver);
+
+MODULE_DESCRIPTION("USB-GPIO controller driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:nct6694-gpio");
-- 
2.34.1


