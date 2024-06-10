Return-Path: <linux-i2c+bounces-3952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A35D0902467
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED16AB2833C
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 14:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D705143737;
	Mon, 10 Jun 2024 14:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YG6FDjzJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A587614263B;
	Mon, 10 Jun 2024 14:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718030482; cv=none; b=ENDDC78mOwTMgheXOd0R95QBKfSaCzf2GepRycBPw6KxVm/YsOxPGT+DJS0F1u22h7+FW11fZJMuSaqJuRmhv+mYwJr341OLYgMwvqFM+OpY9QW+f2BmzR2ukwQjecyBaDxIpbYwD248HbWCE3Txz/FzNL+6HOUH5I+8BJbpxkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718030482; c=relaxed/simple;
	bh=eqaMSv5Aa4/kBy5g0iKnICdAo6+fypqw8AFbKQnuxkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a7HNfKF780ENGb8952PGtSGE++x2FCR8pNIM9wn4paeNLmaymY6yiV9IQSZeM7213c8oS63/avpPy66HfO1GFaYCNASlpxqzTq65a+aUoE2vCO4ArnDTlaNrwNT5CoQS/Q4/nhbbeIF9zLjM8jG3MA7ZsV6bogGveWc9xAfB1Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YG6FDjzJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7023b6d810bso3545051b3a.3;
        Mon, 10 Jun 2024 07:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718030479; x=1718635279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKkziaSKSr/muOq1HRAFyB+WD5eSBI8YIdJmSO2EbMk=;
        b=YG6FDjzJsOxT2GbicoQBxzx2W+NiI0ywx6nSe7kX5n6OB9CS81eDIq3GOioYuipo/C
         ga2uG8Kn3HWw2ZuIIyzuNFLfYZpLxdOaHh648iL5BWfWsnRrL2IqT8QGXHRA1PYnp4hs
         Dv6P6TmLybgCfaxJGO/46ZuA1SuFqAAEniPvhJCKrhvPrBb+SLHSzVQ0LYFnBWvJ1vmN
         X5Zz/yQvi9XmElOuDo6GgWzmr9UBkEdaOvvNQtOrGqVaUIpNQU9cpMOxS1JAeAZiWuKs
         Y4NsBfwKD+tJGqGMfBUOHSzaXNxPvb6fWKhVYiHysIZ8UtT8kuHXMzJ4rfKf6da/iAOq
         XomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030479; x=1718635279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKkziaSKSr/muOq1HRAFyB+WD5eSBI8YIdJmSO2EbMk=;
        b=iRaL39HMk1CgysRHT0IuOCq89yEnAGGhbIuJwLU/lpE/g6H6sZw15eW0666olJfLdO
         6GgrqqqV2DFs5ViJlfrGMwLn29/bQCnmN3DDUEWP65qgpqg4mv7mKSAyEorlDdtHW3JZ
         Rs3cwLPl4ysB/7FfWYB97vTUnNMI4b8niqE0CFP5wUiBmfVDsaE4tcS+yBmdJibCKDNW
         DQI21lU7jGM/pgxMfPCKwFaWiOGTUy1F5Q7/uwjzSWtQMO2sMI+ytpaCJbXx9lyht803
         tBTnE1LQvi0D5eESHGaTUyfQP29NSy229m84MWCx+eu/oQOUYoRGxT6PVcZHKyzmCIC2
         pvPw==
X-Forwarded-Encrypted: i=1; AJvYcCV8FIgx6OQFwtRZK0Ztcs+yXOfjY8M8H8eJd97RHsBcNfBuAM++Xk9+e3DI5soPYRWe/vdv8he2PzeubDKdFkboKXf8BSc47XbuFWbZZosSzsf+5Qe++SM87I6VNcXweR4ihRNRwtkVDg==
X-Gm-Message-State: AOJu0YwY9iUOgyWrjC4jAujCMi/oZKMnYaR2i/IB3BlCc3GtjtPVOXXg
	gThudZv75m3ogyGvnkHm8R8SLvVD/DgAUaAEy+GyDcBoQjLPa+GuY79ndg==
X-Google-Smtp-Source: AGHT+IEGygyaEEzNJcvfGUiBscSz6qRFlJq4IfwsDQFQ9QBMcu4Vuk/Vz3+vZUX2LI4nK8RxdU3dFQ==
X-Received: by 2002:a05:6a00:4790:b0:704:13d0:a7cb with SMTP id d2e1a72fcca58-70413d0aeccmr6270995b3a.13.1718030479556;
        Mon, 10 Jun 2024 07:41:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705382784b9sm2146318b3a.48.2024.06.10.07.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:41:18 -0700 (PDT)
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
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v5 6/6] hwmon: (spd5118) Add configuration option for auto-detection
Date: Mon, 10 Jun 2024 07:41:03 -0700
Message-Id: <20240610144103.1970359-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610144103.1970359-1-linux@roeck-us.net>
References: <20240610144103.1970359-1-linux@roeck-us.net>
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
Tested-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v5: Added Tested-by: tag
    Replaced #ifdef with IS_ENABLED() and included address_list in
    conditional code

v4a:
    Do not auto-select SENSORS_SPD5118_DETECT if DMI is disabled
    Modify help text of SENSORS_SPD5118_DETECT
    Default SENSORS_SPD5118_DETECT to y if (!DMI || !X86)

v4: New patch

 drivers/hwmon/Kconfig   | 19 +++++++++++++++++++
 drivers/hwmon/spd5118.c |  4 ++--
 2 files changed, 21 insertions(+), 2 deletions(-)

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
index de6cf07f3007..ac94a6779360 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -646,8 +646,8 @@ static struct i2c_driver spd5118_driver = {
 	},
 	.probe		= spd5118_probe,
 	.id_table	= spd5118_id,
-	.detect		= spd5118_detect,
-	.address_list	= normal_i2c,
+	.detect		= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? spd5118_detect : NULL,
+	.address_list	= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2c : NULL,
 };
 
 module_i2c_driver(spd5118_driver);
-- 
2.39.2


