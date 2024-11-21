Return-Path: <linux-i2c+bounces-8104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 851679D47BF
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 07:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D5B2282B1B
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 06:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93611CB32C;
	Thu, 21 Nov 2024 06:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkGzph0n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B061CB306;
	Thu, 21 Nov 2024 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171272; cv=none; b=r3WweFYhxOXDh7cmi3/N6z6amlShW18FIZekorDAEggfVWSYl7YGJurDrMY1T0XUh/M7R7yN0jCljqRFYReS4Vy2/Zf1sJ0XdeM0t73y5V0RX5sXAyBwBVkU5NiRo0T1YllQmAgPvo1oqzmWf6fmCnrHEutJbjfd1PrdSKe5iqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171272; c=relaxed/simple;
	bh=K7S8SXf3E31TM1mBHOTndKgVL+cg8ph+SloNbaVP4Dk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EoD4LYcKUzbsQ8fvYaSat/oCe1hRThM4/pDNpS2+bt+eCfH+hPvCFTglrtFQ5yNPIIPEruSgMNXGJKTiVnXmfhuCABDxO6vIB8oNgYezq2LKQp/amYoy2us/yy8rojMmNYX98Q/W9xpo99LAYL4J2tzFUY1uxPSfIQMzoFyfrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkGzph0n; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7edb6879196so479756a12.3;
        Wed, 20 Nov 2024 22:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732171270; x=1732776070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWTz/CCxD6wE1B6xtr3ZE+FE9Zph7go2Puk8PDECfpk=;
        b=lkGzph0nykF9LrpX38cSHsesdQUqv2dvHDfDonXByPz+dpSNEPw7Ff8NLgfw2Oj/Sr
         98REFiVxGrWAzGuI6ZEsFzJ3mJB46jRe6w/BQOVTZn6+VvxXHyL4/40Z7YBLAXcCPh1M
         VXltl3l2gwqJZFy9CxC7m1ZqWVn3RqggZSVFak8k9jLGZs5qFkrneRgDJnVi7kvoeA5q
         lec/m5XknGP5n6kpKU5jibV20m8s3D51aCEMUN9Td19KsDhth3IPk5g7YIWBq+gIEP/k
         fiQ8qAKQZ6g787gOok2eR+AA8/hZEF1T1MFwy+jtZNK+NnYNVxHHJh5ae7KPpFRLZ69K
         nx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732171270; x=1732776070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWTz/CCxD6wE1B6xtr3ZE+FE9Zph7go2Puk8PDECfpk=;
        b=BjKxMk2Bqk8LGPpg8u58uCrkEzHGZsz7T+2Cd7kLEB1Xw++kH/TbGjevQf85UnhK/7
         Wr+cdYy1CvA7xA8b48GNWMCNQ78hacjQinBCjBHss6GT/g+IcNW8jQ2Sqo6ssG8xstmg
         hkOKsLImxvmIFf0xFVPwOzyghVK/+Zh3uL7F6rphv4Z0+ejNmAyNTwktiGxe1bzveF7B
         LyvMkg08obWhgQ+yKRikKroDqZ+dqwH191XYfw/e3ObYEfdGm3xNpHeb/Qrqh6y6Ez9Y
         nA+Y9Ut9PE+ag4h7FrqZ54QmYyCouEV4ucZN6KIgo7jC4Cs9PzVXeOZTYmRFGVL1khW0
         Ubug==
X-Forwarded-Encrypted: i=1; AJvYcCUK9OSvppMALCyb5VNTMyhHVZfw0K/ll/us3hWIGmlbrvieFsx682jS4YxiY+NzTTxNZlCwfCEbIq5XTK4=@vger.kernel.org, AJvYcCUNO86xoLk+BmWnWC0EnjKRPDAN3LYiGr3iyX17XHMUCp54dmy2+7paVZ35RaHTHC4Q+7OHDAIcX5M=@vger.kernel.org, AJvYcCVZjfS6ZoPoosmw7GeBQvHX8L+yTbEA6ETelmwdKKIgSs9k5cMoIFvjdoTCSAKADcXRvbUe9z3r@vger.kernel.org, AJvYcCW8FmH4Dad9tXKWWgtjE7s+QnPvn9bBDWwkwRMDp/eM8cNjwrp7k29koMbBAIOmPnSN3hVS54RrufihWeHc/ec=@vger.kernel.org, AJvYcCWl5MGfCKMpgBRtNxhiehmwHqh32LKiHsOXJHbjDDepDP4euXw1Tx0e5viRrVzK8BK2VCrUX9/wdxXk@vger.kernel.org, AJvYcCX/38L5Y8VdqE9iLzILJw+0YHfZLzOTR1r+xd6+eqfVTW2XnXxLh4NWNl/YMyZV8cnYGeyUrpuA38r8@vger.kernel.org, AJvYcCXjGEk5sv01I6ywvTX2Wrc7TThbeg0Dp6CP+A+3EqaQ+fLOSBxTEzk0Xu37eIhHp+Y50uANZ2uEtOtIyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOkMTyqxNgd3l+mrbSwwiE5wZ1EbXkqmqL0SOLAUmzCoxEpwKP
	gScTSMeS4+AV+s9PgiNk2bgtJuXh7xthdYCskVEWHei6DoKUD0nj
X-Gm-Gg: ASbGnctn2AxI/M/y5E2FUPJKPXr9pvhYiXNV4J8AEd7qz7e0LR3NnsGS2GKxmLCLmRs
	c5ouJZFKgiweRoTOxupLzgleMWnxyrNDU1e+iGxD0cGSHvB21+TQMaUmcAmEgqXxk0tZ/daBZp1
	JuP+5MFHncRT0FJn3LWsjomml+NuS2Py6ZKy8zGr8ALyz4R+oZR+UjOq4MkP8D3JUfXVqr6slCX
	EN51ag7mfk9gj/+aFo2L8moLlLYPCdhtSPbxIUhuEWViECCEi5GxMzyoqvnJuhs6rDp7IcjwBgv
	YSfcJOGm+5Hd
X-Google-Smtp-Source: AGHT+IEIpRcSYA3dtbiUCuQMLwfuQUevbjED3YAUq2sxzHHTrR5Nr6a0NFwL4oWW1bu4ac2Ta3w6oA==
X-Received: by 2002:a05:6a20:a10e:b0:1d5:1354:5256 with SMTP id adf61e73a8af0-1ddb033a1aamr8036224637.39.1732171269680;
        Wed, 20 Nov 2024 22:41:09 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beeb83d4sm2812530b3a.40.2024.11.20.22.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:41:09 -0800 (PST)
From: Ming Yu <a0282524688@gmail.com>
X-Google-Original-From: Ming Yu <tmyu0@nuvoton.com>
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
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 2/7] gpio: Add Nuvoton NCT6694 GPIO support
Date: Thu, 21 Nov 2024 14:40:41 +0800
Message-Id: <20241121064046.3724726-3-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121064046.3724726-1-tmyu0@nuvoton.com>
References: <20241121064046.3724726-1-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver supports GPIO and IRQ functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                 |   1 +
 drivers/gpio/Kconfig        |  12 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-nct6694.c | 441 ++++++++++++++++++++++++++++++++++++
 4 files changed, 455 insertions(+)
 create mode 100644 drivers/gpio/gpio-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c9a94ff8f98..6688c5c470b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16545,6 +16545,7 @@ NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 56fee58e281e..7773b5326e60 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1460,6 +1460,18 @@ config GPIO_MAX77650
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
index af3ba4d81b58..ad80a078b27b 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -123,6 +123,7 @@ obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
 obj-$(CONFIG_GPIO_NOMADIK)		+= gpio-nomadik.o
 obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
+obj-$(CONFIG_GPIO_NCT6694)		+= gpio-nct6694.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
 obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
new file mode 100644
index 000000000000..1776200b3a04
--- /dev/null
+++ b/drivers/gpio/gpio-nct6694.c
@@ -0,0 +1,441 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 GPIO controller driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+/* Host interface */
+#define NCT6694_GPIO_MOD	0xFF
+#define NCT6694_GPIO_LEN	0x01
+
+/* Report Channel */
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
+	struct mutex lock;
+	/* Protect irq operation */
+	struct mutex irq_lock;
+
+	unsigned char xmit_buf;
+	unsigned char irq_trig_falling;
+	unsigned char irq_trig_rising;
+
+	/* Current gpio group */
+	unsigned char group;
+
+	/* GPIO line names */
+	char **names;
+};
+
+static int nct6694_get_direction(struct gpio_chip *gpio, unsigned int offset)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPO_DIR + data->group,
+			       NCT6694_GPIO_LEN, &data->xmit_buf);
+	if (ret < 0)
+		return ret;
+
+	return !(BIT(offset) & data->xmit_buf);
+}
+
+static int nct6694_direction_input(struct gpio_chip *gpio, unsigned int offset)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPO_DIR + data->group,
+			       NCT6694_GPIO_LEN, &data->xmit_buf);
+	if (ret < 0)
+		return ret;
+
+	data->xmit_buf &= ~(1 << offset);
+
+	return nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				 NCT6694_GPO_DIR + data->group,
+				 NCT6694_GPIO_LEN, &data->xmit_buf);
+}
+
+static int nct6694_direction_output(struct gpio_chip *gpio,
+				    unsigned int offset, int val)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	/* Set direction to output */
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPO_DIR + data->group,
+			       NCT6694_GPIO_LEN, &data->xmit_buf);
+	if (ret < 0)
+		return ret;
+
+	data->xmit_buf |= (1 << offset);
+	ret = nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				NCT6694_GPO_DIR + data->group,
+				NCT6694_GPIO_LEN, &data->xmit_buf);
+	if (ret < 0)
+		return ret;
+
+	/* Then set output level */
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPO_DATA + data->group,
+			       NCT6694_GPIO_LEN, &data->xmit_buf);
+	if (ret < 0)
+		return ret;
+
+	if (val)
+		data->xmit_buf |= (1 << offset);
+	else
+		data->xmit_buf &= ~(1 << offset);
+
+	return nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				 NCT6694_GPO_DATA + data->group,
+				 NCT6694_GPIO_LEN, &data->xmit_buf);
+}
+
+static int nct6694_get_value(struct gpio_chip *gpio, unsigned int offset)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPO_DIR + data->group,
+			       NCT6694_GPIO_LEN, &data->xmit_buf);
+	if (ret < 0)
+		return ret;
+
+	if (BIT(offset) & data->xmit_buf) {
+		ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+				       NCT6694_GPO_DATA + data->group,
+				       NCT6694_GPIO_LEN, &data->xmit_buf);
+		if (ret < 0)
+			return ret;
+
+		return !!(BIT(offset) & data->xmit_buf);
+	}
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPI_DATA + data->group,
+			       NCT6694_GPIO_LEN, &data->xmit_buf);
+	if (ret < 0)
+		return ret;
+
+	return !!(BIT(offset) & data->xmit_buf);
+}
+
+static void nct6694_set_value(struct gpio_chip *gpio, unsigned int offset,
+			      int val)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+
+	guard(mutex)(&data->lock);
+
+	nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			 NCT6694_GPO_DATA + data->group,
+			 NCT6694_GPIO_LEN, &data->xmit_buf);
+
+	if (val)
+		data->xmit_buf |= (1 << offset);
+	else
+		data->xmit_buf &= ~(1 << offset);
+
+	nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+			  NCT6694_GPO_DATA + data->group,
+			  NCT6694_GPIO_LEN, &data->xmit_buf);
+}
+
+static int nct6694_set_config(struct gpio_chip *gpio, unsigned int offset,
+			      unsigned long config)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPO_TYPE + data->group,
+			       NCT6694_GPIO_LEN, &data->xmit_buf);
+	if (ret < 0)
+		return ret;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		data->xmit_buf |= (1 << offset);
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		data->xmit_buf &= ~(1 << offset);
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	return nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				 NCT6694_GPO_TYPE + data->group,
+				 NCT6694_GPIO_LEN, &data->xmit_buf);
+}
+
+static int nct6694_init_valid_mask(struct gpio_chip *gpio,
+				   unsigned long *valid_mask,
+				   unsigned int ngpios)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPIO_VALID + data->group,
+			       NCT6694_GPIO_LEN, &data->xmit_buf);
+	if (ret < 0)
+		return ret;
+
+	*valid_mask = data->xmit_buf;
+
+	return ret;
+}
+
+static irqreturn_t nct6694_irq_handler(int irq, void *priv)
+{
+	struct nct6694_gpio_data *data = priv;
+	unsigned char status;
+
+	guard(mutex)(&data->lock);
+
+	nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			 NCT6694_GPI_STS + data->group,
+			 NCT6694_GPIO_LEN, &data->xmit_buf);
+
+	status = data->xmit_buf;
+
+	while (status) {
+		int bit = __ffs(status);
+
+		data->xmit_buf = BIT(bit);
+		handle_nested_irq(irq_find_mapping(data->gpio.irq.domain, bit));
+		status &= ~(1 << bit);
+		nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				  NCT6694_GPI_CLR + data->group,
+				  NCT6694_GPIO_LEN, &data->xmit_buf);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int nct6694_get_irq_trig(struct nct6694_gpio_data *data)
+{
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPI_FALLING + data->group,
+			       NCT6694_GPIO_LEN, &data->irq_trig_falling);
+	if (ret)
+		return ret;
+
+	return nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+				NCT6694_GPI_RISING + data->group,
+				NCT6694_GPIO_LEN, &data->irq_trig_rising);
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
+
+	scoped_guard(mutex, &data->lock) {
+		nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				  NCT6694_GPI_FALLING + data->group,
+				  NCT6694_GPIO_LEN, &data->irq_trig_falling);
+
+		nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				  NCT6694_GPI_RISING + data->group,
+				  NCT6694_GPIO_LEN, &data->irq_trig_rising);
+	}
+
+	mutex_unlock(&data->irq_lock);
+}
+
+static const struct irq_chip nct6694_irq_chip = {
+	.name			= "nct6694-gpio",
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
+	data->names = devm_kzalloc(dev, sizeof(char *) * NCT6694_NR_GPIO,
+				   GFP_KERNEL);
+	if (!data->names)
+		return -ENOMEM;
+
+	for (i = 0; i < NCT6694_NR_GPIO; i++) {
+		data->names[i] = devm_kasprintf(dev, GFP_KERNEL, "GPIO%X%d",
+						cell->id, i);
+		if (!data->names[i])
+			return -ENOMEM;
+	}
+
+	data->nct6694 = nct6694;
+	data->group = cell->id;
+
+	data->gpio.names		= (const char * const*)data->names;
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
+	mutex_init(&data->irq_lock);
+
+	platform_set_drvdata(pdev, data);
+
+	ret = nct6694_get_irq_trig(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get irq trigger type\n");
+
+	/* Register gpio chip to GPIO framework */
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
+					"nct6694-gpio", data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request irq\n");
+
+	return devm_gpiochip_add_data(dev, &data->gpio, data);
+}
+
+static struct platform_driver nct6694_gpio_driver = {
+	.driver = {
+		.name	= "nct6694-gpio",
+	},
+	.probe		= nct6694_gpio_probe,
+};
+
+module_platform_driver(nct6694_gpio_driver);
+
+MODULE_DESCRIPTION("USB-GPIO controller driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


