Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 901EE7A9EA9
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 22:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjIUUI3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 16:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbjIUT7o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 15:59:44 -0400
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DF456D3A;
        Thu, 21 Sep 2023 10:18:27 -0700 (PDT)
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
        by SHSQR01.spreadtrum.com with ESMTP id 38L8vCPM047518;
        Thu, 21 Sep 2023 16:57:12 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 38L8tTPm040533;
        Thu, 21 Sep 2023 16:55:29 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Rrq093gD3z2SZtbS;
        Thu, 21 Sep 2023 16:52:09 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 21 Sep
 2023 16:55:28 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH V2 1/7] i2c: sprd: Add configurations that support 1Mhz and 3.4Mhz frequencies
Date:   Thu, 21 Sep 2023 16:54:51 +0800
Message-ID: <20230921085457.32446-2-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230921085457.32446-1-Huangzheng.Lai@unisoc.com>
References: <20230921085457.32446-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 38L8tTPm040533
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds I2C controller driver support for 1Mhz and 3.4Mhz
frequency configurations.

Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-sprd.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index ffc54fbf814d..b44916c6741d 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -343,10 +343,23 @@ static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
 	writel(div1, i2c_dev->base + ADDR_DVD1);
 
 	/* Start hold timing = hold time(us) * source clock */
-	if (freq == I2C_MAX_FAST_MODE_FREQ)
-		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
-	else if (freq == I2C_MAX_STANDARD_MODE_FREQ)
+	switch (freq) {
+	case I2C_MAX_STANDARD_MODE_FREQ:
 		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
+		break;
+	case I2C_MAX_FAST_MODE_FREQ:
+		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
+		break;
+	case I2C_MAX_FAST_MODE_PLUS_FREQ:
+		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
+		break;
+	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
+		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
+		break;
+	default:
+		dev_err(i2c_dev->dev, "Unsupported frequency: %d\n", freq);
+		break;
+	}
 }
 
 static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
@@ -519,9 +532,11 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(dev->of_node, "clock-frequency", &prop))
 		i2c_dev->bus_freq = prop;
 
-	/* We only support 100k and 400k now, otherwise will return error. */
+	/* We only support 100k\400k\1m\3.4m now, otherwise will return error. */
 	if (i2c_dev->bus_freq != I2C_MAX_STANDARD_MODE_FREQ &&
-	    i2c_dev->bus_freq != I2C_MAX_FAST_MODE_FREQ)
+			i2c_dev->bus_freq != I2C_MAX_FAST_MODE_FREQ &&
+			i2c_dev->bus_freq != I2C_MAX_FAST_MODE_PLUS_FREQ &&
+			i2c_dev->bus_freq != I2C_MAX_HIGH_SPEED_MODE_FREQ)
 		return -EINVAL;
 
 	ret = sprd_i2c_clk_init(i2c_dev);
-- 
2.17.1

