Return-Path: <linux-i2c+bounces-12529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BE9B3D1F2
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75F6D16F43E
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F041261B6D;
	Sun, 31 Aug 2025 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMfrT1ES"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A09257851;
	Sun, 31 Aug 2025 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634731; cv=none; b=nsGD9TTb7SrPlv8sHAMeI/O/r80L6bCoaGKL1NN+1BgLMeFVPRVo5XIIbIZiWs8rzzBKuGURScXlbxWYqK9EF/lZ/etFgFIC1pKDX6QV+YFCbxxuMxB07GQGw5PKYqg43PkXYCbMvR9JjK6fNuTQtyCQcMsriOWTsiniUk/lvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634731; c=relaxed/simple;
	bh=GPOFKt13/FNDlZX7rRsEbrM35HRXtQFY1CfTF4pC0u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2+kOEBqvFwJ6kDVfob6Bw+3CqDa3TJxhLIdkfJq1SW/UEaFr5CI0Yana3Ae+uySVHt3LGnPkTMurrtKRLEe2nEnttdduMgrKPM3ULAcee2SM9hnoPijpMXaGWeXEwj+K4STQazH4mNRK89lAPhdHqfaD+3JH4qevb4SnuhOTmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMfrT1ES; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3d3f46e231fso442366f8f.3;
        Sun, 31 Aug 2025 03:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634727; x=1757239527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3jDFjCLGk6E0Gk7i6q1zKlf4ViBoITsu0/4LLG3MPo=;
        b=kMfrT1ES+g4GZHXG4axxZq9aIz77VQPIFIhPEJx/W/mLI1SVqruzF3EwO08T4sfexe
         s4smvOwg0e2qK90B19OHt8UKZtCSYR10a0xsjXo7w3USm8LztXriay2t9qzTo/AFXboh
         1dzawYwfNQdYAxwJCwFWd0hdbYXGLDesK0uNf+C1E/vBgITBaO8oAtNEemHj2Y5TWeuq
         dR+43LN1j52vjvWVzwzDiOLkCVsEMH+5vPN5H/XgTd2Blqj+lrqEzY5j5w0jxBJaH9ex
         4V5Mgl4WEmHIIqeMUgQNn6EYwml+sFliBWrW5N9BBb5wW0xsBCFymCwCy4zwKEdUP2cd
         aptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634727; x=1757239527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3jDFjCLGk6E0Gk7i6q1zKlf4ViBoITsu0/4LLG3MPo=;
        b=XQF9I+QIuAtd0L1ep3AruP9lEWlBepz4EthqH9SNi5ekczfivRsqgxdzolylHSf6Ov
         7dy8xb64veIGj/oLY5z6cze7CD2x4+QUp6nuVFoo85LbjUrjviPbY6YiTUEY0Wc4WbmA
         Mpx8y1v4OLXSWWi+RuVNl7vJ6qZtM0QE1iYZvYQLvJlREjtsHD8YdjDCMIlxMG3hDXg/
         6eB00aSAqJJ8r9lpvHK7W7IIKNTLUrBd9yeRtSc6KrSCxbZErxrgB+npkxHPczCGA/dZ
         lr1lbUpcGPEjX7try6xjlxWUb+4ra7U4al2Od8SflcKDfJg9jtV7D0AmtH8SMRgZoILM
         KuXg==
X-Forwarded-Encrypted: i=1; AJvYcCUEVIsUs4WnecLCMaWNsYLxLP75BriTYcckVafH4qyURDHDKVQHhEW7vLnH8MnfyRV0DfKxB7hOGoMu@vger.kernel.org, AJvYcCWBfpFyzoJ2sS9N7mjteRX/+IEFteBYzkDLgcUjbncztoJgk3xjHLGthJPYNhwkugBJQftQht0T3HSa+ea8@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXb4rnPxu+yHpMfDdl1eWaFq/eoJLmjfpswqZumhpzD/Dqq4c
	QZg44i5gl/yZCM7TnjsxGrC5ZaemaYLvboSRdL/JhZr/lAoVX5LSeZtS
X-Gm-Gg: ASbGncuZJ3OTZ0TEEi7gX2AUM9jdhq08HODIJcswlYDS5QycqfSjbTesi6s/CS3uu5n
	AUoju/VNDV7sScPMJBS82CsBcD0oU6CKP8awC7NgsaqZim7Eu1CysM170mVQyi4GtWOo0nkasfw
	mYQWQ0f2YtgijCOMfjO9l5O6svmngo/dmO5NkcKn9tZ5N8KzlMtfErG5ZDcwQ7I6Eaw3nKTT4yw
	q3xWordR2UQjl0J7ZlxhHHgEHJQEF9SYYLWganZ3z9OFLZvxfdBNzfWti7O/gqasQ0UBSp2WejX
	RU3DvUdOIJEAK4xoWr9VKhozaaRQKwEIa6O4Qf+O4ZkCyztYj+au0TwAe4SgoxCmZlzTLb/KXou
	Tu5BioD661ANQbd0pgAFp06U5iAguvKTzNAyTDQ9jhs7KdywnHSVxuoZrxHvsrSU=
X-Google-Smtp-Source: AGHT+IGrGMnnJZq8f9JRXIrltyj1uZjqBRAgxmnmLutVBQZmgpK6Uyp/FhpfSDHuEvn8Ielja496fQ==
X-Received: by 2002:a05:6000:2884:b0:3d1:b783:bbd6 with SMTP id ffacd0b85a97d-3d1dc699f69mr2459704f8f.3.1756634726904;
        Sun, 31 Aug 2025 03:05:26 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:26 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v7 09/12] i2c: rtl9300: separate xfer configuration and execution
Date: Sun, 31 Aug 2025 10:04:54 +0000
Message-ID: <20250831100457.3114-10-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250831100457.3114-1-jelonek.jonas@gmail.com>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, the rtl9300_i2c_smbus_xfer code is quite a mess with function
calls distributed over the whole function setting different values in
different cases. Calls to rtl9300_i2c_config_xfer and
rtl9300_i2c_reg_addr_set are used in every case-block with varying
values whose meaning is not instantly obvious. In some cases, there are
additional calls within these case-blocks doing more things.

This is in general a bad design and especially really bad for
readability and maintainability because it distributes changes or
issues to multiple locations due to the same function being called with
different hardcoded values in different places.

To have a good structure, setting different parameters based on the
desired operation should not be interleaved with applying these
parameters to the hardware registers. Or in different words, the
parameter site should be mixed with the call site.

Thus, separate configuration and execution of an SMBus xfer within
rtl9300_i2c_smbus_xfer to improve readability and maintainability. Add a
new 'struct rtl9300_i2c_xfer' to carry the required parameters for an
xfer which are configured based on the input parameters within a single
switch-case block, without having any function calls within this block.

The function calls to actually apply these values to the hardware
registers then appear below in a single place and just operate on the
passed instance of 'struct rtl9300_i2c_xfer'. These are
'rtl9300_i2c_prepare_xfer' which combines applying all parameters of the
xfer to the corresponding register, and 'rtl9300_i2c_do_xfer' which
actually executes the xfer and does post-processing if needed.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 drivers/i2c/busses/i2c-rtl9300.c | 234 +++++++++++++++----------------
 1 file changed, 114 insertions(+), 120 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 9e3517b09b3d..fb3ebbd46a18 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -8,6 +8,7 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/unaligned.h>
 
 enum rtl9300_bus_freq {
 	RTL9300_I2C_STD_FREQ,
@@ -71,6 +72,22 @@ struct rtl9300_i2c {
 	struct mutex lock;
 };
 
+enum rtl9300_i2c_xfer_type {
+	RTL9300_I2C_XFER_BYTE,
+	RTL9300_I2C_XFER_WORD,
+	RTL9300_I2C_XFER_BLOCK,
+};
+
+struct rtl9300_i2c_xfer {
+	enum rtl9300_i2c_xfer_type type;
+	u16 dev_addr;
+	u8 reg_addr;
+	u8 reg_addr_len;
+	u8 *data;
+	u8 data_len;
+	bool write;
+};
+
 #define RTL9300_I2C_MST_CTRL1				0x0
 #define RTL9300_I2C_MST_CTRL2				0x4
 #define RTL9300_I2C_MST_DATA_WORD0			0x8
@@ -95,45 +112,37 @@ static int rtl9300_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
 	return regmap_field_write(i2c->fields[F_SCL_SEL], 1);
 }
 
-static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan)
+static int rtl9300_i2c_config_chan(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan)
 {
 	struct rtl9300_i2c_drv_data *drv_data;
 	int ret;
 
-	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+	if (i2c->sda_num == chan->sda_num)
+		return 0;
 
-	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(chan->sda_num),
-				       BIT(chan->sda_num));
+	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
 	if (ret)
 		return ret;
 
-	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], chan->sda_num);
+	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+	ret = drv_data->select_scl(i2c, 0);
 	if (ret)
 		return ret;
 
-	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
+	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(chan->sda_num),
+				       BIT(chan->sda_num));
 	if (ret)
 		return ret;
 
-	return drv_data->select_scl(i2c, 0);
-}
-
-static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan,
-				   u16 addr, u16 len)
-{
-	int ret;
-
-	if (len < 1 || len > 16)
-		return -EINVAL;
-
-	ret = regmap_field_write(i2c->fields[F_DEV_ADDR], addr);
+	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], chan->sda_num);
 	if (ret)
 		return ret;
 
-	return regmap_field_write(i2c->fields[F_DATA_WIDTH], (len - 1) & 0xf);
+	i2c->sda_num = chan->sda_num;
+	return 0;
 }
 
-static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
+static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, u8 len)
 {
 	u32 vals[4] = {};
 	int i, ret;
@@ -153,7 +162,7 @@ static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
 	return 0;
 }
 
-static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int len)
+static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, u8 len)
 {
 	u32 vals[4] = {};
 	int i;
@@ -176,16 +185,51 @@ static int rtl9300_i2c_writel(struct rtl9300_i2c *i2c, u32 data)
 	return regmap_write(i2c->regmap, i2c->data_reg, data);
 }
 
-static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
-				    int size, union i2c_smbus_data *data, int len)
+static int rtl9300_i2c_prepare_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_xfer *xfer)
 {
-	u32 val;
 	int ret;
 
-	ret = regmap_field_write(i2c->fields[F_RWOP], read_write == I2C_SMBUS_WRITE);
+	if (xfer->data_len < 1 || xfer->data_len > 16)
+		return -EINVAL;
+
+	ret = regmap_field_write(i2c->fields[F_DEV_ADDR], xfer->dev_addr);
+	if (ret)
+		return ret;
+
+	ret = rtl9300_i2c_reg_addr_set(i2c, xfer->reg_addr, xfer->reg_addr_len);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(i2c->fields[F_RWOP], xfer->write);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(i2c->fields[F_DATA_WIDTH], (xfer->data_len - 1) & 0xf);
 	if (ret)
 		return ret;
 
+	if (xfer->write) {
+		switch (xfer->type) {
+		case RTL9300_I2C_XFER_BYTE:
+			ret = rtl9300_i2c_writel(i2c, *xfer->data);
+			break;
+		case RTL9300_I2C_XFER_WORD:
+			ret = rtl9300_i2c_writel(i2c, get_unaligned((const u16 *)xfer->data));
+			break;
+		default:
+			ret = rtl9300_i2c_write(i2c, xfer->data, xfer->data_len);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static int rtl9300_i2c_do_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_xfer *xfer)
+{
+	u32 val;
+	int ret;
+
 	ret = regmap_field_write(i2c->fields[F_I2C_TRIG], 1);
 	if (ret)
 		return ret;
@@ -200,28 +244,24 @@ static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
 	if (val)
 		return -EIO;
 
-	if (read_write == I2C_SMBUS_READ) {
-		switch (size) {
-		case I2C_SMBUS_BYTE:
-		case I2C_SMBUS_BYTE_DATA:
+	if (!xfer->write) {
+		switch (xfer->type) {
+		case RTL9300_I2C_XFER_BYTE:
 			ret = regmap_read(i2c->regmap, i2c->data_reg, &val);
 			if (ret)
 				return ret;
-			data->byte = val & 0xff;
+
+			*xfer->data = val & 0xff;
 			break;
-		case I2C_SMBUS_WORD_DATA:
+		case RTL9300_I2C_XFER_WORD:
 			ret = regmap_read(i2c->regmap, i2c->data_reg, &val);
 			if (ret)
 				return ret;
-			data->word = val & 0xffff;
-			break;
-		case I2C_SMBUS_I2C_BLOCK_DATA:
-			ret = rtl9300_i2c_read(i2c, &data->block[1], len);
-			if (ret)
-				return ret;
+
+			put_unaligned(val & 0xffff, (u16*)xfer->data);
 			break;
 		default:
-			ret = rtl9300_i2c_read(i2c, &data->block[0], len);
+			ret = rtl9300_i2c_read(i2c, xfer->data, xfer->data_len);
 			if (ret)
 				return ret;
 			break;
@@ -237,108 +277,62 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 {
 	struct rtl9300_i2c_chan *chan = i2c_get_adapdata(adap);
 	struct rtl9300_i2c *i2c = chan->i2c;
-	int len = 0, ret;
+	struct rtl9300_i2c_xfer xfer = {0};
+	int ret;
+
+	if (addr > 0x7f)
+		return -EINVAL;
 
 	mutex_lock(&i2c->lock);
-	if (chan->sda_num != i2c->sda_num) {
-		ret = rtl9300_i2c_config_io(i2c, chan);
-		if (ret)
-			goto out_unlock;
-		i2c->sda_num = chan->sda_num;
-	}
+
+	ret = rtl9300_i2c_config_chan(i2c, chan);
+	if (ret)
+		goto out_unlock;
+
+	xfer.dev_addr = addr & 0x7f;
+	xfer.write = (read_write == I2C_SMBUS_WRITE);
+	xfer.reg_addr = command;
+	xfer.reg_addr_len = 1;
 
 	switch (size) {
 	case I2C_SMBUS_BYTE:
-		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 0);
-			if (ret)
-				goto out_unlock;
-			ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
-			if (ret)
-				goto out_unlock;
-		} else {
-			ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 1);
-			if (ret)
-				goto out_unlock;
-			ret = rtl9300_i2c_reg_addr_set(i2c, 0, 0);
-			if (ret)
-				goto out_unlock;
-		}
+		xfer.data = (read_write == I2C_SMBUS_READ) ? &data->byte : &command;
+		xfer.data_len = 1;
+		xfer.reg_addr = 0;
+		xfer.reg_addr_len = 0;
+		xfer.type = RTL9300_I2C_XFER_BYTE;
 		break;
-
 	case I2C_SMBUS_BYTE_DATA:
-		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
-		if (ret)
-			goto out_unlock;
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 1);
-		if (ret)
-			goto out_unlock;
-		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_writel(i2c, data->byte);
-			if (ret)
-				goto out_unlock;
-		}
+		xfer.data = &data->byte;
+		xfer.data_len = 1;
+		xfer.type = RTL9300_I2C_XFER_BYTE;
 		break;
-
 	case I2C_SMBUS_WORD_DATA:
-		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
-		if (ret)
-			goto out_unlock;
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 2);
-		if (ret)
-			goto out_unlock;
-		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_writel(i2c, data->word);
-			if (ret)
-				goto out_unlock;
-		}
+		xfer.data = (u8 *)&data->word;
+		xfer.data_len = 2;
+		xfer.type = RTL9300_I2C_XFER_WORD;
 		break;
-
 	case I2C_SMBUS_BLOCK_DATA:
-		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
-		if (ret)
-			goto out_unlock;
-		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX) {
-			ret = -EINVAL;
-			goto out_unlock;
-		}
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0] + 1);
-		if (ret)
-			goto out_unlock;
-		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_write(i2c, &data->block[0], data->block[0] + 1);
-			if (ret)
-				goto out_unlock;
-		}
-		len = data->block[0] + 1;
+		xfer.data = &data->block[0];
+		xfer.data_len = data->block[0] + 1;
+		xfer.type = RTL9300_I2C_XFER_BLOCK;
 		break;
-
 	case I2C_SMBUS_I2C_BLOCK_DATA:
-		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
-		if (ret)
-			goto out_unlock;
-		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX) {
-			ret = -EINVAL;
-			goto out_unlock;
-		}
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0]);
-		if (ret)
-			goto out_unlock;
-		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_write(i2c, &data->block[1], data->block[0]);
-			if (ret)
-				goto out_unlock;
-		}
-		len = data->block[0];
+		xfer.data = &data->block[1];
+		xfer.data_len = data->block[0];
+		xfer.type = RTL9300_I2C_XFER_BLOCK;
 		break;
-
 	default:
 		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
 		ret = -EOPNOTSUPP;
 		goto out_unlock;
 	}
 
-	ret = rtl9300_i2c_execute_xfer(i2c, read_write, size, data, len);
+	ret = rtl9300_i2c_prepare_xfer(i2c, &xfer);
+	if (ret)
+		goto out_unlock;
+
+	ret = rtl9300_i2c_do_xfer(i2c, &xfer);
 
 out_unlock:
 	mutex_unlock(&i2c->lock);
-- 
2.48.1


