Return-Path: <linux-i2c+bounces-9068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C177FA0FF58
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 04:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 789983A208D
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 03:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8E323C6FD;
	Tue, 14 Jan 2025 03:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYaV34Af"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1341231A54;
	Tue, 14 Jan 2025 03:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736825440; cv=none; b=PM23Fq4RfN3mGSbX/DsSXieWMndE9XATjEAog2ucJRS2RCXe8UUqKiJyGIgjpGo0m1qhsOrFA/LzCyRLB1kZGTbRHBLi8IHO6JuRm3he7Jm6mjQpwnZxllbY53NRPNZJbonjnywF6X4/2zCyChvP+i3H2VrXw+F6Q2cmnHRYDEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736825440; c=relaxed/simple;
	bh=prZNoX4edYcGSUid7EY+pr0eXJn0Fg/+a5q+1fBgN6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jc8fGuMm+kiiU4bfTVAq6VCmw2mlbYm2DinZkeUl0Qpo1eYsXePmH2H0dKOU4siwyiIseW978kriqYFB/LHo6CMNjrl6FVmlK/ZtL+x70qCkLYDfehDKE9zv08ZppXvZFjts0XxrwB08iyV4jIWezql4RvaUJWmdlZnak1tN3/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYaV34Af; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21654fdd5daso84886565ad.1;
        Mon, 13 Jan 2025 19:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736825438; x=1737430238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIhh+CjnkRORhsX4Je/ArH+6qKnVLW1QQRzWbrojpNw=;
        b=KYaV34Aft5pOxapDSwYPPU+6zDkIia7mB7We3QcqT4ZHluYxO649gqJPhDTDIc3Hcz
         1CieBI/MfefVBPqyCpOZUWR97p0iOjUo76/zyikumeEdP80SkKQrdxTTXFQLp8qj2+1L
         KBRn6MZj0LvMWA2RA/o7EOLCHHkX5gwu72P1zxiVZp7pFmgFA8ImqlwaQt458gLzyIxd
         KYplxF4gUqFRVASo6BA66TUlR+6e1rj6HDb0UiuOi2n4virCXV5tCSLQj5/KqYCVbBNd
         sXMRD8z+Ij1s+1E0mTvLzetPkfoQAw/wCTOA3WZDh3tER2FiweOItRFj30RI3QSnu4l8
         nI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736825438; x=1737430238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIhh+CjnkRORhsX4Je/ArH+6qKnVLW1QQRzWbrojpNw=;
        b=Uz4Ad+LAEIb4h1dOeJTh2Us4/LBMSe7hjboEEzajT4fkgfHUJglH/HPutRyAbysevv
         ICxnSPKNd5dtRIaQNb3niE0R8RcqDSSQET0FAPVr4jTHyMA6QOjJbc53qvCzkt6JnB5L
         ttBY6ueRgUJquepDPq04TWWuzDbfx9pznvZIzrsnYQEvSD16otYsx9MIFfmmLReSBhwj
         BQlXyenQkP3rvwQZOhtYShyuw0Trs7Gr/kXmpbwv3ypMOV0glswO37lyuWoe2z8zY1Uc
         U6GibLQqH5tLgmMLs2ZZiOkWe9JlNffxxjDFKp3CYNqhhbL3sIDTFdo6pLfxmyLCle+r
         Ocmw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Mqgz7cCxn6hxUdj2WlsHQg8Idy5o9JhKPTP9HPYxAGtx1GwjlhePQvEzHoM4U5MMmWcjOrCFPNwd@vger.kernel.org, AJvYcCVB3sRJcoIxut06O1gHfyWNRfYKDodryYHZFovdXrH54rCZYhTanr6pxcgIn6BbNmhlhrCVqdGKTNs=@vger.kernel.org, AJvYcCVX4DWMlUfWptp7oKcmRPpiFOx72oFR0n0+vTq1NizR9mdOu9ThQ+TMLJtZfv7/WGGqb+NKf9t27PGuIorW7vM=@vger.kernel.org, AJvYcCVktxYYVL4Cuef5Ob9cdxXbg5ed51M3S6bNT4bjIpxflVJwophyXoU1albTYBrOvDKodx8Mcy2tPvd1yQ==@vger.kernel.org, AJvYcCWDuM5HIuonxmF4CZQUhi++m08zJXnRwVT7FUDw4QBQ0sgMAlYc1vaf2oLYEZV1vZeNSBl2XeVbNChn@vger.kernel.org, AJvYcCX4LuHX5ahsZyUFQzjraqM/+yk3o4T1zeRKrKpZ+6ewEIRBzLY3Q4kzFdNVMxY9UrY8d5oRZzwAlmdFj+g=@vger.kernel.org, AJvYcCXB16hk6FNMTM+upmBc2W4t1oVK25+cAZeQ6M03zgV3P7pWKr0AYrJKpiQJzIQTQ2tS8uPRm7jf@vger.kernel.org, AJvYcCXowxnyEsHJSPmqwGSGGd0/ButsqD+XAnUFlBd8nJT7p8XUqQySyoGsmqSsVN3OJIrjtszwacm0l3Jv@vger.kernel.org
X-Gm-Message-State: AOJu0YyVK0OQ/2fNGxRyHiU4r6rnJit4xnce9xPaCtugKZYrIFHBGpY9
	GUG/YB7Fc/gq8fkAnFcGWhA5TXEdsiT31bkTTlj7cnOaJXu5DVD3
X-Gm-Gg: ASbGncvS/TVoOqR3OCeE8xXZNLveVZvQ1DpiR/8IH29JUCABxlt6wmfhTUU47onGCAf
	oFfceT2ZYakeKqxkcrwMOGrg4MrQW24cj+RESlsURc6OPIZa26RL+bXEj9zmRepGO6j9lODqDnA
	qAtbJQPEPKHmNfqrWByH3lFAsi2WDcctaTJ0/kMNCdmoKL+nnkJ8d958klb6v/3PoaPwL5YW894
	sAc9Ni7G2u0XP2Wa1Zm9hlOysSqZ+nTGK7LUtASC8cZV1QC1RQldUKjtFvNy6qq1OVP7c9A19y8
	Een9tp58nVgRkJ/e1QscUEg6
X-Google-Smtp-Source: AGHT+IH+vafbbYouzCkmmSvb6/L6mWNfaqk/WjTtXqMuBtrPaah2aqvmDZzONTzIY4xWgLCu6pvjnA==
X-Received: by 2002:a05:6a00:39a7:b0:728:e382:5f14 with SMTP id d2e1a72fcca58-72d21f314e9mr27603927b3a.9.1736825438124;
        Mon, 13 Jan 2025 19:30:38 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658b71sm6595400b3a.85.2025.01.13.19.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 19:30:37 -0800 (PST)
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
Subject: [PATCH v5 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Tue, 14 Jan 2025 11:30:06 +0800
Message-Id: <20250114033010.2445925-4-a0282524688@gmail.com>
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
index f752051f4c3b..4e72f749cdf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16722,6 +16722,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
+F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index ceb3ecdf884b..a3f60e6953bd 100644
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
index 000000000000..49e8110662e2
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


