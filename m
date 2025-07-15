Return-Path: <linux-i2c+bounces-11942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E68BB04E28
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jul 2025 04:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C09287B40DC
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jul 2025 02:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5A42D3238;
	Tue, 15 Jul 2025 02:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg4j0Qt2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90AB2D29D9;
	Tue, 15 Jul 2025 02:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752548217; cv=none; b=Hh4qbz0lrBt0VA5FOUI+760lKrRbftnf4mIFGoljKWHboVUD7vUynQRi6+IgapRf+ejpk0ysQR6TwEOYp1GUUZ+BggAzm+O5gEuPcreeip74QXXx88Iz7qdBv6X4aW7zt9scpYZVb9L/lwRoTcLJjYhsaflDbid7nJZB6Z9h70Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752548217; c=relaxed/simple;
	bh=/4tUT/ANlHVKiFZOgQpDhQvqM98kLyVyCT28W0jaI+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PCatUpRscF5yPoOW43avirUF/rk113eHXNiGcBbYDPeswJJp7zBi54axjFAXa/ZlHWtzGJz/sjpqkxCn1H14/DxD+Figft5fDHE7fjAINbfpX4bViICMXrrWcJF6f8tydxnAtSgH6juUFYGrzXH8UodJgsVR9mL8KEWpcuTsnkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eg4j0Qt2; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5947388a12.0;
        Mon, 14 Jul 2025 19:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752548215; x=1753153015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGl43qymL0XsaHuvQztdW80X6JDERGPbJG4l4Yxf/Cs=;
        b=Eg4j0Qt2FS4loOV6JWRdNJOXeCsqWXLXrETSo78SE0lFcZct0MkfmxmUFOl3Zby74l
         YbGwtqix8F2/3ibzjKXPKqoIU241UXWeVQql2EYY0MXQDeIusYLHyEEhyYAd4GUz6891
         vrAkaWNBFezpdDUbbtOU8TR+5Vd7ZJyVYcNQZgOap50djFRIsPhAy1Qv5RU0z4TP0It1
         ZUoGMXkT6NDq7iIZoihYTQnN/foInnv6QOIfUZSh/JNwaHLt0v8qyeowHtdeEi7mqZPl
         J5HAz1w3gfM1zLuQQW3vq4sVC+Rwcr/Ddu+Sq+i6kaA3YMEZ5twQlil9/yzqlnHeEqA5
         auCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752548215; x=1753153015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGl43qymL0XsaHuvQztdW80X6JDERGPbJG4l4Yxf/Cs=;
        b=lC/vaoKlruD5lcZcuxBByndHaCB/tvRN72JVE2glOH/pGQT8oqokB9UVlxnXO3q4nG
         N6m5aPxbDXyBmcJl0DC4SEXGhLpqZyA7AgGj9pQrYND9ruAge9u3u/0PSs5rwyQe3EVP
         rXfHpSrLEZ1nRboX4Pban6/7ylW7amB7yV/8gXDytwcT8wwIgydFFYYEg9F9+zWg1chk
         T2+9VSJ0N7/ZI265tXOAH3/7qS2IT0oJmrZe0CkfEWX4lUDmdEHg5Q+WINUoK+DkErV+
         SeAGKCi1noMqDZFhhSa5vfX6YIKzUWKq8eb8YNbwo8oNs9mkgnxw2EBeKQ0sg87dHZKh
         cwqw==
X-Forwarded-Encrypted: i=1; AJvYcCU9VJKQlrfViS2i0J5RSQcGM+EoAcEDhDlRqfEXdPzE28LXuXjeE2PNFZbhlmN2DH/j1FJNw7PmNvPGFWg=@vger.kernel.org, AJvYcCUHsjiw8oS2KA2nuyXpxWyhCIT6Gepn10oxUXJPnRtp5w5cD8WtmTARmqfwDjsBxnnFFhnQf20UT7c=@vger.kernel.org, AJvYcCUeYkeBH6ssnfmJIrrvC+KCpChwx9lxL4MaGkSa4T51l5E1+11CdzxIo7TaARKJfn4QW6Cagh8WAJ1s@vger.kernel.org, AJvYcCUxzU2LFWBiyAwgI0/gxGG0IFqFFv6U1iFu4W+Ugf+cM7azSDZ6EP0a8HCw4QFjLXf4QpqBEK84@vger.kernel.org, AJvYcCV1mNH3FjuZIr1fj1PTteIPmjhSfa7XbTYAhs5kBepI8PY3UBhWNGtsapmjZGiAZk35OW1r025vzAcA@vger.kernel.org, AJvYcCVXD1B8fFdpju6TV3gcQvCGisBJfMJSa3eiZWvRnqwQgtfh2EcjxfrbC2G93ULZ0a7NoaQgxs+MYZdvvA==@vger.kernel.org, AJvYcCWc06okEqKkm/C29lcBLHIkMKyXlmPGV5ZJOqn9RRKQxkWZI9XZ5q/xo9Sygty0ajUIkKk1R20YZRnURTrvVGo=@vger.kernel.org, AJvYcCX6qAoXqjlZtNE4RmUIp86PWbYmPXNdX6S50QFn6cIuak8mWihWTkFetiCBI0Mwg7EZMO29x/tuLxKd@vger.kernel.org
X-Gm-Message-State: AOJu0YzHGJMB1vm9mar5pw9AL3Jh0Dn16iSsZg6kyJorGYOCb+k9ocWL
	31wy0/L+bwKnKEkAgtr7MSNCcCaUm5ZYE5pujFKHKzmkkJYj79CKh6O8
X-Gm-Gg: ASbGncu67C0c425MrU2SyRJFCKn9pxaAvKVh2B59sypB8oDHSj6xTI2hgZmFSR4fPx3
	Ez5N2dUzzRfDdR2+XUG957fxcN0TjgXu4vI/PjqwTDJ9JlC2r58aP2uhZpq0oMvP8+9rVoIiDMD
	18AfmS1KM0BkQoaIeXo7rp4OeBIsJMj3eJ0/bR11X6o2Jg/eyQLPQLMuo6SROtMrLlmD1x0nUXp
	oqnq8yZnsjp4fG2Bf/WrOg+hxP7DX6fny87HFKWGs21DohwKJ46Qa7jt8RMHqwP4OqGqthN5Wtf
	zc+88RKPgV4h9bWS+UCkb2XryRSc/MQ5Hj86DfYlHLC3KqF0KtY36pq6eCV+xwF7h6XfyX2QdnV
	2iDtDDfTuox9Q4fhYCqNs1z2iMxXDuHtGCrUEPC9a8dG6wDhoXEZ6uxaDZK009poXeYKME+6Yd0
	rW
X-Google-Smtp-Source: AGHT+IEwzj+9D7EGC4iTgvLDjeV+tw0iAwEQZ8zsTw6Fw4TZXJPgqEgHZCcTubKVHMFMokGz/HhLhg==
X-Received: by 2002:a17:90b:2ecb:b0:311:f99e:7f4a with SMTP id 98e67ed59e1d1-31c4ccedab5mr23037548a91.26.1752548214860;
        Mon, 14 Jul 2025 19:56:54 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3e957ddcsm11148168a91.9.2025.07.14.19.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 19:56:54 -0700 (PDT)
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
Subject: [PATCH v14 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Tue, 15 Jul 2025 10:56:22 +0800
Message-Id: <20250715025626.968466-4-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715025626.968466-1-a0282524688@gmail.com>
References: <20250715025626.968466-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

This driver supports I2C adapter functionality for NCT6694 MFD
device based on USB interface.

Each I2C controller uses the default baudrate of 100kHz, which
can be overridden via module parameters.

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes since version 13:
- Add struct i2c_adapter_quirks in i2c-nct6694.c

Changes since version 12:
- Implement IDA in MFD driver to handle per-device IDs
- Use same email address in the signature

Changes since version 11:
- Use platform_device's id to replace IDA

Changes since version 10:
- Implement IDA to allocate id

Changes since version 9:

Changes since version 8:
- Modify the signed-off-by with my work address
- Add module parameters to configure I2C's baudrate

Changes since version 7:

Changes since version 6:

Changes since version 5:
- Modify the module name and the driver name consistently

Changes since version 4:
- Modify arguments in read/write function to a pointer to cmd_header
- Modify all callers that call the read/write function

Changes since version 3:
- Modify array buffer to structure
- Fix defines and comments

Changes since version 2:
- Add MODULE_ALIAS()

Changes since version 1:
- Add each driver's command structure
- Fix platform driver registration

 MAINTAINERS                      |   1 +
 drivers/i2c/busses/Kconfig       |  10 ++
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-nct6694.c | 196 +++++++++++++++++++++++++++++++
 4 files changed, 208 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 749cfa37ddb8..428b20334a3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17819,6 +17819,7 @@ NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
+F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index c8d115b58e44..4ccd16c21a8a 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1358,6 +1358,16 @@ config I2C_LJCA
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-ljca.
 
+config I2C_NCT6694
+	tristate "Nuvoton NCT6694 I2C adapter support"
+	depends on MFD_NCT6694
+	help
+	  If you say yes to this option, support will be included for Nuvoton
+	  NCT6694, a USB to I2C interface.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called i2c-nct6694.
+
 config I2C_CP2615
 	tristate "Silicon Labs CP2615 USB sound card and I2C adapter"
 	depends on USB
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 04db855fdfd6..fe8cf6325fc9 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -135,6 +135,7 @@ obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.o
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
 obj-$(CONFIG_I2C_LJCA)		+= i2c-ljca.o
+obj-$(CONFIG_I2C_NCT6694)	+= i2c-nct6694.o
 obj-$(CONFIG_I2C_CP2615) += i2c-cp2615.o
 obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
 obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o
diff --git a/drivers/i2c/busses/i2c-nct6694.c b/drivers/i2c/busses/i2c-nct6694.c
new file mode 100644
index 000000000000..1413ab6f9462
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 I2C adapter driver based on USB interface.
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ */
+
+#include <linux/i2c.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+/*
+ * USB command module type for NCT6694 I2C controller.
+ * This defines the module type used for communication with the NCT6694
+ * I2C controller over the USB interface.
+ */
+#define NCT6694_I2C_MOD			0x03
+
+/* Command 00h - I2C Deliver */
+#define NCT6694_I2C_DELIVER		0x00
+#define NCT6694_I2C_DELIVER_SEL		0x00
+
+#define NCT6694_I2C_MAX_XFER_SIZE	64
+#define NCT6694_I2C_MAX_DEVS		6
+
+static unsigned char br_reg[NCT6694_I2C_MAX_DEVS] = {[0 ... (NCT6694_I2C_MAX_DEVS - 1)] = 0xFF};
+
+module_param_array(br_reg, byte, NULL, 0644);
+MODULE_PARM_DESC(br_reg,
+		 "I2C Baudrate register per adapter: (0=25K, 1=50K, 2=100K, 3=200K, 4=400K, 5=800K, 6=1M), default=2");
+
+enum nct6694_i2c_baudrate {
+	NCT6694_I2C_BR_25K = 0,
+	NCT6694_I2C_BR_50K,
+	NCT6694_I2C_BR_100K,
+	NCT6694_I2C_BR_200K,
+	NCT6694_I2C_BR_400K,
+	NCT6694_I2C_BR_800K,
+	NCT6694_I2C_BR_1M
+};
+
+struct __packed nct6694_i2c_deliver {
+	u8 port;
+	u8 br;
+	u8 addr;
+	u8 w_cnt;
+	u8 r_cnt;
+	u8 rsv[11];
+	u8 write_data[NCT6694_I2C_MAX_XFER_SIZE];
+	u8 read_data[NCT6694_I2C_MAX_XFER_SIZE];
+};
+
+struct nct6694_i2c_data {
+	struct device *dev;
+	struct nct6694 *nct6694;
+	struct i2c_adapter adapter;
+	struct nct6694_i2c_deliver deliver;
+	unsigned char port;
+	unsigned char br;
+};
+
+static int nct6694_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct nct6694_i2c_data *data = adap->algo_data;
+	struct nct6694_i2c_deliver *deliver = &data->deliver;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_I2C_MOD,
+		.cmd = NCT6694_I2C_DELIVER,
+		.sel = NCT6694_I2C_DELIVER_SEL,
+		.len = cpu_to_le16(sizeof(*deliver))
+	};
+	int ret, i;
+
+	for (i = 0; i < num; i++) {
+		struct i2c_msg *msg_temp = &msgs[i];
+
+		memset(deliver, 0, sizeof(*deliver));
+
+		deliver->port = data->port;
+		deliver->br = data->br;
+		deliver->addr = i2c_8bit_addr_from_msg(msg_temp);
+		if (msg_temp->flags & I2C_M_RD) {
+			deliver->r_cnt = msg_temp->len;
+			ret = nct6694_write_msg(data->nct6694, &cmd_hd, deliver);
+			if (ret < 0)
+				return ret;
+
+			memcpy(msg_temp->buf, deliver->read_data, msg_temp->len);
+		} else {
+			deliver->w_cnt = msg_temp->len;
+			memcpy(deliver->write_data, msg_temp->buf, msg_temp->len);
+			ret = nct6694_write_msg(data->nct6694, &cmd_hd, deliver);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return num;
+}
+
+static u32 nct6694_i2c_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_adapter_quirks nct6694_i2c_quirks = {
+	.max_read_len = NCT6694_I2C_MAX_XFER_SIZE,
+	.max_write_len = NCT6694_I2C_MAX_XFER_SIZE,
+};
+
+static const struct i2c_algorithm nct6694_i2c_algo = {
+	.xfer = nct6694_i2c_xfer,
+	.functionality = nct6694_i2c_func,
+};
+
+static int nct6694_i2c_set_baudrate(struct nct6694_i2c_data *data)
+{
+	if (data->port >= NCT6694_I2C_MAX_DEVS) {
+		dev_err(data->dev, "Invalid I2C port index %d\n", data->port);
+		return -EINVAL;
+	}
+
+	if (br_reg[data->port] > NCT6694_I2C_BR_1M) {
+		dev_warn(data->dev, "Invalid baudrate %d for I2C%d, using 100K\n",
+			 br_reg[data->port], data->port);
+		br_reg[data->port] = NCT6694_I2C_BR_100K;
+	}
+
+	data->br = br_reg[data->port];
+
+	return 0;
+}
+
+static void nct6694_i2c_ida_free(void *d)
+{
+	struct nct6694_i2c_data *data = d;
+	struct nct6694 *nct6694 = data->nct6694;
+
+	ida_free(&nct6694->i2c_ida, data->port);
+}
+
+static int nct6694_i2c_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nct6694 *nct6694 = dev_get_drvdata(dev->parent);
+	struct nct6694_i2c_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = dev;
+	data->nct6694 = nct6694;
+
+	ret = ida_alloc(&nct6694->i2c_ida, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+	data->port = ret;
+
+	ret = devm_add_action_or_reset(dev, nct6694_i2c_ida_free, data);
+	if (ret)
+		return ret;
+
+	ret = nct6694_i2c_set_baudrate(data);
+	if (ret)
+		return ret;
+
+	sprintf(data->adapter.name, "NCT6694 I2C Adapter %d", data->port);
+	data->adapter.owner = THIS_MODULE;
+	data->adapter.algo = &nct6694_i2c_algo;
+	data->adapter.quirks = &nct6694_i2c_quirks;
+	data->adapter.dev.parent = dev;
+	data->adapter.algo_data = data;
+
+	platform_set_drvdata(pdev, data);
+
+	return devm_i2c_add_adapter(dev, &data->adapter);
+}
+
+static struct platform_driver nct6694_i2c_driver = {
+	.driver = {
+		.name	= "nct6694-i2c",
+	},
+	.probe		= nct6694_i2c_probe,
+};
+
+module_platform_driver(nct6694_i2c_driver);
+
+MODULE_DESCRIPTION("USB-I2C adapter driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:nct6694-i2c");
-- 
2.34.1


