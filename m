Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5AD38B154
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 16:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243757AbhETON1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 10:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239356AbhETOMj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 10:12:39 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D09C061360;
        Thu, 20 May 2021 07:09:46 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id j14so16089455wrq.5;
        Thu, 20 May 2021 07:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KDoc5xeYWeYU512Wm3d18mdOADpuvy7ld0OqNa7izfs=;
        b=BisTvPuF4Xk2mSdE5bIv/gwo9hRcuiQbs2gjplPiPe0+aURCkd8g5ddQulG0eLfIwT
         /FkKERmDOu6qQ4mwzf0HFSHxHafK/rFzBhPwTVeuif0u/IlR+fFglDbJGZkJ9i2moplY
         +bASBUvQ0jO3iO1iA7WHSKU2sZQn0cNOaGtJyscw2LoULIozDXY0G1sfPLzI7pZiL+/9
         oPMoQR6xQhhhw1HSMgNWkOYFxl018A8rTjvjfwkUeMcQCgBtusMSXJZ+haMfG0iUVQE2
         4dsv40SMZf3dXutpohAs0o+LNrF/UbLRZ1ozgCl9+7UmAlzcASkIKYqXI/Q3BuObQcG2
         uZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KDoc5xeYWeYU512Wm3d18mdOADpuvy7ld0OqNa7izfs=;
        b=W5vqVfy2/7VsTWhz2om8+GiJYIbSWkKQzBAw9tX0vT11FlvuZV5Gv6VLgMgUiNX7hx
         Asjo32oGwf1mzHE4u1BYEnmfk4ByKTPMnfXH17jmB715kZi/PpiyRqMGmaxIORl6NzBE
         uZg29QlBCTvgb5S9YuPQUPO3zqM6LzMSF1ljwPBT3PoUozl5jFpCji9ZeE9cC0BF8jvL
         i0tDb1FxO0TVoWZ151sJdTHwKyUixvrGwmkv9R1Ee3fms0gWRqvMWaIiAfLsA9zaQRXE
         U0Z8jO8GqIgTTqCnPDR12fYHB8NGzQ0CaF0jh3YNkl5Yb9c+OjNACLmH/6dtSex3e+xX
         wyyg==
X-Gm-Message-State: AOAM532EKM3u4+ob6X0Iqi7LzdkTpvUFtFGrACD8SFu92K6yMijU9NPM
        tiMBc9hHU5wMndDs0rylMZQ=
X-Google-Smtp-Source: ABdhPJxA2TbO813ryCP8bj191enw1wM7kxjE/0km1fqqMpYb8222YuAkdkbYQKcuug/tVCPHtfDGpg==
X-Received: by 2002:adf:9d8c:: with SMTP id p12mr4625583wre.310.1621519785265;
        Thu, 20 May 2021 07:09:45 -0700 (PDT)
Received: from valhalla.home ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id m6sm8411974wml.3.2021.05.20.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 07:09:44 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 4/8] gpiolib: acpi: Export acpi_get_gpiod()
Date:   Thu, 20 May 2021 15:09:24 +0100
Message-Id: <20210520140928.3252671-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210520140928.3252671-1-djrscally@gmail.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
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
Changes since v3:

	- Renamed function to acpi_get_and_request_gpiod() - and no longer
	renaming acpi_get_gpiod()

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

