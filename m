Return-Path: <linux-i2c+bounces-13235-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2966BA5D73
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7848B3AD210
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E292DCF47;
	Sat, 27 Sep 2025 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTG+P9bp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175BB2DC34B
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758968399; cv=none; b=HvpR2iLfZ4SwHoxqQv8VubWPJKCdOzwietflUPuiuFl420tl/Mo3j8cAcqZ9zCNtQ8q3SAit0w+Haw7bNJdzUqq9jzlLGFXIp+BmFft7QVVStKHgUfgETUB6zudj7lCvFQFI02+foLSwXqc109iY+wAyuYMeoPGnlmv0JqugWy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758968399; c=relaxed/simple;
	bh=AFqIY5K8sOwwkDorLtwVJ59nbbKz5t+8UF9iXhMSMFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNpHRdDs4c/uxCKGnjVXoUdVeQwR6wxGhwxVpsqL8i418+gtsOpyPWpBO6Qg8vOcMEnbvDhZImWrF+Uz2lm42WDzuHDfzlH7mb/lp0nWYl5xjc5g9ATKX/y9aip0qh014m12n43sis5w2jxQ7PQ1NM9+XtCDOYftjhIcijm5OI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTG+P9bp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so30478555e9.3
        for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758968395; x=1759573195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o66Q1Lw8zZ/26/utPV4SsAzNqR677/9mko2KdXqHbnM=;
        b=mTG+P9bpf5rmJhoKUVsAzK+FljAR2t17kLkLREn4VD3jmO3B8y+JkF7q9H3VhAbHWW
         Jtvdphv9dxlTTHJeZq4x/sWVbPHgoZ4u44OG6pdiMxtEG20pt5EX/JU6fqR11PkO0bNE
         H5PvsIz4nOSxVSzfRwPUn3XkE1wLGmUGZMwKImv4RHWsRzMUD0bcyM9EzBLhYmUH7QN7
         KhLaBD42PPs0+Fw4PUK5ONgFxIalw3WBfpaTRj+jFqVEIu05x4M7hmgOSbRfjCNOyqQx
         OWOrY90ZdsLwGu5fC1HZWU6sSymsrZywAUy3fhOBclBgJx1R2TIlJ3sECA41rTst1QW/
         v0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758968395; x=1759573195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o66Q1Lw8zZ/26/utPV4SsAzNqR677/9mko2KdXqHbnM=;
        b=N/8wy6FnPxQOWkWFFNywpSfzLeOD2+GdOLfEv17+qCgEnrcoFWG6/Zt5KAp26rakkZ
         yn1BXSGqQ8OB89Cepgpbb7fyN37md8J+cbypYU8uGwF0CCk54za2vBf9WA14Ft40l9iC
         b3QzU/+dHXZNTbcNC3sNYnFs0hZxPglRK7vai6tFVafs8MWLranL5NxStLA81U4b7auP
         1ybYWs5UYWiOGkyy/H7aKT+Xlg4wbDoDTeXn8EHEDA5SnAOyKrxLadFnP7HBaEsZtsuV
         iSuM8aD795URgn5h/e7lJXh9L074jRGTiDXvKoSfhmhCpABuvxrQD8bfsvbGotPmLJig
         bYMQ==
X-Gm-Message-State: AOJu0YxlgVpnrs5RP0IH965xpU9S2o7J9HB0yERWVtDlsy5ddinfWxso
	IInt1/1LXbXSWpoSY7Vpkgxa65ZoZTFUapegbfrgZclUUHpxY+wGe4Db
X-Gm-Gg: ASbGncsAQh6fish24lpR+a9otxGlNMyA8UtHtigICIUfuDY46/YEnIBbf87Ukr6Yjb7
	sHhLebrVW5MEHszZyxOdzsVt2sh5gu9O0pCnD8doV8u1zzqaVj6F5O3IIYu5RJmX0Ens5aMZJpQ
	5AYr1X8QjDCKZ7ocjOHaGjiXtHupP69wL1X7Qneu/bVuDJFShDYk8SOVOst3HUOcQlnkU1yjAX2
	XC9VNcYrH3iuew4Z8YvJq4p2xf5DjipsNKVovFQ2ny4yHCvgAJO5Tc18nmvWWnHdeUnTr2tXPjV
	3wzCzfinJd3yzfNwEG8X3zDCsc14Kri/0cDGdoefAcnohyuzbzFIzdQN4gTLVi9hvGBH83K5OQt
	S2HYnOmITsb/+xf1f1e1qvD4/pw==
X-Google-Smtp-Source: AGHT+IHe0P30TIqJc5jzWG4ZW7xpsDOP1YRoCBAYFr8Rur6oa5IEqVG9QR5Dt70ub2sEreCWyQXVbA==
X-Received: by 2002:a05:600c:a00e:b0:46e:436c:2191 with SMTP id 5b1f17b1804b1-46e436c2314mr32525825e9.25.1758968395038;
        Sat, 27 Sep 2025 03:19:55 -0700 (PDT)
Received: from builder.. ([2001:9e8:f11a:4416:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32c31df7sm53416435e9.4.2025.09.27.03.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 03:19:54 -0700 (PDT)
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
Subject: [PATCH v8 4/9] i2c: rtl9300: move setting SCL frequency to config_io
Date: Sat, 27 Sep 2025 10:19:26 +0000
Message-ID: <20250927101931.71575-5-jelonek.jonas@gmail.com>
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


