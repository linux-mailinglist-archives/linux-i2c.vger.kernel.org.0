Return-Path: <linux-i2c+bounces-2178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01B870700
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 17:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 358961C219F8
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6F71426C;
	Mon,  4 Mar 2024 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="eK8c8Ers"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2048.outbound.protection.outlook.com [40.107.104.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82873C485;
	Mon,  4 Mar 2024 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709569808; cv=fail; b=js80uX/evYMWsEn5Uy/iy9Klt16BhsxSAycLWZAnVjAMw1KamBW2LfZsPVsXH3nHZPDLTGeS2O7prTHZky2w4zFbLxJWtKBMVkiYGfU/Mspdq5Uw/+Of0SfHmzkwhrrnlpUki9kE5rIEGvL1/rPZDaJyCi7lQ4ujzGPzFbEKU3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709569808; c=relaxed/simple;
	bh=V8PPWKfRKaAqGG79KyG/l808doCH09EavSbLwJFkS4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=fZBbNggL9TjVApmm7Szbfje+wzwMLosUqGDcMpp9n+3qtoHtpvq7wZqtg2rLru4woEUpuh5C66dFzaenzsWK+2Sti4gf5MYjUSNa/7M6cM5TDkmqHLcZVOnY9lIoXoefCZ+oFP4HJwqLAQ8N6G6heYjAkPj0MFRta3M/TQq4lAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=eK8c8Ers; arc=fail smtp.client-ip=40.107.104.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuhuXEtqsQKv3b0FCdJ/SRVPg091Qwur5fSyD3vq87nqiJsNemg/xqYdkWrAneJqIRLB4/2fI97uZZsG9CYsNawkDf5I073ew3GkSjCbQtpAJj7ltUHbRmC/tqZkjVzbbdNQolZcKaqdPTOlwjH5nR/r7Jyr4wktQpzwt4cyT0TXxHjhx64fb/HKvIx1QDASojffaMQEF2SwjWlfgTPUcwE7rRVl0N7sVGtg9Olp7sbUoCuvpsS4t1miin7pxVX/ncVh+qDG3JTdt2xSmZCjXjm9r5sPX7ON/d6PVSulvQzcTLbnTRv+l2P+kTGJELpb6w7kqfdQ4OM/inb+w9/LGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXGbO92C5AjqF5DdOeoJYGWVBQOMA88sFlwp8xctN2U=;
 b=Rpni1UUmb/zkj00HLEE/lEnh4VkbN+gouGU/BSwCubrK7DylUy3JQ9yNQT1qSlOBXXyyBh3rN3FNbUTfdZfDaQnK5F0s4HF6MDn0OBJyNDHzGPEe80DqExYsYvkMnQYuYDde7F3e2gLnAVK101aFMQm4KsilIdTJbX4ge26EMk9+gzJZMeJ0Eqo/tWBxe/kKK0rT14CoDoTCTJr9ZKH2a8XGKTbL5zU+BpleF2R6vlJVPlzAWKzBJ0RgRovEz26UijTgMdBnb+oFaPMKfZotUTR8uPpxl7h+n7kHHWHdeT6HDemqnIzxvDyrRTkY6DqDyeMfsv4lGgMMbfHAFKiOLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXGbO92C5AjqF5DdOeoJYGWVBQOMA88sFlwp8xctN2U=;
 b=eK8c8Ers+AefngUXPS6wMDFztGabG++8Yae8pKnHfw8K2Mfa78fSoQh/dz+PlMW5w2NVveRyfJKzwP+9Asn1/7GReriQNrgbNedcr9Daqb+Oj2Jox/4gtlOHxv3Cb1I47L0rjyAhnxMAtFzSkZ9+7qenKwHGsDbIjyck7C4KAjk=
Received: from AM0PR05CA0093.eurprd05.prod.outlook.com (2603:10a6:208:136::33)
 by AS2PR02MB9811.eurprd02.prod.outlook.com (2603:10a6:20b:60c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 16:30:02 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:208:136:cafe::23) by AM0PR05CA0093.outlook.office365.com
 (2603:10a6:208:136::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Mon, 4 Mar 2024 16:30:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 16:30:02 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 17:30:01 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 4 Mar 2024 17:30:01 +0100
Received: from pc55637-2337.se.axis.com (pc55637-2337.se.axis.com [10.88.4.11])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C5A39159F6;
	Mon,  4 Mar 2024 17:30:01 +0100 (CET)
Received: by pc55637-2337.se.axis.com (Postfix, from userid 363)
	id B050422F9FA4; Mon,  4 Mar 2024 17:30:01 +0100 (CET)
From: Jesper Nilsson <jesper.nilsson@axis.com>
Date: Mon, 4 Mar 2024 17:30:02 +0100
Subject: [PATCH v2] i2c: exynos5: Init data before registering interrupt
 handler
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240304-i2c_exynos5-v2-1-7b9c312be719@axis.com>
X-B4-Tracking: v=1; b=H4sIAAn35WUC/1XMQQ7CIBCF4as0sxYD0zZSV97DNIbCaGdhMWAIT
 cPdxbpy+U/mfRtECkwRzs0GgRJH9ksNPDRgZ7M8SLCrDSixk4haMNob5XXxsRduUq05IZHVE9T
 FK9Cd865dx9ozx7cP644n9b3+nFZ2f05SQgkalNV6cPWjv5jM8Wj9E8ZSygd3vfD8pQAAAA==
To: Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
CC: Naveen Krishna Ch <ch.naveen@samsung.com>, <linux-i2c@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel@axis.com>, Jesper Nilsson
	<jesper.nilsson@axis.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709569801; l=2873;
 i=jesper.nilsson@axis.com; s=20240216; h=from:subject:message-id;
 bh=V8PPWKfRKaAqGG79KyG/l808doCH09EavSbLwJFkS4s=;
 b=FV1ZS/PsPLmn2LHxNjNMqZgC59hd6nOEHksYia1TNVmryZGKk0PH2cBqYvtgGu0tS1u9yzgDS
 Mn2IeSZ6z/zCmaxi7JrA67UtGmU6yNGe7envpXWJlHRRIHm4BSjCjw6
X-Developer-Key: i=jesper.nilsson@axis.com; a=ed25519;
 pk=RDobTFVrTaE8iMP112Wk0CDiLdcV7I+OkaCECzhr/bI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A68:EE_|AS2PR02MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: cb72fe90-fd67-48af-4b55-08dc3c685799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cis6tcWKichui0UYkLMP5Dv0z6gO2/X8grCCWlj2g6irq8Zs9lUlFP3vM/BgY8pWc8BtRoB4Qn6EFbZdm7NrwUFW15gl1vR7Dzt61cIIVXbmO/kkXJNGw6970EoSdFwkRzZ2ttuFd8iSUsppceubc6Zqsxea9vsVihpuDOuVLfljJUOHlaisepTH09bO3MM7NMLhR09Cq/rK+5FObJ025M+5LAN3GwUvdU/9iekwyFUfWKmaPCXzbqnb5vWPjHvWJ9BarIpcsNHYLLEpiGtyLncfS1+xA6Wcjf6T2RHiVUBz69IZv0AL8w/ToY3x6SBsqNQSl39iGtKIVAohxsp+mpGbGAuN32IDHK+9BUv72QDmRxxCSBXd2WI4x9I/FnSA5Td6y4Y2w62XGT5sGPehsOk8/eTKRZNqezftyNUIK/2hmL8tIg8njUANDLsGLsf8pd+09gmxU6FwTCMSDFIfQb6aja2lvllZ/+zHRLXmaUt8UTd8yR0CK5U6s5F5mtc4wOjAGkGLXhVypUAFy6nOe8Lf2mjWuS9MHZ6kzriu0o/THlnbBm5c30tCUJZr+PWtUd3d9x1qAcMgnuixK1XfIL3/afnrDSLIdGL0MbgdWYpgysNSUW5sHIGaBYqDf0UidnYHY/Rr1enP0koiyh8GOTiPf26KIVLhgduIFxevTikpEijqodO74wEXvGmKI5MjMKDHosTX3ioF8TopbWfRhw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 16:30:02.3228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb72fe90-fd67-48af-4b55-08dc3c685799
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9811

devm_request_irq() is called before we initialize the "variant"
member variable from of_device_get_match_data(), so if an interrupt
is triggered inbetween, we can end up following a NULL pointer
in the interrupt handler.

This problem was exposed when the I2C controller in question was
(mis)configured to be used in both secure world and Linux.

That this can happen is also reflected by the existing code that
clears any pending interrupts from "u-boot or misc causes".

Move the clearing of pending interrupts and the call to
devm_request_irq() to the end of probe.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Fixes: 218e1496135e ("i2c: exynos5: add support for HSI2C on Exynos5260 SoC")
Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
---
Changes in v2:
- Use dev_err_probe() instead of open coding it
- Dropped the return failure if we can't find a match in devicetree
- Link to v1: https://lore.kernel.org/r/20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com
---
 drivers/i2c/busses/i2c-exynos5.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 385ef9d9e4d4..29d7cf158612 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -906,23 +906,9 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	i2c->adap.algo_data = i2c;
 	i2c->adap.dev.parent = &pdev->dev;
 
-	/* Clear pending interrupts from u-boot or misc causes */
-	exynos5_i2c_clr_pend_irq(i2c);
-
 	spin_lock_init(&i2c->lock);
 	init_completion(&i2c->msg_complete);
 
-	i2c->irq = ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		goto err_clk;
-
-	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
-		goto err_clk;
-	}
-
 	i2c->variant = of_device_get_match_data(&pdev->dev);
 
 	ret = exynos5_hsi2c_clock_setup(i2c);
@@ -940,6 +926,20 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	clk_disable(i2c->clk);
 	clk_disable(i2c->pclk);
 
+	/* Clear pending interrupts from u-boot or misc causes */
+	exynos5_i2c_clr_pend_irq(i2c);
+
+	i2c->irq = ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto err_clk;
+
+	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
+			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
+	if (ret != 0) {
+		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
+		goto err_clk;
+	}
+
 	return 0;
 
  err_clk:

---
base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
change-id: 20240228-i2c_exynos5-db13a72eec8b

Best regards,
-- 

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com


