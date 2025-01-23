Return-Path: <linux-i2c+bounces-9156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CA0A1A081
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2025 10:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BF20169383
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2025 09:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0A620E026;
	Thu, 23 Jan 2025 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkYaMlTp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B827F20D4F0;
	Thu, 23 Jan 2025 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737623518; cv=none; b=LT4H58/OEOcQZS4JGiYdCohh9HXfw7QfkCeEB4PDwxsGXY+e7k0liL9ptPevPYn5kCb0Bn2fOlHXx7rw8gaAdETVRXalCumaOF0H0YyntnjLBEFwoqJp9kVekFE9xdgQtShI/bD9mEZ8eCJIYT9hOT8DAynIbV7Rt3vqRYtLpaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737623518; c=relaxed/simple;
	bh=Pz4NmNa5pW/KHkrYytjGFtWpHS0vL0+49hdDNmZ9pXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eQS8+ZnquSsWwTaVThgL4lOihbwNukvIqkBr1ZiiQePq1IFMO1w6WlnOxVheWF7hOj13dDkYZZwvjKbdVrSOgsSz/KdXKO09ItccM21ggi1VKG+1DdWb/sORZgQMJUvUWs2PTpNKCCcqYlNA8J+lJ1ipauQ2SoetduCm4/Oe6pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkYaMlTp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2167141dfa1so12330765ad.1;
        Thu, 23 Jan 2025 01:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737623516; x=1738228316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n0kLp6Z5xkIXnOcGtHfCp/+V6dGV90stHOhmL+mqY8=;
        b=kkYaMlTp6OcnyauwTTjoTUBH5vxzhKQQuU4yZrt1MxlNqEcdTziFPHJoF+OkMvl+X0
         22SSmqEcd4YHvbQ1qse6r8eAIPoPM7XyF0HyVVtp9fIimE0E8cmBqVo4AY4ocSEl6R3w
         m2G7tyImhQdYmYGpDloyRIXBj6QE0gAiEcoijxo0jOgJdhQGPChAhj0vAz7xiClMIn97
         7HCJFBYF/TFjgo177Wic94zRXx8i+xb/w/gEWWV18oPbn5DS7JgpyMiOAvy4eDwx09iX
         f1mRPqAi27SSIQ/0K2ETqu52scNt++IpfuNK3fy5BmntLalNLtqUac+VH445kleDdqsO
         97YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623516; x=1738228316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9n0kLp6Z5xkIXnOcGtHfCp/+V6dGV90stHOhmL+mqY8=;
        b=cSXKjfeOV6HChRoJeOc0dxA3I2ulC/NzPBHB4lXQcRhqSpK1QzcV9bE0mxC1Wb0Jiy
         SXY5nVh+8UsKJoOTQyjWU/MhxGRZvQ+KTOB9TW8zuT4O1881y6z1HijMjvSCmliZ7GA/
         b54M490ruXpI+dR2fJuWll3nFTF6IBsckFf/gUBctEn5Z6z6qzCQZc+vgrQYcyr1AesJ
         M3mNYJ600+dXoB73oBwgO4VT+BnkmaRergL19bnxy5DLLqCoKIUC5K1dENjB1IBmJJ3X
         wKVG6cQ4bfo+DHWAbW0qS2pDkiLnC+Wx4DtkoQZSjNZcxxjr23TGgzVaYuvWGMW3h/u9
         BXHA==
X-Forwarded-Encrypted: i=1; AJvYcCUwJa6g/3NHS/fZMoN3pQOtZxl2OuEnk3GGfocl4khDNMuhZ6nAL9ebhAQh2PVoVJPgcaf6P+iWaGEF@vger.kernel.org, AJvYcCVeeisvOs8NNMDMl/Er7aNHLDbbj8aXoUEbFBPrRaMG4M//NlvUd6LGO6wuqNpIVCho0KgPyfAc6X4YeA==@vger.kernel.org, AJvYcCWMqZEU5kcmDFuHyRbS2EKdvHG7gBUlx1Qc7k2kym2gSpdwvRZiMJN+WtGf3t4hVO1k091lG37pyLos@vger.kernel.org, AJvYcCWl1Tg0rSReV1ED8EdU4ypW1oYcBKiuNwAZ/swffwlv0AXOuICUcALjtXQSM8t42R6fFA2iVBEnI7JrBJA1hZc=@vger.kernel.org, AJvYcCWrqPghceQbj9X/WL7VQNlqjxJBFPmk1xGXylEwo5tBkfXTRu8Hv3dvDRyFSpB3tmdY1inFmbVV@vger.kernel.org, AJvYcCXMm06C2Z55LJkZLBnwRx8m0lYIq90BZdaapreN7kbXeASbz4cov2P4r3gS+YUcmVLHoVdSuDm9Ijsw@vger.kernel.org, AJvYcCXXG6vGh36bQykEG3uhX344eGDKXDrpCbP/hHw7RT0YtZ8/rahf+EsLSt038Qf6WTO3DQEUDWVYq/Q=@vger.kernel.org, AJvYcCXoCfhKJUumh4siJ7ELu77EqVxSmh32pE0Kq0aX7y2vbHWlUcPaFDoaSdLkxwNo8aXNbL8A3k2x7IrV7LM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiWUF3rUK+8MR1LO20uMQP4cqNIFZ7/mm6dy0dE5wA742dyMCw
	H9KMnDmODvyREByqjT30JxpPuOC4CMHL1dBr7+fvnqx0nnoU+Uzo
X-Gm-Gg: ASbGncvELXkQq62ZglfEEqP6PF1SJ9C8Gv8ZbOU4SsRGYNpqLFENw4EwNC4ZUyA3Ms6
	WvhBy3wvr0BZRrWDN/THXhKIQJPMbpc6zzLNXsIJVUaG3wNhl5ndWDWb2MnSqOeOUDbSxQQ3Aio
	CYGTfPFgrSXxCkfy5yVy2Usl4Uen1Ct6GxEUG2gLIotF9cbnW4iky94CxYCM/cNBRIrg9widz0s
	vNwJ3+DAWl8PVsYdyhrdAuw1DwxGFjhDzBUVSRO8MXYhBksrGBhku/O9tFCB25M9cd1BeJmWwHv
	5dXAVEP51lsoUJTwlpDb96Ty/4kIXrOykmTsQJ9rLDXuAhTm
X-Google-Smtp-Source: AGHT+IHqYrjkyu9b0blxrTGQjr1+VB5yl2Z4a6pqutLfxDrrxPmIVuh5IzA00Qp3u25T69L6Qxy4Vw==
X-Received: by 2002:a17:902:f605:b0:216:3440:3d21 with SMTP id d9443c01a7336-21d994d2e99mr45235925ad.26.1737623515888;
        Thu, 23 Jan 2025 01:11:55 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb735esm109365365ad.64.2025.01.23.01.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 01:11:55 -0800 (PST)
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
Subject: [PATCH v6 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Thu, 23 Jan 2025 17:11:11 +0800
Message-Id: <20250123091115.2079802-4-a0282524688@gmail.com>
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

This driver supports I2C adapter functionality for NCT6694 MFD
device based on USB interface, each I2C controller use default
baudrate(100K).

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 MAINTAINERS                      |   1 +
 drivers/i2c/busses/Kconfig       |  10 ++
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-nct6694.c | 157 +++++++++++++++++++++++++++++++
 4 files changed, 169 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d4f87e8c71c7..f930252ad132 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16806,6 +16806,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
+F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index eec95c724b25..c35dd936d4b4 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1328,6 +1328,16 @@ config I2C_LJCA
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
index 000000000000..172073e79c93
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -0,0 +1,157 @@
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
+	struct nct6694_i2c_deliver *deliver;
+	unsigned char port;
+	unsigned char br;
+};
+
+static int nct6694_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct nct6694_i2c_data *data = adap->algo_data;
+	struct nct6694_i2c_deliver *deliver = data->deliver;
+	struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_I2C_MOD,
+		.cmd = NCT6694_I2C_DELIVER,
+		.sel = NCT6694_I2C_DELIVER_SEL,
+		.len = cpu_to_le16(sizeof(*deliver))
+	};
+	int ret, i;
+
+	for (i = 0; i < num ; i++) {
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
+	data->deliver = devm_kzalloc(&pdev->dev, sizeof(struct nct6694_i2c_deliver),
+				     GFP_KERNEL);
+	if (!data->deliver)
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


