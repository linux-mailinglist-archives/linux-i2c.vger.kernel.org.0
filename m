Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE6D7C0499
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 21:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbjJJT17 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 15:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbjJJT15 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 15:27:57 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A578CA
        for <linux-i2c@vger.kernel.org>; Tue, 10 Oct 2023 12:27:48 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so10672549a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 10 Oct 2023 12:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696966066; x=1697570866; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnaGmKrkKN4/fjkVOU0VHHE3HdassQsX1aVilS4cbfQ=;
        b=WlLE3DDaJcWOvbnVKUSGAbZJJPrkBAIoM5LRe9yW0s+i9weUsRefPT+vtIhL1gaIvz
         DO72ZYugdeWOPeeLBqju0TdByiY/wGx2RPDRYo2o8LnG9BensD3wQUFTrG1PMJ1t3OrO
         X2RkM10zsaeh42aDhuMEYqgKC+5AXcG1qgtwXwPayJ4QIkybGA7FAXrv1aCT0VO3K+ht
         jUDtRdaG60JyOXkUWesyiB+5yCbPKtNz+cJadZPAi1IGZepzbz1rZ2UyNzYJlgiYf2ji
         zdUXZ7THdRVJxMfcemgobfShjKI4DNduIiiiPtrdeyMMbiZ9CfKw8bQHJ7fa1nDst5AI
         Bt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696966066; x=1697570866;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnaGmKrkKN4/fjkVOU0VHHE3HdassQsX1aVilS4cbfQ=;
        b=Y1bqskyIwb4pktR9eOPW0N4QH5O6wBhtPV2lT1z5Pkade8wmCCh+t2NNIqzCuOEFzb
         +CmOybLr/ybUxMUQsS5RLHOgJF0uQWAHEe9Q6lQHBXs44AnXOXDHLGA39sNbyX7cQkZa
         VYvjZ+nG/PlhFyGwMjKGq3y+waClnFwCTJWH7SonwZ8CueWutm3N5gvghbMMU6kVvdXE
         zAVsGUMmPPGJWqZB2gBADiDkDMmheCMLIG0XvyjZJOavUiaDJCrn3gmSYV2AFJk4UMZw
         b4e5CfvD+INiS2pUKnG66mkg0NfM63v3eLvcSM6aJcz6M+yvevV85i20U7ZFrF7zjMyV
         wbiA==
X-Gm-Message-State: AOJu0Yzd5Pk23+cNfsMAQ5cxIo9bvqajPp19ua4itAMyxkTCjVukS2mR
        tDkc2wY5ls+EI0B+Dqf/L6y/k+cSkxg=
X-Google-Smtp-Source: AGHT+IHNeWh16T+MVopYUr41cBDbZQE/RBABobjlCd69xACTYHElNvoCLs2ssTy5PAFusSZtz/ivJA==
X-Received: by 2002:a05:6402:541a:b0:53d:b2c8:6783 with SMTP id ev26-20020a056402541a00b0053db2c86783mr873861edb.14.1696966066239;
        Tue, 10 Oct 2023 12:27:46 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73de:9300:a83b:58eb:138d:a089? (dynamic-2a01-0c22-73de-9300-a83b-58eb-138d-a089.c22.pool.telefonica.de. [2a01:c22:73de:9300:a83b:58eb:138d:a089])
        by smtp.googlemail.com with ESMTPSA id u5-20020aa7d545000000b00534e791296bsm8028290edr.37.2023.10.10.12.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 12:27:45 -0700 (PDT)
Message-ID: <2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com>
Date:   Tue, 10 Oct 2023 21:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Simplify class-based client device instantiation
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

Now that the legacy eeprom driver was removed, the only remaining i2c
client driver with class SPD autodetection is jc42, and this driver
supports also class HWMON. Therefore we can remove class SPD from the
supported classes of the i801 adapter driver.
Legacy class-based instantiation shouldn't be used in new code, so I
think we can remove also the generic logic that ensures that supported
classes of parent and muxed adapters don't overlap.

Note: i801 parent supports just class HWMON now, and muxed childs
class SPD, so the supported classes don't overlap.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 38 +++++++----------------------------
 1 file changed, 7 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a485dc84d..a41f5349a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -285,7 +285,6 @@ struct i801_priv {
 	u8 *data;
 
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
-	const struct i801_mux_config *mux_drvdata;
 	struct platform_device *mux_pdev;
 	struct gpiod_lookup_table *lookup;
 #endif
@@ -1282,7 +1281,7 @@ static void i801_probe_optional_slaves(struct i801_priv *priv)
 
 	/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO)
-	if (!priv->mux_drvdata)
+	if (!priv->mux_pdev)
 #endif
 		i2c_register_spd(&priv->adapter);
 }
@@ -1384,11 +1383,14 @@ static void i801_add_mux(struct i801_priv *priv)
 	const struct i801_mux_config *mux_config;
 	struct i2c_mux_gpio_platform_data gpio_data;
 	struct gpiod_lookup_table *lookup;
+	const struct dmi_system_id *id;
 	int i;
 
-	if (!priv->mux_drvdata)
+	id = dmi_first_match(mux_dmi_table);
+	if (!id)
 		return;
-	mux_config = priv->mux_drvdata;
+
+	mux_config = id->driver_data;
 
 	/* Prepare the platform data */
 	memset(&gpio_data, 0, sizeof(struct i2c_mux_gpio_platform_data));
@@ -1432,35 +1434,9 @@ static void i801_del_mux(struct i801_priv *priv)
 	platform_device_unregister(priv->mux_pdev);
 	gpiod_remove_lookup_table(priv->lookup);
 }
-
-static unsigned int i801_get_adapter_class(struct i801_priv *priv)
-{
-	const struct dmi_system_id *id;
-	const struct i801_mux_config *mux_config;
-	unsigned int class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
-	int i;
-
-	id = dmi_first_match(mux_dmi_table);
-	if (id) {
-		/* Remove branch classes from trunk */
-		mux_config = id->driver_data;
-		for (i = 0; i < mux_config->n_values; i++)
-			class &= ~mux_config->classes[i];
-
-		/* Remember for later */
-		priv->mux_drvdata = mux_config;
-	}
-
-	return class;
-}
 #else
 static inline void i801_add_mux(struct i801_priv *priv) { }
 static inline void i801_del_mux(struct i801_priv *priv) { }
-
-static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
-{
-	return I2C_CLASS_HWMON | I2C_CLASS_SPD;
-}
 #endif
 
 static struct platform_device *
@@ -1641,7 +1617,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	i2c_set_adapdata(&priv->adapter, priv);
 	priv->adapter.owner = THIS_MODULE;
-	priv->adapter.class = i801_get_adapter_class(priv);
+	priv->adapter.class = I2C_CLASS_HWMON;
 	priv->adapter.algo = &smbus_algorithm;
 	priv->adapter.dev.parent = &dev->dev;
 	ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
-- 
2.42.0

