Return-Path: <linux-i2c+bounces-13283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DF5BAF4D4
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 08:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F3B3B297F
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 06:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A821273805;
	Wed,  1 Oct 2025 06:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ccDQmFPG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012023.outbound.protection.outlook.com [52.101.48.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616E927281C;
	Wed,  1 Oct 2025 06:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301337; cv=fail; b=TnVJOT6axYAbwETym/NdkUIxERhlrjhKoxXLjF6lx4C8Y/FcBplm4mQojY8NYTpLVkBuKWa+5ZMNhttuZXbUvr13tfRRW3Z1FaHndQvMzcuNJgrZT5hyCartXoOptWe1oTQgmG1GwMwmXCQFD6PqPYCrFYqD+2yAoXB1kAxxQ5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301337; c=relaxed/simple;
	bh=qIAUNMQx6bUSf7SL8hk3oozqGh8HSqxh93dMWCi7e6I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ht7/TJuuZppf77cw59krdLwYYeibUzIdbNC/H0wvB1N+U/G3kpjL6zd9Hguup+MRobmOa+ErbU1TvMiOlD0R/8I7BpY/wrmWsLeVyBxTwm+aAAJpAxbSI8vrtTRnpg0qk5N0dKlAtUYuFr2YfTnsjvwYC6NndXLh/XzEKK6B8Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ccDQmFPG; arc=fail smtp.client-ip=52.101.48.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHmduH4T5g6UWwt0wPcNHDphJizqwvFTB1DQtYeVI3zV1Z4klqPsfW2/w5xh1XLj002yIk/+hsv9SaSC+ONGdy/vxq64y2NTrL4H1fiBGXHQhXIIF3DYQ6Rgxzdp4OTJN2YBVZYSOAwWHFuK1x03SJ53qmRBXwPHOFSf8GFulApKRMNGU2x35hXKVr0uNmvLr5z0UOZhBPbiyR8/0f9Mdi4l7Om6ERbJ86YEPL/KQ7B0t8V+NFzvxgY9sxXtSHnrC+hoeurI82D4UKfERncKAX8PGRccUeiCaeW2xTwaqQvip4eMYc55Fx7Ibq9a0JzNKa1XrvSQP/dgsZHRUO5C+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ/Xt0l41KB3wn0UXa2TEd4STHS/h7f/fkiWWAbREg8=;
 b=WADp8CfO6knas8ZbYnJMaRXYrFT3W9rmVTXwmD/NwAWiQXcXarpZ7U8yyTGGh+eil8cFU7WPQvNYQkLCm8s0TfqoYQBI7bQ2vGY2ZCWod5eS9HKv0hSn5R3UUHubFcSwBwG5j96ezpkG4oxSf5/Qm4uxjfK42pbU07K4GM8gDj7VYb3vTkaQAJU5ZMQr4uit08+Pmibo0P9Asnr7iU8dOnbkCwSJIKuKxbb3DPs9y0GD/2ZLnkHRIL5QwNpVnWjnR7B4ER/9iN3UqS8cpMP5UZyQZ4LBvmfeqGVj8nno22kLfFOb9cnVsPapoIubgaqGD6B343R9ixOy6yxRQg3KjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ/Xt0l41KB3wn0UXa2TEd4STHS/h7f/fkiWWAbREg8=;
 b=ccDQmFPGueWQrjCb1yYBulbI4ING6SESDVIub/k8Nh77z1Xv00zsqymve3pn8n6HIzq+dQ76rAOWZE1DRgRsMhtFQDuZJVOf428Ne4wTjk3qFmg+JYtvJZf0ygUOm4O3b81vl91aD5l8449dVv4aWL/MLHeCSkpFNtBuBGGR+uH4XVSnzys1V0tb5n0oKHqeCvScgO86B++typMufJ9e9ppfCJYwBsndSSggpcZKpuEuGk+AJabDChHMiMNOMtQYXzmUUNwHch1IPq2GFlmxhzHXy+OIQljbDRPnx6bJMT5RhC6PUu/t2PKef+ViRaf6QaZ9RCauXcL4wSdYQMbH3A==
Received: from BN9PR03CA0863.namprd03.prod.outlook.com (2603:10b6:408:13d::28)
 by DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 1 Oct
 2025 06:48:49 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::a3) by BN9PR03CA0863.outlook.office365.com
 (2603:10b6:408:13d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 06:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 1 Oct 2025 06:48:48 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 30 Sep
 2025 23:48:24 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 30 Sep 2025 23:48:23 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 23:48:19 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v9 4/4] i2c: tegra: Add Tegra264 support
Date: Wed, 1 Oct 2025 12:17:59 +0530
Message-ID: <20251001064759.664630-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001064759.664630-1-kkartik@nvidia.com>
References: <20251001064759.664630-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|DM4PR12MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b5e785-253c-4402-aa16-08de00b69347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YFaaWqymw4d8mdNuKmCow4PpaHqVk7fLrmWnxdpuSEl3j/NTOSyyZLvTfQ3G?=
 =?us-ascii?Q?0U7JJ5f7MKw1L/Zfcw4VZIbairoapVYpiUx33ZoAqgvRYsXV0G04zslssOhs?=
 =?us-ascii?Q?45n6FZBT1oZMVHXq5FHxnDSbcPDaQJ4rwq7POiuoLS/YmxIKLhnxa5KOxvpP?=
 =?us-ascii?Q?rpWW08n4oC4BRnUbGjswIywgTwaiVYq/cFASkoPrimfF/UE0dfz5WstHLx+e?=
 =?us-ascii?Q?BUhI1A8kQRpPoPjLQuj9jY5dL7fiyAwz/pMdpstpIZEB6nEwePP3728ej44E?=
 =?us-ascii?Q?hWcjSLxwd4iZokVNo8CqdI3WNX5V2Sef7CgJoXjMJ8X7gTerNnfvA8RVZkP8?=
 =?us-ascii?Q?CTiYlz4eOnqCh9EhAZv/gonzTMr4h8QUMKAWEtUqRi3WRCZcKLTKCy5zwEHH?=
 =?us-ascii?Q?JKHxo2vZc07tz6BHAq2XZPAfNSNiTgZRcUwckbDvz3fyV7mKhYBTxn4ccMjb?=
 =?us-ascii?Q?y5Un72MTDj/sym7EysOap4H3Q1bU5f0AF6jDLPuZqBJtD+Rh4Ek627ygOk9e?=
 =?us-ascii?Q?FUq/oUqGtcfR6WLKTWbnsLGGxjSJvT+WqNCTutoi13cXRAcMcLE58LrIZ9mT?=
 =?us-ascii?Q?1QoMNEvrrKPD61uXF+2XigN1oWrGd3Zh7lWOjgJ866Aj5M34I9gR9CLcDxWs?=
 =?us-ascii?Q?O+EmlSwB9naHtepQtQFSrM/+WmQKUb34Zez/FVtEfsSPGeNnS/GbMLtNDo9l?=
 =?us-ascii?Q?wjtz7M99On6ZMuL1WZg7u70JZQTNv0Bab6CdnCPdxEih+2MT3Dp3kLLZdAVt?=
 =?us-ascii?Q?+zr1ePPbJmCgMEGzpHYGuRDac+nQlFOEHyIhwR2z1fpWvEjnGwVFtkDvevtP?=
 =?us-ascii?Q?itA1Kml20Va9NGLvC8QuNN/jaKJZ8Dg5xqJYVgBqYnTSChXeRP4dctcJkTv/?=
 =?us-ascii?Q?TzUUjWy7qvCILbCOun9Pbop0H3PMTJWl0BucC57l0xnGNjp3jfMsC7e3nQF1?=
 =?us-ascii?Q?iOMENM4n4tOeWPxE2gOnZUVcLD7nWQ3JKl4gB+3tTMqkE10wiAAuPwtMQpsr?=
 =?us-ascii?Q?V8bGLJTtJw1fmrQZSw5FaUyRGRVDC8dVAky/UzJ9rtTVLZUmumf/VLR2iEXH?=
 =?us-ascii?Q?Ctp00V2r2wLZ0lhPqzyMPIwSLooCQEyMW6tofGHjHiCjsDakwtwrby5JwQdi?=
 =?us-ascii?Q?McX9q69lv+e3VfxqXZkoYeXK86PCI/Lh23WrW9orS0MktvsCpZG+5D2Uq+vQ?=
 =?us-ascii?Q?F8rRutXs9MFddpu8aRpOOn+NXxZfA2N9F6Ul5djtzWj3iM2bTmOLLJ3ZLTvs?=
 =?us-ascii?Q?1wb1os20KSZHPM/JicHXvoVNTo+wlcis5M+t+9hgv73elAJ4lQAH3Qi2jkFy?=
 =?us-ascii?Q?H3yJ+vgDWSNkImpEnkhtJEF7ZHQ9796dzkseSw322X5APo3TkZh8sQ3ALnQ0?=
 =?us-ascii?Q?oIyXijqgsQWDvanW66u4BinzRehKMDcH/1PUokfrBzvOR1bG43tKzcN3HtCI?=
 =?us-ascii?Q?oq9Aq1rgqtP7JdoKB/LZy1L2J1t8Z5I3l055FQoWYmM8LtlKjePhWxVGTvJS?=
 =?us-ascii?Q?2aOvJi1RQ3USQmLi+sRVrYaCvgiiQQxdT8ysAZT5Ra0B6N3bJarEbKBwO7EK?=
 =?us-ascii?Q?J/u0aMkuRt2fCGYBFjO6cX3V9H/CXv1vBbDOtXgt?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:48:48.6361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b5e785-253c-4402-aa16-08de00b69347
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6496

From: Akhil R <akhilrajeev@nvidia.com>

Add support for Tegra264 SoC which supports 17 generic I2C controllers,
two of which are in the AON (always-on) partition of the SoC. In
addition to the features supported by Tegra194 it also supports a
SW mutex register to allow sharing the same I2C instance across
multiple firmware.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v1 -> v4:
        * Update commit message to mention the SW mutex feature
          available on Tegra264.
---
 drivers/i2c/busses/i2c-tegra.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1c8c24ae54ed..f324cf3b1f28 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1814,7 +1814,36 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
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
 	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
-- 
2.50.1


