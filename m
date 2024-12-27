Return-Path: <linux-i2c+bounces-8745-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 921349FD2C3
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 10:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8C531881FEE
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 09:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0761C16DEB5;
	Fri, 27 Dec 2024 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAArV/EY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3C2156C79;
	Fri, 27 Dec 2024 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735293480; cv=none; b=idt9gZNXgC+VDdc5haRlpCeZnqODJXfNCqTCYts/AYaYDcRkRJkL+gPp8Wu5f83LYsLvwGXk3jIcyu18C8sfacKZFfbwtXDT/mJ4DYpSyc4lPIAFrkiG1wB6S72hr8Rs+eBLGSeGbG0oW6EGGAZKkg3QMA6/oQvZbCDqq5FlS9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735293480; c=relaxed/simple;
	bh=Oz+8IjTT6yvTIlGG+orS45ROIUXnrAoDAXRuuB9/ILM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wevvcb2RDaFuwUdNpea5j0FLuztq9sZBp26lEHBJDrf55DTp8TskK1CA+2q7hltIXpPywG8Eb964WdjwgVHhzxroEsZ+aB7l7yVvv2XKTaQO6Qw+OXxHwBVHtyR48nmZUiQ3zQp9LMXoACodNoP6WM310RwGcfQW6pbRR0w/h18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAArV/EY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216634dd574so58237235ad.2;
        Fri, 27 Dec 2024 01:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735293478; x=1735898278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1uSCfkmb77gn2td6kC3hJU0Smi+Gx6i6fZ+I8uFJY0=;
        b=bAArV/EYJEQ23DhDWPAxZ7f9A0vLMwOWxrnPgmHz16cWuNUKsHoM1UK94sHvj/GRs7
         7UUWJmRpA5/Obz8XkzNcE9fCAbj/pP+ey4jEHW+Nidkj9gRmWL7h+n0jcaS/wGNSXRi0
         /5IOnmMceDobpOrfgq1lRjPuQJu5MSLbgubUoMJ1xsMeX1CK8qxdIR0RPrelHgfVCwRT
         Nj+zEPR1eivncd/G9KAXFWtnAKx6+A03KHPzm+qjVq1me8evkC0IVLUypJR582agkizy
         eEFp2kDoZ777RuHex+Llzhr9CSqBUTt8Edb16NlGDJMFUbPYjJvwTDW+3ie/q2JxEiN+
         9ZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735293478; x=1735898278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1uSCfkmb77gn2td6kC3hJU0Smi+Gx6i6fZ+I8uFJY0=;
        b=eCdpNcdRRN4TSR5U3dTfp22ytMLgix0YrKDDd5ldPm3qSsQ2Yg39nHCokBVrhF2ZK8
         mLdlSVRWIhdqz1Uv5Xjn7ZZ7Q02RciEvbZjT0HwkE60nQSiWLMxsqg23wTA3xfwxIcIq
         PAZ8vgxIQU1MZxH6Eo2uwEayXoR/lnUGS9TaHPjUy9Tgi8FBWVB+FgXH9DuejqoPiK7U
         jwtYBM826hfgl5c3uow5+Onfa6cIKFP+QPRqg//mPFCUthE54e9QnAYYM/r1NJ9ZeHLP
         Iq0xFn9eE96/jl6jAbnUvewcLABG3TkkYvdPZcV8HfOZ+RnlM9IkIRvqzIVDPGE2SxtZ
         4fOg==
X-Forwarded-Encrypted: i=1; AJvYcCV7qJ1RMYfYElU3ePCLqoyQ/tcmrPV/Qv0e50ZtbimDGWpvHCH591Rkk1CzJ/XNQ/uaPxuYUZNVosOaeNve3S4=@vger.kernel.org, AJvYcCVMGhi2423oPVy8iGCZBHmSuJYIC8B3NiHdk8XwFPgT35B5aS6Uwke0tVvxq0cpyg3ixWmT6zmtzwQFJnw=@vger.kernel.org, AJvYcCVTrWJXH4Rgw8I/P4Pb4200/p6AhyLhLTW+oT/zyf7K5PrAc3GTpDv7E6NxMNGYcptfAAestrbwRaJCgQ==@vger.kernel.org, AJvYcCWM8cQWny4WS6PSIiCHR4WK0eSz+DP/ptCTf8mKkDshe4/mWW/PZSLuEQmc8RAF2ivCBQhenEYGygG8@vger.kernel.org, AJvYcCWsytIOuYQlD2xV/WHjeUtDsi/BRN6F3/PVR2Abc+eEp0GZ38kmauJwQ2+hNfYXfB8Gqfc3Apjn@vger.kernel.org, AJvYcCWzDLjq3ORw/3Msu6uMb4uZJidjvH/Qwe36PzqmuZEGzdnEVh9OcxVTXSqfoEMk2Xr1i0LWDB4xdtsy@vger.kernel.org, AJvYcCX/mCkCvEFnv85jTm0OpfXd40SFJyafHrCGImObnnlcTwa14UsFpV/t8aYgCtLNQwIG6dehIWdluwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJDFGSFBaAucPvHbpYa3idkBgmyVnhbLQdFy81MpcNB5PTkXJe
	tEP7FAjVvD5+4z7ILuGDT8k5L60CEE2qSqIH+8tDZYzst8RxbrCa
X-Gm-Gg: ASbGncs40cwyqdxAccy5ImVpG0+wjVHaBsoY4ksAhLylOcLYADLT3jvicXAfmq2l/Lj
	QdWKrT7e/inpo7vVNYhfIAr/+ULkSUPyEUOLxdrDsMu0M0fuWy/Ad4mRGeTdswkSCcAbw7X0pKO
	yHhYFlP/76zAyXEYqwHqg74HKYD1EDJsqdrSCHSU/JewFnCRJGRd9ICZYZvu49+CKoCZqn0nHwi
	aro4TkGtt43b/YAZ9z2UzioDF4hCtktLioJV4RtjAZ6Jd5BgwxkTD1CxIgF4yv+J+j8BlZ2I/EB
	OYaNXZeeR45ASv2EZiI6IyXi
X-Google-Smtp-Source: AGHT+IG+4Flc0GtkcQwfWGzUoSkAcfpcMhb8X0TDEfx6Fer8z3QjWg3Q8YZMxvofvXGTphaOOI87xw==
X-Received: by 2002:a17:902:d592:b0:215:97a3:5ec5 with SMTP id d9443c01a7336-219e6e9fdf2mr406764105ad.22.1735293478432;
        Fri, 27 Dec 2024 01:57:58 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm131581135ad.187.2024.12.27.01.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 01:57:58 -0800 (PST)
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
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v4 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Fri, 27 Dec 2024 17:57:23 +0800
Message-Id: <20241227095727.2401257-4-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241227095727.2401257-1-a0282524688@gmail.com>
References: <20241227095727.2401257-1-a0282524688@gmail.com>
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
 drivers/i2c/busses/i2c-nct6694.c | 156 +++++++++++++++++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 18bf57f47792..5d63542233c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16727,6 +16727,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
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
index 000000000000..9add97c407d8
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -0,0 +1,156 @@
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
+#define NCT6694_I2C_DELIVER     0x0000	/* SEL|CMD */
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
+			ret = nct6694_write_msg(data->nct6694, NCT6694_I2C_MOD,
+						NCT6694_I2C_DELIVER,
+						sizeof(*deliver),
+						deliver);
+			if (ret < 0)
+				return ret;
+
+			memcpy(msg_temp->buf, deliver->read_data, msg_temp->len);
+		} else {
+			deliver->w_cnt = msg_temp->len;
+			memcpy(deliver->write_data, msg_temp->buf, msg_temp->len);
+			ret = nct6694_write_msg(data->nct6694, NCT6694_I2C_MOD,
+						NCT6694_I2C_DELIVER,
+						sizeof(*deliver),
+						deliver);
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


