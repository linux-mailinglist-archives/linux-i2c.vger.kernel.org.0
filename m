Return-Path: <linux-i2c+bounces-1081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3200E8222F1
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 22:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF33284292
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 21:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A545C171A8;
	Tue,  2 Jan 2024 21:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YKh0zhED"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCF1168B8
	for <linux-i2c@vger.kernel.org>; Tue,  2 Jan 2024 21:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7b7fbe3db16so507808639f.3
        for <linux-i2c@vger.kernel.org>; Tue, 02 Jan 2024 13:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704229726; x=1704834526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoCMzkIH2SpwplBXEvrmILCCJUolIXwuArK291Rg4jU=;
        b=YKh0zhEDmK54BHzoeo1B7L58bAiJbmnxlRLuDKlcG9MRRE9FrY0D6FPo5K7HnTp5ng
         lLAo7p5C7ZiDzRdyaMPC5jhfxvKXlrkcaeBZfKLFWXx6kcr+0/XelLpNJHEXjV3eiyjo
         slLK0pw0Je9fwJqgWh/23sJhKeXyso91DprWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229726; x=1704834526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoCMzkIH2SpwplBXEvrmILCCJUolIXwuArK291Rg4jU=;
        b=LQNSvxAKYyDk1YWo0pFSo1TFLQU6vxrgIaTgsVOGtsfzS172GvzcAtuLpXyTcF4hFu
         C6TKNdFczIAPkX876bw3qX0nmFSoS3XwGA5K6a9+fA4BdbkC9Up32zpEz/SbP1q/LyjZ
         KiUyHoZimgGbMq9YOBdDxeumhNle8nmzIJYsKuFhGx/sil+5SaUslR04j/nas1vKGGaJ
         uduB7dzB8hIFt1zPYGKmm/qF0ShX2w9CB2SW6w2k7kkwtD2WluKVW2+RMcIQd4UWxMFm
         fSL7GgBpxc+HcU1vOwljAJM6x9kge4nVWBnDOFZomir8zoQ+E48I5imMOv8Fbm7AQlT6
         8h1g==
X-Gm-Message-State: AOJu0YzRHexq9m/sBwDBYQWQ+iDj0u+FtX4cHqXgjk3ZaKmilF5R8RAk
	HwBG4YOZHBIiee4DUBDan99G+iNGlLFt
X-Google-Smtp-Source: AGHT+IHyW2JhwMXCAKVq1niGr8GJA1kMcgBCBAAnnHH0R6mCkxCxIMO5xnsrfrNzmrhhBaVXIKjATA==
X-Received: by 2002:a05:6602:683:b0:7bb:aa7e:6d1d with SMTP id dp3-20020a056602068300b007bbaa7e6d1dmr3857804iob.10.1704229726099;
        Tue, 02 Jan 2024 13:08:46 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bo18-20020a056638439200b0046993034c91sm6956978jab.77.2024.01.02.13.08.45
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
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v4 03/24] i2c: acpi: Modify i2c_acpi_get_irq() to use resource
Date: Tue,  2 Jan 2024 14:07:27 -0700
Message-ID: <20240102140734.v4.3.Ib65096357993ff602e7dd0000dd59a36571c48d8@changeid>
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

The i2c_acpi_irq_context structure provides redundant information that
can be provided with struct resource.

Refactor i2c_acpi_get_irq() to use struct resource instead of struct
i2c_acpi_irq_context.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v4:
-Use Andy's @linux.intel.com email
-Remove blank line in commit message
-More error handling refactoring in i2c_acpi_get_irq()
-Remove struct i2c_acpi_irq_context as it's unused

Changes in v3:
-Add Suggested-by
-Check resource flags for valid irq
-Drop error pointer check
-Invert error checking logic in i2c_acpi_get_irq()
-Drop redundant 0 in struct resource init
-Drop unnecessary check for irq > 0 when setting I2C_CLIENT_WAKE

Changes in v2:
-New patch

 drivers/i2c/i2c-core-acpi.c | 49 +++++++++++++------------------------
 drivers/i2c/i2c-core-base.c |  6 ++---
 drivers/i2c/i2c-core.h      |  4 +--
 3 files changed, 22 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 8126a87baf3d4..4c3df540c2f4b 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -137,11 +137,6 @@ static const struct acpi_device_id i2c_acpi_ignored_device_ids[] = {
 	{}
 };
 
-struct i2c_acpi_irq_context {
-	int irq;
-	bool wake_capable;
-};
-
 static int i2c_acpi_do_lookup(struct acpi_device *adev,
 			      struct i2c_acpi_lookup *lookup)
 {
@@ -175,64 +170,54 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
 
 static int i2c_acpi_add_irq_resource(struct acpi_resource *ares, void *data)
 {
-	struct i2c_acpi_irq_context *irq_ctx = data;
-	struct resource r;
+	struct resource *r = data;
 
-	if (irq_ctx->irq > 0)
+	if (r->flags)
 		return 1;
 
-	if (!acpi_dev_resource_interrupt(ares, 0, &r))
+	if (!acpi_dev_resource_interrupt(ares, 0, r))
 		return 1;
 
-	irq_ctx->irq = i2c_dev_irq_from_resources(&r, 1);
-	irq_ctx->wake_capable = r.flags & IORESOURCE_IRQ_WAKECAPABLE;
+	i2c_dev_irq_from_resources(r, 1);
 
 	return 1; /* No need to add resource to the list */
 }
 
 /**
- * i2c_acpi_get_irq - get device IRQ number from ACPI
+ * i2c_acpi_get_irq - get device IRQ number from ACPI and populate resource
  * @client: Pointer to the I2C client device
- * @wake_capable: Set to true if the IRQ is wake capable
+ * @r: resource with populated IRQ information
  *
  * Find the IRQ number used by a specific client device.
  *
  * Return: The IRQ number or an error code.
  */
-int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable)
+int i2c_acpi_get_irq(struct i2c_client *client, struct resource *r)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	struct list_head resource_list;
-	struct resource irqres;
-	struct i2c_acpi_irq_context irq_ctx = {
-		.irq = -ENOENT,
-	};
 	int ret;
 
+	if (!r)
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&resource_list);
 
 	ret = acpi_dev_get_resources(adev, &resource_list,
-				     i2c_acpi_add_irq_resource, &irq_ctx);
+				     i2c_acpi_add_irq_resource, r);
 	if (ret < 0)
 		return ret;
 
 	acpi_dev_free_resource_list(&resource_list);
 
-	if (irq_ctx.irq == -ENOENT) {
-		ret = acpi_dev_get_gpio_irq_resource(adev, NULL, 0, &irqres);
-		if (ret)
-			return ret;
-		irq_ctx.irq = irqres.start;
-		irq_ctx.wake_capable = irqres.flags & IORESOURCE_IRQ_WAKECAPABLE;
-	}
+	if (r->flags)
+		return r->start;
 
-	if (irq_ctx.irq < 0)
-		return irq_ctx.irq;
+	ret = acpi_dev_get_gpio_irq_resource(adev, NULL, 0, r);
+	if (ret)
+		return ret;
 
-	if (wake_capable)
-		*wake_capable = irq_ctx.wake_capable;
-
-	return irq_ctx.irq;
+	return r->start;
 }
 
 static int i2c_acpi_get_info(struct acpi_device *adev,
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 3bd48d4b6318f..0339c298ba50b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -513,10 +513,10 @@ static int i2c_device_probe(struct device *dev)
 			if (irq == -EINVAL || irq == -ENODATA)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
-			bool wake_capable;
+			struct resource r = {};
 
-			irq = i2c_acpi_get_irq(client, &wake_capable);
-			if (irq > 0 && wake_capable)
+			irq = i2c_acpi_get_irq(client, &r);
+			if (r.flags & IORESOURCE_IRQ_WAKECAPABLE)
 				client->flags |= I2C_CLIENT_WAKE;
 		}
 		if (irq == -EPROBE_DEFER) {
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 05b8b8dfa9bdd..b5dc559c49d11 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -61,11 +61,11 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
 #ifdef CONFIG_ACPI
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
 
-int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable);
+int i2c_acpi_get_irq(struct i2c_client *client, struct resource *r);
 #else /* CONFIG_ACPI */
 static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
 
-static inline int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable)
+static inline int i2c_acpi_get_irq(struct i2c_client *client, struct resource *r)
 {
 	return 0;
 }
-- 
2.43.0.472.g3155946c3a-goog


