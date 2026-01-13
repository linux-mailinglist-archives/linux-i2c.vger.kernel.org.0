Return-Path: <linux-i2c+bounces-15130-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FD8D1A81C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 18:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7485E30A3F0E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4BA35029F;
	Tue, 13 Jan 2026 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jWoiL34i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FAF34FF73;
	Tue, 13 Jan 2026 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323631; cv=fail; b=UNpSWkc/1qt7RbrK8Dd5v9aD6kr86SYB35MFic4jBfQdfj0CxnEJnysogrYmwhSh+fbyLmTciJ+lzy9YnwG22AR5NeQwF4/UL4uMEi7utd+Qxtg648M/IzUVlDs2vX5VHZhH3oi8aUsufgaEbPuP/ajR18V9Rtt/krDiHQiaJ5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323631; c=relaxed/simple;
	bh=kV7d2X5pXkyhYP8Xy9+fvDZvADM4WqCV1b3c1j+nzrc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jyKh+U4YHU2MCTZiiwPljyX6ra+wOELw906jXt3ySUaHqDENjeQSI8YPsPSNyddtIX4tzH3Va9bRoJYfu8F6gkXzZIWQwnwlkcECgV2aGLWqYvW5G0UukpBzQsx67rZlsfaTXoiwbPSvTBV73MKZs0NanqQHx7+eYXt3xrA8QJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jWoiL34i; arc=fail smtp.client-ip=40.107.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yljyegkcE6ugbnIKOFHLxsQGXQ1Gkpzdn7d2MinB4eWH2cqc0ZBG2N7mOcb9NKURV3jrIegNVT4KEr7iH3Kkj84vxxqTgxi+5W2fHHoLMzN39a3m4y9+i65X0rTj+0Q/u2zjD5elgItZioOPV69xbzD5M2lXG2i4Zuk6AYEGXrDD4eBh4WBcc8jzeZj5lWi01r/M4lTWLl+2GqfYohgliIfrWnzRkR4W88mi2fFZhpdfp9J0uq7D8qkd1oDpEcyzakDksVYy+jrwWaNzuHFC6W5XnjWLo2zAQS5H8HJ6GQAWVXJhSHlzUT1avd1MraNbivutl8andF+p3TQL1cvhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuGzSKV2QpW8honuj1viVJJWClZAIk68F23b+f5ho0w=;
 b=nZdHAZLzQsGxSFylqDKM6oqPDFv6Gga3tdLLTaTCiHqGB27jGVdt/9pR2jSs5ogQROeeTuhGRsTmIYkYkDf6qvHMPH+jOmj3sE6kzsA7pE6NPdHHGT/ZKJKGe/Z6z4h1HqIWvFDaVKgQiO3ex7KyZDK/wFesC/FJtCfsv2nAufX5WMO8pLfbX+nwj8c5vBbpGp/7VvWYmWTUy3+pn2cvmMgc6P2WLhH2boEl54r4PDY7fcVQkKsapBdfXZc7pkFk/mCaHU9yjm9KlTmhESxOsMKSSVawiLG7caUb470JkywIbVLBjsTJg/QVV29tgn9HpbMTcaKhjXaxfiaN9va3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuGzSKV2QpW8honuj1viVJJWClZAIk68F23b+f5ho0w=;
 b=jWoiL34iWGEE5XUjqYHFAfoc5H2mLyai9LpO+oei81giFAu7e6aN0D2czRmlPEQ98KKnQuCUHB3C+EJSHGhL3/uI5xwiSoNlsoqFUib7my7pE/JMv0MHUJKNcl2uGmHH3NCqgVbk+ULNEbyQEStpSTFm/7gxnGeg6i2sxwYo+V6o1QA94fNTR7DQ/OHw02Ycvx8DUx4bKOyYZquDTbF2dQh1n/yEg3kkTapYK/xLH8v0c+CUhfWeuRUQZ6mGlrLbC6fJj0RR5i8H/ibkBR40SVKcYe836BHaBEJZuyGOeUtPkVvixxZO8uok5/qUy1dTBLBrJRCK13trBlBx/HDfzQ==
Received: from SA1PR04CA0013.namprd04.prod.outlook.com (2603:10b6:806:2ce::19)
 by MN0PR12MB5713.namprd12.prod.outlook.com (2603:10b6:208:370::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 17:00:12 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::81) by SA1PR04CA0013.outlook.office365.com
 (2603:10b6:806:2ce::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 17:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 17:00:09 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:59:43 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:59:43 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 08:59:40 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v7 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
Date: Tue, 13 Jan 2026 22:29:27 +0530
Message-ID: <20260113165929.43888-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113165929.43888-1-kkartik@nvidia.com>
References: <20260113165929.43888-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|MN0PR12MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c1962c-8308-4b6b-ac35-08de52c535e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XlDVaKZzDZ1XVnGTrMOlF9zj5GG8Akus5j/3AuRYKDDEnYTsVcrTEXIzvdTD?=
 =?us-ascii?Q?wV1eGpQ2XNrCLvjNKZLu4N2g/2XiQMRRijpp3uN1iZU2dWMpWZPldpPWxUZU?=
 =?us-ascii?Q?oa+9Juft5gFw4OENAXczim5BysA9NRF0RAvh3G9VfH417SLwF8iPaD7Ro328?=
 =?us-ascii?Q?d2cJDtA3RjemhY8J6CRDYykhKXg6SWpmFva7et0hpNNZJ3MvZOYA3bxIvihE?=
 =?us-ascii?Q?8nKnZrAKilVQp9iQz0I+GOk0nEFWIzXZv1x2gKG775sAsGUKP6iZOd9oJXfM?=
 =?us-ascii?Q?q/UwmH92KkkkqOeiDuZaTRdEEynkGHjdg7XAVFALy+a/e3t6JjaWvGCffyLS?=
 =?us-ascii?Q?s3HS3je094FJsWAWB7od5wK2Ky0DYjeCjucD2pRZy+QUtie66JiTSNHKCNVr?=
 =?us-ascii?Q?z9VKAJX4c/0Ru1h0VxhUYdbvGllawbt8Rm5amcc+tGHkXgPXVIK2s9Gt+pXN?=
 =?us-ascii?Q?kDGNg9gkQQbubodGE2YymowC16G+uQOJ68DqdeBw43mz+BeVz1En2f1CR7po?=
 =?us-ascii?Q?WtWUjuk8GVHATXitzMAW0T/gk0UVvUjzMLH1Uh1RiLr3J2l2xb+sfMrbzuz7?=
 =?us-ascii?Q?hkfm4GHcWhiPZDhPLQRw/d549asEMZGoRD7AgsLB3Q5Q2UOa8cgcjEIfeH+1?=
 =?us-ascii?Q?z3wMk5VxtEMVD8JdK4iBYQjK2qpMr+UPP4gJxGBD0/0TJiFhcwlOL0j8x0nI?=
 =?us-ascii?Q?4c/pDKw32AT9Mi6KYoagjd1enR0qOt9+okRC7W0dkAMBEKA2JzIX/hYDPKyD?=
 =?us-ascii?Q?Ect3J7TSfCo9oxYl0qsSsBPZS9R3+WoF4Aq+CpEcbgbVGa4HEaDRW8kfM+Uv?=
 =?us-ascii?Q?7ol97pRqcIqAtwJRUWAYR9Tlapjoty6Fhqo51EjWJG2e/tEUGjutZcO9MWI9?=
 =?us-ascii?Q?D0ir4+oTvB7t2nD5d8ZDcbQQXIcLxK9Py1hv49NQbJuDMzgMYWURDmcoIpOW?=
 =?us-ascii?Q?k7nFHGaYMYBmqil4YDMP5Qg7hYu0Boa8pyo6d5nsvtJF396mb6By69HpdfMQ?=
 =?us-ascii?Q?5jIcdWV4n7gSrhLTaoJCkIKiEslQhwLhHddN/vhkSBzVnGaZEeH1mFXHlLKk?=
 =?us-ascii?Q?B2jFShHmF57TVrDejmIOlkluT21Jd2F4mh1aaPL/hHrr1gp3o3Fhr9X0qZlB?=
 =?us-ascii?Q?UrZbRW5uqWrFIRw2xeg+3+KgttY9fgMhQdAzK5X4D8lYmkxqMYuMTFle2i1L?=
 =?us-ascii?Q?Vhvu9+/8y4P9xRyTrH0yr6+jdyz/VdxC9VHYHLpIEAu9iNFT9B0JKTPvXX1t?=
 =?us-ascii?Q?3jEl7eadqxxz6LS19RMardNy95IndVZBZ+wnfbVx5lUNwW0v1727c4uIydhM?=
 =?us-ascii?Q?8Zy3d16zbAsjUh8yDGNib8AqPY0wOI2lqhlzN2uXndPVVLUNRtEZLYHvYsiA?=
 =?us-ascii?Q?kun1bN23y1NFCgX4bJ/u7YfvznnOOdgUDJkYI3n/WTC8BN/kWu6v0Jcci/vb?=
 =?us-ascii?Q?cunpyFkUpM0I24f9sFjT9qc4kC+l6hf0tn0K4b5EeCtPSbyJc8lXE3Dl+Stt?=
 =?us-ascii?Q?X7j8H1D/KW8uFCefzJtuFJWDZkQQnjqHGTEI0xmMixyWqAr6fhhcDI5UNHRC?=
 =?us-ascii?Q?ZdU+ZinqosOq4SlB01YokiVqxV3SU365aJj79i6y?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:00:09.8037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c1962c-8308-4b6b-ac35-08de52c535e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5713

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


