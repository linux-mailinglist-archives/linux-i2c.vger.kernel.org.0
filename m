Return-Path: <linux-i2c+bounces-12906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E2B54724
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 11:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6A8B4E1A9B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 09:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081F8286D61;
	Fri, 12 Sep 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckUyL+GF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9069284B4E
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668821; cv=none; b=d85vYso8q7PxxVN0kABAXnmoPGsGop1mE96jT9bxY0q6wkQQdapuO+ycFtdSz9fY16giTK+5S/XHuRjPrlSi/4vRNpzNWtcNnweduNF8BMpDhnfkXKALR2LcUfUSFPIqJdbB6L175ugz8DjjG7HJMsZd66JzSlqlbx+SpnCXft4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668821; c=relaxed/simple;
	bh=dgui9ocAeQl1PNBq2/0l7IXqINwZNCVFSRgvIQF8sCg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HErFZ/Bor6vfkDfciAiiS2iw4sd8qZ2+x7Va9zftzKo8qAEgUre3aqULchOVEQuaT7wAYpNoZRt25MTUUDqOm02FaNWswRNUww/x6alJSKa//wsK4hwbhMClf3BtCGRxhFI7X2msgJyJpt9SeZohrvAUpT3f2BhQtKa0WrCk77g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckUyL+GF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso1567928b3a.2
        for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 02:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757668818; x=1758273618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq5VYuAITOtXktN+f5HwZ1WMHG5yiGZ+4hzOVfqoO3U=;
        b=ckUyL+GFl2gony2YxF3R7+a6BOOm2iy675UR1oSZniqt9xKERkmqArkD72zu3donh9
         4XJZ8F0nWUAXJT2rhCVlxJQLWsyOPxPCOaMZEIIIAWKiRxxls5bqv1XQagxhXvf1WHpn
         +2uxvsQ20XD+jtUh8ACgt3wkop3gjdKxbKpHxHv1C6xI76XQXEPFlAonwq6810eSnux7
         IRtDlLLj+e1aLqOQSmUMGknn+J0zXi70OssD9EPxZf97QYvM9ZvowJ0HUvny0XSz69By
         5tBiN9KlsXxexVlID0e2Ljvqmh8bP5k/cPc68MummuKTcSYrTqSmistlmcCDcWIJ1OH+
         xwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668818; x=1758273618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq5VYuAITOtXktN+f5HwZ1WMHG5yiGZ+4hzOVfqoO3U=;
        b=JIOwRDrbTD04rXphelHplgbhvY6wT6xPjAfvS4e9J0ZW04qeuBfe8EW6/qFwTy2uS0
         AYh627jRMlkyFWVLaKUbRjtPvbneNI9F0A9WHhKqS8ojdwywWTfIXc9+znRbklm+X4Ka
         DSlGPpifyaqV8YcCoY4p8vSm3mgMi5c/j+I2lSZyogKQttV08Bd0PcLi/Fy1O4TN0b7T
         OiZZRVOYaLZVXFg8ZRqRdg7niXeG/dy37gbYangAqqE/kkRrOIzRoyT5U5WPiGBtqH5K
         mrQXK3zUM1cMZoyKO8J+6IrJNKqjVKHCXH+G4LeXg8n09zypHhSz4JCAghKgx+Nwgid+
         i9ug==
X-Forwarded-Encrypted: i=1; AJvYcCUO0wS9pMWpBhbFFr/imrUQJYVe9dHKg5pMTe01aiVt5a4/+mjinF9pFM/XlW6q2m5UrgAERCQ8Dog=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8pJL7jyKjTjNT04x3cWC8UAdnTBYJR42qAXj39atleyYbcymF
	5QF48eTEhviwEXBWbonhMW3PL03GMuGPmcgPgcjvc2+2lMGgLM8CIohu
X-Gm-Gg: ASbGncvLxyslTnbv25ch7ukga1kr6IbqtmQEruf+UE1EW0vFTGMLQO/j6UMBjEnYgJS
	quirYMn5S4fcHA44fE+v317uteO7NJvQ7wpweuqV9E8eprcJobiQqGk49qHiPe4Me5x2ve1bMYr
	XA7jjPCC8LhHbXjxFN9sGUO/ptmjxtka2B7/nuXvWK99DVYdnLbPhI+WbDiroTQ6G/9bPMXtj7x
	qNDQiR4Hi+9dpmXb10kxS7WsunEuclppmOftY0h8CDJArrGDxcnlsHU6UzEkskIOTadZftLMs62
	EqeaxPE4AQUN7g1Vg8O2MHczcZQBpFhp3Qj+Iac3ZIbDk4MYqyqNtyfv++55Vvx2heOHw620dPx
	sdJQ+ehEUe3Ue3/ozXihPKjhFvpjvapCWm1bma/PTmvHO4S46Eev+t4KqrkJGppXdCQ==
X-Google-Smtp-Source: AGHT+IHLhOCDaGvlnpKvroeQKTgKbKcYyC8+hFKkE9C1thsroVKwZhVQQRQ2v2WnSpQJLu+giGedyg==
X-Received: by 2002:a05:6a20:430d:b0:250:f80d:b334 with SMTP id adf61e73a8af0-26027c13362mr3127083637.0.1757668818116;
        Fri, 12 Sep 2025 02:20:18 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a36dc461sm4066564a12.23.2025.09.12.02.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:20:17 -0700 (PDT)
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
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH RESEND v14 1/7] mfd: Add core driver for Nuvoton NCT6694
Date: Fri, 12 Sep 2025 17:19:46 +0800
Message-Id: <20250912091952.1169369-2-a0282524688@gmail.com>
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

The Nuvoton NCT6694 provides an USB interface to the host to
access its features.

Sub-devices can use the USB functions nct6694_read_msg() and
nct6694_write_msg() to issue a command. They can also request
interrupt that will be called when the USB device receives its
interrupt pipe.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes since version 13:
- Update to guard(spinlock_irqsave)() in nct6694.c

Changes since version 12:
- Implement IDA in MFD driver to handle per-device IDs
- Use spinlock to replace irq mutex lock
- Use same email address in the signature

Changes since version 11:
- Modify the irq_domain_add_simple() to irq_domain_create_simple()
- Fix mfd_cell back to v9, and use Use platform_device's id to replace IDA
  in sub-drivers

Changes since version 10:
- Add change log for the patch
- Fix mfd_cell to MFD_CELL_NAME()
- Remove unnecessary blank line

Changes since version 9:
- Add KernelDoc to exported functions

Changes since version 8:
- Modify the signed-off-by with my work address
- Rename all MFD cell names to "nct6694-xxx"
- Fix some comments in nct6694.c and in nct6694.h

Changes since version 7:
- Add error handling for devm_mutex_init()

Changes since version 6:

Changes since version 5:
- Fix mfd_cell to MFD_CELL_NAME() and MFD_CELL_BASIC()
- Drop unnecessary macros

Changes since version 4:
- Modify arguments in read/write function to a pointer to cmd_header

Changes since version 3:
- Modify array buffer to structure
- Fix defines and comments
- Add header <linux/bits.h> and use BIT macro
- Modify mutex_init() to devm_mutex_init()

Changes since version 2:

Changes since version 1:
- Implement IRQ domain to handle IRQ demux
- Modify USB_DEVICE to USB_DEVICE_AND_INTERFACE_INFO API
- Add command structure
- Fix USB functions
- Sort each driver's header files alphabetically

 MAINTAINERS                 |   6 +
 drivers/mfd/Kconfig         |  15 ++
 drivers/mfd/Makefile        |   2 +
 drivers/mfd/nct6694.c       | 388 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h | 102 ++++++++++
 5 files changed, 513 insertions(+)
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 include/linux/mfd/nct6694.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..a8a05872d077 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18082,6 +18082,12 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON NCT6694 MFD DRIVER
+M:	Ming Yu <tmyu0@nuvoton.com>
+S:	Supported
+F:	drivers/mfd/nct6694.c
+F:	include/linux/mfd/nct6694.h
+
 NUVOTON NCT7201 IIO DRIVER
 M:	Eason Yang <j2anfernee@gmail.com>
 L:	linux-iio@vger.kernel.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 425c5fba6cb1..f3d157776e93 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1134,6 +1134,21 @@ config MFD_MENF21BMC
 	  This driver can also be built as a module. If so the module
 	  will be called menf21bmc.
 
+config MFD_NCT6694
+	tristate "Nuvoton NCT6694 support"
+	select MFD_CORE
+	depends on USB
+	help
+	  This enables support for the Nuvoton USB device NCT6694, which shares
+	  peripherals.
+	  The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
+	  6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
+	  PWM, and RTC.
+	  This driver provides core APIs to access the NCT6694 hardware
+	  monitoring and control features.
+	  Additional drivers must be enabled to utilize the specific
+	  functionalities of the device.
+
 config MFD_OCELOT
 	tristate "Microsemi Ocelot External Control Support"
 	depends on SPI_MASTER
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index f7bdedd5a66d..1e7738c02b2c 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -121,6 +121,8 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
 obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
 obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
+
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
 
 ocelot-soc-objs			:= ocelot-core.o ocelot-spi.o
diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
new file mode 100644
index 000000000000..308b2fda3055
--- /dev/null
+++ b/drivers/mfd/nct6694.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ *
+ * Nuvoton NCT6694 core driver using USB interface to provide
+ * access to the NCT6694 hardware monitoring and control features.
+ *
+ * The NCT6694 is an integrated controller that provides GPIO, I2C,
+ * CAN, WDT, HWMON and RTC management.
+ */
+
+#include <linux/bits.h>
+#include <linux/interrupt.h>
+#include <linux/idr.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/usb.h>
+
+static const struct mfd_cell nct6694_devs[] = {
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+
+	MFD_CELL_NAME("nct6694-i2c"),
+	MFD_CELL_NAME("nct6694-i2c"),
+	MFD_CELL_NAME("nct6694-i2c"),
+	MFD_CELL_NAME("nct6694-i2c"),
+	MFD_CELL_NAME("nct6694-i2c"),
+	MFD_CELL_NAME("nct6694-i2c"),
+
+	MFD_CELL_NAME("nct6694-canfd"),
+	MFD_CELL_NAME("nct6694-canfd"),
+
+	MFD_CELL_NAME("nct6694-wdt"),
+	MFD_CELL_NAME("nct6694-wdt"),
+
+	MFD_CELL_NAME("nct6694-hwmon"),
+
+	MFD_CELL_NAME("nct6694-rtc"),
+};
+
+static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char err_status)
+{
+	switch (err_status) {
+	case NCT6694_NO_ERROR:
+		return 0;
+	case NCT6694_NOT_SUPPORT_ERROR:
+		dev_err(nct6694->dev, "Command is not supported!\n");
+		break;
+	case NCT6694_NO_RESPONSE_ERROR:
+		dev_warn(nct6694->dev, "Command received no response!\n");
+		break;
+	case NCT6694_TIMEOUT_ERROR:
+		dev_warn(nct6694->dev, "Command timed out!\n");
+		break;
+	case NCT6694_PENDING:
+		dev_err(nct6694->dev, "Command is pending!\n");
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return -EIO;
+}
+
+/**
+ * nct6694_read_msg() - Read message from NCT6694 device
+ * @nct6694: NCT6694 device pointer
+ * @cmd_hd: command header structure
+ * @buf: buffer to store the response data
+ *
+ * Sends a command to the NCT6694 device and reads the response.
+ * The command header is specified in @cmd_hd, and the response
+ * data is stored in @buf.
+ *
+ * Return: Negative value on error or 0 on success.
+ */
+int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
+{
+	union nct6694_usb_msg *msg = nct6694->usb_msg;
+	struct usb_device *udev = nct6694->udev;
+	int tx_len, rx_len, ret;
+
+	guard(mutex)(&nct6694->access_lock);
+
+	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
+	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
+
+	/* Send command packet to USB device */
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
+			   sizeof(*msg), &tx_len, NCT6694_URB_TIMEOUT);
+	if (ret)
+		return ret;
+
+	/* Receive response packet from USB device */
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), &msg->response_header,
+			   sizeof(*msg), &rx_len, NCT6694_URB_TIMEOUT);
+	if (ret)
+		return ret;
+
+	/* Receive data packet from USB device */
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
+			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
+	if (ret)
+		return ret;
+
+	if (rx_len != le16_to_cpu(cmd_hd->len)) {
+		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
+			le16_to_cpu(cmd_hd->len), rx_len);
+		return -EIO;
+	}
+
+	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
+}
+EXPORT_SYMBOL_GPL(nct6694_read_msg);
+
+/**
+ * nct6694_write_msg() - Write message to NCT6694 device
+ * @nct6694: NCT6694 device pointer
+ * @cmd_hd: command header structure
+ * @buf: buffer containing the data to be sent
+ *
+ * Sends a command to the NCT6694 device and writes the data
+ * from @buf. The command header is specified in @cmd_hd.
+ *
+ * Return: Negative value on error or 0 on success.
+ */
+int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
+{
+	union nct6694_usb_msg *msg = nct6694->usb_msg;
+	struct usb_device *udev = nct6694->udev;
+	int tx_len, rx_len, ret;
+
+	guard(mutex)(&nct6694->access_lock);
+
+	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
+	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
+
+	/* Send command packet to USB device */
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
+			   sizeof(*msg), &tx_len, NCT6694_URB_TIMEOUT);
+	if (ret)
+		return ret;
+
+	/* Send data packet to USB device */
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), buf,
+			   le16_to_cpu(cmd_hd->len), &tx_len, NCT6694_URB_TIMEOUT);
+	if (ret)
+		return ret;
+
+	/* Receive response packet from USB device */
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), &msg->response_header,
+			   sizeof(*msg), &rx_len, NCT6694_URB_TIMEOUT);
+	if (ret)
+		return ret;
+
+	/* Receive data packet from USB device */
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
+			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
+	if (ret)
+		return ret;
+
+	if (rx_len != le16_to_cpu(cmd_hd->len)) {
+		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
+			le16_to_cpu(cmd_hd->len), rx_len);
+		return -EIO;
+	}
+
+	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
+}
+EXPORT_SYMBOL_GPL(nct6694_write_msg);
+
+static void usb_int_callback(struct urb *urb)
+{
+	struct nct6694 *nct6694 = urb->context;
+	__le32 *status_le = urb->transfer_buffer;
+	u32 int_status;
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
+	int_status = le32_to_cpu(*status_le);
+
+	while (int_status) {
+		int irq = __ffs(int_status);
+
+		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+		int_status &= ~BIT(irq);
+	}
+
+resubmit:
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret)
+		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
+}
+
+static void nct6694_irq_enable(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	guard(spinlock_irqsave)(&nct6694->irq_lock);
+
+	nct6694->irq_enable |= BIT(hwirq);
+}
+
+static void nct6694_irq_disable(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	guard(spinlock_irqsave)(&nct6694->irq_lock);
+
+	nct6694->irq_enable &= ~BIT(hwirq);
+}
+
+static const struct irq_chip nct6694_irq_chip = {
+	.name = "nct6694-irq",
+	.flags = IRQCHIP_SKIP_SET_WAKE,
+	.irq_enable = nct6694_irq_enable,
+	.irq_disable = nct6694_irq_disable,
+};
+
+static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
+{
+	struct nct6694 *nct6694 = d->host_data;
+
+	irq_set_chip_data(irq, nct6694);
+	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
+
+	return 0;
+}
+
+static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
+{
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
+}
+
+static const struct irq_domain_ops nct6694_irq_domain_ops = {
+	.map	= nct6694_irq_domain_map,
+	.unmap	= nct6694_irq_domain_unmap,
+};
+
+static int nct6694_usb_probe(struct usb_interface *iface,
+			     const struct usb_device_id *id)
+{
+	struct usb_device *udev = interface_to_usbdev(iface);
+	struct usb_endpoint_descriptor *int_endpoint;
+	struct usb_host_interface *interface;
+	struct device *dev = &iface->dev;
+	struct nct6694 *nct6694;
+	int ret;
+
+	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
+	if (!nct6694)
+		return -ENOMEM;
+
+	nct6694->usb_msg = devm_kzalloc(dev, sizeof(union nct6694_usb_msg), GFP_KERNEL);
+	if (!nct6694->usb_msg)
+		return -ENOMEM;
+
+	nct6694->int_buffer = devm_kzalloc(dev, sizeof(*nct6694->int_buffer), GFP_KERNEL);
+	if (!nct6694->int_buffer)
+		return -ENOMEM;
+
+	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!nct6694->int_in_urb)
+		return -ENOMEM;
+
+	nct6694->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
+						   &nct6694_irq_domain_ops,
+						   nct6694);
+	if (!nct6694->domain) {
+		ret = -ENODEV;
+		goto err_urb;
+	}
+
+	nct6694->dev = dev;
+	nct6694->udev = udev;
+
+	ida_init(&nct6694->gpio_ida);
+	ida_init(&nct6694->i2c_ida);
+	ida_init(&nct6694->canfd_ida);
+	ida_init(&nct6694->wdt_ida);
+
+	spin_lock_init(&nct6694->irq_lock);
+
+	ret = devm_mutex_init(dev, &nct6694->access_lock);
+	if (ret)
+		goto err_ida;
+
+	interface = iface->cur_altsetting;
+
+	int_endpoint = &interface->endpoint[0].desc;
+	if (!usb_endpoint_is_int_in(int_endpoint)) {
+		ret = -ENODEV;
+		goto err_ida;
+	}
+
+	usb_fill_int_urb(nct6694->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
+			 nct6694->int_buffer, sizeof(*nct6694->int_buffer), usb_int_callback,
+			 nct6694, int_endpoint->bInterval);
+
+	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
+	if (ret)
+		goto err_ida;
+
+	usb_set_intfdata(iface, nct6694);
+
+	ret = mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
+	if (ret)
+		goto err_mfd;
+
+	return 0;
+
+err_mfd:
+	usb_kill_urb(nct6694->int_in_urb);
+err_ida:
+	ida_destroy(&nct6694->wdt_ida);
+	ida_destroy(&nct6694->canfd_ida);
+	ida_destroy(&nct6694->i2c_ida);
+	ida_destroy(&nct6694->gpio_ida);
+	irq_domain_remove(nct6694->domain);
+err_urb:
+	usb_free_urb(nct6694->int_in_urb);
+	return ret;
+}
+
+static void nct6694_usb_disconnect(struct usb_interface *iface)
+{
+	struct nct6694 *nct6694 = usb_get_intfdata(iface);
+
+	mfd_remove_devices(nct6694->dev);
+	usb_kill_urb(nct6694->int_in_urb);
+	ida_destroy(&nct6694->wdt_ida);
+	ida_destroy(&nct6694->canfd_ida);
+	ida_destroy(&nct6694->i2c_ida);
+	ida_destroy(&nct6694->gpio_ida);
+	irq_domain_remove(nct6694->domain);
+	usb_free_urb(nct6694->int_in_urb);
+}
+
+static const struct usb_device_id nct6694_ids[] = {
+	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID, 0xFF, 0x00, 0x00) },
+	{ }
+};
+MODULE_DEVICE_TABLE(usb, nct6694_ids);
+
+static struct usb_driver nct6694_usb_driver = {
+	.name		= "nct6694",
+	.id_table	= nct6694_ids,
+	.probe		= nct6694_usb_probe,
+	.disconnect	= nct6694_usb_disconnect,
+};
+module_usb_driver(nct6694_usb_driver);
+
+MODULE_DESCRIPTION("Nuvoton NCT6694 core driver");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
new file mode 100644
index 000000000000..6eb9be2cd4a0
--- /dev/null
+++ b/include/linux/mfd/nct6694.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ *
+ * Nuvoton NCT6694 USB transaction and data structure.
+ */
+
+#ifndef __MFD_NCT6694_H
+#define __MFD_NCT6694_H
+
+#define NCT6694_VENDOR_ID	0x0416
+#define NCT6694_PRODUCT_ID	0x200B
+#define NCT6694_INT_IN_EP	0x81
+#define NCT6694_BULK_IN_EP	0x02
+#define NCT6694_BULK_OUT_EP	0x03
+
+#define NCT6694_HCTRL_SET	0x40
+#define NCT6694_HCTRL_GET	0x80
+
+#define NCT6694_URB_TIMEOUT	1000
+
+enum nct6694_irq_id {
+	NCT6694_IRQ_GPIO0 = 0,
+	NCT6694_IRQ_GPIO1,
+	NCT6694_IRQ_GPIO2,
+	NCT6694_IRQ_GPIO3,
+	NCT6694_IRQ_GPIO4,
+	NCT6694_IRQ_GPIO5,
+	NCT6694_IRQ_GPIO6,
+	NCT6694_IRQ_GPIO7,
+	NCT6694_IRQ_GPIO8,
+	NCT6694_IRQ_GPIO9,
+	NCT6694_IRQ_GPIOA,
+	NCT6694_IRQ_GPIOB,
+	NCT6694_IRQ_GPIOC,
+	NCT6694_IRQ_GPIOD,
+	NCT6694_IRQ_GPIOE,
+	NCT6694_IRQ_GPIOF,
+	NCT6694_IRQ_CAN0,
+	NCT6694_IRQ_CAN1,
+	NCT6694_IRQ_RTC,
+	NCT6694_NR_IRQS,
+};
+
+enum nct6694_response_err_status {
+	NCT6694_NO_ERROR = 0,
+	NCT6694_FORMAT_ERROR,
+	NCT6694_RESERVED1,
+	NCT6694_RESERVED2,
+	NCT6694_NOT_SUPPORT_ERROR,
+	NCT6694_NO_RESPONSE_ERROR,
+	NCT6694_TIMEOUT_ERROR,
+	NCT6694_PENDING,
+};
+
+struct __packed nct6694_cmd_header {
+	u8 rsv1;
+	u8 mod;
+	union __packed {
+		__le16 offset;
+		struct __packed {
+			u8 cmd;
+			u8 sel;
+		};
+	};
+	u8 hctrl;
+	u8 rsv2;
+	__le16 len;
+};
+
+struct __packed nct6694_response_header {
+	u8 sequence_id;
+	u8 sts;
+	u8 reserved[4];
+	__le16 len;
+};
+
+union __packed nct6694_usb_msg {
+	struct nct6694_cmd_header cmd_header;
+	struct nct6694_response_header response_header;
+};
+
+struct nct6694 {
+	struct device *dev;
+	struct ida gpio_ida;
+	struct ida i2c_ida;
+	struct ida canfd_ida;
+	struct ida wdt_ida;
+	struct irq_domain *domain;
+	struct mutex access_lock;
+	spinlock_t irq_lock;
+	struct urb *int_in_urb;
+	struct usb_device *udev;
+	union nct6694_usb_msg *usb_msg;
+	__le32 *int_buffer;
+	unsigned int irq_enable;
+};
+
+int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
+int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
+
+#endif
-- 
2.34.1


