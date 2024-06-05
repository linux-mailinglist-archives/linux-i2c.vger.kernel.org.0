Return-Path: <linux-i2c+bounces-3802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D68F8FC1A6
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 04:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0AFE1C227E9
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 02:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165EA61FD4;
	Wed,  5 Jun 2024 02:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+q5WxJl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0516F2744E;
	Wed,  5 Jun 2024 02:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717553958; cv=none; b=kiPiB1c7oci+dwS3ysePw1FbjY/gxcIjOTzgx5tqLa+VnQFKo9XR0/s8wzaP6xJdKoxBGHkh4MFjg4CZ5efK0mhHqVZD0VSbUCWxGh3JyX2osl5GFvaCmUlhJpJCiOHs2izoMoRe8PIfW1/JAaNX/Iaqbt5WxObuQ+tOEkqAjjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717553958; c=relaxed/simple;
	bh=MN5QUhpveLtR3vzOpslL0uzm+4RYwh54UdoJyZVPeus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mWJ+FcNupQGf43VOd8Q1sQ9F/gHL/ShgJRhvMD3WX6Fk17FbD0GGwkR+2Lkut9kUrqgkhNMBy2K24m/rv2+tmDbJJnRQHKiSG05vbxzw4mAWE1UeEjMxK8Ist+idyBxQyLgdW93P3k3u7USgnF0tKgGoHpz+uMhSDBnbwfOINCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+q5WxJl; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-24c0dbd2866so2816730fac.0;
        Tue, 04 Jun 2024 19:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717553955; x=1718158755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yH7bfOUTp5Qehb6cDSUFa9U/OcV22YcwBdkqqYDC6kU=;
        b=Z+q5WxJlbUwJmZJQu0guOdTkurXNX0fish8ULU+AlQQFsCzj5Flt6vYgzFqTfsrTQ7
         pAGscVP8KNnTKZOARs/fhzdZlYhbqzXzlH3ABvNbc73qV84iki93CQEZy8knWGBBzut/
         R0BAjEhPG1yWlRF7M9H8HNtIM20Kp3eapwRZ/4+10fVhJ9GOXHRO9LdlBOm8fdR7+r6Y
         Ez+eNvBWZb7fCcmwQxHv3VKFrG/2o67evPqU7bgI27OqKZgqm7bUNQS/49sbNMbYIF5y
         2Ks0ytEgcoony9i4Y3+WAtT6r+goukgGdaq5IYnpNPawa483dBpal/+fdE12zji0awuF
         RuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717553955; x=1718158755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yH7bfOUTp5Qehb6cDSUFa9U/OcV22YcwBdkqqYDC6kU=;
        b=MfrrFzhc8cr6t0KAA46OLJEeqpw/Xajt2UPh+eyJ9sScOqLmLF7ojb+V360wZ6VCIm
         DgmqjVbtcpqK1w4/V+SApOg0fG/G7rQtCrNC0Nx8SUbbrjdfMagZJjYxAQ89RzMd/IG2
         W+jKIVmzqbklhXfkg2d9TFTJZterZ6RqQwx/NLrkIXooEV7bCkrf2sOFKM2rGEjpWeMG
         ML+YulCDZncu1vsuH+bH0wE1WBstwy8ApnuH/uyS0zYlQCMx4rO7g8MnaK/Q4DX1lYJs
         1NuQKeONfxkEuBxRpb3pA7iqn2E8F/uR/VbzxnpMtL5Svv/0jMvCval5urfYeOzcP9p6
         emyw==
X-Forwarded-Encrypted: i=1; AJvYcCWuNfWM8V68dE0R4rJnOEAQXuFC8TmsnwpN73v1HDb6kI/XYBBraQhnDdxVRqs5qhIFxdOzEnR++08HDSHMg7zGj3dsrsdRtxGSNNosDTGWdeetOJGTm+I/cnWrtFMEuZfxmDXAgZJz3A==
X-Gm-Message-State: AOJu0YyhLcmnaQR7T3vcXfhJekAuQxf4SbfCva+ANfABwMzTXuuOTrzk
	VmuqbfQk6IG60V5nszmxY24DUz51YrsjHXwzsH08nubKbgkYQhvSJq96JQ==
X-Google-Smtp-Source: AGHT+IFQd51VLz90gjLy96kC0m145tkni8e7Yv5/EHoJYHDwUGJmrO9SydWBlbsdmzi73PVDj9GySQ==
X-Received: by 2002:a05:6870:96a4:b0:24c:63b2:8a18 with SMTP id 586e51a60fabf-25121c7e095mr1577477fac.7.1717553955365;
        Tue, 04 Jun 2024 19:19:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702544e2e52sm5900559b3a.74.2024.06.04.19.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 19:19:14 -0700 (PDT)
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
Subject: [PATCH v4a 6/6] hwmon: (spd5118) Add configuration option for auto-detection
Date: Tue,  4 Jun 2024 19:19:07 -0700
Message-Id: <20240605021907.4125716-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240604040237.1064024-7-linux@roeck-us.net>
References: <20240604040237.1064024-7-linux@roeck-us.net>
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
Sent as v4a to avoid resending the entire series.

v4a:
    Do not auto-select SENSORS_SPD5118_DETECT if DMI is disabled
    Modify help text of SENSORS_SPD5118_DETECT
    Default SENSORS_SPD5118_DETECT to y if (!DMI || !X86)
     
v4: New patch

 drivers/hwmon/Kconfig   | 19 +++++++++++++++++++
 drivers/hwmon/spd5118.c |  4 +++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 7a84e7637b51..d5eced417fc3 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2193,6 +2193,25 @@ config SENSORS_SPD5118
 	  This driver can also be built as a module. If so, the module
 	  will be called spd5118.
 
+config SENSORS_SPD5118_DETECT
+	bool "Enable detect function"
+	depends on SENSORS_SPD5118
+	default (!DMI || !X86)
+	help
+	  If enabled, the driver auto-detects if a chip in the SPD address
+	  range is compliant to the SPD51888 standard and auto-instantiates
+	  if that is the case. If disabled, SPD5118 compliant devices have
+	  to be instantiated by other means. On X86 systems with DMI support
+	  this will typically be done from DMI DDR detection code in the
+	  I2C SMBus subsystem. Devicetree based systems will instantiate
+	  attached devices if the DIMMs are listed in the devicetree file.
+
+	  Disabling the detect function will speed up boot time and reduce
+	  the risk of mis-detecting SPD5118 compliant devices. However, it
+	  may result in missed DIMMs under some circumstances.
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


