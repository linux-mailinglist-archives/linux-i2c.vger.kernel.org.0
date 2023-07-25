Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4147E761BB5
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 16:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbjGYOaY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 10:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbjGYOaW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 10:30:22 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ED091;
        Tue, 25 Jul 2023 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690295422; x=1721831422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CIw2IxUCCqjyWS0CA3LTB+Jmwhhx7Qzi2MvLY6OymHs=;
  b=iAT1YKHjZ7Z2Nla8qqdgAHtWceL8PCrQTlZVBblKUx0a0GXeg5nCNwCK
   7taYxgrFLHFLgnQBxDs76gUHTq0x8JNb0Kj2AcWqJSpHEg0KRAUD/uyd3
   fz4OUcsnmWg83rzgnWK/hKY+fPbUzc16FjxGm/bqnaAnS8Btyl1iwtiG7
   Qwy5Bhc/B7L5Vaw+IKnop4mzksdP59AA0T+tJFABuP9/c/dnFWxRyBnud
   7YxRYis0GCyGDTJTsDNrX1XRxfkgwNWsdnUnVQHhEOVx7UpEA437dwhXA
   HS2D9bR4JP4751EB70JnlEQbIOq64Kp0el8qInLBPXm0JUkbbS8C//qlg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="433992461"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="433992461"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="1056804937"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="1056804937"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2023 07:30:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 96B1D155; Tue, 25 Jul 2023 17:30:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 1/9] i2c: designware: Move has_acpi_companion() to common code
Date:   Tue, 25 Jul 2023 17:30:15 +0300
Message-Id: <20230725143023.86325-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of checking in callers, move the call to the callee.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 11 +++++++++--
 drivers/i2c/busses/i2c-designware-pcidrv.c  |  3 +--
 drivers/i2c/busses/i2c-designware-platdrv.c |  3 +--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index cdd8c67d9129..683f7a9beb46 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -255,9 +255,8 @@ static void i2c_dw_acpi_params(struct device *device, char method[],
 	kfree(buf.pointer);
 }
 
-int i2c_dw_acpi_configure(struct device *device)
+static void i2c_dw_acpi_do_configure(struct dw_i2c_dev *dev, struct device *device)
 {
-	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 	struct i2c_timings *t = &dev->timings;
 	u32 ss_ht = 0, fp_ht = 0, hs_ht = 0, fs_ht = 0;
 
@@ -285,6 +284,14 @@ int i2c_dw_acpi_configure(struct device *device)
 		dev->sda_hold_time = fs_ht;
 		break;
 	}
+}
+
+int i2c_dw_acpi_configure(struct device *device)
+{
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
+
+	if (has_acpi_companion(device))
+		i2c_dw_acpi_do_configure(dev, device);
 
 	return 0;
 }
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 61d7a27aa070..d9d80650fbdc 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -303,8 +303,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	i2c_dw_adjust_bus_speed(dev);
 
-	if (has_acpi_companion(&pdev->dev))
-		i2c_dw_acpi_configure(&pdev->dev);
+	i2c_dw_acpi_configure(&pdev->dev);
 
 	r = i2c_dw_validate_speed(dev);
 	if (r) {
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 970c1c3b0402..4eedb0734438 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -314,8 +314,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (pdev->dev.of_node)
 		dw_i2c_of_configure(pdev);
 
-	if (has_acpi_companion(&pdev->dev))
-		i2c_dw_acpi_configure(&pdev->dev);
+	i2c_dw_acpi_configure(&pdev->dev);
 
 	ret = i2c_dw_validate_speed(dev);
 	if (ret)
-- 
2.40.0.1.gaa8946217a0b

