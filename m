Return-Path: <linux-i2c+bounces-3833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB88FD54F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 20:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 589021C21E97
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 18:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7829154BEA;
	Wed,  5 Jun 2024 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZhJ47nUi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9BB154444
	for <linux-i2c@vger.kernel.org>; Wed,  5 Jun 2024 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610600; cv=none; b=crGooK32hwjf+dYkMjQe7Y+qzO3v/3Oj9JHfGMJjm3mak/frgj1jdhz0Xpe+ug60smB8Cn1iX8PNhERvnD51t8Edk4h+H/DmSCx1B69BAVrIqTkCNiqEokNBSUdBS1861e1oKoun4BIVc9X4B99Qht5qk6Vbo4lR8x9yiPf+5cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610600; c=relaxed/simple;
	bh=BLTJ41wpBtcf3kU8nmI3BatBDrznlk9b0FbiRiKJMtE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lB9JBQ2DNgVCamZhLcWGNQg1exwO+uwkfRM2zmEaQy8AqWjB/nWSYEZs3EsCwQuFPI9M89SvnaA+6P/IGQXqHgKgiPNn3UjWbWaKNCqaXvjwd130vGMKqXXS9Nzl6VpYI4LqoSo8VkL0B/rotO0/u54gqULryVA0Rc1+WSo5hlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZhJ47nUi; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-627f20cff42so607147b3.0
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jun 2024 11:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610595; x=1718215395; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=agXJIWYTnSYKDeBOgiAFCjfM9OsVVF8iSwjgRkAIvFU=;
        b=ZhJ47nUiJ/ssmM6QwE9pShQ2Vsjv+7SrpBFVnjcStOBIjLOPfTJrn7D1mbjg+MeeHX
         WYWoOTtWJac438VRzV7T3YasQeqJECRxZHbafSlZ67ql5MEyNKNa/PLCCvXhzCUGR91V
         GxzyHs2Pn0LexJ1YvtHurKoyPgjO5WlDtH37WYyIg5rh0NaN4YOm9AQ74FJC78H3v6ff
         skNDJsJCuKeVRtcQptq4ws34Ym93FQswaHfG+93BuqSjxC4yGsY7fgXkUyrPbUUWWyRC
         0JxdwrlqyDoFqLE9ntZn+XPQhEOMP1yawZ9fAfdW5qG6lsr58cUtc5P6CReDIa3dS/Hs
         6YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610595; x=1718215395;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agXJIWYTnSYKDeBOgiAFCjfM9OsVVF8iSwjgRkAIvFU=;
        b=CCOUav2S7MYJ/T3QZPIRSyuT9zRLTizmj8CW4KFtciMOYIDKAQ5VAMNfZ1cWH8868Q
         q3bGuRHbgVjj3A1d3sMCfY2XG3XRCHQJWWyaiWDOgs9+tYsLQ9Yn7hJTKDvqqchbHVFw
         D21fUQ5tLdgrG2cJDALjrWuxdUtusP5zAylby1J3Pw4toY9bfMgYftdZPXqQMVFhb/zD
         HW3BkiZ6rb9+ubDIh/fQJ7E5ihTUsUUW3bIlfWA+ZzI/SYZdla3zd81EqxfnJeSjCWmW
         5ARRyTX4WjYD1V+CCYv/B8EVOul05sNCHfrHtA00pDW+uDJtF99OlJjgSvhKJV9v4TDq
         f15g==
X-Forwarded-Encrypted: i=1; AJvYcCV9hNBxa/FGaAD8aScGGw7p/Uo0YYH22A8xnJb5ya8kmapm9gd/dHxOD2XxEYGX0PcUnjQJu43UIqM1nX1nd5TXHi/FfC/Or1jx
X-Gm-Message-State: AOJu0YxaWGVUTpUWXPEjYV2txNWmxhsBsI33DjL1LW44wq/qZT2HsP7q
	F4ZUeVv+bcLE7VyNOkpVHB8TJAXX2//jHclJr/8IVE+KDXgoS4dYa14QQl4sxBBE/rlydTVexSD
	JOYSRgLH0sA==
X-Google-Smtp-Source: AGHT+IGibORXxKbpFL3XsRdYQmgXN/UUhng7olRjU4TOyjRaG1lHR7Rr+GK+/ZroyCG11D91URPzRvzxS4UOFw==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:388:b0:61b:e519:4d93 with SMTP
 id 00721157ae682-62cbb5b4538mr8976767b3.8.1717610595275; Wed, 05 Jun 2024
 11:03:15 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:38 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-8-joychakr@google.com>
Subject: [PATCH v1 17/17] rtc: Change nvmem reg_read/write return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t,
which is inturn used by devm_rtc_nvmem_register()

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406050200.8BOdZUla-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202406050356.LGDJ3PPU-lkp@intel.com/
Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/rtc/rtc-abx80x.c   | 15 ++++++++-------
 drivers/rtc/rtc-cmos.c     |  8 ++++----
 drivers/rtc/rtc-ds1305.c   | 18 ++++++++++++------
 drivers/rtc/rtc-ds1307.c   | 22 +++++++++++++--------
 drivers/rtc/rtc-ds1343.c   | 18 ++++++++++++------
 drivers/rtc/rtc-ds1511.c   | 12 ++++++------
 drivers/rtc/rtc-ds1553.c   | 14 ++++++++------
 drivers/rtc/rtc-ds1685.c   | 14 ++++++++------
 drivers/rtc/rtc-ds1742.c   | 14 ++++++++------
 drivers/rtc/rtc-ds3232.c   | 22 +++++++++++++--------
 drivers/rtc/rtc-isl12026.c | 12 ++++++------
 drivers/rtc/rtc-isl1208.c  |  8 ++++----
 drivers/rtc/rtc-m48t59.c   | 12 ++++++------
 drivers/rtc/rtc-m48t86.c   | 12 ++++++------
 drivers/rtc/rtc-max31335.c | 18 ++++++++++++------
 drivers/rtc/rtc-meson.c    | 18 ++++++++++++------
 drivers/rtc/rtc-omap.c     | 12 ++++++------
 drivers/rtc/rtc-pcf2127.c  | 20 +++++++++++--------
 drivers/rtc/rtc-pcf85063.c | 20 +++++++++++++------
 drivers/rtc/rtc-pcf85363.c | 39 +++++++++++++++++++++++---------------
 drivers/rtc/rtc-rp5c01.c   | 14 ++++++++------
 drivers/rtc/rtc-rv3028.c   | 32 +++++++++++++++++++------------
 drivers/rtc/rtc-rv3029c2.c | 20 +++++++++++++------
 drivers/rtc/rtc-rv3032.c   | 24 +++++++++++++++--------
 drivers/rtc/rtc-rv8803.c   | 16 ++++++++++------
 drivers/rtc/rtc-rx8581.c   | 39 +++++++++++++++++++++++---------------
 drivers/rtc/rtc-stk17ta8.c | 14 ++++++++------
 drivers/rtc/rtc-sun6i.c    |  8 ++++----
 drivers/rtc/rtc-ti-k3.c    | 16 ++++++++++------
 drivers/rtc/rtc-twl.c      | 20 +++++++++++++------
 30 files changed, 324 insertions(+), 207 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index fde2b8054c2e..415a575c904b 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -685,10 +685,11 @@ static int abx80x_setup_watchdog(struct abx80x_priv *priv)
 }
 #endif
 
-static int abx80x_nvmem_xfer(struct abx80x_priv *priv, unsigned int offset,
-			     void *val, size_t bytes, bool write)
+static ssize_t abx80x_nvmem_xfer(struct abx80x_priv *priv, unsigned int offset,
+				 void *val, size_t bytes, bool write)
 {
 	int ret;
+	size_t byte_count = bytes;
 
 	while (bytes) {
 		u8 extram, reg, len, lower, upper;
@@ -719,17 +720,17 @@ static int abx80x_nvmem_xfer(struct abx80x_priv *priv, unsigned int offset,
 		bytes -= len;
 	}
 
-	return 0;
+	return byte_count;
 }
 
-static int abx80x_nvmem_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t abx80x_nvmem_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
 	return abx80x_nvmem_xfer(priv, offset, val, bytes, false);
 }
 
-static int abx80x_nvmem_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t abx80x_nvmem_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	return abx80x_nvmem_xfer(priv, offset, val, bytes, true);
 }
diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 7d99cd2c37a0..eb8e6947a7e3 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -639,8 +639,8 @@ static const struct rtc_class_ops cmos_rtc_ops = {
 
 #define NVRAM_OFFSET	(RTC_REG_D + 1)
 
-static int cmos_nvram_read(void *priv, unsigned int off, void *val,
-			   size_t count)
+static ssize_t cmos_nvram_read(void *priv, unsigned int off, void *val,
+			       size_t count)
 {
 	unsigned char *buf = val;
 	int	retval;
@@ -660,8 +660,8 @@ static int cmos_nvram_read(void *priv, unsigned int off, void *val,
 	return retval;
 }
 
-static int cmos_nvram_write(void *priv, unsigned int off, void *val,
-			    size_t count)
+static ssize_t cmos_nvram_write(void *priv, unsigned int off, void *val,
+				size_t count)
 {
 	struct cmos_rtc	*cmos = priv;
 	unsigned char	*buf = val;
diff --git a/drivers/rtc/rtc-ds1305.c b/drivers/rtc/rtc-ds1305.c
index d4de401548b4..d59798c93dd8 100644
--- a/drivers/rtc/rtc-ds1305.c
+++ b/drivers/rtc/rtc-ds1305.c
@@ -504,34 +504,40 @@ static void msg_init(struct spi_message *m, struct spi_transfer *x,
 	spi_message_add_tail(x, m);
 }
 
-static int ds1305_nvram_read(void *priv, unsigned int off, void *buf,
-			     size_t count)
+static ssize_t ds1305_nvram_read(void *priv, unsigned int off, void *buf,
+				 size_t count)
 {
 	struct ds1305		*ds1305 = priv;
 	struct spi_device	*spi = ds1305->spi;
 	u8			addr;
 	struct spi_message	m;
 	struct spi_transfer	x[2];
+	int ret;
 
 	addr = DS1305_NVRAM + off;
 	msg_init(&m, x, &addr, count, NULL, buf);
 
-	return spi_sync(spi, &m);
+	ret = spi_sync(spi, &m);
+
+	return ret < 0 ? ret : count;
 }
 
-static int ds1305_nvram_write(void *priv, unsigned int off, void *buf,
-			      size_t count)
+static ssize_t ds1305_nvram_write(void *priv, unsigned int off, void *buf,
+				  size_t count)
 {
 	struct ds1305		*ds1305 = priv;
 	struct spi_device	*spi = ds1305->spi;
 	u8			addr;
 	struct spi_message	m;
 	struct spi_transfer	x[2];
+	int ret;
 
 	addr = (DS1305_WRITE | DS1305_NVRAM) + off;
 	msg_init(&m, x, &addr, count, buf, NULL);
 
-	return spi_sync(spi, &m);
+	ret = spi_sync(spi, &m);
+
+	return ret < 0 ? ret : count;
 }
 
 /*----------------------------------------------------------------------*/
diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 506b7d1c2397..179bb3b930d9 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1254,24 +1254,30 @@ static int ds1307_add_frequency_test(struct ds1307 *ds1307)
 
 /*----------------------------------------------------------------------*/
 
-static int ds1307_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t ds1307_nvram_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
 	struct ds1307 *ds1307 = priv;
 	const struct chip_desc *chip = &chips[ds1307->type];
+	int ret;
 
-	return regmap_bulk_read(ds1307->regmap, chip->nvram_offset + offset,
-				val, bytes);
+	ret = regmap_bulk_read(ds1307->regmap, chip->nvram_offset + offset,
+			       val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int ds1307_nvram_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t ds1307_nvram_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	struct ds1307 *ds1307 = priv;
 	const struct chip_desc *chip = &chips[ds1307->type];
+	int ret;
+
+	ret = regmap_bulk_write(ds1307->regmap, chip->nvram_offset + offset,
+				val, bytes);
 
-	return regmap_bulk_write(ds1307->regmap, chip->nvram_offset + offset,
-				 val, bytes);
+	return ret < 0 ? ret : bytes;
 }
 
 /*----------------------------------------------------------------------*/
diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index ed5a6ba89a3e..910ee0a0320c 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -123,20 +123,26 @@ static ssize_t ds1343_store_glitchfilter(struct device *dev,
 static DEVICE_ATTR(glitch_filter, S_IRUGO | S_IWUSR, ds1343_show_glitchfilter,
 			ds1343_store_glitchfilter);
 
-static int ds1343_nvram_write(void *priv, unsigned int off, void *val,
-			      size_t bytes)
+static ssize_t ds1343_nvram_write(void *priv, unsigned int off, void *val,
+				  size_t bytes)
 {
 	struct ds1343_priv *ds1343 = priv;
+	int ret;
 
-	return regmap_bulk_write(ds1343->map, DS1343_NVRAM + off, val, bytes);
+	ret = regmap_bulk_write(ds1343->map, DS1343_NVRAM + off, val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int ds1343_nvram_read(void *priv, unsigned int off, void *val,
-			     size_t bytes)
+static ssize_t ds1343_nvram_read(void *priv, unsigned int off, void *val,
+				 size_t bytes)
 {
 	struct ds1343_priv *ds1343 = priv;
+	int ret;
+
+	ret = regmap_bulk_read(ds1343->map, DS1343_NVRAM + off, val, bytes);
 
-	return regmap_bulk_read(ds1343->map, DS1343_NVRAM + off, val, bytes);
+	return ret < 0 ? ret : bytes;
 }
 
 static ssize_t ds1343_show_tricklecharger(struct device *dev,
diff --git a/drivers/rtc/rtc-ds1511.c b/drivers/rtc/rtc-ds1511.c
index 8b087d9556be..87128130e106 100644
--- a/drivers/rtc/rtc-ds1511.c
+++ b/drivers/rtc/rtc-ds1511.c
@@ -245,8 +245,8 @@ static const struct rtc_class_ops ds1511_rtc_ops = {
 	.alarm_irq_enable	= ds1511_rtc_alarm_irq_enable,
 };
 
-static int ds1511_nvram_read(void *priv, unsigned int pos, void *buf,
-			     size_t size)
+static ssize_t ds1511_nvram_read(void *priv, unsigned int pos, void *buf,
+				 size_t size)
 {
 	int i;
 
@@ -254,11 +254,11 @@ static int ds1511_nvram_read(void *priv, unsigned int pos, void *buf,
 	for (i = 0; i < size; i++)
 		*(char *)buf++ = rtc_read(DS1511_RAMDATA);
 
-	return 0;
+	return size;
 }
 
-static int ds1511_nvram_write(void *priv, unsigned int pos, void *buf,
-			      size_t size)
+static ssize_t ds1511_nvram_write(void *priv, unsigned int pos, void *buf,
+				  size_t size)
 {
 	int i;
 
@@ -266,7 +266,7 @@ static int ds1511_nvram_write(void *priv, unsigned int pos, void *buf,
 	for (i = 0; i < size; i++)
 		rtc_write(*(char *)buf++, DS1511_RAMDATA);
 
-	return 0;
+	return size;
 }
 
 static int ds1511_rtc_probe(struct platform_device *pdev)
diff --git a/drivers/rtc/rtc-ds1553.c b/drivers/rtc/rtc-ds1553.c
index dbff5b621ef5..ac4304ec21fa 100644
--- a/drivers/rtc/rtc-ds1553.c
+++ b/drivers/rtc/rtc-ds1553.c
@@ -221,30 +221,32 @@ static const struct rtc_class_ops ds1553_rtc_ops = {
 	.alarm_irq_enable	= ds1553_rtc_alarm_irq_enable,
 };
 
-static int ds1553_nvram_read(void *priv, unsigned int pos, void *val,
-			     size_t bytes)
+static ssize_t ds1553_nvram_read(void *priv, unsigned int pos, void *val,
+				 size_t bytes)
 {
 	struct platform_device *pdev = priv;
 	struct rtc_plat_data *pdata = platform_get_drvdata(pdev);
 	void __iomem *ioaddr = pdata->ioaddr;
+	size_t bytes_read = bytes;
 	u8 *buf = val;
 
 	for (; bytes; bytes--)
 		*buf++ = readb(ioaddr + pos++);
-	return 0;
+	return bytes_read;
 }
 
-static int ds1553_nvram_write(void *priv, unsigned int pos, void *val,
-			      size_t bytes)
+static ssize_t ds1553_nvram_write(void *priv, unsigned int pos, void *val,
+				  size_t bytes)
 {
 	struct platform_device *pdev = priv;
 	struct rtc_plat_data *pdata = platform_get_drvdata(pdev);
 	void __iomem *ioaddr = pdata->ioaddr;
+	size_t bytes_written = bytes;
 	u8 *buf = val;
 
 	for (; bytes; bytes--)
 		writeb(*buf++, ioaddr + pos++);
-	return 0;
+	return bytes_written;
 }
 
 static int ds1553_rtc_probe(struct platform_device *pdev)
diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 04dbf35cf3b7..0f113cff4b69 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -837,11 +837,12 @@ ds1685_rtc_ops = {
 };
 /* ----------------------------------------------------------------------- */
 
-static int ds1685_nvram_read(void *priv, unsigned int pos, void *val,
-			     size_t size)
+static ssize_t ds1685_nvram_read(void *priv, unsigned int pos, void *val,
+				 size_t size)
 {
 	struct ds1685_priv *rtc = priv;
 	struct mutex *rtc_mutex = &rtc->dev->ops_lock;
+	size_t size_read = size;
 	ssize_t count;
 	u8 *buf = val;
 	int err;
@@ -901,14 +902,15 @@ static int ds1685_nvram_read(void *priv, unsigned int pos, void *val,
 #endif /* !CONFIG_RTC_DRV_DS1689 */
 	mutex_unlock(rtc_mutex);
 
-	return 0;
+	return size_read;
 }
 
-static int ds1685_nvram_write(void *priv, unsigned int pos, void *val,
-			      size_t size)
+static ssize_t ds1685_nvram_write(void *priv, unsigned int pos, void *val,
+				  size_t size)
 {
 	struct ds1685_priv *rtc = priv;
 	struct mutex *rtc_mutex = &rtc->dev->ops_lock;
+	size_t size_written = size;
 	ssize_t count;
 	u8 *buf = val;
 	int err;
@@ -968,7 +970,7 @@ static int ds1685_nvram_write(void *priv, unsigned int pos, void *val,
 #endif /* !CONFIG_RTC_DRV_DS1689 */
 	mutex_unlock(rtc_mutex);
 
-	return 0;
+	return size_written;
 }
 
 /* ----------------------------------------------------------------------- */
diff --git a/drivers/rtc/rtc-ds1742.c b/drivers/rtc/rtc-ds1742.c
index 6ae8b9a294fe..cdc3159dd69a 100644
--- a/drivers/rtc/rtc-ds1742.c
+++ b/drivers/rtc/rtc-ds1742.c
@@ -114,28 +114,30 @@ static const struct rtc_class_ops ds1742_rtc_ops = {
 	.set_time	= ds1742_rtc_set_time,
 };
 
-static int ds1742_nvram_read(void *priv, unsigned int pos, void *val,
-			     size_t bytes)
+static ssize_t ds1742_nvram_read(void *priv, unsigned int pos, void *val,
+				 size_t bytes)
 {
 	struct rtc_plat_data *pdata = priv;
 	void __iomem *ioaddr = pdata->ioaddr_nvram;
+	ssize_t bytes_read = bytes;
 	u8 *buf = val;
 
 	for (; bytes; bytes--)
 		*buf++ = readb(ioaddr + pos++);
-	return 0;
+	return bytes_read;
 }
 
-static int ds1742_nvram_write(void *priv, unsigned int pos, void *val,
-			      size_t bytes)
+static ssize_t ds1742_nvram_write(void *priv, unsigned int pos, void *val,
+				  size_t bytes)
 {
 	struct rtc_plat_data *pdata = priv;
 	void __iomem *ioaddr = pdata->ioaddr_nvram;
+	ssize_t bytes_written = bytes;
 	u8 *buf = val;
 
 	for (; bytes; bytes--)
 		writeb(*buf++, ioaddr + pos++);
-	return 0;
+	return bytes_written;
 }
 
 static int ds1742_rtc_probe(struct platform_device *pdev)
diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index 1485a6ae51e6..0ea97da761b6 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -460,22 +460,28 @@ static const struct rtc_class_ops ds3232_rtc_ops = {
 	.alarm_irq_enable = ds3232_alarm_irq_enable,
 };
 
-static int ds3232_nvmem_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t ds3232_nvmem_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
 	struct regmap *ds3232_regmap = (struct regmap *)priv;
+	int ret;
 
-	return regmap_bulk_read(ds3232_regmap, DS3232_REG_SRAM_START + offset,
-				val, bytes);
+	ret = regmap_bulk_read(ds3232_regmap, DS3232_REG_SRAM_START + offset,
+			       val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int ds3232_nvmem_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t ds3232_nvmem_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	struct regmap *ds3232_regmap = (struct regmap *)priv;
+	int ret;
+
+	ret = regmap_bulk_write(ds3232_regmap, DS3232_REG_SRAM_START + offset,
+				val, bytes);
 
-	return regmap_bulk_write(ds3232_regmap, DS3232_REG_SRAM_START + offset,
-				 val, bytes);
+	return ret < 0 ? ret : bytes;
 }
 
 static int ds3232_probe(struct device *dev, struct regmap *regmap, int irq,
diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
index 2aabb9151d4c..0368cf3c95cd 100644
--- a/drivers/rtc/rtc-isl12026.c
+++ b/drivers/rtc/rtc-isl12026.c
@@ -274,8 +274,8 @@ static const struct rtc_class_ops isl12026_rtc_ops = {
 	.set_time	= isl12026_rtc_set_time,
 };
 
-static int isl12026_nvm_read(void *p, unsigned int offset,
-			     void *val, size_t bytes)
+static ssize_t isl12026_nvm_read(void *p, unsigned int offset,
+				 void *val, size_t bytes)
 {
 	struct isl12026 *priv = p;
 	int ret;
@@ -315,11 +315,11 @@ static int isl12026_nvm_read(void *p, unsigned int offset,
 		return ret < 0 ? ret : -EIO;
 	}
 
-	return 0;
+	return bytes;
 }
 
-static int isl12026_nvm_write(void *p, unsigned int offset,
-			      void *val, size_t bytes)
+static ssize_t isl12026_nvm_write(void *p, unsigned int offset,
+				  void *val, size_t bytes)
 {
 	struct isl12026 *priv = p;
 	int ret;
@@ -372,7 +372,7 @@ static int isl12026_nvm_write(void *p, unsigned int offset,
 
 	mutex_unlock(&priv->rtc->ops_lock);
 
-	return ret;
+	return ret < 0 ? ret : num_written;
 }
 
 static void isl12026_force_power_modes(struct i2c_client *client)
diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index e50c23ee1646..3523c18f4034 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -770,8 +770,8 @@ static const struct attribute_group isl1219_rtc_sysfs_files = {
 	.attrs	= isl1219_rtc_attrs,
 };
 
-static int isl1208_nvmem_read(void *priv, unsigned int off, void *buf,
-			      size_t count)
+static ssize_t isl1208_nvmem_read(void *priv, unsigned int off, void *buf,
+				  size_t count)
 {
 	struct isl1208_state *isl1208 = priv;
 	struct i2c_client *client = to_i2c_client(isl1208->rtc->dev.parent);
@@ -785,8 +785,8 @@ static int isl1208_nvmem_read(void *priv, unsigned int off, void *buf,
 	return ret == 0 ? count : ret;
 }
 
-static int isl1208_nvmem_write(void *priv, unsigned int off, void *buf,
-			       size_t count)
+static ssize_t isl1208_nvmem_write(void *priv, unsigned int off, void *buf,
+				   size_t count)
 {
 	struct isl1208_state *isl1208 = priv;
 	struct i2c_client *client = to_i2c_client(isl1208->rtc->dev.parent);
diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index f0f6b9b6daec..53e21878effc 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -313,8 +313,8 @@ static const struct rtc_class_ops m48t59_rtc_ops = {
 	.alarm_irq_enable = m48t59_rtc_alarm_irq_enable,
 };
 
-static int m48t59_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t size)
+static ssize_t m48t59_nvram_read(void *priv, unsigned int offset, void *val,
+				 size_t size)
 {
 	struct platform_device *pdev = priv;
 	struct device *dev = &pdev->dev;
@@ -331,11 +331,11 @@ static int m48t59_nvram_read(void *priv, unsigned int offset, void *val,
 
 	spin_unlock_irqrestore(&m48t59->lock, flags);
 
-	return 0;
+	return cnt;
 }
 
-static int m48t59_nvram_write(void *priv, unsigned int offset, void *val,
-			      size_t size)
+static ssize_t m48t59_nvram_write(void *priv, unsigned int offset, void *val,
+				  size_t size)
 {
 	struct platform_device *pdev = priv;
 	struct device *dev = &pdev->dev;
@@ -352,7 +352,7 @@ static int m48t59_nvram_write(void *priv, unsigned int offset, void *val,
 
 	spin_unlock_irqrestore(&m48t59->lock, flags);
 
-	return 0;
+	return cnt;
 }
 
 static int m48t59_rtc_probe(struct platform_device *pdev)
diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
index dd4a62e2d39c..c10829617d2e 100644
--- a/drivers/rtc/rtc-m48t86.c
+++ b/drivers/rtc/rtc-m48t86.c
@@ -161,8 +161,8 @@ static const struct rtc_class_ops m48t86_rtc_ops = {
 	.proc		= m48t86_rtc_proc,
 };
 
-static int m48t86_nvram_read(void *priv, unsigned int off, void *buf,
-			     size_t count)
+static ssize_t m48t86_nvram_read(void *priv, unsigned int off, void *buf,
+				 size_t count)
 {
 	struct device *dev = priv;
 	unsigned int i;
@@ -170,11 +170,11 @@ static int m48t86_nvram_read(void *priv, unsigned int off, void *buf,
 	for (i = 0; i < count; i++)
 		((u8 *)buf)[i] = m48t86_readb(dev, M48T86_NVRAM(off + i));
 
-	return 0;
+	return count;
 }
 
-static int m48t86_nvram_write(void *priv, unsigned int off, void *buf,
-			      size_t count)
+static ssize_t m48t86_nvram_write(void *priv, unsigned int off, void *buf,
+				  size_t count)
 {
 	struct device *dev = priv;
 	unsigned int i;
@@ -182,7 +182,7 @@ static int m48t86_nvram_write(void *priv, unsigned int off, void *buf,
 	for (i = 0; i < count; i++)
 		m48t86_writeb(dev, ((u8 *)buf)[i], M48T86_NVRAM(off + i));
 
-	return 0;
+	return count;
 }
 
 /*
diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index a2441e5c2c74..03f29ed19e58 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -496,22 +496,28 @@ static struct clk_init_data max31335_clk_init = {
 	.ops = &max31335_clkout_ops,
 };
 
-static int max31335_nvmem_reg_read(void *priv, unsigned int offset,
-				   void *val, size_t bytes)
+static ssize_t max31335_nvmem_reg_read(void *priv, unsigned int offset,
+				       void *val, size_t bytes)
 {
 	struct max31335_data *max31335 = priv;
 	unsigned int reg = MAX31335_TS0_SEC_1_128 + offset;
+	int ret;
+
+	ret = regmap_bulk_read(max31335->regmap, reg, val, bytes);
 
-	return regmap_bulk_read(max31335->regmap, reg, val, bytes);
+	return ret < 0 ? ret : bytes;
 }
 
-static int max31335_nvmem_reg_write(void *priv, unsigned int offset,
-				    void *val, size_t bytes)
+static ssize_t max31335_nvmem_reg_write(void *priv, unsigned int offset,
+					void *val, size_t bytes)
 {
 	struct max31335_data *max31335 = priv;
 	unsigned int reg = MAX31335_TS0_SEC_1_128 + offset;
+	int ret;
+
+	ret = regmap_bulk_write(max31335->regmap, reg, val, bytes);
 
-	return regmap_bulk_write(max31335->regmap, reg, val, bytes);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config max31335_nvmem_cfg = {
diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index db1d626edca5..0e4d05a4c68d 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -255,28 +255,34 @@ static const struct rtc_class_ops meson_rtc_ops = {
 
 /* NVMEM interface layer functions */
 
-static int meson_rtc_regmem_read(void *context, unsigned int offset,
-				 void *buf, size_t bytes)
+static ssize_t meson_rtc_regmem_read(void *context, unsigned int offset,
+				     void *buf, size_t bytes)
 {
 	struct meson_rtc *rtc = context;
 	unsigned int read_offset, read_size;
+	int ret;
 
 	read_offset = RTC_REGMEM_0 + (offset / 4);
 	read_size = bytes / 4;
 
-	return regmap_bulk_read(rtc->serial, read_offset, buf, read_size);
+	ret = regmap_bulk_read(rtc->serial, read_offset, buf, read_size);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int meson_rtc_regmem_write(void *context, unsigned int offset,
-				  void *buf, size_t bytes)
+static ssize_t meson_rtc_regmem_write(void *context, unsigned int offset,
+				      void *buf, size_t bytes)
 {
 	struct meson_rtc *rtc = context;
 	unsigned int write_offset, write_size;
+	int ret;
 
 	write_offset = RTC_REGMEM_0 + (offset / 4);
 	write_size = bytes / 4;
 
-	return regmap_bulk_write(rtc->serial, write_offset, buf, write_size);
+	ret = regmap_bulk_write(rtc->serial, write_offset, buf, write_size);
+
+	return ret < 0 ? ret : bytes;
 }
 
 static int meson_rtc_probe(struct platform_device *pdev)
diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index c6155c48a4ac..81cad3c3690b 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -685,8 +685,8 @@ static struct pinctrl_desc rtc_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
-static int omap_rtc_scratch_read(void *priv, unsigned int offset, void *_val,
-				 size_t bytes)
+static ssize_t omap_rtc_scratch_read(void *priv, unsigned int offset, void *_val,
+				     size_t bytes)
 {
 	struct omap_rtc	*rtc = priv;
 	u32 *val = _val;
@@ -696,11 +696,11 @@ static int omap_rtc_scratch_read(void *priv, unsigned int offset, void *_val,
 		val[i] = rtc_readl(rtc,
 				   OMAP_RTC_SCRATCH0_REG + offset + (i * 4));
 
-	return 0;
+	return bytes;
 }
 
-static int omap_rtc_scratch_write(void *priv, unsigned int offset, void *_val,
-				  size_t bytes)
+static ssize_t omap_rtc_scratch_write(void *priv, unsigned int offset, void *_val,
+				      size_t bytes)
 {
 	struct omap_rtc	*rtc = priv;
 	u32 *val = _val;
@@ -712,7 +712,7 @@ static int omap_rtc_scratch_write(void *priv, unsigned int offset, void *_val,
 			   OMAP_RTC_SCRATCH0_REG + offset + (i * 4), val[i]);
 	rtc->type->lock(rtc);
 
-	return 0;
+	return bytes;
 }
 
 static struct nvmem_config omap_rtc_nvmem_config = {
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 9c04c4e1a49c..0303cf51fb3e 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -361,8 +361,8 @@ static int pcf2127_rtc_ioctl(struct device *dev,
 	}
 }
 
-static int pcf2127_nvmem_read(void *priv, unsigned int offset,
-			      void *val, size_t bytes)
+static ssize_t pcf2127_nvmem_read(void *priv, unsigned int offset,
+				  void *val, size_t bytes)
 {
 	struct pcf2127 *pcf2127 = priv;
 	int ret;
@@ -373,12 +373,14 @@ static int pcf2127_nvmem_read(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	return regmap_bulk_read(pcf2127->regmap, PCF2127_REG_RAM_RD_CMD,
-				val, bytes);
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_RAM_RD_CMD,
+			       val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int pcf2127_nvmem_write(void *priv, unsigned int offset,
-			       void *val, size_t bytes)
+static ssize_t pcf2127_nvmem_write(void *priv, unsigned int offset,
+				   void *val, size_t bytes)
 {
 	struct pcf2127 *pcf2127 = priv;
 	int ret;
@@ -389,8 +391,10 @@ static int pcf2127_nvmem_write(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	return regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_WRT_CMD,
-				 val, bytes);
+	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_WRT_CMD,
+				val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
 /* watchdog driver */
diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index fdbc07f14036..bccb55b4985c 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -319,16 +319,24 @@ static const struct rtc_class_ops pcf85063_rtc_ops = {
 	.ioctl		= pcf85063_ioctl,
 };
 
-static int pcf85063_nvmem_read(void *priv, unsigned int offset,
-			       void *val, size_t bytes)
+static ssize_t pcf85063_nvmem_read(void *priv, unsigned int offset,
+				   void *val, size_t bytes)
 {
-	return regmap_read(priv, PCF85063_REG_RAM, val);
+	int ret;
+
+	ret = regmap_read(priv, PCF85063_REG_RAM, val);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int pcf85063_nvmem_write(void *priv, unsigned int offset,
-				void *val, size_t bytes)
+static ssize_t pcf85063_nvmem_write(void *priv, unsigned int offset,
+				    void *val, size_t bytes)
 {
-	return regmap_write(priv, PCF85063_REG_RAM, *(u8 *)val);
+	int ret;
+
+	ret = regmap_write(priv, PCF85063_REG_RAM, *(u8 *)val);
+
+	return ret < 0 ? ret : bytes;
 }
 
 static int pcf85063_load_capacitance(struct pcf85063 *pcf85063,
diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index 540042b9eec8..3ad91f2ee417 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -319,26 +319,32 @@ static const struct rtc_class_ops rtc_ops = {
 	.alarm_irq_enable = pcf85363_rtc_alarm_irq_enable,
 };
 
-static int pcf85363_nvram_read(void *priv, unsigned int offset, void *val,
-			       size_t bytes)
+static ssize_t pcf85363_nvram_read(void *priv, unsigned int offset, void *val,
+				   size_t bytes)
 {
 	struct pcf85363 *pcf85363 = priv;
+	int ret;
 
-	return regmap_bulk_read(pcf85363->regmap, CTRL_RAM + offset,
-				val, bytes);
+	ret = regmap_bulk_read(pcf85363->regmap, CTRL_RAM + offset,
+			       val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int pcf85363_nvram_write(void *priv, unsigned int offset, void *val,
-				size_t bytes)
+static ssize_t pcf85363_nvram_write(void *priv, unsigned int offset, void *val,
+				    size_t bytes)
 {
 	struct pcf85363 *pcf85363 = priv;
+	int ret;
 
-	return regmap_bulk_write(pcf85363->regmap, CTRL_RAM + offset,
-				 val, bytes);
+	ret = regmap_bulk_write(pcf85363->regmap, CTRL_RAM + offset,
+				val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int pcf85x63_nvram_read(void *priv, unsigned int offset, void *val,
-			       size_t bytes)
+static ssize_t pcf85x63_nvram_read(void *priv, unsigned int offset, void *val,
+				   size_t bytes)
 {
 	struct pcf85363 *pcf85363 = priv;
 	unsigned int tmp_val;
@@ -347,18 +353,21 @@ static int pcf85x63_nvram_read(void *priv, unsigned int offset, void *val,
 	ret = regmap_read(pcf85363->regmap, CTRL_RAMBYTE, &tmp_val);
 	(*(unsigned char *) val) = (unsigned char) tmp_val;
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
-static int pcf85x63_nvram_write(void *priv, unsigned int offset, void *val,
-				size_t bytes)
+static ssize_t pcf85x63_nvram_write(void *priv, unsigned int offset, void *val,
+				    size_t bytes)
 {
 	struct pcf85363 *pcf85363 = priv;
 	unsigned char tmp_val;
+	int ret;
 
 	tmp_val = *((unsigned char *)val);
-	return regmap_write(pcf85363->regmap, CTRL_RAMBYTE,
-				(unsigned int)tmp_val);
+	ret = regmap_write(pcf85363->regmap, CTRL_RAMBYTE,
+			   (unsigned int)tmp_val);
+
+	return ret < 0 ? ret : bytes;
 }
 
 static const struct pcf85x63_config pcf_85263_config = {
diff --git a/drivers/rtc/rtc-rp5c01.c b/drivers/rtc/rtc-rp5c01.c
index 44afa6d996e7..156f9086caab 100644
--- a/drivers/rtc/rtc-rp5c01.c
+++ b/drivers/rtc/rtc-rp5c01.c
@@ -160,10 +160,11 @@ static const struct rtc_class_ops rp5c01_rtc_ops = {
  * byte is stored in BLOCK10, the low nibble in BLOCK11.
  */
 
-static int rp5c01_nvram_read(void *_priv, unsigned int pos, void *val,
-			     size_t bytes)
+static ssize_t rp5c01_nvram_read(void *_priv, unsigned int pos, void *val,
+				 size_t bytes)
 {
 	struct rp5c01_priv *priv = _priv;
+	size_t bytes_read = bytes;
 	u8 *buf = val;
 
 	spin_lock_irq(&priv->lock);
@@ -185,13 +186,14 @@ static int rp5c01_nvram_read(void *_priv, unsigned int pos, void *val,
 	}
 
 	spin_unlock_irq(&priv->lock);
-	return 0;
+	return bytes_read;
 }
 
-static int rp5c01_nvram_write(void *_priv, unsigned int pos, void *val,
-			      size_t bytes)
+static ssize_t rp5c01_nvram_write(void *_priv, unsigned int pos, void *val,
+				  size_t bytes)
 {
 	struct rp5c01_priv *priv = _priv;
+	size_t bytes_written = bytes;
 	u8 *buf = val;
 
 	spin_lock_irq(&priv->lock);
@@ -212,7 +214,7 @@ static int rp5c01_nvram_write(void *_priv, unsigned int pos, void *val,
 	}
 
 	spin_unlock_irq(&priv->lock);
-	return 0;
+	return bytes_written;
 }
 
 static int __init rp5c01_rtc_probe(struct platform_device *dev)
diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 2f001c59c61d..3e2c6497f4d7 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -600,20 +600,28 @@ static int rv3028_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 	}
 }
 
-static int rv3028_nvram_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t rv3028_nvram_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
-	return regmap_bulk_write(priv, RV3028_RAM1 + offset, val, bytes);
+	int ret;
+
+	ret = regmap_bulk_write(priv, RV3028_RAM1 + offset, val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int rv3028_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t rv3028_nvram_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
-	return regmap_bulk_read(priv, RV3028_RAM1 + offset, val, bytes);
+	int ret;
+
+	ret = regmap_bulk_read(priv, RV3028_RAM1 + offset, val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int rv3028_eeprom_write(void *priv, unsigned int offset, void *val,
-			       size_t bytes)
+static ssize_t rv3028_eeprom_write(void *priv, unsigned int offset, void *val,
+				   size_t bytes)
 {
 	struct rv3028_data *rv3028 = priv;
 	u32 status, eerd;
@@ -655,11 +663,11 @@ static int rv3028_eeprom_write(void *priv, unsigned int offset, void *val,
 restore_eerd:
 	rv3028_exit_eerd(rv3028, eerd);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
-static int rv3028_eeprom_read(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t rv3028_eeprom_read(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	struct rv3028_data *rv3028 = priv;
 	u32 status, eerd, data;
@@ -700,7 +708,7 @@ static int rv3028_eeprom_read(void *priv, unsigned int offset, void *val,
 restore_eerd:
 	rv3028_exit_eerd(rv3028, eerd);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
 #ifdef CONFIG_COMMON_CLK
diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 4a81feeb00ff..63466d76eaa1 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -472,16 +472,24 @@ static int rv3029_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 	}
 }
 
-static int rv3029_nvram_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t rv3029_nvram_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
-	return regmap_bulk_write(priv, RV3029_RAM_PAGE + offset, val, bytes);
+	int ret;
+
+	ret = regmap_bulk_write(priv, RV3029_RAM_PAGE + offset, val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int rv3029_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t rv3029_nvram_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
-	return regmap_bulk_read(priv, RV3029_RAM_PAGE + offset, val, bytes);
+	int ret;
+
+	ret = regmap_bulk_read(priv, RV3029_RAM_PAGE + offset, val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
 static const struct rv3029_trickle_tab_elem {
diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 35b2e36b426a..179ea03725c1 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -484,17 +484,25 @@ static int rv3032_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 	}
 }
 
-static int rv3032_nvram_write(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t rv3032_nvram_write(void *priv, unsigned int offset, void *val, size_t bytes)
 {
-	return regmap_bulk_write(priv, RV3032_RAM1 + offset, val, bytes);
+	int ret;
+
+	ret = regmap_bulk_write(priv, RV3032_RAM1 + offset, val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int rv3032_nvram_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t rv3032_nvram_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
-	return regmap_bulk_read(priv, RV3032_RAM1 + offset, val, bytes);
+	int ret;
+
+	ret = regmap_bulk_read(priv, RV3032_RAM1 + offset, val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int rv3032_eeprom_write(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t rv3032_eeprom_write(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct rv3032_data *rv3032 = priv;
 	u32 status, eerd;
@@ -532,10 +540,10 @@ static int rv3032_eeprom_write(void *priv, unsigned int offset, void *val, size_
 exit_eerd:
 	rv3032_exit_eerd(rv3032, eerd);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
-static int rv3032_eeprom_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t rv3032_eeprom_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct rv3032_data *rv3032 = priv;
 	u32 status, eerd, data;
@@ -572,7 +580,7 @@ static int rv3032_eeprom_read(void *priv, unsigned int offset, void *val, size_t
 exit_eerd:
 	rv3032_exit_eerd(rv3032, eerd);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
 static int rv3032_trickle_charger_setup(struct device *dev, struct rv3032_data *rv3032)
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 1327251e527c..a6b02b78b0e6 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -536,14 +536,18 @@ static int rv8803_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 	}
 }
 
-static int rv8803_nvram_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t rv8803_nvram_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
-	return rv8803_write_reg(priv, RV8803_RAM, *(u8 *)val);
+	int ret;
+
+	ret = rv8803_write_reg(priv, RV8803_RAM, *(u8 *)val);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int rv8803_nvram_read(void *priv, unsigned int offset,
-			     void *val, size_t bytes)
+static ssize_t rv8803_nvram_read(void *priv, unsigned int offset,
+				 void *val, size_t bytes)
 {
 	int ret;
 
@@ -553,7 +557,7 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
 
 	*(u8 *)val = ret;
 
-	return 0;
+	return ret < 0 ? ret : bytes;
 }
 
 static const struct rtc_class_ops rv8803_rtc_ops = {
diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index 48efd61a114d..e0d49c2861f2 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -187,26 +187,32 @@ static const struct rtc_class_ops rx8581_rtc_ops = {
 	.set_time	= rx8581_rtc_set_time,
 };
 
-static int rx8571_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t rx8571_nvram_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
 	struct rx8581 *rx8581 = priv;
+	int ret;
 
-	return regmap_bulk_read(rx8581->regmap, RX8571_USER_RAM + offset,
-				val, bytes);
+	ret = regmap_bulk_read(rx8581->regmap, RX8571_USER_RAM + offset,
+			       val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int rx8571_nvram_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t rx8571_nvram_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	struct rx8581 *rx8581 = priv;
+	int ret;
 
-	return regmap_bulk_write(rx8581->regmap, RX8571_USER_RAM + offset,
-				 val, bytes);
+	ret = regmap_bulk_write(rx8581->regmap, RX8571_USER_RAM + offset,
+				val, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int rx85x1_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t rx85x1_nvram_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
 	struct rx8581 *rx8581 = priv;
 	unsigned int tmp_val;
@@ -215,18 +221,21 @@ static int rx85x1_nvram_read(void *priv, unsigned int offset, void *val,
 	ret = regmap_read(rx8581->regmap, RX8581_REG_RAM, &tmp_val);
 	(*(unsigned char *)val) = (unsigned char) tmp_val;
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
-static int rx85x1_nvram_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t rx85x1_nvram_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	struct rx8581 *rx8581 = priv;
 	unsigned char tmp_val;
+	int ret;
 
 	tmp_val = *((unsigned char *)val);
-	return regmap_write(rx8581->regmap, RX8581_REG_RAM,
-				(unsigned int)tmp_val);
+	ret = regmap_write(rx8581->regmap, RX8581_REG_RAM,
+			   (unsigned int)tmp_val);
+
+	return ret < 0 ? ret : bytes;
 }
 
 static const struct rx85x1_config rx8581_config = {
diff --git a/drivers/rtc/rtc-stk17ta8.c b/drivers/rtc/rtc-stk17ta8.c
index 7cb6be1b7815..85d811b68a9b 100644
--- a/drivers/rtc/rtc-stk17ta8.c
+++ b/drivers/rtc/rtc-stk17ta8.c
@@ -230,28 +230,30 @@ static const struct rtc_class_ops stk17ta8_rtc_ops = {
 	.alarm_irq_enable	= stk17ta8_rtc_alarm_irq_enable,
 };
 
-static int stk17ta8_nvram_read(void *priv, unsigned int pos, void *val,
-			       size_t bytes)
+static ssize_t stk17ta8_nvram_read(void *priv, unsigned int pos, void *val,
+				   size_t bytes)
 {
 	struct rtc_plat_data *pdata = priv;
 	void __iomem *ioaddr = pdata->ioaddr;
+	size_t bytes_read = bytes;
 	u8 *buf = val;
 
 	for (; bytes; bytes--)
 		*buf++ = readb(ioaddr + pos++);
-	return 0;
+	return bytes_read;
 }
 
-static int stk17ta8_nvram_write(void *priv, unsigned int pos, void *val,
-				size_t bytes)
+static ssize_t stk17ta8_nvram_write(void *priv, unsigned int pos, void *val,
+				    size_t bytes)
 {
 	struct rtc_plat_data *pdata = priv;
 	void __iomem *ioaddr = pdata->ioaddr;
+	size_t bytes_written = bytes;
 	u8 *buf = val;
 
 	for (; bytes; bytes--)
 		writeb(*buf++, ioaddr + pos++);
-	return 0;
+	return bytes_written;
 }
 
 static int stk17ta8_rtc_probe(struct platform_device *pdev)
diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 8e0c66906103..62fda0f86364 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -675,7 +675,7 @@ static const struct rtc_class_ops sun6i_rtc_ops = {
 	.alarm_irq_enable	= sun6i_rtc_alarm_irq_enable
 };
 
-static int sun6i_rtc_nvmem_read(void *priv, unsigned int offset, void *_val, size_t bytes)
+static ssize_t sun6i_rtc_nvmem_read(void *priv, unsigned int offset, void *_val, size_t bytes)
 {
 	struct sun6i_rtc_dev *chip = priv;
 	u32 *val = _val;
@@ -684,10 +684,10 @@ static int sun6i_rtc_nvmem_read(void *priv, unsigned int offset, void *_val, siz
 	for (i = 0; i < bytes / 4; ++i)
 		val[i] = readl(chip->base + SUN6I_GP_DATA + offset + 4 * i);
 
-	return 0;
+	return bytes;
 }
 
-static int sun6i_rtc_nvmem_write(void *priv, unsigned int offset, void *_val, size_t bytes)
+static ssize_t sun6i_rtc_nvmem_write(void *priv, unsigned int offset, void *_val, size_t bytes)
 {
 	struct sun6i_rtc_dev *chip = priv;
 	u32 *val = _val;
@@ -696,7 +696,7 @@ static int sun6i_rtc_nvmem_write(void *priv, unsigned int offset, void *_val, si
 	for (i = 0; i < bytes / 4; ++i)
 		writel(val[i], chip->base + SUN6I_GP_DATA + offset + 4 * i);
 
-	return 0;
+	return bytes;
 }
 
 static struct nvmem_config sun6i_rtc_nvmem_cfg = {
diff --git a/drivers/rtc/rtc-ti-k3.c b/drivers/rtc/rtc-ti-k3.c
index ec759d8f7023..9a1097fcdad6 100644
--- a/drivers/rtc/rtc-ti-k3.c
+++ b/drivers/rtc/rtc-ti-k3.c
@@ -483,16 +483,19 @@ static const struct rtc_class_ops ti_k3_rtc_ops = {
 	.alarm_irq_enable = ti_k3_rtc_alarm_irq_enable,
 };
 
-static int ti_k3_rtc_scratch_read(void *priv_data, unsigned int offset,
-				  void *val, size_t bytes)
+static ssize_t ti_k3_rtc_scratch_read(void *priv_data, unsigned int offset,
+				      void *val, size_t bytes)
 {
 	struct ti_k3_rtc *priv = (struct ti_k3_rtc *)priv_data;
+	int ret;
+
+	ret =  regmap_bulk_read(priv->regmap, REG_K3RTC_SCRATCH0 + offset, val, bytes / 4);
 
-	return regmap_bulk_read(priv->regmap, REG_K3RTC_SCRATCH0 + offset, val, bytes / 4);
+	return ret < 0 ? ret : bytes;
 }
 
-static int ti_k3_rtc_scratch_write(void *priv_data, unsigned int offset,
-				   void *val, size_t bytes)
+static ssize_t ti_k3_rtc_scratch_write(void *priv_data, unsigned int offset,
+				       void *val, size_t bytes)
 {
 	struct ti_k3_rtc *priv = (struct ti_k3_rtc *)priv_data;
 	int ret;
@@ -501,7 +504,8 @@ static int ti_k3_rtc_scratch_write(void *priv_data, unsigned int offset,
 	if (ret)
 		return ret;
 
-	return k3rtc_fence(priv);
+	ret = k3rtc_fence(priv);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config ti_k3_rtc_nvmem_config = {
diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
index 13f8ce08243c..b770a5cc1aad 100644
--- a/drivers/rtc/rtc-twl.c
+++ b/drivers/rtc/rtc-twl.c
@@ -487,16 +487,24 @@ static const struct rtc_class_ops twl_rtc_ops = {
 	.alarm_irq_enable = twl_rtc_alarm_irq_enable,
 };
 
-static int twl_nvram_read(void *priv, unsigned int offset, void *val,
-			  size_t bytes)
+static ssize_t twl_nvram_read(void *priv, unsigned int offset, void *val,
+			      size_t bytes)
 {
-	return twl_i2c_read((long)priv, val, offset, bytes);
+	int ret;
+
+	ret = twl_i2c_read((long)priv, val, offset, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
-static int twl_nvram_write(void *priv, unsigned int offset, void *val,
-			   size_t bytes)
+static ssize_t twl_nvram_write(void *priv, unsigned int offset, void *val,
+			       size_t bytes)
 {
-	return twl_i2c_write((long)priv, val, offset, bytes);
+	int ret;
+
+	ret = twl_i2c_write((long)priv, val, offset, bytes);
+
+	return ret < 0 ? ret : bytes;
 }
 
 /*----------------------------------------------------------------------*/
-- 
2.45.1.467.gbab1589fc0-goog


