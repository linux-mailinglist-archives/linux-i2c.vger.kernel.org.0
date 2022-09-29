Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5F665EFA2D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 18:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236258AbiI2QUg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 12:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236153AbiI2QTc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 12:19:32 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34641E1CF4
        for <linux-i2c@vger.kernel.org>; Thu, 29 Sep 2022 09:19:29 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id j7so945149ilu.7
        for <linux-i2c@vger.kernel.org>; Thu, 29 Sep 2022 09:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMKvpZP3OdQdrVmiiZLZPkAEVvKdcz5HzehLoSZW1TY=;
        b=GA/VCwLIn+ZIC/4nJQ5vOXNrognYTxpixy+JbuF96mRSbP04zGHZyijDmKlzH8v26y
         iFgyLQayw/CEMtkN0H+5Rdl3z6tGCiWqgqq4elO8fqXnMnYozpaatuA6A4RXDivMvuOR
         A7qxZKupanQ3YdggEl96ei/fRCTY8ScJxRChs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMKvpZP3OdQdrVmiiZLZPkAEVvKdcz5HzehLoSZW1TY=;
        b=qim1MbNKPEEOdFbYtescBCSgNz0g5Zn5gXV0t9xc2t/+5HP5qatZCCAi8dfh/f/kWQ
         qMbeDphgNBuvlDcXDUuIshIxGPNiLIeK4MFdYyrMVjdfmMTyxmhPtB/e+5G42EAH71Ya
         J1yr3IQFrvjgbqLYeExJxhCyenNrs7NJ2YmbvBJOvvizA3f3QQURQiJ+fv6NM8yTPWF3
         N1kg4NY9HykeUMrVoBiY3hwjWXiIFB+VaaVON2FbUQkXIIRlmJyZrJ0sIif53EbpgWyL
         qktgtl+wAsvDNYMsW5ZApuBsM5s4B2UNcvp2/vmC4xbL+lFCNrcjaCVEZtCcOdzeqjYU
         DoRQ==
X-Gm-Message-State: ACrzQf2xVWSleNvdXhqiPah6ZXd828PkHddqwXOMbkGWiL+d7vUoVOWN
        TV9MX5auzSbLMmLWXncN0GqunA==
X-Google-Smtp-Source: AMsMyM4EW9mh9kAxjlPDj3mAt01KtyUcGpheZmx1ecsi/Qy8/DwcdyHXUlQ9zFtWvonI1Yz5SVIjMg==
X-Received: by 2002:a05:6e02:1446:b0:2f2:87e9:65d6 with SMTP id p6-20020a056e02144600b002f287e965d6mr1890585ilo.44.1664468369314;
        Thu, 29 Sep 2022 09:19:29 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id f12-20020a02848c000000b0035aab2f1ab1sm2965451jai.134.2022.09.29.09.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 09:19:28 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, dmitry.torokhov@gmail.com,
        hdegoede@redhat.com, rafael@kernel.org,
        mika.westerberg@linux.intel.com, mario.limonciello@amd.com,
        timvp@google.com, linus.walleij@linaro.org, jingle.wu@emc.com.tw,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
Date:   Thu, 29 Sep 2022 10:19:11 -0600
Message-Id: <20220929093200.v6.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
In-Reply-To: <20220929161917.2348231-1-rrangel@chromium.org>
References: <20220929161917.2348231-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Changes in v6:
- Return early when irq < 0

Changes in v5:
- Check irq return value before updating wake_capable pointer

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

 drivers/i2c/i2c-core-acpi.c | 40 +++++++++++++++++++++++++++----------
 drivers/i2c/i2c-core-base.c |  6 +++++-
 drivers/i2c/i2c-core.h      |  4 ++--
 3 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index c762a879c4cc6b7..10cdf724fd4b2cd 100644
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
@@ -182,31 +193,40 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
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
+	if (irq_ctx.irq < 0)
+		return irq_ctx.irq;
+
+	if (wake_capable)
+		*wake_capable = irq_ctx.wake_capable;
 
-	return irq;
+	return irq_ctx.irq;
 }
 
 static int i2c_acpi_get_info(struct acpi_device *adev,
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 91007558bcb2601..fc4b85fb90b1b7b 100644
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
index 87e2c914f1c57ba..1247e6e6e97517a 100644
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
2.37.3.998.g577e59143f-goog

