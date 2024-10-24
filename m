Return-Path: <linux-i2c+bounces-7524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF99ADFE4
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7B12283782
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794231CB9FD;
	Thu, 24 Oct 2024 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGvrFbyw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793B51CACF3;
	Thu, 24 Oct 2024 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760416; cv=none; b=umDsIBAWFgK5TbmjQoQkvS+bfGQBysnaEYqpcR2riIw7Ec7uLcV0sfLi65LpuEyVuwA9jPr2daJ1DXdRvtjRNJFbBOAy8DppsXb+4flygm8B4TvffRRYVqTR1IsC4yicvdwDW2faiSGmqqPyzb4AB2Krh5ZxMZim4nsxoJ1mzCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760416; c=relaxed/simple;
	bh=G7L4TJRjXe10tGv6q3i4077rvAHxAl3xEvV9p8tOxwo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fBPjQAt2hCJzE7AvLFiQRktI63Co9NMs808oQG8ssJMJg1r3vWSZVwMasUO8buXUfhfgulgZoEftCaGArYu/8xLXK5hRTY9BlMzY01ENwTMgyD57VmTZ8ix0eUdjqdZMMlw9PcZqAO1SI+kQDbODOYo8C+PCXvlnkltpchQVK2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGvrFbyw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20b5affde14so4238585ad.3;
        Thu, 24 Oct 2024 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729760413; x=1730365213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bg6mJIYXLvLavjiOqD84MMx4rmvQyCtl1MVLqjoMoQg=;
        b=nGvrFbywH28En4OEcynhfYwG+1JvpiB9SDuF1OsGcNRGiu3aDBZJOsm1w1Lrw5sWUE
         yGdd57EFIAhZN/LGNRCmFshLQhhKHBWiNKwyG3PG4LqExZ0cTB8OCrIfOAO2auqBqcS8
         Y30Xuw7RDGI65N+8j9D2OtjGsWpABr5Vs/dyvBJLkGO7KMeaTpoy4huK8ZoTQ9+rX7SW
         sABb84woG9Et9WROMVCVSmRTRA/aIfsEh+G1RvfE1JYHltQl+Qj05HN4K+kb1Q4nHo4W
         iqlmMJuLqiaUlDevvMEx32Tq5PpHdmzw0lKJaU7U1h9j5gqNLAmXF8Rpd5ddDMO5Pf59
         T2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760413; x=1730365213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bg6mJIYXLvLavjiOqD84MMx4rmvQyCtl1MVLqjoMoQg=;
        b=cpT79yokxFfllYe2a665llMNJHQx6JVvzV+x+4viVasEdbtmrCvgJvb0ZM/xEadJw+
         jfUnu6tlsBBEn4D2Xrpa6SuRR9dFCzCyVH3VJNseTKNhmdoJQxVQVgd781EGfEvHl655
         6Gy48cjhEb9WbPZOKDiFMZZaYa6T7WiWgIQznYA4qjS9Ef1bN6Wb0tqGO7zyoSRzfcCu
         53FDAA0h/NZBXej/44mEt9yRIAqpcvArf59ruxdZWJR7DVzbHF1WAN6HU+pFvGQQgl35
         1gvY4fcBC9MGJxobgTkQW7HmMXLvP5YsATGUu5LClTX++ulHfYultTD796Pcz2/pOlsc
         PoQw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+4tzc7zbLEYEeWfhri7ffVT/CoYNDBKTA18gN4EIPPXXRJ6tUx0/wQqvRoIHXK/1U6Db9aThPuDgDdo=@vger.kernel.org, AJvYcCUfxMWYiDTlJv8vWwJLGRdBTsbiKi6m8L3kP2fUZ3WqXj0ArpKREW7Ke0quZgVi0gpsY2QwE0rJWVZVscj1SpU=@vger.kernel.org, AJvYcCUoTdzsclTjyHQ485zuDumKT4ROcsPeMDdKTd0ETfekh8TR/zOM1UaaFlmkzw6krnErr6vw9zHGQZib@vger.kernel.org, AJvYcCUzFQMcEuCjtRhZDmGAht1Yl8RL3StAQ+dR+jH+09tgkjXdEPuOKASwOsXshtqZmLjUAmJDguNacyf3@vger.kernel.org, AJvYcCV3CoU1ADdcx709HxYmczu0giYAsVp60VXXuIzNllSlxzLRPXPzANWCgPw0+236AfvGaTfoiT3dNww=@vger.kernel.org, AJvYcCVaN+xxfyro+J1bNhFRZ3B/7WulE6qz40fInuKCqW1oO2txQMeDNqLrJc/h/X8UMtxVYWklOiAESnKw@vger.kernel.org, AJvYcCVmeY9eSuAR2lh/7koSxaVmhT8iVj/x/3Rsm84fRjK+DP6168KT3hXuJ7g+GVIgrapqTytS1CzS@vger.kernel.org, AJvYcCVmrbsKxDJArgPOA2k7ET9ECzzgRbs99YnpwDVGESEmh4NjrDnfhVL+Uk5GYA3H2CU1yy46z1UIVfiy@vger.kernel.org, AJvYcCW5gbYPpHWrm3K605LmNEdkb3GnVjkJGPNT+gWx4SvrWv12w3SxwDXw4qCiK1jCcx41x3XksJWLQQe0zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1kE9ioq+E3MbLjeiIC+bmrii7ncP2K5JTAuCYC7RU6FxL6bzh
	09msJpyyZ4FKDU1u/x1VmLJarXp3fVE3BOGNn4UN23XrsgEINorj
X-Google-Smtp-Source: AGHT+IFCigJK2WjL7FVPN2XkbVmqaeHaqnQ5f1BT79j73Jb4llrXAQ5s/hE5xWaauxcn7iEmbmGGDg==
X-Received: by 2002:a17:903:2284:b0:20b:fd73:32bb with SMTP id d9443c01a7336-20fb98f21d1mr11678555ad.2.1729760412547;
        Thu, 24 Oct 2024 02:00:12 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6e89sm68503615ad.277.2024.10.24.02.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:00:12 -0700 (PDT)
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
Subject: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
Date: Thu, 24 Oct 2024 16:59:19 +0800
Message-Id: <20241024085922.133071-7-tmyu0@nuvoton.com>
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

This driver supports Hardware monitor functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                   |   1 +
 drivers/hwmon/Kconfig         |  10 +
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/nct6694-hwmon.c | 407 ++++++++++++++++++++++++++++++++++
 4 files changed, 419 insertions(+)
 create mode 100644 drivers/hwmon/nct6694-hwmon.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 63387c0d4ab6..2aa87ad84156 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16439,6 +16439,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
+F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/nct6694_canfd.c
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 08a3c863f80a..740e4afe6582 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1625,6 +1625,16 @@ config SENSORS_NCT6683
 	  This driver can also be built as a module. If so, the module
 	  will be called nct6683.
 
+config SENSORS_NCT6694
+	tristate "Nuvoton NCT6694 Hardware Monitor support"
+	depends on MFD_NCT6694
+	help
+	  Say Y here to support Nuvoton NCT6694 hardware monitoring
+	  functionality.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nct6694-hwmon.
+
 config SENSORS_NCT6775_CORE
 	tristate
 	select REGMAP
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 9554d2fdcf7b..729961176d00 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
 obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
 obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
 obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
+obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
 obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
 nct6775-objs			:= nct6775-platform.o
 obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
new file mode 100644
index 000000000000..7d7d22a650b0
--- /dev/null
+++ b/drivers/hwmon/nct6694-hwmon.c
@@ -0,0 +1,407 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 HWMON driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/hwmon.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/nct6694.h>
+
+#define DRVNAME "nct6694-hwmon"
+
+/* Host interface */
+#define REQUEST_RPT_MOD			0xFF
+#define REQUEST_HWMON_MOD		0x00
+
+/* Report Channel */
+#define HWMON_FIN_IDX(x)		(0x50 + ((x) * 2))
+#define HWMON_FIN_STS(x)		(0x6E + (x))
+#define HWMON_PWM_IDX(x)		(0x70 + (x))
+
+/* Message Channel*/
+/* Command 00h */
+#define REQUEST_HWMON_CMD0_LEN		0x40
+#define REQUEST_HWMON_CMD0_OFFSET	0x0000	/* OFFSET = SEL|CMD */
+#define HWMON_FIN_EN(x)			(0x04 + (x))
+#define HWMON_PWM_FREQ_IDX(x)		(0x30 + (x))
+/* Command 02h */
+#define REQUEST_HWMON_CMD2_LEN		0x90
+#define REQUEST_HWMON_CMD2_OFFSET	0x0002	/* OFFSET = SEL|CMD */
+#define HWMON_SMI_CTRL_IDX		0x00
+#define HWMON_FIN_LIMIT_IDX(x)		(0x70 + ((x) * 2))
+#define HWMON_CMD2_HYST_MASK		0x1F
+/* Command 03h */
+#define REQUEST_HWMON_CMD3_LEN		0x08
+#define REQUEST_HWMON_CMD3_OFFSET	0x0003	/* OFFSET = SEL|CMD */
+
+struct nct6694_hwmon_data {
+	struct nct6694 *nct6694;
+
+	/* Make sure read & write commands are consecutive */
+	struct mutex hwmon_lock;
+};
+
+#define NCT6694_HWMON_FAN_CONFIG (HWMON_F_ENABLE | HWMON_F_INPUT | \
+				  HWMON_F_MIN | HWMON_F_MIN_ALARM)
+#define NCT6694_HWMON_PWM_CONFIG (HWMON_PWM_INPUT | HWMON_PWM_FREQ)
+
+static const struct hwmon_channel_info *nct6694_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   NCT6694_HWMON_FAN_CONFIG,	/* FIN0 */
+			   NCT6694_HWMON_FAN_CONFIG,	/* FIN1 */
+			   NCT6694_HWMON_FAN_CONFIG,	/* FIN2 */
+			   NCT6694_HWMON_FAN_CONFIG,	/* FIN3 */
+			   NCT6694_HWMON_FAN_CONFIG,	/* FIN4 */
+			   NCT6694_HWMON_FAN_CONFIG,	/* FIN5 */
+			   NCT6694_HWMON_FAN_CONFIG,	/* FIN6 */
+			   NCT6694_HWMON_FAN_CONFIG,	/* FIN7 */
+			   NCT6694_HWMON_FAN_CONFIG,	/* FIN8 */
+			   NCT6694_HWMON_FAN_CONFIG),	/* FIN9 */
+
+	HWMON_CHANNEL_INFO(pwm,
+			   NCT6694_HWMON_PWM_CONFIG,	/* PWM0 */
+			   NCT6694_HWMON_PWM_CONFIG,	/* PWM1 */
+			   NCT6694_HWMON_PWM_CONFIG,	/* PWM2 */
+			   NCT6694_HWMON_PWM_CONFIG,	/* PWM3 */
+			   NCT6694_HWMON_PWM_CONFIG,	/* PWM4 */
+			   NCT6694_HWMON_PWM_CONFIG,	/* PWM5 */
+			   NCT6694_HWMON_PWM_CONFIG,	/* PWM6 */
+			   NCT6694_HWMON_PWM_CONFIG,	/* PWM7 */
+			   NCT6694_HWMON_PWM_CONFIG,	/* PWM8 */
+			   NCT6694_HWMON_PWM_CONFIG),	/* PWM9 */
+	NULL
+};
+
+static int nct6694_fan_read(struct device *dev, u32 attr, int channel,
+			    long *val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	unsigned char buf[2];
+	int ret;
+
+	switch (attr) {
+	case hwmon_fan_enable:
+		ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
+				       REQUEST_HWMON_CMD0_OFFSET,
+				       REQUEST_HWMON_CMD0_LEN,
+				       HWMON_FIN_EN(channel / 8),
+				       1, buf);
+		if (ret)
+			return -EINVAL;
+
+		*val = buf[0] & BIT(channel % 8) ? 1 : 0;
+
+		break;
+
+	case hwmon_fan_input:
+		ret = nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
+				       HWMON_FIN_IDX(channel), 2, 0,
+				       2, buf);
+		if (ret)
+			return -EINVAL;
+
+		*val = (buf[1] | (buf[0] << 8)) & 0xFFFF;
+
+		break;
+
+	case hwmon_fan_min:
+		ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
+				       REQUEST_HWMON_CMD2_OFFSET,
+				       REQUEST_HWMON_CMD2_LEN,
+				       HWMON_FIN_LIMIT_IDX(channel),
+				       2, buf);
+		if (ret)
+			return -EINVAL;
+
+		*val = (buf[1] | (buf[0] << 8)) & 0xFFFF;
+
+		break;
+
+	case hwmon_fan_min_alarm:
+		ret = nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
+				       HWMON_FIN_STS(channel / 8),
+				       1, 0, 1, buf);
+		if (ret)
+			return -EINVAL;
+
+		*val = buf[0] & BIT(channel % 8);
+
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int nct6694_pwm_read(struct device *dev, u32 attr, int channel,
+			    long *val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	unsigned char buf;
+	int ret;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		ret = nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
+				       HWMON_PWM_IDX(channel),
+				       1, 0, 1, &buf);
+		if (ret)
+			return -EINVAL;
+
+		*val = buf;
+
+		break;
+	case hwmon_pwm_freq:
+		ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
+				       REQUEST_HWMON_CMD0_OFFSET,
+				       REQUEST_HWMON_CMD0_LEN,
+				       HWMON_PWM_FREQ_IDX(channel),
+				       1, &buf);
+		if (ret)
+			return -EINVAL;
+
+		*val = buf * 25000 / 255;
+
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int nct6694_fan_write(struct device *dev, u32 attr, int channel,
+			     long val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] = {0};
+	unsigned char buf[REQUEST_HWMON_CMD2_LEN] = {0};
+	u16 fan_val = (u16)val;
+	int ret;
+
+	switch (attr) {
+	case hwmon_fan_enable:
+		mutex_lock(&data->hwmon_lock);
+		ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
+				       REQUEST_HWMON_CMD0_OFFSET,
+				       REQUEST_HWMON_CMD0_LEN, 0,
+				       REQUEST_HWMON_CMD0_LEN,
+				       enable_buf);
+		if (ret)
+			goto err;
+
+		if (val)
+			enable_buf[HWMON_FIN_EN(channel / 8)] |= BIT(channel % 8);
+		else
+			enable_buf[HWMON_FIN_EN(channel / 8)] &= ~BIT(channel % 8);
+
+		ret = nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
+					REQUEST_HWMON_CMD0_OFFSET,
+					REQUEST_HWMON_CMD0_LEN, enable_buf);
+		if (ret)
+			goto err;
+
+		break;
+
+	case hwmon_fan_min:
+		mutex_lock(&data->hwmon_lock);
+		ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
+				       REQUEST_HWMON_CMD2_OFFSET,
+				       REQUEST_HWMON_CMD2_LEN, 0,
+				       REQUEST_HWMON_CMD2_LEN, buf);
+		if (ret)
+			goto err;
+
+		buf[HWMON_FIN_LIMIT_IDX(channel)] = (u8)((fan_val >> 8) & 0xFF);
+		buf[HWMON_FIN_LIMIT_IDX(channel) + 1] = (u8)(fan_val & 0xFF);
+		ret = nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
+					REQUEST_HWMON_CMD2_OFFSET,
+					REQUEST_HWMON_CMD2_LEN, buf);
+		if (ret)
+			goto err;
+
+		break;
+
+	default:
+		ret = -EOPNOTSUPP;
+		goto err;
+	}
+
+err:
+	mutex_unlock(&data->hwmon_lock);
+	return ret;
+}
+
+static int nct6694_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_fan:	/* in RPM */
+		return nct6694_fan_read(dev, attr, channel, val);
+
+	case hwmon_pwm:	/* in value 0~255 */
+		return nct6694_pwm_read(dev, attr, channel, val);
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int nct6694_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_fan:
+		return nct6694_fan_write(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static umode_t nct6694_is_visible(const void *data, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_enable:
+		case hwmon_fan_min:
+			return 0644;
+
+		case hwmon_fan_input:
+		case hwmon_fan_min_alarm:
+			return 0444;
+
+		default:
+			return 0;
+		}
+
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+		case hwmon_pwm_freq:
+			return 0444;
+		default:
+			return 0;
+		}
+
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_ops nct6694_hwmon_ops = {
+	.is_visible = nct6694_is_visible,
+	.read = nct6694_read,
+	.write = nct6694_write,
+};
+
+static const struct hwmon_chip_info nct6694_chip_info = {
+	.ops = &nct6694_hwmon_ops,
+	.info = nct6694_info,
+};
+
+static int nct6694_hwmon_init(struct nct6694_hwmon_data *data)
+{
+	unsigned char buf[REQUEST_HWMON_CMD2_LEN] = {0};
+	int ret;
+
+	/* Set Fan input Real Time alarm mode */
+	mutex_lock(&data->hwmon_lock);
+	ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
+			       REQUEST_HWMON_CMD2_OFFSET,
+			       REQUEST_HWMON_CMD2_LEN, 0,
+			       REQUEST_HWMON_CMD2_LEN, buf);
+	if (ret)
+		goto err;
+
+	buf[HWMON_SMI_CTRL_IDX] = 0x02;
+
+	ret = nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
+				REQUEST_HWMON_CMD2_OFFSET,
+				REQUEST_HWMON_CMD2_LEN, buf);
+	if (ret)
+		goto err;
+
+err:
+	mutex_unlock(&data->hwmon_lock);
+	return ret;
+}
+
+static int nct6694_hwmon_probe(struct platform_device *pdev)
+{
+	struct nct6694_hwmon_data *data;
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	struct device *hwmon_dev;
+	int ret;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->nct6694 = nct6694;
+	mutex_init(&data->hwmon_lock);
+	platform_set_drvdata(pdev, data);
+
+	ret = nct6694_hwmon_init(data);
+	if (ret)
+		return -EIO;
+
+	/* Register hwmon device to HWMON framework */
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
+							 "nct6694", data,
+							 &nct6694_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev)) {
+		dev_err(&pdev->dev, "%s: Failed to register hwmon device!\n",
+			__func__);
+		return PTR_ERR(hwmon_dev);
+	}
+
+	return 0;
+}
+
+static struct platform_driver nct6694_hwmon_driver = {
+	.driver = {
+		.name	= DRVNAME,
+	},
+	.probe		= nct6694_hwmon_probe,
+};
+
+static int __init nct6694_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&nct6694_hwmon_driver);
+	if (!err) {
+		if (err)
+			platform_driver_unregister(&nct6694_hwmon_driver);
+	}
+
+	return err;
+}
+subsys_initcall(nct6694_init);
+
+static void __exit nct6694_exit(void)
+{
+	platform_driver_unregister(&nct6694_hwmon_driver);
+}
+module_exit(nct6694_exit);
+
+MODULE_DESCRIPTION("USB-HWMON driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


