Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F91238B155
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 16:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243747AbhETON0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 10:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240755AbhETOMj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 10:12:39 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE702C061362;
        Thu, 20 May 2021 07:09:48 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id p7so14092887wru.10;
        Thu, 20 May 2021 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y1NjdOLHUQzHFymiFoDSQw2j72nXbqyPKvtTA9/f6Uc=;
        b=KIxRPaBeOTncTLOq/GzzgVaXLfRpMno2CKJ1r1XpsilyS2AJJviWYBO5ztuhIAyr5Q
         gWVB6i62yuxQ5ZvNdbfiNj0LHMPVmda0LEZQ3n+YH8T8MvT7Q8XtFXyUghqTcwrWIPCg
         kZ1z2oC/K0LYOvFSnUopnV0jJikHJupZFSFHLj/Pll097wX67gr8bdKt68LTztZhHP06
         xIHit+GUNRKaY+w1oGEJ8s1CHYuotQx1ugqs/UVneiEyKsNZcG/nrJvE9MTbJtE8p2Sp
         ThDo0t1VodfZvNHeEVYJ/e0RQw+67TQVvCu9YIr08H+2WI2Ss/11a5b5RwCvX1IuhE2G
         FL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y1NjdOLHUQzHFymiFoDSQw2j72nXbqyPKvtTA9/f6Uc=;
        b=Wo5Smw5nfTOad4ituoPqAqj2ZZSy5MFkkCijAm1fCogMrXJ6YUbyj2jAnk5r0MUhHS
         etTyEIVPTrl/nKGz/kQd8NPSB+MedOJLfB2e+6bl3DCm5QO7R/pm5TUXT6pC1c4xqNq+
         W1a/z0Z4LFcbnhyqxwmOfgbMbHLpn3E3tkUtKL+p84ZEA1U8MRC+D9/xPCkT9JdL5LMy
         KBtzSTAxo0FrXyYIuXSXXsDkmFl4XGlS1e6aG41sL9P8V1M3y8ktaQSOxnEk4Mt2gKLu
         oWmXnlkzaS1DtllS/wZWfLytoecEdS7IQsR7iqmYRlzfBc0jhISFYd2NwxGr1N/WjXCg
         mQPw==
X-Gm-Message-State: AOAM532h0gc7uuJX3JDbgtsU1pysEkw09SrerUBHQXg2qAFSbJXrb+KG
        FoqawY3Mw8CG8Fk7V+PxYbM=
X-Google-Smtp-Source: ABdhPJwqb6mUjLbwGH71A/chftV3nIElc651+4LMvdK9c4JnnAJNbEWUR2LV3QKWrSlgkLWlhC1iOQ==
X-Received: by 2002:adf:d231:: with SMTP id k17mr4426065wrh.78.1621519787548;
        Thu, 20 May 2021 07:09:47 -0700 (PDT)
Received: from valhalla.home ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id m6sm8411974wml.3.2021.05.20.07.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 07:09:47 -0700 (PDT)
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
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v4 6/8] gpiolib: acpi: Add acpi_gpio_get_io_resource()
Date:   Thu, 20 May 2021 15:09:26 +0100
Message-Id: <20210520140928.3252671-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210520140928.3252671-1-djrscally@gmail.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a function to verify that a given acpi_resource represents an IO
type GPIO resource, and return it if so.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v3:
	- Patch introduced

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

