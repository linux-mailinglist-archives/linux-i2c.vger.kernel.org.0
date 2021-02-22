Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808B832181E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhBVNKs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhBVNIm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 08:08:42 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363FCC06178C;
        Mon, 22 Feb 2021 05:07:55 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id f137so329162wmf.3;
        Mon, 22 Feb 2021 05:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dbElsHfI9FiCGYMopDy9JUfpf6k+IONRCYc0n0ZtrWA=;
        b=LwEKG0enAUfqY9PBkbdb/b3D8cJPvPv1lV2DjHQtdkyYnkgDv2Mbxl9enjdZBx8Zyn
         fSDgl6g+cFr7aLYE2pyNyhMcvOv8yjkL0So0O60jkVZSAbpmqn0+yjdNFsc5guDSL4pB
         yQUNC+K4ouWatXruXhewIDcX2qKx833jCSfk162U87Km3/mGEtu0zF9uaNARcC3YyQqc
         GHWv+rfd57Qf1mDvjVfTWs0IUZZO+nEeEVOqIakqe880753TEsXPlowtiCnzTJIRKRIN
         yGvCcT9qtvrlQfwF0v15uA2k1cPA+hYXL/d5lQs03htQ8w+3RA+b+R6yfVS4vTNFTsPC
         J4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dbElsHfI9FiCGYMopDy9JUfpf6k+IONRCYc0n0ZtrWA=;
        b=KvS2VCJwncRiVAEF11VC2VR9o5Iyz/gtIlTAGNJ74UvZxAIkANq0VxguJ2ZHXzZ+PM
         YurtI+DYMut/g0FMJTk0976uq/1kw/qb3iFxy0Dyfbbbvq4Z6WPwzK4r8loDHSGX1fUY
         c94pFit19cZ6Uh5sr7YqWDOaurP03ZKXlxJPQYqvWxyMGFGOiiU5ttwfCo8ZEnFAhu2z
         zedwn0Jkzoler8cWKKdSnKPZREcGQ9enSL1xmypSbUcIHX05Z9s4hLgukWGwcqihJdnB
         oMS3JAUNUIZDtV78mzku6MYs1zwjdQfRlzm7UT2x8veli9FmaHJl/YsHxlwBdtPznvsC
         m/XA==
X-Gm-Message-State: AOAM530VkCFNyHs8HGjwWw4W1WTcvi5OcY4U1t5MhO6fFDTW6cY7gusk
        gPw5ct2St/57RYzXqrvsVqU=
X-Google-Smtp-Source: ABdhPJzrItRfPJkLeW/1fi5l1p4tXzhQigxb1aiRSDd23CDcF6k2V8cYpG4tvuBLUqTNN66a2kN0Dw==
X-Received: by 2002:a7b:cc1a:: with SMTP id f26mr9915956wmh.19.1613999273965;
        Mon, 22 Feb 2021 05:07:53 -0800 (PST)
Received: from valhalla.home ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id t198sm26575828wmt.7.2021.02.22.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 05:07:53 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     tfiga@chromium.org, sakari.ailus@linux.intel.com,
        rajmohan.mani@intel.com, rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org
Cc:     andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        mgross@linux.intel.com, luzmaximilian@gmail.com,
        robert.moore@intel.com, erik.kaneda@intel.com, me@fabwu.ch,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Subject: [PATCH v3 4/6] gpiolib: acpi: Export acpi_get_gpiod()
Date:   Mon, 22 Feb 2021 13:07:33 +0000
Message-Id: <20210222130735.1313443-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222130735.1313443-1-djrscally@gmail.com>
References: <20210222130735.1313443-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I need to be able to translate GPIO resources in an ACPI device's _CRS
into GPIO descriptor array. Those are represented in _CRS as a pathname
to a GPIO device plus the pin's index number: this function is perfect
for that purpose.

As it's currently only used internally within the GPIO layer, provide and
export a wrapper function that additionally holds a reference to the GPIO
device.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- Having realised that it wasn't taking a reference to the GPIO device,
	  I decided the best thing to do was leave the existing function as-is
	  (apart from renaming) and provide a wrapper that simply passes
	  through to the original and takes a reference before returning the
	  struct gpio_desc

	  Because of the change to that functionality, I dropped the R-b's from
	  the last version.

 drivers/gpio/gpiolib-acpi.c   | 36 +++++++++++++++++++++++++++++++----
 include/linux/gpio/consumer.h |  7 +++++++
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index e4d728fda982..0cc7cc327757 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -102,7 +102,8 @@ static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
 }
 
 /**
- * acpi_get_gpiod() - Translate ACPI GPIO pin to GPIO descriptor usable with GPIO API
+ * __acpi_get_gpiod() - Translate ACPI GPIO pin to GPIO descriptor usable with
+ *			GPIO API
  * @path:	ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
  * @pin:	ACPI GPIO pin number (0-based, controller-relative)
  *
@@ -111,7 +112,7 @@ static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
  * controller does not have GPIO chip registered at the moment. This is to
  * support probe deferral.
  */
-static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
+static struct gpio_desc *__acpi_get_gpiod(char *path, int pin)
 {
 	struct gpio_chip *chip;
 	acpi_handle handle;
@@ -128,6 +129,33 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
 	return gpiochip_get_desc(chip, pin);
 }
 
+/**
+ * acpi_get_gpiod() - Translate ACPI GPIO pin to GPIO descriptor usable with
+ *		      GPIO API, and hold a refcount to the GPIO device.
+ * @path:	ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
+ * @pin:	ACPI GPIO pin number (0-based, controller-relative)
+ * @label:	Label to pass to gpiod_request()
+ *
+ * This function is a simple pass-through to __acpi_get_gpiod(), except that as
+ * it is intended for use outside of the GPIO layer (in a similar fashion to
+ * gpiod_get_index() for example) it also holds a reference to the GPIO device.
+ */
+struct gpio_desc *acpi_get_gpiod(char *path, int pin, char *label)
+{
+	struct gpio_desc *gpio = __acpi_get_gpiod(path, pin);
+	int ret;
+
+	if (IS_ERR(gpio))
+		return gpio;
+
+	ret = gpiod_request(gpio, label);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return gpio;
+}
+EXPORT_SYMBOL_GPL(acpi_get_gpiod);
+
 static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
 {
 	struct acpi_gpio_event *event = data;
@@ -689,8 +717,8 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		if (pin_index >= agpio->pin_table_length)
 			return 1;
 
-		lookup->desc = acpi_get_gpiod(agpio->resource_source.string_ptr,
-					      agpio->pin_table[pin_index]);
+		lookup->desc = __acpi_get_gpiod(agpio->resource_source.string_ptr,
+						agpio->pin_table[pin_index]);
 		lookup->info.pin_config = agpio->pin_config;
 		lookup->info.debounce = agpio->debounce_timeout;
 		lookup->info.gpioint = gpioint;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index ef49307611d2..6eee751f44dd 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -690,6 +690,8 @@ int devm_acpi_dev_add_driver_gpios(struct device *dev,
 				   const struct acpi_gpio_mapping *gpios);
 void devm_acpi_dev_remove_driver_gpios(struct device *dev);
 
+struct gpio_desc *acpi_get_gpiod(char *path, int pin, char *label);
+
 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
 struct acpi_device;
@@ -708,6 +710,11 @@ static inline int devm_acpi_dev_add_driver_gpios(struct device *dev,
 }
 static inline void devm_acpi_dev_remove_driver_gpios(struct device *dev) {}
 
+struct gpio_desc *acpi_get_gpiod(char *path, int pin, char *label)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
 
-- 
2.25.1

