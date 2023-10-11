Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B897C54AE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 15:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbjJKNCS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 09:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234871AbjJKNCS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 09:02:18 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E10AAF
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 06:02:15 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so6443279f8f.3
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697029334; x=1697634134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOhmKBxnjPWo6ddzFX5PM60asyFhIGEHrRKZVC90wiM=;
        b=gHlFgqI3ABxAxpZZcg/h8K2970YKKRpIJbmBqDjj8m6GmthEHqePRB8SyiV3V4Jdvt
         BLiUpOX8y5u543L5X2pQTz3q0ze3DZR/sHttB3nzHOT5ZSKLIpNSkfN2ts+gU8ZcxU12
         Zt7OP2RiYo1UbuMyvJY5nVjeL1jGdLcHYtyG1a5I/GKUUon9yGZd/j9kNwhDmuZfX05K
         kmJHfcx9NiO331BgKqund/NaA2q7KxEGaPGPSjctLjOuhXSaxba6NyuVDo4TgQ5lsamQ
         POPUvBcvrccg4xRlrGU2AsaPN72QU8Xr2NYVQla52TjHncGRNMwc25nKEeKtPYDkU+Zc
         sUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697029334; x=1697634134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOhmKBxnjPWo6ddzFX5PM60asyFhIGEHrRKZVC90wiM=;
        b=nURCoOwJb0EjM/zquU2HSjH4t3cQpzm8Xv5nrcUIRGuKh2bgCTn3Pdag732JOdEAk9
         3UaNORdIo2DkTDq5lp5fKJhI1QawHW5vy1Dddn9iCxdM0T4voit7XHDwW163eSXsi2rx
         C4oXcHB37DuWKCMgsh5tOhVUD0hR8EbS1ApT7HRiON/EVWgJf1zUysE+nXHyHpRzp/3E
         /l6vtzdHgPlTjDOFP0JmItXFD8p/rkfKNoysOISQYkrzc6H4OeGwKEFGd0/mJk1ZdFWl
         p8OJRz9261rc9wBPIcY60LH1IXiSNfscoHiom4OveYHVowrZS1pWXiJbql3PO19banrX
         QaiQ==
X-Gm-Message-State: AOJu0YxUdqeiOwoetO4CjXkEvLbaQLdHMkHmQGZIDqoD9p/MTlYrnJuO
        BZ0liXxlXiu3+EXVKlMTq9AItw==
X-Google-Smtp-Source: AGHT+IG1ury2Xk2zMZ3J3z9yMYpHMD/S3uprCdExUEscuR0frxJAWI6bhpv+Tb8sn704HMfhO27rNQ==
X-Received: by 2002:a5d:4c50:0:b0:31f:dc60:13b5 with SMTP id n16-20020a5d4c50000000b0031fdc6013b5mr18364953wrt.25.1697029333084;
        Wed, 11 Oct 2023 06:02:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id s13-20020adfeccd000000b003198a9d758dsm15455375wro.78.2023.10.11.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:02:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/3] i2c: mux: gpio: don't fiddle with GPIOLIB internals
Date:   Wed, 11 Oct 2023 15:02:04 +0200
Message-Id: <20231011130204.52265-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011130204.52265-1-brgl@bgdev.pl>
References: <20231011130204.52265-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the relevant API functions to retrieve the address of the
underlying struct device instead of accessing GPIOLIB private structures
manually.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/i2c/muxes/i2c-mux-gpio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 5d5cbe0130cd..48a872a8196b 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -14,8 +14,7 @@
 #include <linux/slab.h>
 #include <linux/bits.h>
 #include <linux/gpio/consumer.h>
-/* FIXME: stop poking around inside gpiolib */
-#include "../../gpio/gpiolib.h"
+#include <linux/gpio/driver.h>
 
 struct gpiomux {
 	struct i2c_mux_gpio_platform_data data;
@@ -176,7 +175,8 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < ngpios; i++) {
-		struct device *gpio_dev;
+		struct gpio_device *gdev;
+		struct device *dev;
 		struct gpio_desc *gpiod;
 		enum gpiod_flags flag;
 
@@ -195,9 +195,9 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 		if (!muxc->mux_locked)
 			continue;
 
-		/* FIXME: find a proper way to access the GPIO device */
-		gpio_dev = &gpiod->gdev->dev;
-		muxc->mux_locked = i2c_root_adapter(gpio_dev) == root;
+		gdev = gpiod_to_gpio_device(gpiod);
+		dev = gpio_device_to_device(gdev);
+		muxc->mux_locked = i2c_root_adapter(dev) == root;
 	}
 
 	if (muxc->mux_locked)
-- 
2.39.2

