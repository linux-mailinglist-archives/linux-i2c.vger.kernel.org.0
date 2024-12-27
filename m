Return-Path: <linux-i2c+bounces-8749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 430BF9FD2E2
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E2A43A076A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 10:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3D015855E;
	Fri, 27 Dec 2024 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awHXfniy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F67158555;
	Fri, 27 Dec 2024 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735293497; cv=none; b=MTSPAeULLP+zOrX08wOGqU0WQuhx/tVNpoCHGlctELxz/AchQll9MqvHqoIxQFdCqqqYyYdiQNhIwK6EpjzARjeu/oug1e+s3g9ZqJy8JQiqqhHuyA3xOvjxaGRNfgUPyom/HKUV/qOCe6SxJwY88K9NI+XwQIwvX2cyTtiNgg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735293497; c=relaxed/simple;
	bh=GvT4BWDw5+8Gee0TOROTKU9jyBZIvEwjeaGgrsdlZPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UZcNHggfjY31zzL70YhqyfHzSVoYVjyxYH/8rB7BCK+7IJs2L94XlVze2FvUmkYwSF1VIAUpidkI73YoZT8HfBp6R6CQ+OHevEHDWp99CbwEWRcS9uujabpjYr5ND5XEaFwS2tEcJhoAboIy02xx8WcGb2TxxxT0AfpiTD7aXTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awHXfniy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so6376923a91.1;
        Fri, 27 Dec 2024 01:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735293495; x=1735898295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZTAeE6qWcwJUNnxTnxrs2KZnvYlBCv3e3fLLBfhd2k=;
        b=awHXfniyO8i1h6HeDt2bp/3ibV6MyTS4oCh7vE9Ubzbe6dqmmj9zsCwAgtlXMIZK5Z
         16cHm8U9zGh97bh3SsBDfYQTCX4Quf2G6GYuMnu13Fz/ZzNJrqW2OHy0pqaUx5Crfacc
         fTZkr9UDOv7ooqvW5O+RBj8d5TFEkfeGmWOojgSATqb2l6mFAB+69QdrB2Zacotbt6CI
         ORIVOUdo0glcw0UZuthQrIAoPMbPSqrvOe8320fh4YEX5VkHBMMHYGQBVRTqBT7ON7+c
         7klI7bfVF+P/CRh7LUIvvDNYNgVmkM9g/50JbOo4pD0Uws5fCG7cRPf7aGiYG5fd2m3M
         Kgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735293495; x=1735898295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZTAeE6qWcwJUNnxTnxrs2KZnvYlBCv3e3fLLBfhd2k=;
        b=JX6EehRx209CZBJS/DbJLzD8xsYI+8DYFOBW2ZjnbYLf70GYHv3qQWzkUpvoMgyJRQ
         j6B7kYqji6p8NB/4zzfSafvAHjpiDETdihJfU1J1lqR2jslpWovgoPAO0nUJyscbonDL
         FwJ9RhOAfLWoXhsIy44dvKZkLN19/OgDbvLddIU1aM/UGXDPCVLHiL796yGGohhQ265l
         E3lsYyXCZwxy0w1iHaGDt3V3/juulv3eQ1qjjO2ocB8XyiJkNtmNy++y/vrG7ovfdtE/
         bsMfeU5Y4Vja0C2Cnp9gzh8qZlOoqJ3s/O0xjdJ3llKs2gWzv7w75f56vVFVau3BiiOW
         80Fg==
X-Forwarded-Encrypted: i=1; AJvYcCV8whMfmN+PM/KZ/bT17PoVzJXkgNeXMH+eoDOerL4moJZ1mhfAaFyasJCOu0yWRkDIBJZLrEQawbjFrshwFxg=@vger.kernel.org, AJvYcCVM5Q4RGBPZizwJC1j64B+Fbhm5hu4dS048DGWf6lt8ujEUzZ/2crufpTNKEnNtsLnXlFzV1LSOv8dg@vger.kernel.org, AJvYcCX2+yASB1Xx8P8NT5/iC9EeB8bpu4qgxVkHp+coZeiBIwuua1jnyq2lgW5KxizxrJS83pOwhhBlkP0=@vger.kernel.org, AJvYcCXkl23GRHP3yPb0psEIrLoGVqbHOK1ZOOF6PfNPhaIYis/QO8SVm0flbWlrlU81ip6PY2rl6+1INF2HIA==@vger.kernel.org, AJvYcCXqASpjHp3d1XqfZm0lPlPiEmOvW4ukYh/28loLMSzRv9UtFHc0N2RywGYwH/kY6RuOHPu1m9qi@vger.kernel.org, AJvYcCXyKNbX+Mhl+8Tut3cKrl+rzVybPopSq7nyw4yvc8ghC7YkRcxS3S/ivhknYrGfWifzxgyPB12lIVG5@vger.kernel.org, AJvYcCXz2QgTk86ENQCMoJd5yp9VEaSlnVMU7EzOioIkOcEbHd5AcICFZ+Q2LZcjeakxSiEiLTiDge8Y/sEhtYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVXdN+tG/3Os2rfvCnLf9N+25qqnV69dC4LhVYxQxUv9yMISMs
	YGdJe6G0EBt6leeB+zRs/CiSk9dZ993q9ZY7RdHiyRzKgiVih3UG
X-Gm-Gg: ASbGncvfzPqSJ9zTzlA225eL46Ou69ENteDgfspmqQgYcFJyxSSp8AwcUGGTO1FFAcl
	WwsvCYOzzlovEXbNdIGMlW7xRrXc+pcWotyUs9AV9XXaDrEn1Z+sjDPmvRaYgO1ylEahTGaEBCm
	uNDPhyRRJIlNPrFLGtX9jSKWKnulZHWL+SzuOmAZ3PuI0UL7PW3IZ4RbI0ljGYjOpHnJIwf7Jju
	Dalx95x/82yZj4BiyomNTjRj8/KAPwXePkaRzR0YoXIj3hiqS2M43lZkL17xHnotC97V5xI9EnF
	EtFESBPLE6U9KLX5c/Z2D3YO
X-Google-Smtp-Source: AGHT+IE/BxicRXP/2yiiUOPaQVK7Kp9pRaplWsxdyrRMR51dmHOqk8mKeolwbBrgJg8OdwL1MJkQ+A==
X-Received: by 2002:a17:90b:2c84:b0:2ee:bbe0:98c6 with SMTP id 98e67ed59e1d1-2f452dfcb28mr43073326a91.8.1735293494739;
        Fri, 27 Dec 2024 01:58:14 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm131581135ad.187.2024.12.27.01.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 01:58:14 -0800 (PST)
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
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v4 7/7] rtc: Add Nuvoton NCT6694 RTC support
Date: Fri, 27 Dec 2024 17:57:27 +0800
Message-Id: <20241227095727.2401257-8-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241227095727.2401257-1-a0282524688@gmail.com>
References: <20241227095727.2401257-1-a0282524688@gmail.com>
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
 drivers/rtc/rtc-nct6694.c | 263 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 275 insertions(+)
 create mode 100644 drivers/rtc/rtc-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e5c65e382141..6a5164e42700 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16731,6 +16731,7 @@ F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/nct6694_canfd.c
+F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index a60bcc791a48..aeab67acbc84 100644
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
index 000000000000..9465ab895c6d
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
+/*
+ * USB command module type for NCT6694 RTC controller.
+ * This defines the module type used for communication with the NCT6694
+ * RTC controller over the USB interface.
+ */
+#define NCT6694_RTC_MOD		0x08
+
+/* Command 00h - RTC Time */
+#define NCT6694_RTC_TIME	0x0000	/* SEL|CMD */
+/* Command 01h - RTC Alarm */
+#define NCT6694_RTC_ALARM	0x0001	/* SEL|CMD */
+/* Command 02h - RTC Status */
+#define NCT6694_RTC_STATUS	0x0002	/* SEL|CMD */
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
+union nct6694_rtc_msg {
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
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_RTC_MOD,
+			       NCT6694_RTC_TIME,
+			       sizeof(*time),
+			       time);
+	if (ret)
+		return ret;
+
+	tm->tm_sec = bcd2bin(time->sec);                /* tm_sec expect 0 ~ 59 */
+	tm->tm_min = bcd2bin(time->min);                /* tm_min expect 0 ~ 59 */
+	tm->tm_hour = bcd2bin(time->hour);              /* tm_hour expect 0 ~ 23 */
+	tm->tm_wday = bcd2bin(time->week) - 1;          /* tm_wday expect 0 ~ 6 */
+	tm->tm_mday = bcd2bin(time->day);               /* tm_mday expect 1 ~ 31 */
+	tm->tm_mon = bcd2bin(time->month) - 1;          /* tm_month expect 0 ~ 11 */
+	tm->tm_year = bcd2bin(time->year) + 100;        /* tm_year expect since 1900 */
+
+	return ret;
+}
+
+static int nct6694_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_time *time = &data->msg->time;
+
+	time->sec = bin2bcd(tm->tm_sec);
+	time->min = bin2bcd(tm->tm_min);
+	time->hour = bin2bcd(tm->tm_hour);
+	time->week = bin2bcd(tm->tm_wday + 1);
+	time->day = bin2bcd(tm->tm_mday);
+	time->month = bin2bcd(tm->tm_mon + 1);
+	time->year = bin2bcd(tm->tm_year - 100);
+
+	return nct6694_write_msg(data->nct6694, NCT6694_RTC_MOD,
+				 NCT6694_RTC_TIME,
+				 sizeof(*time),
+				 time);
+}
+
+static int nct6694_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_alarm *alarm = &data->msg->alarm;
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, NCT6694_RTC_MOD,
+			       NCT6694_RTC_ALARM,
+			       sizeof(*alarm),
+			       alarm);
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
+
+	alarm->sec = bin2bcd(alrm->time.tm_sec);
+	alarm->min = bin2bcd(alrm->time.tm_min);
+	alarm->hour = bin2bcd(alrm->time.tm_hour);
+	alarm->alarm_en = alrm->enabled ? NCT6694_RTC_IRQ_EN : 0;
+	alarm->alarm_pend = 0;
+
+	return nct6694_write_msg(data->nct6694, NCT6694_RTC_MOD,
+				 NCT6694_RTC_ALARM,
+				 sizeof(*alarm),
+				 alarm);
+}
+
+static int nct6694_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_status *sts = &data->msg->sts;
+
+	if (enabled)
+		sts->irq_en |= NCT6694_RTC_IRQ_EN;
+	else
+		sts->irq_en &= ~NCT6694_RTC_IRQ_EN;
+
+	sts->irq_pend = 0;
+
+	return nct6694_write_msg(data->nct6694, NCT6694_RTC_MOD,
+				 NCT6694_RTC_STATUS,
+				 sizeof(*sts),
+				 sts);
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
+	int ret;
+
+	rtc_lock(data->rtc);
+
+	sts->irq_en = NCT6694_RTC_IRQ_EN;
+	sts->irq_pend = NCT6694_RTC_IRQ_STS;
+	ret = nct6694_write_msg(data->nct6694, NCT6694_RTC_MOD,
+				NCT6694_RTC_STATUS,
+				sizeof(*sts),
+				sts);
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
+					"nct6694-rtc", data);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request irq\n");
+
+	ret = devm_rtc_register_device(data->rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to register rtc\n");
+
+	device_init_wakeup(&pdev->dev, true);
+	return 0;
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
+MODULE_ALIAS("platform:nct6694-rtc");
-- 
2.34.1


