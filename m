Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB5BD71657E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 16:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbjE3O7g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 10:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbjE3O72 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 10:59:28 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA57114;
        Tue, 30 May 2023 07:59:05 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QVwQS2KXmz6J7S1;
        Tue, 30 May 2023 22:54:08 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 15:59:02 +0100
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
Subject: [RFC PATCH v2 6/6] HACK: i2c: aspeed: Comment clock out and make reset optional
Date:   Tue, 30 May 2023 15:56:01 +0100
Message-ID: <20230530145601.2592-7-Jonathan.Cameron@huawei.com>
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
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Needs tidying up - hopefully can do clock right using ongoing
work from Niyas
https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28832333867/ACPI+Clock+Management

ACPI does not provide an equivalent reset deassert / assert. _RST
doesn't fit that model, so for now make the reset optional.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v2:
 - Use optional variant for the reset.
 - Left the clock with the hideous hack to keep it obvious that it is
   a hack given no way for us to get the clk rate on ACPI firmware yet
   and I don't want to pretend there is.
---
 drivers/i2c/busses/i2c-aspeed.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index ae8e187f2233..f0b5789aee21 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -986,14 +986,14 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
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

