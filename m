Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 622D75B6DBA
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 14:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbiIMMyL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 08:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbiIMMyD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 08:54:03 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3375F3340E;
        Tue, 13 Sep 2022 05:54:00 -0700 (PDT)
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MRjx01V4KzmVRK;
        Tue, 13 Sep 2022 20:50:12 +0800 (CST)
Received: from localhost.localdomain (10.157.217.52) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 20:53:55 +0800
From:   Tao Lan <taolan@huawei.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     taolan <taolan@huawei.com>
Subject: [PATCH] i2c: hix5hd2: Add some debug enhancement for register access
Date:   Tue, 13 Sep 2022 12:48:20 +0000
Message-ID: <20220913124820.48715-1-taolan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.157.217.52]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500021.china.huawei.com (7.185.36.21)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: taolan <taolan@huawei.com>

Sometimes, to locate a fault, we need to know how the register is
configured and whether the configuration is incorrect. Currently, no
better method is available for analysis.

This patch tries to solve the problem by naming the registers and
printing the accessed values.

Signed-off-by: taolan <taolan@huawei.com>
---
 drivers/i2c/busses/i2c-hix5hd2.c | 80 +++++++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 61ae58f57047..9ebbad8701f4 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -92,28 +92,72 @@ struct hix5hd2_i2c_priv {
 	enum hix5hd2_i2c_state state;
 };
 
+#define i2c_readl readl_relaxed
+#define i2c_writel writel_relaxed
+
+#ifdef I2C_REG_DUMP
+
+#undef i2c_readl
+#undef i2c_writel
+
+struct i2c_reg_name {
+	u32 reg;
+	char *name;
+} g_i2c_reg_name[] = {
+	{0x00, "CTRL"},
+	{0x04, "COM"},
+	{0x08, "ICR"},
+	{0x0c, "SR"},
+	{0x10, "SCL_H"},
+	{0x14, "SCL_L"},
+	{0x18, "TXR"},
+	{0x1c, "RXR"},
+};
+static void i2c_writel(u32 val, void *reg)
+{
+	unsigned long idx = (unsigned long)reg & 0x00FF;
+
+	if (idx <= 0x1C)
+		pr_notice("write 0x%04x to %s\n", val, g_i2c_reg_name[idx >> 0x2].name);
+
+	i2c_writel(val, reg);
+}
+
+static u32 i2c_readl(void *reg)
+{
+	u32 val = i2c_readl(reg);
+	unsigned long idx = (unsigned long)reg & 0x00FF;
+
+	if (idx <= 0x1C)
+		pr_notice("read 0x%04x from %s\n", val, g_i2c_reg_name[idx >> 0x2].name);
+
+	return val;
+}
+#endif
+
+
 static u32 hix5hd2_i2c_clr_pend_irq(struct hix5hd2_i2c_priv *priv)
 {
-	u32 val = readl_relaxed(priv->regs + HIX5I2C_SR);
+	u32 val = i2c_readl(priv->regs + HIX5I2C_SR);
 
-	writel_relaxed(val, priv->regs + HIX5I2C_ICR);
+	i2c_writel(val, priv->regs + HIX5I2C_ICR);
 
 	return val;
 }
 
 static void hix5hd2_i2c_clr_all_irq(struct hix5hd2_i2c_priv *priv)
 {
-	writel_relaxed(I2C_CLEAR_ALL, priv->regs + HIX5I2C_ICR);
+	i2c_writel(I2C_CLEAR_ALL, priv->regs + HIX5I2C_ICR);
 }
 
 static void hix5hd2_i2c_disable_irq(struct hix5hd2_i2c_priv *priv)
 {
-	writel_relaxed(0, priv->regs + HIX5I2C_CTRL);
+	i2c_writel(0, priv->regs + HIX5I2C_CTRL);
 }
 
 static void hix5hd2_i2c_enable_irq(struct hix5hd2_i2c_priv *priv)
 {
-	writel_relaxed(I2C_ENABLE | I2C_UNMASK_TOTAL | I2C_UNMASK_ALL,
+	i2c_writel(I2C_ENABLE | I2C_UNMASK_TOTAL | I2C_UNMASK_ALL,
 		       priv->regs + HIX5I2C_CTRL);
 }
 
@@ -123,17 +167,17 @@ static void hix5hd2_i2c_drv_setrate(struct hix5hd2_i2c_priv *priv)
 	u32 scl, sysclock;
 
 	/* close all i2c interrupt */
-	val = readl_relaxed(priv->regs + HIX5I2C_CTRL);
-	writel_relaxed(val & (~I2C_UNMASK_TOTAL), priv->regs + HIX5I2C_CTRL);
+	val = i2c_readl(priv->regs + HIX5I2C_CTRL);
+	i2c_writel(val & (~I2C_UNMASK_TOTAL), priv->regs + HIX5I2C_CTRL);
 
 	rate = priv->freq;
 	sysclock = clk_get_rate(priv->clk);
 	scl = (sysclock / (rate * 2)) / 2 - 1;
-	writel_relaxed(scl, priv->regs + HIX5I2C_SCL_H);
-	writel_relaxed(scl, priv->regs + HIX5I2C_SCL_L);
+	i2c_writel(scl, priv->regs + HIX5I2C_SCL_H);
+	i2c_writel(scl, priv->regs + HIX5I2C_SCL_L);
 
 	/* restore original interrupt*/
-	writel_relaxed(val, priv->regs + HIX5I2C_CTRL);
+	i2c_writel(val, priv->regs + HIX5I2C_CTRL);
 
 	dev_dbg(priv->dev, "%s: sysclock=%d, rate=%d, scl=%d\n",
 		__func__, sysclock, rate, scl);
@@ -188,7 +232,7 @@ static void hix5hd2_rw_handle_stop(struct hix5hd2_i2c_priv *priv)
 {
 	if (priv->stop) {
 		priv->state = HIX5I2C_STAT_SND_STOP;
-		writel_relaxed(I2C_STOP, priv->regs + HIX5I2C_COM);
+		i2c_writel(I2C_STOP, priv->regs + HIX5I2C_COM);
 	} else {
 		hix5hd2_rw_over(priv);
 	}
@@ -198,10 +242,10 @@ static void hix5hd2_read_handle(struct hix5hd2_i2c_priv *priv)
 {
 	if (priv->msg_len == 1) {
 		/* the last byte don't need send ACK */
-		writel_relaxed(I2C_READ | I2C_NO_ACK, priv->regs + HIX5I2C_COM);
+		i2c_writel(I2C_READ | I2C_NO_ACK, priv->regs + HIX5I2C_COM);
 	} else if (priv->msg_len > 1) {
 		/* if i2c master receive data will send ACK */
-		writel_relaxed(I2C_READ, priv->regs + HIX5I2C_COM);
+		i2c_writel(I2C_READ, priv->regs + HIX5I2C_COM);
 	} else {
 		hix5hd2_rw_handle_stop(priv);
 	}
@@ -213,8 +257,8 @@ static void hix5hd2_write_handle(struct hix5hd2_i2c_priv *priv)
 
 	if (priv->msg_len > 0) {
 		data = priv->msg->buf[priv->msg_idx++];
-		writel_relaxed(data, priv->regs + HIX5I2C_TXR);
-		writel_relaxed(I2C_WRITE, priv->regs + HIX5I2C_COM);
+		i2c_writel(data, priv->regs + HIX5I2C_TXR);
+		i2c_writel(I2C_WRITE, priv->regs + HIX5I2C_COM);
 	} else {
 		hix5hd2_rw_handle_stop(priv);
 	}
@@ -228,7 +272,7 @@ static int hix5hd2_rw_preprocess(struct hix5hd2_i2c_priv *priv)
 		priv->state = HIX5I2C_STAT_RW;
 	} else if (priv->state == HIX5I2C_STAT_RW) {
 		if (priv->msg->flags & I2C_M_RD) {
-			data = readl_relaxed(priv->regs + HIX5I2C_RXR);
+			data = i2c_readl(priv->regs + HIX5I2C_RXR);
 			priv->msg->buf[priv->msg_idx++] = data;
 		}
 		priv->msg_len--;
@@ -304,10 +348,10 @@ static void hix5hd2_i2c_message_start(struct hix5hd2_i2c_priv *priv, int stop)
 	hix5hd2_i2c_clr_all_irq(priv);
 	hix5hd2_i2c_enable_irq(priv);
 
-	writel_relaxed(i2c_8bit_addr_from_msg(priv->msg),
+	i2c_writel(i2c_8bit_addr_from_msg(priv->msg),
 		       priv->regs + HIX5I2C_TXR);
 
-	writel_relaxed(I2C_WRITE | I2C_START, priv->regs + HIX5I2C_COM);
+	i2c_writel(I2C_WRITE | I2C_START, priv->regs + HIX5I2C_COM);
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-- 
2.17.1

