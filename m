Return-Path: <linux-i2c+bounces-12023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C010B0FFD5
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 07:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE5C1CC7C59
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 05:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8808720297B;
	Thu, 24 Jul 2025 05:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TlxDxHyL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6061225D6;
	Thu, 24 Jul 2025 05:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753334057; cv=fail; b=UMYw7kFR/gfo+sbfsUcj2xy1KHbojBJyugsvCtB6+imXKOQCWrUaYuy9pLPrXYAk92b2i00adxm9IMA9Qkj2OMe08G37Axsglje9Zdu2JBQLlPcohlIyx8NIYsiA4iO9Z5pEdsNYwm0vyZwF8+ZBAT0uk9+2HgJASfxQJhfX2nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753334057; c=relaxed/simple;
	bh=oqtdbfnb2MiipJVgC0bDZXpZ8MESyIRdpmB/iFupNRE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tuaCEhUfjhOh6usldp082Na7YyW1SnY60lPITRfXTdwjDuFqO0bK4aADS2RYjqgQAq1rZbS2VGk2CI/dcuNy/K1LmQUJvoK+jIK/Xs7jc/4Klp33/2W82e48qPIKlJRdSk4/z/bBWmfl0q8IBj5CnAyCN7UzjOp5o3VSUSg7Tt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TlxDxHyL; arc=fail smtp.client-ip=40.107.94.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwBkiiXllmWk1XHvJKeHQy4HBWozfpL0I3ZyOFcH8OlC0LC7lV0477VxUDwnTi6jiuJqq6J7Ezp55n4bIAePGvWPoBqQOOwgkYjME/4gSsdJiY2yij5fSgtmcK1tKLCFOuBcqrKRNe3T4e0CyQG9HzxoNgsxMXyICC3rhHKWS+8BvU9fYf+JhzTGlKrRaP9vuPyeRLcJSRavzDKgIxPR15UIgA2bILnbRzrzi88ee2zqq/4e4mKyGl51vB1jAPn5r+mt7R3zGCqy1rxWLtI6iO4q0VeMC53/8NR4ZgUgFA1MHuF0syQp1fnhlc3Q3J7BsZ7QsoluJ+KTBh/YWKoF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKs0Lht37tDkgh1CwlEgyh+w4IjGVI5XfasdtSsIgt0=;
 b=yyamMlTfWfBcRZTSXysFdVEvn3bekNR0C0CctUWZRgF6l/EKqCdycS9Qol+CiRByi89LLY7rjcIcG/sHsCOgNj2rfuswX5PXi6JxMNHwE2Q7kjiJUWlGv6adGi054P5EfLaObGCvQ4hNniafTeLPhZC0s3KgI9P7iLQmXd4WhLgaoYkhIAciE98gBxsJYLoN1/bp4joYlcNwp3CL7NUe29fexkAhfHkFGjZ311PYFXHBLeU8+LOKZnSWcrcjkKrvxJ2ZQtlUYIz98MR7vaOgN/1hDgmRcl3rjoeBpTWJHgz1vJ7uW1vcWzf2DivGvw82VvstNDXen6/O0osC9vG6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKs0Lht37tDkgh1CwlEgyh+w4IjGVI5XfasdtSsIgt0=;
 b=TlxDxHyL+XiwFcZV1oioOTwmVrUhESF3dlYh5AKWHGsQ+/L35Ly1ID+jaRqjnBC7m4MdnAoPZ+A94nymM8hlB4rGbYFV/6KTFDHRbgnXY/QLTpY5wu7GDFPGMDdXhDZXeLiiZDM236cdT4gBpvcrgc9/WYeEXsACdG60mg/UvGE=
Received: from SJ0PR05CA0025.namprd05.prod.outlook.com (2603:10b6:a03:33b::30)
 by CY8PR12MB7657.namprd12.prod.outlook.com (2603:10b6:930:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 05:14:10 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::70) by SJ0PR05CA0025.outlook.office365.com
 (2603:10b6:a03:33b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.5 via Frontend Transport; Thu,
 24 Jul 2025 05:14:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:14:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:14:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:14:05 -0500
Received: from xhdharinik40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 00:14:03 -0500
From: Ajay Neeli <ajay.neeli@amd.com>
To: <git@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <srinivas.goud@amd.com>,
	<radhey.shyam.pandey@amd.com>, Ajay Neeli <ajay.neeli@amd.com>
Subject: [PATCH v2] i2c: cadence: Add shutdown handler
Date: Thu, 24 Jul 2025 10:42:43 +0530
Message-ID: <20250724051243.22051-1-ajay.neeli@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|CY8PR12MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 89cd68bc-56b9-4552-a4c9-08ddca70ec3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oqr4wcQ0JbDfhAfFC4OpPDaPZynVW1jODlFctNeRi9/yowo6QOoFtaIonIuu?=
 =?us-ascii?Q?y2XUGOiA+JHUi+DO5Wl87trKTm6xj5EHeXHDDy9tll9McOP1OXW7pQIIHGNq?=
 =?us-ascii?Q?ZQ41Wh4YVljyXXN1OsEQPi2l5iO6hm6iQErHGdspjxxNKDuRyjga34kMLi6N?=
 =?us-ascii?Q?s2oy633wfrLQz19TLyC+8WNlo55ByeW2gsWl1o3CXBbFEle3CPomd5OTrm98?=
 =?us-ascii?Q?4jtRuzum3uNRsmk3TV78mh3qg/NTsp5tdfUm9JxkQ0lW8CVh/TLH3YTd4UwT?=
 =?us-ascii?Q?BWUW14MY6gBzZ9hgBvQNr8DiZ3AmUrsYdna8Ovb7T5/XJqWJ4rIaBkiZJ4cB?=
 =?us-ascii?Q?4O9FN2Gt2jWDey448HS/ydhnZp/78kmh8TrN/KfrfUIxUvhgA2cNtpV3Zyk9?=
 =?us-ascii?Q?9v4ib0MZIHd/OwgKjbhRm6SCAmjfYBi9oLo91w9Es45sUVw+RYx837Mcqbz9?=
 =?us-ascii?Q?eBMD+M6Mr+IXzyJwFLttVrLEnvLaxzJDK86EcJuzYxVaIrIw7TiVPJc+bGGL?=
 =?us-ascii?Q?Pt4H4ioUHbmue5cWgUym6rpkfTMxb0ZX6bmvR6LUIb+AL/g/UVLhyrqQwrq6?=
 =?us-ascii?Q?Geh7ECmXnyVSC9U0d0FKRatwceC5ohsUMxGA9w86virIr4uz55GHE4FtaHlN?=
 =?us-ascii?Q?RLzLrl7VGDOYNXeKhrmh8NV4/Mypb7iWnMiYkmIgJuGiHG3JR1ZqfeZ94OlF?=
 =?us-ascii?Q?AOnBwx7rKxolumLpNt/st2yALbIqt3Gho8ywt80YE7AjWhQUR/PDBrFosQBu?=
 =?us-ascii?Q?2sXpvFlB35JoLK9JgXk1WiVEWmUvpYOr5/gSXCPwPTO/T2XqE+v5RDIwDyqD?=
 =?us-ascii?Q?CI8thUb6bq50r3L9htb1JdKyD/49amsD27DFiBfclhioQLUpwt8Zb4UsHJ2q?=
 =?us-ascii?Q?2xs8oGUk7J8PX8yr5OSgKyVV3HDL9sRHm8prQfvSfYeGwCY9cGVpD1ePUD3L?=
 =?us-ascii?Q?uSF/CUCr6VcXtolBfpUqRmEMTwpX3CyWbG/LZC03N286Ia1qnJusPcqxjlf4?=
 =?us-ascii?Q?36EkLdi/f5N4RDjd4AHvlozhGnfMZ4hP+SwUXn5yEtAMBw1tBHd8uPaSrXyh?=
 =?us-ascii?Q?LNR0LSBWWb/NWXlnUdMM6BAxxop8LzXeyLYZZ82HxVL9RzOjQIQ2BlygYXqT?=
 =?us-ascii?Q?s4iI2RQMD/+VDACDaegfXKflRQFXOLdmgAwN1Gi8ZSx9OOrvRlsGbl36hivw?=
 =?us-ascii?Q?VPgUxzWbIablVITlKCtxhx5sJZICdu1EeXoaQhPxcuODt38FMLLb5GYfufbG?=
 =?us-ascii?Q?xyBftiguojDQJTm7EAuqwM6mpJughpZ//yaQIiKnVw5kCe8i/vTSXhqWkpMt?=
 =?us-ascii?Q?c0Ydzhn9go3pl2Jtqnt0qJ22BJ9agVYt799UckmGQOKJ88mEevWjThI8shps?=
 =?us-ascii?Q?8y/wttFnPRAobdD145mLZA6jvY+qdsZd6MewL/GDAqduSBVVLw/+qvJsPnGZ?=
 =?us-ascii?Q?xOwqSHzNxwg93lii4Ozj4L20YJiOoYXSRPKdOQCz6V/4CYb6ImiLxBOe8O+N?=
 =?us-ascii?Q?N7ML8VExuc3p/mBT7Z7US1IonEswCjzR/0MY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:14:10.3604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cd68bc-56b9-4552-a4c9-08ddca70ec3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7657

Implement shutdown function for Cadence I2C driver to suspend the bus
during system "reboot" or "shutdown".

Interrupts are disabled in the handler to avoid spurious events when the
driver is in slave mode.

Signed-off-by: Ajay Neeli <ajay.neeli@amd.com>
---
Changes in V2:
Disable interrupts
---
 drivers/i2c/busses/i2c-cadence.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 8df63aa..e0a56df 100644
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


