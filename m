Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09E367D2C56
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 10:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjJWINM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 04:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbjJWIM6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 04:12:58 -0400
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B11210EF;
        Mon, 23 Oct 2023 01:12:54 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 39N8CUVW060087;
        Mon, 23 Oct 2023 16:12:30 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4SDSVb396Jz2KkWG6;
        Mon, 23 Oct 2023 16:08:07 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 23 Oct
 2023 16:12:28 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH V2 2/7] i2c: sprd: Add I2C driver to use 'reset framework' function
Date:   Mon, 23 Oct 2023 16:11:53 +0800
Message-ID: <20231023081158.10654-3-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 39N8CUVW060087
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the 'reset framework' function for I2C drivers, which
resets the I2C controller when a timeout exception occurs.

Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index b44916c6741d..aa602958d4fd 100644
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
@@ -278,9 +280,17 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 
 	time_left = wait_for_completion_timeout(&i2c_dev->complete,
 				msecs_to_jiffies(I2C_XFER_TIMEOUT));
-	if (!time_left)
+	if (!time_left) {
+		dev_err(i2c_dev->dev, "transfer timeout, I2C_STATUS = 0x%x\n",
+			readl(i2c_dev->base + I2C_STATUS));
+		if (i2c_dev->rst) {
+			int ret = reset_control_reset(i2c_dev->rst);
+
+			if (ret < 0)
+				dev_warn(i2c_dev->dev, "i2c soft reset failed, ret = %d\n", ret);
+		}
 		return -ETIMEDOUT;
-
+	}
 	return i2c_dev->err;
 }
 
@@ -544,6 +554,11 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	platform_set_drvdata(pdev, i2c_dev);
+	i2c_dev->rst = devm_reset_control_get(i2c_dev->dev, "i2c_rst");
+	if (IS_ERR(i2c_dev->rst)) {
+		dev_dbg(i2c_dev->dev, "reset control not configured!\n");
+		i2c_dev->rst = NULL;
+	}
 
 	ret = clk_prepare_enable(i2c_dev->clk);
 	if (ret)
-- 
2.17.1

