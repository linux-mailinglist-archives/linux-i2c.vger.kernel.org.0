Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51A4761BB4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 16:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjGYOaW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 10:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbjGYOaV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 10:30:21 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11D6C1;
        Tue, 25 Jul 2023 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690295421; x=1721831421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q0panVSTYmCRKnbyNukBF1nR+Y6nQu5AGzXVPFd7XFI=;
  b=YZNoq7xkzsCqgExGPPKevv2f19oNzTQnxzIXmsKOqko5DI4t04uVvDSP
   muPQHxZkEtpEHDiCqf8e4m9DMkDD5JPsJBBwxDeZArYimDfcUUfI3UpBt
   4mf5bal9VcpYVX/qsM5UGFlPWKjcbHWNrAMiLJyZp14i0/+7Q2GPui8RL
   eKubsXaJBZFBM+j4BdLPc2sFmHikRjdiKGLqzOY+/9WonIcAppxrx7YQK
   p3VA1z5jZK9d6s7Rm9o6uZJBIfnU+ak9DSMzbRqXtrYdGRG1JtX3FJgc6
   YUZBkZfc+saKgGrDIRrke5UIIorkCummKd4PY8IABE5MHNy7IGWjWbs5n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="433992455"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="433992455"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="1056804938"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="1056804938"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2023 07:30:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AE4DA2FF; Tue, 25 Jul 2023 17:30:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 3/9] i2c: designware: Align dw_i2c_of_configure() with i2c_dw_acpi_configure()
Date:   Tue, 25 Jul 2023 17:30:17 +0300
Message-Id: <20230725143023.86325-4-andriy.shevchenko@linux.intel.com>
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

For the sake of consistency align dw_i2c_of_configure() with
i2c_dw_acpi_configure() and rename the former to i2c_dw_of_configure().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index c60e55b8398e..d35a6bbcb6fb 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -132,9 +132,9 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static int dw_i2c_of_configure(struct platform_device *pdev)
+static void i2c_dw_of_do_configure(struct dw_i2c_dev *dev, struct device *device)
 {
-	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+	struct platform_device *pdev = to_platform_device(device);
 
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_MSCC_OCELOT:
@@ -145,8 +145,12 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
 	default:
 		break;
 	}
+}
 
-	return 0;
+static void i2c_dw_of_configure(struct dw_i2c_dev *dev)
+{
+	if (dev_of_node(dev->dev))
+		i2c_dw_of_do_configure(dev, dev->dev);
 }
 
 static const struct of_device_id dw_i2c_of_match[] = {
@@ -162,10 +166,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 	return -ENODEV;
 }
 
-static inline int dw_i2c_of_configure(struct platform_device *pdev)
-{
-	return -ENODEV;
-}
+static inline void i2c_dw_of_configure(struct dw_i2c_dev *dev) { }
 #endif
 
 static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
@@ -311,9 +312,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	i2c_dw_adjust_bus_speed(dev);
 
-	if (pdev->dev.of_node)
-		dw_i2c_of_configure(pdev);
-
+	i2c_dw_of_configure(dev);
 	i2c_dw_acpi_configure(dev);
 
 	ret = i2c_dw_validate_speed(dev);
-- 
2.40.0.1.gaa8946217a0b

