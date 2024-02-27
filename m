Return-Path: <linux-i2c+bounces-2021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BA386890C
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 07:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 894131C21FE2
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 06:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE19128366;
	Tue, 27 Feb 2024 06:36:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D51E876
	for <linux-i2c@vger.kernel.org>; Tue, 27 Feb 2024 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.110.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709015817; cv=none; b=gY3ywZvj0SvMkldD1UsPIbbw3eCD4GVOlbG8UbZLIMyzJlMGJM7dXFZnMlN/80nkzQuaJwXrouDUPUBR/o3yE9JxlGT8uz3K9JBmXPNnOBds84H2mkwsLiLh5Y/my2Kp7q8zS8IB7IcVfpEuNE94wHU0vVuxJ7vBuLoG3eif24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709015817; c=relaxed/simple;
	bh=Sl10+9ktD2K8MiYZaFqWg4J3c0zqGpuoDV9ufuB/YJA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CockXdLvwzk8SALgN+lMi12LEeDRnAUd/+RcZdodyZBd70k1nAYhwkErO65faC1tGSqEcrYd7ceYBtY8Wo1I/SC/5u8RMs8f6IFibiWnd9uFd+KvUHM180tR0qs30k/nNpfgOB1Z5GzgVV/J/titXCav220A7Fb+oNKF6qkWkzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=203.110.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1709015803-1eb14e0c7c4a840001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id 6eNersxjRLgDb3so (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Tue, 27 Feb 2024 14:36:43 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 27 Feb
 2024 14:36:42 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Feb 2024 14:36:38 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>, <hanshu@zhaoxin.com>, "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>
Subject: [PATCH v8 1/6] i2c: wmt: create wmt_i2c_init for general init
Date: Tue, 27 Feb 2024 14:36:28 +0800
X-ASG-Orig-Subj: [PATCH v8 1/6] i2c: wmt: create wmt_i2c_init for general init
Message-ID: <6f469b5d507bb2c47664293fbde1614bdc47a5e2.1709014237.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1709015803
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 3424
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121384
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Some common initialization actions are put in the function
wmt_i2c_init(), which is convenient to share with zhaoxin.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

---
 drivers/i2c/busses/i2c-wmt.c | 67 +++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index ec2a8da134e5..f1888f100d83 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -286,6 +286,38 @@ static irqreturn_t wmt_i2c_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev)
+{
+	int err;
+	struct wmt_i2c_dev *i2c_dev;
+	struct device_node *np = pdev->dev.of_node;
+
+	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
+	if (!i2c_dev)
+		return -ENOMEM;
+
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(i2c_dev->base))
+		return PTR_ERR(i2c_dev->base);
+
+	i2c_dev->irq = irq_of_parse_and_map(np, 0);
+	if (!i2c_dev->irq)
+		return -EINVAL;
+
+	err = devm_request_irq(&pdev->dev, i2c_dev->irq, wmt_i2c_isr,
+					0, pdev->name, i2c_dev);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				"failed to request irq %i\n", i2c_dev->irq);
+
+	i2c_dev->dev = &pdev->dev;
+	init_completion(&i2c_dev->complete);
+	platform_set_drvdata(pdev, i2c_dev);
+
+	*pi2c_dev = i2c_dev;
+	return 0;
+}
+
 static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
 {
 	int err;
@@ -327,19 +359,9 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	int err;
 	u32 clk_rate;
 
-	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
-	if (!i2c_dev)
-		return -ENOMEM;
-
-	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(i2c_dev->base))
-		return PTR_ERR(i2c_dev->base);
-
-	i2c_dev->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c_dev->irq) {
-		dev_err(&pdev->dev, "irq missing or invalid\n");
-		return -EINVAL;
-	}
+	err = wmt_i2c_init(pdev, &i2c_dev);
+	if (err)
+		return err;
 
 	i2c_dev->clk = of_clk_get(np, 0);
 	if (IS_ERR(i2c_dev->clk)) {
@@ -351,15 +373,6 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
 		i2c_dev->tcr = TCR_FAST_MODE;
 
-	i2c_dev->dev = &pdev->dev;
-
-	err = devm_request_irq(&pdev->dev, i2c_dev->irq, wmt_i2c_isr, 0,
-							"i2c", i2c_dev);
-	if (err) {
-		dev_err(&pdev->dev, "failed to request irq %i\n", i2c_dev->irq);
-		return err;
-	}
-
 	adap = &i2c_dev->adapter;
 	i2c_set_adapdata(adap, i2c_dev);
 	strscpy(adap->name, "WMT I2C adapter", sizeof(adap->name));
@@ -368,21 +381,13 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->dev.of_node = pdev->dev.of_node;
 
-	init_completion(&i2c_dev->complete);
-
 	err = wmt_i2c_reset_hardware(i2c_dev);
 	if (err) {
 		dev_err(&pdev->dev, "error initializing hardware\n");
 		return err;
 	}
 
-	err = i2c_add_adapter(adap);
-	if (err)
-		return err;
-
-	platform_set_drvdata(pdev, i2c_dev);
-
-	return 0;
+	return i2c_add_adapter(adap);
 }
 
 static void wmt_i2c_remove(struct platform_device *pdev)
-- 
2.34.1


