Return-Path: <linux-i2c+bounces-12325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA26B29DC8
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 11:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5B5918A7D65
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 09:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D8930E0FA;
	Mon, 18 Aug 2025 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LaZOpZdr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596A430E0E8;
	Mon, 18 Aug 2025 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509105; cv=fail; b=As7ZP/nDti9gJoqgFb9u8VmG3I1w6Y97a6BZjy0u1b/x6N/87at+DCBkJqkvx5sjRUAbBy/yFvoAtL/HQZDcZoZUHY2IwPRgXbr8dQz71J1tWOY84Pqn0T7cjtu7PUmGqmNdU7idBe5fsDwJ2oJI1NH31e5Ge0tZOs6OBBiSGHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509105; c=relaxed/simple;
	bh=aO1V9C8RhukXO0yH8rIFPgLKLBDILmDP2tvUE3m+3zs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WGSeHudyL8H8GKvDgHC3lKQzC3ivneEMcvj0wiFgiERaQWcIA54ysBKRPtp2ihCAzBhnkF/2Sa7HmtWnZj8axk+V7PUFzarXajdOH+PaUv5ZeDXQQd++LoQrjnBLH7xJzbHWp4g6eMsZHfY90u+aRUS+0FS97mbym7rOyiDY1iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LaZOpZdr; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+NmdQ0h7eMeEFc1VYRhjAsYcW6XSoUlULrEKAJqtto14mcSxQ3yQnr3mroWW0Sf05wj61Ixcp/8E132lN4ugLhFAeDnPSK6SFDws2AMyrvWrxi+x+uIr9iy+AiqKrnBfXN/J/s1HKgsWLBcXfsxibWfv8fdGIG0o5pPFyDHsxcD3bzTRc7lnXJDf9HbvJtBKg6EVw1rNmiT1YKK94oG9rA4/82fTfAiC6bUox3HSTiIQZk11rUpJkjeuhEp0GX2cgpluK6J1ot/VIEsinTz2FBv0beqGCC4zMN4nmBEhBC49lKTZDpTpsN4BkK7YrELkozGeHGknDXpV8Uy7Y8QHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNB5Lh1UNh8l/exEdTErYbejWk6ncoCYw7sUoMMb6VQ=;
 b=MKup4mESGGLVPYSmm+e+b/9U9yOC0BICZjDIjg3SxZKXec7hVoKUIAeHDubkabAg89jI0sdqO+plvQBWjRALe3aTgOc9IPGUCRCu8ZDFSBJsC+UTEbEUUiyNOFokHISL3Wh86NddO0mxYhP3PFwmJfUH9Alm1roGjwKQxArEdPLH0F/6eK5bHdk4I/yf84cPuJSVczNUFvLZU4ItekPbqwxSpBvW1M1Pui/UNt/ZVQxaXSJ/77QJ3Ic03TQwTryuzZd5t8X0ABNWD1Sfv0YG5o7b8oLkSyN3vqZOe2qiOZTIM51aWHg+lnbmo4khN9AgsYQ1V1l37TIdJO1159ABJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNB5Lh1UNh8l/exEdTErYbejWk6ncoCYw7sUoMMb6VQ=;
 b=LaZOpZdrJP4FHs5a8CPaPn7UaUhZNnyn4V/f+eCJRGd54xHsLOLiDKZJgLGqOLxdQ+9k5UEXFDD1WpixdY+JO6m144wRqJXANvAQVjBtUYKBkBnU/BspKbFn/fpjPHS/I6oMX5q7WZ14UKavzEz08f2s4Rt1ytd4RKhysUI9C21LihSUZUxjOPKulP0DhCYjeLbQf4SLUzokVIwgM3/ML+COaXM0ICPZthxcCz+vSF+DOXFE9sLulVrpB5VA2yR3w7d3PyZAefZ9tN/zM3TDUCuMMZJSa5jJcS5SUJq6pwHYwsWCPfE141CphBuxgGAsI3StxOMVyGoLUwpztJjngw==
Received: from MW4PR04CA0151.namprd04.prod.outlook.com (2603:10b6:303:85::6)
 by MN2PR12MB4269.namprd12.prod.outlook.com (2603:10b6:208:1d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 09:25:00 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:85:cafe::21) by MW4PR04CA0151.outlook.office365.com
 (2603:10b6:303:85::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Mon,
 18 Aug 2025 09:24:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 09:24:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:43 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:42 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 18 Aug 2025 02:24:38 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v4 3/5] i2c: tegra: Add HS mode support
Date: Mon, 18 Aug 2025 14:54:09 +0530
Message-ID: <20250818092412.444755-4-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818092412.444755-1-kkartik@nvidia.com>
References: <20250818092412.444755-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|MN2PR12MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: e950d81f-e8a6-4ff9-1ad2-08ddde391a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h6YeSCFFMLlOWjP+Ig9LCv/oqMH7WkpBphPDsCck8Fq4lXUbddWVMl/eSpvb?=
 =?us-ascii?Q?Zq2TCfUw5GDmVyJIKqs1hSV9yG9GY6/FLlbV9qbCB1fG6zUatCAXHXkPY3vU?=
 =?us-ascii?Q?+tewVYceZt2cz+ugWJG10g7tZdtbRfCHyNQdgqhCJ5eGp1cOcaWvuJZCYKUB?=
 =?us-ascii?Q?PTe/6TBzIflwek8g8WfxNnj4CPd0dZQsXT10Mu4/iqsGWulvDQ6o0VvUpwrK?=
 =?us-ascii?Q?VbUFGC24WwL/LjlDnR3dg8QoDSes4BdaqPbMA1gjl2oVUZxuPppkH6njuyX1?=
 =?us-ascii?Q?hAh21YI/v6SQ+jN+cDB/EvnVhtXb8YQfyz4E6sBq0UZVwDVMeUPG3mL3V92v?=
 =?us-ascii?Q?IfMStCraV5NKdjdPhB5hmFdGAI1c7MfiZxxwdajH6cz73hElWtoRJ3n/xYI3?=
 =?us-ascii?Q?DGvrzOqW5xniFoWZ4wpvhD1TKwWjOqzEWbjBIxyUq8BnaL7uk6WMMVBQyizf?=
 =?us-ascii?Q?miMuI+kwr93AQFfujVQ3ZqIzO3qce0CkXvM1joclJwCddHaxgDom2OxKfHS5?=
 =?us-ascii?Q?83kbSakVQsVc+aVZa/s5gfs3RXFvcoSUHwg7+c0IAsEI7ytzKyHJD6kpGVDw?=
 =?us-ascii?Q?pD1GJ1IZ8khO4pur6pTYmzBeyyOd8HoEjsgUsfXKWw5OYHmV5bz46+jqaieD?=
 =?us-ascii?Q?sOpjKifq9qRQnUA2FDz6yoYm423o2OqlEmvUOneOtPPfx1HAeqpCYj3PhKvs?=
 =?us-ascii?Q?qFXNUHs6RMr0R0HMZHv9SwMygyujRzFdk+BZMppmAu60CUQekSsu1ejBq98b?=
 =?us-ascii?Q?apVhXdZIjhkgdeIO7lKj8oGsnM08j+l8Cw8qsonC/tNBQnYoQOKl+TPy+l4M?=
 =?us-ascii?Q?OMOIiULh/MAmtR1v2jkSi87FpgNuXwJfU1TZMVwPIA8lWsFAr2lVi7gzdT4i?=
 =?us-ascii?Q?1OFyD+Ll5XLmhWobtQDNLyuMwvLoAC5EaBEr3rWDiSIHBZQX6D8a+4xC5pa6?=
 =?us-ascii?Q?oLoXHZBWpWeRN6rl1yggn3qUZ5fI+MKT7IZ7wczlPwoauJIIO5mYdoDi6xVh?=
 =?us-ascii?Q?PL1muiGm9DPE3pUzY2TWPha14xJUmKO6CsKLezw62MogMvR1LehPCMMZmRxm?=
 =?us-ascii?Q?9Uv50qGsXK+Pt6AX5YzlKGBXHUbvppcCJFxCHw2i3T5LrGXIb1TSow4E2Bdv?=
 =?us-ascii?Q?JnPDwYCqY0uRAnCKL0b+J6tvxMJGxSu8YkOYvBou4EZ6NUlHp9ULVnc2YuFI?=
 =?us-ascii?Q?AnUzRmF4NbxFymz/LPfkyNBJjnuxg/VP2szOG1yhaiu4QM+a24wjJH6j5G3d?=
 =?us-ascii?Q?AESFvTmtzLQ+60FsW+FcPCmPouFpb7PLirGWVPt/vbMED7Lt/vjPyc0FBZo+?=
 =?us-ascii?Q?QEABJO05rWhrFwlIRU4C50+cUnF0TkRuOiFR7b6Iv+5JAs84Y9qk3rBpVX7O?=
 =?us-ascii?Q?SGbDzgNhS0lGCsVybL+hT1LCH0qIQyrLK7BjE7Z0viXhLT757KjaQN3g2Aav?=
 =?us-ascii?Q?CLk7QGZYealZxCRQLHDHIVTTN4UW42Y0ieO3syRrI5UqfHzLCEwmBdQ/z6t5?=
 =?us-ascii?Q?a/LOSiXkB0RyOLSgE7PiB6D8KQ6xSLkNGatXnnDY5VDJs3U55b6BV/GTTw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 09:24:59.3404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e950d81f-e8a6-4ff9-1ad2-08ddde391a6f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4269

From: Akhil R <akhilrajeev@nvidia.com>

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
index 0c428cba4df3..6e322dba42b1 100644
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
@@ -717,6 +724,20 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -1214,6 +1235,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
+	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		packet_header |= I2C_HEADER_HS_MODE;
+
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
@@ -1648,10 +1672,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
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


