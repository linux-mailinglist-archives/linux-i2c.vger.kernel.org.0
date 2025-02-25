Return-Path: <linux-i2c+bounces-9558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B136CA4375F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 09:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D28189FD8B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 08:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44554264A6E;
	Tue, 25 Feb 2025 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8Du+mlw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6C5260A2B;
	Tue, 25 Feb 2025 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740471447; cv=none; b=a/f4YzBR5ovMe4YTsCVmZ/oYx5W/vG8wST3/xJqsx4P0uGQduARbocyne6LJn5YEe692DQJnWMzz7ukidP/szYEwc3+zy3pI5VsCHw3tTpjLsfxXEAVzW0U9QkodQeKRUdq+mdoj1qz+tCVRH+jLrBH0t+BNF3ZxbbcqIW0EDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740471447; c=relaxed/simple;
	bh=B9RW3Eonh/3at8SeLi/2hDGNoQkoS/kW6tOa8ggxxGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OCV10Ep9XhVgVNJrB9g6uwGEWLPmT8Fheo38Bem5qabZgk94LfNfOIPLMROUYjZ6yOlLRYii/hAzDlYZzI9R7+58k7OehIxqu49Cu4ZdWt32cS/3sj7p5WN8Byu/OA+ZiH89JWAWT1d+0j3o/LxyWt3LX/pCdrPMfrbldn7TpRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8Du+mlw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220e989edb6so144141105ad.1;
        Tue, 25 Feb 2025 00:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740471444; x=1741076244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYnF0mLdu3t6wKiHnoa4wYtpXxwWMR8C+fhC7qG98zE=;
        b=N8Du+mlwJfgmXrqFQ4iw5xKsBoeAy2LOCUiUrVFf+Li0kRdLbnf9ebHQq0Q5vlG+t3
         QnPy2aCbq0UE6v2AFoVmLXht3yPSzBsdblf5pwZjvXle/FgiQc8gROfOv/NpamPIHngF
         GXzpUr8RlsoVEB0rSzND1r80PEU4XEMGcPxcva2w3XAQfxO8FQ4k4CmXHbdWQgyvZYqX
         Xl/OflgVPXN4mcbRD8LY2sJgJOt3dHAM1hCT+9ZNgGGS+efcHL1zbb2kjp+VqOFuSYjz
         GyIAJlmgdDiOwgNn8+S1M/1fHaIx29JQ9edxrSYfl6V1PSdHuWXj9ATg5J0XRTnMJFnR
         1Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740471444; x=1741076244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYnF0mLdu3t6wKiHnoa4wYtpXxwWMR8C+fhC7qG98zE=;
        b=gHpoMC4SkDxB72PsRfyZBj+kkxlvNjkxDawCDvLibkGQKRL2uZxQduBGuncWU18Nx/
         GDpUyzS5cme7Ooctf6K+eVhWHgQYq653+IFa6fjnmPiXQdjm3Av/ChQ4BehEvpYJZ5f9
         tmq3VHhLvSDSPjLIEySYmcJTs2d3CcClDBwC9MzG9qNgV0oWeB2fxNKlsowuu3B7VG+C
         OqlY+s9DxUatOjWJcAGF2xJSkXsxPVVl70OXZp5Pbin64TVcpdsex77AhQN3ZQ0NB4Bv
         j9CBXprW82oOzPT8jNBonZKHIMlMR+gjCwnQ1i94t7JPI8QroeYmaeihPwGB2JlC6IuN
         hgkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbrMrCh8wFyeC5vu8FI8rD4jTQyt0a56oeQoqp3ldC2MiQn28a0W5e0Gv0SA8Nw2iX8FqDnySHNgv4@vger.kernel.org, AJvYcCWFMoiBRNPwO1Kn2h6CjwREBC+Cu2+tyJb3d5JwpjN7/om6jBSXwNhEgR1VhvpDBhMHc0nn68f/OyuZU9afytE=@vger.kernel.org, AJvYcCWO1ErrgeRhw8zf/iDaWSgyOwGv/N5V1vPcuh3taD2+hZ3z8Eq2t/iD20PC3XSiL8wgMxyZSB5xDho=@vger.kernel.org, AJvYcCWsRxK/f7d09fM3XN0EaDJrNISPfx+UbtgtcJoLJpKMfD7r6g6vOxopu6dVT0zSiGA8uaJU0GuIiy32@vger.kernel.org, AJvYcCWuHKrxrmg+oUtx7u+XrkCrGFPZfSkktRRAmNv9g7llSsgw4/ezOfBH18/kw5jcqTED+cVry+alyTCu@vger.kernel.org, AJvYcCX/V28DF3OZyNf/elnAIXnphpzqFRKNlUunx68WpsjtLurpq+b0RnheJAYG4DAwQMaKv7aG3BEq1YgF5A==@vger.kernel.org, AJvYcCXVm042oVcEzXkpZoe7Fisg/BkmWBUBoQZCbXVkGsjjCoubTzPFlUlKAhaiBdpoFIkaqShre2pD@vger.kernel.org, AJvYcCXthtEextFKm7whw3/4i6yWrQU6vnOaHdLRFLorfJWMogR+eVOXs1ljzvPR1/oXegeaufAS9sT2cz+AgPk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygn+wxj9evltZ9IrIv9E7vywhtsLT0mTAjEpbqysGiqjGa7e3B
	xrw+Tp/qDclpIOhQKMNv82+fTZA6gzwL1RtAP7tQtQtAoXxk5dDV
X-Gm-Gg: ASbGncvb5fsf+y6g4EDRHC1iLlzy648iUwiXlXEt3+hgNmPvEEROSVssdgAiIDJapqc
	U/+iuSNwupvW6hhEDWkHkvy7Z/V8LMsNCtmCBTPLHdu38sludjPdwmX3Tt0f4N9stSdmwsT20Yu
	G6OWhTJDUKtrfA9Qbtnmuvo80rkixZOeWcMOO6xN7wkkHP7s6ev9F1V3k1Z3cdPxf9vDY5RTart
	uWGFMA49h1VNHkVlgdCpTZz62EJKAFnTA1KQECHAos4L9lkVokK8vqYmc6Ld829YnZJ6Ld1NSL1
	eo6ZB5kNwFiAXnzop2+R/XEcSj5IYyDrIPzikYa/n3cVrU9NZk4YBbqThkwnkD4YAd5wzQ==
X-Google-Smtp-Source: AGHT+IFg+eCWkEZwgZZMe/+bI6x7V/JhCuQTwIRM1Cqlf1Lj3ZTV/kfNZt1xg0lOtFFHl1dQGt8H/Q==
X-Received: by 2002:a05:6a00:992:b0:730:7d3f:8c79 with SMTP id d2e1a72fcca58-734791a2883mr3604458b3a.19.1740471444309;
        Tue, 25 Feb 2025 00:17:24 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6abaddsm902178b3a.20.2025.02.25.00.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 00:17:24 -0800 (PST)
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
Subject: [PATCH v8 5/7] watchdog: Add Nuvoton NCT6694 WDT support
Date: Tue, 25 Feb 2025 16:16:42 +0800
Message-Id: <20250225081644.3524915-6-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225081644.3524915-1-a0282524688@gmail.com>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
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
 drivers/watchdog/nct6694_wdt.c | 298 +++++++++++++++++++++++++++++++++
 4 files changed, 311 insertions(+)
 create mode 100644 drivers/watchdog/nct6694_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8aa611504172..4889b618abef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16926,6 +16926,7 @@ F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/usb/nct6694_canfd.c
+F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f81705f8539a..4c4f826368c4 100644
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
+	  This driver can also be built as a module. If so, the module
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
index 000000000000..a99d0429e637
--- /dev/null
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -0,0 +1,298 @@
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
+#define DRVNAME "nct6694_wdt"
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
+#define NCT6694_WDT_SETUP		0x00
+#define NCT6694_WDT_SETUP_SEL(idx)	(idx ? 0x01 : 0x00)
+
+/* Command 01h - WDT Command */
+#define NCT6694_WDT_COMMAND		0x01
+#define NCT6694_WDT_COMMAND_SEL(idx)	(idx ? 0x01 : 0x00)
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
+union __packed nct6694_wdt_msg {
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
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_WDT_MOD,
+		.cmd = NCT6694_WDT_SETUP,
+		.sel = NCT6694_WDT_SETUP_SEL(data->wdev_idx),
+		.len = cpu_to_le16(sizeof(*setup))
+	};
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
+	guard(mutex)(&data->lock);
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
+	guard(mutex)(&data->lock);
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
+	guard(mutex)(&data->lock);
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
+	int ret;
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
+	ret = devm_mutex_init(dev, &data->lock);
+	if (ret)
+		return ret;
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


