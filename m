Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18BD3717CD2
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 12:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235811AbjEaKHf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 06:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbjEaKHe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 06:07:34 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABADE5;
        Wed, 31 May 2023 03:07:33 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QWPvY5yYsz6J7g1;
        Wed, 31 May 2023 18:02:33 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 11:07:30 +0100
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
Subject: [RFC PATCH v3 3/7] i2c: aspeed: Don't report error when optional dt bus-frequency not supplied
Date:   Wed, 31 May 2023 11:05:56 +0100
Message-ID: <20230531100600.13543-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531100600.13543-1-Jonathan.Cameron@huawei.com>
References: <20230531100600.13543-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
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

The bindings have this property as optional with a default of 100kHz.
As such the driver should not be printing an error message if it is not
supplied.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 21a2f139f445..4363bfe06f9b 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1003,13 +1003,9 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	}
 	reset_control_deassert(bus->rst);
 
-	ret = of_property_read_u32(pdev->dev.of_node,
-				   "bus-frequency", &bus->bus_frequency);
-	if (ret < 0) {
-		dev_err(&pdev->dev,
-			"Could not read bus-frequency property\n");
-		bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
-	}
+	bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
+	of_property_read_u32(pdev->dev.of_node,
+			     "bus-frequency", &bus->bus_frequency);
 
 	match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
 	if (!match)
-- 
2.39.2

