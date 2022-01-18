Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5513C49274D
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 14:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242652AbiARNeO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 08:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242600AbiARNeF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 08:34:05 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18F0C06173E;
        Tue, 18 Jan 2022 05:34:04 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id DCC451F43EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1642512843;
        bh=ka1tCJjbJu4h0AAgjoXH7kDQ7yHboZXVgWGNR9YjBCM=;
        h=From:To:Cc:Subject:Date:From;
        b=Q5Vw+eoBITiTEAzI17iHYxDLwuBJLRK919/yJVOkf9Iy5yYw7y32+cvpni9e1bUDM
         sZodp9FqyqHveEQTBYIAWUC5j1FDS3dn/79a+hKgArzR7XNaimkvILCNDQdep6xu+Q
         8h8Ek6m7SoxmR3B7SKJEM3RxwpdqD0KB4FIAbk7ef/TiCwmLi4D/F8Y5R+QeU7RzCR
         Nm3in5rXPD7YZGS9nYIns/pwII4VxfyAUQgK9ZVfhMWM48ou9LBxKWiV0+wuuztfWz
         Zm6PtOqWlPkGSCkNi6uDGT5/ODoKzGBFBgaa+NO6ky3Pw+XJShsRhEVUUmjWd7JwOs
         JW3vyCPnt2Bkw==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Date:   Tue, 18 Jan 2022 14:33:58 +0100
Message-Id: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since depending on the SoC or specific bus functionality some clocks
may be optional, we cannot get the benefit of using devm_clk_bulk_get()
but, by migrating to clk-bulk, we are able to remove the custom functions
mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
APIs usage, hence (lightly) decreasing kernel footprint.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 127 +++++++++++++-------------------
 1 file changed, 51 insertions(+), 76 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 9ea427f53083..541b7be88375 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -85,6 +85,27 @@
 
 #define I2C_DRV_NAME		"i2c-mt65xx"
 
+/**
+ * enum i2c_mt65xx_clks - Clocks enumeration for MT65XX I2C
+ *
+ * @I2C_MT65XX_CLK_MAIN: main clock for i2c bus
+ * @I2C_MT65XX_CLK_DMA:  DMA clock for i2c via DMA
+ * @I2C_MT65XX_CLK_PMIC: PMIC clock for i2c from PMIC
+ * @I2C_MT65XX_CLK_ARB:  Arbitrator clock for i2c
+ * @I2C_MT65XX_CLK_MAX:  Number of supported clocks
+ */
+enum i2c_mt65xx_clks {
+	I2C_MT65XX_CLK_MAIN = 0,
+	I2C_MT65XX_CLK_DMA,
+	I2C_MT65XX_CLK_PMIC,
+	I2C_MT65XX_CLK_ARB,
+	I2C_MT65XX_CLK_MAX
+};
+
+static const char * const i2c_mt65xx_clk_ids[I2C_MT65XX_CLK_MAX] = {
+	"main", "dma", "pmic", "arb"
+};
+
 enum DMA_REGS_OFFSET {
 	OFFSET_INT_FLAG = 0x0,
 	OFFSET_INT_EN = 0x04,
@@ -243,10 +264,7 @@ struct mtk_i2c {
 	/* set in i2c probe */
 	void __iomem *base;		/* i2c base addr */
 	void __iomem *pdmabase;		/* dma base address*/
-	struct clk *clk_main;		/* main clock for i2c bus */
-	struct clk *clk_dma;		/* DMA clock for i2c via DMA */
-	struct clk *clk_pmic;		/* PMIC clock for i2c from PMIC */
-	struct clk *clk_arb;		/* Arbitrator clock for i2c */
+	struct clk_bulk_data clocks[I2C_MT65XX_CLK_MAX]; /* clocks for i2c */
 	bool have_pmic;			/* can use i2c pins from PMIC */
 	bool use_push_pull;		/* IO config push-pull mode */
 
@@ -434,55 +452,6 @@ static void mtk_i2c_writew(struct mtk_i2c *i2c, u16 val,
 	writew(val, i2c->base + i2c->dev_comp->regs[reg]);
 }
 
-static int mtk_i2c_clock_enable(struct mtk_i2c *i2c)
-{
-	int ret;
-
-	ret = clk_prepare_enable(i2c->clk_dma);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(i2c->clk_main);
-	if (ret)
-		goto err_main;
-
-	if (i2c->have_pmic) {
-		ret = clk_prepare_enable(i2c->clk_pmic);
-		if (ret)
-			goto err_pmic;
-	}
-
-	if (i2c->clk_arb) {
-		ret = clk_prepare_enable(i2c->clk_arb);
-		if (ret)
-			goto err_arb;
-	}
-
-	return 0;
-
-err_arb:
-	if (i2c->have_pmic)
-		clk_disable_unprepare(i2c->clk_pmic);
-err_pmic:
-	clk_disable_unprepare(i2c->clk_main);
-err_main:
-	clk_disable_unprepare(i2c->clk_dma);
-
-	return ret;
-}
-
-static void mtk_i2c_clock_disable(struct mtk_i2c *i2c)
-{
-	if (i2c->clk_arb)
-		clk_disable_unprepare(i2c->clk_arb);
-
-	if (i2c->have_pmic)
-		clk_disable_unprepare(i2c->clk_pmic);
-
-	clk_disable_unprepare(i2c->clk_main);
-	clk_disable_unprepare(i2c->clk_dma);
-}
-
 static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
@@ -1149,7 +1118,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	int left_num = num;
 	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
 
-	ret = mtk_i2c_clock_enable(i2c);
+	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	if (ret)
 		return ret;
 
@@ -1203,7 +1172,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	ret = num;
 
 err_exit:
-	mtk_i2c_clock_disable(i2c);
+	clk_bulk_disable_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	return ret;
 }
 
@@ -1281,9 +1250,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 {
 	int ret = 0;
 	struct mtk_i2c *i2c;
-	struct clk *clk;
 	struct resource *res;
-	int irq;
+	int i, irq, speed_clk;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -1329,35 +1297,42 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (i2c->have_pmic && !i2c->dev_comp->pmic_i2c)
 		return -EINVAL;
 
-	i2c->clk_main = devm_clk_get(&pdev->dev, "main");
-	if (IS_ERR(i2c->clk_main)) {
+	/* Fill in clk-bulk IDs */
+	for (i = 0; i < I2C_MT65XX_CLK_MAX; i++)
+		i2c->clocks[i].id = i2c_mt65xx_clk_ids[i];
+
+	/* Get clocks one by one, some may be optional */
+	i2c->clocks[I2C_MT65XX_CLK_MAIN].clk = devm_clk_get(&pdev->dev, "main");
+	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_MAIN].clk)) {
 		dev_err(&pdev->dev, "cannot get main clock\n");
-		return PTR_ERR(i2c->clk_main);
+		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_MAIN].clk);
 	}
 
-	i2c->clk_dma = devm_clk_get(&pdev->dev, "dma");
-	if (IS_ERR(i2c->clk_dma)) {
+	i2c->clocks[I2C_MT65XX_CLK_DMA].clk = devm_clk_get(&pdev->dev, "dma");
+	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_DMA].clk)) {
 		dev_err(&pdev->dev, "cannot get dma clock\n");
-		return PTR_ERR(i2c->clk_dma);
+		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_DMA].clk);
 	}
 
-	i2c->clk_arb = devm_clk_get(&pdev->dev, "arb");
-	if (IS_ERR(i2c->clk_arb))
-		i2c->clk_arb = NULL;
+	i2c->clocks[I2C_MT65XX_CLK_ARB].clk = devm_clk_get_optional(&pdev->dev, "arb");
+	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
+		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
 
-	clk = i2c->clk_main;
 	if (i2c->have_pmic) {
-		i2c->clk_pmic = devm_clk_get(&pdev->dev, "pmic");
-		if (IS_ERR(i2c->clk_pmic)) {
+		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get(&pdev->dev, "pmic");
+		if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
 			dev_err(&pdev->dev, "cannot get pmic clock\n");
-			return PTR_ERR(i2c->clk_pmic);
+			return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
 		}
-		clk = i2c->clk_pmic;
+		speed_clk = I2C_MT65XX_CLK_PMIC;
+	} else {
+		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = NULL;
+		speed_clk = I2C_MT65XX_CLK_MAIN;
 	}
 
 	strlcpy(i2c->adap.name, I2C_DRV_NAME, sizeof(i2c->adap.name));
 
-	ret = mtk_i2c_set_speed(i2c, clk_get_rate(clk));
+	ret = mtk_i2c_set_speed(i2c, clk_get_rate(i2c->clocks[speed_clk].clk));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set the speed.\n");
 		return -EINVAL;
@@ -1372,13 +1347,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = mtk_i2c_clock_enable(i2c);
+	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	if (ret) {
 		dev_err(&pdev->dev, "clock enable failed!\n");
 		return ret;
 	}
 	mtk_i2c_init_hw(i2c);
-	mtk_i2c_clock_disable(i2c);
+	clk_bulk_disable_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 
 	ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
 			       IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
@@ -1423,7 +1398,7 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 	int ret;
 	struct mtk_i2c *i2c = dev_get_drvdata(dev);
 
-	ret = mtk_i2c_clock_enable(i2c);
+	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	if (ret) {
 		dev_err(dev, "clock enable failed!\n");
 		return ret;
@@ -1431,7 +1406,7 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 
 	mtk_i2c_init_hw(i2c);
 
-	mtk_i2c_clock_disable(i2c);
+	clk_bulk_disable_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 
 	i2c_mark_adapter_resumed(&i2c->adap);
 
-- 
2.33.1

