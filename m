Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2001F39AE4E
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 00:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhFCWn0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 18:43:26 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:42708 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhFCWn0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Jun 2021 18:43:26 -0400
Received: by mail-wr1-f43.google.com with SMTP id c5so7337648wrq.9;
        Thu, 03 Jun 2021 15:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kmp6dSBMRLiq8EO1sTf6qChRpauTe2dmrjHETj38s2U=;
        b=Q1tjpkAdYyR3Hk2RMnBthVZMhmaIQZ4b0k87Z3jNPTj+44FOAZRytw2yyZpmFnWlaW
         cXp610ctBOV7CBq/ueEGdhM01CbNo3SARSU/8VnnJwheRDRpQn8dnJ0UEzVOKLcSKuqe
         TiU/Q6G6YO9XGRZ0PSlqCmARuFzCE/sbI/vTUwRyVRvbc/6IH+MISv39zHItESdH+ZDG
         9ToXHQB8vQi1V9XQ/9NYFXA9zPvV+zhdq3NiEaE7yMItpS7Fv8hbcwkXeGuW//MrOdWr
         V7OcP9dQat4tTLOtEMT+KLclIWTizuLx/h274rT7iKIralGYKdY1tu0FVzAEP/6zQpof
         wqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kmp6dSBMRLiq8EO1sTf6qChRpauTe2dmrjHETj38s2U=;
        b=IrCg4ViJc6WJ57RwOXbYoeGMLDhH/ihxbzR7mh+hxtAIvQ71HbpdsnfvX39Nb39eHS
         Qhn++earBwM1pLv5TXwKw77Zcnr3qTYNqiL14X9ctvUWZpHB0JYpjp/GTsvP6vwvBQFJ
         Nx+B3PgmadYqVO66IsFuHO+Ac8U123WJhF2ehBDIcH2qIgBo2rNtLPbICDwCtXT56eI1
         dMnlTFx3HEjOwUpCiJCETnKwSRZu8n6Djj7zg6Fmm0Ker5vDSTk7d+ZvzirOZxWCo6yW
         tNHO8nbilDr3s0aj0YXzyx4JWKOmKKcSisWoaZqlX17c0bJmvCdVb5RZWbWm7CYha0u8
         Xfiw==
X-Gm-Message-State: AOAM531DgyVHkU/RSki4X91XRhmSEut0ebPsRto15eFhzqPdYVY/Ot4c
        k3ZblyweEQO8t+eBE89JNt8=
X-Google-Smtp-Source: ABdhPJyoBD+gzNGPlwurXFCGJJQgxkpRtARpcMsaH2I3nIg+SviaNB4pCapmAZM/YGd+mHUMvU/FPA==
X-Received: by 2002:a5d:664c:: with SMTP id f12mr659229wrw.206.1622760023745;
        Thu, 03 Jun 2021 15:40:23 -0700 (PDT)
Received: from valhalla.home ([91.110.88.218])
        by smtp.gmail.com with ESMTPSA id f14sm4612103wry.40.2021.06.03.15.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:40:23 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v5 3/6] gpiolib: acpi: Export acpi_get_gpiod()
Date:   Thu,  3 Jun 2021 23:40:04 +0100
Message-Id: <20210603224007.120560-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603224007.120560-1-djrscally@gmail.com>
References: <20210603224007.120560-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We need to be able to translate GPIO resources in an ACPI device's _CRS
into GPIO descriptor array. Those are represented in _CRS as a pathname
to a GPIO device plus the pin's index number: the acpi_get_gpiod()
function is perfect for that purpose.

As it's currently only used internally within the GPIO layer, provide and
export a wrapper function that additionally holds a reference to the GPIO
device.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v4:
	- None

 drivers/gpio/gpiolib-acpi.c   | 28 ++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 5b4111e4be3f..684ddb35d83b 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -128,6 +128,34 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
 	return gpiochip_get_desc(chip, pin);
 }
 
+/**
+ * acpi_get_and_request_gpiod() - Translate ACPI GPIO pin to GPIO descriptor
+ *                               and hold a refcount to the GPIO device.
+ * @path:      ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
+ * @pin:       ACPI GPIO pin number (0-based, controller-relative)
+ * @label:     Label to pass to gpiod_request()
+ *
+ * This function is a simple pass-through to acpi_get_gpiod(), except that
+ * as it is intended for use outside of the GPIO layer (in a similar fashion to
+ * gpiod_get_index() for example) it also holds a reference to the GPIO device.
+ */
+struct gpio_desc *acpi_get_and_request_gpiod(char *path, int pin, char *label)
+{
+	struct gpio_desc *gpio;
+	int ret;
+
+	gpio = acpi_get_gpiod(path, pin);
+	if (IS_ERR(gpio))
+		return gpio;
+
+	ret = gpiod_request(gpio, label);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return gpio;
+}
+EXPORT_SYMBOL_GPL(acpi_get_and_request_gpiod);
+
 static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
 {
 	struct acpi_gpio_event *event = data;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index c73b25bc9213..566feb56601f 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -692,6 +692,8 @@ int devm_acpi_dev_add_driver_gpios(struct device *dev,
 				   const struct acpi_gpio_mapping *gpios);
 void devm_acpi_dev_remove_driver_gpios(struct device *dev);
 
+struct gpio_desc *acpi_get_and_request_gpiod(char *path, int pin, char *label);
+
 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
 struct acpi_device;
-- 
2.25.1

