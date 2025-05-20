Return-Path: <linux-i2c+bounces-11059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9323EABCCBE
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 04:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A581B632B2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 02:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6BE25B1C4;
	Tue, 20 May 2025 02:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aI/tlyK+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0925A34D;
	Tue, 20 May 2025 02:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747706673; cv=none; b=Y7AWigJVBsHM/00Bi08cfsbicwtNulHXokaX3WUF19II9yh/ay/9n8J01APRPRp9qLOgplfYimsfy0lsZopBSNMuWyDsmJU7pijnZIAukt29N2O8HfVt1DgN/v6ZbC19OPPahrjCl0pAZ0VDJ1Aj66ge4cqvOhZ1gQ5tL134IqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747706673; c=relaxed/simple;
	bh=tefl2AxIAFqeyMWNGmjaFdERIzDjTCzbROc8E2SFUJo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gRNBL5jDZ9LJVhuoaMN/iLmYeHiFk5A0z2RcMRkBXpwBgC0JnzNWrcF29d1C/B4Hr1kGfmptCrMhY1D6Jd2/tv/Bwi5QNO67O7uUTxxAECQDPR6VNRc2dmg8efpjXK7Tm6KPYGq4eQ1FdCVMlB1WprWNAJvpEYfLE2e8cKbf6tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aI/tlyK+; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso5755922a12.2;
        Mon, 19 May 2025 19:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747706671; x=1748311471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6DU/6/FZLu/99LfVUbODFhTyR+2P/eumktTAFHtMzw=;
        b=aI/tlyK+S2Z1a2dd1V6brlnEcwQkjjd4/cn0gchgW1l4X4iXE3Jj9EFhNYvXX8IAVl
         xA1qRp531xSWIKhiIqnJzYGkSszmC0rM/dt1p4Dz0fWjDG7aef3A1+zC4/j8oCyboLH1
         gJThcexK4ONB7GNzYsZ5VO4Odme5GBHXgO+t2sbA3g8XHTWJXMf3jZCoJwfIGT1HnYtZ
         5xNCHJZS3HIg7NydZUupL51qFiEakpapmFda4FUZ1SNaUYrm8QsXD6yNWAl4DvwgiCHB
         xAaLu913Qx54rTv+6BigBdmlqSm/+ABtaKjQ8Xt7hHMiTOSF5mLmJ20BVyuW8+olaOzZ
         mTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747706671; x=1748311471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6DU/6/FZLu/99LfVUbODFhTyR+2P/eumktTAFHtMzw=;
        b=cVSgYT7K8dzVYrOfFGsQc8kTSYyjJTEUfLXDnOFBs7IEApuRGKPhbBuDl1sFjXkPbW
         f14dejnW1YHhEAqBGHqcrxaZBNcYrykDoc81cD4vDZD/397VkIlbCLW3my2uYOyU2DTP
         uE6THDtOZPeYGtnU42XMVsswPglr//3AbgYwhs76QfgFJOtQNygDrKxiQmsYUasqPVRd
         tomJr0f3xLKX8RC58KVE+raJ0F40H6TsbifoN8X1+cE1QdmMnCQ+SFdRJ8DzfgkG1Th4
         9WG5FVg8o3GFClw+h128TUMg6qfdr4zd0XX2XjVWKxQ8O09rrnxPRm0v2ZkXiinjijHG
         c4fw==
X-Forwarded-Encrypted: i=1; AJvYcCV3EbgELeR94/xf5ldp7EaPo+EU6gkwHn5oBVFg3dU3ECeoSqSriDzD8/vTrFAxJ+e6jEMnZRfzS7mvIH3ve5s=@vger.kernel.org, AJvYcCW2CHtiFiHzQABoY2fQcbpL3FBGaKYE5DpDrDr2w80zrYj74e+5jGu1Clj1LNpaifBKmfDg6FhmOh/fag==@vger.kernel.org, AJvYcCWfKLhs9N1dfB4WRp1i6qGTadT5qsV1pRHOtWMqq+9JLiVurDZlsZCVXb9InSITdoq5yazWn4+oVm9V@vger.kernel.org, AJvYcCWq2XDZ5qjLgl0o93fmlV0OzDLf5Ku8GEz+/U+/VaQrPY+V4D3UleykHvXMCAGmlHTf/XlOTzIVAG9J@vger.kernel.org, AJvYcCX03Tsto+BWnjLSvCXFEZ9YbtMuUvXDxJ8DLA9NZZfFUyQI6ibW+vHLmxXddWkybk+gmFHAqmIFsXw=@vger.kernel.org, AJvYcCXQhIgh9IJvkK9ERW1+4s0P/l187cyyQxpkt1l8UmXlWH7YVet2lZAa2cUmhSOo3wUOwd/oUO0LymUGA2k=@vger.kernel.org, AJvYcCXcIYz+7FygzYIh7YJZY5YFFi87ORttprd0EIPfdRXu/dSslGA11ucxKpJM0DoWaLUFmsc5WC8o@vger.kernel.org, AJvYcCXfBLK/E1QLSN/Wjpa1QmzVOwrDMWQK9YESn/Wh3hCcueeGhdqyGrKyCVVSB/+R0jFb4efTWaId5hZG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi6y77Kkdbe7jh70LL0uHPl2r84KJix8c53C2GzymdeVmkzoAs
	rjNdc1gCZB2A8c83LSDStaAopOCoo7NnaEtZb3UkPFA9NLlayW6xnhBV
X-Gm-Gg: ASbGncsS1F79+yHL7rvuMNgFs/ln5y2F+Tr3y5flxNYOESLiCaAUVyyPrNgq++W+YPR
	eKBjcSxAazCfujWfk0YnCysZDkVQP/qBPHSHdiSt61Oc4vGXgG8+CHswxP7tBDCsxR1PLPklvMI
	jVtql6AkbZaHd7dzQGpHoMMSZVrWt3G52QEwEnTR87aqnFHecBd0ZMLctDqDzUxEkpXOsEl7aTo
	SARxvqAX8X4hJd9bgcRP1EtyFCAco5zRjrsICAysaNyTr4pqqFocZoPE87hig5ZiEtCoYtcRwOi
	6ttQ3CZ6TPKVz29b8Szoz8Pvikc4KGYqzZMRYHnLXc+j4GdQlIh9tfZaoro7QcWN9nqVWAW7kzE
	ifambANgN0y0E1w==
X-Google-Smtp-Source: AGHT+IGQnI3ZWqLU6mPytsOfHSMgv1/YL6lKqHlR3rNbZqiFbhdQO43HR977KRRd3NGyFLEuZPuiTQ==
X-Received: by 2002:a17:903:b8f:b0:220:be86:a421 with SMTP id d9443c01a7336-231de3ae560mr225452765ad.38.1747706670795;
        Mon, 19 May 2025 19:04:30 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9fc8sm66543855ad.27.2025.05.19.19.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:04:30 -0700 (PDT)
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
Subject: [PATCH v11 5/7] watchdog: Add Nuvoton NCT6694 WDT support
Date: Tue, 20 May 2025 10:03:53 +0800
Message-Id: <20250520020355.3885597-6-tmyu0@nuvoton.com>
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

This driver supports Watchdog timer functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---

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
 drivers/watchdog/nct6694_wdt.c | 320 +++++++++++++++++++++++++++++++++
 4 files changed, 333 insertions(+)
 create mode 100644 drivers/watchdog/nct6694_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 57b95c21a626..681e0cfb4a4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17458,6 +17458,7 @@ F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/usb/nct6694_canfd.c
+F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0d8d37f712e8..6d84a509501e 100644
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
index c9482904bf87..7fe51bb06060 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -233,6 +233,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
 obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
 obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
 obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
+obj-$(CONFIG_NCT6694_WATCHDOG) += nct6694_wdt.o
 obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
 obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
 obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
new file mode 100644
index 000000000000..195bcbc0f156
--- /dev/null
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -0,0 +1,320 @@
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
+	struct mutex lock;
+	union nct6694_wdt_msg *msg;
+	unsigned char wdev_idx;
+};
+
+static DEFINE_IDA(nct6694_wdt_ida);
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
+static void nct6694_wdt_ida_remove(void *d)
+{
+	struct nct6694_wdt_data *data = d;
+
+	ida_free(&nct6694_wdt_ida, data->wdev_idx);
+}
+
+static int nct6694_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	struct nct6694_wdt_data *data;
+	struct watchdog_device *wdev;
+	int ret, wdev_idx;
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
+	wdev_idx = ida_alloc(&nct6694_wdt_ida, GFP_KERNEL);
+	if (wdev_idx < 0)
+		return wdev_idx;
+
+	ret = devm_add_action_or_reset(dev, nct6694_wdt_ida_remove, data);
+	if (ret)
+		return ret;
+
+	data->dev = dev;
+	data->nct6694 = nct6694;
+	data->wdev_idx = wdev_idx;
+
+	wdev = &data->wdev;
+	wdev->info = &nct6694_wdt_info;
+	wdev->ops = &nct6694_wdt_ops;
+	wdev->timeout = timeout[wdev_idx];
+	wdev->pretimeout = pretimeout[wdev_idx];
+	if (timeout[wdev_idx] < pretimeout[wdev_idx]) {
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


