Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7860710D9B
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 15:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240966AbjEYNvX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 09:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241398AbjEYNvW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 09:51:22 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5DB0A183;
        Thu, 25 May 2023 06:51:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,191,1681138800"; 
   d="scan'208";a="160806217"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 May 2023 22:51:21 +0900
Received: from localhost.localdomain (unknown [10.226.93.84])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 569EE4226EA8;
        Thu, 25 May 2023 22:51:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
Subject: [PATCH 2/3] i2c: rzv2m: Rename macro names in all uppercase
Date:   Thu, 25 May 2023 14:51:07 +0100
Message-Id: <20230525135108.240651-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525135108.240651-1-biju.das.jz@bp.renesas.com>
References: <20230525135108.240651-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Normally we'd put macro names in all uppercase.
Rename bit_setl->BIT_SETL and bit_clrl->BIT_CLRL.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/i2c/busses/i2c-rzv2m.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 56d0faee5c46..ccd337f2e8c3 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -50,8 +50,8 @@
 #define IICB0MDSC	BIT(7)		/* Bus Mode */
 #define IICB0SLSE	BIT(1)		/* Start condition output */
 
-#define bit_setl(addr, val)		writel(readl(addr) | (val), (addr))
-#define bit_clrl(addr, val)		writel(readl(addr) & ~(val), (addr))
+#define BIT_SETL(addr, val)		writel(readl(addr) | (val), (addr))
+#define BIT_CLRL(addr, val)		writel(readl(addr) & ~(val), (addr))
 
 struct rzv2m_i2c_priv {
 	void __iomem *base;
@@ -198,7 +198,7 @@ static int rzv2m_i2c_read_with_ack(struct rzv2m_i2c_priv *priv, u8 *data,
 	reinit_completion(&priv->msg_tia_done);
 
 	/* Interrupt request timing : 8th clock */
-	bit_clrl(priv->base + IICB0CTL0, IICB0SLWT);
+	BIT_CLRL(priv->base + IICB0CTL0, IICB0SLWT);
 
 	/* Exit the wait state */
 	writel(IICB0WRET, priv->base + IICB0TRG);
@@ -211,13 +211,13 @@ static int rzv2m_i2c_read_with_ack(struct rzv2m_i2c_priv *priv, u8 *data,
 
 	if (last) {
 		/* Disable ACK */
-		bit_clrl(priv->base + IICB0CTL0, IICB0SLAC);
+		BIT_CLRL(priv->base + IICB0CTL0, IICB0SLAC);
 
 		/* Read data*/
 		data_tmp = readl(priv->base + IICB0DAT);
 
 		/* Interrupt request timing : 9th clock */
-		bit_setl(priv->base + IICB0CTL0, IICB0SLWT);
+		BIT_SETL(priv->base + IICB0CTL0, IICB0SLWT);
 
 		/* Exit the wait state */
 		writel(IICB0WRET, priv->base + IICB0TRG);
@@ -229,7 +229,7 @@ static int rzv2m_i2c_read_with_ack(struct rzv2m_i2c_priv *priv, u8 *data,
 			return -ETIMEDOUT;
 
 		/* Enable ACK */
-		bit_setl(priv->base + IICB0CTL0, IICB0SLAC);
+		BIT_SETL(priv->base + IICB0CTL0, IICB0SLAC);
 	} else {
 		/* Read data */
 		data_tmp = readl(priv->base + IICB0DAT);
@@ -466,7 +466,7 @@ static int rzv2m_i2c_remove(struct platform_device *pdev)
 	struct device *dev = priv->adap.dev.parent;
 
 	i2c_del_adapter(&priv->adap);
-	bit_clrl(priv->base + IICB0CTL0, IICB0IICE);
+	BIT_CLRL(priv->base + IICB0CTL0, IICB0IICE);
 	pm_runtime_disable(dev);
 
 	return 0;
@@ -481,7 +481,7 @@ static int rzv2m_i2c_suspend(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	bit_clrl(priv->base + IICB0CTL0, IICB0IICE);
+	BIT_CLRL(priv->base + IICB0CTL0, IICB0IICE);
 	pm_runtime_put(dev);
 
 	return 0;
-- 
2.25.1

