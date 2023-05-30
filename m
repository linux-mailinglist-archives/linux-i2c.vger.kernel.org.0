Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F00BC716560
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 16:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbjE3O5q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 10:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232793AbjE3O5k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 10:57:40 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D591B129;
        Tue, 30 May 2023 07:57:33 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QVwRw5QWmz6DB9n;
        Tue, 30 May 2023 22:55:24 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 15:57:31 +0100
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
Subject: [RFC PATCH v2 3/6] i2c: aspeed: Don't report error when optional dt bus-frequency not supplied
Date:   Tue, 30 May 2023 15:55:58 +0100
Message-ID: <20230530145601.2592-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530145601.2592-1-Jonathan.Cameron@huawei.com>
References: <20230530145601.2592-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v2: New patch after Andy raised some questions about this property
    and I read the binding doc.
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

