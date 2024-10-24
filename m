Return-Path: <linux-i2c+bounces-7521-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0209ADFBE
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E9C1F21BE2
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167BD1C07CA;
	Thu, 24 Oct 2024 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFXQJU7e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0901BD4FD;
	Thu, 24 Oct 2024 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760401; cv=none; b=phJZemTbj0BR7i1k4UzcwFV8v0Q8lUZoKGdHHx3eqfccD6DjQmne+7W0FSE/MStvt7tGhiCvlC1RtpP9c5KwQ+QiM4RZGfB/Ye2eyUVgw8MtDmyU4Q5nb2tJxbCgQdtajRROK42oRz/PnhuZI8spV5oqis718Tj/7St0M0jN91g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760401; c=relaxed/simple;
	bh=WQUkdkll0EZQjEkCZ8F8X+Jv3ok5OWWObt4FU2xYsp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QDFvXkPZs0XW1ZpV0noMPY2yLjpxSLul4zA8XJvlzRVgcLR3hvjNUwlS/7DFwVHJU/WL35ih5bpTYLGGxuoXxfnq0uCXLjOMpP2M4GYxycoELySAUQfsgRB+BHa50BDiFRFer++423l0SU6b4je80/uvf9CLTYpD4XfeYMR+eY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFXQJU7e; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20e576dbc42so5929835ad.0;
        Thu, 24 Oct 2024 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729760399; x=1730365199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZweD2U9xX/45ajeNahBwZRNjF317AbysfEfeb0LtmmE=;
        b=LFXQJU7eyovvB+KXfE5sBf1C0BrJvc3SU3yK7jf+jdprsH/n0DVFqrTBCA+6bNNrFW
         a7Dw1yrhxnPZ5RDUECcYgCZqFj6b+o/SLJBkfbpE/goY6VMGRl48iMyL8PLKjFN1cX50
         zPyZFFCasHSffhV91yutjCDLhEMjcUS7gGq67eWy9Rh/PrwAUG+i0n25A2lth5E1kISd
         nAbK6vkSWAKl34HHxn3/OBBLtayQvcaIMKK6T2x4QfcL+93pkMs1jSoB70Vu5HcWyE6u
         H8jkitzVf+ZKK/6qhTUfGM65qfGwX1UmEzWdXE3rUAKqphybWP8Cux6MjWmmSgJv0igg
         ggXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760399; x=1730365199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZweD2U9xX/45ajeNahBwZRNjF317AbysfEfeb0LtmmE=;
        b=cv2UX+w83+/UIsC44kPnWdKdJqckhfLoaWwPMlPCSFpY9nhiYfWloAmr1wG75h2M6f
         cBGUatBqeS9HoW0TJpH0RpXul9EXvtSi0QDtYnHtp08z9vo8J+ghfaoNTDwRyRtFphyu
         PxPi3+tBOFMSiVTYuzAMKHtOWxYKYyrkgCinIYjgOmjLvMuG0l/JJZ86z090GZCQmbwU
         kdiqf3KBoo4aZAeD3wB9XjNdLtK8mXHQbd/4F73M8qn4JeY7bO9r3Sj+l8xYYF69o5Hw
         UFkxsXabJvGXcXsAfFXoIp67wPVGi9kzYZa2r54mU5JpQ1sirMP8+OtFvshBVfM6anL6
         bpjA==
X-Forwarded-Encrypted: i=1; AJvYcCUHPzJpWSOapsclRaVB3J5BoWVPqhYDRnjamJGLThZ5fO9eBdi+XpOBLvU1i7Bsvs8tS7VIDASs6u0t@vger.kernel.org, AJvYcCULh/CY4mLtC+/pqvoIX8dLPpcvccmQteygzUm/F6KeoHHDyzf1dyDoSG/FQWY0QiQ8LH1caeFnZ0zI@vger.kernel.org, AJvYcCUfgHn2VC+XJ+4CUlgW6jmr0CBkly4idwBeXfAOsQiK6LroH4yzmXuFsN96J26YUGwQ/pvCtlcq@vger.kernel.org, AJvYcCUgnZu75r2mFwKErFFutLLqcM2BlddC7bGJEHjoE0iOlAfGbypT3g8A13JHHtmrl48K+4JD7GeCwaV35UNhufQ=@vger.kernel.org, AJvYcCUhQnyUPFubXbjTTfZckvQdAzpb6yFdW3Ov81qIDJLs+U+0O9kpl2qGlrCL0MFuSv26FlnFHzBzE9WmDsE=@vger.kernel.org, AJvYcCUiQGAkL4AsxrWG74dCB31WxlnIJPPtsL2yjOtY+QllMUe4nvyx35f0b7l3L2EXiVwgeIaFeVkPWBE=@vger.kernel.org, AJvYcCVigO1w4WGhtZA/LAoW0gUqRRJqXyf3W/t3mCafH32XI4Byw2GLObb3N4dXQnJtSAjPCm2mH3UlrRus@vger.kernel.org, AJvYcCVpv1q+PHNMuz7zCaeLuAe69Xp6MuUnj6Vby9muzDAMUQmVkTmcW6jCP4pplxDdqeuiRMAHaRDe+s/P5g==@vger.kernel.org, AJvYcCWfM5uEA/mgwwTfY8fjdjyqsIkd/5EEujLpfMi/z4BTvxaZJW28hTBsW1AIGcA0JPZ7V5oGC0qtgTLa@vger.kernel.org
X-Gm-Message-State: AOJu0YwObmeZailiaquVWwu8ZkPEODqUvLd2Q1aWDe92xsAY1TKQGWaK
	boHqKfS24o0LdmBgyGy+Ujxm3kOVTAKZ594Y+fXPN/HyVlgJB1ui
X-Google-Smtp-Source: AGHT+IGS0YUVIrQJrOqKX4snrMyqjbJuOa1vJLnjp+UhWn8DcszHIP8Vj9VWGI9HdvQXxoSYfHONcw==
X-Received: by 2002:a17:903:245:b0:20b:c287:202d with SMTP id d9443c01a7336-20fab2dfecbmr59088725ad.55.1729760398650;
        Thu, 24 Oct 2024 01:59:58 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6e89sm68503615ad.277.2024.10.24.01.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:59:58 -0700 (PDT)
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
	jic23@kernel.org,
	lars@metafoo.de,
	ukleinek@kernel.org,
	alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 3/9] i2c: Add Nuvoton NCT6694 I2C support
Date: Thu, 24 Oct 2024 16:59:16 +0800
Message-Id: <20241024085922.133071-4-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024085922.133071-1-tmyu0@nuvoton.com>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
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
 drivers/i2c/busses/i2c-nct6694.c | 166 +++++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c86d5dab3f1..1cc64f9f154a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16439,6 +16439,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
+F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 6b3ba7e5723a..01a60de4b8a4 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1315,6 +1315,16 @@ config I2C_LJCA
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-ljca.
 
+config I2C_NCT6694
+	tristate "Nuvoton NCT6694 I2C adapter support"
+	depends on MFD_NCT6694
+	help
+	  If you say yes to this option, support will be included for Nuvoton
+	  NCT6694, a USB to I2C interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-nct6604.
+
 config I2C_CP2615
 	tristate "Silicon Labs CP2615 USB sound card and I2C adapter"
 	depends on USB
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index ecc07c50f2a0..3c4a0ea5a46f 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -135,6 +135,7 @@ obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
 obj-$(CONFIG_I2C_LJCA)		+= i2c-ljca.o
 obj-$(CONFIG_I2C_CP2615) += i2c-cp2615.o
+obj-$(CONFIG_I2C_NCT6694)	+= i2c-nct6694.o
 obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
 obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o
 obj-$(CONFIG_I2C_ROBOTFUZZ_OSIF)	+= i2c-robotfuzz-osif.o
diff --git a/drivers/i2c/busses/i2c-nct6694.c b/drivers/i2c/busses/i2c-nct6694.c
new file mode 100644
index 000000000000..b33d90f26f9f
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 I2C adapter driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+
+/* Host interface */
+#define REQUEST_I2C_MOD		0x03
+
+/* Message Channel*/
+/* Command 00h */
+#define REQUEST_I2C_OFFSET	0x0000	/* OFFSET = SEL|CMD */
+#define REQUEST_I2C_LEN		0x90
+#define I2C_PORT_IDX		0x00
+#define I2C_BR_IDX		0x01
+#define I2C_ADDR_IDX		0x02
+#define I2C_W_CNT_IDX		0x03
+#define I2C_R_CNT_IDX		0x04
+
+#define I2C_RD_IDX		0x50
+#define I2C_WR_IDX		0x10
+
+#define DRVNAME "nct6694-i2c"
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
+struct nct6694_i2c_data {
+	struct nct6694 *nct6694;
+	struct i2c_adapter adapter;
+	unsigned char port;
+	unsigned char br;
+};
+
+static int nct6694_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct nct6694_i2c_data *data = adap->algo_data;
+	int ret, i;
+
+	for (i = 0; i < num ; i++) {
+		unsigned char buf[REQUEST_I2C_LEN] = {0};
+		struct i2c_msg *msg_temp = &msgs[i];
+
+		if (msg_temp->len > 64)
+			return -EPROTO;
+
+		buf[I2C_PORT_IDX] = data->port;
+		buf[I2C_BR_IDX] = data->br;
+		buf[I2C_ADDR_IDX] = i2c_8bit_addr_from_msg(msg_temp);
+		if (msg_temp->flags & I2C_M_RD) {
+			buf[I2C_R_CNT_IDX] = msg_temp->len;
+			ret = nct6694_write_msg(data->nct6694, REQUEST_I2C_MOD,
+						REQUEST_I2C_OFFSET, REQUEST_I2C_LEN,
+						buf);
+			if (ret < 0)
+				return 0;
+			memcpy(msg_temp->buf, buf + I2C_RD_IDX, msg_temp->len);
+		} else {
+			buf[I2C_W_CNT_IDX] = msg_temp->len;
+			memcpy(buf + I2C_WR_IDX, msg_temp->buf, msg_temp->len);
+			ret = nct6694_write_msg(data->nct6694, REQUEST_I2C_MOD,
+						REQUEST_I2C_OFFSET, REQUEST_I2C_LEN,
+						buf);
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
+	int ret;
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
+	ret = i2c_add_adapter(&data->adapter);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: Failed to register I2C Adapter: %pe\n",
+			__func__, ERR_PTR(ret));
+	}
+
+	return ret;
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
+		.name	= DRVNAME,
+	},
+	.probe		= nct6694_i2c_probe,
+	.remove		= nct6694_i2c_remove,
+};
+
+static int __init nct6694_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&nct6694_i2c_driver);
+	if (!err) {
+		if (err)
+			platform_driver_unregister(&nct6694_i2c_driver);
+	}
+
+	return err;
+}
+subsys_initcall(nct6694_init);
+
+static void __exit nct6694_exit(void)
+{
+	platform_driver_unregister(&nct6694_i2c_driver);
+}
+module_exit(nct6694_exit);
+
+MODULE_DESCRIPTION("USB-I2C adapter driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


