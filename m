Return-Path: <linux-i2c+bounces-13013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E83B7C799
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79D787B012E
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 08:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCA330FF03;
	Wed, 17 Sep 2025 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nw39z4ck"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013056.outbound.protection.outlook.com [40.107.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792DD10F1;
	Wed, 17 Sep 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099448; cv=fail; b=d7E7v4k6PhBDK9qNRg+9uIhZWhR9mm51C/wd2UKKoIqHp19LupcLYqI8x9uAaieeZ6CRNnLulzNgYY76Fmxxo/FmuOuJ5V36o5yvpmWq/h3biLe5nU+W12TN60W6j5OVN+jNusyMAIDFuwTT85Q3i8A2zZI8fA6Ewn9GbslgfDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099448; c=relaxed/simple;
	bh=3NT0asyN+4B7B4ZacJ/XxXEar9SWskpn/isqrECowN8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBzzAUGXJ0hEsfKyF8z34vXOwNm9+GOeeIBPzk7lNJk8A4emK7O2lCDxjTVYqQXf61vbVVnEvR7e8AWT3a6MZJeQgYYQPdgpCnGGKnt9TNC8YFlvXZS4oNKtjMciPi7Ldj4JEIDrrAcmk0EqxLg/oDMi6fuQoJ71pNKs2GFKrtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nw39z4ck; arc=fail smtp.client-ip=40.107.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsp+mchVekvRnM5dofzcgj0H2+vzC66hulCcy4yyYNzpjKDcidzJ/zTj4W6bAZAnIhAhaRYjeOVuTa4yjZNgtsqxtI1f+GgCOOxAT07NJQyj15T7ZMdgsArlWoJZD4XiRsL1zz7jxqpDI77rk5B83pGdvzjMh0WpOu2UcHzpI4kBskZtotXCp9erHq/Jo8N616eQmUbAMg/QdkJp+JOsaTfe56I+QoebAghp5TYOrW39dXMSsCeaYXqyGrs4LgMbJSS2F2IvJ5VFiyQyKDtsZ1h8McJAgoWBvPBGzp5xcX70ytRerdeLz8JhrDXDHSmKSumWOFL0gz9tIbJXZpLkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTxgFfYexw/UXf4L1m47ZK0qpWUylLrTnUsGU87uf0U=;
 b=rkAdrXXld4xgsHu14x8jscXtjFYhj72Td0TgS+jYLT25ZoGiQRVpu6OvmEvz5g5MLgTXMkUimwVWeiPB2bNdzWBySgw+mQgySHRXaoehlPwxyM8YpR2npNecaEJAu4UC4+0chymyt3eopBHRLcazMg7u/OM+hZ1VO9iqwZjMLn0i7+1zE5eqe59GYIAHQ+3uohuo9Rxtshmo9QiTMuzVGbpe9RK5h+2SIp+3BuUsEXcIjjnE5wS3t19Vc5f1t08/EL3bzSlmdZv/fw4TcP6jDwwnNievFV2ggD2q151Trnym/xiw78nMDH/BXFwHCUPTbQ8ILuzybZTtJBETX/5W6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTxgFfYexw/UXf4L1m47ZK0qpWUylLrTnUsGU87uf0U=;
 b=nw39z4ckExQhdSzHtk+6MUzSrAtVx78rdSRvDRNzV21dzH+nxPxPSqhX3tmSP8ANpuLHwfZOB10+AWtf6WZp97IYM+GdVs7neFPIrM97G7vD7+d4Td2Z4PELYOyXZaVFkmJjnCxN1gHqyeBgiMdDWEz7mPd3WxbDPWR48JD8NNRF+rS3l237ECH7EEM9sl9kZGBPnB8KjfGP/7YFqVheCNdXwZT+6vkwhfUnfT+Zjbc09rF83yVtNJ4cnZ0slDAd/K1te/kK50XgUvihd1/l7sruOOwtt8rdyZyk4QwB28MUxcso2URF1OYzhdyPFqW1pVNfewBlBIlrgsMI7l791A==
Received: from CH2PR05CA0049.namprd05.prod.outlook.com (2603:10b6:610:38::26)
 by DM4PR12MB7598.namprd12.prod.outlook.com (2603:10b6:8:10a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 08:57:20 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::26) by CH2PR05CA0049.outlook.office365.com
 (2603:10b6:610:38::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via Frontend Transport; Wed,
 17 Sep 2025 08:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 08:57:19 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:57:06 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 17 Sep 2025 01:57:06 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 17 Sep 2025 01:57:02 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v8 2/4] i2c: tegra: Add HS mode support
Date: Wed, 17 Sep 2025 14:26:48 +0530
Message-ID: <20250917085650.594279-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917085650.594279-1-kkartik@nvidia.com>
References: <20250917085650.594279-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DM4PR12MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b83037-9e1a-4c6a-2297-08ddf5c835b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CCIU7nmYpxkW6qPqXER4H1F1H+avliYvl/n4ZovmvffvAlcknlVWzeqy0SxA?=
 =?us-ascii?Q?6QGtmGL243NUrigTaZ3PxauEd/fUuxQQ0oJn0Jy3GJXt0Ajt9Zi9CtLZpIia?=
 =?us-ascii?Q?My2+FbCrwUXOWFv897+TDyBL541M6LP/V39jeS+LcAkyra0hPC49DmbHsyrY?=
 =?us-ascii?Q?C+kd1BBhSyVMBNbA8xc+KgXpNWa6U5XtuuzBVHbUH96mz5i8OlgO6TkcAlRt?=
 =?us-ascii?Q?4P5ra2nab/pxql+N82HnxfSkkAtq9iwWX/ig6bEoVNG929l9blRBbOPRQhEA?=
 =?us-ascii?Q?in+EwJ82fkGuGRpB/p+ZC/0BPuwF6Q4LEaU4WVWB57N4EGx+c0nIB4qIvfWb?=
 =?us-ascii?Q?AZdsBnLD11LT6JJCTCMGtGdgJ21sJpDG1mA57z5+cubCGehsiIgWZvRa5JSN?=
 =?us-ascii?Q?uYXiVGTc8xq7PpBtZlTQzg0dzIljHXdO1MXRCIyaMwToHwwR0HFuEapJ7tCG?=
 =?us-ascii?Q?CSvU8+glv8nzHRADasl/SAf4ABFpH9CPoBGcEiqatFu/1+VjBnkBnlTQmt5Y?=
 =?us-ascii?Q?VjW1iFz/qQTzkRE7l5zPoz6ssEpRmJrpXPw/1JTKu4KkFZ8rBkH6fefhnKu2?=
 =?us-ascii?Q?AZmT6X+U0CLeSJEFPRgNBaAfsMoYVZXhQlH+qiv0YG6JlUuT3gXosX6WyGwy?=
 =?us-ascii?Q?CJFqPiyrobDX1/bnIXJDy8ZbGUSj27qaZ+TWpZQN/LRDrlUILuGkRgvZCGpp?=
 =?us-ascii?Q?uvUxgQ3ygI/58K9yxWcZivxZ/tNKRaAUwlY6l2qbHVrjij/XrJGYqz90ijgj?=
 =?us-ascii?Q?q95AoEWwXjgoJb0yCeC3+F6ne5I9/DS+78Q6UZLbduDnCN7c8R+dWPGX/WEn?=
 =?us-ascii?Q?7XLFlTlkHlc9uMb4JT8GajUc0P8jIRgW4mDZ2KvKIXja2HV5M9jiYcYvrMTj?=
 =?us-ascii?Q?+2QZpF0cO0mrglmguubeF16OlJoNIA+UHboQw1YeKid6QWPAZ0Wwslk+ihK6?=
 =?us-ascii?Q?8TiGlhrukNrjkWantxE0ELfdprVQDYdixO9KbMkVvI9/Wpnkow7ixfVykLF+?=
 =?us-ascii?Q?1rLHzB8IiJBxrCvgrizijE+JpLlqK3cyLIAZt0cAdD3rTKsqSPIhc011Ra0+?=
 =?us-ascii?Q?fMl21AXMOpF+B1owHoU8FAiaxyI4IlfBtT2y4tpeE5v4Z4gYx0282wTPGPNa?=
 =?us-ascii?Q?K2ElaF3aYUb6pqi1Czmx3+2DxrXOUuj3Iplzn5z5dk5OG8xPh5Y+I/CkrVGv?=
 =?us-ascii?Q?OeLckcCWLME0lkxaWifOAMDq768wLTF4ltvAEfraGCIf/Z0+aBuT4PILvmGW?=
 =?us-ascii?Q?y+ShP0WiqSV94yQcDARz6YQ0SAfwSX9iUzZUVgyxDF2Uf1orKjxFQ3GueI11?=
 =?us-ascii?Q?uNOYpbbcFB6mVpczYgRG0ezO/tXJBYvW3JZ/zRMApwTz/EfeD37sNiHzlgxy?=
 =?us-ascii?Q?2wv9rOkMkf/eQdorgmDFf4l//niEhjrTyxwPUkQwZBALgVQ7I37UTatj4gWO?=
 =?us-ascii?Q?tjLOegBPKUsNhBseqF7RqUWfsl7siem18+lpaVMLCaY0GzwiJPEJ91Jib9Qd?=
 =?us-ascii?Q?yxuV21tbeTUrxwzGsbTOOM3F3AdjQPqaNuIyN1CqU2KdVtrO1QllN125AA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:57:19.8466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b83037-9e1a-4c6a-2297-08ddf5c835b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7598

From: Akhil R <akhilrajeev@nvidia.com>

Add support for HS (High Speed) mode transfers, which is supported by
Tegra194 onwards.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v3 -> v5:
	* Set has_hs_mode_support to false for unsupported SoCs.
v2 -> v3:
	* Document tlow_hs_mode and thigh_hs_mode.
v1 -> v2:
	* Document has_hs_mode_support.
	* Add a check to set the frequency to fastmode+ if the device
	  does not support HS mode but the requested frequency is more
	  than fastmode+.
---
 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d908e5e3f0af..6f816de8b3af 100644
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
@@ -1502,6 +1526,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1527,6 +1552,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1552,6 +1578,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1577,6 +1604,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1602,6 +1630,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1627,6 +1656,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1648,10 +1678,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
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
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
-- 
2.43.0


