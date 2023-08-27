Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9D5D789AEF
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Aug 2023 04:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjH0COn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Aug 2023 22:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjH0CO2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Aug 2023 22:14:28 -0400
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B48122;
        Sat, 26 Aug 2023 19:14:26 -0700 (PDT)
Received: from local
        by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1qa5I6-0004yC-0s;
        Sun, 27 Aug 2023 02:14:14 +0000
Date:   Sun, 27 Aug 2023 03:13:30 +0100
From:   Daniel Golle <daniel@makrotopia.org>
To:     Qii Wang <qii.wang@mediatek.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: [PATCH] i2c: mt65xx: allow optional pmic clock
Message-ID: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Using the I2C host controller on the MT7981 SoC requires 4 clocks to
be enabled. One of them, the pmic clk, is only enabled in case
'mediatek,have-pmic' is also set which has other consequences which
are not desired in this case.

Allow defining a pmic clk even in case the 'mediatek,have-pmic' propterty
is not present and the bus is not used to connect to a pmic, but may
still require to enable the pmic clock.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 1a9b5a068ef1b..a8b5719c33729 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1442,15 +1442,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
 		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
 
+	i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get_optional(&pdev->dev, "pmic");
+	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
+		dev_err(&pdev->dev, "cannot get pmic clock\n");
+		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
+	}
+
 	if (i2c->have_pmic) {
-		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get(&pdev->dev, "pmic");
-		if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
+		if (!i2c->clocks[I2C_MT65XX_CLK_PMIC].clk) {
 			dev_err(&pdev->dev, "cannot get pmic clock\n");
-			return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
+			return -ENODEV;
 		}
 		speed_clk = I2C_MT65XX_CLK_PMIC;
 	} else {
-		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = NULL;
 		speed_clk = I2C_MT65XX_CLK_MAIN;
 	}
 
-- 
2.41.0
