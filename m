Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604582071FD
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jun 2020 13:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388860AbgFXLZg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jun 2020 07:25:36 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:45003 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388811AbgFXLZf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Jun 2020 07:25:35 -0400
Received: by mail-ej1-f68.google.com with SMTP id ga4so2046783ejb.11;
        Wed, 24 Jun 2020 04:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LA2XapGq4IaVD7/Jz16sK+vZWcKUBPvVZlD7kxpKK+4=;
        b=UqSQWr7HR57YOBTpk+tpYtlRdcQ24t9ztAs+LGnu7k4mvP1Fxexu1MYm0z6E2G7t7l
         soOdfCVFTiUZn3e1M7+cWPBUOLdr6uPXIg6C2DVyV2e+lSdSwRe58tBxxXPw3GzUYrnb
         W7jlI+CeGr8CUX4vLIGcLOPD5lbDKJ+IQ40B6UF0w/gjo3N9jnsbaEC4ryp+Ja+HVDjI
         u0zKtypXiTCPAWSiMucZ6trnBLTCbr4zLu/d5AzLYkmb3N27IKW0+9zwbLaqSw/i2IU6
         6F/XJiy1VF3e6CVEA/8EpNCjMe97w2PWitIoRMdjwf4q7M3ggnZc3NYV3Xcw5TnDbRAy
         zDxw==
X-Gm-Message-State: AOAM532pmpKynj9jNi8VkEsTlbv9EsbYtIJiyc+fdalGtbQ0CpVYoBQW
        NC7QY49Un4DPinH3lSM2xBQ=
X-Google-Smtp-Source: ABdhPJxhx0cXd0uflR7vtTwXvD4YGbtCrkhU2pMwvJFNbTADtFUIR9Zj3aH8PJurs/hAcjFNhB0QjA==
X-Received: by 2002:a17:906:3042:: with SMTP id d2mr3703894ejd.420.1592997933359;
        Wed, 24 Jun 2020 04:25:33 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id a24sm15147934ejc.109.2020.06.24.04.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 04:25:32 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Cc:     Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH v2] i2c: designware: platdrv: Set class based on dmi
Date:   Wed, 24 Jun 2020 13:25:30 +0200
Message-Id: <20200624112530.852254-1-ribalda@kernel.org>
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
set based on the dmi information.

Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
---
v2:
Changes by Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
 - CodeStyle
Changes by kernel test robot <lkp@intel.com>
 - Include dmi header to fix build error on arc
 - check if dmi_get_system_info returned NULL
 drivers/i2c/busses/i2c-designware-platdrv.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index c2efaaaac252..5892fdba9c25 100644
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
@@ -173,6 +174,19 @@ static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
 		pm_runtime_put_noidle(dev->dev);
 }
 
+static bool dw_i2c_hwmon_bus(void)
+{
+	const char *product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
+
+	if (!product_name)
+		return false;
+
+	if (strstr(product_name, "QT5222"))
+		return true;
+
+	return false;
+}
+
 static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
@@ -267,7 +281,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
-	adap->class = I2C_CLASS_DEPRECATED;
+	adap->class = dw_i2c_hwmon_bus() ? I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
 	adap->nr = -1;
-- 
2.27.0

