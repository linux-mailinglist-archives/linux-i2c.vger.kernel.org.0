Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A497A7436
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 09:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbjITHdS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 03:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbjITHdQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 03:33:16 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2702CA
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 00:33:07 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40479f8325fso57890555e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 00:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695195186; x=1695799986; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GO5VjgyTURZTJ+S1ya2T4cL5spck5ShsqZulAyAgHcI=;
        b=EqREqdDEt6BblHZ6k/WU8jbN5V8wMRNvgoCqA6xMqyoMJdOM1cLWz072kad1Iz7cSe
         VfXXIGxJSxfaMU51Z0ZO9s5vZsJsbaeft7iBzi+g8mapRTsun34ozDKOyHeh4du47YQV
         MvvYssMdtwz/ctlfcresl85sZbPLqtlBwJ+sMRn8PyV4atZT0GxKllQu8tOyUPMto8tY
         pBYOpF3eGV/pbSIJ3zmJs4mB5PA8uw/NnPqW9gKX8+6N9nEg0JaI/AfTlSpGk+Hgsrw8
         /lm23LARI496s6DCE8STWhLeAkaEeRwOFjEU48F4VVHYtsG+xqLGaz/pR5+yTQxH2Ae5
         KARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695195186; x=1695799986;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GO5VjgyTURZTJ+S1ya2T4cL5spck5ShsqZulAyAgHcI=;
        b=nxkPVYrmbCFb/5QxGXoLlZ7gJ7hZB6LjYNKnixKlNZXZh5VhxwUojjv2rdjGD5zfUJ
         l8lcS4io9Z702h6QNa9NOeQO3/7u5X+eOE9UzOSanKX6icHOctVliZDbZeQScavKLhrN
         moRf0JLPqzPaYNSvrkKvAd9QluEv0ty4r8j+SdcqjnQuQIEGfBmeTJxW3uW36jYH4sS7
         FCk48CJd3lsqX61aX3JO9LOgfWsSLXKu4olrJ6ByZAqwSqtl8ga/FZUGZLCszyWZLMwW
         whvePXfsT6oAMJExWkvDCD2REDuWSY5e4vZIJ7nO5t35pss+tnxD3Mq/IAQWh+esZAIk
         plaw==
X-Gm-Message-State: AOJu0Yxk8NK5pfB4f6bxr6yTfdovmEG8fzytO8Wkq9RpUGL8frzl3dph
        7xZ2K0arnUvfx7y7XGYeM/cMhibk5gg=
X-Google-Smtp-Source: AGHT+IHqTXs/KfC24XExz1Q7YntWxwgw1JhZhNAunXLHce8akQ7pR6GfJzNba3C5ocTJvcK+VB7o3Q==
X-Received: by 2002:a1c:7c1a:0:b0:401:d947:c8a9 with SMTP id x26-20020a1c7c1a000000b00401d947c8a9mr1996135wmc.19.1695195185796;
        Wed, 20 Sep 2023 00:33:05 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6f42:8500:f444:99ee:9f3d:44d5? (dynamic-2a01-0c22-6f42-8500-f444-99ee-9f3d-44d5.c22.pool.telefonica.de. [2a01:c22:6f42:8500:f444:99ee:9f3d:44d5])
        by smtp.googlemail.com with ESMTPSA id h4-20020a05600c350400b00402f713c56esm1166780wmq.2.2023.09.20.00.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 00:33:05 -0700 (PDT)
Message-ID: <3ef0a090-13ef-4fa9-9b91-1b03abfd01f4@gmail.com>
Date:   Wed, 20 Sep 2023 09:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RESUBMIT] i2c: i801: replace acpi_lock with I2C bus lock
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C core ensures in i2c_smbus_xfer() that the I2C bus lock is held when
calling the smbus_xfer callback. That's i801_access() in our case.
I think it's safe in general to assume that the I2C bus lock is held
when the smbus_xfer callback is called.
Therefore I see no need to define an own mutex.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
Patch was part of a broken-up previous series.
---
 drivers/i2c/busses/i2c-i801.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 26f132277..a485dc84d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -293,10 +293,9 @@ struct i801_priv {
 
 	/*
 	 * If set to true the host controller registers are reserved for
-	 * ACPI AML use. Protected by acpi_lock.
+	 * ACPI AML use.
 	 */
 	bool acpi_reserved;
-	struct mutex acpi_lock;
 };
 
 #define FEATURE_SMBUS_PEC	BIT(0)
@@ -874,11 +873,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	int hwpec, ret;
 	struct i801_priv *priv = i2c_get_adapdata(adap);
 
-	mutex_lock(&priv->acpi_lock);
-	if (priv->acpi_reserved) {
-		mutex_unlock(&priv->acpi_lock);
+	if (priv->acpi_reserved)
 		return -EBUSY;
-	}
 
 	pm_runtime_get_sync(&priv->pci_dev->dev);
 
@@ -919,7 +915,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 
 	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
 	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
-	mutex_unlock(&priv->acpi_lock);
 	return ret;
 }
 
@@ -1571,7 +1566,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 	 * further access from the driver itself. This device is now owned
 	 * by the system firmware.
 	 */
-	mutex_lock(&priv->acpi_lock);
+	i2c_lock_bus(&priv->adapter, I2C_LOCK_SEGMENT);
 
 	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
 		priv->acpi_reserved = true;
@@ -1591,7 +1586,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 	else
 		status = acpi_os_write_port(address, (u32)*value, bits);
 
-	mutex_unlock(&priv->acpi_lock);
+	i2c_unlock_bus(&priv->adapter, I2C_LOCK_SEGMENT);
 
 	return status;
 }
@@ -1651,7 +1646,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	priv->adapter.dev.parent = &dev->dev;
 	ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
 	priv->adapter.retries = 3;
-	mutex_init(&priv->acpi_lock);
 
 	priv->pci_dev = dev;
 	priv->features = id->driver_data;
-- 
2.42.0

