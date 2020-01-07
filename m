Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C50D13225E
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 10:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgAGJaI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 04:30:08 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38201 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgAGJaC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 04:30:02 -0500
Received: by mail-wm1-f68.google.com with SMTP id u2so18538984wmc.3
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2020 01:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hbXoP0vp+PirYvwWUgyHBe1Esfy/aJnIgbBAojigrF0=;
        b=Nztzmz6eNrDSgwY251Ai+jCaKcgVlMtbs1husDeHVSovbnUMRq6BQy6T+FkRY85QUt
         IkPm2kc6gb4TKRKF9FcJrxc731QOVyMcGew3dD/tSBQKjAP+LRKZGh6aOooQaVKWp+Rg
         6P2tqHM0gwsm5x60u/aaTllCnqHwav8cEdD0E7g9LTNfRzQZWXu1H3TEASKMczMBFKh/
         R2ngRp/SMpSrOxjfH8STM4JpDVUIjGekw8rmweJQe1Jfy8YQdPaYt7hYZHkLWcIXtBgz
         fMR+HotI04mrMB8PYD19t+3Jyka0X9Daq1OE3DteC2aMDwpujEvYoAgBTrBi25T7g1kj
         Xxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hbXoP0vp+PirYvwWUgyHBe1Esfy/aJnIgbBAojigrF0=;
        b=APtRVCz6iHOVv9HdW2Jem7h6oKeEVZLWOljezvAxFdjTBTr1bfT7qEP4wmdJEkLGKK
         ys+8iTWlqnRyBvOVIZDxXLSCZDOSoaJFOr4Wpn0WKQF+9YWh2GWcEXs3cEcMy/c2s61g
         meaFZ4j4AUAVJq47d8FaiO4gQtti7oIsR9s7t3Nio04GSWStMHyaacVew9Uy3s+sxQWH
         i8wq5uStIBAo9F7x20uQSZUmC0MkUkKq6yfwl9p02eNu8OpPf2pztnG3XszkhqoERoMl
         xLqA0fe2Do+AILez9sL+bQryANRczIXV8+X7G4PsFWRgyP0xDKaMX/XFj2ISg5mTBeTO
         PPrA==
X-Gm-Message-State: APjAAAW4d2dQfsECY37+599fqLfTYnSAyxvqaLuyrLHQ3xdokXg2trAM
        v1J/XFkEQZlaGB1+Fn2dOn1lew==
X-Google-Smtp-Source: APXvYqyMhTwWVXgMXGm8nvfoFZGmid0emBih3D9seLYFLTuL1tiWCOCML9NhsBa+tTTztQfalDR/kQ==
X-Received: by 2002:a7b:c936:: with SMTP id h22mr37566162wml.115.1578389401133;
        Tue, 07 Jan 2020 01:30:01 -0800 (PST)
Received: from localhost.localdomain (i16-les01-ntr-213-44-229-207.sfr.lns.abo.bbox.fr. [213.44.229.207])
        by smtp.googlemail.com with ESMTPSA id x14sm25959969wmj.42.2020.01.07.01.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 01:30:00 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v4 5/5] eeprom: at24: remove the write-protect pin support
Date:   Tue,  7 Jan 2020 10:29:22 +0100
Message-Id: <20200107092922.18408-6-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107092922.18408-1-ktouil@baylibre.com>
References: <20200107092922.18408-1-ktouil@baylibre.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

NVMEM framework is an interface for the at24 EEPROMs as well as for
other drivers, instead of passing the wp-gpios over the different
drivers each time, it would be better to pass it over the NVMEM
subsystem once and for all.

Removing the support for the write-protect pin after adding it to the
NVMEM subsystem.

Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/misc/eeprom/at24.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 0681d5fdd538..8fce49a6d9cd 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -22,7 +22,6 @@
 #include <linux/nvmem-provider.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
-#include <linux/gpio/consumer.h>
 
 /* Address pointer is 16 bit. */
 #define AT24_FLAG_ADDR16	BIT(7)
@@ -89,8 +88,6 @@ struct at24_data {
 
 	struct nvmem_device *nvmem;
 
-	struct gpio_desc *wp_gpio;
-
 	/*
 	 * Some chips tie up multiple I2C addresses; dummy devices reserve
 	 * them for us, and we'll use them with SMBus calls.
@@ -457,12 +454,10 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 	 * from this host, but not from other I2C masters.
 	 */
 	mutex_lock(&at24->lock);
-	gpiod_set_value_cansleep(at24->wp_gpio, 0);
 
 	while (count) {
 		ret = at24_regmap_write(at24, buf, off, count);
 		if (ret < 0) {
-			gpiod_set_value_cansleep(at24->wp_gpio, 1);
 			mutex_unlock(&at24->lock);
 			pm_runtime_put(dev);
 			return ret;
@@ -472,7 +467,6 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 		count -= ret;
 	}
 
-	gpiod_set_value_cansleep(at24->wp_gpio, 1);
 	mutex_unlock(&at24->lock);
 
 	pm_runtime_put(dev);
@@ -662,9 +656,6 @@ static int at24_probe(struct i2c_client *client)
 	at24->client[0].client = client;
 	at24->client[0].regmap = regmap;
 
-	at24->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
-	if (IS_ERR(at24->wp_gpio))
-		return PTR_ERR(at24->wp_gpio);
 
 	writable = !(flags & AT24_FLAG_READONLY);
 	if (writable) {
-- 
2.17.1

