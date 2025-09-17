Return-Path: <linux-i2c+bounces-13010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2EB7CF32
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BF5F1C06EB3
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 08:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197DA309EEE;
	Wed, 17 Sep 2025 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kUejZVdb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010040.outbound.protection.outlook.com [52.101.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2128C2FC00E;
	Wed, 17 Sep 2025 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758098279; cv=fail; b=gxlB9e2imdbt9g4Lld9KaS1nf0corv4vf7icnL61vXaNqQF4Pqzrr7IW5gCBWW3iGT7XJNOoqhCKcSI9xH0aZrfO9LFilcnxWVw0dK6/VoAzVogmRxcmqXGPIj3ePPYPHwO1LDlXyRAednL8KRGwKHeL/aLJ11L0aH7awo/nkgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758098279; c=relaxed/simple;
	bh=dCyMtahZDOWw9V2jfI1Ue6jCsRad/ueiZ8iUaDSRGdM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F9hoWdZafaqET28dHKMYivRZgNBUDuxF6eqDXM57wCBNvrPkjNhpaXj9ByknyeLYnsxhrQolOmj9+BkVWEd6iFpLEXG4uRGk7jRm4y6wpk1rWVx9VV2gwc4eXHtRjswoXjTc8/9b64yuGkuU9ynGDWmsBLK8GMiq/UzOWsMiTTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kUejZVdb; arc=fail smtp.client-ip=52.101.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJtKxOywV1//MieyLKqWYlJ+snHP0LvVRVjf0XN3Omd+7LfseeCwW7oO2uKlMKSdI5Xi08iRrEbRvfp+4vKXjVJ7LF/MMnSTPcoIELvldaZCFfkELGaHAYPRCTpwpOKZUVou1rfo5upZlxc5G/jCTItxARqjeLbghUjfQdWTYjqHzSAYEx8j/Vi6mXWhHnR7i53nyqGK/9mzakS1yv+aOmoA23Mbi9zoggGCfAL9EQ+fMKgXY9YKKXWNUuIhh6JBcEpszPOfkU3HWDV/DqWtx8ZZ8v0qtpr3dDtpfEWYNJyKV5Rej7RlL+piPLnsTeV2NPBxxSAYU2NgX4037kGS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRiMGOhMUB30O/cAMA735TNfX1F0oSBqiD4jt5EU0N4=;
 b=ng0mH9Q81frqguv7JpN6emCURT74NwmHfEZvZpENikz+MacPGpZTUY6ffBWvXgWKedUXlrfCPKP0oBbFW0YtDJ6qnA2Z4BGtr316AaY0dhC3gLtbyMbbWzwnf1K8I/Dc0Q6X3HPdq14z8G7uEFDzrPvnDAH9hYOsDZebcprsgFVmRzOvbNAMqI7rmt9uVLT+zuvmyVZg/hz7zWmB9dGfvIBFYR5bqtJaGocoGi/aaZPpWrSd13lqCCYYNuIfUfJYagZ2SgR4xtNEpCf+XOgEKPX1LjCVaTPDN5/Pk8YBcJNeOGmhdBNyPFQmw5WBiAWcdP+bjPyEvrMtQsLZbvma7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRiMGOhMUB30O/cAMA735TNfX1F0oSBqiD4jt5EU0N4=;
 b=kUejZVdbk9bOKtPbYj0L6Mxy7pGIFZhfl0puJ4zST70gHlPPBqNumKDFoPYt+et0Ex/mH6B0Yt58CO+Jhh3eOTERts8EQYC2ZKS5PQ1OFQ8gu7EUUgFeaHCc9SE8aqfhjQvFoRv7vSiqZEZca+7ce8yZjyUeHt2EnS9GkxPk8WltD0z+EdFLoH+m5cFGxn7BdAXZLZIPFpuojIv4RpCXs4U1RJ5tqc+1ahGeo9z+Tz5NPQHKYAwzAkxxPt+Rqkr4E/USYi29eUFvuC6if58EmWgpqVXVSF7ydXxAGXCDC8h3GJZQ5xwWr2zz52XWOn8nOZ+tiI97BMGkAjSuVJuoRA==
Received: from BYAPR06CA0015.namprd06.prod.outlook.com (2603:10b6:a03:d4::28)
 by CH1PPF93AB4E694.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 08:36:32 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::2) by BYAPR06CA0015.outlook.office365.com
 (2603:10b6:a03:d4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 08:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 08:36:32 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:36:11 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:36:10 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 17 Sep 2025 01:36:07 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v7 4/4] i2c: tegra: Add Tegra264 support
Date: Wed, 17 Sep 2025 14:05:45 +0530
Message-ID: <20250917083545.594081-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917083545.594081-1-kkartik@nvidia.com>
References: <20250917083545.594081-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|CH1PPF93AB4E694:EE_
X-MS-Office365-Filtering-Correlation-Id: 7868ae5b-425e-4581-3bc4-08ddf5c54e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XyGapMnJcWf1ktx6zHr2LtjruXxQiehF6E6pHXh6QLRfLm/urkrhnKSnkXZU?=
 =?us-ascii?Q?uzYv/iPCU2gbrk0hdj1W3PYVcfLSRt4HkaK0II/fEw0uz5nNP2BKAxgLwqsW?=
 =?us-ascii?Q?YIWjrvktCPHf58ua/USd3kY55rqmWH7Lqj8ajFERu4K/pCEaNv3IWarK3Xzz?=
 =?us-ascii?Q?DdQUoWvnP4eHCAsDvlVI6HaQoKgGzfqvR0ikO6/Amh8NqPvtbKS56uPH/efl?=
 =?us-ascii?Q?lrXf5j46nsV1xZq+CulNAerPhkEor/ZM4qtNPeYIQT2pGJ6N4/LOJgQkWjuN?=
 =?us-ascii?Q?NyazYovJeVFJUysR111ksvXIGqD3HTVARL+X30C96K8WLe2EizkxgPprGEsh?=
 =?us-ascii?Q?es2VxHXa+yHKc5RPuffigEG0zfrqKq1VrSXZFkYvw0F0Ti61U/Xd9uM5/ggX?=
 =?us-ascii?Q?J0Nt0h8KpInVY221nELpzgSsYcDdc5gts38I3N23ZU8+6YvLEso6XiCgA0Bi?=
 =?us-ascii?Q?QFlBvQGA2rTth5gVj6DrXQiy7kvCkBsH35LEHocI9oltJv1a6Q7o2Qn6f8iw?=
 =?us-ascii?Q?ZvgIvYgsxKVtc37FZxcAO5yl4HqvI/i76rG4Wv3Jl+zm1uhY4Yk8cIigfdSR?=
 =?us-ascii?Q?j1YVbgGMsAp3NOoKuzlOCnL6g56hrxZKUW8Xc/A7bFXlCkYvL4KxXU4Ahh1h?=
 =?us-ascii?Q?mHXWboBZ88MDRbdZkddGkPIedps3sXHNk/UMpKhih5T9vqeJnNcSqGDf8MJk?=
 =?us-ascii?Q?5Ns1CC4sTfia7d6nhkcVYTFFB6bO2z/rRRaFpNrm83DWtNpFr9mr0leBc3T5?=
 =?us-ascii?Q?6VUqy7jtGf9IsHokDp4++hHdWP4ejGkLg2T68uaW8OkgquDzTsiUbxpG0nLL?=
 =?us-ascii?Q?1ZgJ0h0UQINPY/djZUwHSQSxyDQ0zCyTbQ+6CZetwCLr5GhHPI7ce2M5aGun?=
 =?us-ascii?Q?WZYG345Uu7MDN2Vz5fRDOrJvUmMXpve3MdzBfLl+fCl/NICXFItPi9xoyeks?=
 =?us-ascii?Q?rG4cElUYavtcw5J7Yu0oW9nhD/yFYLZUO6LgWRf74goNli42pL3xSj0YUmT1?=
 =?us-ascii?Q?FOI2W3SCiay/cgU3OYW4vZvULt8wdAJTr9eI/iavXokJPBRxPQusggRf3oGf?=
 =?us-ascii?Q?NxfLPCPbsTcIcnJD34I2p/l2Or+A0/kHGaHxDERMMrCRnDfOABj4D/CUlr5L?=
 =?us-ascii?Q?ajcZKX8YkV1cH4HQyRmgfKQwneKWxl9j7ZKoX2v971OWpbU2wZ9FiX8wmMwp?=
 =?us-ascii?Q?+dDJpMoQoYk1tHAcFE1EFpDGecgZmCdBW239ODjAavN/zYKuin7Z2XtEjoW2?=
 =?us-ascii?Q?XpdkjjoUegyzRdVCBcNj6CxIxhc2qn6zK7tzFeDiqlka4J5ChmJtQjh/DyXa?=
 =?us-ascii?Q?kXtrTdCbVvUaGNUExHOT8MP4FZ5do3iAxaqNCc8BNnjef/KLZw+6ieXTxny9?=
 =?us-ascii?Q?et82OSPmTKxnKZhWdYgpJ3CYFi2zsKVnpR+hmO/vEydoWpl1SUlYkjOGn5EN?=
 =?us-ascii?Q?PCNLFJ/+ZovpOzBiBL/o+tgBrYgjcX8kCXObvbRW9uuMr3d0zvE+BBzMtFcj?=
 =?us-ascii?Q?2WCF4yUdjQtiD3gVDczVYvQ3h+SshqqRrBuEg+jKuR+8ESXBDTuvn9PITA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:36:32.4823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7868ae5b-425e-4581-3bc4-08ddf5c54e39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF93AB4E694

From: Akhil R <akhilrajeev@nvidia.com>

Add support for Tegra264 SoC which supports 17 generic I2C controllers,
two of which are in the AON (always-on) partition of the SoC. In
addition to the features supported by Tegra194 it also supports a
SW mutex register to allow sharing the same I2C instance across
multiple firmware.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v1 -> v4:
	* Update commit message to mention the SW mutex feature
	  available on Tegra264.
---
 drivers/i2c/busses/i2c-tegra.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bd254f5465f8..538711120976 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1804,7 +1804,36 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
 };
 
+static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
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
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
+	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
 	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
-- 
2.43.0


