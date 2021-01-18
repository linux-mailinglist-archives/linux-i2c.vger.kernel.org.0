Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A34F2F96A7
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 01:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730636AbhARAg0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 19:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730523AbhARAgC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Jan 2021 19:36:02 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E507DC0613CF;
        Sun, 17 Jan 2021 16:34:47 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id e15so6003753wme.0;
        Sun, 17 Jan 2021 16:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xaT2dcHZPdRJ0y4idc+VOXuKF4+lYQ1c3wtupWCa5lw=;
        b=qBC/1udNWoM7qwWbUL53JFbD0+wuAlegkZZd6nQPdTzEf8VEioBlYOhTtgItMm83km
         9vsAnmj3el0tQo0TY1ruwGWcgVTO+1OVFwIXiZahVjWp1KnVk0DA7pdpAUvbv41ObjZN
         ntapD1w2UYh8DzrNTu6EMdsxulygorhg/zv4w3b66L1JzZXKMD4KbnRC+8criP5nsgu5
         wLeZ5dDBEvEIKdYcvwzqGL8jnvmUeS9gTe/7+9nIOe/26W2KmGAUWog8XrpGO2l1MvXO
         w/ikXOuDH1EfJ4fl0v16j4HvdHcHM6lLNkxgk0t9H5fX7qJvloyoysnmvnlfUZKl5rO6
         4yiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xaT2dcHZPdRJ0y4idc+VOXuKF4+lYQ1c3wtupWCa5lw=;
        b=MzpwN/IVrlHLWNlI0cbzKUM+QR6+0d3YkiQq3fXSHeniMaFodSrQtgRFT7hbggEzdb
         4v6QW7fMbes+zTa6AKLuTRNxqx8aTcm51+i+oTVXnlM5JSoA3O6xSZOC1PVoz/3dmvOj
         fqPPbNKTw99eVfTo+GM1/fPpmE5sX+GMnwkpHMhVU6As9XdJSBwkDRivUE5cMJ1ZNt7u
         wZ1XC+sF6lGWGSdIJrL2s1256TUNfuPQsLucOZTTRyOGZDLbDTpfkfsipqcOqZTdXAqi
         7Q3OsBQLsp7Gylz31rZLZevE0ZakI5X7EdDjOmYGxj5pBMtx1YuI42FPREg2/TMAvzW+
         lCKg==
X-Gm-Message-State: AOAM530wmeY/mc5h87OdFiS1J415/asMo2Ij1hAuSZ6iOt76MDbC6LLW
        kvu+h/iSVjWzofLwpXbeHq5rLMRAhoLgQQ==
X-Google-Smtp-Source: ABdhPJwbFdX9FL2YemiaSMI9/cbs6Jpg4yHjtWaPhHc4xRuVvJSfIVyI4sfsixU+kk04jRuT88Ygyw==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr18019473wmc.10.1610930086718;
        Sun, 17 Jan 2021 16:34:46 -0800 (PST)
Received: from valhalla.home ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id o124sm23642040wmb.5.2021.01.17.16.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 16:34:46 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v2 5/7] gpio: gpiolib-acpi: Export acpi_get_gpiod()
Date:   Mon, 18 Jan 2021 00:34:26 +0000
Message-Id: <20210118003428.568892-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118003428.568892-1-djrscally@gmail.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I need to be able to translate GPIO resources in an acpi_device's _CRS
into gpio_descs. Those are represented in _CRS as a pathname to a GPIO
device plus the pin's index number: this function is perfect for that
purpose.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	-None

 drivers/gpio/gpiolib-acpi.c | 3 ++-
 include/linux/acpi.h        | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index e37a57d0a2f0..83f9f85cd0ab 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -111,7 +111,7 @@ static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
  * controller does not have GPIO chip registered at the moment. This is to
  * support probe deferral.
  */
-static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
+struct gpio_desc *acpi_get_gpiod(char *path, int pin)
 {
 	struct gpio_chip *chip;
 	acpi_handle handle;
@@ -127,6 +127,7 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
 
 	return gpiochip_get_desc(chip, pin);
 }
+EXPORT_SYMBOL_GPL(acpi_get_gpiod);
 
 static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
 {
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 2630c2e953f7..5cd272326eb7 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1066,6 +1066,7 @@ void __acpi_handle_debug(struct _ddebug *descriptor, acpi_handle handle, const c
 bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
 				struct acpi_resource_gpio **agpio);
 int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index);
+struct gpio_desc *acpi_get_gpiod(char *path, int pin);
 #else
 static inline bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
 					      struct acpi_resource_gpio **agpio)
@@ -1076,6 +1077,10 @@ static inline int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 {
 	return -ENXIO;
 }
+struct gpio_desc *acpi_get_gpiod(char *path, int pin)
+{
+	return NULL;
+}
 #endif
 
 /* Device properties */
-- 
2.25.1

