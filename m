Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6517E7166
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344906AbjKIS2j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344938AbjKIS2j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:28:39 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAEE53C04;
        Thu,  9 Nov 2023 10:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699554516; x=1731090516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ch0lC4UnRy1QhfAy373rOTcUXFIZuCfpMxMzn+asH0A=;
  b=kZLgWGs9KES7mVnD70pmd8EGvOOLRjSTMfhz0w6gl04JPZeBS5LZxKKE
   L2Y2Ei0SW31C4RcDUt21qAjl8S9Z/llVNR+iM9WailHoXhafpV8MqHbgL
   HubSNnlsIbB+5nUYn4ddLRg/G1USVXSf1x46Mg3IPTOwUiQmY0BP7ecb6
   SI2ex5bH7yOsXP+9qfORFdpgRuS56xTWz94NhLEg0C3ULh8oIfQXQ13rz
   JVsRoMPy3k5fSSCwG1W2C/LipOWi9t8YE/puAOzD3bnkbV4WpSVCHKNgk
   KBRhi7R6TtUYex7T0mYh8SycI1uTWXNUsicfJSsjp5siqj1yOxyBBFCd4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="375088660"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="375088660"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="767086813"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="767086813"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2023 10:28:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 51A3E35A; Thu,  9 Nov 2023 20:28:32 +0200 (EET)
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
Subject: [PATCH v2 01/12] i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
Date:   Thu,  9 Nov 2023 20:19:11 +0200
Message-ID: <20231109182823.3531846-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1996.gbec44491f096
In-Reply-To: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As Krzysztof Kozlowski pointed out the better is to use
MODULE_DEVICE_TABLE() as it will be consistent with the content
of the real ID table of the platform devices.

While at it, drop unneeded and unused module alias in PCI glue
driver as PCI already has its own ID table and automatic loading
should just work.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 --
 drivers/i2c/busses/i2c-designware-platdrv.c | 8 ++++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 61d7a27aa070..bfafebecf680 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -424,8 +424,6 @@ static struct pci_driver dw_i2c_driver = {
 };
 module_pci_driver(dw_i2c_driver);
 
-/* Work with hotplug and coldplug */
-MODULE_ALIAS("i2c_designware-pci");
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 855b698e99c0..cb7796b57085 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -479,8 +479,11 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
 	RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
 };
 
-/* Work with hotplug and coldplug */
-MODULE_ALIAS("platform:i2c_designware");
+static const struct platform_device_id dw_i2c_platform_ids[] = {
+	{ "i2c_designware" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, dw_i2c_platform_ids);
 
 static struct platform_driver dw_i2c_driver = {
 	.probe = dw_i2c_plat_probe,
@@ -491,6 +494,7 @@ static struct platform_driver dw_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
 		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
 	},
+	.id_table = dw_i2c_platform_ids,
 };
 
 static int __init dw_i2c_init_driver(void)
-- 
2.40.0.1996.gbec44491f096

