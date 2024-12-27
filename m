Return-Path: <linux-i2c+bounces-8747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BA9FD2D0
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 10:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0B061882FB9
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 09:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603A4189BBC;
	Fri, 27 Dec 2024 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7sXr44/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52129157485;
	Fri, 27 Dec 2024 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735293489; cv=none; b=E5wFc+68DP9ji1kGumGL3bRil4gnUgI16FtHtF13k+mLRcNXRhIAQatfrRCtlVa6TCPtxLiMcG3nHZFj/p0JD6nkItr/WuZUSyLU122BcjKUQ4l73eceLY1sNg5BAAO/y4YvNHdwE2LxSJram4KZ6/QrvHj3eKrck7il7Optkz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735293489; c=relaxed/simple;
	bh=Ld9u3Aoym82RSzgXXmcekrIoGKetolbVjamaQpbhS2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NM48eTJPfK+BKiUGYAFErJEyXtMyn0aHF2vezwxdOdZBdi94e6zEqAhu5PfG2woUHNDpg6A3m/fC2xZYyK6JOjWPZCNFIgqAKyzonSgR2HwyyM0XX7TB2CEeZAZgqZF8CG2xxJ2kxmaRfSWZ7RMpU2OiikKh0FHm6oQc9iy3Yeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7sXr44/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2164b662090so76100345ad.1;
        Fri, 27 Dec 2024 01:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735293487; x=1735898287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqRk5S6yW3NsUs+vZjO2HLDWNmt9cKJ0aYTZj+k0juY=;
        b=V7sXr44/ex5xCzMxLQPCv6guv8qMb5+BhTHo8gcpui6FtpsOYrZRmcC715fOOnN2dP
         MN6CpnDyU8vSkkGsUAXcJ5hyOcwDn6yfOeSVpNI3vE0UR+QeZiESJP7RSyeouG++2g6q
         r6ZAzb3LeJLexZZ6No8OYhljo0Iyi3JnQN6ERlin5+alKNOHqLuVVIPsXSk2a2LEZblI
         jhbExeoEDJtgE6uBblRmY5mVrUbdLOrM/MMj2BEQXCeld2jjqpWEzEIOJ+AhLipCAKUr
         NHx4wQ0AoqYpR2yHPexuAvyWg1JsMvqUG/wdaZIALrQMvjFsB8aUsjP66UQPU2DHtEUf
         LJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735293487; x=1735898287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqRk5S6yW3NsUs+vZjO2HLDWNmt9cKJ0aYTZj+k0juY=;
        b=Ga1nMDzfthdYo9UCDgCVfpniNAva155r2ww9wrql1Z8Os88hxWwo3UEJS2g3VI1nBa
         N90U7gyouIJgBlPq0zTet+9S88L/9MispSmnRtSMSj6EiYlUIToMcjI6MPqFcE460naD
         GPL2h8+fqj46aKpb9TSdhYQLADD4qJSpixJe1Lx3VIkkV3Ih/zA4rtLCztCDHYDnUHzt
         C6wbkBOfd6ci6QTpO1rOD2rz23l8AFelSEb/SqprydZfu4xL4r7Y4pLgW1wk6uNpu8ry
         Py1cSRgJAvA/Z0No7qWWG73v49GE/AfXz7Vsd4b+6qzjiDeWHRtOnKDBLD7XAXi//M+A
         Fh5w==
X-Forwarded-Encrypted: i=1; AJvYcCUkDIGN3KIEyJFrZQB5BMrjQpQ6fhnnCsoZ05QlfZ44ZnwgMInq13+ErXMReHhjqH9s0NGjbMiepHxl@vger.kernel.org, AJvYcCUtTaiVoFqQhuwjcfz3hvYq9w9jDCG4zT8TIX2ceWHYuAa+NYJUlrv4DkRR03ubG2Qlg9ijFUH/DTT2bg==@vger.kernel.org, AJvYcCUwrO3n4b6Da4lgyAbN05+7LRo9qmnPvJ5gUcz4f1nFi/atNe1B4TyAFUDcRpwa5F0+Kciwx7DTcSOz@vger.kernel.org, AJvYcCV9FnN3Rkptc1+7tXRZymbXtph+19KDk3cr83W9JgVOXCYmydnUBZOl/37CsyqoCcbqUL7A0qVSJ11B89ySDpA=@vger.kernel.org, AJvYcCVvQRfr+SSPqDpezcqFWVXbjHMnIBakUcnfHhL4uS7fjZ0KqdHgy97EgTGWluiVK8+SmwFAhr2C@vger.kernel.org, AJvYcCX7Y1m1pQTbzLYHyIKmFiKsl7j5QQR9c3NYyjVAhTSFAPlc2QTV7YOSQUNVtGHd9DexlnnU1BE1bwZqMEE=@vger.kernel.org, AJvYcCXgZsyp8bqmj3BSf9D2HIj4wPJGrF9uuBSv+wFqAz49YC2MseqnviAiMiLYKJdQYcECGidUyNG/VYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUntZbloBkUiBizz9yxfk+FO3AGCfSV4/33n/BiZG/VVJQ+AJU
	M+vUvZ+L4RDy4+QY0q1/BdhEczLxUV/uqKhfc8o5Cu13f+NF4BlB
X-Gm-Gg: ASbGnctNePlw/AU5WDjmhNqH6l7VkgMF++6t4Dubh/baTbVNvZFP3VftK1mNYByVljH
	RAhFe5FyFs13jsbhNHm/BHa4Wl0nrRhcFLHtCfp/K0xmWSXy0nX4m0eUt/6QAn7PyPRPr8COAM+
	fN7fH4s3my/rs60ClprI9DC7RFDVo2DE6HMy/hd20NNfx2wjPz56N0w5vEciWwC0PTuzGqPiNQq
	eDXTFghk8N+vykCe6exX4WzNJm2X9JGaXTBUAfdpYEyaSYAL8M4VmaE7kRnFHAQ9KFlPCN/ctBo
	DgLhLNjD7tfDp78d44w//umL
X-Google-Smtp-Source: AGHT+IE1nFWdsRiIr4L8ey3LUmPvgb1tfJu/MCyLVfIe5kp8z0V5Wzly1sJrrx/RD/M4+3jGoPfk1Q==
X-Received: by 2002:a17:903:946:b0:216:2af7:a2a3 with SMTP id d9443c01a7336-219e6f27157mr452121025ad.53.1735293486621;
        Fri, 27 Dec 2024 01:58:06 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm131581135ad.187.2024.12.27.01.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 01:58:06 -0800 (PST)
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
Subject: [PATCH v4 5/7] watchdog: Add Nuvoton NCT6694 WDT support
Date: Fri, 27 Dec 2024 17:57:25 +0800
Message-Id: <20241227095727.2401257-6-a0282524688@gmail.com>
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

This driver supports Watchdog timer functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 MAINTAINERS                    |   1 +
 drivers/watchdog/Kconfig       |  11 ++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/nct6694_wdt.c | 281 +++++++++++++++++++++++++++++++++
 4 files changed, 294 insertions(+)
 create mode 100644 drivers/watchdog/nct6694_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b961c4827648..254c01a6bba1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16730,6 +16730,7 @@ F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/nct6694_canfd.c
+F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f81705f8539a..9471a39b97ab 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -748,6 +748,17 @@ config MAX77620_WATCHDOG
 	  MAX77620 chips. To compile this driver as a module,
 	  choose M here: the module will be called max77620_wdt.
 
+config NCT6694_WATCHDOG
+	tristate "Nuvoton NCT6694 watchdog support"
+	depends on MFD_NCT6694
+	select WATCHDOG_CORE
+	help
+	  Say Y here to support Nuvoton NCT6694 watchdog timer
+	  functionality.
+
+ 	  This driver can also be built as a module. If so, the module
+	  will be called nct6694_wdt.
+
 config IMX2_WDT
 	tristate "IMX2+ Watchdog"
 	depends on ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 8411626fa162..de2a04ff8a92 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -232,6 +232,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
 obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
 obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
 obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
+obj-$(CONFIG_NCT6694_WATCHDOG) += nct6694_wdt.o
 obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
 obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
 obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
new file mode 100644
index 000000000000..58171b9de982
--- /dev/null
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 WDT driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/watchdog.h>
+
+#define DRVNAME "nct6694-wdt"
+
+#define NCT6694_DEFAULT_TIMEOUT		10
+#define NCT6694_DEFAULT_PRETIMEOUT	0
+
+/*
+ * USB command module type for NCT6694 WDT controller.
+ * This defines the module type used for communication with the NCT6694
+ * WDT controller over the USB interface.
+ */
+#define NCT6694_WDT_MOD			0x07
+
+/* Command 00h - WDT Setup */
+#define NCT6694_WDT_SETUP(idx)          (idx ? 0x0100 : 0x0000)	/* SEL|CMD */
+
+/* Command 01h - WDT Command */
+#define NCT6694_WDT_COMMAND(idx)        (idx ? 0x0101 : 0x0001)	/* SEL|CMD */
+
+static unsigned int timeout = NCT6694_DEFAULT_TIMEOUT;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
+
+static unsigned int pretimeout = NCT6694_DEFAULT_PRETIMEOUT;
+module_param(pretimeout, int, 0);
+MODULE_PARM_DESC(pretimeout, "Watchdog pre-timeout in seconds");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+			   __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+enum {
+	NCT6694_ACTION_NONE = 0,
+	NCT6694_ACTION_SIRQ,
+	NCT6694_ACTION_GPO,
+};
+
+struct __packed nct6694_wdt_setup {
+	__le32 pretimeout;
+	__le32 timeout;
+	u8 owner;
+	u8 scratch;
+	u8 control;
+	u8 status;
+	__le32 countdown;
+};
+
+struct __packed nct6694_wdt_cmd {
+	__le32 wdt_cmd;
+	__le32 reserved;
+};
+
+union nct6694_wdt_msg {
+	struct nct6694_wdt_setup setup;
+	struct nct6694_wdt_cmd cmd;
+};
+
+struct nct6694_wdt_data {
+	struct watchdog_device wdev;
+	struct device *dev;
+	struct nct6694 *nct6694;
+	struct mutex lock;
+	union nct6694_wdt_msg *msg;
+	unsigned int wdev_idx;
+};
+
+static int nct6694_wdt_setting(struct watchdog_device *wdev,
+			       u32 timeout_val, u8 timeout_act,
+			       u32 pretimeout_val, u8 pretimeout_act)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694_wdt_setup *setup = &data->msg->setup;
+	struct nct6694 *nct6694 = data->nct6694;
+	unsigned int timeout_fmt, pretimeout_fmt;
+
+	guard(mutex)(&data->lock);
+
+	if (pretimeout_val == 0)
+		pretimeout_act = NCT6694_ACTION_NONE;
+
+	timeout_fmt = (timeout_val * 1000) | (timeout_act << 24);
+	pretimeout_fmt = (pretimeout_val * 1000) | (pretimeout_act << 24);
+
+	memset(setup, 0, sizeof(*setup));
+	setup->timeout = cpu_to_le32(timeout_fmt);
+	setup->pretimeout = cpu_to_le32(pretimeout_fmt);
+
+	return nct6694_write_msg(nct6694, NCT6694_WDT_MOD,
+				 NCT6694_WDT_SETUP(data->wdev_idx),
+				 sizeof(*setup), setup);
+}
+
+static int nct6694_wdt_start(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	int ret;
+
+	ret = nct6694_wdt_setting(wdev, wdev->timeout, NCT6694_ACTION_GPO,
+				  wdev->pretimeout, NCT6694_ACTION_GPO);
+	if (ret)
+		return ret;
+
+	dev_dbg(data->dev, "Setting WDT(%d): timeout = %d, pretimeout = %d\n",
+		data->wdev_idx, wdev->timeout, wdev->pretimeout);
+
+	return ret;
+}
+
+static int nct6694_wdt_stop(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694_wdt_cmd *cmd = &data->msg->cmd;
+	struct nct6694 *nct6694 = data->nct6694;
+
+	guard(mutex)(&data->lock);
+
+	memcpy(&cmd->wdt_cmd, "WDTC", 4);
+	cmd->reserved = 0;
+
+	return nct6694_write_msg(nct6694, NCT6694_WDT_MOD,
+				 NCT6694_WDT_COMMAND(data->wdev_idx),
+				 sizeof(*cmd), cmd);
+}
+
+static int nct6694_wdt_ping(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694_wdt_cmd *cmd = &data->msg->cmd;
+	struct nct6694 *nct6694 = data->nct6694;
+
+	guard(mutex)(&data->lock);
+	memcpy(&cmd->wdt_cmd, "WDTS", 4);
+	cmd->reserved = 0;
+
+	return nct6694_write_msg(nct6694, NCT6694_WDT_MOD,
+				 NCT6694_WDT_COMMAND(data->wdev_idx),
+				 sizeof(*cmd), cmd);
+}
+
+static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
+				   unsigned int timeout)
+{
+	int ret;
+
+	ret = nct6694_wdt_setting(wdev, timeout, NCT6694_ACTION_GPO,
+				  wdev->pretimeout, NCT6694_ACTION_GPO);
+	if (ret)
+		return ret;
+
+	wdev->timeout = timeout;
+
+	return 0;
+}
+
+static int nct6694_wdt_set_pretimeout(struct watchdog_device *wdev,
+				      unsigned int pretimeout)
+{
+	int ret;
+
+	ret = nct6694_wdt_setting(wdev, wdev->timeout, NCT6694_ACTION_GPO,
+				  pretimeout, NCT6694_ACTION_GPO);
+	if (ret)
+		return ret;
+
+	wdev->pretimeout = pretimeout;
+
+	return 0;
+}
+
+static unsigned int nct6694_wdt_get_time(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694_wdt_setup *setup = &data->msg->setup;
+	struct nct6694 *nct6694 = data->nct6694;
+	unsigned int timeleft_ms;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(nct6694, NCT6694_WDT_MOD,
+			       NCT6694_WDT_SETUP(data->wdev_idx),
+			       sizeof(*setup), setup);
+	if (ret)
+		return 0;
+
+	timeleft_ms = le32_to_cpu(setup->countdown);
+
+	return timeleft_ms / 1000;
+}
+
+static const struct watchdog_info nct6694_wdt_info = {
+	.options = WDIOF_SETTIMEOUT	|
+		   WDIOF_KEEPALIVEPING	|
+		   WDIOF_MAGICCLOSE	|
+		   WDIOF_PRETIMEOUT,
+	.identity = DRVNAME,
+};
+
+static const struct watchdog_ops nct6694_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = nct6694_wdt_start,
+	.stop = nct6694_wdt_stop,
+	.set_timeout = nct6694_wdt_set_timeout,
+	.set_pretimeout = nct6694_wdt_set_pretimeout,
+	.get_timeleft = nct6694_wdt_get_time,
+	.ping = nct6694_wdt_ping,
+};
+
+static int nct6694_wdt_probe(struct platform_device *pdev)
+{
+	const struct mfd_cell *cell = mfd_get_cell(pdev);
+	struct device *dev = &pdev->dev;
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	struct nct6694_wdt_data *data;
+	struct watchdog_device *wdev;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->msg = devm_kzalloc(dev, sizeof(union nct6694_wdt_msg),
+				 GFP_KERNEL);
+	if (!data->msg)
+		return -ENOMEM;
+
+	data->dev = dev;
+	data->nct6694 = nct6694;
+	data->wdev_idx = cell->id;
+
+	wdev = &data->wdev;
+	wdev->info = &nct6694_wdt_info;
+	wdev->ops = &nct6694_wdt_ops;
+	wdev->timeout = timeout;
+	wdev->pretimeout = pretimeout;
+	if (timeout < pretimeout) {
+		dev_warn(data->dev, "pretimeout < timeout. Setting to zero\n");
+		wdev->pretimeout = 0;
+	}
+
+	wdev->min_timeout = 1;
+	wdev->max_timeout = 255;
+
+	devm_mutex_init(dev, &data->lock);
+
+	platform_set_drvdata(pdev, data);
+
+	watchdog_set_drvdata(&data->wdev, data);
+	watchdog_set_nowayout(&data->wdev, nowayout);
+	watchdog_stop_on_reboot(&data->wdev);
+
+	return devm_watchdog_register_device(dev, &data->wdev);
+}
+
+static struct platform_driver nct6694_wdt_driver = {
+	.driver = {
+		.name	= DRVNAME,
+	},
+	.probe		= nct6694_wdt_probe,
+};
+
+module_platform_driver(nct6694_wdt_driver);
+
+MODULE_DESCRIPTION("USB-WDT driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:nct6694-wdt");
-- 
2.34.1


