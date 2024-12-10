Return-Path: <linux-i2c+bounces-8409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 023C79EAE7B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 11:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6320D161DB5
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F46E223E7D;
	Tue, 10 Dec 2024 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLjnzMdC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5C7223E69;
	Tue, 10 Dec 2024 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827585; cv=none; b=RRLQNjvK+lRZJL5IOLrTMOWuUlrEzyBD2SaKn/slORvaJHSWBBdSFWnfSaKbQRwcGqYEPIFjdwW0YqwvMHXA4umEUg7EOVPix9OqvVe53qiUKvASZEaqIjIfplykpG8cuYAr1xTI6I1PVgFw5VvFKzi2JUrumNpvo/Zp3sPTl1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827585; c=relaxed/simple;
	bh=hUdmWJrZ8uZDa08fx3jiEpjOsAtFBYDD54GTsPyfnC8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cLLoBuVjyQw9RL24p1KRTbEZAYleujAMMPjHndX8a6gNGcLXZNNKpsPqWlmvTjv3X+qt5NbtSYe5IKXa85nabRHxAC7RWVPdOHT+W+tkAmuMxc73RYbTQFu7zrVxrca86NcRVbBIuY2+Scy3puzt2vSusLh9GbkZ/4tTNdbylEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLjnzMdC; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-725ee27e905so2175893b3a.2;
        Tue, 10 Dec 2024 02:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733827583; x=1734432383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/tsulPfEI/HbzTLrZhhJrzZ8h085yaO/VGtKwjuGCg=;
        b=gLjnzMdCnOx7iG/zJEDzfN93IjzDtOfR9l4T59jmvOOiKz45sGza3WZOK4cd0U1XOH
         +hbF706uMF9Y4lKj0LlR5o3mCkH3xW5JdnP69gkNe8lmqWGPF0nzOGb4Wl8M6X9La/bU
         +mPnGmtLLBtKe2kdBe5rRROiQ5x92mqCV0BgWyzqISBQAFMogxNdFSXN0WvpdxTCxRNX
         5LSC6ET+SSa+6u8gUrXch4vvwwJ1EsIXu+dI3VsrRAkGs3UKSlYRUInm7VeSuGg3wAnZ
         BYggvfkmKWJo1ckP1bU927ZxvBVD3iBs+pWdcxEizKVE7a//iEO47uRUFp6nl3/ib354
         OB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827583; x=1734432383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/tsulPfEI/HbzTLrZhhJrzZ8h085yaO/VGtKwjuGCg=;
        b=Ei4RjC/v5HwBKzeDx7GsA2fdaVCz3tRWzcyRxRpE9deLRb8k26qYvzCCDxSxJ2Sc4C
         A+P/51KCP42iLPfUHfl5iugV1xUvfVPfCMa+SvTMsSutrlFprZMfuFjkgiwmzMtgSKO4
         rRkwDL9nGBNPc29nFyOmi7/pggfy5t32K/qHGitsAWtic9kx+/DDuyncJo2GiG8cfTLr
         7mxbP7gbK1iaBCbxrmpfUn3MJafUhUr3CK0bVZqsd1pwYDUzv0WfOCMbNAIKzlAsxiOl
         5YIo7iQYfEbnINZpDZto85Ti0wnlFRxuo/PAHOPoC+gQrg+pAaL3QFLAVKBcPLQ0EIsA
         U7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUZx+vhIBUy3U0JBkKynBzpZCgaWlutuC7rsTApK2RhR+dfwuxkEe3v87StYL24m6Lmwo73g/nIv6tS@vger.kernel.org, AJvYcCUuhc2JN3Tx2+sLDw4vA0nh4IAtuO7OwKnsNeAGoQSYaz9F3rjC/sdfHRQ9op7M3nonjjBBDNgcQxhD9g==@vger.kernel.org, AJvYcCVhnBqNSbvCiw11mnnCbsVsowpDLGoqi90zW2Oxu1iFlpKCwAqoq3VA00lLFgA8qBK59qMTH6lCppU/+ZkNJf0=@vger.kernel.org, AJvYcCVoIS/38/UKVoRv72OIjf+pfB1++ERoEuKDuHjAz+Zqm3OYuV5QYWM01FasxK4DUx2/GFlPin+4@vger.kernel.org, AJvYcCWSL05b/p3MXsROYBOQU7xz9j5TQWhLVoKTVmPVwuLp7kX308qRKjpokzDPC8IBxaoInj9hKxYhPoQ=@vger.kernel.org, AJvYcCXM3zuC6rf0einIUFLlmGQx5rBjEQCx2XVcyQFY+m+J/ZNbU1lDMRwe/Rd4p08FQ/VCkCXLJ3fn6dEI@vger.kernel.org, AJvYcCXxGOhifzF5Xe60SxemlGn6qQmNjY9khvu/dNICPAUjowD00zCe/9pb4mgzT8m3jxvlMmtTyavIlNku/8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4RW0OwnYAB7kqe2QRUBZ4MhAuwxGDtqICz4hp6icQ2w9C0/xD
	ILRlhK3+cAjaTx/il/ZGNOhjD1pw4yjX6IO1z/HlQw9BNbllO62x
X-Gm-Gg: ASbGnctHAhQTEo0w3Zw4Y/lWumw9AduJtmI6tIhoUUCv4kKReSoE/xFe2Kx0+QGRBKZ
	7Y5Lij2yoQTAG84692Xhbt1D4bkEftoM97iUgQiVQm63C9K0i+SHiOBIetlH5UNsYVie6XmCCYc
	0SjRyAsGYxpeABXv7zJ8VQy+h2hyO6NjLSU7HMYkxOEZ0Wb9MUNN9jawlO6OVNPu0RO/tC16BFh
	JJUYNRR9kl86nQKJ9YAuspNcYj+2mYB00BtoGkSll2eLf9s4I5tf/9JwPQ7eelq6KauqH/cShRL
	o3Iu4AwHqbQw683f
X-Google-Smtp-Source: AGHT+IEFzISgMzORm1VZJHloXLXa4RbAFlrP6lX4mjT3bkPPo/3uvNKogh8I0oZwg4hGcbnrTfGVmA==
X-Received: by 2002:a05:6a20:3945:b0:1e1:afa9:d397 with SMTP id adf61e73a8af0-1e1afa9d6fdmr8076953637.15.1733827582738;
        Tue, 10 Dec 2024 02:46:22 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156dfe2fsm8905748a12.31.2024.12.10.02.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:46:22 -0800 (PST)
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
Subject: [PATCH v3 7/7] rtc: Add Nuvoton NCT6694 RTC support
Date: Tue, 10 Dec 2024 18:45:24 +0800
Message-Id: <20241210104524.2466586-8-tmyu0@nuvoton.com>
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

This driver supports RTC functionality for NCT6694 MFD device
based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS               |   1 +
 drivers/rtc/Kconfig       |  10 ++
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-nct6694.c | 264 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 276 insertions(+)
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
index 000000000000..0dbe2aa0a042
--- /dev/null
+++ b/drivers/rtc/rtc-nct6694.c
@@ -0,0 +1,264 @@
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
+MODULE_ALIAS("platform:nct6694-rtc");
-- 
2.34.1


