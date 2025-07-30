Return-Path: <linux-i2c+bounces-12085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F51B16059
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 14:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03C027AB27F
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 12:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314CC290BB0;
	Wed, 30 Jul 2025 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FKGy8NSP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74997279DAD;
	Wed, 30 Jul 2025 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753878557; cv=fail; b=HaD2CTfRReZZq9Q9pQ2/R/04HTm07sEL+7s5dJt3qapD/0BQ4NBdvrkMLQCy3MT61dSiHABaLlc4zqfbCW5RqT+xL8LcE+ev84MhlGAuRVpVKeMnwbUri0cEKXriAG8eL37pVKGqfs0IHL3mNCt9zNBaTI3GO1u8Ns7ZrLXok7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753878557; c=relaxed/simple;
	bh=qMnX9LetWPcP97v/I24zgn8cVT2nRykErTUmqLdOsvg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BO/47ow4Gq1v4UWEY9ubmfZYrJ6HpvNuAii30C4XpQQSyIekKdovHwmVGolA4krPypR+vLF+ApFDosVgozqExDtbo+yzRSRyIs3nua5Zeq+b6YZejq8lPipq235z8mqtb9GyH+yZraSQphk5jm0F/73sBtJNI733XBJFcmxmaCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FKGy8NSP; arc=fail smtp.client-ip=40.107.244.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGPyYy1UXxqaZi+2oYGiIbg1dSfOm+Dtjs4ULKknOP0cbGHumQNAkgIrKBKAbNiI5uPPW0gnDVK8jSqUbWyrDQSWc3tIUu6n1zem5Ll7wzABeE0u5dSWWgBO4ZaM/NvKH+hwz1VW6MPbzxfVG/LXW8Y0O9zOViY4N09rGjHQA/B2yJH3WRky4ikUvBGbK0CQxc331r9Y0EVIWBZoNrKPvy33rKlES9GEwsqb1c2lYRu9lbwm5WqZT/a0xiy5cfg6mnS9Ky9nYj/19aKyZKRseV/gbftMhB5/7hZF8fFOlWwyi/WAWU6WH6k+12KeFKvhgftJdqDyYdjK7U9lgUVHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvHTMI69oohv6hnXiu7R54jhYD+uZNp4wXPDIFnIgAo=;
 b=Pu1Sp7IiqkIUczH0WVIa0R0VrYHhC7lRr2syZjWR8IbIqcRCRcjLsHbuvbhkQXpr8ze1bvPQEHFam6gjajDiDTzfVWn149i5U0eOPl35Erxaff6JOyifit6Vjw/HMEe9kvmjqJ+8jG8xSj1ddItxollY8SODlPfCzWEewXUGyX1aRGo7B7XD0j2d7UaqaSigWOyYivgVQYx/YzNNZiFKxiRnuf0XN/Nbms1CoTAjeV9RvsxQ0bhQ3V//QPFel+alBhKC4uPDRPEjmdS2Y+tThvSNY5rByLg4Uld3EYBgcp0KMtUI7/E81JmVZ3/nw8ncY4vODGUu6k358pcVhEqY0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvHTMI69oohv6hnXiu7R54jhYD+uZNp4wXPDIFnIgAo=;
 b=FKGy8NSP/PRah8mjkAeAVxGW9JC3tI6PtEePiqkt4/ghcHxLO+TOuMCdQmHKGdtOgS1jM8mYLx4N0PwtjIXfw0rr0vrjjD/EtlZ78KlhFaIVQVe95/EpL4bUpEpqV91vsNCEGbWMDkmxgfcQDWmg88zqiy5LlfHOFHVfaRVpSLA=
Received: from BN9P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::35)
 by LV2PR12MB5991.namprd12.prod.outlook.com (2603:10b6:408:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 12:29:14 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:408:10b:cafe::5a) by BN9P223CA0030.outlook.office365.com
 (2603:10b6:408:10b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Wed,
 30 Jul 2025 12:29:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 12:29:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 07:29:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 07:29:12 -0500
Received: from xhdharinik40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Jul 2025 07:29:10 -0500
From: Ajay Neeli <ajay.neeli@amd.com>
To: <git@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <srinivas.goud@amd.com>,
	<radhey.shyam.pandey@amd.com>, Ajay Neeli <ajay.neeli@amd.com>
Subject: [PATCH v3] i2c: cadence: Add shutdown handler
Date: Wed, 30 Jul 2025 17:59:07 +0530
Message-ID: <20250730122907.18909-1-ajay.neeli@amd.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ajay.neeli@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|LV2PR12MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: ee93891d-b984-403a-ec71-08ddcf64b1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t/XcRD8b9DvE54bZZnl/29AHNQUVNSAQJqtTv96PpSpL/UjHhkZIrxSTcow8?=
 =?us-ascii?Q?mnSUUh1jt+WNFIaNN8fPzMN7l9+KrZYHz4EnPcuNqWvE1pYz6wuifnLTBagj?=
 =?us-ascii?Q?BalF4MPnuu/Y3gn2eK++SD7WEx4On3kO1o7ob7LKo/YjiL4IbVxO7niIguMU?=
 =?us-ascii?Q?rknekj8nG/Xa/URSUqROtuoxagqwHlG40uSbhM0RQQO96Uot68J5nBo1OpZL?=
 =?us-ascii?Q?yZny0m2t1PzI92xQDhlCwLnq3MWqoGxGtDzRsOaKECQds3QzzxfAQYXDu7IX?=
 =?us-ascii?Q?saxRhQ/wN2BW2Ak2fngkEMtaXjmTTx5kh2ReHyXxSoEd/afQaZ4jHFHj96rJ?=
 =?us-ascii?Q?kogAmbMd7r88Xvi2KCw3DuZES2PAAi9S34MPtxdDApNzKPRZfleHa7UZCdDV?=
 =?us-ascii?Q?yFoOKHBrhfzlMVXPXSaFQ1ULnV++nspaD3MYXHdhuKGcDQkIeBg5drFUtSON?=
 =?us-ascii?Q?eD7d2xqepylxJGX4npRKUtOGAPucecCSkRBq8Ry7A8Do8rF5FqAGJQv+fLwT?=
 =?us-ascii?Q?RQ4gztYZFPwKlufz1Cf3fcEoJ4VHxXmzuQOgPRlIbhPMV36s9jxTsJn5pbd3?=
 =?us-ascii?Q?8WGFe0SvAQrBJh0NXAeFdAjz2BDXRqJH1YHCTfCu3S0ikkiAdoBS+5tJoUEZ?=
 =?us-ascii?Q?K7+QH/pTkJdDYo0izszPX/ZMdZ4Lc/LR/96VBrhRSyqqFV6bAhZpvtGJVtXz?=
 =?us-ascii?Q?rEtlAMux2iXnUQxlGb1OSE/5QTM81yIZRQ7qphl8BRQUw6OXiqLfPWjkU4iM?=
 =?us-ascii?Q?Y74z0GWfK0ji8zN4s3nEtC3ZF2HCiLyo5tjd3h6ouot2WavlOAuj+AI374IY?=
 =?us-ascii?Q?XYBn0Yv4pNLk/X72cVoxdksnVLZayk0fCIKZZq7H/MFMHBMdd2JezdLeRzR4?=
 =?us-ascii?Q?Np/kBSK8FKP9AnETrQXBVP63L3azM6aXm66IHPw68VBrGUuNDDCDgQNzPDXZ?=
 =?us-ascii?Q?FH82K3X2Sv6zqwnohGCbYS+ZZRL/3whBRxYp2kFvKGgY6Cn1u28nYd9xWRRc?=
 =?us-ascii?Q?GTG3Rq9H+tHNUb5h2n4Lg4iw51NU0djK6uDVSbqmSjNtxrpdu4QDYD442bFJ?=
 =?us-ascii?Q?/DHhu81i6vsZu1cPyBVjwp/4WUtxke/5VTQZ8M6NCh24rLkpF8ye0mWaPIgY?=
 =?us-ascii?Q?1cqGN1nQ6MoA+mLXNtwByIl5L9bQN6y3CdeYSUCxSnD2CFqhiNKraogQbhmD?=
 =?us-ascii?Q?VpqTnjHgrwKRhfnMEFgScwviK0k0yuo3kk4bXQRlurnLOzrwy6CwXzIRYJwU?=
 =?us-ascii?Q?BDt93rubFJZQ9m1LnNovaRKXLBf5ydgYGEEy7waeV9D75iz9LWIjLwiMhkdH?=
 =?us-ascii?Q?jr/ULMSkxgCQmy88yvvdBIqcdbdt+qd3t4z8cJsAElJ7FRd7IhwcVxHzuzi1?=
 =?us-ascii?Q?YlBZoSrszZnyIPHmoFtzQEtBV9j0x4ptz6dYt5yToNQbxvF4CP69f8pvJMeg?=
 =?us-ascii?Q?q5QINvfeMY1kmgi/MNvTjNx73kaFAfv7ZjCCakFxlwDT7f277JEuJk1spMVy?=
 =?us-ascii?Q?ckMhFyWaJ1xkcXpwev9+s3uKQNHZV3W5z2+/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 12:29:14.2593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee93891d-b984-403a-ec71-08ddcf64b1ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5991

Implement shutdown function for Cadence I2C driver to suspend the bus
during system "reboot" or "shutdown".

Interrupts are disabled in the handler to avoid spurious events when the
driver is in slave mode.

Signed-off-by: Ajay Neeli <ajay.neeli@amd.com>
---
Changes v2->v3:
Corrected a typo that caused a build error in v2

Changes in v1->v2:
Disable interrupts
---
 drivers/i2c/busses/i2c-cadence.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 8df63aa..4f033a6 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -192,6 +192,7 @@ enum cdns_i2c_slave_state {
  * @transfer_size:	The maximum number of bytes in one transfer
  * @atomic:		Mode of transfer
  * @err_status_atomic:	Error status in atomic mode
+ * @irq:		IRQ Number
  */
 struct cdns_i2c {
 	struct device		*dev;
@@ -224,6 +225,7 @@ struct cdns_i2c {
 	unsigned int transfer_size;
 	bool atomic;
 	int err_status_atomic;
+	int irq;
 };
 
 struct cdns_platform_data {
@@ -1495,7 +1497,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 {
 	struct resource *r_mem;
 	struct cdns_i2c *id;
-	int ret, irq;
+	int ret;
 	const struct of_device_id *match;
 
 	id = devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
@@ -1526,9 +1528,9 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(id->membase))
 		return PTR_ERR(id->membase);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	id->irq = platform_get_irq(pdev, 0);
+	if (id->irq < 0)
+		return id->irq;
 
 	id->adap.owner = THIS_MODULE;
 	id->adap.dev.of_node = pdev->dev.of_node;
@@ -1590,10 +1592,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		goto err_clk_notifier_unregister;
 	}
 
-	ret = devm_request_irq(&pdev->dev, irq, cdns_i2c_isr, 0,
+	ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
 				 DRIVER_NAME, id);
 	if (ret) {
-		dev_err(&pdev->dev, "cannot get irq %d\n", irq);
+		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
 		goto err_clk_notifier_unregister;
 	}
 	cdns_i2c_init(id);
@@ -1603,7 +1605,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		goto err_clk_notifier_unregister;
 
 	dev_info(&pdev->dev, "%u kHz mmio %08lx irq %d\n",
-		 id->i2c_clk / 1000, (unsigned long)r_mem->start, irq);
+		 id->i2c_clk / 1000, (unsigned long)r_mem->start, id->irq);
 
 	return 0;
 
@@ -1636,6 +1638,23 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 	reset_control_assert(id->reset);
 }
 
+/**
+ * cdns_i2c_shutdown - Shutdown the i2c device
+ * @pdev:	Handle to the platform device structure
+ *
+ * This function handles shutdown sequence
+ */
+static void cdns_i2c_shutdown(struct platform_device *pdev)
+{
+	struct cdns_i2c *id = platform_get_drvdata(pdev);
+
+	/* Disable interrupts */
+	disable_irq(id->irq);
+
+	/* Initiate failure of client i2c transfers */
+	i2c_mark_adapter_suspended(&id->adap);
+}
+
 static struct platform_driver cdns_i2c_drv = {
 	.driver = {
 		.name  = DRIVER_NAME,
@@ -1644,6 +1663,7 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 	},
 	.probe  = cdns_i2c_probe,
 	.remove = cdns_i2c_remove,
+	.shutdown = cdns_i2c_shutdown,
 };
 
 module_platform_driver(cdns_i2c_drv);
-- 
1.8.3.1


