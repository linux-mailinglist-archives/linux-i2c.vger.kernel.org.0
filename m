Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10ED95EE1B0
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Sep 2022 18:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbiI1QVP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Sep 2022 12:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233631AbiI1QVN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Sep 2022 12:21:13 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596B42E9C2;
        Wed, 28 Sep 2022 09:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664382072; x=1695918072;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sbiNaRFjNY6cqTyWmKgrWc9nZINoDnXdDFJWNkIE2P8=;
  b=fF75+6Y66dbjR3bPQEeCB6xeQ6SYYlbYZYbjalXbsYBwpZCZ4V90ez17
   sU+1TMPVWuLu7XXCjWze2ThJpmdMqPWd3jrPaT6OQe6CI+ghb+Eels6+7
   YKC//o9rD8fOEZWmbVump6UNggARgMEVOLQdvYKneRGdNXRYAYEJKSRTl
   DqCTLeoAOpl6y6xnyS2rIMaD9VVcG8jdko39a5Sg9B9zgBEjkjh0FmrrI
   mahZX7XWyrXeRxDXRXozrqxQsLeCHCUyy9pd10kW6ZYbFNu1Zdq7X/5FS
   qZgySXU6LK1qNJY6741ZQ/d+BMAR2/6a+KQVP4QqJoMMmXYUlRNooO2+L
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="288805364"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; 
   d="scan'208";a="288805364"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 09:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="599634413"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; 
   d="scan'208";a="599634413"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 28 Sep 2022 09:21:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C0C5E235; Wed, 28 Sep 2022 19:21:20 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v1 1/2] i2c: designware-pci: Group AMD NAVI quirk parts together
Date:   Wed, 28 Sep 2022 19:21:15 +0300
Message-Id: <20220928162116.66724-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The code is ogranazed in a way that all related parts to
the certain platform quirk go toghether. This is not the
case for AMD NAVI. Shuffle code to make it happen.

While at it, drop the frequency definition and use
hard coded value as it's done for other platforms and
add a comment to the PCI ID list.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 30 +++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index c001719209be..6e8a9d26563a 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -27,7 +27,6 @@
 #include "i2c-ccgx-ucsi.h"
 
 #define DRIVER_NAME "i2c-designware-pci"
-#define AMD_CLK_RATE_HZ	100000
 
 enum dw_pci_ctl_id_t {
 	medfield,
@@ -100,11 +99,6 @@ static u32 mfld_get_clk_rate_khz(struct dw_i2c_dev *dev)
 	return 25000;
 }
 
-static u32 navi_amd_get_clk_rate_khz(struct dw_i2c_dev *dev)
-{
-	return AMD_CLK_RATE_HZ;
-}
-
 static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
@@ -126,15 +120,6 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 	return -ENODEV;
 }
 
-static int navi_amd_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
-{
-	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
-
-	dev->flags |= MODEL_AMD_NAVI_GPU;
-	dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
-	return 0;
-}
-
 static int mrfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
 	/*
@@ -159,6 +144,20 @@ static u32 ehl_get_clk_rate_khz(struct dw_i2c_dev *dev)
 	return 100000;
 }
 
+static u32 navi_amd_get_clk_rate_khz(struct dw_i2c_dev *dev)
+{
+	return 100000;
+}
+
+static int navi_amd_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
+{
+	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
+
+	dev->flags |= MODEL_AMD_NAVI_GPU;
+	dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
+	return 0;
+}
+
 static struct dw_pci_controller dw_pci_controllers[] = {
 	[medfield] = {
 		.bus_num = -1,
@@ -392,6 +391,7 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x4bbe), elkhartlake },
 	{ PCI_VDEVICE(INTEL, 0x4bbf), elkhartlake },
 	{ PCI_VDEVICE(INTEL, 0x4bc0), elkhartlake },
+	/* AMD NAVI */
 	{ PCI_VDEVICE(ATI,  0x7314), navi_amd },
 	{ PCI_VDEVICE(ATI,  0x73a4), navi_amd },
 	{ PCI_VDEVICE(ATI,  0x73e4), navi_amd },
-- 
2.35.1

