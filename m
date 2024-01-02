Return-Path: <linux-i2c+bounces-1080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC38222EE
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 22:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76146284182
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 21:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325C0168DA;
	Tue,  2 Jan 2024 21:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pq2/3heP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128391643E
	for <linux-i2c@vger.kernel.org>; Tue,  2 Jan 2024 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b7fdde8b56so735386339f.1
        for <linux-i2c@vger.kernel.org>; Tue, 02 Jan 2024 13:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704229725; x=1704834525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDUs5YQEZsX9VnndGDbbu1yg628Gh+zaw5NO27kLhoY=;
        b=Pq2/3heP8p60zYEI/ughl50VZ2wrYs3fb63RiSNzKebkEBpr8uMQojlnVPuvRUgD3O
         ORV26BAfKYkHUHTPQRr1NoqTVKBpDarNE67YUGJfSqohVcH1gb32Pud25o4goHprmGSR
         zlhC+k6oZ4BbC2UXZNOQhwRVSgqlBn3wU1Cr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229725; x=1704834525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDUs5YQEZsX9VnndGDbbu1yg628Gh+zaw5NO27kLhoY=;
        b=YttOUyb0g3JyPN52WdvUK0IEYGy09DsDfXMSr1Ji6O5M22cAN0CfrqTXgGQg2b7tS7
         VVWg2Labt18MIhZYKVbRZLg7nfr3XeEqgi+QGDcjWpg9mnebxmM/V5FmEMXEaSKYjgMe
         xSqTYBn4ZilPuzRcWVjWCgxRfcPMNndE/3oroVHW+iUccHNY47Qvzm81JRuANBrAZWHE
         HLJPdNCJw+jQyhnWrwJ+OB6QDdhdK9q/Pe+2zZqMzg7k723DUNpCFnQE9DyCikbBtM5X
         sSjFbosyIl2NB9uuQ52Q1uivD/VtNVxkUTQfWtNYQNjpvxYN7TCLhqfH5mqoj4CJnpLJ
         OfQA==
X-Gm-Message-State: AOJu0YzR//SpHRBmRQwc0eMsf0zHL21xV1Gwpr862NRS/Su3hXjymNh8
	PXbks6BjTozMg7Ch2a7uNkjgsX0rfdCw
X-Google-Smtp-Source: AGHT+IGYIUO0A61FkChjUrlpzBke+K1PVXOJlWlrCX2qs2jyDxueR5mmbRYujQnh6Emex6rkxeuhRw==
X-Received: by 2002:a6b:7e0d:0:b0:7bb:d0a3:47b4 with SMTP id i13-20020a6b7e0d000000b007bbd0a347b4mr192538iom.19.1704229725292;
        Tue, 02 Jan 2024 13:08:45 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bo18-20020a056638439200b0046993034c91sm6956978jab.77.2024.01.02.13.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:08:45 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
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
Subject: [PATCH v4 02/24] gpiolib: acpi: Modify acpi_dev_irq_wake_get_by() to use resource
Date: Tue,  2 Jan 2024 14:07:26 -0700
Message-ID: <20240102140734.v4.2.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240102210820.2604667-1-markhas@chromium.org>
References: <20240102210820.2604667-1-markhas@chromium.org>
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

Changes in v4:
-DEFINES_RES_NAMED->DEFINE_RES_IRQ_NAMED_FLAGS
-Indent fix
-Initialize struct resource on stack
-Remove ioport.h dependency in acpi.h

Changes in v3:
-Use DEFINE_RES_NAMED macro
-Add acpi_gpio_info.shareable doc

Changes in v2:
-Remove explicit cast to struct resource
-irq -> IRQ

 drivers/gpio/gpiolib-acpi.c | 28 +++++++++++++++++++---------
 drivers/i2c/i2c-core-acpi.c | 10 ++++++++--
 include/linux/acpi.h        | 25 +++++++++++--------------
 3 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 88066826d8e5b..d14426c831187 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
+#include <linux/ioport.h>
 #include <linux/irq.h>
 #include <linux/mutex.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -99,6 +100,7 @@ struct acpi_gpio_chip {
  * @pin_config: pin bias as provided by ACPI
  * @polarity: interrupt polarity as provided by ACPI
  * @triggering: triggering type as provided by ACPI
+ * @shareable: share type as provided by ACPI (shared vs exclusive).
  * @wake_capable: wake capability as provided by ACPI
  * @debounce: debounce timeout as provided by ACPI
  * @quirks: Linux specific quirks as provided by struct acpi_gpio_mapping
@@ -111,6 +113,7 @@ struct acpi_gpio_info {
 	int polarity;
 	int triggering;
 	bool wake_capable;
+	bool shareable;
 	unsigned int debounce;
 	unsigned int quirks;
 };
@@ -760,6 +763,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		lookup->info.debounce = agpio->debounce_timeout;
 		lookup->info.gpioint = gpioint;
 		lookup->info.wake_capable = acpi_gpio_irq_is_wake(&lookup->info.adev->dev, agpio);
+		lookup->info.shareable = agpio->shareable == ACPI_SHARED;
 
 		/*
 		 * Polarity and triggering are only specified for GpioInt
@@ -1004,11 +1008,11 @@ struct gpio_desc *acpi_find_gpio(struct fwnode_handle *fwnode,
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
@@ -1023,10 +1027,12 @@ struct gpio_desc *acpi_find_gpio(struct fwnode_handle *fwnode,
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
@@ -1045,6 +1051,7 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name, in
 		if (info.gpioint && idx++ == index) {
 			unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 			enum gpiod_flags dflags = GPIOD_ASIS;
+			unsigned long res_flags;
 			char label[32];
 			int irq;
 
@@ -1084,16 +1091,19 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name, in
 			}
 
 			/* avoid suspend issues with GPIOs when systems are using S3 */
-			if (wake_capable && acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0)
-				*wake_capable = info.wake_capable;
+			if (info.wake_capable && !(acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0))
+				info.wake_capable = false;
 
-			return irq;
+			res_flags = acpi_dev_irq_flags(info.triggering, info.polarity,
+						       info.shareable, info.wake_capable);
+			*r = DEFINE_RES_IRQ_NAMED_FLAGS(irq, NULL, res_flags);
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
index b7165e52b3c68..a0cd733febe34 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -9,7 +9,6 @@
 #define _LINUX_ACPI_H
 
 #include <linux/errno.h>
-#include <linux/ioport.h>	/* for struct resource */
 #include <linux/resource_ext.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -17,6 +16,7 @@
 #include <linux/uuid.h>
 #include <linux/node.h>
 
+struct resource;
 struct irq_domain;
 struct irq_domain_ops;
 
@@ -1232,8 +1232,8 @@ bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
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
@@ -1245,28 +1245,25 @@ static inline bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
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
+	struct resource r = {};
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


