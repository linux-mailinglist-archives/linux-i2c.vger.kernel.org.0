Return-Path: <linux-i2c+bounces-9066-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3DA0FF46
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 04:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ABBE16944A
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 03:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D442397A1;
	Tue, 14 Jan 2025 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VP55fOSX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1A32327BA;
	Tue, 14 Jan 2025 03:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736825432; cv=none; b=W6nSHtS/HFo9Jh6341K/XqwP4oWnAQtOtsDYXY76MCltgfYTOXfJl+UjMNg/A8DxTHgYtxmrjwSI5g2xKN622lflDgNR7BKPjqhuBvhasPAqHe2X48UBRyOjQnkIBTd30nC2kkTyvP8flzMx25l0TtF1NOzzNEzQ1rwZENghOYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736825432; c=relaxed/simple;
	bh=FyLZP44wzf268k/gzpAv+g8jf7O7Gl6T9OZVPXmRje4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Iotot8enTILkqBFINX4v73Kit0gD7weg9MkfnX3BgF4e6GA5fEScdLBGCU93NtDWKJ9bBYWXAsu662rgFRu4AuH6ygngv/dP61NYT3BcRzDKg+fcnISnG0+afhAzdJOnh4H+IAtcAsV4OwKdRqrox/w/cK9c3ZQPOHauXNNJqlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VP55fOSX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2166022c5caso77531335ad.2;
        Mon, 13 Jan 2025 19:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736825429; x=1737430229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWiNB3BPTz8igjMWY9ghFhLX5KVkbNiReQ8lnKAyDfU=;
        b=VP55fOSXUqSNp+mIqgVubCzzmhT8QwKMsZ2BK1hu+lu4tmxkJv8hQHGsnqln36+uij
         eVqJJhB76ZwlkxZ1KmcPtFM/N8WpcTVpPJIFoNfnJZvEqBbfOB72wSnQgY/R8ZDaq+Nf
         kyPSUgNQvbHgF76hjXEiVTlVtBMc86Q1SBZL1mK8Cy8wY8Y6khyp+6wRgKopKJnb8q/U
         CAuhQ0PHFwx0Rgt8CEKQe2yjOu+HiVVQGAva9Yt/OPxoLp8g1EfwGrEw4bcGo0Vr4AXY
         hLhODPbn2B9rVj4BppQ72ju9/o2cd8X3v7iZZDUxVMXiRBw5WnXmA8+8dJoDqRVG42SZ
         kwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736825429; x=1737430229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWiNB3BPTz8igjMWY9ghFhLX5KVkbNiReQ8lnKAyDfU=;
        b=S0BVEk4T4j1LGn+b0OGJfzO77Os+qiiY+xZxTLiFRfdDLaOHsdzli1QYmP6k02HC8L
         ZQWM5/F1og1CLGcB6DAQpWv0MVl9K2vN/dsuwe4IHhxaOXzQPAcVo6pHsRUU2X8qWrGt
         hWwGWn4sBhpf2hW473qmBI4QBSOyjJV1E1N5bz6IzKzVxfVCuW4kkjkZltTX3Xxav4G2
         212/mZ9CALUnr8vuFDwR5Iz59tFlFg10SVtBzs59Ti69rK/mKfGbxuy7XngCWeB9QV9w
         uPz4yZb8Gd2XEFubS+s5gFKRqM31kUpsCWfTb7lAS0iZwO/qzZEPU0KAG8JdWMzW5jCK
         e43w==
X-Forwarded-Encrypted: i=1; AJvYcCUEZALcYbSHuBqORdQDzgwDTJ1p1FqqcCZAibjTXduEO50YIk0iWCnqmhpuJwy5afaW5PKH96hqO0Q1i34=@vger.kernel.org, AJvYcCUQUUaD/33uu1NnexPZN0BiWp0WXHVACvteHRvgleDNJlTvWha/lpg5DSn3/yesAaukwe9QXeQdEuHt8Q==@vger.kernel.org, AJvYcCUYp3XoXZSf9qF2T2vU8/N1HGDVfNZwhz+SxPEzt1XsNBM/octASIH04jYj/QQ/SLMOGaeQ750qr4eL@vger.kernel.org, AJvYcCUpM14BoWARxNC5dGA+ECQ9+pxuPBqsbsZi2Qe9JiMVvMrmFNY9ox9OOGcbyJETIMP3Thvdtw0NsCGj@vger.kernel.org, AJvYcCVD41FiQIsRGn+JHy/s9ZBWxQi+OFmKhi0v6lLHc04JgujQaCy2lnNaAiTolUmPQjbPV5AAKOv0KQaLuzGs1qc=@vger.kernel.org, AJvYcCVN4Ie4BESqPBOWtkdPJ6Q8BPqugiv38K6cMcJybyie2+S46Pj++DyBnoVbaBxkHnOpaKw7tnkTggIj@vger.kernel.org, AJvYcCVm1wpBmqp1hvndAeuhbP2vU86aG8sEiwQeCUG2pXPSFw4O8T4e9lgJ3CWNym4IKvNl/PqP3n+5@vger.kernel.org, AJvYcCXGVzRKAc+DWrlO4iQFwD1g8OlsMXt6RKKQkT3nNQqo9Qw6MzJtzmMmdpZN/HmDh+Rvpb0xT6r03eU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDY7dNvVW05ptd2cMSV0t/shzrT4F07qJZGydPk1HUTuBTF1HR
	vB7mJQ6awfRD3UxQC717/r4fgEa23W8J24vlU7GNlJ7Y7tKXuODH
X-Gm-Gg: ASbGnctkBeO4PBg8mJQ51bSDO42mqKMXUtefP+ouaeO9f4Op3Qdt07wA5Q/KTSvzVLG
	HRE+zwKvxsuFrq/2MGki5sUYb8/R4/stSZMLtEaGUF1uV6MLqLYhehvy4I3mXInCEYHDMtUIGtG
	bXn23Ia1UU4HYcZugEd8d+sf0W4YZ4DfUgrFttNu4JNmLVqc/YsqtWEL959CCFo3+WMzZB2VVtX
	KliJ+rshNHW1Dxugr6Q/HqhztsJmBXCMgmvJds9ttCcPEYYpeBVonlMprv+OP6cNwp4cEV8CzIT
	kzBB8gxN8clFuNvK+2RuTXfu
X-Google-Smtp-Source: AGHT+IGyW6Fa4e2V3MXi9F5xL6B9vilyejunMbp8VdxvH6utMH0lXtPQxoa52nMeUya2pLCdccElkw==
X-Received: by 2002:a05:6a21:100c:b0:1e0:c50c:9838 with SMTP id adf61e73a8af0-1e88cf7f7b0mr38592841637.6.1736825429058;
        Mon, 13 Jan 2025 19:30:29 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658b71sm6595400b3a.85.2025.01.13.19.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 19:30:28 -0800 (PST)
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
Subject: [PATCH v5 1/7] mfd: Add core driver for Nuvoton NCT6694
Date: Tue, 14 Jan 2025 11:30:04 +0800
Message-Id: <20250114033010.2445925-2-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114033010.2445925-1-a0282524688@gmail.com>
References: <20250114033010.2445925-1-a0282524688@gmail.com>
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
 drivers/mfd/nct6694.c       | 388 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h | 109 ++++++++++
 5 files changed, 516 insertions(+)
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 include/linux/mfd/nct6694.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26..79568f82b98a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16717,6 +16717,13 @@ F:	drivers/nubus/
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
index ae23b317a64e..3e641bfeeb38 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1045,6 +1045,16 @@ config MFD_MENF21BMC
 	  This driver can also be built as a module. If so the module
 	  will be called menf21bmc.
 
+config MFD_NCT6694
+	tristate "Nuvoton NCT6694 support"
+	select MFD_CORE
+	depends on USB
+	help
+	  This adds support for Nuvoton USB device NCT6694 sharing peripherals
+	  This includes the USB device driver and core APIs.
+	  Additional drivers must be enabled in order to use the functionality
+	  of the device.
+
 config MFD_OCELOT
 	tristate "Microsemi Ocelot External Control Support"
 	depends on SPI_MASTER
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e057d6d6faef..3c902d3704dc 100644
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
index 000000000000..294b6b7a902e
--- /dev/null
+++ b/drivers/mfd/nct6694.c
@@ -0,0 +1,388 @@
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
+		dev_dbg(dev, "%s: Command is not supported!\n", __func__);
+		break;
+	case NCT6694_NO_RESPONSE_ERROR:
+		dev_dbg(dev, "%s: Command received no response!\n", __func__);
+		break;
+	case NCT6694_TIMEOUT_ERROR:
+		dev_dbg(dev, "%s: Command timed out!\n", __func__);
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
+int nct6694_read_msg(struct nct6694 *nct6694,
+		     struct nct6694_cmd_header *cmd_hd,
+		     void *buf)
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
+		dev_dbg(&nct6694->udev->dev, "%s: Received length is not match!\n",
+			__func__);
+		return -EIO;
+	}
+
+	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
+}
+EXPORT_SYMBOL(nct6694_read_msg);
+
+int nct6694_write_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *cmd_hd,
+		      void *buf)
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
+		dev_dbg(dev, "%s: Failed to resubmit urb, status %pe",
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
index 000000000000..67ca835589ad
--- /dev/null
+++ b/include/linux/mfd/nct6694.h
@@ -0,0 +1,109 @@
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
+int nct6694_read_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *cmd_hd,
+		     void *buf);
+
+int nct6694_write_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *cmd_hd,
+		      void *buf);
+
+#endif
-- 
2.34.1


