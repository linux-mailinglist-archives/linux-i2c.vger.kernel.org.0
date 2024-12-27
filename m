Return-Path: <linux-i2c+bounces-8744-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 705479FD2BC
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 10:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61A2A3A06FC
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 09:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6AD15C120;
	Fri, 27 Dec 2024 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFTwB1nH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F72156887;
	Fri, 27 Dec 2024 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735293477; cv=none; b=sqsWLfYvenHZZzO9LuDFMrpgFTgtfn6kORazqsFgo6YDzz1xJLyam2C8yGPXRodwx4t0rhJlSOXZRlMjr6FsbgTSifFH5ZXPgEWHSCszIxzB9AHHqdpGaOCoQVHogiRXZTVkjwiSrfBUSpn7sIHOuCVB7nfqKf6bdedtyXu8UrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735293477; c=relaxed/simple;
	bh=TTr9/UF69eBvGH1icxAjRSWqCAA9DjbfFySV+xlmv8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vGO6n1J4RaDxxibo2QSPSlHfMqj4Eb1Ybis8Gnz1suTBmGh5xu2Q+rg/8D9qS/9NQ3MwuOiFKzUlj3CLZoWBSk9HB2R8tMV7dcNB1+YqB7G2+DI4qw//9/DVM3r5bSksoUrRrd6E5Vzw+RGrtM6sVWaOizXOsDWo0Xu9Cyze4W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFTwB1nH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2167141dfa1so83545255ad.1;
        Fri, 27 Dec 2024 01:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735293474; x=1735898274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPtNprQJYmyjGMRtUZxHdgQa89Grkgt3EAfh6HucewQ=;
        b=LFTwB1nH8WX1W6fhUXMgR13h9D1z07yiBnP1YTdoMEEeDr/EYGy673lAbdaD2mZRmN
         DI6Ljq0plN6PG9gybsGagYYtRoA0/aOo0+FEVruyymqEMiGl7fst9wobU6ZNP6CxH+6Z
         XWEcmTe7h0GZ4KtAdC+XIc+UxcjHyrv6Dt/hD1g0Pk0ReNmgxg4TH5SJg/AlHfvrSPZp
         4CF3lyIse+QGcrXB3KdUZrSUkTLAQyJlk9pujqbDrJGQtClmjTv0lzsG0AjO2WHRDGj7
         FmKIDfpTAL7/fEmZAHYsuA+nf7hEXhAuopHOFGvAvzFIWsRA1LF6w5KfdeCdvEvRIuM+
         qZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735293474; x=1735898274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPtNprQJYmyjGMRtUZxHdgQa89Grkgt3EAfh6HucewQ=;
        b=k2W+fFfl8gU+xMEusR09tBliYSAspJcsc3okNIfd342hXUoiV4cyaberYbRm6i5PpK
         IRS1qhLtUUbW1O6nE7Svnt4CTiFGE6J5gd6O4UGfsLl+BEbP7a4vuF9bSYDtH+EyJ2Ps
         5mLHhYTtbDQMfU+aH4QSXzf2hcqLV4sr526ch68+RVBwPO2HwU9TXVjqiRIxP+JczcTu
         wFkS9l4ZK5xaRRbtAbVSEF+d40+cdc7PK4pp8P0yQZSJ1TuRDr/lkqEIWiFma+eOMvnF
         ZbXn2ICTNfkIChnyO8vCQ/k6QoTHbTyDtJ55xk8bIr5lHqLK0TsC6Olu8IL++/UpU7ck
         O2UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOP9FHdbuL7XnW7TknHoUA0CqIsRgF/PnNaPu1ctgde7IvFUlVhIKDq1PsXb0l850rlxnveZ1cozP2njlGu8U=@vger.kernel.org, AJvYcCUx+DB+QAdVckpmJvuqVmu88N0SFSXvsblI66DX0e60m3rPGeHOTrfWEIpvvP3FcnutApIcP7ZS3+fOOA==@vger.kernel.org, AJvYcCV/HNbW+8vXEKWvK79sHamF0v2GMwmaRjoXbc0oG2w/XOr9rkaz1y7WNq7A1lhoFWUS6lXtepXyP5Y/iEw=@vger.kernel.org, AJvYcCVYd4uVOGj+H9PyheL3WdzmL9L5G4u6rok7AccXgLMKACT28VafPCZlgT5HgXwAdZWQ1j0k3pv4tjBv@vger.kernel.org, AJvYcCWKiGzKzFW946QXnhKsS8aUOeBnjEcMPlwtwP/mSRwUnfmG2YwIwkLCKxTrpxRrLhSTdBLMFUZ8@vger.kernel.org, AJvYcCXIHmNCOzJT+hUYOIVfGt2nihz/t77nxDo5es8fEx/npVF20PMJXpj9sOzFFUNQwtl5y8d5V+A9LT4=@vger.kernel.org, AJvYcCXvCYmVmJSRCnM55nSlCY+2A6uyEGGtdsuZnzGHkMI7neSkNxMFbF72SJnO0lljfRCGUJaNRXla3Wnp@vger.kernel.org
X-Gm-Message-State: AOJu0YzjEr9YaHUB2gJf1CJqfUqGJyFMqOBCUSXL7jnC90CWKQZxtHdg
	HmzA6WsfFXbN/TTX0Zdl1tN4s5C9VeUymaSSR8bu3cDz2IUx6FEr
X-Gm-Gg: ASbGnct0kEG29OP7QIGg7FdZw8gftG4dP07cRqRagXYT6DaHtvEinD+wxbM+jwEKVX2
	ERFNmBnIe/9ZevYx0JlrK233QSA1oYOWMXqpViq07XXTlQOTKkOIoKWUioeIJwghjy0fjQ5j4TC
	xcUIy2NmRQWCmnBAxulnd3/nGElRM5Uj4aZcNmXSGzslAvCnHbbj3kPhi5wsQ3qSC9unB523CrJ
	segfeijsYTEkN6/uxsm9nVIqdcBYpfhbyl25o6/MsyB/edbJi+NbaoZKM+BkNOeJRU8h1WM8fp6
	KkyAlVLeCdyN0YPjWLey7C7T
X-Google-Smtp-Source: AGHT+IFHgnFONjSXV/1UCyWo6AfPdrGbVrFbNczdmD7ktCOZTHkWCP+RFxKwD4fkYLx9QJFnbeWJNg==
X-Received: by 2002:a17:903:41c8:b0:215:8847:4377 with SMTP id d9443c01a7336-219e6cf8584mr415795515ad.15.1735293474310;
        Fri, 27 Dec 2024 01:57:54 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm131581135ad.187.2024.12.27.01.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 01:57:53 -0800 (PST)
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
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v4 2/7] gpio: Add Nuvoton NCT6694 GPIO support
Date: Fri, 27 Dec 2024 17:57:22 +0800
Message-Id: <20241227095727.2401257-3-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241227095727.2401257-1-a0282524688@gmail.com>
References: <20241227095727.2401257-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver supports GPIO and IRQ functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 MAINTAINERS                 |   1 +
 drivers/gpio/Kconfig        |  12 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-nct6694.c | 462 ++++++++++++++++++++++++++++++++++++
 4 files changed, 476 insertions(+)
 create mode 100644 drivers/gpio/gpio-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index acb270037642..18bf57f47792 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16726,6 +16726,7 @@ NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 93ee3aa092f8..808fbfdbff3b 100644
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
index 000000000000..14c8acfcf5c3
--- /dev/null
+++ b/drivers/gpio/gpio-nct6694.c
@@ -0,0 +1,462 @@
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
+	struct mutex lock;
+	/* Protect irq operation */
+	struct mutex irq_lock;
+
+	unsigned char reg_val;
+	unsigned char irq_trig_falling;
+	unsigned char irq_trig_rising;
+
+	/* Current gpio group */
+	unsigned char group;
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
+			       sizeof(data->reg_val),
+			       &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	return !(BIT(offset) & data->reg_val);
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
+			       sizeof(data->reg_val),
+			       &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	data->reg_val &= ~BIT(offset);
+
+	return nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				 NCT6694_GPO_DIR + data->group,
+				 sizeof(data->reg_val),
+				 &data->reg_val);
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
+			       sizeof(data->reg_val),
+			       &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	data->reg_val |= BIT(offset);
+	ret = nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				NCT6694_GPO_DIR + data->group,
+				sizeof(data->reg_val),
+				&data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	/* Then set output level */
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPO_DATA + data->group,
+			       sizeof(data->reg_val),
+			       &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	if (val)
+		data->reg_val |= BIT(offset);
+	else
+		data->reg_val &= ~BIT(offset);
+
+	return nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				 NCT6694_GPO_DATA + data->group,
+				 sizeof(data->reg_val),
+				 &data->reg_val);
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
+			       sizeof(data->reg_val),
+			       &data->reg_val);
+	if (ret < 0)
+		return ret;
+
+	if (BIT(offset) & data->reg_val) {
+		ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+				       NCT6694_GPO_DATA + data->group,
+				       sizeof(data->reg_val),
+				       &data->reg_val);
+		if (ret < 0)
+			return ret;
+
+		return !!(BIT(offset) & data->reg_val);
+	}
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			       NCT6694_GPI_DATA + data->group,
+			       sizeof(data->reg_val),
+			       &data->reg_val);
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
+
+	guard(mutex)(&data->lock);
+
+	nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			 NCT6694_GPO_DATA + data->group,
+			 sizeof(data->reg_val),
+			 &data->reg_val);
+
+	if (val)
+		data->reg_val |= BIT(offset);
+	else
+		data->reg_val &= ~BIT(offset);
+
+	nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+			  NCT6694_GPO_DATA + data->group,
+			  sizeof(data->reg_val),
+			  &data->reg_val);
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
+			       sizeof(data->reg_val),
+			       &data->reg_val);
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
+	return nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				 NCT6694_GPO_TYPE + data->group,
+				 sizeof(data->reg_val),
+				 &data->reg_val);
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
+			       sizeof(data->reg_val),
+			       &data->reg_val);
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
+	unsigned char status;
+
+	guard(mutex)(&data->lock);
+
+	nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+			 NCT6694_GPI_STS + data->group,
+			 sizeof(data->reg_val),
+			 &data->reg_val);
+
+	status = data->reg_val;
+
+	while (status) {
+		int bit = __ffs(status);
+
+		data->reg_val = BIT(bit);
+		handle_nested_irq(irq_find_mapping(data->gpio.irq.domain, bit));
+		status &= ~BIT(bit);
+		nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				  NCT6694_GPI_CLR + data->group,
+				  sizeof(data->reg_val),
+				  &data->reg_val);
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
+			       sizeof(data->irq_trig_falling),
+			       &data->irq_trig_falling);
+	if (ret)
+		return ret;
+
+	return nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
+				NCT6694_GPI_RISING + data->group,
+				sizeof(data->irq_trig_rising),
+				&data->irq_trig_rising);
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
+				  sizeof(data->irq_trig_falling),
+				  &data->irq_trig_falling);
+
+		nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
+				  NCT6694_GPI_RISING + data->group,
+				  sizeof(data->irq_trig_rising),
+				  &data->irq_trig_rising);
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
+MODULE_ALIAS("platform:nct6694-gpio");
-- 
2.34.1


