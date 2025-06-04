Return-Path: <linux-i2c+bounces-11242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB49BACD6F0
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 06:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55D8F167AF8
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 04:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C8C26462B;
	Wed,  4 Jun 2025 04:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNWs0eDv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7493D2641EE;
	Wed,  4 Jun 2025 04:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749010493; cv=none; b=rbQbHWTXphYSLC3HfZS1xstsxb228tGOWInj6zdItIvsAyEuBDi8rYt9n+EObM62Zw6Wj+7Nf1se6rtIOrNY0WJYBuHq6Rc3Wqu27HyWNvMzgJtRj8HIcjfte8OKaK2ct06dxEZa6l0h16DEw8W/wRzmkKZrkPWm5F/sgwiKOuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749010493; c=relaxed/simple;
	bh=P9DbXhufhNpGNZ/l/Q9j4NJldsw4zeSI7ZzEtsUDA5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=go3lxq5HR125HcDy/ibmEZZPviQ+ETAiul7faGQl0IJ7HWt95EabD6n7USDsVfZOS3hU2pEJ02JfVYqn97DeqWq3DzdDpMrRSK6S1VboK/tlOPqzj8PKldnK/leTZs1cqJhcpQnmcHEnXkRC0TxNRcI9yhGQS+787QwAlS60Nu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNWs0eDv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c9907967so6304688b3a.1;
        Tue, 03 Jun 2025 21:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749010491; x=1749615291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jO/mrljMaTXAKXPTk3+o0fJhp9XEcyn8NAWkjAgQusQ=;
        b=gNWs0eDvpHe/3m2YZa4ZOOE2SdeHDCu7gU9dy1eMWRK3Di0M/tS5anTLFD1N66+Sgs
         HWqRSOYNBS/oRLNNouDkf5/1n4QP2wnSyp4tqU+serDhpGJ4gWuH1ouUUTmlMZ+WdjOe
         65JmHCtjPdQC9CodztrPHBuKAOqIn3yoQPOxhstnt/tz5ZfqQ2tvZ5CpxAyxAARWHEzO
         6Xef0K+zflECao1+PyFQeVfX8CuWlBlDszXX7QLc1h5iKCRpAx/BV0loO6q2IZh6oOnE
         YFts8t+X7TPZrOLe1HgTlLUdzDu326Z0Lcud/CREn8bsM+kUqgf1LGLXox68LWTPH6gU
         OpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749010491; x=1749615291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jO/mrljMaTXAKXPTk3+o0fJhp9XEcyn8NAWkjAgQusQ=;
        b=QSCeU32XTuODzolfj3ETqq3AYIK5tZzNcmTDb7DttmX9dSMIn/CR4hsNt7M/Kwflg/
         UYs2HEVL9HbR4WvF+ZC0uOOBWSVf1/aXao976QYQwpjV/iN6RNcB1o9s5Lb4ADws6RIo
         ifx4OuP6tVAdsu8s6fjdZTwF5NvuPvd8WWtVn4IYnnUh4MhjZTNNJp17MMUKKbHYSZNb
         pyxCVxGF3HTNi4XdBWYMoAeJ/oPv5evaMltRtV/vBsX8VoYfcv2RWUFFmHpjTvFHz7Od
         P2tUdrfX+0W61KtiX/jijUSZowTNrRVHaNi4XLPQVpwUcjCthOBfiCNWFLR+fYoNXxDT
         FexQ==
X-Forwarded-Encrypted: i=1; AJvYcCU37QpWz0P9Kz8TFsXLMe2Atttb0BMIxSEnMTBYo8jVBG4UXz4cdLEIjHPmxJTpDl7GC8BZ3og8@vger.kernel.org, AJvYcCUtJ4Nu4ckC+a+TKxA4sBUIgcAlYnjaqEOLf7afNguaqHw52BvnkzC6A42i2Rjue0ahuOkeYAZRVNUZ@vger.kernel.org, AJvYcCV/W2D81r1hbizvRxtiptAZ55aXvKBk3SBOd9gEafRX3zyqJyzLB8s1PHtHArZKxeP+z2teCL34SptpFFrZU1M=@vger.kernel.org, AJvYcCV64OKTo9KzwoqJlqhxFpkY95VpBLGDdy9x2axwATv+dRrXZrMldmgOiQRU4to15owpigXUIO62GNB7G00=@vger.kernel.org, AJvYcCVAd0pdjIz03ZkYVJF5Slp+LMNceQVlFriAQMNZKPU2pnY17ehc9Sw1MyItElX+SF89OB1umTqvNbs=@vger.kernel.org, AJvYcCW2HNhXFAICXl3wVM3AZizPp3/6iDrOGaT8Zkm6p87MfHSnM4+az2bKWt2Zf//yEkMFQxSeHuGcB5ZE@vger.kernel.org, AJvYcCWQrCicKZodhWk9vULWjpn1YQZS2W+5cHcaYya4kWxCqF8UU6sId0amvlwngrWbByC460DfCwQmu6VCbw==@vger.kernel.org, AJvYcCXIy8aCIVW1DWkdlA/Kyc6qjHkTsdNxVbQOf6aT6tv2sdDYpy1S5UpDmWynZvyLpfAuHhXoEPZP9PwJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzSpK3OmLcxLpBZ2Bo6O1k0jLTIPoIW3/czKknlOy7GYT9Abniv
	XuH51WA6fs7OsHTvsBjKNxkew0JweR7lwROvR6X7leJeLrQC3VWeumbq
X-Gm-Gg: ASbGnct77pF3QXuivq6HsCNYQnlhGu78KKskTBJe1blKR3VToIW8j8Xt5UsHrI8sQMY
	Qx0b+BBro50KbvSUNKUIrIW7bPgm1Gr/BDRr6zVDhVhqf5Fcezu3rV658uY8feCqQfvBsieLf98
	a9IEJ/Ve1yEo7RYY0iuIMYD9Wz4sM5yHqtD8nH7ZYV5GgU348ZcbFXJwuoc23iDbfh5KGy9gwL+
	OYfjcUkWuEtwhF5s9oW3p6JixfV+T8sZnr64P3RszTLqh1+8ZXjJXDPyXyqsCJ9jwXhGKb/1Huj
	C7Q+4Z9JUTPmLAv/JpaQKjdo9PiVQjK1xJ6RmjIR/uXiC4UZlHABbeCPbCeSwt4vodII0gCDms3
	GEOaFvQkiNYQ+LA==
X-Google-Smtp-Source: AGHT+IHgixsKg5AaoFfmHREYtBuL7q4LjLlprQ0fWWBpMXaabrFi6CaRWZuZ9y5rrnN89qXCMx/5EA==
X-Received: by 2002:a05:6a00:2346:b0:737:6fdf:bb69 with SMTP id d2e1a72fcca58-7480b400f97mr2140154b3a.13.1749010490584;
        Tue, 03 Jun 2025 21:14:50 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff755bsm10526057b3a.179.2025.06.03.21.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 21:14:50 -0700 (PDT)
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
Subject: [PATCH v12 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Wed,  4 Jun 2025 12:14:14 +0800
Message-Id: <20250604041418.1188792-4-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604041418.1188792-1-tmyu0@nuvoton.com>
References: <20250604041418.1188792-1-tmyu0@nuvoton.com>
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

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
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
 drivers/i2c/busses/i2c-nct6694.c | 174 +++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6851f6bb5fc8..be6486b1a78a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17683,6 +17683,7 @@ NUVOTON NCT6694 MFD DRIVER
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
index 000000000000..7ffac965a01f
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 I2C adapter driver based on USB interface.
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ */
+
+#include <linux/i2c.h>
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
+static int nct6694_i2c_probe(struct platform_device *pdev)
+{
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
+	data->port = pdev->id;
+
+	ret = nct6694_i2c_set_baudrate(data);
+	if (ret)
+		return ret;
+
+	sprintf(data->adapter.name, "NCT6694 I2C Adapter %d", pdev->id);
+	data->adapter.owner = THIS_MODULE;
+	data->adapter.algo = &algorithm;
+	data->adapter.dev.parent = &pdev->dev;
+	data->adapter.algo_data = data;
+
+	platform_set_drvdata(pdev, data);
+
+	return devm_i2c_add_adapter(&pdev->dev, &data->adapter);
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


