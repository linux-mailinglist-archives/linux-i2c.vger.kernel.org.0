Return-Path: <linux-i2c+bounces-12907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D5DB54756
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 11:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9D353A642C
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 09:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65964288CBF;
	Fri, 12 Sep 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bveI+qBr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499AD286883
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668826; cv=none; b=UgzTXYHBVmgHPMBW1zQCcxq8EupCL+IC5JzjoiH57ULrlmpnAJ5tL54rV0Yc2oVJKxDW0Q4T2IaLRlPp5BKuTvTgiTEP9VPSUrZbiIZ90Cs90kzSJ1dWb6Yv5a3FcJ/+VG8nac7qlbueDkOm4+R3wjssH1OA66GzoKcOiSsG3XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668826; c=relaxed/simple;
	bh=CckzT68ji8iJcxev/VN/fqX2xXdc8LI2v8eTYDaStYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YvS3bahCzLevM7fgWPIBWZxyn6BLvUtXU6RYQhawchQs35A4AZ70GodUFaSnAImt88MxfzGwfdiwxATfIw14rU1XuMJDa3gsms7/e4Y4am+ICnFj+qSmlWIzZtfJ1QBsb+2lSc6H4/IpWuObRWu7T3FKgUIEhulEK2FQC2QfxTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bveI+qBr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32b959b4895so1089211a91.1
        for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757668823; x=1758273623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/mgjzituTGi3jWBsHbGLx5LSmIruJB82To9hi5Vl3E=;
        b=bveI+qBr2y3jH75k6ly2ExAAGQR+9hPTETBa/ayZ1ST93F3KkbmHoKWTUr29VfDXZi
         sw3gRIuo0rG9pp12NfyD7gFe4PfHsCkxy53+Ye4YEJP0tdFNefY4MAZdpaZLQu0YLQcX
         ieKNHXeHiw16rw9XHDgASNPuwbYMU3u3Mt5NI4lc5LnjbTLtwc18mwrYTHS5+Vxgzj96
         IuEyWtmxiZmjZZzT1AHf1EwcK/i74cywyDvPGpXSJpiPCEvpQErCP+F6yDRBiPG+Nhyz
         5ZoBya3Ct2FZbVly/s+hJg71ph70ZjCgSMMK6ofEZho6p9LCp5aJ/tTDuaFWl5RcPOkt
         T8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668823; x=1758273623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/mgjzituTGi3jWBsHbGLx5LSmIruJB82To9hi5Vl3E=;
        b=ACKh3X53oCEb1cYRmgH8fpXFuuEZdpgAvvvJgZemaNno7pdLUwP+98OJSuIbc9Ftgc
         eyWCCAj6U1Uh8Wpj8u3m2fVzDp8AMuLsyITytYFOhqssUazgBXP3ph7CjO2nDSURRqH7
         mGvOh3MG2a4a49ONlZ7lqNoSb5TC7P154BIyCgATI9fOIIJVOQn9uHa+XIcddOHT9bZV
         GgEmuRZjbdtRjWdlNGrCf48EXTnwwaUUjAIOz2Fg1l8InpmJbHGokAPUqISSAGoxTxlk
         BbvBT9Ph8+8ovd073nfMYoIbwMfriXAsKPEDyJdb+OZORac78fh9bn3fv9fLUWgMrJEH
         gtTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4NzacBwRi7R8SsjXKE/NX1hvF3oClwTRECgZ7k02k+z9wbBay+HrtsCrOi2rLAB6gtXOxTzN7At8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLo8SdCjifL9VXpD+aDS/pb0fDtKdyeJJoy2eJLBSyylcSVlHq
	iHkDgZicuaZUhbs0NMWj1SITrq8Kr9aSPo0hBQlT5VwwOphs7hF3Yjb4
X-Gm-Gg: ASbGnctOMVEgkLMuORqTPhD0SMdzEcS3so3APm0SP0Im2CQLYQGXUlvyamwcn+KGhOc
	/l59s+0a6U4I+3yM1y6L+2Pmik8kXClkmYO4Ks3nD+SKqRNTRqgbCUCtpSFtvpnRi4ud61tBijU
	021/fLKQLNQBEITtbi024tZeT+xqXgtfLvoUmaNx2vbghNXfu87v/xwQ2M3bq4ApnJUwb9za8zc
	eCL+FcrycMx5wveHK6on8UNnlLHY7d9DoXuTkjRSEkyWdWmIhWNF3XLj6ZcCiEiacvN7LnyKKTY
	JodS/g/7M3KRrNjtXjvww+E8LbDa7jcQMQDCyfbeZ+oSq5Gi+c9+7bCpLItLwUFQ+e4oHK7wrDk
	6bLoJWWN/g00u5EjR5B4uWqi0wYxOhL0Aab8vfOnZheqgh+t/mlr0+HXi/46bn9PtqW6mal7I3Q
	kL
X-Google-Smtp-Source: AGHT+IF0Mbitz2j76VXsFK/0/D0DDeTBSK589qvYf7MixKJ3WR3lfIFwbA6xkHFzUNeEUa71uwx76Q==
X-Received: by 2002:a17:90b:164a:b0:32d:ea1c:a4fb with SMTP id 98e67ed59e1d1-32dea1ca81amr1597893a91.24.1757668822291;
        Fri, 12 Sep 2025 02:20:22 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a36dc461sm4066564a12.23.2025.09.12.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:20:22 -0700 (PDT)
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
Date: Fri, 12 Sep 2025 17:19:47 +0800
Message-Id: <20250912091952.1169369-3-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912091952.1169369-1-a0282524688@gmail.com>
References: <20250912091952.1169369-1-a0282524688@gmail.com>
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
index a8a05872d077..e340d1934394 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18085,6 +18085,7 @@ F:	include/uapi/linux/nubus.h
 NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported
+F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e43abb322fa6..1e0b1f5190a1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1522,6 +1522,18 @@ config GPIO_MAX77759
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
+	  called gpio-nct6694.
+
 config GPIO_PALMAS
 	tristate "TI PALMAS series PMICs GPIO"
 	depends on MFD_PALMAS
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 379f55e9ed1e..f3e837fccdd2 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -128,6 +128,7 @@ obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
+obj-$(CONFIG_GPIO_NCT6694)		+= gpio-nct6694.o
 obj-$(CONFIG_GPIO_NOMADIK)		+= gpio-nomadik.o
 obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
new file mode 100644
index 000000000000..a8607f0d9915
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
+	data->gpio.set			= nct6694_set_value;
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


