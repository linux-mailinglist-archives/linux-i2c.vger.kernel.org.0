Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D81467A9926
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 20:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbjIUSLs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 14:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjIUSLP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 14:11:15 -0400
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7713573D5;
        Thu, 21 Sep 2023 10:18:34 -0700 (PDT)
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
        by SHSQR01.spreadtrum.com with ESMTP id 38L8vFBT047648;
        Thu, 21 Sep 2023 16:57:15 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 38L8tVw8040607;
        Thu, 21 Sep 2023 16:55:31 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Rrq0B6YBSz2SZtbS;
        Thu, 21 Sep 2023 16:52:10 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 21 Sep
 2023 16:55:29 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH V2 3/7] i2c: sprd: Use global variables to record I2C ack/nack status instead of local variables
Date:   Thu, 21 Sep 2023 16:54:53 +0800
Message-ID: <20230921085457.32446-4-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230921085457.32446-1-Huangzheng.Lai@unisoc.com>
References: <20230921085457.32446-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 38L8tVw8040607
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We found that when the interrupt bit of the I2C controller is cleared,
the ack/nack bit is also cleared at the same time. After clearing the
interrupt bit in sprd_i2c_isr(), incorrect ack/nack information will be
obtained in sprd_i2c_isr_thread(), resulting in incorrect communication
when nack cannot be recognized. To solve this problem, we used a global
variable to record ack/nack information before clearing the interrupt
bit instead of a local variable.

Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
Cc: <stable@vger.kernel.org> # v4.14+
Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index aa602958d4fd..dec627ef408c 100644
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
@@ -119,6 +120,7 @@ static void sprd_i2c_clear_ack(struct sprd_i2c *i2c_dev)
 {
 	u32 tmp = readl(i2c_dev->base + I2C_STATUS);
 
+	i2c_dev->ack_flag = 0;
 	writel(tmp & ~I2C_RX_ACK, i2c_dev->base + I2C_STATUS);
 }
 
@@ -393,7 +395,6 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
 {
 	struct sprd_i2c *i2c_dev = dev_id;
 	struct i2c_msg *msg = i2c_dev->msg;
-	bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
 	u32 i2c_tran;
 
 	if (msg->flags & I2C_M_RD)
@@ -409,7 +410,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
 	 * For reading data, ack is always true, if i2c_tran is not 0 which
 	 * means we still need to contine to read data from slave.
 	 */
-	if (i2c_tran && ack) {
+	if (i2c_tran && i2c_dev->ack_flag) {
 		sprd_i2c_data_transfer(i2c_dev);
 		return IRQ_HANDLED;
 	}
@@ -420,7 +421,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
 	 * If we did not get one ACK from slave when writing data, we should
 	 * return -EIO to notify users.
 	 */
-	if (!ack)
+	if (!i2c_dev->ack_flag)
 		i2c_dev->err = -EIO;
 	else if (msg->flags & I2C_M_RD && i2c_dev->count)
 		sprd_i2c_read_bytes(i2c_dev, i2c_dev->buf, i2c_dev->count);
@@ -437,7 +438,6 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
 {
 	struct sprd_i2c *i2c_dev = dev_id;
 	struct i2c_msg *msg = i2c_dev->msg;
-	bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
 	u32 i2c_tran;
 
 	if (msg->flags & I2C_M_RD)
@@ -456,7 +456,8 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
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

