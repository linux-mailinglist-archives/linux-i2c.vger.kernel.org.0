Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBC82C857C
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgK3Nd4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:33:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgK3Ndz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:55 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDABEC061A54;
        Mon, 30 Nov 2020 05:32:19 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id l1so16212740wrb.9;
        Mon, 30 Nov 2020 05:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=89ez14xq7f3eSpkmNmdtRshRAe/5L4lRl0ct9tMiZwI=;
        b=KrwSbRpkuu4BSm67PVspA3L973/nhfUNUj1LnrJbs+oClFQV1BrpYP88f3Tzyy/pWk
         S5NBRj2mZaoNXTpLnnYfPH2CZwHqnzwC5dKJDBGXb4TU0KmS/aKJ77BBi60vVxoBkE4N
         8RpohPYtH2vluyjhc+Czpsk+ut8KuwuqdbRQtvfHmgxhKGWlUoioGMDYIX25ylVdkchX
         ujLCdCYhd56UKF876AjE7xWErdGerktBRLDrcIicF1Bp5afBX+CIRrMiJBLKbXLMr2vb
         zkNdXUQzblbe0w7rYpZexs7Nn+MLgLASnrmLhDzDYmZYOHd0eRBoBtddZn0RuBZ627fr
         hClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89ez14xq7f3eSpkmNmdtRshRAe/5L4lRl0ct9tMiZwI=;
        b=P+KNA+iNxTOCERFUWXtkeiZknXY9xtituPGXlRhMA0OUsiw3ROmbQLCmsp/Mud8+ww
         yOV8+YmL9/2QwEIOtZPA46c3IZcC+klhanUepZY6vIghneOcM+6dhgj9GTJ8yF3bfsi9
         zrB6I6mLc8Q3uUAyjdgGbsErMuM1o/6iiF7MTdxFWSpVK9zRtGhHlGjXfnj6+zlmNDor
         9CA+SzKmyzxCATYj75vNH2mNVdqXc08iUWX7sSGbGoncPC7K4MZM+KTB2hU/lQz5O1oB
         Xbwif+FyOAJJSsafXmxpGEKms1TyICVkTwJnZn2xN15xoDKKfsSzLVbxZwf6oDwum04w
         fuxw==
X-Gm-Message-State: AOAM531lL9P8Hj8yVl4eNby1VYZIvAJDm2oQSJK2od5kRpWi2DRsACPj
        efC+DhVgsoK53HEkKSVzhED/eUoqm8eij7ba
X-Google-Smtp-Source: ABdhPJzBAM0ozhvZLf9maCK2gtBJuXaIs+4FGjkWJeME4XV8dzgsQK5BHE8ux3fhzPVaBH11vNi02Q==
X-Received: by 2002:adf:c452:: with SMTP id a18mr28980463wrg.189.1606743138401;
        Mon, 30 Nov 2020 05:32:18 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:17 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: [PATCH 17/18] gpio: gpiolib-acpi: Export acpi_get_gpiod()
Date:   Mon, 30 Nov 2020 13:31:28 +0000
Message-Id: <20201130133129.1024662-18-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
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
Changes since RFC v3:

	- Patch introduced

 drivers/gpio/gpiolib-acpi.c | 3 ++-
 include/linux/acpi.h        | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 834a12f3219e..cfadbc263475 100644
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
index 39263c6b52e1..737115a93138 100644
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

