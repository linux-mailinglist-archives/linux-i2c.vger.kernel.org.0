Return-Path: <linux-i2c+bounces-12401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6762DB32F99
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E79961B64C2A
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785B32DCBF2;
	Sun, 24 Aug 2025 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSZj3YRt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30242D97A6;
	Sun, 24 Aug 2025 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035281; cv=none; b=hIW/XVyVvFgfBmsfV5d0Vclt0WkUJR2AHDJrNqufyKa3JaGmwm22v2aoJqvO17L43/gIlSuxFpeHg7VQSYt4lmNq5I+Uq4SkizZXw0HbijSMXMRx67aNnFpAjwBmi7QdB3ENz2vxg45mg/Vb1ieH3WJVd2E6VTwd6+/EOGuZZvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035281; c=relaxed/simple;
	bh=wSmTVHEJhgpd0W2GlqinGQU4Ox02CeUAHST0NffqZlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mu8m5551jhB974hg4E9tHmquNC3aZf7JjaR+N4JNa0sZdxWKPoQytDZLOOFnd4ku6WLXSGcjQZF4WhDd4NgEWmN1ZPd5n8cMbPkZo3SSDhk70/3p5EDc64w/TIkaawY6WdXnmdaKH7IdRQTNRwGzqiAMW9SZIrgTlm58/zE3evQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSZj3YRt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so29436205e9.1;
        Sun, 24 Aug 2025 04:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035277; x=1756640077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAQbZJxhNRQHD+n6kLrxQ0/ZHE57KMRPqriXHO0Ez54=;
        b=LSZj3YRtVRRnM9CIJ2DBRBQtygAiU9KHY+v6NpfR/Kks+Q4EcbYswcR/HjdIsIPblo
         z+xuQ/wWGzWdPHCQhMPaoyh0oYsNgPA8w6GVHNF8KyIWRm3Ech/ehRquUKpgKHKy4yFZ
         dsrHqArnuLsS+hMqQ1hPLD4JinlN2USOpFBHtpEoVK3RpOEtM0GY6k0MnxvxaI0QIWtC
         NucGgLB/zJ7D1x+g4LVL6cbyM8g/eH6Tkzbip8KmurKolYwRcJLTX8vytY0QE9yyMZlD
         tArHKi/kB/eREIw9weFvxlLEfybZfjP7pejqW1FSoYhZiZ0MGcnbp4SrBmkOEd/ewhZm
         2vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035277; x=1756640077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAQbZJxhNRQHD+n6kLrxQ0/ZHE57KMRPqriXHO0Ez54=;
        b=ZCnsYruilrd+rTw2O/HDjBugCufSNKUe4uTR+UbVKhqxntGZu8BpxWmOW81HiHzhRj
         7W+q7gKvUU6sBd/c5AuFtCAQ1tR6vGNL0QExNFswfGYODm642The5zwB5/JTbfgVYr7o
         MthxWsMzavh4FApzHdd6r/hwICOFbpBMuLpU1v3pk1f+BVxXZl31ZceKH6tvtY97j1rc
         Aysodv5t8Ohdh7w6X8s5cM1ohhWVrfuepgi0YIn7vxAp5r601euAsPLbydY8C9HMkqD0
         fRKf0uWh+PzCMh1ZnTP+7ONwFdcydVTGMjJd2e+iHsdkw5RyoFW+cmeCW4nydX1ol5VP
         RxAA==
X-Forwarded-Encrypted: i=1; AJvYcCUG15i9NPo/XNjPRQlOQZNs8GB3JdJ+gUeaHtuxUZcXiLxQvv4FHOVxBzw67X4Yuc1O8yi98OaY+ecT@vger.kernel.org, AJvYcCUtEUiJLhOgnTZIfydCemhrsDCnfWkMLqLZIG96yU35tNCe6KpA7L1bA1kPMHYqJoD90oeLo6TwQpOhIBZM@vger.kernel.org
X-Gm-Message-State: AOJu0YyNN0kbGLk5z/sGhTIK5EL7koDCFILmhPMTZC3hAgWK+C2NAToS
	LEDy76dLKVSnahGaHNh6m/kczgnT8JAN4iAvXF6BtIVR0OlLig4C/7t8b4NTqA==
X-Gm-Gg: ASbGncvMxuPuOKLERy7kTZYADAWhlFmeLozanr/Wd303bE4T1bE4v8b/ukfClC2qCOk
	Vbk6vWdc6zuRXofjt1Nketk1+etpkw0cy2tysWN09VHvItdfOluaVcMkZimm5Gsmbk4BLnOKLuQ
	zq7WbQOvNzUkUbqicX/xUTkmhAQ3sqa8BTMOUCdOgweI0JXE+QmIEPVdJ/Ee37w/tJKvE5FM8Kj
	12S/Pk8o6waEvCglSMVLViUx0nlopD0UxxB7vg7yMjmIkB57IDNfkDdhrDPtqQWfAPqj+eleblb
	K/vTxOZZLHCHukT25gzmEC3CurWynqhCQ2PMQJ0JPS9RWUff7adLTRRuleVQTjCHkEZXWHi2HUc
	40zVZSs5IMrfjOFcWiZH/0E6DcZvFt9ESJhruVJkxFcBGE5n865Tnk4vmUB0dJq527A==
X-Google-Smtp-Source: AGHT+IGR0CLOw1yg2bSATb6rYPsZFT2YMaz22iPH8N6YPfnbFbtZ0UQo6KR6AkGxSp1VoLejldFriA==
X-Received: by 2002:a05:600c:5491:b0:459:d9a2:e927 with SMTP id 5b1f17b1804b1-45b51798f8fmr80358975e9.5.1756035276831;
        Sun, 24 Aug 2025 04:34:36 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:36 -0700 (PDT)
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
Subject: [PATCH v6 09/12] i2c: rtl9300: separate xfer configuration and execution
Date: Sun, 24 Aug 2025 11:33:45 +0000
Message-ID: <20250824113348.263475-10-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824113348.263475-1-jelonek.jonas@gmail.com>
References: <20250824113348.263475-1-jelonek.jonas@gmail.com>
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


