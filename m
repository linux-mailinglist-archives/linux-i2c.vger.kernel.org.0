Return-Path: <linux-i2c+bounces-12526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8A7B3D1E8
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A03A189CFB7
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A23259C9C;
	Sun, 31 Aug 2025 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hraYQVhI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C03257453;
	Sun, 31 Aug 2025 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634728; cv=none; b=urCNJgUSf7BKu//vYv4GrfG5aNG5it1M3JfFLKFkvhtn+DzR3FSerNuDqVjMKWU7aMEAm3+QHxvvLzeGoPmujrdXhHgIE3+IqQ4acHxw4VcQdxg67LKcWPU8hV2Xrp2oO/8oFi5X6F2UkQr0Jg1mikL8s/VqIF/AAhlyS4PSzT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634728; c=relaxed/simple;
	bh=2GCjGAmxaqdnNa1gX1x/7BofCtSlrnlXaasLQu8+NAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHybEVusUHYroUHQnKXultMkTVZg9elQHKZfne35CtpvICj1fTIfANm94Xn6kcyUFqdQ+fVeYoN9P5pWnG/vQVWNwlrU929hI0llTUB69Z6kcrexEnCQWKC5CE7GjDNBeSZDWRf2Z6BpUeKDhwB2R08QIktDlLBkXSV/zpryi/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hraYQVhI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b873a2092so7271235e9.1;
        Sun, 31 Aug 2025 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634724; x=1757239524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkmZ10FKl6mvyrUUIGFDD4hFu3/JPG8wZl/qSp4EmOc=;
        b=hraYQVhINdSSgTId9TrwA4Mm4mTTCWkB63TOQkNCXtExAgqMrmBIGMql7k8ndcV/EE
         XcZL5inKWUHVTBjH0mkrrAGTMQYLxowmjNsVjSkQb3mYdI1VYlwBE9GiGTkcWQiBz/oc
         Ecl4EPMCFA2vd28pn+Yw9RM/UH9XSGo5jRNDqhJiXKsLA7GyJGRz6K4YkQrkcFXBSTC/
         H8w2bqugl55pKV55k6D0cqaAGPFKQAybvB4+RD0q4C0LBU5WN5KzdHNbHPNPYvs2t7Th
         01LXGxK7dq5ptKmqD9kt98VOPjbkQ1CoZYbFDdo5lpnn0Qc6LwA7nB8p1895y98Vix6G
         qbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634724; x=1757239524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkmZ10FKl6mvyrUUIGFDD4hFu3/JPG8wZl/qSp4EmOc=;
        b=Fk+VilIYPxSbeh0y36U0uZFayLAXbvomOQYdy7N7V54c95OkoMGFEFmY13nT4DqjO4
         ujxzDiWYzgZq1U3r/10MNg5BJgblzeLZmr/hXh7KD/6Fhbx3eCR5F3hRe7FoJBW5CQCl
         j6p4qZWgxWI+FyU1REXqajGN/dlHXEHHI99F/7IsATkq/2bRcS1+2CmxG2w/XPyKmbfQ
         MbYxzC1o+jzTHcDdpuSPY+s+nF/EoAZKJiNDl2+aSuDMqOKHabezeYVccRjOE2wfIfEn
         6ppv8NupjpkWKEpkLwVea62WgR7pPbnZAK6LHDh8LbSdUv8VdbPC2polqMxmTDJtnWO4
         NJZw==
X-Forwarded-Encrypted: i=1; AJvYcCWYDVi0vaSxB6sRhKiL8OSftZ+mwdTIfwOSqUUr8MaopKSKGqDOLrMrCJQaSbfwZkTW3O6XPWhocAFC@vger.kernel.org, AJvYcCWnNjr1rspfGIc/G1M6YAm/oPhaCCE/jQ0HHRuM1c4wxZlmpHEqjDKtpURwL6h00TINrDbtDaAkHpFbCQV6@vger.kernel.org
X-Gm-Message-State: AOJu0YzA03XhzU2TutKn0anO3b+dltNBcXDY78koDhDUn9Y9Eh4CzXpE
	ucD4NJAGPhAF8nNM16VgkwJ3ZS0kJuRA+K7XEAABVwH6tCVffuqzjni/
X-Gm-Gg: ASbGncvi1oGw7MUOamFjSike3Hb7vvIy8D4kF9S3e1RIiziriSyrjELe50eIeRtAF96
	1bZF9oGz2LEyGAAmVUka0Mlrld4ai2l7PtZcq/tKTFTZ3q0jm7L4IwBUsxFgzFNRJbYPH4Q6s0+
	Olsv7/4wpkIVTj/pmNWSpcUhGZzrcgEvf3H5opbnMvFfFh2uVrtQMZNxfUtqTdZR2OGVavgJqk1
	jeFD9184yln/i50UO2FmtD3Ri02gQkHHrAf5JTC5Dw6DNQfoKG6H0wv4Dn7JvAJQprQaTdNI04g
	rbakJt8G0Fh+ZxLx98ffeQg1i8mRdZ6oIJJ3J5B6+9TVYM9CESD1lvfQ/hhYo28CNT6aCvXUl7y
	VQ4MlGxNJkXd+CDFQfLATn4RimY9RV6sru6PqNe6LFP/l+9sm0f28w5FCrrlvNfg=
X-Google-Smtp-Source: AGHT+IFHd+cbxTNTyLSm6Sh19e8IA78Gv2awYFjRBvAOtqm+vZGnDpnebu//bf+QZgIR1WCesi0+8w==
X-Received: by 2002:a05:600c:4e07:b0:45b:8795:4caa with SMTP id 5b1f17b1804b1-45b87954e09mr23579645e9.36.1756634724285;
        Sun, 31 Aug 2025 03:05:24 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:23 -0700 (PDT)
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
Subject: [PATCH v7 06/12] i2c: rtl9300: rename internal sda_pin to sda_num
Date: Sun, 31 Aug 2025 10:04:51 +0000
Message-ID: <20250831100457.3114-7-jelonek.jonas@gmail.com>
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


