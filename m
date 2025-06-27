Return-Path: <linux-i2c+bounces-11649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA726AEB4AD
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D2541C21200
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4602C08D5;
	Fri, 27 Jun 2025 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPGId8Ij"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4DA2BCF5D;
	Fri, 27 Jun 2025 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020076; cv=none; b=dQpLw5CUskbQOKE6BjOAMgWfZc8ceBWY6p+APyB/XoxvNQtp/SDbbxPvvgoFXKlc1+NW05+jLsVbDDNJ3GvJaJDr6YqA+3fvbhQCE0gOkMGgIb612UCaEQ60OlB/wTknz9mLeUUNVnbXsqt2GPxqeLJqy3rqbtrhpviWeeiOEPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020076; c=relaxed/simple;
	bh=YjUXP3+CxSEAtTBhuxB+Aw7TW4r/3OcBr9T8Bhr+wLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ko6boq9k1PDD1Bf8JaZNm51YmkOotG+7BjSMlV/s0JR/Ki/iKWcZLTkHr634G5HxLGrl7Q10gK9TqWDN6qJsJS/FLkfe6K0kv+wpfwNGC84cU8m+2EW0PExMEJA2NMLr/gCf+Mspe6BGLIwndpQfuUdKKIuJv2uAkLXfRLvwrpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPGId8Ij; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2366e5e4dbaso28564445ad.1;
        Fri, 27 Jun 2025 03:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751020074; x=1751624874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia7JObbLYkDYYztrMklPS2wwYYqLsmWS8q3PkkwOB2E=;
        b=UPGId8IjbVoyN0FIWZcKqq3JQfo06y/5gsQbGHkN2OjERikYrv/e66nQelXT48Lwnn
         UtPGE2sYawBi+x19E+wvtTJ6PYwbEL/aFpk/oqqS/iLpFQf8AGF7uyW2m4X5T5LVi/m9
         9yUARJpMyzc/sg3Kcd0lioKoNeRpr1Gk+A5PZ3DVYX/x44fiPdxEyfssI2rFoRliWDMY
         vYNq68FrBcLhA2diM9KEBegUEsFU1VyizwUCt6FdXdeOndRxKNr3CpJJJSINmtk7bHO8
         UTtr/y5apQhRNev01tzXeZ9M83xI3fkipSGTpOA7MDyUNHafTR+vXoSjkQQ/W8x+mKUZ
         cv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751020074; x=1751624874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ia7JObbLYkDYYztrMklPS2wwYYqLsmWS8q3PkkwOB2E=;
        b=HUheYsyaP/cc4EsTM0DP+CuXwm6I3sbypPS3yO0Cmeob3OhwsE3qju+Lp5mN3hIIYu
         NWeaA1O2+u6jFfaGuM/0VkM4HyGY85P8ZociOLXvDljk+ZdrNz5OZcPSiNyef8HmgPh4
         h0W6rNWxAQvXwD1saYRg6qi1JFCMH+8ULgJdi5InsybSt9D+WiTmT278qO1S9af36bZe
         DF/JjO6MGnli22eHWwWvm7ZoSCeHuwvmYqO39icnxbWnFarHw8KAWuCFmQ/bUein942W
         kNaQRZllMzD7ESzEmqgNbtvGWbqIzlwoxpKDbgNmE8KxCrx41SS6RQjsQ5hxfpXLljpV
         ndSg==
X-Forwarded-Encrypted: i=1; AJvYcCUeNZu/tCqNrVNgdXZ4zv4SihSelSmhsQhB+szB7MVtyC5W9MpgsfCOcU1escuLSooUtPIZX0Lh+3QR@vger.kernel.org, AJvYcCUqJcBGOZIymaFCA43+RwqT+jSDs7DU/UkbVrWNTNncPX0PEm/WkZH3tv8agcj/mQgxXIDT+xGpn5YIBaI=@vger.kernel.org, AJvYcCUwx8UCs5KkxEQ+DdQO1SU+yYHLKQhD+3XGs3hkFBaV7EtJJIv5/WFTUzN3XFUfvf4/Nl2AN5gKOXDWPQ==@vger.kernel.org, AJvYcCVYn7yOmr9Me5/JMv9xIRaxnjPrgC61ijAawquDrinl51tJuA/XhZguT4wBN4Xc23JTzgG3PSiy@vger.kernel.org, AJvYcCVgHWWvjvPtzcJueutvGc9eWpWOG/4wrZCMLdvqzbwzQ6LzBNlULgeGMhGy8+QlJr0aeiVCyf/Pp+AXkYVfmCY=@vger.kernel.org, AJvYcCVr6n5wTWiTTCzoDWtQ3iicczMTJwINoXWe36J47SASxsR/mxjjrSoHj0m3+4qOXrdR0zAANm1zu9OB@vger.kernel.org, AJvYcCW5llHLhlYYb18F+GmESyM1yQkFPutPIE6ZSY6M6PCV7kUyHbJelz63xPIn6VhCVuJV3FAGaYLoIPQ=@vger.kernel.org, AJvYcCX1lr9TuXTxebTx0i7Di0/xPA+NDvnsjcLHQ4goweYC6ahGL5xFC1UADMpUN3IBMYs4v0aJ+CCsOgXc@vger.kernel.org
X-Gm-Message-State: AOJu0YyCAIjwf+JyM2LRgnARVA85Ia3ongE6q8v5nAIuGtDDbG4plLr+
	cRoMgJpoON2ZkYwtJqJEVkx+Zjmvfwc6K82GIQlL6r7/9H285oJ8+okU
X-Gm-Gg: ASbGncsIbWzwKDH9+wvpoe/LsZr7RrmpuqkwiWl+Fl9iYp8mxWoCAc//frji/eCyqE1
	D5J7TueS74QCy0Z2FPMGDILsHxtkLKkpxzdWXc1pyq7NVwlmopbax/WlnrqmrNcnvd0Z623cl9D
	d/MYrDU+2wG6my2+w9aEQpZD1oQscEhi4GFez1qLC8SPAATmeCFVRIDF5EZgCGOXTjBftIW/hr5
	6ZoFrzwjSyQUj7vTXNZe+SuUxlMtDJxZYowqeomQFzDdAaS6F7wGlB9rwLbcgdV7S8DK9a2Iu6W
	GzJhM5ey1D1uXsupKY1fq31oy5+gcUwFZV9XpZbGHFGdc3fK0A9mJzQrAqSqLNGiXHiiRt00PKb
	wBxIZxdDGrPXK3EAXqc58CtV8Be91H2R2TFVom3/h
X-Google-Smtp-Source: AGHT+IEnprRCwUOLmZyhJtldLhQuouO7t8yMZ8L4C0FEWNIHbVffpKa7tSfhV1sLOn4oqdBH1l1wIQ==
X-Received: by 2002:a17:903:2304:b0:215:58be:3349 with SMTP id d9443c01a7336-23ac59ab761mr45875515ad.14.1751020073950;
        Fri, 27 Jun 2025 03:27:53 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bc495sm13845155ad.201.2025.06.27.03.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:27:53 -0700 (PDT)
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
Subject: [PATCH v13 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Fri, 27 Jun 2025 18:27:26 +0800
Message-Id: <20250627102730.71222-4-a0282524688@gmail.com>
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

This driver supports I2C adapter functionality for NCT6694 MFD
device based on USB interface.

Each I2C controller uses the default baudrate of 100kHz, which
can be overridden via module parameters.

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
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
 drivers/i2c/busses/i2c-nct6694.c | 192 +++++++++++++++++++++++++++++++
 4 files changed, 204 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 67bab405b0b7..dd299c3cb2b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17793,6 +17793,7 @@ NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
+F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 48c5ab832009..b0c738ecbfeb 100644
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
index 000000000000..c731dc19bc8d
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -0,0 +1,192 @@
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
+#define NCT6694_I2C_MOD		0x03
+
+/* Command 00h - I2C Deliver */
+#define NCT6694_I2C_DELIVER	0x00
+#define NCT6694_I2C_DELIVER_SEL	0x00
+
+#define NCT6694_I2C_MAX_DEVS	6
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
+	u8 write_data[0x40];
+	u8 read_data[0x40];
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
+static int nct6694_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
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
+		if (msg_temp->len > 64)
+			return -EPROTO;
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
+static u32 nct6694_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm algorithm = {
+	.master_xfer = nct6694_xfer,
+	.functionality = nct6694_func,
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
+	data->adapter.algo = &algorithm;
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


