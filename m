Return-Path: <linux-i2c+bounces-12415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2427B33AD4
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 11:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B118D203715
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 09:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E962D0C75;
	Mon, 25 Aug 2025 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkI3+2Vx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47EA2C0F89;
	Mon, 25 Aug 2025 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113871; cv=none; b=pWvftZqrMgVCrc/rDJ8FS4ZSGjk2JDd7873x1bVmweNq1SYUIH52380tqqYO5ToLDLQZvriJIJpzPq3Ic97fFtHL59fJOXIWFB5/OU5A7whv7q3wS0yYu4Uf7eloGhoS4JBqBIV0E7Ub9//mXSHw81uH+o+gij0hkm2jJ1jCZAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113871; c=relaxed/simple;
	bh=3a8bETHPMeByHX2iETx1mojTJRnc7/JQS7cimzIoHiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DG5vQm8QDKMwdOyMQf8FB8LP/0nfGGi2RsOgGx7NaXs94VtPaaGSrwHA3R3p1oDRZoYgfOpeaknDyN+C5vi+E9yKI1ufFEmBWzHvjJi5JyWhlccQEzu+DAf/c44uHwSZCa0oi9mBPZyzmKxi92RL57cSwHs33ubKDlSE7DeoZN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkI3+2Vx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-323267872f3so3227575a91.1;
        Mon, 25 Aug 2025 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756113866; x=1756718666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ekLJOMyh6qRDl0TlUdNv1YQXjJJhr0egLK/Sh0DNBQ=;
        b=RkI3+2VxM/uBjZjL09RAMsI5fClHkXKGRQq9H8TNM/L4AGcpFp0zpJYWkFGd+z7qCZ
         BeHb0DsGyL4HeMZzTdzm90CYQh8cUdocgIM85d/ZqIBxDRL+8anP9MUdD/fzBXz++dCb
         9WoZpKzf/4qiQEiTF9UyhwFFKbYLBzx5mGMGPdOIkRpkCwUdknuGu53tEQUQ2PwWaKDL
         jbHtCDldvylOFxJj2jNH6hZjSCJl/wHTcLRjkHrdcWwVD6RpY3jn53kL85s54ygKzElh
         SKoMDGhlb64+KD7cjY5tUwKyQtAKbJsUzWEvtiTLiCd9MHstuSRTaQ+uL/x3kjt8f6Mh
         VRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113866; x=1756718666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ekLJOMyh6qRDl0TlUdNv1YQXjJJhr0egLK/Sh0DNBQ=;
        b=Qab9ITPtZME/JKnWh88qw3wuuBhMnROLBh/k/mRRcvndXZQpCMrUKpfJg3CVuL/tuB
         f8txQ9lLf3tOIr6GlpADlkZlleI2pvwBLzU3EAGfFEytsdaaZVGY+UxZotQGDmrmq8Xa
         3wQz1DUPhCTv5tdJPDaE/emt1wbmFdQwU2BoHd7JdBmlKpZWKjoP8UATh8tu3NGFobLt
         8hklDzu5x8QMR142LmTuoFvvzs/72iqTkXG1r7I4/o59XDl9WnwzmdLGDOM+X2aYQlQC
         0xnIArwelUFDLIALsEWGq6/C3FRadO61WVAjaeJhJSFR88RZo7C3b2hDdXWVX8U9lHvQ
         hTDg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Qi0SonH06mUgjXzoaQVWGEKgRX3dBrLGqPtvOaP5kn/x/Qd93gv/uKagt+VZ+uamVw67ELSKSZQ=@vger.kernel.org, AJvYcCV9B3iFZfQXsxD6wJbT0+J9Kszx1py8Klx0g+NEHL/8PottDsTtUGl8Zt/VX4hvJ9/6qfu1nBEAD64rjxU=@vger.kernel.org, AJvYcCVMe7Wyv/MxYLVSW9zlmhHxwwG9frJfumg2OgXxDUJl9/GLvmmFsf6arpJZLvrDO0aycdDr1I61Es3iXA==@vger.kernel.org, AJvYcCVw5NWCELpxgqqs/N/LoIemKn4B8eay7NGlwasFI5aC1MJlNSiSsH/SU1uhcdK0giI1+TPpql3e@vger.kernel.org, AJvYcCWCDqJOJ0yGLWUy5PulQMI4qalzpLPDjXKUZj/eXrXBmA/fvqL/ptbeNmADUXAqVopD7BqVYk9RxJDf4HWAdKg=@vger.kernel.org, AJvYcCWsLbIJbc0QVJ3zB60rc1ZJ/mC1N17pRs6dccHhumYUrVQ2NE2LLjhI3JWU0fscCATYiAlnksuPEmR1@vger.kernel.org, AJvYcCX5XqmwKsSeK6gBBEb4q8gbHrMoM0msigD+OgtK2qk4c8rVTVx9Q5bLrxmTZIFCDxD9MNPQ1u/BDi5m@vger.kernel.org, AJvYcCXLmq7M9S1lqTSYSsHyN7CvG6fMIx19Sk8KbjWrYqNxDC6LN2LN9ozMhaTh0yAO7P5L9CWJstl9Djb1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz58gTJLZnhXxw2++Ee1U1bhOZy1jkguVLvEKwDSa8rrj0qWPA3
	jQPASQBubiBymjgGY2ROEhDaM87FKqCsxU8Mk70u6UUgIdV7zLMFLJwj
X-Gm-Gg: ASbGncsKZD+CQWuIXgJOeTgE13WpJm6FIsWRloqE4FpRcBDBvPp7Vt57uj0lX6rthhE
	o8941Edb4JE9xGk0BA6Mg3I/5T4ayw4JY2RVnc5zi/1X6K4bwld9UWp4e01aqSD9hxG6h8mLZwG
	NQlOgIoKiD0l1GKmHhMRFU1dfmaXrd7Y0U+WXPJyM8F8C4HhIr7DH/DoGM44DYsP/UO6zkPhR8E
	t6XtCDh35E2TQE5LC2z5trvarsgQSMR4r6j3+8b9vTuTvcn7DKWsK6xQ9XohqVAOse0vaEzkhLn
	gOPExGfGpQzC0h5MfBiGxUcQYWGPM0zOjdpRWfuS8phGK7JYEywy4QetM1zVT7esZYy6wp15tn8
	ZQjs6on3PTZYSnBhwffTQ8OrOrjGlTGP/AZSNJM1VpuNs1JePE5BHK9QAPTLxGrjKcA==
X-Google-Smtp-Source: AGHT+IHRQOxI2IiXehTaqRPGYjoT0jDry7xIBgfWQSYCiAc7QzsPKTFrqZzOD0yv8QzUIGP1PmtHQQ==
X-Received: by 2002:a17:90b:390f:b0:325:326b:c5b1 with SMTP id 98e67ed59e1d1-325326bc6bcmr15147632a91.17.1756113865452;
        Mon, 25 Aug 2025 02:24:25 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254ae8a2d9sm6552747a91.8.2025.08.25.02.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:24:25 -0700 (PDT)
From: a0282524688@gmail.com
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
Subject: [PATCH RESEND v14 2/7] gpio: Add Nuvoton NCT6694 GPIO support
Date: Mon, 25 Aug 2025 17:23:58 +0800
Message-Id: <20250825092403.3301266-3-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825092403.3301266-1-a0282524688@gmail.com>
References: <20250825092403.3301266-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

This driver supports GPIO and IRQ functionality for NCT6694 MFD
device based on USB interface.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes since version 13:

Changes since version 12:
- Implement IDA in MFD driver to handle per-device IDs
- Use same email address in the signature

Changes since version 11:
- Use platform_device's id to replace IDA

Changes since version 10:
- Implement IDA to allocate id

Changes since version 9:
- Add devm_add_action_or_reset() to dispose irq mapping

Changes since version 8:
- Modify the signed-off-by with my work address
- Add irq_dispose_mapping() in the error handling path and in the remove
  function

Changes since version 7:
- Add error handling for devm_mutex_init()

Changes since version 6:

Changes since version 5:
- Modify the module name and the driver name consistently

Changes since version 4:
- Modify arguments in read/write function to a pointer to cmd_header
- Modify all callers that call the read/write function

Changes since version 3:
- Modify array buffer to structure
- Fix defines and comments
- Add header <linux/bits.h> and use BIT macro
- Modify mutex_init() to devm_mutex_init()

Changes since version 2:
- Add MODULE_ALIAS()
- Modify gpio line names be a local variable in gpio-nct6694.c
- Drop unnecessary platform_get_drvdata() in gpio-nct6694.c

Changes since version 1:
- Add each driver's command structure
- Fix platform driver registration
- Drop unnecessary header
- Add gpio line names

 MAINTAINERS                 |   1 +
 drivers/gpio/Kconfig        |  12 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-nct6694.c | 499 ++++++++++++++++++++++++++++++++++++
 4 files changed, 513 insertions(+)
 create mode 100644 drivers/gpio/gpio-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bf5df5a1fa55..749cfa37ddb8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17818,6 +17818,7 @@ F:	include/uapi/linux/nubus.h
 NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported
+F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 44f922e10db2..ff4f50e97c23 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1500,6 +1500,18 @@ config GPIO_MAX77759
 	  This driver can also be built as a module. If so, the module will be
 	  called gpio-max77759.
 
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
+	  called gpio-nct6694
+
 config GPIO_PALMAS
 	bool "TI PALMAS series PMICs GPIO"
 	depends on MFD_PALMAS
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 88dedd298256..567e0eca3036 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
+obj-$(CONFIG_GPIO_NCT6694)		+= gpio-nct6694.o
 obj-$(CONFIG_GPIO_NOMADIK)		+= gpio-nomadik.o
 obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
new file mode 100644
index 000000000000..e033cb062f9b
--- /dev/null
+++ b/drivers/gpio/gpio-nct6694.c
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 GPIO controller driver based on USB interface.
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ */
+
+#include <linux/bits.h>
+#include <linux/gpio/driver.h>
+#include <linux/idr.h>
+#include <linux/interrupt.h>
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
+	int irq;
+};
+
+static int nct6694_get_direction(struct gpio_chip *gpio, unsigned int offset)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	const struct nct6694_cmd_header cmd_hd = {
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
+	const struct nct6694_cmd_header cmd_hd = {
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
+static int nct6694_set_value(struct gpio_chip *gpio, unsigned int offset,
+			     int val)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_GPIO_MOD,
+		.offset = cpu_to_le16(NCT6694_GPO_DATA + data->group),
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
+	if (val)
+		data->reg_val |= BIT(offset);
+	else
+		data->reg_val &= ~BIT(offset);
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
+}
+
+static int nct6694_set_config(struct gpio_chip *gpio, unsigned int offset,
+			      unsigned long config)
+{
+	struct nct6694_gpio_data *data = gpiochip_get_data(gpio);
+	const struct nct6694_cmd_header cmd_hd = {
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
+	const struct nct6694_cmd_header cmd_hd = {
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
+static void nct6694_irq_dispose_mapping(void *d)
+{
+	struct nct6694_gpio_data *data = d;
+
+	irq_dispose_mapping(data->irq);
+}
+
+static void nct6694_gpio_ida_free(void *d)
+{
+	struct nct6694_gpio_data *data = d;
+	struct nct6694 *nct6694 = data->nct6694;
+
+	ida_free(&nct6694->gpio_ida, data->group);
+}
+
+static int nct6694_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nct6694 *nct6694 = dev_get_drvdata(dev->parent);
+	struct nct6694_gpio_data *data;
+	struct gpio_irq_chip *girq;
+	int ret, i;
+	char **names;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->nct6694 = nct6694;
+
+	ret = ida_alloc(&nct6694->gpio_ida, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+	data->group = ret;
+
+	ret = devm_add_action_or_reset(dev, nct6694_gpio_ida_free, data);
+	if (ret)
+		return ret;
+
+	names = devm_kcalloc(dev, NCT6694_NR_GPIO, sizeof(char *),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < NCT6694_NR_GPIO; i++) {
+		names[i] = devm_kasprintf(dev, GFP_KERNEL, "GPIO%X%d",
+					  data->group, i);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	data->irq = irq_create_mapping(nct6694->domain,
+				       NCT6694_IRQ_GPIO0 + data->group);
+	if (!data->irq)
+		return -EINVAL;
+
+	ret = devm_add_action_or_reset(dev, nct6694_irq_dispose_mapping, data);
+	if (ret)
+		return ret;
+
+	data->gpio.names		= (const char * const*)names;
+	data->gpio.label		= pdev->name;
+	data->gpio.direction_input	= nct6694_direction_input;
+	data->gpio.get			= nct6694_get_value;
+	data->gpio.direction_output	= nct6694_direction_output;
+	data->gpio.set_rv		= nct6694_set_value;
+	data->gpio.get_direction	= nct6694_get_direction;
+	data->gpio.set_config		= nct6694_set_config;
+	data->gpio.init_valid_mask	= nct6694_init_valid_mask;
+	data->gpio.base			= -1;
+	data->gpio.can_sleep		= false;
+	data->gpio.owner		= THIS_MODULE;
+	data->gpio.ngpio		= NCT6694_NR_GPIO;
+
+	platform_set_drvdata(pdev, data);
+
+	ret = devm_mutex_init(dev, &data->lock);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(dev, &data->irq_lock);
+	if (ret)
+		return ret;
+
+	ret = nct6694_get_irq_trig(data);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to get irq trigger type\n");
+		return ret;
+	}
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
+	ret = devm_request_threaded_irq(dev, data->irq, NULL, nct6694_irq_handler,
+					IRQF_ONESHOT | IRQF_SHARED,
+					"gpio-nct6694", data);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to request irq\n");
+		return ret;
+	}
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


