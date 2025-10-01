Return-Path: <linux-i2c+bounces-13287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06109BB11AC
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 17:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 397CB3A76D7
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 15:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703952820D1;
	Wed,  1 Oct 2025 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nsEK9Cph"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB9127EFEE;
	Wed,  1 Oct 2025 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759333045; cv=fail; b=rRKBHhBd+nzlJ6FuTDEjAyhotzS3JDj8tRvraKusTl+iKinj4eTMKWWX9HJ/SUjWsi3sgIe++I2Upr686w7JabEYYcfpFWt3RYRKJio6MsLmoRxwY+B5WG/at95bA8/7TJyqp4G3UuOGYPnSVJqXG8V7fNQYcbyev7Bp2O52VLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759333045; c=relaxed/simple;
	bh=KV76llOBeZTZayqIJ2LV5XyEolMphbU0+lXyzBUrm4w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZCNv2fD1tKeDYxgELUBojeUt7fiHb3iAb6ultjilPFLkH0C0BPWUoAv2Rs0ZGpr4RFbLE/PAlHJk7s/+Kp/IZMDepLdL4pboR3QljDmJSt0ScpAYbyvCsaQCj4aKXncYpNQx1wjDCQ1DvP8Fyt6h1ULsX3/Huuf1UbKtndwkX2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nsEK9Cph; arc=fail smtp.client-ip=52.101.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVRjxlIW7RbAzAPYxH/QGCsd5nXbeLJeTlWY5WVa1Da33Asxk3yaN1wf+uX01ns5lXG13umgY3LxKmOKOxVcQRqxRed48dt6eSIAQZhvtQi5WZPAXc8+DcIgGqp4mGU+GRv2rMJNcqQKJSnQHPUbBYten9LFixf6ntMWVaP5FiZQpLbifDJ6gcJfTDIdGYriQ48YsTr7U8DC2qbiS0K8V1+2QIm2tUGQssY2vJqQnhAwvTS7Pw32QoXeq/rM2pOXd4B5IvUUwt74fEsRfPtLwROTZtXuicNmWWrCbt6QEZN/e9S5d2BHEeRwm/LP6g9AY3FXb2Xf2bEmqH/JOHcapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOK/v+u2lYSyakDAjyWak+Ll3VrbHnC6yUIPDIOFz7E=;
 b=N2bzRzOWKPi6jETx6HKuxMP/TF4Nyxd5ViECJIB6tzX5hPDSdL4hoRCMlAf8HPQ3UKj68C/nemoeCzTjtuw172AR2v9CkRqEOzYY4dzlYFaa4P/TUL7fuT0ylBeJAtM4ljCTra9c1lxIWZhGesWeSa2Co+lRpPqktULa15Gd4MF+fXWYr1wZMu70Da/vbMQvVNh8UT3OvCI2krw1fzdOIBLAq40zH+/q8gbZ3RJxjiVq69N/Z5lm32SAf4JX8UO+HITNeld+QVcaYk5JMryJs6Dze7WTkqoBhNHJE0BU/B8G+uLNWVVXsYHYm9wU2jAa7m2bmWDz+NlZUiuyH8mojA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOK/v+u2lYSyakDAjyWak+Ll3VrbHnC6yUIPDIOFz7E=;
 b=nsEK9CphfJw/UQym38OH/lthoKTPMzp0AVlxF/Iw475p9Nlbfx47W1oU7gpSmRpxJRoGlCUTuz5eU10f7BYiepjd7Yv+JnUORd/EuPh4AWKsE6bP9mMfQXKhOWsj66o7hJfpv+EisINLbIxf2ELMlXymxqjo8saUr7ybrgmbuwbngCMQ6EReGCrekv9VFB1N6d+2DBope1nEPupwivGGfX8h2K1j4ErSS6HWtjbqr0z/3OQIGk6l8dV+lVErRfteVuG6nVFAcb9M8gqTVz8BtWbsrp60wJLpELL7/W7dgjsHYIStgw/rmVXO23Yphz/9Sf+vUNYKGr5fdj73OZdTrw==
Received: from SJ0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:a03:39f::14)
 by CH1PPFF5B95D789.namprd12.prod.outlook.com (2603:10b6:61f:fc00::62a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 1 Oct
 2025 15:37:20 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::d7) by SJ0PR03CA0219.outlook.office365.com
 (2603:10b6:a03:39f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 15:37:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 15:37:20 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 1 Oct
 2025 08:37:05 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 08:37:05 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 08:37:00 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH 2/2] i2c: tegra: Add support for Tegra410
Date: Wed, 1 Oct 2025 21:06:48 +0530
Message-ID: <20251001153648.667036-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001153648.667036-1-kkartik@nvidia.com>
References: <20251001153648.667036-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|CH1PPFF5B95D789:EE_
X-MS-Office365-Filtering-Correlation-Id: 335ae237-04ff-4d72-98e2-08de010068de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r+311aucbexvpLw5zyvMMSWXR56teMYstbre/K9B56O8q0qna6/Otxj/MPUY?=
 =?us-ascii?Q?Aj8UmwNg/oiPfOU66joda1Ds6yvM79o6k+j2AA6ZP04gVaiHSDzvkXWOQYSf?=
 =?us-ascii?Q?Im2UwBEJylQHrmYQ/93zKNSFanttKuJDdV7kldxrub3jjCuiCkq9uOg+MqWS?=
 =?us-ascii?Q?+XEcaT2Y/PWSKBxbvLJIzQx3sOjDprFYQuFQg5dGP9evT+YilUI5gw/FsrtS?=
 =?us-ascii?Q?l9NGczMG8OY4KfNWMWBmQ9dosy+rFK7kzriMENF5D696LuqDMJYp0vUmQM4S?=
 =?us-ascii?Q?qc1XtS3LVmoY7Hj9ABJq5+oRDtHAtsw5WyCk5HzLMEFXn37wZ9yh5nlS9Uf5?=
 =?us-ascii?Q?Z7L+qhVLo8HC20bEUPhs8Wqn3SzOsT832BfxM/to9zI8T9VvatkUeOtEOy0c?=
 =?us-ascii?Q?JA7kbOZ5V0HlTCZZVGU14nIYzxQBxfLCi3e/IvdIkvAH2jfpWiGUXc8StBSJ?=
 =?us-ascii?Q?QNXNCUGFpHLqH4k9r/3KVWROzF/Q3tVkDr/PGuFa9KTvSzKkeHVerC6o4hCW?=
 =?us-ascii?Q?/mi2Qu3cxoZ+7dEIV5e3t8rKAPByZEGySKKPBLvCXcdErvYuyS+wz1K9PhJr?=
 =?us-ascii?Q?BPlnCaqNmfxNP0Bcwu8a34zW5MY1B4r1vhzJPUJW8ee4msjMV2xU1XD8wPEL?=
 =?us-ascii?Q?lWBTMO7kKk3fUAUCrFexY7lKjBXuGKSm5dlqAi6uAM2QQiLjJgq+i2LOOnJ5?=
 =?us-ascii?Q?ncwFu42daN3vgdidZF3TrPSTpoUlebGpreB5b2toykzkJx3MP/iursNl+yOp?=
 =?us-ascii?Q?kMEcup+MMMa6TQ/swlO1z1ylEch4LEjgYVWZe5tLgf7EnIszoFh57YytCkKz?=
 =?us-ascii?Q?A3FSz0mqD7kaQ/h+T43nEYdyw9xZ7MZvvCrXwV7/oGplCyuGoDm3IWqst7Oi?=
 =?us-ascii?Q?XcLzK73j6WIPDC0uyiglYoRFmPSifk+ixRLxHzm27x9uLasnbFRjDt9rniu/?=
 =?us-ascii?Q?rcqNSeCs+OEcNLpQrm4oD8CmtLl3e76aSPIlIPEA4A+IwALxyA2j9caujcG+?=
 =?us-ascii?Q?K/XQQCiSCOrl+Tjhj3tytxdrxOwLII4WG2/LZ1KfDaXPZy+5TTt/xAzl8fR0?=
 =?us-ascii?Q?CtbkaTpurkdfMxp7eMModdosj4m0BAHTpna3+ZuCbI/jJFvm5OcBxjsomx83?=
 =?us-ascii?Q?on0b9uPyBLNdz3AwDE1OY/QoG7/wCqk/UMK9qJX/+SxJEw+KGliCh5SOy77+?=
 =?us-ascii?Q?fhu7xMnFE8Ykl0RfBk0/Q0rK7E3qoJBiNpxnd2oKNFIOl2GbYglWeOjDULGq?=
 =?us-ascii?Q?Xo/T8JZuChgqPDv5lal8WPlDq2xbPpTPae0dyk0+h4NIte3/fz/pJ++A2U2K?=
 =?us-ascii?Q?9i1Sn+IllHFvppGBm7QNqk8nGtNmFKS/2EV3kXVbnFQhJzzl16mCtIyMoq9k?=
 =?us-ascii?Q?Y8w4sdNbiO7dYEHhOb4Ag6o9KJ/Ro+rmUlgLoPkchZ5MGj8oVvxPWl7Fymyu?=
 =?us-ascii?Q?GC1d0Lrmm15LNrS6Dow+A5BUFeKpcyUzd5eH8B+qp6uUkoWf1X9NbFC2bLA2?=
 =?us-ascii?Q?Be7uqlGV9eBQ/LJD3ATFKBFVnfbrNnjIQkDguNMEDt6i4pITBfDvkKGgf5Hz?=
 =?us-ascii?Q?0nLfsOnl2u5wVU9CmRH6RhGScuPJlo4zfqPScw1w?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:37:20.3364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 335ae237-04ff-4d72-98e2-08de010068de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF5B95D789

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1e26d67cbd30..bc9f60b69020 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -262,6 +262,38 @@ static const struct tegra_i2c_regs tegra20_i2c_regs_vi = {
 	.dvc_status = 0x00c,
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
+	.dvc_ctrl_reg1 = 0x000,
+	.dvc_ctrl_reg3 = 0x008,
+	.dvc_status = 0x00c,
+};
+
 /*
  * msg_end_type: The bus control which needs to be sent at end of transfer.
  * @MSG_END_STOP: Send stop pulse.
@@ -2020,6 +2052,37 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.regs = &tegra20_i2c_regs,
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
+	.is_dvc = false,
+	.is_vi = false,
+	.regs = &tegra410_i2c_regs,
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
 	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
@@ -2330,6 +2393,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
 	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
 	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
 	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
-- 
2.43.0


