Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42422321821
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhBVNLK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbhBVNIe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 08:08:34 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED772C06178B;
        Mon, 22 Feb 2021 05:07:53 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id 7so19034845wrz.0;
        Mon, 22 Feb 2021 05:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5idc3XlcuWB3pMgqllBLms0ZvbmbONztYRrH6tSskHE=;
        b=Hx3bsx6H8y7xVcYZDpbxZeP8JECWhmUKvIGyI83ARoWFy+oYGRVInyjqRQlnRiKO1/
         bj+8JO7L0LzuUhrh1JJ2Ka3lInyJ8USfMhZ+OgPGhSJEIb97kRXL+Qv9Yy2YaLjbcMZa
         KwB5js/vAp7LdtrIeBuW8wTrRzezBAN1PCM03uLYB492O1m6mti4jNwqsL1Mh6YFCRYx
         K6X/jwgG3JYWf5nJqJ3vYYUCJQo8SkIY8/0qUA54lDMO7wDt5I2Iw3V2NEhRCs9aM81T
         Rz20VGnjx8THh/vRjCGTzy5QbR5geon3+ivyIFw5+OPLnnXxttaqOhWEzykhdYlF46p0
         gbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5idc3XlcuWB3pMgqllBLms0ZvbmbONztYRrH6tSskHE=;
        b=ooeVGkaGOMEgLauYA4hfqoF0kbimXjp2qncN0Hjgy4FeqbbK93zRzFNJcjfTEdnjA8
         Rp3KE18aNGGuQ+ozKq6GhVFEJBtdZsLW1YNij4NW4wVJXb3+Pe3robTgc1r+JNKtO9nS
         gY5oB8TBYEFtlJUZ680etkXswJQ8o6AwBQhR7u1Hj1o1iuOQKGWaJkopIo7wGEuDybNB
         wNzGMFc0ZHJiwI9Gi5g5/0vtPf+566IuiXWQoCMqpE1Vy/GYPj4/lalOVxEG4L0oElc4
         2ayijvkGVEi9WiaCL55kS6nXl8gUeQ2gMHgJRyG3ITAAl19pElQTOFVKStgrBbC+BxQk
         TUkg==
X-Gm-Message-State: AOAM531qss4PPxqmHvIL9eaHFrUipF2wkYJ3Yp5SzTPTcX9tiiZ3aqBG
        dOEyxoJ/LezFVTb4NO+3hZc=
X-Google-Smtp-Source: ABdhPJyH+lZSFLDstr8Nhk8znbAULSqN9viQ8iTlO8ZY4Wk3+ciIVfL/6CAU3DA9WMbU3cq3PtBMiQ==
X-Received: by 2002:adf:f584:: with SMTP id f4mr1959882wro.311.1613999272804;
        Mon, 22 Feb 2021 05:07:52 -0800 (PST)
Received: from valhalla.home ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id t198sm26575828wmt.7.2021.02.22.05.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 05:07:52 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     tfiga@chromium.org, sakari.ailus@linux.intel.com,
        rajmohan.mani@intel.com, rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org
Cc:     andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        mgross@linux.intel.com, luzmaximilian@gmail.com,
        robert.moore@intel.com, erik.kaneda@intel.com, me@fabwu.ch,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 3/6] i2c: core: Add a format macro for I2C device names
Date:   Mon, 22 Feb 2021 13:07:32 +0000
Message-Id: <20210222130735.1313443-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222130735.1313443-1-djrscally@gmail.com>
References: <20210222130735.1313443-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some places in the kernel allow users to map resources to a device
using device name (for example, in the struct gpiod_lookup_table).
Currently this involves waiting for the I2C client to have been registered
so we can use dev_name(&client->dev). We want to add a function to allow
users to refer to an I2C device by name before it has been instantiated,
so create a macro for the format that's accessible outside the I2C layer
and use it in i2c_dev_set_name().

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

 drivers/i2c/i2c-core-base.c | 4 ++--
 include/linux/i2c.h         | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf722a424..547b8926cac8 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -811,12 +811,12 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 
 	if (info && info->dev_name) {
-		dev_set_name(&client->dev, "i2c-%s", info->dev_name);
+		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, info->dev_name);
 		return;
 	}
 
 	if (adev) {
-		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
+		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
 		return;
 	}
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b215..4d40a4b46810 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -39,6 +39,9 @@ enum i2c_slave_event;
 typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
 			      enum i2c_slave_event event, u8 *val);
 
+/* I2C Device Name Format - to maintain consistency outside the i2c layer */
+#define I2C_DEV_NAME_FORMAT		"i2c-%s"
+
 /* I2C Frequency Modes */
 #define I2C_MAX_STANDARD_MODE_FREQ	100000
 #define I2C_MAX_FAST_MODE_FREQ		400000
-- 
2.25.1

