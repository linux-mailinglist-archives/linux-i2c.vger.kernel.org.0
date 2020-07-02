Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB863212160
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 12:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgGBKdZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 06:33:25 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42128 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728331AbgGBKdZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jul 2020 06:33:25 -0400
Received: by mail-ed1-f66.google.com with SMTP id z17so23087709edr.9;
        Thu, 02 Jul 2020 03:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DR+lES1GIWGKd96O7Mw57yL6n3Bv7BAuAb083PqM/vc=;
        b=Vgcn5JO4j2Ws5OFQVSSjLq/dXdDjE6t8TIfqMMwjzsLQqvdmSbAdb9QKHZM7XkYrHB
         Wt4wdRZ550pvonaDq9Lc9NuGy3SrfOQCzAvDpB9gEpqYW2M4Myod0YKnnP3vijrAXHca
         yx6avUHWqflomyPCWTPZ/KhC7uzQrcHt6BS26XKVXhhrEiwP2FJA6EJQStCvLLYZNBu2
         3tR5QoyIE5BnTgjM7oeQAikevF9lKGW+MP1hBGUGDHCJwAcA1QIWyNUeUE3fvftp09t5
         CyF2uFx+7ZF+4YTUFD4O1/AWkKpXlUnkErYMUB0rK7l12BfGk4jdnORnd/Y/TP30V+NB
         VcDQ==
X-Gm-Message-State: AOAM530lwEMrYsdbkL4atjapypjdN4i7J/gPq2mUgRhFDjoDsQc4zwov
        1n0f7bVFoziqCZ/hdwZNIuYetN6yeU8=
X-Google-Smtp-Source: ABdhPJysPRepX9BL8RInKVMxjATPCxzVOhuz4zNtUbfvB25Drlu/WzIJoHK9l4kN4HHa77PuZZJvkg==
X-Received: by 2002:aa7:c54e:: with SMTP id s14mr34307284edr.81.1593686003685;
        Thu, 02 Jul 2020 03:33:23 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id w17sm6483135eju.42.2020.07.02.03.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 03:33:22 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Cc:     Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH v6] i2c: designware: platdrv: Set class based on DMI
Date:   Thu,  2 Jul 2020 12:33:21 +0200
Message-Id: <20200702103321.2092254-1-ribalda@kernel.org>
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

DMI is probed only on Qtechnology QT5222 Industrial Camera Platform.

DocLink: https://qtec.com/camera-technology-camera-platforms/
Fixes: 3eddad96c439 ("i2c: designware: reverts "i2c: designware: Add support for AMD I2C controller"")
Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v6: Removed extra line, sorry for the invalid v5
 drivers/i2c/busses/i2c-designware-platdrv.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index c2efaaaac252..a71bc58fc03c 100644
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
@@ -191,6 +192,17 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
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
+	{ } /* terminate list */
+};
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -267,7 +279,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
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

