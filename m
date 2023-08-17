Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADA577F3C4
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 11:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349837AbjHQJqz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 05:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349828AbjHQJqn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 05:46:43 -0400
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D222D67;
        Thu, 17 Aug 2023 02:46:41 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 37H9kGL5085282;
        Thu, 17 Aug 2023 17:46:16 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4RRKpF0W4yz2P3khb;
        Thu, 17 Aug 2023 17:44:05 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 17 Aug
 2023 17:46:15 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH 2/8] i2c: sprd: Add I2C driver to use 'reset framework' function
Date:   Thu, 17 Aug 2023 17:45:14 +0800
Message-ID: <20230817094520.21286-3-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 37H9kGL5085282
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds the 'reset framework' function for I2C drivers, which
resets the I2C controller when a timeout exception occurs.

Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index acc2a4d4eeae..066b3a9c30c8 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -17,6 +17,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 #define I2C_CTL			0x00
 #define I2C_ADDR_CFG		0x04
@@ -85,6 +86,7 @@ struct sprd_i2c {
 	u32 src_clk;
 	u32 bus_freq;
 	struct completion complete;
+	struct reset_control *rst;
 	u8 *buf;
 	u32 count;
 	int irq;
@@ -247,6 +249,7 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 {
 	struct sprd_i2c *i2c_dev = i2c_adap->algo_data;
 	unsigned long time_left;
+	int ret;
 
 	i2c_dev->msg = msg;
 	i2c_dev->buf = msg->buf;
@@ -278,9 +281,16 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 
 	time_left = wait_for_completion_timeout(&i2c_dev->complete,
 				msecs_to_jiffies(I2C_XFER_TIMEOUT));
-	if (!time_left)
+	if (!time_left) {
+		dev_err(i2c_dev->dev, "transfer timeout, I2C_STATUS = 0x%x\n",
+			readl(i2c_dev->base + I2C_STATUS));
+		if (i2c_dev->rst != NULL) {
+			ret = reset_control_reset(i2c_dev->rst);
+			if (ret < 0)
+				dev_err(i2c_dev->dev, "i2c soft reset failed, ret = %d\n", ret);
+		}
 		return -ETIMEDOUT;
-
+	}
 	return i2c_dev->err;
 }
 
@@ -535,6 +545,11 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	platform_set_drvdata(pdev, i2c_dev);
+	i2c_dev->rst = devm_reset_control_get(i2c_dev->dev, "i2c_rst");
+	if (IS_ERR(i2c_dev->rst)) {
+		dev_err(i2c_dev->dev, "can't get i2c reset node\n");
+		i2c_dev->rst = NULL;
+	}
 
 	ret = clk_prepare_enable(i2c_dev->clk);
 	if (ret)
-- 
2.17.1

