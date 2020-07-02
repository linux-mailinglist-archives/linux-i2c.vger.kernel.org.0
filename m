Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33CD212023
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 11:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgGBJii (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 05:38:38 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:35086 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgGBJii (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jul 2020 05:38:38 -0400
Received: by mail-ej1-f66.google.com with SMTP id rk21so28533318ejb.2;
        Thu, 02 Jul 2020 02:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PshYPWi7fvTQHrWfUZQEN624Xq+S5W73EgfXf3KFYes=;
        b=NaQHhUrxO9pz1UVhLoP87ySykgLihsttvuiBlu+Ie0qbRPY7opFkGi9UrMVZxLUSxl
         BLnRDu4i9P0mVIngS8gO4hNFld+Uz+GdFviz0y1ukFaNWmUgxNeBQmeUlERmq1+ndxwx
         zVWJeOtpi6veki2mZAVf6gMAoYWeDZ45J1NGb6LFztrpmr094jgLE3kDYVunD3wlBKbr
         p36IurybV5T0I42q6TpULk1P2i0l+lNpAhVmc8iMNeNw/D6OWRyhfz3GmFUHD/q4Z0gH
         ad3szld7fo8dZUQV1j9CqA6uEvZ5NMNiWCLWtlcLJVn8nIIoeW/ereq4MqBOgCFsdHeq
         NdbA==
X-Gm-Message-State: AOAM5307PgQHsNuA8HcxN0H5IIyYtmY0Gc1+w4Bm3P5uCbPfDmnLz4+e
        bfHqLbJ7RnjuuCqGwV/qjhsnKEDpJcE=
X-Google-Smtp-Source: ABdhPJwmnk10YRxLgMfD/lCDgqC3eUs/X3gFQZl3/SzMyaDU07mbbNuc/es3NjRCaglqFP94/8erzQ==
X-Received: by 2002:a17:906:9387:: with SMTP id l7mr25768386ejx.274.1593682716186;
        Thu, 02 Jul 2020 02:38:36 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id g8sm9215406edk.13.2020.07.02.02.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 02:38:34 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Cc:     Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH v3] i2c: designware: platdrv: Set class based on dmi
Date:   Thu,  2 Jul 2020 11:38:32 +0200
Message-Id: <20200702093832.2077252-1-ribalda@kernel.org>
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

Dmi is probed only on Qtechnology QT5222 Industrial Camera Platform
https://qtec.com/camera-technology-camera-platforms/

Fixes: 3eddad96c439 ("i2c: designware: reverts "i2c: designware: Add support for AMD I2C controller"")
Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
---

v3: Comment by Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  - Add Fixes tag
  - Do not user strstr for dmidecode
  Comment by Jarkko Nikula <jarkko.nikula@linux.intel.com>
  - Use dmi_check_system()
 drivers/i2c/busses/i2c-designware-platdrv.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index c2efaaaac252..a9f2d416b7d1 100644
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
 
+static const struct dmi_system_id allow_probe[] = {
+	{
+		.ident = "Qtechnology QT5222",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Qtechnology"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "QT5222")
+		}
+	},
+
+	{ }
+};
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -267,7 +280,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
-	adap->class = I2C_CLASS_DEPRECATED;
+	adap->class = dmi_check_system(allow_probe) ?
+					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
 	adap->nr = -1;
-- 
2.27.0

