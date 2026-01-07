Return-Path: <linux-i2c+bounces-14976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B4CFE4BC
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 15:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EFF13066D41
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 14:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FD634D388;
	Wed,  7 Jan 2026 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NhzGBcv6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E1E34C80D;
	Wed,  7 Jan 2026 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796054; cv=fail; b=gRGIDgSlDxPynEu/eC31ZLwUBbQWyisa0btNjEGMLgOEFXuXFr8+NeoFLpC4/Dp2p1lmsbbzfhAq7s0w8M/yCiZkU6iwmqtW5gOX7+OEPNyjoV0HxOmgjuc82dl7NyzK7osCCWajJZS0Ryuomj4oTb7skYsSnDp2lCNyxwAAf2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796054; c=relaxed/simple;
	bh=/m6iouFazO4ePER2+xrSJJ3CwuAMEy+bLO98nZxbYrE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYrYYlMcAtw4DpDdjuQQok8mtH04yN1xX6DCeUNfE0aLEOAOFJwESGYGv5lD2ci7K2vQpKufAqfHKhWRNfYtkHmJ+8a820TfECGJYh39i3KggBBciv0eUp9zu3EgQBSM5bnMoA6NW2gzr6VqGhNqhU7EAUnRF5ssDgdLUfiqgCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NhzGBcv6; arc=fail smtp.client-ip=40.107.209.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rorpMxVMMwF7gY9YvBRATSfHLT0l7TGoyOdELXHaxdL4AL+E8y+7Pmptp4h7tjWBDGnzD7ZMVuHFWrJDZtpItGvW6Cf/AdVLpRAcogRgJIBLKPyb0GOVRWNuypZ6tlOfhaVUHwXSzIn3wW+yWsWkeC3FtlFTg3GvEGHnNSvIX9BVzTbS5Nccqw9ZwLXsVayzXjmuW8lk0C41AlfwLVkpbjDppvJCjH4JZNGw5cqH43swX7kds5MTuJsuvxQCad2DGv9V1HB5Az1WGLRhr2f+HhlRJJIt5qJ50TUh6zs5i0oWkgmRsj+q5HEUoXJoJIwi7DLQFbWKa61bQfUrmJ9ZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rxP2xmMyuqs6tLl9QdY3Ic/sV2ebK4cTI1HIEL9tog=;
 b=WjDM1X38VtWyTpXXYPoljCut7OrzT50+SA5T6nAYS1BFZg8tX1OKz+DUaRo9BSA9Ew0Cch+hOZ7SLeGEQEaLzknvEg/WKbyTYGDiEBERiCUU35wnexhzW3/ZTfaVr6ZFSCBEC0KtD3QZz6fVbLiZdRLr5aKBpC9/nxYWcqUVuJMse4PE+ZKAT+o9s616RZRqBO77ytOXZKikANYwFV76/LZtr8S3iTogh/nROu/zvYKBA5lzeWQrVRvIQLiWvkVjkCxXHOnYdl/UEXzIvV6tjL8YZG705mkmVbZQRbxpBXij/PFz6rofs6ASHsMxMZHpptWZ2IbvNQ21cwIq196IjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rxP2xmMyuqs6tLl9QdY3Ic/sV2ebK4cTI1HIEL9tog=;
 b=NhzGBcv6DdfcpNPabw7S9POEa03FCnwH3OFNsyG88mqvlI+JGdNKkeVDPi1v7PjaIpMyEVlM8AtZDgLiAK0/RZq5GA6Q/lZrZ8wqgJB1ITfcwVUtRR6CgXYoPyA48dGW58ig0SoKT6XGxvehaHpBB4ZmWc6QhCa0jbkZiD+njwl+2Xk0Sx2X3apoa5YefuwD6Yfz2iTWge1eidqcFzdTVYG5gKJJUk6sMaZ0XJtPn96ksRN0UxbeKduHX2QGmmoVSRQXJ2xkma8vo81fYK9xCT4vvVX4kqnLKX7cxvH/60XVyJMQUu78NgzderI+f/7Ic+rhT42K5Mli5iG6dRv6ww==
Received: from PH7P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::14)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 14:27:27 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::4f) by PH7P220CA0009.outlook.office365.com
 (2603:10b6:510:326::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 14:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 14:27:27 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:27:11 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 7 Jan 2026 06:27:10 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 06:27:07 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v5 4/4] i2c: tegra: Add support for Tegra410
Date: Wed, 7 Jan 2026 19:56:49 +0530
Message-ID: <20260107142649.14917-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107142649.14917-1-kkartik@nvidia.com>
References: <20260107142649.14917-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b0dad8-8375-439d-928b-08de4df8e206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aTnkN1Zp1bLee152E1fT2p50A9V7zVdPfmB29Ij6Aqw4U1Rn9HP9G7LOeBZl?=
 =?us-ascii?Q?QvScbBtaI0iDKj5znca1j2szN4wMlo6rsaxE7E3Oy3aKP2XOZjiz1xMz76Ak?=
 =?us-ascii?Q?A7v1udlUTXZOPGKGAbikPAy8NpWUOZ2MNux3jkDym1lK9rmAAzLeCTiHgd/m?=
 =?us-ascii?Q?2RpmLxUfgd7qyWbU1FVZNFSzOTKNbW9HEVTLgw43YxkmRWx4j6m2jmJW/f6J?=
 =?us-ascii?Q?ui9rS/xuYjeqmKHCcfRrZtMDWL8kS9ble2AgHpEGZrJ8IFJPL/1RCI05FTf6?=
 =?us-ascii?Q?1aOK2n4uLzpWVni7vYkEvGsDukWDo0ZuBba9Q1IbwalrkwTRqgRGCyi0vhFg?=
 =?us-ascii?Q?dFF2hBA8HuosvxU1sry1YfcdX/8HhTUZjUcdwMXnWtsQh5Lmjvvt2CI8Z1L/?=
 =?us-ascii?Q?7rn/yhr/UT5GeVQQD8GYaGQvjv8VHeJKUfqS/R/wz5hdKK9IBye9YcgBMn7m?=
 =?us-ascii?Q?i+nocvu5gtu97KSn26W0qFmTg9PUD6b5rFXL++udCJcemqFX1lJCurlL/8ix?=
 =?us-ascii?Q?zmq6rx0PuchF7Balp4ikPw89iocmUT1AdTybMybX3zJy6doDvhrUHxPy9Dpv?=
 =?us-ascii?Q?59KsahwKQt+TUw6Xbx4/byL3etyfur7KRPQ5jh6lAEyS71Z21eTc9BPM/3Af?=
 =?us-ascii?Q?zThspi0rLBCcCMmwQQ5I70rN6TvZEg8rEL/cJ+9MfG5VcnjteVIl9KyRtcrg?=
 =?us-ascii?Q?HCGFPwEW0y6uU0y0NNUCTVLUNSMz+P5mtNwAzVLIKWzB6DH6xtfw83hTIvWa?=
 =?us-ascii?Q?l/doEZ6tqDpVm3/vYBh7iu4o1Nx4fkB5qXckxbu4LmY0nnVhrtCL2B/8xzNK?=
 =?us-ascii?Q?1aGWwoAQGWTr5iaGTLoF3hJ/G4B3qMvhBUL7+N1R8VYlFL4Qf/roaFq0pG7s?=
 =?us-ascii?Q?JteGLgqVUB1SHjxfmO3BKijKU94yRtFluQoZSYmHJPJOWpDZuS+gBRfj7ao+?=
 =?us-ascii?Q?3mZViW96XxEPnx0VLcN6MFih6+5btq3EuLS0bbEs8syTRa/Eea6T7P7jKcT2?=
 =?us-ascii?Q?ini0sQ3Noe+e7Bnujb1QosKEKUCO05BbsXlt6CYzQ4hi/SvwZ/tDSw9L1qKb?=
 =?us-ascii?Q?qVfnM3Cw+VNUJ/9rxvepfh84D/7H54rOqt4d4MCzeG7LuHTCG8/t81ib5kHA?=
 =?us-ascii?Q?PvLUgvMmoywlrk4Zg114wEui2tb9SNKFFbLHSqkycNb5KNjg6k/po5usUle8?=
 =?us-ascii?Q?JT9XrHhv+uOQNw92QQ54ix6T0V0onlOOQIYljy6xGF/IqxMMWdZ3eG6g+RSk?=
 =?us-ascii?Q?2GdTRK2A9dg15bGSU1iBqrLXLVQSOIiit29BZJzvKdRNwKK4cUmFiZK6Dzk8?=
 =?us-ascii?Q?7Ojs62h3i8Dc+loPJnETVtgl1upOuHlllzhSmQ3hMNxdMp8K5d6pCn8ABxjb?=
 =?us-ascii?Q?zeSvolV4WFXJ1+WFhlf5wDwa2jLxNnPN01uu4+UVqkTe7i6TBlbTdfwTblmD?=
 =?us-ascii?Q?b+yGpYAvRZAb45bECjbD7phgKjKsG1+bDoQJ15m3qhfASTkD+imtMEuPPjpx?=
 =?us-ascii?Q?4/Sc5LcewAkBhdsnbgwdUhR3lIRyN6KRo+DIvRPI/hVmEyAeFSLThp77JEQO?=
 =?us-ascii?Q?WalRu0u23186enuh9ySYjOqvjGThlozpK7Ru9xua?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:27:27.1476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b0dad8-8375-439d-928b-08de4df8e206
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944

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
index 821e7627e56e..44afef32d656 100644
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


