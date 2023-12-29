Return-Path: <linux-i2c+bounces-1064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDDA81FD3A
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 07:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89D50282560
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 06:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221CE7493;
	Fri, 29 Dec 2023 06:30:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B966FA9
	for <linux-i2c@vger.kernel.org>; Fri, 29 Dec 2023 06:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703831441-086e230f290a520002-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id iLjsX8sVWom5yWN5 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 29 Dec 2023 14:30:46 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Dec
 2023 14:30:41 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 29 Dec 2023 14:30:40 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <cobechen@zhaoxin.com>, <hanshu-oc@zhaoxin.com>
Subject: [PATCH v6 1/8] i2c: wmt: create wmt_i2c_init for general init
Date: Fri, 29 Dec 2023 14:30:32 +0800
X-ASG-Orig-Subj: [PATCH v6 1/8] i2c: wmt: create wmt_i2c_init for general init
Message-ID: <19a2be1aeb0d935b433d0b0eff0dabaeaaaa3de7.1703830854.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Start-Time: 1703831441
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 3376
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118704
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

v4->v5:
	add previous prototype 'static' for wmt_i2c_init().

Some common initialization actions are put in the function
wmt_i2c_init(), which is convenient to share with zhaoxin.

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


