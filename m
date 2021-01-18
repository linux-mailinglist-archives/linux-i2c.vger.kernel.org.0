Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508852F969D
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 01:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730546AbhARAfe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 19:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730523AbhARAfZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Jan 2021 19:35:25 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DC5C061757;
        Sun, 17 Jan 2021 16:34:45 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id u14so8206655wmq.4;
        Sun, 17 Jan 2021 16:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uWwlR2JD3sOpBYSIkzbMOHTkmK2E7HCQ52xgimQRdfg=;
        b=rsflLZaEbKqnXrB4MxHq/6ALeOIvbtVotESsfAL8Quyuk/od9smrl6iVXp1IWaUVHX
         jUDc02ydCwfsG6f0AbYuIK6i8atPZ5y1I2KvW0fj2hN85afmKU+4kSXcVsIoA2ZuGEHD
         zSr0V9b9TyYFSOdN9nEHQ9d6qDaI3oy0Z4mPQWys2nhdN9SelkoKbD5zKnK8c5JzmFfd
         4AlPyXhFMxqK3lGUXdFjMj2ilM061a+5FhN/J4t2kUvTamvB7+KvIkKLef9oyxPiQjQY
         Cw1g34ACjN0mVyAguZ9caUZ/0cHF4EO+lk5K8NVdBOGZFDmAFdEEBZ+7aeF3wPHRo2Fi
         VBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uWwlR2JD3sOpBYSIkzbMOHTkmK2E7HCQ52xgimQRdfg=;
        b=L+kXO46+KAsoTW4puWIGBk4ZTeF2PXheGn2PVKIhKu/frTGpGV6YtYfhPYg5b0lFAq
         BeLpbltK5D/meYAiNcNr2uiTo/3PHYwAbSmhIMAibreqP+9ryj/yNaxBHeTk7+F9WbmW
         X1joeiTU3T8fg0p+YoyHzcLwA637hRC2/Amgwiw+q7BBob1wiqHCUJHh2i5FUiBrXy//
         zDl3w/o71BERV0vf46XYX75zUM0kzfWAV3bGA6TBs7R59JwtSR4EHm0zDN/JxITXpiLj
         lk6KdCfgzPAGdkVFGG5/KBnfviVJtQoVzrVUe/DKaOb2ArpQY1TG/vK34S/8iOgjmWhg
         6jHw==
X-Gm-Message-State: AOAM533nHfVSN31AR+DayGVAamSkNCBSagqiLxDvm7e+3ECrTuW1d9kt
        /6b8zC12J9zOFodYCFkQfX6vaVWStKbhnA==
X-Google-Smtp-Source: ABdhPJzzh1BsCeWgvlBnbQCml4lrvnEv9WKpVfMy088N7PBSItV0kmvjQmp/Q0r+cm5G47ymrl7pUA==
X-Received: by 2002:a05:600c:258:: with SMTP id 24mr18752269wmj.16.1610930084256;
        Sun, 17 Jan 2021 16:34:44 -0800 (PST)
Received: from valhalla.home ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id o124sm23642040wmb.5.2021.01.17.16.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 16:34:43 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v2 3/7] i2c: i2c-core-base: Use format macro in i2c_dev_set_name()
Date:   Mon, 18 Jan 2021 00:34:24 +0000
Message-Id: <20210118003428.568892-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118003428.568892-1-djrscally@gmail.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some places in the kernel allow users to map resources to a device
using device name (for example, gpiod_lookup_table). Currently
this involves waiting for the i2c_client to have been registered so we
can use dev_name(&client->dev). We want to add a function to allow users
to refer to an i2c device by name before it has been instantiated, so
create a macro for the format that's accessible outside the i2c layer
and use it in i2c_dev_set_name()

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
	- Used format macro in i2c_dev_set_name() instead of sub func

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

