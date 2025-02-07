Return-Path: <linux-i2c+bounces-9337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 878E4A2BCBA
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 08:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70C9B167942
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 07:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F095235C1D;
	Fri,  7 Feb 2025 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajEiivrU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFF4233149;
	Fri,  7 Feb 2025 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914333; cv=none; b=XC1wmMkXmTHYxH+s7Bc2oMbqrzMbMEgB3Cjx09KpAycw1n6sCuxRBTTgK6Z1rE8GT6sFe60rjnlDL6Is2aeZWVVAPGvuXKbY2p3+OeCsdEcVgGvxdvWr7r/TIsbmx+nS6UcnxQGmjlRbL8vaGd0KJhre9wr7uHmaDXaJDj7OZKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914333; c=relaxed/simple;
	bh=RXsq1NcL3DKTjfS8a6SN0dZw1IKe2ELzM77Imhm+ix8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NdRuib6rXE1qUh3/hZ4o4tyisln+Kb6ChUd9mZ7NAmvaQcL+pG4rnkL4uAuarktaTJ5I4vkajknxoU+sYAfhEWZuBLAejukF1UIDGMZ2bvENynjpBxHS2BputyQG+jr9BobwTHs5VM3HsYR0amWEiSEg78tqMG3LHrH9RDOzzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajEiivrU; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so2801017a91.3;
        Thu, 06 Feb 2025 23:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738914331; x=1739519131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FO2aEDA5hjCU4efzP7RpvFcN2oikBDau/9P080xiKFY=;
        b=ajEiivrUNKqVW4xT649APBHz3MGNbu9zn2iPVxuA3X7vGBcPk4qqox2QPF1ertV0pk
         LH538I67uPw7RnRk2hffM3NsstKCd3UtERlu4lkTvPM6pYz6Nb17S4RukfJv4fvklZsp
         peT/GNw5lgpaF8cfg3OlaHGOvbyptZGiEdjN1tQ/0TztOa/lmwXOsETAFbpWXFRlmUTd
         PzcsfPS2/xTOWHpw02L8Py2Op6a69+ix4i1vfxDTFGAl3eHN6JjJrO8F6ROInmPzOgvU
         7mPkvPWyoI90CDlh9blp2g14SaAV/qamD4b0/GldYOjUltVHWmQm0jdXWs8J5DSweXrX
         mCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738914331; x=1739519131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FO2aEDA5hjCU4efzP7RpvFcN2oikBDau/9P080xiKFY=;
        b=qxUlgOzyVBHhrSPXJjMyHf5z+8HsPLcvme8Dvd21GJUg7JgJLa1LX1WeH2KdEonIXn
         OYT2KfADt4iMsaPSr/tZO+VUzZvdKsIVtllnr+2qgwRkEKtoj6Y6UQo5614o97aqbJL2
         T+TnjJT0pEC+vWT2rvdGsAbSfvv4RbkhCwgTb3uA7rJ8SWdxt/wWwtpCdQAzO9ppGM3V
         oFXAKk/BtlVzq806pChV/c7O3hM46DfpyjVfU0bUXbB8HBjdIoz328kDxozKyY1uZTgl
         hJfk+0BSs0XsUzkxm1rpf2N5CJyYdNkMhVfoMel8k7U+gZcHfpKCDjbI9zXZJknvtto4
         Wq0A==
X-Forwarded-Encrypted: i=1; AJvYcCUGJcHcVhn41PIkQ59R5kQEh2JHb2yoGWuv7Dsi/B/A8v7s21pCFsUiA8wtCBVUIGZoko5Xabgu@vger.kernel.org, AJvYcCUzD88CNT4w+1FU781Xm3t2a3E8DGvmFSv+y1vLCWYwX+RXYZBJFufkxOvxQTyW3ARlDXfBDaUU/4K+@vger.kernel.org, AJvYcCVfkhYLtZwC2p1f59Tbd3k57KojJw7Lv3rZkvcVSiiva5lQ01SnA5Vr8r24VnD/wr1hwYCUd2x4dOQ=@vger.kernel.org, AJvYcCWFzoQnPidHJmFWORaHNgPNpOJHPv+rpPg0o6UltPxk7AqfPC7wwoZ+XvDhSAw3bFipF5uKMM6R2oyHp+Kqxnc=@vger.kernel.org, AJvYcCWKvR8hckF7vVDJfTnZ20x0RFykw5GrNZaTWAV5o/P+YUttT6zkZ4BxatHzQDQL4R+su4oD1iHHsjSy@vger.kernel.org, AJvYcCWOOx1LGg449Fzsx1iDgcWBPNT8/CpKzmnlBr3jLwW/KB8zoteohTGc51TZq0FUhmUf8VhnVuyMEde4@vger.kernel.org, AJvYcCX29DiDU2sEP8gIT8VpJ56PHDBpICQaI/w0pbUNGesU00RFkGYdRkSSj1ks/4iJzvrW9lb+sBMxMd6Ttww=@vger.kernel.org, AJvYcCXvAQAg0c8BaCvEabAgFSt6hWesTNVf03VBH0K9gl102tj6ZO5OxfO8ZzhbjlHpb0Uk66WhoBvFLAyDnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7O34InFsWn1Cf4LEuSlGjgVH4FBkT/cDGnPBgeMEFJ42itQpB
	p7clZftAXMKhWXqxGH5gTZn68cmH6jlMc9PRX4cEqx1WaCAuvcby
X-Gm-Gg: ASbGncudNI+tL/NQLAYyiZruL9qjUUXDJseu3P58guElMW1wfk2JTVFYVtPZrYN0m+V
	iBms60WYoLLZbok9imF1HUkFXKLkRd3iP0ezZbpcyMnwDDi5CL5lRDZ7LqAmybW2f1LeISjK30Y
	9dKFUQZwm4udJkkO4qaU9FyTTDIrgUJfRXZ9B7ZwtdFT9435IIo2M0v03k7kWQ7LMWZp+VJrhaf
	PgqHP6WR2cRr3G0p+UcTnGi2LI7g7Fk4VAXm4FBjc2G4oIRaOZtWg3UrmmScWhIWUqRy5YBA9eF
	50c8Qj3Fz4bhRHNS0K5ONTXIDaIcuLt5ev+xd1y3bn4CAHKZEy1Zc6xkckU=
X-Google-Smtp-Source: AGHT+IF1AhhsJLi1YrJJXC+6SaqP546/+M57iunqBeZZFSrSsaqHdODVWhDBgLGfhak8G+MPw0rDAA==
X-Received: by 2002:a17:90b:5544:b0:2ef:114d:7bf8 with SMTP id 98e67ed59e1d1-2fa23f5518fmr2906960a91.6.1738914330742;
        Thu, 06 Feb 2025 23:45:30 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d5f8d6sm4967367a91.7.2025.02.06.23.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:45:30 -0800 (PST)
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
Subject: [PATCH v7 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Fri,  7 Feb 2025 15:44:58 +0800
Message-Id: <20250207074502.1055111-4-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207074502.1055111-1-a0282524688@gmail.com>
References: <20250207074502.1055111-1-a0282524688@gmail.com>
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
index 000000000000..eb5b44182b5b
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


