Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2633C5B09D2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 18:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbiIGQNY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 12:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiIGQNX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 12:13:23 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821632C11C;
        Wed,  7 Sep 2022 09:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662567201; x=1694103201;
  h=from:to:cc:subject:date:message-id;
  bh=Nx52cfZBgHEDVGbIXDBbvnQ4tX3e80B0C31V08dy/i4=;
  b=VbLomCCo9haX2QYwxDbza8YskVfMFUZGmf1gJ5AjIB5I0nD+Q3PcAQWW
   8to1O9m2psDb4ZUOsdInGNNlGdv0fkgwbK/HFY8r9LhhAuTY2wvjH2IEf
   P8T3DmQ/jpmOl68xVu/Gd4xdcKlvk5KiEt5qUC8VPGQbJidmYOdLbIvcR
   eAvA/gZfpfgeRPS8JEAjdngaP1Kejop8p+5zdU8kWUtmv420Vc6sw4vWU
   Ga57bwPsihJ/FBpNb3YkkogtuykIBSCTw4x2njvaDLa33oNdPkqiz6Lx7
   gFnqq+MSco0IBJ6+z9IOrIJs7YsPfhZRYTqfMhuvs3WOaSmjY0mlwCxWj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="298240923"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="298240923"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 09:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="756831312"
Received: from inesxmail01.iind.intel.com ([10.223.154.20])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2022 09:09:23 -0700
Received: from inlubt0246.localdomain (inlubt0246.iind.intel.com [10.67.198.165])
        by inesxmail01.iind.intel.com (Postfix) with ESMTP id 9768E15B53;
        Wed,  7 Sep 2022 21:39:22 +0530 (IST)
Received: by inlubt0246.localdomain (Postfix, from userid 11529313)
        id 8E2465F761; Wed,  7 Sep 2022 21:39:22 +0530 (IST)
From:   Sudarshan Ravula <sudarshan.ravula@intel.com>
To:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        sudarshan.ravula@intel.com, pandith.n@intel.com,
        lakshmi.sowjanya.d@intel.com
Subject: [PATCH v1] i2c: designware: Add support to get I2C related timing parameters from firmware.
Date:   Wed,  7 Sep 2022 21:39:20 +0530
Message-Id: <20220907160920.22006-1-sudarshan.ravula@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Similar to I2C designware platform driver add i2c_parse_fw_timings() in
PCI driver, to get I2C related timing parameters from firmware.

Signed-off-by: Sudarshan Ravula <sudarshan.ravula@intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 608e61209455..c001719209be 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -243,6 +243,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	int r;
 	struct dw_pci_controller *controller;
 	struct dw_scl_sda_cfg *cfg;
+	struct i2c_timings *t;
 
 	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers))
 		return dev_err_probe(&pdev->dev, -EINVAL,
@@ -272,12 +273,14 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		return r;
 
 	dev->get_clk_rate_khz = controller->get_clk_rate_khz;
-	dev->timings.bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 	dev->base = pcim_iomap_table(pdev)[0];
 	dev->dev = &pdev->dev;
 	dev->irq = pci_irq_vector(pdev, 0);
 	dev->flags |= controller->flags;
 
+	t = &dev->timings;
+	i2c_parse_fw_timings(&pdev->dev, t, false);
+
 	pci_set_drvdata(pdev, dev);
 
 	if (controller->setup) {
-- 
2.17.1

