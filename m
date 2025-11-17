Return-Path: <linux-i2c+bounces-14117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C41C63938
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 11:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 73BAC4EC159
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E21327206;
	Mon, 17 Nov 2025 10:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gxz/zqbO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556C5327797;
	Mon, 17 Nov 2025 10:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763375184; cv=fail; b=o9GvGWldvL9O5Rhuf5jWO0QCK6NtYNtnUWWqxuxBepve/u7PI6tywVx+EpvFCXEol1YCh6hsWSrRE6VQbATpaYpoe1MsQ1HCw3BOLK3myabE+ya5me9CwZ6JPnjP1yj/QYEU+lxzsT1u2hTKxF34BJSwkFP0oszmNJHbGxzhXcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763375184; c=relaxed/simple;
	bh=Hx3Ut4eQaqyI7OiW/nRL4xMp/yo9a9jPaGq/GX+kr4k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwPBAxHvF8S/K8D6LZE87aBATeADPPqw9b0oS8N+QOFomPhBgfQsFrTw0TAFV6EX2vEB6z1lTFO/M1O8MXGu+WyLTsocig0EMJTxphKu+2LF9pJYIQJUNvSzjowR21KHjZ/81qQ5jFnS80oXRJ9dYRm+RwytXPEmOe4rzcteGGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gxz/zqbO; arc=fail smtp.client-ip=40.93.195.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jbc6pOOCQV9qYjjoooXJx7K/Om/89iaLaoptr71MEjptSznDysuBg5dmEdhlHX9AbOu+6uTUxnh5qQq5/jh4g7KbmK2apUEiQA9zrc+1x4LQQDlAfhgI57jyU8c/evcH/j5oWZ/w3bQL2T1rDIAHGOgKpgpaIz6rHUwzbIx/96O3ObR8KyMp4jkgs0rXi7vTBTZzyzRp669zrv3j+kyNh9FU62qOnJFK6ZXpqJMqBhQRpqPwQxfS4Hgwgl1UhZbttcVQTwQrdc6/aFFfvPNwwIbq5MH2HHTEkR6pPM+k9GclK9rSiO0L2Jgbe7TvpjBXuoxwq8NJs0J9CtkKdTgieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Smm2YAbQivvUZx1RzOaF+2xlGZ/gsF3WMdBD6GQGt/c=;
 b=e2igxVgaHD+715/pgdwsJUPywafW1Qde/wx30zeWiZ5S75L7ZbB8ot3UviyoWCiE3+8N53WEaX91MvyyDKdB6dBJTpWqfRkNX6AueJoblLoQTtUgZ2XLn/psjAROpZMJjGxWpdtR8P7RG7zTSVVeZSdcAP0g0dUljWdMGmknyPh+bDmJ5lph+PhDp9Y0DAKcBAak6bRdQ8Y+FFlhSJq/VvgS4RZVZXR1hFKs4QVgJ/Una27/Vvakkwb46ZR9eUxSWh7Pq5t5idxBJ4BVkrCbs5/SCJOgruz47WJ0RMK8jTpLmWk+6guoyr0rn4oJ93uFdmZX07ZjZ4Mr9hxxIFCF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Smm2YAbQivvUZx1RzOaF+2xlGZ/gsF3WMdBD6GQGt/c=;
 b=Gxz/zqbOARB2P1J9lYjsfOuOYjzfQUiimEYUGe5j9Ldb5jzvKuyt4i3GosgpSL2A0mdetj2vghrW53maUhbs+t06BJuaTF4CTp+yu3oqSTdXskxn4lKmZ77K8cGsoVThoi+/ON9SumldcbezIZTLE5ND0h+GzNFcaNlse4iOHriwvQjdm+ff5bhpx7eAVZDawa5ZRamKAxp0krtXLdUrb8Kv28fEj1u7txHF4ozzpDPzKietRYB5C0CYmLd/XulkRicL5lnqd/TFecBhQRjAWQrO+d39Xd4CFnhLnGV8x/sHYz7CwYTgqY3B1Yq270bQP0EXnD8kORPYxhZA8XpwZw==
Received: from SJ0PR03CA0137.namprd03.prod.outlook.com (2603:10b6:a03:33c::22)
 by DS0PR12MB7803.namprd12.prod.outlook.com (2603:10b6:8:144::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 10:26:18 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::ea) by SJ0PR03CA0137.outlook.office365.com
 (2603:10b6:a03:33c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 10:26:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 10:26:17 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:26:01 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:25:55 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 02:25:52 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v2 4/4] i2c: tegra: Add support for Tegra410
Date: Mon, 17 Nov 2025 15:55:30 +0530
Message-ID: <20251117102530.903555-5-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DS0PR12MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: e3da6fa8-0d01-4099-9efc-08de25c3be77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XjLfblWrB3yF6Rr5zoq+QSpbSmniaCZdI3ewMvii320kIwz5Nv9jH7R6uO7k?=
 =?us-ascii?Q?GHfoCaIm5Pmd7YeXNfwWbAlb8BeTP+t6XM9yjcFGg8EdtNgh3lCTB4LxFaN0?=
 =?us-ascii?Q?+REBm3W+fiLB6F938oFXZm2GVzQsGNUXeczVrDgY8yoUrWRe/P0ue2NKwq2O?=
 =?us-ascii?Q?bGlVouS8vkZpU7+WPHMQMaZZxamN0i2iH09ruBCrkswoRVHlVJuqNYyfscxe?=
 =?us-ascii?Q?XmrMeTO2RmJsxQJY6G1zqJtZ5lulrYp0Eyy5tbBm2RSJX5Sg5F1PrdOSf9eG?=
 =?us-ascii?Q?5LCNkJxY3/Y/qbbHTJOzBdwp4QFUriwGZedrurG56uBpPu+z7TXQQMHfiyl6?=
 =?us-ascii?Q?PDtor6p0FLZ3noy4kKt1dSjYOsN3jv3k+vg4sPc6eHNFMV20OQHXDK3tBZKy?=
 =?us-ascii?Q?xsPWHOUtyWW57Y5DaVHCKw6YODMF+TC+bYqxgXsFC8T8s7fETOrWV6MCC4p/?=
 =?us-ascii?Q?KTDW45ER5rIoRSO5KZ5MGLpHjfAU/K1SuMiGuMGASeAPNTERmK9FC1UW1BI0?=
 =?us-ascii?Q?Hq5Y7NbAG3hA8xLLrLcFkPzu7bLcXkTq1QlFAKObs6I+jLI3dsBOl9FRA7Tu?=
 =?us-ascii?Q?0RmSwJ13uzdCCs+YeG8HamoUTbNfv/+/tA+8/Y/y9T+5KOMxiHDOjvkzH9S5?=
 =?us-ascii?Q?rSRBmwWRBhT1+j2GHynhbDuF/MarnIgP8EbSWUxOTyY1VpCmiIfcZVntbeu3?=
 =?us-ascii?Q?ViLaaYevHyZqSMjsoZ80pv4ss9sLEzX2f1RJ+1hikyd0iR8hmzpYS7MaeCHY?=
 =?us-ascii?Q?u39NZfSDaS97YWl60QTkwaEirHMxIYAG5VejDT6pYM2MVX5i9mVDrz5G9Q62?=
 =?us-ascii?Q?tWW+s5sy3q6VPER6LxyJRtWvIOxsg6GK3bX5GmEKL1A8Yi9lZN0cNzoybp2m?=
 =?us-ascii?Q?PJ2v8YamkanjN77jmvKL5jUO4HBeyJAsdkh8l4sLVkR1VFedn7S1KmncDt4p?=
 =?us-ascii?Q?2G6TAh/D4Z4Z+p+1FeIzjhh/jyykwElT73LWe3TzZ6cljHcoNi+kFxiCerTC?=
 =?us-ascii?Q?8gv1A282KQRz+I9W/SyrSJZleB1Q+8Ciw1zSOuQgx3YLLIi2dohyUmGR3hIN?=
 =?us-ascii?Q?NL1ZuP32/n6d/VrD2ukFSYx8x0VKgDRe7zDZ9unU7k1XzWhwknyukaXWYEKx?=
 =?us-ascii?Q?aLhteulj4Sx7FUsdTKaABFc9kwofPnoPbLJg/2Rc3wP8KpTSt1FXvJt9W+8j?=
 =?us-ascii?Q?HmFUhM7/XwCpNr0Mw+scWvIyjPooaGh+HGyif7hQ+tEZas4UK0ZkQcl+DzeX?=
 =?us-ascii?Q?xOea8juJ30Cb5aAdmHQTIcKOXG1tNhqPuG1SxUL7l++YeVw3fZjKpl/swbe8?=
 =?us-ascii?Q?IuyMLDjF8W2qEL2U8LBQ5YlZsRFYXiApem399hb/gZT8oumjDQvl/7shlZls?=
 =?us-ascii?Q?yvd3704uZqO87XvEQ3j70UjW2MhmBPp0Y4uT2xI5hloGNt9R1SsG1TF/96/t?=
 =?us-ascii?Q?NWFB774lcYhpacJjJnM/QU8Nye4EVJA6/DLI14H+04CWHDST1HlX/xdbGFYF?=
 =?us-ascii?Q?mo5AzULqP+ultI4JQLdr9N091ua96qmtlwnYs8/+BaVlm7uWb6dTINlrhWqe?=
 =?us-ascii?Q?e4L/5KRdxUDIbBNnfAPsBInTtj6BrK2e2zBKRlN7?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:26:17.5978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3da6fa8-0d01-4099-9efc-08de25c3be77
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7803

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v2:
	* Remove dvc related register definitions from
	  tegra410_i2c_regs.
---
 drivers/i2c/busses/i2c-tegra.c | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b571001b90db..16813dc72bb0 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -277,6 +277,35 @@ static const struct tegra_i2c_regs tegra264_i2c_regs = {
 	.sw_mutex = 0x0ec,
 };
 
+static const struct tegra_i2c_regs tegra410_i2c_regs = {
+	.cnfg = 0x000,
+	.status = 0x01c,
+	.sl_cnfg = 0x020,
+	.sl_addr1 = 0x02c,
+	.sl_addr2 = 0x030,
+	.tlow_sext = 0x034,
+	.tx_fifo = 0x054,
+	.rx_fifo = 0x058,
+	.packet_transfer_status = 0x05c,
+	.fifo_control = 0x060,
+	.fifo_status = 0x064,
+	.int_mask = 0x068,
+	.int_status = 0x06c,
+	.clk_divisor = 0x070,
+	.bus_clear_cnfg = 0x088,
+	.bus_clear_status = 0x08c,
+	.config_load = 0x090,
+	.clken_override = 0x094,
+	.interface_timing_0 = 0x098,
+	.interface_timing_1 = 0x09c,
+	.hs_interface_timing_0 = 0x0a0,
+	.hs_interface_timing_1 = 0x0a4,
+	.master_reset_cntrl = 0x0ac,
+	.mst_fifo_control = 0x0b8,
+	.mst_fifo_status = 0x0bc,
+	.sw_mutex = 0x0f0,
+};
+
 /*
  * msg_end_type: The bus control which needs to be sent at end of transfer.
  * @MSG_END_STOP: Send stop pulse.
@@ -2075,6 +2104,40 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.regs = &tegra264_i2c_regs,
 };
 
+static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
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
+	.tlow_fast_mode = 0x2,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x2,
+	.thigh_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x4,
+	.thigh_hs_mode = 0x2,
+	.setup_hold_time_std_mode = 0x08080808,
+	.setup_hold_time_fast_mode = 0x02020202,
+	.setup_hold_time_fastplus_mode = 0x02020202,
+	.setup_hold_time_hs_mode = 0x090909,
+	.has_interface_timing_reg = true,
+	.has_hs_mode_support = true,
+	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra410_i2c_regs,
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
 	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
@@ -2385,6 +2448,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
 	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
 	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
 	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
-- 
2.43.0


