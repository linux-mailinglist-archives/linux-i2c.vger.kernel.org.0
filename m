Return-Path: <linux-i2c+bounces-7520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA729ADFB6
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65A2CB2231D
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EF91B85CB;
	Thu, 24 Oct 2024 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjC5c1GW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25E11B6CEB;
	Thu, 24 Oct 2024 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760397; cv=none; b=P80qR9tco6gXvpk/bU0NN/I8VQV7egVkgMl7C0K068nYM2G7miWQArwdY7wLJyoWCd+HDTBplw5CsmM0U1zi1psD8DKca88++Xlw1W4boW/DDyZs95XuyXbDZNTW1T2kTkL0OiTeQKGass+9Asxv8ONXYdoVY09Vz80z+LRsaOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760397; c=relaxed/simple;
	bh=g1kUzY41TajXRq9Eu1+zOAOjqHoRGtzKHARbRX7ZUro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pmlccz+HEHHz+Rpk8xHIZk+OkXct23pEszPaaEQAiOjWN2Kl1somcfG71HhDC1WF5a4LRQRZZhHjczx5jyezYwlnsL2yjbaBhXofQwU/Q5hxNT+ISZiJtQGTCHLasZTTVZo/FiLPSt7RCkeLpVjQ5NF7N2T7o935BmDkGITOcc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjC5c1GW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cb89a4e4cso4331495ad.3;
        Thu, 24 Oct 2024 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729760394; x=1730365194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ACqx5Cut3267Yh5BbDV0H19Ly+tNCZIFEFe/P03oXA=;
        b=SjC5c1GWHQnoyOF57TsSelp2V8w/CG4NvqAPISYjBlpGX+IYEYQgE+yc+aGobMtlAz
         NXK4X/TSnTEZ4pEZvPZkkduyd0Ql7qZ4KxxLc3kaHFpJ9nmx/exYX1kpqqdkXI50qof3
         3AkoSjPu9OJkC6X4Ax06xHhRKOjswGrnBTt/jqvcQIh+mXAcLGQJ2h9ulvkYTPxATNtx
         rSSUIxpklC17FJ2mHikIg/99BzHub7Id+MLk4jmGsyP5JLvABuF7TTEtDOtntMBzVKyZ
         ZzszzvEqn/t9x0IQM14IelirNdgJeqSqVj7tN6VE3uWhmsPIa6hXT5hy937t0EcLsDdb
         qWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760394; x=1730365194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ACqx5Cut3267Yh5BbDV0H19Ly+tNCZIFEFe/P03oXA=;
        b=C3AgWGHVHbYRi1a3QbKd2ZdvXZTpvHaFOqEXDWYgruIkjrhIkhLZm47GfV8BbxdaQK
         mvrRZjq9KBZZA0d1PjW/bYdd9j0bJeD2EOUea0HyXDHVTX4TGpZ7jYaWUEocYUzT7CJk
         94Hy7lueLB1CNQ73QuBo8QRnlGyIX3S19hjtGbB88/68SCEo+6SYNboLM2AI6lWINZgj
         PiWWgOrtAgzyrg7GnyAOtP+Ldtae+2rv4OJjajHTIO/qj4jl8IaK7Y2uh2RNR1GGSugQ
         48seSPAx3kxJoYYhMtl3H99m+VWV0EH0MHqTGmQ107qSTrkxbJkA/eYn86pO9t3NQaOV
         nODA==
X-Forwarded-Encrypted: i=1; AJvYcCU6C1Gz5PnZEEAKyUN/DDuPkbFqyW7mDW/S/odha6LPCVhgNQiCRiyRbOdjWTkCWyYVxwRXDmYUs/LXNqU=@vger.kernel.org, AJvYcCUxyF77XlnR97ryvVYCvOPXWuBsiSnGumu04M95tplXpHnTyJ1AYAGDBaFOXgvIusF6IFy8tX9b6NTu4g==@vger.kernel.org, AJvYcCVHs1eFBBMDUdMLajtLcOENI2aTcAsC2n2Qoz1t4BtpCoRAa9qs6dcnaaILXYhbUCPu3ZOxbdxRreYi@vger.kernel.org, AJvYcCVNV+KcFRsauTklIFPB+0/BMyRmKUz8n6J8qWT4NKn8zf4jsnlOBtrQ/FYNjWomapDXTv+CxPqrgSWTfo3gCLA=@vger.kernel.org, AJvYcCW/FhqRwEymMtWNaggl1QTJELrTbscuMZtGEsQKR5U8t+nargE2UF8a9OlTvBoFozghbGb8/ePJMgg=@vger.kernel.org, AJvYcCXFAl8WYq0BK5YqMjd5Zzo/xT3V+g0KVhceSZ4O+GdQ8DyTPRsSO+vCMNTTImy+HiUNhOvFQEsR@vger.kernel.org, AJvYcCXX8ZeQsNCGrJNzNdOJ8bZb4vLc/Y8ZLdyY8acFpfk5nTHiey8lUl8tk8ChFfZtaWfsmRiw1A58v2lt@vger.kernel.org, AJvYcCXpdEfADfuu1o4tgNz1GIJ78qmbXQHLLUJ//wRibF+4GjouFiQ9fsgp7uVbXmCwUqjfLg0eglfAzwHQ@vger.kernel.org, AJvYcCXr0X2C1J2LBRrZ44hjmZKT9FheEuq+oUYRBVqCyxcNXaZRoo93MTO0KYmk6W8gNqetAL0UjGa/MJwX@vger.kernel.org
X-Gm-Message-State: AOJu0YxCzhoyK/HYR4JLgHtA/u+pyh10aVg+MxpU6aThhNZ/OLLPF4NG
	qs3fW1IPUQjG8egguqWEwwTyjZ7qQAe3KuHVTIBGfPaT6I4nbZa6
X-Google-Smtp-Source: AGHT+IFraDFjzyYNyFfHxb72p9lXiL6KT8JkIXYNRRUOfw3EvWsWkAonWEf9Wk40n5OtmfqlmbZDyA==
X-Received: by 2002:a17:903:41d2:b0:20c:f648:e3a3 with SMTP id d9443c01a7336-20fb9b3d6abmr10371555ad.60.1729760394025;
        Thu, 24 Oct 2024 01:59:54 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6e89sm68503615ad.277.2024.10.24.01.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:59:53 -0700 (PDT)
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
	jic23@kernel.org,
	lars@metafoo.de,
	ukleinek@kernel.org,
	alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 2/9] gpio: Add Nuvoton NCT6694 GPIO support
Date: Thu, 24 Oct 2024 16:59:15 +0800
Message-Id: <20241024085922.133071-3-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024085922.133071-1-tmyu0@nuvoton.com>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
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
 drivers/gpio/gpio-nct6694.c | 489 ++++++++++++++++++++++++++++++++++++
 4 files changed, 503 insertions(+)
 create mode 100644 drivers/gpio/gpio-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 30157ca95cf3..2c86d5dab3f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16438,6 +16438,7 @@ NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d93cd4f722b4..aa78ad9ff4ac 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1450,6 +1450,18 @@ config GPIO_MAX77650
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
index 1429e8c0229b..02c94aa28017 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -121,6 +121,7 @@ obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
 obj-$(CONFIG_GPIO_NOMADIK)		+= gpio-nomadik.o
 obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
+obj-$(CONFIG_GPIO_NCT6694)		+= gpio-nct6694.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
 obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
new file mode 100644
index 000000000000..42c0e6e76730
--- /dev/null
+++ b/drivers/gpio/gpio-nct6694.c
@@ -0,0 +1,489 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 GPIO controller driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+
+#define DRVNAME "nct6694-gpio"
+
+/* Host interface */
+#define REQUEST_GPIO_MOD		0xFF
+#define REQUEST_GPIO_LEN		0x01
+
+/* Report Channel */
+#define GPIO_VER_REG			0x90
+#define GPIO_VALID_REG			0x110
+#define GPI_DATA_REG			0x120
+#define GPO_DIR_REG			0x170
+#define GPO_TYPE_REG			0x180
+#define GPO_DATA_REG			0x190
+
+#define GPI_STS_REG			0x130
+#define GPI_CLR_REG			0x140
+#define GPI_FALLING_REG			0x150
+#define GPI_RISING_REG			0x160
+
+struct nct6694_gpio_data {
+	struct nct6694 *nct6694;
+	struct gpio_chip gpio;
+	struct work_struct irq_work;
+	struct work_struct irq_trig_work;
+
+	/* Protect irq operation */
+	struct mutex irq_lock;
+
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
+	unsigned char buf;
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			       GPO_DIR_REG + data->group,
+			       REQUEST_GPIO_LEN, 0, 1, &buf);
+	if (ret < 0)
+		return ret;
+
+	return !(BIT(offset) & buf);
+}
+
+static int nct6694_direction_input(struct gpio_chip *gpio, unsigned int offset)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	unsigned char buf;
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			       GPO_DIR_REG + data->group,
+			       REQUEST_GPIO_LEN, 0, 1, &buf);
+	if (ret < 0)
+		return ret;
+
+	buf &= ~(1 << offset);
+
+	ret = nct6694_write_msg(data->nct6694, REQUEST_GPIO_MOD,
+				GPO_DIR_REG + data->group,
+				REQUEST_GPIO_LEN, &buf);
+
+	return ret;
+}
+
+static int nct6694_direction_output(struct gpio_chip *gpio,
+				    unsigned int offset, int val)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	unsigned char buf;
+	int ret;
+
+	/* Set direction to output */
+	ret = nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			       GPO_DIR_REG + data->group,
+			       REQUEST_GPIO_LEN, 0, 1, &buf);
+	if (ret < 0)
+		return ret;
+
+	buf |= (1 << offset);
+	ret = nct6694_write_msg(data->nct6694, REQUEST_GPIO_MOD,
+				GPO_DIR_REG + data->group,
+				REQUEST_GPIO_LEN, &buf);
+	if (ret < 0)
+		return ret;
+
+	/* Then set output level */
+	ret = nct6694_read_msg(data->nct6694, 0xFF,
+			       GPO_DATA_REG + data->group,
+			       REQUEST_GPIO_LEN, 0, 1, &buf);
+	if (ret < 0)
+		return ret;
+
+	if (val)
+		buf |= (1 << offset);
+	else
+		buf &= ~(1 << offset);
+
+	ret = nct6694_write_msg(data->nct6694, REQUEST_GPIO_MOD,
+				GPO_DATA_REG + data->group,
+				REQUEST_GPIO_LEN, &buf);
+
+	return ret;
+}
+
+static int nct6694_get_value(struct gpio_chip *gpio, unsigned int offset)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	unsigned char buf;
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			       GPO_DIR_REG + data->group,
+			       REQUEST_GPIO_LEN, 0, 1, &buf);
+	if (ret < 0)
+		return ret;
+
+	if (BIT(offset) & buf) {
+		ret = nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+				       GPO_DATA_REG + data->group,
+				       REQUEST_GPIO_LEN, 0, 1, &buf);
+		if (ret < 0)
+			return ret;
+
+		return !!(BIT(offset) & buf);
+	}
+
+	ret = nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			       GPI_DATA_REG + data->group,
+			       REQUEST_GPIO_LEN, 0, 1, &buf);
+	if (ret < 0)
+		return ret;
+
+	return !!(BIT(offset) & buf);
+}
+
+static void nct6694_set_value(struct gpio_chip *gpio, unsigned int offset,
+			      int val)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	unsigned char buf;
+
+	nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			 GPO_DATA_REG + data->group,
+			 REQUEST_GPIO_LEN, 0, 1, &buf);
+
+	if (val)
+		buf |= (1 << offset);
+	else
+		buf &= ~(1 << offset);
+
+	nct6694_write_msg(data->nct6694, REQUEST_GPIO_MOD,
+			  GPO_DATA_REG + data->group,
+			  REQUEST_GPIO_LEN, &buf);
+}
+
+static int nct6694_set_config(struct gpio_chip *gpio, unsigned int offset,
+			      unsigned long config)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	unsigned char buf;
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			       GPO_TYPE_REG + data->group,
+			       REQUEST_GPIO_LEN, 0, 1, &buf);
+	if (ret < 0)
+		return ret;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		buf |= (1 << offset);
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		buf &= ~(1 << offset);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ret = nct6694_write_msg(data->nct6694, REQUEST_GPIO_MOD,
+				GPO_TYPE_REG + data->group,
+				REQUEST_GPIO_LEN, &buf);
+
+	return ret;
+}
+
+static int nct6694_init_valid_mask(struct gpio_chip *gpio,
+				   unsigned long *valid_mask,
+				   unsigned int ngpios)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	unsigned char buf;
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			       GPIO_VALID_REG + data->group,
+			       REQUEST_GPIO_LEN, 0, 1, &buf);
+	if (ret < 0)
+		return ret;
+
+	*valid_mask = buf;
+
+	return ret;
+}
+
+static void nct6694_irq(struct work_struct *irq_work)
+{
+	struct nct6694_gpio_data *data;
+	unsigned char status;
+
+	data = container_of(irq_work, struct nct6694_gpio_data, irq_work);
+
+	nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			 GPI_STS_REG + data->group, 1,
+			 0, 1, &status);
+
+	while (status) {
+		int bit = __ffs(status);
+		unsigned char val = BIT(bit);
+
+		handle_nested_irq(irq_find_mapping(data->gpio.irq.domain, bit));
+		status &= ~(1 << bit);
+		nct6694_write_msg(data->nct6694, REQUEST_GPIO_MOD,
+				  GPI_CLR_REG + data->group,
+				  REQUEST_GPIO_LEN, &val);
+	}
+}
+
+static void nct6694_gpio_handler(void *private_data)
+{
+	struct nct6694_gpio_data *data = private_data;
+	struct nct6694 *nct6694 = data->nct6694;
+
+	queue_work(nct6694->async_workqueue, &data->irq_work);
+}
+
+static int nct6694_get_irq_trig(struct nct6694_gpio_data *data)
+{
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			       GPI_FALLING_REG + data->group,
+			       1, 0, 1, &data->irq_trig_falling);
+	if (ret)
+		return ret;
+
+	ret = nct6694_read_msg(data->nct6694, REQUEST_GPIO_MOD,
+			       GPI_RISING_REG + data->group,
+			       1, 0, 1, &data->irq_trig_rising);
+
+	return ret;
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
+static void nct6694_irq_trig(struct work_struct *irq_trig_work)
+{
+	struct nct6694_gpio_data *data;
+
+	data = container_of(irq_trig_work, struct nct6694_gpio_data,
+			    irq_trig_work);
+
+	nct6694_write_msg(data->nct6694, REQUEST_GPIO_MOD,
+			  GPI_FALLING_REG + data->group,
+			  1, &data->irq_trig_falling);
+
+	nct6694_write_msg(data->nct6694, REQUEST_GPIO_MOD,
+			  GPI_RISING_REG + data->group,
+			  1, &data->irq_trig_rising);
+}
+
+static int nct6694_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gpio = irq_data_get_irq_chip_data(d);
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	struct nct6694 *nct6694 = data->nct6694;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
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
+		return -EOPNOTSUPP;
+	}
+
+	queue_work(nct6694->async_workqueue, &data->irq_trig_work);
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
+	mutex_unlock(&data->irq_lock);
+}
+
+static const struct irq_chip nct6694_irq_chip = {
+	.name			= "nct6694",
+	.irq_mask		= nct6694_irq_mask,
+	.irq_unmask		= nct6694_irq_unmask,
+	.irq_set_type		= nct6694_irq_set_type,
+	.irq_bus_lock		= nct6694_irq_bus_lock,
+	.irq_bus_sync_unlock	= nct6694_irq_bus_sync_unlock,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static const char * const nct6694_gpio_name[] = {
+	"NCT6694-GPIO0",
+	"NCT6694-GPIO1",
+	"NCT6694-GPIO2",
+	"NCT6694-GPIO3",
+	"NCT6694-GPIO4",
+	"NCT6694-GPIO5",
+	"NCT6694-GPIO6",
+	"NCT6694-GPIO7",
+	"NCT6694-GPIO8",
+	"NCT6694-GPIO9",
+	"NCT6694-GPIOA",
+	"NCT6694-GPIOB",
+	"NCT6694-GPIOC",
+	"NCT6694-GPIOD",
+	"NCT6694-GPIOE",
+	"NCT6694-GPIOF",
+};
+
+static int nct6694_gpio_probe(struct platform_device *pdev)
+{
+	const struct mfd_cell *cell = mfd_get_cell(pdev);
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	struct nct6694_gpio_data *data;
+	struct gpio_irq_chip *girq;
+	int ret;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->nct6694 = nct6694;
+	data->group = cell->id;
+
+	data->gpio.label		= nct6694_gpio_name[cell->id];
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
+	data->gpio.ngpio		= 8;
+
+	INIT_WORK(&data->irq_work, nct6694_irq);
+	INIT_WORK(&data->irq_trig_work, nct6694_irq_trig);
+	mutex_init(&data->irq_lock);
+
+	ret = nct6694_register_handler(nct6694, GPIO_IRQ_STATUS,
+				       nct6694_gpio_handler, data);
+	if (ret) {
+		dev_err(&pdev->dev, "%s:  Failed to register handler: %pe\n",
+			__func__, ERR_PTR(ret));
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, data);
+
+	ret = nct6694_get_irq_trig(data);
+	if (ret)
+		return ret;
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
+	ret = gpiochip_add_data(&data->gpio, data);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: Failed to register GPIO chip: %pe",
+			__func__, ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
+
+static void nct6694_gpio_remove(struct platform_device *pdev)
+{
+	struct nct6694_gpio_data *data = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&data->gpio);
+	cancel_work(&data->irq_work);
+	cancel_work(&data->irq_trig_work);
+}
+
+static struct platform_driver nct6694_gpio_driver = {
+	.driver = {
+		.name	= DRVNAME,
+	},
+	.probe		= nct6694_gpio_probe,
+	.remove		= nct6694_gpio_remove,
+};
+
+static int __init nct6694_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&nct6694_gpio_driver);
+	if (!err) {
+		if (err)
+			platform_driver_unregister(&nct6694_gpio_driver);
+	}
+
+	return err;
+}
+subsys_initcall(nct6694_init);
+
+static void __exit nct6694_exit(void)
+{
+	platform_driver_unregister(&nct6694_gpio_driver);
+}
+module_exit(nct6694_exit);
+
+MODULE_DESCRIPTION("USB-GPIO controller driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


