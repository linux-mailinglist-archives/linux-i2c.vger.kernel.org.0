Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B990721209F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 12:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgGBKKd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 06:10:33 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:42377 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgGBKKd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jul 2020 06:10:33 -0400
Received: by mail-ej1-f67.google.com with SMTP id f12so2413965eja.9;
        Thu, 02 Jul 2020 03:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7d50t2/RpZ/PiovsO4JjL17UaNTTmolWjPQh23qo5pE=;
        b=oMey2+O5+1bdfJKXMUEZO8Y5ACk/bTTp18+8b+47sPQmpryJ79WP6w1LwLbc3q24FD
         dUI0Cgb2xXbK0j7zH18v7fljAFV3QL5lTDyR3DhICz2+V/AyTqJGEkf/ykvKVWvBraJ4
         ht7D3AqmsaTSESMc42yFCue0NmoDNZrAwZPfhrANq2Yjgm1AGqm6OK02EBJRvVncxcdT
         fwmoBAe1FLxbKjIu9VlUv1UVMWKURc77vmfg9eshXK9Gdkto5uqP7XH/RZ9b+8QNHEtk
         QrL4rr35LF+1IsdHrK72GCTUS55nRHJjc+aQyjSwbx5vuwBd3p+AeCw8O2y1UBWe68N8
         OczQ==
X-Gm-Message-State: AOAM5301sDY7+t9nGtiTMxi+7l4DyhFeNt4YuFx1miEacE/NooE4cy3v
        yveJ0YWWxp8g+lo3Rrab3i4=
X-Google-Smtp-Source: ABdhPJxI/V8uEi3oMTLgVbbtsoAsRym2GpSEjCa8GEntdArvfCRjcWgCA9SFGnytSDnB0RlEftu4Wg==
X-Received: by 2002:a17:906:7cc4:: with SMTP id h4mr10504032ejp.339.1593684631010;
        Thu, 02 Jul 2020 03:10:31 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id w18sm8988609edv.11.2020.07.02.03.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 03:10:30 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Cc:     Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH v4] i2c: designware: platdrv: Set class based on DMI
Date:   Thu,  2 Jul 2020 12:10:28 +0200
Message-Id: <20200702101028.2088666-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Current AMD's zen-based APUs use this core for some of its i2c-buses.

With this patch we re-enable autodetection of hwmon-alike devices, so
lm-sensors will be able to work automatically.

It does not affect the boot-time of embedded devices, as the class is
set based on the DMI information.

DMI is probed only on Qtechnology QT5222 Industrial Camera Platform

DocLink: https://qtec.com/camera-technology-camera-platforms/
Fixes: 3eddad96c439 ("i2c: designware: reverts "i2c: designware: Add support for AMD I2C controller"")
Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
---
v2: Comments by Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  - dmi -> DMI
  - Doclink
  - CodeStyle
  (I do not know what you meant by redundant in the dmi match list ...)


 drivers/i2c/busses/i2c-designware-platdrv.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index c2efaaaac252..630e28ef2412 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -191,6 +192,18 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 	return ret;
 }
 
+static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
+	{
+		.ident = "Qtechnology QT5222",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Qtechnology"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "QT5222"),
+		},
+	},
+
+	{ } /* terminate list */
+};
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -267,7 +280,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
-	adap->class = I2C_CLASS_DEPRECATED;
+	adap->class = dmi_check_system(dw_i2c_hwmon_class_dmi) ?
+					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
 	adap->nr = -1;
-- 
2.27.0

