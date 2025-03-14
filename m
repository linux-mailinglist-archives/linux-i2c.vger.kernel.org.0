Return-Path: <linux-i2c+bounces-9833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57383A61428
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Mar 2025 15:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE1D93B99E1
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Mar 2025 14:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB6B201035;
	Fri, 14 Mar 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VpzaK7nw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07546339A8;
	Fri, 14 Mar 2025 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964067; cv=none; b=UG/udERX4HapSB5LgN0MJu+zbxvB3HvAFwuLK8ITEGFufpNFS08x2t7vvldZGGQqNvHMU94+KRT2bCQVhm4rQC9BGKyxsEqI56YE+guYIJhg+/icP4/Pxg9PsRXC8yuSTMw4RICtWTkfoGCLTZXxRqiglojN9T+4/eBjLhqdLaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964067; c=relaxed/simple;
	bh=IcXb6ImJqQ6cQuC8feti3kVa1YlamnBfl1NTtxVSDPw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PbkwuaCqUJQo2X0yG11nlZSNEzRdKDjy44tqQzSJSPDxvYW+iyTYx0PQvW/F+U0aSsFml5mVr5grbJ7efHlIug6/ByDmMnqSJKbvkuKQMFI4ZQraRhwNiy7pBcjKCOCXNtmXAXmOfFxekKQpq/lh1k8uUDe8zvfbb4wIUZyzhb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VpzaK7nw; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 36b6d2be00e411f0aae1fd9735fae912-20250314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3mTgXdjRhAbeq30ZDJ/sx04DyGkMzLexZXSrhYrxbCg=;
	b=VpzaK7nwdRxS73ILbAswK0JFqwosNHJjJN3hEJX2xndhp1ZuYuS0aa4xBIS0EzVre64VJX2Gs3GiE1iQKBuRwodkC/nrqdlHEm0DFLV26io/pYILS1DfRkSGo7i9CcDPiXryV5Ns3j3v2AlMzfIqDGqsuA9+LKHbRizq5atp1EM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5ef4a68d-eddc-4802-aeed-864b01b32bbc,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:fdc1618c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 36b6d2be00e411f0aae1fd9735fae912-20250314
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1409200220; Fri, 14 Mar 2025 22:54:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Mar 2025 22:54:20 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Mar 2025 22:54:20 +0800
From: Zoie Lin <zoie.lin@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<teddy.chen@mediatek.com>, <joseph-cc.chang@mediatek.com>,
	<leilk.liu@mediatek.com>, Zoie Lin <zoie.lin@mediatek.com>
Subject: [PATCH v5 1/1] i2c: mediatek: add runtime PM operations and bus regulator control
Date: Fri, 14 Mar 2025 22:53:43 +0800
Message-ID: <20250314145407.2900190-1-zoie.lin@mediatek.com>
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
 drivers/i2c/busses/i2c-mt65xx.c | 74 ++++++++++++++++++++++++++++-----
 1 file changed, 63 insertions(+), 11 deletions(-)

This series is based on linux-next, tag: next-20250314

Changes in v5:
- Add pm runtime autosuspend setting to 250ms
- Add error message for clock enable failure

Changes in v4:
- Removed unnecessary variable initialization.
- Removed unnecessary brackets.
- Corrected grammar issues in the commit message.
- Confirmed autosuspend delay is not necessary.

Changes in v3:
- Removed the autosuspend functionality
- Resumed the I2C bus in mtk_i2c_resume_noirq() 

Changes in v2:
- Author name modification
- Replacement of pm runtime API
- Removal of redundant error messages
- Return value adjustment
- Add runtime pm status check

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5bd342047d59..a630733a8890 100644
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
+	pm_runtime_put_autosuspend(i2c->dev);
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
@@ -1472,13 +1507,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	if (ret) {
 		dev_err(&pdev->dev, "clock enable failed!\n");
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
@@ -1486,19 +1527,22 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Request I2C IRQ %d fail\n", irq);
-		goto err_bulk_unprepare;
+		goto err_clk_bulk_unprepare;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
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
@@ -1510,6 +1554,7 @@ static void mtk_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c->adap);
 
+	pm_runtime_disable(&pdev->dev);
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 }
 
@@ -1518,6 +1563,10 @@ static int mtk_i2c_suspend_noirq(struct device *dev)
 	struct mtk_i2c *i2c = dev_get_drvdata(dev);
 
 	i2c_mark_adapter_suspended(&i2c->adap);
+
+	if (!pm_runtime_status_suspended(dev))
+		mtk_i2c_runtime_suspend(dev);
+
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 
 	return 0;
@@ -1536,7 +1585,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 
 	mtk_i2c_init_hw(i2c);
 
-	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	if (pm_runtime_status_suspended(dev))
+		mtk_i2c_runtime_resume(dev);
 
 	i2c_mark_adapter_resumed(&i2c->adap);
 
@@ -1546,6 +1596,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 static const struct dev_pm_ops mtk_i2c_pm = {
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
 				  mtk_i2c_resume_noirq)
+	SET_RUNTIME_PM_OPS(mtk_i2c_runtime_suspend, mtk_i2c_runtime_resume,
+			   NULL)
 };
 
 static struct platform_driver mtk_i2c_driver = {
-- 
2.45.2


