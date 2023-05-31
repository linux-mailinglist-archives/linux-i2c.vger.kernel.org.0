Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC30717CD9
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 12:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235823AbjEaKIG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 06:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235819AbjEaKIE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 06:08:04 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9A111D;
        Wed, 31 May 2023 03:08:03 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QWPzw09Lkz6D8yj;
        Wed, 31 May 2023 18:06:20 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 11:08:00 +0100
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
Subject: [RFC PATCH v3 4/7] i2c: aspeed: use a function pointer type def for clk_reg_val callback
Date:   Wed, 31 May 2023 11:05:57 +0100
Message-ID: <20230531100600.13543-5-Jonathan.Cameron@huawei.com>
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

Rather than having to define the parameter types of this function
in multiple places, use a single typedef.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v3: New patch to switch to a function pointer as suggested by Andy.
---
 drivers/i2c/busses/i2c-aspeed.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 4363bfe06f9b..be93de56f7e4 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -137,6 +137,8 @@ enum aspeed_i2c_slave_state {
 	ASPEED_I2C_SLAVE_STOP,
 };
 
+typedef u32 (*aspeed_get_clk_reg_val_cb)(struct device *dev, u32 divisor);
+
 struct aspeed_i2c_bus {
 	struct i2c_adapter		adap;
 	struct device			*dev;
@@ -145,8 +147,7 @@ struct aspeed_i2c_bus {
 	/* Synchronizes I/O mem access to base. */
 	spinlock_t			lock;
 	struct completion		cmd_complete;
-	u32				(*get_clk_reg_val)(struct device *dev,
-							   u32 divisor);
+	aspeed_get_clk_reg_val_cb	get_clk_reg_val;
 	unsigned long			parent_clk_frequency;
 	u32				bus_frequency;
 	/* Transaction state. */
@@ -1011,8 +1012,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	if (!match)
 		bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
 	else
-		bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
-				match->data;
+		bus->get_clk_reg_val = (aspeed_get_clk_reg_val_cb)(match->data);
 
 	/* Initialize the I2C adapter */
 	spin_lock_init(&bus->lock);
-- 
2.39.2

