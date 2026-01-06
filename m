Return-Path: <linux-i2c+bounces-14917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07960CF8013
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 12:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34F4730FB13D
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 11:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5730131ED7F;
	Tue,  6 Jan 2026 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SGfGhWxj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7CE3271F9;
	Tue,  6 Jan 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767697876; cv=fail; b=NkIGOnjChQ2+yd4hzLLWDfmRkvZ5YPjFco8JPdt79rYyTNAmGce6+BdTXXG/8mwCZakLFHn+Y62qr/2G/IZNyyJPvx25QZ45RYKQrImk0g8BFBsQuqlZdDoiwjI3ruQ9ROb0foCccffuurhzausiAV63wWSP18XEz5RA5wiaP7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767697876; c=relaxed/simple;
	bh=qpNkM3lffTXREoRHRdS0eMy/7stBC98/at8JD/SYsxA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bc4EmKiZ132Q2S+XYY9tQ5UT1YvdWQRNFr4C5jM3N6hDBSCqAHo6sob8Pp3hIz6v3up1G8r3poaqmq27Q0uz3GtJ/O8P2pkXJNnDuikvrHgRkNyM7x+xEIhiG9pa/Zf19J2L7qZPSgZthKPFUluINeiWTjPlv0NqhiG/t1b8Rm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SGfGhWxj; arc=fail smtp.client-ip=52.101.61.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHn0FC9Ly+stMzIEZ6T3kgw17vSkVTZ2caraKlrl2mUFrT9ddtEXiYX9ex+H0ZRvJT2NDMvEueB3K50Qp1/GvmMF8sHJ8mUhO/SQuayZcpaa4unpmFmEPmhH+WaXM0BUauoyS1n3k/VxKoZBAkJ2l0iQ8apGNJliwtHNgtKwApCkqejo3s4E8TTirWJLoNbgwYTd1QtUpIt/+QyK+TPM6kxU8cmd73EcLAVI2tfHOwOdgS4W1vVkaV6Bg2pgGoAj9raFIsOLuUPBvPX5gqpMVYvW+BsSKeUaZvzVSZmzEdGn/yJxvWz6UTVzwXXdQSYf5jFGK32nxI3ExNBcsdtZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIMMjb9NJhj4fNnWu2jHcOOIvPtTcpuYc0dCGjhXw/g=;
 b=iVv0UIinIqKiShqJJdASdsAMZAnKOnghKqdogv26+H9QTEeoA5nEM7SeAaVdkjkN3nuA15Vfkma7HSgEUwUNXQTY8l6JcYvj7deBplBQLG183/f+IANN4XGqLYauKnQ0tGD8WXiWJ33hujSY/WPc4BCPeSZDeLORMY802NPD0zyiGuDMUeq4qqftLwWaRUNyNs3fysGLkxm5KN4WeZ09jXpjc69boqtHpzMkHeEhyTAJdfXdcZxIZfaZMtJ95JznnCZ/nKQq/29//5oaWXMfLGmmusU7yEceVkcszdB2XHt5k+nlXgWTBPD2mHJZQ6hwqr5bsIBcHphZxJlqYhL8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIMMjb9NJhj4fNnWu2jHcOOIvPtTcpuYc0dCGjhXw/g=;
 b=SGfGhWxjaeIOTLAFiygM5BSaZW2sybbXRV3/FmRTLgRrANiQ6OxyH3nw2YsaY4kvPBZIRUbd5NUBTuaFKyyuTMtASn81H0/H97Vr5zb56wFezC7Fyhfdi1x0LOEhtxKBk7NmKcZMsTDnYrXpnq5UqHFizlThzqV1hTClO3I6fOx5CY1JpvPy/HObVRen4Sdhfd/EVjs69B/h5wBBJ11xRMXGXzHSdK3FWbfbw2KNINf9FgeZJwHpp2ekjrjosligEqJ8fwwpLW5fDCO+wZ7IziXj91FXZvLh0KIotsd0cQQKNSqb0QCxxJa8rqP5eQPrvDDZBxlb+uvpTObPp8rHDw==
Received: from MN2PR15CA0017.namprd15.prod.outlook.com (2603:10b6:208:1b4::30)
 by CH8PR12MB9791.namprd12.prod.outlook.com (2603:10b6:610:254::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 11:11:10 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::99) by MN2PR15CA0017.outlook.office365.com
 (2603:10b6:208:1b4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 11:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:11:10 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 03:10:54 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 03:10:53 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 03:10:50 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3 4/4] i2c: tegra: Add support for Tegra410
Date: Tue, 6 Jan 2026 16:40:33 +0530
Message-ID: <20260106111033.5556-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106111033.5556-1-kkartik@nvidia.com>
References: <20260106111033.5556-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|CH8PR12MB9791:EE_
X-MS-Office365-Filtering-Correlation-Id: 95368bd2-834f-4d7f-16e4-08de4d144c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h0Y5Lxx7fzdb+NpTP0VwtCHG/4AjFEkqWp2KLYvP71ARGr21FhutNgsXK4+y?=
 =?us-ascii?Q?Cs22gNiG8sr9YnPxuqPUkX02NAvgAZPZcuQDyweMutojNFAguxBPDq0J7aBA?=
 =?us-ascii?Q?3yVA82Yom0cQCQGwMhbNYWqNpAZdnKXKGdJIGxyVjmG98TSoDHjpmbxfItPR?=
 =?us-ascii?Q?+k5d5ZvxVtSg4234oPX5oyKf9bMHMgkLf2yrcPmeLeCEZK+ZknEEokY60jmf?=
 =?us-ascii?Q?GJrZ5GrpvcHazI73yVPVRHNh2p+rb7qtKOAbysLxoE0GWNzJxfEfV2E8jbcL?=
 =?us-ascii?Q?ynJ1cQpdAMPdF2CgpbGHm+MetyeeM4zl7uilSWPvrwE3SIJ95kc0I6MNzwu4?=
 =?us-ascii?Q?mEfQdPCC2BssxvnGq7EOPVdbZQOQwxbp688YwcHVQsFjXrHeq182QcZylT07?=
 =?us-ascii?Q?Fwn5RE1PQRvgePwKwHG9nL2ZaUeYoySJHezx9Vrc+/sTF3lw60E2w0AHR+jV?=
 =?us-ascii?Q?8515l3aEdrhFaHOOuMv23VBJtUT8RTDi9Vx5PINXfycd8TDSK9hG9w5smD5I?=
 =?us-ascii?Q?Xh0sNHDeVBUeImXABp9Mn0B2UTR5DE0+AmdmGQ/tEtNxm9wfTZT1yrbsPtxk?=
 =?us-ascii?Q?Y7NR8EnXiOuTRkq97JgAQHckWOJHnzUAMcPAdJxEq257j4BfXJF8azzNQJJm?=
 =?us-ascii?Q?dMmgiJSKbt9feCbSsd4sOuUE7pEukStkyKtLXFCVTP0atYcjnrP2bS0MmcAk?=
 =?us-ascii?Q?MGXc2DHLNP4pL2WbwYTwMg8V7GmuybA96RXZv4MXb4fP7P8zfOhXFS08OKRX?=
 =?us-ascii?Q?FtLdxU/l0gX7HjDwFiH9mddtHK47YE3w5qGRb6En2J/xFjk9VOX/mdaq09+Y?=
 =?us-ascii?Q?aXwgyUgmCOWirmzhRKpR6/njVpitmlBFbfppk+1GrVYAmHLb5YYIvJkqmPtH?=
 =?us-ascii?Q?7lvEdU+BFwNEqkoxT9SrKAH1Te4nwHkrvsquOi34EFNheGsUf5BzxoFtswTR?=
 =?us-ascii?Q?/zY0yvPYSxrOFk7wrtNaytgjWA5TS7ySn+lJSBluKD/fnpBjdMgzQGvL0ZCM?=
 =?us-ascii?Q?dXRV0wIw+egNp05+0KLdjjs/Tfnpe+r0XDNK7PB5yRvtkrp4DKKrx/AugWIh?=
 =?us-ascii?Q?xhTniBO/UmOQDmkl+21KhA8muCk7rC51ARSVz0IYglYPU7ycb1Ti9Q0PuzPK?=
 =?us-ascii?Q?m7nAETzL86GILOEh0rhO0oy8CNfinUfZOXMYS73xbUHux0a5sQzdJ3a3H9YM?=
 =?us-ascii?Q?z5sg8dtU1NDuF3qDgw7mEXlM8RsPc+/enjexDzLv5hZZekLuyHibsBTxvmT2?=
 =?us-ascii?Q?rbX60b9jqxUzPul+0u+y6ziLN0LHYOHOWM8VnmfaQ9XkxHaO5LOxzH7b36sF?=
 =?us-ascii?Q?7zpmTkXMmstMIHfcwQblnZouy9OTQxH3GzE0TKOMgs85IzhXBZJB23d/+KS7?=
 =?us-ascii?Q?hrb3vFktli/KVIt/dpbZ1AZ+g4fGUPl3FaGMcuGfuImb2yxc1HvF2pzr3bJm?=
 =?us-ascii?Q?q74zijZlL4MzjI7aqF+3TpR/oTxjG1rDkS5GIXo81tfDk+YFgl2cCY9ekEwA?=
 =?us-ascii?Q?oxfeiLupc2Gc3t5yChUJe1oB7akaBtv5D2S0SeGWHn2dAyxF003MEPVOBtMR?=
 =?us-ascii?Q?soQsSjR90u0Dq1584K/lazacEnga7toqc2qsCBLP?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:11:10.6972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95368bd2-834f-4d7f-16e4-08de4d144c51
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9791

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
index f92d8937ffc8..04f96baf2b56 100644
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
@@ -2079,6 +2108,40 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
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
@@ -2389,6 +2452,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
 	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
 	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
 	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
-- 
2.43.0


