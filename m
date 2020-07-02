Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE60D212151
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 12:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgGBKbs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 06:31:48 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:39231 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgGBKbs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jul 2020 06:31:48 -0400
Received: by mail-ej1-f65.google.com with SMTP id w6so28709994ejq.6;
        Thu, 02 Jul 2020 03:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ud2BD5mh1oHuMfR912NokotFsl+3DpQPjYT/i6xyLjE=;
        b=iXcFgwYtjO0qQOFlBonS0IPkqjxSCD8ns0eJIPcQqQgEfQ+0ZcYZ6xWM/pmjU9fr50
         /pQyjpLu26HrSElYHS2Y+hMdakhAM6RNSNf1LcjkgrpL8nvN94M2hA1rtmJn8Ou67rRr
         2TjFuNArvYl3isfPHQ9zGbtmG+814BIXuX3Dl9jptKLWW7e1k953iz2UF7ZgzXe/N+R7
         2/37GX8wrIwBFSmYjIwtSuWkOJePjw0TXTyi8ZFywx7eKtmtvM+LJGW0WPlYn92VhG0I
         Yge31T+aI2zQFQbxUPYh9kjRvNeWOFQ4LTpZ/whb3DSYJwe//a1mF7oKQUzOYrXYwLtM
         EGPw==
X-Gm-Message-State: AOAM532bT8DxKh7X7XdGBQpZEhpC8NGNLX8ZTl2T+3jsH0VvqYhBdkRo
        YXhbL6qKvN6XcG57MwW+PLk=
X-Google-Smtp-Source: ABdhPJyLDMY5ZUc+B1R15VoFZTC82DmYosz5fFnuz4c8IjCCux+gvAIPwsIoaM60eCrMcCuP7BefTQ==
X-Received: by 2002:a17:906:547:: with SMTP id k7mr26357373eja.287.1593685906142;
        Thu, 02 Jul 2020 03:31:46 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id d20sm8623356edy.9.2020.07.02.03.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 03:31:45 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Cc:     Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH v5] i2c: designware: platdrv: Set class based on DMI
Date:   Thu,  2 Jul 2020 12:31:43 +0200
Message-Id: <20200702103143.2091958-1-ribalda@kernel.org>
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
v5: Comments by Andy Shevchenko <andriy.shevchenko@linux.intel.com>

 - Add missing period and removed extra line

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

