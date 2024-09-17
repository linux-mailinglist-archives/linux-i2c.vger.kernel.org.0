Return-Path: <linux-i2c+bounces-6829-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DE297B34A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 19:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6CB41F22078
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 17:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F04188A0A;
	Tue, 17 Sep 2024 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OFFkTlmo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434FB17836B;
	Tue, 17 Sep 2024 17:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726592467; cv=none; b=NC6JQkfX2NpsEfiw7nV3azYQbhTDnccZGDf5MDXaKDGwAPSkTg+o//wGc74z9rnTJh9RseEU/kyeFa1LaZYaJyxrl2CLvahBjN/46+F7Pj/coHm3krUGvVA3utTIV1fSuopwDRW1+iL1KTY6vWxOzlycctBHtZ/i/0nwT/F7Zsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726592467; c=relaxed/simple;
	bh=vvUg50jyCP87Cov0xH/DrvLQ2YohlQJayq3hyX8aAFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKIxaR9/WSX7qCUysOEKqy1HecPSclXV3I2Qn4KLgnBZvVTx+uzfWXjq7MtcqDsDURmH6tTPfWs7lahwVnyiOicsMGsTL6c/vO54uVeov/i4W1GZt0glp+/Zv85Yng/JzdYe+xwJoDjNXvT1mkjS0xkv7wFQdC/By4nDwZGeZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OFFkTlmo; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBB85FF80B;
	Tue, 17 Sep 2024 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726592458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66IEOlMYBjXfr78ZRXNtlQpxX4kJuoX5da9gc4SZg8E=;
	b=OFFkTlmoSK3zi8DUxKc2Z76fDZtLoOpf7XukNaAFzpovTy1ZBJmiaN10qrYscwrWJANKVa
	H37DJpMQFlf1C1qpwFiJDYeJYtL8LQ90I0KGxXM8OzpOtb5Vf+uaWio3mz/m9LK0snFmni
	pVUpLw3Q50X9GAIz2zpxjcLRjUGLRD9TSQCrIq4qQUs3YWv5Smia5512c9WRuveOtmDTX9
	xm6KZEUT5FP4wL4Im+Y6JyGXgB8n1MV6N5Fshrp3fZcgHnbBM+3doLbuifVju5CNvHAM0D
	KC9J0ZPL14hM4M9BzpS67KdTe03zQIdum2uC68LTJjBlWrwBp1NqFSY2/0+jRA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 17 Sep 2024 19:00:50 +0200
Subject: [PATCH v2 4/5] watchdog: Congatec Board Controller watchdog timer
 driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-congatec-board-controller-v2-4-681511a01c8f@bootlin.com>
References: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
In-Reply-To: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Add watchdog timer support for the Congatec Board Controller.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/watchdog/Kconfig    |  10 +++
 drivers/watchdog/Makefile   |   1 +
 drivers/watchdog/cgbc_wdt.c | 211 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 222 insertions(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bae1d97cce89..07b711fc8bb2 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1142,6 +1142,16 @@ config ALIM7101_WDT
 
 	  Most people will say N.
 
+config CGBC_WDT
+	tristate "Congatec Board Controller Watchdog Timer"
+	depends on MFD_CGBC
+	select WATCHDOG_CORE
+	help
+	  Enables watchdog timer support for the Congatec Board Controller.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called cgbc_wdt.
+
 config EBC_C384_WDT
 	tristate "WinSystems EBC-C384 Watchdog Timer"
 	depends on (X86 || COMPILE_TEST) && HAS_IOPORT
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index b51030f035a6..5aa66ba91346 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_ADVANTECH_WDT) += advantechwdt.o
 obj-$(CONFIG_ADVANTECH_EC_WDT) += advantech_ec_wdt.o
 obj-$(CONFIG_ALIM1535_WDT) += alim1535_wdt.o
 obj-$(CONFIG_ALIM7101_WDT) += alim7101_wdt.o
+obj-$(CONFIG_CGBC_WDT) += cgbc_wdt.o
 obj-$(CONFIG_EBC_C384_WDT) += ebc-c384_wdt.o
 obj-$(CONFIG_EXAR_WDT) += exar_wdt.o
 obj-$(CONFIG_F71808E_WDT) += f71808e_wdt.o
diff --git a/drivers/watchdog/cgbc_wdt.c b/drivers/watchdog/cgbc_wdt.c
new file mode 100644
index 000000000000..702b055ba6f4
--- /dev/null
+++ b/drivers/watchdog/cgbc_wdt.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Congatec Board Controller watchdog driver
+ *
+ * Copyright (C) 2024 Bootlin
+ * Author: Thomas Richard <thomas.richard@bootlin.com>
+ */
+
+#include <linux/build_bug.h>
+#include <linux/device.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#include <linux/mfd/cgbc.h>
+
+#define CGBC_WDT_CMD_TRIGGER	0x27
+#define CGBC_WDT_CMD_INIT	0x28
+#define CGBC_WDT_DISABLE	0x00
+
+#define CGBC_WDT_MODE_SINGLE_EVENT 0x02
+
+#define CGBC_WDT_MIN_TIMEOUT	1
+#define CGBC_WDT_MAX_TIMEOUT	((U32_MAX >> 8) / 1000)
+
+#define CGBC_WDT_DEFAULT_TIMEOUT	30
+#define CGBC_WDT_DEFAULT_PRETIMEOUT	0
+
+enum action {
+	ACTION_INT = 0,
+	ACTION_SMI,
+	ACTION_RESET,
+	ACTION_BUTTON,
+};
+
+static unsigned int timeout;
+module_param(timeout, uint, 0);
+MODULE_PARM_DESC(timeout,
+		 "Watchdog timeout in seconds. (>=0, default="
+		 __MODULE_STRING(CGBC_WDT_DEFAULT_TIMEOUT) ")");
+
+static unsigned int pretimeout = CGBC_WDT_DEFAULT_PRETIMEOUT;
+module_param(pretimeout, uint, 0);
+MODULE_PARM_DESC(pretimeout,
+		 "Watchdog pretimeout in seconds. (>=0, default="
+		 __MODULE_STRING(CGBC_WDT_DEFAULT_PRETIMEOUT) ")");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+		 "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+struct cgbc_wdt_data {
+	struct cgbc_device_data	*cgbc;
+	struct watchdog_device	wdd;
+};
+
+struct cgbc_wdt_cmd_cfg {
+	u8 cmd;
+	u8 mode;
+	u8 action;
+	u8 timeout1[3];
+	u8 timeout2[3];
+	u8 reserved[3];
+	u8 delay[3];
+} __packed;
+
+static_assert(sizeof(struct cgbc_wdt_cmd_cfg) == 15);
+
+static int cgbc_wdt_start(struct watchdog_device *wdd)
+{
+	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
+	struct cgbc_device_data *cgbc = wdt_data->cgbc;
+	unsigned int timeout1 = (wdd->timeout - wdd->pretimeout) * 1000;
+	unsigned int timeout2 = wdd->pretimeout * 1000;
+	u8 action;
+
+	struct cgbc_wdt_cmd_cfg cmd_start = {
+		.cmd = CGBC_WDT_CMD_INIT,
+		.mode = CGBC_WDT_MODE_SINGLE_EVENT,
+		.timeout1[0] = (u8)timeout1,
+		.timeout1[1] = (u8)(timeout1 >> 8),
+		.timeout1[2] = (u8)(timeout1 >> 16),
+		.timeout2[0] = (u8)timeout2,
+		.timeout2[1] = (u8)(timeout2 >> 8),
+		.timeout2[2] = (u8)(timeout2 >> 16),
+	};
+
+	if (wdd->pretimeout) {
+		action = 2;
+		action |= ACTION_SMI << 2;
+		action |= ACTION_RESET << 4;
+	} else {
+		action = 1;
+		action |= ACTION_RESET << 2;
+	}
+
+	cmd_start.action = action;
+
+	return cgbc_command(cgbc, &cmd_start, sizeof(cmd_start), NULL, 0, NULL);
+}
+
+static int cgbc_wdt_stop(struct watchdog_device *wdd)
+{
+	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
+	struct cgbc_device_data *cgbc = wdt_data->cgbc;
+	struct cgbc_wdt_cmd_cfg cmd_stop = {
+		.cmd = CGBC_WDT_CMD_INIT,
+		.mode = CGBC_WDT_DISABLE,
+	};
+
+	return cgbc_command(cgbc, &cmd_stop, sizeof(cmd_stop), NULL, 0, NULL);
+}
+
+static int cgbc_wdt_keepalive(struct watchdog_device *wdd)
+{
+	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
+	struct cgbc_device_data *cgbc = wdt_data->cgbc;
+	u8 cmd_ping = CGBC_WDT_CMD_TRIGGER;
+
+	return cgbc_command(cgbc, &cmd_ping, sizeof(cmd_ping), NULL, 0, NULL);
+}
+
+static int cgbc_wdt_set_pretimeout(struct watchdog_device *wdd,
+				   unsigned int pretimeout)
+{
+	wdd->pretimeout = pretimeout;
+
+	if (watchdog_active(wdd))
+		return cgbc_wdt_start(wdd);
+
+	return 0;
+}
+
+static int cgbc_wdt_set_timeout(struct watchdog_device *wdd,
+				unsigned int timeout)
+{
+	if (timeout < wdd->pretimeout)
+		wdd->pretimeout = 0;
+
+	wdd->timeout = timeout;
+
+	if (watchdog_active(wdd))
+		return cgbc_wdt_start(wdd);
+
+	return 0;
+}
+
+static const struct watchdog_info cgbc_wdt_info = {
+	.identity	= "CGBC Watchdog",
+	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
+		WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT
+};
+
+static const struct watchdog_ops cgbc_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= cgbc_wdt_start,
+	.stop		= cgbc_wdt_stop,
+	.ping		= cgbc_wdt_keepalive,
+	.set_timeout	= cgbc_wdt_set_timeout,
+	.set_pretimeout = cgbc_wdt_set_pretimeout,
+};
+
+static int cgbc_wdt_probe(struct platform_device *pdev)
+{
+	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct cgbc_wdt_data *wdt_data;
+	struct watchdog_device *wdd;
+
+	wdt_data = devm_kzalloc(dev, sizeof(*wdt_data), GFP_KERNEL);
+	if (!wdt_data)
+		return -ENOMEM;
+
+	wdt_data->cgbc = cgbc;
+	wdd = &wdt_data->wdd;
+	wdd->parent = dev;
+
+	wdd->info = &cgbc_wdt_info;
+	wdd->ops = &cgbc_wdt_ops;
+	wdd->max_timeout = CGBC_WDT_MAX_TIMEOUT;
+	wdd->min_timeout = CGBC_WDT_MIN_TIMEOUT;
+
+	watchdog_set_drvdata(wdd, wdt_data);
+	watchdog_set_nowayout(wdd, nowayout);
+
+	wdd->timeout = CGBC_WDT_DEFAULT_TIMEOUT;
+	watchdog_init_timeout(wdd, timeout, dev);
+	cgbc_wdt_set_pretimeout(wdd, pretimeout);
+
+	platform_set_drvdata(pdev, wdt_data);
+	watchdog_stop_on_reboot(wdd);
+	watchdog_stop_on_unregister(wdd);
+
+	return devm_watchdog_register_device(dev, wdd);
+}
+
+static struct platform_driver cgbc_wdt_driver = {
+	.driver		= {
+		.name	= "cgbc-wdt",
+	},
+	.probe		= cgbc_wdt_probe,
+};
+
+module_platform_driver(cgbc_wdt_driver);
+
+MODULE_DESCRIPTION("Congatec Board Controller Watchdog Driver");
+MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
+MODULE_LICENSE("GPL");

-- 
2.39.5


