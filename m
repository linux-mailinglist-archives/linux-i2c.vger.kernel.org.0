Return-Path: <linux-i2c+bounces-8404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E689EAE4A
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 11:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B68E1889755
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB75212D83;
	Tue, 10 Dec 2024 10:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRg9jfHE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFE4210F54;
	Tue, 10 Dec 2024 10:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827565; cv=none; b=L13sSYXTqp0gt+/UCMUet8jYaWM2H79CqXsGZWmkAGoDEJEp1aaVKbY/ZSDtYeoKQvvPbcFvmPPxQqcfFa/NFXFbXaDUB2TuoSpIADl3rC/AnIit0rwlje/vDQ2iemoErwy2IwLMK31uVrVufP7Z36Glo6q5QggNFDUpqZtDb8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827565; c=relaxed/simple;
	bh=YnZy/UZ7N9XnUQo1qB4ZRl3Z1rf5NR2tmE3sqAiUMQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bUnBjCmtYmYUij6tU0L3ldWfXNVqdLUU5K2l/WsigMhsyiTOgHtYcFw8WiVRp5FnB36RlZQs88YRZCkY26U6cunkRBxXAuieIJ3G9h4WN/2CmbOAHl8iUPsU9P8/szhgqRjGzscKSgcRk1E4IUnAzJIMJclvGitLW2cqMp2+fgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRg9jfHE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-725c86bbae7so3117042b3a.3;
        Tue, 10 Dec 2024 02:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733827563; x=1734432363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zlW70eTtr4XC+u8X2zVvaXRzZJxXT603RLsOWWcJM4=;
        b=KRg9jfHETyDx2kiiQH4AmP7NW8G23LEpTg3z64K/94mZqmNbVI66mTBAtpXvZp09fn
         +yerZVgr3KLOspplENHMUuhyVkOI+tkn5jux+4ih+On43TWzh6vNfR+1icPnQxOLD004
         0tPtVpGemIf5Za0xP0MbvdiriZNi4KOF1ItBioPWeg3xb0C1CR0ytA9V8/1iGeMVe/u1
         t9l+74OvUPC/n58kELMEOSx5YJg0xL0AO1iOeW/Tkw58fA7iz1qJC37ix6vts7Ef2bX+
         M+ijGkksVXIBbbDZ6puAWgKxyh1RWTg9+uDszen/Y+cDC3NzeZrGs8A/Pl8NqHkYO6Ah
         NqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827563; x=1734432363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zlW70eTtr4XC+u8X2zVvaXRzZJxXT603RLsOWWcJM4=;
        b=XS0B7ANjkKppUlpi7PRdra1gjuauqJpkopHDFUv+yQyinhD6UtM4wPAnDlVn2Mmqon
         LOxh+9YS0u+LdrDjrKhWL5o2R8WuSG+ACL2p2bdbIEaqYwDjjoADgOIaalDx3V0vvUEr
         hoYo/USLIyfrmM7GpDdIPZQNlMaagEVhbprYs6bgHA7adEpi28EvXsNC/9g8tb/JUMDA
         VbMaCn1T2EM1hQCFtdjsJho9xmMWKI35SZdEY+Vfzyv+VGdR+a/lImvRyEjkrNHSXSwC
         AWYXzhFfb5J4t3HdAVpBo6oTJp+lve2YXq31XS4uQKKT+txD+OSQpBK8xqpB5nnAva9W
         Gkfw==
X-Forwarded-Encrypted: i=1; AJvYcCURtbWGT0Ux0MOsO8KE2wsziecj62yEcgfShHJ2PN2Lj6Eg/OxMALD+9afkE9MaLA4kkyEFKN63kGUaFaU=@vger.kernel.org, AJvYcCUYVnIbAVhgSgfrB8oEf8PtMNcGIoybce74x+44eTx7IAE/b0FdZUT1EjRsidNtHtvJNvxEsgb3UOsUk4KzDOw=@vger.kernel.org, AJvYcCUg1oEAt4lptNaRkkkowYV3nx38a58EK8EfR20Flx8oT75HX74VpUtjWHhW9VubLIU8DCtOVRVtytI3@vger.kernel.org, AJvYcCUuezfijYjIUHsZpgSCJMe4AXKzZ703atBH64s1dDOk0oTyyD5dvnVxyyCaXlac1y4zOjZB5Q7gOMGrHg==@vger.kernel.org, AJvYcCUzdnbAzONaORe7i+P7SHnSmEv6+JvjcB92LqwwYaiR7t+9u+KX8cUv8W8vXxN9Dqf+gZm6D0DmK3px@vger.kernel.org, AJvYcCWuSCNpcWloA9FOgZE7yddtbNl/mJ2E1DoAdCEO1hcqn2/JVRxaUf1Stpe9HBrVhOIknbi1WpmV/NA=@vger.kernel.org, AJvYcCXqWeeJsFKq27BooPn1/6QejDbKlYH/VOArjIOGg3Frabh5krFhfF/DneffV7K16nWUdi+HcggV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5qGhpZEnjwjuJIHylN+c1AyogCxm6wU5utPZgxEiZsMBKWcR
	iplEvH16SBM0MxA1sumJw+iIFRxjEU8C5dS0MU/l3RUGd7hJS3MU
X-Gm-Gg: ASbGnctGMygWV4HTEAqrZfwRHqMNoIInsgGfiVH5cu0sinwj/L0TrCMz1jwOIKLMfVI
	Tp1eSkJK1rK+/mNdvtQFSPyqMAhdosB02Hxbiy5tmImEJzc0R3XMg/Cx9x5m0SmCIfVB8yB9HED
	EIqyKoWOR69nJgnPAR/ncg47h2P6OWaVUHF26O/Q+Kq87K7px1HOJ2ggmZjQNjtfhwmJhiGYjey
	cTT2EDNnE8R+uEc4n6ttoDPYELI6UjPa+NDn62AaQVQIB6U8UAKW0lupYdGf+gfY0mNXItloNpl
	XLAI6fW16RD2HEsL
X-Google-Smtp-Source: AGHT+IFFkh1VlRLYR9J1VpbJfFr6rtg+nZDjjWNWW9IRwyq+Rf9ykJxXaxhEpsgeoIIMFXylc+otlA==
X-Received: by 2002:a05:6a00:8c7:b0:725:d1d5:6d80 with SMTP id d2e1a72fcca58-7273c90ac04mr5014157b3a.7.1733827563063;
        Tue, 10 Dec 2024 02:46:03 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156dfe2fsm8905748a12.31.2024.12.10.02.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:46:02 -0800 (PST)
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
Subject: [PATCH v3 2/7] gpio: Add Nuvoton NCT6694 GPIO support
Date: Tue, 10 Dec 2024 18:45:19 +0800
Message-Id: <20241210104524.2466586-3-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210104524.2466586-1-tmyu0@nuvoton.com>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
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
 drivers/gpio/gpio-nct6694.c | 438 ++++++++++++++++++++++++++++++++++++
 4 files changed, 452 insertions(+)
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
index 000000000000..8aac034e6d06
--- /dev/null
+++ b/drivers/gpio/gpio-nct6694.c
@@ -0,0 +1,438 @@
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
+	mutex_init(&data->irq_lock);
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
+MODULE_ALIAS("platform:nct6694-gpio");
-- 
2.34.1


