Return-Path: <linux-i2c+bounces-11921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6ACB02CB0
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 21:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C43FAA461F3
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 19:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF34028F528;
	Sat, 12 Jul 2025 19:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHB9gtfw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB80528DF01;
	Sat, 12 Jul 2025 19:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752349406; cv=none; b=D7j8QXpPUu6m7rVkRgNjcC262LSr7OJ3Vsh5I6jOzMCPACe2qecZJM584+66VcY0ID9IonQKTvaNFzq1dic/BHBAz2De6VKf5yLgSN8emE7778dgTpCqS8XwaInoWg9n5WR1z3CDt5NM2fTp+bru6mpMto395G83kr5bTY4OW9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752349406; c=relaxed/simple;
	bh=MlD857l8cHKkEZPO+iHg5hCM+5U6Q+uE27YySfa9ceI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EcyVQHTjQxNYBRhVLoy0g5Y89BFAKCLa5h847OCRMgXkV/lvQWSkv1ysJUNudRD58Iw1HbfKcxfKKqjMSCLbYnnCv2690hj+zNnLj9sLgvJ5nnQWKwNNjntH9a0VgkNc4Y0kI70QJqoC9bM8YgXMBnX40UrKo8HDRQP24QoWOiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHB9gtfw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45526dec171so18743515e9.2;
        Sat, 12 Jul 2025 12:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752349403; x=1752954203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93QiYY9UXUVXVwv33Amwr6dmZ/i/JabCetPl6frAVnI=;
        b=AHB9gtfwgBlakRG0mRO7n2mHMWUa4cUvv7HFWHfjreJSA6u3S23UcDxL84ytlKkzaf
         njsWOSnkXi1SLT3BgZUbIq2UQbFnbvXp+KG8GBgLpkzQky0sGrlFAfmSlkUy5Db5qNyM
         n21rDuaKNXh8BTTyFNtBERmOJy9SHvGCcPR9vUNbV1K9SBYpFzy14/GS28HEQ4GhvSKU
         KkBuKRqF+PWCMvDIIaXQ9W+F5WjDT6QExfGtMCAicTNolCaEfPRxRuylTyAfqcn85tsC
         tOKDJqzl3nn51Eu/qZZJl8Bpr73KnHO75Q59ognh+404qF5KaPBkxcqsfXALu00UkfHu
         rYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752349403; x=1752954203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93QiYY9UXUVXVwv33Amwr6dmZ/i/JabCetPl6frAVnI=;
        b=sZ4PUcNrf0WmMNNmfE22bnH/YV6HvJrCYbvT/UkyTisRXH7m2hKjS+PyeV9wkfjloC
         pAZeuimPWOatMjmnqbFdDbDU6SqrTYLNXOWW+/OEPz97mpJXovIl0BRTZcc5YsASr20w
         XuoEntxKL5sqf0zoY38/5kOcg6hmvJ9d3Mc9k2rfoCbzFdf7poH4jHE2e59Aniw6moP0
         PQg4hjAE7o55LhABlcY/oUF/gdsgXI4fTa/1gzjsJT4Uv5piaXmTQh8HCKfdCJib3y9S
         lOgI2Kp1Xj9lMM9NSISHxalwNn2dq6Gq/QFtzB1pG9x6yRoDmHw20OrWGsUf/3JgF2rM
         mXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0fw8Eu6DUNuf3RjZ3uMdYUNOKpsvwTv0VdBSBBojKdwYRGpcFEwk6HdFYNgpDysezBgYGWM1FVDllEbQ/@vger.kernel.org, AJvYcCV7HHBq1EX2K8bnP2kUVky268bRXZutzDRIRf4iKOjlHhcwV3hHwT4mbglOIES0V5NFW20gyOUrHzsF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw8eJyOmVTBnXhKxOsXrlx/myoHKxjp0KqKEuiu9tX2all9PD+
	PT2VJs9ZRb1VxpB+tN7FnqVlvhv5xDWfpd03dylQO281kgmWuRZwlDzVGGcYBA==
X-Gm-Gg: ASbGncuC+Pu7KSd0OGpTMOUdwvtYwABaQAtNfKzuIzGCxr4bSkoomZPalLz+hw9v7A9
	MFwJ0OsqL+0adeDx5dQuPrMaQmy5bS6wwK7omRM6EL2c+sblfPZRmzOX3J8bFT0wxiep6z8Hf8R
	ra/186g9RL+lrhrX6gYx63/u+gbmwDbIbotKg0gjNDIAb07Ci3AGoD/siMG3RBjH2aSEKFzfqQm
	VGAVjBC5i8vksrjSDu3WviaqUcbLeRwl1Lp2g66wHwesPnhwoF4z1lwyxX3zn1T4ilD/evxNs8o
	U6G94Q3zBYxpJ62yZQ3ZLO6PdK5s/4rXjVzk/lr+tYwzFVSEVjqPCN46aDfQdHlNKvnlN0LTH0E
	LDVtQcYTcrCqmbcfdU8EwABiFSSqH8fbEpSdSFpAlYVhesP1ZyW2G
X-Google-Smtp-Source: AGHT+IHtgsunHSjhffRz6c1cc3DmsH0OXq8L9HuXPnbjY498/l44sqIBP1B4Z2vdh3BvryNhDUc/pg==
X-Received: by 2002:a05:600c:1c21:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-454ec1342c8mr69793865e9.15.1752349402777;
        Sat, 12 Jul 2025 12:43:22 -0700 (PDT)
Received: from builder.. (246-9-142-46.pool.kielnet.net. [46.142.9.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032e9esm123422335e9.3.2025.07.12.12.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:43:22 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: linux-i2c@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v2 3/3] i2c: add RTL9310 support to RTL9300 I2C controller driver
Date: Sat, 12 Jul 2025 19:42:55 +0000
Message-ID: <20250712194255.7022-4-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250712194255.7022-1-jelonek.jonas@gmail.com>
References: <20250712194255.7022-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the internal I2C controllers of RTL9310 series based
SoCs to the driver for RTL9300. Add register definitions, chip-specific
functions and compatible strings for known RTL9310-based SoCs RTL9311,
RTL9312 and RTL9313.

Make use of a new device tree property 'realtek,mst-id' which needs to
be specified in case both or only the second master is used. This is
required due how the register layout changed in contrast to RTL9300,
which has SCL selection in a global register instead of a
master-specific one.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 43 +++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index f8e81102ee74..9bd8a62a2ba0 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -59,6 +59,7 @@ struct rtl9300_i2c_drv_data {
 };
 
 #define RTL9300_I2C_MUX_NCHAN	8
+#define RTL9310_I2C_MUX_NCHAN	12
 
 struct rtl9300_i2c {
 	struct regmap *regmap;
@@ -67,6 +68,7 @@ struct rtl9300_i2c {
 	struct regmap_field *fields[F_NUM_FIELDS];
 	u32 reg_base;
 	u32 data_reg;
+	u8 scl_num;
 	u8 sda_pin;
 	struct mutex lock;
 };
@@ -79,6 +81,11 @@ struct rtl9300_i2c {
 #define RTL9300_I2C_MST_DATA_WORD3			0x14
 #define RTL9300_I2C_MST_GLB_CTRL			0x384
 
+#define RTL9310_I2C_MST_IF_CTRL				0x1004
+#define	RTL9310_I2C_MST_IF_SEL				0x1008
+#define	RTL9310_I2C_MST_CTRL				0x0
+#define	RTL9310_I2C_MST_MEMADDR_CTRL			0x4
+#define RTL9310_I2C_MST_DATA_CTRL			0x8
 
 static int rtl9300_i2c_reg_addr_set(struct rtl9300_i2c *i2c, u32 reg, u16 len)
 {
@@ -96,6 +103,11 @@ static int rtl9300_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
 	return regmap_field_write(i2c->fields[F_SCL_SEL], 1);
 }
 
+static int rtl9310_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
+{
+	return regmap_field_update_bits(i2c->fields[F_SCL_SEL], BIT(scl), BIT(scl));
+}
+
 static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
 {
 	struct rtl9300_i2c_drv_data *drv_data;
@@ -111,7 +123,7 @@ static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
 	if (ret)
 		return ret;
 
-	return drv_data->select_scl(i2c, 0);
+	return drv_data->select_scl(i2c, i2c->scl_num);
 }
 
 static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan,
@@ -346,6 +358,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rtl9300_i2c *i2c;
 	u32 clock_freq, sda_pin;
+	u8 mst_id;
 	int ret, i = 0;
 	struct fwnode_handle *child;
 	struct rtl9300_i2c_drv_data *drv_data;
@@ -366,6 +379,11 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = device_property_read_u8(dev, "realtek,mst-id", &mst_id);
+	if (ret || mst_id != 2)
+		mst_id = 1;
+	i2c->scl_num = mst_id - 1;
+
 	platform_set_drvdata(pdev, i2c);
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
@@ -457,12 +475,35 @@ static const struct rtl9300_i2c_drv_data rtl9300_i2c_drv_data = {
 	.max_nchan = RTL9300_I2C_MUX_NCHAN,
 };
 
+static const struct rtl9300_i2c_drv_data rtl9310_i2c_drv_data = {
+	.field_desc = {
+		[F_SCL_SEL]		= GLB_REG_FIELD(RTL9310_I2C_MST_IF_SEL, 12, 13),
+		[F_SDA_SEL]		= GLB_REG_FIELD(RTL9310_I2C_MST_IF_SEL, 0, 11),
+		[F_SCL_FREQ]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 30, 31),
+		[F_DEV_ADDR]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 11, 17),
+		[F_SDA_OUT_SEL]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 18, 21),
+		[F_MEM_ADDR_WIDTH]	= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 9, 10),
+		[F_DATA_WIDTH]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 5, 8),
+		[F_RD_MODE]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 4, 4),
+		[F_RWOP]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 2, 2),
+		[F_I2C_FAIL]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 1, 1),
+		[F_I2C_TRIG]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 0, 0),
+		[F_MEM_ADDR]		= MST_REG_FIELD(RTL9310_I2C_MST_MEMADDR_CTRL, 0, 23),
+	},
+	.select_scl = rtl9310_i2c_select_scl,
+	.data_reg = RTL9310_I2C_MST_DATA_CTRL,
+	.max_nchan = RTL9310_I2C_MUX_NCHAN,
+};
 
 static const struct of_device_id i2c_rtl9300_dt_ids[] = {
 	{ .compatible = "realtek,rtl9301-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{ .compatible = "realtek,rtl9302b-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{ .compatible = "realtek,rtl9302c-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{ .compatible = "realtek,rtl9303-i2c", .data = (void *) &rtl9300_i2c_drv_data },
+	{ .compatible = "realtek,rtl9310-i2c", .data = (void *) &rtl9310_i2c_drv_data },
+	{ .compatible = "realtek,rtl9311-i2c", .data = (void *) &rtl9310_i2c_drv_data },
+	{ .compatible = "realtek,rtl9312-i2c", .data = (void *) &rtl9310_i2c_drv_data },
+	{ .compatible = "realtek,rtl9313-i2c", .data = (void *) &rtl9310_i2c_drv_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, i2c_rtl9300_dt_ids);
-- 
2.48.1


