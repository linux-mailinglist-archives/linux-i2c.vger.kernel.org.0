Return-Path: <linux-i2c+bounces-7523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398029ADFD8
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01782282B9B
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01281C9B7C;
	Thu, 24 Oct 2024 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnEQJk45"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53AC1C4A0B;
	Thu, 24 Oct 2024 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760411; cv=none; b=mNGcdBv9oOKeBAOCkI2B8N20Gvt1dHk7S1Syd4pKC0RVXQc3JujqWwM+7XZl/NzVDUBVGg1pCqfp6rj8Vy7olhhri6tZBtXxvVWzQefbiObNQSMmaZMc5Zom0YxoiHbQGgCMWDBWDVyU0ddrATIlkUGbeOV5a22Dzf7md+uuvfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760411; c=relaxed/simple;
	bh=3I8ywrsU0xhtRdbt2GAAAVfMRR4Z0NFWWn/DEx8sutw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qTxtKRmXjHDBGFKJUOuffsAPc4KXkxVs6SF98rIQgeYKrvWx1tzHZO0l3Jb1aRYc45EmpdOmC/FtPyj+QJSeXAQybVIPRTFPCPB0PaqpnuYI5KzeQshf4hOuiviSlGQ2BGdkcb3yIEbY1b3g0AxIncvVU9a2cKYJr/YIO2JX5F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnEQJk45; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cbcd71012so5909395ad.3;
        Thu, 24 Oct 2024 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729760408; x=1730365208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FARd89uMKMiwdRE0HODiifxKuOk++DnE6Elk0uN6w0=;
        b=fnEQJk458wv1gR/FZmPZcnURLeS3uD/tg2Z+LiShknc4oHqLGf5Cn69ZwqUaTmghfN
         ShPwYkucCZAk+LbuwYyjyPJEpETUVfdIPi7BlmNFgMgx9QxjDMDc0wdlNOPk2x7AA5O7
         mX/RXveGSzAa8NyLTFzLNpxKS3DWwSogBYlCyExisnvWj6+3N2cAsUTqA1HVOZaatA1f
         bffZAnoWtxElnoDKyl/0JS/PO6gtajcvi+r76Qh3wyjVcrMN4LSZbp+xdIWojNpSA0MZ
         8atkpjYjA756vX8/LIXpMaj2SGOtfN00vH6xnpNOBICglmroRSxlRXYjYx3NcjWZptFH
         teZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760408; x=1730365208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FARd89uMKMiwdRE0HODiifxKuOk++DnE6Elk0uN6w0=;
        b=fyzlpN4aBvY6ch+7JTiIrIJ2PN/vu+QZ0eOOttY+9jFRcMhJoGwNjs7dMRNNc3uMKM
         M1rwp27IFBdyLQa8m+wJq/sKwdIm3v2c/O7OVI+P1Es+cLbGIWEwrf3pA4KDzllnzAlz
         25hIoSSn16UJKK5YJxWLb21TYm/YHASiXaCEQbyBFPUfp5D/kG3GYbDSUzp5DnIRySjH
         JfQ0zxM51K28L064QBTtpqQzhXWCA1dfRxoPPDD8v+jzLk8vtnC5HDzDev8iiT5Fiv+u
         TciCorZ4T9HFK+6BaYFiEXZ2CvFgt7mZ1Wo1/77W2WS3Cgqcq+5mPu97IEiqyAyB1Lft
         wwug==
X-Forwarded-Encrypted: i=1; AJvYcCUsZUi8xqW3nf+3mlSi12tKUSGU6tNiqFiA59BOWmSKztzLr36aEKtfNArpHNBzlQFeVVKpz9hNlQfA@vger.kernel.org, AJvYcCUwfYx2j9FaOYxi9ILdFyyy/5dHHSAAo/+Yx7yv7C/NHISCvFMiezMkbz8tp0Dyc4wgXg/TWF50Rr3NS1Wh4+A=@vger.kernel.org, AJvYcCVF3ICxiuOKprFAPFtnQltPPtYUSSm4StI0XC3ivD7LdiPR6RH8D+xH0M70t36gnQ3QdcwjEdpwkCs=@vger.kernel.org, AJvYcCVJ4fqFZDIsBMSRn0MV5GtNiEQNIV4nm8aLx5wYR3lfAtEPlMK4XdFBpL3ufaSPSPDdIV3HEw8PsI9wUA==@vger.kernel.org, AJvYcCVvmdHb67rkC/zuJq3NJXnOW3Cn5IGm5k4SpuH0gn1+tE5Zf+byThXxLHoI3B8Z+AhJUDExR9h4EdRU@vger.kernel.org, AJvYcCVvwFKTOmEPcKrE5BzprR6XNIvN2UYktutu99NNbI6IdSEa2K3e5/ew3Yc8+n5LySXquOA17Wuh@vger.kernel.org, AJvYcCWeBt1aKZBQlz6oBLbeIc2SkZDwinEZLyixJry9cQEzAZU9GE0CTr2cSGbY+0gtgxRy9CjST6TKZwXn@vger.kernel.org, AJvYcCWoGGqXeIGeSE6EAEHq6NET03ollHo1nQeFTCBWNtw3pYnsD/6WeMLWyH5HwbAp8dZjBJADccDpdI+xpkw=@vger.kernel.org, AJvYcCXPe0rPPI4yYE8gxiPeISsEZ5QnNECPA3wTxE5Vw1AmS29GpM5iSfblq/c8Q7J5tCaC/jPWJIGVSAQg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6G7PSQRRac63TsJwZJ5Eor94b82ECH8hMu2l0LWLgXgJ6jcqm
	bD01wUDjdyk4JZDsF9ME96Cp1fp6hajcJDE6E8u2FQDXQwlQr0p3
X-Google-Smtp-Source: AGHT+IEjlQjtK3IdPe7OozHEaVT+1//rpRzkg/Zm2w6oPWo0AbisWaaw/ay7mB7dih1HMy0pVb7n2Q==
X-Received: by 2002:a17:902:fc83:b0:20c:aae9:7bd7 with SMTP id d9443c01a7336-20fa9e9f8d1mr50554125ad.39.1729760407938;
        Thu, 24 Oct 2024 02:00:07 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6e89sm68503615ad.277.2024.10.24.02.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:00:07 -0700 (PDT)
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
	jic23@kernel.org,
	lars@metafoo.de,
	ukleinek@kernel.org,
	alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 5/9] watchdog: Add Nuvoton NCT6694 WDT support
Date: Thu, 24 Oct 2024 16:59:18 +0800
Message-Id: <20241024085922.133071-6-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024085922.133071-1-tmyu0@nuvoton.com>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
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
 drivers/watchdog/nct6694_wdt.c | 329 +++++++++++++++++++++++++++++++++
 4 files changed, 342 insertions(+)
 create mode 100644 drivers/watchdog/nct6694_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index eccd5e795daa..63387c0d4ab6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16442,6 +16442,7 @@ F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/nct6694_canfd.c
+F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 684b9fe84fff..bc9d63d69204 100644
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
+	If you say yes to this option, support will be included for Nuvoton
+	NCT6694, a USB device to watchdog timer.
+
+	This driver can also be built as a module. If so, the module
+	will be called nct6694_wdt.
+
 config IMX2_WDT
 	tristate "IMX2+ Watchdog"
 	depends on ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index ab6f2b41e38e..453ceacd43ab 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -231,6 +231,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
 obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
 obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
 obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
+obj-$(CONFIG_NCT6694_WATCHDOG)	+= nct6694_wdt.o
 obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
 obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
 obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
new file mode 100644
index 000000000000..68e2926ec504
--- /dev/null
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 WDT driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/watchdog.h>
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mfd/core.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/nct6694.h>
+
+#define DRVNAME "nct6694-wdt"
+
+#define WATCHDOG_TIMEOUT	10
+#define WATCHDOG_PRETIMEOUT	0
+
+/* Host interface */
+#define REQUEST_WDT_MOD		0x07
+
+/* Message Channel*/
+/* Command 00h */
+#define REQUEST_WDT_CMD0_LEN	0x0F
+#define REQUEST_WDT_CMD0_OFFSET(idx)	(idx ? 0x0100 : 0x0000)	/* OFFSET = SEL|CMD */
+#define WDT_PRETIMEOUT_IDX	0x00
+#define WDT_PRETIMEOUT_LEN	0x04	/* PRETIMEOUT(3byte) | ACT(1byte) */
+#define WDT_TIMEOUT_IDX		0x04
+#define WDT_TIMEOUT_LEN		0x04	/* TIMEOUT(3byte) | ACT(1byte) */
+#define WDT_COUNTDOWN_IDX	0x0C
+#define WDT_COUNTDOWN_LEN	0x03
+
+#define WDT_PRETIMEOUT_ACT	BIT(1)
+#define WDT_TIMEOUT_ACT		BIT(1)
+
+/* Command 01h */
+#define REQUEST_WDT_CMD1_LEN		0x04
+#define REQUEST_WDT_CMD1_OFFSET(idx)	(idx ? 0x0101 : 0x0001)	/* OFFSET = SEL|CMD */
+#define WDT_CMD_IDX			0x00
+#define WDT_CMD_LEN			0x04
+
+static unsigned int timeout;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
+
+static unsigned int pretimeout;
+module_param(pretimeout, int, 0);
+MODULE_PARM_DESC(pretimeout, "Watchdog pre-timeout in seconds");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+			   __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+struct nct6694_wdt_data {
+	struct nct6694 *nct6694;
+	struct watchdog_device wdev;
+	unsigned int wdev_idx;
+};
+
+static inline void set_buf32(void *buf, u32 u32_val)
+{
+	u8 *p = (u8 *)buf;
+
+	p[0] = u32_val & 0xFF;
+	p[1] = (u32_val >> 8) & 0xFF;
+	p[2] = (u32_val >> 16) & 0xFF;
+	p[3] = (u32_val >> 24) & 0xFF;
+}
+
+static int nct6694_wdt_start(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+
+	pr_debug("%s: WDT(%d) Start\n", __func__, data->wdev_idx);
+
+	return 0;
+}
+
+static int nct6694_wdt_stop(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694 *nct6694 = data->nct6694;
+	unsigned char buf[REQUEST_WDT_CMD1_LEN] = {'W', 'D', 'T', 'C'};
+	int ret;
+
+	pr_debug("%s: WDT(%d) Close\n", __func__, data->wdev_idx);
+	ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
+				REQUEST_WDT_CMD1_OFFSET(data->wdev_idx),
+				REQUEST_WDT_CMD1_LEN, buf);
+	if (ret)
+		pr_err("%s: Failed to start WDT device!\n", __func__);
+
+	return ret;
+}
+
+static int nct6694_wdt_ping(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694 *nct6694 = data->nct6694;
+	unsigned char buf[REQUEST_WDT_CMD1_LEN] = {'W', 'D', 'T', 'S'};
+	int ret;
+
+	pr_debug("%s: WDT(%d) Ping\n", __func__, data->wdev_idx);
+	ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
+				REQUEST_WDT_CMD1_OFFSET(data->wdev_idx),
+				REQUEST_WDT_CMD1_LEN, buf);
+	if (ret)
+		pr_err("%s: Failed to ping WDT device!\n", __func__);
+
+	return ret;
+}
+
+static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
+				   unsigned int timeout)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694 *nct6694 = data->nct6694;
+	unsigned int timeout_fmt, pretimeout_fmt;
+	unsigned char buf[REQUEST_WDT_CMD0_LEN];
+	int ret;
+
+	if (timeout < wdev->pretimeout) {
+		pr_err("%s: 'timeout' must be greater than 'pre timeout'!\n",
+		       __func__);
+		return -EINVAL;
+	}
+
+	timeout_fmt = timeout * 1000 | (WDT_TIMEOUT_ACT << 24);
+	pretimeout_fmt = wdev->pretimeout * 1000 | (WDT_PRETIMEOUT_ACT << 24);
+	set_buf32(&buf[WDT_TIMEOUT_IDX], le32_to_cpu(timeout_fmt));
+	set_buf32(&buf[WDT_PRETIMEOUT_IDX], le32_to_cpu(pretimeout_fmt));
+
+	ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
+				REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
+				REQUEST_WDT_CMD0_LEN, buf);
+	if (ret) {
+		pr_err("%s: Don't write the setup command in Start stage!\n",
+		       __func__);
+		return ret;
+	}
+
+	wdev->timeout = timeout;
+
+	return 0;
+}
+
+static int nct6694_wdt_set_pretimeout(struct watchdog_device *wdev,
+				      unsigned int pretimeout)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694 *nct6694 = data->nct6694;
+	unsigned int timeout_fmt, pretimeout_fmt;
+	unsigned char buf[REQUEST_WDT_CMD0_LEN];
+	int ret;
+
+	if (pretimeout > wdev->timeout) {
+		pr_err("%s: 'pre timeout' must be less than 'timeout'!\n",
+		       __func__);
+		return -EINVAL;
+	}
+	timeout_fmt = wdev->timeout * 1000 | (WDT_TIMEOUT_ACT << 24);
+	pretimeout_fmt = pretimeout * 1000 | (WDT_PRETIMEOUT_ACT << 24);
+	set_buf32(&buf[WDT_TIMEOUT_IDX], le32_to_cpu(timeout_fmt));
+	set_buf32(&buf[WDT_PRETIMEOUT_IDX], le32_to_cpu(pretimeout_fmt));
+
+	ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
+				REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
+				REQUEST_WDT_CMD0_LEN, buf);
+	if (ret) {
+		pr_err("%s: Don't write the setup command in Start stage!\n", __func__);
+		return ret;
+	}
+
+	wdev->pretimeout = pretimeout;
+	return 0;
+}
+
+static unsigned int nct6694_wdt_get_time(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694 *nct6694 = data->nct6694;
+	unsigned char buf[WDT_COUNTDOWN_LEN];
+	unsigned int timeleft_ms;
+	int ret;
+
+	ret = nct6694_read_msg(nct6694, REQUEST_WDT_MOD,
+			       REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
+			       REQUEST_WDT_CMD0_LEN, WDT_COUNTDOWN_IDX,
+			       WDT_COUNTDOWN_LEN, buf);
+	if (ret)
+		pr_err("%s: Failed to get WDT device!\n", __func__);
+
+	timeleft_ms = ((buf[2] << 16) | (buf[1] << 8) | buf[0]) & 0xFFFFFF;
+
+	return timeleft_ms / 1000;
+}
+
+static int nct6694_wdt_setup(struct watchdog_device *wdev)
+{
+	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
+	struct nct6694 *nct6694 = data->nct6694;
+	unsigned char buf[REQUEST_WDT_CMD0_LEN] = {0};
+	unsigned int timeout_fmt, pretimeout_fmt;
+	int ret;
+
+	if (timeout)
+		wdev->timeout = timeout;
+
+	if (pretimeout) {
+		wdev->pretimeout = pretimeout;
+		pretimeout_fmt = wdev->pretimeout * 1000 | (WDT_PRETIMEOUT_ACT << 24);
+	} else {
+		pretimeout_fmt = 0;
+	}
+
+	timeout_fmt = wdev->timeout * 1000 | (WDT_TIMEOUT_ACT << 24);
+	set_buf32(&buf[WDT_TIMEOUT_IDX], le32_to_cpu(timeout_fmt));
+	set_buf32(&buf[WDT_PRETIMEOUT_IDX], le32_to_cpu(pretimeout_fmt));
+
+	ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
+				REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
+				REQUEST_WDT_CMD0_LEN, buf);
+	if (ret)
+		return ret;
+
+	pr_info("Setting WDT(%d): timeout = %d, pretimeout = %d\n",
+		data->wdev_idx, wdev->timeout, wdev->pretimeout);
+
+	return 0;
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
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	struct nct6694_wdt_data *data;
+	struct watchdog_device *wdev;
+	int ret;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->nct6694 = nct6694;
+	data->wdev_idx = cell->id;
+
+	wdev = &data->wdev;
+	wdev->info = &nct6694_wdt_info;
+	wdev->ops = &nct6694_wdt_ops;
+	wdev->timeout = WATCHDOG_TIMEOUT;
+	wdev->pretimeout = WATCHDOG_PRETIMEOUT;
+	wdev->min_timeout = 1;
+	wdev->max_timeout = 255;
+
+	platform_set_drvdata(pdev, data);
+
+	/* Register watchdog timer device to WDT framework */
+	watchdog_set_drvdata(&data->wdev, data);
+	watchdog_init_timeout(&data->wdev, timeout, &pdev->dev);
+	watchdog_set_nowayout(&data->wdev, nowayout);
+	watchdog_stop_on_reboot(&data->wdev);
+
+	ret = devm_watchdog_register_device(&pdev->dev, &data->wdev);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: Failed to register watchdog device: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = nct6694_wdt_setup(&data->wdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to setup WDT device!\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver nct6694_wdt_driver = {
+	.driver = {
+		.name	= DRVNAME,
+	},
+	.probe		= nct6694_wdt_probe,
+};
+
+static int __init nct6694_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&nct6694_wdt_driver);
+	if (!err) {
+		if (err)
+			platform_driver_unregister(&nct6694_wdt_driver);
+	}
+
+	return err;
+}
+subsys_initcall(nct6694_init);
+
+static void __exit nct6694_exit(void)
+{
+	platform_driver_unregister(&nct6694_wdt_driver);
+}
+module_exit(nct6694_exit);
+
+MODULE_DESCRIPTION("USB-WDT driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


