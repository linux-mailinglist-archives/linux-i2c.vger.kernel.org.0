Return-Path: <linux-i2c+bounces-3948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC4902449
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A3141F25B87
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 14:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B84013E881;
	Mon, 10 Jun 2024 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWAbXAUw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622B5136E23;
	Mon, 10 Jun 2024 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718030476; cv=none; b=WFlkFGQvm7EiRDV0dzKJ/ONwY8XnlIaodNEy7zhHQvRtabtKr9jdrNXDDqvcMQaBtZ/iOb24lNshPUG4n4vWFJ/nYjYIU+sPoDLlZkDUX+9vV7eIRn1i4sQuGSEpjNoqb3pIDXLdRbZKO6p8k0JmNJLZJ8tGXiArnSGAxDaKzhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718030476; c=relaxed/simple;
	bh=pNPGcLWrzfEk2//0QY8jfo45JRYZJyr8R8GsKD107Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DNCumdnKutd6rloFsFnB18fcX3BX+vc0qHrm1+V4tQJS//MMHFpHe9I+rKKyGC0ErooDW2xgDmPEPQApo+j1CH3FmDWGSqoTSU4HMUg2TcY82E/YFMfcr6a+nm3ROUDIeHS5ritSH3Vw5Bcze12R3ohALaX4oO1tQONZ7uLEO9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWAbXAUw; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-704313fa830so1087704b3a.3;
        Mon, 10 Jun 2024 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718030474; x=1718635274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtmJnksmoCsc2IBlomAMwsiJXhl0n2lw9y2HgeNnN3c=;
        b=TWAbXAUwh9sr2PsjLf/IEaO0d4S2rvqwcUhAAC4hnvGqILUXae/MPQf6ivVxcCUNmf
         t/jZfMgPm5U8h+XslCB2MTVJsdmg+lUfQz2R917OpAcGCfyXZw8jffyjlBBf48KP131h
         HWtJW3TV1MERSlWQS2FyxM2RmNIJXDudg5vxejAyU+MnzVmIsNbKcZaxTabSZuDQRvHB
         1ml1/I7OE/cE9soHYpd6zPA+XuPKASVCJ5w9qr2S9t7whgyYZ871B2lKyd5VFO5Krq7K
         vWtrzNNq682ceCVxkzH9R6RPlduyXBUw0AeAXa1fS9uSLrUwnCGAQQMJ0J841zK9E3ow
         01dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030474; x=1718635274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtmJnksmoCsc2IBlomAMwsiJXhl0n2lw9y2HgeNnN3c=;
        b=ixbw8dq+21Z2kfoVFVLfQaIKeRN11+7X9K9VAyZG5Np4UzNngokB9QwAl5/4n/lUui
         E2eA4XCrpKnRMBMdsht7jwjlQ26HgdpB7xzX6bnZEXOmaTvkBhWq/PjIqHjqnREAO6gg
         6Qrxo5/kGCIb8KuvIrCJvQPMNOE1M9Hq3CAoA9Cjo6A/8Yzu32sM9vJDqB//KpYVFljJ
         +LmgMFULPPphUgn10GLQT/xhowHbyrYg9Q+fTRL4hat8GtyL6gY4DlxAc8Zvrq0DuG4+
         0wY8Jiz5NsTKLF55CTF5NJF1WiT85aShLQu0gAa1BeuK349jMs38buCHKB+tdH3NQhAc
         jUJg==
X-Forwarded-Encrypted: i=1; AJvYcCU+IAw5PfJIy9Dzd6kvOBMRqcyDG1lD4oRpUNoO0ODSdggoe9Tqn7s6H/SNHH+708WHEL9vywv7GjpUOT+njM+NpB3qS/On9+uPQnaOTVwv22oJ6nKEPqgB71rhwXlTcOADUFYRJHzl0g==
X-Gm-Message-State: AOJu0YwnqxxNwDtl9FYdp2GZQzEW/IHSD0wMMEFNWrWgoRnCvOzUpkZm
	JIBGBPdQJQCIuqpMjbkRxHdTYAPIPEEnQ3dGjlUeTNhL0998MvlNMjp1+g==
X-Google-Smtp-Source: AGHT+IEMN6LJ09VCFt9Do1cTmBEsRrCZL8Jp4MBZ1jlvUb81j6fRu2O297bvB51M9ADgvo0NthzAjw==
X-Received: by 2002:a05:6a20:a114:b0:1af:59b9:e3ed with SMTP id adf61e73a8af0-1b2f96de772mr10918230637.5.1718030474101;
        Mon, 10 Jun 2024 07:41:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f728492b13sm71685ad.130.2024.06.10.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:41:13 -0700 (PDT)
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
Subject: [PATCH v5 3/6] hwmon: (spd5118) Add suspend/resume support
Date: Mon, 10 Jun 2024 07:41:00 -0700
Message-Id: <20240610144103.1970359-4-linux@roeck-us.net>
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

Add suspend/resume support to ensure that limit and configuration
registers are updated and synchronized after a suspend/resume cycle.

Cc: Armin Wolf <W_Armin@gmx.de>
Cc: Stephen Horvath <s.horvath@outlook.com.au>
Tested-by: Stephen Horvath <s.horvath@outlook.com.au>
Tested-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v5: Added Tested-by: tags

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


