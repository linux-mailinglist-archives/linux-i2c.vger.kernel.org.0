Return-Path: <linux-i2c+bounces-8105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5712A9D47C5
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 07:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EFA4283CF0
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 06:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2391CB526;
	Thu, 21 Nov 2024 06:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDkEftL2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEF615099D;
	Thu, 21 Nov 2024 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171275; cv=none; b=WPtjTY+8dY7giXofTXaMrMgb/vcGfnfmLKo2SeIepD8gF2hJHCxJm2P5o5Pr/gj2JRmrNyvvpSt3IiXETOoV68AqJ7bwN3O24zTOT0r9mppLyEumTh3an+ElKrsh5kQeK6NdzYNrNbXv0SWgQ4nVott9Q9dRymrVuXd+YBzIAAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171275; c=relaxed/simple;
	bh=44flUDwzHTOuwdS/AmpIAJD6AXf1fHpI1Z+26lfCyYk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EmPgHYJ7UKunDvIhnpFMgf4IJTvESYgUIzwHhevL0F/Id23Hz9YwVzNeXCPQue63Fy9i2RpdAQzNoTuLCho2z73wUTN9XR13GmQbzQ21DWqIbEcHXkws6JW3Bt3tb5YWoJ9J/U/1z2DukLI9DzcpGuNu0xSPc7nk5v4QmX0uAUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDkEftL2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so482379a12.3;
        Wed, 20 Nov 2024 22:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732171273; x=1732776073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z06lEdw1Wb06OgkCMR/MvOB5af33NE4Om1wi64Y5ueM=;
        b=kDkEftL2wvVXT/XWdd1TrBfjFviA4wb18j4CSUQFsvHhi97iQlDApeVMfIVq7WfA3r
         LrR5DF+oStYWCjVg2dfPudaHE6KQtsHuZFpF3PUNA/sh7pQJXKuog8LoNn0Zqe7Oc2zS
         wsE+MovHSMReJYvchRFOd6gdS4J0KZWMeRYUaeG303Zge/pr2pDK0MIyv1ngE0/s7GhE
         NlnHZvIhAARqdzNFellvuw6VyP0wL24+y8wZB1dn7vKSuUqDYTmSjbyVaTitU4Z+JlEl
         Q/9WX9VepjlcFXidz/bTU3aThHizbWkm/PJ6BbkZRQvMYcSsYgXlABMF5nFRWnX9aci2
         JDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732171273; x=1732776073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z06lEdw1Wb06OgkCMR/MvOB5af33NE4Om1wi64Y5ueM=;
        b=waBywvu6NFPJoO6ziK5ROfjHA/HBDrao8daWMDn77J34K4BrwiOjr6/nC+T/ow5h21
         JWM7iTCospJW1ACNt6oh2OjRosoztnPEwW0co4wPFFcOADTmUQ8U0FcTnB7g1Atb2ex8
         XBzPGSyd9Aw2+DKElPrFpmrFigvoUODdamCah0CIK9/xhmv54QJFbdRngmoztn2necgR
         xoCZawI7JOyQyrvhh2CqlaXnrkaRYsAc8DR/QzQf96vmDSzmDj8NVHC1HvGhnE9V77R8
         vpp1Q9QRnQwjNQToJmmzRv+aKEGEQhdPWQv1DWsXRV/PJkHhyQ8UhgwAc6T0OIJqBuun
         LVEg==
X-Forwarded-Encrypted: i=1; AJvYcCU2435wSl+/QZg45xqb+Fksw23Am4Xmjlh8LtkfufyyUtApCbVMOWT/jiIy5Kgvk6QXwQBKf9w8iN8TdPE=@vger.kernel.org, AJvYcCU4KaxQlG8++4qZj/F5FZ94MxFwA0WIu9toegiBFkOXoNAfZmH1Xeodn6PLTpZD3snJp9/TX3aN@vger.kernel.org, AJvYcCUZHapRQEJjKw1hgsSF0mq6CVAKeNA5bEIpxpG7YMT+ogWZMk3y98g6gnywMYqN3wSP6Sl2gN3rfC8UnA==@vger.kernel.org, AJvYcCVNlcsRVG1gM3ohe82T/D3DOveLNvr7Wg0D/qM0TC7WKzj5PZxCDXFSfipxNodtOzJEZVgk2xY2Q5s=@vger.kernel.org, AJvYcCVPI8HnnOi8ii9c21t+fYF5nIhE+FmfYRZlbIAnW8ljTmNddR13C0ahPXVdlIME6fZTRfoNxWKGcP3o@vger.kernel.org, AJvYcCWUc6sgRsP9rNsmLp+aHtCm4TH4EE2rVinv5LuY6jazXfIUW/GLSG89ZMVLJl3tfMRBAXhrgPACPLWy@vger.kernel.org, AJvYcCXJP8qMpaduXhmyf5bkJ1/Q7OwPbwQfYeDm9b2pcGHK5rC0skTWVRXx+CTBU9siyBHeitR2vuGmdkzNdVxzBPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmY1kwCwf3y1AU5u90TxLkTKuhy6aMU8Ow1ragP1+9LaIhqDEZ
	SYGaZoSmhZ8fW4tVXTiIBwhgdJMXmxlPf58r5t0OJCzs+hCFdf5P
X-Gm-Gg: ASbGncuHQGlrZUfVxP32A5ns1EC/8Jqrffhd6ocDnlbikk2ldHqC/1X25X07GYopNCP
	qiVCPfUsiHJisonAfjPl6iioOttPbo2H+c0pwY7PUoBkgUOC8J44nxwxbtp/8zHEA6geO+lswGh
	4/lpMJ19t+KK+BdmA9Dl+GYSCBANbHZhAv6CjjT3C79sjZ+XYsOuQchw6tb3fQAOVsIzlXuz6aw
	1NCfJdIAtmkC5whUCMvVbTf4CbevG3aumZG0Lt2B5UdOJ/pjJBU8LBPD7Hz4lUAL/BEygrwZUos
	59TwTwEelSE9
X-Google-Smtp-Source: AGHT+IHwkLpxRqEoEahyxYL8ckipeHn0RrOylLzacy2EPPt1/BMEDWRQZS0KNwimnpjdKEtj3rk1ng==
X-Received: by 2002:a05:6a20:158f:b0:1db:edb3:ed87 with SMTP id adf61e73a8af0-1ddaecd0d51mr8338555637.22.1732171273445;
        Wed, 20 Nov 2024 22:41:13 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beeb83d4sm2812530b3a.40.2024.11.20.22.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:41:13 -0800 (PST)
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
Subject: [PATCH v2 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Thu, 21 Nov 2024 14:40:42 +0800
Message-Id: <20241121064046.3724726-4-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121064046.3724726-1-tmyu0@nuvoton.com>
References: <20241121064046.3724726-1-tmyu0@nuvoton.com>
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
 drivers/i2c/busses/i2c-nct6694.c | 152 +++++++++++++++++++++++++++++++
 4 files changed, 164 insertions(+)
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
index 000000000000..2a5e0629f860
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
-- 
2.34.1


