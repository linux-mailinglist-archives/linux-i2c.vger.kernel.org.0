Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 581C5710F73
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 17:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241186AbjEYPXl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 11:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241201AbjEYPXk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 11:23:40 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FF7194;
        Thu, 25 May 2023 08:23:38 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QRsH65BCLz67RCM;
        Thu, 25 May 2023 23:22:10 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:23:35 +0100
From:   Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     <linux-i2c@vger.kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>, Niyas Sait <niyas.sait@linaro.org>,
        Klaus Jensen <its@irrelevant.dk>,
        Andy Shevchenko <andy@kernel.org>,
        <linux-acpi@vger.kernel.org>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>,
        <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
        "Viacheslav A . Dubeyko" <viacheslav.dubeyko@bytedance.com>
Subject: [RFC PATCH 3/6] i2c: aspeed: switch to generic fw properties.
Date:   Thu, 25 May 2023 16:22:00 +0100
Message-ID: <20230525152203.32190-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525152203.32190-1-Jonathan.Cameron@huawei.com>
References: <20230525152203.32190-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Not tested on device tree but works nicely for ACPI :)

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 04155c9a50a5..73508fb9dc08 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -18,9 +18,8 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
@@ -975,7 +974,6 @@ MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
 
 static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct aspeed_i2c_bus *bus;
 	struct clk *parent_clk;
 	int irq, ret;
@@ -1003,7 +1001,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	}
 	reset_control_deassert(bus->rst);
 
-	ret = of_property_read_u32(pdev->dev.of_node,
+	ret = device_property_read_u32(&pdev->dev,
 				   "bus-frequency", &bus->bus_frequency);
 	if (ret < 0) {
 		dev_err(&pdev->dev,
@@ -1011,12 +1009,10 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 		bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
-	match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
-	if (!match)
+	bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
+		device_get_match_data(&pdev->dev);
+	if (!bus->get_clk_reg_val)
 		bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
-	else
-		bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
-				match->data;
 
 	/* Initialize the I2C adapter */
 	spin_lock_init(&bus->lock);
-- 
2.39.2

