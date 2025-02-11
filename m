Return-Path: <linux-i2c+bounces-9361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B31DDA30E99
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2025 15:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB8353A8DD8
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2025 14:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4A22505C8;
	Tue, 11 Feb 2025 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hHU24o2H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C254250BE1;
	Tue, 11 Feb 2025 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284829; cv=none; b=EfoaTVcioH6CxSCJocKe+KsibAPF4ZXokygEbZ/oPVM8kq9dovyhjhZjb55o9PuUTdn8ppKyDXmI8P7eiioEqZnuIRlomOI5XvKBMbiHHKSO7kiDA0Ihz7jztNAztoPXgr0RhCwmnV1njk9eRSFVX9/V2dFpFyNrQLSop43TpEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284829; c=relaxed/simple;
	bh=QR1Zd8YkXW2iqSrY4dhM1u3r5b6lX8Wm5ql/0QNBu7I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TvkAW0EgsPEyKZYVPsXAXVe1y8dwIYDGA4HuRzkgPvpJU0Zuk5VB88qlbk/hzWv86hTWqr6DWD71HFn28tkMdaKGUVmgmt6/oXKtodgqPu96l0WS9KU1s8nHNrQwuB4NW30VbdYPs16zTOn5J0MCKd8D0bZw3HWbcNWxdCb0Ssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hHU24o2H; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1e9d35aee88611efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OO2knjmuBvtucptzxUGQqaC73/LOtARP3qDbozdomLc=;
	b=hHU24o2HiWCChrQymAnA8751pyWaJLrF86/Yh/W1d4NjjuL1+nWgV3JtpS8xFKesh4lCx8SFilOSWbyBxRS+8Q7u897SXGBs9EKplv7WQHitTLgI9O7KGJNp/PEImh7tg2+of8mxGQ22BW9kPvNphRkVqddaVb8VzDykuG2AA/U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:20ad16f1-933a-4370-8525-7530a1d1b178,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:60aa074,CLOUDID:054a2e9c-f55b-41e7-a712-ffbe7a973280,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1e9d35aee88611efb8f9918b5fc74e19-20250211
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 182231165; Tue, 11 Feb 2025 22:40:20 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 22:40:19 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 22:40:19 +0800
From: Zoie Lin <zoie.lin@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<teddy.chen@mediatek.com>, <joseph-cc.chang@mediatek.com>,
	<leilk.liu@mediatek.com>, Zoie Lin <zoie.lin@mediatek.com>
Subject: [PATCH v4 0/1] i2c: mediatek: add runtime PM operations and bus regulator control
Date: Tue, 11 Feb 2025 22:39:37 +0800
Message-ID: <20250211144016.488001-1-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Introduce support for runtime PM operations in
the I2C driver, enabling runtime suspend and resume functionality.

Although in most platforms, the bus power of i2c is always
on, some platforms disable the i2c bus power in order to meet
low power request.

This implementation includes bus regulator control to facilitate
proper handling of the bus power based on platform requirements.

Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 73 +++++++++++++++++++++++++++------
 1 file changed, 61 insertions(+), 12 deletions(-)

This series is based on linux-next, tag: next-20250210

Changes in v4:
- Removed unnecessary variable initialization.
- Removed unnecessary brackets.
- Corrected grammar issues in the commit message.
- Confirmed autosuspend delay is not necessary.

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5bd342047d59..1979b46d75f0 100644
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
+	ret = pm_runtime_resume_and_get(i2c->dev);
+	if (ret < 0)
 		return ret;
 
 	i2c->auto_restart = i2c->dev_comp->auto_restart;
@@ -1299,7 +1300,9 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	ret = num;
 
 err_exit:
-	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	pm_runtime_mark_last_busy(i2c->dev);
+	pm_runtime_put_sync(i2c->dev);
+
 	return ret;
 }
 
@@ -1370,6 +1373,38 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
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
+	int ret;
+	struct mtk_i2c *i2c = dev_get_drvdata(dev);
+
+	if (i2c->adap.bus_regulator) {
+		ret = regulator_enable(i2c->adap.bus_regulator);
+		if (ret) {
+			dev_err(dev, "enable regulator failed!\n");
+			return ret;
+		}
+	}
+
+	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	if (ret)
+		if (i2c->adap.bus_regulator)
+			regulator_disable(i2c->adap.bus_regulator);
+
+	return ret;
+}
+
 static int mtk_i2c_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -1472,13 +1507,18 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	if (ret) {
-		dev_err(&pdev->dev, "clock enable failed!\n");
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
@@ -1486,19 +1526,20 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Request I2C IRQ %d fail\n", irq);
-		goto err_bulk_unprepare;
+		goto err_clk_bulk_unprepare;
 	}
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
@@ -1510,6 +1551,7 @@ static void mtk_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c->adap);
 
+	pm_runtime_disable(&pdev->dev);
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 }
 
@@ -1518,6 +1560,10 @@ static int mtk_i2c_suspend_noirq(struct device *dev)
 	struct mtk_i2c *i2c = dev_get_drvdata(dev);
 
 	i2c_mark_adapter_suspended(&i2c->adap);
+
+	if (!pm_runtime_status_suspended(dev))
+		mtk_i2c_runtime_suspend(dev);
+
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 
 	return 0;
@@ -1536,7 +1582,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 
 	mtk_i2c_init_hw(i2c);
 
-	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	if (pm_runtime_status_suspended(dev))
+		mtk_i2c_runtime_resume(dev);
 
 	i2c_mark_adapter_resumed(&i2c->adap);
 
@@ -1546,6 +1593,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 static const struct dev_pm_ops mtk_i2c_pm = {
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
 				  mtk_i2c_resume_noirq)
+	SET_RUNTIME_PM_OPS(mtk_i2c_runtime_suspend, mtk_i2c_runtime_resume,
+			   NULL)
 };
 
 static struct platform_driver mtk_i2c_driver = {
-- 
2.45.2


