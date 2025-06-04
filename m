Return-Path: <linux-i2c+bounces-11240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B518ACD6E0
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 06:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AA203A60D9
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 04:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71378262FE5;
	Wed,  4 Jun 2025 04:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTi5wob5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D638262FC8;
	Wed,  4 Jun 2025 04:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749010486; cv=none; b=rU6t1G3Tmv34Eqvi2A+6qJuiocKSermT/vwrYchDB0LDMz74PEgoUvAe1dSV5peMNCTpRAE5GrAUZWvwR1gO+pWSFUj2ObHhpitHS7a59VBY64ddgCi/mmJ0kqZWIXFKwP2Ulzth8UsQjkSe2JxODrliU5CVZEOKvkfncH1rLlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749010486; c=relaxed/simple;
	bh=zeo9wRBEWeLfwlNfUSMxiwxvT10M4TGGsESNKUr4LDU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bTMb+LFHLtq+Jyrotb+88E8WP52DAwsvsVwqlmcm/MW7a/HnjLZNaxeIGwKDGKm5dpLUlmame080a+wS4qh0PK77NM832Y4os9rGEfP9hInHaiiJfuW8OvFlg0HtHL9/HM2AJ8R+XkTVfNcK7dxbzRMiTP4qwL3UF8bqXQpJ/C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTi5wob5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so4873608b3a.0;
        Tue, 03 Jun 2025 21:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749010482; x=1749615282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVrAzAbpw6SZY70LAeiefWk26HFPJmk5rrDmpZ9hna8=;
        b=JTi5wob5y3PuxeLHzq9UX1a9Tp3azJ0XwGykKLyHIS1eehDoesAlC+L64gan2SYkFi
         h/VavMLOuNmDcZh9PrgiAKq0ZOTj4iV1NUxrq7Gf/RliJv4xhNpZkkED//ixCG7ZmuLr
         rLaqBcnTz4DU4NncUv62Nmp23gxd8bhRh9pJACk71a4VORKMH3gqmAdMXSUthSB2o/Gz
         2bJ12Be+FdRecCarcQQFKty6/1tcK+l/REeZmra7LxbYA58wlTyZWFjVEPDQkSuxsV2Y
         MiwT0ed1DrvxZFH4WgKyRR0UlqLj5aURW+g/gktgFYKhFk9B4Zd3z2Ko5BiocoYiSfTr
         D//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749010482; x=1749615282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVrAzAbpw6SZY70LAeiefWk26HFPJmk5rrDmpZ9hna8=;
        b=TcWpLB2Ol6uGPMtY3p9X3wCzSXac4Pc7CaSxc40JTsii8mAGS3mD+iXsAOZx1i6AKz
         IGfePDcJ/GU5DLFRtGU1CYhH4NiO9N7pDecBqXPVnak3ADq5Vj883KTJ1QbQJ70L8V03
         RiUYTevNOvtO+E6Gk7tpt3KSsNE3vIibxyVeI6jzXiehCD7AwU5IZJsHjPokbFsMBACa
         y1c/e4lerlHIQ2/66N+o8LJhBcHHc4YczQ0FCY1az22B79p/sAhpvNgnRiAixCPyPnqQ
         ULnhDZ9VQtmrdO5KsUO48UGwmgFSyLZEsgp5WEA10lyErwFN/TiBTtAi1uvtqYwLr/mt
         xaSw==
X-Forwarded-Encrypted: i=1; AJvYcCUS0J+SDDzMcFb4NO/5gJarYy4yzQeD/P0VfTRWn8D3HR13rLX8cbQ9+gV7gkNFh6T5q/TsBmVX@vger.kernel.org, AJvYcCUp6EvJP2seA0meyPj2EFmHr06wFyYtHrj3WpGYUZuuh1iJFzNiYrU4lWlt/F+wBB/N+cWkrTswrCfZByQ=@vger.kernel.org, AJvYcCVSJ0CkTn+kmXl9BUGRzanLNSrDpF1qBtjOMKKQkF2meXGQSbn4SJR1ArZzjDB6oevFdK1JoJBdKBbS@vger.kernel.org, AJvYcCWNq73MB/R20Wc+6n0+9YbereJN5QOjkgYB6c0ExAWRT5Ra7Ou6fpZI950Zya9ZpGTjbg08OYxuSJbvRQ==@vger.kernel.org, AJvYcCWwMShGfiCrY/oZsCcSZ+SU0PEv+55fvWbywEOOt3giqNRShHzS1fGkWPrJDELs0NqWOTHml3iQX3wp@vger.kernel.org, AJvYcCX7w4/5fd+s/4lXgcjKUPOxX90zlVcFBoSyZxTUU8gr91I4thl2kDSKx4R3qQDnwmlOYUTfbVYZAW0=@vger.kernel.org, AJvYcCXLhsOaE92tQx6UF50ZUmnejZF+DyldsEcN2Z/VUkJEQPYiVjXSRYqdlKRNairuKwR+dWb9evwyDC/Y@vger.kernel.org, AJvYcCXp2aiz+JRwq++ukrKgZrabX9Q6k5uHaTw+pLxhfpAfexej/79o/pCThKpXu0SYbvBmRoSyYvHkFAlpj27zHLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1XGMnntFUnPyxgXiouhiMJxlKq4HGXBN4g6BDGoHgDMeXUYg4
	SbFC6rLDcjny0QIggDqyjzmuCb507N8QcCMVWOb39afp/zhby4dMnDoI
X-Gm-Gg: ASbGncv89QLszPoRJK3srUO9W8WAe/1ErLcOmuRBVi9sdQeT15hbqz29DyAP9R5FN8K
	5KpRw5vYYc920AV8xy59Z+dG1CZELDacEyvWDuFvh0EnzkQBZNU/s0shCDKLHlWPfWdbq5uqvxh
	8XkC24OTwXVnARm2i0CSpKAwhLz+aKsut2zMhuc0mwhC2QEP44E/DQA1A7Q6MKA/ZQvIw3ORTE0
	M6qVD2z028kenuTY1Cfdp6N0JBtmmm1D9iPSIWPrDtlP81tAlcx7dnKdGhTfJC5R0ZBmI1raiBz
	DxJmMmfRcTmhzIXaqsQA6MijmzUzW6IVqO1+h2ihdT1ktALnwA7TGnwMffYDHh7DmX8uRWXAazf
	Uq91jdd/9H/CRgfBuiQdZ3V3t
X-Google-Smtp-Source: AGHT+IHrNstmFcTo4cWgYXhiOdRhmslQuE366huEU48utZTr2EhFxdkYXZnDXQiE9cZTVRgP1FGnFQ==
X-Received: by 2002:a05:6a00:987:b0:746:1b45:57a8 with SMTP id d2e1a72fcca58-7480b4d1a10mr2256385b3a.22.1749010482151;
        Tue, 03 Jun 2025 21:14:42 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff755bsm10526057b3a.179.2025.06.03.21.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 21:14:41 -0700 (PDT)
From: a0282524688@gmail.com
X-Google-Original-From: tmyu0@nuvoton.com
To: lee@kernel.org,
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
	Ming Yu <tmyu0@nuvoton.com>
Subject: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
Date: Wed,  4 Jun 2025 12:14:12 +0800
Message-Id: <20250604041418.1188792-2-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604041418.1188792-1-tmyu0@nuvoton.com>
References: <20250604041418.1188792-1-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <tmyu0@nuvoton.com>

The Nuvoton NCT6694 provides an USB interface to the host to
access its features.

Sub-devices can use the USB functions nct6694_read_msg() and
nct6694_write_msg() to issue a command. They can also request
interrupt that will be called when the USB device receives its
interrupt pipe.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
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
 drivers/mfd/nct6694.c       | 386 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h |  98 +++++++++
 5 files changed, 507 insertions(+)
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 include/linux/mfd/nct6694.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 98201e1f4ab5..29d2d05bac22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17679,6 +17679,12 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON NCT6694 MFD DRIVER
+M:	Ming Yu <tmyu0@nuvoton.com>
+S:	Supported
+F:	drivers/mfd/nct6694.c
+F:	include/linux/mfd/nct6694.h
+
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
 M:	Antonino Daplas <adaplas@gmail.com>
 L:	linux-fbdev@vger.kernel.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 96992af22565..489c1950f1ac 100644
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
index 5e5cc279af60..a96204d938fc 100644
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
index 000000000000..82d378ee47ed
--- /dev/null
+++ b/drivers/mfd/nct6694.c
@@ -0,0 +1,386 @@
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
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+
+static const struct mfd_cell nct6694_devs[] = {
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
+
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
+
+	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 0),
+	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 1),
+
+	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 0),
+	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 1),
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
+		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
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
+static const struct irq_chip nct6694_irq_chip = {
+	.name = "nct6694-irq",
+	.flags = IRQCHIP_SKIP_SET_WAKE,
+	.irq_bus_lock = nct6694_irq_lock,
+	.irq_bus_sync_unlock = nct6694_irq_sync_unlock,
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
+	ret = devm_mutex_init(dev, &nct6694->access_lock);
+	if (ret)
+		goto err_irq;
+
+	ret = devm_mutex_init(dev, &nct6694->irq_lock);
+	if (ret)
+		goto err_irq;
+
+	interface = iface->cur_altsetting;
+
+	int_endpoint = &interface->endpoint[0].desc;
+	if (!usb_endpoint_is_int_in(int_endpoint)) {
+		ret = -ENODEV;
+		goto err_irq;
+	}
+
+	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe, nct6694->int_buffer, maxp,
+			 usb_int_callback, nct6694, int_endpoint->bInterval);
+
+	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
+	if (ret)
+		goto err_irq;
+
+	usb_set_intfdata(iface, nct6694);
+
+	ret = devm_mfd_add_devices(dev, 0, nct6694_devs, ARRAY_SIZE(nct6694_devs), NULL, 0, NULL);
+	if (ret)
+		goto err_mfd;
+
+	return 0;
+
+err_mfd:
+	usb_kill_urb(nct6694->int_in_urb);
+err_irq:
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
+	usb_kill_urb(nct6694->int_in_urb);
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
index 000000000000..5e172609be3f
--- /dev/null
+++ b/include/linux/mfd/nct6694.h
@@ -0,0 +1,98 @@
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
+	struct irq_domain *domain;
+	struct mutex access_lock;
+	struct mutex irq_lock;
+	struct urb *int_in_urb;
+	struct usb_device *udev;
+	union nct6694_usb_msg *usb_msg;
+	unsigned char *int_buffer;
+	unsigned int irq_enable;
+};
+
+int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
+int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
+
+#endif
-- 
2.34.1


