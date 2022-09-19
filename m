Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2425BD1A0
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 18:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiISP75 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 11:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiISP7k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 11:59:40 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56CA36868
        for <linux-i2c@vger.kernel.org>; Mon, 19 Sep 2022 08:59:27 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id x13so5621607ilp.3
        for <linux-i2c@vger.kernel.org>; Mon, 19 Sep 2022 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=np+bYQjNTwYhnpoJNqqCpGKY3uMFgYXcxvRG8skp7Y0=;
        b=f6J5udabfckOtiMltORKWVDLFrxLOCAe/2A298h3eQ7mcdOUhZhAE3gYYzkJ17qJdP
         LsKsqIsaF/1gXvaRaVz8rUwdgyHHCnJ7FMxv+7+Ug+0QpFPV1MWKADBOnBL/vXrZ84fR
         9Ex4FjYoktHYXk13q3GhiZjmL53SIF3NNiSxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=np+bYQjNTwYhnpoJNqqCpGKY3uMFgYXcxvRG8skp7Y0=;
        b=M3ciVFr7F/k+4/Nr79jDr6xPR4g+KcidvJ/D+BpDFIxZqr0BeWn48h7d5vbThifgco
         5d77BetBpwXP04h0N51rCtDJXS24qgp4scbvMYaodzNpsxRmRdASmhsSQgXGGiQDpncJ
         2V+tKxJwn1Qm1ubrNQsVNM3b/vawMyZO4uXWCC6MpzVeOLTaaCkjdNeNCcnwfSbnf1iv
         IAFUDB23lgRieo45hgs5nTapM4Z/t7N92PMQIIl6rYBnbu37MIERlf4e3Lkr5bCq3v5p
         70A6SszkMvXHF12z6VSJMDw3vPjpNd+cSMeJhwdrLI94ghLi4YeuAgI5Ap1jqtdNYaV8
         BHCQ==
X-Gm-Message-State: ACrzQf10SDQfZaX0n7N4+1PqXMjEpoJ6wW2cr1s0/ErlSQLqwv61cqa5
        HieGcdmo+FwTEiZlU/oDTuh2xg==
X-Google-Smtp-Source: AMsMyM66heku42IBubUPWwL3kGoFJkxCctl3a4UNY76fCtcoGl8ZeUmubLxzaJtSXGIRyuu82bak4g==
X-Received: by 2002:a05:6e02:1b83:b0:2f5:3d65:6bca with SMTP id h3-20020a056e021b8300b002f53d656bcamr4667554ili.279.1663603166567;
        Mon, 19 Sep 2022 08:59:26 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id t70-20020a025449000000b00349fb9b1abesm5634154jaa.106.2022.09.19.08.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 08:59:26 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     timvp@google.com, hdegoede@redhat.com,
        andriy.shevchenko@linux.intel.com, rafael@kernel.org,
        mario.limonciello@amd.com, jingle.wu@emc.com.tw,
        mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
        linus.walleij@linaro.org, Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
Date:   Mon, 19 Sep 2022 09:59:09 -0600
Message-Id: <20220919095504.v4.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220919155916.1044219-1-rrangel@chromium.org>
References: <20220919155916.1044219-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Device tree already has a mechanism to pass the wake_irq. It does this
by looking for the wakeup-source property and setting the
I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
ACPI interrupt wake flag to determine if the interrupt can be used to
wake the system. Previously the i2c drivers had to make assumptions and
blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
If there is a device with an Active Low interrupt and the device gets
powered off while suspending, the interrupt line will go low since it's
no longer powered and wakes the system. For this reason we should
respect the board designers wishes and honor the wake bit defined on the
interrupt.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---

Changes in v4:
- Removed unnecessary !!
- Removed unrelated whitespace change
- Added Reviewed-by
- Renamed i2c_acpi_add_resource to i2c_acpi_add_irq_resource
- Expanded logic in i2c_acpi_add_i2c_resource to make it easier to read

Changes in v3:
- Convert wake_capable to bool
- Only update wake_capable pointer once
- Move wake_capable local into local block

Changes in v2:
- Look at wake_cabple bit for IRQ/Interrupt resources

 drivers/i2c/i2c-core-acpi.c | 37 +++++++++++++++++++++++++++----------
 drivers/i2c/i2c-core-base.c |  6 +++++-
 drivers/i2c/i2c-core.h      |  4 ++--
 3 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index c762a879c4cc6b..ba64e505183595 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -137,6 +137,11 @@ static const struct acpi_device_id i2c_acpi_ignored_device_ids[] = {
 	{}
 };
 
+struct i2c_acpi_irq_context {
+	int irq;
+	bool wake_capable;
+};
+
 static int i2c_acpi_do_lookup(struct acpi_device *adev,
 			      struct i2c_acpi_lookup *lookup)
 {
@@ -168,13 +173,19 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
 	return 0;
 }
 
-static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
+static int i2c_acpi_add_irq_resource(struct acpi_resource *ares, void *data)
 {
-	int *irq = data;
+	struct i2c_acpi_irq_context *irq_ctx = data;
 	struct resource r;
 
-	if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
-		*irq = i2c_dev_irq_from_resources(&r, 1);
+	if (irq_ctx->irq > 0)
+		return 1;
+
+	if (!acpi_dev_resource_interrupt(ares, 0, &r))
+		return 1;
+
+	irq_ctx->irq = i2c_dev_irq_from_resources(&r, 1);
+	irq_ctx->wake_capable = r.flags & IORESOURCE_IRQ_WAKECAPABLE;
 
 	return 1; /* No need to add resource to the list */
 }
@@ -182,31 +193,37 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
 /**
  * i2c_acpi_get_irq - get device IRQ number from ACPI
  * @client: Pointer to the I2C client device
+ * @wake_capable: Set to true if the IRQ is wake capable
  *
  * Find the IRQ number used by a specific client device.
  *
  * Return: The IRQ number or an error code.
  */
-int i2c_acpi_get_irq(struct i2c_client *client)
+int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	struct list_head resource_list;
-	int irq = -ENOENT;
+	struct i2c_acpi_irq_context irq_ctx = {
+		.irq = -ENOENT,
+	};
 	int ret;
 
 	INIT_LIST_HEAD(&resource_list);
 
 	ret = acpi_dev_get_resources(adev, &resource_list,
-				     i2c_acpi_add_resource, &irq);
+				     i2c_acpi_add_irq_resource, &irq_ctx);
 	if (ret < 0)
 		return ret;
 
 	acpi_dev_free_resource_list(&resource_list);
 
-	if (irq == -ENOENT)
-		irq = acpi_dev_gpio_irq_get(adev, 0);
+	if (irq_ctx.irq == -ENOENT)
+		irq_ctx.irq = acpi_dev_gpio_irq_wake_get(adev, 0, &irq_ctx.wake_capable);
+
+	if (wake_capable)
+		*wake_capable = irq_ctx.wake_capable;
 
-	return irq;
+	return irq_ctx.irq;
 }
 
 static int i2c_acpi_get_info(struct acpi_device *adev,
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 91007558bcb260..fc4b85fb90b1b7 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -487,7 +487,11 @@ static int i2c_device_probe(struct device *dev)
 			if (irq == -EINVAL || irq == -ENODATA)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
-			irq = i2c_acpi_get_irq(client);
+			bool wake_capable;
+
+			irq = i2c_acpi_get_irq(client, &wake_capable);
+			if (irq > 0 && wake_capable)
+				client->flags |= I2C_CLIENT_WAKE;
 		}
 		if (irq == -EPROBE_DEFER) {
 			status = irq;
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 87e2c914f1c57b..1247e6e6e97517 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -61,11 +61,11 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
 #ifdef CONFIG_ACPI
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
 
-int i2c_acpi_get_irq(struct i2c_client *client);
+int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable);
 #else /* CONFIG_ACPI */
 static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
 
-static inline int i2c_acpi_get_irq(struct i2c_client *client)
+static inline int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable)
 {
 	return 0;
 }
-- 
2.37.3.968.ga6b4b080e4-goog

