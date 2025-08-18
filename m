Return-Path: <linux-i2c+bounces-12319-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8216B29833
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 06:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEA012017DC
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 04:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DFB26136D;
	Mon, 18 Aug 2025 04:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fVhNP1gG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387831990C7;
	Mon, 18 Aug 2025 04:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491690; cv=fail; b=LZp94lhm5J90IV08+Ns/PP9PO2rzBHNhZkVZfGp/20pAI6PWAcPC4usesuDYvyPd9FOZbUCJtLO2EcyrQymuFMrM+I/UXMZtdtbVQtugJcZ2b52xS9FDmaGL9eUYXNexL8sA6aWgtT7CxY5zgkKowgHK/UBYJQ2oXUyaFz5Uejo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491690; c=relaxed/simple;
	bh=u5bKl/NuSbEbA1e9VG6yOmnBlIEiefMBlv35YwTeTUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tu2pLwECdUs9zn/h32j95lI0ftMI/ukTB7N17rPgthgRikhUqiaiJ8TAq2OHvGR/aRM2wSaEShb+aiB8qzmzMPbEA7Iir0ewMmGFcmPRjkp0G2QhmOZHjzSm7lPCwtmf70AapOTWwPsIpmm487DMNCkqWf6ZHJf04NlFter8N9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fVhNP1gG; arc=fail smtp.client-ip=40.107.100.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoWcMhXY7uc4NqteXY6XUl1z/u1uj5mUy217gA3fGjTISdngnAqjKA5KDqF3Qa2YMHzIKqgJHuBbHc9MNDm0BfxbOn/Bo+OPUysiSU+/bJ5GGlWEDKfA8KuMxZTIEUboZn+n895lgcW+byi/DdjRj9GjOxfftz2mdviE9f0CupmL3S+MsJ4P0fsjwKFrvzZFe2mlxne9/EUEmAdnehxBdx0pBynMsA7uLC24A+fM4rzh38yJ64UR7mcGM1eS6TWe1vprUslU59oZ3sg5bJBIYhYSl5AC+8cVyaqKjn8Ux9Y9MBD2f2by3AnZ+vQKe+eXb2Hj31WPApp7wfeDC9qWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLdpwbc4qXU6fhwdsprmb5qYscljC1kFomI/QJQ0Lm0=;
 b=rpn+oJWWQbEYc7BWoWe1gGXZaPsAjp7e04m4/wgO3c6F+XbAkK3pRptRAeopb0KlamhpF3yMKKkiVxRESZqkwIcoVvqDZyrtvEkNWCDYuNWxPysProt5y9l825zjf7kWOx8Ts28fJetM6Bp44pcDsJ2Udlr5ONHM0Te6u91n4lxkmiOruKo+1veahbuB6G09VPDfJYQk7yZZGSa0h64mYeaAu+XwX61/HqcVOzFq+z1gW+K5tMaDEbmU3pjABiYjCk1o9erBdccDtfooQORfc6MLRtjgWWe2G2KSleejL+Lso6k6FtBRPH9vS8d1Pn4/7U05fF+upDJKN1LLZIm25A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLdpwbc4qXU6fhwdsprmb5qYscljC1kFomI/QJQ0Lm0=;
 b=fVhNP1gGeBlp7bMhZDYtq2bNQ+0Zgqdc/z+99w/i5XNOr98bFt3KhdtopgO6chExQj0MsXCUmodpeT2AENZHuAJQI9pJ+JH5/mN+rjhZr3JumkFrw1Mq17AdXoFULL7f4xHfTgLNvOXBo0ycxgDU7r63pAnPqOQtgCxuLhaBP1EnBpyvnGctTVMXKad6qnVQ4UuwcuzPK/b9xpwqXk1+9IvsWI+6R7z2kLa3cjIUVfK4WiS+6WjGA+sJlUCgCAbkvDpAzWAYSzaEKs+VAPizJYOUQUGeIGxHr4kA9O2Anq1hFxVJbgBLV1BERAC5Vb5vuraXt2xpQTLzXAnjBy9IvQ==
Received: from BN9PR03CA0033.namprd03.prod.outlook.com (2603:10b6:408:fb::8)
 by MW4PR12MB7357.namprd12.prod.outlook.com (2603:10b6:303:219::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 04:34:44 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::ad) by BN9PR03CA0033.outlook.office365.com
 (2603:10b6:408:fb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.20 via Frontend Transport; Mon,
 18 Aug 2025 04:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 04:34:42 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 17 Aug
 2025 21:34:28 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 17 Aug
 2025 21:34:28 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 17 Aug 2025 21:34:24 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>, <robh@kernel.org>,
	<thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
Subject: [PATCH RESEND 2/2] i2c: tegra: Add Tegra256 support
Date: Mon, 18 Aug 2025 10:03:45 +0530
Message-ID: <20250818043345.65899-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818043345.65899-1-akhilrajeev@nvidia.com>
References: <20250818043345.65899-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|MW4PR12MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: d0305726-e67b-4f4c-e4fb-08ddde108d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oZ3m/v6h/lxyQeQysP5H7p1K/NAXsjV+I+c+3yERx6E07ZmtX7pJ7VF8RAAW?=
 =?us-ascii?Q?JXMt0/Vi5/rz+mbG6R5wEVlNT7hc3BwpLISHUPj4lZXY15yL0RDjbmLx3l8i?=
 =?us-ascii?Q?mKqddWU+SI1ag2cAOygetM67dL6epSLk2vekDtMyYfB0d7hixTc+6QpEG00J?=
 =?us-ascii?Q?74aKi71t75gFl83k3PtKLj76pG3Z3pL5K8w9xBsBhMn7+zvEC2pes+E6jFE5?=
 =?us-ascii?Q?9FMmLREDU1yhWIFxHNZslMprIjwRY9u9Wp+JRS+ZKDwKgS+AGx4D2aUGTwKk?=
 =?us-ascii?Q?fKMM3iARM32FzMi4M0mnrK+MJY/W1iGNn6s1m+bBwySfJPXoZh4u4ouNb03/?=
 =?us-ascii?Q?XymLOMYIzsV9teZWgkboamAntSshIWJih15aGJFeS6oeyvLMBekPZzgfF8HH?=
 =?us-ascii?Q?geo8eim/jQr6iZv+T9CfirMODT5+Zu5znlZesnsS+9J4yQljYTpwGx64stf4?=
 =?us-ascii?Q?1kmuKS35LT4I6McMCtYwt/UZAR3YmEp50oD+MZQqAQG+vFYJDDz3nIGJJTg+?=
 =?us-ascii?Q?VQZjhBIoijEjJDQwQkeRmvsklLLBkP48lZdECCx5nTgVYiWskzWKTbHBbu1K?=
 =?us-ascii?Q?nazsRLoeqAk6OOqVAZNVdUFxmjOaU2sWnoB465SQ6p8lEv8DyF/eXimdrAxi?=
 =?us-ascii?Q?TcDMIuj+XudQ9Gutvbv1m68XapZLVbNlo8pXHBOTau/Pv8/LHn3D4uXOCMVs?=
 =?us-ascii?Q?hxfXxuxxKGmYASupYQf/WgaGywou1th8WPz46dLHZCbeJWBPmlsa8kv/aWD9?=
 =?us-ascii?Q?DOp/kfL/tKXUBHgtO5A6UXjuaC4LO+uBZpPoT9hICK0nIQ11quMx7u7B20Mq?=
 =?us-ascii?Q?Bx90TLIFE5hKINWnMoGrK92kBk6lxyvRHUwHT3ZNgSeNYzTZgnmEHkU4Pm6v?=
 =?us-ascii?Q?827rIOQMDSK2bbF651Fe5eOGsAXUH7dnNbn0AjueBua+fxyNCkAZrWSMWltL?=
 =?us-ascii?Q?ExkLxW1f8CzD6pB/sx+Yx6e8zex9mYOauJO1dGN40vPhBZGDB6qPuEYGNgRz?=
 =?us-ascii?Q?R2RMvGCWAiQ7mzW+mbf0Wkw+ibzGKtRtFkJK4hZPZ94ihd8+z0PTIeB8p6PE?=
 =?us-ascii?Q?iwluwEfOM++7v//z911mIRo+RiHhTdxfTF07Y2693mZKTwtC1jk3YVbgFsbm?=
 =?us-ascii?Q?SdjjMzCPgsORby5eJDmIY8Hb0YzNuAgla+kBW0Z86nqPCPA069mHT5peXm4k?=
 =?us-ascii?Q?W1LAnUEz76zoQnG4GJqyoRRMvH0saH/vIpHbA6S58DmTEnSMxOg5pw+4ZE3+?=
 =?us-ascii?Q?RYSdzGihE74fz+CtiP7l2Kdue9rduiSMALtkjgOIPY7I9PR8Ki5SzWLn/9q/?=
 =?us-ascii?Q?UpiyB3YIEKuDTCk5Kv1HqYkjZvY6sV5Frv3dGLMl4JCPGqXZnNcAaCq/Nndr?=
 =?us-ascii?Q?QOKRRg+l+Sa/BqWzUU2ufHnZUSdQjtGQVelIKxgmdsbYDbYerhXg4hCdBL7n?=
 =?us-ascii?Q?4L8Ae6XR9muJvs0vYNXPxpkU9sEQPNLktPudXRROwK9dAks0VwvxSNxlGMA+?=
 =?us-ascii?Q?aySdq8Ugv2HAoiwvuw99he8PjMgoOQljCE/6?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 04:34:42.9661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0305726-e67b-4f4c-e4fb-08ddde108d88
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7357

Add compatible and the hardware struct for Tegra256. Tegra256 controllers
use a different parent clock. Hence the timing parameters are different
from the previous generations to meet the expected frequencies.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

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


