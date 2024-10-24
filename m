Return-Path: <linux-i2c+bounces-7527-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1693A9AE003
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5011F23455
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5341C1D1745;
	Thu, 24 Oct 2024 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQ/GYbx/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAA21B4F3D;
	Thu, 24 Oct 2024 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760430; cv=none; b=s1bOx/kZGksIEQcRXgKyeJpgbID15fFhMpI38qx59dzfNo36UT7T1/Wp0YdT35A5BI7hOK2tb+hNbKfNoLm88koSXL8u7sL3s/R1bRyrmxoNTEo226/q94U2bPH7s2xdGNnZeq9ZA70rX0t87Yvu0iXubyxOTWr1qoq/1VMpK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760430; c=relaxed/simple;
	bh=zHqxB7fmBbca/3/uhh+sdA/oXZ4DFNAbHKvHPJIehv8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RTB+C4BkwYiieCXfzgGilFj6Ns9L1GXMj4UWLrVtQ+4IvFnVnuibWgNYPPtVqPR/zpIzFhUTg+66OCq3Ey+wh3e7YadJSuMHbOEe4hhYfYgaGh7X+ivKb0zySrkFTQTMFciHiTLF/V+TLULF9JtZE+RI3ZVfBea49a5YgKRzoS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQ/GYbx/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c803787abso5231765ad.0;
        Thu, 24 Oct 2024 02:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729760426; x=1730365226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CuRkBznOtCHHxZzKq/9IVvhKUdKupfyQysLLGavF5I=;
        b=QQ/GYbx/LpvR2YILsaPm1l/27LhUV7S1qpVXU1vBdrX/89haRzJglwvTQ3ndYT5Ogf
         NVLuR7n3u0vU7Bvd8ZXMDf+tWlld+DslD4hTCZL7vQ65T/TOQbbhinPIsAI4aHVSfJIK
         26oOCWWesnt881t3OKVuH+9J9ysptsePMgZJ8t48NNlZjJhqIO6Z6ITK6qZAHw7avedC
         5tNK4wooVGVFb4WPPE24UqbCK3ikz+Aga9C5aL855aEUzAPTF/eBW8SUNa6gIhrXlig/
         37L9wbhgK5uoW9HLSp8SRciPTDgmp+VF2+RUK5OdPgnTH705mkclEH1mbMeb4wuT+PwH
         gf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760426; x=1730365226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CuRkBznOtCHHxZzKq/9IVvhKUdKupfyQysLLGavF5I=;
        b=WmUc+HLGx9xARK+9B67p0zdcxgWULViQ0cPVGp2YcpQoFVrxXDcjyCAhz/qmKwdMth
         vkZZJmePz3yEG9jYcHPIIx50H1HjinF8zNOvbPLP/0wfUOfsKcxDgTOKNYBQu47o7f8R
         IUJvdEwXxn+WnQV4jbCg8fC2/cCj0EwcF3c9XgltBlxNMb5NkZABX+QwLBSqOkgmv+RW
         whscymiXRpA0xGR2cQ+2T/N0Ccozk0ARjwZsK7a/WNmvYvXEF9lVLUbRKZiTp6g9nJpe
         wTH8SmZxavk1/jjolsjbuEYCmU2zm8jjMPgdvx0ydQonbwuiCWIxZq5MsK0g5vJk+jmt
         07iw==
X-Forwarded-Encrypted: i=1; AJvYcCUYkrI2vWdEpkslXiibV8LEOcm+UQcJD7OPqyP1PdQzQ6AhwhB/5ML59rETsruEI/ANU7BUsh9pnPLTNQk=@vger.kernel.org, AJvYcCUr/1TxJsLY8TW4lSCDtZtAqHKsExqyo4eArlxiI95EnjP7usu174BylDwIUADaOZDmulbV6Z+gWfyw@vger.kernel.org, AJvYcCVJgaKxK+ztTI1y0wVvFwkKYs7EzDkWATEfqALeVFYa+sOPMywKxSxc7dtVUl7IlrnAtOzhAJx+3WQ=@vger.kernel.org, AJvYcCW0R+ViVymcTLMMPkMkEc+EBVwd5vdI5VLlmwEmbeIL+9gEyXnxPAx9Ra/xmgJ8JwVzIhFLfftRFRKs@vger.kernel.org, AJvYcCW5ECR+3VGn31TGzaBYTjiZCsX5IZ/gxUu7yCjE90LhdsLgWgd2wK80PiVPQ1iEMTolXAIVaMpCkJjRYw==@vger.kernel.org, AJvYcCXHYYybyBn3XGjkQHzt27f9lPKBTPiM9Rsn0s7gkt9ZrpnZlmcSf+5NxC9xtMISDcf0+t6yq6tj31OfO2zFhoo=@vger.kernel.org, AJvYcCXZpcVHMZlUnMukbga0AknJKy7Adjyf+x8uwOeZwy7xZ0Acd62KKN7Gop3dFJ9iUddT94Ickx5A@vger.kernel.org, AJvYcCXdxS/awQtq+l04UvK80Sdiy8zrjwNcpO0sZ7eVdHVTbWHTPodFdF3tQAX7a6A16TCPQtsA0OtF1wVI@vger.kernel.org, AJvYcCXoMQKQM9CW6X763/IoGP72AkJUlEY/2wiI8sfwsttn3tjskzjxpVOHhHKCN++Y9KPq5hg3QX2fotbL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4355rbf59QBq6iPAfbp6HCk1GOphbGGx2JCbsRvjQKF2oFRMw
	2+c6aUtNhY+nXAj4V0IuILJ5kFa59jq8MlyAwRjbLMHCNEF8W6wo
X-Google-Smtp-Source: AGHT+IGm0bfEw6JC+/h3k0ziqfQnO701FaANVWXMniBwl81s116rE2DFv9I4iE6IYfeiqIdcjDUCGg==
X-Received: by 2002:a17:903:32ce:b0:20c:5990:897c with SMTP id d9443c01a7336-20fb8a5b3c2mr20278635ad.27.1729760426485;
        Thu, 24 Oct 2024 02:00:26 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6e89sm68503615ad.277.2024.10.24.02.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:00:26 -0700 (PDT)
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
Subject: [PATCH v1 9/9] rtc: Add Nuvoton NCT6694 RTC support
Date: Thu, 24 Oct 2024 16:59:22 +0800
Message-Id: <20241024085922.133071-10-tmyu0@nuvoton.com>
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

This driver supports RTC functionality for NCT6694 MFD device
based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS               |   1 +
 drivers/rtc/Kconfig       |  10 ++
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-nct6694.c | 276 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 288 insertions(+)
 create mode 100644 drivers/rtc/rtc-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d5a5eded3b9..8de90bda8b5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16445,6 +16445,7 @@ F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/nct6694_canfd.c
 F:	drivers/pwm/pwm-nct6694.c
+F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 66eb1122248b..240c496d95f7 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -406,6 +406,16 @@ config RTC_DRV_NCT3018Y
 	   This driver can also be built as a module, if so, the module will be
 	   called "rtc-nct3018y".
 
+config RTC_DRV_NCT6694
+	tristate "Nuvoton NCT6694 RTC support"
+	depends on MFD_NCT6694
+	help
+	If you say yes to this option, support will be included for Nuvoton
+	NCT6694, a USB device to RTC.
+
+	This driver can also be built as a module. If so, the module
+	will be called rtc-nct6694.
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
index 000000000000..622bb9fbe6f6
--- /dev/null
+++ b/drivers/rtc/rtc-nct6694.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 RTC driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/rtc.h>
+#include <linux/bcd.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/nct6694.h>
+
+#define DRVNAME "nct6694-rtc"
+
+/* Host interface */
+#define REQUEST_RTC_MOD		0x08
+
+/* Message Channel */
+/* Command 00h */
+#define REQUEST_RTC_CMD0_LEN	0x07
+#define REQUEST_RTC_CMD0_OFFSET	0x0000	/* OFFSET = SEL|CMD */
+#define RTC_SEC_IDX		0x00
+#define RTC_MIN_IDX		0x01
+#define RTC_HOUR_IDX		0x02
+#define RTC_WEEK_IDX		0x03
+#define RTC_DAY_IDX		0x04
+#define RTC_MONTH_IDX		0x05
+#define RTC_YEAR_IDX		0x06
+/* Command 01h */
+#define REQUEST_RTC_CMD1_LEN	0x05
+#define REQUEST_RTC_CMD1_OFFSET	0x0001	/* OFFSET = SEL|CMD */
+#define RTC_ALRM_EN_IDX		0x03
+#define RTC_ALRM_PEND_IDX	0x04
+/* Command 02h */
+#define REQUEST_RTC_CMD2_LEN	0x02
+#define REQUEST_RTC_CMD2_OFFSET	0x0002	/* OFFSET = SEL|CMD */
+#define RTC_IRQ_EN_IDX		0x00
+#define RTC_IRQ_PEND_IDX	0x01
+
+#define RTC_IRQ_EN		(BIT(0) | BIT(5))
+#define RTC_IRQ_INT_EN		BIT(0)	/* Transmit a USB INT-in when RTC alarm */
+#define RTC_IRQ_GPO_EN		BIT(5)	/* Trigger a GPO Low Pulse when RTC alarm */
+#define RTC_IRQ_STS		BIT(0)	/* Write 1 clear IRQ status */
+
+struct nct6694_rtc_data {
+	struct nct6694 *nct6694;
+	struct rtc_device *rtc;
+	struct work_struct alarm_work;
+};
+
+static int nct6694_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	unsigned char buf[REQUEST_RTC_CMD0_LEN];
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, REQUEST_RTC_MOD,
+			       REQUEST_RTC_CMD0_OFFSET, REQUEST_RTC_CMD0_LEN,
+			       0, REQUEST_RTC_CMD0_LEN, buf);
+	if (ret) {
+		pr_err("%s: Failed to get rtc device!\n", __func__);
+		return -EIO;
+	}
+
+	tm->tm_sec = bcd2bin(buf[RTC_SEC_IDX]);		/* tm_sec expect 0 ~ 59 */
+	tm->tm_min = bcd2bin(buf[RTC_MIN_IDX]);		/* tm_min expect 0 ~ 59 */
+	tm->tm_hour = bcd2bin(buf[RTC_HOUR_IDX]);	/* tm_hour expect 0 ~ 23 */
+	tm->tm_wday = bcd2bin(buf[RTC_WEEK_IDX]) - 1;	/* tm_wday expect 0 ~ 6 */
+	tm->tm_mday = bcd2bin(buf[RTC_DAY_IDX]);	/* tm_mday expect 1 ~ 31 */
+	tm->tm_mon = bcd2bin(buf[RTC_MONTH_IDX]) - 1;	/* tm_month expect 0 ~ 11 */
+	tm->tm_year = bcd2bin(buf[RTC_YEAR_IDX]) + 100;	/* tm_year expect since 1900 */
+
+	return ret;
+}
+
+static int nct6694_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	unsigned char buf[REQUEST_RTC_CMD0_LEN];
+	int ret;
+
+	buf[RTC_SEC_IDX] = bin2bcd(tm->tm_sec);
+	buf[RTC_MIN_IDX] = bin2bcd(tm->tm_min);
+	buf[RTC_HOUR_IDX] = bin2bcd(tm->tm_hour);
+	buf[RTC_WEEK_IDX] = bin2bcd(tm->tm_wday + 1);
+	buf[RTC_DAY_IDX] = bin2bcd(tm->tm_mday);
+	buf[RTC_MONTH_IDX] = bin2bcd(tm->tm_mon + 1);
+	buf[RTC_YEAR_IDX] = bin2bcd(tm->tm_year - 100);
+
+	ret = nct6694_write_msg(data->nct6694, REQUEST_RTC_MOD,
+				REQUEST_RTC_CMD0_OFFSET, REQUEST_RTC_CMD0_LEN,
+				buf);
+	if (ret) {
+		pr_err("%s: Failed to set rtc device!\n", __func__);
+		return -EIO;
+	}
+
+	return ret;
+}
+
+static int nct6694_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	unsigned char buf[REQUEST_RTC_CMD1_LEN];
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, REQUEST_RTC_MOD,
+			       REQUEST_RTC_CMD1_OFFSET, REQUEST_RTC_CMD1_LEN,
+			       0, REQUEST_RTC_CMD1_LEN, buf);
+	if (ret) {
+		pr_err("%s: Failed to get rtc device!\n", __func__);
+		return -EIO;
+	}
+
+	alrm->time.tm_sec = bcd2bin(buf[RTC_SEC_IDX]);
+	alrm->time.tm_min = bcd2bin(buf[RTC_MIN_IDX]);
+	alrm->time.tm_hour = bcd2bin(buf[RTC_HOUR_IDX]);
+
+	alrm->enabled = buf[RTC_ALRM_EN_IDX];
+	alrm->pending = buf[RTC_ALRM_PEND_IDX];
+
+	return ret;
+}
+
+static int nct6694_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	unsigned char buf[REQUEST_RTC_CMD1_LEN];
+	int ret;
+
+	buf[RTC_SEC_IDX] = bin2bcd(alrm->time.tm_sec);
+	buf[RTC_MIN_IDX] = bin2bcd(alrm->time.tm_min);
+	buf[RTC_HOUR_IDX] = bin2bcd(alrm->time.tm_hour);
+	buf[RTC_ALRM_EN_IDX] = alrm->enabled ? RTC_IRQ_EN : 0;
+	buf[RTC_ALRM_PEND_IDX] = 0;
+
+	ret = nct6694_write_msg(data->nct6694, REQUEST_RTC_MOD,
+				REQUEST_RTC_CMD1_OFFSET, REQUEST_RTC_CMD1_LEN,
+				buf);
+	if (ret) {
+		pr_err("%s: Failed to set rtc device!\n", __func__);
+		return -EIO;
+	}
+
+	return ret;
+}
+
+static int nct6694_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	unsigned char buf[REQUEST_RTC_CMD2_LEN] = {0};
+	int ret;
+
+	if (enabled)
+		buf[RTC_IRQ_EN_IDX] |= RTC_IRQ_EN;
+	else
+		buf[RTC_IRQ_EN_IDX] &= ~RTC_IRQ_EN;
+
+	ret = nct6694_write_msg(data->nct6694, REQUEST_RTC_MOD,
+				REQUEST_RTC_CMD2_OFFSET, REQUEST_RTC_CMD2_LEN,
+				buf);
+	if (ret) {
+		pr_err("%s: Failed to set rtc device!\n", __func__);
+		return -EIO;
+	}
+
+	return ret;
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
+static void nct6694_rtc_alarm(struct work_struct *work)
+{
+	struct nct6694_rtc_data *data;
+	unsigned char buf[REQUEST_RTC_CMD2_LEN] = {0};
+
+	data = container_of(work, struct nct6694_rtc_data, alarm_work);
+
+	pr_info("%s: Got RTC alarm!\n", __func__);
+	buf[RTC_IRQ_EN_IDX] = RTC_IRQ_EN;
+	buf[RTC_IRQ_PEND_IDX] = RTC_IRQ_STS;
+	nct6694_write_msg(data->nct6694, REQUEST_RTC_MOD,
+			  REQUEST_RTC_CMD2_OFFSET,
+			  REQUEST_RTC_CMD2_LEN, buf);
+}
+
+static void nct6694_rtc_handler(void *private_data)
+{
+	struct nct6694_rtc_data *data = private_data;
+	struct nct6694 *nct6694 = data->nct6694;
+
+	queue_work(nct6694->async_workqueue, &data->alarm_work);
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
+	data->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(data->rtc))
+		return PTR_ERR(data->rtc);
+
+	data->nct6694 = nct6694;
+	data->rtc->ops = &nct6694_rtc_ops;
+	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	INIT_WORK(&data->alarm_work, nct6694_rtc_alarm);
+
+	ret = nct6694_register_handler(nct6694, RTC_IRQ_STATUS,
+				       nct6694_rtc_handler, data);
+	if (ret) {
+		dev_err(&pdev->dev, "%s:  Failed to register handler: %pe\n",
+			__func__, ERR_PTR(ret));
+		return ret;
+	}
+
+	device_set_wakeup_capable(&pdev->dev, 1);
+
+	platform_set_drvdata(pdev, data);
+
+	/* Register rtc device to RTC framework */
+	ret = devm_rtc_register_device(data->rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register rtc device!\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver nct6694_rtc_driver = {
+	.driver = {
+		.name	= DRVNAME,
+	},
+	.probe		= nct6694_rtc_probe,
+};
+
+static int __init nct6694_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&nct6694_rtc_driver);
+	if (!err) {
+		if (err)
+			platform_driver_unregister(&nct6694_rtc_driver);
+	}
+
+	return err;
+}
+subsys_initcall(nct6694_init);
+
+static void __exit nct6694_exit(void)
+{
+	platform_driver_unregister(&nct6694_rtc_driver);
+}
+module_exit(nct6694_exit);
+
+MODULE_DESCRIPTION("USB-RTC driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


