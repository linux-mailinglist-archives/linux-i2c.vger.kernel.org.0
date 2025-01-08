Return-Path: <linux-i2c+bounces-8964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503DA0592C
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 12:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17DDA164867
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 11:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1A11F76D7;
	Wed,  8 Jan 2025 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N8gHNcrF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362541F8AF9;
	Wed,  8 Jan 2025 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334412; cv=fail; b=ayBNkWRvKUfdSQrG6a8+/3yAuTZUyCtNF80nW6VVdwvUwbXCiYsEs15/MkywtO1hStwzJBp8k/fh81Rg8eJ9jk3yX7iLDkNMvXzmllLRThcgM8otjYNfzao2cGABFpgQkcB33LZBeXjV0sNlhSUxfC70+fdLUbuKK3sgXN/OBeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334412; c=relaxed/simple;
	bh=qE3DtohsptV6CYnVXGAVfBgAoKL2uODEdZvXFiqhn0U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FV+iEMvPIk9kMRjo/rojs2ViCe/1N6c0GGJBkTC6XnpSGPH5EJLNFc1OAIXwgwpeguC89M/hyUw6IdOGkYJ5JEarwJuxAzmevL6omx2K2c1uGpizlsIsLndEbnYA4BJGXOd/07CtSiqw5GcdW2ZBUCSGhx9YzZO0C7WK7/f7Hdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N8gHNcrF; arc=fail smtp.client-ip=40.107.102.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyMvI5Vw5m1fi9UW7tk4X6uY1r4hsCYthv/KuQJZ/nG3P5MUIkjzg11pDwOUJQp5rC+RKYHWNvAtkeY7yVj0tGnJ9O7MmEWZkDbIhB3c8cbCwRJJKhVI5n6wUXGbtg+jgrURlsL29+vgy7JcwSD2nNpRhRZUutkAk+90TB0LtJlKKo4sgfTUmKrqyDggnRCh0KNLsHHg7RwRN5ZBPLXooNxxOhhJkn/Xs8YmxuV9d6wDtT/8fCUSV625g9pzHXzi4iW0omsKkbjBgUsamLm80ggfn7UZIkEGZrnNyGVUIVlAIhLByeDKX8BGsGxdCSEFMB1hnoFIov9ergZKpag9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADwXtCUnFqwDWJCYOXBCRFyMz8crPSejtgYI+QVJ1dE=;
 b=GOW1MpN6QB1bMWpZ1vS4F1cH5Coqfpnl1dfOY738sC6Gp43pf5L42P0pRjUwKe4rSKbExoYYcIxSiHmOjgdoHyrgTA4bqJJHwMk8vSI+tKsOqkeSIm07GhI706xMeRaEkZVR5DLAtKMA1SnKygSk+TtnpnDUgW/4Clwc/PYV/FXLBoO8FZ+fUM8lgg/M2NjNn0+i6jwEng/G+hNspBgmkhsWcd4IE/ZDtsRMrwbCOUJSmsTvO4LdjU9ubMGIkZ3Jb2qFdke6g3oNK/AmJBVOZF2S2JX3ZrF4WasSCD6dnX595om/D5gonvNef8kZp8ON6qCpdLY+paxbo3pAfTgoAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADwXtCUnFqwDWJCYOXBCRFyMz8crPSejtgYI+QVJ1dE=;
 b=N8gHNcrFc+g8ZFOQi1rmZ5Kn62C7tqf8/DTnBfMsEqw+CnXQqvjzfeUtw6QdIFp+h+58ta3JYVRJlAxptY/mxVPyQsfaMQ6hGK54wmM3BeVf8M1wnVjwiy+O/UYc6dNzVrcLA2p5sq84S8bgoSovCuKSUHCmwsp+fLTVWvNn9pU9tOwYBJd67vfvjFAzfITsUSQSFOfO2QFEtrrTOR9j1ffM7XkFGY5jcE5GUIm2LwByWz3aUSon+U+lH9xsFDhKQVoLQMTG5VLV0c6lKaHhNEa/DJXwJWRbTJrDZRiRKp8R7K5VtRGsi/84PBbmF8Qn6CmyFqWp+T3/02F0kykE7g==
Received: from CH0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:610:32::33)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.10; Wed, 8 Jan 2025 11:06:48 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::d7) by CH0PR07CA0028.outlook.office365.com
 (2603:10b6:610:32::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Wed,
 8 Jan 2025 11:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 11:06:48 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 03:06:41 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 8 Jan 2025 03:06:41 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 8 Jan 2025 03:06:37 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] i2c: tegra: Add Tegra264 support
Date: Wed, 8 Jan 2025 16:36:18 +0530
Message-ID: <20250108110620.86900-4-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108110620.86900-1-kkartik@nvidia.com>
References: <20250108110620.86900-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|DS0PR12MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: b207c567-ba89-45de-0405-08dd2fd48bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Opx1fAZJ+oNqgYfJLMzIllcVtz6hjTzrWficuaJ8HqffuvkwSxgsueyK5dn2?=
 =?us-ascii?Q?1Rsy+GuBFWDc+5hxqpXXOoN4dD0HLnZZ24qmd13s5okayuKOt1F5XpZB61Hv?=
 =?us-ascii?Q?3DNgdsKNNXX3VvIZsMTdA6g6e94omAgoRzbwAvGiLJW44jPcjeDNcLKE7BV5?=
 =?us-ascii?Q?0yBH2G+xp8pzJAllZfxjD2FZi8nRB05sRgRattd642kTHMzq1X7QVn4JifPM?=
 =?us-ascii?Q?Aa1S/dbtpQJX/LX0OcZZ6Fmj+h3qfiPyKJxbzp+hzmPevPuDiMmj/PDzKeSq?=
 =?us-ascii?Q?wXAzJ7nM7B0I8se3sZABfZMwylclRXTqPn09VozSzuY3+oPJ6ZusyPRwtmgy?=
 =?us-ascii?Q?Wgad5fGg5UoMstPBFoinZuK6r/fEUlYe6G52LszGmhfxUh8R1bZK4muWgO22?=
 =?us-ascii?Q?pTiXoT0VmSNpB/CLgowCJMl4pyO5N9xCVsUEiVJFHRJUZJBFHk+/ocP92683?=
 =?us-ascii?Q?Gi9DEX7jPtu5On5ce4ij5i5El3xHD2Kdg5Nc5iwJ5KvJF0/PYyX5LeulvF/T?=
 =?us-ascii?Q?rW2PxHZsblsz7Noyc5zOqS0I/+kD4apzsU6/D/oJlcMef3Zfz1v5EJpEeeFt?=
 =?us-ascii?Q?/tagBfQzcu/tuWfTlAgO8oySHXeo0gbIqIqbx+wD1qX+IOsyWUWZRxRw5MHK?=
 =?us-ascii?Q?s4z2tRZv9KybJgfEoClj2+Z150KI0JvwFopdSAEdi9rUp2oTcOfmEYOVWzsL?=
 =?us-ascii?Q?0HUIcdW08r8ZOFnAXUru+iE/VmHF4gkiD7YJqjnjqJSe3dYwySf9IkCwQxCE?=
 =?us-ascii?Q?1cCeNLg74z750GSZqqlk1hliq6J2tTTRUNKkJfVH4TkwlwmMDHX0J07ycXUx?=
 =?us-ascii?Q?ekwQDjCOMorkBZ2HjRJ4MWDSEdduG+TWE9aWqMP/hh/PBIJKhhOfFKjB+jEs?=
 =?us-ascii?Q?hnoSEhXcRmeCCHYZ6qImuGUDcdky2KXICQLBOzM5YSO4BIznVTaIYKnwjqoV?=
 =?us-ascii?Q?0g4mSQGkfohPgdSFy5a68yRwOq5BAeqGpkmZYtv6Hj2cx+6/6BN+oQME6EOa?=
 =?us-ascii?Q?cGqlHWb0a93csLTyVhHDc5j6ev55Zdllh166xR5+TPhq2lArOmqVUoeSUdlA?=
 =?us-ascii?Q?CGACZxSnNArsHGfgVmjdatrHUzIB2D+tEfdJaAHDW3Q1iuGj3zuTLkWCJZTI?=
 =?us-ascii?Q?Z9QTZ7/FJdkgZCjENn4zyUnm36GMFNcVr9L6Q3d6JL7JSDTK8NnAGlZjOQ+2?=
 =?us-ascii?Q?x34Um/+TQU0EV9k8Zf5x/1IioYQZ1zJFzifZC/pod8EuFKtUgBk3NAyEycn8?=
 =?us-ascii?Q?H+eQCjHo2LbTQIJOZL9kMz0F5JwwmBr7utENPjU3g3SbaQKh487FDdb/Ly50?=
 =?us-ascii?Q?16myGHZhgqxybHvSMFYzC3q0xbh5KVkHS+3XBvNHBmKViaTYiPZfGFcv/pD7?=
 =?us-ascii?Q?jdnJU88nG8qNNSHrdErz7qVdNq1/SEPHJ27ZE7JPyAyGN7A/p4BOWEUTcqoc?=
 =?us-ascii?Q?H8G/XBOtvYXEPX4309g0zXe9MJoUHA+NhCLnSn4TH8I59vbzOd4FQ9CuwJFK?=
 =?us-ascii?Q?S0g6I9RfPUomeE/HzJXzzuo1swPBUiY8/wNJ?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 11:06:48.0637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b207c567-ba89-45de-0405-08dd2fd48bd5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416

From: Akhil R <akhilrajeev@nvidia.com>

Add support for Tegra264 SoC which supports 17 generic I2C controllers,
two of which are in the AON (always-on) partition of the SoC. Tegra264
I2C supports all the features supported by Tegra194 I2C controllers.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7b97c6d347ee..cf05937cb826 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1646,7 +1646,35 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_hs_mode_support = true,
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
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
+	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-- 
2.43.0


