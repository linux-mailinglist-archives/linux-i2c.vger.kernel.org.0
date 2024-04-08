Return-Path: <linux-i2c+bounces-2815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE889B62F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 04:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A4F5B21366
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 02:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2574524A;
	Mon,  8 Apr 2024 02:55:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4E522F
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 02:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.110.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712544931; cv=none; b=L7T2FPTOIrlu9Nu/TBnRPk9zxGotMXqELx5T+1T75YFt/+rL9qfLp+bm8D9/4lb8ZwXGc12j+ObczAJ1Zrbf/j1TgL4JPvcglxU8UgohQHC0/YtbxcLrFRG3qZb08SjhtHgMcWqI5IsKLupzY78qAEhCoBOqBIiCE1SBTJVyeYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712544931; c=relaxed/simple;
	bh=6+fNF8rV5VOB50UC2byZehxiLfN3QtBdY4SWB9gNVnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ElYU/kJ0E+XAXN8+kOtnRMKoea30WFY0P8YqZsejAnsJgmYdWvkw7Yq00LkwVu5EqH8lYdKyS2TFFZ7nfCuHW6zMuA0QUpYWw09EPEY2SmB5jhVg+uguxA/8NNt58dJJFhOErUCv3PokNqRdoZPMBzqrZFQhQbQTDj1BRklZHqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=203.110.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1712544890-1eb14e2b8127a00002-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id DMTEOq0hgFpb8xbS (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 08 Apr 2024 10:54:50 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 10:54:50 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 8 Apr 2024 10:54:49 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>, <hanshu@zhaoxin.com>, "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>
Subject: [PATCH v10 1/6] i2c: wmt: create wmt_i2c_init for general init
Date: Mon, 8 Apr 2024 10:54:43 +0800
X-ASG-Orig-Subj: [PATCH v10 1/6] i2c: wmt: create wmt_i2c_init for general init
Message-ID: <60d6194d9e6623744955047a3881f9010b4da85a.1712479417.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712479417.git.hanshu-oc@zhaoxin.com>
References: <cover.1712479417.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Start-Time: 1712544890
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 3842
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.123213
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Some common initialization actions are put in the function
wmt_i2c_init(), which is convenient to share with zhaoxin.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-wmt.c | 65 ++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index 198afee5233c..76ede433f65c 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -109,7 +109,7 @@ static int wmt_check_status(struct wmt_i2c_dev *i2c_dev)
 	unsigned long wait_result;
 
 	wait_result = wait_for_completion_timeout(&i2c_dev->complete,
-						msecs_to_jiffies(500));
+						  msecs_to_jiffies(500));
 	if (!wait_result)
 		return -ETIMEDOUT;
 
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
+			       0, pdev->name, i2c_dev);
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
@@ -348,18 +370,9 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	}
 
 	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
-	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
+	if (!err && clk_rate == I2C_MAX_FAST_MODE_FREQ)
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
@@ -368,8 +381,6 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->dev.of_node = pdev->dev.of_node;
 
-	init_completion(&i2c_dev->complete);
-
 	err = wmt_i2c_reset_hardware(i2c_dev);
 	if (err) {
 		dev_err(&pdev->dev, "error initializing hardware\n");
@@ -380,8 +391,6 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	if (err)
 		goto err_disable_clk;
 
-	platform_set_drvdata(pdev, i2c_dev);
-
 	return 0;
 
 err_disable_clk:
-- 
2.34.1


