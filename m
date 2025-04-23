Return-Path: <linux-i2c+bounces-10585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E67AA985FA
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 11:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D7415A086F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDEA26D4D4;
	Wed, 23 Apr 2025 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbBZvG+k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34EB26C3AA;
	Wed, 23 Apr 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401289; cv=none; b=beiHotQMUZcrjU62G2kYWXxt1zdZyRj9Dm8Zo/l1/f4wtd5VG7H6O5ASzRIpe2p3Doa7mM4Y4V3Ly7hTLy9ZQFCgo0YdDEeybGnI6oktGs6pn0Y3D3ylcwMJPnNeBcSh/6KGaa6I3IRpbMAnMF7PuTYkAddGx2/YAg+OvIrb9hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401289; c=relaxed/simple;
	bh=PdX2Z9G4nKGJo2jz2PMGeWuomNQo5Dt2WI9D7ARTKF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b5M73krADyyd3bgIfk2mhYLXJwe0j9B6a+YsqpsuiF/G3DdOFi2DDdBwKV1vTiidxFpQsZ+84iCSzBOYnRrUIgsc/A/k8YQyHrQKxRK5Zq1m7m8ZhSW+EMEem0Yxs31Qt1NR/JSCj2O8CZmd8gfyGGwaN2pVIfCH2zf0Z49g9pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbBZvG+k; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2260c91576aso53293695ad.3;
        Wed, 23 Apr 2025 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745401287; x=1746006087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y11bMIRATf4ZCP4j5SB2imhP7AxGtrFmVMqqdamImiQ=;
        b=PbBZvG+kTM6Cj9bS6GEaZyQsd8RFQqWdOT3QvSTHNwsHnLoOH/P/b2gkKg0FfU2+MW
         QfeCmpI7lcg3uB8Fju70YWwK1rKdVaLDN3wzobS+4FS8wZlO8PY6vLL4eGar7g9cz44k
         H8tIR18SFatzq+SfDknr0MKj9LdbIe8kTKTTx3KujFVA4pj/Ob40/bv+Dxfts2rTPDOh
         drgJVykMlW3Wx+7Sj3x3E0KYOLATWfRzLDhv41wZdhHzJ8hoM1/hmITisZ8XzZwXopUj
         rhZ6R2dur4G9wMXlSCy9DbnVCm+vIFTd6gpRFQ9Rh6bPal0Nxf3KEQ5sV8lo65xwFmig
         y+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401287; x=1746006087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y11bMIRATf4ZCP4j5SB2imhP7AxGtrFmVMqqdamImiQ=;
        b=M24vKvyYxluwMW9IzboPjT0Xn6CDjzHJQmUCeEdOSKBwd7hb6nD57frh5nxnFWzIeD
         bLLIEX7m+51gwycSOcqNQWNSQ95eqMXE124UJSSDTsI+uNFxXHwux+aDYrCGsWWxRMvs
         Avevz9QLZmfMdmn9Pn4Y1UxRdpD5gluhhqgCbu4/UG2yyzgv5M8lOwW11f+NW3iIynL6
         4MVqGhO+Mh0S3XGPW987G066AbxYjtoSYiBrup9HSXtNkl6wOnE8O0tGoXALLJc9JZlH
         rLMpdyjJL/+Ax+tcAVdA0dk95v7RrsNPktoPSm48VDLkHNQdzNjifaLw6wkqdLBS+y+o
         jA9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQeISnuU9HMMmdPLsjPsnE8oj6BxutQFsFuyJ8yYzlfdoYyV6i73uRtTPdJBykb/r2OIcIdrIdofM=@vger.kernel.org, AJvYcCV7YWcLx0AFEKWk5GklxFac6KYq9PNiyKRYb8twPbz8R2BGdN1AYgeXpM0kqW4AnnVf3/j/fr66fNvI5AA=@vger.kernel.org, AJvYcCVDrKu4zKNlfU6nTsP98WPpNEGlpFw0nIpG1XToKh5nCfoZDuJU1h/1yPB6tqCXokVcEBqgqJO3RHnoqg==@vger.kernel.org, AJvYcCVO07joAg5K2v1aejqXuUPwSRdXAnAkNtwfhKUKbdjLzBGGG4lGSnarGy7ddEiFfi6ASp3rBwlPSO+g3Cb0dyk=@vger.kernel.org, AJvYcCVZuJTri9cBNQx+1xsVMJYylAt7YwCOrkw3uJLgmIyuL3ZU1xSvGEO+nFISjIKzisNPUZdQfCYtIxE1@vger.kernel.org, AJvYcCW/uHUJWDIDBza4tcit4ZUb7z0o9mqrIoO1cKwdA2PXlt0jNlTV8A6VYlB46VP/kKYf7E48CGmL@vger.kernel.org, AJvYcCW4SCCARX+TGDYZddZPJKRH8uU6oCklp4f0hJRuVwe93mBZopVPfE7omeugEsaap85eKVKj/WKP76+q@vger.kernel.org, AJvYcCWls2GTcijtOEy/+5Spa06+ah/rkmEXQnrpr/YXZawBoGqMz6J40qC0Gqf02Z1T0u8SrObxni9R9lho@vger.kernel.org
X-Gm-Message-State: AOJu0YzYEx7fllpGeGPKCNe9J/rBV8KMHZtdPtu1gATPo4ivTr3zJYla
	KdYHXV7au+3RafPEolobyZukbGIASB4Z5JI8BfPdOr84LzWLrins
X-Gm-Gg: ASbGncub7nCEPLuXzJQuzKnJLluYQ1I3qg5aSewyS04wHjd8dR0ltFJGjYLqcSxIsJL
	TWC+OGgNwZLoDnIj4pk/Ki/KPlVqnwQZ4RIVVVpyLqr0cAnjbr3o4enAN9cbciNR1aFLSdkl/kJ
	ej6s3YmLTXQC9SuRqcD1j501o8Bl4B10UEKNjF2bgiUeHdWT4khqgZaj88dTba0jlZcC9qdgTTP
	sgr1NGqEt1XtRKr94CsWx3sY3bUCTEkSGldfJGThIXmLiDNl35VpPaKcbLkjTjmwXK/+PYSRArv
	xYM4mazbFbxyDzG2nTDf0h3tw3XFJtUVSAiarTMOZPrUSSiKNtCTaTXCry/xu5UH/OO5qTy7ca3
	RPPk=
X-Google-Smtp-Source: AGHT+IF2JmC/oMdta8rsFI0WLUs+RFtZERG6471yyd4JCqPINtxIbP9w9IfFfZe/bv4yMvkUD072kQ==
X-Received: by 2002:a17:902:e88a:b0:223:f9a4:3fa8 with SMTP id d9443c01a7336-22c5359e645mr273770135ad.19.1745401286984;
        Wed, 23 Apr 2025 02:41:26 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4b8esm99972775ad.124.2025.04.23.02.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:41:26 -0700 (PDT)
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
Subject: [PATCH v10 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Wed, 23 Apr 2025 17:40:54 +0800
Message-Id: <20250423094058.1656204-4-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423094058.1656204-1-tmyu0@nuvoton.com>
References: <20250423094058.1656204-1-tmyu0@nuvoton.com>
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
index 0564142a415e..751b9108524a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17362,6 +17362,7 @@ NUVOTON NCT6694 MFD DRIVER
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


