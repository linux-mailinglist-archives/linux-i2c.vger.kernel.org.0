Return-Path: <linux-i2c+bounces-14915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5CCF7FA3
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 12:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C035300EBAB
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 11:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1475326D5E;
	Tue,  6 Jan 2026 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pBHXGpIp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025BC326937;
	Tue,  6 Jan 2026 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767697870; cv=fail; b=quo6AhHTyjh9m8tW5nTD4U3+FBpNj6llR0sDwXZUHqK0PfL/VDy3CfKggyfeauZc2dkuDwLq/l5lYgSPiduwd3jrnLrHIjFXJ6wVHPnA/1kyXDthq2NEdVsVNH/K22nbRsUE69BdSr6T9xVcWUAc/1UhRfzlQvmU9oLl38NWpwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767697870; c=relaxed/simple;
	bh=So4x3pw0wg6BNQxtaHv4k3AuLpQsfgRuFdmnosO/3D0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ajuwCrXn6/iyy5E0D3XkieyG8ZEtb6URhHsRAuIZjukufjfDvKjM1w73ahK03PfExEpAqh7utj5qug4FXwdq5UxRNIJNmxvMNwmnH2OxH4HNTsuRTAZezQLMUyuFi7ZJaU0Hf05Cnu2njlXMBZVZK9Al8N/CWcgd8zjySuz5kMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pBHXGpIp; arc=fail smtp.client-ip=52.101.52.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fffj6SN+j8DRU5saW2Lwp/tYc5clOpMFEIwru693sTfhRKx3Gsxe0LK86/vlX1sH+LScQrAEOgRdJ6yEo+G+QaX7DzfMay/joSJAbNIjw5bZpEmmfAuS/7vq8R4Bx8B/M+RJBX3XOyK6Nk+yHfsibw4j4sHeSelxINK6Z8ZLCWMQ8dBAVMaYmBsfB47GeHzMKgmx8Ekw70DtOLSb8hVs+YhCZAAXpSRp0QNMYKbhzLHHNBTZ8sxm/fNJC3CEuWKCjKyn72ZeeZJYlEqdLgUUgV72Bgv4K8W3VdOT8EigVi2rhS5r4ydRHbWXwrpZQguYMkzbZeMjLivxEsuEJpBu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffo9li7XL8eTx9c8oKkTEf6u4+eK80rxNxo92u+XHqw=;
 b=I4HldhXopfKzDFmJx09tt+jH/JBzrEx9vpOn1kPO3IDri53kqMIGWKsuU01IJVkP75jxLQzbXXrkR7od0LRbeiTfCfssCcFyVogj1cLC5+VzMEQABvfmMsQt+SPNp8JD0n1JYiWP8lmiZND3ObQIQag2f38XNki9XIlBwwgDrZphUyAW+7GPjJjKkQgbhiqCQzUdNVvZXFcVBgZU6t3tc7kEfASCQvzBsa/94SX4lpUn/8ywSOo52K0dnRaeaaQ7NLP/uKill1ltNGIAlPKYjp8Lu4dD7tbxMkymkUJb/D/7rIvtVMX8kml8JArTrOsdFDxq3YZ4liWEQBQqjMuK8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffo9li7XL8eTx9c8oKkTEf6u4+eK80rxNxo92u+XHqw=;
 b=pBHXGpIpwpQeq9uLWnWU4XmBZMywGf+TvjwLxQFjW4PqnN2STllSEX8Hj345DjN8S46V0iovLKjzVPy3pxJYvwD+zJEP6NShYodW855CdwiJWeSAvhrFThFHFtdZobyMWrx7SmUUfdp7uPTcRjapTUeEU/RU7zHc0YMF5hbGzDoQPQ04jpZ4xlrNj7qURTw3XH68SQmnm2Tde58CP8W+PM036Nh5aCi0cpDpCeiXlHRcJDX9dJs6RodBy/ML9dJ5pq9f3Psg3lC5lKHJaThRTFeH/DnssVYumHUpMPZ9QlXQ8xLg8nc7N9bA+sSR0VWbg3Gt/79Syr/0o1yWAJybnQ==
Received: from MN2PR15CA0031.namprd15.prod.outlook.com (2603:10b6:208:1b4::44)
 by SN7PR12MB7980.namprd12.prod.outlook.com (2603:10b6:806:341::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:11:01 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::89) by MN2PR15CA0031.outlook.office365.com
 (2603:10b6:208:1b4::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Tue, 6
 Jan 2026 11:11:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:11:00 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 03:10:46 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 03:10:46 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 03:10:42 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
Date: Tue, 6 Jan 2026 16:40:31 +0530
Message-ID: <20260106111033.5556-3-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|SN7PR12MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 7656d51d-84c9-4417-7256-08de4d14465f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CbsaVeDzXUjw73UouvXGNTGZYfxvVCidixeU/SgZMDUarUlnmuCyY7BuDfAE?=
 =?us-ascii?Q?mbjZFR+T40DDOa+/KsefDJ7GcmOh68QWMx25iT5RBTwB5BBTqpzU27d7O0bI?=
 =?us-ascii?Q?0VujKXOFLxOom0zyUN/Q42HIlFTBKVBE6WdisS6kipVD7xNeg3dKV+Dtz8bt?=
 =?us-ascii?Q?AAY46d9R/DtYEMPjqMHRYlpTWi9iGPlskT+5+4pn8jnNajlBExcLkpJAoUzg?=
 =?us-ascii?Q?gBWwn6ilKB0ysfwV3rQI/DuxEr9vnwXXqs669t/0/QszRVodI4vyvPCNYGLU?=
 =?us-ascii?Q?54cXzMCYd4KDb+lE8KCKVhsv6LWwU6ulq7hYf7xLSaYgrKsnl8/CsVCC2X78?=
 =?us-ascii?Q?5+YZdGg4Gymqtmg0AAeVXdsTfnhpNo6KzRnfvzQ710e5QC+ylX19VKVkWH3m?=
 =?us-ascii?Q?2Gbb+Xo1vwYCbb9CvFLSb0vxJso/tqh9W8n3ojDJvIYdChho2Oo17MogQuxZ?=
 =?us-ascii?Q?Jcav5d6KvedMUatJcTQUjqLOc2tIaaRoc5xrza7m0nkAjaAoKlKd2xV6fJK0?=
 =?us-ascii?Q?N61Gk622FAKpQetSM6mPis+k5Yp0Ehy9KBJulQzcWaCBo4CmTKcuzkSI2Vd9?=
 =?us-ascii?Q?AUDQlGLFA6DOIYESqFoWASQ9DP/MW5i7hEFYs7l88ZU/WvylPKuXOF8EZIJk?=
 =?us-ascii?Q?dxfO7U/mKonqjFepjELO5LgiTgPvOoPP50SCi4wDOp34P91sM1qBkZNBXYRT?=
 =?us-ascii?Q?Mc/NDomlUwocGo7i22feHQ+Bm+URczKQp6o9Mn4i8j+QDrRhOOvo0NnjYHQ+?=
 =?us-ascii?Q?8phOLD1qJ+KGvZ4QQ/r9RAYD2Gmr+rwVaW6Nfl2j/tkIF4tUcQxXPhmQbU1R?=
 =?us-ascii?Q?4hmFoK7vbhSMB0/awAi4xBI/sC5WiPQM0YXbXHPaz7fCWbWW24ntZZafsl1c?=
 =?us-ascii?Q?2e+Gn53n4v//r8+rSSfp4Z3h8HSkD7DeUMP+UFB7JU3dmZ6HPqYs1gI77f6K?=
 =?us-ascii?Q?uVFnuy8syybIXPA53L0GeKChjmZphLNiXSr6e1IDCn0eQkwefP1LY/TOqUMf?=
 =?us-ascii?Q?mEfcBiTC2V3vInHxQ6wJskW7OTkA1FjUsmCsWOMnosj/e3TQQ75Aas0ryLfK?=
 =?us-ascii?Q?IxReVWG1K61RWjWSuwazgoktDJLNIPyHztYf4kHcIkpN9ExNZSfVIxkj6Ndd?=
 =?us-ascii?Q?4cZUypQ0viSAcQQZbLw4ErJcOz1FQlSth/YrncCr2fwxdZzfgdx52VUS+Rbl?=
 =?us-ascii?Q?sb9jc2djfbVBz3kMkn+igVZXPmTtQjxd6ctsOF05WfRhy087+d0v8/TlPEKr?=
 =?us-ascii?Q?dExHoRTvw/7LfNeMEJx4B6z9l/S2TBsVOsrcYU2a8nwIuvJqT1sfX6dAMRgb?=
 =?us-ascii?Q?R0utSirhR26v8TwGH6vLOOtxJ76i5/IeqB3uza/RGaVMtiIJUEh90V0CKdGV?=
 =?us-ascii?Q?hCKItgxP1qAPk+4kTUFXisYN0KKj7DtE3E9T47I9KjMZ6XCCEE9eTUxJaD5J?=
 =?us-ascii?Q?i2eL6uh0Q85WIBjFsjwIPprjwOHtpQjFWUHPmXHqZeqxatCRR1HZsaNPzs9q?=
 =?us-ascii?Q?UaBL4pJCIreF2RNRmngFkKYk+pkYibupbjApneOlqTuhWUk03npXyRCPKvID?=
 =?us-ascii?Q?fkbFF0pQ4P1O3YM4vU9s4EoAyjLY5A7Yr9ZsHHRV?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:11:00.6562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7656d51d-84c9-4417-7256-08de4d14465f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7980

Move the variant field into tegra_i2c_hw_feature and populate it for all
SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
"nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
from tegra_i2c_parse_dt to initialize the Tegra I2C variant. Also remove
the redundant config checks from IS_VI and IS_DVC macros.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 100 ++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9a09079dcc9c..4ab991a22350 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -235,6 +235,7 @@ enum tegra_i2c_variant {
  *		timing settings.
  * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
  * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
+ * @variant: This represents the I2C controller variant.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -266,6 +267,7 @@ struct tegra_i2c_hw_feature {
 	bool has_interface_timing_reg;
 	bool enable_hs_mode_support;
 	bool has_mutex;
+	enum tegra_i2c_variant variant;
 };
 
 /**
@@ -281,7 +283,6 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @variant: This represents the I2C controller variant.
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -334,13 +335,10 @@ struct tegra_i2c_dev {
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
-	enum tegra_i2c_variant variant;
 };
 
-#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
-		     (dev)->variant == TEGRA_I2C_VARIANT_DVC)
-#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
-		     (dev)->variant == TEGRA_I2C_VARIANT_VI)
+#define IS_DVC(dev) ((dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
+#define IS_VI(dev)  ((dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -1649,8 +1647,42 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
+static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
+	.has_continue_xfer_support = false,
+	.has_per_pkt_xfer_complete_irq = false,
+	.clk_divisor_hs_mode = 3,
+	.clk_divisor_std_mode = 0,
+	.clk_divisor_fast_mode = 0,
+	.clk_divisor_fast_plus_mode = 0,
+	.has_config_load_reg = false,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = false,
+	.has_mst_fifo = false,
+	.has_mst_reset = false,
+	.quirks = &tegra_i2c_quirks,
+	.supports_bus_clear = false,
+	.has_apb_dma = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
+	.setup_hold_time_hs_mode = 0x0,
+	.has_interface_timing_reg = false,
+	.enable_hs_mode_support = false,
+	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DVC,
+};
+#endif
+
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = false,
@@ -1679,6 +1711,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1709,6 +1742,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1739,6 +1773,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1769,8 +1804,42 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+static const struct tegra_i2c_hw_feature tegra210_vi_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x19,
+	.clk_divisor_fast_mode = 0x19,
+	.clk_divisor_fast_plus_mode = 0x10,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = true,
+	.has_mst_fifo = false,
+	.has_mst_reset = false,
+	.quirks = &tegra_i2c_quirks,
+	.supports_bus_clear = true,
+	.has_apb_dma = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0,
+	.setup_hold_time_fast_mode = 0,
+	.setup_hold_time_fastplus_mode = 0,
+	.setup_hold_time_hs_mode = 0,
+	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = false,
+	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_VI,
+};
+#endif
+
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
@@ -1799,6 +1868,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1831,6 +1901,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
@@ -1863,6 +1934,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1895,6 +1967,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1903,7 +1976,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_vi_i2c_hw, },
 #endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
@@ -1911,7 +1984,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
-	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_dvc_i2c_hw, },
 #endif
 	{},
 };
@@ -1919,23 +1992,12 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
 static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
-	struct device_node *np = i2c_dev->dev->of_node;
 	bool multi_mode;
 
 	i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
 
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
-
-	i2c_dev->variant = TEGRA_I2C_VARIANT_DEFAULT;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->variant = TEGRA_I2C_VARIANT_DVC;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->variant = TEGRA_I2C_VARIANT_VI;
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.43.0


