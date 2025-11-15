Return-Path: <linux-i2c+bounces-14093-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D9C60006
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 05:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2EDD836045E
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 04:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575FE226D0C;
	Sat, 15 Nov 2025 04:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iiDwdlWv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967EF23A98E;
	Sat, 15 Nov 2025 04:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763180913; cv=fail; b=NTozCKrEw8o91ljxTudNo8v/fb2ZSXwGKyyhFlB/VEJ5OD/DV2Fdvy0H9eh4VVz3jBQTCklA2s+HZ6rNfw6pgjJl6w0l+cFaUvsqAv1qbtRA6NFUhr167fE1wGTvXktsRH7PyFlsRte45My335qbZtLe/8+rs7fcI9iN24oH/NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763180913; c=relaxed/simple;
	bh=Anll+CYZ8TGjfsbx2sA6foUSS4paNtjxD7A3TPmwiDk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VcOMmnFWwlxKTjoGVSsEcG9T7cyygYJATVP8LKwsrVA73Vwv79x4dk+a4MppV6pWPUEWP2v/cinuYy/xfk5s0eF9egyTobjP9MKdTy9RfnqANrlFQA1kSHyB2LasLzZREO3sCrHkhi5uqR470cXb8FD/s2qnQlAHyeAuvYagQIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iiDwdlWv; arc=fail smtp.client-ip=52.101.48.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQLATJPLoZ22RZNu6P/6nOy8IdLnw6UGVz7ZDCRZG0rH/cnnNV6yqPGZBgmz++xTfz66FknPbMRtS51DUbjm6RnteapvA9fIJNKbBV0ERk6TtqEG0VgeEllgXGJ2b5vIH5Q5mr3FjLW2sPhVfNdHm7ipB8d7Nk+GH6cPPTSXnlx+uwlSOSmRW2OeueKkRsr4LaeObLNez2MlIMOwnBy5Z7Mi+C/D/WQDugS+qGufxltnbZQezgt9hRstOYum9u4KumZFnlbMPhiNtLoURRF0zLBw1ZmETx+71qTRyqD0qCp7yNlNB6WFma5r/Vh6LnDWemhyyVlPyPD8dBu3wkAK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3AkBPST61VFT49wvCzn25XCKGncFuVQFdmO7p6ELHA=;
 b=LzeuZyHGOMqkolObi/nKtUzfDzqlhNQD/uQKDv+VWg8VU+ab72bqrM9FXXuDkCT6CDhebtEU96TOpNd+SP+07m7sZ7gpSB1CLHu97gvWOobHc3Levjj9RSSPV+01jagZm63rxXkPnFRIguvO+D9ZDm+MXKlUcjhHkb0q01L5sPtukqfNMnwd0L/0R1bo203tOwPlIxpLDCWMgBowNoQUgH3479zTVBb0pzfCIHfSoI3oSFDNNDV7vvL1SizyxhCYcHAWmgiF8HOS2PNmnkiAYnxbeu5RIrJnZzh2ZFrjjsjwlF0Z9rm2pK6VLwAsYgQRuwWzR2b27ABSI7c01E8kfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3AkBPST61VFT49wvCzn25XCKGncFuVQFdmO7p6ELHA=;
 b=iiDwdlWvvIsQXb6GRGdea1nFFvMxisVWJPCNcl2VtIikvkLRXf4YEKE1QJ54hezteKPPI7DquXJAaa8UgZ7ApiND8kiBuElP6CcvxW6qcsPkG9rHDtb+L9atOYepLJ18czMFpHacJKrDqpjOhO1xKkddZ4kNNMRWvAmd2TmF9zd8fbgkoEZ047InP8gyJAHOFPSB4nGLxN1hAzTQ8twpmHfRCLyHEWxYKzP+dwzSxIQCo/jEi+iQLtA1Vfh61b0Nyd31Q4ylt9v/HhCQpqhmiv9d6AWkAlXDsBL119+h7NFBUuw9LIpODBB21sUBnzRCdPvtaH1NbWLMDRy34d1i0g==
Received: from PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::30)
 by CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 04:28:25 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::d4) by PH7P220CA0013.outlook.office365.com
 (2603:10b6:510:326::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 04:28:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 04:28:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:28:15 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:28:15 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 20:28:11 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v12 6/6] i2c: tegra: Add Tegra264 support
Date: Sat, 15 Nov 2025 09:56:32 +0530
Message-ID: <20251115042632.69708-7-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251115042632.69708-1-akhilrajeev@nvidia.com>
References: <20251115042632.69708-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|CY8PR12MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 722c0354-c346-4e74-7c97-08de23ff69b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mkXCnlZ4Y49hgU72RbbrmYueMR+w72jCJ1NFjSycg9bAn3qjq7Qxip3DHr3H?=
 =?us-ascii?Q?AktPumATLHdPExRZUxF/dK0piX8xNqqlMSNbOotgR/Wfku4ZBMHpla2+qXl9?=
 =?us-ascii?Q?tz26rVIfP3g9NPBs3im0fMt/9gdeMrf+0DIcW3iKV+xRvidLK/hNqeXvaQEv?=
 =?us-ascii?Q?sh0VIeysR07WY2dus/Hf+51zthqr0miWpaWXE56FPi7heJdMUV3CSOWa+jXy?=
 =?us-ascii?Q?Ab3Z5IA6/MSxDo/noho7jCpL0Dk5xHeQp5e5izNxyNmGmFMqw9jt1liRfXo0?=
 =?us-ascii?Q?FCDCk3sJz6il4paG4f76VwFddBFuN2XaUSnvEK6H9khCex9cmsJlyNdw9V3y?=
 =?us-ascii?Q?TVRNzy2+lQLCWdSqjKNXIKFKecUIGw6xWV8cANLUED8vJjt5q3Wy7D96Cp06?=
 =?us-ascii?Q?Ua4mE4VRFluzmayKO3RYNITJj59nj+wHvYFzynJbMqxAo7hI/5mCCXh1iL5Z?=
 =?us-ascii?Q?Wj8QdsgxAJ5UvHr8nNusom6jA4g9sgGHUfenejxj4OyvZQvs0CNZHzwC+MS5?=
 =?us-ascii?Q?5LXVtyO/Wjpy36uprn/FGHd7/02ISpcn3PSLiP4JvQ64mclkd7ca9LLSQH8v?=
 =?us-ascii?Q?w/Xb4/GVjd37eAKuS44mP2kBxumi7fQLQxNezPQuxfonJ/aFoegCvUZZOem3?=
 =?us-ascii?Q?KPbJaT3VmkHPWNVTYuUR/HWTnDj6nzP/MD/BfOGW60MwyWs6AiR6EcVoBvgu?=
 =?us-ascii?Q?OSsXZIjKccAN7oBJFbdWTL/HnZZT5cAu8EzjLsScdMvCHY35iioOwrj4m1/X?=
 =?us-ascii?Q?k3INP/Pf1pgVHEZ5rgcgzdR4/mAgfMsO7QPONvTz5kQDBCACfouIa0/Iw6Y+?=
 =?us-ascii?Q?Tj+prKKACTV/IOwcSzrVGyuDJ1IGxjHxdLZlDUYWURCpF19ewI2kmv4NgH4s?=
 =?us-ascii?Q?LrIbMuLObAqGZez69g4fRgqJL9llEWogU6GDk+RkUGIgmcyfSyP6Zf8l8N+K?=
 =?us-ascii?Q?91ul+K3RZprBSeOKZPo3Qt1JVECR2EwLL5DrMGkW3ry5RfMcclhM/Q/BgIOX?=
 =?us-ascii?Q?QZ3SjJeiqeZwZn1ZXXUVhZQKTMS05/58Gl08Ik/Ii34bnwaDDHX6IOZBFZfj?=
 =?us-ascii?Q?znvmpRjjZP+C0cH0K4vwxkez1aTfSQppsEy4shbLra3xjfnwpqdCIgpoyJT6?=
 =?us-ascii?Q?w39QEHkCBY8yumA92+OPuAiKg4NzEmd6si8fs/ie3KF4RBwGHA2Fi8It99XG?=
 =?us-ascii?Q?NvhDl4GffuXMW3bCY8V5fMYudJ5jUzJ0w8Fg5E2I2jKALOu6mOWO9SXrVQW/?=
 =?us-ascii?Q?ePnq5+JRlRVWnQAy9SlMsXjcDGnCeECCijx1N+KRpbqwGdMeDWkWzIV1szXN?=
 =?us-ascii?Q?wdz4x+eC+Et3QB05nbCeTjLX+bynbI0kVRaEHkVp9AVK03bYj/iBip/QZrfr?=
 =?us-ascii?Q?TAVotIMq6RUz7EYjUZVg/X0sQw8yM3lzO7KP89zXG7e76lfjSqwhP9krgjzu?=
 =?us-ascii?Q?nyjtlA5RuJzvDPbJJvthmfMylTYIGBgi5nEr9E6bjl5liae2BxsPswr57NO/?=
 =?us-ascii?Q?ZJstYQlqLVkegzXFIAbUBwH36CKnmQPlrAaE45ZbbwOr52KFxFyNXbWhGxVt?=
 =?us-ascii?Q?+BcmzA7ycJYTSaRS+xw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 04:28:22.8027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 722c0354-c346-4e74-7c97-08de23ff69b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196

Add support for Tegra264 SoC which supports 17 generic I2C controllers,
two of which are in the AON (always-on) partition of the SoC. In
addition to the features supported by Tegra194 it also supports a
SW mutex register to allow sharing the same I2C instance across
multiple firmware.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
v4 -> v10:
	* Set has_mst_reset = true for Tegra264.
v1 -> v4:
        * Update commit message to mention the SW mutex feature
          available on Tegra264.
---
 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 135883388c1e..919ef408f3c1 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1852,7 +1852,40 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_mutex = true,
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
2.50.1


