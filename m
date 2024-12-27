Return-Path: <linux-i2c+bounces-8778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 888BE9FD856
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 00:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24D0E1884EC4
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 23:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAF914A62A;
	Fri, 27 Dec 2024 23:49:11 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 12.mo581.mail-out.ovh.net (12.mo581.mail-out.ovh.net [178.33.107.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03561547F3
	for <linux-i2c@vger.kernel.org>; Fri, 27 Dec 2024 23:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.107.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735343350; cv=none; b=MYNzI4nsVrkYJqwvZI8EjuITRg5MEKRNxpcdWxaiEcuotwpGH18DWLvEkigQv7M34lIzZkOwmLGehsp3BGfIqA2hcrx9ypiL+53Z67jK4aevcikfP6VrzTnHjsBDhyT1iJKJOJgHFrd0ixgrrK+JURUS3v/rzksGuP/NpS6aej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735343350; c=relaxed/simple;
	bh=wBn9uz/w0EiNkmFY57lHz7M0KHBUCBPGBvzCnVi6Qm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYJAEsqCMIMt8kED4FjcTcBwllMqYrVa5LIJa0qrIykdDboXm4ufFzuz1XCvMSCDdkTqmduHM3Mzy7Gyt8AtqyQWlWRnbSoyFnieQn0THd2sIu4VTO4+mLPG9sw7S5nSyQTm8SHkpTSFkOWmrwB//XqANDTjVtOwZwkR55nwbxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.107.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.176.103])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4YKgHP3hPlz1H02
	for <linux-i2c@vger.kernel.org>; Fri, 27 Dec 2024 22:32:49 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-rcdtk (unknown [10.110.101.246])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B99091FD42;
	Fri, 27 Dec 2024 22:32:48 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
	by ghost-submission-5b5ff79f4f-rcdtk with ESMTPSA
	id 3HomGxArb2cnXRkAKJWVUA
	(envelope-from <andi@etezian.org>); Fri, 27 Dec 2024 22:32:48 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S00481b48f1e-0671-40b4-ba33-6822b09e1607,
                    1CF389E8DC6EE1CDBE94366E1222F406669E166D) smtp.auth=andi@etezian.org
X-OVh-ClientIp:197.26.54.218
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v3 2/2] i2c: qcom-geni: Simplify error handling in probe function
Date: Fri, 27 Dec 2024 23:32:30 +0100
Message-ID: <20241227223230.462395-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241227223230.462395-1-andi.shyti@kernel.org>
References: <20241227223230.462395-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3103261619345951309
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddruddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudeljedrvdeirdehgedrvddukedpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth

Avoid repeating the error handling pattern:

        geni_se_resources_off(&gi2c->se);
        clk_disable_unprepare(gi2c->core_clk);
        return;

Introduce a single 'goto' exit label for cleanup in case of
errors. While there are currently two distinct exit points, there
is no overlap in their handling, allowing both branches to
coexist cleanly.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 33 ++++++++++++++++--------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 01db24188e29..7bbd478171e0 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -867,14 +867,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
-		clk_disable_unprepare(gi2c->core_clk);
-		return dev_err_probe(dev, ret, "Error turning on resources\n");
+		dev_err_probe(dev, ret, "Error turning on resources\n");
+		goto err_clk;
 	}
 	proto = geni_se_read_proto(&gi2c->se);
 	if (proto != GENI_SE_I2C) {
-		geni_se_resources_off(&gi2c->se);
-		clk_disable_unprepare(gi2c->core_clk);
-		return dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
+		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
+		goto err_resources;
 	}
 
 	if (desc && desc->no_dma_support)
@@ -886,11 +885,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		/* FIFO is disabled, so we can only use GPI DMA */
 		gi2c->gpi_mode = true;
 		ret = setup_gpi_dma(gi2c);
-		if (ret) {
-			geni_se_resources_off(&gi2c->se);
-			clk_disable_unprepare(gi2c->core_clk);
-			return ret;
-		}
+		if (ret)
+			goto err_resources;
 
 		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
 	} else {
@@ -902,10 +898,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
 			tx_depth = desc->tx_fifo_depth;
 
 		if (!tx_depth) {
-			geni_se_resources_off(&gi2c->se);
-			clk_disable_unprepare(gi2c->core_clk);
-			return dev_err_probe(dev, -EINVAL,
-					     "Invalid TX FIFO depth\n");
+			ret = dev_err_probe(dev, -EINVAL,
+					    "Invalid TX FIFO depth\n");
+			goto err_resources;
 		}
 
 		gi2c->tx_wm = tx_depth - 1;
@@ -942,10 +937,18 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
-	return 0;
+	return ret;
+
+err_resources:
+	geni_se_resources_off(&gi2c->se);
+err_clk:
+	clk_disable_unprepare(gi2c->core_clk);
+
+	return ret;
 
 err_dma:
 	release_gpi_dma(gi2c);
+
 	return ret;
 }
 
-- 
2.45.2


