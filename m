Return-Path: <linux-i2c+bounces-11057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 987E7ABCCB3
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 04:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 648DF4A4A9F
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 02:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85E8258CC5;
	Tue, 20 May 2025 02:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGhwQuTs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA372580E4;
	Tue, 20 May 2025 02:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747706665; cv=none; b=S9WM0rPPOjvGU7L6pjozLgf6QtgBpAT0bz1c87U77LZa+lbQqiTnkKkDxZmHR4GR4zF+NOhcr9+07RzkCwXTyWSihpwOAAdL9zyN2GKNNhsCoUPPu+4q0H3BPy8d2UXaTh3E9VpDe8Fp9GI/0UH+J0Jdk8LqKL0CWLdzz1cqNkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747706665; c=relaxed/simple;
	bh=SPmU5DocE7bFLj6MhdmL55Pakuc3u38KOa+2BOvt7Ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CAp2ORUVMDRixiLSbRXOAFi7oIPAjhRzrXJBeXWqJ0FOAk8Wm93HMBeGj/6ep0kKfeaHok65rpwyYCAAVgR8xkPgEuI837Vvyq+rkz0+UXdkO8hQQwlptWV5ryRyh2vLBTLBUeo5k5z/s0h706oKQBbfpGft/nMELDrtOftlTGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGhwQuTs; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23211e62204so18047295ad.3;
        Mon, 19 May 2025 19:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747706663; x=1748311463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HipBwcg6Ll7dOYLGfXJwYOXNuh2MRjVNlaNc8CeVn7g=;
        b=CGhwQuTs10+2FHRlMQcDuVvWWzz02rYQdtTH/XCV7AETxrJaKhB9liGSylfiFv+0iJ
         MiLbr2qMA2019U82aB0PCyIfILItPSC8QUS2Yo1qJ4RbcITlAHmUsYAvEmsTieje+fKU
         B77+cr8jLSrLag8bAI2E2uODhXLrG142kdNCR9JvQMMKvbX3PU+SWjRULXRah9oYVBfw
         fShmJeHwsXFSiBd8qzHKf8Lw21eCWdJz8LHmcbzpv8sDZPyQbvs79a070YWNk/TQYjCa
         FY/8EHmDAG3GD71tkrGX5uYhAiOAZ7H+AGqotD6vJkFS+Zs0BXOa7Gh32F5NuA6AUudz
         Ce/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747706663; x=1748311463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HipBwcg6Ll7dOYLGfXJwYOXNuh2MRjVNlaNc8CeVn7g=;
        b=EMMTpYLyw5NbMSGOJt/QQCHdaEqzbZntiJGh/DOgiCNHAglbRivLTkIEEIXaasJUcE
         Ik2nHRE1zi8j+1PpvtVsLiQUie3ox8qf7Z2wF0diT2PQ46WgWQDQW8RnOuAWS7z9if9L
         TEQeBns6Ne2Ij+g8hLkMxCBht0DBhL4X/YHxlXBuALq7gQvbeZKDsApac37Np+QXOBtX
         MNc7RJFLE9g9vgXzvGLMBXjpX0qE4q8fnJpFGhPTM2+6ilAeFSj2Ir7RBfqXLzfLxgMO
         YV6X4NvIWv/emqER2Tg3sjWV89Tog8L9Z3GvH2vIsCMWqFeQsLYSaB2h3/M/8nLSlmYD
         0tmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI9AOqbHCiarzBYR1dbuq0LVaFz6bjguKAvyvTCii9f8Q8+0lHUjzEpAEgfaBa4rAnCKU9kP+IntY+@vger.kernel.org, AJvYcCUToJxusAuvcO09loABOcIpVfU0a6Q9YhwapqjhBSUSITXE6LvAlFkaYekp5zF4EO5/FQU1xhx7kfwDe7U=@vger.kernel.org, AJvYcCUd/6I8kxeW8H1tO1qo0PVwedqMKTuyHLsRUcpc6KBEYJVoqii8tdI07Tj2KJNR7coUa+n1D1xgOY9j@vger.kernel.org, AJvYcCUgEJICNUvWw3W+NVS7g1EFOZI5oK2khco6ss3jnt86FrcHkYod+FjCl4OZxfDbJ50dNqlQ08d5@vger.kernel.org, AJvYcCW/snsgjSV1DmO+uavishSJ3YrbwJWL3SkZbIOpdTWNi74TGTWPzB0fOJMUw7VpZafVCrBoyfQs4/Q=@vger.kernel.org, AJvYcCW1z4venMIlmvJDK+NrVA86aC+63Idlx3UvezGL04MKbWvscNtRk7gdNvFvqNuzgXIi7Wco2y48EJ2i@vger.kernel.org, AJvYcCX40nO2PkcviDj7q3403v3y0rDu3Fp2KqaI/qtar8OlXGMH7kkDkOb67uEHsx8bPDjVdmQSLaDmEBHFLg==@vger.kernel.org, AJvYcCXit7T7CE4wW7AcWKy7TvNARuHqwbAD5iL1VEBVVE9y7uq1bqTR1vAVd+y//5wVlJvJhzqKYLVkYLHCLPmB5LY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO0GMssraRa4/xopYjt+PsU5gB6eAlPK/kpriuWk3nJlehxrbO
	b28fMvo1Oo2Kd6gb6nTa+UROveIOR03YvVG1mPO8JYdeWke23Lshr3aT
X-Gm-Gg: ASbGnctTK5Bw2q8NWQ1WC1e/NVA6z8J+HMlF2prsaY13aGIeNJCX5GAbgvQ8ZKChtOJ
	e0+8EU7Isfo9CsZeMrsZ52e4j8SVbrexKfvHtUflgrC0pRqAgd1s9N7fntE85mx3hlcY3v0b/Uh
	UiD4hMHoH1g8VyNTx4hJLcEVQOcS+aVDDMKJWUuTtXupEorxzF03F6QUF+pTWsym00G4en0U+Fm
	7Vo6jBS4QveZohdRrZB3LenZFcQy97J1+wWF2L+XtmKpAj89xTd9wxCZsokTsl/EUR/9crZHU83
	mieP6hL/N8VqUjtZ/xFJF2o6dwlYD2vHnh3ZFa2smTqm+TC9dB22nx4DfHHrdDPRphJheDdEdUM
	poO9/8g6gXYBJgQ==
X-Google-Smtp-Source: AGHT+IFSN72+LLHHedvYq7y9mEHr8VXXEIQ+RbqVTO3w57eQiReppl6XkKMeL70Sx4qLBYNYmMYsWQ==
X-Received: by 2002:a17:902:f790:b0:223:325c:89f6 with SMTP id d9443c01a7336-231d43d9ba7mr270281505ad.10.1747706662780;
        Mon, 19 May 2025 19:04:22 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9fc8sm66543855ad.27.2025.05.19.19.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:04:22 -0700 (PDT)
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
Subject: [PATCH v11 3/7] i2c: Add Nuvoton NCT6694 I2C support
Date: Tue, 20 May 2025 10:03:51 +0800
Message-Id: <20250520020355.3885597-4-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520020355.3885597-1-tmyu0@nuvoton.com>
References: <20250520020355.3885597-1-tmyu0@nuvoton.com>
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
 drivers/i2c/busses/i2c-nct6694.c | 193 +++++++++++++++++++++++++++++++
 4 files changed, 205 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4864a08dcf7e..88a6be6b05a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17455,6 +17455,7 @@ NUVOTON NCT6694 MFD DRIVER
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
index 000000000000..4f36cd54ad55
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 I2C adapter driver based on USB interface.
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ */
+
+#include <linux/i2c.h>
+#include <linux/idr.h>
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
+static DEFINE_IDA(nct6694_i2c_ida);
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
+static void nct6694_i2c_ida_remove(void *d)
+{
+	struct nct6694_i2c_data *data = d;
+
+	ida_free(&nct6694_i2c_ida, data->port);
+}
+
+static int nct6694_i2c_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nct6694 *nct6694 = dev_get_drvdata(dev->parent);
+	struct nct6694_i2c_data *data;
+	int ret;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = dev;
+	data->nct6694 = nct6694;
+
+	ret = ida_alloc(&nct6694_i2c_ida, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+	data->port = ret;
+
+	ret = devm_add_action_or_reset(dev, nct6694_i2c_ida_remove, data);
+	if (ret)
+		return ret;
+
+	ret = nct6694_i2c_set_baudrate(data);
+	if (ret)
+		return ret;
+
+	sprintf(data->adapter.name, "NCT6694 I2C Adapter %d", data->port);
+	data->adapter.owner = THIS_MODULE;
+	data->adapter.algo = &algorithm;
+	data->adapter.dev.parent = &pdev->dev;
+	data->adapter.algo_data = data;
+
+	platform_set_drvdata(pdev, data);
+
+	return devm_i2c_add_adapter(dev, &data->adapter);
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


