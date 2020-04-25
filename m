Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32B51B86D6
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 15:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgDYNow (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 09:44:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:22024 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgDYNow (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Apr 2020 09:44:52 -0400
IronPort-SDR: +aJ2t0jT/yr4CP0HuPhgDsYQLiTg02QkjpiD1YOS03EZt7V/ESFHjw6u9x6DECdUu7IjJQGiWm
 2zTDuiORxKVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 06:44:52 -0700
IronPort-SDR: eravFHITCsJUSlkq5m5zHjytSAeWkCdxtFlKb6ed1P0Lyd2LkPOEGvcsv4pjkjZa4d0khhaNP9
 L9J+l9mRn6wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,316,1583222400"; 
   d="scan'208";a="281165370"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 25 Apr 2020 06:44:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D50D2190; Sat, 25 Apr 2020 16:44:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/5] i2c: designware: Use devm_platform_ioremap_resource() to simplify code
Date:   Sat, 25 Apr 2020 16:44:44 +0300
Message-Id: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use devm_platform_ioremap_resource() instead of
platform_get_resource() + devm_ioremap_resource().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/i2c/busses/i2c-designware-platdrv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index c429d664f6555..5b090480aa03e 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -157,12 +157,10 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
 static int dw_i2c_of_configure(struct platform_device *pdev)
 {
 	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
-	struct resource *mem;
 
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_MSCC_OCELOT:
-		mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		dev->ext = devm_ioremap_resource(&pdev->dev, mem);
+		dev->ext = devm_platform_ioremap_resource(pdev, 1);
 		if (!IS_ERR(dev->ext))
 			dev->set_sda_hold_time = mscc_twi_set_sda_hold_time;
 		break;
@@ -241,7 +239,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	struct i2c_timings *t;
 	u32 acpi_speed;
-	struct resource *mem;
 	int i, irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
@@ -252,8 +249,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(&pdev->dev, mem);
+	dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->base))
 		return PTR_ERR(dev->base);
 
-- 
2.26.2

