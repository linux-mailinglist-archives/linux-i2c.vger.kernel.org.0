Return-Path: <linux-i2c+bounces-1005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369AB81E93C
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 20:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58C831C213EA
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 19:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443915221;
	Tue, 26 Dec 2023 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IWWLBUJd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8E15231
	for <linux-i2c@vger.kernel.org>; Tue, 26 Dec 2023 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7ba903342c2so340271539f.3
        for <linux-i2c@vger.kernel.org>; Tue, 26 Dec 2023 11:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703618525; x=1704223325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKIUdkV/1A01PP0FPQ/QEtq0fQ17bu4UaB0r+uKx4yQ=;
        b=IWWLBUJdfTtwbMK8z/f3wIYgJYT+AY0M+43AAYhm6p4FbWl/2GYSTh33E8DWZfCsDo
         epbv0dlE0g8cFWIC2Me1eXZygBsSjMw88aWxMvWVFVCVINmO77x7zjnrYtfmkQb5QbCy
         y+KJEGa4UwGKzPu9uww2gKS8Sd3gAtb2ZKyPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703618525; x=1704223325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKIUdkV/1A01PP0FPQ/QEtq0fQ17bu4UaB0r+uKx4yQ=;
        b=Y8nm4nBy54Dhqj9W/LYhA6q2HGiC4XAe0slRfCKtoSLj0qEvpkSyVgUmIkIw07Ej1b
         TC4PgjyVUeg75vxvdicEOqjqGMAB4tgQOKQHRnVlClLeOF6BVw0V+qEjp6m2C689X9dz
         RGoNNZjeVfb2H6elZoN81Th1axigvcv2a6pWolaofFvHuI/AA1I1wqnao7dSYyX+qbBy
         XsWd0SFi8SS35DRd+e5yIPyBo45K4ZJXQF2bSxahCTNsUgGnvu66fLg4Jqcmntolkjn2
         /xDgYbHsnjSKeEOgWBiRrkmoj5IgT2PILPGW+OqJjJG4nvckvi3jR7m7VilzbnzOQ2YC
         uxLA==
X-Gm-Message-State: AOJu0Yxt6RCGE/TyFdTIOUzdD1uNnRQVAvVUpF/RvyPkP4QIr8REYFvs
	Ro5wo0aZqF4U4cnT/ekUvKAQhkbrBGzb
X-Google-Smtp-Source: AGHT+IFe98tpmnyGtdOkmoEf9LvtaFp/IaLWH4/Vxw1n0npaKmIeSbPscfFCAZFZe/U4DbMmRxYbTA==
X-Received: by 2002:a05:6602:123b:b0:7b7:acc0:6dd8 with SMTP id z27-20020a056602123b00b007b7acc06dd8mr10342620iot.31.1703618524785;
        Tue, 26 Dec 2023 11:22:04 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id gw3-20020a0566381ee300b0046b692e719esm3207609jab.150.2023.12.26.11.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 11:22:04 -0800 (PST)
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
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v3 03/24] i2c: acpi: Modify i2c_acpi_get_irq() to use resource
Date: Tue, 26 Dec 2023 12:21:07 -0700
Message-ID: <20231226122113.v3.3.Ib65096357993ff602e7dd0000dd59a36571c48d8@changeid>
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

The i2c_acpi_irq_context structure provides redundant information that
can be provided with struct resource.

Refactor i2c_acpi_get_irq() to use struct resource instead of struct
i2c_acpi_irq_context.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v3:
-Add Suggested-by
-Check resource flags for valid irq
-Drop error pointer check
-Invert error checking logic in i2c_acpi_get_irq()
-Drop redundant 0 in struct resource init
-Drop unnecessary check for irq > 0 when setting I2C_CLIENT_WAKE

Changes in v2:
-New patch

 drivers/i2c/i2c-core-acpi.c | 43 ++++++++++++++-----------------------
 drivers/i2c/i2c-core-base.c |  6 +++---
 drivers/i2c/i2c-core.h      |  4 ++--
 3 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 8126a87baf3d4..e48bb24b72127 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -175,64 +175,53 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
 
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
-
-	if (irq_ctx.irq < 0)
-		return irq_ctx.irq;
+	if (!r->flags)
+		ret = acpi_dev_get_gpio_irq_resource(adev, NULL, 0, r);
 
-	if (wake_capable)
-		*wake_capable = irq_ctx.wake_capable;
+	if (!r->flags)
+		return ret;
 
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


