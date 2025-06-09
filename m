Return-Path: <linux-i2c+bounces-11285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EABAD1AB8
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 11:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F0C17A53B4
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 09:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AA3253F26;
	Mon,  9 Jun 2025 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KM4vkOtL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612DD2512EF;
	Mon,  9 Jun 2025 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461701; cv=fail; b=iWakkuPBuJgUGvbEH3QW/UUZ806tAQfmUDRocDqAkR1YOeZkg8w1ehXnBDm8j1zSimTgEduFEkTlRINZC9mvY0MhjgORLPKB2OJMiD1uauLjWu8Xd05tUpeEc2QT8AFqNeSU1lw1lQXZSX+uNn81E2QxY/w8OrH7eaOjOu7CUk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461701; c=relaxed/simple;
	bh=lTUY4LJV1t5Bqbc7Fm5PcadJthBE66ymq2DdQSEplOQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G/qmVbTCCzHUNlrgOW0oxihYKsjwHJKgSX9KqRlW5tJkRALolgynNI+xMPEo0p5xD0DrBM6si9X7TL73kCO5j2wJLVdrJdNm7cXO0jVH5kwb6Vms6o+nfQmwr96fGuayJPSNjj+zevBY47+K0bK4JNIxXLcB+ENajPfTW4/ikEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KM4vkOtL; arc=fail smtp.client-ip=40.107.101.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGCbx44SACofQNHymqbaBz+3GQlo1zPyjFpTQluvCv7uIC7MLdrz9dgDjdHxOaOkYMoSWQjseYS17E1eqrIrvChXQVg0iBZm7HCkz0hlpi9s/QfJKFQjokuDsnxVQ5jEpERXF58xmbrFyEiDuhT++IpJD13tOy895C/EweHuCN0NUXThvWL8icWLQ1mzje20jGV7fzDfl5E8X7oRIQxzmIxR0kReoUHOWpTYjCmB9pk8vGcldXFtizReGfyg0IP+GCunY6H5iTp5W7/AEh67WgVQfYsPWtX90+EgbWUJ4+UFCeKGtwo0N94UV9N4Qv3RBHuNV0bgaXcmKW5I78PXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhuN3+3PUH3NvIzQpvfQB54lzLrW3K438IjVljlMkRA=;
 b=r7SiNEviU1tJWsPFRHPvAQoKYDKfW8zIU6EMYfdXTDpvlMpqnXpCKNDtN2LRfP2SYqnGJ83Ck50T6xN3p1SoGzDuMXRcahTPS3kbf8dImFzfjPBt3dSGlPHRzSjZwikNnfmgFlMHDebb3g9ZWcMA5TNVz+6wULV05rIh8Zdf+3lDtt63l8VnnVDBhhN3HfQz7riQJzbyzFPHpnjGJEsa0+tt3LmplxxUsB86PNxaeyAJqdgQaOW2cwbkNMJDMaoBQizWM/e38soYh8lLmA3UraopMmBhC/OC0zjbXlO0Q3SKeiNuaX9mo/STLCEYNqJ08NiwNQrigMnwZGUPIdXtmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhuN3+3PUH3NvIzQpvfQB54lzLrW3K438IjVljlMkRA=;
 b=KM4vkOtLZOluDQjbFTqVLXBu2yIHrj+vi6YCux1MSw7+G5jdd+y3W+2HmMIFHGzqh+hVpU9WiIOXEj0Bhwq7kJ9Qv4hSkA5hfxHCZr6W5U1d9xrvlnlQQ/geK/gFTXiKcHOs6Bh0kKmaOdOXTcf52d+OMOPefwKS3C555CKyacigjfpeqvRXi//gNQiWYkfxCQ3VIvJMyqhvffBQG41adNwj3G6diLIQ/VGs8aNi7Uw25oQat4/JrTUxieekojcn7Alc0SBL+67yqx8aCipkVxyWzu/o30yj2VM9e20hV8YOmSMSP3sT0vKVevTSs4y5u/nqtnYKmU+CSo+LvcQVjA==
Received: from MN2PR10CA0031.namprd10.prod.outlook.com (2603:10b6:208:120::44)
 by IA1PR12MB8587.namprd12.prod.outlook.com (2603:10b6:208:450::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Mon, 9 Jun
 2025 09:34:58 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:120:cafe::81) by MN2PR10CA0031.outlook.office365.com
 (2603:10b6:208:120::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 09:34:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.2 via Frontend Transport; Mon, 9 Jun 2025 09:34:58 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 02:34:46 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 9 Jun 2025 02:34:46 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 02:34:42 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/5] i2c: tegra: Add Tegra264 support
Date: Mon, 9 Jun 2025 15:04:20 +0530
Message-ID: <20250609093420.3050641-6-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609093420.3050641-1-kkartik@nvidia.com>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|IA1PR12MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee41f68-5006-4a66-53bb-08dda738e668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e41EaigMVKtyhGeXe76GTiP/gvS8t5fRbfbWauykKx9gGQA+lGRQt6R7CKu2?=
 =?us-ascii?Q?nFOoucQd4Vg1TkzqGhQwcj24P5q+zPirUc/R8kswVbgmO1RM56EczoBd3/3W?=
 =?us-ascii?Q?TzJQ5IZ0jz3FJ+OKP7Duj2A64nNxJwl+EFu2fuN27Degit2wNdjxqHA3PDRy?=
 =?us-ascii?Q?Uv67ksl4F/WRZJ+oppgYfmoTztDthPlgbmmB8D1LceCIdlFuae6gxjbil+gJ?=
 =?us-ascii?Q?/QOqBNl+aPGk+yzfvREKF0sjG9plVPcBpypJO9zXq6yF/yy9OjZZX3c31m5N?=
 =?us-ascii?Q?gbNosZo/QsT/fgmnT8GHHSWo3vqewb0bXcDi+2UcT4Jn/wDe1KwS3owXPwUi?=
 =?us-ascii?Q?1SUNMXklSLtxC1pwE79nh8Jc9DdKh1BHsQf64uD5dcoU5wpMtZo0wnlr7wIN?=
 =?us-ascii?Q?4Ix3YiNu/Zl719fyincqEGsWc9OtsKiKF4rR1Kl6yEPMf4+BKi5jPhlJimX9?=
 =?us-ascii?Q?bzpqx/8CobVDj1Ja5OpdYuCf0/1p8mESkEI4hmACWXXj23bus3wkjJwx6JdY?=
 =?us-ascii?Q?o3x3cSc7V/zD8uKj2hDNOsKx3vKF/19tCCLv0FHcOV9DW0pf/OTnm9vH+1N7?=
 =?us-ascii?Q?PBydhU5U9Fc8TVHvIV/WmfpYTu8JX1n06WoV0FZ1dSFXQAuAqbwhmiCz+dXg?=
 =?us-ascii?Q?FSJHMh+NKP0S5so86c/UyYbhDK7AFarujmU9uMCsQjReTaJGqLjbzC4V0gXN?=
 =?us-ascii?Q?X9FVOketIwZ0MLw/4mJvu9blLue2St2SM8Gf3UsLlSM1kWcVaQyrbnnMTL58?=
 =?us-ascii?Q?+Zm0sQ8MAKsI2eHYSmG8Nxmsun3cL8Pz9AookFJmpqd9zYuj/Zep8u4Y+Ekx?=
 =?us-ascii?Q?MFvATw1BcadbpoDxily5brXS3ip9Q07YKX6xJSJWSseGjn3ShrYNLPpnH2G/?=
 =?us-ascii?Q?AA16x+ps1S1T0NQV4qGJyoLqV2+1xP5YCwWnjSJbK7pDs0EjdDK4zb3VE8DP?=
 =?us-ascii?Q?XEYbSiIKuTntEo6CpzdxZEuyz29SK6xuwZBHKIHleN1pkPqXt3ZHDIyxhGXi?=
 =?us-ascii?Q?AbC+GuJkHrktXEpwdqk22M6d5Dpv+xXHDvQi0VFYmQW/VYuwh0kSM9X+9Adc?=
 =?us-ascii?Q?EZvdYLETdY5kXAIrPNo2bUlEslNsQHoSVidk6md/708J3/z+3WIIfaWlLchW?=
 =?us-ascii?Q?EEGSWcNSHsplqn6MXnU0pgGltDJlGrVtEzwCbLgqoBF0/b1pyGuqNNnfyUJL?=
 =?us-ascii?Q?qEfrnhGKIJjY+pEhkjxjXzbLbveJRDJzmvkhwf4V3VLAxIpeCTzE84agwgdD?=
 =?us-ascii?Q?DP/hLIO7HrbCLBtSbBAzze3o/3tdYCJ1w1Vx5JKfgBAZTdu4vZwBWoMBGJUR?=
 =?us-ascii?Q?rwo9N8u4uJAqTz5d6XOUQyCRmubDZQXf0Q9+Z9jTd7Gek/G3ywnIVCVFEAbA?=
 =?us-ascii?Q?ew+0KFMEUbxPJ8CMy7/VHUdZZ/RPHp2CP1/MK80qverkRv3X1wdc8DUtKEVX?=
 =?us-ascii?Q?A0WjaybuGZRTHOBnDMyygMumzjweL+EOrXVQe1blD39E/kAe2LYaTIcilWC9?=
 =?us-ascii?Q?3gcsQqPXLhOwipyuYCpwLyeMj3c6D0/Y66N/5ZVDTU2qbo/YHOTJOLzakw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:34:58.0177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee41f68-5006-4a66-53bb-08dda738e668
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8587

Add support for Tegra264 SoC which supports 17 generic I2C controllers,
two of which are in the AON (always-on) partition of the SoC. Tegra264
I2C supports all the features supported by Tegra194 I2C controllers.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index dae59e9e993b..6cdf44e7d3ca 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1774,7 +1774,36 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
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


