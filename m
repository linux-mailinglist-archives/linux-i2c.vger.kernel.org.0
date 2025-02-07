Return-Path: <linux-i2c+bounces-9339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C37D0A2BCCD
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 08:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E3FA188B267
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 07:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0DF237718;
	Fri,  7 Feb 2025 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8+5IHYM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B592343AA;
	Fri,  7 Feb 2025 07:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914342; cv=none; b=ONKE45EVwBwB+7frXXuKGrqUv/7GDfFfoBJKqDJLbdjqGiL3j5wqFmPdXwLCpB8Q68XOpu2KxPYAj/6o4PWlbzjnAONzbITY4SpqUki+iujwJgkDwLC8OedoW/twa/PoAjMoBJCcfUZEn2dyGEqK/lkndEDSnMbpxj2xhW/o6Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914342; c=relaxed/simple;
	bh=o5T5OQiSdzO3RhLgyMKFpSWgxBG12v7T/AmNTtb8V5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MPYAXgjFUGzcJBvqT8IOSomCjkAeDuPWvojBFJy9kb/Tk2bkNv5sqDcMkzVVJLjjwc5SiVjS9L9mxh+iQImyxnF6rEAGcaWu4ybjkiiEQ04jN/IfMn2ymTc/gyo+6GzoNpWy3//1x2idfbF89mzvx3efHIOEnKnNzXo+VFwnrt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8+5IHYM; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fa2eb7eb45so197673a91.1;
        Thu, 06 Feb 2025 23:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738914340; x=1739519140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UurdY6Alt68aGySpMyscVszKXVOm2Q9HkACrygxskYE=;
        b=i8+5IHYMuly80v6d2hCFiEoShVMlbNhoTLiLo/gCIfiqGUQdJydv1lOELX+0evu9k0
         kgMVlLfLyYjwyxTYllPVkEU0/34dc6FFBodZE+rw99Qsp2/sjqhEDg6C9J648WLXST2v
         ENUuiKbLpFTdx/2MqI+OD9KFx15cXBAUXpE9/dWSb1C+1d+YKi268uCrYc2IfQ8zBZwc
         ToQ76B46Gu0R+trZxIohIduBdEFYvnmJF0YUek26RiA9So0qt+5Mqv4qGROeI5qCjAYT
         vUmNRX3exTclgfdF3AuGGcc/My5B8d62SSjCW+/ZsOmYLqdgEuPDEhxCcqSFBLn1EY84
         9sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738914340; x=1739519140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UurdY6Alt68aGySpMyscVszKXVOm2Q9HkACrygxskYE=;
        b=DjdRA/gtvpF7TKZ8deW3sZMhMIpfvgqZL3XuKxb7/CZotDLefhBwSJdTptSOfFV0ez
         8Sb2Ej5BCvBrUNdU4RiAphODPDV3yJN1QYAkQchVJsuqaTVzMCZAaq2zLkepnchGPcVU
         KLSclkMBiT/JoOrsatoN8OqW4wPB1+YitUvJEVkZAla8RNY2c4hYRwApfb8ECD7PzmAV
         dssrNhhBeIQx1txeF67XuTTq+lWLxLupsJwWZnEUcjL8UoNF/Naypcrp15Q8gJzT3JTI
         PelW1Dgza+Pkrt0L06zjQ7OULgu8eNj6vF1ccyXIuvKlSjnefEQpBFRTsMV2ayWD+b2c
         AFbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0oVpUYHG+YW/MOQ8UruWLs7b/tQey1bvB7XvUfHDfpPTuWMjvGfz3w66yudcHwN5iCRitShuU@vger.kernel.org, AJvYcCUOTQmjQpjlEcyiqPK6+v/TRM9zlopCIn5r4fKTJixHQHcOE+EOgEzJQ5XaUzuTTOSAC2Rpx5FkIoBVqEZ4P/A=@vger.kernel.org, AJvYcCUTY0DMmKHe4mG6LVHjqX+6T144aSmWrQL7uguklS4ntOuWG2DWYritARTwzDP1I7m2ddrZ9h7hMoM=@vger.kernel.org, AJvYcCUq5cccvZsOD4GxDpnaTpllmiaboeNRfICzAIIkVtIIAlgK8I2YEghmw/ITPLk46mZkA/4PSqVtDJQY@vger.kernel.org, AJvYcCVTMJ4ltl2GUsl1FNEFSW4tiulmrmoyKABQILcVayBTW0vTF3ZRWJeJiKSDKdFVU9oaRGQY4Nn0pmyC@vger.kernel.org, AJvYcCVcL4MY0YBcHOqe0GC9aQ7PoIZFzdrs9AMzhrAht6dDxI0Jmn9emx5i8PuqF2bglv0rwwvC4Ex9BokZI7I=@vger.kernel.org, AJvYcCVgDkXonplKwRffcp2UUF2dMAyudUbA3m85e9TLQL19yIWOr4SLQapfu7wAMWREhvw3s0F26Cg63oqpbQ==@vger.kernel.org, AJvYcCVw/2aWeijlEJyCOechN+Fdw9/jX7Mx313YINIR14bpbqCGNGt+5Z6g5jXPK8+fhDb/fTWDxhQAksoS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8B+qLAMZ4aGNNUV2/FaRmksKpe50Kj0LziVfS5iCZZHvmBQ54
	Ywn/SKnrda7flqY25ghP8Y7AJY3Gshr+Ux2L7Z5wuvRoZeVmKXhR
X-Gm-Gg: ASbGncs0qy/2nsYlPy7rL/LIZN9GW3n4zeB+JumnaeUr1Emq1feLPVsf08ufzNab8Ou
	R4JbH1DZf5+tR5Co5YsOWda/eOiyWUm37SGITCXscPhz+lj9y+Wij7F6TQEw3q6GdPRcZkhJ6ME
	5mlLXE9GrZIGdjLbJ+oFmfk6LDdbUOSAm0Rw0gobOY2hZTxRPz+DHftqjF7EkmW3XtKirJCSA7S
	T6msyFEx4zaH2iauXloJVPkRXvrIxbY0QL7YJRiMqBqvv/NwaH10e9e7JRQHd+Ot+d8+UVyNY3y
	jHOWL0xfTZ47rBX9ap9kCVnCOF3ZOrOgAKCN3QTGai0sbwym40tsCPgBmVI=
X-Google-Smtp-Source: AGHT+IHn4JQsyFSxasFB9kseG6GL5OH2joNG2H4RvUQRMi3bBoNmSMbOzK2ZeABDPAmWpvG4lsn4Jg==
X-Received: by 2002:a17:90b:1a91:b0:2ef:949c:6f6b with SMTP id 98e67ed59e1d1-2f9ffb38596mr11411129a91.13.1738914340268;
        Thu, 06 Feb 2025 23:45:40 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d5f8d6sm4967367a91.7.2025.02.06.23.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:45:39 -0800 (PST)
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
Subject: [PATCH v7 5/7] watchdog: Add Nuvoton NCT6694 WDT support
Date: Fri,  7 Feb 2025 15:45:00 +0800
Message-Id: <20250207074502.1055111-6-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207074502.1055111-1-a0282524688@gmail.com>
References: <20250207074502.1055111-1-a0282524688@gmail.com>
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
 drivers/watchdog/nct6694_wdt.c | 295 +++++++++++++++++++++++++++++++++
 4 files changed, 308 insertions(+)
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
index 000000000000..6f0a6b7a203b
--- /dev/null
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -0,0 +1,295 @@
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
+	struct nct6694_cmd_header cmd_hd = {
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
+	struct nct6694_cmd_header cmd_hd = {
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
+	struct nct6694_cmd_header cmd_hd = {
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
+	struct nct6694_cmd_header cmd_hd = {
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


