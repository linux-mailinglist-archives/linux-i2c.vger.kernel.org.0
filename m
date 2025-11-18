Return-Path: <linux-i2c+bounces-14142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3E6C69D2F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 15:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 3877B2AF24
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 14:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615F4358D0D;
	Tue, 18 Nov 2025 14:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AoW3WoKR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D034FF78;
	Tue, 18 Nov 2025 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474865; cv=fail; b=FM/kP68MEPOGf4/hz/OiXr4PaBjszk571A+r5Jysw8aSEGUa8kdnp04fvbmd/RsS+ZMemYOHiAXqZQqoVeLg66ZcgcaOXqLvVF5n1AxTcg131nVs/G+SPHj0DP3gvt409a8BMtcYlY6LpcIK1ho3X7JM0oIClSFkkVhHmE7oIhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474865; c=relaxed/simple;
	bh=rByUIxJvPq7lf8Ha560i5IiXwltO/Fa0CQkmTVdwilc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TiXMH80wbtRYHMFmFCaPpAJ6fct9Hkm02ZkIGjZcbICB2NAfE2DblZsxv55DDH0U7oVYCIZUyBdFzNb/WLK8XCVTG6MXTtaT3FE+9T+2s9MqZz1u+3Tnqw7s4RrNrwy/YiXIrT9PYo8ycGJkMhGmkSlyEj+pm0bnEqBXZEBM3kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AoW3WoKR; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBY4YVcxx0IsO4CNBAElex9G0k+UXB104Sr2fOxasIwfikj6XQ2lw2dsnM/PiMBKOoe5mVqbwYzshclTmFpWzKVrLswU5xkRgTjFTsxw2eb7Rtf+gMRxthlNgk5AWGkhmY/T9pLQqpSoTXIbUwbDzpQIAebOeQHQbKO6BnS9obJk3VoU1F1OLA0OUy4oLuPyaX1PTGTktTuzegMcq13vwN+XKs4KgoPACY9ZOgoz7ie06lSvGHpsbd9ZIKwynlE68njPIPv68D0Q5ZHIjhcjj5vXqUYp4rZosQLwJUO+9k/YevHyMy3ni/cnQ3jnPCjP4tWEqhL9S2mPg7+La96jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7meLqHP7G8QXYNuP7u4QjEVzgIfcMB+sCRJ6KwOYC8A=;
 b=Oc+hhVOws3ooABIb8XHx5Ot3KS+ZrMqTEseg+dyuFqzSStrmQd1ngXpvl1/cHB5PMR2GcJ/dPwSBANJZehXxWh4dWS8DKonGZq5VQ4ZDruuxUHM53bU9OarHVaPKOdnEHcR3qY6XUs5qqq/PN242j4k7W73g7j1lr4s6rOM4tkTjlDchs7x00Zsjt6HMjtzZ2Fq/HQJQ3ZgbWJwJCVh/xUFo94hZOGhvBTpBFCw1Q00LFiBjt+0prhOvDXcQdLsmdywUqBoO6iqfZ8O4L3lTB//ni9jdNX/GFIxC1BCjUPv3gxcnGhrS3dRXaCEK5jxk7Rwo4POd+ZJ+q7Fj27xjDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7meLqHP7G8QXYNuP7u4QjEVzgIfcMB+sCRJ6KwOYC8A=;
 b=AoW3WoKRPB6YfxEf97Q2qU6K3vSuKQj/S+a2PLZnOGAhK3WGvcUHx2c/UZly43xsENgnJ0NVwPIXIBN3W4Ms0naOdVlHM70xUmw6QdgaIwX+q3fZRi8I9hHzVgol50Bmivc6qtELVW1zjmhtLKxQdsTUMvqsepyA7hLJNakOnNUEr5X7yNQ69dj8xQh2gxxcE5LaJVQYmcY0Ld2G034YWFq6243+mFjemoIjklG8pV1Um3SnbfzRgwtQFBN2/Tk1iBrTZ/mbSpS8zvXDL9B7ia0XitIaMNIEc6ozHQyQ8mn3v+CzrnL5Eic6IW+dTiHh8YDZw4Gzuygs1BVwFdDVNQ==
Received: from CY5PR15CA0223.namprd15.prod.outlook.com (2603:10b6:930:88::9)
 by LV5PR12MB9803.namprd12.prod.outlook.com (2603:10b6:408:306::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 14:07:38 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:88:cafe::e5) by CY5PR15CA0223.outlook.office365.com
 (2603:10b6:930:88::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 14:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 14:07:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:07:16 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:07:15 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 06:07:12 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v13 3/6] i2c: tegra: Update Tegra256 timing parameters
Date: Tue, 18 Nov 2025 19:36:17 +0530
Message-ID: <20251118140620.549-4-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251118140620.549-1-akhilrajeev@nvidia.com>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|LV5PR12MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9006b2-bf03-4a7d-f0f1-08de26abd2da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?plwcOFgoXAaUq0334i+qvVNfDaoy4acpJRjEmLUL3Mf3RJxpNdZ64B2J6q0q?=
 =?us-ascii?Q?rg8lAPSRpTGRl8MAabJSyyHYRL4BcNSnMgaY3YPLfGO/huuEg4vbsAiySz3f?=
 =?us-ascii?Q?hmZYz8PqQwkr4sZcIXJGtE2VA+7gTtgxxZxySe1J5dBwK03ssnEPNiuA710W?=
 =?us-ascii?Q?t2bxPBvx3SxfPeYcqshfzeDc/YLbCTHQaiL1pgtSbmbGaWkDdqXwBhitzeQX?=
 =?us-ascii?Q?f9HpZa4NUGoZ1Up8legwUEeC3rN1L2WRvvmy4elrvgRmBRyXDUQ8EETASde0?=
 =?us-ascii?Q?DpuaYPYf4n62Xu1bScD7B0mHMQluuWrlqsQapqvL4sl9KNqPg3K2gKgkTB2T?=
 =?us-ascii?Q?XtRemoheJ+oXiu2lmeNTVy5YT9sAWdsjpFqOYUh5KheqERrANc11V9FefUsz?=
 =?us-ascii?Q?8wo+6XYVIrZOpFMyuf7ogM8V6M/H9FeIosHO1OS29lPFaY0ZAp4dmk5rHmUn?=
 =?us-ascii?Q?k7mBTRnzSerBlZTKjuZbEceQSUdObGiLIvJ9TS6lWOiJ2KAqig+hLV7Nou3m?=
 =?us-ascii?Q?VaJf4dvwoRHuXceIaerkzVVMs9EoysyYYJPWgh/Bdsv1J4RmRMZngeDQXxuW?=
 =?us-ascii?Q?YO2+lN2/eax/89I3FQBS1zfUgyygx8V10VSr20tpJGitdWa9FCOKUsNZVUKg?=
 =?us-ascii?Q?HN5ybj7r5dR9TLIJ4ComkOl4YO07Hfazf7jxT7ODDxolwsdOrG0fMa/Zm3D2?=
 =?us-ascii?Q?EvnVwpn8HUy+Uu5G+07DGpvpWTFIb0CJM7Q37qZOpNWrViRUlRHnO7jnQRzV?=
 =?us-ascii?Q?gVTx8JNQN9e5voqN+SngKmyhLX+wckF79ZtbIVsO1VF0ZX3l/lYop20V4oKM?=
 =?us-ascii?Q?NIYQK1kxirSbzs4+SQuUAp7wyxqWky82jUuuY0EeA1pcbpbHsjWhvkrXVRpe?=
 =?us-ascii?Q?4ZVAVZwD9sl6vrbwi/FCqhTkB380rKW1p2fyUAqbr5/rD/TDqDXubWvIWOdf?=
 =?us-ascii?Q?vs1KQYvuzKNBkdMRK/mZaNAS9xvYsEK4Mjb5COjB1fTSQvRupGSqlPWUxCD2?=
 =?us-ascii?Q?F79xTvBJgDTMsF6y3RK+XHELPKsDD2NYhcZhM5ahs+T5mCygtm2Ph9aMcKhn?=
 =?us-ascii?Q?vu3avTXFToqntfUfPS38nNpE5tQIXl0VKPAFFasXzcIH8yu66rPmNirIsdGa?=
 =?us-ascii?Q?NCyptrLjcn8huJGDqdQr3D94SeaOSWjj3Ygm1poRxud/B7so3rZXR5urhuYl?=
 =?us-ascii?Q?vbEocJcUnC/TWuOX1kJlS4138oB4VtGmpjMreT7OqHVi62W/8TkRUTKnimMY?=
 =?us-ascii?Q?WbJprjHZCKvlrSA0YaG02iFaamnQQXDfKPsf3SqQC4nH3qG7eJ+ykv/KWtGq?=
 =?us-ascii?Q?Sxzw2XEw40YX/NNtm929EE4BV1agtQ+7SW4nUiWB3cUyBZTPZXEBMASNuHqR?=
 =?us-ascii?Q?Ju4llGrc+6zl4E46ScopCXvx704bo295FRmA4asY6RpgXanHsKZhw/ePsYkZ?=
 =?us-ascii?Q?IGKGWvg3tF170TbL6+bLOAnDINNXa/UsYxLeZDi8N1ila2Za36s7i0fW8GUB?=
 =?us-ascii?Q?lGg0oa/S+u9hyAbT1vsMTSjQ3fCilpd9c46p/n05j6UWOlYXAiA+HYPGwf1F?=
 =?us-ascii?Q?Hoder1OHjpFJMD+r9YM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:07:35.0908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9006b2-bf03-4a7d-f0f1-08de26abd2da
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9803

Update the timing parameters of Tegra256 so that the signals are complaint
with the I2C specification for SCL low time.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c0382c9a0430..470d0d32d571 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1684,7 +1684,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.clk_divisor_hs_mode = 7,
 	.clk_divisor_std_mode = 0x7a,
 	.clk_divisor_fast_mode = 0x40,
-	.clk_divisor_fast_plus_mode = 0x19,
+	.clk_divisor_fast_plus_mode = 0x14,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
@@ -1695,14 +1695,13 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
-	.tlow_fast_mode = 0x3,
-	.thigh_fast_mode = 0x3,
-	.tlow_fastplus_mode = 0x3,
-	.thigh_fastplus_mode = 0x3,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x4,
 	.setup_hold_time_std_mode = 0x08080808,
-	.setup_hold_time_fast_mode = 0x02020202,
-	.setup_hold_time_fastplus_mode = 0x02020202,
-	.setup_hold_time_hs_mode = 0x090909,
+	.setup_hold_time_fast_mode = 0x04010101,
+	.setup_hold_time_fastplus_mode = 0x04020202,
 	.has_interface_timing_reg = true,
 };
 
-- 
2.50.1


