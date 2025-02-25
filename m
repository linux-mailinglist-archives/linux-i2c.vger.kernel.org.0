Return-Path: <linux-i2c+bounces-9560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 662CAA43770
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 09:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3648F19C1197
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 08:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9346B266B59;
	Tue, 25 Feb 2025 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZulISXl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0C6266573;
	Tue, 25 Feb 2025 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740471456; cv=none; b=THA6MK/VtH3jntGiEoakocb/2T1v/9gO+578RUGjPy0JEJYPkkHGRbkP6XC3HZUf/b/KLs2dW/pzl6mLNz1XuxH8V79qG0mEeEMgQ7lcVKD5IGv4QO1hOiIUUX4om3e+jRxgbMxgrgK8lRB7AAG1yxsJ6CpR3uUAEJ8Lb9C8jW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740471456; c=relaxed/simple;
	bh=VyO1gY+quioa1x+mn9rphtVK2rIpVpnOMY66Pbkon2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q4dpaYNhgelTxuC4y6DVfEIotPEAHznB8A6I5J9OcKBIdCOgY2GZfesT4nsGFXRB11v2pT80zoauuC55M44cKvgUzuC6KHZkXhyrnc3O8THkARD/XQkz/DTI5359FArWUfSYQXg4TwYOttFtr6xg5T1EO2DzSQ8elrDMJah+PxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZulISXl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220bfdfb3f4so5173065ad.2;
        Tue, 25 Feb 2025 00:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740471454; x=1741076254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1/MlL808W3xu35xb2GKiIvjOGN0x2mk1uW+PFc6mZk=;
        b=CZulISXlk9qLWI/IS6cgKeiJFoyH2JjY/jmWcitmWyQ5VaVdgJO5ndb4+IgDJdIH++
         9aHzx4fge/HbBRgOyp4IIR438GRvH5qGhftixoVZzFNeoJ0ZwBIJDUr/mgMedAvhkYl4
         2htu2iIbOlW1rHowdpHDhAqj0n5hi+v6okxeMWA3VxOs8+5A6Xko3/XNH0lmGSKOeWK6
         wmhEHMKJRi5RL2gj5EyII8eKL559uCETnmtAjQf2NwAGqSpLJtO8dxB5iFld9DX2rVEk
         8ZQqN/5y74UBqw5E+QHkuUyNZpXrKKXjwTH+GZ8qvYBw74ycPMx24EKxPMoAybV+39zB
         W17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740471454; x=1741076254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1/MlL808W3xu35xb2GKiIvjOGN0x2mk1uW+PFc6mZk=;
        b=CbSHhoE9UtZKEYR7f3UPqRGAPTT6bHnD4r2t0V3EIQGMmc1Ab//h/JY/P5iqImLQqk
         3r+jHnBGyrl1RdLaPUF3GxRCyoQNaTxf47UsQZl2XAGz2i2utg9i9uWj+8P388bIC2Si
         aozsDURIk/BNaKBy+8OeWrqI/jM5MlzpscBJ+C+M78VF4Vxr2IHWq3fNPQA3PIQyu1LR
         9MWtqPQuxBmyODFTvCc0jaPy5NW6tENgxIy03Yxqhz1PGXLEbysdt7ifd6NMkLjTbf4Y
         no8Jw3my2grvjwG20DGC5DGIF2bSFpBDsfG77wAXWrza8sL1ZLIQMnfXO7TKx+Nte3yU
         TN4g==
X-Forwarded-Encrypted: i=1; AJvYcCUHNL/LCJrLys9Tyjpv4Blq6TFr1VRFN+vy3nFVkbEmG/Ko1VcCnj9xqpvsu+WgetW34uoXqzRyhp47Jw==@vger.kernel.org, AJvYcCUJP6F+KpprkM5Mp30xho4SoSZ7l7aSoIF7e5ODIZl539OuXC4Zpo4Oo4aToAM4hf+nd/SPM1MMnb0=@vger.kernel.org, AJvYcCULkiIVfsXQj64MXi6XU/MXJnal+PWYOf9NHQopgDwpFdvb+Dm+n8kUZGtLzdPvwqaconPCvWXdJamw@vger.kernel.org, AJvYcCVBhh+h7QJ0lNrLrypJQB6Yrn1ix8HjrByjmxtRa5sCQMHzuRTVWKMiH9PhfRd/MhAhRc/Bn8iFxfih@vger.kernel.org, AJvYcCWFpywrrhSi/WCcGwSanNM9PwomGMD/OnGg1i/d63bZ1euIPtmFCICdLaQSaBeorMO442a/UvIj6AEp@vger.kernel.org, AJvYcCWJojWUrJSQ1FHn4THjEb/Ts4FMXb9T8YWlcxGTI2VK+Cv4y7SmtbxqiSAjKqoDzznNq5lTmw3lbKQvzp7QdCE=@vger.kernel.org, AJvYcCWd6mKjdrKDGDVrglYeEF2ZzY3vFgEheETfA8e6IxFXEDx7XaMw0stGC4iDpVwGpdTOK0rPC9IItX+giNU=@vger.kernel.org, AJvYcCWkS6f8Tqqjw4TRPtyL7JtdtVClR6u2vcWObjOsuXiRM7NibXCbRqRJgL1/y7DVwxtDlVlyXAYP@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEEibpkqTmV9H7ygEZRSv8R134jWg1/Ebb3yw4fpDwyBnAyJg
	1hfn23ST6wLHqlXmQ2sq2K7K/HaKjb6vD6oBsONfMQ+jSNdi8Dht
X-Gm-Gg: ASbGnctdU3FLaRax3ZpycW3WTa05udr94lt0a6UtL5i4qG7Nx4lrA9OGUZHAFxDxzbK
	V/OiWbiaXExuHy60R9oMn0MHJ+3ZrWszhFGAKan7LEJ9+iq8w/b97Ox0F2pVMeFU3T/MUTnZSfE
	wZ4w2fkKlJ7SHafsvxy/yVbur3X9SgmefDX6c+fzWQXgA5viNYRGdNLJ44m/w5IKzQ3pHEq7M8H
	CppRC7sVb073TRFNhusWb0+6bMyNFF/rH/sx6GUdNTssns1QbWUw5roMsaH5UCdbH/MNkkrMpFK
	Cr450sjOlffKoya7dczAoETYk54kHwspSpsDrU2bNBK3VtklV3c4OGjj7nMep9xv4vBb4w==
X-Google-Smtp-Source: AGHT+IH/gdqYrLFyBEtR8VWeKFEBaSCVXjtQW0HPLKg4ppwIhgMGGP47oVP66uI6RA/b/qX2/N13dA==
X-Received: by 2002:a05:6a00:b84:b0:732:2170:b696 with SMTP id d2e1a72fcca58-73426daad91mr26552886b3a.22.1740471453637;
        Tue, 25 Feb 2025 00:17:33 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6abaddsm902178b3a.20.2025.02.25.00.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 00:17:33 -0800 (PST)
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
Subject: [PATCH v8 7/7] rtc: Add Nuvoton NCT6694 RTC support
Date: Tue, 25 Feb 2025 16:16:44 +0800
Message-Id: <20250225081644.3524915-8-a0282524688@gmail.com>
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

This driver supports RTC functionality for NCT6694 MFD device
based on USB interface.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 MAINTAINERS               |   1 +
 drivers/rtc/Kconfig       |  10 ++
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-nct6694.c | 286 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 298 insertions(+)
 create mode 100644 drivers/rtc/rtc-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a9eda4530b07..7eba4ffdc877 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16927,6 +16927,7 @@ F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/usb/nct6694_canfd.c
+F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0bbbf778ecfa..248425bf26f3 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -416,6 +416,16 @@ config RTC_DRV_NCT3018Y
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
index 489b4ab07068..d0d6f4a4972e 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -118,6 +118,7 @@ obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
 obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
 obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
 obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
+obj-$(CONFIG_RTC_DRV_NCT6694)	+= rtc-nct6694.o
 obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
 obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
 obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
diff --git a/drivers/rtc/rtc-nct6694.c b/drivers/rtc/rtc-nct6694.c
new file mode 100644
index 000000000000..892674d453d1
--- /dev/null
+++ b/drivers/rtc/rtc-nct6694.c
@@ -0,0 +1,286 @@
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
+/*
+ * USB command module type for NCT6694 RTC controller.
+ * This defines the module type used for communication with the NCT6694
+ * RTC controller over the USB interface.
+ */
+#define NCT6694_RTC_MOD		0x08
+
+/* Command 00h - RTC Time */
+#define NCT6694_RTC_TIME	0x0000
+#define NCT6694_RTC_TIME_SEL	0x00
+
+/* Command 01h - RTC Alarm */
+#define NCT6694_RTC_ALARM	0x01
+#define NCT6694_RTC_ALARM_SEL	0x00
+
+/* Command 02h - RTC Status */
+#define NCT6694_RTC_STATUS	0x02
+#define NCT6694_RTC_STATUS_SEL	0x00
+
+#define NCT6694_RTC_IRQ_INT_EN	BIT(0)	/* Transmit a USB INT-in when RTC alarm */
+#define NCT6694_RTC_IRQ_GPO_EN	BIT(5)	/* Trigger a GPO Low Pulse when RTC alarm */
+
+#define NCT6694_RTC_IRQ_EN	(NCT6694_RTC_IRQ_INT_EN | NCT6694_RTC_IRQ_GPO_EN)
+#define NCT6694_RTC_IRQ_STS	BIT(0)	/* Write 1 clear IRQ status */
+
+struct __packed nct6694_rtc_time {
+	u8 sec;
+	u8 min;
+	u8 hour;
+	u8 week;
+	u8 day;
+	u8 month;
+	u8 year;
+};
+
+struct __packed nct6694_rtc_alarm {
+	u8 sec;
+	u8 min;
+	u8 hour;
+	u8 alarm_en;
+	u8 alarm_pend;
+};
+
+struct __packed nct6694_rtc_status {
+	u8 irq_en;
+	u8 irq_pend;
+};
+
+union __packed nct6694_rtc_msg {
+	struct nct6694_rtc_time time;
+	struct nct6694_rtc_alarm alarm;
+	struct nct6694_rtc_status sts;
+};
+
+struct nct6694_rtc_data {
+	struct nct6694 *nct6694;
+	struct rtc_device *rtc;
+	union nct6694_rtc_msg *msg;
+};
+
+static int nct6694_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_time *time = &data->msg->time;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_TIME,
+		.sel = NCT6694_RTC_TIME_SEL,
+		.len = cpu_to_le16(sizeof(*time))
+	};
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, time);
+	if (ret)
+		return ret;
+
+	tm->tm_sec = bcd2bin(time->sec);		/* tm_sec expect 0 ~ 59 */
+	tm->tm_min = bcd2bin(time->min);		/* tm_min expect 0 ~ 59 */
+	tm->tm_hour = bcd2bin(time->hour);		/* tm_hour expect 0 ~ 23 */
+	tm->tm_wday = bcd2bin(time->week) - 1;		/* tm_wday expect 0 ~ 6 */
+	tm->tm_mday = bcd2bin(time->day);		/* tm_mday expect 1 ~ 31 */
+	tm->tm_mon = bcd2bin(time->month) - 1;		/* tm_month expect 0 ~ 11 */
+	tm->tm_year = bcd2bin(time->year) + 100;	/* tm_year expect since 1900 */
+
+	return ret;
+}
+
+static int nct6694_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_time *time = &data->msg->time;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_TIME,
+		.sel = NCT6694_RTC_TIME_SEL,
+		.len = cpu_to_le16(sizeof(*time))
+	};
+
+	time->sec = bin2bcd(tm->tm_sec);
+	time->min = bin2bcd(tm->tm_min);
+	time->hour = bin2bcd(tm->tm_hour);
+	time->week = bin2bcd(tm->tm_wday + 1);
+	time->day = bin2bcd(tm->tm_mday);
+	time->month = bin2bcd(tm->tm_mon + 1);
+	time->year = bin2bcd(tm->tm_year - 100);
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, time);
+}
+
+static int nct6694_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_alarm *alarm = &data->msg->alarm;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_ALARM,
+		.sel = NCT6694_RTC_ALARM_SEL,
+		.len = cpu_to_le16(sizeof(*alarm))
+	};
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, alarm);
+	if (ret)
+		return ret;
+
+	alrm->time.tm_sec = bcd2bin(alarm->sec);
+	alrm->time.tm_min = bcd2bin(alarm->min);
+	alrm->time.tm_hour = bcd2bin(alarm->hour);
+	alrm->enabled = alarm->alarm_en;
+	alrm->pending = alarm->alarm_pend;
+
+	return ret;
+}
+
+static int nct6694_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_alarm *alarm = &data->msg->alarm;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_ALARM,
+		.sel = NCT6694_RTC_ALARM_SEL,
+		.len = cpu_to_le16(sizeof(*alarm))
+	};
+
+	alarm->sec = bin2bcd(alrm->time.tm_sec);
+	alarm->min = bin2bcd(alrm->time.tm_min);
+	alarm->hour = bin2bcd(alrm->time.tm_hour);
+	alarm->alarm_en = alrm->enabled ? NCT6694_RTC_IRQ_EN : 0;
+	alarm->alarm_pend = 0;
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, alarm);
+}
+
+static int nct6694_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_status *sts = &data->msg->sts;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_STATUS,
+		.sel = NCT6694_RTC_STATUS_SEL,
+		.len = cpu_to_le16(sizeof(*sts))
+	};
+
+	if (enabled)
+		sts->irq_en |= NCT6694_RTC_IRQ_EN;
+	else
+		sts->irq_en &= ~NCT6694_RTC_IRQ_EN;
+
+	sts->irq_pend = 0;
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, sts);
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
+	struct nct6694_rtc_status *sts = &data->msg->sts;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_STATUS,
+		.sel = NCT6694_RTC_STATUS_SEL,
+		.len = cpu_to_le16(sizeof(*sts))
+	};
+	int ret;
+
+	rtc_lock(data->rtc);
+
+	sts->irq_en = NCT6694_RTC_IRQ_EN;
+	sts->irq_pend = NCT6694_RTC_IRQ_STS;
+	ret = nct6694_write_msg(data->nct6694, &cmd_hd, sts);
+	if (ret) {
+		rtc_unlock(data->rtc);
+		return IRQ_NONE;
+	}
+
+	rtc_update_irq(data->rtc, 1, RTC_IRQF | RTC_AF);
+
+	rtc_unlock(data->rtc);
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
+	data->msg = devm_kzalloc(&pdev->dev, sizeof(union nct6694_rtc_msg),
+				 GFP_KERNEL);
+	if (!data->msg)
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
+	platform_set_drvdata(pdev, data);
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					nct6694_irq, IRQF_ONESHOT,
+					"rtc-nct6694", data);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request irq\n");
+
+	ret = devm_rtc_register_device(data->rtc);
+	if (ret)
+		return ret;
+
+	device_init_wakeup(&pdev->dev, true);
+	return 0;
+}
+
+static struct platform_driver nct6694_rtc_driver = {
+	.driver = {
+		.name	= "rtc-nct6694",
+	},
+	.probe		= nct6694_rtc_probe,
+};
+
+module_platform_driver(nct6694_rtc_driver);
+
+MODULE_DESCRIPTION("USB-RTC driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:nct6694-rtc");
-- 
2.34.1


