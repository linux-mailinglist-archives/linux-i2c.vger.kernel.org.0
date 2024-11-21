Return-Path: <linux-i2c+bounces-8108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B154A9D47DF
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 07:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 715EE283CAB
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 06:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79ECA1C9DD3;
	Thu, 21 Nov 2024 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xk4K+e3h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1485B1D042A;
	Thu, 21 Nov 2024 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171288; cv=none; b=I90JnUMnkV1hFSt0pdn0zfvVCKdOfjhfBdtKhx2BmKiJjid11Qw5gwNXdN9WzaKRB82mV+Wydoc+Zfjr0e70pZxCQTQt9z9elBUlvTk9yNhm/LsMeVIyzT39MKatsiMXgRUWtdggXdYhG2S+1XrE7fvqRwMDgOvZVw4NBBsQZxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171288; c=relaxed/simple;
	bh=Y09MsOcz5N8twanN9PbHOUroV8Dkaa4xvJyyxIyGm4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ACsLSEMLYvwz1/wUzs9BF4wkB2GaEL9F3ieF8O/TV4mZT2uAldssXXdK5DK4iYfgOQhIAiufoLIH5QxgZhyEZu/iJR4MS0lse75XoVGB8qSVX9Z8nySW5cSZBKdDZbyYcfCWkK/Doip+/7N0875RJC442S1WXANpD+sYUI6MOpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xk4K+e3h; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7240fa50694so534564b3a.1;
        Wed, 20 Nov 2024 22:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732171285; x=1732776085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnPml4GDk6hNaNBzUXJnTs1TMG9m0w9bAhxENq0oaX8=;
        b=Xk4K+e3hDBNBt94TY+azdeZ4wXm+1GmOpXAxrjkwlULMQ6UgFfeSQ7OoVIhzqdtSVw
         SLvIHdDTtXzMjDI9lmPkhWAiRjZFIFd/Ya/Mn/SKwcQGhETta6qb39JKRrFuEbRkgWMr
         z78nAQEtmxZfFqCaW4DmFOLPEmvnwuVGrmjKpAjSJCyoXvA5+aLgxDZRAJbFyDgv03Jy
         Ep0lQR17xW3qpwwe12mhLXpnLs+XpPLQRx7mcl+0uwG8QUDp911NggZqOvF0/8datdXV
         W9DA/qcLsIEUQM726bNGifC4EFf6859+baY8uZfjkZwglSpGpP+LmYS1bUYClHFnDS4B
         EP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732171285; x=1732776085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnPml4GDk6hNaNBzUXJnTs1TMG9m0w9bAhxENq0oaX8=;
        b=NHkvvXhKiUkiQBgFYEbF6H7JZD7NvA1mAkN/8AeEN2YiD1iFx+1sFu+12TlF3PJuBM
         fi6ygmc4yVCMCspZlNVyeEHvhH9vndGWAIJcdC+iLSBXTpkRL1bSNEqmSlnIbCYQpKFm
         0Uqs4fz8k6QFsowTy447WZs8pEB/lgLqp6ctczyNSVPZHSivK2En1qTadho59TjVMiMZ
         c3SqRjVL924cm4eOfZWvfFTO5olCfLS6TJCiCl5k6H8cX+dSe+ut/D8Qnzy8eiYbpI+O
         o83zGYKoufnzkMLqF7Fst/snTPK4RNV/cCKiwQ/L3rh77YoiIgE0M1zMJpEbT3L1Lb4I
         K+8w==
X-Forwarded-Encrypted: i=1; AJvYcCUMkSeiIQWM1IuDvcy+OmblV7BdjOGzmurX5C5aZTumPJ3bLAqlWvLZMM6JJFOEk5B6e3NqmFO1u2ub@vger.kernel.org, AJvYcCURR/5XBWsXSSkcN6ZnbogXO8KnO63kPYT4Kbv7MOQ24DFrSaAi3SymTANabdGCQ6bLMhCPyyOR@vger.kernel.org, AJvYcCV7nQ2PQmot0W0D90e6HYLKrK4dgYsHfgvmUwU1qSRnlNeY8vH9nAaS9WV5t2pM0mF4BJuUlS0RLyUcBek=@vger.kernel.org, AJvYcCVP2OvrAdPdlGn8GovDvbzIC2jc1oISCPFsLk6aWpxFGxtKjwumYbZ+cTtgMRrl6A95IwLPfhydEz6gkg==@vger.kernel.org, AJvYcCVj0iPReScvz8DQJRryNqCFz5L0F7L5tdE9rFf7C7LVUgBghVMJVa1CBj3FsDAdcNHf1N30uqFqGDVJezRKj5c=@vger.kernel.org, AJvYcCWjzFRuOW+8/MBIFoMbFmH9xWvKOd4LVfSwgKg/ED5CAIm2g8NkLpHUMh8Mz9CAPiHBJvM5z3M8K5U=@vger.kernel.org, AJvYcCWyDIHm6IMk6V9sKsUNRB7emf9DE1Icb3uIHHArFItDc80cxdIMvJLfW9TUacdXKj7tN+OMrBUesTrG@vger.kernel.org
X-Gm-Message-State: AOJu0YzOho/DhdqjXbJRzZiK+dOUg42+8s4U9tBHW44Elzks41DRAf1y
	jBG/wp1gxwGNg+M5jqlxFt4a8X8ZjsA5M36ecMqJCmUYqHgYyWdP
X-Google-Smtp-Source: AGHT+IG8Fdb2YHTSefimQ0ER5THBYqNERK9PbK2GVaDkK4875tHx2p3fh5yqUpLWJzyiPaJpeOI5fg==
X-Received: by 2002:a05:6a00:852:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-724beca4215mr8245617b3a.8.1732171285078;
        Wed, 20 Nov 2024 22:41:25 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beeb83d4sm2812530b3a.40.2024.11.20.22.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:41:24 -0800 (PST)
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
Subject: [PATCH v2 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
Date: Thu, 21 Nov 2024 14:40:45 +0800
Message-Id: <20241121064046.3724726-7-tmyu0@nuvoton.com>
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

This driver supports Hardware monitor functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                   |   1 +
 drivers/hwmon/Kconfig         |  10 +
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/nct6694-hwmon.c | 771 ++++++++++++++++++++++++++++++++++
 4 files changed, 783 insertions(+)
 create mode 100644 drivers/hwmon/nct6694-hwmon.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 496fe7d5a23f..d6414eea0463 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16546,6 +16546,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
+F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/nct6694_canfd.c
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index dd376602f3f1..df40986424bd 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1636,6 +1636,16 @@ config SENSORS_NCT6683
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
index b827b92f2a78..27a43e67cdb7 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -168,6 +168,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
 obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
 obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
 obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
+obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
 obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
 nct6775-objs			:= nct6775-platform.o
 obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
new file mode 100644
index 000000000000..f24cc22b8b42
--- /dev/null
+++ b/drivers/hwmon/nct6694-hwmon.c
@@ -0,0 +1,771 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 HWMON driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+/* Host interface */
+#define NCT6694_RPT_MOD			0xFF
+#define NCT6694_HWMON_MOD		0x00
+#define NCT6694_PWM_MOD			0x01
+
+/* Report Channel */
+#define NCT6694_VIN_IDX(x)		(0x00 + (x))
+#define NCT6694_TIN_IDX(x)			\
+	({ typeof(x) (_x) = (x);		\
+	 ((_x) < 10) ? (0x10 + ((_x) * 2)) :	\
+	 (0x30 + (((_x) - 10) * 2)); })
+#define NCT6694_FIN_IDX(x)		(0x50 + ((x) * 2))
+#define NCT6694_PWM_IDX(x)		(0x70 + (x))
+#define NCT6694_VIN_STS(x)		(0x68 + (x))
+#define NCT6694_TIN_STS(x)		(0x6A + (x))
+#define NCT6694_FIN_STS(x)		(0x6E + (x))
+
+/* Message Channel*/
+/* HWMON Command */
+/* Command 00h */
+#define NCT6694_HWMON_CMD0_LEN		0x40
+#define NCT6694_HWMON_CMD0_OFFSET	0x0000	/* OFFSET = SEL|CMD */
+#define NCT6694_VIN_EN(x)		(0x00 + (x))
+#define NCT6694_TIN_EN(x)		(0x02 + (x))
+#define NCT6694_FIN_EN(x)		(0x04 + (x))
+#define NCT6694_PWM_EN(x)		(0x06 + (x))
+#define NCT6694_PWM_FREQ_IDX(x)		(0x30 + (x))
+/* Command 02h */
+#define NCT6694_HWMON_CMD2_LEN		0x90
+#define NCT6694_HWMON_CMD2_OFFSET	0x0002	/* OFFSET = SEL|CMD */
+#define NCT6694_SMI_CTRL_IDX		0x00
+#define NCT6694_VIN_HL(x)		(0x10 + ((x) * 2))
+#define NCT6694_VIN_LL(x)		(0x11 + ((x) * 2))
+#define NCT6694_TIN_HYST(x)		(0x30 + ((x) * 2))
+#define NCT6694_TIN_HL(x)		(0x31 + ((x) * 2))
+#define NCT6694_FIN_HL(x)		(0x70 + ((x) * 2))
+#define NCT6694_FIN_LL(x)		(0x71 + ((x) * 2))
+/* PWM Command */
+#define NCT6694_PWM_CMD1_LEN		0x18
+#define NCT6694_PWM_CMD1_OFFSET		0x0001
+#define NCT6694_MAL_VAL(x)		(0x02 + (x))
+
+#define NCT6694_FREQ_FROM_REG(reg)	((reg) * 25000 / 255)
+#define NCT6694_FREQ_TO_REG(val)	\
+	(DIV_ROUND_CLOSEST(clamp_val((val), 100, 25000) * 255, 25000))
+
+#define NCT6694_LSB_REG_MASK		GENMASK(7, 5)
+#define NCT6694_TIN_HYST_MASK		GENMASK(7, 5)
+
+static inline long in_from_reg(u8 reg)
+{
+	return reg * 16;
+}
+
+static inline u8 in_to_reg(long val)
+{
+	if (val <= 0)
+		return 0;
+	return val / 16;
+}
+
+static inline long temp_from_reg(u8 reg)
+{
+	return reg * 1000;
+}
+
+static inline u8 temp_to_reg(long val)
+{
+	return val / 1000;
+}
+
+struct nct6694_hwmon_data {
+	struct nct6694 *nct6694;
+	struct mutex lock;
+	unsigned char *xmit_buf;
+	unsigned char hwmon_en[NCT6694_HWMON_CMD0_LEN];
+};
+
+#define NCT6694_HWMON_IN_CONFIG (HWMON_I_INPUT | HWMON_I_ENABLE |	\
+				 HWMON_I_MAX | HWMON_I_MIN |		\
+				 HWMON_I_ALARM)
+#define NCT6694_HWMON_TEMP_CONFIG (HWMON_T_INPUT | HWMON_T_ENABLE |	\
+				   HWMON_T_MAX | HWMON_T_MAX_HYST |	\
+				   HWMON_T_MAX_ALARM)
+#define NCT6694_HWMON_FAN_CONFIG (HWMON_F_INPUT | HWMON_F_ENABLE |	\
+				  HWMON_F_MIN | HWMON_F_MIN_ALARM)
+#define NCT6694_HWMON_PWM_CONFIG (HWMON_PWM_INPUT | HWMON_PWM_ENABLE |	\
+				  HWMON_PWM_FREQ)
+static const struct hwmon_channel_info *nct6694_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   NCT6694_HWMON_IN_CONFIG,	/* VIN0 */
+			   NCT6694_HWMON_IN_CONFIG,	/* VIN1 */
+			   NCT6694_HWMON_IN_CONFIG,	/* VIN2 */
+			   NCT6694_HWMON_IN_CONFIG,	/* VIN3 */
+			   NCT6694_HWMON_IN_CONFIG,	/* VIN5 */
+			   NCT6694_HWMON_IN_CONFIG,	/* VIN6 */
+			   NCT6694_HWMON_IN_CONFIG,	/* VIN7 */
+			   NCT6694_HWMON_IN_CONFIG,	/* VIN14 */
+			   NCT6694_HWMON_IN_CONFIG,	/* VIN15 */
+			   NCT6694_HWMON_IN_CONFIG,	/* VIN16 */
+			   NCT6694_HWMON_IN_CONFIG,	/* VBAT */
+			   NCT6694_HWMON_IN_CONFIG,	/* VSB */
+			   NCT6694_HWMON_IN_CONFIG,	/* AVSB */
+			   NCT6694_HWMON_IN_CONFIG,	/* VCC */
+			   NCT6694_HWMON_IN_CONFIG,	/* VHIF */
+			   NCT6694_HWMON_IN_CONFIG),	/* VTT */
+
+	HWMON_CHANNEL_INFO(temp,
+			   NCT6694_HWMON_TEMP_CONFIG,	/* THR1 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* THR2 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* THR14 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* THR15 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* THR16 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP0 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP1 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP2 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP3 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP4 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN0 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN1 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN2 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN3 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN4 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN5 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN6 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN7 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN8 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN9 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN10 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN11 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN12 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN13 */
+			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN14 */
+			   NCT6694_HWMON_TEMP_CONFIG),	/* DTIN15 */
+
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
+static int nct6694_in_read(struct device *dev, u32 attr, int channel,
+			   long *val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	unsigned char vin_en;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	switch (attr) {
+	case hwmon_in_enable:
+		vin_en = data->hwmon_en[NCT6694_VIN_EN(channel / 8)];
+		*val = vin_en & BIT(channel % 8) ? 1 : 0;
+
+		return 0;
+	case hwmon_in_input:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_VIN_IDX(channel), 1,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		*val = in_from_reg(data->xmit_buf[0]);
+
+		return 0;
+	case hwmon_in_max:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_CMD2_OFFSET,
+				       NCT6694_HWMON_CMD2_LEN,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		*val = in_from_reg(data->xmit_buf[NCT6694_VIN_HL(channel)]);
+
+		return 0;
+	case hwmon_in_min:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_CMD2_OFFSET,
+				       NCT6694_HWMON_CMD2_LEN,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		*val = in_from_reg(data->xmit_buf[NCT6694_VIN_LL(channel)]);
+
+		return 0;
+	case hwmon_in_alarm:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_VIN_STS(channel / 8), 1,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		*val = !!(data->xmit_buf[0] & BIT(channel % 8));
+
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_temp_read(struct device *dev, u32 attr, int channel,
+			     long *val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	unsigned char temp_en, temp_hyst;
+	int ret, int_part, frac_part;
+	signed char temp_max;
+
+	guard(mutex)(&data->lock);
+
+	switch (attr) {
+	case hwmon_temp_enable:
+		temp_en = data->hwmon_en[NCT6694_TIN_EN(channel / 8)];
+		*val = temp_en & BIT(channel % 8) ? 1 : 0;
+
+		return 0;
+	case hwmon_temp_input:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_TIN_IDX(channel), 2,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		int_part = sign_extend32(data->xmit_buf[0], 7);
+		frac_part = FIELD_GET(NCT6694_LSB_REG_MASK, data->xmit_buf[1]);
+		if (int_part < 0)
+			*val = (int_part + 1) * 1000 - (8 - frac_part) * 125;
+		else
+			*val = int_part * 1000 + frac_part * 125;
+
+		return 0;
+	case hwmon_temp_max:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_CMD2_OFFSET,
+				       NCT6694_HWMON_CMD2_LEN,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		*val = temp_from_reg(data->xmit_buf[NCT6694_TIN_HL(channel)]);
+
+		return 0;
+	case hwmon_temp_max_hyst:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_CMD2_OFFSET,
+				       NCT6694_HWMON_CMD2_LEN,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		temp_max = (signed char)data->xmit_buf[NCT6694_TIN_HL(channel)];
+		temp_hyst = FIELD_GET(NCT6694_TIN_HYST_MASK,
+				      data->xmit_buf[NCT6694_TIN_HYST(channel)]);
+		if (temp_max < 0)
+			*val = temp_from_reg(temp_max + temp_hyst);
+		else
+			*val = temp_from_reg(temp_max - temp_hyst);
+
+		return 0;
+	case hwmon_temp_max_alarm:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_TIN_STS(channel / 8), 1,
+					   data->xmit_buf);
+		if (ret)
+			return ret;
+
+		*val = !!(data->xmit_buf[0] & BIT(channel % 8));
+
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_fan_read(struct device *dev, u32 attr, int channel,
+			    long *val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	unsigned char fanin_en;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	switch (attr) {
+	case hwmon_fan_enable:
+		fanin_en = data->hwmon_en[NCT6694_FIN_EN(channel / 8)];
+		*val = fanin_en & BIT(channel % 8) ? 1 : 0;
+
+		return 0;
+	case hwmon_fan_input:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_FIN_IDX(channel), 2,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		*val = (data->xmit_buf[1] |
+		       (data->xmit_buf[0] << 8)) & 0xFFFF;
+
+		return 0;
+	case hwmon_fan_min:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_CMD2_OFFSET,
+				       NCT6694_HWMON_CMD2_LEN,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		*val = (data->xmit_buf[NCT6694_FIN_LL(channel)] |
+			data->xmit_buf[NCT6694_FIN_HL(channel)] << 8) & 0xFFFF;
+
+		return 0;
+	case hwmon_fan_min_alarm:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_FIN_STS(channel / 8),
+				       1, data->xmit_buf);
+		if (ret)
+			return ret;
+
+		*val = data->xmit_buf[0] & BIT(channel % 8);
+
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_pwm_read(struct device *dev, u32 attr, int channel,
+			    long *val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	unsigned char pwm_en;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		pwm_en = data->hwmon_en[NCT6694_PWM_EN(channel / 8)];
+		*val = pwm_en & BIT(channel % 8) ? 1 : 0;
+
+		return 0;
+	case hwmon_pwm_input:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_PWM_IDX(channel),
+				       1, data->xmit_buf);
+		if (ret)
+			return ret;
+
+		*val = data->xmit_buf[0];
+
+		return 0;
+	case hwmon_pwm_freq:
+		*val = NCT6694_FREQ_FROM_REG(data->hwmon_en[NCT6694_PWM_FREQ_IDX(channel)]);
+
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_enable_channel(struct device *dev, u8 reg,
+				  int channel, long val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+
+	if (val == 0)
+		data->hwmon_en[reg] &= ~BIT(channel % 8);
+	else if (val == 1)
+		data->hwmon_en[reg] |= BIT(channel % 8);
+	else
+		return -EINVAL;
+
+	return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+				 NCT6694_HWMON_CMD0_OFFSET,
+				 NCT6694_HWMON_CMD0_LEN,
+				 data->hwmon_en);
+}
+
+static int nct6694_in_write(struct device *dev, u32 attr, int channel,
+			    long val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	switch (attr) {
+	case hwmon_in_enable:
+		return nct6694_enable_channel(dev, NCT6694_VIN_EN(channel / 8),
+					      channel, val);
+	case hwmon_in_max:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_CMD2_OFFSET,
+				       NCT6694_HWMON_CMD2_LEN,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		val = clamp_val(val, 0, 2032);
+		data->xmit_buf[NCT6694_VIN_HL(channel)] = in_to_reg(val);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CMD2_OFFSET,
+					 NCT6694_HWMON_CMD2_LEN,
+					 data->xmit_buf);
+	case hwmon_in_min:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_CMD2_OFFSET,
+				       NCT6694_HWMON_CMD2_LEN,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		val = clamp_val(val, 0, 2032);
+		data->xmit_buf[NCT6694_VIN_LL(channel)] = in_to_reg(val);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CMD2_OFFSET,
+					 NCT6694_HWMON_CMD2_LEN,
+					 data->xmit_buf);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_temp_write(struct device *dev, u32 attr, int channel,
+			      long val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	signed char temp_max, temp_hyst;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	switch (attr) {
+	case hwmon_temp_enable:
+		return nct6694_enable_channel(dev, NCT6694_TIN_EN(channel / 8),
+					      channel, val);
+	case hwmon_temp_max:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_CMD2_OFFSET,
+				       NCT6694_HWMON_CMD2_LEN,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		val = clamp_val(val, -127000, 127000);
+		data->xmit_buf[NCT6694_TIN_HL(channel)] = temp_to_reg(val);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CMD2_OFFSET,
+					 NCT6694_HWMON_CMD2_LEN,
+					 data->xmit_buf);
+	case hwmon_temp_max_hyst:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_CMD2_OFFSET,
+				       NCT6694_HWMON_CMD2_LEN,
+				       data->xmit_buf);
+
+		val = clamp_val(val, -127000, 127000);
+		temp_max = (signed char)data->xmit_buf[NCT6694_TIN_HL(channel)];
+		temp_hyst = (temp_max < 0) ? (temp_max + val / 1000) :
+					     (temp_max - val / 1000);
+		if (temp_hyst < 0 || temp_hyst > 7)
+			return -EINVAL;
+
+		data->xmit_buf[NCT6694_TIN_HYST(channel)] =
+		       (data->xmit_buf[NCT6694_TIN_HYST(channel)] & ~NCT6694_TIN_HYST_MASK) |
+		       FIELD_PREP(NCT6694_TIN_HYST_MASK, temp_hyst);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CMD2_OFFSET,
+					 NCT6694_HWMON_CMD2_LEN,
+					 data->xmit_buf);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_fan_write(struct device *dev, u32 attr, int channel,
+			     long val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	switch (attr) {
+	case hwmon_fan_enable:
+		return nct6694_enable_channel(dev, NCT6694_FIN_EN(channel / 8),
+					      channel, val);
+	case hwmon_fan_min:
+		if (val <= 0)
+			return -EINVAL;
+
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_CMD2_OFFSET,
+				       NCT6694_HWMON_CMD2_LEN,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		val = clamp_val(val, 1, 65535);
+		data->xmit_buf[NCT6694_FIN_HL(channel)] = (u8)((val >> 8) & 0xFF);
+		data->xmit_buf[NCT6694_FIN_LL(channel)] = (u8)(val & 0xFF);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CMD2_OFFSET,
+					 NCT6694_HWMON_CMD2_LEN,
+					 data->xmit_buf);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_pwm_write(struct device *dev, u32 attr, int channel,
+			     long val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		return nct6694_enable_channel(dev, NCT6694_PWM_EN(channel / 8),
+					      channel, val);
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255)
+			return -EINVAL;
+
+		ret = nct6694_read_msg(data->nct6694, NCT6694_PWM_MOD,
+				       NCT6694_PWM_CMD1_OFFSET,
+				       NCT6694_PWM_CMD1_LEN,
+				       data->xmit_buf);
+		if (ret)
+			return ret;
+
+		data->xmit_buf[NCT6694_MAL_VAL(channel)] = val;
+
+		return nct6694_write_msg(data->nct6694, NCT6694_PWM_MOD,
+					 NCT6694_PWM_CMD1_OFFSET,
+					 NCT6694_PWM_CMD1_LEN,
+					 data->xmit_buf);
+	case hwmon_pwm_freq:
+		data->hwmon_en[NCT6694_PWM_FREQ_IDX(channel)] = NCT6694_FREQ_TO_REG(val);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CMD0_OFFSET,
+					 NCT6694_HWMON_CMD0_LEN,
+					 data->hwmon_en);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_in:	/* in mV */
+		return nct6694_in_read(dev, attr, channel, val);
+	case hwmon_temp:/* in mC */
+		return nct6694_temp_read(dev, attr, channel, val);
+	case hwmon_fan:	/* in RPM */
+		return nct6694_fan_read(dev, attr, channel, val);
+	case hwmon_pwm:	/* in value 0~255 */
+		return nct6694_pwm_read(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_in:
+		return nct6694_in_write(dev, attr, channel, val);
+	case hwmon_temp:
+		return nct6694_temp_write(dev, attr, channel, val);
+	case hwmon_fan:
+		return nct6694_fan_write(dev, attr, channel, val);
+	case hwmon_pwm:
+		return nct6694_pwm_write(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t nct6694_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_enable:
+		case hwmon_in_max:
+		case hwmon_in_min:
+			return 0644;
+		case hwmon_in_alarm:
+		case hwmon_in_input:
+			return 0444;
+		default:
+			return 0;
+		}
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_enable:
+		case hwmon_temp_max:
+		case hwmon_temp_max_hyst:
+			return 0644;
+		case hwmon_temp_input:
+		case hwmon_temp_max_alarm:
+			return 0444;
+		default:
+			return 0;
+		}
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_enable:
+		case hwmon_fan_min:
+			return 0644;
+		case hwmon_fan_input:
+		case hwmon_fan_min_alarm:
+			return 0444;
+		default:
+			return 0;
+		}
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_enable:
+		case hwmon_pwm_freq:
+		case hwmon_pwm_input:
+			return 0644;
+		default:
+			return 0;
+		}
+	default:
+		return 0;
+	}
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
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	/*
+	 *  Record each Hardware Monitor Channel enable status
+	 *  and PWM frequency register
+	 */
+	ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+			       NCT6694_HWMON_CMD0_OFFSET,
+			       NCT6694_HWMON_CMD0_LEN,
+			       data->hwmon_en);
+	if (ret)
+		return ret;
+
+	/* Set Fan input Real Time alarm mode */
+	ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+			       NCT6694_HWMON_CMD2_OFFSET,
+			       NCT6694_HWMON_CMD2_LEN,
+			       data->xmit_buf);
+	if (ret)
+		return ret;
+
+	data->xmit_buf[NCT6694_SMI_CTRL_IDX] = 0x02;
+
+	return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+				 NCT6694_HWMON_CMD2_OFFSET,
+				 NCT6694_HWMON_CMD2_LEN,
+				 data->xmit_buf);
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
+	data->xmit_buf = devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
+				      sizeof(unsigned char), GFP_KERNEL);
+	if (!data->xmit_buf)
+		return -ENOMEM;
+
+	data->nct6694 = nct6694;
+	mutex_init(&data->lock);
+	platform_set_drvdata(pdev, data);
+
+	ret = nct6694_hwmon_init(data);
+	if (ret)
+		return ret;
+
+	/* Register hwmon device to HWMON framework */
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
+							 "nct6694", data,
+							 &nct6694_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct platform_driver nct6694_hwmon_driver = {
+	.driver = {
+		.name	= "nct6694-hwmon",
+	},
+	.probe		= nct6694_hwmon_probe,
+};
+
+module_platform_driver(nct6694_hwmon_driver);
+
+MODULE_DESCRIPTION("USB-HWMON driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


