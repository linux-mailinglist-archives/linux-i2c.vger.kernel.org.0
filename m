Return-Path: <linux-i2c+bounces-923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED581AB49
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 00:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AC051C23576
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 23:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9E24B5A1;
	Wed, 20 Dec 2023 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bQ/OcYOU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170764B5B4
	for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 23:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7b7fdde8b54so8825739f.1
        for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 15:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116509; x=1703721309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o+KKmDTnImF1c7hrNdqiBoZEXBQ6geLnhMdio5wPuY=;
        b=bQ/OcYOU42ClsodC12+3G1i/51oibHkhqKyPVpnJP9AE81z80dDb8HxVcq7mr0fFQz
         cNDhMqlhOjBPL0IhF5IvOyhw/8r7H+dTrI7B84YwoDkl5iBjV4tzSbpxzRxUdm/2l/t3
         evVRJSj4/k5XQSAp+y3QNlzuKbHlfshj8NnmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116509; x=1703721309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/o+KKmDTnImF1c7hrNdqiBoZEXBQ6geLnhMdio5wPuY=;
        b=Xc5xC4L42oY11J74BOMTHLxF/RrF6sy1eNHTRap9kY6sdtHZytRD20PacWDTWQc1eE
         Z+DrvWq/FHKN+YeUbsetQXr8LLFIlp+I2pUQeofioN1CM9Q9LHCgMX/RUxh3CTL5ufgl
         mJFltRjRyRM37NRe9I3KY8aMjyiz+PJuV4gHHlBnfP132OokW3UGXZup0MgmONSZgCIV
         lLGt73zBo6iFs5ot6naBw2aTjQOgzvqDcE35+tSHC3GNav7XKUPznEBIX3fvgZ/YlkDR
         yhjz2JzV+wMhr1JkwS5UepuXqhEARWONkAeo3W2s/VQE1Vd5+jbnIPxz0cz4wW0HhcsH
         qeOA==
X-Gm-Message-State: AOJu0Yywsi6Ll5MMDpg6mjydnlRyQnZR/U7zeGxDhnfDIlU/ls86Y1cw
	KFJEVbWPjl37sZ601mx2xbJT1g==
X-Google-Smtp-Source: AGHT+IEGXHfpiQL4Na873JbMhS2alpdIudhyCNR9Y3AbU9rXTZhQrif1W8RId4Ou4p9f+m5KEqrz/g==
X-Received: by 2002:a5d:8d95:0:b0:7b7:2bb4:c2b6 with SMTP id b21-20020a5d8d95000000b007b72bb4c2b6mr23483716ioj.31.1703116509294;
        Wed, 20 Dec 2023 15:55:09 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:09 -0800 (PST)
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
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 02/22] i2c: acpi: Modify i2c_acpi_get_irq() to use resource
Date: Wed, 20 Dec 2023 16:54:16 -0700
Message-ID: <20231220165423.v2.2.Ib65096357993ff602e7dd0000dd59a36571c48d8@changeid>
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

The i2c_acpi_irq_context structure provides redundant information that
can be provided with struct resource.

Refactor i2c_acpi_get_irq() to use struct resource instead of struct
i2c_acpi_irq_context.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v2:
-New patch

 drivers/i2c/i2c-core-acpi.c | 44 ++++++++++++++-----------------------
 drivers/i2c/i2c-core-base.c |  6 ++---
 drivers/i2c/i2c-core.h      |  4 ++--
 3 files changed, 22 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 8126a87baf3d4..01cf140da21af 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -175,64 +175,54 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
 
 static int i2c_acpi_add_irq_resource(struct acpi_resource *ares, void *data)
 {
-	struct i2c_acpi_irq_context *irq_ctx = data;
-	struct resource r;
+	struct resource *r = data;
 
-	if (irq_ctx->irq > 0)
+	if (r->start > 0)
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
 
+	if (IS_ERR_OR_NULL(r))
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
-
-	if (irq_ctx.irq < 0)
-		return irq_ctx.irq;
+	if (r->start > 0)
+		return r->start;
 
-	if (wake_capable)
-		*wake_capable = irq_ctx.wake_capable;
+	ret = acpi_dev_get_gpio_irq_resource(adev, NULL, 0, r);
+	if (!ret)
+		return r->start;
 
-	return irq_ctx.irq;
+	return ret;
 }
 
 static int i2c_acpi_get_info(struct acpi_device *adev,
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 3bd48d4b6318f..8b8c7581a60c2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -513,10 +513,10 @@ static int i2c_device_probe(struct device *dev)
 			if (irq == -EINVAL || irq == -ENODATA)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
-			bool wake_capable;
+			struct resource r = {0};
 
-			irq = i2c_acpi_get_irq(client, &wake_capable);
-			if (irq > 0 && wake_capable)
+			irq = i2c_acpi_get_irq(client, &r);
+			if (irq > 0 && r.flags & IORESOURCE_IRQ_WAKECAPABLE)
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


