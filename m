Return-Path: <linux-i2c+bounces-11719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C35AEF305
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 11:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 334451885ED3
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 09:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D0C265CA7;
	Tue,  1 Jul 2025 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9FA1zBU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9754922259D
	for <linux-i2c@vger.kernel.org>; Tue,  1 Jul 2025 09:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361466; cv=none; b=jsZF+pGP3QJvBH9MRT3F/JOryO4aztPam89uAP2fKUxPgxpb8lo2Gj7/srra/Qa5W8tRSzs1IQEa1tFnvjUE4g7p+KMcWSYzRvTNUXSbypcA0fNwyNEOd2jia0g70wTs3jCRpghf/lYGqV28OQ50L8zAQrcTvxstIglxFyjPmcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361466; c=relaxed/simple;
	bh=Qek55rvJ65ViIEUdhKxLM1dvTu0f+lfnbmJ1aQWUVEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKS+BebGgyyGcflo9w9y7HQJH3qbQ2b8pT7P/OVM9RMKLen2CCRdL4JVm4K3Q849kgXil9/d+8BotUITcXFCIeEPymriHDzCD7T1wHbToDSMKM5Nk7TZelK3XylN2FzFeWXW46l9spCLPFKATbzzfkjZHXbef+u1Rl7dtr59Zvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9FA1zBU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2783921f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jul 2025 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751361463; x=1751966263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ipmc2zVzgWwE1XrrlpZghFlEBBqokRi6Q7O/m26jNE=;
        b=c9FA1zBUm9ryyJIv6WcKz+eGSbx6mnPM/Df5ux8Pzwa3F+/m7h3O+Im9H6LRFT1lbQ
         d7lCqOg/R5GJl2gVGK2ZU6yTKQV3bJxsIEcJV0aTWl2CCCrflXLdiC63RGSgrL2sMBAd
         d0GcBctxfGVLTDSsqmpRrctKwWwOh8DwN8xBQasOjf2nT11f9X+3ikRrz+Og4tLIFkMD
         Silp8wjIyJ0HMcEvACoZWcCFUovo7Bxbkp5KAs+vYJ3rOWAiVQVpT5lqqXk013UJREn/
         tabKa/rpEoYYxWVcMNRXRWUirdSI3Ta06gkC+YyXnEOq9RD1g5RflLX8GCd/uhRanjHa
         UzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361463; x=1751966263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ipmc2zVzgWwE1XrrlpZghFlEBBqokRi6Q7O/m26jNE=;
        b=Nuw21v/9g24sIPc06wZ7zKShpATW9FwekkydnGOeJ8VUxMPq34KdswYBjYFAgVUKtz
         CAp3LjB6YjgMq5vHLRhGcLW5oVsc0FW5qQ/spUJPfprQm6XZTyYelpgfAF4JFi/eYyEs
         Vyg1w6JZXuukBM0PKeg9Fa3B5vNijCH+hMETKZ+Hby/zMD3qiwyZdvO7PuS5Yv8ddz4p
         2M+v23ZBQcKVBo7UY05b+IUuN4D8jNqMbJJLzc2YyrYZyaPHiZD9i2ZHC6QUThUgJFDn
         tAaWp2Wp19f4B3FJzd7WNml/TqIhM52YCmy7hfIiHFxKHlYuAX0NStfVXlbtn1NFcD6q
         w7Ew==
X-Gm-Message-State: AOJu0Yw9cNoVSuxfHuxVAEOp3zYT4CVBfKchU1wkPUi4f3KcHBy+Mfwz
	WVvs5DTeCDfEfdYfiA6i5dIRCTXABJ9AyjRho3dlkGTDecB+TxAeQGW1sFoY5w==
X-Gm-Gg: ASbGncsUMHKXZJy39jsZTbj9+ZMJKbFbJz2WI6oywBtn8uhtia0VXvF8l40OIhFrcBn
	HBvxNSoAASsvB3Ky2iqYv3ycKsMPAV3oPUkCcSkJYNbo7r/nkiG93RqjP1pp4wxvB80dSk0HkVF
	/78k5nH7jrtFkE8Q3+56fpSbWwEgKoV/d7/YiHuO/WVnq2DIGreZ8s8mIjWWQ57zrhUPi0SzVlr
	8tULqq7Ihdi9p2Br3Mq1Kec3ScCGZl2t+PhCGQ1PJg1/VGP64pIlOD4yZhF/iY915A2isNzrFbE
	xOLC2JOY3qB1wgG7WnhtQz5OTWFb06ftv4NuDpMTf7cerUduEs+OOdIqhkQe2ANVmRorvzpL1GA
	YdZspUPbxIPe2Ew9d
X-Google-Smtp-Source: AGHT+IFfB47AzmqLGzXAjxlNmXP81yL8CnOCRneFW7qKUS1s+Dio1/UPYIQKuA4LyA+MaJdpJoYDtg==
X-Received: by 2002:adf:a1cb:0:b0:3a5:3b14:1ba3 with SMTP id ffacd0b85a97d-3a90b8c99bdmr10388488f8f.49.1751361462413;
        Tue, 01 Jul 2025 02:17:42 -0700 (PDT)
Received: from builder.. (253-8-142-46.pool.kielnet.net. [46.142.8.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5979dsm12624379f8f.75.2025.07.01.02.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:17:42 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH 1/3] i2c: rework RTL9300 I2C controller driver
Date: Tue,  1 Jul 2025 09:17:35 +0000
Message-ID: <20250701091737.3430-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701091737.3430-1-jelonek.jonas@gmail.com>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reworks RTL9300 I2C controller driver to use more of the regmap
API, especially make use of reg_field and regmap_field to represent
registers instead of macros. Most register operations are performed
through regmap_field_* API.

Since this patch is done in preparation to add support for RTL9310, one
operation is handled using separate chip-specific functions and
references to them. This operation cannot be handled with the reg_field
description only due to different register layout.

Overall, this makes it a lot easier to add support for newer
generations or to handle differences between specific revisions within
a series. Support can be added by defining a separate driver data
structure with the corresponding register field definitions and
linking it to a new compatible string.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 190 ++++++++++++++++++++-----------
 1 file changed, 124 insertions(+), 66 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index e064e8a4a1f0..f8e81102ee74 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -23,94 +23,115 @@ struct rtl9300_i2c_chan {
 	u8 sda_pin;
 };
 
+enum rtl9300_i2c_reg_scope {
+	REG_SCOPE_GLOBAL,
+	REG_SCOPE_MASTER,
+};
+
+struct rtl9300_i2c_reg_field {
+	struct reg_field field;
+	enum rtl9300_i2c_reg_scope scope;
+};
+
+enum rtl9300_i2c_reg_fields {
+	F_DATA_WIDTH = 0,
+	F_DEV_ADDR,
+	F_I2C_FAIL,
+	F_I2C_TRIG,
+	F_MEM_ADDR,
+	F_MEM_ADDR_WIDTH,
+	F_RD_MODE,
+	F_RWOP,
+	F_SCL_FREQ,
+	F_SCL_SEL,
+	F_SDA_OUT_SEL,
+	F_SDA_SEL,
+
+	/* keep last */
+	F_NUM_FIELDS
+};
+
+struct rtl9300_i2c_drv_data {
+	struct rtl9300_i2c_reg_field field_desc[F_NUM_FIELDS];
+	int (*select_scl)(struct rtl9300_i2c *i2c, u8 scl);
+	u32 data_reg;
+	u8 max_nchan;
+};
+
 #define RTL9300_I2C_MUX_NCHAN	8
 
 struct rtl9300_i2c {
 	struct regmap *regmap;
 	struct device *dev;
 	struct rtl9300_i2c_chan chans[RTL9300_I2C_MUX_NCHAN];
+	struct regmap_field *fields[F_NUM_FIELDS];
 	u32 reg_base;
+	u32 data_reg;
 	u8 sda_pin;
 	struct mutex lock;
 };
 
 #define RTL9300_I2C_MST_CTRL1				0x0
-#define  RTL9300_I2C_MST_CTRL1_MEM_ADDR_OFS		8
-#define  RTL9300_I2C_MST_CTRL1_MEM_ADDR_MASK		GENMASK(31, 8)
-#define  RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_OFS		4
-#define  RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_MASK		GENMASK(6, 4)
-#define  RTL9300_I2C_MST_CTRL1_GPIO_SCL_SEL		BIT(3)
-#define  RTL9300_I2C_MST_CTRL1_RWOP			BIT(2)
-#define  RTL9300_I2C_MST_CTRL1_I2C_FAIL			BIT(1)
-#define  RTL9300_I2C_MST_CTRL1_I2C_TRIG			BIT(0)
 #define RTL9300_I2C_MST_CTRL2				0x4
-#define  RTL9300_I2C_MST_CTRL2_RD_MODE			BIT(15)
-#define  RTL9300_I2C_MST_CTRL2_DEV_ADDR_OFS		8
-#define  RTL9300_I2C_MST_CTRL2_DEV_ADDR_MASK		GENMASK(14, 8)
-#define  RTL9300_I2C_MST_CTRL2_DATA_WIDTH_OFS		4
-#define  RTL9300_I2C_MST_CTRL2_DATA_WIDTH_MASK		GENMASK(7, 4)
-#define  RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_OFS	2
-#define  RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_MASK	GENMASK(3, 2)
-#define  RTL9300_I2C_MST_CTRL2_SCL_FREQ_OFS		0
-#define  RTL9300_I2C_MST_CTRL2_SCL_FREQ_MASK		GENMASK(1, 0)
 #define RTL9300_I2C_MST_DATA_WORD0			0x8
 #define RTL9300_I2C_MST_DATA_WORD1			0xc
 #define RTL9300_I2C_MST_DATA_WORD2			0x10
 #define RTL9300_I2C_MST_DATA_WORD3			0x14
-
 #define RTL9300_I2C_MST_GLB_CTRL			0x384
 
+
 static int rtl9300_i2c_reg_addr_set(struct rtl9300_i2c *i2c, u32 reg, u16 len)
 {
-	u32 val, mask;
 	int ret;
 
-	val = len << RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_OFS;
-	mask = RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_MASK;
-
-	ret = regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL2, mask, val);
+	ret = regmap_field_write(i2c->fields[F_MEM_ADDR_WIDTH], len);
 	if (ret)
 		return ret;
 
-	val = reg << RTL9300_I2C_MST_CTRL1_MEM_ADDR_OFS;
-	mask = RTL9300_I2C_MST_CTRL1_MEM_ADDR_MASK;
+	return regmap_field_write(i2c->fields[F_MEM_ADDR], reg);
+}
 
-	return regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1, mask, val);
+static int rtl9300_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
+{
+	return regmap_field_write(i2c->fields[F_SCL_SEL], 1);
 }
 
 static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
 {
+	struct rtl9300_i2c_drv_data *drv_data;
 	int ret;
-	u32 val, mask;
 
-	ret = regmap_update_bits(i2c->regmap, RTL9300_I2C_MST_GLB_CTRL, BIT(sda_pin), BIT(sda_pin));
+	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+
+	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(sda_pin), BIT(sda_pin));
 	if (ret)
 		return ret;
 
-	val = (sda_pin << RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_OFS) |
-		RTL9300_I2C_MST_CTRL1_GPIO_SCL_SEL;
-	mask = RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_MASK | RTL9300_I2C_MST_CTRL1_GPIO_SCL_SEL;
+	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], sda_pin);
+	if (ret)
+		return ret;
 
-	return regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1, mask, val);
+	return drv_data->select_scl(i2c, 0);
 }
 
 static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan,
 				   u16 addr, u16 len)
 {
-	u32 val, mask;
-
-	val = chan->bus_freq << RTL9300_I2C_MST_CTRL2_SCL_FREQ_OFS;
-	mask = RTL9300_I2C_MST_CTRL2_SCL_FREQ_MASK;
+	int ret;
 
-	val |= addr << RTL9300_I2C_MST_CTRL2_DEV_ADDR_OFS;
-	mask |= RTL9300_I2C_MST_CTRL2_DEV_ADDR_MASK;
+	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
+	if (ret)
+		return ret;
 
-	val |= ((len - 1) & 0xf) << RTL9300_I2C_MST_CTRL2_DATA_WIDTH_OFS;
-	mask |= RTL9300_I2C_MST_CTRL2_DATA_WIDTH_MASK;
+	ret = regmap_field_write(i2c->fields[F_DEV_ADDR], addr);
+	if (ret)
+		return ret;
 
-	mask |= RTL9300_I2C_MST_CTRL2_RD_MODE;
+	ret = regmap_field_write(i2c->fields[F_DATA_WIDTH], (len - 1) & 0xf);
+	if (ret)
+		return ret;
 
-	return regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL2, mask, val);
+	return regmap_field_write(i2c->fields[F_RD_MODE], 0);
 }
 
 static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
@@ -121,8 +142,7 @@ static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
 	if (len > 16)
 		return -EIO;
 
-	ret = regmap_bulk_read(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0,
-			       vals, ARRAY_SIZE(vals));
+	ret = regmap_bulk_read(i2c->regmap, i2c->data_reg, vals, ARRAY_SIZE(vals));
 	if (ret)
 		return ret;
 
@@ -149,49 +169,46 @@ static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int len)
 		vals[i/4] |= buf[i];
 	}
 
-	return regmap_bulk_write(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0,
-				vals, ARRAY_SIZE(vals));
+	return regmap_bulk_write(i2c->regmap, i2c->data_reg, vals, ARRAY_SIZE(vals));
 }
 
 static int rtl9300_i2c_writel(struct rtl9300_i2c *i2c, u32 data)
 {
-	return regmap_write(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, data);
+	return regmap_write(i2c->regmap, i2c->data_reg, data);
 }
 
 static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
 				    int size, union i2c_smbus_data *data, int len)
 {
-	u32 val, mask;
+	u32 val;
 	int ret;
 
-	val = read_write == I2C_SMBUS_WRITE ? RTL9300_I2C_MST_CTRL1_RWOP : 0;
-	mask = RTL9300_I2C_MST_CTRL1_RWOP;
-
-	val |= RTL9300_I2C_MST_CTRL1_I2C_TRIG;
-	mask |= RTL9300_I2C_MST_CTRL1_I2C_TRIG;
+	ret = regmap_field_write(i2c->fields[F_RWOP], read_write == I2C_SMBUS_WRITE);
+	if (ret)
+		return ret;
 
-	ret = regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1, mask, val);
+	ret = regmap_field_write(i2c->fields[F_I2C_TRIG], 1);
 	if (ret)
 		return ret;
 
-	ret = regmap_read_poll_timeout(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1,
-				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 2000);
+	regmap_field_read_poll_timeout(i2c->fields[F_I2C_TRIG], val, !val, 100, 2000);
 	if (ret)
 		return ret;
 
-	if (val & RTL9300_I2C_MST_CTRL1_I2C_FAIL)
+	ret = regmap_field_read(i2c->fields[F_I2C_FAIL], &val);
+	if (ret)
+		return ret;
+	if (val)
 		return -EIO;
 
 	if (read_write == I2C_SMBUS_READ) {
 		if (size == I2C_SMBUS_BYTE || size == I2C_SMBUS_BYTE_DATA) {
-			ret = regmap_read(i2c->regmap,
-					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
+			ret = regmap_read(i2c->regmap, i2c->data_reg, &val);
 			if (ret)
 				return ret;
 			data->byte = val & 0xff;
 		} else if (size == I2C_SMBUS_WORD_DATA) {
-			ret = regmap_read(i2c->regmap,
-					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
+			ret = regmap_read(i2c->regmap, i2c->data_reg, &val);
 			if (ret)
 				return ret;
 			data->word = val & 0xffff;
@@ -331,6 +348,8 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	u32 clock_freq, sda_pin;
 	int ret, i = 0;
 	struct fwnode_handle *child;
+	struct rtl9300_i2c_drv_data *drv_data;
+	struct reg_field fields[F_NUM_FIELDS];
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -349,9 +368,22 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c);
 
-	if (device_get_child_node_count(dev) >= RTL9300_I2C_MUX_NCHAN)
+	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+	if (device_get_child_node_count(dev) >= drv_data->max_nchan)
 		return dev_err_probe(dev, -EINVAL, "Too many channels\n");
 
+	i2c->data_reg = i2c->reg_base + drv_data->data_reg;
+	for (i = 0; i < F_NUM_FIELDS; i++) {
+		fields[i] = drv_data->field_desc[i].field;
+		if (drv_data->field_desc[i].scope == REG_SCOPE_MASTER)
+			fields[i].reg += i2c->reg_base;
+	}
+	ret = devm_regmap_field_bulk_alloc(dev, i2c->regmap, i2c->fields,
+					   fields, F_NUM_FIELDS);
+	if (ret)
+		return ret;
+
+	i = 0;
 	device_for_each_child_node(dev, child) {
 		struct rtl9300_i2c_chan *chan = &i2c->chans[i];
 		struct i2c_adapter *adap = &chan->adap;
@@ -400,11 +432,37 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#define GLB_REG_FIELD(reg, msb, lsb)    \
+	{ .field = REG_FIELD(reg, msb, lsb), .scope = REG_SCOPE_GLOBAL }
+#define MST_REG_FIELD(reg, msb, lsb)    \
+	{ .field = REG_FIELD(reg, msb, lsb), .scope = REG_SCOPE_MASTER }
+
+static const struct rtl9300_i2c_drv_data rtl9300_i2c_drv_data = {
+	.field_desc = {
+		[F_MEM_ADDR]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 8, 31),
+		[F_SDA_OUT_SEL]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 4, 6),
+		[F_SCL_SEL]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 3, 3),
+		[F_RWOP]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 2, 2),
+		[F_I2C_FAIL]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 1, 1),
+		[F_I2C_TRIG]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 0, 0),
+		[F_RD_MODE]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL2, 15, 15),
+		[F_DEV_ADDR]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL2, 8, 14),
+		[F_DATA_WIDTH]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL2, 4, 7),
+		[F_MEM_ADDR_WIDTH]	= MST_REG_FIELD(RTL9300_I2C_MST_CTRL2, 2, 3),
+		[F_SCL_FREQ]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL2, 0, 1),
+		[F_SDA_SEL]		= GLB_REG_FIELD(RTL9300_I2C_MST_GLB_CTRL, 0, 7),
+	},
+	.select_scl = rtl9300_i2c_select_scl,
+	.data_reg = RTL9300_I2C_MST_DATA_WORD0,
+	.max_nchan = RTL9300_I2C_MUX_NCHAN,
+};
+
+
 static const struct of_device_id i2c_rtl9300_dt_ids[] = {
-	{ .compatible = "realtek,rtl9301-i2c" },
-	{ .compatible = "realtek,rtl9302b-i2c" },
-	{ .compatible = "realtek,rtl9302c-i2c" },
-	{ .compatible = "realtek,rtl9303-i2c" },
+	{ .compatible = "realtek,rtl9301-i2c", .data = (void *) &rtl9300_i2c_drv_data },
+	{ .compatible = "realtek,rtl9302b-i2c", .data = (void *) &rtl9300_i2c_drv_data },
+	{ .compatible = "realtek,rtl9302c-i2c", .data = (void *) &rtl9300_i2c_drv_data },
+	{ .compatible = "realtek,rtl9303-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, i2c_rtl9300_dt_ids);
-- 
2.48.1


