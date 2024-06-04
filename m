Return-Path: <linux-i2c+bounces-3769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E38FA8FA
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 06:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9E5F1C2163E
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 04:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740C313E889;
	Tue,  4 Jun 2024 04:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Onqe1qwR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C768013DDD3;
	Tue,  4 Jun 2024 04:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717473769; cv=none; b=AVd5X3Pf271gnwDbGyd3qr+aIb5+kDg7Mhk+7OAj/shvHSH7spBOspu+05spU0BDuVIP+l+yWR4+te9BIicVlX9QQFzSdLs8eaNQkzocOn03bsbFYSo4kUShKwFNAUOJrV9MOQyGU0j9ku6roYXYH3E9XGBlpfP9KyFzs0T6GZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717473769; c=relaxed/simple;
	bh=V8YqFjawKbUrBOq4baAmrgBYHnDBLhv2jyzwuHG1gIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cVARzjeHQnfWYvyRJFLQZLUbAqQqwZaTzP8Dp8TA3aWTf8/NOZKniNU4/ExGbYQibv6o9QA9MrhING4VFBKfg2+0l/XG8YVTY7FtDgFP4ZZsYrfNffokSw5P3QuaN4FlWPgBdvf/2yYfcDsTeLNluNwR12Tl177seq1Dkh0eYAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Onqe1qwR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f44b42e9a6so39639455ad.0;
        Mon, 03 Jun 2024 21:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717473766; x=1718078566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t13d/37yYLpd8gTozdpfnVDeQInDCWPBLhUp/jXPfrE=;
        b=Onqe1qwRD3iPhaX+YoBeDY/1ArAU9zg5YUkJtZ0L2L8M1qrwl/IpSKcoEAlcmSZGR0
         09AM0uLtqmxnd4aEyvZpsqO1U8s1XiPCxgrdKmV8cbjv+g9UUXuIncY1CCB+fnLxJ4hE
         cIKdh/wQAaz+3nU16V24+zhzIx1jO5yELeaaM9ZZ/rKjGwLvXJIevcPJei4SU2YdeLaQ
         GlOpKCIe7axFF6WFNT2soAkkMD71QehKRyMz0Jx+ns/44QqJ16xEEcqMvZ4RlDwRSBbo
         gb3nKsxloeRyrtMiuWgsoTuSijovze5wJDsTZVzMLvT2rI3ib2Q3C9lAWjCvpb66wwPP
         0enA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717473766; x=1718078566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t13d/37yYLpd8gTozdpfnVDeQInDCWPBLhUp/jXPfrE=;
        b=RBEvSleHe+HfF4r9H1Xcj8g3p3Vi+N5yFwh8qnVANQDPWSFbZVnFYmNz06vv420Ksp
         DdhlrGz2h+dnUupOTIKCoYTQyfkcn2Gmf46pW8xJGT1RMu8p8ulpwnphTwse8SER5NX5
         2TcwWVmzHjaEX/MG+zjvHobxrXQUEmzr5l11WAmcT55OeJP/E5Z5rS8fmiesW/w6mmrh
         aKaYR/EiQ4t6iBOldQ7jatKRptc6zlinWlNzkRtZM2LISwI8v5qgiJ7Dfj3q7jgTs4my
         l0fGEep/MF9mnmnY+z/vqlQyFQLRT5KvZy7sB3A1JDjW02MFlIkNUa0wT2G/IivTRQRr
         fu3g==
X-Forwarded-Encrypted: i=1; AJvYcCUNNr/9NGLM+ePqispAp2jbLABevIkxky6l1DTQEIgk8FC4doYa6pw+ww1Qx6RWbf81KLVl9RK0FZevlb4L8ESut2DueP0/9YihWkxS05kVFJKzdiXOTCSdgNzBZt1Umro7I221exCPXQ==
X-Gm-Message-State: AOJu0Yy5kXHS9Q0JZE+Q9/ixg6mUQZtKMVDzDwx5xe55MeaF8nOSQfZE
	s1u3Sxj+T1jDT99yzHhyGVqEVb7+0fvpg3OadbVz/iz53vzjg2dJWOS+uw==
X-Google-Smtp-Source: AGHT+IF1hdqYeqLyLbwfTnRe15l+NuXJQpaZLkf/GTm5plisu7XX5SDf1qSmWuwylrc7W8qJnsd9Vw==
X-Received: by 2002:a17:902:d2c4:b0:1f6:86c8:768b with SMTP id d9443c01a7336-1f686c87a56mr29751165ad.50.1717473766241;
        Mon, 03 Jun 2024 21:02:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63235e06asm72615195ad.81.2024.06.03.21.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 21:02:45 -0700 (PDT)
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
Subject: [PATCH v4 3/6] hwmon: (spd5118) Add suspend/resume support
Date: Mon,  3 Jun 2024 21:02:34 -0700
Message-Id: <20240604040237.1064024-4-linux@roeck-us.net>
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

Add suspend/resume support to ensure that limit and configuration
registers are updated and synchronized after a suspend/resume cycle.

Cc: Armin Wolf <W_Armin@gmx.de>
Cc: Stephen Horvath <s.horvath@outlook.com.au>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v4: Fix bug seen if the enable attribute was never read prior
    to a suspend/resume cycle.

v3: No change

v2: New patch

 drivers/hwmon/spd5118.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index d3fc0ae17743..d55c073ff5fd 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -20,6 +20,7 @@
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/units.h>
 
@@ -432,6 +433,8 @@ static int spd5118_probe(struct i2c_client *client)
 	if (!spd5118_vendor_valid(bank, vendor))
 		return -ENODEV;
 
+	dev_set_drvdata(dev, regmap);
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "spd5118",
 							 regmap, &spd5118_chip_info,
 							 NULL);
@@ -449,6 +452,41 @@ static int spd5118_probe(struct i2c_client *client)
 	return 0;
 }
 
+static int spd5118_suspend(struct device *dev)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	u32 regval;
+	int err;
+
+	/*
+	 * Make sure the configuration register in the regmap cache is current
+	 * before bypassing it.
+	 */
+	err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
+	if (err < 0)
+		return err;
+
+	regcache_cache_bypass(regmap, true);
+	regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
+			   SPD5118_TS_DISABLE);
+	regcache_cache_bypass(regmap, false);
+
+	regcache_cache_only(regmap, true);
+	regcache_mark_dirty(regmap);
+
+	return 0;
+}
+
+static int spd5118_resume(struct device *dev)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+
+	regcache_cache_only(regmap, false);
+	return regcache_sync(regmap);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
+
 static const struct i2c_device_id spd5118_id[] = {
 	{ "spd5118", 0 },
 	{ }
@@ -466,6 +504,7 @@ static struct i2c_driver spd5118_driver = {
 	.driver = {
 		.name	= "spd5118",
 		.of_match_table = spd5118_of_ids,
+		.pm = pm_sleep_ptr(&spd5118_pm_ops),
 	},
 	.probe		= spd5118_probe,
 	.id_table	= spd5118_id,
-- 
2.39.2


