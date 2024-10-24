Return-Path: <linux-i2c+bounces-7525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDA49ADFEE
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9DC1283829
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED9F1CC8BB;
	Thu, 24 Oct 2024 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACqV1n83"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9C61CB9E3;
	Thu, 24 Oct 2024 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760422; cv=none; b=DqSl1+sat0Xq0YoT46j/hGqe9EaNbOoear+A/065Q90mEmSd9SEx8HsVVfIimVMTlenfa7B13PV3n68Y/h9ZctSOjaqRbcuFR3pSYgsPx1XzMNT7ZzsCQmVIlZ1xLBxYFYmsW7Rm9zQT9OEx995zHhMB/I2k6oEjLH6EszTfAlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760422; c=relaxed/simple;
	bh=/icXWOgKtTqQkBjzhGxSpSk5O+DNM8LglkQd54dsAno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=idYcLmRNfzM4oxybFiLA6YNc5QGXvvya9tzJzwFk0CWcy0YxxX+nZ/ywLoxdOoVq19TuqMJfNq9GYgPfhkvWydyYZ8uzAcP8mu9xrr3D5JqWY2F4OVVsUTUY3n9tx0RhJZwl6lQzCaP8v/CBlXQ8QWNxeVDedRtzkq+G8ygSf68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACqV1n83; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20ce65c8e13so4394575ad.1;
        Thu, 24 Oct 2024 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729760419; x=1730365219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9IZudYcHUgSCXGjbVTD1FlqJ67XAgyb889HnrrbtzQ=;
        b=ACqV1n83EcR1pK5fmfIFUNS/oSwfQa0lWLVJwT9AD2OkOTJii5urximrBcUzQxs5/2
         vWUobPhwFKfZd5/DRuj+ir/NlMJyYJKG0RhvuSnsaqku9DPskg9Cc6Nrw7QFtEUwX7JT
         TI4Ugo/zksqAw6JVm0mMFa5tr+/CBPB1ct+xIZ9sdGFblEPVDZpks3ft+5eFGBJ1kIvZ
         5Nl76xBTLFhZaJj1txCf0ZClAR7zJFK0kIAXJSJOgOAX5Be7IlkxHUuaMa/rwSppeYgG
         u/upN4yZKsXAJ6EQsQG5YCPbjLmBsz53Gl+2R7uUd2N6wrglJhlJNkvFXi6sdPs8dNrm
         /Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760419; x=1730365219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9IZudYcHUgSCXGjbVTD1FlqJ67XAgyb889HnrrbtzQ=;
        b=lb1GYx8wH7o3BaYM/HRmKdqnLILLMac0Ay+7YW9sK2pWSjENfbkrDSYNADp4X4aDp2
         FmObgT/xuOkN7jUg/DtW7KWv71JBefEqNPJbDmqwhSLR1fvjIysqyYiP/TYCY7NEdhiv
         G4dSZvnUIsCLj3PWuyYzNrASMIv9+oFTbBs+fjqZ9GmIz93oW39IYgv/C1vCkaY9X8Im
         Kpi+GrhS1Tiwjg6nP8F2dLQvqWANr9ZSUsygUSH1/yTlizq5ngwLgjnm1GVVHHVfmsya
         +pp9FRynTEhihpaZSMp5wLngXJijQuE5e8D7NpaU/GCEIrUrrN4sl5qf6jAW5Ly+3pr8
         dhgA==
X-Forwarded-Encrypted: i=1; AJvYcCU3tWnbEPLkCTDrfNIrwCTSzQ75L+EtVsTknObuzCZ4wIj/2opKNYZXQdhqX9gWmFD5xcktmMGt@vger.kernel.org, AJvYcCUc+gLb/eq5nfE5/Nqt4iO7McR4GN3Hgp5QApMXsq7MBpKClIbM2YJRBlgK4r/z9qM8nPicDTtPoRmR13E=@vger.kernel.org, AJvYcCUm0ShID4kJaYeuPZdgG0F8uJZPZApfjECRICnhNfHa1JiLT7aiqiRB6xNAQNmrXEooH7KyWqDOJ1E=@vger.kernel.org, AJvYcCVAOqnPyRX3rxQ/G//Ajy/iOU7OoYfM3y0I8KumohOll3K+yvgmmkrYVElKBN9fYe4H4eQ98hdD9gOoVQ==@vger.kernel.org, AJvYcCVYBH21SArDmCyTOe7ieE0EkKqU1Pex8pkfIOcstxNkdCj/D+rXgvFY8fjOGWuXq2mZ/SHb8/HGWc+E@vger.kernel.org, AJvYcCX2Cb/SfbU3yeqL35/PhXFafvJ9G6iKAp9Sgncj5ryLB1OnCniSYyQjZh13nuNtuILNf8oUfCGIpIYG@vger.kernel.org, AJvYcCXFoVF/jBotzLYSS/Il55h/WAU5yMc0cOrHszlL4dUp60iKVl9qMGUJ7xNW7KVNDm3EDml9wJL+pnr8@vger.kernel.org, AJvYcCXG+I5ySIcF4X/qe2vyw7JoG8M7XPSopHj+cGNtaa3gyA1uO55t0kC0SCxc5EJRMhQW1CIUTfWpM653@vger.kernel.org, AJvYcCXH44JQtZixkbRgUgqtLnjk0+kb2AZyPwf7OaAfoldxefFKCM5nvFwjuJEgMpa+3EJrsaQKpd0kTQ1CwjQ0fR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwasvUfbTmblZbuYI0pLcvEZMVXb+RM8WC7IjYrOrNr80EjGWZg
	V2FORxqRhGjb+YlwoE9jKLs/toEPRF7I7mzUqM0HA0ZZ4xIXfWkX
X-Google-Smtp-Source: AGHT+IEofYiLx2/5wMR+sM1290hRfxy8vnOc+kD+ZzgBkjVwn9H+NbPR1DcIAyqiApHCWTBPsWel6A==
X-Received: by 2002:a17:902:e74c:b0:20b:8109:2c90 with SMTP id d9443c01a7336-20fab2f5bb8mr57543295ad.61.1729760417186;
        Thu, 24 Oct 2024 02:00:17 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6e89sm68503615ad.277.2024.10.24.02.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:00:16 -0700 (PDT)
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
Subject: [PATCH v1 7/9] iio: adc: Add Nuvoton NCT6694 IIO support
Date: Thu, 24 Oct 2024 16:59:20 +0800
Message-Id: <20241024085922.133071-8-tmyu0@nuvoton.com>
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

This driver supports IIO functionality for NCT6694 MFD device
based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                   |   1 +
 drivers/iio/adc/Kconfig       |  10 +
 drivers/iio/adc/Makefile      |   1 +
 drivers/iio/adc/nct6694_adc.c | 616 ++++++++++++++++++++++++++++++++++
 4 files changed, 628 insertions(+)
 create mode 100644 drivers/iio/adc/nct6694_adc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2aa87ad84156..5c350eac187d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16440,6 +16440,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/hwmon/nct6694-hwmon.c
+F:	drivers/iio/adc/nct6694_adc.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/nct6694_canfd.c
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 6c4e74420fd2..302511d166db 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1018,6 +1018,16 @@ config NPCM_ADC
 	  This driver can also be built as a module. If so, the module
 	  will be called npcm_adc.
 
+config NCT6694_ADC
+	tristate "Nuvoton NCT6694 ADC driver"
+	depends on MFD_NCT6694
+	help
+	If you say yes to this option, support will be included for Nuvoton
+	NCT6694, a USB device to ADC.
+
+	This driver can also be built as a module. If so, the module
+	will be called nct6694_adc.
+
 config PAC1921
 	tristate "Microchip Technology PAC1921 driver"
 	depends on I2C
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 7b91cd98c0e0..db419f77365c 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_MP2629_ADC) += mp2629_adc.o
 obj-$(CONFIG_MXS_LRADC_ADC) += mxs-lradc-adc.o
 obj-$(CONFIG_NAU7802) += nau7802.o
 obj-$(CONFIG_NPCM_ADC) += npcm_adc.o
+obj-$(CONFIG_NCT6694_ADC) += nct6694_adc.o
 obj-$(CONFIG_PAC1921) += pac1921.o
 obj-$(CONFIG_PAC1934) += pac1934.o
 obj-$(CONFIG_PALMAS_GPADC) += palmas_gpadc.o
diff --git a/drivers/iio/adc/nct6694_adc.c b/drivers/iio/adc/nct6694_adc.c
new file mode 100644
index 000000000000..de4cddc8addc
--- /dev/null
+++ b/drivers/iio/adc/nct6694_adc.c
@@ -0,0 +1,616 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 IIO driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/iio/iio.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/nct6694.h>
+
+#define DRVNAME "nct6694-iio"
+
+/* Host interface */
+#define REQUEST_RPT_MOD		0xFF
+#define REQUEST_IIO_MOD		0x00
+
+/* Report Channel */
+#define IIO_VIN_STS(x)		(0x68 + (x))
+#define IIO_TMP_STS(x)		(0x6A + (x))
+#define IIO_TMP_STS_CH(x)		\
+	({ typeof(x) x_ = x;		\
+	   (x_ < 10) ? x_ : x_ + 6; })
+
+/* Message Channel*/
+/* Command 00h */
+#define REQUEST_IIO_CMD0_LEN	0x40
+#define REQUEST_IIO_CMD0_OFFSET 0x0000	/* OFFSET = SEL|CMD */
+#define IIO_VIN_EN(x)		(0x00 + (x))
+#define IIO_TMP_EN(x)		(0x02 + (x))
+/* Command 02h */
+#define REQUEST_IIO_CMD2_LEN	0x90
+#define REQUEST_IIO_CMD2_OFFSET 0x0002	/* OFFSET = SEL|CMD */
+#define IIO_SMI_CTRL_IDX	0x00
+#define IIO_VIN_LIMIT_IDX(x)	(0x10 + ((x) * 2))
+#define IIO_TMP_LIMIT_IDX(x)	(0x30 + ((x) * 2))
+#define IIO_CMD2_HYST_MASK	0x1F
+/* Command 03h */
+#define REQUEST_IIO_CMD3_LEN	0x08
+#define REQUEST_IIO_CMD3_OFFSET 0x0003	/* OFFSET = SEL|CMD */
+
+struct nct6694_iio_data {
+	struct nct6694 *nct6694;
+
+	/* Make sure read & write commands are consecutive */
+	struct mutex iio_lock;
+};
+
+static const struct iio_event_spec nct6694_volt_events[] = {
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_RISING,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE) |
+				 BIT(IIO_EV_INFO_ENABLE),
+	},
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_FALLING,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE) |
+				 BIT(IIO_EV_INFO_ENABLE),
+	}
+};
+
+static const struct iio_event_spec nct6694_temp_events[] = {
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_RISING,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE) |
+				 BIT(IIO_EV_INFO_ENABLE),
+	}
+};
+
+#define NCT6694_VOLTAGE_CHANNEL(num, addr) {			\
+	.type = IIO_VOLTAGE,					\
+	.indexed = 1,						\
+	.channel = num,						\
+	.address = addr,					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_ENABLE) |	\
+			      BIT(IIO_CHAN_INFO_PROCESSED),	\
+	.event_spec = nct6694_volt_events,			\
+	.num_event_specs = ARRAY_SIZE(nct6694_volt_events),	\
+}
+
+#define NCT6694_TEMPERATURE_CHANNEL(num, addr) {		\
+	.type = IIO_TEMP,					\
+	.indexed = 1,						\
+	.channel = num,						\
+	.address = addr,					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_ENABLE) |	\
+			      BIT(IIO_CHAN_INFO_PROCESSED) |	\
+			      BIT(IIO_CHAN_INFO_HYSTERESIS),	\
+	.event_spec = nct6694_temp_events,			\
+	.num_event_specs = ARRAY_SIZE(nct6694_temp_events),	\
+}
+
+static const struct iio_chan_spec nct6694_iio_channels[] = {
+	NCT6694_VOLTAGE_CHANNEL(0, 0x0),	/* VIN0 */
+	NCT6694_VOLTAGE_CHANNEL(1, 0x1),	/* VIN1 */
+	NCT6694_VOLTAGE_CHANNEL(2, 0x2),	/* VIN2 */
+	NCT6694_VOLTAGE_CHANNEL(3, 0x3),	/* VIN3 */
+	NCT6694_VOLTAGE_CHANNEL(4, 0x4),	/* VIN5 */
+	NCT6694_VOLTAGE_CHANNEL(5, 0x5),	/* VIN6 */
+	NCT6694_VOLTAGE_CHANNEL(6, 0x6),	/* VIN7 */
+	NCT6694_VOLTAGE_CHANNEL(7, 0x7),	/* VIN14 */
+	NCT6694_VOLTAGE_CHANNEL(8, 0x8),	/* VIN15 */
+	NCT6694_VOLTAGE_CHANNEL(9, 0x9),	/* VIN16 */
+	NCT6694_VOLTAGE_CHANNEL(10, 0xA),	/* VBAT */
+	NCT6694_VOLTAGE_CHANNEL(11, 0xB),	/* VSB */
+	NCT6694_VOLTAGE_CHANNEL(12, 0xC),	/* AVSB */
+	NCT6694_VOLTAGE_CHANNEL(13, 0xD),	/* VCC */
+	NCT6694_VOLTAGE_CHANNEL(14, 0xE),	/* VHIF */
+	NCT6694_VOLTAGE_CHANNEL(15, 0xF),	/* VTT */
+
+	NCT6694_TEMPERATURE_CHANNEL(0, 0x10),	/* THR1 */
+	NCT6694_TEMPERATURE_CHANNEL(1, 0x12),	/* THR2 */
+	NCT6694_TEMPERATURE_CHANNEL(2, 0x14),	/* THR14 */
+	NCT6694_TEMPERATURE_CHANNEL(3, 0x16),	/* THR15 */
+	NCT6694_TEMPERATURE_CHANNEL(4, 0x18),	/* THR16 */
+	NCT6694_TEMPERATURE_CHANNEL(5, 0x1A),	/* TDP0 */
+	NCT6694_TEMPERATURE_CHANNEL(6, 0x1C),	/* TDP1 */
+	NCT6694_TEMPERATURE_CHANNEL(7, 0x1E),	/* TDP2 */
+	NCT6694_TEMPERATURE_CHANNEL(8, 0x20),	/* TDP3 */
+	NCT6694_TEMPERATURE_CHANNEL(9, 0x22),	/* TDP4 */
+
+	NCT6694_TEMPERATURE_CHANNEL(10, 0x30),	/* DTIN0 */
+	NCT6694_TEMPERATURE_CHANNEL(11, 0x32),	/* DTIN1 */
+	NCT6694_TEMPERATURE_CHANNEL(12, 0x34),	/* DTIN2 */
+	NCT6694_TEMPERATURE_CHANNEL(13, 0x36),	/* DTIN3 */
+	NCT6694_TEMPERATURE_CHANNEL(14, 0x38),	/* DTIN4 */
+	NCT6694_TEMPERATURE_CHANNEL(15, 0x3A),	/* DTIN5 */
+	NCT6694_TEMPERATURE_CHANNEL(16, 0x3C),	/* DTIN6 */
+	NCT6694_TEMPERATURE_CHANNEL(17, 0x3E),	/* DTIN7 */
+	NCT6694_TEMPERATURE_CHANNEL(18, 0x40),	/* DTIN8 */
+	NCT6694_TEMPERATURE_CHANNEL(19, 0x42),	/* DTIN9 */
+	NCT6694_TEMPERATURE_CHANNEL(20, 0x44),	/* DTIN10 */
+	NCT6694_TEMPERATURE_CHANNEL(21, 0x46),	/* DTIN11 */
+	NCT6694_TEMPERATURE_CHANNEL(22, 0x48),	/* DTIN12 */
+	NCT6694_TEMPERATURE_CHANNEL(23, 0x4A),	/* DTIN13 */
+	NCT6694_TEMPERATURE_CHANNEL(24, 0x4C),	/* DTIN14 */
+	NCT6694_TEMPERATURE_CHANNEL(25, 0x4E),	/* DTIN15 */
+};
+
+static int nct6694_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int *val, int *val2, long mask)
+{
+	struct nct6694_iio_data *data = iio_priv(indio_dev);
+	unsigned char buf[2], tmp_hyst, enable_idx;
+	int ret;
+
+	if (chan->type != IIO_VOLTAGE && chan->type != IIO_TEMP)
+		return -EOPNOTSUPP;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_ENABLE:
+		switch (chan->type) {
+		case IIO_VOLTAGE:
+			enable_idx = IIO_VIN_EN(chan->channel / 8);
+			break;
+
+		case IIO_TEMP:
+			enable_idx = IIO_TMP_EN(chan->channel / 8);
+			break;
+
+		default:
+			return -EINVAL;
+		}
+		ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
+				       REQUEST_IIO_CMD0_OFFSET,
+				       REQUEST_IIO_CMD0_LEN, enable_idx,
+				       1, buf);
+		if (ret)
+			return -EINVAL;
+
+		*val = buf[0] & BIT(chan->channel % 8) ? 1 : 0;
+
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_PROCESSED:
+		ret = nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
+				       chan->address, 2, 0, 2, buf);
+		if (ret)
+			return -EINVAL;
+
+		switch (chan->type) {
+		case IIO_VOLTAGE:	/* in micro Voltage */
+			*val = buf[0] * 16;
+
+			return IIO_VAL_INT;
+
+		case IIO_TEMP:	/* in milli degrees Celsius */
+			*val = (signed char)buf[0] * 1000;
+			*val += buf[1] & 0x80 ? 500 : 0;
+			*val += buf[1] & 0x40 ? 250 : 0;
+			*val += buf[1] & 0x20 ? 125 : 0;
+
+			return IIO_VAL_INT;
+
+		default:
+			return -EINVAL;
+		}
+
+	case IIO_CHAN_INFO_HYSTERESIS:
+		ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
+				       REQUEST_IIO_CMD2_OFFSET,
+				       REQUEST_IIO_CMD2_LEN,
+				       IIO_TMP_LIMIT_IDX(chan->channel),
+				       2, buf);
+		if (ret)
+			return -EINVAL;
+
+		switch (chan->type) {
+		case IIO_TEMP:	/* in milli degrees Celsius */
+			tmp_hyst = buf[0] >> 5;
+			*val = (buf[1] - tmp_hyst) * 1000;
+
+			return IIO_VAL_INT;
+
+		default:
+			return -EINVAL;
+		}
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int nct6694_write_raw(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     int val, int val2, long mask)
+{
+	struct nct6694_iio_data *data = iio_priv(indio_dev);
+	unsigned char enable_buf[REQUEST_IIO_CMD0_LEN] = {0};
+	unsigned char buf[REQUEST_IIO_CMD2_LEN] = {0};
+	unsigned char delta_hyst;
+	int ret;
+
+	if (chan->type != IIO_VOLTAGE && chan->type != IIO_TEMP)
+		return -EOPNOTSUPP;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_ENABLE:
+		mutex_lock(&data->iio_lock);
+		ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
+				       REQUEST_IIO_CMD0_OFFSET,
+				       REQUEST_IIO_CMD0_LEN, 0,
+				       REQUEST_IIO_CMD0_LEN,
+				       enable_buf);
+		if (ret)
+			goto err;
+
+		switch (chan->type) {
+		case IIO_VOLTAGE:
+			if (val) {
+				enable_buf[IIO_VIN_EN(chan->channel / 8)] |=
+				BIT(chan->channel % 8);
+			} else {
+				enable_buf[IIO_VIN_EN(chan->channel / 8)] &=
+				~BIT(chan->channel % 8);
+			}
+
+			break;
+
+		case IIO_TEMP:
+			if (val) {
+				enable_buf[IIO_TMP_EN(chan->channel / 8)] |=
+				BIT(chan->channel % 8);
+			} else {
+				enable_buf[IIO_TMP_EN(chan->channel / 8)] &=
+				~BIT(chan->channel % 8);
+			}
+
+			break;
+
+		default:
+			ret = -EINVAL;
+			goto err;
+		}
+
+		ret = nct6694_write_msg(data->nct6694, REQUEST_IIO_MOD,
+					REQUEST_IIO_CMD0_OFFSET,
+					REQUEST_IIO_CMD0_LEN, enable_buf);
+		if (ret)
+			goto err;
+
+		break;
+
+	case IIO_CHAN_INFO_HYSTERESIS:
+		switch (chan->type) {
+		case IIO_TEMP:
+			mutex_lock(&data->iio_lock);
+			ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
+					       REQUEST_IIO_CMD2_OFFSET,
+					       REQUEST_IIO_CMD2_LEN, 0,
+					       REQUEST_IIO_CMD2_LEN, buf);
+			if (ret)
+				goto err;
+
+			delta_hyst = buf[IIO_TMP_LIMIT_IDX(chan->channel) + 1] - (u8)val;
+			if (delta_hyst > 7) {
+				pr_err("%s: The Hysteresis value must be less than 7!\n",
+				       __func__);
+				ret = -EINVAL;
+				goto err;
+			}
+
+			buf[IIO_TMP_LIMIT_IDX(chan->channel)] &= IIO_CMD2_HYST_MASK;
+			buf[IIO_TMP_LIMIT_IDX(chan->channel)] |= (delta_hyst << 5);
+			break;
+
+		default:
+			ret = -EINVAL;
+			goto err;
+		}
+		ret = nct6694_write_msg(data->nct6694, REQUEST_IIO_MOD,
+					REQUEST_IIO_CMD2_OFFSET,
+					REQUEST_IIO_CMD2_LEN, buf);
+		if (ret)
+			goto err;
+
+		break;
+
+	default:
+		ret = -EINVAL;
+		goto err;
+	}
+
+err:
+	mutex_unlock(&data->iio_lock);
+	return ret;
+}
+
+static int nct6694_read_event_config(struct iio_dev *indio_dev,
+				     const struct iio_chan_spec *chan,
+				     enum iio_event_type type,
+				     enum iio_event_direction dir)
+{
+	struct nct6694_iio_data *data = iio_priv(indio_dev);
+	unsigned char buf, ch;
+	int ret;
+
+	if (chan->type != IIO_VOLTAGE && chan->type != IIO_TEMP)
+		return -EOPNOTSUPP;
+
+	switch (dir) {
+	case IIO_EV_DIR_RISING:
+		switch (chan->type) {
+		case IIO_VOLTAGE:
+			ret = nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
+					       IIO_VIN_STS(chan->channel / 8),
+					       1, 0, 1, &buf);
+			if (ret)
+				return -EINVAL;
+
+			return !!(buf & BIT(chan->channel % 8));
+
+		case IIO_TEMP:
+			ch = (u8)IIO_TMP_STS_CH(chan->channel);
+
+			ret = nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
+					       IIO_TMP_STS(ch / 8),
+					       1, 0, 1, &buf);
+			if (ret)
+				return -EINVAL;
+
+			return !!(buf & BIT(ch % 8));
+
+		default:
+			return -EINVAL;
+		}
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int nct6694_read_event_value(struct iio_dev *indio_dev,
+				    const struct iio_chan_spec *chan,
+				    enum iio_event_type type,
+				    enum iio_event_direction dir,
+				    enum iio_event_info info,
+				    int *val, int *val2)
+{
+	struct nct6694_iio_data *data = iio_priv(indio_dev);
+	unsigned char buf[2];
+	int ret;
+
+	if (chan->type != IIO_VOLTAGE && chan->type != IIO_TEMP)
+		return -EOPNOTSUPP;
+
+	switch (dir) {
+	case IIO_EV_DIR_RISING:
+		switch (chan->type) {
+		case IIO_VOLTAGE:
+			ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
+					       REQUEST_IIO_CMD2_OFFSET,
+					       REQUEST_IIO_CMD2_LEN,
+					       IIO_VIN_LIMIT_IDX(chan->channel),
+					       2, buf);
+			if (ret)
+				return -EINVAL;
+
+			*val = buf[0] * 16;
+			return IIO_VAL_INT;
+
+		case IIO_TEMP:
+			ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
+					       REQUEST_IIO_CMD2_OFFSET,
+					       REQUEST_IIO_CMD2_LEN,
+					       IIO_TMP_LIMIT_IDX(chan->channel),
+					       2, buf);
+			if (ret)
+				return -EINVAL;
+
+			*val = (signed char)buf[1] * 1000;
+			return IIO_VAL_INT;
+
+		default:
+			return -EINVAL;
+		}
+
+	case IIO_EV_DIR_FALLING:
+		switch (chan->type) {
+		case IIO_VOLTAGE:
+			ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
+					       REQUEST_IIO_CMD2_OFFSET,
+					       REQUEST_IIO_CMD2_LEN,
+					       IIO_VIN_LIMIT_IDX(chan->channel),
+					       2, buf);
+			if (ret)
+				return -EINVAL;
+
+			*val = buf[1] * 16;
+			return IIO_VAL_INT;
+
+		default:
+			return -EINVAL;
+		}
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int nct6694_write_event_value(struct iio_dev *indio_dev,
+				     const struct iio_chan_spec *chan,
+				     enum iio_event_type type,
+				     enum iio_event_direction dir,
+				     enum iio_event_info info,
+				     int val, int val2)
+{
+	struct nct6694_iio_data *data = iio_priv(indio_dev);
+	unsigned char buf[REQUEST_IIO_CMD2_LEN] = {0};
+	int ret;
+
+	if (chan->type != IIO_VOLTAGE && chan->type != IIO_TEMP)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&data->iio_lock);
+	ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
+			       REQUEST_IIO_CMD2_OFFSET,
+			       REQUEST_IIO_CMD2_LEN, 0,
+			       REQUEST_IIO_CMD2_LEN, buf);
+	if (ret)
+		goto err;
+
+	switch (dir) {
+	case IIO_EV_DIR_RISING:
+		switch (chan->type) {
+		case IIO_VOLTAGE:
+			buf[IIO_VIN_LIMIT_IDX(chan->channel)] = (u8)val;
+			break;
+
+		case IIO_TEMP:
+			buf[IIO_TMP_LIMIT_IDX(chan->channel) + 1] = (s8)val;
+			break;
+
+		default:
+			ret = -EINVAL;
+			goto err;
+		}
+		break;
+
+	case IIO_EV_DIR_FALLING:
+		switch (chan->type) {
+		case IIO_VOLTAGE:
+			buf[IIO_VIN_LIMIT_IDX(chan->channel) + 1] = (u8)val;
+			break;
+
+		default:
+			ret = -EINVAL;
+			goto err;
+		}
+		break;
+
+	default:
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = nct6694_write_msg(data->nct6694, REQUEST_IIO_MOD,
+				REQUEST_IIO_CMD2_OFFSET,
+				REQUEST_IIO_CMD2_LEN, buf);
+	if (ret)
+		goto err;
+
+err:
+	mutex_unlock(&data->iio_lock);
+	return ret;
+}
+
+static const struct iio_info nct6694_iio_info = {
+	.read_raw = nct6694_read_raw,
+	.write_raw = nct6694_write_raw,
+	.read_event_config = nct6694_read_event_config,
+	.read_event_value = nct6694_read_event_value,
+	.write_event_value = nct6694_write_event_value,
+};
+
+static int nct6694_iio_init(struct nct6694_iio_data *data)
+{
+	unsigned char buf[REQUEST_IIO_CMD2_LEN] = {0};
+	int ret;
+
+	/* Set VIN & TMP Real Time alarm mode */
+	mutex_lock(&data->iio_lock);
+	ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
+			       REQUEST_IIO_CMD2_OFFSET,
+			       REQUEST_IIO_CMD2_LEN, 0,
+			       REQUEST_IIO_CMD2_LEN, buf);
+	if (ret)
+		goto err;
+
+	buf[IIO_SMI_CTRL_IDX] = 0x02;
+	ret = nct6694_write_msg(data->nct6694, REQUEST_IIO_MOD,
+				REQUEST_IIO_CMD2_OFFSET,
+				REQUEST_IIO_CMD2_LEN, buf);
+	if (ret)
+		goto err;
+
+err:
+	mutex_unlock(&data->iio_lock);
+	return ret;
+}
+
+static int nct6694_iio_probe(struct platform_device *pdev)
+{
+	struct iio_dev *indio_dev;
+	struct nct6694_iio_data *data;
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	data = iio_priv(indio_dev);
+	data->nct6694 = nct6694;
+	mutex_init(&data->iio_lock);
+	platform_set_drvdata(pdev, data);
+
+	ret = nct6694_iio_init(data);
+	if (ret)
+		return -EIO;
+
+	indio_dev->name = pdev->name;
+	indio_dev->channels = nct6694_iio_channels;
+	indio_dev->num_channels = ARRAY_SIZE(nct6694_iio_channels);
+	indio_dev->info = &nct6694_iio_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+
+	/* Register iio device to IIO framework */
+	ret = devm_iio_device_register(&pdev->dev, indio_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register iio device!\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver nct6694_iio_driver = {
+	.driver = {
+		.name	= DRVNAME,
+	},
+	.probe		= nct6694_iio_probe,
+};
+
+static int __init nct6694_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&nct6694_iio_driver);
+	if (!err) {
+		if (err)
+			platform_driver_unregister(&nct6694_iio_driver);
+	}
+
+	return err;
+}
+subsys_initcall(nct6694_init);
+
+static void __exit nct6694_exit(void)
+{
+	platform_driver_unregister(&nct6694_iio_driver);
+}
+module_exit(nct6694_exit);
+
+MODULE_DESCRIPTION("USB-IIO driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


