Return-Path: <linux-i2c+bounces-6903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B6697D6F9
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 16:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12ABA1C2123C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 14:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0E417C219;
	Fri, 20 Sep 2024 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xjtr3ez5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9D13B2B0;
	Fri, 20 Sep 2024 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726843017; cv=none; b=uWPyso9yi2p9etkMoDw0INFgjctlL2bcdLw7YwhNX+OfhAB+EafwN6hBg3X8paIHcVmtRoNLd4V2yBbRjct86nYnGAtH6eJgVbZHE7vY8hiTCANLzv4+qMZyU+cX5LXaizHExrHfonTvZrUaQ0+OBX3KjBveqwHau4YyvKQ+/Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726843017; c=relaxed/simple;
	bh=6g/cVku80kqbBOB8m5M6mBu+q8Npfla5/Bb0yRgWwJI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jECBAy3Ywg3PJJYjMa6SDFB1sjFxurfIUS5b0bmhz/mOD+k+pQZ6RHu5c7ex9/H+0fdr2UmwOUcup2L+WePkjsHWKKtFHYdfxDsiPD/9Ha5ESRQ8xnXKK3IUiQCVasX+JPEz9JRL2ODQd0AoALekLOyKj7aA2Y87hGbldyMdw9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Xjtr3ez5; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c650975e775d11ef8b96093e013ec31c-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=djf1UONhf6mmcgtWmOvFlBs8ovmE1gdcWLKGsW8YciE=;
	b=Xjtr3ez5iZAnWNL8OEQPYC3WZbPWAxygCXhxWTF84ZilglpUtgddXBihko9mTx+rJIsWUpfjTdX5dox/qVenIayjeVI8EKF4bOt0+aEQ6o0qNkdL8+5BnTfZRYVGPp7EIAw9omZaFdy6wVaBqGj1ElTOCTHCEYNXYkpRH1kIuyw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:6e26b180-fe16-4a3d-bbe0-165b2520ad2c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:1e2683d0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c650975e775d11ef8b96093e013ec31c-20240920
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 897329635; Fri, 20 Sep 2024 22:36:51 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 22:36:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 22:36:51 +0800
From: zoie.lin <zoie.lin@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	zoie.lin <zoie.lin@mediatek.com>
Subject: [v1,1/1] i2c: mediatek: add runtime PM operations and bus regulator control
Date: Fri, 20 Sep 2024 22:36:27 +0800
Message-ID: <20240920143627.23811-2-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240920143627.23811-1-zoie.lin@mediatek.com>
References: <20240920143627.23811-1-zoie.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

This commit introduces support for runtime PM operations in
the I2C driver, enabling runtime suspend and resume functionality.

Although in the most platforms, the bus power of i2c are always
on, some platforms disable the i2c bus power in order to meet
low power request.

This implementation includes bus regulator control to facilitate
proper handling of the bus power based on platform requirements.

Signed-off-by: zoie.lin <zoie.lin@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 72 ++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e0ba653dec2d..aae0189ba210 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -1245,8 +1246,8 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	int left_num = num;
 	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
 
-	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
-	if (ret)
+	ret = pm_runtime_get_sync(i2c->dev);
+	if (ret < 0)
 		return ret;
 
 	i2c->auto_restart = i2c->dev_comp->auto_restart;
@@ -1299,7 +1300,9 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	ret = num;
 
 err_exit:
-	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	pm_runtime_mark_last_busy(i2c->dev);
+	pm_runtime_put_autosuspend(i2c->dev);
+
 	return ret;
 }
 
@@ -1370,6 +1373,41 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 	return 0;
 }
 
+static int mtk_i2c_runtime_suspend(struct device *dev)
+{
+	struct mtk_i2c *i2c = dev_get_drvdata(dev);
+
+	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	if (i2c->adap.bus_regulator)
+		regulator_disable(i2c->adap.bus_regulator);
+
+	return 0;
+}
+
+static int mtk_i2c_runtime_resume(struct device *dev)
+{
+	int ret = 0;
+	struct mtk_i2c *i2c = dev_get_drvdata(dev);
+
+	if (i2c->adap.bus_regulator) {
+		ret = regulator_enable(i2c->adap.bus_regulator);
+		if (ret < 0) {
+			dev_err(dev, "enable regulator failed!\n");
+			return ret;
+		}
+	}
+
+	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	if (ret < 0) {
+		dev_err(dev, "clock enable failed!\n");
+		if (i2c->adap.bus_regulator)
+			regulator_disable(i2c->adap.bus_regulator);
+		return ret;
+	}
+
+	return ret;
+}
+
 static int mtk_i2c_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -1472,13 +1510,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	if (ret) {
-		dev_err(&pdev->dev, "clock enable failed!\n");
+		dev_err(&pdev->dev, "clk_bulk_prepare failed\n");
 		return ret;
 	}
+
+	platform_set_drvdata(pdev, i2c);
+
+	ret = mtk_i2c_runtime_resume(i2c->dev);
+	if (ret < 0)
+		goto err_clk_bulk_unprepare;
 	mtk_i2c_init_hw(i2c);
-	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	mtk_i2c_runtime_suspend(i2c->dev);
 
 	ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
 			       IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
@@ -1486,19 +1530,22 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Request I2C IRQ %d fail\n", irq);
-		goto err_bulk_unprepare;
+		goto err_clk_bulk_unprepare;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 
 	i2c_set_adapdata(&i2c->adap, i2c);
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret)
-		goto err_bulk_unprepare;
-
-	platform_set_drvdata(pdev, i2c);
+		goto err_pm_runtime_disable;
 
 	return 0;
 
-err_bulk_unprepare:
+err_pm_runtime_disable:
+	pm_runtime_disable(&pdev->dev);
+err_clk_bulk_unprepare:
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 
 	return ret;
@@ -1510,6 +1557,7 @@ static void mtk_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c->adap);
 
+	pm_runtime_disable(&pdev->dev);
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 }
 
@@ -1546,6 +1594,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 static const struct dev_pm_ops mtk_i2c_pm = {
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
 				  mtk_i2c_resume_noirq)
+	SET_RUNTIME_PM_OPS(mtk_i2c_runtime_suspend, mtk_i2c_runtime_resume,
+			   NULL)
 };
 
 static struct platform_driver mtk_i2c_driver = {
-- 
2.45.2


