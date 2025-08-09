Return-Path: <linux-i2c+bounces-12185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F11B1F700
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F065D189D00A
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3769C2BEFE0;
	Sat,  9 Aug 2025 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmTnU8uC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387CD27F01E;
	Sat,  9 Aug 2025 22:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777249; cv=none; b=X5CunvJV6sj2l8d2+gpfwA24ozsAsvWh4KZ4bqB3BHnfYvQ9OO4UncZmWKfSDzmjEfiYnwr37Z4uDfxDPMuU0EjFeEPQ7beaURgPhzFIyZ9z9F+RaGHYQ/JehCDTYiEf/C9b56dHkPTd0RjjPC8ugJ+9fwLEVbr58DLOtEosF/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777249; c=relaxed/simple;
	bh=3YNOkImgwVfI+pWp86k6nUySICHtMkmb2QGA2Puzqd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nh9UmT+BO0F1Rwpx0IReuX5OTSYhZPxC/Xyfz3JytLzrjMOxTM/ceIVHimRlTw8ed0915QCi0Axk3gCgxmcyRU77hXUDEbURpZusfFJ5sJPlgwPD/UrHAXXZ2xeUarea1YIVYtqFWbFhj1h0auRm/ADy4WFofVdumEL7JUQ/RGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmTnU8uC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459ebb6bbdfso20669225e9.0;
        Sat, 09 Aug 2025 15:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777245; x=1755382045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/WttvoUWYXwGmiL1UfJtJUaMU6sMxC7Q9rpNumbg+M=;
        b=AmTnU8uCxe84Q1yxhAbJmbBZ/1fp/Hpmthb9OLYHgAXHVu9q+um4raYBWn88oqk3eA
         cZjpqmKHy2LA67Jmd8j3tSk10p4Zuhu6w3iDGE1OYYFAnurZdEvT6h5N0TnYZU4Cy1n9
         uOCeN5nIfvyyjYdgJoIFro56S4E/ylIho+zlUWXIoOPWJ5lSXImx9sHRRrB2hMUeKvuj
         3ToCA3jZ6t/LEEEERikdC1zj72V2uufY5BUWFrweB0pyCjsNPR96gwpmZC6ozjwXgl5b
         E27MUv3QET8UL7WZUF49l5rJpLtDdX2FAGPm/EdlvtyYrjwfq6tZjYRRgM6TsSmfQ1WJ
         Llvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777245; x=1755382045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/WttvoUWYXwGmiL1UfJtJUaMU6sMxC7Q9rpNumbg+M=;
        b=g/8v/8g2QnKt7vqj/7KRPLymqM8S6lxjEQr1mde0YSlYGdd6T0gPDozjCT4utFjYvP
         SV6sCqbSkVVEcz5EA5o+yk7oq1jHocH+3rU3CnBx33UZ++OCYHKAZPJSDjUXpl6dL9Eo
         HjzCYydB9n74ziKLrxgRW0VZ9dW+LtvdA981NSbzMpcjfr/iH383Gc//8ErFTxMD3ncT
         NMi5fapKG4U7kmX9aWnysLz8yxyk2yVu3/4A7V3fjpvVBrtHmLkNVHj7EIvdUwDSsVZl
         3XRiCcFx5cYHf3gFAhWl6iKyZo/E13bh9YMjac5iwl5+Exjk4dtzN58n05lQQXMwvCOI
         hPVA==
X-Forwarded-Encrypted: i=1; AJvYcCUXTib4jpBFgtzQnNG7Kl0J+Ojwx0ZRKGIxdRvFrV7EI9JqukAk/kdoYdFyw92xsu2h6dO4dwrJqihE@vger.kernel.org, AJvYcCW3zxr7fmsuxcuP7ttKXn+rmlHGReCoarOPKXjn6UgLDbn/fvTaDqvfsPBlSyaGqY5VvlA6uPIxZIzxFqJu@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ7uED0ZhqUiZ8f9pc/29cJvomq7SfYUbGgPUMjl7IC7UsBAZb
	R2aP4jqGFU4eujYLUVtgvjlht73yU1M6IrmppKIws973V4iuxCxFyZDo
X-Gm-Gg: ASbGncvSYJrk2QB+4UqhUzfeb573RCJBKsOsETL5JX//4c4CUrcutUbmyi8+KL1tYIS
	nGBHUpnCC3lXubzhT0wprK1qtXzWTzw32TcfMyfwqkxkPC2lxABrDWpR1XC+Rn/GsC0cUtXtQAr
	OgAWpwPzoimRzTZOjkaiu/8Z4yw7av20+AAItaZ5dSHnIBu2T6+lTOfUHUAh8eXBwNs0VgBQBYV
	3h6HPEwObCCGQoSRelhedsFMrlmmxjZHnnNs26KDRHMraiQGVpUjG7kinjev3SxzEgP1az8uyVh
	AIfHhJ8TCgaTPBT3UrTCVkUznV6M6us1DO3Jd9CATOYQarzxW5m5o4Cfbdu0lvFoBiLBJBzne+/
	+2ybsClqCQ2NimMV2Pyw30C69hYYEbN6XaX7Rvj+n8/tOvv5rM8yD
X-Google-Smtp-Source: AGHT+IGNBw7F6+8dYU8pPOC972HlAtxrDQeVu/wHK2hUTk9j9tZzcpTwbbKmt76LVBfUth2QpUAfHg==
X-Received: by 2002:a05:600c:1ca8:b0:458:bc3f:6a72 with SMTP id 5b1f17b1804b1-459f4f3f38cmr71221945e9.4.1754777245498;
        Sat, 09 Aug 2025 15:07:25 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:25 -0700 (PDT)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 04/11] i2c: rtl9300: rename internal sda_pin to sda_num
Date: Sat,  9 Aug 2025 22:07:05 +0000
Message-ID: <20250809220713.1038947-5-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
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
---
 drivers/i2c/busses/i2c-rtl9300.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 68acbb6cc5a4..fb1ea2961cfb 100644
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
 
@@ -240,11 +240,11 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
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
@@ -381,7 +381,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	struct fwnode_handle *child;
 	struct rtl9300_i2c_drv_data *drv_data;
 	struct reg_field fields[F_NUM_FIELDS];
-	u32 clock_freq, sda_pin;
+	u32 clock_freq, sda_num;
 	int ret, i = 0;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -421,7 +421,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 		struct rtl9300_i2c_chan *chan = &i2c->chans[i];
 		struct i2c_adapter *adap = &chan->adap;
 
-		ret = fwnode_property_read_u32(child, "reg", &sda_pin);
+		ret = fwnode_property_read_u32(child, "reg", &sda_num);
 		if (ret)
 			return ret;
 
@@ -438,11 +438,11 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
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
@@ -452,14 +452,14 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
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


