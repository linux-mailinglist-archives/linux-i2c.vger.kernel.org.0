Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64D697E7171
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345030AbjKIS2o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345014AbjKIS2m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:28:42 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED3A3C05;
        Thu,  9 Nov 2023 10:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699554520; x=1731090520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7CmFR+naMyItEiHSLEGMk+csTHhFMkqMImr3uUC48S8=;
  b=JRTsvz5mTphTz4QiyFz3xkRpAC7SZoSWTjvZV5FG6l7CVQqIB6aoP/cM
   LhFtiZYjKBY0uJzYqWaaOSv8nAcAhON04uy++FsFWUsZzu4ZUm2dUb6H3
   /49qhfJXeOz1KEQ0KjOLvPZqUVAacxIMgmLnEIBBCri0qgTaemkso4uBp
   4I7IHkWppEYmIl8P7SDfZDArcsryb0zjMbQFMFN57QzVkO21UepK+2oo/
   GgWKU6xeBvYh0cHAqCca/S3mi7x4fELGWPgTVUsh6OkpK5dFPh0+WRO4E
   hXwxvqDf4DiBZVy/1iKWiC2wriB2LV1oqaRdU26kGKp44h4TYmVldo9YW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="375088690"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="375088690"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:28:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="767086845"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="767086845"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2023 10:28:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8821E76F; Thu,  9 Nov 2023 20:28:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 05/12] i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
Date:   Thu,  9 Nov 2023 20:19:15 +0200
Message-ID: <20231109182823.3531846-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1996.gbec44491f096
In-Reply-To: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For the sake of consistency, rename dw_i2c_of_configure() and change
its parameter to be aligned with the i2c_dw_acpi_configure().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index af772a2c7fb6..c55fff3df8ca 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -110,9 +110,10 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static void dw_i2c_of_configure(struct platform_device *pdev)
+static void i2c_dw_of_configure(struct device *device)
 {
-	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+	struct platform_device *pdev = to_platform_device(device);
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_MSCC_OCELOT:
@@ -130,7 +131,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 	return -ENODEV;
 }
 
-static inline void dw_i2c_of_configure(struct platform_device *pdev)
+static inline void i2c_dw_of_configure(struct device *device)
 {
 }
 #endif
@@ -279,7 +280,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	i2c_dw_adjust_bus_speed(dev);
 
 	if (pdev->dev.of_node)
-		dw_i2c_of_configure(pdev);
+		i2c_dw_of_configure(&pdev->dev);
 
 	if (has_acpi_companion(&pdev->dev))
 		i2c_dw_acpi_configure(&pdev->dev);
-- 
2.40.0.1996.gbec44491f096

