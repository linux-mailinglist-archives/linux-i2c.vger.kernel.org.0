Return-Path: <linux-i2c+bounces-7526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D79ADFF6
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6051D1C22018
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C561CF2A7;
	Thu, 24 Oct 2024 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuxOkdag"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9801B4F0C;
	Thu, 24 Oct 2024 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760425; cv=none; b=ar8nnRevKma+NtfU/6QeJ10HmkibaV8kP5SgJamLPIZFRBEnGzfD33n6S480pSIf51cRwQPqGFaE3hG+gMQ7lfjyl76oL65HzV5bQd/GunsyaiP8qC7RusiFGaPhAhVof3G1Cz2zh87TWs6VGPeRLvQqJX9J7QEw2sgtYwJ37S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760425; c=relaxed/simple;
	bh=UnhLaJ0JL15jAgZ553cxcb3YFcwd+/F1Mzjh+QcL+pY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WV9ycxlzd1wMtzBnIi0boAtDg6qCQ6ROMg7rzRNVp7NJGNoRdnZ/YCCf94zcJ4WcU4ALDcYvwC/Q6n/7fL+lyGxQsx4Plr18R+JWpw4yNIa9tPQsf36gzo6pKH+eVHuGqTqHMlXFoToWabtQ7RcFGcDiL0ugmTNUav6xrMzQb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuxOkdag; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c805a0753so5795665ad.0;
        Thu, 24 Oct 2024 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729760422; x=1730365222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIbqZDJc8mnLl8JM1vRVacj6/HhHdNNqQLheCYEGuDY=;
        b=LuxOkdagkHRp3pKiITdvYfrPEFLzl3Yv511gQTpOlXQxZsd4ekN+KkHylrZq9nfc8b
         OVyEur/xo4jM5nqCuu04QyaD/4Sk8amLx/71/VX6GMbdZaj7cKuErfMKfbSp5qpUYdrA
         7F1PY/12Advxg3KueXMXk3yJyIgXYiaZ7HIesgwgGgrBl7XAOmwYyhN0W/HrSDbwuPTu
         MFaStE7DGf7D1oJfH/GKKZzlmiBZhcXPyJ52yD3aUy0pwSL1i2Sw9Tjr3JBY+cd7Spgx
         AobYDdbdnmn1PsKuVcDrOGsSJh9HTDbj2yvz2RZHxhZL0reeyY4U4VhkbyLfnYQtPd9u
         98dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760422; x=1730365222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIbqZDJc8mnLl8JM1vRVacj6/HhHdNNqQLheCYEGuDY=;
        b=omO28SLM5636f6Xzs/flbRIMh2M+FRVhxnK2cKsycOxBK8YjMS2hcwgJoRBPXsZhPe
         6XvL8y1//kcueuktJpUhCJUWva+tfJrkbdyeTYiZECpFxrzVhN+9wA5I5oyVIVeVIeoU
         8YX8wokJwK9DTmXkJOsWsvgpWggJEWvUdjWLykc4rkmRNnu7iEA5mxypEu2YrYmIW1Hr
         uRSJsuqc3ww3XO0XaeE/DR4Wyh9NDavvnv3BsgvKgwRJq3rytXfdz90bJLulrcyw542O
         gAl204MaASqvF7CGapEJAhOD22VaCUssjqdp7Y31otORnS/FkY5Do6WI+oNAFUh0zu9O
         2plQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3bEEEMKWCltExC3E297Dulzr/ymLTEcH+u1DOxRN3NWt9C3wA1k5v8PKVwMSeudz8YhGc5OXGvsma@vger.kernel.org, AJvYcCVgZnQa9MLM/gfo9xvUVckAKlcffOcFjsu4rLhSwhfybqrMXInNrwbGaFxkrthGxsLU3hXjb8keVEF1@vger.kernel.org, AJvYcCVvIf9gDogqm64/oj+3j7/asHCDSlvEJrOxpbZehr3uPBwzfPCS7/Q4oCTnJelSwZCpIlzAqOQRQIQo@vger.kernel.org, AJvYcCW9ybUoQ/v4+7G/zBE5vJpch5U2Rd0jsXehmM5MZSKCu5rKFqrhG9k6nS6ZzEF0fIYUDz2wh0oLdi0zMA==@vger.kernel.org, AJvYcCWKAfgIoSTPNAym5jKOHxguwqUWA2CLKP/a5w34FwvXVFiTxpdKzKA3D/xCU6it0+wALdURwc88@vger.kernel.org, AJvYcCWMZz1bzv1Z1b4l5RCKkITAJo5/SQ7O4EYns653miZURD7MnqSKjA/BrWT3IPenYcYVS9CC8grT7HLUlCnISEA=@vger.kernel.org, AJvYcCWUbn3bjchTVkLMPN9oiJW/QQ97Z5I8QgBaL4l8Yu/tXbBbkoMm27fAuyJParuz0kdqCxvKJpTLJcwY@vger.kernel.org, AJvYcCX5WLopbebuPQ+yRLHa6nWLK7bLA/ZH3cN0CAXHB3nFVPtaKqHIJG9nULGFnIwCNVRen94pIOqwUHU=@vger.kernel.org, AJvYcCX8gRq92AnAGh8JdjbcX8d9lUK2ywzne1QRRVmPLVCU4jfzoVUYGoxNOCKwY8GGi5MTcHRAni8DqvFVWcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhX4OKri3L45Iq6OOHTDuMgOPmKopJVdLjgVHmos01f8Uhk836
	rznVQu97KKScel9J/DqhB/fgbn6ifNEF/pQwPLsoNsfNMfBRXa+C
X-Google-Smtp-Source: AGHT+IHfU5bGuzEbC6pA7wiKRq0B2bksWNaijYHyEsR3X33rOKlukYQey29WPzYg3brlpUWbKJ1bTQ==
X-Received: by 2002:a17:902:fc4f:b0:20b:bad4:5b6e with SMTP id d9443c01a7336-20fb9aa038fmr15925915ad.38.1729760421780;
        Thu, 24 Oct 2024 02:00:21 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6e89sm68503615ad.277.2024.10.24.02.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:00:21 -0700 (PDT)
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
Subject: [PATCH v1 8/9] pwm: Add Nuvoton NCT6694 PWM support
Date: Thu, 24 Oct 2024 16:59:21 +0800
Message-Id: <20241024085922.133071-9-tmyu0@nuvoton.com>
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

This driver supports PWM functionality for NCT6694 MFD device
based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS               |   1 +
 drivers/pwm/Kconfig       |  10 ++
 drivers/pwm/Makefile      |   1 +
 drivers/pwm/pwm-nct6694.c | 245 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 257 insertions(+)
 create mode 100644 drivers/pwm/pwm-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c350eac187d..4d5a5eded3b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16444,6 +16444,7 @@ F:	drivers/iio/adc/nct6694_adc.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/nct6694_canfd.c
+F:	drivers/pwm/pwm-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 0915c1e7df16..00b5eb13f99d 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -471,6 +471,16 @@ config PWM_NTXEC
 	  controller found in certain e-book readers designed by the original
 	  design manufacturer Netronix.
 
+config PWM_NCT6694
+	tristate "Nuvoton NCT6694 PWM support"
+	depends on MFD_NCT6694
+	help
+	If you say yes to this option, support will be included for Nuvoton
+	NCT6694, a USB device to PWM controller.
+
+	This driver can also be built as a module. If so, the module
+	will be called pwm-nct6694.
+
 config PWM_OMAP_DMTIMER
 	tristate "OMAP Dual-Mode Timer PWM support"
 	depends on OF
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 9081e0c0e9e0..5c5602b79402 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_PWM_MICROCHIP_CORE)	+= pwm-microchip-core.o
 obj-$(CONFIG_PWM_MTK_DISP)	+= pwm-mtk-disp.o
 obj-$(CONFIG_PWM_MXS)		+= pwm-mxs.o
 obj-$(CONFIG_PWM_NTXEC)		+= pwm-ntxec.o
+obj-$(CONFIG_PWM_NCT6694)	+= pwm-nct6694.o
 obj-$(CONFIG_PWM_OMAP_DMTIMER)	+= pwm-omap-dmtimer.o
 obj-$(CONFIG_PWM_PCA9685)	+= pwm-pca9685.o
 obj-$(CONFIG_PWM_PXA)		+= pwm-pxa.o
diff --git a/drivers/pwm/pwm-nct6694.c b/drivers/pwm/pwm-nct6694.c
new file mode 100644
index 000000000000..915a2ab50834
--- /dev/null
+++ b/drivers/pwm/pwm-nct6694.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 PWM driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pwm.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/nct6694.h>
+
+#define DRVNAME "nct6694-pwm"
+
+#define NR_PWM	10
+#define MAX_PERIOD_NS	40000		/* PWM Maximum Frequency = 25kHz */
+#define PERIOD_NS_CONST	10200000	/* Period_ns to Freq_reg */
+
+/* Host interface */
+#define REQUEST_RPT_MOD			0xFF
+#define REQUEST_HWMON_MOD		0x00
+#define REQUEST_PWM_MOD			0x01
+
+/* Report Channel */
+#define HWMON_PWM_IDX(x)		(0x70 + (x))
+
+/* Message Channel -HWMON */
+/* Command 00h */
+#define REQUEST_HWMON_CMD0_LEN		0x40
+#define REQUEST_HWMON_CMD0_OFFSET	0x0000	/* OFFSET = SEL|CMD */
+#define HWMON_PWM_EN(x)			(0x06 + (x))
+#define HWMON_PWM_PP(x)			(0x08 + (x))
+#define HWMON_PWM_FREQ_IDX(x)		(0x30 + (x))
+
+/* Message Channel -FAN */
+/* Command 00h */
+#define REQUEST_PWM_CMD0_LEN		0x08
+#define REQUEST_PWM_CMD0_OFFSET		0x0000	/* OFFSET = SEL|CMD */
+#define PWM_CH_EN(x)			(x ? 0x00 : 0x01)
+/* Command 01h */
+#define REQUEST_PWM_CMD1_LEN		0x20
+#define REQUEST_PWM_CMD1_OFFSET		0x0001	/* OFFSET = SEL|CMD */
+#define PWM_MAL_EN(x)			(x ? 0x00 : 0x01)
+#define PWM_MAL_VAL(x)			(0x02 + (x))
+
+/*
+ *		Frequency <-> Period
+ * (10^9 * 255) / (25000 * Freq_reg) = Period_ns
+ *		10200000 / Freq_reg  = Period_ns
+ *
+ * | Freq_reg | Freq_Hz | Period_ns |
+ * |  1 (01h  |  98.039 |  10200000 |
+ * |  2 (02h) | 196.078 |   5100000 |
+ * |  3 (03h) | 294.117 |   3400000 |
+ * |		  ...		    |
+ * |		  ...		    |
+ * |		  ...		    |
+ * | 253 (FDh)| 24803.9 |  40316.20 |
+ * | 254 (FEh)| 24901.9 |  40157.48 |
+ * | 255 (FFh)|  25000  |    40000  |
+ *
+ */
+
+struct nct6694_pwm_data {
+	struct nct6694 *nct6694;
+	unsigned char hwmon_cmd0_buf[REQUEST_HWMON_CMD0_LEN];
+	unsigned char pwm_cmd0_buf[REQUEST_PWM_CMD0_LEN];
+	unsigned char pwm_cmd1_buf[REQUEST_PWM_CMD1_LEN];
+};
+
+static inline struct nct6694_pwm_data *to_nct6694_pwm_data(struct pwm_chip *chip)
+{
+	return pwmchip_get_drvdata(chip);
+}
+
+static int nct6694_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct nct6694_pwm_data *data = to_nct6694_pwm_data(chip);
+	unsigned char ch_enable = data->pwm_cmd0_buf[PWM_CH_EN(pwm->hwpwm / 8)];
+	unsigned char mal_enable = data->pwm_cmd1_buf[PWM_MAL_EN(pwm->hwpwm / 8)];
+	bool ch_en = ch_enable & BIT(pwm->hwpwm % 8);
+	bool mal_en = mal_enable & BIT(pwm->hwpwm % 8);
+
+	if (!(ch_en && mal_en)) {
+		pr_err("%s: PWM(%d) is running in other mode!\n",
+		       __func__, pwm->hwpwm);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int nct6694_pwm_get_state(struct pwm_chip *chip,
+				 struct pwm_device *pwm,
+				 struct pwm_state *state)
+{
+	struct nct6694_pwm_data *data = to_nct6694_pwm_data(chip);
+	unsigned char freq_reg, duty;
+
+	/* Get pwm device initial state */
+	state->enabled = true;
+
+	freq_reg = data->hwmon_cmd0_buf[HWMON_PWM_FREQ_IDX(pwm->hwpwm)];
+	state->period = PERIOD_NS_CONST / freq_reg;
+
+	duty = data->pwm_cmd1_buf[PWM_MAL_VAL(pwm->hwpwm)];
+	state->duty_cycle = duty * state->period / 0xFF;
+
+	return 0;
+}
+
+static int nct6694_pwm_apply(struct pwm_chip *chip,
+			     struct pwm_device *pwm,
+			     const struct pwm_state *state)
+{
+	struct nct6694_pwm_data *data = to_nct6694_pwm_data(chip);
+	unsigned char freq_reg, duty;
+	int ret;
+
+	if (state->period < MAX_PERIOD_NS)
+		return -EINVAL;
+
+	/* (10^9 * 255) / (25000 * Freq_reg) = Period_ns */
+	freq_reg = (unsigned char)(PERIOD_NS_CONST / state->period);
+	data->hwmon_cmd0_buf[HWMON_PWM_FREQ_IDX(pwm->hwpwm)] = freq_reg;
+	ret = nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
+				REQUEST_HWMON_CMD0_OFFSET,
+				REQUEST_HWMON_CMD0_LEN,
+				data->hwmon_cmd0_buf);
+	if (ret)
+		return -EIO;
+
+	/* Duty = duty * 0xFF */
+	duty = (unsigned char)(state->duty_cycle * 0xFF / state->period);
+	data->pwm_cmd1_buf[PWM_MAL_VAL(pwm->hwpwm)] = duty;
+	if (state->enabled)
+		data->pwm_cmd1_buf[PWM_MAL_EN(pwm->hwpwm / 8)] |= BIT(pwm->hwpwm  % 8);
+	else
+		data->pwm_cmd1_buf[PWM_MAL_EN(pwm->hwpwm / 8)] &= ~BIT(pwm->hwpwm  % 8);
+	ret = nct6694_write_msg(data->nct6694, REQUEST_PWM_MOD,
+				REQUEST_PWM_CMD1_OFFSET, REQUEST_PWM_CMD1_LEN,
+				data->pwm_cmd1_buf);
+	if (ret)
+		return -EIO;
+
+	return 0;
+}
+
+static const struct pwm_ops nct6694_pwm_ops = {
+	.request = nct6694_pwm_request,
+	.apply = nct6694_pwm_apply,
+	.get_state = nct6694_pwm_get_state,
+};
+
+static int nct6694_pwm_init(struct nct6694_pwm_data *data)
+{
+	struct nct6694 *nct6694 = data->nct6694;
+	int ret;
+
+	ret = nct6694_read_msg(nct6694, REQUEST_HWMON_MOD,
+			       REQUEST_HWMON_CMD0_OFFSET,
+			       REQUEST_HWMON_CMD0_LEN, 0,
+			       REQUEST_HWMON_CMD0_LEN,
+			       data->hwmon_cmd0_buf);
+	if (ret)
+		return ret;
+
+	ret = nct6694_read_msg(nct6694, REQUEST_PWM_MOD,
+			       REQUEST_PWM_CMD0_OFFSET,
+			       REQUEST_PWM_CMD0_LEN, 0,
+			       REQUEST_PWM_CMD0_LEN,
+			       data->pwm_cmd0_buf);
+	if (ret)
+		return ret;
+
+	ret = nct6694_read_msg(nct6694, REQUEST_PWM_MOD,
+			       REQUEST_PWM_CMD1_OFFSET,
+			       REQUEST_PWM_CMD1_LEN, 0,
+			       REQUEST_PWM_CMD1_LEN,
+			       data->pwm_cmd1_buf);
+	return ret;
+}
+
+static int nct6694_pwm_probe(struct platform_device *pdev)
+{
+	struct pwm_chip *chip;
+	struct nct6694_pwm_data *data;
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	int ret;
+
+	chip = devm_pwmchip_alloc(&pdev->dev, NR_PWM, sizeof(*data));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	data = to_nct6694_pwm_data(chip);
+
+	data->nct6694 = nct6694;
+	chip->ops = &nct6694_pwm_ops;
+
+	ret = nct6694_pwm_init(data);
+	if (ret)
+		return -EIO;
+
+	/* Register pwm device to PWM framework */
+	ret = devm_pwmchip_add(&pdev->dev, chip);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register pwm device!\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver nct6694_pwm_driver = {
+	.driver = {
+		.name	= DRVNAME,
+	},
+	.probe		= nct6694_pwm_probe,
+};
+
+static int __init nct6694_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&nct6694_pwm_driver);
+	if (!err) {
+		if (err)
+			platform_driver_unregister(&nct6694_pwm_driver);
+	}
+
+	return err;
+}
+subsys_initcall(nct6694_init);
+
+static void __exit nct6694_exit(void)
+{
+	platform_driver_unregister(&nct6694_pwm_driver);
+}
+module_exit(nct6694_exit);
+
+MODULE_DESCRIPTION("USB-PWM driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


