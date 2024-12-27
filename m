Return-Path: <linux-i2c+bounces-8748-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C19FD2DB
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07EBD18815CD
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 10:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DEC192B79;
	Fri, 27 Dec 2024 09:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGIcjcxg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAD219005D;
	Fri, 27 Dec 2024 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735293493; cv=none; b=io0/x2RxyIVPpAVQSsy/8+JlpP03y50kND0WcDc7Xsv51fVX8S1A5QImtpcyeuS9ORv28Sw7twUAiu/Cbc5v4K1tbscoHcJBOINd5MUV4V6WA0SvzwIyNJarhgF1k0HtL8QUn7S/EGWGYup5fMz6j2gP41l8NrEMOevuosr2eaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735293493; c=relaxed/simple;
	bh=3wd6YDMCoq6xQENr/p9KfioqU56nDfOHXwHoB2GfPBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XsgNXoqL9xljy0UVawr4uGZyOih4pTNpXag2gwSnDABIToeQaHKEBDFTPZn/zOrKd+jdSHMlZzadJ44kJZuQOMTQjHqDj+EdwAY2dQDpWUvNBDsTOYw2qudiwu3+ejA01yQ5qv6U+AJdIIJvmxyuQmjeohlpzOKKc47OChXnLyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGIcjcxg; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f44353649aso7028910a91.0;
        Fri, 27 Dec 2024 01:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735293491; x=1735898291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mme3B7VdhA7hPX6xHY7jG4qoa95mGYpdP3Rmc8mP1PM=;
        b=YGIcjcxgibT8S3L/+xt76OSq+2acXVhOxSoM4shDT5p/wBlXrhJxSueJncv8jPo9jr
         0O6OZlUcPqYtz81PhpMDvbR5/qw1HYWAIxCC6+O9p4mPcCnjtEazvn1On35cihiuqh0b
         exhiangNwMgnXBqPG7scEtadkBeefpLqGJ6EGzaAjveo9VZUJesCL5OGOTV64lUDO6UY
         DhR93Z2rrAdnvADdL29cOuaSyJHZN5GYD+74xJDncE4OPx9+5ElfvcXWkW+l+PmANvaQ
         OUFdg+gn/OGe7yjafU3VEtotecPEVvMFD7XFeNv7cw4A8GdGKA4bIBc3qSac0JzEuNSg
         ngBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735293491; x=1735898291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mme3B7VdhA7hPX6xHY7jG4qoa95mGYpdP3Rmc8mP1PM=;
        b=RO0BavofjWr0uwtmMuqMbZXbk/ZKBNNuHBb5w1djeqDr50I5XcKiT3e8IlNlwNHjn7
         CCoT9yRFYHEJ8v28+Dp3rRN7xT4w5NUQnF5dSil62SIcs4Gve2FuAPv1G4kHCnxRPVO7
         AH+uW/8gBXt+pHg/BoCYoyTlpzEzz1duxATx9b9wmAR3wJ9UBnLFHaJoRZaBWoWw/4SB
         cT+FOhXOsX6fPy9uxJMQI6egznBFpqkS1y2S+wezIzXKIH4hbaCE/PZkuNYWF4y9Mgu1
         kMl3ChRfkjssIiPSF20dN8YbLEV+7sTr3L+FPRWvEsddlBNh/hjVn6L26DcWmSe3fMV0
         6JnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/8I8fGL7vAL5pgfDP2B08DqKx/PIpigzHzjLwYf/B4+FYnCBAj0yJU4Wa+NZ6gd5IzlaKVCtI1veB@vger.kernel.org, AJvYcCUM6PnFhmGt22qreut6xlTSlLapuqcly+NVc+E1S4obnazj4DvPWiPoZQNa+qRpldazh+bpecr6v5MhNUg=@vger.kernel.org, AJvYcCVM3mAPkbHy6oOY7pVEbX7Fda2WJE3bMJrfVTOdPNhPERmdXMzFGZYfhbIIQ4QrM28gz8GdMn2Rk5E=@vger.kernel.org, AJvYcCVk1eyJV1udUG9qJ4Scq2sR5KM6dSi8wS+1tb97rQ5XjRxyRk51hclDOfXVYZNa13gm6MgTdWLE@vger.kernel.org, AJvYcCW1E7C61SukydLvOkNOJ+KorzWnp1sKoVdQujA+vSxp1KvedZgw5F0zjpaqTBVX863n0nMSDsT7x9FUBEC9YrQ=@vger.kernel.org, AJvYcCX3lsZhBGpRACHgjnnd+zmHFV4rOVnGIvmwp0G669lph1hDfbXkVkpNZ4oqrcoTRKnSSQX9b4sejRcJOw==@vger.kernel.org, AJvYcCXofrJYr4QGcGwUowrj7l92XXB1YPcVkS0H9dEwoVGWxtwAZHP/9ccujq3XvYUvwSTCQ/DZNJF0lvAN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2XBE+26HHfbnkdF4rQsqhjG4XpWwe1yi2M7WKL4zZU0Ftmolp
	SV7ybCgLa/lTAIGYtnSg7prczJeCMUcaFM3v9EiWAxQQj/jkx/xq
X-Gm-Gg: ASbGnctEiTQqcjQ3h5y4JoVozTx+SdqmGmDjKoNBqfn/JCg6d7qW8itf6qdCzRcpmXL
	kuiS25jH6VmSo40x7E4MMAhlYdhhr11MyxePZlntUpozQMlM/LetVc42tZRcvD2TcJ4dae3XKdn
	/DHOskVXfoGHYdTd7VeFYXPF5x2iajEjcxTmgad0IK+uYz6GouywlfvyvoNxrYuiSScGaQKz5FN
	QHYZsiHq54r0fi2xDZvRsltbsob3Qnh2XMpfLYoCEpCVkx2iLCcpCvVgwi7T1DlJfiUHuUMgUAt
	77sdBtdjCqEgAsa5KHVCSD/Z
X-Google-Smtp-Source: AGHT+IFsRWVcAe4IKdUxg4C4JalCFSB245PXQ8PR8vnuMazUIoR6ePzZEP1n2s4kX0swFGm1O9RM/w==
X-Received: by 2002:a17:90b:54d0:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-2f452e4d0bdmr39672931a91.20.1735293490670;
        Fri, 27 Dec 2024 01:58:10 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm131581135ad.187.2024.12.27.01.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 01:58:10 -0800 (PST)
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
Subject: [PATCH v4 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
Date: Fri, 27 Dec 2024 17:57:26 +0800
Message-Id: <20241227095727.2401257-7-a0282524688@gmail.com>
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

This driver supports Hardware monitor functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 MAINTAINERS                   |   1 +
 drivers/hwmon/Kconfig         |  10 +
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/nct6694-hwmon.c | 851 ++++++++++++++++++++++++++++++++++
 4 files changed, 863 insertions(+)
 create mode 100644 drivers/hwmon/nct6694-hwmon.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 254c01a6bba1..e5c65e382141 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16727,6 +16727,7 @@ M:	Ming Yu <tmyu0@nuvoton.com>
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
index 000000000000..a11d495e2875
--- /dev/null
+++ b/drivers/hwmon/nct6694-hwmon.c
@@ -0,0 +1,851 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 HWMON driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+/*
+ * USB command module type for NCT6694 report channel
+ * This defines the module type used for communication with the NCT6694
+ * report channel over the USB interface.
+ */
+#define NCT6694_RPT_MOD			0xFF
+
+/* Report channel */
+/*
+ * The report channel is used to report the status of the hardware monitor
+ * devices, such as voltage, temperature, fan speed, and PWM.
+ */
+#define NCT6694_VIN_IDX(x)		(0x00 + (x))		/* OFFSET */
+#define NCT6694_TIN_IDX(x)			\
+	({ typeof(x) (_x) = (x);		\
+	 ((_x) < 10) ? (0x10 + ((_x) * 2)) :	\
+	 (0x30 + (((_x) - 10) * 2)); })				/* OFFSET */
+#define NCT6694_FIN_IDX(x)		(0x50 + ((x) * 2))	/* OFFSET */
+#define NCT6694_PWM_IDX(x)		(0x70 + (x))		/* OFFSET */
+#define NCT6694_VIN_STS(x)		(0x68 + (x))		/* OFFSET */
+#define NCT6694_TIN_STS(x)		(0x6A + (x))		/* OFFSET */
+#define NCT6694_FIN_STS(x)		(0x6E + (x))		/* OFFSET */
+
+/*
+ * USB command module type for NCT6694 HWMON controller.
+ * This defines the module type used for communication with the NCT6694
+ * HWMON controller over the USB interface.
+ */
+#define NCT6694_HWMON_MOD		0x00
+
+/* Command 00h - Hardware Monitor Control */
+#define NCT6694_HWMON_CONTROL	        0x0000	/* SEL|CMD */
+
+/* Command 02h - Alarm Control */
+#define NCT6694_HWMON_ALARM	        0x0002	/* SEL|CMD */
+
+/*
+ * USB command module type for NCT6694 PWM controller.
+ * This defines the module type used for communication with the NCT6694
+ * PWM controller over the USB interface.
+ */
+#define NCT6694_PWM_MOD			0x01
+
+/* PWM Command - Manual Control */
+#define NCT6694_PWM_CONTROL	        0x0001	/* SEL|CMD */
+
+#define NCT6694_FREQ_FROM_REG(reg)	((reg) * 25000 / 255)
+#define NCT6694_FREQ_TO_REG(val)	\
+	(DIV_ROUND_CLOSEST(clamp_val((val), 100, 25000) * 255, 25000))
+
+#define NCT6694_LSB_REG_MASK		GENMASK(7, 5)
+#define NCT6694_TIN_HYST_MASK		GENMASK(7, 5)
+
+enum nct6694_hwmon_temp_mode {
+	NCT6694_HWMON_TWOTIME_IRQ = 0,
+	NCT6694_HWMON_ONETIME_IRQ,
+	NCT6694_HWMON_REALTIME_IRQ,
+	NCT6694_HWMON_COMPARE_IRQ,
+};
+
+struct __packed nct6694_hwmon_control {
+	u8 vin_en[2];
+	u8 tin_en[2];
+	u8 fin_en[2];
+	u8 pwm_en[2];
+	u8 reserved1[40];
+	u8 pwm_freq[10];
+	u8 reserved2[6];
+};
+
+struct __packed nct6694_hwmon_alarm {
+	u8 smi_ctrl;
+	u8 reserved1[15];
+	struct {
+		u8 hl;
+		u8 ll;
+	} vin_limit[16];
+	struct {
+		u8 hyst;
+		s8 hl;
+	} tin_cfg[32];
+	__be16 fin_ll[10];
+	u8 reserved2[4];
+};
+
+struct __packed nct6694_pwm_control {
+	u8 mal_en[2];
+	u8 mal_val[10];
+	u8 reserved[12];
+};
+
+union nct6694_hwmon_rpt {
+	u8 vin;
+	struct {
+		u8 msb;
+		u8 lsb;
+	} tin;
+	__be16 fin;
+	u8 pwm;
+	u8 status;
+};
+
+union nct6694_hwmon_msg {
+	struct nct6694_hwmon_control hwmon_ctrl;
+	struct nct6694_hwmon_alarm hwmon_alarm;
+	struct nct6694_pwm_control pwm_ctrl;
+};
+
+struct nct6694_hwmon_data {
+	struct nct6694 *nct6694;
+	struct mutex lock;
+	struct nct6694_hwmon_control hwmon_en;
+	union nct6694_hwmon_rpt *rpt;
+	union nct6694_hwmon_msg *msg;
+};
+
+static inline long in_from_reg(u8 reg)
+{
+	return reg * 16;
+}
+
+static inline u8 in_to_reg(long val)
+{
+	return DIV_ROUND_CLOSEST(val, 16);
+}
+
+static inline long temp_from_reg(s8 reg)
+{
+	return reg * 1000;
+}
+
+static inline s8 temp_to_reg(long val)
+{
+	return DIV_ROUND_CLOSEST(val, 1000);
+}
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
+		vin_en = data->hwmon_en.vin_en[(channel / 8)];
+		*val = !!(vin_en & BIT(channel % 8));
+
+		return 0;
+	case hwmon_in_input:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_VIN_IDX(channel),
+				       sizeof(data->rpt->vin),
+				       &data->rpt->vin);
+		if (ret)
+			return ret;
+
+		*val = in_from_reg(data->rpt->vin);
+
+		return 0;
+	case hwmon_in_max:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_ALARM,
+				       sizeof(data->msg->hwmon_alarm),
+				       &data->msg->hwmon_alarm);
+		if (ret)
+			return ret;
+
+		*val = in_from_reg(data->msg->hwmon_alarm.vin_limit[channel].hl);
+
+		return 0;
+	case hwmon_in_min:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_ALARM,
+				       sizeof(data->msg->hwmon_alarm),
+				       &data->msg->hwmon_alarm);
+		if (ret)
+			return ret;
+
+		*val = in_from_reg(data->msg->hwmon_alarm.vin_limit[channel].ll);
+
+		return 0;
+	case hwmon_in_alarm:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_VIN_STS(channel / 8),
+				       sizeof(data->rpt->status),
+				       &data->rpt->status);
+		if (ret)
+			return ret;
+
+		*val = !!(data->rpt->status & BIT(channel % 8));
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
+	signed char temp_max;
+	int ret, temp_raw;
+
+	guard(mutex)(&data->lock);
+
+	switch (attr) {
+	case hwmon_temp_enable:
+		temp_en = data->hwmon_en.tin_en[channel / 8];
+		*val = !!(temp_en & BIT(channel % 8));
+
+		return 0;
+	case hwmon_temp_input:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_TIN_IDX(channel),
+				       sizeof(data->rpt->tin),
+				       &data->rpt->tin);
+		if (ret)
+			return ret;
+
+		temp_raw = data->rpt->tin.msb << 3;
+		temp_raw |= FIELD_GET(NCT6694_LSB_REG_MASK, data->rpt->tin.lsb);
+
+		/* Real temperature(milli degrees Celsius) = temp_raw * 1000 * 0.125 */
+		*val = sign_extend32(temp_raw, 10) * 125;
+
+		return 0;
+	case hwmon_temp_max:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_ALARM,
+				       sizeof(data->msg->hwmon_alarm),
+				       &data->msg->hwmon_alarm);
+		if (ret)
+			return ret;
+
+		*val = temp_from_reg(data->msg->hwmon_alarm.tin_cfg[channel].hl);
+
+		return 0;
+	case hwmon_temp_max_hyst:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_ALARM,
+				       sizeof(data->msg->hwmon_alarm),
+				       &data->msg->hwmon_alarm);
+		if (ret)
+			return ret;
+
+		temp_max = data->msg->hwmon_alarm.tin_cfg[channel].hl;
+		temp_hyst = FIELD_GET(NCT6694_TIN_HYST_MASK,
+				      data->msg->hwmon_alarm.tin_cfg[channel].hyst);
+		*val = temp_from_reg(temp_max - temp_hyst);
+
+		return 0;
+	case hwmon_temp_max_alarm:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_TIN_STS(channel / 8),
+				       sizeof(data->rpt->status),
+				       &data->rpt->status);
+		if (ret)
+			return ret;
+
+		*val = !!(data->rpt->status & BIT(channel % 8));
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
+		fanin_en = data->hwmon_en.fin_en[channel / 8];
+		*val = !!(fanin_en & BIT(channel % 8));
+
+		return 0;
+	case hwmon_fan_input:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_FIN_IDX(channel),
+				       sizeof(data->rpt->fin),
+				       &data->rpt->fin);
+		if (ret)
+			return ret;
+
+		*val = be16_to_cpu(data->rpt->fin);
+
+		return 0;
+	case hwmon_fan_min:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_ALARM,
+				       sizeof(data->msg->hwmon_alarm),
+				       &data->msg->hwmon_alarm);
+		if (ret)
+			return ret;
+
+		*val = be16_to_cpu(data->msg->hwmon_alarm.fin_ll[channel]);
+
+		return 0;
+	case hwmon_fan_min_alarm:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_FIN_STS(channel / 8),
+				       sizeof(data->rpt->status),
+				       &data->rpt->status);
+		if (ret)
+			return ret;
+
+		*val = !!(data->rpt->status & BIT(channel % 8));
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
+		pwm_en = data->hwmon_en.pwm_en[channel / 8];
+		*val = !!(pwm_en & BIT(channel % 8));
+
+		return 0;
+	case hwmon_pwm_input:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
+				       NCT6694_PWM_IDX(channel),
+				       sizeof(data->rpt->fin),
+				       &data->rpt->fin);
+		if (ret)
+			return ret;
+
+		*val = data->rpt->fin;
+
+		return 0;
+	case hwmon_pwm_freq:
+		*val = NCT6694_FREQ_FROM_REG(data->hwmon_en.pwm_freq[channel]);
+
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
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
+		if (val == 0)
+			data->hwmon_en.vin_en[channel / 8] &= ~BIT(channel % 8);
+		else if (val == 1)
+			data->hwmon_en.vin_en[channel / 8] |= BIT(channel % 8);
+		else
+			return -EINVAL;
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CONTROL,
+					 sizeof(data->msg->hwmon_ctrl),
+					 &data->hwmon_en);
+	case hwmon_in_max:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_ALARM,
+				       sizeof(data->msg->hwmon_alarm),
+				       &data->msg->hwmon_alarm);
+		if (ret)
+			return ret;
+
+		val = clamp_val(val, 0, 2032);
+		data->msg->hwmon_alarm.vin_limit[channel].hl = in_to_reg(val);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_ALARM,
+					 sizeof(data->msg->hwmon_alarm),
+					 &data->msg->hwmon_alarm);
+	case hwmon_in_min:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_ALARM,
+				       sizeof(data->msg->hwmon_alarm),
+				       &data->msg->hwmon_alarm);
+		if (ret)
+			return ret;
+
+		val = clamp_val(val, 0, 2032);
+		data->msg->hwmon_alarm.vin_limit[channel].ll = in_to_reg(val);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_ALARM,
+					 sizeof(data->msg->hwmon_alarm),
+					 &data->msg->hwmon_alarm);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_temp_write(struct device *dev, u32 attr, int channel,
+			      long val)
+{
+	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
+	unsigned char temp_hyst;
+	signed char temp_max;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	switch (attr) {
+	case hwmon_temp_enable:
+		if (val == 0)
+			data->hwmon_en.tin_en[channel / 8] &= ~BIT(channel % 8);
+		else if (val == 1)
+			data->hwmon_en.tin_en[channel / 8] |= BIT(channel % 8);
+		else
+			return -EINVAL;
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CONTROL,
+					 sizeof(data->msg->hwmon_ctrl),
+					 &data->hwmon_en);
+	case hwmon_temp_max:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_ALARM,
+				       sizeof(data->msg->hwmon_alarm),
+				       &data->msg->hwmon_alarm);
+		if (ret)
+			return ret;
+
+		val = clamp_val(val, -127000, 127000);
+		data->msg->hwmon_alarm.tin_cfg[channel].hl = temp_to_reg(val);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_ALARM,
+					 sizeof(data->msg->hwmon_alarm),
+					 &data->msg->hwmon_alarm);
+	case hwmon_temp_max_hyst:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_ALARM,
+				       sizeof(data->msg->hwmon_alarm),
+				       &data->msg->hwmon_alarm);
+
+		val = clamp_val(val, -127000, 127000);
+		temp_max = data->msg->hwmon_alarm.tin_cfg[channel].hl;
+		temp_hyst = temp_max - temp_to_reg(val);
+		temp_hyst = clamp_val(temp_hyst, 0, 7);
+		data->msg->hwmon_alarm.tin_cfg[channel].hyst =
+			(data->msg->hwmon_alarm.tin_cfg[channel].hyst & ~NCT6694_TIN_HYST_MASK) |
+			FIELD_PREP(NCT6694_TIN_HYST_MASK, temp_hyst);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_ALARM,
+					 sizeof(data->msg->hwmon_alarm),
+					 &data->msg->hwmon_alarm);
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
+		if (val == 0)
+			data->hwmon_en.fin_en[channel / 8] &= ~BIT(channel % 8);
+		else if (val == 1)
+			data->hwmon_en.fin_en[channel / 8] |= BIT(channel % 8);
+		else
+			return -EINVAL;
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CONTROL,
+					 sizeof(data->msg->hwmon_ctrl),
+					 &data->hwmon_en);
+	case hwmon_fan_min:
+		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+				       NCT6694_HWMON_ALARM,
+				       sizeof(data->msg->hwmon_alarm),
+				       &data->msg->hwmon_alarm);
+		if (ret)
+			return ret;
+
+		val = clamp_val(val, 1, 65535);
+		data->msg->hwmon_alarm.fin_ll[channel] = (u16)cpu_to_be16(val);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_ALARM,
+					 sizeof(data->msg->hwmon_alarm),
+					 &data->msg->hwmon_alarm);
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
+		if (val == 0)
+			data->hwmon_en.pwm_en[channel / 8] &= ~BIT(channel % 8);
+		else if (val == 1)
+			data->hwmon_en.pwm_en[channel / 8] |= BIT(channel % 8);
+		else
+			return -EINVAL;
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CONTROL,
+					 sizeof(data->msg->hwmon_ctrl),
+					 &data->hwmon_en);
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255)
+			return -EINVAL;
+
+		ret = nct6694_read_msg(data->nct6694, NCT6694_PWM_MOD,
+				       NCT6694_PWM_CONTROL,
+				       sizeof(data->msg->pwm_ctrl),
+				       &data->msg->pwm_ctrl);
+		if (ret)
+			return ret;
+
+		data->msg->pwm_ctrl.mal_val[channel] = val;
+
+		return nct6694_write_msg(data->nct6694, NCT6694_PWM_MOD,
+					 NCT6694_PWM_CONTROL,
+					 sizeof(data->msg->pwm_ctrl),
+					 &data->msg->pwm_ctrl);
+	case hwmon_pwm_freq:
+		data->hwmon_en.pwm_freq[channel] = NCT6694_FREQ_TO_REG(val);
+
+		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+					 NCT6694_HWMON_CONTROL,
+					 sizeof(data->msg->hwmon_ctrl),
+					 &data->hwmon_en);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct6694_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_in:
+		/* in mV */
+		return nct6694_in_read(dev, attr, channel, val);
+	case hwmon_temp:
+		/* in mC */
+		return nct6694_temp_read(dev, attr, channel, val);
+	case hwmon_fan:
+		/* in RPM */
+		return nct6694_fan_read(dev, attr, channel, val);
+	case hwmon_pwm:
+		/* in value 0~255 */
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
+	/*
+	 * Record each Hardware Monitor Channel enable status
+	 * and PWM frequency register
+	 */
+	ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+			       NCT6694_HWMON_CONTROL,
+			       sizeof(data->msg->hwmon_ctrl),
+			       &data->hwmon_en);
+	if (ret)
+		return ret;
+
+	/* Select hwmon device alarm mode */
+	ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
+			       NCT6694_HWMON_ALARM,
+			       sizeof(data->msg->hwmon_alarm),
+			       &data->msg->hwmon_alarm);
+	if (ret)
+		return ret;
+
+	data->msg->hwmon_alarm.smi_ctrl = NCT6694_HWMON_REALTIME_IRQ;
+
+	return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
+				 NCT6694_HWMON_ALARM,
+				 sizeof(data->msg->hwmon_alarm),
+				 &data->msg->hwmon_alarm);
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
+	data->rpt = devm_kzalloc(&pdev->dev, sizeof(union nct6694_hwmon_rpt),
+				 GFP_KERNEL);
+	if (!data->rpt)
+		return -ENOMEM;
+
+	data->msg = devm_kzalloc(&pdev->dev, sizeof(union nct6694_hwmon_msg),
+				 GFP_KERNEL);
+	if (!data->msg)
+		return -ENOMEM;
+
+	data->nct6694 = nct6694;
+	devm_mutex_init(&pdev->dev, &data->lock);
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
+MODULE_ALIAS("platform:nct6694-hwmon");
-- 
2.34.1


