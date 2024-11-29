Return-Path: <linux-i2c+bounces-8103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297859D47B7
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 07:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 717EDB2129A
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 06:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103031CACC8;
	Thu, 21 Nov 2024 06:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnSk+T3A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7691C9DF6;
	Thu, 21 Nov 2024 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171268; cv=none; b=qbuDKx1T2ogSMw75hVfNy2ir7/a1sduL70JnUiEJE4XE7CJD61WBg/u+a9SfIrVgcRSK+X2P48SKS7OPU0nqwYCU3t3AH/cg35vxkzyd52m69K+pZSn5L7mvyxicYV8zzKBUF4oRPWBpqUiTFndJxFJ3rML9nftc8Nm7sCsU3ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171268; c=relaxed/simple;
	bh=1Ad7boXiK81bBb4hrpnHXDp6RHFHSLujsHdBxtE9+dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HKM/JNQQCAuHgu0snVq6yn2vQWaSwDwpaUx+r89WmAjK4f/VyMv+foMGHPXTvJGSQ6i4Ysxijq0gg/g1kNRSgZHI0L0QOm7Eqke9qRNjHcmsRQKk8D0DYm/IDdjQ+cI+rRfjXjhJrg0gO6zx6fDzR8rXBXh7cMftrcOK0BTskOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnSk+T3A; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so459614b3a.2;
        Wed, 20 Nov 2024 22:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732171266; x=1732776066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QRLyHmPfdTDtbGtNfafkBqirNBX/D0Qp3Sa4aEfp6A=;
        b=PnSk+T3AagKLLAi+uMk29X4TZbO2+o5KhecxsIqj68184eOq7HC3s0PZu82Hk4Fdi8
         +W0pvTT/K6Jyps2Dfvco3DP62knAVGYWSK6FCenSsplig2F7g6ZwFhWlc63gU9JD2jCs
         MHawau7XOhJ3uv/gM8MBq9bbwx75tz/sotGYNuSSu2nFPGKi2fF6XndeIXtz9LTYNCTS
         d3z6C+8zos7JOJgX/f6Je5Rzj3gcAhjIYtkc3WvMUFdSfX2y/vUkVYJdQwdX+n1kiOh/
         bVL98eWaunaK83M3cavXbe/sRY/n7vySpgF3UaiFpXVtgm8QnK5vIIkNDEK/FKFv2NS6
         5uWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732171266; x=1732776066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QRLyHmPfdTDtbGtNfafkBqirNBX/D0Qp3Sa4aEfp6A=;
        b=Sgd2vyxHq7De7oEGYntIcWDEoJ2OtQqbB6snhYnlYZMh/1URc+xK9BxGRQYNi3Gz9G
         F0/tXxjfmAj8Mj2bUKck4e9SGdCDu7PE9Urm7Jts8P3Bi/uoVCV+HsnWudsoY0aoXJzc
         E2ayb0i0zhuJ33BXJRy7AyM2sXxFs4BbZ6j56J7964JiV4kgzT9/Q2A4t6E54Mh1fPUZ
         4FieI57d/EIWtsbcX53xC/hWNTTOTKEl9APFrPuoigdQxe84GT7zL6n5jPzLP5JGvHDU
         iP1iGNyYvS4hkLyvdDWNezhiI32b+Gli61j/sJe7MjoGXb0eegMRF0PWSoxNzzOV79jL
         RH4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4dx5wHvdMRS06SheDwUgWR5k8ozVes4K/2fZjzmV6u1mT19FqVDMR9vQdwGXNBecOsaPuRIM26fw=@vger.kernel.org, AJvYcCUYlaKv+hSiSAKgEGyUQ6524aUojyTgY7Wqc7LmTrAl+RcaT8kfpzPhG4d1yA2by4DqztbQ0Tn9@vger.kernel.org, AJvYcCV8Yq0m8eQvNu2N7eYT/ljULOXRgbh2FJGTLjKHKg/GpLFwNjuaUInVPuswziCYwkOlcRjQZg7ahC35VZ4=@vger.kernel.org, AJvYcCW2wjkTNYyC6klHNtWzVvr9y+DoKO/GU77CcmAT1aaYClj+MZC4KN9anP+UaIviyLi/ZNsX6dtucnuv@vger.kernel.org, AJvYcCW2xOE0Ff+b8fbur2EOOqkSjI5af6l1f1DC+he+V6popqrnLWVso1EAyc5sPnFrDeVecT2eJOpdsCHdZw==@vger.kernel.org, AJvYcCWSWAOQC3HFGrjMkOHGso8HGiCl3Mw2/BxVqi6efxCH8/BnMmNlJARdGSycyw7sRfx0RN/9e+eQkGMklBNC24Y=@vger.kernel.org, AJvYcCWdMCq6+viiB1lNGmDYjCU9ZcchDgalULxmrgUhS3ihhVxGVSuLk87hKj2KUSaU4dmlkYMPx9L9GFjy@vger.kernel.org
X-Gm-Message-State: AOJu0YwaShS0EP+iX2Axes5z8yWrz6JrechGgkEz7CaLTiq6ENo+3CV+
	CInMxpmDQQyT/wbqwd20GHdUuGMUwicfEola4hJELoS1v46gV6eV
X-Gm-Gg: ASbGncv8PbtZTViBM/26IJbpdTS8WqY98gKdxFcKepGi6RRYZqiAA1j54p9f7CJFfKI
	yu0H3nX8CgJNE/nyvsb9DVKBKEqqL14HaWbLUr4M+noCayKp4GYh7T+GgmiA00F4Nso6OdPcCmf
	7ID5LWSjBph0aldayR8osTxF5bEZ9Dw/6+LG9l6F+NZcybXMm93YtE0eLZHmUtypxjYjxNVs/Qe
	c72id7l12uM7gj1DZ6jxuRY2gIHjxsU307q2JVYIG7JDblFeAHPlw8C7RF2/UZUqWfX6CUixT5c
	kqqQiVtF4fB3
X-Google-Smtp-Source: AGHT+IFKyvoGhto6kqRGfdZYJqk0LQiUr14qPytVmRakJyFaXuQWSdCzdI4G1KNzn/yuPsZOehr0uw==
X-Received: by 2002:a05:6a00:9293:b0:71e:55e2:2c54 with SMTP id d2e1a72fcca58-724becb8374mr6248484b3a.12.1732171265891;
        Wed, 20 Nov 2024 22:41:05 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beeb83d4sm2812530b3a.40.2024.11.20.22.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:41:05 -0800 (PST)
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
Subject: [PATCH v2 1/7] mfd: Add core driver for Nuvoton NCT6694
Date: Thu, 21 Nov 2024 14:40:40 +0800
Message-Id: <20241121064046.3724726-2-tmyu0@nuvoton.com>
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

The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
PWM, and RTC.

This driver implements USB device functionality and shares the
chip's peripherals as a child device.

Each child device can use the USB functions nct6694_read_msg()
and nct6694_write_msg() to issue a command. They can also request
interrupt that will be called when the USB device receives its
interrupt pipe.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                 |   7 +
 drivers/mfd/Kconfig         |  10 +
 drivers/mfd/Makefile        |   2 +
 drivers/mfd/nct6694.c       | 382 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h | 139 +++++++++++++
 5 files changed, 540 insertions(+)
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 include/linux/mfd/nct6694.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 67d2159406c2..9c9a94ff8f98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16541,6 +16541,13 @@ F:	drivers/nubus/
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
index 03c1e4e3eea4..07ccc32f9985 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -558,6 +558,16 @@ config MFD_MX25_TSADC
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
index e057d6d6faef..9d0365ba6a26 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -117,6 +117,8 @@ obj-$(CONFIG_TWL6040_CORE)	+= twl6040.o
 
 obj-$(CONFIG_MFD_MX25_TSADC)	+= fsl-imx25-tsadc.o
 
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
+
 obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
 obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
 obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
new file mode 100644
index 000000000000..071333d13eae
--- /dev/null
+++ b/drivers/mfd/nct6694.c
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 MFD driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
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
+#define MFD_DEV_SIMPLE(_name)				\
+{							\
+	.name = NCT6694_DEV_##_name,			\
+}							\
+
+#define MFD_DEV_WITH_ID(_name, _id)			\
+{							\
+	.name = NCT6694_DEV_##_name,			\
+	.id = _id,					\
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
+	MFD_DEV_SIMPLE(HWMON),
+	MFD_DEV_SIMPLE(RTC),
+};
+
+static int nct6694_response_err_handling(struct nct6694 *nct6694,
+					 unsigned char err_status)
+{
+	struct device *dev = &nct6694->udev->dev;
+
+	switch (err_status) {
+	case NCT6694_NO_ERROR:
+		return err_status;
+	case NCT6694_NOT_SUPPORT_ERROR:
+		dev_dbg(dev, "%s: Command is not support!\n", __func__);
+		break;
+	case NCT6694_NO_RESPONSE_ERROR:
+		dev_dbg(dev, "%s: Command is no response!\n", __func__);
+		break;
+	case NCT6694_TIMEOUT_ERROR:
+		dev_dbg(dev, "%s: Command is timeout!\n", __func__);
+		break;
+	case NCT6694_PENDING:
+		dev_dbg(dev, "%s: Command is pending!\n", __func__);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return -EIO;
+}
+
+int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
+		     u16 length, void *buf)
+{
+	struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
+	struct nct6694_response_header *response_header = nct6694->response_header;
+	struct usb_device *udev = nct6694->udev;
+	int tx_len, rx_len, ret;
+
+	guard(mutex)(&nct6694->access_lock);
+
+	/* Send command packet to USB device */
+	cmd_header->mod = mod;
+	cmd_header->cmd = offset & 0xFF;
+	cmd_header->sel = (offset >> 8) & 0xFF;
+	cmd_header->hctrl = NCT6694_HCTRL_GET;
+	cmd_header->len = length;
+
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP),
+			   cmd_header, NCT6694_CMD_PACKET_SZ, &tx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	/* Receive response packet from USB device */
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
+			   response_header, NCT6694_CMD_PACKET_SZ, &rx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
+			   buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->timeout);
+	if (ret)
+		return ret;
+
+	return nct6694_response_err_handling(nct6694, response_header->sts);
+}
+EXPORT_SYMBOL(nct6694_read_msg);
+
+int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
+		      u16 length, void *buf)
+{
+	struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
+	struct nct6694_response_header *response_header = nct6694->response_header;
+	struct usb_device *udev = nct6694->udev;
+	int tx_len, rx_len, ret;
+
+	guard(mutex)(&nct6694->access_lock);
+
+	/* Send command packet to USB device  */
+	cmd_header->mod = mod;
+	cmd_header->cmd = offset & 0xFF;
+	cmd_header->sel = (offset >> 8) & 0xFF;
+	cmd_header->hctrl = NCT6694_HCTRL_SET;
+	cmd_header->len = length;
+
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP),
+			   cmd_header, NCT6694_CMD_PACKET_SZ, &tx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP),
+			   buf, length, &tx_len, nct6694->timeout);
+	if (ret)
+		return ret;
+
+	/* Receive response packet from USB device */
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
+			   response_header, NCT6694_CMD_PACKET_SZ, &rx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
+			   buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->timeout);
+	if (ret)
+		return ret;
+
+	return nct6694_response_err_handling(nct6694, response_header->sts);
+}
+EXPORT_SYMBOL(nct6694_write_msg);
+
+static void usb_int_callback(struct urb *urb)
+{
+	struct nct6694 *nct6694 = urb->context;
+	struct device *dev = &nct6694->udev->dev;
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
+		if (*int_status & (1 << irq))
+			generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+
+		*int_status &= ~(1 << irq);
+	}
+
+resubmit:
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret)
+		dev_dbg(dev, "%s: Failed to resubmit urb, status %d",
+			__func__, ret);
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
+	unsigned int irq = data->hwirq;
+
+	nct6694->irq_enable |= (1 << irq);
+}
+
+static void nct6694_irq_disable(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	unsigned int irq = data->hwirq;
+
+	nct6694->irq_enable &= ~(1 << irq);
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
+	struct device *dev = &udev->dev;
+	struct usb_host_interface *interface;
+	struct usb_endpoint_descriptor *int_endpoint;
+	struct nct6694 *nct6694;
+	struct nct6694_cmd_header *cmd_header;
+	struct nct6694_response_header *response_header;
+	int pipe, maxp;
+	int ret;
+
+	interface = iface->cur_altsetting;
+
+	int_endpoint = &interface->endpoint[0].desc;
+	if (!usb_endpoint_is_int_in(int_endpoint))
+		return -ENODEV;
+
+	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
+	if (!nct6694)
+		return -ENOMEM;
+
+	pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
+	maxp = usb_maxpacket(udev, pipe);
+
+	cmd_header = devm_kzalloc(dev, sizeof(*cmd_header),
+				  GFP_KERNEL);
+	if (!cmd_header)
+		return -ENOMEM;
+
+	response_header = devm_kzalloc(dev, sizeof(*response_header),
+				       GFP_KERNEL);
+	if (!response_header)
+		return -ENOMEM;
+
+	nct6694->int_buffer = devm_kcalloc(dev, NCT6694_MAX_PACKET_SZ,
+					   sizeof(unsigned char), GFP_KERNEL);
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
+	if (!nct6694->domain)
+		return -ENODEV;
+
+	nct6694->udev = udev;
+	nct6694->timeout = NCT6694_URB_TIMEOUT;	/* Wait until urb complete */
+	nct6694->cmd_header = cmd_header;
+	nct6694->response_header = response_header;
+
+	mutex_init(&nct6694->access_lock);
+	mutex_init(&nct6694->irq_lock);
+
+	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
+			 nct6694->int_buffer, maxp, usb_int_callback,
+			 nct6694, int_endpoint->bInterval);
+	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
+	if (ret)
+		goto err_urb;
+
+	dev_set_drvdata(dev, nct6694);
+	usb_set_intfdata(iface, nct6694);
+
+	ret = mfd_add_hotplug_devices(dev, nct6694_dev, ARRAY_SIZE(nct6694_dev));
+	if (ret)
+		goto err_mfd;
+
+	dev_info(dev, "Probed device: (%04X:%04X)\n", id->idVendor, id->idProduct);
+	return 0;
+
+err_mfd:
+	usb_kill_urb(nct6694->int_in_urb);
+err_urb:
+	usb_free_urb(nct6694->int_in_urb);
+	return dev_err_probe(dev, ret, "Probe failed\n");
+}
+
+static void nct6694_usb_disconnect(struct usb_interface *iface)
+{
+	struct usb_device *udev = interface_to_usbdev(iface);
+	struct nct6694 *nct6694 = usb_get_intfdata(iface);
+
+	mfd_remove_devices(&udev->dev);
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
+MODULE_DESCRIPTION("USB-MFD driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
new file mode 100644
index 000000000000..9733d47f5a01
--- /dev/null
+++ b/include/linux/mfd/nct6694.h
@@ -0,0 +1,139 @@
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
+#define NCT6694_DEV_GPIO	"nct6694-gpio"
+#define NCT6694_DEV_I2C		"nct6694-i2c"
+#define NCT6694_DEV_CAN		"nct6694-can"
+#define NCT6694_DEV_WDT		"nct6694-wdt"
+#define NCT6694_DEV_HWMON	"nct6694-hwmon"
+#define NCT6694_DEV_RTC		"nct6694-rtc"
+
+#define NCT6694_VENDOR_ID	0x0416
+#define NCT6694_PRODUCT_ID	0x200B
+#define NCT6694_INT_IN_EP	0x81
+#define NCT6694_BULK_IN_EP	0x02
+#define NCT6694_BULK_OUT_EP	0x03
+#define NCT6694_MAX_PACKET_SZ	0x200
+
+#define NCT6694_CMD_PACKET_SZ	0x8
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
+struct nct6694 {
+	struct usb_device *udev;
+	struct urb *int_in_urb;
+	struct irq_domain *domain;
+	struct nct6694_cmd_header *cmd_header;
+	struct nct6694_response_header *response_header;
+	struct mutex access_lock;
+	struct mutex irq_lock;
+	unsigned char *int_buffer;
+	unsigned int irq_enable;
+	/* time in msec to wait for the urb to the complete */
+	long timeout;
+};
+
+struct nct6694_cmd_header {
+	unsigned char rsv1;
+	unsigned char mod;
+	unsigned char cmd;
+	unsigned char sel;
+	unsigned char hctrl;
+	unsigned char rsv2;
+	unsigned short len;
+} __packed;
+
+struct nct6694_response_header {
+	unsigned char sequence_id;
+	unsigned char sts;
+	unsigned int rsv;
+	unsigned short len;
+} __packed;
+
+/*
+ * nct6694_read_msg - Receive data from NCT6694 USB device
+ *
+ * @nct6694 - Nuvoton NCT6694 structure
+ * @mod - Module byte
+ * @offset - Offset byte or (Select byte | Command byte)
+ * @length - Length byte
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
+		     u16 length, void *buf);
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
+		      u16 length, void *buf);
+
+#endif
-- 
2.34.1


