Return-Path: <linux-i2c+bounces-14943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36333CFBF13
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 05:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDCD3307AFA7
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 04:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C1023D2B2;
	Wed,  7 Jan 2026 04:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZtAKrLAI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013005.outbound.protection.outlook.com [40.107.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865C23F294;
	Wed,  7 Jan 2026 04:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767759910; cv=fail; b=U11gKX20wmXhNz83pYjqhNVYJXMSSQVvzp//d8gbj/W5T/ImRGMfnXwRCECkrCc9LUPO/1iAn3fO8ZUa8pg5DMPjaSe7cbCpQMBQ67USx9ZU1aMkx6t6dAbL8LrakLoKrm0JVyluIlAYkHQLZ5Vt5te1VwuKOJRiPkXxxfoegdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767759910; c=relaxed/simple;
	bh=8JIDz8dyYKKd0ydOV78U3Ey6CVzBDIt1Jcj7vdbsljQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=suRttDRIGE4AoiG3JiWFD+VuXemFexZeakPtE/IDu30Q0JCqaWFM+PFNbkwBZa7fiqC9NHyUZUf9xtb1oqyqFZXQxlRLosF3N6T21acxhvyTsFT6xV4alGY5lXBlhlckbsVL2dq06ybtQnYFWkJaueI7NhXA69K5prFtxlMo93Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZtAKrLAI; arc=fail smtp.client-ip=40.107.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fA9eV2eZGTzVdzeENFNgcPPAtWVQ2MIPKGFdTxPLlLTXvwS58ytemrAIL5HAvmS5nndh4Uao2tDPUbpwbvCVCLIgjufqgnfCfL3NdtNwE9zVMVLInxV21c54OYifhnFASuv+yi26bLOs1q2cF133t+2+88hOn7CKrqkTC5DsnkQNhYTdj6Vbxj9ibTrFdO2USW07lMYKjUhzi7XPcVKjA/lcTBib5HG8pIKY7TVrWl9y12wwY9RSBscW/avpL+gi5BeOvrX2/wvp48o/Rx6TKS4QoZ3t/JeZCzSFPBMpIZbp3K43KEyP52QfHjM7pYJaVZ/iNJ39tH+HNGaXojhvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZm6MOJdPH1uLOQAfYRpQOlMZFVOC0J6xEnKkK6eDLM=;
 b=ibkQPdxcHMMOgOteW8++bwnI3h0AK979Fw8X1o4M4GrrOHBlUSrJSPrpbt2WGj7gbSBi/fRsxr0B+0Z4Yjfyxkg9aldnQcIDVogYwwuAmEciaU25vFHBi3zCeghfd+WiJhAPXnZtxwLQII3IfVJobo0FfsYa+gFw71W/3LlJtrxBo9MyQndgO1pK9SUB6rNXA8XiaMuwYRg8Myy1C1rBACNPvLuDu9zk+as4lg2X/adNXlvAgCq+xqJPUqjnYTfWNIoNsjnPSbRTq1f2zDYenlf7PjUv1/hl1RjYlVZPUqNah1wonCZH/hew72x2ALPWICenuAxd3OTkiORjFpvzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZm6MOJdPH1uLOQAfYRpQOlMZFVOC0J6xEnKkK6eDLM=;
 b=ZtAKrLAIwG8Rc9Vqmgkic1hjdYzlz9/a+hkTomZL/1AUXCUSWh0INV0FLuVWOrIW4StRjN6b7qNlZw6VvhZkzs6RgWmmgxgZ+yuuM9Xe2LM6n/TKw/A62/79dNMD5a31g41Ys5wy1uxUv0zjwxU09XRrtQRczU1fxzsYUj53incXTIyjL2Wynzk2E+dH7La7SvkNpBgspl3HLQFX2lcjzKswFNqBIhvthIGuNUVqRKdn/A+7VwDQWsKcoIi9G3BjxbczSvqDmn2pJ2YmLH4iY4KzRHu1pVvrFlnJx+7yIB6KPo4i+KTC1IHKaziJjqyN3AT4fgsvZwAr7T5+2XwUQQ==
Received: from CH2PR02CA0009.namprd02.prod.outlook.com (2603:10b6:610:4e::19)
 by BN7PPF9E4583E15.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6dc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 04:24:58 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::ab) by CH2PR02CA0009.outlook.office365.com
 (2603:10b6:610:4e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 04:24:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 04:24:58 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 20:24:48 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 6 Jan 2026 20:24:48 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 20:24:45 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v4 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
Date: Wed, 7 Jan 2026 09:54:32 +0530
Message-ID: <20260107042434.10587-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107042434.10587-1-kkartik@nvidia.com>
References: <20260107042434.10587-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|BN7PPF9E4583E15:EE_
X-MS-Office365-Filtering-Correlation-Id: 728a0a04-22a6-4f98-b4c7-08de4da4b7b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o5j/iFUApeziOnUTVGLq8Bl2v5vtxdrqVuukztPJFlrfeQ4zOtmQ0DnXNG9Q?=
 =?us-ascii?Q?aU1X4h302IEXz0TGMbNkQ/jNLcKMkuIjakGObKMlEpGJALzFWWwYpDblHL6M?=
 =?us-ascii?Q?Lz9gbDocbOoag7sJIgR+MaeW1xYraNwKKIMHaGyrjUX6I0HpNN1fuDa4SFci?=
 =?us-ascii?Q?zrhSiGITeYHjXTF25/Z0j66SxUPvlxRJgLSRbTLYsAKUzbhEDMdDFl5k7NAp?=
 =?us-ascii?Q?ysVgarvMUpWnJPx2x0GASym65mFmRk6cD07CreeZ8XeYU6XzgPlObfrrpzaf?=
 =?us-ascii?Q?HqzJ3Mm+dz5KnL9A6pZS6juOVWZrUJMQZ4+AXR/FmNhx+gLkZLkf3NZ2d7zV?=
 =?us-ascii?Q?ivuEkq9SlrUZuApAk8Fl99xEha/cl/dskWov+d6qWLa0WJlUl31tpBDexr67?=
 =?us-ascii?Q?2JI3yA+u7tzOgnEJwCpYzEnHoqcd08Y6tEvV+VtB6gzsVfHmTqNp+zjx+Sfl?=
 =?us-ascii?Q?y/KbOErOPABiHLFGgIfxwW3P2hG9+VYh/3qst6Dci5hjN+m6ibH39Ma5zKjI?=
 =?us-ascii?Q?yzDmYwLKBSb4eAQMHO5tx5Dy4kiynRcYNtcZ6x79S907wL+7QhXd8Zwo7xQi?=
 =?us-ascii?Q?BGy1R7mez7+hbusYYqn/JutQtSxIAR8PPli8h5EweR1UGcHt/BZAOZcdojib?=
 =?us-ascii?Q?fdOsKN7DD+aGd3n1eER95oD3UVAgQ5jmtQPm8o7ODLNbNusXdiE5h1LFyGn7?=
 =?us-ascii?Q?uUJAp1hguvXFINu1vgZ9Nzx0KaOaLnshq1LjyvkQ1gM9xYQunwsiUbXTPhWz?=
 =?us-ascii?Q?0qqc1GQDoTQhAxp4e+Qd1NZLA4z0mTuh9VyNr4lgohx4VTf/teJnhdpA8xjI?=
 =?us-ascii?Q?Nh2MO83ETIvElkAptk5qDgElGBd06LHCUB2Dy+4qvx94xMxNYsV7ymg4HOLC?=
 =?us-ascii?Q?O1SeN+bSczkTO0WCrFrD7EvaGvnqOKLI2KQuuRBCAUbLZ8iCZa7HcSDJhvfg?=
 =?us-ascii?Q?DVup9a+qO2JTKuTtdp1Y9+awnGxHZkptIacC+cSzO65rDUMtt99Z8xw6ZcwV?=
 =?us-ascii?Q?TcQObwAr/fKo7/8ZCXvaUUtl35bCh/xlzRkmNpboD/Ulxr8LxP8DYfsGNZwb?=
 =?us-ascii?Q?M5tdOr0Map2ghO7NlgSxKJ4YcVGMmRUCkLVJTthGsLNNe/AwscwrCrhyyA/N?=
 =?us-ascii?Q?Y8iYoXXoeJeXuGQPG5VZbekd+abgqzf1JSvU64oRHapLNLnWsaNPdtT95+WI?=
 =?us-ascii?Q?QxwlexX35sAHmg3Kd4e65BjWLRGDUuu3QMZve2ORTs3UAagHZZjZ8L3OOE4M?=
 =?us-ascii?Q?ArFXj7PCePN8UOsfmwHs0L4YZdNnGOoW3uzlvSb2xMyhkrk+uGYpev2vJtLM?=
 =?us-ascii?Q?Avd17YFxtBb+5AvXipZViun6ZqrMAd9mIVtGtDHvRYVyUhnqT64vSFUaeyAJ?=
 =?us-ascii?Q?KgsPmkXhQzH7PoBPf0z0jQGyAj4CNbtV0+0r4JR4N5JB8V0bD3TuN/ED0lBn?=
 =?us-ascii?Q?1HVfYmcEFWx7JhaDwZdMAxQiYRG2lnsltASCsanLcO5nqgIbaMviFxLvrQCo?=
 =?us-ascii?Q?hjLr/gghQIeDPPfCgWpXxbFiLSWuGXoxs2Mz2gC3B5ZFyZ/OiA4pybqCxG6b?=
 =?us-ascii?Q?RlAK05KlpQKXkpxORfn8XqTzJwB+cg+7g9dij0RG?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 04:24:58.3951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 728a0a04-22a6-4f98-b4c7-08de4da4b7b6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF9E4583E15

Move the variant field into tegra_i2c_hw_feature and populate it for all
SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
"nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
from tegra_i2c_parse_dt to initialize the Tegra I2C variant. Also remove
the redundant config checks from IS_VI and IS_DVC macros.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
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


