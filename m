Return-Path: <linux-i2c+bounces-2240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC5F874211
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 22:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74C61289895
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 21:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADFB1B286;
	Wed,  6 Mar 2024 21:35:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo582.mail-out.ovh.net (7.mo582.mail-out.ovh.net [46.105.59.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD04A18EAF
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 21:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.59.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709760937; cv=none; b=LXsuw9bMWFgEnA08nmHc1J63Aqp+GnrrmXsS+CVKJL7VYbttvAkNFNeOwB5qdCx4UPwyvYZ7YAddLQZtt9tz4kYIS6XTZ4CLL4BhEcvKX8kUI8idUtacZtbrFVuyq/4wrsWbSAdqX0towOSvEJt8DqPx7+7wtq9fFAOfNT/0tQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709760937; c=relaxed/simple;
	bh=10AP5VNxvnfOSQTxRfiiqmPkEY/2LjObiSJkG17b0uM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhb8fUDf6+hif/DYwKFlJetp1OAMUzFHefhZvORDaLogJAHmBOr/WPDT58d9JrIcAI+9T5eXhA3YdMuXcweVlHSfZMMVTEYEQPq3l4Cy89ESsSIevUs4DovgGIm7qEBHg5TkeOhENOc9cXLi3t5SSBh5VuTj2o0j//3FlR0+41w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.59.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.139.217])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TqlpM5qr4zyGR
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 21:25:31 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-vcnmd (unknown [10.110.178.210])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BAEE21FE82;
	Wed,  6 Mar 2024 21:25:30 +0000 (UTC)
Received: from etezian.org ([37.59.142.101])
	by ghost-submission-6684bf9d7b-vcnmd with ESMTPSA
	id ZvgRHErf6GUdYSQALiJWsw
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 21:25:30 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-101G0041a6a8002-1bbc-4c3a-b73a-0831dc3e9285,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>,
	linux-i2c@vger.kernel.org
Cc: wsa@kernel.org,
	cobechen@zhaoxin.com,
	hanshu@zhaoxin.com,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v9 1/6] i2c: wmt: create wmt_i2c_init for general init
Date: Wed,  6 Mar 2024 22:24:08 +0100
Message-ID: <20240306212413.1850236-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240306212413.1850236-1-andi.shyti@kernel.org>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <20240306212413.1850236-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16089954095712766535
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugddugeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth

From: Hans Hu <hanshu-oc@zhaoxin.com>

Some common initialization actions are put in the function
wmt_i2c_init(), which is convenient to share with zhaoxin.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-wmt.c | 61 +++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index 198afee5233c3..ec9d9eb888e0c 100644
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
2.43.0


