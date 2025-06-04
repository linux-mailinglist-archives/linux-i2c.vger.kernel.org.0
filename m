Return-Path: <linux-i2c+bounces-11246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5670BACD715
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 06:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA5C2162A58
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 04:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BA4267733;
	Wed,  4 Jun 2025 04:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YB6ENbBK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B24E2676F4;
	Wed,  4 Jun 2025 04:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749010510; cv=none; b=fFUUo4X7j6CttvGcZsES8JUm2Rfl2GhNux7NeXYaZtPWpkRXaAC6GY+fl7t8jkEslwE6bmZhBy8S4rFidya3BMa7PprjX0cRGZdrX0tevQFhUmFIlhD/yda7KbRys9XgRkZugU0MTBnutPPBPKoVtxD8sPiBHxuiHQpZP3wubd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749010510; c=relaxed/simple;
	bh=xj8Z8iSMluHaL54hj25VQScqqGy2CXHbC2rVNkZsLIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PpfTTYJf4Kd7Ibz8iI9ab0Nr9AnhUUAZTZUvobExe1Yv65ncyQy6cNWkh+s8ZGxwTkX46Htd0ZieOf7IwHirCD+jv8yEzzSZfil5KbqXDYN121FIIeL7MGYvRSeWFNi6bSGf/wnxqTXU6u7HeXVp6Kb+2u8KeQ5QISnnWVeYyS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YB6ENbBK; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso5131964b3a.2;
        Tue, 03 Jun 2025 21:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749010507; x=1749615307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btMStnYyQ8HvrDuqKAw82npCm8gymJ9aM+ez1TBPKDU=;
        b=YB6ENbBKzDmF6zX/BF0kmqp/FO7jBF5dWwZsyyuBSrdb81stwJrK4oKNDwlXqaNo/i
         /kkdr0oMXbUk6cDcVpJjqRzSJ1tMIV3ZFX7igVezd/Xng4LA2xllbeCjWWCjl3VwzDta
         ZkBpM1D3BcZG9IX97h5pxLg6v55l2eXCzWm2EkDzSHzuozNcukPhQcz9g1a+icOMtS94
         qVK8RRp+0rIwRtga34abb9g+D/NmD/lthATl2wGAO8t9ANraEut1imswqMvgUoqhoIvW
         1YO4HHMv+WCT+TPPxBhxS2x3ZeyxrGnIShr1RaarKA2+NGU+aoEuCLqsNUb9VVlHEoCL
         LjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749010507; x=1749615307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btMStnYyQ8HvrDuqKAw82npCm8gymJ9aM+ez1TBPKDU=;
        b=pbIYsRxGtINclPMEFdj74IEH8SgXk8EdQBmKWJSH0dDvH0xBQ0/SZYTVdax5rkQqhB
         F9yQWEHuCOgRRSpAYClDAh22swJ5U0WNqZpiXcDGJljP8GpoSNAchmw/zx7yOBk2Jyv6
         Wo1QLV+rosqoU4Fp9cNhZKvVLZJ7E2LDVG8WFmqCQBt3ZlrQvUsgKk4nZ2McN1ZPTZqJ
         rUjWhMQhc16qXRjaw8E0PgruQ/4hIB+pkiyIhRs1U7tmREbHgbtASkJKwbtjDOtoKO9p
         j3roniZ3BU9aGgb6mK2g/QcaHU7fPUhH/vZvhON6QWf6JlusZHnb0ExQ7inhvca9PyaD
         WHog==
X-Forwarded-Encrypted: i=1; AJvYcCU0nv/Ye1J9OhogSqNcQA6P57XEUmTI/hT6/oMy4zvGO6MCTs76apHvoPuupzICpoF8HpBYU4xbb+jcG24=@vger.kernel.org, AJvYcCUMJjvZ5A5S0KSmu9G+2PiRGCYM3GYxE8vm0maBjfoRsEZM2OC1tmD8VByGkzXX6YAm+ydjfcEg@vger.kernel.org, AJvYcCUd/8FdqdA1OxLfF85JqcZihwM7Xf8ZE0wQ0cyrgMNe4uFLOy4awuZc+3N3QCz13jjq/lpNpy5HZ2M=@vger.kernel.org, AJvYcCUltGNxOdIbSdTMAl7CF8I1Xp6YAPLAXS6K3bSimH3B6cUcF4kzZsk5xeZA1D9k47uFte+Z35IK4WqVdg==@vger.kernel.org, AJvYcCUltVSJNkeewYEMy0fytzbv/FW1RSgV6Hzi3hxi3tRkiiSBZL0bZqO23a7k4POX98zuxgimr2MT4B7Q@vger.kernel.org, AJvYcCVXL/LXWnrgTmrXfgE3i2SVdxJQXQgjY5Fbn/dawnlfEW8G7sh0NunH/R+OeXt+7AlkCtayzjjub+wiRdIaVLo=@vger.kernel.org, AJvYcCXT1Xe5+BsmedOT0LCoGeZ0W73Ay1hlLHzGp0fZWaaeRQIh9Ojq1f/x+gLohs4oVwHohN8NiqGSLAP5@vger.kernel.org, AJvYcCXcIAeQTVfgwcnwATYjgnce27SR9J9SfUV9K/djaHC3dkHuSzg87kD7dBowVZQdS+9KpABsUD+Wusp6@vger.kernel.org
X-Gm-Message-State: AOJu0YziDDdmSjAzeoWoMvCG4xA/uUYjLUkLV2q3PJyKg0xXTvdHHpX0
	7dC/JlxxFi2f+JFjHTYT3ZhsJmhOehAMgXC1BiR1Vs03PiF+x2Ik6BTJ
X-Gm-Gg: ASbGncva1zM8koq0IyvXHmB1+pYv2+YvQ4XfJFoK8yK3mSujR9zwb4jCay0HeRtamVS
	Gl6D6/CDznH+NkY/Sj5a9osSXxdIEJQVyasXigpOCgzdHV4i6jPSW7U3rPEbH+sEgoTRIl6kxoN
	hsqg+jxTLtlnoOzJUyWphdwbgUAHVNkmGOTl5CDB9bNnDkFbv9rEANEgsHaIS8qx8gipPSPPxte
	6VzB7YpPje7eSQYh05OoFBPZc/zCToHHUCX1UDNZVpKZ46Y5UdExDRBh9i0G4JfD8m+03TRio83
	vMmNJcriJf87WwqjPAQSnm4COOWjceyk/tBuoukdX2R6Z71nlCcqoRu+dhXXZch+TbOutr7GlF4
	Nt9ULku8gu6NMKg==
X-Google-Smtp-Source: AGHT+IHgYPduvo6EN/yYAgjyntbloAU/FdSy85/uhsyu0os0FLm8FgE0w/vW+P1yPPNnzWgNfdg6uA==
X-Received: by 2002:a05:6a21:3282:b0:204:4573:d853 with SMTP id adf61e73a8af0-21d22bcbc4cmr1852077637.4.1749010507253;
        Tue, 03 Jun 2025 21:15:07 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff755bsm10526057b3a.179.2025.06.03.21.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 21:15:06 -0700 (PDT)
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
Subject: [PATCH v12 7/7] rtc: Add Nuvoton NCT6694 RTC support
Date: Wed,  4 Jun 2025 12:14:18 +0800
Message-Id: <20250604041418.1188792-8-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604041418.1188792-1-tmyu0@nuvoton.com>
References: <20250604041418.1188792-1-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <tmyu0@nuvoton.com>

This driver supports RTC functionality for NCT6694 MFD device
based on USB interface.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
Changes since version 11:

Changes since version 10:

Changes since version 9:
- Add devm_add_action_or_reset() to dispose irq mapping

Changes since version 8:
- Modify the signed-off-by with my work address
- Add irq_dispose_mapping() in the error handling path and in the remove
  function

Changes since version 7:

Changes since version 6:

Changes since version 5:
- Modify the module name and the driver name consistently

Changes since version 4:
- Modify arguments in read/write function to a pointer to cmd_header
- Modify all callers that call the read/write function

Changes since version 3:
- Modify array buffer to structure
- Fix defines and comments
- Drop private mutex and use rtc core lock
- Modify device_set_wakeup_capable() to device_init_wakeup()

Changes since version 2:
- Add MODULE_ALIAS()

Changes since version 1:
- Add each driver's command structure
- Fix platform driver registration
- Drop unnecessary logs
- Fix overwrite error return values
- Modify to use dev_err_probe API

 MAINTAINERS               |   1 +
 drivers/rtc/Kconfig       |  10 ++
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-nct6694.c | 297 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 309 insertions(+)
 create mode 100644 drivers/rtc/rtc-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d127df871d36..0b63b6c3a612 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17687,6 +17687,7 @@ F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/usb/nct6694_canfd.c
+F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 838bdc138ffe..d8662b5d1e47 100644
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
index 31473b3276d9..da091d66e2d7 100644
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
index 000000000000..35401a0d9cf5
--- /dev/null
+++ b/drivers/rtc/rtc-nct6694.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 RTC driver based on USB interface.
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ */
+
+#include <linux/bcd.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
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
+	int irq;
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
+static void nct6694_irq_dispose_mapping(void *d)
+{
+	struct nct6694_rtc_data *data = d;
+
+	irq_dispose_mapping(data->irq);
+}
+
+static int nct6694_rtc_probe(struct platform_device *pdev)
+{
+	struct nct6694_rtc_data *data;
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	int ret;
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
+	data->irq = irq_create_mapping(nct6694->domain, NCT6694_IRQ_RTC);
+	if (!data->irq)
+		return -EINVAL;
+
+	ret = devm_add_action_or_reset(&pdev->dev, nct6694_irq_dispose_mapping,
+				       data);
+	if (ret)
+		return ret;
+
+	ret = devm_device_init_wakeup(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to init wakeup\n");
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
+	ret = devm_request_threaded_irq(&pdev->dev, data->irq, NULL,
+					nct6694_irq, IRQF_ONESHOT,
+					"rtc-nct6694", data);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request irq\n");
+
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
+MODULE_ALIAS("platform:nct6694-rtc");
-- 
2.34.1


