Return-Path: <linux-i2c+bounces-8434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A73219EC271
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 03:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 771EB18856C3
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 02:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B851A9B42;
	Wed, 11 Dec 2024 02:47:18 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 11.mo561.mail-out.ovh.net (11.mo561.mail-out.ovh.net [87.98.184.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7D3137932
	for <linux-i2c@vger.kernel.org>; Wed, 11 Dec 2024 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.184.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733885238; cv=none; b=XvGNdBVzN6gbzmduOqkKb5ka1W29FdG3boWiLkYecyXT5lQEXsyZgMT7RRsWHZdxnesfH5YcgXEDO44dRCxScFbL9c0wulvEGm4vRYR7onhajq8XZ0eEwAT+Z553ehIPVPb4u83cDdAJAYm86UFe9+oJI9x0o42psnBT2jLCIIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733885238; c=relaxed/simple;
	bh=RSA5W+aUu9kn5TswI3lIVWqWj9MpCmpFEeVlLa671CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzdiOnJxDgD7PKRiP1CStLreMCFP9wBsH2FffZPaUXgCiCOgVoqR+1UFhPEoS1MY7M84RDQN6Xp7WCXe7qIkgx2qQnTRzpXgrLD13thG9OmLDfV1HXLnvjFrNwIuqAqdMXxPZKwXz9wnOsConSNlNP26qTa16qhntD5C1zc211w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=87.98.184.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.25.233])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4Y7Dy46p5Sz1KKw
	for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 23:11:40 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-8xlsv (unknown [10.110.118.7])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 99AC21FDBB;
	Tue, 10 Dec 2024 23:11:40 +0000 (UTC)
Received: from etezian.org ([37.59.142.96])
	by ghost-submission-5b5ff79f4f-8xlsv with ESMTPSA
	id f01aHazKWGcIfQAAjK+0gQ
	(envelope-from <andi@etezian.org>); Tue, 10 Dec 2024 23:11:40 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R001849f1d52-3a18-4b54-8189-65a0acc23c5c,
                    FE3B76875E3B0A6FCB1003007887B313CBEB2737) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 1/2] i2c: qcom-geni: Use dev_err_probe in the probe function
Date: Wed, 11 Dec 2024 00:10:53 +0100
Message-ID: <20241210231054.2844202-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210231054.2844202-1-andi.shyti@kernel.org>
References: <20241210231054.2844202-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14604047695666940487
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrjeelgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupddujeekrdefledrledtrdelvddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht

Replace classical dev_err with dev_err_probe in the probe
function for better error reporting. Also, use dev_err_probe in
cases where the error number is clear (e.g., -EIO or -EINVAL) to
maintain consistency.

Additionally, remove redundant logging to simplify the code.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 33 +++++++++++++-----------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7a22e1f46e60..01db24188e29 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -823,11 +823,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return gi2c->irq;
 
 	ret = geni_i2c_clk_map_idx(gi2c);
-	if (ret) {
-		dev_err(dev, "Invalid clk frequency %d Hz: %d\n",
-			gi2c->clk_freq_out, ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Invalid clk frequency %d Hz\n",
+				     gi2c->clk_freq_out);
 
 	gi2c->adap.algo = &geni_i2c_algo;
 	init_completion(&gi2c->done);
@@ -837,11 +835,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	/* Keep interrupts disabled initially to allow for low-power modes */
 	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
 			       dev_name(dev), gi2c);
-	if (ret) {
-		dev_err(dev, "Request_irq failed:%d: err:%d\n",
-			gi2c->irq, ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Request_irq failed: %d\n", gi2c->irq);
+
 	i2c_set_adapdata(&gi2c->adap, gi2c);
 	gi2c->adap.dev.parent = dev;
 	gi2c->adap.dev.of_node = dev->of_node;
@@ -870,16 +867,14 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
-		dev_err(dev, "Error turning on resources %d\n", ret);
 		clk_disable_unprepare(gi2c->core_clk);
-		return ret;
+		return dev_err_probe(dev, ret, "Error turning on resources\n");
 	}
 	proto = geni_se_read_proto(&gi2c->se);
 	if (proto != GENI_SE_I2C) {
-		dev_err(dev, "Invalid proto %d\n", proto);
 		geni_se_resources_off(&gi2c->se);
 		clk_disable_unprepare(gi2c->core_clk);
-		return -ENXIO;
+		return dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
 	}
 
 	if (desc && desc->no_dma_support)
@@ -894,7 +889,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		if (ret) {
 			geni_se_resources_off(&gi2c->se);
 			clk_disable_unprepare(gi2c->core_clk);
-			return dev_err_probe(dev, ret, "Failed to setup GPI DMA mode\n");
+			return ret;
 		}
 
 		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
@@ -907,10 +902,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
 			tx_depth = desc->tx_fifo_depth;
 
 		if (!tx_depth) {
-			dev_err(dev, "Invalid TX FIFO depth\n");
 			geni_se_resources_off(&gi2c->se);
 			clk_disable_unprepare(gi2c->core_clk);
-			return -EINVAL;
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid TX FIFO depth\n");
 		}
 
 		gi2c->tx_wm = tx_depth - 1;
@@ -924,7 +919,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	clk_disable_unprepare(gi2c->core_clk);
 	ret = geni_se_resources_off(&gi2c->se);
 	if (ret) {
-		dev_err(dev, "Error turning off resources %d\n", ret);
+		dev_err_probe(dev, ret, "Error turning off resources\n");
 		goto err_dma;
 	}
 
@@ -940,7 +935,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
-		dev_err(dev, "Error adding i2c adapter %d\n", ret);
+		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
 		pm_runtime_disable(gi2c->se.dev);
 		goto err_dma;
 	}
-- 
2.45.2


