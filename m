Return-Path: <linux-i2c+bounces-922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE1481AB46
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 00:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CA831F24820
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 23:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FC44B5DD;
	Wed, 20 Dec 2023 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFbvA5Xq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529EB4B5A1
	for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 23:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-35fcf7a999aso1945765ab.1
        for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 15:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116508; x=1703721308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4PHO7Jw/IWJrb0Mf1SLe4BFSupAlBrmRHdwYgRla00=;
        b=RFbvA5XqAwcl+y2f/yvdDqW4T70wVF4nPS/ukZQErT+rodUh9LH/azDIrv5siBKYnp
         0aIbFWPqjYZBjOWWydoyQTT7Y0ocsxLXC3J1rmZ6xebUMXDiUOYu3oKJRggCll2e6cJ7
         /zGPXZCH/b3SsQMO7NK639rk79lMl4Ao0Nd9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116508; x=1703721308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4PHO7Jw/IWJrb0Mf1SLe4BFSupAlBrmRHdwYgRla00=;
        b=oh5ZatJp1TNWLOWnLtyO8+Kbx3p5Co69NHrdNnYHQYXKFGUK+7vclk6X2cPPlQn5t2
         n6tBhBriuUGcMmD+kiN8glz/F4XdgbusgSDJiL8ztHRnEwpOCe9guo8Iy0OyoKJ/7R1+
         tH0VEZMND/CrLGA5lZYHnr0yMin1xHhf6T7Kz1ku8+Nj8RPe9WcBT4+ks+ItkkW4F3WM
         r+lyKJ5mDm9wPJsC+gqZPtDzQi9Zu/BBuPChHy2bYAiH0OUzjGAiIKU2fIrmpW9ELTM8
         Zt34zfUAQKZYAGtDSSZyDhD5h/JdhzlhaQsOkJ1gDD/dUqTi+Im75rTgM/J/p+8u5P1r
         U2rw==
X-Gm-Message-State: AOJu0Ywh7MHyefbrNouOpESP7IGEmOxyl3tMv7gIkwAzP1k4kciLfpLp
	xGsB04mIn2dhIkJVrs+0iIzqWjqbftZc
X-Google-Smtp-Source: AGHT+IH2lTPGo2WEeRiZiIJrzCSOk2a8rUTZziZgBwUnQ/vrtMNeRF1WZyCgr0C+c1ZFnu0ife2BGw==
X-Received: by 2002:a05:6e02:154d:b0:35d:59b3:2f87 with SMTP id j13-20020a056e02154d00b0035d59b32f87mr2865766ilu.28.1703116508461;
        Wed, 20 Dec 2023 15:55:08 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:08 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 01/22] gpiolib: acpi: Modify acpi_dev_irq_wake_get_by() to use resource
Date: Wed, 20 Dec 2023 16:54:15 -0700
Message-ID: <20231220165423.v2.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231220235459.2965548-1-markhas@chromium.org>
References: <20231220235459.2965548-1-markhas@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Other information besides wake capability can be provided about GPIO
IRQs such as triggering, polarity, and sharability. Use resource flags
to provide this information to the caller if they want it.

This should keep the API more robust over time as flags are added,
modified, or removed. It also more closely matches acpi_irq_get() which
take a resource as an argument.

Rename the function to acpi_dev_get_gpio_irq_resource() to better
describe the function's new behavior.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v2:
-Remove explicit cast to struct resource
-irq -> IRQ

 drivers/gpio/gpiolib-acpi.c | 25 ++++++++++++++++---------
 drivers/i2c/i2c-core-acpi.c | 10 ++++++++--
 include/linux/acpi.h        | 23 ++++++++++-------------
 3 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 88066826d8e5b..ef98b50f42f86 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -111,6 +111,7 @@ struct acpi_gpio_info {
 	int polarity;
 	int triggering;
 	bool wake_capable;
+	bool shareable;
 	unsigned int debounce;
 	unsigned int quirks;
 };
@@ -760,6 +761,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		lookup->info.debounce = agpio->debounce_timeout;
 		lookup->info.gpioint = gpioint;
 		lookup->info.wake_capable = acpi_gpio_irq_is_wake(&lookup->info.adev->dev, agpio);
+		lookup->info.shareable = agpio->shareable == ACPI_SHARED;
 
 		/*
 		 * Polarity and triggering are only specified for GpioInt
@@ -1004,11 +1006,11 @@ struct gpio_desc *acpi_find_gpio(struct fwnode_handle *fwnode,
 }
 
 /**
- * acpi_dev_gpio_irq_wake_get_by() - Find GpioInt and translate it to Linux IRQ number
+ * acpi_dev_get_gpio_irq_resource() - Find GpioInt and populate resource struct
  * @adev: pointer to a ACPI device to get IRQ from
  * @name: optional name of GpioInt resource
  * @index: index of GpioInt resource (starting from %0)
- * @wake_capable: Set to true if the IRQ is wake capable
+ * @r: pointer to resource to populate with IRQ information.
  *
  * If the device has one or more GpioInt resources, this function can be
  * used to translate from the GPIO offset in the resource to the Linux IRQ
@@ -1023,10 +1025,12 @@ struct gpio_desc *acpi_find_gpio(struct fwnode_handle *fwnode,
  * The GPIO is considered wake capable if the GpioInt resource specifies
  * SharedAndWake or ExclusiveAndWake.
  *
- * Return: Linux IRQ number (> %0) on success, negative errno on failure.
+ * IRQ number will be available in the resource structure.
+ *
+ * Return: 0 on success, negative errno on failure.
  */
-int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name, int index,
-				  bool *wake_capable)
+int acpi_dev_get_gpio_irq_resource(struct acpi_device *adev, const char *name, int index,
+				   struct resource *r)
 {
 	int idx, i;
 	unsigned int irq_flags;
@@ -1084,16 +1088,19 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name, in
 			}
 
 			/* avoid suspend issues with GPIOs when systems are using S3 */
-			if (wake_capable && acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0)
-				*wake_capable = info.wake_capable;
+			if (info.wake_capable && !(acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0))
+				info.wake_capable = false;
 
-			return irq;
+			*r = DEFINE_RES_IRQ(irq);
+			r->flags = acpi_dev_irq_flags(info.triggering, info.polarity,
+						      info.shareable, info.wake_capable);
+			return 0;
 		}
 
 	}
 	return -ENOENT;
 }
-EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_wake_get_by);
+EXPORT_SYMBOL_GPL(acpi_dev_get_gpio_irq_resource);
 
 static acpi_status
 acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index d6037a3286690..8126a87baf3d4 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -203,6 +203,7 @@ int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	struct list_head resource_list;
+	struct resource irqres;
 	struct i2c_acpi_irq_context irq_ctx = {
 		.irq = -ENOENT,
 	};
@@ -217,8 +218,13 @@ int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable)
 
 	acpi_dev_free_resource_list(&resource_list);
 
-	if (irq_ctx.irq == -ENOENT)
-		irq_ctx.irq = acpi_dev_gpio_irq_wake_get(adev, 0, &irq_ctx.wake_capable);
+	if (irq_ctx.irq == -ENOENT) {
+		ret = acpi_dev_get_gpio_irq_resource(adev, NULL, 0, &irqres);
+		if (ret)
+			return ret;
+		irq_ctx.irq = irqres.start;
+		irq_ctx.wake_capable = irqres.flags & IORESOURCE_IRQ_WAKECAPABLE;
+	}
 
 	if (irq_ctx.irq < 0)
 		return irq_ctx.irq;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 118a18b7ff844..83aa2fa8e81fc 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1221,8 +1221,8 @@ bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
 				struct acpi_resource_gpio **agpio);
 bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
 			       struct acpi_resource_gpio **agpio);
-int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name, int index,
-				  bool *wake_capable);
+int acpi_dev_get_gpio_irq_resource(struct acpi_device *adev, const char *name, int index,
+				   struct resource *r);
 #else
 static inline bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
 					      struct acpi_resource_gpio **agpio)
@@ -1234,28 +1234,25 @@ static inline bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
 {
 	return false;
 }
-static inline int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name,
-						int index, bool *wake_capable)
+static inline int acpi_dev_get_gpio_irq_resource(struct acpi_device *adev, const char *name,
+						 int index, struct resource *r)
 {
 	return -ENXIO;
 }
 #endif
 
-static inline int acpi_dev_gpio_irq_wake_get(struct acpi_device *adev, int index,
-					     bool *wake_capable)
+static inline int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int index)
 {
-	return acpi_dev_gpio_irq_wake_get_by(adev, NULL, index, wake_capable);
-}
+	struct resource r;
+	int ret;
 
-static inline int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name,
-					   int index)
-{
-	return acpi_dev_gpio_irq_wake_get_by(adev, name, index, NULL);
+	ret = acpi_dev_get_gpio_irq_resource(adev, name, index, &r);
+	return ret ?: r.start;
 }
 
 static inline int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 {
-	return acpi_dev_gpio_irq_wake_get_by(adev, NULL, index, NULL);
+	return acpi_dev_gpio_irq_get_by(adev, NULL, index);
 }
 
 /* Device properties */
-- 
2.43.0.472.g3155946c3a-goog


