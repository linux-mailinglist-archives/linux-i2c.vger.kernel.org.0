Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C29B377F3CA
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 11:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349792AbjHQJrA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 05:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349836AbjHQJqy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 05:46:54 -0400
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBF62D67;
        Thu, 17 Aug 2023 02:46:52 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 37H9kLHA085564;
        Thu, 17 Aug 2023 17:46:21 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4RRKpK2LpLz2P3khb;
        Thu, 17 Aug 2023 17:44:09 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 17 Aug
 2023 17:46:19 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH 6/8] i2c: sprd: Add additional IIC control bit configuration to adapt to the new IP version of the UNISOC platform
Date:   Thu, 17 Aug 2023 17:45:18 +0800
Message-ID: <20230817094520.21286-7-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 37H9kLHA085564
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The new IIC IP version on the UNISOC platform has added I2C_NACK_EN and
I2C_TRANS_EN control bits. To ensure that the IIC controller can initiate
transmission smoothly, these two bits need to be configured.

Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 7314c897525d..d867389c7f17 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -33,6 +33,8 @@
 #define ADDR_RST		0x2c
 
 /* I2C_CTL */
+#define I2C_NACK_EN		BIT(22)
+#define I2C_TRANS_EN		BIT(21)
 #define STP_EN			BIT(20)
 #define FIFO_AF_LVL_MASK	GENMASK(19, 16)
 #define FIFO_AF_LVL		16
@@ -397,7 +399,7 @@ static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
 	sprd_i2c_clear_irq(i2c_dev);
 
 	tmp = readl(i2c_dev->base + I2C_CTL);
-	writel(tmp | I2C_EN | I2C_INT_EN, i2c_dev->base + I2C_CTL);
+	writel(tmp | I2C_EN | I2C_INT_EN | I2C_NACK_EN | I2C_TRANS_EN, i2c_dev->base + I2C_CTL);
 }
 
 static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
-- 
2.17.1

