Return-Path: <linux-i2c+bounces-10231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4BEA81FDA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 10:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 833A488762E
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 08:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F7B25D206;
	Wed,  9 Apr 2025 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQH+3DLv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38D25D1E7;
	Wed,  9 Apr 2025 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187294; cv=none; b=Ptny5j+YsBCQ0P0PURZlDxwOWFQwQH+skZ1Pg4cp2IVolJZArSFyG6yB2Qh3gtd4XMQOOjuWVuyHZ3YT0zfx90asV4VaBVoo/CgHrH5hbtO4AQurprTSjtmkPgcLy7WqIqDm0cm+o7AV/aGFXwwY2Qsz0WKELfqKFktlTOfw/yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187294; c=relaxed/simple;
	bh=0z/Z4OzY+NSk/4iKGAVzh3tJzpyKoBpH4RxJRnV3FoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MJqml/2FguTUH+V4oTWK3Q01gabzxVh/OIV5CB/w0IqHjjteYb0vSuR4CT79eXVtvCIdGhnC8Lr14KDZpAiWSU6V2zH66g0yIimvTHBjQHMICUVtLQsiTh9B1bptSZdrF7Fv1eENKI+mvSAc3+39inIM4MFNi7pzWExonlaIK8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQH+3DLv; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af55b7d56a1so4672718a12.2;
        Wed, 09 Apr 2025 01:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744187292; x=1744792092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTKwQ8MShOdwV9B4aVhpda8vDMGPXaKS17vnKmYonZU=;
        b=GQH+3DLv7ZtaoKl9ao89A1VZ+B7NkW1pqA29fwA/dO0oT+zLHH5GQ4D2uLuvyV7md0
         QLJM9f/sjwKJ44e98hAVAopvMos4k2abyzg46HQjCm9FyzRmBFcrPTVJEv2NQaqv679v
         7Oh1qKBsi2B0dd8NVxcLd8TwWwRnbzZ13LwiS5lfrICRNvuHsGboIESMsBuBNCOmPPKR
         tCKamE8nI3Wo9353R/BDQOpzmPtOtOopz64VROgeeIK46JfqaaNKBo0or46iv/IccJ3w
         3Obj+2BP+e5awjzRAng1KvhampKXwZ+gcwqiqFVbi3O7hs4tl8c3hIjzZGJqJcckiLMV
         PviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187292; x=1744792092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTKwQ8MShOdwV9B4aVhpda8vDMGPXaKS17vnKmYonZU=;
        b=F27TjgtbXxvIRs5hBGgsWptDI09jqJvnSdiS3G077EWAAwync3M0qLHN7xMNTZ7176
         oRBpASDJhNniixAptJ64rVtTXJgiMO7CcPyqYIvPs0vz77nsEFT2wROOIrzc/8Ku4QDH
         k/w17xbE5zv0KuBMm3P1NEcCvuJ1wGlZVFaVEmCapPX6j32YnnbmHJJBsdKRmDt0U1YD
         7NVDUgDXs6A59EGJoX/7LVwkK4yua12xTttlhC5lBIqU1KGCZJgeDBmX2ph/ObvfCjYj
         zcYojhPOVfOb5gYX0jSsz3aPgLZ9kPnJT0jItqtTM9xlhNQGuUNAr+gelw8YsbB/IeLo
         8I3g==
X-Forwarded-Encrypted: i=1; AJvYcCU1JuwzMevEfgNxuU5AtjqWEW/gXXrYS0BwsOTSCTJVxz6qEiwuAMgLiN2016wS/0UsZ5tFveijmQsj@vger.kernel.org, AJvYcCUATkooj8YZ6ywdt2QmOXYzbpE0C0oVCXtkiC7ucoyfZcCw+kZ7Leg8Bu1QCF0KKjYZWYerONYpc0ZEl4s=@vger.kernel.org, AJvYcCUyhw7YpUlK76AN6wgVztftLFX+C+P75DhWZn002voQ45xDIz30S7Brvm7FcfKHpO9oNJyYefoz3ZiUZIBZbEM=@vger.kernel.org, AJvYcCVvVhzYO6hk6Yc+vwr6Tda6QNMMJDyMbaX2XG5ETKMSZWZfA7lkfc7nampeyOy2diW65mrP7xDtBVoW@vger.kernel.org, AJvYcCVxnuSDS3+nXg+a9xArrLYyiwIfSQMBbk8V9g0eXxnUujHGAmhlY4tFLncZOVWUSGGb6owCs37FyvA=@vger.kernel.org, AJvYcCW6/Fp0tVwi/AypGC3tlQi7tAGXZiX14MyNQMCFzxVcUozkuN8fNWUIhZmBXKBEj9F3C0vNRnt4@vger.kernel.org, AJvYcCWTDVL7mDQ2ew8ro7RRsXR8Ulh9YXpXRg3nhms7IFcv8upxNlipJnZRoTqYV0vD+muNHN3CVQxSxxal@vger.kernel.org, AJvYcCXzsEbMV3P9s5Rn4bPDOKFq5NyTlpBKjkTbgsTRGPJVt1D04xfNpc5oQESmfnr0XlT9JCzd+lqpfBLA5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKrxc3ZNcFZlEjteE7HmsOXaQxIc0byPfE1CFb3D7S+uK9vBNB
	rUuNwkUY7ngS1bGxu1LQ5ePPYL0/QELU9gl7WRdtvx4vlSZ2PpYT
X-Gm-Gg: ASbGncs4Equ/0N5LezBBfLXVhKVY4nPvUJ2HG8N4JI1WgrtwEoxkxLDVif7LZqBD18n
	KmDb/xSbZ8/oxy8ttPnXdmp+20ohGR3rk9PSCDkKm3lJRMVtb4GOC5JfT9o4GKR0yzob84yqdAh
	jLxJMW0SaaZ6oCq+7RdSOmscRcYlenEu22YfwDkZGFtlxFk/Y7KCczWizSejCsyAIMcWbXhFrWQ
	AW8OBy2DF+jFVvQwX97eBd7YRk6y4XQEAxBmetDnfu+vAOl1pMNZJ7fjT1CBOjdO0PFd+WlpU6M
	eIuJx9ay0Hia6MyVkwqwvUdoDOaR7El9MF2h3P8Xd4+3VXDyxvdve9vNDa5cqc9mRJRtt6wZOWZ
	mZxw=
X-Google-Smtp-Source: AGHT+IFYZ12yYreMczrWr8eyxysxcPoYUDQGaS/cXMIbTA7nP1uf9wknUWtxHUfw9Nr7gqmwPBiJpg==
X-Received: by 2002:a05:6a20:c6c8:b0:1ee:c8e7:203c with SMTP id adf61e73a8af0-201591ceb04mr3331045637.24.1744187291950;
        Wed, 09 Apr 2025 01:28:11 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d46509sm740772b3a.57.2025.04.09.01.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:28:11 -0700 (PDT)
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
Subject: [PATCH v9 1/7] mfd: Add core driver for Nuvoton NCT6694
Date: Wed,  9 Apr 2025 16:27:46 +0800
Message-Id: <20250409082752.3697532-2-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409082752.3697532-1-tmyu0@nuvoton.com>
References: <20250409082752.3697532-1-tmyu0@nuvoton.com>
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
 MAINTAINERS                 |   6 +
 drivers/mfd/Kconfig         |  15 ++
 drivers/mfd/Makefile        |   2 +
 drivers/mfd/nct6694.c       | 367 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h | 101 ++++++++++
 5 files changed, 491 insertions(+)
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 include/linux/mfd/nct6694.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..f67f78a1d7b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17302,6 +17302,12 @@ F:	drivers/nubus/
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
index 22b936310039..cd4d826a7fcb 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1058,6 +1058,21 @@ config MFD_MENF21BMC
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
index 948cbdf42a18..471dc1f183b8 100644
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
index 000000000000..56073417b96b
--- /dev/null
+++ b/drivers/mfd/nct6694.c
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ *
+ * Nuvoton NCT6694 core driver using USB interface to provide
+ * access to the NCT6694 hardware monitoring and control features.
+ *
+ * The NCT6694 is an integrated controller that provides GPIO, I2C,
+ * CAN, WDT, HWMON and RTC management.
+ *
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
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0x0),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0x1),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0x2),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0x3),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0x4),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0x5),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0x6),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0x7),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0x8),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0x9),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0xA),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0xB),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0xC),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0xD),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0xE),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0xF),
+
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0x0),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0x1),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0x2),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0x3),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0x4),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0x5),
+
+	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 0x0),
+	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 0x1),
+
+	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 0x0),
+	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 0x1),
+
+	MFD_CELL_NAME("nct6694-hwmon"),
+	MFD_CELL_NAME("nct6694-rtc"),
+};
+
+static int nct6694_response_err_handling(struct nct6694 *nct6694,
+					 unsigned char err_status)
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
+EXPORT_SYMBOL(nct6694_read_msg);
+
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
+	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
+			 nct6694->int_buffer, maxp, usb_int_callback,
+			 nct6694, int_endpoint->bInterval);
+
+	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
+	if (ret)
+		goto err_irq;
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
+	mfd_remove_devices(nct6694->dev);
+	usb_kill_urb(nct6694->int_in_urb);
+	irq_domain_remove(nct6694->domain);
+	usb_free_urb(nct6694->int_in_urb);
+}
+
+static const struct usb_device_id nct6694_ids[] = {
+	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID, 0xFF, 0x00, 0x00)},
+	{}
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
index 000000000000..7a02e5b14bbb
--- /dev/null
+++ b/include/linux/mfd/nct6694.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ *
+ * Nuvoton NCT6694 USB transaction and data structure.
+ *
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
+	/* Mutex to protect access to the device */
+	struct mutex access_lock;
+	/* Mutex to protect access to the IRQ */
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


