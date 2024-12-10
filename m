Return-Path: <linux-i2c+bounces-8408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EB89EAE74
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 11:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 103C7161B86
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518C222333A;
	Tue, 10 Dec 2024 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPfuTMO1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25B4210F41;
	Tue, 10 Dec 2024 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827582; cv=none; b=B5VI5vQ5Yfv2/4RcG9MmL8U0IuvSJas8n2a2q3kIOGrVOWr8r/MTPm39Hc3t51orDE0N6ALS2DO13CGcgP3LLGHyKc/GFZC0JeTDqJx1RRZ+2PUtGvyF0g+YkeF8n5HGVji9vAxHHrDrbwv2EKO6EH8IAyf1xoniFAcECpd4EjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827582; c=relaxed/simple;
	bh=/piidRgFQy110cFXKm8Vy/xHBDbsTQ5cJnu5xRAZp3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g+i0OZzU1OYNvu+i4wbF+mk1kx1SY8yZdesRhcFBPQJweAirstRjuefl4BQTBJrWBkD/311keRsDPompSULdidFuIaeghWUNBbXnqn6/WC+dhDL+Wqy7GvTk7S9A6RERlVIvYK0vvUqgnpT6WvlOCaIDUWHwk9ZJR2VfvuY+u4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPfuTMO1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-725c86bbae7so3117205b3a.3;
        Tue, 10 Dec 2024 02:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733827579; x=1734432379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0xLLPW+J1il8TdNO0nvRg38iTVBXFMg6jVX279PHdQ=;
        b=HPfuTMO1YVJWeN4GHDTO5VJXVCHda60qq+yiBvlpXDOZZzP477PHqWp4hcjujmZYaV
         fcE5gwveWHe830Kc/N+znbzhadUVnaQ/Q4Iub6cPs5OEDDh040xtHfyHTi7vdR3jv8Ba
         tHZh5UdU7yMKVf8HFQ9jyKZq5Y/BookOzDXmaGRjRDaIBRTjEy5WeLEmnDKlMaHRsQl3
         Pp5P/L11mvkJtPqPwUNhSae5A0V+bPjf+OMB4exmv1XapLUhk7TsId10+g7TVdQwxL2W
         uTmJ3quTTDhJlwnB3cHg4+yr3tlCnv38y6U7sZQE/lf+X1I9C4kGZN2lqzsy5Dglh01T
         +2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827579; x=1734432379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0xLLPW+J1il8TdNO0nvRg38iTVBXFMg6jVX279PHdQ=;
        b=SqRjUxADvdB2nylxFDhjkI4stOWRIlTSYi7v0pCb7+uMuumamf3Qh+lEF5N10L+4l+
         utMFrvr24L2JNG+42B9ILZ8PYvgBZHbAdhFPz77lfvkSCSgMdWclCsKEPHEiRgfPfDe0
         oB10dNdl225/wuYG4ObsywUM6NU75j3g/I6Dmw6B+jtf1psjguvFnlrT/2ISKc4WgXbQ
         lCHnt/MFZihU/heNHYBH1zn8j2PofGe7mbK9gKeEZirsFAKarBoqvwiet1ZIRlr6TP/H
         R/lv9HD6HyseVfO8HGKSe5ueitf5qxs7KYWgBZE4azWM+WlL+4b4F6oI7CXY/4FvLae2
         oSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3DT61bizm/3ijrEvBRGmhXOt/89kRRbojR6+fA0t8jqsvVBxJ0IIdL9YTmFpI3GZyatHgWLQl@vger.kernel.org, AJvYcCUHNzEil0tgGzo/O01bbrXV0p3FZx/O8WPmEflqDGU2YronU6F5d5jbcChNfUGrh7LrQehOgqPi7zNV@vger.kernel.org, AJvYcCVH3WapvTdptiTENttYNUKIByuuRAT5/KPUqom9Hdc7K4ChEN1axKLbCWmTgtR1qxKyV5/fzvaDmic+9g==@vger.kernel.org, AJvYcCWYdNkIKrx7/Y++oJ23Qj8/8B9B9V3Gg81/u0m3VdPrScFz5rZNCYeByHjCxh5rGhOzgTK1yvZvLGh/@vger.kernel.org, AJvYcCXVuengEfa9UfwGnP2zDWldvwybdhXDNpbrJDkXU+SVGpyum4w7z4J4UohTcfvalyLw8VRflGujyHAZwUHz23w=@vger.kernel.org, AJvYcCXdMbqfSsabY7nLH5UTIcGylV5KbJAAmsleMMGwqWx7bM6q9H8IM+PoPMTmduKV8H3L43FqpDhaWJ1f07g=@vger.kernel.org, AJvYcCXwqYKFUNhf1thMjtjLNjcJyf+sFPINUegLdPP04+2EWKu8wGCdHhz1FmQdg2lGNN5wnC9g0zgT7Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmViTAZ3BBVDZppjsdYCBFYbfPlgSW+GL+DwrjDSGP9cKIHlxk
	Us3EVAILbBR3HigFETUI4H4NzEsdXPQCEFxrLyeY7ZhJeX0tBbNZ
X-Gm-Gg: ASbGncvYjt2fhSNCixm1fB1YTcU24R9AQqOwTi4uahPqjvTPQIgamJDrMSMEMPojhkN
	QCbQTmYSrlSn9jXrcqaab7R9PyTNrqdqvkTuO5EMHb5Kwk1SVKLlSQt1h5mflSLdpX5kpnK2Vlj
	tsu1zYQeMgBaTB31MADhEaAPtQITvd/vo/VpZ0jPUMPPCdpOgHKliIc5IFgX1JpWaee4RRWVpv1
	olphcvG+yZurhFg+KdYH/cjZFnFVNbgS6lcEXU37Y4na23RgyC/b3MifIQz16sPH4LwLg5MVvZa
	M0QnIMkiEbRsYHC1
X-Google-Smtp-Source: AGHT+IGKtlFjf6BwrGjIxBLXNJcmoWORXQwcVWm33oIuth7N9sWAT9LClhVABC8/ITFIBWkcHGMO7A==
X-Received: by 2002:a05:6a21:3394:b0:1e1:a304:75da with SMTP id adf61e73a8af0-1e1b1b422f3mr6998506637.26.1733827578791;
        Tue, 10 Dec 2024 02:46:18 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156dfe2fsm8905748a12.31.2024.12.10.02.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:46:18 -0800 (PST)
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
Subject: [PATCH v3 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
Date: Tue, 10 Dec 2024 18:45:23 +0800
Message-Id: <20241210104524.2466586-7-tmyu0@nuvoton.com>
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

This driver supports Hardware monitor functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                   |   1 +
 drivers/hwmon/Kconfig         |  10 +
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/nct6694-hwmon.c | 768 ++++++++++++++++++++++++++++++++++
 4 files changed, 780 insertions(+)
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
index 000000000000..b2320d64090b
--- /dev/null
+++ b/drivers/hwmon/nct6694-hwmon.c
@@ -0,0 +1,768 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 HWMON driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/bitfield.h>
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
+		*val = !!(vin_en & BIT(channel % 8)) ? 1 : 0;
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
+		*val = !!(temp_en & BIT(channel % 8)) ? 1 : 0;
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
+		*val = !!(fanin_en & BIT(channel % 8)) ? 1 : 0;
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
+		*val = !!(data->xmit_buf[0] & BIT(channel % 8));
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
+		*val = !!(pwm_en & BIT(channel % 8)) ? 1 : 0;
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
+		temp_hyst = clamp_val(temp_hyst, 0, 7);
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
+MODULE_ALIAS("platform:nct6694-hwmon");
-- 
2.34.1


