Return-Path: <linux-i2c+bounces-12400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B4CB32F89
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 267547B041A
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCDA2DA779;
	Sun, 24 Aug 2025 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEiR4MuB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7B12D94AF;
	Sun, 24 Aug 2025 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035280; cv=none; b=FYXoIWzxhEIad3tvWq82zreBDwkS06wT3yLNMmi5GVXVBMXsSP/9cNAKGEPdqf1SKkvnQb5f01St6j8f8m1pMIv7qEiX87PLXefn1ZYBoY8BEEc1f1D73aiOlvhucaaVqNJIa7nIDU4E/7x5sba6eW3IED4cXTHadPpqZHdBYWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035280; c=relaxed/simple;
	bh=47i90oI8w96X07HMTvKU9lfgyYxuwalbzpZu3cH+DkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBUWn/jYpsh4oTTQ2y9+HVVLUFaPSZfeoFFiqdR8ULHeXhFR+hLbrCHSSJoC7LvNCXBviL5hpLAZO6xv7NKIy4NWZz4bsjN0xK3zxbImECjV5xYxX5dz7hvP9q03k6Km4avp8dQ2ZtYJYl6qhEwP2m5c8rdLE3fbDKbNaVW0NQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEiR4MuB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c79f0a606fso585658f8f.0;
        Sun, 24 Aug 2025 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035275; x=1756640075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfsoRA8pDslrbI1hhUyS/52BVTAd4hsWRjGzfgmiIgI=;
        b=OEiR4MuBqJbKAtZA9SSXIm8ONgkieIzYYckfJb2xu7y5Zh49Oq570MKyY0/6c0av7p
         qByqaZQnFmcm5VW1T5qhwOIJo9+Tbr/2ppQ8R/yW9UIhrQdI99Ezu4vPBsZvd8vxjEge
         esAbEZy6jaOxCXlJ5Q8OCojB+7xEiddIxS0fXXdiULGrNJFvoAViDpWyA1EsbQGNL/a4
         Zu2fayqVQBifqOgh8v2wezqAktC1lV6k33EyQT9YMxNcis/SsF7DyMqEr98nWeWJ5oVC
         wwo8brMbwEwrTqDnsYqg1hTtsrOMMEIT2luwq5tnkOyDcaGAB1E0FmriR++vp3Ccq8Nt
         p2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035275; x=1756640075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfsoRA8pDslrbI1hhUyS/52BVTAd4hsWRjGzfgmiIgI=;
        b=E+2eJk3H5SYRyMWhNQbyVUvlOnfDfhyioB8ReHUe+EKjqzuByU9fueV20RWzUkeE6E
         pUUDwtKghnFKOLPhNyZELROaOoLc0bNtm9qBlLbFAu4Ylgfa0x36XBhJtV29w3QNceFY
         TVZHBQB04S4VF7rjr/GgixhEbl4vqppE2UJoGLjBT577wWYEkJuZ8qW/brGnZURRGqkp
         KRYMYNqVSZy2IfDycUM3kFsJRp3bbqEh2zWeUMteifntZW3DfPETgWZQhh9XhcVywdim
         Ms+NUymilJLQLAiOdZFvHk02E2NARlEslTvm72uB0dqbtFLzfT2ko2NXk1J1SkwDU/c1
         Ha3w==
X-Forwarded-Encrypted: i=1; AJvYcCU3saGN1/osWvUiKIYsSsMrEF5lVn5tz8J61Nvob1SVdJHgZuSehCLE5FVw4RHGktXN+0bGH6tyawCsE1ER@vger.kernel.org, AJvYcCWl6YWdgM/cxWDO3enaLkRgt6oLwx02WsnLN6BdPibDVQeylTMwFsu8xwO6si+TPAkTs8SL1IKXTQOW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxih9AgUKn77KGC88xjFZXX4XfHGT4hKSlwLdnz1RnlaBs7HkiY
	3bhceLxJ2Fzxm6+A8zDyOvnq+/Pi8cr8skQypah4DBlNPJbY6pUb40jZ
X-Gm-Gg: ASbGnctj5i2QA1OmXqmp/39/UVkyRCIDbRJHRVMJjAn9HvIxiqakLRntR+oUgycTQA2
	Ab7wu1yP+Az0xTgKEAeZm2pclXysgJPMwQrso+wtJLOO9uZaYqySszSSvKtMFvfOnyz5QSiPK5Y
	YNln4IUGg360xF4cx780cAJrD5/X33FyiZBkh36SD+3YFX56kueVC8zcPrdn+RlW/xQrGGq+I2s
	5p2GnXV+yv9DqCTKH+i8V2ycisL/tXfAUeANG40SG8u36CoEJX/M4B3X8zrTMZ8jGylPPi3Mz9c
	qNoxcQi32jaZoRHdpsjoNmpODQBUeVzsWAta9DCYY/JlfIKCoT7Y+BqjWmc28wzpO/QwegtD92Y
	4U66ih1a72bRwlL+lU1SXgCua1Am0a7WqrH2RRd5+P89uMHZPdfp26Go=
X-Google-Smtp-Source: AGHT+IEIumGPD3s3+qWkOWX79dztIdQIgnp9CLQuqnHstWNzR7vX5AsLP4sC58TFgCXYE8ZWyS5x8A==
X-Received: by 2002:a05:6000:288e:b0:3b7:9214:6d73 with SMTP id ffacd0b85a97d-3c5dbf69b9dmr7093158f8f.20.1756035274614;
        Sun, 24 Aug 2025 04:34:34 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:34 -0700 (PDT)
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
Subject: [PATCH v6 06/12] i2c: rtl9300: rename internal sda_pin to sda_num
Date: Sun, 24 Aug 2025 11:33:42 +0000
Message-ID: <20250824113348.263475-7-jelonek.jonas@gmail.com>
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

Rename the internally used 'sda_pin' to 'sda_num' to make it clear that
this is NOT the actual pin number of the GPIO pin but rather the logical
SDA channel number. Although the alternate function SDA_Y is sometimes
given with the GPIO number, this is not always the case. Thus, avoid any
confusion or misconfiguration by giving the variable the correct name.

This follows the description change in the devicetree bindings.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/i2c/busses/i2c-rtl9300.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 8483bab72146..f9b5ac7670c2 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -20,7 +20,7 @@ struct rtl9300_i2c_chan {
 	struct i2c_adapter adap;
 	struct rtl9300_i2c *i2c;
 	enum rtl9300_bus_freq bus_freq;
-	u8 sda_pin;
+	u8 sda_num;
 };
 
 enum rtl9300_i2c_reg_scope {
@@ -67,7 +67,7 @@ struct rtl9300_i2c {
 	struct regmap_field *fields[F_NUM_FIELDS];
 	u32 reg_base;
 	u32 data_reg;
-	u8 sda_pin;
+	u8 sda_num;
 	struct mutex lock;
 };
 
@@ -102,11 +102,11 @@ static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
 
-	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(sda_pin), BIT(sda_pin));
+	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(sda_num), BIT(sda_num));
 	if (ret)
 		return ret;
 
-	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], sda_pin);
+	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], sda_num);
 	if (ret)
 		return ret;
 
@@ -243,11 +243,11 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 	int len = 0, ret;
 
 	mutex_lock(&i2c->lock);
-	if (chan->sda_pin != i2c->sda_pin) {
+	if (chan->sda_num != i2c->sda_num) {
 		ret = rtl9300_i2c_config_io(i2c, chan->sda_pin);
 		if (ret)
 			goto out_unlock;
-		i2c->sda_pin = chan->sda_pin;
+		i2c->sda_num = chan->sda_num;
 	}
 
 	switch (size) {
@@ -374,7 +374,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	struct fwnode_handle *child;
 	struct rtl9300_i2c_drv_data *drv_data;
 	struct reg_field fields[F_NUM_FIELDS];
-	u32 clock_freq, sda_pin;
+	u32 clock_freq, sda_num;
 	int ret, i = 0;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -414,7 +414,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 		struct rtl9300_i2c_chan *chan = &i2c->chans[i];
 		struct i2c_adapter *adap = &chan->adap;
 
-		ret = fwnode_property_read_u32(child, "reg", &sda_pin);
+		ret = fwnode_property_read_u32(child, "reg", &sda_num);
 		if (ret)
 			return ret;
 
@@ -431,11 +431,11 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 			break;
 		default:
 			dev_warn(i2c->dev, "SDA%d clock-frequency %d not supported using default\n",
-				 sda_pin, clock_freq);
+				 sda_num, clock_freq);
 			break;
 		}
 
-		chan->sda_pin = sda_pin;
+		chan->sda_num = sda_num;
 		chan->i2c = i2c;
 		adap = &i2c->chans[i].adap;
 		adap->owner = THIS_MODULE;
@@ -445,14 +445,14 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 		adap->dev.parent = dev;
 		i2c_set_adapdata(adap, chan);
 		adap->dev.of_node = to_of_node(child);
-		snprintf(adap->name, sizeof(adap->name), "%s SDA%d\n", dev_name(dev), sda_pin);
+		snprintf(adap->name, sizeof(adap->name), "%s SDA%d\n", dev_name(dev), sda_num);
 		i++;
 
 		ret = devm_i2c_add_adapter(dev, adap);
 		if (ret)
 			return ret;
 	}
-	i2c->sda_pin = 0xff;
+	i2c->sda_num = 0xff;
 
 	return 0;
 }
-- 
2.48.1


