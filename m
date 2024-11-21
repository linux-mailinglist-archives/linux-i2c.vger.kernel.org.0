Return-Path: <linux-i2c+bounces-8107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 745919D47D7
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 07:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4CB6B23BC6
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 06:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68601CEAB8;
	Thu, 21 Nov 2024 06:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVhHMXsR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C5C1CD1FC;
	Thu, 21 Nov 2024 06:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171283; cv=none; b=aMMD4/+3r2DOHct3jsj/kW188j3UyJMxWHg+bUSH2FSL1WKdSTMltbhZFQod9SSSkeEserIzNNFOhtd97TsWYTqAy6lcXYaM6eJ0KX+ZPwzVGO7tta6IM+ONxGstoUOdSGrG4JCbrApCnF9War5DeESYXfCjVS7mtF5UkvsPX+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171283; c=relaxed/simple;
	bh=CPXoehGwTSs45YlcqtJ+F/QvQrwzI5sbYSnD2Pak/mE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L2UOKXwtpFoVh0KeepTmWhttamUsE7pqLbjK+7PqS0IUFbS2ffxfTuoqq5wEER4eRTM1hrC7c49d5tXpzHzu3GLiO4mgwdgzzcx3Mo5qXGS1MlcFrxQhZ26V4Ri+rEKpS6cD8Hxu4xncd5lhpNheySyeRo9JtoeJx9LY6N+Jp14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVhHMXsR; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7f4325168c8so396126a12.1;
        Wed, 20 Nov 2024 22:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732171281; x=1732776081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsLP5BfEq+ny/TNJBmMYQ+aCSSVlRXL5xPNb64PDy8c=;
        b=WVhHMXsRnlnd9qol6ZM4YbxZNA+HOTThBF4TuPQ+zcdeze1bJYp4XBFYC1O2dlFqFF
         xD9YpWRjU6UpBnXY9G4erbIWZrpluXjJ6Km/YlHKXsB/lcnN5KpHgA0u5E54m0+h5iHU
         k/PmJVNSVRKIsNEd173KnYH7kbIh2e1M5EirTcJkTSBf2tWfFSjUhYJUMZfxhFYejwAZ
         y9L4+m9AZz7L/sIsIFfw76vYIqkkMdjDk7HwJG/Pyi4/rE5YxOFkny45U7RqCFiUJxD7
         AqrWCTPjeP5si2BOSheLmyoMrX+itAokLM2fG3YMfwTlxF81Kh7G7GhOUoD7eKy3GSvC
         uzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732171281; x=1732776081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsLP5BfEq+ny/TNJBmMYQ+aCSSVlRXL5xPNb64PDy8c=;
        b=mUoM1ZIJRa+gcQSU1qT3TeiZlR7t1BmX29oVPkrq3Enoa/zVPC7a9DkhgomqIYEWwa
         TUYe4Sles/5CW5DZL4f6bA97S0Xrg1aw0t/T+tqblUJudBtjFzoBsl1YidwcvpT09F/S
         1fF7L9qdm19Fm0B8qYpOBL+dR0RHtFevcQatRPXLUEAVK+/p7cy3ykNlKScDZiXKUvN/
         cIvXicgZ84ourP5/642yCwesvfXvD91RvpHE/9xLMoLamwYQy/vY6rg6Y+Pz6IbHS/pI
         ygQUatmvfiSVx4WmX9rUha3q9//mLwTqXgxa2/VscIHEv0V9xYhk4TFVi171EBbaR5dL
         Ex6A==
X-Forwarded-Encrypted: i=1; AJvYcCUcf2yrw4wTju8UdcnBqoo5vd5KUMgzOPLhUz8VclTOkNgImzXrQXFLL/MIIrb9xrXTBXFTkURAKxXXyg==@vger.kernel.org, AJvYcCUhNWkwhDEtfdCYl7EdAP/gDb+OMkTr7dZDqrYic2PArnEg0sK/D2FTx+4Ds7nWLlERzXpd1EPOj2kw2m+qSh0=@vger.kernel.org, AJvYcCUsR/qzHGav9Sk+aEexkV2wx8f164L3DLkjTgheQ70EXSyfBmTsPsf8kNZAvl2CXUQVRf4sLSx8xng=@vger.kernel.org, AJvYcCVYGK7LM4m3eYiRqUQ+cTq6H/RmWcUh4vJQRwVRb8Lgr0C/ihhcGtG94RjJuDA38OIVH+bmzBUnfvRo@vger.kernel.org, AJvYcCWZwpQXHjJPdK+83pYzjAyQKO105ATlp1R/SWCICNysbXtUqHeZvDJ9DgTrBWTrxY5VRijrK8wai48VE8g=@vger.kernel.org, AJvYcCWjTCmk2/G3UCQ5zbdXUF2Q3OexwzOhvRquypS4iM9uRZG0aPWFFttJTH0WvdUsr9sKxKoh+bJN@vger.kernel.org, AJvYcCXRGl5qSI/VdzeqwnTyTeHUoGc92NsYcnWYx6UtRaBd7HTwvDPahQIGny62oJtljH0vsdIlr1Nqj8nt@vger.kernel.org
X-Gm-Message-State: AOJu0YxfTwEmMKO9Eh4WLgyBGcpruR9VVtOCT9gvO9ehU+XRXUKAuopS
	vtjrly8gMNwW7kFmf8AlEzPFPK1hXHknOFghNSgMYXIfq2iLRVMr
X-Google-Smtp-Source: AGHT+IEokQsrbNi6zBGYjcv9dBanc/vtO5pLqsDrV8MZO6La3pSabbKKLXvwdl8PKCh+QdVTOH921g==
X-Received: by 2002:a05:6a20:748e:b0:1db:eb2c:a74 with SMTP id adf61e73a8af0-1ddaefbd38dmr8314594637.12.1732171281038;
        Wed, 20 Nov 2024 22:41:21 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beeb83d4sm2812530b3a.40.2024.11.20.22.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:41:20 -0800 (PST)
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
Subject: [PATCH v2 5/7] watchdog: Add Nuvoton NCT6694 WDT support
Date: Thu, 21 Nov 2024 14:40:44 +0800
Message-Id: <20241121064046.3724726-6-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121064046.3724726-1-tmyu0@nuvoton.com>
References: <20241121064046.3724726-1-tmyu0@nuvoton.com>
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
index 2333476a42c0..851c1f17712d 100644
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
+	  If you say yes to this option, support will be included for Nuvoton
+	  NCT6694, a USB device to watchdog timer.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nct6694_wdt.
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
index 000000000000..7d2c8d5c6fa3
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
+#define NCT6694_WDT_MOD		0x07
+
+/* Message Channel*/
+/* Command 00h */
+#define NCT6694_WDT_CMD0_LEN	0x0F
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
+	dev_info(data->dev, "Setting WDT(%d): timeout = %d, pretimeout = %d\n",
+		 data->wdev_idx, wdev->timeout, wdev->pretimeout);
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
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	int ret;
+
+	if (timeout < wdev->pretimeout) {
+		dev_warn(data->dev, "pretimeout < timeout. Setting to zero\n");
+		wdev->pretimeout = 0;
+	}
+
+	ret = nct6694_wdt_setting(wdev, timeout, NCT6694_ACTION_GPO,
+				  wdev->pretimeout, NCT6694_ACTION_GPO);
+	if (ret)
+		return ret;
+
+	wdev->timeout = timeout;
+
+	return ret;
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
+	return ret;
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
+		return ret;
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
-- 
2.34.1


