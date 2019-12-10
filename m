Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31B33118CCC
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 16:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfLJPmU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 10:42:20 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37916 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbfLJPmU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Dec 2019 10:42:20 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so20644422wrh.5
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2019 07:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/574D719hbFtQpR50xV1oDzZQDR7UpeMjBxjWf2LMEo=;
        b=LPVoBq1So4qyMrTR+XkJPFLk0fCI/JMo6fHIL7ZvJQFP+iF/VwW9zbcurfwdUVe/8R
         PPQIbOosvDVevQBjk2ZAN6pzCR25dQEOUz6A7Rgk02axmMl8zKYp+1PdX/62C88tqpri
         MVACKdVsGOc1XbRj+4D2Qb37NoUGdkxiJ143IpdNBaZzomoYvBTgEzpKgp6E+aiicouf
         gGrOA69XXQYSY83R8KWa0VY+9eza8BtLBzOUNfXzgcm3wTLXtF0EEVw8at4f+1bA1T/c
         mPttVS9TercNqow84ffMUOw1YDrvfXqckvTuwMNxLQDywjE4TKr6U7IkiXsZ6xJjDGgR
         UB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/574D719hbFtQpR50xV1oDzZQDR7UpeMjBxjWf2LMEo=;
        b=K+nu3LlkIewy9JvWmGsK7CgEAns5KkRopV26K+LvD1NDHbq8otQPypwE0QT+Gmi8wW
         qlbPVu415GbhWx7qeJGKrjVkBxWUWwhAcMJiiqIrET0ysjGr3sYf6uM81dK29PH/AC/b
         wvmQzrijOYfOqxXBCTBe11zk6AlJRH5d1cLblXRLyQE6uasnSo5K2rY9UDNy+/roYqM+
         L/P/eYGTI3kJT9Zh0ek3rCiobPOLjOttMdcGWiS5wYVSkOnlBRyF/Ua8/6F5e6EyuhRP
         vwbF0r12sQjdK/wuxpQJpgbrCQVCzt1DADs+1V6A5C340EOyxJM/Sn0ujvbVFrJmeqHD
         IIGg==
X-Gm-Message-State: APjAAAVkeJkdJS3LCgxYNWjML+8KumiJbf70oDStQ9jeJqHg6lKUACgx
        RnXdHdhNbInBTTRAqqiOOQWhtg==
X-Google-Smtp-Source: APXvYqyoLlaT2Ui3vB4/R0BIlcScHAbDp9A3rKt/+vQxe3CMTESCcRkjuqrLIGbffyTHZELVGhXe3A==
X-Received: by 2002:a5d:51cc:: with SMTP id n12mr4046468wrv.177.1575992539004;
        Tue, 10 Dec 2019 07:42:19 -0800 (PST)
Received: from khouloud-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o7sm3469085wmc.41.2019.12.10.07.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 07:42:18 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v2 4/4] eeprom: at24: remove the write-protect pin support
Date:   Tue, 10 Dec 2019 16:41:57 +0100
Message-Id: <20191210154157.21930-5-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210154157.21930-1-ktouil@baylibre.com>
References: <20191210154157.21930-1-ktouil@baylibre.com>
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

