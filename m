Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483E677F3C8
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 11:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349786AbjHQJq6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 05:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349834AbjHQJqw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 05:46:52 -0400
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E94B2D57;
        Thu, 17 Aug 2023 02:46:51 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 37H9kJlY085458;
        Thu, 17 Aug 2023 17:46:19 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4RRKpJ0P5fz2Q0Ft2;
        Thu, 17 Aug 2023 17:44:08 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 17 Aug
 2023 17:46:18 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH 5/8] i2c: sprd: Configure the enable bit of the IIC controller before each transmission initiation
Date:   Thu, 17 Aug 2023 17:45:17 +0800
Message-ID: <20230817094520.21286-6-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 37H9kJlY085458
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When a timeout exception occurs in the IIC driver, the IIC controller
will be reset, and after resetting, control bits such as I2C_EN and
I2C_INT_EN will be reset to 0, and the IIC master cannot initiate
Transmission unless sprd_i2c_enable() is executed. To address this issue,
this patch places sprd_i2c_enable() before each transmission initiation
to ensure that the necessary control bits of the IIC controller are
configured.

Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 02c11a9ff2da..7314c897525d 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -310,6 +310,8 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 	return i2c_dev->err;
 }
 
+static void sprd_i2c_enable(struct sprd_i2c *i2c_dev);
+
 static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
 				struct i2c_msg *msgs, int num)
 {
@@ -320,6 +322,8 @@ static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
 	if (ret < 0)
 		return ret;
 
+	sprd_i2c_enable(i2c_dev);
+
 	for (im = 0; im < num - 1; im++) {
 		ret = sprd_i2c_handle_msg(i2c_adap, &msgs[im], 0);
 		if (ret)
@@ -661,8 +665,6 @@ static int __maybe_unused sprd_i2c_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	sprd_i2c_enable(i2c_dev);
-
 	return 0;
 }
 
-- 
2.17.1

