Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54A8877F3C5
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 11:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349778AbjHQJq5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 05:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349833AbjHQJqt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 05:46:49 -0400
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26822D69;
        Thu, 17 Aug 2023 02:46:46 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 37H9kI3Q085331;
        Thu, 17 Aug 2023 17:46:18 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4RRKpG0xByz2Q0Ft2;
        Thu, 17 Aug 2023 17:44:06 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 17 Aug
 2023 17:46:16 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH 3/8] i2c: sprd: Use global variables to record IIC ack/nack status instead of local variables
Date:   Thu, 17 Aug 2023 17:45:15 +0800
Message-ID: <20230817094520.21286-4-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 37H9kI3Q085331
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We found that when the interrupt bit of the IIC controller is cleared,
the ack/nack bit is also cleared at the same time. After clearing the
interrupt bit in sprd_i2c_isr(), incorrect ack/nack information will be
obtained in sprd_i2c_isr_thread(), resulting in incorrect communication
when nack cannot be recognized. To solve this problem, we used a global
variable to record ack/nack information before clearing the interrupt
bit instead of a local variable.

Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 066b3a9c30c8..549b60dd3273 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -85,6 +85,7 @@ struct sprd_i2c {
 	struct clk *clk;
 	u32 src_clk;
 	u32 bus_freq;
+	bool ack_flag;
 	struct completion complete;
 	struct reset_control *rst;
 	u8 *buf;
@@ -384,7 +385,6 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
 {
 	struct sprd_i2c *i2c_dev = dev_id;
 	struct i2c_msg *msg = i2c_dev->msg;
-	bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
 	u32 i2c_tran;
 
 	if (msg->flags & I2C_M_RD)
@@ -400,7 +400,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
 	 * For reading data, ack is always true, if i2c_tran is not 0 which
 	 * means we still need to contine to read data from slave.
 	 */
-	if (i2c_tran && ack) {
+	if (i2c_tran && i2c_dev->ack_flag) {
 		sprd_i2c_data_transfer(i2c_dev);
 		return IRQ_HANDLED;
 	}
@@ -411,7 +411,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
 	 * If we did not get one ACK from slave when writing data, we should
 	 * return -EIO to notify users.
 	 */
-	if (!ack)
+	if (!i2c_dev->ack_flag)
 		i2c_dev->err = -EIO;
 	else if (msg->flags & I2C_M_RD && i2c_dev->count)
 		sprd_i2c_read_bytes(i2c_dev, i2c_dev->buf, i2c_dev->count);
@@ -428,7 +428,6 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
 {
 	struct sprd_i2c *i2c_dev = dev_id;
 	struct i2c_msg *msg = i2c_dev->msg;
-	bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
 	u32 i2c_tran;
 
 	if (msg->flags & I2C_M_RD)
@@ -447,7 +446,8 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
 	 * means we can read all data in one time, then we can finish this
 	 * transmission too.
 	 */
-	if (!i2c_tran || !ack) {
+	i2c_dev->ack_flag = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
+	if (!i2c_tran || !i2c_dev->ack_flag) {
 		sprd_i2c_clear_start(i2c_dev);
 		sprd_i2c_clear_irq(i2c_dev);
 	}
-- 
2.17.1

