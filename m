Return-Path: <linux-i2c+bounces-11647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C1DAEB49B
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DD951C24CA2
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033DB29C32B;
	Fri, 27 Jun 2025 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gd2XuPiX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8DD29AB10;
	Fri, 27 Jun 2025 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020068; cv=none; b=GGy34lZN291fasYbjyLJO9qfx2A5EI7ADAHft8YrYBfXvc5cN4M5H5a8Ve2wPKCkTToNJBNf52doL+pPlh212WIo06R/U9+mG8xL1lTMp6hR1F3yLcrPwc+O+cKglnTMTe3XwLpkYCU0Ra3Gh61r43kk8qrnvvGqQGm/uAhI5/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020068; c=relaxed/simple;
	bh=ammhx/RdvLImFhEmfnejIz9lycBKpLK6IqI47QaUSug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K15IWJAfaL07W8kVDGfyh5Ggub7nRwNgPmjR3KR925oruDoqW2eALTb0v8UaM3hllysDKpHrfISlWJa1ZLT+59uD1Ik3Qd/f/7uaZWpvfM9J1U6psIOiyGARRjl9G5q+s8JX7ROSPCcZeG9fbmGOpfnF5BHsYRoWrELuuu6N96k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gd2XuPiX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-237e6963f63so14048315ad.2;
        Fri, 27 Jun 2025 03:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751020066; x=1751624866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdTvpLSu6qNhSTn9JejQrb8oOm5d9cvM2j7OxAaNd0E=;
        b=Gd2XuPiXoWZ2iWFlxYlvxG0LYWD6+8CId6Aus/oxH/JFlfjMZ+5FiULVOA7PIbFbXO
         TSkGzPZSsYC81puzx3Pe/XWIJyNtz0Ls/uOs2vJJT9/tUgsZw5CoB4nurCClUMtZEEHG
         IPWwXm9eaXNDJG9e3KdHXA4Q0+alEiXxYZeeiTwPYjC4n2Pi+FYN99oyFYwUlv2PVM1m
         0AWj+k8sSS1Qtoi8/8W713YVqeyxah3agQWFe2n6UGxVvOW/FytNN/8xHPazKpuHgPyx
         zxsrLWlF7DYt4umNHWCzNGp/agKTuLkPyPHyIr6cIf2Dulm0W6PhNm73ov9oxuAOo2nx
         9Wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751020066; x=1751624866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdTvpLSu6qNhSTn9JejQrb8oOm5d9cvM2j7OxAaNd0E=;
        b=M8YTs0aor+vycUbUJ1pVrXNqW24ZviIcIM5q6LPgBfgbusWrzkdJUNLrLbtqUxnOnU
         FNNzI6aOxsOhkk7mhIyJQF3vjh7vcng+y0A2NUklWEG9OaB1sRPkNQLAZm7SGwN4ILBg
         XgFVbW99vN+qm0biaHiL3oQ6zxnwB/LS3qpC92V05wWYp6PCZXuyGO+0i6TqvICWWs0S
         NK0Rt/RNv2u/L1mUntulDTypOFSh9nzYoMoMEyMzvcpa/gU49pLE98jP7uF2zU2hU9NO
         o8wzeeF9zk221pInHgRegLYvgbKV39hfnKCJ53YYEncyxErYqApfOpNtr0xqGONhvbd9
         DjBA==
X-Forwarded-Encrypted: i=1; AJvYcCVBoPz0Ff2HZgfyAfeJpnsKEV80BuwjTH9sRtaNWVK0d/DjBmsZKqPkbclFOR7BYUeuk3F9Sl97J4+G@vger.kernel.org, AJvYcCVGVvMoBwjunDKhsGNtL+oUqeMU355QmG3kWt/NB1BoT74mdqu2El/n6C41t8c1g/PrHBtdSCgIJoTf@vger.kernel.org, AJvYcCVQ3OCFI9DKf/lkeX9i5+Eosg6Ii1BXdbY7MNWD7uX8GB7r1UzHsaFyNwat/K/gk4uDJWYKHgSUHIgCQw==@vger.kernel.org, AJvYcCVRrKPeBc/ggb8+D2Nh1rjAC/I5fZHhrBxJfou7l0cRkJnIJZv1jLeQf1iyEnIp51Ii8GYE5Tgl/Snus7zxKbg=@vger.kernel.org, AJvYcCWKD1i7t/wZz215Jbr28k7DcYYhSwH2W6V1v6kAsI4k2dAD7qMV/22aHhxhmG3aPqEqnUoGaYnO@vger.kernel.org, AJvYcCWTH0+TAmaZvG0BnnWL7li0Ye/ruJTLCQFNgA7CvVw7S9cMKxbKoB9WovWzdaHKWDiN/dAXDvXBQVs=@vger.kernel.org, AJvYcCWX5wT3aCDpzIs7fpva8vx3+nYn4h8I6bB3kQdlZFP/laWN2+TXEhLMNQhSz5bZrCc2619KOsQEPfhry8U=@vger.kernel.org, AJvYcCXqHAtPlfEO1+WsWPRpPvuNjO5dgNH/QHzwW07FOXtZ74d2VVdmBdxy55GWe5bImYOvjDX14gEWBx3q@vger.kernel.org
X-Gm-Message-State: AOJu0YxclYYC0snNIgzUMTZaHT0AOmyhtGDhQiv5bmCn3hJMQdlySLba
	cIpIKTOu8LMdHxIvY424aiykivT1vNhjMiIrkuxoIxjP9PeLJseEgxPw
X-Gm-Gg: ASbGncs9KJuf0k8NwbKyOdzRkc6Zd6gAKPt2jGJO70dfL/TxDGc5jAPrT0WUU4ZEY5m
	i0uTW5OFIg8qDJ3FVqepDnxtxa/hBMCH/W7mC9bH1/wzlvN2xzeItfHGgSHrKQxh459Hx0jrzvk
	uf73S4O6hYR1vCv7qT1x3dv6J6BCwW+io9LQtwlD20NcRAWn6bKcOeG+xAB5pWMynOy2e1Wlo8y
	Ch9WfTrFqn/L116EJC931kuCPberk1+jJR0DW+J8CKWIeFCwuFCQ/63OdJ3ExN7UGF6msM8rzlO
	9GU7BMWjyzzmUC0eiO+W8EiKAND5IRar6+DmmEgt9zOgBjdvkZpOfyKBavKtngQedrhVT0Yk4E5
	h/KBV/4nFq2O7rXZ+ewH/IVHUIqhkJg==
X-Google-Smtp-Source: AGHT+IEfPv7Pmk5WcvpWADemXaPMi2KF4zg07Njw/i8cPFEtdV6dCtTosDuA92fpVz5ZhLHfrMPafw==
X-Received: by 2002:a17:902:da2d:b0:235:e942:cb9e with SMTP id d9443c01a7336-23ac3dec1f0mr39156205ad.9.1751020065537;
        Fri, 27 Jun 2025 03:27:45 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bc495sm13845155ad.201.2025.06.27.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:27:45 -0700 (PDT)
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
Subject: [PATCH v13 1/7] mfd: Add core driver for Nuvoton NCT6694
Date: Fri, 27 Jun 2025 18:27:24 +0800
Message-Id: <20250627102730.71222-2-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627102730.71222-1-a0282524688@gmail.com>
References: <20250627102730.71222-1-a0282524688@gmail.com>
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
 drivers/mfd/nct6694.c       | 390 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h | 102 ++++++++++
 5 files changed, 515 insertions(+)
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 include/linux/mfd/nct6694.h

diff --git a/MAINTAINERS b/MAINTAINERS
index efb51ee92683..180dd7f10b43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17789,6 +17789,12 @@ F:	drivers/nubus/
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
index 6fb3768e3d71..f8e68304767c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1078,6 +1078,21 @@ config MFD_MENF21BMC
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
index 79495f9f3457..96f3b4c38f5e 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -120,6 +120,8 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
 obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
 obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
+
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
 
 ocelot-soc-objs			:= ocelot-core.o ocelot-spi.o
diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
new file mode 100644
index 000000000000..709417a7f975
--- /dev/null
+++ b/drivers/mfd/nct6694.c
@@ -0,0 +1,390 @@
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
+	unsigned long flags;
+
+	spin_lock_irqsave(&nct6694->irq_lock, flags);
+	nct6694->irq_enable |= BIT(hwirq);
+	spin_unlock_irqrestore(&nct6694->irq_lock, flags);
+}
+
+static void nct6694_irq_disable(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+	unsigned long flags;
+
+	spin_lock_irqsave(&nct6694->irq_lock, flags);
+	nct6694->irq_enable &= ~BIT(hwirq);
+	spin_unlock_irqrestore(&nct6694->irq_lock, flags);
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


