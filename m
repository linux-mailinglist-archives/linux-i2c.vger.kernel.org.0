Return-Path: <linux-i2c+bounces-9237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A70ABA2307C
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 15:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 106611637F8
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 14:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5321E9B20;
	Thu, 30 Jan 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W4HnyBDf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064291BB6BC;
	Thu, 30 Jan 2025 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247736; cv=fail; b=ncNlNxoD4bUyDuNpU7b+GxNRS0j9cxGwWyRwWs2QILWUC/6vtwHKFr7D4Se9UK3S461Fzix3AHTVgnN7q97kKsaA4d5r8NgDqipDF3jvuDXId5uNYlvMbo2Y7cC3XwDmwPk+votWdU4Wpqu8NL8SGoAfqUIfQlYsxpX5cL6OxMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247736; c=relaxed/simple;
	bh=U6J7P5r7bhfF/VRlIeRlDRIrHmD1TGuC0i0ze/R9SKA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EiDLzFskG3XiY8wyvB522HetDYV/nu+RpsbNbbeWjPYXfNvILhLc/O7KeOqEI15zkoKuncfdnMJ34L7FB9ghXKUzbMUdu87zBG7/UdQwoq1guH+C4bwOa4/jyuHQv0DGoHykSc+H+kVVcu3s47eT/+QjhM1f8hvelYtJriPjwYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W4HnyBDf; arc=fail smtp.client-ip=40.107.243.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xh1C4kAy8LWP4QU3ZzqTF3pg/AE+TXyRw9ulrtKz70+CtaBoGdBLjQcbXzh5Vh6ztV6uL0JC0TwzYBt4B+tM5qfJwKCa2mUdeUq2d5Sz+04fquPsfSUiqq4qT6ZVBc6r8+lwft5YAGdmsSVc+8lKxLHokHfkbYatvpyfKk7oo17ZN+6nhQsXE3NjBy6YdbDaujAFVSlRUERlOmoqVDmw+dqVRbMqUnlGfCPDTLwE5lq8kKL28U0cOeMucPcOJYFeZssDJZLXntvkJZYr0LqjZzPt0owSlJQnsHWGuWhLF1PyoScSEQlUPMu20IzWLwtF/0paPq7JdRIq3JNPQhwTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTD858treBe/4AVwJsJgAayrxyI6Wh+nR7PDWFF+vgA=;
 b=LIXvRAmT2RpImLLIXkehwsEREoiZ2d8Fd/co/21Um4JlFalv3UVUFOsFuqArM8TVY6hFAVKo3HZoOG2irL/eolct/Bjq/Tw7wUzRaBaSlpQ4atgYh2yeWs0YvCYUjmTiSahD9IdjA3iucHiX9ZC/hCCUunhamEitHG3Sh4XgO3YmCENrqvU+SQ6rmWeOLosMx0UlKxXEWreaFB65XdCEwyHms24AqfeUUMqzuRrgCz1G1gKqhcpeRe2qD8Zio1BZd7CJiGclQ43oHGNQslucvYog/10Q/33jBrchqJHieErtWO1Z+mW6Qr6NQdlNpHu/wTLVNIOe6wFc5I+O7pdRag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTD858treBe/4AVwJsJgAayrxyI6Wh+nR7PDWFF+vgA=;
 b=W4HnyBDfPpOjy6kYGUIHq7HKH7qM4zqvqs11H8VsJvED6PXYAdmwVVs/PwJvoinxwTzZCg40CI63j2dLhuVjdsfjyYGjlOmIMTn/UFXKMbDu5MVJm+nmWdPfV0n8Yu8wFuKWFEtJl77Vr2LTgthA38IOhamhLi0UEIM7f9Py/3QUO1YPRDG1UiYM8WoR3iB3iWaq6tH/3QJ9CZbfQ9QPATGLW6M1QSWCrNyvVG6VyfKKc1wm7O/vafMa4gDcdLHAOD4oY/OdlQS4CMKUBDCZljA/Sjg6vxeUT8yqZrsdfthXEsYFrbJGq8u1KA/NNnocm4npR15YZbu3njjzxwBpWw==
Received: from BN9P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::15)
 by SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 14:35:28 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:408:10b:cafe::aa) by BN9P223CA0010.outlook.office365.com
 (2603:10b6:408:10b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 14:35:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 14:35:26 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 30 Jan
 2025 06:35:06 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 30 Jan
 2025 06:35:05 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 30 Jan 2025 06:35:01 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/5] i2c: tegra: Add Tegra264 support
Date: Thu, 30 Jan 2025 20:04:24 +0530
Message-ID: <20250130143424.52389-6-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130143424.52389-1-kkartik@nvidia.com>
References: <20250130143424.52389-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 6802beb5-79cf-42ff-c699-08dd413b56c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7ZvFPRGCvnUsIpOc//AtKLODYhfM0RFDDMsM3I8nVQsc9n2z8ykad35oBWqm?=
 =?us-ascii?Q?RgD7qeLgR67DFuOXC7XtDQwje87hXvclQ5yKOO6zXPKEOmikebz+dTg1MTmj?=
 =?us-ascii?Q?wSQQPuXklJmFqWTKI85luF+fmLSWNsCSgaHYUpCiI5nswfrGQJCkF2HlTVnP?=
 =?us-ascii?Q?EqIpKrHftSpA14LKE6FWq2niC70htyj8+AKKfobWCDQ3bPeOlJGhv5oMjocP?=
 =?us-ascii?Q?PY7bZ95Gy+dwvbi9ohy6ALR+InUyH+LdjYgYa+OF+CMdkLavouxvreiw7bRN?=
 =?us-ascii?Q?VNY/aGhocM4dOFTJc7+ymjqW9T7YBhyqxB0pY7/+WHH/KBrT/2O0TH0J0iHs?=
 =?us-ascii?Q?d/MmpoeprFjo2N+l3LAtUglNjUSehOOXJthEJRwe6l5kWm57Nlxkoyf0VImY?=
 =?us-ascii?Q?iG73m+0Zoj7WpLbtXW52yt0X/YB7loSdfWB8BaP42mA7exF14FqoSG/N2m+6?=
 =?us-ascii?Q?lx+GBaJ5DiA73q71n5OMNnj3iFqSsUgkLymhQRFXtZ/Tz93GE7vQmRlx45GN?=
 =?us-ascii?Q?Vrh9/vMbFHyppGH+T25WzJUtKfvoKy3HJeCVtxUf2Z6Gxz3Chbl8BKOm1tDr?=
 =?us-ascii?Q?BvgstXsnszfQegVaQEpptZ6guDftt3lAJXu98/Du85/cl8knjWVc92c9R+/4?=
 =?us-ascii?Q?6d1uZtgxC5X9djQaTEdu45m+qgH9Ic+8zTPkR+OgCwD9thhUzH33F1PrCYaC?=
 =?us-ascii?Q?gXL5GHXYuhZm4ZoTrmKxSEqvaAApfIbB0vlHvQUmCaEL9QUv9ihgEYU/Mykg?=
 =?us-ascii?Q?Bmm7N1UOCURqvgYOKSZUTD3C8hPA9dKmjvZy6PfzFb4dbey3cmzlB+UJtfnN?=
 =?us-ascii?Q?Gi2D+JgLFi3LPK6qLsHxB5wHosk57OMnjQDMHMbFpnafz5sTMWo63jTBSsAs?=
 =?us-ascii?Q?OzwvZpJ6n12N895k9nM+dwOE9LHH/O/y6v+3FeZNTp+olVHHBpMgcx0zRc88?=
 =?us-ascii?Q?hiF5f7ZDv2JRa6Ovxu1cfvZxROwYzPF33HnVZ4ggA0CCKUMIRV5Q+iYUvszb?=
 =?us-ascii?Q?t6HvM/WB/O4KiCTCsNXAVOB0fYW9ULDQl5EL/ep4WNYuTtw7foQrd9dWDXFV?=
 =?us-ascii?Q?1Gtyy0ZVxTgfThTLQGi+utnLTKZMP9O6RAUZYHkEH62F8WPLp55oglIqGQdm?=
 =?us-ascii?Q?RhGqzpRawihT77N1n1NZ0GZp759jbFpsPHAegb4G6SjRicV0EicNFrYqdrcK?=
 =?us-ascii?Q?liuslHVl4HiXx+FGsm3fh9M4bQbrkwuDukhnybXk2h1J6XCULUEOJvxxHnvd?=
 =?us-ascii?Q?/FvWckQnaXxZRcqnmr/Ueb2mJFLJCkGLpOJucr3ZxbBzFknfLqoCRDP079GN?=
 =?us-ascii?Q?qKP6f4xDaIGdKgtVUfOU8kQZMoqiwbYiTmJH3xfMmV3+Bwf7o+L++eQPCCrd?=
 =?us-ascii?Q?mp9RgZ/hzCETD6KItmzYODabUDYToBMRZDxSu1+1W5Vnv7lbpe9ft3cVwPOA?=
 =?us-ascii?Q?VF3wXdPEoc8YXgAq+wJjaTTA5b2oYFaNM1Tj29vNUVcbKUgmsuDh+ZxJb2ZS?=
 =?us-ascii?Q?9tFo+bNmk7vYG5C1JiPDFZv9rw3lr0qqvLM2?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 14:35:26.9166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6802beb5-79cf-42ff-c699-08dd413b56c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174

From: Akhil R <akhilrajeev@nvidia.com>

Add support for Tegra264 SoC which supports 17 generic I2C controllers,
two of which are in the AON (always-on) partition of the SoC. Tegra264
I2C supports all the features supported by Tegra194 I2C controllers.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index aa92faa6f5cb..415337e069f5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1751,7 +1751,36 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_mutex = false,
 };
 
+static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x1d,
+	.clk_divisor_fast_mode = 0x15,
+	.clk_divisor_fast_plus_mode = 0x8,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = true,
+	.has_slcg_override_reg = true,
+	.has_mst_fifo = true,
+	.quirks = &tegra194_i2c_quirks,
+	.supports_bus_clear = true,
+	.has_apb_dma = false,
+	.tlow_std_mode = 0x8,
+	.thigh_std_mode = 0x7,
+	.tlow_fast_fastplus_mode = 0x2,
+	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x4,
+	.thigh_hs_mode = 0x2,
+	.setup_hold_time_std_mode = 0x08080808,
+	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
+	.setup_hold_time_hs_mode = 0x090909,
+	.has_interface_timing_reg = true,
+	.has_hs_mode_support = true,
+	.has_mutex = true,
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
+	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-- 
2.43.0


