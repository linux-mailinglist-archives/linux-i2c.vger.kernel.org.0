Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66DC77D2C5A
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 10:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbjJWINP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 04:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjJWINK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 04:13:10 -0400
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A3210C3;
        Mon, 23 Oct 2023 01:13:07 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 39N8CWdJ060171;
        Mon, 23 Oct 2023 16:12:32 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4SDSVd1qp2z2KkWG6;
        Mon, 23 Oct 2023 16:08:09 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 23 Oct
 2023 16:12:29 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH V2 4/7] i2c: sprd: Add I2C controller driver to support dynamic switching of 400K/1M/3.4M frequency
Date:   Mon, 23 Oct 2023 16:11:55 +0800
Message-ID: <20231023081158.10654-5-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 39N8CWdJ060171
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When I2C-slaves supporting different frequencies use the same I2C
controller, the I2C controller usually only operates at lower frequencies.
In order to improve the performance of I2C-slaves transmission supporting
faster frequencies, we dynamically configure the I2C operating frequency
based on the value of the input parameter msg ->flag.

Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 101 +++++++++++++++++++---------------
 1 file changed, 57 insertions(+), 44 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index dec627ef408c..f1f7fad42ecd 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -75,7 +75,14 @@
 #define SPRD_I2C_PM_TIMEOUT	1000
 /* timeout (ms) for transfer message */
 #define I2C_XFER_TIMEOUT	1000
-
+/* dynamic modify clk_freq flag  */
+#define I2C_3M4_FLAG		0x0100
+#define I2C_1M_FLAG		0x0080
+#define I2C_400K_FLAG		0x0040
+
+#define I2C_FREQ_400K		400000
+#define I2C_FREQ_1M		1000000
+#define I2C_FREQ_3_4M		3400000
 /* SPRD i2c data structure */
 struct sprd_i2c {
 	struct i2c_adapter adap;
@@ -94,6 +101,49 @@ struct sprd_i2c {
 	int err;
 };
 
+static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
+{
+	u32 apb_clk = i2c_dev->src_clk;
+	/*
+	 * From I2C databook, the prescale calculation formula:
+	 * prescale = freq_i2c / (4 * freq_scl) - 1;
+	 */
+	u32 i2c_dvd = apb_clk / (4 * freq) - 1;
+	/*
+	 * From I2C databook, the high period of SCL clock is recommended as
+	 * 40% (2/5), and the low period of SCL clock is recommended as 60%
+	 * (3/5), then the formula should be:
+	 * high = (prescale * 2 * 2) / 5
+	 * low = (prescale * 2 * 3) / 5
+	 */
+	u32 high = ((i2c_dvd << 1) * 2) / 5;
+	u32 low = ((i2c_dvd << 1) * 3) / 5;
+	u32 div0 = I2C_ADDR_DVD0_CALC(high, low);
+	u32 div1 = I2C_ADDR_DVD1_CALC(high, low);
+
+	writel(div0, i2c_dev->base + ADDR_DVD0);
+	writel(div1, i2c_dev->base + ADDR_DVD1);
+
+	/* Start hold timing = hold time(us) * source clock */
+	switch (freq) {
+	case I2C_MAX_STANDARD_MODE_FREQ:
+		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
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
+}
+
 static void sprd_i2c_set_count(struct sprd_i2c *i2c_dev, u32 count)
 {
 	writel(count, i2c_dev->base + I2C_COUNT);
@@ -269,6 +319,12 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 		sprd_i2c_send_stop(i2c_dev, !!is_last_msg);
 	}
 
+	if (msg->flags & I2C_400K_FLAG)
+		sprd_i2c_set_clk(i2c_dev, I2C_FREQ_400K);
+	else if (msg->flags & I2C_1M_FLAG)
+		sprd_i2c_set_clk(i2c_dev, I2C_FREQ_1M);
+	else if (msg->flags & I2C_3M4_FLAG)
+		sprd_i2c_set_clk(i2c_dev, I2C_FREQ_3_4M);
 	/*
 	 * We should enable rx fifo full interrupt to get data when receiving
 	 * full data.
@@ -331,49 +387,6 @@ static const struct i2c_algorithm sprd_i2c_algo = {
 	.functionality = sprd_i2c_func,
 };
 
-static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
-{
-	u32 apb_clk = i2c_dev->src_clk;
-	/*
-	 * From I2C databook, the prescale calculation formula:
-	 * prescale = freq_i2c / (4 * freq_scl) - 1;
-	 */
-	u32 i2c_dvd = apb_clk / (4 * freq) - 1;
-	/*
-	 * From I2C databook, the high period of SCL clock is recommended as
-	 * 40% (2/5), and the low period of SCL clock is recommended as 60%
-	 * (3/5), then the formula should be:
-	 * high = (prescale * 2 * 2) / 5
-	 * low = (prescale * 2 * 3) / 5
-	 */
-	u32 high = ((i2c_dvd << 1) * 2) / 5;
-	u32 low = ((i2c_dvd << 1) * 3) / 5;
-	u32 div0 = I2C_ADDR_DVD0_CALC(high, low);
-	u32 div1 = I2C_ADDR_DVD1_CALC(high, low);
-
-	writel(div0, i2c_dev->base + ADDR_DVD0);
-	writel(div1, i2c_dev->base + ADDR_DVD1);
-
-	/* Start hold timing = hold time(us) * source clock */
-	switch (freq) {
-	case I2C_MAX_STANDARD_MODE_FREQ:
-		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
-		break;
-	case I2C_MAX_FAST_MODE_FREQ:
-		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
-		break;
-	case I2C_MAX_FAST_MODE_PLUS_FREQ:
-		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
-		break;
-	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
-		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
-		break;
-	default:
-		dev_err(i2c_dev->dev, "Unsupported frequency: %d\n", freq);
-		break;
-	}
-}
-
 static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
 {
 	u32 tmp = I2C_DVD_OPT;
-- 
2.17.1

