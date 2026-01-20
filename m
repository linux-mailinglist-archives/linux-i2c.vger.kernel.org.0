Return-Path: <linux-i2c+bounces-15279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 715BED3C38B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EACB9521A59
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DB73C1FDF;
	Tue, 20 Jan 2026 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cY3H8m5C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F113D4115;
	Tue, 20 Jan 2026 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900879; cv=fail; b=WK4e2hFmfuenj2eNlrnLkmb0f7J9eygjlItTTqRlos++hpfO7Ul8v+LohO/9mMY4doDhFVZA6VI58fhm8suulODFg5zR5EpQ6YGC7doo4PNLYLIMCwg6zoSWUK6L+AvDrWFlgBeERcsF7CIjEVBP2YSD91ugGmU5+5nhmjbTpfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900879; c=relaxed/simple;
	bh=vcAQ0acaDHBeinT23Smi76q3ZOJuQi6X2ebLkPJFHIA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nehc/PnTuGORf5VkUJISU2P0k3JGT88VCNpr2ngpNuNNVnrhi6sUEiv+eHgrylsv9OX5QjiL0P38SCyY24ocVsIiOvo8y096TPt0XoejMppnS9CsSvLbhdoEj7/sBtM/12X/c2UQ61Of+Nuiif6bkY+Tej7wmecvdvuRvl7Uxh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cY3H8m5C; arc=fail smtp.client-ip=52.101.61.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHq9uugmMyE4HO+mQAtlM+m96xt/xsklE5AJSrXk3MaiSy7PXO4S0maFxeJgD9uPpLv9eYihLvle+p/kOqfyiBTcGqPru/x8d9TAANzQcXG3Mb9K/e5bLiwnl0HTkuumON2OgFHrTj07Svxu/0JSTYtmsafKlp6u4JHjAz0KDdJX4jdxUn672jRj1ZfzLhucLDsp3J4P64OFde3i5cxLcyoOROZnvdj+JfCoV4wG6TvnsB+QfUTiidpFcictI49o43IGr2LO8H/RTH/JjVgsDrwB3ikllYbqn5fgCi6gyRSQWcRhrwkoMSUCzkSzqsD7ttNTiqvMEiJ8VRdnQ6i+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqmqnCOL1fqj9Sown8jqSF9ZZ0Xd90R1BEQcRker7So=;
 b=nyEQUVgH1znsZBBiYOSRlnMEMOcpxOnhu7VvGz8pBhA2CO8ng9/JmRYjXVRLtF/s4ZsNs2ZO948uSxa8gLXs5TYe1FHcsSwLcyQH1peLBE71UwJ0q9EsedLUrGf9xvOg92Q+DojmbsFowHXGkZ4q/EF5K+EXFobcY9w8JA9ECJ9ypFnyrlohIr0+uX0A5wlQY9j+OanJjcuB/4Q7AazfyZ7E2U2X37NAnY+xRNcqzT4pOaJ6BJQQERE7l+UQ4ZsJFR97x+IPx0PUpRZ7Kj6KR0lQqBhB5MkBWoHGbh/YWdpLVMUR6dH/ESGviRkTwiwBj6m8rMEOE59uTlz8VRSgaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqmqnCOL1fqj9Sown8jqSF9ZZ0Xd90R1BEQcRker7So=;
 b=cY3H8m5Cf2RVyXsiXO4qo212fbtDUv0XtzrSn8mCy+SCzSDg9uQ+xH6y0su7QZU4jCb5/O5j91dhCNpto/zEFBilRWvjhrpdGSoE7Csr89fWIlvAFJagg7Ut+i40H6RF9x/R07eSW62LGPyXuTsBZxLHUDRN7x2NkRqVTUfm1jCL7GT6RvZh+6WQBR3EXtFv1uLskF0js2Ww75iOGClhKpk2ieXL5zc6qMlW7Gblxubp/cnDLtAX3HSrQ27aZcC8RDWNgFi6q6EX46py9WA34KNrhbsVb1VmlBuqfjs0FOjPoqTIra7GccXG813qm1FV87R4cC2tc6oQNgEGBliysA==
Received: from DS2PEPF0000455D.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::515) by CH8PR12MB9814.namprd12.prod.outlook.com
 (2603:10b6:610:26b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 09:21:14 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:92f::1001:0:12) by DS2PEPF0000455D.outlook.office365.com
 (2603:10b6:f:fc00::515) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.2 via Frontend Transport; Tue,
 20 Jan 2026 09:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:21:14 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 01:20:56 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 01:20:55 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 01:20:52 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v8 4/4] i2c: tegra: Add support for Tegra410
Date: Tue, 20 Jan 2026 14:50:32 +0530
Message-ID: <20260120092032.83100-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120092032.83100-1-kkartik@nvidia.com>
References: <20260120092032.83100-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|CH8PR12MB9814:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d98d6e-cf6c-4279-bbe7-08de5805422e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uyA/kKyAKfbSoWYLlepzW6EtvyXirPNUxhrYdrkBBUgDFQ8TRT8yK3ioK1AS?=
 =?us-ascii?Q?Ry5uks8+UazrrDRDlEuu6dbYEJP2ZD12nP/fygXkhJIJ6ZhlUbnZvJv+zKif?=
 =?us-ascii?Q?wee9kTXproYd63Ubgh1+h3qTP7/SL0ltaFZmCCMaZq2Cjf+LjHC+htLnN3XE?=
 =?us-ascii?Q?bLCYFC41xPRZuOd+D29SH2ZCretkuwWPVIcqMLupr1ktKgSB9I25fIbygQ8H?=
 =?us-ascii?Q?Uf5sYt79V4I0RmHIUET18nYJ4A+P5inih4itQKV0NnxMrEFJk5lxM8R2K6Gz?=
 =?us-ascii?Q?IfP8s1DfWUExztD0X8GDSQzcmeC7eJDdu3KkT6a4/21vc5XnuesEQoUvpWZ9?=
 =?us-ascii?Q?xhiWvHfL5KOXUlWjusqQbNnuYjqn1z3M41RTaKJ7lnjd9O/wVaS4oLE+VdXR?=
 =?us-ascii?Q?GpM3TmC9dgcbNYkxtEX+yrGCHpRDYXuoIJVcCTANGeExQoZ8dtRjwmRfty5p?=
 =?us-ascii?Q?XTh7QEcGwwic3RJ4bsbWQ7iXTAnzlKmw9olNGVtw1RceDzwP6M1eZP50+eNS?=
 =?us-ascii?Q?NLnB+oLniVT70uRT89YyA4PMbq57C4S8Ix6EF2FxrescJIeAk8udIVuYD5Ny?=
 =?us-ascii?Q?CThnT1mEIPChXQQ8zyINni/KIbWr5/z1RVif76DCDDeIejM9zldzCRSKt10o?=
 =?us-ascii?Q?53tUJfr4cnD4rPaVTFnxzyuM6T82orzxdNh8SWClGTv6KOVx9v1jQ2UT5Z5a?=
 =?us-ascii?Q?wk/WEFygUSuVlU0pdGwIkYvkvAKZFaMRBZLc6uuPEhiEECfgjMj1/b3XAAn7?=
 =?us-ascii?Q?jzyauTvAltUPbHsIwzTdIS3fvCpggyvrsHWDPXotwuGvh2B2+RWsb54qr12z?=
 =?us-ascii?Q?RwO+OTtWQET6JOWdkHIRKONThtC3zZa6hRS5xcZy9wKjdz4esw5rfFKPt51H?=
 =?us-ascii?Q?omAUt3KAJV3Ejst0jNJFSoEi7s4IsfW8nCoNbAfcgtEEd755z3qgwBoH2uNx?=
 =?us-ascii?Q?eN71shpJ1dUUl0WalXCzuoDCniU6qzPCqTffq5PeVy5Q6iHek7J+SeBIlGPN?=
 =?us-ascii?Q?cq+UhTkAA5rTX1Bswy8N9xLqHgmI8nAYZNoAnZcs0GWfDXhj8QBEt6KCQMgV?=
 =?us-ascii?Q?ne3xGmLCxSfxilm8jTuzMSowhLFh4m634xHigvRSQqH/Cwy9SudNMbMT7Lpl?=
 =?us-ascii?Q?YQg5c4CaeCsRE6pP9abAMXfbdDgWlUw5ogrjgIdQsQiWjRdTpZ9lN7yAWy4s?=
 =?us-ascii?Q?ghHD+wen1GhMVbD86HznVFW26DB0SSgdCHAswCLlV3OV+47sye7IMgzfaviv?=
 =?us-ascii?Q?TAJTdOzpqxWF+Ptuob2sjZmf+wqM7BBMog89uF5Qdvs1l3X4daUwO0+a7r6d?=
 =?us-ascii?Q?37ZHRLkcxWyk+6t1CxBwtM022/aTmCX3hO7tUAER9XqRuEi7a+l+hOhsjk8R?=
 =?us-ascii?Q?qSAXC2AH2W865yNX0EZLmWYmnlXVqaLZ6J9toDjV6R3brd8IOhkDld4zMlTo?=
 =?us-ascii?Q?S7bhK/MY8v4EcYbyCjOTa58I0rZpxsEhm1HGzP5NkRJxZ6dWnai/iIba5zoh?=
 =?us-ascii?Q?T7yPhJ6aEHQSlq+p7W9yRjcgDalS5rqmE99zkY6UsTbW5mrPsT59U+MS0HKM?=
 =?us-ascii?Q?QdLj9NAQ2TVgg3BiXmF9UOfh8wHoyNNlgi0ZhahxB8Y26ETmdLs0fZqH6FOG?=
 =?us-ascii?Q?/z4kBAVC1RgkgRFLgHJsPQEUqqxAfFh+6he3PiI2ct/6/Acn8cW3CllDyjqZ?=
 =?us-ascii?Q?Jl0BavvN/9kxTnUzT2a8K1NDXXE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:21:14.0473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d98d6e-cf6c-4279-bbe7-08de5805422e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9814

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
index b525997df330..47f8c6d7dbc9 100644
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
@@ -2074,6 +2102,40 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
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
@@ -2384,6 +2446,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
 	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
 	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
 	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
-- 
2.43.0


