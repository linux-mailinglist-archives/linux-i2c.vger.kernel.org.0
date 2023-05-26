Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343187127E3
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 15:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243435AbjEZN6W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 09:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjEZN6V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 09:58:21 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1AD1C195;
        Fri, 26 May 2023 06:57:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,194,1681138800"; 
   d="scan'208";a="160955052"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 May 2023 22:57:56 +0900
Received: from localhost.localdomain (unknown [10.226.93.166])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2E7AB42229AE;
        Fri, 26 May 2023 22:57:52 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
Subject: [PATCH RESEND v2 3/3] i2c: rzv2m: Disable the operation of unit in case of error
Date:   Fri, 26 May 2023 14:57:38 +0100
Message-Id: <20230526135738.348294-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526135738.348294-1-biju.das.jz@bp.renesas.com>
References: <20230526135738.348294-1-biju.das.jz@bp.renesas.com>
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

The remove and suspend callbacks disable the operation of the unit.
Do the same in probe() in case of error.

While at it, introduce a helper function rzv2m_i2c_disable() for
disabling the operation of the unit and this function is shared
between probe error path, remove and suspend callbacks.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Introduced rzv2m_i2c_disable() and shared the code between
   probe error path, remove and suspend callbacks.
 * Updated commit description.
---
 drivers/i2c/busses/i2c-rzv2m.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index b97e29871558..7acde5133e51 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -389,6 +389,20 @@ static u32 rzv2m_i2c_func(struct i2c_adapter *adap)
 	       I2C_FUNC_10BIT_ADDR;
 }
 
+static int rzv2m_i2c_disable(struct device *dev, struct rzv2m_i2c_priv *priv)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	bit_clrl(priv->base + IICB0CTL0, IICB0IICE);
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
 static const struct i2c_adapter_quirks rzv2m_i2c_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
 };
@@ -461,8 +475,10 @@ static int rzv2m_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	ret = i2c_add_numbered_adapter(adap);
-	if (ret < 0)
+	if (ret < 0) {
+		rzv2m_i2c_disable(dev, priv);
 		pm_runtime_disable(dev);
+	}
 
 	return ret;
 }
@@ -473,7 +489,7 @@ static int rzv2m_i2c_remove(struct platform_device *pdev)
 	struct device *dev = priv->adap.dev.parent;
 
 	i2c_del_adapter(&priv->adap);
-	bit_clrl(priv->base + IICB0CTL0, IICB0IICE);
+	rzv2m_i2c_disable(dev, priv);
 	pm_runtime_disable(dev);
 
 	return 0;
@@ -482,16 +498,8 @@ static int rzv2m_i2c_remove(struct platform_device *pdev)
 static int rzv2m_i2c_suspend(struct device *dev)
 {
 	struct rzv2m_i2c_priv *priv = dev_get_drvdata(dev);
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
-		return ret;
-
-	bit_clrl(priv->base + IICB0CTL0, IICB0IICE);
-	pm_runtime_put(dev);
 
-	return 0;
+	return rzv2m_i2c_disable(dev, priv);
 }
 
 static int rzv2m_i2c_resume(struct device *dev)
-- 
2.25.1

