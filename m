Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28E577F3C7
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 11:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349782AbjHQJq6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 05:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349835AbjHQJqx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 05:46:53 -0400
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CEA2D61;
        Thu, 17 Aug 2023 02:46:51 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 37H9kJn8085390;
        Thu, 17 Aug 2023 17:46:19 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4RRKpH1kdPz2P3khb;
        Thu, 17 Aug 2023 17:44:07 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 17 Aug
 2023 17:46:17 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH 4/8] i2c: sprd: Add IIC controller driver to support dynamic switching of 400K/1M/3.4M frequency
Date:   Thu, 17 Aug 2023 17:45:16 +0800
Message-ID: <20230817094520.21286-5-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 37H9kJn8085390
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When IIC-slaves supporting different frequencies use the same IIC
controller, the IIC controller usually only operates at lower frequencies.
In order to improve the performance of IIC-slaves transmission supporting
faster frequencies, we dynamically configure the IIC operating frequency
based on the value of the input parameter msg ->flag.

Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 549b60dd3273..02c11a9ff2da 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -75,7 +75,14 @@
 #define SPRD_I2C_PM_TIMEOUT	1000
 /* timeout (ms) for transfer message */
 #define I2C_XFER_TIMEOUT	1000
-
+/* dynamic modify clk_freq flag  */
+#define	I2C_3M4_FLAG		0x0100
+#define	I2C_1M_FLAG		0x0080
+#define	I2C_400K_FLAG		0x0040
+
+#define	I2C_FREQ_400K		400000
+#define	I2C_FREQ_1M		1000000
+#define	I2C_FREQ_3_4M		3400000
 /* SPRD i2c data structure */
 struct sprd_i2c {
 	struct i2c_adapter adap;
@@ -94,6 +101,8 @@ struct sprd_i2c {
 	int err;
 };
 
+static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq);
+
 static void sprd_i2c_set_count(struct sprd_i2c *i2c_dev, u32 count)
 {
 	writel(count, i2c_dev->base + I2C_COUNT);
@@ -269,6 +278,12 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
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
-- 
2.17.1

