Return-Path: <linux-i2c+bounces-14089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A37C5FFE8
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 05:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E512135F22E
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 04:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B6711CBA;
	Sat, 15 Nov 2025 04:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qEWQbJZg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013040.outbound.protection.outlook.com [40.93.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B811DE2D7;
	Sat, 15 Nov 2025 04:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763180884; cv=fail; b=AvYGlCi+/0d/zNuQVyHpFHXmfr0jD7DNKFabR4Bqpr+p1mtm22Yq2zaDlOQxUDaYKJwTAlR2i4a5D0b/U5pWby8vGQ6DPZtalpfVFv4Cid0ceYZN8bObUKW/GDO4Dxtv2O35b8fWOOFg0BiDa8m0dlEe4abhJ4+ieCEylBQpARY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763180884; c=relaxed/simple;
	bh=6mwtlTky/LpCmsM7LQwWW8uR1J4uIB7azMFxU+0QBys=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KHW5uesdT6AecQjjG80yd1gwz8JAVR0H9BplqMmqSMJjb2q2e31nIX/cRrTP6a+rcx3T3jvZUbB7rZ3prDVVUuAYfr30czZTKP2Lzrrntes+LYSiht5aoiOtVUBRePBy2iYxAe5EWi/VkNjUBtwZHq81lCYR0CO0UmDiOr++S5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qEWQbJZg; arc=fail smtp.client-ip=40.93.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IA/DjAYDfx4dBiouTu0xj1zdpzs8ahsnm2YrqXg+1POZMGOPAr2VTIwq9r2ZUT+PCoxMAIRNrcNpl4nRNBX1mXX9LKCTxTddam4EbPy/4JMX1agOUWbkkP/iixnjvgkzRXJtitAkd9tyix8oW+OLB29wFRNp/rstEWPL5iEHxQDs97qQh/iAmuz5tNemXhdp+sUt4AF2eIsOU1L2BRadM2YtfQZ43/etakxMxW4k4KEz5G6fytr4rY8tPHWTIIVKERu9qsNMQZ0WUUX8VxmOVk9juVF/HmbNosxbNZoMyi3W7pEH+h6v7i8DEMq6GcL1Sal/E2Myu47BHI4KPbgfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIJVQ1/NY46/lQQS7/fF4DOQgT37shkpRiSWN6SJ9FY=;
 b=jURvkVZARzde9awWnUDgUoNaa/HgqOuzXcuGqr1h/x/i1iFMS3hWFixw5X0Jf2b1IMSkMFw5jHbl/m/r5RYuYAEJKtXZ1Dou2ob2kw9+lS3ZFwMpTMJl4d0aCUIEgnSc7ruoIlAmVkdlYEtBKuGYJxfFal9/BxYCzU6MLAcKzdh/covOWbgBieZbW0Q5V5DSGzE/CyU9EEOHrIgudaUO7UE0MadhwQSDTxLVxy2V97hA5IWx4mVlODoMXwnMGH9sfxWoA/0/bCOvyN1H1MvXY1uWRLvMiDewfYPbWjx/UUEPIJnNj8yrfmGQ8Bw37Akt1+zHgEcuOwsVaH4ARzQGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIJVQ1/NY46/lQQS7/fF4DOQgT37shkpRiSWN6SJ9FY=;
 b=qEWQbJZgjp5PXJkODaHCKCHGEbBLv4QK2JqlPViQtHM1agzSypJm/JJ9z1QSeKIMJR6EIMKnuBlkoi747tY7CYqqyL5Dls0h05BOdAbeTwXrrSDVJQpAlrtkaiXBm7jtznM4GchRFA4MB8mTYLgZxjAx83FdH82CZDOKcekbMZhigw6Q1caSGulL04eMDN4OHfcnMafOaGR8OeJz+XCEVSL/1koHBp6uzj2B4wDeicCnP8sCijAw+aAH6k6AtACrkrD6pGcEGXiQzy5eDJvyBW8egUjS7uCBzgbHgz7MhjyH9+PabPCvUQGloHb1ifm9SdIj0CfNpPQrsG/K6iyxkA==
Received: from MN0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:208:530::30)
 by LV8PR12MB9642.namprd12.prod.outlook.com (2603:10b6:408:295::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 04:27:54 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::96) by MN0PR02CA0027.outlook.office365.com
 (2603:10b6:208:530::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 04:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 04:27:54 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:27:42 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:27:41 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 20:27:38 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v12 2/6] i2c: tegra: Use separate variables for fast and fastplus
Date: Sat, 15 Nov 2025 09:56:28 +0530
Message-ID: <20251115042632.69708-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251115042632.69708-1-akhilrajeev@nvidia.com>
References: <20251115042632.69708-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|LV8PR12MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 68fec197-464b-4976-1b65-08de23ff58c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K8E6CGQer7a0mMrqbMYjTniETLcccsuS9BDD+Q7NECZOwN5JfYhq4gslng/c?=
 =?us-ascii?Q?Dg88sUbrTieOFhjfbJKSducXU3xnq1Li5qSHo2IoAbZ/t/Gpn+l1Ja/GmbNJ?=
 =?us-ascii?Q?W9iS6oaUX4U0HqEzkzvZnu1cPW4+6lTJt9jPmhrou65GGNQO9gJi9wSFcAGV?=
 =?us-ascii?Q?fr6Y+iqPoJmS4RrZ+nQtRceROXfJfo0oXBhOTfdgId36UlWuCYHfmqyBHRNI?=
 =?us-ascii?Q?L6tBubhWxwNlCukQUKPfj5aP8flvSFDCdRsDT7C86r1WHPtvG5XYYjY5wV2I?=
 =?us-ascii?Q?sT2YNIZQegyIzxbYlRB0b/670yEXtMMa7BqWoQWCLUYrXcb8jw5e0RUzGSTM?=
 =?us-ascii?Q?N8GN6hTJ5ClkCezweMX6bghYAXeNtLr1yLEyJKua7/9t6oN7aVdRYCaVUGwV?=
 =?us-ascii?Q?1trW0UqKA2OgmHeOABL8XDiDn1QO4XDvZnYueuL+e3F+JVxJ6wdTP3nyNRGW?=
 =?us-ascii?Q?iN/LYAtNcHFLSoSg44dcrgvXgPZx7Bma6K+aZCuzy/Xti5ke3DooziME4Aor?=
 =?us-ascii?Q?qVFz0ls0UTMGk3Xj4RsxNp50FZiHgVPEpxSemAlGTCjdwD30/S68t1RZtDDA?=
 =?us-ascii?Q?dDCyNyKvwny9QdPFoQn/SBtvwGaMhckJBIzyxRhKBz8V4PZNTegLgwAGKr4+?=
 =?us-ascii?Q?gs724S+6B5KN/6INe2BRWFBU+rSCu0sywkcQtvn5IP/64shIsU6ij/P7PCuy?=
 =?us-ascii?Q?swuXa3nyvMXhXN+DGsgz/lPOAJJlgrpu1p6CVdo7NcpZCteauZDcYP2+2bcU?=
 =?us-ascii?Q?4jIJMcILgHd/cg0D3SZkyLFN2tk8dDihX9Zd9swWkJ/E2CVNHH81NctnVrBG?=
 =?us-ascii?Q?/jfynRJewjRTcpCMxlMwEqwBKgviOK3BB5XUazWYh4QB2PinrGcewyxHociD?=
 =?us-ascii?Q?Q0EsO8YCBC/rlzLwst5frzMBdNkDrZ8/Fcvg6AKGPo4P21Q2VEiARlN/M1XZ?=
 =?us-ascii?Q?H0m7mVeXZ8pfUSV8Ki8I74a4F5p57/HKZU/Bse+e/q8EwwEjoUcByxA4nT8k?=
 =?us-ascii?Q?3mbXOEl3WCJa5GVSiEVMZyjTQSXhzeB7mAbRHxcr0tKtAcZon8pa8KxhYB8M?=
 =?us-ascii?Q?+N1NQ6CzadcdI0Uw0YaVNTIt3nlcPruv8T9mEP+mcENmrmtqPDrqhz+SyLDL?=
 =?us-ascii?Q?wbo5yx12/rD4JM9fZtNsSeQamudT1gNWtQFgiVD2m141T5d/fo+f7Z0D0c6+?=
 =?us-ascii?Q?rqnJLxdOSHJU51H9FZ5v6XcCiDTcbt4OMXD/yfKuVNAkBIDUNJNCwVPOXxV4?=
 =?us-ascii?Q?7C3PB6MZECZqGGGDdAbZWw86Cc51NKPWdHHm6nD1FEX6QdDHNMYoblRnD/wo?=
 =?us-ascii?Q?Mg4gMERZX4HSnK+Sle5BPd6bXSVfg46gD3YuOdKT5F1X3M7zqE6bwti8utyS?=
 =?us-ascii?Q?ExVAeVGWhjcjkTs+l6BBQw4JPzgyGKBAJpH6UR7sgKAvluLYyBwLAiLA1J7Q?=
 =?us-ascii?Q?QH5vUytwFy3+ox1zcKcgsHihDDza45kk6W8wgXZHccbVMjr77wNa1+3j9Jwd?=
 =?us-ascii?Q?LYtXuRrqzgIT2g2bTmowTmi85nYAwJaksSFv3wURkh0CkCIF6uNjtX8p8QY+?=
 =?us-ascii?Q?NKIYooi4gmW0Hsox3SE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 04:27:54.4076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fec197-464b-4976-1b65-08de23ff58c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9642

The current implementation uses a single value of THIGH, TLOW and setup
hold time for both fast and fastplus. But these values can be different
for each speed mode and should be using separate variables. Split the
variables used for fast and fast plus mode.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 119 ++++++++++++++++++++-------------
 1 file changed, 73 insertions(+), 46 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bd26b232ffb3..c0382c9a0430 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -196,12 +196,16 @@ enum msg_end_type {
  * @has_apb_dma: Support of APBDMA on corresponding Tegra chip.
  * @tlow_std_mode: Low period of the clock in standard mode.
  * @thigh_std_mode: High period of the clock in standard mode.
- * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
- * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
+ * @tlow_fast_mode: Low period of the clock in fast mode.
+ * @thigh_fast_mode: High period of the clock in fast mode.
+ * @tlow_fastplus_mode: Low period of the clock in fast-plus mode.
+ * @thigh_fastplus_mode: High period of the clock in fast-plus mode.
  * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
  *		in standard mode.
- * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
- *		conditions in fast/fast-plus modes.
+ * @setup_hold_time_fast_mode: Setup and hold time for start and stop
+ *		conditions in fast mode.
+ * @setup_hold_time_fastplus_mode: Setup and hold time for start and stop
+ *		conditions in fast-plus mode.
  * @setup_hold_time_hs_mode: Setup and hold time for start and stop conditions
  *		in HS mode.
  * @has_interface_timing_reg: Has interface timing register to program the tuned
@@ -224,10 +228,13 @@ struct tegra_i2c_hw_feature {
 	bool has_apb_dma;
 	u32 tlow_std_mode;
 	u32 thigh_std_mode;
-	u32 tlow_fast_fastplus_mode;
-	u32 thigh_fast_fastplus_mode;
+	u32 tlow_fast_mode;
+	u32 thigh_fast_mode;
+	u32 tlow_fastplus_mode;
+	u32 thigh_fastplus_mode;
 	u32 setup_hold_time_std_mode;
-	u32 setup_hold_time_fast_fast_plus_mode;
+	u32 setup_hold_time_fast_mode;
+	u32 setup_hold_time_fastplus_mode;
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
 };
@@ -677,25 +684,21 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
-	switch (t->bus_freq_hz) {
-	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
-	default:
-		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
-		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
-		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
-
-		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
-			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
-		else
-			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
-		break;
-
-	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
+	if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
 		tlow = i2c_dev->hw->tlow_std_mode;
 		thigh = i2c_dev->hw->thigh_std_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
 		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
-		break;
+	} else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
+		tlow = i2c_dev->hw->tlow_fast_mode;
+		thigh = i2c_dev->hw->thigh_fast_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
+		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
+	} else {
+		tlow = i2c_dev->hw->tlow_fastplus_mode;
+		thigh = i2c_dev->hw->thigh_fastplus_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_fastplus_mode;
+		non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
 	}
 
 	/* make sure clock divisor programmed correctly */
@@ -1496,10 +1499,13 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0x0,
-	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 };
@@ -1521,10 +1527,13 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0x0,
-	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 };
@@ -1546,10 +1555,13 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0x0,
-	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 };
@@ -1571,10 +1583,13 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0x0,
-	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
 };
@@ -1596,10 +1611,13 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0,
-	.setup_hold_time_fast_fast_plus_mode = 0,
+	.setup_hold_time_fast_mode = 0,
+	.setup_hold_time_fastplus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 };
@@ -1621,10 +1639,13 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x3,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0,
-	.setup_hold_time_fast_fast_plus_mode = 0,
+	.setup_hold_time_fast_mode = 0,
+	.setup_hold_time_fastplus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 };
@@ -1646,10 +1667,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
-	.tlow_fast_fastplus_mode = 0x2,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x2,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x2,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0x08080808,
-	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
+	.setup_hold_time_fast_mode = 0x02020202,
+	.setup_hold_time_fastplus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 };
@@ -1671,10 +1695,13 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
-	.tlow_fast_fastplus_mode = 0x3,
-	.thigh_fast_fastplus_mode = 0x3,
+	.tlow_fast_mode = 0x3,
+	.thigh_fast_mode = 0x3,
+	.tlow_fastplus_mode = 0x3,
+	.thigh_fastplus_mode = 0x3,
 	.setup_hold_time_std_mode = 0x08080808,
-	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
+	.setup_hold_time_fast_mode = 0x02020202,
+	.setup_hold_time_fastplus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 };
-- 
2.50.1


