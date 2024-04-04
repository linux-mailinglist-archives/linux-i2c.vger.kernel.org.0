Return-Path: <linux-i2c+bounces-2766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F0898F6E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 22:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B215B1F22340
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 20:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53023134402;
	Thu,  4 Apr 2024 20:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIo0F1lW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661BE1332A5
	for <linux-i2c@vger.kernel.org>; Thu,  4 Apr 2024 20:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712261394; cv=none; b=c2WFfstj/I8s0U31XnBUarDfG588i9vFUGaTIJkPNuxF0ae4JyPVnpuYk7YKfmT5zdM0KUkiTWxuahhbOYY/F6KOr3SS/ss4kQU4/r4iajpow61wNCv5sui9BEtsHaIft6gZFNMTW4vgf5wu+GYfNwR8yo2P5YZObZJbUpEbWI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712261394; c=relaxed/simple;
	bh=L1iT0ykTQniwRDpAfQZCAuyY1vLoIB3lYx8aCkrN7FU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=f2eHbz+fy9aDyqbDNGKWJboWcdQSM4NTQ4NsN4Hm8ioLzSLqAZXOGuagTlDrZvpj47RQCT9jBmHl2V01quFH/L51sliAbSCS9bi4mj2zvIQgGw1uOBQezgX1ACgpWoQwmEAzYdw2TDCJdhWYVmlhArCgUJYwmNrX5sbhVQJ8kyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIo0F1lW; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a51982c1cefso84650066b.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Apr 2024 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712261391; x=1712866191; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKil0KswSaBCCiLboBdFYIADywNsNLsEk5XDpaI8BMA=;
        b=QIo0F1lWhOot7H68Sz6+n/gzHfjFEpJ+nq4t+LbwvbHyvj20wzYC1yfOyvvdzyTlXJ
         v9hQq9r4xNKLh+OnuWlzNhQUFYYcmJhJdCSj+F4hrojlmrGJRI5+MiVKHvYnm6vducbi
         AUCOg/20cKoTiJ7Ua+OQ7OoF6quVXXcn/s5JHFpImwsJ4toq3HsAXEjlDrDgd6uxYkRd
         7tLgcyO3aRUMV+nAK1aTZkugUJiPBI9bZdZ8YhwKhFEVCvfQ32ZIvFMG/bZmhuEhi/+N
         btfMsBKKnpJ+Uhxd9qiz6OqXBIl0RHOtwCyVYFRvsaCPAG+SQaLGSeD3Chc+tp7YI6Ib
         160A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712261391; x=1712866191;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKil0KswSaBCCiLboBdFYIADywNsNLsEk5XDpaI8BMA=;
        b=a+Aqoaue1qI0bSLcyL/3T6SexNwuxed1CN5JG6QyD2iyADLAqoS539IIQcix/Rl0dG
         IimA2x3b+8IN05u9aU1Gp/eXzqwC3Stn2zGbxkm9fusUSdatSlZtI74F2WoaoFpISt/t
         K7tr0twEFxR/a7VMHpPs/NNu9/OIQ4s+fl9kVZLJ3IH6JgtJ9zNFbNY9ikdVtoStF7Mq
         fAdPLKLEurA+iU3epm67d8WxxkiST4n+I1DBF0g70olZv32jXSzVCoZhnWaQuedRrRfk
         Rp44aml+SfyBiFmfeta8lSaQt1/+1oJcFbm9p9CIe1RXzf2oT2FU4XAka11NMZrSuTcq
         +DOQ==
X-Gm-Message-State: AOJu0Yx3CmA3stcOKiF/ein9rHNvHk/MPLsADVWUWyOOPmoloMms3eP3
	4Bxa+ibJy4oTP5hKMKuuUYy8ojf0yHyTTBd/1hyaxYt70f5ck5g6VsD0Hu8d
X-Google-Smtp-Source: AGHT+IFkkQuTx/vbuF+WTdq/e7xp7bvo32oSzrhvFWCKkXU14Xg7HYCvvpXktgViuflCEykWyggCNw==
X-Received: by 2002:a17:907:6d27:b0:a4e:5c23:f776 with SMTP id sa39-20020a1709076d2700b00a4e5c23f776mr2854267ejc.37.1712261390471;
        Thu, 04 Apr 2024 13:09:50 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b917:8300:853f:3a79:973b:a77f? (dynamic-2a01-0c23-b917-8300-853f-3a79-973b-a77f.c23.pool.telefonica.de. [2a01:c23:b917:8300:853f:3a79:973b:a77f])
        by smtp.googlemail.com with ESMTPSA id eb16-20020a170907281000b00a4e0df9e793sm9437651ejc.136.2024.04.04.13.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 13:09:50 -0700 (PDT)
Message-ID: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>
Date: Thu, 4 Apr 2024 22:09:50 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] i2c: i801: Fix missing Kconfig dependency
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The original change adds usage of i2c_root_adapter(), which is
implemented in i2c-mux.c. Therefore we can't use the multiplexing
if I2C_I801=y and I2C_MUX=m.
Handling the dependencies in the code would become unnecessarily
complex, therefore create a new config symbol.

Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@intel.com/
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
- Completely rework the fix and create a new config symbol.
---
 drivers/i2c/busses/Kconfig    | 8 ++++++++
 drivers/i2c/busses/i2c-i801.c | 8 ++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 97989c914..3eb17f43a 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -163,6 +163,14 @@ config I2C_I801
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
 
+config I2C_I801_MUX
+	def_bool I2C_I801
+	depends on DMI && I2C_MUX_GPIO
+	depends on !(I2C_I801=y && I2C_MUX=m)
+	help
+	  Optional support for multiplexed SMBUS on certain systems with
+	  more than 8 memory slots.
+
 config I2C_ISCH
 	tristate "Intel SCH SMBus 1.0"
 	depends on PCI
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 4294c0c63..92b53b480 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -120,7 +120,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
 
-#if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
+#ifdef CONFIG_I2C_I801_MUX
 #include <linux/gpio/machine.h>
 #include <linux/platform_data/i2c-mux-gpio.h>
 #endif
@@ -289,7 +289,7 @@ struct i801_priv {
 	int len;
 	u8 *data;
 
-#if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
+#ifdef CONFIG_I2C_I801_MUX
 	struct platform_device *mux_pdev;
 	struct gpiod_lookup_table *lookup;
 	struct notifier_block mux_notifier_block;
@@ -1300,7 +1300,7 @@ static void i801_probe_optional_slaves(struct i801_priv *priv)
 		register_dell_lis3lv02d_i2c_device(priv);
 
 	/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
-#if IS_ENABLED(CONFIG_I2C_MUX_GPIO)
+#ifdef CONFIG_I2C_I801_MUX
 	if (!priv->mux_pdev)
 #endif
 		i2c_register_spd(&priv->adapter);
@@ -1310,7 +1310,7 @@ static void __init input_apanel_init(void) {}
 static void i801_probe_optional_slaves(struct i801_priv *priv) {}
 #endif	/* CONFIG_X86 && CONFIG_DMI */
 
-#if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
+#ifdef CONFIG_I2C_I801_MUX
 static struct i801_mux_config i801_mux_config_asus_z8_d12 = {
 	.gpio_chip = "gpio_ich",
 	.values = { 0x02, 0x03 },
-- 
2.44.0


