Return-Path: <linux-i2c+bounces-12098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51699B16E3F
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 11:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4B5C620CB5
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 09:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FE82BE639;
	Thu, 31 Jul 2025 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hKKGf/1c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B5D2BE626;
	Thu, 31 Jul 2025 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953134; cv=fail; b=MH0xo4Bvx4eoocK6Y5+dDRsQlgWTsJBqVk32kSBXlRxAp9zpsc6X7qmBRfHZS9V1NNXyGauoXGZAzcfFtXsJWMO+RxMKWeipd76zq8ddg0eahpqBtk+CFT2uYVdCE4zUxFkCK9cmX10hQZZHYA0u8yzZnMiH9IX8I/EN0u/MHfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953134; c=relaxed/simple;
	bh=yRxEMASIRXSmEMhZZQDhErxdZBDKDcpa5yPZX7r7Btk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j0EibSZtGDtsZWIGvnYHATQG/9TbzB9l3RfDX0OlIqNSZQZcdQ1JB/iDHYxPlM/qXL142AzCgXfUMDdkvFRvN76Kj+Y9j6sx8oMdbPQWuRDgkCUACz5BzuyqrXtP3MbuiLLuYIrLt2ZHKnALroZb+cIws268zxaxQ34RmVfYU9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hKKGf/1c; arc=fail smtp.client-ip=40.107.94.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUDyv8D+4rHT49Rw5iMMjTtzTaUVdpC3oQlWBXP+raok3IG+9Mf/avKgUonp4K1f/sOnahrLQklcbF2EwtC6LsTMdWhPC8voWxxQzIP/MXyviyefC+6Ip390RJO2uPhujA4V2m8LFEiU6QsCTdQuSBWXjFDLSJ2zF4yourlQGBwcagB1laNrjBkUkdvIWa0Q9HSBfG+G7g9DyeNNou3fKy5nniF90b1JS9c85PVREsxQvsD7AS66bFASRLrGsbj9WYpjhL9K6lD+p1LWVCJIB70FK+Tmi7KqlKoEKSs6CE6tVqm78243FaJ9Xf31eBbk8Ac0PpI0xE7TgymTfBUC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7st2Hb1kzun3/W27AHxJI4uIdSw5mxhoqlBIoUyIs8=;
 b=o2e2gwQPcf+YMos18VVKD7PnBVE5avmKEcjv4NgzbqiXvEHQtB2CCJmZ9lUb5IO/3+QmPh95EMZayKV98UwzM7hoGxtiijKqcfXnY1cGXjWq/QZPcMMCA+0OVI1MFTN3RACnKZXCr08OW1XDqJAyzuUkzroLNK8V1enx9gF2nER+VBnQEeVWwq5x/FV2OZN9bo3+Ds7MqLIxwIxMbWvMvp8JRDl7MW4fULQOs0xxMmAQNkF+I0+Wjb5unM8v/MUfTAJ0Rm4w8z8MwUZfAXgyat/D48e0Irz3ulns13vdrR1dzD8jSctxS6jvSOIr5ogXQRHZVruMfBLUoiOohtHA/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7st2Hb1kzun3/W27AHxJI4uIdSw5mxhoqlBIoUyIs8=;
 b=hKKGf/1cW06d444tzjiVrJhTcKu44e6vuasyfVgCt8c+kEcjAsW5ccbSC8wcrbxlBbfaRxKU6pPYWfS1g45q2FEcQFJsDcD2TxXAD8J/xRYt5O05AyVF+4e8L+Uf95O457P1MhD8MgDBm75YQq7PKZYSRYmFrzgUSVSguunjRjBbq420JUWZzWhSO6couExeuIpyp/aSsTQsKtCtQrIZncsHGPrVg19IadjZrxaqyeNLio5xDwg/+rw46JAh+BraGeqnDqDWpp6IF2zjVWkTZLY9XnQ8Q8EkDf7KQBQvmOn7LQR+wHsZH1SK634ghwMWpUfmQsTZQaob2Vbqaqo1ow==
Received: from SJ2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:a03:505::13)
 by LV3PR12MB9185.namprd12.prod.outlook.com (2603:10b6:408:199::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Thu, 31 Jul
 2025 09:12:11 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:505:cafe::2e) by SJ2PR07CA0012.outlook.office365.com
 (2603:10b6:a03:505::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Thu,
 31 Jul 2025 09:12:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.0 via Frontend Transport; Thu, 31 Jul 2025 09:12:10 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 31 Jul
 2025 02:11:57 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 31 Jul 2025 02:11:56 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 31 Jul 2025 02:11:53 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>, <robh@kernel.org>
Subject: [PATCH 2/2] i2c: tegra: Add Tegra256 support
Date: Thu, 31 Jul 2025 14:41:22 +0530
Message-ID: <20250731091122.53921-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731091122.53921-1-akhilrajeev@nvidia.com>
References: <20250731091122.53921-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|LV3PR12MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d23f49-6081-4d7f-5f80-08ddd01254b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xNSFO9+tZnB0Q+gC8wEvEnoOHhp/2HNIx7+sGe7yb+6DW95iVz8ATtHDeChn?=
 =?us-ascii?Q?MZX6qwjS4EXOpONioIMpOiOUZQG9+vVsdu+N8/cQHPMnkcoToO4t04A5lhJs?=
 =?us-ascii?Q?AvTG0Nbh0BJl/ETvn/jkvrxCiWCSdbxXUJmtX70aQMCG33Mi894kkGiYNvjR?=
 =?us-ascii?Q?FzNE9VX8i8cOxbp9KFVn4htQgZEjfc2/1TNfETauKSS1IdRgQBRyXncFDUlQ?=
 =?us-ascii?Q?hOmA7PnUeL5rsTUdEL01HryrB1XiFFHkFq20+VmZUbxHo7g66O2og6k2S8Ja?=
 =?us-ascii?Q?7pgaTnT+Jj8rVNyGDwA/Ff7M3qnX+ddTUc52+Cxx+gazx+FkTWCd88kwDsIy?=
 =?us-ascii?Q?trqayTM9B0YXlduK9w0TFUy85iKPuCM3YG652of1Qyxt3dKHIGypmU/Yvqzg?=
 =?us-ascii?Q?oDfEFkKILEhVbFVWP2im4I6Psjrwr+0zngmibCW45KS+JMd73BWSGwDCs/el?=
 =?us-ascii?Q?SQlJUE3IvJtGnImRHpZ3EzXZ1nllr8IvtVLHwe+p3XHZIZtKdgCJU3eC3k77?=
 =?us-ascii?Q?lbjnliBS7XHvBdRx4+R76wLVszDA+rLueD3uQZ+odz8Vfhkvm7hAyYnfdlaW?=
 =?us-ascii?Q?88nxrRqEX+B1O3eFoQ6cMrFfsIQ6STjZXDWcKJdpFAm2HfuNVH7EnGZTcKrq?=
 =?us-ascii?Q?d89Puw1b8BIuv6qkEE8htkPQr0zTQL/MMZSzH9G3ZWLmZu/FgZKza1kNcuD2?=
 =?us-ascii?Q?pOdmYx1UElTEJrXIR28v0ZAR5dxBqXfgJbC/AnLstw0I+vAFblM4QUdKZVwW?=
 =?us-ascii?Q?hjOn+7MZyBynL62AtwBv8eKpbFsZDWgAZkwQZCCCcqB7bS8I5eNjixaGDXSo?=
 =?us-ascii?Q?Q8b5ZYsTaQUo3L3vXP/2M0Uu9TTSdgVIoaPO4OBSWJdCE+XyuICiCjXUfG21?=
 =?us-ascii?Q?qAnlHrTU4xqq2pM4tZHWSWmTAAwZ1X1se1EHxILir9YEm2H3Oe8qsfGgCFaN?=
 =?us-ascii?Q?lnqAjXW9WStfaLf6WLL2Vvv8bHpDUPLLiCTmeazewwBT0lzfoHuNP8VlyS//?=
 =?us-ascii?Q?BaBKT13/QVEpRMf2EBex+MFR65C2qxYcZqnWZlx0kVGADlTg+zrLXHp6sI3k?=
 =?us-ascii?Q?bA7EPQ5wBhWaQ5gRISjcIv05xNaojUzM+Cw6M7cqwEhF3WkjUZmTwXrqd3Fy?=
 =?us-ascii?Q?HyFb2BK4LM0O1dnWcEusWtgp5MLOmB38NCezyWTf0zMZlFqFrQajHynXcp2Z?=
 =?us-ascii?Q?4RXs/rul+rcE9rq5y8PCnYNAeo5HM8/oCvijls7Y7XI/JRv/5ZSQvzmEvDrE?=
 =?us-ascii?Q?jiwZCPCLUNSoBqCrMJzMlKpZGfGrpam6VY3ddFI5x6PoMKjWf1EOgO8AuaDr?=
 =?us-ascii?Q?PYgSaQLhhKXF2V/tVFOXE1tDQxT4hwvobWlIV9NBWkvRdTcO3En0zwwxW3ho?=
 =?us-ascii?Q?gourNVxRwJ4W0VAlqrfwGScFcL9NQOCCGRxGqcm2U6587v0TsQfilmPe53Wi?=
 =?us-ascii?Q?nwozk7RSuHB250TkVhTGW7lvH81a84KHN1gGFezb1C9machTJ/IOdfuc5FiN?=
 =?us-ascii?Q?eqSDvlH0Axcg1ej+7od5wyULpHRuMpCCOhONq1fyoJc0YsiK+Gb0xwGg0A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 09:12:10.5547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d23f49-6081-4d7f-5f80-08ddd01254b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9185

Add compatible and the hardware struct for Tegra256. Tegra256 controllers
use a different parent clock. Hence the timing parameters are different
from the previous generations to meet the expected frequencies.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4eb31b913c1a..e533460bccc3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1649,7 +1649,33 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 };
 
+static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 7,
+	.clk_divisor_std_mode = 0x7a,
+	.clk_divisor_fast_mode = 0x40,
+	.clk_divisor_fast_plus_mode = 0x19,
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
+	.tlow_fast_fastplus_mode = 0x3,
+	.thigh_fast_fastplus_mode = 0x3,
+	.setup_hold_time_std_mode = 0x08080808,
+	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
+	.setup_hold_time_hs_mode = 0x090909,
+	.has_interface_timing_reg = true,
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
+	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-- 
2.50.1


