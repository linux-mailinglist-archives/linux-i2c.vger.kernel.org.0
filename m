Return-Path: <linux-i2c+bounces-12602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89650B42F25
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 03:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87BA31BC7E80
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 01:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22D322F74F;
	Thu,  4 Sep 2025 01:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTaWsAmQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB751DF994;
	Thu,  4 Sep 2025 01:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756950684; cv=none; b=cMABD6chlChFNQxDu4BTSQzxHjkvS4QxEW4b0WAbuGpsDh9v2KJcK9DzFQrwpnOSzOxTWTn2mEXpCxfcyLUUyoapVkHdYekgWFwzWCOO5s1RIPDBd/R415tJMBM9T2cJak9GqhLzuJynHKdcxYKpjqQ6LWGiH2B//sLuerlDlvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756950684; c=relaxed/simple;
	bh=XHDjW/wNxNefieirIku9nqenuGi3hugPiqlbiOGBXww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gVWiqFPmxAovIg0FI5BDzHXY3zzGF4j+5lHWddfZnOefT5loRTZGfn/8wmkauyNd7JSX2tvqydbSeH65WIDhyoRx7bjnAfWKCPdFe1ClVo8DyWijhGBgQJ7uV+yA2NLoVzKsPAETfTpY/p1Yon5usgbwVrYEsMAT+KAIgZIq1cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTaWsAmQ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4c738ee2fbso401501a12.3;
        Wed, 03 Sep 2025 18:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756950682; x=1757555482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sou0t32baZGB/gx7eFQ0Qu1pCOQaf+XXBy5bTuaz/cA=;
        b=XTaWsAmQoZdaDo7TqZhmDckB0GfQSJDwwHkk8yUh9DWup1L9Pop0XPGQuTV+q5bRa7
         M/gHwBzACSs3cCjCU2JQ6MfByxMVzgg92cu4ld88Wk7PxIWS2iMVRUC3I88Knn7jbO1P
         r5hOGPqaZpeQ94W0AkU3oYujYjrHT39wQds7MvlQ74e5NsBa3UIrs3kmk4kPb+EDaiSS
         LrjDmFYxM6bH2V2M/i2rrCAqdquHAD305T2S4mI3S4jrDO5bbLR+QlbL/Hdm+r7jFewn
         YL0+DgeoyniE+mqk2hb+GtUUIFA3YOugml2L2zA+6ua0lsMcUICiNt9wycAS+yaV4sNi
         j3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756950682; x=1757555482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sou0t32baZGB/gx7eFQ0Qu1pCOQaf+XXBy5bTuaz/cA=;
        b=IyPQmoPNnTIWrB4zNTHi0wEf0Wf7myVJf/2dM9neI3ufSYrEAZQs3s8wMOhjBoNhn8
         eLq+L0emLKJLBGkIkyIevOF5l9f+ViNO1l8J893i78Im6ebR3ZbMWINIRz3sPNbEFxNp
         ZXlSKeiLe6QvDkIBwm+HgVXL0olUELdJCa9QZoHrzX5Cj8FgIIFNx4EqxxgBKJikvwdW
         8noePBUNm6Z991K7FDR3ToADYhwzFpAVUqS0IyCzaGPilFM/ZWP8v3bvteGqVjT7UEFo
         9IrP3KUrK1Y00FM8vIYhR8eQspfZSskOFJzl+6+NA2PMWENO3hXms/JgE4dmMvJvc73t
         4F1A==
X-Forwarded-Encrypted: i=1; AJvYcCU3kPXGTLznxlHvSsTHzKE63PKDlCrD7y8zZHvrb+J0rKZJcNB7pYS3vbcf0w6FWPjhrxDDrRrYOTDh@vger.kernel.org, AJvYcCUC7BdqmlQcexDqGngWO4EyKoEyYNeCIxfhmkNrx3oXkqoxSKT1BblAD7OsukNl70DxWfkLG3CaheUVhi8=@vger.kernel.org, AJvYcCV3tkdc7guMM+J9rrPrQHtuYgfbilFoNqVs5BPrqLBbvERqSP4TeEJmLxmXfWmJc8WG8bLmuySPW6WrYmYJuys=@vger.kernel.org, AJvYcCV9rBCIV8IUY8nMoEcL6IQc95z9PFMTPg1YU7bAXvmnOudwFa4dNPRffnRoijShMT0+0NX+YIduXxU=@vger.kernel.org, AJvYcCXRg4dttBahdHkypJ9gSQnTIyXOZACbotcgkcwspWB/80bBY9jB6G+M2SYPCNU6rhF2+RnXM1r8@vger.kernel.org, AJvYcCXW8WlEouhjvWftQTNBKsbiDeyqhjH8FpHGpG+M05pF2OwSPGHHBO7C1bB2y/S3ZE3FuNt0cVRhmQUu@vger.kernel.org, AJvYcCXfbQX0uGVwLD/pTmexBrInNc9xUImvFXd4LiHngIalVNDOBqZ5RtlrOtYzS2pKOyGQ+FqUnNm3rUvk@vger.kernel.org, AJvYcCXluNdUp4R514cVfhoyFmufFAiHispo+jrbeL/jPaxy+9fPwaMqwGf6piC5hFH9qtYah6eCsET1d81p8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiue0RRLq09ubTik9dAAG+WyLVOabV74w6f52nM8g2OMjWa/cv
	duTRh5nbbfg31G3BCTu2F4wKGNYU9cBtEPmg+Qo8C3yly9rTNAewWUY0
X-Gm-Gg: ASbGncvclMd2+K7mEqsIrhnkapOZncCyyLuKc36RYVb5+0EUNLoQeRe5H3wJsTdC2vH
	g3W27TUkqA2EW2UKIcl5RfOXSN4qXKtSFtkNodLaGPHEkC6kvZKYv0R4JfjRL5U/QSc4jE7hso7
	UGTIVpYFapS0WZShiBhpwQE3aXK7dGRlr71WvZsVlK9+BvicubbANdcRA2jcoWaW9iCBTmkhnMB
	1q4ACSTDoq/L+lqqLtJglhenBmrAubICWadQN6/HLsaYWVSJPM7H7wSX8+X3cWFLSDH8CHcx1hH
	CEPzVh8jErt0S5mLU2x8fhW0KSYF0RxLq8Gs7apVU8ve65zPLiE/GNhiiyf8fh45qCteAd7NbLX
	dyQmJSP0pK0xK0POhL9bH171nEQyAS2MnE9xcTt4jwZ4IyiA/y+6M11KsoiSF5x7x/sp6px+liV
	+E
X-Google-Smtp-Source: AGHT+IGsx62zOFxKa3mWJwTNzVZBpTYSpUp8sBtm5WyyNInXjXEs7TFEvtULNqFYvMD6XNxSi2Pehg==
X-Received: by 2002:a17:90b:28ce:b0:32b:8ba7:306e with SMTP id 98e67ed59e1d1-32b8ba73649mr2174286a91.35.1756950681781;
        Wed, 03 Sep 2025 18:51:21 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329dcc0af56sm7080205a91.24.2025.09.03.18.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:51:21 -0700 (PDT)
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
Subject: [PATCH RESEND v14 5/7] watchdog: Add Nuvoton NCT6694 WDT support
Date: Thu,  4 Sep 2025 09:50:46 +0800
Message-Id: <20250904015048.1801451-6-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904015048.1801451-1-a0282524688@gmail.com>
References: <20250904015048.1801451-1-a0282524688@gmail.com>
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

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes since version 13:

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
index 758c9a67184e..4639d5933c5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18089,6 +18089,7 @@ F:	drivers/gpio/gpio-nct6694.c
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


