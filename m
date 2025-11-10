Return-Path: <linux-i2c+bounces-14027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247FC4550A
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 09:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 075324E905A
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 08:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA392F83DB;
	Mon, 10 Nov 2025 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p3FJHvtv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCCD2F7AA4;
	Mon, 10 Nov 2025 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762761954; cv=fail; b=b/sLqCPl7chnXOvE4NB03qtg2lmG07aeh7XDLJtLwkqnj2oqYZ+yv3hKvSBnI31930CKkphxGmf9i4jHOvrWrDB+BhoGAatE5SYOA1Um4oGKOAJKod7/jsOKb8FpVVM+Ys9sTVotZ+OiOyDkaL+3Zw3NqTnLN2j+pKerFmssieo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762761954; c=relaxed/simple;
	bh=NdiVk3HcJcB+aZ4RqNl4Ttp99MGe/C8+6Z/Men7J6Cc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=keE40ABZvkn5ok6ohhLwdJacwEhGXOTuqEc5H9AodAP2TpwYbxi2HyOrsnpqCJkreugCk6GH/ilSfIuO1CuHB6NGkgbl5xFuGUosMWiunXMyx/rZWM9nnxmmsZJa4HXaz6JQwvPR5ofpU9rwUVgvuKW7TVA0plE94hSogrqgTSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p3FJHvtv; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6NLvEF5ekaiFAGX3VQi7eP+9IJgdQW/1iGS/zIVCh+QlA9D7FESl3BZGQxlieing9pad6rd4IzHBQrQKf30UbCvJwozZUErE6+duF6Syuz1T6WSMmi51RMQKABDd6XHohG99PnI2DaxuUwSbghlAG0ZTOX0rpOc+hKR+yGOLQ3rNh47vZUVG2QZ92eFwZAA6ZcDoUni2j9Bw2QP0H9MkSYOAJIIL1/5N2I+RGNtlmEhIl9eCQ8C23ZY6D3/3Luui7Hhnj6GvcLUWzAsOI1zZYc2BRl71AW+PB8+rlgRmbpRbNE1jOUU3ODLp8nz7emmABIPAe+4ocxA2bTR2dtXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdA+8xOj50zMaQFD/av5KMSWDjJAXmEXk1TfQ5ZiAAE=;
 b=QVJtQsIZenTx4Pmk34xDcluN9ywnkpnDS61uVj+HR9XKOkMMPzWxsUIW9W1pzpTyMBAzCF7NHIlolteSyZSnhFOybfAmGxEl7TbcfsbbHWCa86U0XE2Sd1+4ARHhuMknz4725cplKw7iembjIfYvnuVTkRxL0HR+AESG5w+aHuD2IfEq5d2OlcKcHYP8/f9GoAQwGGSv3zz+qvsAIPnPa7x9TBSgOmRmCUu7R60614ciQa3EuDOz1WV7Ey6VbvwlMcbcA75d0N11conMqCGd6LT/LHh7rlsYA59gy/42ilzLKInHWpwtMfU11WWvDP0wFNHESAYOsBG+JN63GWrsiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdA+8xOj50zMaQFD/av5KMSWDjJAXmEXk1TfQ5ZiAAE=;
 b=p3FJHvtvuYP7YC7+Y8/Hd5x0DiveLA7nbl/cfTXzTQIvfTu3WJkHDqno19YYho5bgmJIJ6z9QzdjjyPyq91qyklP8K1AJbXBGWwZgSkgDI2C91rHtZRGiEh5/Y1XMY6gLuQ9sBnm919wIxAB0h+qZ5bqEadBJ6xyDobKyrpJYvrONtu/RfWTAt83+dwVIlbdohIQ0yDB7RhQGWl6C3M7oEelrKl9rJCDshaQU8OxKAJu/+DcqG+R29cTt6AQIq6QPVRolZb3ETEamJWhT6OX7nETD5IV9GRDa5ESwNogrnnJwTDelo2eeJMEUIt9Yv7nJQQkdcD2/gudaH6+UpbjdA==
Received: from BN9PR03CA0218.namprd03.prod.outlook.com (2603:10b6:408:f8::13)
 by SA5PPFF1E6547B5.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8ea) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 08:05:47 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:f8:cafe::9a) by BN9PR03CA0218.outlook.office365.com
 (2603:10b6:408:f8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 08:05:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 08:05:47 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 00:05:31 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 00:05:31 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 10 Nov 2025 00:05:26 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v10 4/4] i2c: tegra: Add Tegra264 support
Date: Mon, 10 Nov 2025 13:35:02 +0530
Message-ID: <20251110080502.865953-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110080502.865953-1-kkartik@nvidia.com>
References: <20251110080502.865953-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|SA5PPFF1E6547B5:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db06699-1117-4afd-239a-08de202ff4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o/sxR57ldoczieVdfkY17yy45rLpenvqWLuA+EJRoedMqRwbSCbzS1NrfqLY?=
 =?us-ascii?Q?+l1vcM5lj96cYGr4WOrL1JT/pqTFDhQZfSkMVv5nouP6Z5Dtgj1+zdEADI9x?=
 =?us-ascii?Q?peZ5fx+zNHZpo4G6tCWkI+m1ItOJ7XMs5A3xw0rGFMLaozEJGC4ly2XvtBvc?=
 =?us-ascii?Q?ePuuRlfQjDd/Z5YSQPAveMMRbmutmg7t3snRQ4PKsAtTef844Mze59OOn+14?=
 =?us-ascii?Q?NhzQOf8gZR0fE4uGbAkuXV32XQ8+nyoh7yJaavXu3yt2SPhmsrYuX1185E2j?=
 =?us-ascii?Q?IX1iEGe1w8VPcx8Ik1Zk1al7UWhy6z4FgRk2J5odK4fJeMi1k/yaBqhrfJDD?=
 =?us-ascii?Q?F9c5rBTihwgEufeQfvO/FAz+DcdcmWDibK+7EyC2s1PgfsSwwdkC/NSNxM7Z?=
 =?us-ascii?Q?croIHDg/jJ/2nvQXKRJERGyF8gzXIfWZ14PTuQubLl9i/V53h0ixmC8Y65VV?=
 =?us-ascii?Q?k6cBB319MdomVkhxmLWEMnvmY2r4IdPngCEU4DsYVWCB0j5aI2dP2nquKZ+3?=
 =?us-ascii?Q?4Pgfha+P6cJQMB9U2BPnado1P4b90hEq6IhpZy/zCin8tdHplkBTfZrLh5tV?=
 =?us-ascii?Q?R0NV9zPO7TGd/njr7DNMGvXA/gyOfCHknBLCjURbS71ldFDDmb827evEJRy3?=
 =?us-ascii?Q?qa+MEv+aygHjfa8za1dZlVa/sBIaf3mr91+ln84Hb2kZ277+GvTj/8jZMrmW?=
 =?us-ascii?Q?Tg1oiEnuF51ExaWu6AZZpnftxrcoWnnUxtRe+R7aq7M+nV7oLDtjCUol17jT?=
 =?us-ascii?Q?+5OatQOjmG1AY9A4iwKfcmev4oBhqo1Nmh5uKSoThLVmBpKWvfP7UNJTrWYW?=
 =?us-ascii?Q?amENK7Qak0ySgXJMOvHNPk4ND7qt1o+7A2V6TyVCGocRrktlVo0nq/zKadY7?=
 =?us-ascii?Q?kGizFdlHsWvn5ys4SR9C6OiKmn+lAek+DQQS4Y5cNL9v7epN++pQAMlng+YU?=
 =?us-ascii?Q?DB9uSFVnXr9VniLp8CdktzaeGJV4WN6ag7PzFSRuHlTaEb35CNj/wiFbVM42?=
 =?us-ascii?Q?w5hPGHHXPGdmyhJ4EWg0pY3+PNxeMBMppPm0tutV4HUM2TuT59fM3ng4CEkO?=
 =?us-ascii?Q?M3QP5mgzimoO6oPtIwxFUXX5A/xfWcSWfeb0pLMpPd8UNbED2fBq9axE/tBO?=
 =?us-ascii?Q?BaWjuq/IqQHOOlJfvW1BVmNBkz0FkaK7MUNzk8Y6+DyOg8Xo1v9C6a/dJ1sH?=
 =?us-ascii?Q?b92IFrsfF3OSkZ9egXy4hXomcqzwMHzkxDtwtlkEWepY/6ykr/bQAOUDDmhh?=
 =?us-ascii?Q?VjH3wd4RvvJ7AxwsPkhzypLL5UE01k12oaaWWOjasLDLmaDfh122sBvPjeHk?=
 =?us-ascii?Q?xbJHxlvlUrz0zGqJgv2cxLbQM+9i+T24VnHgZc4oyz1xRZX6/9J09+VIWmEz?=
 =?us-ascii?Q?n2AF07mRj/PW1EiGRgDJ1Wb9M0lhOPtXQGbJ1XpPQsK5qifavHF8ft21lG5U?=
 =?us-ascii?Q?xskU8X50ncQjoMXJxIOB57fFMBSAwBD1c3xoWlO052YN1Kce0yPkYQWYiHQC?=
 =?us-ascii?Q?sOJ5VoehWRnGxtXqc9z1EK951gekFQglhnW4uxxvSIRbGWPMM4JeXwi6pMhm?=
 =?us-ascii?Q?s7tAD1OIEdahp2pQaXW8VFOhJ02m6y+rHzYXVk+X?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 08:05:47.4522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db06699-1117-4afd-239a-08de202ff4d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF1E6547B5

From: Akhil R <akhilrajeev@nvidia.com>

Add support for Tegra264 SoC which supports 17 generic I2C controllers,
two of which are in the AON (always-on) partition of the SoC. In
addition to the features supported by Tegra194 it also supports a
SW mutex register to allow sharing the same I2C instance across
multiple firmware.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
v4 -> v10:
	* Set has_mst_reset = true for Tegra264.
v1 -> v4:
        * Update commit message to mention the SW mutex feature
          available on Tegra264.
---
 drivers/i2c/busses/i2c-tegra.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3513bd5c7c5b..9c25ff6ffc9a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1808,7 +1808,37 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
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
+	.has_mst_reset = true,
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
2.43.0


