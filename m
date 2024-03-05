Return-Path: <linux-i2c+bounces-2197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFAC871C55
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 11:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2433BB24017
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 10:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E0454901;
	Tue,  5 Mar 2024 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="l644s7N0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2074.outbound.protection.outlook.com [40.107.7.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70704433CA;
	Tue,  5 Mar 2024 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709635809; cv=fail; b=hTLPDvVfYgMpkB8t/p+FpctKfo9N9NjTsmMDIeA6A7S3yGD6RPahR+zctnid+8K8vOB1AZnNbmjh8mAqlwp97HrsSGoImFvtokrm8cO3yxfaIka4RrGhROHxwiq9ZL1xgvLR51M2jxzNNFUZOSLlWD1CM+Qvsge4Fi/20d2GSG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709635809; c=relaxed/simple;
	bh=FPiLeRazbLSihMpqoonG41u3TVb7xxjEVkv2Lf2P/8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=CAmrh42QeG8kddYe0EcGRjfP9Xhfr9zhngtm+MzjlUW7enINEo14cx2Ldp/BH/Toi22tgaiEeAlkmaTNdu+FCDdGrFdKko65DXBhwwkpzsAtayRjZb4R9hu3/xvPGUBbeJpZMVw2WZ8kDnh+E8cJKUhKCRayqkYBEEyfet9oGWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=l644s7N0; arc=fail smtp.client-ip=40.107.7.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRs6PUDHss/QJyMenXp/ziWteCu3LaBb+cQFDoh0/Z+r7X/7fCiW1nzaYI44+rmx9gSS2By9b9ohHBNaP/REkCUC02VHjeXbmZIiWPbjBx8u6tTrKN5YPflbZCR5rluaXJgmwuEZi7DyG6NMWVWZGUG4mp6o982u/AUD23cD67znM9c+Vz/W4bcaVhBUKhP7Mh2DjsfTpgr8ocW/nqxAei7+ZA194sC8XsI6KnLCC782llD7PqNf3YiE1LdDbwejzVSyRMygmSv1xAFv9TrS3wHE+CeZ1nFsmr3J8GnW2+q9PRB41ZOSf9q0e6hd70Jmq8qr/bGHJTAnYtUo6dEMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/eMC7j4cmsJpQlzTARDHBzwdUV+VgkTCQ6FRC8mNdQ=;
 b=Cg3BsCuSsZ18n3AUrBfRbVzdv6KR+zYX2nGSNKE4fWftaaWonoCoqwchxC7uzNofLGs0w+TyPizzeymmZJvW+iV8qBgfIqt2sHKLkW3IvzvCicCUKa9XyYt4WNq+6K1xdeuDnXUTQQjKE6gPVoOa4vX96sY2J+aeJMXBjw4CyNSpS2ILjNLaXXxzJRSx0RK8d9iaHBOXDQGDN2yIWeJV6cCyZY1X7ersB6uPSb8pR+9fw6jSo4dES3qFuWcQilRf0BFNWVZQwyGWJS8uc2+H3zMGt5i2cPfW+sJGaqjYdegSK0jmjRci7tqc/L5dDkBklewo21oneph1N0Cnp/sH8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/eMC7j4cmsJpQlzTARDHBzwdUV+VgkTCQ6FRC8mNdQ=;
 b=l644s7N0vwY0HNAsKrlk/bQWvdkYX6BKxPfanUBWThPgZ+CRXmejIEO3XHFLNRmv3uYxoGtCgzjcpJa7HlR5Vydubqip4u3U0j1Ykg96LOzj2WZmoBAESs9KZU7KV9ZdS5xG+wm6Cx+O2TU3/o9wF+u+PcxnVuUKPo7AWS0/THg=
Received: from AM6PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:f0::41)
 by AM0PR02MB5906.eurprd02.prod.outlook.com (2603:10a6:208:17f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 10:50:04 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:f0:cafe::cc) by AM6PR04CA0064.outlook.office365.com
 (2603:10a6:20b:f0::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Tue, 5 Mar 2024 10:50:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Tue, 5 Mar 2024 10:50:04 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 5 Mar
 2024 11:50:03 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 5 Mar 2024 11:50:03 +0100
Received: from pc55637-2337.se.axis.com (pc55637-2337.se.axis.com [10.88.4.11])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 94D5715AC9;
	Tue,  5 Mar 2024 11:50:03 +0100 (CET)
Received: by pc55637-2337.se.axis.com (Postfix, from userid 363)
	id 89E202369676; Tue,  5 Mar 2024 11:50:03 +0100 (CET)
From: Jesper Nilsson <jesper.nilsson@axis.com>
Date: Tue, 5 Mar 2024 11:50:00 +0100
Subject: [PATCH v3] i2c: exynos5: Init data before registering interrupt
 handler
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240305-i2c_exynos5-v3-1-17a749688806@axis.com>
X-B4-Tracking: v=1; b=H4sIANf45mUC/32MQQ6CMBBFr0JmbQ2dQmhdeQ9jDC2jzEJKWtNAC
 He34EY3Lt/Pf2+BSIEpwqlYIFDiyH7IoA4FuL4dHiS4ywxYYlUiasHobjTNg4+16KxUbYNETlv
 IxhjoztNeu1wz9xxfPsx7PMlt/XRUWf10khRSkJFOa9PlR31uJ45H55+wZRL+UTGrjTVOSbTUS
 POlruv6Br/t07fgAAAA
To: Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
CC: Naveen Krishna Ch <ch.naveen@samsung.com>, <linux-i2c@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel@axis.com>, Jesper Nilsson
	<jesper.nilsson@axis.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709635803; l=3018;
 i=jesper.nilsson@axis.com; s=20240216; h=from:subject:message-id;
 bh=FPiLeRazbLSihMpqoonG41u3TVb7xxjEVkv2Lf2P/8k=;
 b=XuZHy/O4GxauAUBlVV0CFqNLxn6OQI65ZN7Y3rMHUj7WfHCBjMv0xwjicSxxWR2tMozxSx0c8
 k2WMuBuleOVAnf3hHOWpFqvXHob17WLVhnRD+K0KLSSHt2PdyqCIx1f
X-Developer-Key: i=jesper.nilsson@axis.com; a=ed25519;
 pk=RDobTFVrTaE8iMP112Wk0CDiLdcV7I+OkaCECzhr/bI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DA:EE_|AM0PR02MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 208aef2f-2c00-40ae-b652-08dc3d0203f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EsZzpRbuWVBB6hE76/RKkSgTK1nqbth7K0oCA4hq5wZyKRcHQXVmqilfEGq1OeI2oBVc6THU+9vMWLLQLi46VXgiqAAvyVmUFMyiPCX0um6nOoAMWhb9wJ1nuZ911DuMNCmr5MEbDGjzam8kRbSFggiOJs44GqiRd6Ss9DHxYcz6ULkM7nQGVsE07iUjI0ZusmDWsBWnKoUY7roSIzxXUs2U1edYIe/Q392HIzrFESp/DaEDTOmEHR/LnRc9wN5AXNIhL0RbNjw8V3AdEmAm747TwnLWfiHfXrDD4L7z6JtoUOR//0ujoehq54OxYLebsZxGqSe5JfawqsE8gErjan8r4cByeirmfmHsnwBThcVxOfX/y8kluFSjSv7PENxZq42D1wUo8ZJDbSlBl3sneW8lCgKnJ4NoDn4yNqR6RVEA3jie68LDD4hYJSQ4ct+Y9RSP/sQvhcWWF/dxsLpd3Bi4yQKAG+YOrLfBagym80omtFRyZq4CjX4FGzu1n9gB/KDpFvxdfU552qtryx7a5mjNnb8HqcXjPrqBnobU/4iec6TwSPWxlOvQXjk+S2GyPtcR+GGKPQQ2nJTFD7RcRYuN2dIFKqkO/Nr0e6qWvSyZ4gGQZ+h0sQx7S3yyhOS/hj7PmFe0gUFBVY0caZknTXL6p5jQonHePR4BaiXRiC2Upx7kosHfXUYNku5vaIgTR18xPm2ORMohh7sE45cN1g==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 10:50:04.4987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 208aef2f-2c00-40ae-b652-08dc3d0203f3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5906

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
Changes in v3:
- Avoid multiple assignment
- Link to v2: https://lore.kernel.org/r/20240304-i2c_exynos5-v2-1-7b9c312be719@axis.com

Changes in v2:
- Use dev_err_probe() instead of open coding it
- Dropped the return failure if we can't find a match in devicetree
- Link to v1: https://lore.kernel.org/r/20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com
---
 drivers/i2c/busses/i2c-exynos5.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 385ef9d9e4d4..8458e22313a7 100644
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
@@ -940,6 +926,21 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	clk_disable(i2c->clk);
 	clk_disable(i2c->pclk);
 
+	/* Clear pending interrupts from u-boot or misc causes */
+	exynos5_i2c_clr_pend_irq(i2c);
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto err_clk;
+	i2c->irq = ret;
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


