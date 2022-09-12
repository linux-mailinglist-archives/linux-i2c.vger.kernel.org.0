Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267625B6375
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 00:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbiILWO7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Sep 2022 18:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiILWOI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Sep 2022 18:14:08 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C15B4E632
        for <linux-i2c@vger.kernel.org>; Mon, 12 Sep 2022 15:13:56 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id 62so8153547iov.5
        for <linux-i2c@vger.kernel.org>; Mon, 12 Sep 2022 15:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RNx37yKQbZV3YwKmbwhHH3b5iEfqDIvtsv7is9A0p3M=;
        b=i2PeBm5KHM44vDseOJdiQmCvkbrFjxDot/fbuwa5w9tjLRwombOzQRSZ9w6JSw8QW+
         qTwFakJ9vmCBQkST+yMSEpDr5q5dSSxgsrEuPekdTCr99XN0iB+iVWDfk0viCYwkX5Oe
         dRQDZrxkjBjaczzhGfceMC3D2h6kIRImMSO2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RNx37yKQbZV3YwKmbwhHH3b5iEfqDIvtsv7is9A0p3M=;
        b=mhzvWIjDcWqGJYrB0UiTY9qAsDlyKJeSeBm9Dk62M0U9l+Me7z6WbRmaT3hy3TeeZW
         +3fRWhByuh58Q8514yVZraUQpROO/ZtxMi06lW1bfxSLk7QdpIrhM2vxVcvfb70VfALn
         fNyZug8DSr613RDhfgXiXcnHjv02rddZFjlyodA86B4YWjhi0Iz+z6IZiLQZYSdE4EU+
         eBm9/zdzbcF8Q+e3Wqfe8c+Ib7GbyKfKtL+24BXRN3m9tmWqaPglS1j3+TrVEOaRCStw
         YlS//2hkwJJjenVeVTUI/eUF2uAoU6b2rqQfl3kf8N8844nKrP0xE72IYQImmUYAm8tu
         omNg==
X-Gm-Message-State: ACgBeo3cLZJSKHPpdcIKwIAmRhKoFPmU/tdgT8w+H5lRJjv9Fh6AeSAs
        LljPsNhf8C14IQhiW8UAaHYS3Q==
X-Google-Smtp-Source: AA6agR5vMYNcU9Q6AtJghvz6j5UO+YRrBxglU//jxaDXv0cAUvLfabcSA9mP6kDU3lOkDAd0jhndfA==
X-Received: by 2002:a05:6638:13c4:b0:35a:55df:29b2 with SMTP id i4-20020a05663813c400b0035a55df29b2mr295524jaj.85.1663020835825;
        Mon, 12 Sep 2022 15:13:55 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id 18-20020a056e020cb200b002f16e7021f6sm4077334ilg.22.2022.09.12.15.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 15:13:55 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, jingle.wu@emc.com.tw,
        mario.limonciello@amd.com, timvp@google.com,
        linus.walleij@linaro.org, hdegoede@redhat.com, rafael@kernel.org,
        Raul E Rangel <rrangel@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
Date:   Mon, 12 Sep 2022 16:13:11 -0600
Message-Id: <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220912221317.2775651-1-rrangel@chromium.org>
References: <20220912221317.2775651-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
---

Changes in v2:
- Look at wake_cabple bit for IRQ/Interrupt resources

 drivers/i2c/i2c-core-acpi.c | 37 ++++++++++++++++++++++++++++---------
 drivers/i2c/i2c-core-base.c |  6 +++++-
 drivers/i2c/i2c-core.h      |  4 ++--
 3 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index c762a879c4cc6b..c3d69b287df824 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -137,6 +137,11 @@ static const struct acpi_device_id i2c_acpi_ignored_device_ids[] = {
 	{}
 };
 
+struct i2c_acpi_irq_context {
+	int irq;
+	int wake_capable;
+};
+
 static int i2c_acpi_do_lookup(struct acpi_device *adev,
 			      struct i2c_acpi_lookup *lookup)
 {
@@ -170,11 +175,14 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
 
 static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
 {
-	int *irq = data;
+	struct i2c_acpi_irq_context *irq_ctx = data;
 	struct resource r;
 
-	if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
-		*irq = i2c_dev_irq_from_resources(&r, 1);
+	if (irq_ctx->irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r)) {
+		irq_ctx->irq = i2c_dev_irq_from_resources(&r, 1);
+		irq_ctx->wake_capable =
+			r.flags & IORESOURCE_IRQ_WAKECAPABLE ? 1 : 0;
+	}
 
 	return 1; /* No need to add resource to the list */
 }
@@ -182,31 +190,42 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
 /**
  * i2c_acpi_get_irq - get device IRQ number from ACPI
  * @client: Pointer to the I2C client device
+ * @wake_capable: Set to 1 if the IRQ is wake capable
  *
  * Find the IRQ number used by a specific client device.
  *
  * Return: The IRQ number or an error code.
  */
-int i2c_acpi_get_irq(struct i2c_client *client)
+int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	struct list_head resource_list;
-	int irq = -ENOENT;
+	struct i2c_acpi_irq_context irq_ctx = {
+		.irq = -ENOENT,
+		.wake_capable = 0,
+	};
 	int ret;
 
 	INIT_LIST_HEAD(&resource_list);
 
+	if (wake_capable)
+		*wake_capable = 0;
+
 	ret = acpi_dev_get_resources(adev, &resource_list,
-				     i2c_acpi_add_resource, &irq);
+				     i2c_acpi_add_resource, &irq_ctx);
 	if (ret < 0)
 		return ret;
 
 	acpi_dev_free_resource_list(&resource_list);
 
-	if (irq == -ENOENT)
-		irq = acpi_dev_gpio_irq_get(adev, 0);
+	if (irq_ctx.irq == -ENOENT)
+		irq_ctx.irq = acpi_dev_gpio_irq_get_wake(
+			adev, 0, &irq_ctx.wake_capable);
+
+	if (wake_capable)
+		*wake_capable = irq_ctx.wake_capable;
 
-	return irq;
+	return irq_ctx.irq;
 }
 
 static int i2c_acpi_get_info(struct acpi_device *adev,
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 91007558bcb260..97315b41550213 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -468,6 +468,7 @@ static int i2c_device_probe(struct device *dev)
 	struct i2c_client	*client = i2c_verify_client(dev);
 	struct i2c_driver	*driver;
 	int status;
+	int acpi_wake_capable = 0;
 
 	if (!client)
 		return 0;
@@ -487,7 +488,10 @@ static int i2c_device_probe(struct device *dev)
 			if (irq == -EINVAL || irq == -ENODATA)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
-			irq = i2c_acpi_get_irq(client);
+			irq = i2c_acpi_get_irq(client, &acpi_wake_capable);
+
+			if (irq > 0 && acpi_wake_capable)
+				client->flags |= I2C_CLIENT_WAKE;
 		}
 		if (irq == -EPROBE_DEFER) {
 			status = irq;
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 87e2c914f1c57b..8e336638a0cd2e 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -61,11 +61,11 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
 #ifdef CONFIG_ACPI
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
 
-int i2c_acpi_get_irq(struct i2c_client *client);
+int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable);
 #else /* CONFIG_ACPI */
 static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
 
-static inline int i2c_acpi_get_irq(struct i2c_client *client)
+static inline int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
 {
 	return 0;
 }
-- 
2.37.2.789.g6183377224-goog

