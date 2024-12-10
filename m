Return-Path: <linux-i2c+bounces-8407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5909EAE6B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 11:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3DAD1627BD
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79E7215793;
	Tue, 10 Dec 2024 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ntpdez/Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36B5215780;
	Tue, 10 Dec 2024 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827577; cv=none; b=HITGhc2g3nz/sC3CFF77AgDyqwk8Ii+U2M2FIfjQFrxyGvvCzqGdmyJZmCmEpxD9A9ydd3BzNvqYX0TL+Bya6XQtRdlNTfv/uvWiXLHTUEDA3ZATdpkU50RieSwGvOnNGaIB04gWbCxjv3LAzu8U2zj6nAytGKI4ibWGv9YFmEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827577; c=relaxed/simple;
	bh=giFK7rbknOSV5wAh3IscdVPXwsIV73c96BatmznTkQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gO7HBOmNP+tXlyeMZbSHqf052/UWWethdNZS/saQkuOXb95eBQYR6OFpwJp2ELkUKkpy0WW4d/Wv1stQb6rCajxA3umdjnzSn1GuPzED6ntfAEVSGnmlQnjwq9Sik5kpaigORFJ/8VSAP790vCNaEW1alTkXiahbmkU9uIlKM6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ntpdez/Q; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7258cf2975fso4646441b3a.0;
        Tue, 10 Dec 2024 02:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733827575; x=1734432375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME5zuGPiPRU9O4AADQwN43nGSOLbcrfnhqj5gMh22PI=;
        b=Ntpdez/QtPl/O4dfdguLsJT/wcYgSU9Hi3Efwy+UFFZ88to91UL+GbFHFs0JCbBdyj
         X6MI6SD60K9FZV5agYir0FTYrlPx7u+vMGlhh31MLt1Fgg95mk7/EsMSMP0bG8CHzAQn
         NJsT6jDkacFnNWEQXaCbTm34zdAYZoM6qktDIjacSOG/1KYof4qCR9Un9BtpxI18jk/g
         hGi3nfDoXonSx79gSksP5O1XfIXtswTkDS4nYS+c9xZA3B5dLG4oMFV/BMW6dM/LrizU
         gkkHMDnGKOF6p41+IU5slToJthqI6cAaaoHtkDh50GZ0Kknnc6f/XoaRISvmrxG4YntI
         KV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827575; x=1734432375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ME5zuGPiPRU9O4AADQwN43nGSOLbcrfnhqj5gMh22PI=;
        b=i5LuDGkSJE0Zf7JB9trWFaEFmxibtlYRCTvJQKoUhkZM9hwJZZ141RHep14SsPdMo0
         SVjothHY1vOosJNRks93UiGoQFTl3TTYoZOfS0E7tOI0A+sd8jNRVUy1SklH9V0y1BYb
         K+fdTS7/ew5V3b/D3qbBTh2cJ+jwyIgVZM5USSw2lxjLw7tQmJjk8UDZ8hm+7WzJerDD
         Y4Go3OdmiD5gWrvw+87sBozJVCDk7TQaporiZlttuvl+oSSELRBaQa6hrQxcFK20rOd4
         TGYdLuzbCM2Y8+/YFo1wOtSg2Y2VdmY1yQXxD5qbfNLA8+mH4XXCCn3A/Ift+DiebBj/
         WKwg==
X-Forwarded-Encrypted: i=1; AJvYcCUNan4h9aTF8d9p7IVj/fxOqpMLatmxrOSaiuQrl1dwsHPN/+OFrzb5kdMELuIjcIAd+0d1Pt2UfZ0q@vger.kernel.org, AJvYcCUg4dQ8pY1zwFLIQUxKhz3LA292SsFclnDpJmuE/L5SZBoPKHgh+kc2dd6aJzECCiaQ/f74BeLZu30=@vger.kernel.org, AJvYcCV/Qf77JfhTLOmFs7kQoe8Ot9U4PqiIS3dY/mOwy/z8IZ+gamR9kXv5ybQHt6Uhzg7ZtEFlandv@vger.kernel.org, AJvYcCVRoQvfV/nR/6iiyf4M/CU4QpX3giCQydTvuFIRgdhyQgAFg7AWmzLVfSdIENKtk8ewotycABmNKh05/w==@vger.kernel.org, AJvYcCWGta81Z8HhY6FQI2e6AY8EzMnXl4QWbWHGx433PclCijIywtrxzFYDH4myHgrNtSJBQwXr/PF6Q4S2OAaIcdU=@vger.kernel.org, AJvYcCWSs2vKjlgLVUk/Q8/qtYpHI5jVjjf5yVe/jNDYc/fwKsMBTDnhPaqnIdeXducVKCEzBVWuMYHPVeNbpJ4=@vger.kernel.org, AJvYcCWnt/LvQcE0ihnGlrD6VgC+kze1fp4Xbrls7/NLKLkP9tEB5ewLpP3LR+BEZWZd7j/uA+IW4ArM807D@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFoDoosJvqSFGbraXDoxFLwLdD/q4odx3eZ4DtVZ1DoaVffD/
	fj+whPXBUSYW1DuAOY+aFzhYPn9N3t+DQIVWCqfXUgIffUhqaNx2
X-Gm-Gg: ASbGncs9W+g3WxeCRreiQHabySx+uA0Mzis68wlB8co5ajE6hr8E/po1ypGsCYNirI5
	nd842usnKMZfPAHTTfMpuUoGUrGrxS/KqzfuU1LhMfZPMW8Yhjqo2R1lowm8HUVuAqDZ554eLMI
	0p81x8Zn3THayoWqQV5aha46AD+hc6WAdUKEhUupN2Qo3BpYkcJpbuVYqnZsfXH5KsbXD0O7A7B
	NPO8kOnDsgCpHWDOIDG1krwb88AmZq1Aj0z6L/gPAeTfrhqj/Y2uWUeMq/CrfeK4aCs6ukys0T3
	ZZL+a48aBJUP7tyt
X-Google-Smtp-Source: AGHT+IGzOvq2qIXdJQDI/CD5stb0Ab+6Vcn+aQgyeeQTNLQliPlwige6+P76duH5NjDrhEpg7ZCvfQ==
X-Received: by 2002:a05:6a21:7897:b0:1db:e3c7:9974 with SMTP id adf61e73a8af0-1e1b1aa0c2cmr5951546637.12.1733827574844;
        Tue, 10 Dec 2024 02:46:14 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156dfe2fsm8905748a12.31.2024.12.10.02.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:46:14 -0800 (PST)
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
	alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 5/7] watchdog: Add Nuvoton NCT6694 WDT support
Date: Tue, 10 Dec 2024 18:45:22 +0800
Message-Id: <20241210104524.2466586-6-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210104524.2466586-1-tmyu0@nuvoton.com>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver supports Watchdog timer functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                    |   1 +
 drivers/watchdog/Kconfig       |  11 ++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/nct6694_wdt.c | 277 +++++++++++++++++++++++++++++++++
 4 files changed, 290 insertions(+)
 create mode 100644 drivers/watchdog/nct6694_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index eb5d46825e71..496fe7d5a23f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16549,6 +16549,7 @@ F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/nct6694_canfd.c
+F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 2333476a42c0..fbfa5a5f7acf 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -739,6 +739,17 @@ config MAX77620_WATCHDOG
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
index 386d88d89fe5..8355893b4435 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -232,6 +232,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
 obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
 obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
 obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
+obj-$(CONFIG_NCT6694_WATCHDOG)	+= nct6694_wdt.o
 obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
 obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
 obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
new file mode 100644
index 000000000000..52b785e2fbd6
--- /dev/null
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -0,0 +1,277 @@
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
+/* Host interface */
+#define NCT6694_WDT_MOD			0x07
+
+/* Message Channel*/
+/* Command 00h */
+#define NCT6694_WDT_CMD0_LEN		0x0F
+#define NCT6694_WDT_CMD0_OFFSET(idx)	(idx ? 0x0100 : 0x0000)	/* OFFSET = SEL|CMD */
+
+/* Command 01h */
+#define NCT6694_WDT_CMD1_LEN		0x08
+#define NCT6694_WDT_CMD1_OFFSET(idx)	(idx ? 0x0101 : 0x0001)	/* OFFSET = SEL|CMD */
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
+struct __packed nct6694_wdt_cmd0 {
+	__le32 pretimeout;
+	__le32 timeout;
+	u8 owner;
+	u8 scratch;
+	u8 control;
+	u8 status;
+	__le32 countdown;
+};
+
+struct __packed nct6694_wdt_cmd1 {
+	u32 wdt_cmd;
+	u32 reserved;
+};
+
+struct nct6694_wdt_data {
+	struct watchdog_device wdev;
+	struct device *dev;
+	struct nct6694 *nct6694;
+	struct mutex lock;
+	unsigned char *xmit_buf;
+	unsigned int wdev_idx;
+};
+
+static int nct6694_wdt_setting(struct watchdog_device *wdev,
+			       u32 timeout_val, u8 timeout_act,
+			       u32 pretimeout_val, u8 pretimeout_act)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694_wdt_cmd0 *buf = (struct nct6694_wdt_cmd0 *)data->xmit_buf;
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
+	memset(buf, 0, NCT6694_WDT_CMD0_LEN);
+	buf->timeout = cpu_to_le32(timeout_fmt);
+	buf->pretimeout = cpu_to_le32(pretimeout_fmt);
+
+	return nct6694_write_msg(nct6694, NCT6694_WDT_MOD,
+				 NCT6694_WDT_CMD0_OFFSET(data->wdev_idx),
+				 NCT6694_WDT_CMD0_LEN, buf);
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
+	struct nct6694_wdt_cmd1 *buf = (struct nct6694_wdt_cmd1 *)data->xmit_buf;
+	struct nct6694 *nct6694 = data->nct6694;
+
+	guard(mutex)(&data->lock);
+
+	memcpy(buf, "WDTC", 4);
+	buf->reserved = 0;
+
+	return nct6694_write_msg(nct6694, NCT6694_WDT_MOD,
+				 NCT6694_WDT_CMD1_OFFSET(data->wdev_idx),
+				 NCT6694_WDT_CMD1_LEN, buf);
+}
+
+static int nct6694_wdt_ping(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694_wdt_cmd1 *buf = (struct nct6694_wdt_cmd1 *)data->xmit_buf;
+	struct nct6694 *nct6694 = data->nct6694;
+
+	guard(mutex)(&data->lock);
+	memcpy(buf, "WDTS", 4);
+	buf->reserved = 0;
+
+	return nct6694_write_msg(nct6694, NCT6694_WDT_MOD,
+				 NCT6694_WDT_CMD1_OFFSET(data->wdev_idx),
+				 NCT6694_WDT_CMD1_LEN, buf);
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
+	struct nct6694_wdt_cmd0 *buf = (struct nct6694_wdt_cmd0 *)data->xmit_buf;
+	struct nct6694 *nct6694 = data->nct6694;
+	unsigned int timeleft_ms;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(nct6694, NCT6694_WDT_MOD,
+			       NCT6694_WDT_CMD0_OFFSET(data->wdev_idx),
+			       NCT6694_WDT_CMD0_LEN, buf);
+	if (ret)
+		return 0;
+
+	timeleft_ms = le32_to_cpu(buf->countdown);
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
+	data->xmit_buf = devm_kcalloc(dev, NCT6694_MAX_PACKET_SZ,
+				      sizeof(unsigned char), GFP_KERNEL);
+	if (!data->xmit_buf)
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
+	mutex_init(&data->lock);
+
+	platform_set_drvdata(pdev, data);
+
+	/* Register watchdog timer device to WDT framework */
+	watchdog_set_drvdata(&data->wdev, data);
+	watchdog_init_timeout(&data->wdev, timeout, dev);
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


