Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECFD875DC2B
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjGVLzU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjGVLzM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:55:12 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3AF43C06;
        Sat, 22 Jul 2023 04:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R6PzViV5Y9OmUAkqhYjwDJV91zNywmpdfDXZvoN28Kc=;
        b=Pn0M1dQJ+gnGPsD2C4uo9sbzKD2piUYePxYhxyzqPF+2/5lX0nc4DGms2fQqHFLsVti7Lr
        r7IjsklAebG/5YrRtChUiXaWZMvLDTyJl1l74wxCoEX6Uy7GW7JFzSo9NYLikcaWINicuy
        0K6P5c/w8J7rADVBIybnd0re0U+XN8w=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 12/22] i2c: mt65xx: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:36 +0200
Message-Id: <20230722115046.27323-13-paul@crapouillou.net>
In-Reply-To: <20230722115046.27323-1-paul@crapouillou.net>
References: <20230722115046.27323-1-paul@crapouillou.net>
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
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

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

