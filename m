Return-Path: <linux-i2c+bounces-10237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83041A8200D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 10:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80323B4B6E
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 08:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E9225E462;
	Wed,  9 Apr 2025 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+g9dQu3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E8925E44D;
	Wed,  9 Apr 2025 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187318; cv=none; b=KggyzRSn8Wtg7t7sliYo/VrBBIeYCafsnp4y2xxk4b+Es5kA20dig0C0M6Zq04LMNiNAEVe0r/gfyRaIS+AnayTlDaQJbHDr48433RkGpGDiR2ULVqfmUdLl6qOuTrklTSbPbjMC7aTHTO6RSy33opSM1YOU/Z7jYeH5cu5UN84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187318; c=relaxed/simple;
	bh=RAuWVJlpPi7M3nf6Gx2Y7sgyy51HoQxUVXJ7krbJr8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nur6InFiZyAZyp4KplwaZPdMi+Pzg3P5GBDguhbBNoPfMMRTOEURnDcygMe6TaD+jiVWiG469Y63DwgBo9ytFfDb7doMDrzDPH84HFrhOkag/TqN0jpewYnuQPyoqgzK2L6alHglxpzdzGc5sxd7byCgBpYfcCtTemACpO58JD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+g9dQu3; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso6280028b3a.2;
        Wed, 09 Apr 2025 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744187316; x=1744792116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLRPaGKplD8oYOPGjWmbdAprG6q5TQE2NqumKVm0Mi4=;
        b=V+g9dQu3I8ONbYUAIU+Brne4TuNULMrfsKHFcJdKcFnolHd70K/TaijvxaVIffP4t1
         r7CJyBG36wGwMEgYBy1ZPVU+KPXvX1Jhz2fBrWeZJKUg7oG55PLVD/eAnIT4OHTg/jQj
         sVqf4sANmFFl9QDY+60kjJPFb26a+yp6PHml3XcWJSgognaqzOmBRqsomQJK4TFykrGY
         CvO7Morvh0bHtx5LAKzfTkxk6UGrs/T2xDH30p13eL90Qkk0LnEHAqEq8qahVdbACHn3
         9hLfljO4RiJHVMo+x1ThdvWFo4H6mUMI1l4qMWPcfBm08WaMSwxV5RwLZX6w/xDkmqaC
         TMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187316; x=1744792116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLRPaGKplD8oYOPGjWmbdAprG6q5TQE2NqumKVm0Mi4=;
        b=A0+Rb7Y3XAZQGeGmBo5IJxVgIyEBOCl/oORbCrg3a3dEawunJmtRVwo7sQxQ0+/Aid
         I2Xz3BLqq1JKsjWumuPTk1t3W+FsNfQUBKP9n3FrMzcw/6nNLPjxdNUBgAiYzwci69DU
         +riGAhQJ7Lcwuyy9m7ewa+rxI0AldptKzAzFDV0MyaaJZruECoqYifvGW7xgMwLbrHcT
         S7fDuoIWhctEnsUuVr9paweBctN4jsQy33R4oK1enXH3/0pqvWOQil47jUYjjteM9GSj
         cg3zDghLn79DNlMlEIwhGK15YY9hAVscp7EJy/Av7lTCjiVajvwVsJaJkoiCkA7eRVL6
         XfYg==
X-Forwarded-Encrypted: i=1; AJvYcCUkDyE+LFSs1HCKqp+uF6fVjVxQhTkjTMIwZevxVr66cUGPnfHaf4Y0WoBLnek0ppkm3h8asxx5h7k=@vger.kernel.org, AJvYcCUnBZw6QCwDDtRMy7pXa9me5+yGACGQw4Q3jSIvFgEByRsTAlV1jBdCNsTtHnt2ljGD+qmCw78j+4Z7@vger.kernel.org, AJvYcCVcA1zsEBreAG2nGUYQ2QAj+XqFvdwiwqvRijNHAxKjxZmRDMVxN+EPyp9TcMMEDaMcEvaiItdldhc4n40=@vger.kernel.org, AJvYcCVhDUA9jiMc/PwXnSc0GnIDFg3f64/nD4ov+oQLi2g2hcY4zHDKVwQXmUr1PA8mpHP0WjKzF5wYk2+azTp+xoM=@vger.kernel.org, AJvYcCW1fbjXHNs2GQk1wL1NWjV2MUm/B5GMu99I/Ud/+j5PlcMjzMNND/m8Lgu5Kd0YKEIA9/3W8kMf/7Ya@vger.kernel.org, AJvYcCW3jeE57+ho1dN3BWZVO/TMtxiyO7aEO8w5QoJtwVQgujKOjcNZghMsKfd8G8ySCp7rB5RKPRav@vger.kernel.org, AJvYcCXiN9Wz//GMCaFPERFGMybwW1EssMfWaxVlsI1WCgbudXpx4fNCEd4dFAW1gjlKwzule0sr2kLNeDlHSQ==@vger.kernel.org, AJvYcCXyAhl5ySRQosirHugVtEhR+2v42+xUYyk6ITJVVF2+V6KobNjs6onwqhKxKg5LhRKezNzfj/qwJ7Bi@vger.kernel.org
X-Gm-Message-State: AOJu0YwzsMq/RQymBgGaeo5vpQtv/xCi6EKfVp+s8RcjLs4EpKsscqx8
	WjvNCTGRtUsFFjAamj++LgN79oOx9oY6BhpFUxz1LzjdHdlzZ3qd
X-Gm-Gg: ASbGnctudfs97t7+F1Is6RK+ImYrIs2+W0F0zdeNt4pgIttUThnOCF+Ce2R+lHS4+qa
	XfyH3jBOKQwM2HkrkC3KleWQo+tXiD60ANSqTkUNjRM8iBIs8uSPTBX9OzZBstkuItLPja55KEj
	6c2jWrF6p/0EpQOCyqrvri8YfN9MJPPfMHoMduTr2h1vVfaIt79J9d6b8F+Ithug78f8vKXkKDk
	1Psy8aZQLBCvGSCsMG6pmoDQaStiDf9Ged+g5zLbuLacvkOwgHZFY0DvoZHJ7e3iGYFxRyf31Ix
	oxNRU3htXz5YBIegiNXTkl2v+66Kmu4MvulGoQadEiZzqRjoSe5Rv+7YQdQRir1X/NykYKTmeDm
	wr5s=
X-Google-Smtp-Source: AGHT+IGNnTzL24kdGFR/kkNnJL7VtTc0aIEqz0aHaBaOQno6bBJXxchhxM+uxjiRgApPAfsCqradiw==
X-Received: by 2002:a05:6a00:2e0f:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-73bae551295mr2622809b3a.21.1744187316047;
        Wed, 09 Apr 2025 01:28:36 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d46509sm740772b3a.57.2025.04.09.01.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:28:35 -0700 (PDT)
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
Subject: [PATCH v9 7/7] rtc: Add Nuvoton NCT6694 RTC support
Date: Wed,  9 Apr 2025 16:27:52 +0800
Message-Id: <20250409082752.3697532-8-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409082752.3697532-1-tmyu0@nuvoton.com>
References: <20250409082752.3697532-1-tmyu0@nuvoton.com>
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
 MAINTAINERS               |   1 +
 drivers/rtc/Kconfig       |  10 ++
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-nct6694.c | 309 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 321 insertions(+)
 create mode 100644 drivers/rtc/rtc-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ee0cc1b55c83..b68a6ea3ca2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17310,6 +17310,7 @@ F:	drivers/hwmon/nct6694-hwmon.c
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
index 000000000000..b7ae229d6a31
--- /dev/null
+++ b/drivers/rtc/rtc-nct6694.c
@@ -0,0 +1,309 @@
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
+	if (!data) {
+		ret = -ENOMEM;
+		goto dispose_irq;
+	}
+
+	data->msg = devm_kzalloc(&pdev->dev, sizeof(union nct6694_rtc_msg),
+				 GFP_KERNEL);
+	if (!data->msg) {
+		ret = -ENOMEM;
+		goto dispose_irq;
+	}
+
+	data->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(data->rtc)) {
+		ret = PTR_ERR(data->rtc);
+		goto dispose_irq;
+	}
+
+	data->irq = irq;
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
+	if (ret < 0) {
+		dev_err_probe(&pdev->dev, ret, "Failed to request irq\n");
+		goto dispose_irq;
+	}
+
+	ret = devm_rtc_register_device(data->rtc);
+	if (ret)
+		goto dispose_irq;
+
+	device_init_wakeup(&pdev->dev, true);
+	return 0;
+
+dispose_irq:
+	irq_dispose_mapping(irq);
+	return ret;
+}
+
+static void nct6694_rtc_remove(struct platform_device *pdev)
+{
+	struct nct6694_rtc_data *data = platform_get_drvdata(pdev);
+
+	devm_free_irq(&pdev->dev, data->irq, data);
+	irq_dispose_mapping(data->irq);
+}
+
+static struct platform_driver nct6694_rtc_driver = {
+	.driver = {
+		.name	= "nct6694-rtc",
+	},
+	.probe		= nct6694_rtc_probe,
+	.remove		= nct6694_rtc_remove,
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


