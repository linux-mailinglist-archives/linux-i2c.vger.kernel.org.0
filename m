Return-Path: <linux-i2c+bounces-5632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2095A5B1
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 22:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC17D1C2229A
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 20:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360AF166F24;
	Wed, 21 Aug 2024 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn2aKs1r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EFD1D12F4
	for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 20:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724271190; cv=none; b=VdtTC9LhalRQ7B8C2y7rZG2qz8R0SB2WPDAvhvFB1LuD8fF6QWm1K0s+PAcfGF6l+Tdm0RJQzd7sknx8ZslGf4Cq+eMiNMAf0k1oId2HrX1eZ/C98qHYydgOEULxVy+FCXWkvH+UVtCGGfqaY9obKhWLXv6G+upW7FGeZgB45gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724271190; c=relaxed/simple;
	bh=upSwuZY35CKczScw7voky5Osaewh5bIT/UA5zw5cb6w=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=J8/+6LH4nhiuha5LG0xUVvIxbwlyFKJ50vPCzDvTTfGo78qHJuXv5lAVGRJ2iSb1FtAv7zgWCVUl0JaDn6Z5Zp5GfVh5T78y3si3SJK8cQ2XluAufhHNtewiS2qcEyMR1uY0IwCIb67Bj60EwiSOFprftRSihzZCqGJ9ScfxMaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn2aKs1r; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86859e2fc0so4985866b.3
        for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 13:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724271186; x=1724875986; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB63zCFFvVSfRmh6pAJc1RHPGAx06hm27V5y3HW4LBU=;
        b=Xn2aKs1rFEUFiKTU1d2V6RpnlvVDRozQ8zCQbhwW6PWaeSSyxCAMX8GX3zDLb8yI6U
         ZpraGXM20iFTNXGg0EfxwmTbe/0Pb5dKg9qkHrIVQGR8hb0sTN23jMTbjdvDUmphw0ug
         wtY2uYlc1jHLZ1KGrHjY7e5FkjOtWzTErJOQdu3suMl53EV7l9wD7c8IYvnL6eBSIT57
         ENHUq1uyJbx9UTNFJYK6+7SHPkNtfVVOik3m85BvwjHovZVM5ZpslZ0+Zji766uDLmeX
         7e2VRCRCyWDqCotObDgAYPF1cfXXaPU0QTKkPkZgrf45KXlH0ZMCoXbAqqWrIGUm0mxj
         fw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724271186; x=1724875986;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qB63zCFFvVSfRmh6pAJc1RHPGAx06hm27V5y3HW4LBU=;
        b=BmqzYR0n9hjwmvZN0essBXGnfYMS0F5tXiO14IB+z33Rp62emU4ZurPZ9ERRq6oiPJ
         kFKAMVO+D156FUU5kbhHhOWDnduGkcVR6lzi6I6K6jvmB8S9hjw2NXDGaUw6WAJm706F
         Uzt/8V/YEOSzXC3FOTCoFQEt3FZUaHk878xLPaK2x/wCvORxcK02Q7vGImRvxqWUcke2
         10ptm+5JZGxRzGIFM2+8kEvJUlXJx3jb5je+nResHCLGt0CVai93K9y7ZZXkbcTDoEGf
         zedpxdo8Q0PttCwXUMAm2jEt4B+/8h+4bPffBjfgehdVHfbdpCwZDcd0YD8grjB6TTkS
         XGmg==
X-Forwarded-Encrypted: i=1; AJvYcCXCGinMmV+ZIKzEQEWyVAHLIls71IhNo5yFVwhr/feKivtkrLFvPBEGFVxGIwPkUrClj2dh+uN2fmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YynPutz75i5yuJD9+jC0oB6cVS6Xp/Xmmuht4NI4pd7ryN3ZsiI
	zbdlUh75ewtP1KwJrfnFHnaovcmGEREbb3Vwfu4ba4t/BlYQ9YzZwSy2Yw==
X-Google-Smtp-Source: AGHT+IEIgS8tLsjGAEgiP2r5m+eubhaSeTfCnucMVSJehR2n1w6amel56+0XlrAuF4ERQ7SymAd3OA==
X-Received: by 2002:a17:907:e2a0:b0:a7a:bc34:a4c9 with SMTP id a640c23a62f3a-a866fa8c66emr248543966b.69.1724271186144;
        Wed, 21 Aug 2024 13:13:06 -0700 (PDT)
Received: from ?IPV6:2a01:c22:76de:5100:1131:aa83:adfe:51dd? (dynamic-2a01-0c22-76de-5100-1131-aa83-adfe-51dd.c22.pool.telefonica.de. [2a01:c22:76de:5100:1131:aa83:adfe:51dd])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a868f2200fesm5991766b.2.2024.08.21.13.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 13:13:05 -0700 (PDT)
Message-ID: <80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com>
Date: Wed, 21 Aug 2024 22:13:04 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: Remove I2C_COMPAT config symbol and related code
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This code was added with 2bb5095affdb ("i2c: Provide compatibility links
for i2c adapters"). Commit message stated: Provide compatibility links
for [...] the time being. We will remove them after a long transition
period.
15 years should have been a long enough transition period.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/Kconfig         |  8 --------
 drivers/i2c/i2c-core-base.c | 31 -------------------------------
 2 files changed, 39 deletions(-)

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 44710267d..c232054fd 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -40,14 +40,6 @@ config I2C_BOARDINFO
 	bool
 	default y
 
-config I2C_COMPAT
-	bool "Enable compatibility bits for old user-space"
-	default y
-	help
-	  Say Y here if you intend to run lm-sensors 3.1.1 or older, or any
-	  other user-space package which expects i2c adapters to be class
-	  devices. If you don't know, say Y.
-
 config I2C_CHARDEV
 	tristate "I2C device interface"
 	help
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 6cf57e321..79292bb33 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1367,10 +1367,6 @@ struct i2c_adapter *i2c_verify_adapter(struct device *dev)
 }
 EXPORT_SYMBOL(i2c_verify_adapter);
 
-#ifdef CONFIG_I2C_COMPAT
-static struct class_compat *i2c_adapter_compat_class;
-#endif
-
 static void i2c_scan_static_board_info(struct i2c_adapter *adapter)
 {
 	struct i2c_devinfo	*devinfo;
@@ -1547,14 +1543,6 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 
 	dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
 
-#ifdef CONFIG_I2C_COMPAT
-	res = class_compat_create_link(i2c_adapter_compat_class, &adap->dev,
-				       adap->dev.parent);
-	if (res)
-		dev_warn(&adap->dev,
-			 "Failed to create compatibility class link\n");
-#endif
-
 	/* create pre-declared device nodes */
 	of_i2c_register_devices(adap);
 	i2c_acpi_install_space_handler(adap);
@@ -1761,11 +1749,6 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	device_for_each_child(&adap->dev, NULL, __unregister_client);
 	device_for_each_child(&adap->dev, NULL, __unregister_dummy);
 
-#ifdef CONFIG_I2C_COMPAT
-	class_compat_remove_link(i2c_adapter_compat_class, &adap->dev,
-				 adap->dev.parent);
-#endif
-
 	/* device name is gone after device_unregister */
 	dev_dbg(&adap->dev, "adapter [%s] unregistered\n", adap->name);
 
@@ -2074,13 +2057,6 @@ static int __init i2c_init(void)
 
 	i2c_debugfs_root = debugfs_create_dir("i2c", NULL);
 
-#ifdef CONFIG_I2C_COMPAT
-	i2c_adapter_compat_class = class_compat_register("i2c-adapter");
-	if (!i2c_adapter_compat_class) {
-		retval = -ENOMEM;
-		goto bus_err;
-	}
-#endif
 	retval = i2c_add_driver(&dummy_driver);
 	if (retval)
 		goto class_err;
@@ -2093,10 +2069,6 @@ static int __init i2c_init(void)
 	return 0;
 
 class_err:
-#ifdef CONFIG_I2C_COMPAT
-	class_compat_unregister(i2c_adapter_compat_class);
-bus_err:
-#endif
 	is_registered = false;
 	bus_unregister(&i2c_bus_type);
 	return retval;
@@ -2109,9 +2081,6 @@ static void __exit i2c_exit(void)
 	if (IS_ENABLED(CONFIG_OF_DYNAMIC))
 		WARN_ON(of_reconfig_notifier_unregister(&i2c_of_notifier));
 	i2c_del_driver(&dummy_driver);
-#ifdef CONFIG_I2C_COMPAT
-	class_compat_unregister(i2c_adapter_compat_class);
-#endif
 	debugfs_remove_recursive(i2c_debugfs_root);
 	bus_unregister(&i2c_bus_type);
 	tracepoint_synchronize_unregister();
-- 
2.46.0


