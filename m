Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF05838B14C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 16:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243715AbhETONS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 10:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240757AbhETOMb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 10:12:31 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E71C06135D;
        Thu, 20 May 2021 07:09:45 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so5506283wmf.5;
        Thu, 20 May 2021 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DScPvwKQ0WIISqQGprqYEDaZlRL+0SsZpAZEoDfBM6E=;
        b=epZ4NBGpKpmvR3LAKLC/jkyQMGltnEBa5H02wagxkhhCHKquMX5fi2bDZLjGNwu4ii
         AcG2OthR4bi5RozEMLbjtxLPMOqj7bkO7idvRGHIcVJTtMB0spUIgYXFttxBkP68J41U
         Y5AljqNAZgkzpseQnkEQeqBKToJ+pnfz8hnSnvlITOF9XNaRiMCH4n6g55JzTPUSkYFA
         bC6G22Z0ry+PIpccTR1tdVlMUFI2uha6MmIipdRd60VSOZvg+klYLb5KaiAC9DaoW+7+
         tVvUr7MgXuYWcbrkH6iTl4QakQOmYIliszriFQyJjoXkf9HztBcJ3fMJOIWBDYWVyTdq
         PrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DScPvwKQ0WIISqQGprqYEDaZlRL+0SsZpAZEoDfBM6E=;
        b=U/yMIotYKlM+nqrBevJneKzT5nUj5n3y1pBxxMB8i9dyXsKBDucodHRi5wcFy9Y3ST
         p1qZQ7sck20TGwKLHgdX+LYvTW81ItNdxZpeCy21wX5RR/K20tAAiaNHgidEOytkFMuJ
         NJbBOsO2GKTjvlQZWQiuhbqfGqujo7jHhpv6ddEL1RjZPq/0+fBlsjgnEVCKl8o20jhO
         /KcBd45lGUgl+fRLaYkkRcrk4lu5cKk9XtCTTZ67rSeP7/eIbghAWNVKUkK0pl2eVdBu
         U+aUYG8tHgcysVACgr5vh6hJs8VIUrkU3YXdKuC/+F8tiiNAHBnx6l3K/V+wen7RaQeu
         ydfA==
X-Gm-Message-State: AOAM530U9PRvfSkge4ELzefCthepBaLCmNZSlWzKGDvoWpNkhk9qY9PV
        Zoq53yfd4TjZoBNUwy/Nqxw=
X-Google-Smtp-Source: ABdhPJysq0wOJR0dRUN8yQ2vkDAD3ldi//g2fuhWbfYRM4Z4Si/r62BsMPieVqlNTKe/TG0oXyeQgQ==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr4024898wmj.84.1621519784115;
        Thu, 20 May 2021 07:09:44 -0700 (PDT)
Received: from valhalla.home ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id m6sm8411974wml.3.2021.05.20.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 07:09:43 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v4 3/8] i2c: core: Add a format macro for I2C device names
Date:   Thu, 20 May 2021 15:09:23 +0100
Message-Id: <20210520140928.3252671-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210520140928.3252671-1-djrscally@gmail.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
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

Acked-by: Wolfram Sang <wsa@kernel.org>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v3:
	- None

 drivers/i2c/i2c-core-base.c | 4 ++--
 include/linux/i2c.h         | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5a97e4a02fa2..2ca50a6f5514 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -852,12 +852,12 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
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
index e8f2ac8c9c3d..d9f433617a8d 100644
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

