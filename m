Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0E17C54AA
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 15:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbjJKNCO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 09:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjJKNCN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 09:02:13 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC4A9D
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 06:02:11 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32d895584f1so336657f8f.1
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697029330; x=1697634130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxP50mjlFsla3Pz/fmyyE11r9eXmq7yiPt4F5Ys7dSE=;
        b=HixFp+6DGA75PN2s1S5OOYnodmM03iAfMTW1lZYShj/wRU7+8rOOSN1qRVIDGEfEH7
         iRqfoOcS96HNdLzru+gwO5QtsfuKrug5OxjLPGXRHuIh4hpmKjaz3+0AjZXTSU9J8vRt
         uJp5Eh5Wl8jGYSBuv62ovY/1/op5f0Ac+ljbXqTlp1DhSZ3tjq5O8qlzHgdbMDMqQUTq
         47vyMZMc+4SNf1mcSo4pUipeSLoXfaYr/SNh4uyrEhv8xCw3/PfjybOpWbdEHORz9uKs
         y6bL+bkRdXnr2w4G1wau5q6KIg3UdyapXi322rJels90s7In8hB+1OEwwCKGDlUO1AfD
         EhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697029330; x=1697634130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxP50mjlFsla3Pz/fmyyE11r9eXmq7yiPt4F5Ys7dSE=;
        b=JesjApU4lhF4+B70MOk6E0QOHsVA64FvcC1STLAQbyiq4EG+0BRylbpnuTIVu4isUF
         dPa0/sWOBg6vx0ahT5nUq1N3LFOrB6VOpe30olWAJUbmKLUKtEWvMJhVf4FgfiyKe0LL
         9yasWQhGvTM7P7fkIb80SPG2VHP8AqveNngMu+ZMqcHBedrukU/+Z7Y5YJLQUYX4Pixu
         SbE9LJ6/XDoPIFBHzdeHH/KIwD2csei+j0kmzzg80q/oJD7EcFa/p+cyixe1qPPZQ6um
         as3se6nle2fWhebCbSICCUpdZ71d3OU+JycV3HI9oXg1owxsPQk2gPB3zBRY3uq8LW3Q
         Wy0g==
X-Gm-Message-State: AOJu0YzBuzv7PYjeJ6rQZUz1mFvmVE5zWWnNKYbtpsLMUJ9XktfM+tJ3
        vzId8neYEfbM7GWeHzfczPvStg==
X-Google-Smtp-Source: AGHT+IGYhTLRS1ySFrvLEdfx4DVvOxzjNWYMLUovd7enoTOl6e3YiL6ysdL4Cx27hmJEiLkCHUkySA==
X-Received: by 2002:a05:6000:114d:b0:324:8502:6355 with SMTP id d13-20020a056000114d00b0032485026355mr17631600wrx.46.1697029329736;
        Wed, 11 Oct 2023 06:02:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id s13-20020adfeccd000000b003198a9d758dsm15455375wro.78.2023.10.11.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:02:08 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/3] gpiolib: provide gpio_device_to_device()
Date:   Wed, 11 Oct 2023 15:02:02 +0200
Message-Id: <20231011130204.52265-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011130204.52265-1-brgl@bgdev.pl>
References: <20231011130204.52265-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are users in the kernel who need to retrieve the address of the
struct device backing the GPIO device. Currently they needlessly poke in
the internals of GPIOLIB. Add a dedicated getter function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 17 +++++++++++++++++
 include/linux/gpio/driver.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 191f9c87b4d0..ca2b5b424284 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1169,6 +1169,23 @@ void gpio_device_put(struct gpio_device *gdev)
 }
 EXPORT_SYMBOL_GPL(gpio_device_put);
 
+/**
+ * gpio_device_to_device() - Retrieve the address of the underlying struct
+ *                           device.
+ * @gdev: GPIO device for which to return the address.
+ *
+ * This does not increase the reference count of the GPIO device nor the
+ * underlying struct device.
+ *
+ * Returns:
+ * Address of struct device backing this GPIO device.
+ */
+struct device *gpio_device_to_device(struct gpio_device *gdev)
+{
+	return &gdev->dev;
+}
+EXPORT_SYMBOL_GPL(gpio_device_to_device);
+
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 
 /*
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index f8ad7f40100c..0484bf90b25d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -618,6 +618,8 @@ void gpio_device_put(struct gpio_device *gdev);
 DEFINE_FREE(gpio_device_put, struct gpio_device *,
 	    if (IS_ERR_OR_NULL(_T)) gpio_device_put(_T));
 
+struct device *gpio_device_to_device(struct gpio_device *gdev);
+
 bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_relres_irq(struct gpio_chip *gc, unsigned int offset);
-- 
2.39.2

