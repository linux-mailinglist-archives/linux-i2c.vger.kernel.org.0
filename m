Return-Path: <linux-i2c+bounces-15129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A031D1A80A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 18:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB5853097D52
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAB3350290;
	Tue, 13 Jan 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QfBESajF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F0F34FF6D;
	Tue, 13 Jan 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323624; cv=fail; b=Z1Bv9oON/vCd+fhpky50k7z3Xqg6iT48e6meNsH6wQ+earGXRGYSgX/V/HgbF31G72tdeTI1R5TksUD+GxD0hVqMV7Yo2hobA24TPFLlwailbHHE/B2FMUt1hsTp58xtua+Pnv2KQgmzlBQEscK3o1hc3DS6LI4EmfE5sru94ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323624; c=relaxed/simple;
	bh=f2R2k5cmWEhLyix1DI8giq9Bjg523A9Agm/fu+NkqIA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQ++5IVJyt8W2EMW5gzG7ZFk0SsfzF14dwLPZEHvEwpU1MRN1/qHV8ZlHsF4qVk1LBEfFd5e+++tRpUlkNZVoUIX4zynUlE3hQw29CefNvqDWr9e7hc3MRk+IklVlAtcUIl9jAO41rR73lX+0+0mtwCDQdraMvpYndeY8lNpSX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QfBESajF; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzmEZlOu9jKBr/PnbMH6Ix0W1R7lWvx9YnjSB61Sb4pGtteYTov5xGJyt0JtVNlBYmiznrxPiPbW6mNK+wBbN83BfrVzvZgZA1lyOpvhITxyS9WjIbXyL5ZHsS3S7l2KxNE7Pht0ZAlSF3F8RUc7/LyRRSH9Ky/KHKunIT4eIGr3HFaRXVF0DzII2rdc3hshvChC8uX9yZY8+QV2u4bl55P9Wp4Ems7InfsQp+L4AtwIkrkZGlvlmr9SMYOIMgc7mzv5ZhPsFZpqeDwj6Ow//ctGaMuIXR1i75LszS35rhsxE54PXGplCucetL9nfEEwAVYSWjQgTrXQD9D08Tatzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RJrI1jLUErYp4wMS+w4UZl6N0DX8gBDJSWuKwNHRO0=;
 b=ZyaHp+btONyeGzM7Zss713k9mG4Uted9UH3IABK53Q7KOpoQle+QwkUABl8svlD6vX6Fjv6LGZvTdU30LP0VntQoxsVoUzSiBMOF14jYWL2i+vgomg4Wp0t9a98tL3qlSQZJGSlhXWYbsDO873AfCDZzD0v4Z8iYpHwMiJareAthWm3iQMo2QwomVkxa0yU4rqzO/TeiwsTxSzAfj7gvvYCIY9ANUUc5rcgyHzZ/20ZMtaduODcgPxykVUlB5ZAUJe5iPkTBgsKbay45D7Elpd14xW7Do5v8hO6MZPTXo45ihOaJBV63oCAfeWacIk8NHVkZttUPi/jquTdIorLXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RJrI1jLUErYp4wMS+w4UZl6N0DX8gBDJSWuKwNHRO0=;
 b=QfBESajFMP+t9DgVeySeaGnJnNLgQniKvgtxQ1j1u1W6ch1ZkDsSNs86nPF3JzlgU/IjmFB4gSM0w3RXBE5c3KCq2rI6Q/fGrc2xeLGaljg7IJyVCVzhDvyqt3s4GkIj+KopV5vByXGR/7vAZTWV+ttsli6eO01FM/6TKsXe63hYtvhIamE21+ysReorGlD2ybhvGbVIp6qO6v8ICrfvsuJZyb1y8OOd8u2YQ3WV9vhouSYefPIzXb6x7r0Kpf5cg7CzlnWYJKJgEzEXydSeyV8MV0t1/QPmdbKzjAvuewXH4EJBWwQMWCoT938wtmuV4JMnHy59yyrkupuajSHV8w==
Received: from SJ0PR13CA0084.namprd13.prod.outlook.com (2603:10b6:a03:2c4::29)
 by BN7PPF7C0ACC722.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 17:00:17 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::cd) by SJ0PR13CA0084.outlook.office365.com
 (2603:10b6:a03:2c4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 17:00:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 17:00:16 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:59:51 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:59:51 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 08:59:48 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v7 4/4] i2c: tegra: Add support for Tegra410
Date: Tue, 13 Jan 2026 22:29:29 +0530
Message-ID: <20260113165929.43888-5-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|BN7PPF7C0ACC722:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dff17d7-f97c-4e72-2534-08de52c53a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ts+cl835blwnQZA3AvaLeD5cMhZLFM4bH7FXKM/3We5R+/3KRTQzET/l0iNS?=
 =?us-ascii?Q?win8Bq2S4wKo4aKp2xKJpCFNmcNHAw3mF5w/a8Dqdi5XGU3zif9/Csg59dIc?=
 =?us-ascii?Q?XqixHdgfK6hEY6bOSMY1pHpSHpYpsV37UOqLPkkETSfjyQJLPIeqbVqQ14PS?=
 =?us-ascii?Q?N6U9FECHLIuTlsonxh7MMCtEDBFu1t9N2QSm0iiQWanSl74BgMWo8wwjZuq3?=
 =?us-ascii?Q?fJr+rg9gLa1yOa6cl7+G+b6PqPqY7nFZYlYEvjo5SyPI+l7/K3+wrPMwRMLW?=
 =?us-ascii?Q?Cp7DGIe9/xzAmwoxmyCzXj2tP15hxFcettjg8JMT3Ugac/hClHXZkzbb/k6y?=
 =?us-ascii?Q?dwBzsA3h3s9DYU99G6yRVNo50uwjJ9+99bdUBGUKjdie9KyQM8snYvOjG4qp?=
 =?us-ascii?Q?tpTImAwOBHiHjiZ26Xyin7m95HsAWVxgFUrgluD2ySwknFo9n/7mpIEYugnS?=
 =?us-ascii?Q?cqCqloCwplZjleR+nlht1AOldwg9id2CC1kxs4lW9GeNjSoNbWPHNNlcnt0N?=
 =?us-ascii?Q?iog4Dfv5+Wtt7M20zks5ukg8JMdWmk+pW3AQVD8d+UsK/bDbWr5qfPD2gjpp?=
 =?us-ascii?Q?BgBJr/iDP/2xcU4x363UScIHuXhuFcQh0M0/qbuXJkHxOfh3zNK+bQSo4YmX?=
 =?us-ascii?Q?/y26E8xG/TiKxVx68QS9w68UqmGpsZ3JQujkaq3jZp/cqldQf/xJceZrC8De?=
 =?us-ascii?Q?Q1rBm8GCNQBpWcM53IhlZDi4TP3BMnJl2pirh8ZBKUBCeJc0xIV7PwiXhzo1?=
 =?us-ascii?Q?E40lyQhL+R70gSR9V+ePJP5GtZGdUgMCavKuMbsB0L2yDnqaOhccO+D0HWs0?=
 =?us-ascii?Q?vBuTz2Vf7rruFLdUkKnWrss3Xd3qtZ+w1kB210LjtMWqgxKa/TrdDbb7nY7p?=
 =?us-ascii?Q?SxkW6bQBTfMcWmk7CkqPRDvX9HgPuNb3E1xrvNQxGiCbgvo33rYeJKXq74g0?=
 =?us-ascii?Q?NUi+ozIvmvCGLdiVQ43eMHY2TZQZsr123EfpnrhEtPL72nZKEGIhpasNcbgc?=
 =?us-ascii?Q?T6i9Oh0lNtLwoFsU1OXTyDx/b8ora5eJesKSBkEvgaJsnK5+EN/LerbfKoMm?=
 =?us-ascii?Q?TAXl/80z+Y+qAVfeWefC9bpEIee/BsBJzZVjvEx6RmfUceHccpeZn94TsC0w?=
 =?us-ascii?Q?bX9bg1Y9gggSRB6Ch4UIaUBzH5roQmr96EtjwGPOQTi3F9e2B6OlB5iXaF1q?=
 =?us-ascii?Q?1G+cB5FR8w713/T0Vwgj3LNZyQStPmEawlpSVG+N9RYJZ0fciIt0KptcY2S5?=
 =?us-ascii?Q?Ze/jLPpI001pqzuIKit1YxSg8srgwprzNalI/3aZJHm3hcxEBTho+G0U2b8i?=
 =?us-ascii?Q?Xs5TA63nFdXtcUrXFc/xwXmYbb3vndZHKX4wuT7RzM8Or+gc+SXaj9Sj58ZE?=
 =?us-ascii?Q?3zDxbcRdrpjZf3fInaFEE4KG9dKCniGy+Du5ZQIolbeBtSzdLciWU/ClpaxF?=
 =?us-ascii?Q?HS3tII9L3zoe8RaFAoc2iub7j5ZrURnQtdtfJl43zmYlBfbRPUzw72/V4x6K?=
 =?us-ascii?Q?a+XzylmeSyTSrHeFqtugfYhaxdrePfooq/zxmiu5IiEb3mZ/5ucaE18EtoZ5?=
 =?us-ascii?Q?GD9W/yfr3m0dSe76w9Au/MyrPTBKsbrlCaHJpTHG?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:00:16.9429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dff17d7-f97c-4e72-2534-08de52c53a27
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF7C0ACC722

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v3:
	* Updated timing parameters for Tegra410.
---
 drivers/i2c/busses/i2c-tegra.c | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e9d0a5c40cd3..0b75e396e69b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -275,6 +275,34 @@ static const struct tegra_i2c_regs tegra264_i2c_regs = {
 	.sw_mutex = 0x0ec,
 };
 
+static const struct tegra_i2c_regs tegra410_i2c_regs = {
+	.cnfg = 0x000,
+	.status = 0x01c,
+	.sl_cnfg = 0x020,
+	.sl_addr1 = 0x02c,
+	.sl_addr2 = 0x030,
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
@@ -2082,6 +2110,40 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.regs = &tegra264_i2c_regs,
 };
 
+static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x3f,
+	.clk_divisor_fast_mode = 0x2c,
+	.clk_divisor_fast_plus_mode = 0x11,
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
+	.tlow_hs_mode = 0x8,
+	.thigh_hs_mode = 0x6,
+	.setup_hold_time_std_mode = 0x08080808,
+	.setup_hold_time_fast_mode = 0x02020202,
+	.setup_hold_time_fastplus_mode = 0x02020202,
+	.setup_hold_time_hs_mode = 0x0b0b0b,
+	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = true,
+	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra410_i2c_regs,
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
 	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
@@ -2392,6 +2454,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
 	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
 	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
 	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
-- 
2.43.0


