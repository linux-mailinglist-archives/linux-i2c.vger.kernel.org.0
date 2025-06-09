Return-Path: <linux-i2c+bounces-11284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D570AD1AB1
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 11:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A501A188B3A0
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 09:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248A025392B;
	Mon,  9 Jun 2025 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tDjPvyCq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D563246769;
	Mon,  9 Jun 2025 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461695; cv=fail; b=fPsdHHq6orwZdROu3lE1GG1a/u6Slkum5bHOGslrm1I84Uj0JICK2ifvNWh93lsx9KESvQ/06DArpHlh7UOQuDIz5pJObpxK2nmYW+47AU+75Dj5PU6vOx2R/bcRV+ZFVL5Hu/AFOR/Uyz3iiA3iackT5Yy42YXBdAq4Qmm7Qyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461695; c=relaxed/simple;
	bh=7R6aJdajmoOMBdehzpenE1Eba/KdUtJFJwRo9yV04Gg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNljYzQbuAujShcS7vNJhP+CM0+w0FzLuXeU4qG6U7DBmDHy/f1A/SyihVtrFGii13Vz5JEXYValcmzhYzx/f0R4HN8uX2L3Iqwo3Dh0gR3iZzqSPccP3WLHiz9zAnBwgGzAw3FlH0QMeQJmOHRcmJHknwE4ymKzmUosBU1nSBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tDjPvyCq; arc=fail smtp.client-ip=40.107.92.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKgMLy41DDUT04H5/lnfh5VjiwTN2l8yo3zFXnNRi5jduRyfmZMlohYEr88owgED/FI+1jsyK1lyZXvJ86aS5FutFMXB7oflLBm96AdZzFaa1MxSA9njNW2BGUGOHch6uKiGVpader1qmbFkWMKQf+9Mvm39LNqkrO3zcfmJ305+xPYmjk3DKh61VekY5g27B025rfr0L9KkUvi3jyNa47Q9KOZt4f6CjiQQP82Ci+8aEMLulUkjrETuAB71COGDdfzwnQQlSq6nqBO1r09fUNGfJUDJ9g2D04mse/DZjgoXdmDmZJXSGXsoxbbU8OLwX2IT0IWq4nZ/hK4P1oVHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox3VQXxdXzpdRnGhS4Dt1UFJ+YBpwj6Bre/j9832MiM=;
 b=ZhkTJ2WhPenvg2IfUMusLCGdtpxuiPYxd7d+5gLzHqqCnE9GvFCyEh5rJANeYVAJ8X0GQQo2k6V343daZeos6r3pmUBKnZ5CbTXPdMCYVGOxRhDkqDUYMpo1rTw+luKZjr+ET02BYuv9YqrfhOBosSNe3C8K26W8Cl84D9uP0zlqf09QsO0dPPwQ7kRHWAJE2BaQ5jFAW6SmiHiiBqqvzRQeJh68WUryo75RMObqpdshiFwQ3rGv17YJJCK2RdPYNUg3VafCw6+R6LLtqR2lO/SYaulqZi4fzXyZNsK2RBFziLwSijbzeUXDleaXx6E/2IZ2P2MAU20u5/Q3OzaaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox3VQXxdXzpdRnGhS4Dt1UFJ+YBpwj6Bre/j9832MiM=;
 b=tDjPvyCqEHaN4uK0mkmpIbR4Z31yjC4f39H4TDCapEts0zU/uL4oGne1JK/SCSsd2yHeWGsiQ3A4qS40c7MTeG0YNS/SRKCaYpSehLvGYUWlNg2PzsZBd7BXs/L0L7vSwq9/prfv3oDUcVJHUjy98WX9j0BTlsVNexyh9AsFrY5OOzb55bJXE606I4sVqIoVBIVqRZqdh9zga/35McMYvXk6p4cxtW49ceRG5VHppIJQXZp42g+o/w4Yo2r1IywWD1WGIiOVSFiHK9AD01DmwqTnPwIPjgo14QdXp/nOp6ylbM8HmMaQFiKuZhHxs9NgFSkFLCI68mdPqF+UrDnORQ==
Received: from MW4PR04CA0389.namprd04.prod.outlook.com (2603:10b6:303:81::34)
 by IA1PR12MB9029.namprd12.prod.outlook.com (2603:10b6:208:3f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Mon, 9 Jun
 2025 09:34:49 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:303:81:cafe::90) by MW4PR04CA0389.outlook.office365.com
 (2603:10b6:303:81::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Mon,
 9 Jun 2025 09:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 09:34:48 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 02:34:38 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 9 Jun 2025 02:34:37 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 02:34:34 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/5] i2c: tegra: Add HS mode support
Date: Mon, 9 Jun 2025 15:04:18 +0530
Message-ID: <20250609093420.3050641-4-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|IA1PR12MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b77032-a342-4b71-2d1b-08dda738e0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oI4fhRgbEgOxyGb+mvXIIeEmLsW5ZUo0Cs8Skh4hZQxLR6YyKYzkx5Uq54U9?=
 =?us-ascii?Q?AZvLyiixcmsONwZEOEdwHKs6pQFSVfUH1oYTAQvJzQtXC9yncdr/RfkZqtFu?=
 =?us-ascii?Q?dhaQjUPb2l4kDHnm62c/f5dXwP9aba1/wIYB16pVyRgc7OpfUjrbnUCTwK1B?=
 =?us-ascii?Q?b0N9QGHWf3UTukmUT3LJv4VQihnpGz+z+UrOlIpQdWxoyI+Mjt4zw/WTzKKS?=
 =?us-ascii?Q?rThx84KjKX3zYzWnz01g5cgztE33u+wKdaXam6kIyByrMoQfFVg9TF9RFfIX?=
 =?us-ascii?Q?e7CmpzbGdxXJuMVPI6r9tzI6eFbRmBSGPI4hf1cfEmnPCmNX7aHPnDT6SVxa?=
 =?us-ascii?Q?uSnJvvQhpze7IyqdBzqBYVJC69bQ31zPKWgT3F3LzNyaTiL/1OaKmDylcJrm?=
 =?us-ascii?Q?CZ+C89PFVAUr/ZNpmOihpDIKAx/a1Hs2mVILtUrgv1cYCsWGLX8LbpEB6FCQ?=
 =?us-ascii?Q?ePKsZDVE8Kb62QhR5rvZaieuGk3YZaluOYCdY7BZB6qRYvJIzynRjb0xbvha?=
 =?us-ascii?Q?VB++FkF0CJXwcE0hN1wmTSudAU3L8wdhl0EoyyL9LB75mwU3tTCdkxpIJ2ll?=
 =?us-ascii?Q?IcZAalLMBUQSFYqMk3A7QkZsdc5VkejrXUpuDIQ/tV77G8QoCiCm0aXi/JU5?=
 =?us-ascii?Q?Oh7FkH3i/y0g/3ZiXhO+agGW9qEZG+pSg7ciK1+PXvgp6VqFhBTpgaBYS7OL?=
 =?us-ascii?Q?zBffNLi2+tlqDLp5yNZHcQ/YaWQOTsRNREAq6lWcAWVCnQ81fKLgqU/I6asL?=
 =?us-ascii?Q?xdtKCnx3Mc7MNaFnBZfc6YbCDIENeA6YB4NbR42ldyG4SYgOj4M83gha74U1?=
 =?us-ascii?Q?bSnZADSNYyjRNFFylCobv+iRKwzxdnBp/uJ+82bRhK8G5gFdJqxYMWP3nY9w?=
 =?us-ascii?Q?MZjD7vyV/qPlTxIgj9GFQ68Lh0WPyGc2VW7ESRimJ/+Njtvzq0bFGiofjtvz?=
 =?us-ascii?Q?fxFXSHEz45rXyFbGmw+yG4Y3E/VbopRhxyQDNT2EOF07jX6J0D+/+hZTdUGq?=
 =?us-ascii?Q?n0iOHhlV6AbVpZhlpkFlduNguHyrpfbEO9udlEsQfDODWAjNWCaaLj+2ty1X?=
 =?us-ascii?Q?3X42rj0TpfHxMN7W73oSKyWak+BSF1n4+02g86ieO/hFNsJl8YKkcP5QuUdK?=
 =?us-ascii?Q?w115lotcJ4nYhIXgJ06U/ijrZMuLmEmUieUZEI4wbV62kEs122SP3I7S79JB?=
 =?us-ascii?Q?dfVTB/yR1tzElSacX5YSqE66fHMj4/rhf2pVuH5jirHFV5xGAL8BzjBj0N4A?=
 =?us-ascii?Q?PDC4bZcx+aIK7UiHbFwnXG5t4ggCwDP+iynDBv6gPSD8cyM9x+1KxYA9Yzrp?=
 =?us-ascii?Q?ND8JHaDyCdYH0NutC3OPU4ELXmbW+6w8NQFNk1+gsmciVPUNJQxwcgW7FwIY?=
 =?us-ascii?Q?fUdEWPUK8cKxXLnFqyEAYXVosCelHkv6ophAYUx0Hg624rIkbCLGk1EQy7iT?=
 =?us-ascii?Q?Fnq8Hk6lnRjyYJ2eh815VI0eLuvS6fs04dkLQA9MXJT1Nfb5cGTKkX/L9nnm?=
 =?us-ascii?Q?1140Ztej1jWA+Ez5+ij/djeTvRA2CIJ8H40QKIn/S/xwWqRy7De8X3gPZA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:34:48.5795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b77032-a342-4b71-2d1b-08dda738e0b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9029

Add support for HS (High Speed) mode transfers, which is supported by
Tegra194 onwards.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v2 -> v3:
	* Document tlow_hs_mode and thigh_hs_mode.
v1 -> v2:
	* Document has_hs_mode_support.
	* Add a check to set the frequency to fastmode+ if the device
	  does not support HS mode but the requested frequency is more
	  than fastmode+.
---
 drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c7237d26b813..d0b6aa013c96 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -91,6 +91,7 @@
 #define I2C_HEADER_IE_ENABLE			BIT(17)
 #define I2C_HEADER_REPEAT_START			BIT(16)
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
+#define I2C_HEADER_HS_MODE			BIT(22)
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_BUS_CLEAR_CNFG			0x084
@@ -198,6 +199,8 @@ enum msg_end_type {
  * @thigh_std_mode: High period of the clock in standard mode.
  * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
  * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
+ * @tlow_hs_mode: Low period of the clock in HS mode.
+ * @thigh_hs_mode: High period of the clock in HS mode.
  * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
  *		in standard mode.
  * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
@@ -206,6 +209,7 @@ enum msg_end_type {
  *		in HS mode.
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
+ * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -226,10 +230,13 @@ struct tegra_i2c_hw_feature {
 	u32 thigh_std_mode;
 	u32 tlow_fast_fastplus_mode;
 	u32 thigh_fast_fastplus_mode;
+	u32 tlow_hs_mode;
+	u32 thigh_hs_mode;
 	u32 setup_hold_time_std_mode;
 	u32 setup_hold_time_fast_fast_plus_mode;
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
+	bool has_hs_mode_support;
 };
 
 /**
@@ -706,6 +713,20 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
+	/* Write HS mode registers. These will get used only for HS mode*/
+	if (i2c_dev->hw->has_hs_mode_support) {
+		tlow = i2c_dev->hw->tlow_hs_mode;
+		thigh = i2c_dev->hw->thigh_hs_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
+
+		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
+			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
+		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
+		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
+	} else if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
+		t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
+	}
+
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
 
 	err = clk_set_rate(i2c_dev->div_clk,
@@ -1203,6 +1224,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
+	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		packet_header |= I2C_HEADER_HS_MODE;
+
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
@@ -1637,10 +1661,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.thigh_std_mode = 0x7,
 	.tlow_fast_fastplus_mode = 0x2,
 	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x8,
+	.thigh_hs_mode = 0x3,
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = true,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.43.0


