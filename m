Return-Path: <linux-i2c+bounces-12432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F80B3570D
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 10:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3516D1B6541B
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 08:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFFE2FF653;
	Tue, 26 Aug 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cffZzPMQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3432FE584;
	Tue, 26 Aug 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197214; cv=fail; b=cAHOR8zc08+lugGikh0Q4FGmwVdWUefiGU1ZmUX+8MffhUYRdAkVY5pmxgRJMsjtqc7dWdfnQcT7MXQSr1lFn/sTNGdCPE11V7gAxiHsxJyTVFbe5CLqrASFxvvtGKkDmd0W1EOqtp548GrSzi4BlqD0BGuI2ibAx/EEAoLA6jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197214; c=relaxed/simple;
	bh=cxPRbsNQEs4GfTdJkhRIoUcV8/L2HHXg1Vd8BalR4Og=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gAqh8Jl2JvFExdRcLKpd3Ae/YOGjRoAc8azA7PBJbWRWTgulRPxRyq8/0DWNOQw6AdmnfU5fjP6lEkNHboHrSjKCqrK4M0jDVE0Dkm0xbj7vDPZzHA9od9CR6E8SWdBMfpdWw8F1iW3cDwi7azaj0dE9G4T/TBDTKWqi808vj9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cffZzPMQ; arc=fail smtp.client-ip=40.107.220.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPBDIdAYQcNN755qJPtA8hr7sqQhGG/dnTJlGS8gM2CSAAchgkGdeaPA2zXeji39G56VuN91dIYFAQCf8e3eAVC04yChJlnlTkhsRRg3V58kp7VPdpWT0DQWx7Cs+Xg004SPhFDkUCj+P5tcl6OUvJXF9IqZHbxLv2q6SHlVHkkmCztLjmzOYh8h9hYdyB51GaRPkP3exJVbeRd6/V6JVYFnrjUtqASZQFZnW26YNi9wFcrWDFvRsYL0X3ZVseUc8ya+OUbtiHvCYmweqOmxwj3YYzq47pn6BJiQ0lw73apu4pAM5esTtbDOfteNN4PD62a6NV4gEY08WYsVmhdXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nceHASv1qeWUUXXE9UblyzLtvrTcYzI6/clJ6b6GuTw=;
 b=N/zCyAz210fIu1Tj05sdWr74OVwzwQ52tkX+u7lOov2nED5rkaYCZE0FLvddK8yGMSxyBrkkHAORPoDJi6TRHlfA1VlJ1sJT8oa7nL5kCz8Uo8+dfQYcujqkzr0fk/HUmU3ASHOdmQDIjS0bv/1YaaZv7UvQdokia94W6wHG9fIcPvXFe7vqHoC5Vq9uT1fUsAOufGuyYaMAI33t3vp4wr6FsOu84maIZ1XBFQqiGARAHB2tiicQnrrmLcQO71ILPB8lbdve1NOrHqcT0FmbKDRyx2YvUUtsN3G/TddHkDmn3ZZvGTez3sEBWRJIlEt4GHN34EHiCaG1/Y5sMW4NdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nceHASv1qeWUUXXE9UblyzLtvrTcYzI6/clJ6b6GuTw=;
 b=cffZzPMQX7TB/zgsbRemMbAwEqy9YUxx28tpIw8sp90z8jT2Q1t7FuKDB6Nx4UcyNhxxSjDA2QcE+hUYY/G8HeaNz6jpaqGSNBQtUKAUFHcJct6OoAENEVYHw1yOhqnUxSQWQ0zTTlfjTujQWh4dPAKXu2MQmRTkaPq1H8irr9/LHQmtpB8LqpStay5dWOZcVYow8WjxlcQuKVykyUmWn0BJK2O0VUSCnK4O75kdD8IoCymAJK5BeRHVV41ckZZyjrk6RRJT9Uz5V7ppcXxkmvmgdadyRHHcl5v9UjUx+f4Oq6oN6ugesat8otUPJngM57IJazoLRwx52+EzWhFbpw==
Received: from SN6PR04CA0078.namprd04.prod.outlook.com (2603:10b6:805:f2::19)
 by MN0PR12MB5836.namprd12.prod.outlook.com (2603:10b6:208:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 08:33:29 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:805:f2:cafe::e3) by SN6PR04CA0078.outlook.office365.com
 (2603:10b6:805:f2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 08:33:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 08:33:28 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 26 Aug
 2025 01:33:13 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 26 Aug 2025 01:33:13 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 26 Aug 2025 01:33:09 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v5 5/5] i2c: tegra: Add Tegra264 support
Date: Tue, 26 Aug 2025 14:02:44 +0530
Message-ID: <20250826083244.487610-6-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826083244.487610-1-kkartik@nvidia.com>
References: <20250826083244.487610-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|MN0PR12MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 3584e989-53f2-4f41-e0e6-08dde47b3b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8s4TVLfvzRrXxcUTr+93SZ92RfAcWsjZHVv4Wp158pLEVhFY8wZxcChP7ASU?=
 =?us-ascii?Q?LJTzeDC1bK0lqb2A/ogybjN1seDjzFX5JFm2S83MQjgatKxJOiyYd1s2cmWO?=
 =?us-ascii?Q?nhRLHqPWbcC6isLIhrwBGnGfSY2INMnKaZ9dtZz2jA32kKfzk1vVe274LGfi?=
 =?us-ascii?Q?lRj+COagt1DlXYobmD4T+0sHPoHg1SWHmPb+rcVFX8I+Dd1k1Kc6iqFTwNEW?=
 =?us-ascii?Q?OxdBiVYtiWOD2Prev8BLxL8mo+nS94u9BAKi2XIq+bGnhVnF4ZdXaR5ffBuG?=
 =?us-ascii?Q?STC59xSveN384VxfttSltFFgpMrkdts7YtZmMevUahhZhMc32kJ5k4cvXEtP?=
 =?us-ascii?Q?EPl/O31J2SoAc++tjN4srM6TaVET9sYy/XUNwHEOYGQgz3hqae5qCF5cDvye?=
 =?us-ascii?Q?mwN7WzsDdcfbDD/Tt0zfOfENuR7DdopHwcn210lvecT2GSk/yGK5vLkVhdWS?=
 =?us-ascii?Q?ZBcFxg6ez1dqW1UONrvdkqOIvDiS/4W+nwMRjjxKrzjnWw8uF9oaic/N6F3h?=
 =?us-ascii?Q?wiroDmI3pBjBuGOGarhupU/hLMjg5QvwmnNyBlwT6I0yvy8ziRMRY+X9ikmD?=
 =?us-ascii?Q?fWJM9N5zH8XydCMW6qzMTuExXOrsBLev8LuoQ4X/ZvfVw3+eq16NMi2azbTH?=
 =?us-ascii?Q?v/pYAMrwGeA2PIsqSbvu0FQy9taTU/fFJiT5V6sZmLn+Qtw46DrC7OjDv+mJ?=
 =?us-ascii?Q?N5xRfxo0Aco+1lU3GnBMZADvl3HPSNtwSKON3LgTb/EDIQ7zHnD49X12TQHt?=
 =?us-ascii?Q?5uWur5x6iKzLijAtQ6Let3XMXSsicjEwOoUQ4KweYmTQZWg7d3nHkqXLdrJ3?=
 =?us-ascii?Q?mmLG42m32kfLdF91x+F2YNXkchnp7LvKMkfkHlDI4XXIlc0MB/l7+mtSkljH?=
 =?us-ascii?Q?n64tiFXO6c2y1deqHJkngDxi6jAFrrOEygowdM7zqquUq+cZ/pWSptWYw2r0?=
 =?us-ascii?Q?LApIbMkSvIUswZ4hQNSgphFpqWeHUvYZM/PRccara7mf0r5pwsQPaCRYMIn/?=
 =?us-ascii?Q?VSSoIZJWrzxHJrjhhzBuLxFvR1LABcJ9k+HXbJWyZ4G0QPv2N0DguZH66WRR?=
 =?us-ascii?Q?CE07NXOCika8jUMnnQpb0PwxWeWxkGowQ1AHBFgK4C/dGkbaiKDgXJwss75r?=
 =?us-ascii?Q?RP9pCiS0XFJiUAfqnTFyqaVkefaFj/cJeBeAbtnRyAZ+kyt8vHoUmO2V+fr2?=
 =?us-ascii?Q?fPuhSRncrPI5KKl8RKjF+N+MB1ISta6iq4r1nUbl20U9SUfmSAI+Oog5WYIU?=
 =?us-ascii?Q?OM3iCcoTEY+Sjr1fWrSCy38zVBDaB1M0tAEfSJ3Yb/2npIk9k/S29WFKaEBY?=
 =?us-ascii?Q?+72rfNCn+Hg0uIw1y6G44AiYGhamHz3WocOQ0QB2KvuKjGNL4i2OaYg6aCsN?=
 =?us-ascii?Q?ppErmvis0oAP1Z+T267/MEx8ZYpUQffs2btUh9QCOGZY1t4qHzCcz3KUAph3?=
 =?us-ascii?Q?+XSuhU1a1MPqPZF+40U+slp9tBajuE2vSamxI4gUQiRC+RyTrh1ZDqexlchW?=
 =?us-ascii?Q?Ol0Q6jduWjZQR7XI4HwqvclNOMQpFyAYjUofZtZLuYCI5nt/DAdpPv7Iog?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:33:28.0037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3584e989-53f2-4f41-e0e6-08dde47b3b2e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5836

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
index aae1645dfd92..2acfc497126f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1779,7 +1779,36 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_mutex = false,
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
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-- 
2.43.0


