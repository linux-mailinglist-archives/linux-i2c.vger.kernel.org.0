Return-Path: <linux-i2c+bounces-1004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 833AF81E939
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 20:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEB611F220B6
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 19:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC8E23C9;
	Tue, 26 Dec 2023 19:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lvB4bEwh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54614C92
	for <linux-i2c@vger.kernel.org>; Tue, 26 Dec 2023 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-35fe756e8dfso6891895ab.1
        for <linux-i2c@vger.kernel.org>; Tue, 26 Dec 2023 11:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703618524; x=1704223324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWSLh74Sjb1tnv40s7SuHViSbHQs5lvDO8AcO/YGKCU=;
        b=lvB4bEwh8SzCjHd25S6XOlpwpVCpAz8icWVBXvruNofgp/9Zz42hlBEogjopzaeH1D
         MJLKuLZoVAf1Bf3sU9YeaoI4jcx0/tbgBLIaJ9BKh+7VSCtMBCtasXDp8VlBqesCk4ZW
         7upaiqdH4jiySA5UnJ687sjvAbGn5mVgQij1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703618524; x=1704223324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWSLh74Sjb1tnv40s7SuHViSbHQs5lvDO8AcO/YGKCU=;
        b=vzNOFFPwV+CKkHyxzDNeb1vHe1thTFirsE4BNuYIIYut2zC0GcxToSRJ97agf14J3j
         FS/asBN/ILFgeCUzNZzsp7fojpqG71Zd3hDQF5Ppb5wmaToP9siDKE5+81CH3ygaC/d/
         qutctaPCWt0lrVaG/wa3pyZ1SetHQTDn6UfxKQTcG3trQ3cyS9KwjtTxH0h/7ovA7GUS
         T61tQ0iQJt148ATXrIoLt7Yyiere/sm6xpPb/jdLstvdRRjazqeJNMWxn1kdHgo62HUh
         xt4UgelJ1nQq0Ss59S3gzVi/XJvTXvpC/YNliJERI1Cv1t2AhKqwnrRsCRv8G4kw12oB
         1wbw==
X-Gm-Message-State: AOJu0YyYSwlNwnz+7GmIDZoJGdQpHfS5gNAt/yfn9LhmXa3+ZrQCW6di
	GjI0haXUEiljsEo7hlNACz/NXwF9oyCy
X-Google-Smtp-Source: AGHT+IGDCtaOFBQfliLMWuw+Bp0lLVTZeCWzg9u2yDUWIqDNp8kfxPkAF10al2bkUVOApEziXN9uEA==
X-Received: by 2002:a05:6e02:144a:b0:360:193:f434 with SMTP id p10-20020a056e02144a00b003600193f434mr1829834ilo.28.1703618523868;
        Tue, 26 Dec 2023 11:22:03 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id gw3-20020a0566381ee300b0046b692e719esm3207609jab.150.2023.12.26.11.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 11:22:03 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
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
Subject: [PATCH v3 02/24] gpiolib: acpi: Modify acpi_dev_irq_wake_get_by() to use resource
Date: Tue, 26 Dec 2023 12:21:06 -0700
Message-ID: <20231226122113.v3.2.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231226192149.1830592-1-markhas@chromium.org>
References: <20231226192149.1830592-1-markhas@chromium.org>
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

Changes in v3:
-Use DEFINE_RES_NAMED macro
-Add acpi_gpio_info.shareable doc

Changes in v2:
-Remove explicit cast to struct resource
-irq -> IRQ

 drivers/gpio/gpiolib-acpi.c | 27 ++++++++++++++++++---------
 drivers/i2c/i2c-core-acpi.c | 10 ++++++++--
 include/linux/acpi.h        | 23 ++++++++++-------------
 3 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 88066826d8e5b..24232534a9cdf 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -99,6 +99,7 @@ struct acpi_gpio_chip {
  * @pin_config: pin bias as provided by ACPI
  * @polarity: interrupt polarity as provided by ACPI
  * @triggering: triggering type as provided by ACPI
+ * @shareable: share type as provided by ACPI (shared vs exclusive).
  * @wake_capable: wake capability as provided by ACPI
  * @debounce: debounce timeout as provided by ACPI
  * @quirks: Linux specific quirks as provided by struct acpi_gpio_mapping
@@ -111,6 +112,7 @@ struct acpi_gpio_info {
 	int polarity;
 	int triggering;
 	bool wake_capable;
+	bool shareable;
 	unsigned int debounce;
 	unsigned int quirks;
 };
@@ -760,6 +762,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		lookup->info.debounce = agpio->debounce_timeout;
 		lookup->info.gpioint = gpioint;
 		lookup->info.wake_capable = acpi_gpio_irq_is_wake(&lookup->info.adev->dev, agpio);
+		lookup->info.shareable = agpio->shareable == ACPI_SHARED;
 
 		/*
 		 * Polarity and triggering are only specified for GpioInt
@@ -1004,11 +1007,11 @@ struct gpio_desc *acpi_find_gpio(struct fwnode_handle *fwnode,
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
@@ -1023,10 +1026,12 @@ struct gpio_desc *acpi_find_gpio(struct fwnode_handle *fwnode,
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
@@ -1045,6 +1050,7 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name, in
 		if (info.gpioint && idx++ == index) {
 			unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 			enum gpiod_flags dflags = GPIOD_ASIS;
+			unsigned long res_flags;
 			char label[32];
 			int irq;
 
@@ -1084,16 +1090,19 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name, in
 			}
 
 			/* avoid suspend issues with GPIOs when systems are using S3 */
-			if (wake_capable && acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0)
-				*wake_capable = info.wake_capable;
+			if (info.wake_capable && !(acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0))
+				info.wake_capable = false;
 
-			return irq;
+			res_flags = acpi_dev_irq_flags(info.triggering, info.polarity,
+							   info.shareable, info.wake_capable);
+			*r = DEFINE_RES_NAMED(irq, 1, NULL, res_flags);
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


