Return-Path: <linux-i2c+bounces-9556-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD588A4373B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 09:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B4441896DC5
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 08:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A78262802;
	Tue, 25 Feb 2025 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4SICjDr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164D22627E9;
	Tue, 25 Feb 2025 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740471437; cv=none; b=bhWz1JJ0jxuJ6rZtzRD0RbzdM7inoNJkf/Gm+FWcUk0jzchFkMOUWCnlp+Q94XYGwahklwZ/YYbH6/Xk/BnxPYn7TPFLGxRl/SWK/5EQ8EU/W6FkExAv+nAgaeXogvvEv0Fv3KAR8MlIGVN/dJfa6WiyYD/wiTUpdXCO9+M4A74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740471437; c=relaxed/simple;
	bh=bSZzlFBF2yruJOVHYy5GhwwLpfUSSNNXNqKSrPzZiUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iP/WBXee/j7NDjUFTLqx5z1w0umeqowlbV3zegYGAbZ5miVbopkbtxwjGaEmk2fFUMChB4ldNmJByjstImMNXXUWtMGglldu0Ebuj5xzWVNd8Ff0IWAsoNx6KqBZF9rqJ6jvjPBTswgwGanPPgOyGk10iVBP112eRCDovwwqQxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4SICjDr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-221206dbd7eso109385385ad.2;
        Tue, 25 Feb 2025 00:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740471435; x=1741076235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzXMX0GdCmam8+leSYD2zUvdF77p9BrMkiZ29xVQTk0=;
        b=e4SICjDryON5Xi/QLhkHxAWXa+MEB/NKNgGlwUoAhsLL0Wbg6Sm/3nzTM6EcJFKeB2
         5Ol0JeYcqmaAZOn8UzE/9G5fkJR/hdPDcm22Pi9qiGfcrJ3jGi6IbWmO9jsGLRuzexNs
         ltAAqw5TFderKRm3dAlp0hmADidQ6bbZHQX2Zx5epS+quj+6ZtMyvCC+17dsSIufiee/
         Zs6xtEDKKufYdgcVr5qFTB7Z+yzn/Mf9A+oTX/6jLOlzxFN/qpePT8Lod/pezAsAZElB
         FhJqXwnrvR6vmJqEXGirPQtbywfon7UyFa9SnllT8hlAHSWFqw3/UPjAY9kEF73Nlrg4
         e/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740471435; x=1741076235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzXMX0GdCmam8+leSYD2zUvdF77p9BrMkiZ29xVQTk0=;
        b=q7aYrMb31Gq6yxU68vbH+QfLRtwVHqGeliL0z8aL3FB0ECFqgMGlnoKgNgDyRnmHYf
         cDH18HfIkGUZnKMTwfvundeW+qI+oGDPbILX+dJotH+QLE1irax6i+WD5oORRgIGVi8Y
         Z0speV4RCnefH8ElyywAHi7IWKjT9aVDvVGH7scGK4SL+9kpwN/w7xnIryBcNvIkna9W
         4b7In7a2HO3Pz93sk6w7kfylopBGdiSGElHNhJJwOL4aRF576mlB0n/I1e4lwtaRNC7Q
         L/RFGnL+9TJ7IUvK7YGuhGx31QiO3c2xu6RNHq9DW2ziK7y1ckJ7eSeRiWC8ArhU/u7s
         FINA==
X-Forwarded-Encrypted: i=1; AJvYcCUZuUpgOJ2XkkzFOxoJk19OGAqbUA7hkytfnnDKX2KEcjBVdsCuoKUaEC2HVg66/zhuaq9ra9mOv8PfNw==@vger.kernel.org, AJvYcCVZ4Pnun3ZbE/3VE8YjF8d3gnEly2OgPUCKdPsnjsmloO3+v930JuttUwmP6s4roMCqDjyKo1U1y1xz@vger.kernel.org, AJvYcCWQsqGa8X2SmBM0n68QdaSSKBjroNmNHU1OrVjY9B707bSDRUnPg1A5IJl+NrjmJi2pz43f88yEh9LR@vger.kernel.org, AJvYcCWWzDMHXjezZcgl5Gc/Zlo4khsO+6BUPzBeJCc1YvSDAZDh82nB5PUpnOAPgDZ4N1w4S+V1/ZfuyZWRQtzNOwE=@vger.kernel.org, AJvYcCWglJZtxJmwvm3AF+X032mNZFnmbHWaHRv0CKsvk1lDhki8YR/HboEN2fEybKSi3ZGEVRrRPNoZVcUpej0=@vger.kernel.org, AJvYcCWqMdjOfqbBfex15hnJhn1doxkdGyzuW/9HyT/ksWmZ672sw41IjhOdwpmHbUi0rc/KkAMuoGqwz7E=@vger.kernel.org, AJvYcCXhvDQ8fGIAiGdtYGiGL+akLEKle0xLDBiUHWap3mxs4/vwOs5gDTUwHaQ5HOVZ0JkJSZA+exX79Dhl@vger.kernel.org, AJvYcCXk5RnHvd+vp6VrwQ5LpxsvO4b4+xk1zFsXQOXrQ5ALv9o0JmC9EuaPCf0dWgsXsFYeyDxyB47/@vger.kernel.org
X-Gm-Message-State: AOJu0YyXbl5n+h3x8zwPkWUelBbZQAICqKjHXGw75UDIwPoz/FmEeTHy
	wXjCtJhjsAt/kKmvDfKvW/OU5P3WdF5Hs8yehwKk6UmmyXFHxTsH
X-Gm-Gg: ASbGncvv6slTnr2vwmSMdCjyQi60Fu8rbRRhNotj6gx0i+4eLrujTchnljNeln82HTj
	p8LOzsY88QeNNhw4JuXPqdRbkaWT5+QDq5igAfdLEk6UQ6tcICrUYJwRm4rlFUwA6RDD1DlNnMn
	ILa/J1bcGYjHjUQ+BfF/xU3iZP15UHuvhanj51+Lz5egccw2BvnYGV5H0Rgl3qApjms8/4dOCnc
	XuC5fyqHeaIRkzyzVrS9tdj5qCghZuyAbTXlgfNVOwyB4ukGZ7up/UnuFjm+Qh/fO454PpxPJyn
	bKkVP8Q+oUf2/yzZ8SGFN+73lHaJ/GD629P8XW6HCLndR36Xcwz9bCHMdtQkwAQYMQNVGg==
X-Google-Smtp-Source: AGHT+IGs0mPRgxuxCHkOSigZvHyUu2/6ZX64UZblCedBW+pVaxOtJCnt/Kx92blq46LE12m2qW9W7A==
X-Received: by 2002:a05:6a20:7f81:b0:1ee:ace8:8181 with SMTP id adf61e73a8af0-1eef3ca3f5amr30044978637.21.1740471435091;
        Tue, 25 Feb 2025 00:17:15 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6abaddsm902178b3a.20.2025.02.25.00.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 00:17:14 -0800 (PST)
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
Subject: [PATCH v8 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Tue, 25 Feb 2025 16:16:40 +0800
Message-Id: <20250225081644.3524915-4-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225081644.3524915-1-a0282524688@gmail.com>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver supports I2C adapter functionality for NCT6694 MFD
device based on USB interface, each I2C controller use default
baudrate(100K).

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 MAINTAINERS                      |   1 +
 drivers/i2c/busses/Kconfig       |  10 ++
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-nct6694.c | 152 +++++++++++++++++++++++++++++++
 4 files changed, 164 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index be7cd44a4c88..1327e7a6e507 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16923,6 +16923,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
+F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fc438f445771..d0753d0adaae 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1329,6 +1329,16 @@ config I2C_LJCA
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
index 1c2a4510abe4..c5a60116dd54 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -133,6 +133,7 @@ obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.o
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
 obj-$(CONFIG_I2C_LJCA)		+= i2c-ljca.o
+obj-$(CONFIG_I2C_NCT6694)	+= i2c-nct6694.o
 obj-$(CONFIG_I2C_CP2615) += i2c-cp2615.o
 obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
 obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o
diff --git a/drivers/i2c/busses/i2c-nct6694.c b/drivers/i2c/busses/i2c-nct6694.c
new file mode 100644
index 000000000000..fc26fb6e3751
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 I2C adapter driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
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
+enum i2c_baudrate {
+	I2C_BR_25K = 0,
+	I2C_BR_50K,
+	I2C_BR_100K,
+	I2C_BR_200K,
+	I2C_BR_400K,
+	I2C_BR_800K,
+	I2C_BR_1M
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
+static int nct6694_i2c_probe(struct platform_device *pdev)
+{
+	const struct mfd_cell *cell = mfd_get_cell(pdev);
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	struct nct6694_i2c_data *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->nct6694 = nct6694;
+	data->port = cell->id;
+	data->br = I2C_BR_100K;
+
+	sprintf(data->adapter.name, "NCT6694 I2C Adapter %d", cell->id);
+	data->adapter.owner = THIS_MODULE;
+	data->adapter.algo = &algorithm;
+	data->adapter.dev.parent = &pdev->dev;
+	data->adapter.algo_data = data;
+
+	platform_set_drvdata(pdev, data);
+
+	return i2c_add_adapter(&data->adapter);
+}
+
+static void nct6694_i2c_remove(struct platform_device *pdev)
+{
+	struct nct6694_i2c_data *data = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&data->adapter);
+}
+
+static struct platform_driver nct6694_i2c_driver = {
+	.driver = {
+		.name	= "i2c-nct6694",
+	},
+	.probe		= nct6694_i2c_probe,
+	.remove		= nct6694_i2c_remove,
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


