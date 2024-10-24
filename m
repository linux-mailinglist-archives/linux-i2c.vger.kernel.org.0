Return-Path: <linux-i2c+bounces-7519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 236879ADFAC
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FFBEB21842
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25241B6CE8;
	Thu, 24 Oct 2024 08:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P90yStaE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8851B0F19;
	Thu, 24 Oct 2024 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760393; cv=none; b=FAHW1gg6jUpBlbsYGrrf6sYiKrYUGu+YnzZBFwbjVdJGmlWtG1HQJFnnjIF3ObzWnnqp5QHH7/Fkl3G333Osy/pm100ck6UCPUDb3nFHFMtMHm3dIGpyJk8BpCIKldhe0mx2q7X/FxBGdhARXDbAPz2B1mnaho0/kXRTalKyQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760393; c=relaxed/simple;
	bh=IuTA3S4y8FkEEn7g5DNk+66BHDM5lGS44rGjEIu5vEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h13qjc5TSzoOhBDsCD3PWQoQSXH6+nn7KpTn17kQECjL0sDr10nc/PjZFD5a55BUbgK6Jqi0b1GFraWZSiEpVz4xt6o2hdGar7dwoq1JAbpI6XPyHbkaoyZ69CK/3kCxDnXs54+7W1eF2I+AbkatYsfFIQGPVj51PUxYBCRBEmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P90yStaE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cd76c513cso5035385ad.3;
        Thu, 24 Oct 2024 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729760389; x=1730365189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2n3jv44FOaurqNOt74iqXLzFIjz7mqyBdb/BAo9EhVU=;
        b=P90yStaEqVIsb0GnyUn9FBDku9ZIstoMAp2U6SUwfB0+xWjikM8+kQ3VENNsggloQn
         WKodKuHHbXQzK3ccsFcarK2L++Wms9CgxjHFihAQSmUt5PGJuumaPgruVN+ScTdOOmOc
         JoT+TNZ5y9d/SROJ6PXgYhbG1P9NF3vOjJt9OAMF1x1aEfC4dcP1WVG3UwCGsQRvs9PK
         zsnsp08wDCr4A9FzjxCn/U2tcN7QFPFdf98b885BPDpG49mT60Q05k0cNgKjD+28P2xW
         kaFVYcfXhQy9Th8PR4SeL91j5bjjKCZKBH9Ec0LdMrGo5kBIBlECKEz6dEanN926ApCI
         wfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760389; x=1730365189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2n3jv44FOaurqNOt74iqXLzFIjz7mqyBdb/BAo9EhVU=;
        b=ozUU0pgQKcoYAjp1RDKjhPNnmFpNfUr3gLbmbTofue/YF40pwFHfIB4sBUtC1em87o
         qnKIk1YLjsD/LwDrrwS3OMFPwvMAIrSb4XyuD172/3tjkzg+uQGDiAesYFKSzn9AfTnd
         7fa1xN2uZnbBOGt0uWyuh/upgbbi2gCBbTi6w49q2biiFBf5CdyktCsx7xm1bXQe30D7
         NTjpsqu54bH3GMgfkoI95siujq2NxfizJx7kascoAEcqdp4Ceyijk91SjxdWNMxvBVhK
         XM57o4vdvuDFYLwjjRM9uM/MrIOVfrCwkEtaQeix4Wq0gjAXkHZ00ds0//VOKKagJFQh
         QgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKhxUykn/L1zb05Wn43vGjkiIEA9Y6i2aRZ9trr4XlnAqCiYkMO2WxybUX8SufTEYbozLvhXBsGaJYGw4=@vger.kernel.org, AJvYcCUkTCSCnmQOcBQitBuOQxFHH7unsYxiQuP1okpiOxXqTgHYHUD+DNYxp1PkiOpxQxyT6mXV2syLMew=@vger.kernel.org, AJvYcCUmEcv0DeCUVf4zpM8sQnYdPGjlkRImMIk19q+6yU/Y+vdSSAJA2Nnqz7SEVZ4HMP+Ls29q0UUZAlbuNVuVQSk=@vger.kernel.org, AJvYcCVCKADK62cbruh31rf52lYvFLZz5vZZuD95mg6Ry7si+jfPrWeI0dxy2yTLSNxVNt9kKwXapYua3dqO@vger.kernel.org, AJvYcCVZCMIj6AL0wJ8XfrOCDbpWlYZUGU9Jzc4xUnIk94IcbEOWDiftyOLg23vJ9+yWoKKz72ehF7oZRHPc@vger.kernel.org, AJvYcCVuUWVNUbkT+HCtJ/o6lpqWryJf1psH6U09v0/JaVqgPwDIy/OheAUpEd9aH9Ci6a+BaYcFziLQj4T2@vger.kernel.org, AJvYcCWn/1WJsgL8Cuu9Cju3tbJ+RIy5Sb9mR7sLZerIGA9f1kT6Vo1+Aw6R/jABbCyZbXhYxCU5yUf6Zf3amA==@vger.kernel.org, AJvYcCWreIvRLA5UCR2+UBKn+ZdiJNQPyvgr7WSeaZ9t3+YZI22rH0gpiTXfZP6uIQbi6h84usaJ+XAe@vger.kernel.org, AJvYcCXqxwus1f9eD510XXd6dOdGc77P5iLFnxXCzMjR4/cYvjeLtXSjhvLj8AIddKP+SoXLmC5ZPPN7/k83@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxI6ft0PTWX3B33bvTLQ3JNh88kr/LVuX8X4rZYGVwSgAsPw/
	gZ7xAaJW04TARASNuHbxf4C3ym4gtFs+0Lf1fK+i6BELBUqeXcMm
X-Google-Smtp-Source: AGHT+IEJzwqQH2kaT93X08v5aqyeGmqbrSsY3vryGf217SMBOL08qYdnPZj3mt0qKUUlGvzky73sMw==
X-Received: by 2002:a17:903:184:b0:20c:da98:d752 with SMTP id d9443c01a7336-20fa9df25f4mr75245485ad.16.1729760389386;
        Thu, 24 Oct 2024 01:59:49 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6e89sm68503615ad.277.2024.10.24.01.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:59:49 -0700 (PDT)
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
Subject: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
Date: Thu, 24 Oct 2024 16:59:14 +0800
Message-Id: <20241024085922.133071-2-tmyu0@nuvoton.com>
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

The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
PWM, and RTC.

This driver implements USB device functionality and shares the
chip's peripherals as a child device.

Each child device can use the USB functions nct6694_read_msg()
and nct6694_write_msg() to issue a command. They can also register
a handler function that will be called when the USB device receives
its interrupt pipe.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                 |   7 +
 drivers/mfd/Kconfig         |  10 +
 drivers/mfd/Makefile        |   2 +
 drivers/mfd/nct6694.c       | 394 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h | 168 +++++++++++++++
 5 files changed, 581 insertions(+)
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 include/linux/mfd/nct6694.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e9659a5a7fb3..30157ca95cf3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16434,6 +16434,13 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON NCT6694 MFD DRIVER
+M:	Ming Yu <tmyu0@nuvoton.com>
+L:	linux-kernel@vger.kernel.org
+S:	Supported
+F:	drivers/mfd/nct6694.c
+F:	include/linux/mfd/nct6694.h
+
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
 M:	Antonino Daplas <adaplas@gmail.com>
 L:	linux-fbdev@vger.kernel.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index f9325bcce1b9..da2600958697 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -546,6 +546,16 @@ config MFD_MX25_TSADC
 	  i.MX25 processors. They consist of a conversion queue for general
 	  purpose ADC and a queue for Touchscreens.
 
+config MFD_NCT6694
+	tristate "Nuvoton NCT6694 support"
+	select MFD_CORE
+	depends on USB
+	help
+	  This adds support for Nuvoton USB device NCT6694 sharing peripherals
+	  This includes the USB devcie driver and core APIs.
+	  Additional drivers must be enabled in order to use the functionality
+	  of the device.
+
 config MFD_HI6421_PMIC
 	tristate "HiSilicon Hi6421 PMU/Codec IC"
 	depends on OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 2a9f91e81af8..2cf816d67d03 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -116,6 +116,8 @@ obj-$(CONFIG_TWL6040_CORE)	+= twl6040.o
 
 obj-$(CONFIG_MFD_MX25_TSADC)	+= fsl-imx25-tsadc.o
 
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
+
 obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
 obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
 obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
new file mode 100644
index 000000000000..9838c7be0b98
--- /dev/null
+++ b/drivers/mfd/nct6694.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 MFD driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/io.h>
+#include <linux/usb.h>
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+
+#define DRVNAME "nct6694-usb_mfd"
+
+#define MFD_DEV_SIMPLE(_name)		\
+{					\
+	.name = NCT6694_DEV_##_name,	\
+}					\
+
+#define MFD_DEV_WITH_ID(_name, _id)	\
+{					\
+	.name = NCT6694_DEV_##_name,	\
+	.id = _id,			\
+}
+
+/* MFD device resources */
+static const struct mfd_cell nct6694_dev[] = {
+	MFD_DEV_WITH_ID(GPIO, 0x0),
+	MFD_DEV_WITH_ID(GPIO, 0x1),
+	MFD_DEV_WITH_ID(GPIO, 0x2),
+	MFD_DEV_WITH_ID(GPIO, 0x3),
+	MFD_DEV_WITH_ID(GPIO, 0x4),
+	MFD_DEV_WITH_ID(GPIO, 0x5),
+	MFD_DEV_WITH_ID(GPIO, 0x6),
+	MFD_DEV_WITH_ID(GPIO, 0x7),
+	MFD_DEV_WITH_ID(GPIO, 0x8),
+	MFD_DEV_WITH_ID(GPIO, 0x9),
+	MFD_DEV_WITH_ID(GPIO, 0xA),
+	MFD_DEV_WITH_ID(GPIO, 0xB),
+	MFD_DEV_WITH_ID(GPIO, 0xC),
+	MFD_DEV_WITH_ID(GPIO, 0xD),
+	MFD_DEV_WITH_ID(GPIO, 0xE),
+	MFD_DEV_WITH_ID(GPIO, 0xF),
+
+	MFD_DEV_WITH_ID(I2C, 0x0),
+	MFD_DEV_WITH_ID(I2C, 0x1),
+	MFD_DEV_WITH_ID(I2C, 0x2),
+	MFD_DEV_WITH_ID(I2C, 0x3),
+	MFD_DEV_WITH_ID(I2C, 0x4),
+	MFD_DEV_WITH_ID(I2C, 0x5),
+
+	MFD_DEV_WITH_ID(CAN, 0x0),
+	MFD_DEV_WITH_ID(CAN, 0x1),
+
+	MFD_DEV_WITH_ID(WDT, 0x0),
+	MFD_DEV_WITH_ID(WDT, 0x1),
+
+	MFD_DEV_SIMPLE(IIO),
+	MFD_DEV_SIMPLE(HWMON),
+	MFD_DEV_SIMPLE(PWM),
+	MFD_DEV_SIMPLE(RTC),
+};
+
+int nct6694_register_handler(struct nct6694 *nct6694, int irq_bit,
+			     void (*handler)(void *), void *private_data)
+{
+	struct nct6694_handler_entry *entry;
+	unsigned long flags;
+
+	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->irq_bit = irq_bit;
+	entry->handler = handler;
+	entry->private_data = private_data;
+
+	spin_lock_irqsave(&nct6694->lock, flags);
+	list_add_tail(&entry->list, &nct6694->handler_list);
+	spin_unlock_irqrestore(&nct6694->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL(nct6694_register_handler);
+
+int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset, u16 length,
+		     u8 rd_idx, u8 rd_len, unsigned char *buf)
+{
+	struct usb_device *udev = nct6694->udev;
+	unsigned char err_status;
+	int len, packet_len, tx_len, rx_len;
+	int i, ret;
+
+	mutex_lock(&nct6694->access_lock);
+
+	/* Send command packet to USB device */
+	nct6694->cmd_buffer[REQUEST_MOD_IDX] = mod;
+	nct6694->cmd_buffer[REQUEST_CMD_IDX] = offset & 0xFF;
+	nct6694->cmd_buffer[REQUEST_SEL_IDX] = (offset >> 8) & 0xFF;
+	nct6694->cmd_buffer[REQUEST_HCTRL_IDX] = HCTRL_GET;
+	nct6694->cmd_buffer[REQUEST_LEN_L_IDX] = length & 0xFF;
+	nct6694->cmd_buffer[REQUEST_LEN_H_IDX] = (length >> 8) & 0xFF;
+
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT),
+			   nct6694->cmd_buffer, CMD_PACKET_SZ, &tx_len,
+			   nct6694->timeout);
+	if (ret)
+		goto err;
+
+	/* Receive response packet from USB device */
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDPOINT),
+			   nct6694->rx_buffer, CMD_PACKET_SZ, &rx_len,
+			   nct6694->timeout);
+	if (ret)
+		goto err;
+
+	err_status = nct6694->rx_buffer[RESPONSE_STS_IDX];
+
+	/*
+	 * Segmented reception of messages that exceed the size of USB bulk
+	 * pipe packets.
+	 */
+	for (i = 0, len = length; len > 0; i++, len -= packet_len) {
+		if (len > nct6694->maxp)
+			packet_len = nct6694->maxp;
+		else
+			packet_len = len;
+
+		ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDPOINT),
+				   nct6694->rx_buffer + nct6694->maxp * i,
+				   packet_len, &rx_len, nct6694->timeout);
+		if (ret)
+			goto err;
+	}
+
+	for (i = 0; i < rd_len; i++)
+		buf[i] = nct6694->rx_buffer[i + rd_idx];
+
+	if (err_status) {
+		pr_debug("%s: MSG CH status = %2Xh\n", __func__, err_status);
+		ret = -EIO;
+	}
+
+err:
+	mutex_unlock(&nct6694->access_lock);
+	return ret;
+}
+EXPORT_SYMBOL(nct6694_read_msg);
+
+int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
+		      u16 length, unsigned char *buf)
+{
+	struct usb_device *udev = nct6694->udev;
+	unsigned char err_status;
+	int len, packet_len, tx_len, rx_len;
+	int i, ret;
+
+	mutex_lock(&nct6694->access_lock);
+
+	/* Send command packet to USB device  */
+	nct6694->cmd_buffer[REQUEST_MOD_IDX] = mod;
+	nct6694->cmd_buffer[REQUEST_CMD_IDX] = offset & 0xFF;
+	nct6694->cmd_buffer[REQUEST_SEL_IDX] = (offset >> 8) & 0xFF;
+	nct6694->cmd_buffer[REQUEST_HCTRL_IDX] = HCTRL_SET;
+	nct6694->cmd_buffer[REQUEST_LEN_L_IDX] = length & 0xFF;
+	nct6694->cmd_buffer[REQUEST_LEN_H_IDX] = (length >> 8) & 0xFF;
+
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT),
+			   nct6694->cmd_buffer, CMD_PACKET_SZ, &tx_len,
+			   nct6694->timeout);
+	if (ret)
+		goto err;
+
+	/*
+	 * Segmented transmission of messages that exceed the size of USB bulk
+	 * pipe packets.
+	 */
+	for (i = 0, len = length; len > 0; i++, len -= packet_len) {
+		if (len > nct6694->maxp)
+			packet_len = nct6694->maxp;
+		else
+			packet_len = len;
+
+		memcpy(nct6694->tx_buffer + nct6694->maxp * i,
+		       buf + nct6694->maxp * i, packet_len);
+
+		ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT),
+				   nct6694->tx_buffer + nct6694->maxp * i,
+				   packet_len, &tx_len, nct6694->timeout);
+		if (ret)
+			goto err;
+	}
+
+	/* Receive response packet from USB device */
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDPOINT),
+			   nct6694->rx_buffer, CMD_PACKET_SZ, &rx_len,
+			   nct6694->timeout);
+	if (ret)
+		goto err;
+
+	err_status = nct6694->rx_buffer[RESPONSE_STS_IDX];
+
+	/*
+	 * Segmented reception of messages that exceed the size of USB bulk
+	 * pipe packets.
+	 */
+	for (i = 0, len = length; len > 0; i++, len -= packet_len) {
+		if (len > nct6694->maxp)
+			packet_len = nct6694->maxp;
+		else
+			packet_len = len;
+
+		ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDPOINT),
+				   nct6694->rx_buffer + nct6694->maxp * i,
+				   packet_len, &rx_len, nct6694->timeout);
+		if (ret)
+			goto err;
+	}
+
+	memcpy(buf, nct6694->rx_buffer, length);
+
+	if (err_status) {
+		pr_debug("%s: MSG CH status = %2Xh\n", __func__, err_status);
+		ret = -EIO;
+	}
+
+err:
+	mutex_unlock(&nct6694->access_lock);
+	return ret;
+}
+EXPORT_SYMBOL(nct6694_write_msg);
+
+static void usb_int_callback(struct urb *urb)
+{
+	unsigned char *int_status = urb->transfer_buffer;
+	struct nct6694 *nct6694 = urb->context;
+	struct nct6694_handler_entry *entry;
+	unsigned long flags;
+	int ret;
+
+	switch (urb->status) {
+	case 0:
+		break;
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+		return;
+	default:
+		goto resubmit;
+	}
+
+	spin_lock_irqsave(&nct6694->lock, flags);
+
+	list_for_each_entry(entry, &nct6694->handler_list, list) {
+		if (int_status[INT_IN_IRQ_IDX] & entry->irq_bit)
+			entry->handler(entry->private_data);
+	}
+
+	spin_unlock_irqrestore(&nct6694->lock, flags);
+
+resubmit:
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret)
+		pr_debug("%s: Failed to resubmit urb, status %d",
+			 __func__, ret);
+}
+
+static int nct6694_usb_probe(struct usb_interface *iface,
+			     const struct usb_device_id *id)
+{
+	struct usb_device *udev = interface_to_usbdev(iface);
+	struct device *dev = &udev->dev;
+	struct usb_host_interface *interface;
+	struct usb_endpoint_descriptor *int_endpoint;
+	struct nct6694 *nct6694;
+	int pipe, maxp, bulk_pipe;
+	int ret = EINVAL;
+
+	interface = iface->cur_altsetting;
+	/* Binding interface class : 0xFF */
+	if (interface->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
+	    interface->desc.bInterfaceSubClass != 0x00 ||
+	    interface->desc.bInterfaceProtocol != 0x00)
+		return -ENODEV;
+
+	int_endpoint = &interface->endpoint[0].desc;
+	if (!usb_endpoint_is_int_in(int_endpoint))
+		return -ENODEV;
+
+	nct6694 = devm_kzalloc(&udev->dev, sizeof(*nct6694), GFP_KERNEL);
+	if (!nct6694)
+		return -ENOMEM;
+
+	pipe = usb_rcvintpipe(udev, INT_IN_ENDPOINT);
+	maxp = usb_maxpacket(udev, pipe);
+
+	nct6694->cmd_buffer = devm_kcalloc(dev, CMD_PACKET_SZ,
+					   sizeof(unsigned char), GFP_KERNEL);
+	if (!nct6694->cmd_buffer)
+		return -ENOMEM;
+	nct6694->rx_buffer = devm_kcalloc(dev, MAX_PACKET_SZ,
+					  sizeof(unsigned char), GFP_KERNEL);
+	if (!nct6694->rx_buffer)
+		return -ENOMEM;
+	nct6694->tx_buffer = devm_kcalloc(dev, MAX_PACKET_SZ,
+					  sizeof(unsigned char), GFP_KERNEL);
+	if (!nct6694->tx_buffer)
+		return -ENOMEM;
+	nct6694->int_buffer = devm_kcalloc(dev, MAX_PACKET_SZ,
+					   sizeof(unsigned char), GFP_KERNEL);
+	if (!nct6694->int_buffer)
+		return -ENOMEM;
+
+	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!nct6694->int_in_urb) {
+		dev_err(&udev->dev, "Failed to allocate INT-in urb!\n");
+		return -ENOMEM;
+	}
+
+	/* Bulk pipe maximum packet for each transaction */
+	bulk_pipe = usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT);
+	nct6694->maxp = usb_maxpacket(udev, bulk_pipe);
+
+	mutex_init(&nct6694->access_lock);
+	nct6694->udev = udev;
+	nct6694->timeout = URB_TIMEOUT;	/* Wait until urb complete */
+
+	INIT_LIST_HEAD(&nct6694->handler_list);
+	spin_lock_init(&nct6694->lock);
+
+	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
+			 nct6694->int_buffer, maxp, usb_int_callback,
+			 nct6694, int_endpoint->bInterval);
+	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
+	if (ret)
+		goto err_urb;
+
+	dev_set_drvdata(&udev->dev, nct6694);
+	usb_set_intfdata(iface, nct6694);
+
+	ret = mfd_add_hotplug_devices(&udev->dev, nct6694_dev,
+				      ARRAY_SIZE(nct6694_dev));
+	if (ret) {
+		dev_err(&udev->dev, "Failed to add mfd's child device\n");
+		goto err_mfd;
+	}
+
+	nct6694->async_workqueue = alloc_ordered_workqueue("asyn_workqueue", 0);
+
+	dev_info(&udev->dev, "Probed device: (%04X:%04X)\n",
+		 id->idVendor, id->idProduct);
+	return 0;
+
+err_mfd:
+	usb_kill_urb(nct6694->int_in_urb);
+err_urb:
+	usb_free_urb(nct6694->int_in_urb);
+	return ret;
+}
+
+static void nct6694_usb_disconnect(struct usb_interface *iface)
+{
+	struct usb_device *udev = interface_to_usbdev(iface);
+	struct nct6694 *nct6694 = usb_get_intfdata(iface);
+
+	mfd_remove_devices(&udev->dev);
+	flush_workqueue(nct6694->async_workqueue);
+	destroy_workqueue(nct6694->async_workqueue);
+	usb_set_intfdata(iface, NULL);
+	usb_kill_urb(nct6694->int_in_urb);
+	usb_free_urb(nct6694->int_in_urb);
+}
+
+static const struct usb_device_id nct6694_ids[] = {
+	{ USB_DEVICE(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID)},
+	{},
+};
+MODULE_DEVICE_TABLE(usb, nct6694_ids);
+
+static struct usb_driver nct6694_usb_driver = {
+	.name	= DRVNAME,
+	.id_table = nct6694_ids,
+	.probe = nct6694_usb_probe,
+	.disconnect = nct6694_usb_disconnect,
+};
+
+module_usb_driver(nct6694_usb_driver);
+
+MODULE_DESCRIPTION("USB-MFD driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
new file mode 100644
index 000000000000..0797564363be
--- /dev/null
+++ b/include/linux/mfd/nct6694.h
@@ -0,0 +1,168 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Nuvoton NCT6694 USB transaction and data structure.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#ifndef __MFD_NCT6694_H
+#define __MFD_NCT6694_H
+
+#define NCT6694_DEV_GPIO		"nct6694-gpio"
+#define NCT6694_DEV_I2C			"nct6694-i2c"
+#define NCT6694_DEV_CAN			"nct6694-can"
+#define NCT6694_DEV_WDT			"nct6694-wdt"
+#define NCT6694_DEV_IIO			"nct6694-iio"
+#define NCT6694_DEV_HWMON		"nct6694-hwmon"
+#define NCT6694_DEV_PWM			"nct6694-pwm"
+#define NCT6694_DEV_RTC			"nct6694-rtc"
+
+#define NCT6694_VENDOR_ID		0x0416
+#define NCT6694_PRODUCT_ID		0x200B
+#define INT_IN_ENDPOINT			0x81
+#define BULK_IN_ENDPOINT		0x82
+#define BULK_OUT_ENDPOINT		0x03
+#define MAX_PACKET_SZ			0x100
+
+#define CMD_PACKET_SZ			0x8
+#define HCTRL_SET			0x40
+#define HCTRL_GET			0x80
+
+#define REQUEST_MOD_IDX			0x01
+#define REQUEST_CMD_IDX			0x02
+#define REQUEST_SEL_IDX			0x03
+#define REQUEST_HCTRL_IDX		0x04
+#define REQUEST_LEN_L_IDX		0x06
+#define REQUEST_LEN_H_IDX		0x07
+
+#define RESPONSE_STS_IDX		0x01
+
+#define INT_IN_IRQ_IDX			0x00
+#define GPIO_IRQ_STATUS			BIT(0)
+#define CAN_IRQ_STATUS			BIT(2)
+#define RTC_IRQ_STATUS			BIT(3)
+
+#define URB_TIMEOUT			1000
+
+/*
+ * struct nct6694 - Nuvoton NCT6694 structure
+ *
+ * @udev: Pointer to the USB device
+ * @int_in_urb: Interrupt pipe urb
+ * @access_lock: USB transaction lock
+ * @handler_list: List of registered handlers
+ * @async_workqueue: Workqueue of processing asynchronous work
+ * @tx_buffer: USB write message buffer
+ * @rx_buffer: USB read message buffer
+ * @cmd_buffer: USB send command message buffer
+ * @int_buffer: USB receive interrupt message buffer
+ * @lock: Handlers lock
+ * @timeout: URB timeout
+ * @maxp: Maximum packet of bulk pipe
+ */
+struct nct6694 {
+	struct usb_device *udev;
+	struct urb *int_in_urb;
+	struct list_head handler_list;
+	struct workqueue_struct *async_workqueue;
+
+	/* Make sure that every USB transaction is not interrupted */
+	struct mutex access_lock;
+
+	unsigned char *tx_buffer;
+	unsigned char *rx_buffer;
+	unsigned char *cmd_buffer;
+	unsigned char *int_buffer;
+
+	/* Prevent races within handlers */
+	spinlock_t lock;
+
+	/* time in msec to wait for the urb to the complete */
+	long timeout;
+
+	/* Bulk pipe maximum packet for each transaction */
+	int maxp;
+};
+
+/*
+ * struct nct6694_handler_entry - Stores the interrupt handling information
+ * for each registered peripheral
+ *
+ * @irq_bit: The bit in irq_status[INT_IN_IRQ_IDX] representing interrupt
+ * @handler: Function pointer to the interrupt handler of the peripheral
+ * @private_data: Private data specific to the peripheral driver
+ * @list: Node used to link to the handler_list
+ */
+struct nct6694_handler_entry {
+	int irq_bit;
+	void (*handler)(void *private_data);
+	void *private_data;
+	struct list_head list;
+};
+
+/*
+ * nct6694_register_handler - Register a handler with private data for
+ * interrupt pipe irq event
+ *
+ * @nct6694 - Nuvoton NCT6694 structure
+ * @irq_bit - The irq for which to register a handler
+ * @handler - The handler function
+ * @private_data - Private data for which to register a handler
+ *
+ * This function is called when peripherals need to register a handler
+ * for receiving interrupt pipe.
+ *
+ * Don't use the wait_for_completion function in handler function, as
+ * it is in interrupt context.
+ */
+int nct6694_register_handler(struct nct6694 *nct6694, int irq_bit,
+			     void (*handler)(void *),
+			     void *private_data);
+
+/*
+ * nct6694_read_msg - Receive data from NCT6694 USB device
+ *
+ * @nct6694 - Nuvoton NCT6694 structure
+ * @mod - Module byte
+ * @offset - Offset byte or (Select byte | Command byte)
+ * @length - Length byte
+ * @rd_idx - Read data from rx buffer at index
+ * @rd_len - Read length from rx buffer
+ * @buf - Read data from rx buffer
+ *
+ * USB Transaction format:
+ *
+ *	OUT	|RSV|MOD|CMD|SEL|HCTL|RSV|LEN_L|LEN_H|
+ *	OUT	|SEQ|STS|RSV|RSV|RSV|RSV||LEN_L|LEN_H|
+ *	IN	|-------D------A------D------A-------|
+ *	IN			......
+ *	IN	|-------D------A------D------A-------|
+ */
+int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
+		     u16 length, u8 rd_idx, u8 rd_len,
+		     unsigned char *buf);
+
+/*
+ * nct6694_read_msg - Transmit data to NCT6694 USB device
+ *
+ * @nct6694 - Nuvoton NCT6694 structure
+ * @mod - Module byte
+ * @offset - Offset byte or (Select byte | Command byte)
+ * @length - Length byte
+ * @buf - Write data to tx buffer
+ *
+ * USB Transaction format:
+ *
+ *	OUT	|RSV|MOD|CMD|SEL|HCTL|RSV|LEN_L|LEN_H|
+ *	OUT	|-------D------A------D------A-------|
+ *	OUT			......
+ *	OUT	|-------D------A------D------A-------|
+ *	IN	|SEQ|STS|RSV|RSV|RSV|RSV||LEN_L|LEN_H|
+ *	IN	|-------D------A------D------A-------|
+ *	IN			......
+ *	IN	|-------D------A------D------A-------|
+ */
+int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
+		      u16 length, unsigned char *buf);
+
+#endif
-- 
2.34.1


