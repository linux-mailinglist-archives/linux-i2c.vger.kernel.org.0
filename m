Return-Path: <linux-i2c+bounces-9154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C88A1A06E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2025 10:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AE753AD360
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2025 09:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0645320D510;
	Thu, 23 Jan 2025 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxu0l5aQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC2A20D4F0;
	Thu, 23 Jan 2025 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737623509; cv=none; b=dVoNFzFhMEOMQAtgBbBWPMCrQk2XzISywdxAIFvTZUOyjMeI1dfbx+XxTMyd/bZ6+fZk12hkKvxIrP3DWNIJMt8RsKzZ45yR9rx1CBzXxnA+nPuT0mTFBy3nZjnejfoJqY85Eu2fcokmh0Xtzb9mzYzKij5TUtP1sbFGPF2aBcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737623509; c=relaxed/simple;
	bh=9dMbwEELvg1Nzk4kTa0Abnp63pz1wWV1OyZ0++gBQWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DNeyRMFMD/f+V/re0lorgexnqlhr+5yQuYAuBIYnChdyjtggsQf13G4bQxIM0fXVPfOLbthb65R/gQW55E4kHpEeb2W49uQyJX2XekVDwajHVSihcNSnJAoiM9fYMKpO2b9wwHj4c36dKucl8us8OUZIY/MB2ntvcCZLdSKGiUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxu0l5aQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21669fd5c7cso10192145ad.3;
        Thu, 23 Jan 2025 01:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737623507; x=1738228307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LZhC/Nq6tkL6rSWU3Cc5Igc2HJeYHdljQG7EtiOxcg=;
        b=cxu0l5aQLNqJcjeq+S7myV/6PIG24N4bxfCzzxK4O3bWtfNoQuaTjCDfQXYFJbVu1o
         AULYTXtw5autHauarWQ0TqmDqyjyQ7di5q1GU29MkFe6h4mW4CrGyfqFfDPWwq97DyeS
         yt8UHYnWIDEMaloyhXxUJWNdi5a2IfmL8/wEIhAMqRBRnPvyQLL08M3A49KlV8bbRC2w
         VgMbidv3tLk20QVW+uTO+qsmnYD/jb9vKuftij1zNugxkQTNQQb8NI3p4EFxV8ag9oIP
         TYhFXJw0B1z8X5eRLImq8DIFeIXiwDW/lAGxVMbtfkm70Z5HRl6szy7Fpxa/hGfitpyl
         Rq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623507; x=1738228307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LZhC/Nq6tkL6rSWU3Cc5Igc2HJeYHdljQG7EtiOxcg=;
        b=TfVI/jU+sN3qrYtALAoCbOXnnNQ/7KWDVsbQJ8wd1LE24pVpaa0BqsdxFYoqWSxgbB
         5N4US46JgMfHKdN5Ip9JxhSojacZVo7S9Kx4GnV65SYDyEP8dh3I441yjrqLel32lxt7
         ssLt7DqeW8jGno4YCPzA/13VWshWGXJr8/nm4bH12OUktToQHubhUEHksgWB8Nafg9eT
         yljO5sVsHzGnQHWx6DVmk21aAXs1pZVRKhMxCIK0zaEpqcixjGFV4Aa9nmZlL/RjHME7
         OxekA+FWa6pKtGtatK3Uo/S3T0hsAaCGU0Lk1sCV0uoGlRPfDeEGimt32h1LCiWLW5QY
         bCVA==
X-Forwarded-Encrypted: i=1; AJvYcCVmJJNP11TxO+0o3DahQtFnpfYn8xiODB2QQCZTlkr9703W6RkuR/enFSU/f1UGK3rWaoYfNHBt+sM=@vger.kernel.org, AJvYcCVmxycg03p7SfuUFccsWZr7M+GEBAzM7bp0DgVhyxcpWixXALEwrr3p6Xc7Ja6DOehjAZQVL/eW0titcnY=@vger.kernel.org, AJvYcCWCwiVLVOqbylotl2UQTC2XKI5tKLmlZ5SHeVwFDdIZk/kOXu2wix0L7wnzHNH33um8gfjeNWY1@vger.kernel.org, AJvYcCWHBBosLZ6oPpblWsYmVMMzosAOyZgecc34VDAquVaQnXM6kK4c/PRauKkJTpHrZB8L9dKh/+/4gaEVZnlle38=@vger.kernel.org, AJvYcCWLUZnojpD2ZeMDZICrqlzKLMZzqOX6LxNxVbetKWCqxBZ9PRUBj0dl8GnWX2qDqnlsSXGzrCJ3K+dd@vger.kernel.org, AJvYcCWrzEI7whyZYQBNcs3si3DaWJKQ3qMpLpq3Hc58ihroMtx0ZraPxSNqK3/ljlj52hTc4GHB51kLTd5btg==@vger.kernel.org, AJvYcCX7Ly8ziyqEFUBd9YqKrz4WpMmRXOLIq9xSZCWeG3ywi2cxCBF53/9moHM1348DP94K2CRvP2RF37gx@vger.kernel.org, AJvYcCXrX0vFKbGlDiI183eoErk87BLmAZj57P3x8yzCazXsdHCfu729G6wI4baBigz8LaZi0rGGO8OLt/CX@vger.kernel.org
X-Gm-Message-State: AOJu0YwKwmDgxyOGQclbBcaxb6gI+cnhSBSvVFJfJsBytSXGwI2yH0M7
	GG97qdGkt1ZUkcFBaQHn9VOiH8N0CXNQqIiiOgBK0YDpqFDVBu4qp8NTnw==
X-Gm-Gg: ASbGncujH4IjaMrmiFDh/yRaUf951ff6ubVzIpKhY6Ava4MCT4SapgrhxaKEWhJs+3d
	NrIj2K4ZLzDn8AkKEUaQ0IzSBQvJzSoRB9FeKtn1n1AKZ/rHcdYnxTu52Ih9t/p3vd8whMiVRwH
	4V+NQr5AlRhqZ2Vbfvb466qz3eIVXTmS/dm09VnzmGI+aRU0MoDB7AfLOjG1mjY3rrZ2KmEFVZ+
	KCFpBF+c5t3WBpAbR94/5ignEGQL9SLuSzdJHR/wQamAlpYrJ+NNLCSJmovHPdh02QvHrOKc2CO
	5TaPOp4CVGUiQAkA5lI5fBmTM/imREXES2Bs8IFE05IY4ttU
X-Google-Smtp-Source: AGHT+IGrkVQAJqmwcBYwOjPbo/54cBF97J0jle9Uuchpmkd1/H1nIGfrOLYdHnjx+gO0cX2IwH95Og==
X-Received: by 2002:a17:902:d58b:b0:216:3e9a:89e with SMTP id d9443c01a7336-21c355b70ccmr433995535ad.35.1737623506784;
        Thu, 23 Jan 2025 01:11:46 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb735esm109365365ad.64.2025.01.23.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 01:11:46 -0800 (PST)
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
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v6 1/7] mfd: Add core driver for Nuvoton NCT6694
Date: Thu, 23 Jan 2025 17:11:09 +0800
Message-Id: <20250123091115.2079802-2-a0282524688@gmail.com>
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

The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
PWM, and RTC.

This driver implements USB device functionality and shares the
chip's peripherals as a child device.

Each child device can use the USB functions nct6694_read_msg()
and nct6694_write_msg() to issue a command. They can also request
interrupt that will be called when the USB device receives its
interrupt pipe.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 MAINTAINERS                 |   7 +
 drivers/mfd/Kconfig         |  18 ++
 drivers/mfd/Makefile        |   2 +
 drivers/mfd/nct6694.c       | 373 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h | 105 ++++++++++
 5 files changed, 505 insertions(+)
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 include/linux/mfd/nct6694.h

diff --git a/MAINTAINERS b/MAINTAINERS
index aeb5f3cc58a1..a008f6506e82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16801,6 +16801,13 @@ F:	drivers/nubus/
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
index 6b0682af6e32..c97a2bdcea0b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1045,6 +1045,24 @@ config MFD_MENF21BMC
 	  This driver can also be built as a module. If so the module
 	  will be called menf21bmc.
 
+config MFD_NCT6694
+	tristate "Nuvoton NCT6694 support"
+	select MFD_CORE
+	depends on USB
+	help
+	  This enables support for the Nuvoton USB device NCT6694, which shares
+	  peripherals.
+
+	  This driver provides core APIs to access the NCT6694 hardware
+	  monitoring and control features.
+
+	  The NCT6694 is a versatile multi-function device that supports
+	  functionalities such as GPIO, I2C, CAN, WDT, HWMON, and RTC
+	  management.
+
+	  Additional drivers must be enabled to utilize the specific
+	  functionalities of the device.
+
 config MFD_OCELOT
 	tristate "Microsemi Ocelot External Control Support"
 	depends on SPI_MASTER
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9220eaf7cf12..7725b732e265 100644
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
index 000000000000..307f601e01d8
--- /dev/null
+++ b/drivers/mfd/nct6694.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 core driver using USB interface to provide
+ * access to the NCT6694 hardware monitoring and control features.
+ *
+ * The NCT6694 is a versatile multi-function device that supports
+ * functionalities such as GPIO, I2C, CAN, WDT, HWMON and RTC
+ * management.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/bits.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+
+static const struct mfd_cell nct6694_dev[] = {
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x0),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x1),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x2),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x3),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x4),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x5),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x6),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x7),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x8),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x9),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xA),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xB),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xC),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xD),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xE),
+	MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xF),
+
+	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x0),
+	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x1),
+	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x2),
+	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x3),
+	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x4),
+	MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x5),
+
+	MFD_CELL_BASIC("nct6694_canfd", NULL, NULL, 0, 0x0),
+	MFD_CELL_BASIC("nct6694_canfd", NULL, NULL, 0, 0x1),
+
+	MFD_CELL_BASIC("nct6694_wdt", NULL, NULL, 0, 0x0),
+	MFD_CELL_BASIC("nct6694_wdt", NULL, NULL, 0, 0x1),
+
+	MFD_CELL_NAME("nct6694-hwmon"),
+	MFD_CELL_NAME("rtc-nct6694"),
+};
+
+static int nct6694_response_err_handling(struct nct6694 *nct6694,
+					 unsigned char err_status)
+{
+	switch (err_status) {
+	case NCT6694_NO_ERROR:
+		return err_status;
+	case NCT6694_NOT_SUPPORT_ERROR:
+		dev_warn(nct6694->dev, "Command is not supported!\n");
+		break;
+	case NCT6694_NO_RESPONSE_ERROR:
+		dev_warn(nct6694->dev, "Command received no response!\n");
+		break;
+	case NCT6694_TIMEOUT_ERROR:
+		dev_warn(nct6694->dev, "Command timed out!\n");
+		break;
+	case NCT6694_PENDING:
+		dev_warn(nct6694->dev, "Command is pending!\n");
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return -EIO;
+}
+
+int nct6694_read_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *cmd_hd, void *buf)
+{
+	union nct6694_usb_msg *msg = nct6694->usb_msg;
+	int tx_len, rx_len, ret;
+
+	guard(mutex)(&nct6694->access_lock);
+
+	/* Send command packet to USB device */
+	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
+	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
+
+	ret = usb_bulk_msg(nct6694->udev,
+			   usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OUT_EP),
+			   &msg->cmd_header, sizeof(*msg), &tx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	/* Receive response packet from USB device */
+	ret = usb_bulk_msg(nct6694->udev,
+			   usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN_EP),
+			   &msg->response_header, sizeof(*msg), &rx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	/* Receive data packet from USB device */
+	ret = usb_bulk_msg(nct6694->udev,
+			   usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN_EP),
+			   buf, le16_to_cpu(cmd_hd->len), &rx_len,
+			   nct6694->timeout);
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
+EXPORT_SYMBOL(nct6694_read_msg);
+
+int nct6694_write_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *cmd_hd, void *buf)
+{
+	union nct6694_usb_msg *msg = nct6694->usb_msg;
+	int tx_len, rx_len, ret;
+
+	guard(mutex)(&nct6694->access_lock);
+
+	/* Send command packet to USB device */
+	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
+	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
+
+	ret = usb_bulk_msg(nct6694->udev,
+			   usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OUT_EP),
+			   &msg->cmd_header, sizeof(*msg), &tx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	/* Send data packet to USB device */
+	ret = usb_bulk_msg(nct6694->udev,
+			   usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OUT_EP),
+			   buf, le16_to_cpu(cmd_hd->len), &tx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	/* Receive response packet from USB device */
+	ret = usb_bulk_msg(nct6694->udev,
+			   usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN_EP),
+			   &msg->response_header, sizeof(*msg), &rx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	/* Receive data packet from USB device */
+	ret = usb_bulk_msg(nct6694->udev,
+			   usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN_EP),
+			   buf, le16_to_cpu(cmd_hd->len), &rx_len,
+			   nct6694->timeout);
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
+EXPORT_SYMBOL(nct6694_write_msg);
+
+static void usb_int_callback(struct urb *urb)
+{
+	struct nct6694 *nct6694 = urb->context;
+	unsigned int *int_status = urb->transfer_buffer;
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
+	while (*int_status) {
+		int irq = __ffs(*int_status);
+
+		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+		*int_status &= ~BIT(irq);
+	}
+
+resubmit:
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret)
+		dev_dbg(nct6694->dev, "%s: Failed to resubmit urb, status %pe",
+			__func__, ERR_PTR(ret));
+}
+
+static void nct6694_irq_lock(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+
+	mutex_lock(&nct6694->irq_lock);
+}
+
+static void nct6694_irq_sync_unlock(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+
+	mutex_unlock(&nct6694->irq_lock);
+}
+
+static void nct6694_irq_enable(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	nct6694->irq_enable |= BIT(hwirq);
+}
+
+static void nct6694_irq_disable(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	nct6694->irq_enable &= ~BIT(hwirq);
+}
+
+static struct irq_chip nct6694_irq_chip = {
+	.name = "nct6694-irq",
+	.flags = IRQCHIP_SKIP_SET_WAKE,
+	.irq_bus_lock = nct6694_irq_lock,
+	.irq_bus_sync_unlock = nct6694_irq_sync_unlock,
+	.irq_enable = nct6694_irq_enable,
+	.irq_disable = nct6694_irq_disable,
+};
+
+static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq,
+				  irq_hw_number_t hw)
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
+	int pipe, maxp;
+	int ret;
+
+	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
+	if (!nct6694)
+		return -ENOMEM;
+
+	pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
+	maxp = usb_maxpacket(udev, pipe);
+
+	nct6694->usb_msg = devm_kzalloc(dev, sizeof(union nct6694_usb_msg), GFP_KERNEL);
+	if (!nct6694->usb_msg)
+		return -ENOMEM;
+
+	nct6694->int_buffer = devm_kzalloc(dev, maxp, GFP_KERNEL);
+	if (!nct6694->int_buffer)
+		return -ENOMEM;
+
+	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!nct6694->int_in_urb)
+		return -ENOMEM;
+
+	nct6694->domain = irq_domain_add_simple(NULL, NCT6694_NR_IRQS, 0,
+						&nct6694_irq_domain_ops,
+						nct6694);
+	if (!nct6694->domain) {
+		ret = -ENODEV;
+		goto err_urb;
+	}
+
+	nct6694->dev = dev;
+	nct6694->udev = udev;
+	nct6694->timeout = NCT6694_URB_TIMEOUT;	/* Wait until URB completes */
+
+	devm_mutex_init(dev, &nct6694->access_lock);
+	devm_mutex_init(dev, &nct6694->irq_lock);
+
+	interface = iface->cur_altsetting;
+	int_endpoint = &interface->endpoint[0].desc;
+	if (!usb_endpoint_is_int_in(int_endpoint)) {
+		ret = -ENODEV;
+		goto err_urb;
+	}
+	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
+			 nct6694->int_buffer, maxp, usb_int_callback,
+			 nct6694, int_endpoint->bInterval);
+	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
+	if (ret)
+		goto err_urb;
+
+	usb_set_intfdata(iface, nct6694);
+
+	ret = mfd_add_hotplug_devices(dev, nct6694_dev, ARRAY_SIZE(nct6694_dev));
+	if (ret)
+		goto err_mfd;
+
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
+	struct nct6694 *nct6694 = usb_get_intfdata(iface);
+
+	mfd_remove_devices(nct6694->dev);
+	usb_kill_urb(nct6694->int_in_urb);
+	usb_free_urb(nct6694->int_in_urb);
+}
+
+static const struct usb_device_id nct6694_ids[] = {
+	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID,
+					NCT6694_PRODUCT_ID,
+					0xFF, 0x00, 0x00)},
+	{}
+};
+MODULE_DEVICE_TABLE(usb, nct6694_ids);
+
+static struct usb_driver nct6694_usb_driver = {
+	.name	= "nct6694",
+	.id_table = nct6694_ids,
+	.probe = nct6694_usb_probe,
+	.disconnect = nct6694_usb_disconnect,
+};
+
+module_usb_driver(nct6694_usb_driver);
+
+MODULE_DESCRIPTION("USB core driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
new file mode 100644
index 000000000000..d3a9a8fa0248
--- /dev/null
+++ b/include/linux/mfd/nct6694.h
@@ -0,0 +1,105 @@
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
+	NCT6694_IRQ_CAN1,
+	NCT6694_IRQ_CAN2,
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
+	struct irq_domain *domain;
+	/* Mutex to protect device access */
+	struct mutex access_lock;
+	/* Mutex to protect IRQ access */
+	struct mutex irq_lock;
+	struct urb *int_in_urb;
+	struct usb_device *udev;
+	union nct6694_usb_msg *usb_msg;
+	unsigned char *int_buffer;
+	unsigned int irq_enable;
+	/* Time in msec to wait for the URB to the complete */
+	long timeout;
+};
+
+int nct6694_read_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *cmd_hd,
+		     void *buf);
+
+int nct6694_write_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *cmd_hd,
+		      void *buf);
+
+#endif
-- 
2.34.1


