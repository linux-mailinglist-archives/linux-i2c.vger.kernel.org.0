Return-Path: <linux-i2c+bounces-13234-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41893BA5D67
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3D7F1B254A1
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733BE2DC785;
	Sat, 27 Sep 2025 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bP/VAWSM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5062DC329
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758968398; cv=none; b=dkASOrLFg9YYq4GYH5SwnqnlBGqkjLqCPF9FjxhwioFGdF1NFWFp195LgdbybdF04gQ9PVM+d2LqVc9NBPl/hAqfgRoSvavCao2sH2aKsjGhLrZpXc6hmiuN0s445QdVTtm2RDMUA0+rVHtkA7eyTf0CxsaADJQjSTRutPzYYuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758968398; c=relaxed/simple;
	bh=2GCjGAmxaqdnNa1gX1x/7BofCtSlrnlXaasLQu8+NAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFxvByL1uD2Kq4hvtRApCAdlVFD1/5NSisRzIkMQqxoAvNmr5frdoZjayK/kUUk+qRZubIn61MfgdyAClLptqK9GzxYC07L4CGAKBKqyoVKZ2dM0zvmPsezAezx1WaBIvovfIs8aepodgV3HPT/h8IBSIxOQTb8Ioc8LRwx1Cig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bP/VAWSM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so30413515e9.2
        for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758968394; x=1759573194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkmZ10FKl6mvyrUUIGFDD4hFu3/JPG8wZl/qSp4EmOc=;
        b=bP/VAWSMqB55oeYURZmfjNDOf042IizeOn7w+Uio8MEVBnx5CV/H0mBdAJmn8fMzr6
         +l4G9XtrZZSyHqTJ2lVP96/GaCiCg2NA6+WKX+33K7RR/ZIjLB940IqqCOYJn+I03ITz
         OMC7BBdW2mH10fR006msqYI77nJq3OtYaKggY3gmCXDQAhaTdYYJcPITfImbwWXJQ/Yh
         1IdqHZktVX5W+slKLEl4B0lEaTMoqgdQAIU5Q63D5DU7ABRsf4Z3LmSK5HWmZ0XUP9Nx
         dSB6fvy6hd8GY4ARea3K7aP8m6BFHmtV0JH1bXOt/gYWnAxL8cTEXSG23trbsukn86yM
         WAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758968394; x=1759573194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkmZ10FKl6mvyrUUIGFDD4hFu3/JPG8wZl/qSp4EmOc=;
        b=A6m4NWhuebuBu0CuM0X1o0ykbqC+reSg72JKqaRohU/LK/2JXvW8mZXtNiwyHPR6hS
         ChIWu8j4LjVtW+xw6X9khsjdwDH1vrwO2uoNcvBLUUcKfouL5AGXwp22HyKEtbRL0XP6
         NWNAUf+ON7XwXooi9qpxWJzjon+I8ve4+TFwBSRWkrFl3L5PQtaSQPXuB8NU87diNWeB
         1M96rOTGkfKEIfWzmsP8r5QwoALG+PoOFo1NgY1PcfzuObj1cyNXP+Gin520PqrikB4D
         dzNcwSKWY/PQZGoOoaVsiEBF2h0R/jdFNJLG1lNpWBN+fiX6xuG0/rrBtmDg2g+fmh5h
         A6pA==
X-Gm-Message-State: AOJu0Yzh1FOX59l1KAbst43InN7EwncaaIkMlVA6SgfnWEI6ceXlXXsc
	fW47+yQ6N1gMaiYzyVmWQAM66eHwIKOsZg04GWp8PmRQMNkE8bhLqykT
X-Gm-Gg: ASbGncvs5DeuwlpQ/v/+wnjNli5/AsqG+hAsQSI/22VOJI/dPV+8THk723nzq7NmJWb
	YByDugGTs5Qq0dBS/LA8COp8mlDG8ofVGeg0MPupSuhGP+aijKHREaxhjHTm4ese1HUjs83+1Jg
	P3HBcF06MTTDgYan3adRYVCpbVgG/iS0v2bZCUgpDNDv2BKn/rZ3gaE0mio2kO5fzbLuLWCr8D1
	TpA4/ebOMd+LQO31kDeRArHDjjK17Fu7/SeH2BsCW7pHCvwo0qg6wAiBvFcx2S9iyeu7lFl5JIF
	vCXut177dojC9nPq7LQp74dUtd8I2660gJHdET/kpk/E4XVqkorhicu9y75Muy9hpf0JUoxzSQa
	je7Qhal5HPJVrpdOMvsTOcrsQztJL4IzOGV7C
X-Google-Smtp-Source: AGHT+IGByWoLUV1V8F16lY7u769X5HERThmpzD3uDRavVtTlHtIfq3MErm0URpRpds2ISq5txohP6Q==
X-Received: by 2002:adf:a314:0:b0:40f:5eb7:f231 with SMTP id ffacd0b85a97d-40f5eb7f303mr5454210f8f.18.1758968394175;
        Sat, 27 Sep 2025 03:19:54 -0700 (PDT)
Received: from builder.. ([2001:9e8:f11a:4416:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32c31df7sm53416435e9.4.2025.09.27.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 03:19:53 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v8 3/9] i2c: rtl9300: rename internal sda_pin to sda_num
Date: Sat, 27 Sep 2025 10:19:25 +0000
Message-ID: <20250927101931.71575-4-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250927101931.71575-1-jelonek.jonas@gmail.com>
References: <20250927101931.71575-1-jelonek.jonas@gmail.com>
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
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
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


