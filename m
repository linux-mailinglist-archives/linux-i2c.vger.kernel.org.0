Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59B5F717CE0
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 12:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbjEaKJg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 06:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjEaKJg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 06:09:36 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36192E2;
        Wed, 31 May 2023 03:09:35 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QWQ1g5Czcz67N2W;
        Wed, 31 May 2023 18:07:51 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 11:09:32 +0100
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
Subject: [RFC PATCH v3 7/7] HACK: i2c: aspeed: Comment clock out and make reset optional
Date:   Wed, 31 May 2023 11:06:00 +0100
Message-ID: <20230531100600.13543-8-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531100600.13543-1-Jonathan.Cameron@huawei.com>
References: <20230531100600.13543-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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

ACPI does not provide an equivalent reset deassert / assert. _RST
doesn't fit that model, so for now make the reset optional.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v3: Keeping this as an obvious hack rather than moving to something
    that works in the interest of not putting a stop gap solution in
    place.
---
 drivers/i2c/busses/i2c-aspeed.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index e262b06e224b..e29e7effd911 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -987,14 +987,14 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
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
 
-	bus->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
+	bus->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
 	if (IS_ERR(bus->rst)) {
 		dev_err(&pdev->dev,
 			"missing or invalid reset controller device tree entry\n");
-- 
2.39.2

