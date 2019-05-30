Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD62130462
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 23:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfE3V6Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 May 2019 17:58:25 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43776 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfE3V6Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 May 2019 17:58:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id l17so5138257wrm.10
        for <linux-i2c@vger.kernel.org>; Thu, 30 May 2019 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+D77JZYl7L4JwlmlkCR53sQehR/+WCFO9RDYDI3XJU=;
        b=lxCilLefv1Tz7C7/PLb8Dl781WsaCZvG7vjg/DEkO53gLw7zbreJkjb6fdJsbHw07S
         A/OHPUi+3eD7Ss5MPpwYDhrJJP8xvWDt1E030/EL6974jVZ+z4DY2fQa0P/4Ef5CUBTC
         2FdGoWb/mcjC9mMiK75Hnt9bGYE5UpRnHwdnXasnRNv4OZwjqqB7Lkkl+1YY9meG00R9
         bOcZPSwy9TsG+RdIHQkkyhFEirXj7D3RtNPK4yNhgftYX/jjLzg9Hy/C7qb0HA+dq/Vj
         4QeYoCIeHrB69RhQQCYtrHSG/gM1iskiGapShXfYAc9sWJkbP0UGXMTsPD/MXiS4rwy7
         q1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+D77JZYl7L4JwlmlkCR53sQehR/+WCFO9RDYDI3XJU=;
        b=gJ0yfVrJAyKlOi2mSWawy7iXpT3uGWJElMj56pfa4ZgQUU/VcucmRBgRHj6NWtfcbc
         O23r8G7Zg814wPl52MwkCOJ+q30w25wgDsn1j4hubF7dT3nGCbMdWcSwsWZfQMR5r857
         1RIeAG8hLl4aNiD4UcGcF15/EIx9NjSyuNKoxMOHs27lgDTh5nm6XiCY66LZIP5eJ/bt
         kfBR3d6Ttl+EQYkS57xTyBkBg9PrcuoBOROZXqQfUs9E/BVJEcEhWPfA6ZNZWCr2YPIj
         GzGY1UHIVvQs6eQh4Rev/XhQIXid0yVhybpbzKrmp0nuLFQyUsj4eptj2Uiqm9wGwWgo
         YRkw==
X-Gm-Message-State: APjAAAWwhs6l5SjcfRqrszgm9JYYNlC5rVZBG3yJknMW3zNuWHKoTSzi
        2jN8uaakCr78773bsfTkUGC4Ag==
X-Google-Smtp-Source: APXvYqzde0Rlxae4HnLSuPu+CpWIe/UaguJuiNQSoH/SNGqD/hzlwkvRpg2H5v3Zwl0PndNFgMypqA==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr3917442wrm.193.1559253016797;
        Thu, 30 May 2019 14:50:16 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id a139sm6177079wmd.18.2019.05.30.14.50.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 30 May 2019 14:50:15 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] i2c: s3c2410: Convert to use GPIO descriptors
Date:   Thu, 30 May 2019 23:50:13 +0200
Message-Id: <20190530215013.17806-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The S3C2410 does some funny dance around its pins:
- First try to call back to the platform to get and control
  some GPIO pins
- If this doesn't work, it tries to get a pin control handle
- If this doesn't work, it retrieves two GPIOs from the device
  tree node and does nothing with them

If we're gonna retrieve two GPIOs and do nothing with them, we
might as well do it using the GPIO descriptor API. When we use
the resource management API, the code gets smaller.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/i2c/busses/i2c-s3c2410.c | 47 ++++++--------------------------
 1 file changed, 9 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 53bc021f4a5a..ed06a8535d63 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -33,7 +33,7 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
@@ -122,7 +122,7 @@ struct s3c24xx_i2c {
 	struct i2c_adapter	adap;
 
 	struct s3c2410_platform_i2c	*pdata;
-	int			gpios[2];
+	struct gpio_desc	*gpios[2];
 	struct pinctrl          *pctrl;
 #if defined(CONFIG_ARM_S3C24XX_CPUFREQ)
 	struct notifier_block	freq_transition;
@@ -956,53 +956,27 @@ static inline void s3c24xx_i2c_deregister_cpufreq(struct s3c24xx_i2c *i2c)
 #ifdef CONFIG_OF
 static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
 {
-	int idx, gpio, ret;
+	int i;
 
 	if (i2c->quirks & QUIRK_NO_GPIO)
 		return 0;
 
-	for (idx = 0; idx < 2; idx++) {
-		gpio = of_get_gpio(i2c->dev->of_node, idx);
-		if (!gpio_is_valid(gpio)) {
-			dev_err(i2c->dev, "invalid gpio[%d]: %d\n", idx, gpio);
-			goto free_gpio;
-		}
-		i2c->gpios[idx] = gpio;
-
-		ret = gpio_request(gpio, "i2c-bus");
-		if (ret) {
-			dev_err(i2c->dev, "gpio [%d] request failed (%d)\n",
-				gpio, ret);
-			goto free_gpio;
+	for (i = 0; i < 2; i++) {
+		i2c->gpios[i] = devm_gpiod_get_index(i2c->dev, NULL,
+						     i, GPIOD_ASIS);
+		if (IS_ERR(i2c->gpios[i])) {
+			dev_err(i2c->dev, "i2c gpio invalid at index %d\n", i);
+			return -EINVAL;
 		}
 	}
 	return 0;
-
-free_gpio:
-	while (--idx >= 0)
-		gpio_free(i2c->gpios[idx]);
-	return -EINVAL;
 }
 
-static void s3c24xx_i2c_dt_gpio_free(struct s3c24xx_i2c *i2c)
-{
-	unsigned int idx;
-
-	if (i2c->quirks & QUIRK_NO_GPIO)
-		return;
-
-	for (idx = 0; idx < 2; idx++)
-		gpio_free(i2c->gpios[idx]);
-}
 #else
 static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
 {
 	return 0;
 }
-
-static void s3c24xx_i2c_dt_gpio_free(struct s3c24xx_i2c *i2c)
-{
-}
 #endif
 
 /*
@@ -1231,9 +1205,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c->adap);
 
-	if (pdev->dev.of_node && IS_ERR(i2c->pctrl))
-		s3c24xx_i2c_dt_gpio_free(i2c);
-
 	return 0;
 }
 
-- 
2.20.1

