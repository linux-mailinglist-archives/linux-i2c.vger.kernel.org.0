Return-Path: <linux-i2c+bounces-10233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E96CAA81FF7
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 10:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AA1A4C3EDA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 08:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128B625D8E6;
	Wed,  9 Apr 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czzWeIDX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170EE25C6F7;
	Wed,  9 Apr 2025 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187302; cv=none; b=btciilEqD+lLfqoj9d5gsSe9e2aXD4g1G1xLBtGoxVYt1hoI7hf+BoSQtUaRgcBszEZuZnXCBkOZ9+WTQmJDiPKJdyVPxctpWqqhUiEUN0pNvga647MXB5mGcf2CR8UJT/PHmddj8G+gn6ZkJgIJq97sXh+opsbfq8H8xnyoMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187302; c=relaxed/simple;
	bh=KOSLr3IssqSS0j+0Fw456YN23ujnqNbv1aFR2eVsmhU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cLqzyHgMZ5PVIx2+ZtgrnW09767yzVnR8hgz0hbmk7ZujoKX2xc1PRlyOE6y3BuHF5X1eN/EWzPq6AZS6Mlz3XzBdp8p0Ipr4usA4/Ad3u000MovxWYs6RKf9DhKFcO8rJgx4XGx1wqcCL1GOITPFjwHsrltw+q18EfDlDWbgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czzWeIDX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso8645351b3a.2;
        Wed, 09 Apr 2025 01:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744187300; x=1744792100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJvxO8lTJepUjyQ7iUvPUu0aT3Zv3aHLuGQnV/2b+lg=;
        b=czzWeIDXhSRSG47I20fvDEg4kjKrclH0llQtzASdEMbMOvuJVYrLvFbB2/sugNZknK
         imXK6jHT2KvAHc5YaEpAIVIVA9YKE1FClRkMpolSJ9sUGBm6SU+Y7fwMzdEqytceF0hE
         OhQ/B/4ZSeZ9axIA9qSksCUy+pBhFmIGm7MFLEzIIjRvzAcE4roSr/skWL7s2NY1XYE6
         xXKXg5VP/Xl6qMXlG7FAH/zwYTYUNzA63b1YjBVSmJG/7JgsfM7oG/0pyKcC1JQaCmfe
         I9/+sxZCe2glvHmoVXKWzHXBAMuVQhY99f34CUJdcHYHhHAj1UybCw2Uc3BtcRkGXCdw
         WG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187300; x=1744792100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJvxO8lTJepUjyQ7iUvPUu0aT3Zv3aHLuGQnV/2b+lg=;
        b=XAvfRIZ8Sj5/YRWICPFNAmA+IQzYM9XhdJGogj4bcNIHc1XcjSULrNeA9+XiNdkNHL
         Nk93EAZTtzUtZ96X8COOHomB7YT1xEEz3p+dLNLBcTxIQw8eWzX+O7gd8tHLnARXChjW
         HnnE1LehOnVG2KA7gBJB/tGz/u+ufB1sAFee85J01zRe6wS5CIhhLZcmyEneXNV/+TRg
         wu4cA1IXAduD/54pkOHGaBTHGeeYagGZo1oTF3R7TxG34w0pCLm5V7VqhlB/vqQokJLt
         5VPnNWpUV5VZtGv22rYw0nhBcXYiWj/277KrpwjKruDP3HuavnFEz+Exk7nObCzPSfz/
         Gf7w==
X-Forwarded-Encrypted: i=1; AJvYcCUdjvTxLuC2Elcfp1YqmTUt+UI3diwNV1X02ZIb1xkRnly4K1uQLoxclRy1UQrBAJnqrbPt6wQeyUw=@vger.kernel.org, AJvYcCUh13cUf2nlb2FCgcgYmrpbKH+ATo8TpjM99DaCJDQXuHUZIuqVfuStlhDnBrWj9h3kHgUzNqze+ScgYMVkTUU=@vger.kernel.org, AJvYcCWE1nUZH+OfdiJM1cGPyRQe1McYUaGiUkvtd30GE/OdIfWAckO8ixoqLK3KYi31DPwJ2UGhf7QT08wc@vger.kernel.org, AJvYcCWJkafOxOgZVib0L/1vtopR/SuFAfj94JBNqI/tlJXgGc3iY/2UeRENjm3LgL3DNBpDjE8uqhO4e/vr6aE=@vger.kernel.org, AJvYcCWJt6hrTb2775Hx3AUJ6m07w66Jjo8ewPvaV8LCt14ksHsyueOrJoGpLPOCrjsWJelFAgAyMpbuaEqQ@vger.kernel.org, AJvYcCWrrTkRMkTskGno23nvQbbB06sy+Ceccz/D7Z4grGyOzrM9l70kINuG/IqAupbKRVIQSun63TRV@vger.kernel.org, AJvYcCXqzKnFkNtGOd30hp5sYFL+hNwxU9RsCit+yeq/Xz28wU1btPwhEminxCnNSmL9zdsdXoeCOdyC3m5p@vger.kernel.org, AJvYcCXuhV5hEP0fzIa34ouoyO4MNg51AUlVoqLTpEeENqOL84wvNq6saOPPbBBtv+LAdVRkiDS+VH4hZiwKMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYRvZhvE/xiAAaWbdFuKxi2Lw1nZMQRE4EH0xjCkAHVJjYM9HL
	reQHKd9dU1I3adlAh2fpBUj1UtDUV3vacDM2tGH2D9lu9z/suQOD
X-Gm-Gg: ASbGncsv3VAPFF2MEWtlu4lHlm43i2aMhTH+Z9AipWF6YfsDem+D5aoNJyO0BsaJg10
	C+hZ0PtKodYDxiXbhPne54LHvDEZb2JD7K7BxE2lHQDwa4sjIJcUfHSOM4nTnqqJhUOlh9CVb0v
	VC5mdOtrTXXC8tpvskUNsGINM9u+M9OWJAJQqq703+UmJ5JideAhvoOzQdknyYIGLxq8hEteFXm
	VXfe0q0Q2dR33oYaU7GPcSlBXeMd5bSafo4VPcv5dZZNoFCT71adHKUEIATze/DQM2zXnPWn+fl
	WfgwLNnKGdZ+IHMul6yMRkj6oFi7mFyR0mV6x51q6F8ZTRuquq3fpPZka4zLQkvYjHA5sDw2gsn
	3vzBtJLamJhmI4w==
X-Google-Smtp-Source: AGHT+IGwNBJ9uLQygdiC73soAXrpXDqbBOmCns+AF1CvbVShGJXMBF3eR2bAQoaLiFjjHj2pU6gDFg==
X-Received: by 2002:a05:6a00:2292:b0:736:a638:7f9e with SMTP id d2e1a72fcca58-73bafbf9c85mr2208922b3a.8.1744187300124;
        Wed, 09 Apr 2025 01:28:20 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d46509sm740772b3a.57.2025.04.09.01.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:28:19 -0700 (PDT)
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
Subject: [PATCH v9 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Wed,  9 Apr 2025 16:27:48 +0800
Message-Id: <20250409082752.3697532-4-tmyu0@nuvoton.com>
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

This driver supports I2C adapter functionality for NCT6694 MFD
device based on USB interface.

Each I2C controller uses the default baudrate of 100kHz, which
can be overridden via module parameters.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                      |   1 +
 drivers/i2c/busses/Kconfig       |  10 ++
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-nct6694.c | 184 +++++++++++++++++++++++++++++++
 4 files changed, 196 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c3e849701497..c2d7be0cdb58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17306,6 +17306,7 @@ NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
+F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 83c88c79afe2..e0938fed74f1 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1347,6 +1347,16 @@ config I2C_LJCA
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
index c1252e2b779e..e7fd9dc15c6c 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -134,6 +134,7 @@ obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.o
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
 obj-$(CONFIG_I2C_LJCA)		+= i2c-ljca.o
+obj-$(CONFIG_I2C_NCT6694)	+= i2c-nct6694.o
 obj-$(CONFIG_I2C_CP2615) += i2c-cp2615.o
 obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
 obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o
diff --git a/drivers/i2c/busses/i2c-nct6694.c b/drivers/i2c/busses/i2c-nct6694.c
new file mode 100644
index 000000000000..d1ba64ec3f2e
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -0,0 +1,184 @@
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
+static int nct6694_i2c_probe(struct platform_device *pdev)
+{
+	const struct mfd_cell *cell = mfd_get_cell(pdev);
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	struct nct6694_i2c_data *data;
+	int ret;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &pdev->dev;
+	data->nct6694 = nct6694;
+	data->port = cell->id;
+
+	ret = nct6694_i2c_set_baudrate(data);
+	if (ret)
+		return ret;
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
+		.name	= "nct6694-i2c",
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


