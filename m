Return-Path: <linux-i2c+bounces-422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A57F5C4C
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 11:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64B4CB20FB8
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591DB225DA;
	Thu, 23 Nov 2023 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bayoDUzH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F53B1A8
	for <linux-i2c@vger.kernel.org>; Thu, 23 Nov 2023 02:30:37 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4084de32db5so4628005e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 23 Nov 2023 02:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700735436; x=1701340236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDvQiw4cemCoVq0HDRpi4PQAGFKid5h4mEpxV2nsTWE=;
        b=bayoDUzHcPEGup2iGzwEYZIBD2pc+esFdlbzb3OKbGUdjFFEdf8gY0Rk5E0cbkRNDw
         J8Bjy6Ek92rsYl7mWYXft7Sx2iCENinlfK7yAGMVTPxvzLGeMf+Vnjg6XXFNCH1gtYJj
         yLsA0H5e87mxkzvD4Y/Ypea+7pH3bBJ/hKDdNZmlx9lCkzoZSuh9BZ84QIe8uI7etmAp
         aVv833+FmlpR71Tp/5JPZ+Ju6dHDMC/BxlIvBmuXsS7jHmybWBe6xvYPfm+vSQ+c6v+a
         xr8Of/GyTT220axJwGV43i86G/X4W4PmfHbKgt4VE3B81FnvbU+NbdaCWSY83759Erhb
         TM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700735436; x=1701340236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDvQiw4cemCoVq0HDRpi4PQAGFKid5h4mEpxV2nsTWE=;
        b=bQfWTV5Cb/OyQ5dvefCcTPuLeTmdbIVsTjklN2ZVLON5YM9RT8dQR5nWu3kA8tW9XM
         4NpP2+UpgPZWlavD7URLgDtKlwBjgaD4cBckDTFBzPGMYMp4LAZU+q+0owbUyhA42EbV
         ckvvyhui5W+dELnLkguq3Xq4gxKmT/nEXuY4ibUBf9fdN99fbzXn4WX7d03zVL4Un0x+
         7vRk0CEq9W5qXxEC40+TgHupQo12plEjPDWZeEqfU5A0ySDOL8CNv0bfgBlq8UdUMi4i
         P9gowVu1IbLmuYDsRqwEeFNK0W4dfB1tr3f6gozrq02hCRbnHBVahL3PAeWv5bybJZZf
         k9IA==
X-Gm-Message-State: AOJu0YyBm2t8OqfxJavJNwtQXCGVYunbxUMRJhWMFtOk7xgM1vmmsx7L
	xX/vGNheGh97VN6GKOnrRbRfEw==
X-Google-Smtp-Source: AGHT+IHU7fDCbDaC4fsuwrpKT4bl5Qi/bZUq9jazliF+vOB4RrDB8zsSzqbs9eH1GvvGjjdhMLY2Cw==
X-Received: by 2002:a05:600c:4ed2:b0:40b:35f2:3b42 with SMTP id g18-20020a05600c4ed200b0040b35f23b42mr1022638wmq.22.1700735434977;
        Thu, 23 Nov 2023 02:30:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:9abb:eb66:c3a9:102e])
        by smtp.gmail.com with ESMTPSA id f12-20020a5d664c000000b003316be2df7fsm1257834wrw.17.2023.11.23.02.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 02:30:34 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Wolfram Sang <wsa@the-dreams.de>,
	Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] eeprom: at24: use of_match_ptr()
Date: Thu, 23 Nov 2023 11:30:32 +0100
Message-Id: <20231123103032.11396-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver does not depend on CONFIG_OF so using of_match_ptr() makes
sense to reduce the size a bit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- use __maybe_unused to avoid warnings about at24_of_match not being used

 drivers/misc/eeprom/at24.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index f61a80597a22..8279adade07e 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nvmem-provider.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -242,7 +243,7 @@ static const struct i2c_device_id at24_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, at24_ids);
 
-static const struct of_device_id at24_of_match[] = {
+static const struct of_device_id __maybe_unused at24_of_match[] = {
 	{ .compatible = "atmel,24c00",		.data = &at24_data_24c00 },
 	{ .compatible = "atmel,24c01",		.data = &at24_data_24c01 },
 	{ .compatible = "atmel,24cs01",		.data = &at24_data_24cs01 },
@@ -812,7 +813,7 @@ static struct i2c_driver at24_driver = {
 	.driver = {
 		.name = "at24",
 		.pm = &at24_pm_ops,
-		.of_match_table = at24_of_match,
+		.of_match_table = of_match_ptr(at24_of_match),
 		.acpi_match_table = ACPI_PTR(at24_acpi_ids),
 	},
 	.probe = at24_probe,
-- 
2.40.1


