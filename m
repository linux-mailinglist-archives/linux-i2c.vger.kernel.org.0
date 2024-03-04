Return-Path: <linux-i2c+bounces-2143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAA086FFB0
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 12:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27F07B247FD
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 11:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1F3383AD;
	Mon,  4 Mar 2024 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Mo6hwwvp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348BFB654;
	Mon,  4 Mar 2024 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550082; cv=fail; b=eGYAtyGGcMu8fm7lQ9bUmjvBim3YYEdHvOic2rCNrfHdT9nl6a2gj70xTek0IPGl35RNenaIsZSu2pCmx4gOg9MRs3VRh0mo+NJhWdmpFgZuJzE/25poPXdL+SKFzz0eQRCLeSJrvbt/K7c5rDpntt9XF1qDf05gxNDoU/xsuLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550082; c=relaxed/simple;
	bh=taEDUYVo0Xd2CqGzoJOj2Ho325kV+SsKkReUpIS++rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=d/ELFtL3ZtZzC76SfpMoOg8K4RDUHKqu64WkWUvfwu5xGyoOHFgQJA/aC5PXA827QdG5cZ+50Iu0CBiQ+N090iVhxUkYirec/BrAqM5pOj2SjgG3KBYcXutGuy+qZp4VOMtZFyBFm/aqVIiPzXDazIHtobTHPAXH5++WSSLQaYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Mo6hwwvp; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiURKwBBLcGrdvOT8wnppYEl9Z4QJj+wvtEHWPp227kmcvK1WsodMYyvVKsaXEB5IjN0YvFypBLPeYIz4OxAjLwJ0iXbIfzENZNLBA8iC9PQmWJh16mIZzcK5eKkXBGKvJEmBXisAGQIpveUgmxYO38B3QXOV32YmqCgsg1CKrTCPQHhrnILKw+eHD+ZoWefbWY2Pca7WnpZ0Hp0Q3ZyVcUnhWDDgRS7jvP13ILPowqphYfGawDha7iNsm4gEITcsgD1YfWWbEAdEalJYe4KNh4Djmdt/hgwkN9HLl7ECdEcGqYO0vSvZy80S+bJrAKITsnl3cpc8lAPDNBjCSBFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+ZZbnIdkoGNUj57jIAS8nVuE1fh9JoC9AwLIvDdNmc=;
 b=Es3PyzAKGYwGLdJd2MdAwg64+4sL5P6sUIunqBckA/E3aZIfgXu2VW4WSYljPhP9K/rXI4M3uZlxT+LcvXIOVZNrY5ZH3B47pVacvpMn+CPrwjClCPAncOasWRJdUQFcBGx8FRmiqxqp6caQFroiWp8knxm9AhMztX81HRvh2qomIcc+JJyMwIxuQzwlRE96NmuVwl3Qna4PTyQ/h0M0AZ1/Mbt3zEbnarLmRrv42pIVSYEO0/P4uydTCVDkiYgJqe1/BFnWI9B/79xJvUC9HaprY3y7a16OYiao0yjwM/RYhz12+ER3SjxcPKNp7naMYHkz771crDZzSB1GxP+dBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+ZZbnIdkoGNUj57jIAS8nVuE1fh9JoC9AwLIvDdNmc=;
 b=Mo6hwwvpqCngHVXfCi1Z3ew7Hm+83uvauoguNs9lpouu8inPtk05ihKzYU3v3cOOR3sKNgkrH7xRkM0ijNzxibPZZMkRFPjSkEHe26N3wynCbKHfTUSHreJ1ueUqvj9yhUMU09zBQrxGb9UPcMN3l9Gz1BFAgcyfOFBEdXYSktc=
Received: from DU6P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::14)
 by AM9PR02MB7108.eurprd02.prod.outlook.com (2603:10a6:20b:266::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 11:01:16 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::b0) by DU6P191CA0024.outlook.office365.com
 (2603:10a6:10:540::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Mon, 4 Mar 2024 11:01:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 4 Mar 2024 11:01:16 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 12:01:15 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 12:01:15 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 4 Mar 2024 12:01:15 +0100
Received: from pc55637-2337.se.axis.com (pc55637-2337.se.axis.com [10.88.4.11])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 79B30159B0;
	Mon,  4 Mar 2024 12:01:15 +0100 (CET)
Received: by pc55637-2337.se.axis.com (Postfix, from userid 363)
	id 7CE00209F3C1; Mon,  4 Mar 2024 12:01:15 +0100 (CET)
From: Jesper Nilsson <jesper.nilsson@axis.com>
Date: Mon, 4 Mar 2024 12:01:14 +0100
Subject: [PATCH] i2c: exynos5: Init data before registering interrupt
 handler
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com>
X-B4-Tracking: v=1; b=H4sIAPmp5WUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDIyML3Uyj5PjUisq8/GJT3ZQkQ+NEc6PU1GSLJCWgjoKi1LTMCrBp0bG
 1tQAgdi6bXQAAAA==
To: Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709550075; l=2710;
 i=jesper.nilsson@axis.com; s=20240216; h=from:subject:message-id;
 bh=taEDUYVo0Xd2CqGzoJOj2Ho325kV+SsKkReUpIS++rs=;
 b=42Xz07/u1gESiLkkx8zkvVy0spBZP95p3aFkIH9BUSDtZ4eERc12NHYCw1maC1j0y6Q/qteJt
 5pAMd0Uh6bCB0kaO75nQwB1Ip1v2AkpTndpB5nn28qz/CvUhxiHUMyH
X-Developer-Key: i=jesper.nilsson@axis.com; a=ed25519;
 pk=RDobTFVrTaE8iMP112Wk0CDiLdcV7I+OkaCECzhr/bI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AM9PR02MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: bd92e749-2c52-4bbb-d358-08dc3c3a69f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6rF2IcZicHZYAIAjju7qPxXL7AP5Q6m5A/pDVQqhmnm/UVzxQ8DGdH4QhS6kKu3PBkbJTR3se2C3RaSNF9oa8Sh0CqkttpMwGo0S3DLRVbn/iaq3kSp2SPXvMqIeThvNdctAiP3oQED0iiVp2w1iuSjPecNIjAdJ8AkPrgnw+YYOzess9q/3TQKxo1AYjNrJJMdD1mot2wvL31SPE3yKO3lhXwKDTxrt1Hq5IC4RfO8apjnddNqxylUR43DZSWspJSdGRoePFp5tAZLr2UM4PrvAQUHCa1V/xeLtwjloOKPYTkkj6UiUUYx7z/ZlJIuUzUQQrAjz8rPJrrGwu4SWjwdOSJV9uw11BgD6lWdc0g6NIv5OVuzK327PEAYZGvSzLpBG/fax7M6ztbbg0g+9uGTYAcIaKaXiKQdS0Oyvnu98kfBelZBU1gfAenMB7IAJ45M9tAt5yutWIcQ3JwhNaez0Fm97n0olJeivRVXBT6ZumssfmvF6pfxpLDMeAtiG03EntsDlFFrp09Qtiao5VoAb2h2Js8iIsc97hHsSeXtDfOOnTtxxxZb7O8xXgJNKIMRXBxaX6J2hLifvqjgm7OIhSZir2aXlk88X0N3OmAYpjQFENly1+NjD2H/ZP4qszkPCwYrkwHhiMdL7wbaWB07tGPQH7sA398sncnoNlqBU1ecZ+ChO2Uo2ArgYuSAHjNzhDBVSBFlOmc9ZSCFiGnFC84OfuBXIdSO9jgJwi0vfo2sCr+rqb5gMzgKCTV7O
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 11:01:16.2736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd92e749-2c52-4bbb-d358-08dc3c3a69f9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7108

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
Additionally, return failure if we can't find a match in devicetree.

Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 385ef9d9e4d4..eba717e5cad7 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -906,24 +906,14 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
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
+	if (!i2c->variant) {
+		dev_err(&pdev->dev, "can't match device variant\n");
+		return -ENODEV;
+	}
 
 	ret = exynos5_hsi2c_clock_setup(i2c);
 	if (ret)
@@ -940,6 +930,20 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
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


