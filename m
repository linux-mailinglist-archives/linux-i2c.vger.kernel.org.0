Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968B9761BC4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 16:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbjGYOau (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 10:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbjGYOai (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 10:30:38 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72280212E;
        Tue, 25 Jul 2023 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690295431; x=1721831431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8TaWx8/qcBHhqolOl0eIoZtNSSLCqM2F0+nB7QMdALU=;
  b=AzeJMQZcuK7YBXv6aeaawxvG9I+HpOfwAGMQZKEotH+gVx820NJcaD/r
   Ms/lMgU23bc35xOpS9MVCR9fSETrLh+WoHiKvYI1FWqLN15N+yiR+v3TR
   jrG7IqyawvqLs4jgXCOAOR5Ps9/MxbFJr0TOXk26p7VRb3YGfiuggb6bz
   hMZ9GwuciPrR38x9B87pj18MgspCRG/vZLfZMJtdoT6t8gjSj8CaAqfhS
   J4tqovycTTo2pUCBcNfvcMaTXeoFOGje6byxFU6kAq2j6XGoq1bNylLlk
   iqjKle/7dO9L5rJlj5l46/Opo1LFkUDIaMnTeSeLzjx3KAhaOyFsO2agZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357742923"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="357742923"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869491478"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2023 07:30:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C39B6376; Tue, 25 Jul 2023 17:30:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 5/9] i2c: designware: Always provide ID tables
Date:   Tue, 25 Jul 2023 17:30:19 +0300
Message-Id: <20230725143023.86325-6-andriy.shevchenko@linux.intel.com>
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

There is no need to have ugly ifdeffery and additional macros
for the ID tables. Always provide them. Since we touch the
ACPI table, make it sorted by ID.

While at it, group MODULE_ALIAS() with other MODULE_*() macros.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 65 ++++++++++-----------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 512fb1d8ddfc..d2ffd041c0c7 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -40,28 +40,6 @@ static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
 	return clk_get_rate(dev->clk) / KILO;
 }
 
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id dw_i2c_acpi_match[] = {
-	{ "INT33C2", 0 },
-	{ "INT33C3", 0 },
-	{ "INT3432", 0 },
-	{ "INT3433", 0 },
-	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
-	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
-	{ "AMD0010", ACCESS_INTR_MASK },
-	{ "AMDI0010", ACCESS_INTR_MASK },
-	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
-	{ "AMDI0510", 0 },
-	{ "APMC0D0F", 0 },
-	{ "HISI02A1", 0 },
-	{ "HISI02A2", 0 },
-	{ "HISI02A3", 0 },
-	{ "HYGO0010", ACCESS_INTR_MASK },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
-#endif
-
 #ifdef CONFIG_OF
 #define BT1_I2C_CTL			0x100
 #define BT1_I2C_CTL_ADDR_MASK		GENMASK(7, 0)
@@ -152,14 +130,6 @@ static void i2c_dw_of_configure(struct dw_i2c_dev *dev)
 	if (dev_of_node(dev->dev))
 		i2c_dw_of_do_configure(dev, dev->dev);
 }
-
-static const struct of_device_id dw_i2c_of_match[] = {
-	{ .compatible = "snps,designware-i2c", },
-	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
-	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
-	{},
-};
-MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
 #else
 static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 {
@@ -485,16 +455,41 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
 #define DW_I2C_DEV_PMOPS NULL
 #endif
 
-/* Work with hotplug and coldplug */
-MODULE_ALIAS("platform:i2c_designware");
+static const struct of_device_id dw_i2c_of_match[] = {
+	{ .compatible = "snps,designware-i2c", },
+	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
+	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
+
+static const struct acpi_device_id dw_i2c_acpi_match[] = {
+	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
+	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
+	{ "AMD0010", ACCESS_INTR_MASK },
+	{ "AMDI0010", ACCESS_INTR_MASK },
+	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
+	{ "AMDI0510", 0 },
+	{ "APMC0D0F", 0 },
+	{ "HISI02A1", 0 },
+	{ "HISI02A2", 0 },
+	{ "HISI02A3", 0 },
+	{ "HYGO0010", ACCESS_INTR_MASK },
+	{ "INT33C2", 0 },
+	{ "INT33C3", 0 },
+	{ "INT3432", 0 },
+	{ "INT3433", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
 
 static struct platform_driver dw_i2c_driver = {
 	.probe = dw_i2c_plat_probe,
 	.remove_new = dw_i2c_plat_remove,
 	.driver		= {
 		.name	= "i2c_designware",
-		.of_match_table = of_match_ptr(dw_i2c_of_match),
-		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
+		.of_match_table = dw_i2c_of_match,
+		.acpi_match_table = dw_i2c_acpi_match,
 		.pm	= DW_I2C_DEV_PMOPS,
 	},
 };
@@ -511,6 +506,8 @@ static void __exit dw_i2c_exit_driver(void)
 }
 module_exit(dw_i2c_exit_driver);
 
+/* Work with hotplug and coldplug */
+MODULE_ALIAS("platform:i2c_designware");
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter");
 MODULE_LICENSE("GPL");
-- 
2.40.0.1.gaa8946217a0b

