Return-Path: <linux-i2c+bounces-384-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3CF7F4BC5
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 16:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EC2FB20C55
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 15:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961B64F214;
	Wed, 22 Nov 2023 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sKg//tqh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5724109
	for <linux-i2c@vger.kernel.org>; Wed, 22 Nov 2023 07:59:35 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332c46d5988so2550096f8f.1
        for <linux-i2c@vger.kernel.org>; Wed, 22 Nov 2023 07:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700668774; x=1701273574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wkJWpPzXVPRgDS/WddlejSs7PCXn5mUATF2Jmfj7mc=;
        b=sKg//tqh1z9aGk7XKkuZC03JnUdIOOwA4hKRj5RNEIokZ83SxsUQRJ+M9nvkclyR4C
         bFMVMv2wDMQxRClMaS/02ipTiZpaQZ8jZy+tMCvg4Y8611bbB06QJjBY1hHOF2/YVqUg
         tjxI11yJnYYA2LWCeRAR+mN/NerpVCM4ittVvLcXms34QE532XL38EDLk75JziGHYK1j
         dobBgTTeNkEb8k+QRfthGTVlEp8tk7leR8THw00Py6UpSApbBvHMBFKuJOXF3nd5PBwJ
         zMSwK3TSsOvN2kHPlveuZ12lwhO56hMDmzJt8G0+la5ZiK5wZd7kMzolhRwtCxjurlaX
         Lrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700668774; x=1701273574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wkJWpPzXVPRgDS/WddlejSs7PCXn5mUATF2Jmfj7mc=;
        b=Bz+gjgdAb4ze2nrvZ9iBcYnX4x+L22RoFZIKSB7gCs+Ihcl95JlkZKnpbNpifHz/qK
         ZoNKO5zOjg31whzf+CqGplO27IL+IcIUBHRiQDBfLJbq4IqAODY45VgWvL9xcsnz9YEg
         PPHVPp5CRpegDDmZYXjKkoe33owfjCt9iLdhXQUdEsuBl0Kjsu6ThFs5lJlzbWnF9ScF
         7TemBaCXeo1g7DCVpElF6MK10AjwTxTC0mVCcNVAcqJTTeI6atafsZoFKmjX43ho7Cln
         s32oNJ/4SfVWrSE0325eQlLAGSdcvaYBU6Anvl1LcMaq3PBvMFgXerSf466udqvhP3Rf
         LwTg==
X-Gm-Message-State: AOJu0YzucTVstXG5HH6MgqLzZE2IiaYvQEH8vOb3X6N2T/c/AkDeluln
	sbMCal0vK29C0EtLE2QbUKcrEPrrSFwpKkOoCik=
X-Google-Smtp-Source: AGHT+IEfa2urc0vHXWsGVTyp1rNTre0crbZVtzuV+wVShCjSUhwjtJ8mLf33LNBqi7aCq+6Vowt6LA==
X-Received: by 2002:a5d:59a2:0:b0:32d:a495:a9b7 with SMTP id p2-20020a5d59a2000000b0032da495a9b7mr1710247wrr.61.1700668774009;
        Wed, 22 Nov 2023 07:59:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bc76:bea6:6d96:7507])
        by smtp.gmail.com with ESMTPSA id t16-20020a05600c199000b0040b1a3c83b6sm2644279wmq.40.2023.11.22.07.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 07:59:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] eeprom: at24: use of_match_ptr()
Date: Wed, 22 Nov 2023 16:59:16 +0100
Message-Id: <20231122155916.38037-1-brgl@bgdev.pl>
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
 drivers/misc/eeprom/at24.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index f61a80597a22..76a0b9b2fcc4 100644
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


