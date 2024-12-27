Return-Path: <linux-i2c+bounces-8743-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A83C49FD2B3
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 10:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F29CA3A0652
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 09:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343501586C8;
	Fri, 27 Dec 2024 09:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAcDIdJ4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6CE1581F0;
	Fri, 27 Dec 2024 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735293473; cv=none; b=Z5nk/3/h5PlAAz86hBRajWnH/NJniPOYr5L25Odf/Z4+cZ5ZRdrHwHU7ILezJ3mkVq7Ello9iZxK6SQyLLDS4yzPyPYdUWTYU2XQTO4mMTX/IQMGklOLWiw6eB6JKq0F7TiA1BJqf6RR/vRA7CMuqY8Aq58JIbd4g6qvykl8nNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735293473; c=relaxed/simple;
	bh=Jsx1eI6l7oNyRpON1/g56AAnfUO2wIdZpe12QTynu7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jh51D4A5AuQIrQxjFM3gbvvaIfuXLF6H4Ai8psg1w7d/Lnaw/xqMcf2QgNzWbemAa2DgkY4bfltyohRVLcWjhw4ue0FrUTZTjcJ83xb9GaBI56lEvQg3ojPb9PI5rQCUCe+COC33t5N/vYmjXgqty6YSuZjpurMHPupCReSEGrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAcDIdJ4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216401de828so82375975ad.3;
        Fri, 27 Dec 2024 01:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735293470; x=1735898270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cdu04QpC6j0mTfK4Ird3hwwe7JmPciyjX7rFy0WMqgs=;
        b=QAcDIdJ4aP2bUyh9WgAOihquX9sRDpum+9Hpv1WUuQ/C+ODd/0Azjy8AeQBX+DR+GF
         exac0LEZWwEG8S+aWKXDe8gd+EKXdxiaD8I2hpLO3FG4yyFapgT/4pihujGcq7oVQTMz
         IuDJUq5SY5dbxyCtj03I5kVQiamz/KCRXpJBXfGyAHYWa7EHopDPHD89H/oNeTa6Qwfr
         bDv4cwoOw066Gdy2kAxuUcb4iBex/xmujT4lthTtQhYW/L9PpYTfwC/8vIu4/GzusZC6
         SWbfu48B4Kgj71/ZfCADczrBuVfxoCnIVnSzi1GfgisMlHGqlZEsSZnwnUIAhwxiiKjx
         1LtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735293470; x=1735898270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cdu04QpC6j0mTfK4Ird3hwwe7JmPciyjX7rFy0WMqgs=;
        b=oIfSA8iTeu43nl6eBavK4VZcGVqFx4kPiIiNwC9Y9cXpDuoIP/J80Ou9vKmQH+7SaB
         zE1kCCJCaXHjjZohIkOgAKEfYYBitMwg3uBK6jzJIw0di28Y0lgO3atonTsCv02yCgkV
         8KNdskDplFDUmliUt6PUqHFZ/ritrNgNXKq8DFmNwk2t33dVd+N0ABGJX3Lz8sO/uatu
         zI5wOiSw2JaTj86ixb69f2qAyjT4eBNDxQpB9FZ3zq3cS9Tz1HLjjJkqWY48W7aTLsm8
         gzn87LQ/cAJWyGqlzpXghzFjkEcNOXEaYW4gj957acyC6OCwCyayQpfV3gEFvoxbn5BR
         v3Ew==
X-Forwarded-Encrypted: i=1; AJvYcCU6UpKx7Un4sDdwZg++CD/eLMLiMH19C1s7ZI+eyYcPCH5mGszCskrotWosg8Wgeu3Lu9aESUBueyztkBo=@vger.kernel.org, AJvYcCUid6lZq7+yn+5mWPBhd14TBWgLKI3zzZ8+frH4CtTyI1GbddP23qK8IvFfwk10YKfp3gnfAYxKdkTyEg==@vger.kernel.org, AJvYcCUwzgnTFRAfDZt0czmMd+b7zeuF1MfMmAQe8FMfjnUY6R7QTOOZOtGzmbKATry8fZFFiTVK3jzSgxis@vger.kernel.org, AJvYcCUyk5A5ksLEn+D7KFUzfjaPoEiObCbSSLNt+60IIHxT22BYldXWrypoW0oUP75mbw0LsWqWteI8@vger.kernel.org, AJvYcCVdUlF6By90yW/nDejWXpbC4/s42hT4TFWRaBQb1Uo68uiYCHnfZm+/JKeYM0ayqsrhJ6hUTWqfFB6IU0/rgX8=@vger.kernel.org, AJvYcCVfWmKsAbggjngMC+c3BG/rshOSlbl/efPDuWnZwR558AXo8SWRFOcOsHfPXd9uMmIGzr/XNGnj2t3/@vger.kernel.org, AJvYcCWfa/WdV9XxjC5SIPJ+wGqiFp1SXxg95m1sDv2j1V9HWONTqdMcu9mdCa43iPhRq1blu85NgHJnwRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL+IKXuOCHZlkhPNMjoX1Z5dViXQYw0p9I38szB4lyPoydLFoM
	ul/KDdwFmpxZmxkvTqnTUs+hg5RctSwJxPwckWhjLBgqC4E/P25r
X-Gm-Gg: ASbGncs8Koib5t+IQ6Yu4CevzwRzNkagZgG2gypQka6CJWNARIItnFGHeAzdvjaZ5ji
	cb5sJ16rGLKUdXfsxMNC49AfIF+Cs1uLrYFIFNaqYxIZuY0gPT04lQ/I3R2/RH9teftpuYUFuOe
	b8mFJBQx4gc0AIwJEL91gpJnv+ioyyXIKr1H/j/M1Nz//6kQZWxBPN0ibAdI0dOv139O2o6j/QJ
	nqStJdERfIDaobcLHQh/t7P/XFANFwXm3ScqsjxakdVIMwHNWsS53Tk8CFQ2/4mG9LRkMKc+1Ek
	YwRQlf44ZmlMbD7gFhw/JWTS
X-Google-Smtp-Source: AGHT+IGAO3L9c1yK2qluZBnPHL/w4G2vF8U6AyH30aJvuqm4egXRq86NRVKi3U5wyHvffZZAPr4jPw==
X-Received: by 2002:a17:903:120e:b0:215:a179:14d2 with SMTP id d9443c01a7336-219e6f27fc3mr304961765ad.50.1735293470151;
        Fri, 27 Dec 2024 01:57:50 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm131581135ad.187.2024.12.27.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 01:57:49 -0800 (PST)
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
Subject: [PATCH v4 1/7] mfd: Add core driver for Nuvoton NCT6694
Date: Fri, 27 Dec 2024 17:57:21 +0800
Message-Id: <20241227095727.2401257-2-a0282524688@gmail.com>
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
 drivers/mfd/Kconfig         |  10 +
 drivers/mfd/Makefile        |   2 +
 drivers/mfd/nct6694.c       | 394 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h | 142 +++++++++++++
 5 files changed, 555 insertions(+)
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 include/linux/mfd/nct6694.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..acb270037642 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16722,6 +16722,13 @@ F:	drivers/nubus/
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
index ae23b317a64e..5429ba97b457 100644
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
index 000000000000..0f31489ef9fa
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
+	union nct6694_usb_msg *msg = nct6694->usb_msg;
+	int tx_len, rx_len, ret;
+
+	guard(mutex)(&nct6694->access_lock);
+
+	memset(msg, 0, sizeof(*msg));
+
+	/* Send command packet to USB device */
+	msg->cmd_header.mod = mod;
+	msg->cmd_header.cmd = offset & 0xFF;
+	msg->cmd_header.sel = (offset >> 8) & 0xFF;
+	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
+	msg->cmd_header.len = cpu_to_le16(length);
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
+			   buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->timeout);
+	if (ret)
+		return ret;
+
+	if (rx_len != length) {
+		dev_dbg(&nct6694->udev->dev, "%s: Received length is not match!\n",
+			__func__);
+		return -EIO;
+	}
+
+	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
+}
+EXPORT_SYMBOL(nct6694_read_msg);
+
+int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
+		      u16 length, void *buf)
+{
+	union nct6694_usb_msg *msg = nct6694->usb_msg;
+	int tx_len, rx_len, ret;
+
+	guard(mutex)(&nct6694->access_lock);
+
+	memset(msg, 0, sizeof(*msg));
+
+	/* Send command packet to USB device */
+	msg->cmd_header.mod = mod;
+	msg->cmd_header.cmd = offset & 0xFF;
+	msg->cmd_header.sel = (offset >> 8) & 0xFF;
+	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
+	msg->cmd_header.len = cpu_to_le16(length);
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
+			   buf, length, &tx_len, nct6694->timeout);
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
+			   buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->timeout);
+	if (ret)
+		return ret;
+
+	if (rx_len != length) {
+		dev_dbg(&nct6694->udev->dev, "%s: Sent length is not match!\n",
+			__func__);
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
+		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+		*int_status &= ~BIT(irq);
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
+	struct device *dev = &udev->dev;
+	struct nct6694 *nct6694;
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
+	nct6694->usb_msg = devm_kzalloc(dev, sizeof(union nct6694_usb_msg),
+					GFP_KERNEL);
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
+	nct6694->udev = udev;
+	nct6694->timeout = NCT6694_URB_TIMEOUT;	/* Wait until urb complete */
+
+	devm_mutex_init(dev, &nct6694->access_lock);
+	devm_mutex_init(dev, &nct6694->irq_lock);
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
index 000000000000..38c8c7af10d5
--- /dev/null
+++ b/include/linux/mfd/nct6694.h
@@ -0,0 +1,142 @@
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
+#define NCT6694_MAX_PACKET_SZ	512
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
+struct nct6694_cmd_header {
+	u8 rsv1;
+	u8 mod;
+	u8 cmd;
+	u8 sel;
+	u8 hctrl;
+	u8 rsv2;
+	__le16 len;
+} __packed;
+
+struct nct6694_response_header {
+	u8 sequence_id;
+	u8 sts;
+	u8 reserved[4];
+	__le16 len;
+} __packed;
+
+union nct6694_usb_msg {
+	struct nct6694_cmd_header cmd_header;
+	struct nct6694_response_header response_header;
+};
+
+struct nct6694 {
+	struct usb_device *udev;
+	struct urb *int_in_urb;
+	struct irq_domain *domain;
+	struct mutex access_lock;
+	struct mutex irq_lock;
+	union nct6694_usb_msg *usb_msg;
+	unsigned char *int_buffer;
+	unsigned int irq_enable;
+	/* time in msec to wait for the urb to the complete */
+	long timeout;
+};
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


