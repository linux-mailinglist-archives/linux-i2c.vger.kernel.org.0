Return-Path: <linux-i2c+bounces-12398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5AB32F82
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F31887AFC36
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291DF2D97BD;
	Sun, 24 Aug 2025 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2v71Kjr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC942D8763;
	Sun, 24 Aug 2025 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035278; cv=none; b=rIMymgysU2fdzmPfLtJcdzIwvL6tUu9RX4mA22zB62FqJsC/62bTRwni5ZulJKbL1ihMYdObQKJ44pc4AV2m5k+wJJmitphMO6sX/oC5iV1aauA/Hw0z54X4lmEWlbt97R7KGOEN2Mirfo+1tD9nvSvYpEGXlnRTHpipxQOKJ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035278; c=relaxed/simple;
	bh=mC0Hz8rKvpYmxinqi8UXJUT5q7HWthragLXxi/PIwvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glE+d7MsAo8rNIY8DwMgO3ebbxXAxZhiIY3EgPvwd1wZaIlpZKFBzgvtc64lG3BlqZYV/8G/Q3l8kBdaRPE0T9X3dtGbryWDmPlNiPFiNkurLoP4sgcIjLXp3VeKANtNFiPvi7In2uSTx3S8LLrErRh/hZ7jQgAfHfM+YtEREtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2v71Kjr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso19113915e9.1;
        Sun, 24 Aug 2025 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035275; x=1756640075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qBKoTaVCO++BPStbErBm/tCDRfQKKXA8YQ+sxntbw8=;
        b=G2v71Kjr9DpCTV+mWq7qlKteFu7u5/gOAcnVHbFU7J0b0d69bEDQPB1XiNCYv8YVAM
         0+hJunFFB+ZpmubxTFR/KAiAaP3MCRjBZGZ9AN2v1mzixN4LRQnZbbmvNlEjoqxYRn+C
         wR7T8y9fcbhD+ggnzCqpfYmYg5RjPMUiB7Bi5oIdzmILfFY4WDB6Il4MBp+9xpyFl/q0
         65K8EXfnY/ZA+GjtgEynXau/vf1ZJmXY9NiQl3KZQyL/QNGlcXX4tyqcc/51n7pYNYEq
         vBnyJ0mMyokLwmCzStZH3RkpnKn5AOFj5VFUlxGBF5wbZy4VdyCmbo2bf81O+Zl12+DC
         EC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035275; x=1756640075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qBKoTaVCO++BPStbErBm/tCDRfQKKXA8YQ+sxntbw8=;
        b=UUfXrljiDaGmb43NGAKYC5RSBIg60YoDLwC6KkjweLrH6Tm+Kd3bF2ZhZYSgIg1NAj
         8qLCM0p4+qtwCnsXv8fUcw0uKQ2BETwjDdcMuqYPwod9klOdMhDavDfW4e6lr0LlxJnx
         6+4owVzsWYIv8o0bfBJy8Saj8S0zbWUMWWkNKQUP326o0y2Y0sjhJONQZP3gCCtKvOq3
         MYdlo5DF357F1Ti6/+AB6HMVHQoPwdepwYeCcH+ZhKneqs2+iV9wXM1KxwVxWGteRjlA
         JITuq/Z4RB1M1c5PbP0Jrgnr1Fkhrkt3gRtr8Ub0c4+5ln7E0SCN+zlFbhiyhT30iEnJ
         A9DQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1IK11RmdLiNB3Xq/l6tJ5QiF2Ik2e7y0T0jg8zZBp1vQ8aZv4gMY6eNHqKGmIZAkoCCOhlSJ39c1CSlLm@vger.kernel.org, AJvYcCX1Kl6rnmdP08OAG16nCXhKjITIzFFLL+18ZN+Af68Jbp3YAv0bq8pMSVyC3SH7oC0NrQZHnBppgaU3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgn2QIZLGM2rTfaJ6CkfnAlbN7Xp0L9PdvBAZqZcXCnDrNjS8r
	goWS1hwosMZTlFsQDt1DvAVcIvff+CfjUbyu8r5tfGhmGhgPuDgdB2Du
X-Gm-Gg: ASbGncunzZCMFmTUPCYncsI5mS8RxtDCovcWPO186CEmldZb85BgOr9KJGE59a7S+el
	SRMbZasSOlQtfjOCA75UdPRmrQ+gHbnmd+zy3M+E5Jwg0ySHZ1yCjL6UhZJ0Gchc49Ok6fwqO1f
	soHLyCDvSxM3D0aKpsgGy/FxMVjxmLDLdERJddgghs/9aBYN2uyjG4MClJvtbqWa+EpeAY2k2d3
	mHEhXHdJ80bQu63CESGRQFTb5NK+91JYUyYmPpM4uOxKphXT5jkovzeJrDwW9+k7VyAmX4LKfii
	s0x4DU9FPfqDXUzQiuq47dkbfOMcNwF4gjYMpAoPgSuVtmK1MpzHOU2E2IPIVDtUk4XW2npZc4V
	jQIgW2tiu7bCdiOvCNVOjfcvt8Zh9ENfi29HriBbKvHHGU88UFffhw3w=
X-Google-Smtp-Source: AGHT+IGzJU1raJzm4fuF3QZJv3Ip9ef69juRGbQ4YYy3QaQlOSG18TNf7XWR639yjPYNOqYpAK7Teg==
X-Received: by 2002:a05:600c:8b6e:b0:45b:47e1:ef6c with SMTP id 5b1f17b1804b1-45b5c086835mr21265585e9.35.1756035275338;
        Sun, 24 Aug 2025 04:34:35 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:35 -0700 (PDT)
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
Subject: [PATCH v6 07/12] i2c: rtl9300: move setting SCL frequency to config_io
Date: Sun, 24 Aug 2025 11:33:43 +0000
Message-ID: <20250824113348.263475-8-jelonek.jonas@gmail.com>
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

Move the register operation to set the SCL frequency to the
rtl9300_i2c_config_io function instead of the rtl9300_i2c_config_xfer
function. This rather belongs there next to selecting the current SDA
output line.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
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


