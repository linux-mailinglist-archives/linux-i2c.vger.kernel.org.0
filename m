Return-Path: <linux-i2c+bounces-11651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A230AEB4D3
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1551E564A7C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539052D8797;
	Fri, 27 Jun 2025 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPPNxgky"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8702D4B59;
	Fri, 27 Jun 2025 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020085; cv=none; b=JFGJuo4DOzCYNbum6/2VvAV4Q+LCSusRAsgIXsALvlItdkOi8hwlCanJ/vV75ntVP1QOeAaeimZgucjV3RANnqYdoenKui+tEQjGhhVfUf5braXuVUtOlkZ6SEBA5aUyF2xSLlMRZ1uBwcHHf/uvPSSDaTsXaLjy/FHi/kDfhQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020085; c=relaxed/simple;
	bh=BYZw/zUucbkLN4X04ogs7+d/SAsX2ZrWFF2htUhRuzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CrPTIpiQ3V+hwZu3nWi02yJZTAp7lLCI8W7KXqJbk3trKHmuBFoszzIwk3NWFebpGSLNUDvB7G5SdDpgoWIvsrzGOMe85UwGuRUjAC4OWOrhT7lpf5MRO8mdGAmKyGvMYHlQJWvXicOQe06fhtaHRU6qPr7lAlrd2PtN72OKmg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPPNxgky; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23649faf69fso20409135ad.0;
        Fri, 27 Jun 2025 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751020082; x=1751624882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IZEoF2Tbrkm8b5+Ls46QbSd1svrOAChUA+cpCuh5gw=;
        b=IPPNxgkyJywWN0FxfHAl5OxLRkBtum7FxO/9G2lHahb+KFnJ85esyWfaTSWs8VrWMM
         V+siviuM2Uvjthkx6gN2gHQ5qBnsTMgIS6zfhdh4oSlnjHhSWM2aRT1npZ9hATD34c5S
         Ry+eRfwdesxZlTWFIalNsO5u45hCXkeAamnzd3Uy7QJrq5haeLZ/HynCUHWy7AUaNOX2
         ujrzfaLLW7Ilr6ysTDWSaovMkHgo/5fsVNOzhS+VRwdLmPYsUZvfQxbjNQQWVn5oGJDi
         xqfYIOTPQNidbYAMo/jG4dwJz+kw4i17oDMUZ3Rju+P/reJTAAY8a/bxHCNolrqRXiru
         o0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751020082; x=1751624882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IZEoF2Tbrkm8b5+Ls46QbSd1svrOAChUA+cpCuh5gw=;
        b=Ykajo6+jgG2ztgyVT03zprYr6j3YLo9MmuK9mrdYqhEFVrnqYw643CLVplj48AD6Uf
         PH/oknnF2D+lq9HYqVuq3zOi9i8eUYgDCAL3rJcStkJLsYhtRhWiPxoCg7yICPVTcGAJ
         rBVDWRzubvDh04GRb4Lmx2Ocn830MlmUjnNst/1APVQBKPa4b6a+BYpm97mWmR9u4bZ0
         vQjNfnoi8TR3AhrUkXDPTERW7jARioYPaE0PkgTLOLYLtBq8hg0rsRtbGSwwH73VE/0+
         GWA6Chh3IwszeEAr+lW4OGj1ILvUj8JPTz8aP1Iu4PoSKsMKl+JeQoWHGS2nQa8whHX2
         ah7A==
X-Forwarded-Encrypted: i=1; AJvYcCU8DnHfHRDQyzcH6/bWt53Vl5zqdYFYX/IsfTC+xZ4on1pjIpXYPx19hA3m7gYQQD/HZoGnC7BH0dXGq2B7HKI=@vger.kernel.org, AJvYcCUInZ2FcQ5zfJUMYot2xPA+rm0Ny/kr79CemRr4EXdZm17ihT2VL/S95be7RD6oThM0BULrAbT6iy0Fbw==@vger.kernel.org, AJvYcCUVhE+0Yqjti/WOGLFxgCo8BIHkJo8u2pfkG9dpw/1V0nwwyVM67Cv0E5DqM+r15zlxKJhh6jWc4kv26bI=@vger.kernel.org, AJvYcCVHCvh6NuoNjItmB6ASKJF2FLS6IoRhHn6fYiPqIF14c5xm2FLh9cruJkWSCTyasVvEaIGMbPCtkLH+@vger.kernel.org, AJvYcCWXMJgpvVjdY/xS5rU93p4+t1ZHNECD2Qp2Ub87Ay/EsGVcBDZZZVydZ2Etn8Ex4aZ+Lyw2ru+q@vger.kernel.org, AJvYcCWqt51SmeMAYURFS+t2gPz66QbXiCpwroG3FJqeDKpRywGMzuc4HZZI8BvNsmwIDwIkv90OjakYk0mG@vger.kernel.org, AJvYcCXDm7MtDL2VxsgBim6Vb4IPVlnWczkCoMbO22SejDus0/IgR9ykcE2xiP5LCYhO4OSPwM33iouqwdw=@vger.kernel.org, AJvYcCXFKBKf3gt3Ygh2/2bO6XmR7BYQaolGMUGhtK3O0OM2Vo8Jw42hvY4Owi6i6DVyadUg4tTdPhN6thNS@vger.kernel.org
X-Gm-Message-State: AOJu0YwXitAU0UjDB/LGmtLB0wwG9VJTGfhZAUI0DM3vpSz79emmsGUD
	lPeLnRyJ9HXrsEPoh4hyJD36s8Vjf6xOmtvZcpntfMiyrKc78uyiFtH2
X-Gm-Gg: ASbGncupp/QTR+Q3fMXAKdbqKEigklkr6eqI0IC5QGM92HN8Y0xmRbgAoWoa1IBqOpA
	vhWkbLMIvtJ3lqwtjamXEmx+lsZ9KrTv0b8tQrtIaLhTyKYjizyeg3TkOlELGfMMIKpdDEGde74
	PvuWhCFZ2Q28RATk2isfwC4VkuJizAjpiR/W8RqTrRtXBBhtQn2QeXXjNj8h0ufSWEgb4KwQ9ch
	CBx55DAvcpgEXl8rz9rk8UDV/aaIwd7Qhi7VxB5QWMtQLX+gvALzOO6Sfb8Z948CkfS4ibLK3EU
	9zUjJsOPUwASvH0qrVgu1mwZFGGkxbycaY7D287DbS4lVWpDDJTvq+wF7Jp2WoW1Cnn2cGSiPa3
	pXb+lx+jKQgymDQpH9Cy+VqFkGv39ug==
X-Google-Smtp-Source: AGHT+IFk22OdNA1JMB6xfL0JLwx799eWxwwHLtIt+C4QCrBmXST/U7aA8mxDDy3KxxLsD4eROHSPsQ==
X-Received: by 2002:a17:903:2305:b0:234:d10d:9f9f with SMTP id d9443c01a7336-23ac465f724mr48806925ad.40.1751020082298;
        Fri, 27 Jun 2025 03:28:02 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bc495sm13845155ad.201.2025.06.27.03.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:28:02 -0700 (PDT)
From: a0282524688@gmail.com
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
Subject: [PATCH v13 5/7] watchdog: Add Nuvoton NCT6694 WDT support
Date: Fri, 27 Jun 2025 18:27:28 +0800
Message-Id: <20250627102730.71222-6-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627102730.71222-1-a0282524688@gmail.com>
References: <20250627102730.71222-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

This driver supports Watchdog timer functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes since version 12:
- Implement IDA in MFD driver to handle per-device IDs
- Use same email address in the signaturei

Changes since version 11:
- Use platform_device's id to replace IDA

Changes since version 10:
- Implement IDA to allocate id
- Add module parameters to configure WDT's timeout and pretimeout value

Changes since version 9:

Changes since version 8:
- Modify the signed-off-by with my work address

Changes since version 7:
- Add error handling for devm_mutex_init()

Changes since version 6:
- Fix warning

Changes since version 5:
- Modify the module name and the driver name consistently

Changes since version 4:
- Modify arguments in read/write function to a pointer to cmd_header
- Modify all callers that call the read/write function

Changes since version 3:
- Modify array buffer to structure
- Fix defines and comments
- Modify mutex_init() to devm_mutex_init()
- Drop watchdog_init_timeout()

Changes since version 2:
- Add MODULE_ALIAS()
- Modify the pretimeout validation procedure

Changes since version 1:
- Add each driver's command structure
- Fix platform driver registration
- Fix warnings
- Drop unnecessary logs
- Modify start() function to setup device

 MAINTAINERS                    |   1 +
 drivers/watchdog/Kconfig       |  11 ++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/nct6694_wdt.c | 307 +++++++++++++++++++++++++++++++++
 4 files changed, 320 insertions(+)
 create mode 100644 drivers/watchdog/nct6694_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ce276999625e..7c3edac315b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17796,6 +17796,7 @@ F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/usb/nct6694_canfd.c
+F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
 NUVOTON NCT7201 IIO DRIVER
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0c25b2ed44eb..05008d937e40 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -760,6 +760,17 @@ config MAX77620_WATCHDOG
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
+	  This driver can also be built as a module. If so, the module
+	  will be called nct6694_wdt.
+
 config IMX2_WDT
 	tristate "IMX2+ Watchdog"
 	depends on ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index bbd4d62d2cc3..b680e4d3c1bc 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -235,6 +235,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
 obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
 obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
 obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
+obj-$(CONFIG_NCT6694_WATCHDOG) += nct6694_wdt.o
 obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
 obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
 obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
new file mode 100644
index 000000000000..bc3689bd4b6b
--- /dev/null
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 WDT driver based on USB interface.
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ */
+
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/watchdog.h>
+
+#define DEVICE_NAME "nct6694-wdt"
+
+#define NCT6694_DEFAULT_TIMEOUT		10
+#define NCT6694_DEFAULT_PRETIMEOUT	0
+
+#define NCT6694_WDT_MAX_DEVS		2
+
+/*
+ * USB command module type for NCT6694 WDT controller.
+ * This defines the module type used for communication with the NCT6694
+ * WDT controller over the USB interface.
+ */
+#define NCT6694_WDT_MOD			0x07
+
+/* Command 00h - WDT Setup */
+#define NCT6694_WDT_SETUP		0x00
+#define NCT6694_WDT_SETUP_SEL(idx)	(idx ? 0x01 : 0x00)
+
+/* Command 01h - WDT Command */
+#define NCT6694_WDT_COMMAND		0x01
+#define NCT6694_WDT_COMMAND_SEL(idx)	(idx ? 0x01 : 0x00)
+
+static unsigned int timeout[NCT6694_WDT_MAX_DEVS] = {
+	[0 ... (NCT6694_WDT_MAX_DEVS - 1)] = NCT6694_DEFAULT_TIMEOUT
+};
+module_param_array(timeout, int, NULL, 0644);
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
+
+static unsigned int pretimeout[NCT6694_WDT_MAX_DEVS] = {
+	[0 ... (NCT6694_WDT_MAX_DEVS - 1)] = NCT6694_DEFAULT_PRETIMEOUT
+};
+module_param_array(pretimeout, int, NULL, 0644);
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
+union __packed nct6694_wdt_msg {
+	struct nct6694_wdt_setup setup;
+	struct nct6694_wdt_cmd cmd;
+};
+
+struct nct6694_wdt_data {
+	struct watchdog_device wdev;
+	struct device *dev;
+	struct nct6694 *nct6694;
+	union nct6694_wdt_msg *msg;
+	unsigned char wdev_idx;
+};
+
+static int nct6694_wdt_setting(struct watchdog_device *wdev,
+			       u32 timeout_val, u8 timeout_act,
+			       u32 pretimeout_val, u8 pretimeout_act)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694_wdt_setup *setup = &data->msg->setup;
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_WDT_MOD,
+		.cmd = NCT6694_WDT_SETUP,
+		.sel = NCT6694_WDT_SETUP_SEL(data->wdev_idx),
+		.len = cpu_to_le16(sizeof(*setup))
+	};
+	unsigned int timeout_fmt, pretimeout_fmt;
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
+	return nct6694_write_msg(data->nct6694, &cmd_hd, setup);
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
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_WDT_MOD,
+		.cmd = NCT6694_WDT_COMMAND,
+		.sel = NCT6694_WDT_COMMAND_SEL(data->wdev_idx),
+		.len = cpu_to_le16(sizeof(*cmd))
+	};
+
+	memcpy(&cmd->wdt_cmd, "WDTC", 4);
+	cmd->reserved = 0;
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, cmd);
+}
+
+static int nct6694_wdt_ping(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694_wdt_cmd *cmd = &data->msg->cmd;
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_WDT_MOD,
+		.cmd = NCT6694_WDT_COMMAND,
+		.sel = NCT6694_WDT_COMMAND_SEL(data->wdev_idx),
+		.len = cpu_to_le16(sizeof(*cmd))
+	};
+
+	memcpy(&cmd->wdt_cmd, "WDTS", 4);
+	cmd->reserved = 0;
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, cmd);
+}
+
+static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
+				   unsigned int new_timeout)
+{
+	int ret;
+
+	ret = nct6694_wdt_setting(wdev, new_timeout, NCT6694_ACTION_GPO,
+				  wdev->pretimeout, NCT6694_ACTION_GPO);
+	if (ret)
+		return ret;
+
+	wdev->timeout = new_timeout;
+
+	return 0;
+}
+
+static int nct6694_wdt_set_pretimeout(struct watchdog_device *wdev,
+				      unsigned int new_pretimeout)
+{
+	int ret;
+
+	ret = nct6694_wdt_setting(wdev, wdev->timeout, NCT6694_ACTION_GPO,
+				  new_pretimeout, NCT6694_ACTION_GPO);
+	if (ret)
+		return ret;
+
+	wdev->pretimeout = new_pretimeout;
+
+	return 0;
+}
+
+static unsigned int nct6694_wdt_get_time(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694_wdt_setup *setup = &data->msg->setup;
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_WDT_MOD,
+		.cmd = NCT6694_WDT_SETUP,
+		.sel = NCT6694_WDT_SETUP_SEL(data->wdev_idx),
+		.len = cpu_to_le16(sizeof(*setup))
+	};
+	unsigned int timeleft_ms;
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, setup);
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
+	.identity = DEVICE_NAME,
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
+static void nct6694_wdt_ida_free(void *d)
+{
+	struct nct6694_wdt_data *data = d;
+	struct nct6694 *nct6694 = data->nct6694;
+
+	ida_free(&nct6694->wdt_ida, data->wdev_idx);
+}
+
+static int nct6694_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nct6694 *nct6694 = dev_get_drvdata(dev->parent);
+	struct nct6694_wdt_data *data;
+	struct watchdog_device *wdev;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
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
+
+	ret = ida_alloc(&nct6694->wdt_ida, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+	data->wdev_idx = ret;
+
+	ret = devm_add_action_or_reset(dev, nct6694_wdt_ida_free, data);
+	if (ret)
+		return ret;
+
+	wdev = &data->wdev;
+	wdev->info = &nct6694_wdt_info;
+	wdev->ops = &nct6694_wdt_ops;
+	wdev->timeout = timeout[data->wdev_idx];
+	wdev->pretimeout = pretimeout[data->wdev_idx];
+	if (timeout[data->wdev_idx] < pretimeout[data->wdev_idx]) {
+		dev_warn(data->dev, "pretimeout < timeout. Setting to zero\n");
+		wdev->pretimeout = 0;
+	}
+
+	wdev->min_timeout = 1;
+	wdev->max_timeout = 255;
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
+		.name	= DEVICE_NAME,
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


