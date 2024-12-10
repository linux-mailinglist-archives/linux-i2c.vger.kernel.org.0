Return-Path: <linux-i2c+bounces-8405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B289EAE5B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 11:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C699E188969A
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8492212D9E;
	Tue, 10 Dec 2024 10:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npVzokD7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6952080E1;
	Tue, 10 Dec 2024 10:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827569; cv=none; b=SQMbiIJaxbnXayq26BTdLjniQ2DWPeEox6b9zZGlnQ9J9ItqBSuPmvlmFV7rudRYSqErQlzJQXXUeubsoW/sw7TO0oDZM/CDt+L623Et8AYx3KhQ6hqPuQ2HMcbA/x6XFVo7608iHCkjA+87nLVFTdcOgoZ5d24fl3zw+oZvFhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827569; c=relaxed/simple;
	bh=Z6F3eRAuhXO9VUUmT/riu7SK4EQypGN4L4hXSkiHykg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WB1YcTNmo9R9pUzxg6UKVLdsF+on1c/Od4PKbTt9cE5kALMOAUhNnllJ8ALg41yXnTXCq2NUDJTObSvnPbYi3BAfdng5+F8EAr1H59Ii2lBQRD2uj3TcTJo971gCwScgLJPeWbL0ItIdjE1jixt0sJiHDk/DZBgy7tda926YtOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npVzokD7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-728e3826211so253623b3a.0;
        Tue, 10 Dec 2024 02:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733827567; x=1734432367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kjhgk2Zvgj7qnMLR/cKzgPLYV6OR/8sRZRdLTTFtuwE=;
        b=npVzokD7YWZNeu35ZwRZo/b8O8zgJIdkulgoOGskKWRhJgYUQgl1FOOyDpWRD7MWDF
         mLsVahXMFNc7qqs2Jlbqs+aahZEsZdMWVp8hMp1WLeFX/0y/q/XWtYj89OxCBcRIQo4w
         lo3rT6mcTV5eK/M6hgbnw5HkuY8kau+fLm7py+CF+TENgEO6pPsbHV9QMaK9ON3y6/Np
         ayJAp1v25Y4nLcSBdIVKV5+cYQy1hnuJ6VHneIwExbLsFS4ArjV5h3AeUsaQGu04iFCa
         UWoe4bREaVtSZfL+VOp6zL0ru8GwC8tcS+ML6dAKgCZ5rJMkyfrZFqEUvJPoUfrJNQqj
         K/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827567; x=1734432367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kjhgk2Zvgj7qnMLR/cKzgPLYV6OR/8sRZRdLTTFtuwE=;
        b=bbT1pZ4GQTnoTPwibV7do1gdqA1fXDdvh3lVaAMPlBtolhKa54h3/5FxXEm7B6OcfR
         zSOi3T4a6pNCD2yC3uoKmpL/gzeTTQlOwfnvM3a1CkIwgXCJShvxFcDqE+4I2GN0mC1g
         iQ4jcwpdoDa+fk9O84mP5Pw4I+5EEqniNCOjYezFYrFBoavuhqOwb0/F00Kg7oK1Pno7
         /+agU8BD5O+E9ARGldCdlR5V70B1ePnNkHpxCkYJGANpivMbJ5Gy6n9ZU5px2LiRp0qp
         GbNA2/jHlpbR3jynQjqRH20xQcWx09+y6BhVXMn7u5oZtfu0OMp3pSB69ZDS6wdb3HoC
         4O0w==
X-Forwarded-Encrypted: i=1; AJvYcCUF9JMCW+c7cEYOOeo1fy7Vzv88+f1P6rMQ9bAz+Eb2BgMQaijtZNtZMfy6jVUzgIC7+8QCzfafCfUn7OWWrC4=@vger.kernel.org, AJvYcCURGn+KIJW+05iV96Fz3Rkro2DmM+GRfa2gyej9+s4NLcBraIFb7JjfLM43EZQKVJYVr06Fj97b/pFjnA==@vger.kernel.org, AJvYcCUrDjsOMMuD44KJPlLIV5VMcZNAKEWvFla0DfkdC6oTBw/U2fjJUFh2NBVcGx0ZbvBWv5vK+HnP@vger.kernel.org, AJvYcCUu45oxm4poWQvOl4DMh0SQszmBSd/yHNiWipcfxLtkWj+shMUyASrpHIiajouZoQMCy8kPpaJxaWo=@vger.kernel.org, AJvYcCUwG+WEcJRW+seO1lUhxcp7AKYWms24kjjoW9yYYR4sfaneYxu9KPPXeCUF14/CS2Pcj9WVnzB6CowY@vger.kernel.org, AJvYcCVXYFd9Ap8LHiuIw0gL+lfeQ2omdYjayD/QO6BCUYolPmARfuOVR2SAkwLRi/X+Uh9DT19m0vb20TFT@vger.kernel.org, AJvYcCW11PHNO0qFWBl97/LC7IFVgBAIVnrHxi3+mMEXP3dpnBdUBpjUj8WOMutZizpHN39QGWPu5qAQmzAmqrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YydneaAxDyLBC7KQ4NjhXwS0D0G9jkmz5j+9pZv6APjJWIchfFU
	Q7Fk+g6efVa1ieVNxD3j8CJUsZkaIaowrngjOj+Czuehvafo2N6p
X-Gm-Gg: ASbGncs3OQnzbhuZYr5IeoQjYwE2s/OhN9R/kR90iMNx0WzTD5YGviBq1aZXRO2JmB7
	vPOhSJyptvOHzmYvvSvDDr98PJAwQGdSFcdhlcCJpGsA5M3umBHOb8XBVZ+qirfNVP5VB8xZsGB
	yUcrta4oQ9/apCS6eHoxF/1/OVhQ7SMNLiQ/MOeR5fcxf9107kwmg1DdwOaBVqCd2YYu33cw4K3
	6a0BVrtkqV2tiqY9iDZtfBxm4zNwyrPCNQDGEdb8rPIb5qEP7znwd2+xtkeuMOgKhtxelIHgnkt
	8oK8lM1YJSzONyJN
X-Google-Smtp-Source: AGHT+IGcmRh7UzCz9/u7BGNTao72grjIpGh1gzZ0OxBmDVW9R8jXOmYK2CA/uk2luUqcqs2q1jl5Xw==
X-Received: by 2002:a05:6a20:158b:b0:1da:2e7c:e510 with SMTP id adf61e73a8af0-1e1870a77c2mr24476435637.1.1733827567026;
        Tue, 10 Dec 2024 02:46:07 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156dfe2fsm8905748a12.31.2024.12.10.02.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:46:06 -0800 (PST)
From: Ming Yu <a0282524688@gmail.com>
X-Google-Original-From: Ming Yu <tmyu0@nuvoton.com>
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
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Tue, 10 Dec 2024 18:45:20 +0800
Message-Id: <20241210104524.2466586-4-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210104524.2466586-1-tmyu0@nuvoton.com>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
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

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                      |   1 +
 drivers/i2c/busses/Kconfig       |  10 ++
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-nct6694.c | 153 +++++++++++++++++++++++++++++++
 4 files changed, 165 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6688c5c470b7..a190f2b08fa3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16546,6 +16546,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
+F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 4977abcd7c46..1962cf1e71f9 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1325,6 +1325,16 @@ config I2C_LJCA
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
index a6bcbf2febcf..6d2fd8e56569 100644
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
index 000000000000..d35e1ea3521f
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -0,0 +1,153 @@
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
+/* Host interface */
+#define NCT6694_I2C_MOD		0x03
+
+/* Message Channel*/
+/* Command 00h */
+#define NCT6694_I2C_CMD0_OFFSET	0x0000	/* OFFSET = SEL|CMD */
+#define NCT6694_I2C_CMD0_LEN	0x90
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
+struct __packed nct6694_i2c_cmd0 {
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
+	unsigned char *xmit_buf;
+	unsigned char port;
+	unsigned char br;
+};
+
+static int nct6694_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct nct6694_i2c_data *data = adap->algo_data;
+	struct nct6694_i2c_cmd0 *cmd = (struct nct6694_i2c_cmd0 *)data->xmit_buf;
+	int ret, i;
+
+	for (i = 0; i < num ; i++) {
+		struct i2c_msg *msg_temp = &msgs[i];
+
+		memset(data->xmit_buf, 0, sizeof(struct nct6694_i2c_cmd0));
+
+		if (msg_temp->len > 64)
+			return -EPROTO;
+		cmd->port = data->port;
+		cmd->br = data->br;
+		cmd->addr = i2c_8bit_addr_from_msg(msg_temp);
+		if (msg_temp->flags & I2C_M_RD) {
+			cmd->r_cnt = msg_temp->len;
+			ret = nct6694_write_msg(data->nct6694, NCT6694_I2C_MOD,
+						NCT6694_I2C_CMD0_OFFSET,
+						NCT6694_I2C_CMD0_LEN,
+						cmd);
+			if (ret < 0)
+				return 0;
+
+			memcpy(msg_temp->buf, cmd->read_data, msg_temp->len);
+		} else {
+			cmd->w_cnt = msg_temp->len;
+			memcpy(cmd->write_data, msg_temp->buf, msg_temp->len);
+			ret = nct6694_write_msg(data->nct6694, NCT6694_I2C_MOD,
+						NCT6694_I2C_CMD0_OFFSET,
+						NCT6694_I2C_CMD0_LEN,
+						cmd);
+			if (ret < 0)
+				return 0;
+		}
+	}
+
+	return num;
+}
+
+static u32 nct6694_func(struct i2c_adapter *adapter)
+{
+	return (I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL);
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
+	data->xmit_buf = devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
+				      sizeof(unsigned char), GFP_KERNEL);
+	if (!data->xmit_buf)
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


