Return-Path: <linux-i2c+bounces-8468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C709EE8E2
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 15:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66CBC2839AB
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 14:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CF82153FF;
	Thu, 12 Dec 2024 14:31:10 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 10.mo550.mail-out.ovh.net (10.mo550.mail-out.ovh.net [178.32.96.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43402153F7
	for <linux-i2c@vger.kernel.org>; Thu, 12 Dec 2024 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.96.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734013869; cv=none; b=oobUpr4OIRdn+x72vk7IIbMfnC7NZJ6f7OQ5noGDFUhLMieawSi3PIO/Wk077z3Hx4RII8Hcfd2ovFETv0zCGEY6QQ5CVr8kY2J/bwfBZdoajyCzVlDTmOWnFp0DmRQWlr4V1uLe7xUXDtctRHOVCjnnDKTgMwErohY3XqpayxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734013869; c=relaxed/simple;
	bh=RSA5W+aUu9kn5TswI3lIVWqWj9MpCmpFEeVlLa671CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sElmOkPPFDhhvZHOZoGEHf9OQFIj0xMpw/NLtvI6Rfxdto3c0VphV02NLfUoGS/ttPuvFI8BDsBvZwXYZZiTB9L5NUrYF4QRSV4IailFp+QBXnpwWlimggOojdHXX9IMUn+8DVlpECDwoch5IB1MsdNV+p1sm8gGvxN1RgVmJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.96.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.25.248])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4Y8DVW6j22z1Tnd
	for <linux-i2c@vger.kernel.org>; Thu, 12 Dec 2024 13:54:43 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-p4mxx (unknown [10.110.113.149])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0C31F1FEA5;
	Thu, 12 Dec 2024 13:54:43 +0000 (UTC)
Received: from etezian.org ([37.59.142.114])
	by ghost-submission-5b5ff79f4f-p4mxx with ESMTPSA
	id kGxlNiLrWmdwNQAATAYGmg
	(envelope-from <andi@etezian.org>); Thu, 12 Dec 2024 13:54:43 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S008070d7480-a6fe-4e9e-abfb-38be5adcf06a,
                    7E8E14E11F102121CE247F47C6B4DBC0808239E0) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 1/2] i2c: qcom-geni: Use dev_err_probe in the probe function
Date: Thu, 12 Dec 2024 14:54:15 +0100
Message-ID: <20241212135416.244504-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212135416.244504-1-andi.shyti@kernel.org>
References: <20241212135416.244504-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16943386224625650247
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgdehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupddujeekrdefledrledtrdelvddpfeejrdehledrudegvddruddugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth

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


