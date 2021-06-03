Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D96A39AE33
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 00:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhFCWmY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 18:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhFCWmY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Jun 2021 18:42:24 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CF0C06174A;
        Thu,  3 Jun 2021 15:40:26 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id b145-20020a1c80970000b029019c8c824054so6767140wmd.5;
        Thu, 03 Jun 2021 15:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9bSfSMQxktukE2bkFT53oq75scSeKdwwSpf8Uvj1M/U=;
        b=MzlWxnd2BvsZFZ8024ZTALS1je1zPZkCqP70AnL0JswJnOjzEdugOeY1JH0peylslc
         tv9T/QyHwC9P9iK4XUr82xk/b2oyJPCELFhgo0zLVhglRQZXx0wSicmbdXWOaQlgYw1s
         w5BaReBCQRkit6RDLLnIu7ivwaFf07rAUmUIwYqWKBQtS8ZyoV+EWLctY/tZNo5MeJv3
         SlZtjRMV4AVMqJr/sCkUMqwItrpIZR8Zh3mij9zIbcbuIYPAtKl5L62obxtrTLhS2CeB
         knHgCyCOPe0nitYiuavZhJAVnhGDD7NHgn9eiZyJ+vqOWVR1P2rLEjsjp1wNiG1Gq8Yn
         joeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9bSfSMQxktukE2bkFT53oq75scSeKdwwSpf8Uvj1M/U=;
        b=VoV2KQQ+02+caT8ub9/+oM8mVVl+YhVyCYW9wphl4bpJ4KHl77+nG2hiWsO1luyrXO
         cn53l32r8ae5ahdq4j4JaiWdtMlPNHYeMZYLAsmjnhr22iT0K1Y8Bhnmd569rmUCYngE
         N21FzKvtL9QbQHPi/9o9J++dpyEZEdqS2JiGSqmOpGf2v26FdPDfHre0HYlPyxDqA7BU
         l2dU0G67GjiEq9DnmwAe9wW9RVhM/9AfyDidjR9ho1tmSjQPhym3s6H2AUQ19FyhOZuR
         x9g0rpVxG/FJN7QzwgxpJJUgtXwuFIAT4AG9CDGjUx6KUiL0B79X2Uew5tCq1T5JoM5F
         3Pfw==
X-Gm-Message-State: AOAM530UI3zyQQB2ZWDACzDtoPXETfTXspAjIn+5VeNZVNIgUkcpFdyP
        4QLfaAtZ4+CZVCcQxw0rxHM=
X-Google-Smtp-Source: ABdhPJwSTyy/UEJQ5uIrxum+kq4DojYedsdQto1Q/RdQRtly0MAoQIPvCRI7CPKWSvqg6p6/oJRYKw==
X-Received: by 2002:a05:600c:2194:: with SMTP id e20mr557589wme.173.1622760024967;
        Thu, 03 Jun 2021 15:40:24 -0700 (PDT)
Received: from valhalla.home ([91.110.88.218])
        by smtp.gmail.com with ESMTPSA id f14sm4612103wry.40.2021.06.03.15.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:40:24 -0700 (PDT)
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
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v5 4/6] gpiolib: acpi: Add acpi_gpio_get_io_resource()
Date:   Thu,  3 Jun 2021 23:40:05 +0100
Message-Id: <20210603224007.120560-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603224007.120560-1-djrscally@gmail.com>
References: <20210603224007.120560-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a function to verify that a given acpi_resource represents an IO
type GPIO resource, and return it if so.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v4:
	- None

 drivers/gpio/gpiolib-acpi.c | 23 +++++++++++++++++++++++
 include/linux/acpi.h        |  7 +++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 684ddb35d83b..9887bb684575 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -196,6 +196,29 @@ bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
 }
 EXPORT_SYMBOL_GPL(acpi_gpio_get_irq_resource);
 
+/**
+ * acpi_gpio_get_io_resource - Fetch details of an ACPI resource if it is a GPIO
+ *			       I/O resource or return False if not.
+ * @ares:	Pointer to the ACPI resource to fetch
+ * @agpio:	Pointer to a &struct acpi_resource_gpio to store the output pointer
+ */
+bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
+			       struct acpi_resource_gpio **agpio)
+{
+	struct acpi_resource_gpio *gpio;
+
+	if (ares->type != ACPI_RESOURCE_TYPE_GPIO)
+		return false;
+
+	gpio = &ares->data.gpio;
+	if (gpio->connection_type != ACPI_RESOURCE_GPIO_TYPE_IO)
+		return false;
+
+	*agpio = gpio;
+	return true;
+}
+EXPORT_SYMBOL_GPL(acpi_gpio_get_io_resource);
+
 static void acpi_gpiochip_request_irq(struct acpi_gpio_chip *acpi_gpio,
 				      struct acpi_gpio_event *event)
 {
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 170b9bebdb2b..e8ba7063c000 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1098,6 +1098,8 @@ void __acpi_handle_debug(struct _ddebug *descriptor, acpi_handle handle, const c
 #if defined(CONFIG_ACPI) && defined(CONFIG_GPIOLIB)
 bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
 				struct acpi_resource_gpio **agpio);
+bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
+			       struct acpi_resource_gpio **agpio);
 int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int index);
 #else
 static inline bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
@@ -1105,6 +1107,11 @@ static inline bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
 {
 	return false;
 }
+static inline bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
+					     struct acpi_resource_gpio **agpio)
+{
+	return false;
+}
 static inline int acpi_dev_gpio_irq_get_by(struct acpi_device *adev,
 					   const char *name, int index)
 {
-- 
2.25.1

