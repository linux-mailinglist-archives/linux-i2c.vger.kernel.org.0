Return-Path: <linux-i2c+bounces-8109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B55389D47E8
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 07:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FBDDB23DB2
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 06:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7CB1D1E65;
	Thu, 21 Nov 2024 06:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2EyV406"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C411C9DDF;
	Thu, 21 Nov 2024 06:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171291; cv=none; b=jxb241lKjnHfk3jhbyEQZT9hMbqoK0W5YGS/HI2BI315ccMEtKW4c1iqUhQajZ4L6zLoaTB38UN2ZdQNi+Z9+yLNcIElkl18F1C9NgKd1kNXb0Ajm3hHKUmYM+LFPSnNKITnl+oaYn7NYaOKyN1AVmOZEENNaHYvj/jVqtJM9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171291; c=relaxed/simple;
	bh=VM3tcKTrNIKtcWEiY3g5a2hzNV1pFWStN+suLtgL4zk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gfbbdo2CgpGJ5hWx1PuwT3nb6Gd2hLKHI7gd/6+H3zUpKewUU5FDdevEFOYEzBge1H3Ten+0xKFkjmZioOo6KvtRXWNrVjn57Mc6rvxtJOuuCz3g38fHNm0ywwKTFrrM7S5YRNqXVrfsZ1xf3q2HG4F3hVVbeUIF8zLerdMovv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2EyV406; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ea7e250c54so503810a12.0;
        Wed, 20 Nov 2024 22:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732171289; x=1732776089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFrCg7m8aamOuaiYkktMUCP7hs/Ab5XF+r6SW6zPgUM=;
        b=O2EyV406jEwEvwF7Usb9d9/obwzVK78ilyxlOFweCzku6k/ej/5vYa3iYecsg/Fp/l
         o2wMOhBJRGV5GA+6Q2TqIIQrmdTl6Mf6llDofB95B705d7UUFeBocVrYFpv0+fYH/XWy
         RydZSdQh/6ASAZTAbdtubP8w5pAsdJrmUJwHyqKisFQrbzaHODQB6cLgkjKHR5/8Y6VS
         l6AQjp7yI/x3IHLr3Pz3Ea98fqvT1Mt/pZLkes7VDXxBAzYvQ0YzUnjxrPwQKjvme8D4
         EEbXcuKjPGGzBy++8J9Jb7yimqskmesPzhfOXsXZwquuby9X0k6mn9O9cb8chmA5Dsrj
         mR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732171289; x=1732776089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFrCg7m8aamOuaiYkktMUCP7hs/Ab5XF+r6SW6zPgUM=;
        b=tMHMCQwIe34NrDCR1KxoFJbBMSlF/+Ta+SH4NHy6pp2/3C8LIGs3Fcuzxrs5O7g/gl
         2/WGdoTQXg0AX5MxhQO1NqgeqIwUtooOkSbkiRTLUEvozGVzpkNsXGx1bwqm+eQl9k6k
         bNfG5tW+5zZAD49G/5KhhmdQvaS2orYciAEsF9QzITtJbT4FajBLWUu+7964p9KRY31U
         xSu9yrTPIjKiDPPCg3BBGDSrxwlrY7LCiHvvM+eiNh1g9opNcgECSV8C0bH9wQnptkBK
         t+qW7rX0PXpnSYJL3sVkcR0OUW+fb1LJwNiu2imVn9+f96PTpflnsXU/xaX2tnv4EEGJ
         bQuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmNwaMxgg82qxwQU0VZKq1OuvMnGvRwYz9M2ogQGWxFKmG5Ir5bUyQ+CFL6DJqwhtjO1694J71@vger.kernel.org, AJvYcCUqYeLJOzJNXeUQckqP0+1F+puRytpIMIVhZnBSNw5uouZ50i2zK3eLcumUcq01Yf+6AWwwve0GgjS0FsaZVso=@vger.kernel.org, AJvYcCVWTNWca7G0VBjMaWg21gTat7Jl/T/w/+59b0PYNz/HHgntLWomoQJCBKXradp5EcDC2LSyVLKWCK4kfXw=@vger.kernel.org, AJvYcCWEkUHSsu1tHoMul7Ef6BEWuD15WhZnaFrp6tkAwwQYCPNrRcDa7mqqEjPFaJBFo0YAUyF51BOe+9Y0kw==@vger.kernel.org, AJvYcCWg2hM/KjVEsdI0A9/WiLv0UJ6P8MdcgUUpfgIszGa45/uxc8OKPvDaCb0SM/MbsyNR7GXA+Rri0gxe@vger.kernel.org, AJvYcCWvKKQ3Zs84ZnvREMM4QleAHuLGOy9dzkH85prYewbVxfyLBuLWIU41UZipIxpHOagV4LBAxJQ+Xf0=@vger.kernel.org, AJvYcCX0Azd29oc/D5DAEg9L/XVSHkYK2zE5OgUzQ5voPC4iT1+BUP4OlTT/rGtD6NY6d1vVh/REbpIvm5Hi@vger.kernel.org
X-Gm-Message-State: AOJu0YxzsBRI0c4/LtzwK8JcUDu2KNE0uSx1GyiSlJFcFfMYCddjTvmr
	taoN/HVHhUWtOzSQnt4JI64+NkPXiOv01bLTMHJhKobkzuYJzQ9t
X-Google-Smtp-Source: AGHT+IHiQw2caxTW3sY1YGKi/DVCIIlxVF7EDTea2/gtWdN97dJp29cPAa2mIse1tA0QInWOyJMgbA==
X-Received: by 2002:a05:6a20:841c:b0:1db:c20f:2c4d with SMTP id adf61e73a8af0-1ddae2f0277mr8333238637.2.1732171288857;
        Wed, 20 Nov 2024 22:41:28 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beeb83d4sm2812530b3a.40.2024.11.20.22.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:41:28 -0800 (PST)
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
Subject: [PATCH v2 7/7] rtc: Add Nuvoton NCT6694 RTC support
Date: Thu, 21 Nov 2024 14:40:46 +0800
Message-Id: <20241121064046.3724726-8-tmyu0@nuvoton.com>
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

This driver supports RTC functionality for NCT6694 MFD device
based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS               |   1 +
 drivers/rtc/Kconfig       |  10 ++
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-nct6694.c | 263 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 275 insertions(+)
 create mode 100644 drivers/rtc/rtc-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d6414eea0463..6d1cfec28076 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16550,6 +16550,7 @@ F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/nct6694_canfd.c
+F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 66eb1122248b..36829d096194 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -406,6 +406,16 @@ config RTC_DRV_NCT3018Y
 	   This driver can also be built as a module, if so, the module will be
 	   called "rtc-nct3018y".
 
+config RTC_DRV_NCT6694
+	tristate "Nuvoton NCT6694 RTC support"
+	depends on MFD_NCT6694
+	help
+	  If you say yes to this option, support will be included for Nuvoton
+	  NCT6694, a USB device to RTC.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called rtc-nct6694.
+
 config RTC_DRV_RK808
 	tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
 	depends on MFD_RK8XX
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index f62340ecc534..64443d26bb5b 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -116,6 +116,7 @@ obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
 obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
 obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
 obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
+obj-$(CONFIG_RTC_DRV_NCT6694)	+= rtc-nct6694.o
 obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
 obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
 obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
diff --git a/drivers/rtc/rtc-nct6694.c b/drivers/rtc/rtc-nct6694.c
new file mode 100644
index 000000000000..097555a16b4f
--- /dev/null
+++ b/drivers/rtc/rtc-nct6694.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 RTC driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/bcd.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+
+/* Host interface */
+#define NCT6694_RTC_MOD		0x08
+
+/* Message Channel */
+/* Command 00h */
+#define NCT6694_RTC_CMD0_LEN	0x07
+#define NCT6694_RTC_CMD0_OFFSET	0x0000	/* OFFSET = SEL|CMD */
+/* Command 01h */
+#define NCT6694_RTC_CMD1_LEN	0x05
+#define NCT6694_RTC_CMD1_OFFSET	0x0001	/* OFFSET = SEL|CMD */
+/* Command 02h */
+#define NCT6694_RTC_CMD2_LEN	0x02
+#define NCT6694_RTC_CMD2_OFFSET	0x0002	/* OFFSET = SEL|CMD */
+
+#define NCT6694_RTC_IRQ_INT_EN		BIT(0)	/* Transmit a USB INT-in when RTC alarm */
+#define NCT6694_RTC_IRQ_GPO_EN		BIT(5)	/* Trigger a GPO Low Pulse when RTC alarm */
+
+#define NCT6694_RTC_IRQ_EN		(NCT6694_RTC_IRQ_INT_EN | NCT6694_RTC_IRQ_GPO_EN)
+#define NCT6694_RTC_IRQ_STS		BIT(0)	/* Write 1 clear IRQ status */
+
+struct __packed nct6694_rtc_cmd0 {
+	u8 sec;
+	u8 min;
+	u8 hour;
+	u8 week;
+	u8 day;
+	u8 month;
+	u8 year;
+};
+
+struct __packed nct6694_rtc_cmd1 {
+	u8 sec;
+	u8 min;
+	u8 hour;
+	u8 alarm_en;
+	u8 alarm_pend;
+};
+
+struct __packed nct6694_rtc_cmd2 {
+	u8 irq_en;
+	u8 irq_pend;
+};
+
+struct nct6694_rtc_data {
+	struct nct6694 *nct6694;
+	struct rtc_device *rtc;
+	struct mutex lock;
+	unsigned char *xmit_buf;
+};
+
+static int nct6694_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_cmd0 *buf = (struct nct6694_rtc_cmd0 *)data->xmit_buf;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_RTC_MOD,
+			       NCT6694_RTC_CMD0_OFFSET,
+			       NCT6694_RTC_CMD0_LEN,
+			       buf);
+	if (ret)
+		return ret;
+
+	tm->tm_sec = bcd2bin(buf->sec);		/* tm_sec expect 0 ~ 59 */
+	tm->tm_min = bcd2bin(buf->min);		/* tm_min expect 0 ~ 59 */
+	tm->tm_hour = bcd2bin(buf->hour);	/* tm_hour expect 0 ~ 23 */
+	tm->tm_wday = bcd2bin(buf->week) - 1;	/* tm_wday expect 0 ~ 6 */
+	tm->tm_mday = bcd2bin(buf->day);	/* tm_mday expect 1 ~ 31 */
+	tm->tm_mon = bcd2bin(buf->month) - 1;	/* tm_month expect 0 ~ 11 */
+	tm->tm_year = bcd2bin(buf->year) + 100;	/* tm_year expect since 1900 */
+
+	return ret;
+}
+
+static int nct6694_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_cmd0 *buf = (struct nct6694_rtc_cmd0 *)data->xmit_buf;
+
+	guard(mutex)(&data->lock);
+
+	buf->sec = bin2bcd(tm->tm_sec);
+	buf->min = bin2bcd(tm->tm_min);
+	buf->hour = bin2bcd(tm->tm_hour);
+	buf->week = bin2bcd(tm->tm_wday + 1);
+	buf->day = bin2bcd(tm->tm_mday);
+	buf->month = bin2bcd(tm->tm_mon + 1);
+	buf->year = bin2bcd(tm->tm_year - 100);
+
+	return nct6694_write_msg(data->nct6694, NCT6694_RTC_MOD,
+				 NCT6694_RTC_CMD0_OFFSET,
+				 NCT6694_RTC_CMD0_LEN,
+				 buf);
+}
+
+static int nct6694_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_cmd1 *buf = (struct nct6694_rtc_cmd1 *)data->xmit_buf;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_RTC_MOD,
+			       NCT6694_RTC_CMD1_OFFSET,
+			       NCT6694_RTC_CMD1_LEN,
+			       buf);
+	if (ret)
+		return ret;
+
+	alrm->time.tm_sec = bcd2bin(buf->sec);
+	alrm->time.tm_min = bcd2bin(buf->min);
+	alrm->time.tm_hour = bcd2bin(buf->hour);
+	alrm->enabled = buf->alarm_en;
+	alrm->pending = buf->alarm_pend;
+
+	return ret;
+}
+
+static int nct6694_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_cmd1 *buf = (struct nct6694_rtc_cmd1 *)data->xmit_buf;
+
+	guard(mutex)(&data->lock);
+
+	buf->sec = bin2bcd(alrm->time.tm_sec);
+	buf->min = bin2bcd(alrm->time.tm_min);
+	buf->hour = bin2bcd(alrm->time.tm_hour);
+	buf->alarm_en = alrm->enabled ? NCT6694_RTC_IRQ_EN : 0;
+	buf->alarm_pend = 0;
+
+	return nct6694_write_msg(data->nct6694, NCT6694_RTC_MOD,
+				 NCT6694_RTC_CMD1_OFFSET,
+				 NCT6694_RTC_CMD1_LEN,
+				 buf);
+}
+
+static int nct6694_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_cmd2 *buf = (struct nct6694_rtc_cmd2 *)data->xmit_buf;
+
+	guard(mutex)(&data->lock);
+
+	if (enabled)
+		buf->irq_en |= NCT6694_RTC_IRQ_EN;
+	else
+		buf->irq_en &= ~NCT6694_RTC_IRQ_EN;
+
+	buf->irq_pend = 0;
+
+	return nct6694_write_msg(data->nct6694, NCT6694_RTC_MOD,
+				 NCT6694_RTC_CMD2_OFFSET,
+				 NCT6694_RTC_CMD2_LEN,
+				 buf);
+}
+
+static const struct rtc_class_ops nct6694_rtc_ops = {
+	.read_time = nct6694_rtc_read_time,
+	.set_time = nct6694_rtc_set_time,
+	.read_alarm = nct6694_rtc_read_alarm,
+	.set_alarm = nct6694_rtc_set_alarm,
+	.alarm_irq_enable = nct6694_rtc_alarm_irq_enable,
+};
+
+static irqreturn_t nct6694_irq(int irq, void *dev_id)
+{
+	struct nct6694_rtc_data *data = dev_id;
+	struct nct6694_rtc_cmd2 *buf = (struct nct6694_rtc_cmd2 *)data->xmit_buf;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	buf->irq_en = NCT6694_RTC_IRQ_EN;
+	buf->irq_pend = NCT6694_RTC_IRQ_STS;
+	ret = nct6694_write_msg(data->nct6694, NCT6694_RTC_MOD,
+				NCT6694_RTC_CMD2_OFFSET,
+				NCT6694_RTC_CMD2_LEN,
+				buf);
+	if (ret)
+		return IRQ_NONE;
+
+	rtc_update_irq(data->rtc, 1, RTC_IRQF | RTC_AF);
+
+	return IRQ_HANDLED;
+}
+
+static int nct6694_rtc_probe(struct platform_device *pdev)
+{
+	struct nct6694_rtc_data *data;
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	int ret, irq;
+
+	irq = irq_create_mapping(nct6694->domain, NCT6694_IRQ_RTC);
+	if (!irq)
+		return -EINVAL;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->xmit_buf = devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
+				      sizeof(unsigned char), GFP_KERNEL);
+	if (!data->xmit_buf)
+		return -ENOMEM;
+
+	data->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(data->rtc))
+		return PTR_ERR(data->rtc);
+
+	data->nct6694 = nct6694;
+	data->rtc->ops = &nct6694_rtc_ops;
+	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	mutex_init(&data->lock);
+
+	device_set_wakeup_capable(&pdev->dev, 1);
+
+	platform_set_drvdata(pdev, data);
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					nct6694_irq, IRQF_ONESHOT,
+					"nct6694-rtc", data);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request irq\n");
+
+	/* Register rtc device to RTC framework */
+	return devm_rtc_register_device(data->rtc);
+}
+
+static struct platform_driver nct6694_rtc_driver = {
+	.driver = {
+		.name	= "nct6694-rtc",
+	},
+	.probe		= nct6694_rtc_probe,
+};
+
+module_platform_driver(nct6694_rtc_driver);
+
+MODULE_DESCRIPTION("USB-RTC driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


