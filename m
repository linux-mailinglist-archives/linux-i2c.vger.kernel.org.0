Return-Path: <linux-i2c+bounces-12527-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A42B3D1EA
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35034189D9C3
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD9C25A328;
	Sun, 31 Aug 2025 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSsfooEt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21DD2580D1;
	Sun, 31 Aug 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634728; cv=none; b=eUsszHv5unBD4dxWBYfADPgP3rTbUV1jZPpGJHHcmNBMQ7NAY5aiIG+qEWKy1l6CmvLSbrHANKOmpe/fAkcgYeTHV4xuJn+AcsmI9RY/yq2ffy1/L9sk5MyrLZ6nTLlKVbVISPV9GQHSOonftUoMQf9kfnl/TFwHtuE7DJgPYvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634728; c=relaxed/simple;
	bh=AFqIY5K8sOwwkDorLtwVJ59nbbKz5t+8UF9iXhMSMFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUi95sN7B+LnIblvyg0ZIDr63FPELEt51ayFN9DPZ6yBb/vWqdY3dnDO/QvZUhtPiA+HNfgXmK/OfyI4S7V6Q1e2wKlBmivyoJRYqOzcJ8m4zzRYplCkILEjaZI/7X2ZoFOT1HNBbA8j3juZXxwUIh0rWMCHy7GzkqRPscjCxGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSsfooEt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b7d485204so25257175e9.0;
        Sun, 31 Aug 2025 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634725; x=1757239525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o66Q1Lw8zZ/26/utPV4SsAzNqR677/9mko2KdXqHbnM=;
        b=DSsfooEtYEzekMaveLKepVn/aRZ8OwCAOQV1YrupQWzumoyBtRq6pZW/FXkgE5uxy2
         DiLTfYs2ytV0572u/1zGw76EXCDiVp5b+RHzqmW09gAlCqMcZG9ynQt6kFSyEZ/F/NU0
         R3NkBgBlvJac3/BjoCWt+dwrSmdXHnj/J4i57wYIRQGLnubSycPy1gisLLI3ZnrcvIGH
         lyWWggNTn2go29804ZLAm2RdyzM+BFLW78r9mK/npEJilljL2yEkn6CKqyw2a3/CNafK
         mhFmWw+xLWUAexchMCZTR4A82uC5QfQRdA+Hc/D+WhqRErZsL8m+byoWb3TrK3NU/7Wf
         hgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634725; x=1757239525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o66Q1Lw8zZ/26/utPV4SsAzNqR677/9mko2KdXqHbnM=;
        b=fRbPOK1Yd0mN68b5bv9lKiQp50ANi35JjUVO31gSlGry7UtH6obY8Bb+BAobrfkqv9
         ZDTdshkGM3crG6zwMj/gySOzFLPquA4keqbosoYb10rHKb/qR73TNATpC3/T1IxSBg+j
         hjQca7yuHBTTOcXr8ByDKgfehobxunXu0NI5RIWtE45/Y+gEtdXs2H2CWeGsGNqZLlB1
         i0ONp8MB3KNNFVAwdbOzWIovthkEy7R2T+XjE7SURhuz6cR2xGHaib00yzVmqpFNguhL
         R6ijI8YWh5r3CBXpiibGBVSzYXHokwUYuFdYj5f9mkOvItGBWzusd8+I5uCgF5yHtpuN
         7qig==
X-Forwarded-Encrypted: i=1; AJvYcCW6InqrHKdWUcto3rxR5w0sLtCQs4EIJpY6jbTOw2Q3EGbM3Z733pm4Gh9wpqp7oQ2hduptzcx01qRT2yfz@vger.kernel.org, AJvYcCWNXuOefI1NjdeF2/DXE5h2+SPOM0HfYlZJDBbAQwJN3LTzoGKp/Bqwhtg/XJaRhF8JD+ec6JEXmsjp@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQ2wvALQ23VfI948czVp8tDRVjvrCiYXvqCbTY4Gd/4XGYeEs
	efseoVFeDGEwoMOFz8E0SSyYrcBTXUAuI0X6kN4JwQMnul4VIAgO7Htx
X-Gm-Gg: ASbGnctA8/p5b8Gm5OnlNqnpAemJrPT6NgNG5j7Jj0JDDH7v9qOEuoRtdGjqAqc0xE1
	gfJ+wPhu8bOhbBrhjlVc3+CSBwVY7FoTYHUZ2AVyQTx930GxjyuGkBhFShX9pNeGY9Rd7mStbJv
	VZzR3FbGtWsRFYNWhn0v3fsPAAQEwD0RHL1xrbz/ELGe0BKpCt0ZY08fcLWWJ0BinUvvrR8nURO
	UN9aup1zPvccdc4003P/S3SgeOcYoHrVdYELroQzum1J1KGpYRnuRo70ypWWm0Qs7y8sB53pkAw
	BusPpd5rw2ap3i4YySH3sG2ues4PA4yDwVSsMQ6MfSuXQcSb61kRjDPfwYolPkotGes5u3zRIlI
	yYb/lKApEucZc1+VIiHvNGyyV2Hmhgq7liiRMV3w71P+ZCtBpS4lM8AQUG2Vfb4g=
X-Google-Smtp-Source: AGHT+IH3jKttu8rAtw8BSFmnn0cJTwUT4uzNMmOU7IgfEmOeVmCI6xNeewf1huJJhLnE12ik36596g==
X-Received: by 2002:a05:600c:3b16:b0:459:d709:e5d4 with SMTP id 5b1f17b1804b1-45b8549c493mr30476145e9.0.1756634725111;
        Sun, 31 Aug 2025 03:05:25 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:24 -0700 (PDT)
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
Subject: [PATCH v7 07/12] i2c: rtl9300: move setting SCL frequency to config_io
Date: Sun, 31 Aug 2025 10:04:52 +0000
Message-ID: <20250831100457.3114-8-jelonek.jonas@gmail.com>
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

Move the register operation to set the SCL frequency to the
rtl9300_i2c_config_io function instead of the rtl9300_i2c_config_xfer
function. This rather belongs there next to selecting the current SDA
output line.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 drivers/i2c/busses/i2c-rtl9300.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index f9b5ac7670c2..4177cfb77094 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -95,18 +95,23 @@ static int rtl9300_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
 	return regmap_field_write(i2c->fields[F_SCL_SEL], 1);
 }
 
-static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
+static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan)
 {
 	struct rtl9300_i2c_drv_data *drv_data;
 	int ret;
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
 
-	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(sda_num), BIT(sda_num));
+	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(chan->sda_num),
+				       BIT(chan->sda_num));
 	if (ret)
 		return ret;
 
-	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], sda_num);
+	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], chan->sda_num);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
 	if (ret)
 		return ret;
 
@@ -121,10 +126,6 @@ static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_c
 	if (len < 1 || len > 16)
 		return -EINVAL;
 
-	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
-	if (ret)
-		return ret;
-
 	ret = regmap_field_write(i2c->fields[F_DEV_ADDR], addr);
 	if (ret)
 		return ret;
@@ -244,7 +245,7 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 
 	mutex_lock(&i2c->lock);
 	if (chan->sda_num != i2c->sda_num) {
-		ret = rtl9300_i2c_config_io(i2c, chan->sda_pin);
+		ret = rtl9300_i2c_config_io(i2c, chan);
 		if (ret)
 			goto out_unlock;
 		i2c->sda_num = chan->sda_num;
-- 
2.48.1


