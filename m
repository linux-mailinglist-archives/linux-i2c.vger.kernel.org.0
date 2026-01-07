Return-Path: <linux-i2c+bounces-14944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D1CFBF2B
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 05:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAC8230B8CDB
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 04:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190E7265CAD;
	Wed,  7 Jan 2026 04:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZtAVl/xo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012006.outbound.protection.outlook.com [40.107.209.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC8B260580;
	Wed,  7 Jan 2026 04:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767759915; cv=fail; b=uhe0KeGqtGbo0OyC0JlAReOWMxZH9YRTJPsrk2OfM5Vp5lq+7KJw6kKDVrxexDXDMmcmdRnyd1k5ctRKCzpuwvmzAYKnL790ctiPiTuIWENIJ57gpeNpyqLJ24DLOI6QeZKVS9a0Y4VhgUC8/Pc3zT6BfXE39k5lwxK+17Of2TM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767759915; c=relaxed/simple;
	bh=dNdlXkqRKFOtiNUZcu5BwNeuwLnjIVdDKT9tv4AqaII=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nmr9dvzcScYvigu1HCT8jis1zbp4xhYbef24pE3L+fGrWfes1lckreYUywchTqSxGn7I6KsCq3fCrrF8ACQnXIx6tKHtuvA/kvWOAc88Pb4I0hMf30bffWB1PjV2lCBhaG/TNJZc0KaUU2Pa6OFF915KNG3xnFT7r72fFu4JjzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZtAVl/xo; arc=fail smtp.client-ip=40.107.209.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sux6RTZ3nOsJAWlbWrmtD/zX4nK3tLjLsa1Ptsxoh2cFYRUesNMz/JcM+QcjGOIgXHoJNWC3te/C3uRzyBX2cRzCd6/O+srzyaAS6ssmJ6PTkRD9x12JY7wDD7OsJzutssdIWToFKtazzumsxMi0x5slGrNQ34MoxP12rXwGuZLYiKeS7zEfUKJgaWRttY0Pn+siO64I7y75DNgwoCFVF/CDq6R+moGU38JMwJx6iHF1edTKi/p/wN4j/0c8wOP0Bz/jiVgbzuwZ4dR+B36ifGoeyqhY1S6qRxAzjx/pBZh0AKi45gxAhxy9/eNQXz/qE0PWx5Prx14HKa/PWNNZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnreN382gAE5kVrvSf5ciyrujyc0uhQWr/Y4NQryQ4I=;
 b=j7YUQoavF6Z3gtIDUqEUy8BU81BW83zYh+Cjnj4f1t76B+3IDLvfSEnPVdVSBVJZk0i53XwyD7RY0W+gb1/EUXYvc+eitBbqTHtDVU2TFvGxg4ecnONS5mkfJXioXY3tiOqQxw/9b8ZV+umJhaCVR4JIzmU4VweD6DDV/kDnJxokMT3JwcO6IVpcGCQsjhJ1n6Y7ZYdNTmMZQQ65IAFWsrS61O0f7O1sxOS6E59P3rO9SXRfjtUmoA0DnxGyDqClhtkxnb3NPgitJpIJpgwM5CQyUYtlwz43Lp6mIMjzM0EvannhNq8Qk21m4GeyMBv7uxurFaiIQOZXNznqvqDLCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnreN382gAE5kVrvSf5ciyrujyc0uhQWr/Y4NQryQ4I=;
 b=ZtAVl/xoqwFbTP0O0j0QrQU5pFwJh/pcwvOgztVHADeyBaVUTKgHdPlEYRjY33CAsJ8mOLFoStzRbVCDTu68I6zJPD41nodacvA2gqCWYaBgcxZGzeqXAOI7U/nemEiNH0whRhwPDmWxydRi9cA02BMcxxyXgLbWUP285Ks1RnqV8cJPko2yhL/syi7sf+h80vqaWTZzFGWQJ7yQDAqIAskMENNHO+QE8qsHoNBZxi4SpWofCNOdY47CwkpPP3fFuQs1Uz9BYugQ1b4/o/WPAx4EwffCI1RwMlQqLWHNr+KIA/9ruTBHv3yDH24gOhn7gTh0r89xOcXbdAZmG60Xsw==
Received: from MN0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::14)
 by DM4PR12MB7695.namprd12.prod.outlook.com (2603:10b6:8:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 04:25:07 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:52e:cafe::8f) by MN0P220CA0019.outlook.office365.com
 (2603:10b6:208:52e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 04:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Wed, 7 Jan 2026 04:25:07 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 20:24:56 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 6 Jan 2026 20:24:55 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 20:24:52 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v4 4/4] i2c: tegra: Add support for Tegra410
Date: Wed, 7 Jan 2026 09:54:34 +0530
Message-ID: <20260107042434.10587-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107042434.10587-1-kkartik@nvidia.com>
References: <20260107042434.10587-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DM4PR12MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 27925976-abb3-4a2f-d3d5-08de4da4bd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TaGZvVEfcMrzPCpAUtolXoj4POBxsgeWebZ1EVhmkyVtYmSysDbu/LkwGcz2?=
 =?us-ascii?Q?M5sRlChYgFPRI0fOzadkA7C9TEKkRKa/lYeOffHeaqEvcRPq+J2UEcu4jUh0?=
 =?us-ascii?Q?e2Z3ZOBEoomNTwWSleHzM3c5dHHKlDutsaDL4vZBiYiEoYhYjoIW6hNKCOmY?=
 =?us-ascii?Q?/FxXWZz8HsDU8uFMxIfTrPY9WgJgFCByTDwTGMpIMAUGBKOMzDBcF5ZESWdi?=
 =?us-ascii?Q?2pzkPHCLwubhIKG2ofCaOqPq61BNioiVZurG5HjG157n6n+pQpgkfSsErVKg?=
 =?us-ascii?Q?YFXtaHwDRQTHQA+2XrkwnfralaMJNg2y5l73IW4keBKbGTEdVHSSHRZSD1KB?=
 =?us-ascii?Q?SebY4fGIo42nTK4S03bSs81wtVr6DteDkVyQYYgY1yLpM2vSKtpAnFGCVnJe?=
 =?us-ascii?Q?w8k6BUvE0kfxEqIsiqtabMCEFSJ29KbUe5yVP5cLSrmizzFUzh2pE0S1rdeS?=
 =?us-ascii?Q?pvc6XgzY4B84ODJFT6qAYY1KDTtaNJaXlX4nHUuGbYCx9JHuM23nQjSNHxt1?=
 =?us-ascii?Q?UMUXWtauvE1UGpI7WLjGdqFYj0FP98tnCPD0cDNKRZ5E/gc0jkUnY+8ahlWi?=
 =?us-ascii?Q?goyJ3sPN1F3DfnJdLArNJRD4lw594+xc6A/AF+A0A2xdr+QpPWdHwmcMiIZt?=
 =?us-ascii?Q?DmBQ1qlOnyzl996fG58VvUDgUwxp99VEvQu30zszKHD6GRYo1WkL3iqVyOaB?=
 =?us-ascii?Q?yZUj7BZdWDY4hKhoUC5HdTFYOaqz9O2WFGQSiBEPIvHLW5wFdkjklh+sqr0J?=
 =?us-ascii?Q?YtI973WG7/c9iwyx5h4Bksf2pzhbGj7JSyYNvBGi7FAHXoWw6GX6Md1KSlDL?=
 =?us-ascii?Q?6FHV03i6zdLLylss+ie+bYdW2O0NRESqsDcwdYFB5/Po5ekyHXqHJCN1QESd?=
 =?us-ascii?Q?cJIsvN6er6bVF92jDfqIQ7NqKW5YAhumQeBnHMH6K69F0YbRdPMtybwYHZsE?=
 =?us-ascii?Q?/49n+6ojIomawgs/A3eC46z/8e6ReW7fLNrvDqyvzL5PMDK6ALw8pDwWzGL8?=
 =?us-ascii?Q?oRfXHu6BNOYN0vt5cgATmcl3mlQh2B563BkVdbiaB08BvG0ngDeuhPFk7OIR?=
 =?us-ascii?Q?FdOqR6p4sa8h8cO6fVbwGraWlkBJB6uOlaE0GxA7LFClNiPP6q7YsxpXHwjW?=
 =?us-ascii?Q?JQ/RdKZ//+nktNRFz2wc7wr9xBMQPD9TdFAFRZH9KmwiUpqlk/Nh9/k/rUOD?=
 =?us-ascii?Q?1oJi1mumF18UUJ54aL2A5PbozOvGSfII1Scc1/auZhrPyyC1gp6X8KyUbZVw?=
 =?us-ascii?Q?OzIO2vVJMu07x80zkxtJmmKxcO1i7eoQLz8xevqgufm68eN+uguQfkz7b7Io?=
 =?us-ascii?Q?tGb+5tMiJeMo37O4eppbtFOlCfoUlIXBtVMGrb7oMJUbBvWKy6l5lsUJV/tr?=
 =?us-ascii?Q?2NUu5TheSb3gZkGb09Uep2JGJLQZ60QO0Bd3mH4z+ys4tfz+GCCuBTHut/lP?=
 =?us-ascii?Q?z1t05NJ8qCUx2bWk7DynVpvsDf6wQ+YYV69usc6nBl9QFUgC1gzvTOdgyZv2?=
 =?us-ascii?Q?NCYWvQGSpG/cryDvh6yCpMRCdYd4Ofe+uZSQOb96PeFDzdeV29BKg40DZdYD?=
 =?us-ascii?Q?nAd7aRYKaTp42XXUvBMUFyhcfigWyn9CH+HfwC1a?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 04:25:07.3870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27925976-abb3-4a2f-d3d5-08de4da4bd16
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7695

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v3:
	* Updated timing parameters for Tegra410.
---
 drivers/i2c/busses/i2c-tegra.c | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 821e7627e56e..1056b07a28d3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -280,6 +280,35 @@ static const struct tegra_i2c_regs tegra264_i2c_regs = {
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
@@ -2081,6 +2110,40 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
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
+	.tlow_hs_mode = 0x4,
+	.thigh_hs_mode = 0x2,
+	.setup_hold_time_std_mode = 0x08080808,
+	.setup_hold_time_fast_mode = 0x02020202,
+	.setup_hold_time_fastplus_mode = 0x02020202,
+	.setup_hold_time_hs_mode = 0x090909,
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
@@ -2391,6 +2454,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
 	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
 	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
 	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
-- 
2.43.0


