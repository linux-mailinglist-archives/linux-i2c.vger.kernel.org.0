Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E36602594
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Oct 2022 09:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiJRHW3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Oct 2022 03:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiJRHWS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Oct 2022 03:22:18 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A884DAB827;
        Tue, 18 Oct 2022 00:22:16 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ms4wd5ssxzpVdX;
        Tue, 18 Oct 2022 15:18:57 +0800 (CST)
Received: from localhost (10.175.101.6) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 15:22:10 +0800
From:   Weilong Chen <chenweilong@huawei.com>
To:     <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <xuwei5@huawei.com>, <wsa@kernel.org>, <robh+dt@kernel.org>,
        <robh@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH next v6 1/2] i2c: hisi: Add initial device tree support
Date:   Tue, 18 Oct 2022 15:30:11 +0800
Message-ID: <20221018073012.309355-1-chenweilong@huawei.com>
X-Mailer: git-send-email 2.31.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The HiSilicon I2C controller can be used on embedded platform, which
boot from devicetree.

Signed-off-by: Weilong Chen <chenweilong@huawei.com>
---
Change since v5:
- Use hisilicon,i2c-ascend910 as compatible string. For more information about
  the SoC at https://e.huawei.com/en/products/cloud-computing-dc/atlas/ascend-910
Link: https://lore.kernel.org/linux-i2c/20220920072215.161331-1-chenweilong@huawei.com/

Change since v4:
- Remove the protection for the headers for ACPI/OF
Link: https://lore.kernel.org/lkml/20220909074842.281232-1-chenweilong@huawei.com/T/

 drivers/i2c/busses/Kconfig    |  2 +-
 drivers/i2c/busses/i2c-hisi.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 264e780ae32e..a2081c03f3c4 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -673,7 +673,7 @@ config I2C_HIGHLANDER
 
 config I2C_HISI
 	tristate "HiSilicon I2C controller"
-	depends on (ARM64 && ACPI) || COMPILE_TEST
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Say Y here if you want to have Hisilicon I2C controller support
 	  available on the Kunpeng Server.
diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index 76c3d8f6fc3c..d58a6d2f1bc6 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2021 HiSilicon Technologies Co., Ltd.
  */
 
+#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/bitfield.h>
 #include <linux/completion.h>
@@ -13,6 +14,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/units.h>
@@ -483,17 +485,28 @@ static int hisi_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id hisi_i2c_acpi_ids[] = {
 	{ "HISI03D1", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hisi_i2c_acpi_ids);
+#endif
+
+#ifdef CONFIG_OF
+static const struct of_device_id hisi_i2c_dts_ids[] = {
+	{ .compatible = "hisilicon,i2c-ascend910", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, hisi_i2c_dts_ids);
+#endif
 
 static struct platform_driver hisi_i2c_driver = {
 	.probe		= hisi_i2c_probe,
 	.driver		= {
 		.name	= "hisi-i2c",
-		.acpi_match_table = hisi_i2c_acpi_ids,
+		.acpi_match_table = ACPI_PTR(hisi_i2c_acpi_ids),
+		.of_match_table = of_match_ptr(hisi_i2c_dts_ids),
 	},
 };
 module_platform_driver(hisi_i2c_driver);
-- 
2.31.GIT

