Return-Path: <linux-i2c+bounces-14975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D759CFE49C
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 15:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A890030161CA
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 14:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D4434CFCC;
	Wed,  7 Jan 2026 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RNmXscU8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010059.outbound.protection.outlook.com [52.101.193.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50CE34CFBE;
	Wed,  7 Jan 2026 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796047; cv=fail; b=uGtXI6HUygbYk35eCO+yODHzTBViPxuVjVYWBc9wDxdOU/bQZk8p+ENzevu1Vlr2cWWiXpkU2oNiV8kUunsQjKN8uofpBh+2j/W/0N5G4Sy0P0Hdf59MUOAN1/mvmXPbWBC1c2NMb/UZlAUBr1Df1FJW2ZCVYxXbiD2yutuw+SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796047; c=relaxed/simple;
	bh=kV7d2X5pXkyhYP8Xy9+fvDZvADM4WqCV1b3c1j+nzrc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIheGi3yXmMGy07qJfEkXmNKRD6UyMY5gi2/+oPY0LAK2q+ZQ9fK23h+0rJn/6ntmnrJ37ChzpxPIhj0dvMfa4qMwrkhr6NsDpDUnn7jkBQ6LrXmMG8lOCQSqfIfsV/45nGapFZcbBZlM59yjSL8uP16CFzcn0rZCiy02EPvUc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RNmXscU8; arc=fail smtp.client-ip=52.101.193.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ll91L6BssaOYErx5nxeJWtRte8rtRFvLi1PJVUzJe4Xd6Tjr8DxqEI8H9Lo6kcaOxkr3LiFDAsfIBzKIFNdjAkIWsHXBLw4n8XzsSiMQV2YBXX1TEHPMuAfUY6wtjCoImuiUnxoq3DP4qU276gtvzYjZaG9nugr7K/bvEE5vfZnHBswocc62XB9RoHSofl53pLPFcJ+SbEU76rUQsEB+WI41SdXGEOUu1RCkMuFfOAj3trs+iQraPxAxgerYbW2ikP7N6O++XUXfaaVmx5uIoZ2uTc0DgTdtYV+BgS8h6zbpmfSCbhgLC7P+YVNED1eCD7gswg9yIBBaAddksBcqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuGzSKV2QpW8honuj1viVJJWClZAIk68F23b+f5ho0w=;
 b=HfjAPiuxeYWA+YybriANGqPigd4GJ5vb0ka4MjikRwqRDliPv+2Eu083S3t/QeCTC+Nuf+gzPyEIW/oOalb2xVXzjGFM1Zkk2AEioUZiYDgwRkMkTGDFC+6qQv6WJWf1JU30a4kyrrtCWI0tckccaff+sBiLYQUagv59kYxfBLLC/ee84YNV6+pyXEolO306gFnD8dkjFoKhBKcVrAxnMeqXFoOBHivl0eIzQDaQsZAX44knrP6ssGtzOugGQaBSsugVQ0dJEQCod+zY787+8yRyEIfEhdjTzSQGWZi4m2Mz9mwkX8dbBgV54omhjnK4kwoZBwtWZMrvtRJxPsCRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuGzSKV2QpW8honuj1viVJJWClZAIk68F23b+f5ho0w=;
 b=RNmXscU8kydd9j+EiKmKv38hD0+ykZBNvnRjA62ro1RBDw9CjIke23OIhT5f52XzTYrNRiZ0QCQ5OHiNGVym9QZPiNhgKe0nj87dSLv4n9kamvy4aZldy75MxLe58xChaEZA+WOeLAvGt+FnL/qQWQ6ciEyeyygr4cGPzViV1l275/Dz+nbRwzEg4DQs79Xbzqijsnp8wj/yurEH1yAf9/ktNf+ROxS66QOJbYcVrTzX/lRgdT5SGJCAQZeCh1zwAF/Sm2Tho7Y20Lc14jsiB16OHSa6lf6N/du99F7hGquoZbvIASKw8gUjnR4USkMwNTAMnFqdkXgOFlXJOelZkQ==
Received: from PH3PEPF000040AB.namprd05.prod.outlook.com (2603:10b6:518:1::4d)
 by DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:27:20 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2a01:111:f403:f912::1) by PH3PEPF000040AB.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Wed, 7
 Jan 2026 14:27:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 14:27:19 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:27:03 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 7 Jan 2026 06:27:03 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 06:27:00 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v5 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
Date: Wed, 7 Jan 2026 19:56:47 +0530
Message-ID: <20260107142649.14917-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107142649.14917-1-kkartik@nvidia.com>
References: <20260107142649.14917-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc24dc1-fb38-48d8-8b6a-08de4df8dd72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pYnrXFVo70ONXYZWYsbisweuVsmTyVXBLin46cGEnUlY/xTdDS7dgYgiDbW1?=
 =?us-ascii?Q?F7yDLY7HrbQBJwoiPZ4Woi/Swbka/b842b9U58OWVy8uAHMCFZlA2qguWFO1?=
 =?us-ascii?Q?lJjXk0MUJpjHARUueBNArwigq8l+04VC6qo5g8FoSGkeXtlVHW0EX/fnNbWD?=
 =?us-ascii?Q?GFb5H5ALPI2m/kEV0YUCznQjctjpI6aJrAhzvzp8MGkN8hCw0d5FLf2XKIeI?=
 =?us-ascii?Q?SNTTlCG7n7E7h4CvB5T6sTsqZ38K6OgYeOihzt18UjdIuA0dZpTeAVL+31qi?=
 =?us-ascii?Q?WfGvazHAfsRE/kQg+aXMIQ1YjWAZWk3GTVWj463/xU9TSXI+0hiLM9hGTs0k?=
 =?us-ascii?Q?SdGiZVZbRKhvB6e8UEzj/l9BxDaBRgjOh+uOHlfCiMQCON0+IJUP+MpnIrjF?=
 =?us-ascii?Q?C+JMbaqXruTyKpJ9k+DqC4MgcVRtT9UI887Ddf59PPYbmMYXXd52a35S6VMU?=
 =?us-ascii?Q?HTh8l2S58WaSSrV7eDN77Yksq8hLHva8O+q++0tv+UjPu3O3XKq/92sWAYc0?=
 =?us-ascii?Q?RnzSSd4RGkSmE9ANDa9tKUc8fCPnjvpK60zZ0CJS+xPBeX41GwhKWbYHaWkf?=
 =?us-ascii?Q?NdEtQvf7tkeZSLwo75Ax1TtSHBPYtNJQO4ThN//fRbnGJtOxI44ok7PMBDTg?=
 =?us-ascii?Q?CTBUBF1Puah5g4lQRFeYWSbTAfau4t6qRmpLc/oUhf1Jfi98qRklqoNoEABP?=
 =?us-ascii?Q?IYwvHykTLim/gbCW+fmTMt6ZbipU6H+nW1vJ0u9Xioi0/RKKpmGk4/MI8bT4?=
 =?us-ascii?Q?KvHJFug5eHxLWdLes8tA3unJRL3wW7o7PI3+AWKOpLND6NoaMaTPoRJLIyqK?=
 =?us-ascii?Q?Z2erypJeiZv9bH/Lm71A+pj/Eqq0MXX4FIvgK8CUba5F8jzKNP596tP9D+Z/?=
 =?us-ascii?Q?rAMHOz8ALspWIbHQyN26s0jFmRBt93jPAWtIuJ9LA9OyRZKzFkoRVDeimy1d?=
 =?us-ascii?Q?JicnciWY/mA0y1H4A89324Wfez36AKuFsHlfopiwlPnCSqxdOt8zbZFwl3gX?=
 =?us-ascii?Q?52fStP5pA8pShaxQshEgT0+mVb4DUF6lAbCr4NCCDp3bTWDZ9wd3m/yaGhM6?=
 =?us-ascii?Q?rkKnz5yGYEIYZGUlb45WvHoqrdJol02RQIOa+/MouIhGwUffA9HxO3hYl4Gd?=
 =?us-ascii?Q?FXTiYBruxFqmjEPUonUJzze7YUFgiQucSaDR8NLm7DWYYeSP0EUdpHnI69UB?=
 =?us-ascii?Q?xi93AMLt3x02nYdcMGahjUXLqz4nG4pUuirOi+dXQoM9bbjaO8j0oH0Tfs8q?=
 =?us-ascii?Q?JiIUceBlvIvE0g/1lZgiQ6quLU23pDOMNO+jEHFBpKOyCeE0pMZ/IoEhYZ0L?=
 =?us-ascii?Q?YPNpz9oKoaYHTVlKPDw3/ytzgAQJkPvJ+IthbOuFmDLhHr0DmyJylkiEcXCX?=
 =?us-ascii?Q?ZUXgTI+T1hoPksykMddjvL4ejXpd4olHBnOSAkcmhl3baoMvAc7ytkILUMBb?=
 =?us-ascii?Q?OmvsZ0qSO4EvfLOD36AA09wnvQgVeZvlwLrI9k5xXcUoAwTOmiP059YccgbO?=
 =?us-ascii?Q?2+Lp7ghJcemN74kfjeuOrcNs4LH4rHwgevOHiSBoaI6PbKDQxOyrbRgLwDcY?=
 =?us-ascii?Q?kfaZUD3sVExfvsQpAvSp4j+kDSZCHYc5A2GK4ows?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:27:19.5228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc24dc1-fb38-48d8-8b6a-08de4df8dd72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867

Move the variant field into tegra_i2c_hw_feature and populate it for all
SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
"nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
from tegra_i2c_parse_dt to initialize the Tegra I2C variant.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v5:
	* Updated commit message.
Changes in v4:
	* Reverted the change to remove config checks from IS_DVC and
	  IS_VI macros.
---
 drivers/i2c/busses/i2c-tegra.c | 98 ++++++++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9a09079dcc9c..cb6455fb3ee1 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -235,6 +235,7 @@ enum tegra_i2c_variant {
  *		timing settings.
  * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
  * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
+ * @variant: This represents the I2C controller variant.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -266,6 +267,7 @@ struct tegra_i2c_hw_feature {
 	bool has_interface_timing_reg;
 	bool enable_hs_mode_support;
 	bool has_mutex;
+	enum tegra_i2c_variant variant;
 };
 
 /**
@@ -281,7 +283,6 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @variant: This represents the I2C controller variant.
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -334,13 +335,12 @@ struct tegra_i2c_dev {
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
-	enum tegra_i2c_variant variant;
 };
 
 #define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
-		     (dev)->variant == TEGRA_I2C_VARIANT_DVC)
+		     (dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
 #define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
-		     (dev)->variant == TEGRA_I2C_VARIANT_VI)
+		     (dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -1649,8 +1649,42 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
+static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
+	.has_continue_xfer_support = false,
+	.has_per_pkt_xfer_complete_irq = false,
+	.clk_divisor_hs_mode = 3,
+	.clk_divisor_std_mode = 0,
+	.clk_divisor_fast_mode = 0,
+	.clk_divisor_fast_plus_mode = 0,
+	.has_config_load_reg = false,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = false,
+	.has_mst_fifo = false,
+	.has_mst_reset = false,
+	.quirks = &tegra_i2c_quirks,
+	.supports_bus_clear = false,
+	.has_apb_dma = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
+	.setup_hold_time_hs_mode = 0x0,
+	.has_interface_timing_reg = false,
+	.enable_hs_mode_support = false,
+	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DVC,
+};
+#endif
+
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = false,
@@ -1679,6 +1713,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1709,6 +1744,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1739,6 +1775,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1769,8 +1806,42 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+static const struct tegra_i2c_hw_feature tegra210_vi_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x19,
+	.clk_divisor_fast_mode = 0x19,
+	.clk_divisor_fast_plus_mode = 0x10,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = true,
+	.has_mst_fifo = false,
+	.has_mst_reset = false,
+	.quirks = &tegra_i2c_quirks,
+	.supports_bus_clear = true,
+	.has_apb_dma = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0,
+	.setup_hold_time_fast_mode = 0,
+	.setup_hold_time_fastplus_mode = 0,
+	.setup_hold_time_hs_mode = 0,
+	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = false,
+	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_VI,
+};
+#endif
+
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
@@ -1799,6 +1870,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1831,6 +1903,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
@@ -1863,6 +1936,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1895,6 +1969,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1903,7 +1978,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_vi_i2c_hw, },
 #endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
@@ -1911,7 +1986,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
-	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_dvc_i2c_hw, },
 #endif
 	{},
 };
@@ -1919,23 +1994,12 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
 static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
-	struct device_node *np = i2c_dev->dev->of_node;
 	bool multi_mode;
 
 	i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
 
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
-
-	i2c_dev->variant = TEGRA_I2C_VARIANT_DEFAULT;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->variant = TEGRA_I2C_VARIANT_DVC;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->variant = TEGRA_I2C_VARIANT_VI;
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.43.0


