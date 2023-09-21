Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292237A9EF3
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 22:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbjIUUPn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 16:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbjIUUPa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 16:15:30 -0400
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6F4573E4;
        Thu, 21 Sep 2023 10:18:39 -0700 (PDT)
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
        by SHSQR01.spreadtrum.com with ESMTP id 38L8vJhq047982;
        Thu, 21 Sep 2023 16:57:19 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 38L8tWHj040736;
        Thu, 21 Sep 2023 16:55:32 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Rrq0D4mh7z2SZtbS;
        Thu, 21 Sep 2023 16:52:12 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 21 Sep
 2023 16:55:31 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH V2 5/7] i2c: sprd: Configure the enable bit of the I2C controller before each transmission initiation
Date:   Thu, 21 Sep 2023 16:54:55 +0800
Message-ID: <20230921085457.32446-6-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230921085457.32446-1-Huangzheng.Lai@unisoc.com>
References: <20230921085457.32446-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 38L8tWHj040736
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When a timeout exception occurs in the I2C driver, the I2C controller
will be reset, and after resetting, control bits such as I2C_EN and
I2C_INT_EN will be reset to 0, and the I2C master cannot initiate
Transmission unless sprd_i2c_enable() is executed. To address this issue,
this patch places sprd_i2c_enable() before each transmission initiation
to ensure that the necessary control bits of the I2C controller are
configured.

Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 38 +++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index f1f7fad42ecd..b65729ba7d5a 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -352,6 +352,23 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 	return i2c_dev->err;
 }
 
+static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
+{
+	u32 tmp = I2C_DVD_OPT;
+
+	writel(tmp, i2c_dev->base + I2C_CTL);
+
+	sprd_i2c_set_full_thld(i2c_dev, I2C_FIFO_FULL_THLD);
+	sprd_i2c_set_empty_thld(i2c_dev, I2C_FIFO_EMPTY_THLD);
+
+	sprd_i2c_set_clk(i2c_dev, i2c_dev->bus_freq);
+	sprd_i2c_reset_fifo(i2c_dev);
+	sprd_i2c_clear_irq(i2c_dev);
+
+	tmp = readl(i2c_dev->base + I2C_CTL);
+	writel(tmp | I2C_EN | I2C_INT_EN, i2c_dev->base + I2C_CTL);
+}
+
 static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
 				struct i2c_msg *msgs, int num)
 {
@@ -362,6 +379,8 @@ static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
 	if (ret < 0)
 		return ret;
 
+	sprd_i2c_enable(i2c_dev);
+
 	for (im = 0; im < num - 1; im++) {
 		ret = sprd_i2c_handle_msg(i2c_adap, &msgs[im], 0);
 		if (ret)
@@ -387,23 +406,6 @@ static const struct i2c_algorithm sprd_i2c_algo = {
 	.functionality = sprd_i2c_func,
 };
 
-static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
-{
-	u32 tmp = I2C_DVD_OPT;
-
-	writel(tmp, i2c_dev->base + I2C_CTL);
-
-	sprd_i2c_set_full_thld(i2c_dev, I2C_FIFO_FULL_THLD);
-	sprd_i2c_set_empty_thld(i2c_dev, I2C_FIFO_EMPTY_THLD);
-
-	sprd_i2c_set_clk(i2c_dev, i2c_dev->bus_freq);
-	sprd_i2c_reset_fifo(i2c_dev);
-	sprd_i2c_clear_irq(i2c_dev);
-
-	tmp = readl(i2c_dev->base + I2C_CTL);
-	writel(tmp | I2C_EN | I2C_INT_EN, i2c_dev->base + I2C_CTL);
-}
-
 static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
 {
 	struct sprd_i2c *i2c_dev = dev_id;
@@ -669,8 +671,6 @@ static int __maybe_unused sprd_i2c_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	sprd_i2c_enable(i2c_dev);
-
 	return 0;
 }
 
-- 
2.17.1

