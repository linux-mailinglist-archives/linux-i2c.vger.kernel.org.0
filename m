Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3D49710F79
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 17:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241648AbjEYPYk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 11:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241201AbjEYPYk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 11:24:40 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F3AA3;
        Thu, 25 May 2023 08:24:39 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QRsHd2vpDz67htt;
        Thu, 25 May 2023 23:22:37 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:24:37 +0100
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
Subject: [RFC PATCH 5/6] HACK: i2c: aspeed: Comment the clock and reset out.
Date:   Thu, 25 May 2023 16:22:02 +0100
Message-ID: <20230525152203.32190-6-Jonathan.Cameron@huawei.com>
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
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Needs tidying up - hopefully can do clock right
using on going work from Niyas
https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28832333867/ACPI+Clock+Management

Don't think ACPI provide an equivalent reset deasert / assert. _RST
doesn't fit that model.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index adbb93444d7a..df20382970f3 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -986,20 +986,21 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	if (IS_ERR(bus->base))
 		return PTR_ERR(bus->base);
 
-	parent_clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(parent_clk))
-		return PTR_ERR(parent_clk);
-	bus->parent_clk_frequency = clk_get_rate(parent_clk);
+	//	parent_clk = devm_clk_get(&pdev->dev, NULL);
+	//	if (IS_ERR(parent_clk))//
+	//		return PTR_ERR(parent_clk);
+	bus->parent_clk_frequency = 1000000;//clk_get_rate(parent_clk);
 	/* We just need the clock rate, we don't actually use the clk object. */
-	devm_clk_put(&pdev->dev, parent_clk);
+	//devm_clk_put(&pdev->dev, parent_clk);
 
 	bus->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
 	if (IS_ERR(bus->rst)) {
-		dev_err(&pdev->dev,
+		dev_warn(&pdev->dev,
 			"missing or invalid reset controller device tree entry\n");
-		return PTR_ERR(bus->rst);
+		bus->rst = 0;
+	} else {
+		reset_control_deassert(bus->rst);
 	}
-	reset_control_deassert(bus->rst);
 
 	ret = device_property_read_u32(&pdev->dev,
 				   "bus-frequency", &bus->bus_frequency);
-- 
2.39.2

