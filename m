Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0891E718713
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 18:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjEaQLg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 12:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjEaQLf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 12:11:35 -0400
X-Greylist: delayed 60 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 31 May 2023 09:11:33 PDT
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF41811F;
        Wed, 31 May 2023 09:11:33 -0700 (PDT)
Received: from local
        by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1q4OQ8-0001Nc-0H;
        Wed, 31 May 2023 16:11:32 +0000
Date:   Wed, 31 May 2023 17:11:17 +0100
From:   Daniel Golle <daniel@makrotopia.org>
To:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>
Cc:     =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: [PATCH 2/2] i2c: mt65xx: add additional clocks
Message-ID: <6632ce37e260f5f5cbdd0c6a5da8fe9679352aee.1685549360.git.daniel@makrotopia.org>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On MT7981 additional clocks are required when accessing I2C registers.
Add MCK and PCK optional clocks to i2c-mt65xx driver so we don't have
to always have them enabled, but really only if I2C is used.

Fixes: f82fd1845d309 ("i2c: mediatek: add support for MT7981 SoC")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index a43c4d77739ab..cd28cbec2b96d 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -93,6 +93,8 @@
  * @I2C_MT65XX_CLK_DMA:  DMA clock for i2c via DMA
  * @I2C_MT65XX_CLK_PMIC: PMIC clock for i2c from PMIC
  * @I2C_MT65XX_CLK_ARB:  Arbitrator clock for i2c
+ * @I2C_MT65XX_CLK_MCK:  MCK clock for i2c
+ * @I2C_MT65XX_CLK_PCK:  PCK clock for i2c
  * @I2C_MT65XX_CLK_MAX:  Number of supported clocks
  */
 enum i2c_mt65xx_clks {
@@ -100,11 +102,13 @@ enum i2c_mt65xx_clks {
 	I2C_MT65XX_CLK_DMA,
 	I2C_MT65XX_CLK_PMIC,
 	I2C_MT65XX_CLK_ARB,
+	I2C_MT65XX_CLK_MCK,
+	I2C_MT65XX_CLK_PCK,
 	I2C_MT65XX_CLK_MAX
 };
 
 static const char * const i2c_mt65xx_clk_ids[I2C_MT65XX_CLK_MAX] = {
-	"main", "dma", "pmic", "arb"
+	"main", "dma", "pmic", "arb", "mck", "pck"
 };
 
 enum DMA_REGS_OFFSET {
@@ -1444,6 +1448,14 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
 		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
 
+	i2c->clocks[I2C_MT65XX_CLK_MCK].clk = devm_clk_get_optional(&pdev->dev, "mck");
+	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_MCK].clk))
+		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_MCK].clk);
+
+	i2c->clocks[I2C_MT65XX_CLK_PCK].clk = devm_clk_get_optional(&pdev->dev, "pck");
+	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PCK].clk))
+		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PCK].clk);
+
 	if (i2c->have_pmic) {
 		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get(&pdev->dev, "pmic");
 		if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
-- 
2.40.1

