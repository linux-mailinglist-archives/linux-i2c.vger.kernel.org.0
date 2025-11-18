Return-Path: <linux-i2c+bounces-14141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0737C69DE8
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 15:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 373024F8DC5
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 14:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F131D35A95D;
	Tue, 18 Nov 2025 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XnJrcNmp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013001.outbound.protection.outlook.com [40.107.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEAF2F998A;
	Tue, 18 Nov 2025 14:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474834; cv=fail; b=C6fwAurCNfmQAS5zhAGBsCD1bHpoanDmE7Vz6++2xRry6gRqK0oEO70h8Y3GQ88g6T2HEyTAHadOil3rndQY3mbYnzjQ/CN7mAN0NTN8bS9cvvrcFkL9BthCljmPA/f3acM26N4zFE07NcfZhLkke1Owucihr6SWJ467QjRlMHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474834; c=relaxed/simple;
	bh=aYVGvmrVuGHYwT36Esw9CSlEuegTN+6kUDfou7WrnK8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FFstJ3yDqJnMvS5fiwvwohw+/lTJi27ZJxMa6vkVLT853yw35hEePXAVZKqrfOq3vhYPgrGg0gPD1BiwMi25W0PYVneeW0cyrsDN2ds9qqPtwFBpXJEGqbCzFMzHaiINNRXTBBzExKxsyJrKIy0H9DxHdTcatYlwj1QwDblGkyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XnJrcNmp; arc=fail smtp.client-ip=40.107.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUAE/7y++8iWOEUVU8Wbpbd4Wny6K/vkl8xLu1ykjdNTTaNtCHjhK1QA3O8LbHwPsufFioruC8kXWX+JrdmOX03XU4+Jb+lWbtlljmNXzCA/1o31mtA3E/9CMZySI4PFPwUfRV4tTTDOHR6lFX9ccm/wdvBofxw6R7o1q9U6WxAlZ6RtpAgTqAr6VP+pxMUNQ175FA03gkJ0+CYD3yCspBQ7LTcz3jZLVtmTSYVvJSvcG75lmA0HF+Bz/MIgfkFUPnMAHR3UVyHpajxEZYqE8Vhwt8yXPHf8WCEpwK/LJ+amXlgoFPoJl7X3y3RZKJ87HBl8A1cWsMq98UjSkp5B0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GTF1qzVgXXkL1W0mW7t8iS9cdfQZtmnCvO3o+eFOEA=;
 b=ucU02SPTLCIiKCE1G/b8FlRkGTX/t5BQqAVpdBIkFoGyRH7JqEads3yDmqsW6wQyncFVt/nSiZz1XYMdsNxfV6XaWkZWUKP9rIdL1p/sJGVRCFu95xYEGvbXs+/8YhmgnEf2tYOXTywPcOt6BuVprZ4fEVBlilDMt4Cs3QyA93vVfXg2g6g4oroSBOCXmiTKVXM7cdo7vJ8zk7OuZ0/Y/fH8Vtmo+3XH9I7qo2N5yCIq5ntB5gXRTsEvq6B4IN9UwiyT2WC1B3AkWTrkdCYNShSbmJIacwtpSZvyVqi87d5CTb+0IXyfN15FasTYJU4THq/97CceJ41Rjf4O/4L17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GTF1qzVgXXkL1W0mW7t8iS9cdfQZtmnCvO3o+eFOEA=;
 b=XnJrcNmp4lx2ulDoAOMAlXC+ZDK8w1hkLR0O60RxKSVzRXK2tRn5XG+p1FxPuqikNxEYQZqIig59+cDXEUsfISHsOVK12q19tbbCcXU/nK844BH9POsUA2cfZAoQ8th+kEGLwrsB+jatgFmA8ED9hWUHihDCYUoSSUI4JCJvgzGx6INbZpM/7mTtG53Zpfw5T6Gq3NrodbH4INbEmJ9uQlyIn4fXTlGYVsTEPQv0sww04EM57CxfY6zWmHqN3KUwxBMi0oGkUuNKv12H50L6hhBIipd8k4jq3rAkfF68MI5zWDW0Fnuoxw/wIxuMpPFqCykakDG0OnPtORyZ+d/TzQ==
Received: from DS7PR03CA0321.namprd03.prod.outlook.com (2603:10b6:8:2b::6) by
 SJ2PR12MB9210.namprd12.prod.outlook.com (2603:10b6:a03:561::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 14:07:06 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::3b) by DS7PR03CA0321.outlook.office365.com
 (2603:10b6:8:2b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 14:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 14:07:05 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:06:48 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:06:47 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 06:06:44 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v13 2/6] i2c: tegra: Use separate variables for fast and fastplus
Date: Tue, 18 Nov 2025 19:36:16 +0530
Message-ID: <20251118140620.549-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251118140620.549-1-akhilrajeev@nvidia.com>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SJ2PR12MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec95162-a107-4de1-6417-08de26abc129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PRAhR7eWmaBRy0vtemzQpSQ27Dclf6xrCLOll6n29nLLRPjjKG/UG6TTIlAF?=
 =?us-ascii?Q?FsTqNn36a71DnNn/uo5AaiD+Kqvmkb1mt1CO70lfxlzwUWUlXOzL/O30Fwgx?=
 =?us-ascii?Q?GHge5Sp7yyj6qR3F+iNcwuUkUX/29lrT2dM36J2CkpyHdZamDU4a6cqs3ciL?=
 =?us-ascii?Q?I4vq/E2JWhNnT8//gEhVgByQBmfXJOAUAsv7Svoznojcl0B6ApM83gG3a5jS?=
 =?us-ascii?Q?PbI+R8DfJsbu4ngnA6UXmhG49lnd/w52TJfcVDSKDA4z7zO/PMDAHO995rHJ?=
 =?us-ascii?Q?HpgGZzL7H50kdTPk+lHxeDILdLrjvqKJ3mUWU8j8oP7LU3FA1VTdAVFCoCNB?=
 =?us-ascii?Q?hc7uzx04HGJojp82SK+F5ukVIWTWWvVZXMWTHKU5tPHMZgELRrBdkDWcZ6cz?=
 =?us-ascii?Q?wAugVoLXX0FQvc7sanIu5usisq9o0hGwEaRjtoY6Z73hoDyBkmqyy3mhH9Lz?=
 =?us-ascii?Q?YIhCC0LIzuseWgyqrAICGtQe93MmhWdBQD5D9sj6janLIqmZlmdTjB91rjJI?=
 =?us-ascii?Q?TwJ/zq9g5ehRng0cTDCcjGPTMVzaWyUnwaBi+CxfKeDnUNz+VYoE/2EFyE/+?=
 =?us-ascii?Q?sjPdV8uu5TVoFXJwBT+NzbAf1nTsNtfeVibU/ZRIBSnjHHDJPhBtQu7idIIg?=
 =?us-ascii?Q?wd5XziH/MxlBT4K/W1dCHEKfI+7ejA+myzFW08fV5xUxiSbrEJuydIzazK+a?=
 =?us-ascii?Q?+T0jN3Hw5K+bxZnPhG4Bq7X3uWo0IxvUu+CtORFcjdOBMGQlEvx1KU8ioM2A?=
 =?us-ascii?Q?NH4UXfDCJjuyQtk0LcZYeUTY4+v9tOLoH5tiKFV7UIvxyrrQB1nihGmY6gSm?=
 =?us-ascii?Q?wY6R5qG6+jJtit7uCUvFxM17bUmDBFXm76UpJ7mOttGH1mwU2ZahCdhfDWtK?=
 =?us-ascii?Q?hzHPbke9FiGaDX7wa/OgQu6YQdT9+lXhzOycjamlZBiecldSRRCpQaKSFahS?=
 =?us-ascii?Q?21gY4V1aQEzyrZDOsptKTLBDl0OOOI7239CXBjkbrNTWYNbjmFR9MoUFs9qJ?=
 =?us-ascii?Q?s+Y6I5NtIFMB7eWV+D51giqT9Fh4kUAlVQKPwx5E9WVSw/c6blZsjWKzYFP4?=
 =?us-ascii?Q?ID3BcBVMtWVu4dMW1ENo2YTI4SnS6RbVC1VL/9NaOo4uAhTtYYRVchRAxPmv?=
 =?us-ascii?Q?nfu0pXCKArhTbvQcWRFKiMJTV0STeajEKECBvCwyKBERK3FEMLuS7nKKW8Aw?=
 =?us-ascii?Q?XXhtZjxtLCxStMkcDc9YoQuBMwBOJiwl+YB6TdpkyzR4NaxXc3ecK847k4ud?=
 =?us-ascii?Q?2i2y6NumZ9LNFRoVx47wCiyX9gp6ZhMaPu/BAQoDrEWoaVPZmmK3boCWLw/q?=
 =?us-ascii?Q?cx8dxuynxGQ2i0370YzGGJXHfIyGhNMEp7LzDeSPXW24UPydh+Q+5oG+h1Dx?=
 =?us-ascii?Q?IZ7nhXQJV6RbXnsHOWCV4r7dTIUI7SrYGKKbekbnxUAcPjwcLHzxPVhnTkh1?=
 =?us-ascii?Q?ugbhNNbO5RqNfn1rXLJqjwWlBRxt91JhYWnWxoUL/k/Usbl+XbeYf2RJyyzS?=
 =?us-ascii?Q?cNGa0V7QKbbTf7k1fAiReYToTELW72TjsIg7RbQo/uNqCEZuSYPZNGwETS+I?=
 =?us-ascii?Q?kWnnn5tEvADen/ba0Mo=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:07:05.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec95162-a107-4de1-6417-08de26abc129
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9210

The current implementation uses a single value of THIGH, TLOW and setup
hold time for both fast and fastplus. But these values can be different
for each speed mode and should be using separate variables. Split the
variables used for fast and fast plus mode.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 119 ++++++++++++++++++++-------------
 1 file changed, 73 insertions(+), 46 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bd26b232ffb3..c0382c9a0430 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -196,12 +196,16 @@ enum msg_end_type {
  * @has_apb_dma: Support of APBDMA on corresponding Tegra chip.
  * @tlow_std_mode: Low period of the clock in standard mode.
  * @thigh_std_mode: High period of the clock in standard mode.
- * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
- * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
+ * @tlow_fast_mode: Low period of the clock in fast mode.
+ * @thigh_fast_mode: High period of the clock in fast mode.
+ * @tlow_fastplus_mode: Low period of the clock in fast-plus mode.
+ * @thigh_fastplus_mode: High period of the clock in fast-plus mode.
  * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
  *		in standard mode.
- * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
- *		conditions in fast/fast-plus modes.
+ * @setup_hold_time_fast_mode: Setup and hold time for start and stop
+ *		conditions in fast mode.
+ * @setup_hold_time_fastplus_mode: Setup and hold time for start and stop
+ *		conditions in fast-plus mode.
  * @setup_hold_time_hs_mode: Setup and hold time for start and stop conditions
  *		in HS mode.
  * @has_interface_timing_reg: Has interface timing register to program the tuned
@@ -224,10 +228,13 @@ struct tegra_i2c_hw_feature {
 	bool has_apb_dma;
 	u32 tlow_std_mode;
 	u32 thigh_std_mode;
-	u32 tlow_fast_fastplus_mode;
-	u32 thigh_fast_fastplus_mode;
+	u32 tlow_fast_mode;
+	u32 thigh_fast_mode;
+	u32 tlow_fastplus_mode;
+	u32 thigh_fastplus_mode;
 	u32 setup_hold_time_std_mode;
-	u32 setup_hold_time_fast_fast_plus_mode;
+	u32 setup_hold_time_fast_mode;
+	u32 setup_hold_time_fastplus_mode;
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
 };
@@ -677,25 +684,21 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
-	switch (t->bus_freq_hz) {
-	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
-	default:
-		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
-		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
-		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
-
-		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
-			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
-		else
-			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
-		break;
-
-	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
+	if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
 		tlow = i2c_dev->hw->tlow_std_mode;
 		thigh = i2c_dev->hw->thigh_std_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
 		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
-		break;
+	} else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
+		tlow = i2c_dev->hw->tlow_fast_mode;
+		thigh = i2c_dev->hw->thigh_fast_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
+		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
+	} else {
+		tlow = i2c_dev->hw->tlow_fastplus_mode;
+		thigh = i2c_dev->hw->thigh_fastplus_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_fastplus_mode;
+		non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
 	}
 
 	/* make sure clock divisor programmed correctly */
@@ -1496,10 +1499,13 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0x0,
-	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 };
@@ -1521,10 +1527,13 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0x0,
-	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 };
@@ -1546,10 +1555,13 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0x0,
-	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 };
@@ -1571,10 +1583,13 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0x0,
-	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
 };
@@ -1596,10 +1611,13 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0,
-	.setup_hold_time_fast_fast_plus_mode = 0,
+	.setup_hold_time_fast_mode = 0,
+	.setup_hold_time_fastplus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 };
@@ -1621,10 +1639,13 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x3,
-	.tlow_fast_fastplus_mode = 0x4,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0,
-	.setup_hold_time_fast_fast_plus_mode = 0,
+	.setup_hold_time_fast_mode = 0,
+	.setup_hold_time_fastplus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 };
@@ -1646,10 +1667,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
-	.tlow_fast_fastplus_mode = 0x2,
-	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_fast_mode = 0x2,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x2,
+	.thigh_fastplus_mode = 0x2,
 	.setup_hold_time_std_mode = 0x08080808,
-	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
+	.setup_hold_time_fast_mode = 0x02020202,
+	.setup_hold_time_fastplus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 };
@@ -1671,10 +1695,13 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
-	.tlow_fast_fastplus_mode = 0x3,
-	.thigh_fast_fastplus_mode = 0x3,
+	.tlow_fast_mode = 0x3,
+	.thigh_fast_mode = 0x3,
+	.tlow_fastplus_mode = 0x3,
+	.thigh_fastplus_mode = 0x3,
 	.setup_hold_time_std_mode = 0x08080808,
-	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
+	.setup_hold_time_fast_mode = 0x02020202,
+	.setup_hold_time_fastplus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 };
-- 
2.50.1


