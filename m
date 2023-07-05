Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D378A748F44
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233985AbjGEUrE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjGEUq6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:46:58 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D681BDD;
        Wed,  5 Jul 2023 13:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589826;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TdHoXj7LTtKTlBRs+Qe41S8bC2nxi1BGxlIB7qFYX9w=;
        b=vP1jjktMDkBjUHWSYGsrjpRWCKmsEHpS2aMTIIcNJNGe6JTO196qZRBWDzdmYBcjVol7Uu
        yFmupHehMchlsLFmOfZff0MdvmZFdukemhU6NaiO2De/YgQZTiGIFqVfTRpensvBeWollP
        K/OTRACOMOfN/C1Tui1ZPppF5jmY16k=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 13/23] i2c: mt65xx: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:43:04 +0200
Message-Id: <20230705204314.89800-14-paul@crapouillou.net>
In-Reply-To: <20230705204314.89800-1-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
Cc: Qii Wang <qii.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/i2c/busses/i2c-mt65xx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 7ca3f2221ba6..21cc39e35cf6 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1514,7 +1514,6 @@ static void mtk_i2c_remove(struct platform_device *pdev)
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_i2c_suspend_noirq(struct device *dev)
 {
 	struct mtk_i2c *i2c = dev_get_drvdata(dev);
@@ -1544,11 +1543,10 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops mtk_i2c_pm = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
-				      mtk_i2c_resume_noirq)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
+				  mtk_i2c_resume_noirq)
 };
 
 static struct platform_driver mtk_i2c_driver = {
@@ -1556,7 +1554,7 @@ static struct platform_driver mtk_i2c_driver = {
 	.remove_new = mtk_i2c_remove,
 	.driver = {
 		.name = I2C_DRV_NAME,
-		.pm = &mtk_i2c_pm,
+		.pm = pm_sleep_ptr(&mtk_i2c_pm),
 		.of_match_table = mtk_i2c_of_match,
 	},
 };
-- 
2.40.1

