Return-Path: <linux-i2c+bounces-3772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A808FA908
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 06:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A48F41F25596
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 04:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC83E1411CA;
	Tue,  4 Jun 2024 04:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Al4TeUtv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E30140378;
	Tue,  4 Jun 2024 04:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717473773; cv=none; b=rsj71yD3Xa2n7ejvkVzxRLCrV0mvDxreHiDp50tmOVshMO7D09s82z5BG+WO8gtJuOHqit43J2sv65k66m5pWN8aikfQhPblNtNrmJZqHnuXGqU0NPjptKM7RMAUeZXeapl9G69rAbltev7Tg/FT17fyREJjyYx0eVbQMRIo0D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717473773; c=relaxed/simple;
	bh=1dfvmehwDdEq07h8mkXsmnX+fXO2B5adsczXbeWlw/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MH06GwhBashLwWE6jfrUpYEktgrm81p1SSzsE6biRr6llj9Kq1IW/yfql3Jn4qWPSwLLTEjsq+1kbF6Xl95VMfzYWdNo6WemQ6mV9emAHQrpl+c9A0pZjhuWy4OXhj0gJE+YFXY4X2esXf0kapNZvOLdVm+6QESqRDW3U4kFEzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Al4TeUtv; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3670269a12.2;
        Mon, 03 Jun 2024 21:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717473771; x=1718078571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpadqb8vKvLH/+6eZrQoNDzpGd4fRnONNtxPtJWEc8k=;
        b=Al4TeUtvRrKeRoRANq9XwOCWoE4YJTN/wznRRyz3zXLblsKvBvE5gB0pYHuz9CvpRt
         BpGYchJn4u2RNFDXEzFM1znxWA088UqpG0Y2HjUCVCgn6W+lQ30fZq8HeZfFF4IeE3T1
         eXkrAuoS1TJlDXvWpLtw6DzHx7OQnl4s2vrOR/wWks2VNvvdDwyFqAMynNDs7nmrHf6B
         N6kb8I4pRDeMkrZERUnPcA3A6YWOqz+YfFWK0pWeJh6I49OWLljpBJ0V88wPgNz41GwJ
         Cz08lyzoXa70TvKziS5opVfOaXeP4zHfvQz70b3MY1ZD1O41T+Aw/tpZr40CLdcUciYr
         FEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717473771; x=1718078571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zpadqb8vKvLH/+6eZrQoNDzpGd4fRnONNtxPtJWEc8k=;
        b=al0MV5mFUPCp7cecLM9AAislRWowbtxLQn/Ves0cnb8M/7yq5LHPRJ1l5DlaO3roH0
         oFdNyOvIZVbco4e9uG/7et/Y/jYvmprkT9xG/1P30VIZ5D7L1JgAkQk2ZnMlLObFLDiK
         XDUzrnuK5+OKIXB1l6r0+Y9m4kPzd4urE68TYw8GlJUT8Qdm6054X+mmRMViKY6ALuLo
         Wlq1cUI9ROzN6bmpZzdrWiFxaitc26pzO2Qt/6syhNyOM4Eo9Lz6PF1d5RvEkItAx1TG
         S61MzAdm2cuFSwQm0blJkDL/gs3fKlwANlIoqYVhXk8JNpZLnNJmwp9Y5FgYDAg8wsP8
         2cSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBi4IUZzAKJ3Po9tTa0J7R1eNhiXMkQBo8ODNOEtmroOp4Vgm0p5oVgxwXNq2MTmBCzurLaHOnlscMg4BSwr2xW4prHeYG2dwrpoCt8aj3t26AWiMf0YagRyiXb+vmkFnTr1JBG6+LYg==
X-Gm-Message-State: AOJu0Yy/7Pvc0FWfC+Ho/xbMGg3eJ6sE2hipNF3r887cq16tvO0E9v5n
	WjMPq1W53793OxHrhhsoubKJqdD1n5IvdqcfbyTCxZUneWarp91I4L3Z1g==
X-Google-Smtp-Source: AGHT+IERuiu9dGp8oja+uPS6m6YH05W660ucJxhtgnyu8Xn2o0Y4J01fqUxkBCvgsOUmz2OqhOv1uQ==
X-Received: by 2002:a17:90a:ff0e:b0:2c1:ae24:fa19 with SMTP id 98e67ed59e1d1-2c1dc5ccdfemr8935070a91.39.1717473770817;
        Mon, 03 Jun 2024 21:02:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2559e6741sm360716a91.1.2024.06.03.21.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 21:02:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactcode.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Armin Wolf <W_Armin@gmx.de>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 6/6] hwmon: (spd5118) Add configuration option for auto-detection
Date: Mon,  3 Jun 2024 21:02:37 -0700
Message-Id: <20240604040237.1064024-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240604040237.1064024-1-linux@roeck-us.net>
References: <20240604040237.1064024-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With SPD5118 chip detection for the most part handled by the i2c-smbus
core using DMI information, the spd5118 driver no longer needs to
auto-detect spd5118 compliant chips.

Auto-detection by the driver is still needed on systems with no DMI support
or on systems with more than eight DIMMs and can not be removed entirely.
However, it affects boot time and introduces the risk of mis-identifying
chips. Add configuration option to be able to disable it on systems where
chip detection is handled outside the driver.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v4: New patch

 drivers/hwmon/Kconfig   | 18 ++++++++++++++++++
 drivers/hwmon/spd5118.c |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 7a84e7637b51..0bb1bdee3e43 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2185,6 +2185,7 @@ config SENSORS_SPD5118
 	tristate "SPD5118 Compliant Temperature Sensors"
 	depends on I2C
 	select REGMAP_I2C
+	select SENSORS_SPD5118_DETECT if !DMI
 	help
 	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
 	  compliant temperature sensors. Such sensors are found on DDR5 memory
@@ -2193,6 +2194,23 @@ config SENSORS_SPD5118
 	  This driver can also be built as a module. If so, the module
 	  will be called spd5118.
 
+config SENSORS_SPD5118_DETECT
+	bool "Enable detect function"
+	depends on SENSORS_SPD5118
+	default y
+	help
+	  If enabled, the driver auto-detects if a chip in the SPD address
+	  range is compliant to the SPD51888 standard and auto-instantiates
+	  if that is the case. If disabled, SPD5118 compliant devices have
+	  to be instantiated by other means. On systems with DMI support
+	  this will typically be done from DMI DDR detection code in the
+	  I2C SMBus subsystem.
+	  Disabling the detect function will speed up boot time and reduce
+	  the risk of mis-detecting SPD5118 compliant devices. In general
+	  it should only be enabled if necessary.
+
+	  If unsure, say Y.
+
 config SENSORS_TC74
 	tristate "Microchip TC74"
 	depends on I2C
diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 5cb5e52c0a38..19d203283a21 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -313,7 +313,7 @@ static bool spd5118_vendor_valid(u8 bank, u8 id)
 }
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
-static int spd5118_detect(struct i2c_client *client, struct i2c_board_info *info)
+static int __maybe_unused spd5118_detect(struct i2c_client *client, struct i2c_board_info *info)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	int regval;
@@ -647,7 +647,9 @@ static struct i2c_driver spd5118_driver = {
 	},
 	.probe		= spd5118_probe,
 	.id_table	= spd5118_id,
+#ifdef CONFIG_SENSORS_SPD5118_DETECT
 	.detect		= spd5118_detect,
+#endif
 	.address_list	= normal_i2c,
 };
 
-- 
2.39.2


