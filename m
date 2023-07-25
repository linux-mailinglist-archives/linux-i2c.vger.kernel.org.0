Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A29761BBA
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 16:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbjGYOab (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 10:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbjGYOa1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 10:30:27 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B13FC1;
        Tue, 25 Jul 2023 07:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690295424; x=1721831424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ay9M/6TwspgCJ4dv7YUO7ixFZ72HsZADzUf4vE1ngVI=;
  b=LrsH63Y+I30d5pYJE5osDPo5Eb3UIkOSr9I1wsEm0a5GOKagpGPRa7y6
   yAMJTVLp3Jj1ZPx6lb9BcC6CqZdUl9GX6ipaV2mLDUiO+e7VX72ly4f3A
   MmbLYN6ePfe4BEo56UyWY3k1IEXWXR8YPgCUaS+vTaaIhlOTwL5akeJEn
   gZ6+ytolSqsr8Q7JpqmnvX6GBEmS+tPShKbFVNeQk/dxWt8v7d1RmzNu5
   WT8Z4Xpv7IjEBlNwUodZQT709ub4smuYnEvE7oOwhwhslEOESPGxQJUEx
   /uSpWAFS+OgocFfT3T5ZYISq+P5TG8dcCp8/o+FZoF7kl2LoFKdKQkbCJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357742871"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="357742871"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869491423"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2023 07:30:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A5E682E9; Tue, 25 Jul 2023 17:30:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 2/9] i2c: designware: Change i2c_dw_acpi_configure() prototype
Date:   Tue, 25 Jul 2023 17:30:16 +0300
Message-Id: <20230725143023.86325-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no point to have it being int and at the same time
it may take struct dw_i2c_dev pointer instead of plain device.

Change the prototype and implementation accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 10 +++-------
 drivers/i2c/busses/i2c-designware-core.h    |  4 ++--
 drivers/i2c/busses/i2c-designware-pcidrv.c  |  2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  2 +-
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 683f7a9beb46..222b530c0441 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -286,14 +286,10 @@ static void i2c_dw_acpi_do_configure(struct dw_i2c_dev *dev, struct device *devi
 	}
 }
 
-int i2c_dw_acpi_configure(struct device *device)
+void i2c_dw_acpi_configure(struct dw_i2c_dev *dev)
 {
-	struct dw_i2c_dev *dev = dev_get_drvdata(device);
-
-	if (has_acpi_companion(device))
-		i2c_dw_acpi_do_configure(dev, device);
-
-	return 0;
+	if (has_acpi_companion(dev->dev))
+		i2c_dw_acpi_do_configure(dev, dev->dev);
 }
 EXPORT_SYMBOL_GPL(i2c_dw_acpi_configure);
 
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index cf4f684f5356..03f4d44ae94c 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -394,7 +394,7 @@ int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
 void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_ACPI)
-int i2c_dw_acpi_configure(struct device *device);
+void i2c_dw_acpi_configure(struct dw_i2c_dev *dev);
 #else
-static inline int i2c_dw_acpi_configure(struct device *device) { return -ENODEV; }
+static inline void i2c_dw_acpi_configure(struct dw_i2c_dev *dev) { }
 #endif
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index d9d80650fbdc..7f5a04538c71 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -303,7 +303,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	i2c_dw_adjust_bus_speed(dev);
 
-	i2c_dw_acpi_configure(&pdev->dev);
+	i2c_dw_acpi_configure(dev);
 
 	r = i2c_dw_validate_speed(dev);
 	if (r) {
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 4eedb0734438..c60e55b8398e 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -314,7 +314,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (pdev->dev.of_node)
 		dw_i2c_of_configure(pdev);
 
-	i2c_dw_acpi_configure(&pdev->dev);
+	i2c_dw_acpi_configure(dev);
 
 	ret = i2c_dw_validate_speed(dev);
 	if (ret)
-- 
2.40.0.1.gaa8946217a0b

