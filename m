Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8702071657A
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 16:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbjE3O7W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 10:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbjE3O7U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 10:59:20 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F8D18D;
        Tue, 30 May 2023 07:58:47 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QVwTd68Kvz67ydF;
        Tue, 30 May 2023 22:56:53 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 15:58:32 +0100
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
Subject: [RFC PATCH v2 5/6] i2c: aspeed: Set the fwnode for the adap->dev
Date:   Tue, 30 May 2023 15:56:00 +0100
Message-ID: <20230530145601.2592-6-Jonathan.Cameron@huawei.com>
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

This is needed for the bus matching used for ACPI based
i2c client registration.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v2: Drop the separate setting of the of_node. (Thanks Andy)
---
 drivers/i2c/busses/i2c-aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 353834d7ffd5..ae8e187f2233 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1017,7 +1017,6 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	bus->adap.retries = 0;
 	bus->adap.algo = &aspeed_i2c_algo;
 	bus->adap.dev.parent = &pdev->dev;
-	bus->adap.dev.of_node = pdev->dev.of_node;
 	strscpy(bus->adap.name, pdev->name, sizeof(bus->adap.name));
 	i2c_set_adapdata(&bus->adap, bus);
 
@@ -1043,6 +1042,8 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	device_set_node(&bus->adap.dev, dev_fwnode(&pdev->dev));
+
 	ret = i2c_add_adapter(&bus->adap);
 	if (ret < 0)
 		return ret;
-- 
2.39.2

