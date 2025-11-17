Return-Path: <linux-i2c+bounces-14116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81CC63875
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 11:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 6C87E23F56
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA846324707;
	Mon, 17 Nov 2025 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="etOiKlJJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17AA3246F4;
	Mon, 17 Nov 2025 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763375171; cv=fail; b=Fs71N6xPXxsPtnMMAxNs9mnGzUz1x1cSKLlSAm3mav06lZjcgVj+a0uc9R5lidS+Ab1NJBqpqhmnurqroSBhWjlFvowCiosGq3rCbwG2O6syWziJj6TSg0YXoYprWspHxGDMneCHDYlpZYijTO5XLPoIxOTnVHYVym4btuaEBjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763375171; c=relaxed/simple;
	bh=bufr+5mPp9rirFqouT+jyyhf2Gm63ZvWmFSvzmtcyO4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A1mh7wwOg0Ha5I1SCP3sOpe8YET17SVbpOBC1ujSNEq5XwL7YV8030+p3bH4s7PdwdWnIEoZxwYaGDZyuk0w2Ca8T6pkVyQWlO7aum4IcTWxi2FA2XOa4vPHAyeDiyjgDlTkfPiVsFa3A/8/pF3g7XYU84/uUxuk0N9k9iNSoBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=etOiKlJJ; arc=fail smtp.client-ip=40.107.200.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRFIzzwYl6apOaPc5wWOn+0QCiqWdcRKGaK/XdH9F9dn1IiinTY62Tk8Q96wFZu5yelhM+YdJaDTEaVXVKnhWzGEqUFFogHuEqt3h9G4ZkMI6YHrSNkhjE5eYSdyWYNNV+KU/DFGOLamsFZzU7xKKHxxxbJNhc5DR8iWv++f98XMq4p9rY9edCsDS1f/xMyN6HcYV96ziUQcesY5HCzXu8EUtEnN/gRGUbvSjlf/gEeyfuaaFNi1kCkhOoX4jaKLxIIZOYeWvP+pRZA72H23MjlPM3PtyeZE/zGeP+GOXWGwtuDv+0/MUO809nSOh7uta07FdrObIi60DTLk+GaF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BY59JTRW1iDmdDh4teyP5rwC02WljMbfF117rPp+dEE=;
 b=dLiB7N+O4H1vcJ8/B3j96RTN25v2y7w5GTSDDRKrgdk+4l9Gkd4uKS2p6aYIMdFN/G94t58hAd9X59kttnCRebqjXjQUtuxsw/3SCfTO9gRdTkatORM8j3QvR0w2j8lM4aSftjcu1AQUcb74gD+n4Dgk9cKMDFQsUduaIjeoFayOf9X6DyW61T6XhzcGF2yvCwWvAnB9IiwETcm5RLYUEr5Nz/UjUwMq81Eb8kSV8oskPViHreZ7S6fREkvrJ9+Mxdxj62yVdLrDJXpRb2QFAI8BR73OKUAePdwP0RBwLB6jOBEj+slYSVjZfoUJi7UunfNbH7b0jpxbso9Q3Od7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BY59JTRW1iDmdDh4teyP5rwC02WljMbfF117rPp+dEE=;
 b=etOiKlJJhnfDlb2UYlNu20MwZezbEn14UiWbTbp5WAMnePoj9obxCno7YH/b96RvRAQQnaXvQvzmqFBSoeQHGHsMKIXmnmPF08tmodb1jr3vyLJUOvx1MPHlVqjDIC3tWI460kCDczEiPPvGeBaj0g/sq20jQzRJkM+eHd49OZCBnfEgaKHNy9LjSbLe+D4ra1Nb98fYGxxKUmEFcxW7s2J29LB9NTtZ7qB4zrs9ouwSHKDuG/bnUDvdKljjZPEL1A4LtlFKSZzA6TBULdRzhvCNmrqihl0XY1MgKd9su1qMuJyG67xuQkVgDBppgFP87xKjwnWTTkFjkgYB8vBd6Q==
Received: from SJ0PR13CA0097.namprd13.prod.outlook.com (2603:10b6:a03:2c5::12)
 by MW4PR12MB5665.namprd12.prod.outlook.com (2603:10b6:303:187::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 10:26:03 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::96) by SJ0PR13CA0097.outlook.office365.com
 (2603:10b6:a03:2c5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Mon,
 17 Nov 2025 10:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 10:26:02 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:25:48 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:25:45 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 02:25:42 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v2 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
Date: Mon, 17 Nov 2025 15:55:28 +0530
Message-ID: <20251117102530.903555-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117102530.903555-1-kkartik@nvidia.com>
References: <20251117102530.903555-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|MW4PR12MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 60dad7d2-2d7c-4c07-d65f-08de25c3b5ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Lpqj3sKQuSZAnNU1EDmojC/RBwFLPuFdgyvSCh0v7any+90k7qAqFofLGJV?=
 =?us-ascii?Q?8BZwRbiFdU/ErQtmbhQTOl1/2/YBCt463Oz1R8qN5qXomFF0gIWvsIqnY6WH?=
 =?us-ascii?Q?QqeFG0riqDKNu0jZySRfyaSRVxcN89RjmhQHS/l7GuUZbiqmfJuvmMNQWFKQ?=
 =?us-ascii?Q?E9Jwke9EDNSeyxwiEkqbosIG35y3x790X1HVXPz4JdnXkXJ2WXG80Q6/1nuL?=
 =?us-ascii?Q?JMMPyST/EisYPGHxmo2H5r3ElV+uXfFX3RDF2Ezqzk89yxzJz8qLXARaNY/1?=
 =?us-ascii?Q?JQeCtHkNggZNHfoidALWLoddGo0zfuHV+P3qps7QRzkwzxExLsRuYfih+U0v?=
 =?us-ascii?Q?rkwryBPwfLBPafsiprmF7PdNdAuy2jZ8svjPj2ZjOLGbkmSmG4WqvAtSX0XX?=
 =?us-ascii?Q?hdQTTwPlXXJOdyCj81/+XrHc3wIvx4Ne66ysPhUoID1MDZlJnR6yEd87w6/t?=
 =?us-ascii?Q?6uDendKIkQHkcC46Yz87hkmek5Vc+R6Ym52SD1aejf20Dw2vq4xC0mq/jqo7?=
 =?us-ascii?Q?cSFGCCwSX3LbTV4Xtl1Yz/ldtM/VyXVOdUi5VWmPwC/IAuy5TSKdoz/jcoxK?=
 =?us-ascii?Q?Q1Tax8tq3kosmacLNhEScwt/AeWmnnuWcZCXGvBVOJ87xZuU/gY4OL1Dti7Z?=
 =?us-ascii?Q?96qxWB5H2LHWPthL7SEMSz/o2JOpWJaMBVTuw2wrujb+PJPqnMfMY6C+CAzr?=
 =?us-ascii?Q?LeoPXTssrwTyXIrqPpYJFzsmh6/mM2nTEGPGJajFIV0iYFzwAgVXO41L4hAi?=
 =?us-ascii?Q?7AuCXBN3fo7sjib+QzFgNgZbKIfMygeq/tk2N+FbH7iwW+aW1tyXo/Upfb7Z?=
 =?us-ascii?Q?wTrAkKIMboAqkA/Q01OiYnoihKljdkxy9Tdg/Gu3fUUdYLSuJiPVV87D/NV2?=
 =?us-ascii?Q?XFLqUXdFY/nGtAsGSIV3UoAyOGC4riNOgebO532R8pKSspCebiwRhMje+Rb7?=
 =?us-ascii?Q?dy+5lsd/R/winNOA1/O65+vhwgVOpYSHlTYvALqgs3A5YGoYJXSNHkj4F33K?=
 =?us-ascii?Q?I8WKeeiQW1UirxS+A7MHkhO9uzMSOR6f3VsajywB63WiyWd35J1uo9KqF0Mp?=
 =?us-ascii?Q?9TF7Q9oY0LYrmeUoEL+vXKxZ7PCJNwleEJEwTm9fpBSkHHrQFNZufa91QukT?=
 =?us-ascii?Q?VK8Acy13KGnnkLipRhIC7mO1tSb6L6L9bxwi4s/hsQpWbcl3PUfXdsMf0eTx?=
 =?us-ascii?Q?YdBxRTzmuNPDj74n7qmSXgn0RnsAwzNc1SX+eP2NeHSx6DhahB1l1eaoVPxT?=
 =?us-ascii?Q?BMaGvz1E7BG8sCGbL5bhlGPHEQdmoRHRJueT2iEjFmMQcAQbm4XqvzGGfrAl?=
 =?us-ascii?Q?ymGkMraQPAODHgWaVqR5xFOH7E4j6HuZ5opsCgpJLNo/pLzzgqWu0UOkX1t/?=
 =?us-ascii?Q?vsrvNpOhH/4PfAG5wy6LmHLTFr10gwki5RH7kWu/0U2ckQo9EGAtTAuMZg0V?=
 =?us-ascii?Q?Hobt0qQwoAJOKRyM9xc3ojnip9HYPwzUx6Xi2g6M7HYolYVZUCTLP+Ea382C?=
 =?us-ascii?Q?VlIODb/HA7T07z243gpXNyUsf+yhJE9cxdsBE6A4bUrn+BB7c9H0MdGS8cn3?=
 =?us-ascii?Q?lsTVh6sTRg22qgvb/ZNxbvbmvbyvin7dk/QYcho3?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:26:02.9621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60dad7d2-2d7c-4c07-d65f-08de25c3b5ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5665

Move the variant field into tegra_i2c_hw_feature and populate it for all
SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
"nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
from tegra_i2c_parse_dt to initialize the Tegra I2C variant. Also remove
the redundant config checks from IS_VI and IS_DVC macros.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 100 ++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9ef78c279c67..84255cdf406b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -235,6 +235,7 @@ enum tegra_i2c_variant {
  *		timing settings.
  * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
  * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
+ * @variant: This represents the I2C controller variant.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -266,6 +267,7 @@ struct tegra_i2c_hw_feature {
 	bool has_interface_timing_reg;
 	bool has_hs_mode_support;
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
@@ -334,13 +335,10 @@ struct tegra_i2c_dev {
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
-	enum tegra_i2c_variant variant;
 };
 
-#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
-		     (dev)->variant == TEGRA_I2C_VARIANT_DVC)
-#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
-		     (dev)->variant == TEGRA_I2C_VARIANT_VI)
+#define IS_DVC(dev) ((dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
+#define IS_VI(dev)  ((dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -1649,8 +1647,42 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
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
+	.has_hs_mode_support = false,
+	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DVC,
+};
+#endif
+
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = false,
@@ -1679,6 +1711,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1709,6 +1742,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1739,6 +1773,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1769,8 +1804,42 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
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
+	.has_hs_mode_support = false,
+	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_VI,
+};
+#endif
+
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
@@ -1799,6 +1868,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1831,6 +1901,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_continue_xfer_support = true,
@@ -1862,6 +1933,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1894,6 +1966,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1902,7 +1975,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_vi_i2c_hw, },
 #endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
@@ -1910,7 +1983,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
-	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_dvc_i2c_hw, },
 #endif
 	{},
 };
@@ -1918,23 +1991,12 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
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


