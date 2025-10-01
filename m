Return-Path: <linux-i2c+bounces-13281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E37AEBAF4B4
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 08:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49F8518910D6
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 06:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2CD273800;
	Wed,  1 Oct 2025 06:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eWwclbmX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010017.outbound.protection.outlook.com [52.101.61.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E45B23D28C;
	Wed,  1 Oct 2025 06:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301312; cv=fail; b=S1KT1Q/S25WUf8LZpMKDnf3A1gRcYujAeYeu3ln+J80RKaasIFdJnUgUxzwY5dcRwk76Iui+1fVBtZmE7CCkD9fYeqoQ8ShwtyqxaHDMbOnFCCjxBea9sEWHSTs6LUaWTcv9xWAnhnR98qUCOIHNOukXkVDcix+OFLsHuxMG3CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301312; c=relaxed/simple;
	bh=jOyK9geY8BaE3nYHoLpft7ielXsz8r0QesHfahqL98A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rct2GXjCbWbIPm17N2Slz9AKnH5vUck+BPXMkYnfUwddZ0ewVVYqEfbDxLC1CCrbuwM3cZ++F8W36ODgS8FEFCTMqp7nzXK1ASwj3XV2NJpFVujFkJRZRmBlBLRvprwkOL97odfJxiR/qlMZwLnoHR1iUIz9U6aIbet9Qemss4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eWwclbmX; arc=fail smtp.client-ip=52.101.61.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGK0D1gptSbOoQK+bjUcIlM91S42PbuGNuM6jya1RqWlPgfKv/r8IUuRKMQuNpa99JrGkhM4FajfUbmuKwP61mpj7IeD9UO6aD9VLdD6FqVkklWVqEBZ1TUKdqnevzSq66pVfGXPsamgDCsLiBdQ2D3TtuUG2jqJgbtAAmMPQrS7vc8uRoqCg5u2NcjE2n3WiP1XbQadPpkBz1cG/uKfmsr4IhLtDFhLMPFKgSnmY+7nPZIRiYYrFBItHw0iJHlJPvV7bLAq/tcPSNUsj8qZv0Lu/d6792UnI84xXOUvDNTbOlHy5W7/9cAf0t/PyVf8QCYW30ZUwAedqpZxtThenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unYBWW9nSnIYUFjPRYqEXNXBCzpb3rnO9t3RGDflYNs=;
 b=chqm7Fs9tJwG8jiZlB5vdEQFjWcX/4T6ZSi8MwuWPFhDTcr+fcRPRvaNdkeYoWozJ3Y88tGMJ9rXl2dPqtXQFT00V/2+L1FCd373ibnm0keqIRIMfbozRKxEIDiVXuMevDRhn1B3B3w5iUsKa4P0TL1uOb6dhK2vLaYypFPIW9V4nDFJWgbBSng6NCmpxyr1jXKGcxXpncH5PzIbwpwthVpmdBSSufrOnTFVUripq7z0UWr0V5ToNt/sR/63HAADd8qKnM/FJeZ7+PKm2rtw4T9JFVBjGEP5Zdz/37AmKP3/rMdGw4aSUa9DkyNX8sq78zMqrEJnxHKY4TmlNOoxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unYBWW9nSnIYUFjPRYqEXNXBCzpb3rnO9t3RGDflYNs=;
 b=eWwclbmXozdgAW1shFnQO4e2neHyZQAdc3qmYaOgz3MfAJEtGQc63uTpksw6lfvl5nL2xpMMBxu33+shED7AXcdVVLP2f+oc3m+CfqcchCa6xB2BeynmLmdf97YWj0At7rSxYJ7G0Et0EWKEEZ20O1aCnDrmqh9UZUE7TiHdr2j0cJtOsyWumcKkzdYEmKD/GrW90oI1Yc0LBjOXQ7m5FFpYavaumvk/dn/3/QubpcOFiavhQ6buqthm1Q83PgrTt3ceQ6bQ7gFrdFcW/NdyS4nYTYZ7V4Ns/HdJ04kapL8+gWswYoEYUNzoi0T0Ow/6am7aeIEv2emykPtSgWexTg==
Received: from DS7PR03CA0294.namprd03.prod.outlook.com (2603:10b6:5:3ad::29)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:48:23 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::79) by DS7PR03CA0294.outlook.office365.com
 (2603:10b6:5:3ad::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 06:48:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 1 Oct 2025 06:48:22 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 30 Sep
 2025 23:48:15 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 30 Sep 2025 23:48:14 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 23:48:11 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v9 2/4] i2c: tegra: Add HS mode support
Date: Wed, 1 Oct 2025 12:17:57 +0530
Message-ID: <20251001064759.664630-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001064759.664630-1-kkartik@nvidia.com>
References: <20251001064759.664630-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|SJ0PR12MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 16efb842-7812-4212-7062-08de00b683c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U9w76Smbzt0baO5/AX9jlgB4r8NPJPadC9UAM2hG3vsUNA47YzGFkGJTm7JK?=
 =?us-ascii?Q?vev4N/wGi8TXcfFhalfDPKoodTE2UR8bZyGFBZbFFXNSyxEx7VKjiFR+7/Ei?=
 =?us-ascii?Q?NYkGWfjMOOY1KbmJ/Tn+j+DeActFTTzmn1d2jA29jut0QkNSO2+rQ3QtolOI?=
 =?us-ascii?Q?igPAyhLlqLGsD29PgXhEiQRk1adSVY5454JMNFVBeA8KbSyg4dDWrgZgkwPU?=
 =?us-ascii?Q?i6L6L61enmLp05w4pKA+qo1gqE33YR79XHCOIYfvZOzgTOCpTIWSqyhcOf7s?=
 =?us-ascii?Q?jeXl7an1g66jZL5LGp+tA9YiWQeBSdqEA4EzBQG0AOQ9WP1h5ujEsGEWuqHS?=
 =?us-ascii?Q?Y9zdtOYoMG5R5x8hEKzd3JojR3NvoNTJPfh/osoYHMMt30xRRLwuF4nDeIUE?=
 =?us-ascii?Q?Wayr8XdOUHM7hVgkMPy95uUQ4keRVjwiSGq5wK/SkXuue1VjXaRFoWZUMDQX?=
 =?us-ascii?Q?qZ3S0nleW9cRI6XaOltPhM6SzseHCulZbNfzkpdzTZEihnYh092fxvdQjvr7?=
 =?us-ascii?Q?eKpYFwQ9FLF5rOzctebTpjJdA2hl1pDGibvkw4XiV5aZZFHvtDyaiAVa0BCK?=
 =?us-ascii?Q?v6ykldmsY0nNVAqS4Z1qsuAd5yLRko29p/uIwXfDW0bfxtRRP7CablTVc2t0?=
 =?us-ascii?Q?VvOvtm8KpcdxmDegrjFcRfPX8hWSb3sR9nWiK306Ly+xXlpRbny3Cx5fKeJy?=
 =?us-ascii?Q?C4lxRWcDNxrwBpRAMSMXD/b91Wik7o17vjT2vx86lFCWZnigB09imoYbZMKU?=
 =?us-ascii?Q?eGkhHzRKcGLeAdDm+QrNBO/TU/5Mrir1Yc96Lbyj8Y/tZFAam1fp3pTCAhwP?=
 =?us-ascii?Q?ozivvYt0Fl6Ga+T029nXC4ekKmXMDneXpK7of0BK3QQRukVK83updohxa310?=
 =?us-ascii?Q?ENSaaAtSY6AAdQUJGGPW6RjdrwZVtHSvSJUFHru7WRrJVSvOHXn75IBuweg5?=
 =?us-ascii?Q?gNbD3cFewpev861B2shXD2thX3jFmciiS3V6tRR0zvo0dKpNpwvEFCXq7Ddt?=
 =?us-ascii?Q?Qv9/o/AndvMJMCJod2rhjS80A6QBXh9mOFZD6f18eGbJTA8xjS5AUpCG+gSu?=
 =?us-ascii?Q?tTC10h3MaY6al5r0PoI2r7zDL8SaPgvJ8eFoZbKGyPx1mlWP8t+J8m9cDb7h?=
 =?us-ascii?Q?z56iZjwHHy7oD8qLfIvhv0BjZj7WOy309bfCNP1qic15PJG6FRG3k6Mlh0MP?=
 =?us-ascii?Q?jjj4ZazUtl/3SEyB9kPkGRCrmIne01cxPl13Du6oVl48MDasM5DHhI/jTsyM?=
 =?us-ascii?Q?lyJIRqeSgd7R3hjNnl0Bc16y0S6MDcaBS092WWWk+eM1IFy3Eqync8m5Dczg?=
 =?us-ascii?Q?CagBjslYE3d8WktzI1BVY+MgDeOBLtkDjl1Jn1Q3dzsu86VPPPn6C23jgbmj?=
 =?us-ascii?Q?qCy3dmr5u0Kb3qtY2dHln33u8BuNXNlKCUU92Z8DDy8hBLNB9auqRBmXREtU?=
 =?us-ascii?Q?qKjzUcAEaps7O2fyL+PD0ulxRNMeQ66dyQEMguzLoWexUuceD1V4ugl3+EAo?=
 =?us-ascii?Q?x4YSNbbSLlxNig7TgVexpU1+Gc/0YEnS0ppnPziYVWS1LLb3glEJfPpC9QCM?=
 =?us-ascii?Q?+j1MhUuxm77qEU822nyEtI/oQ4sgcn/8xNCY9YuR?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:48:22.6538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16efb842-7812-4212-7062-08de00b683c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941

From: Akhil R <akhilrajeev@nvidia.com>

Add support for HS (High Speed) mode transfers, which is supported by
Tegra194 onwards. Also adjust the bus frequency such that it uses the
fast plus mode when HS mode is not supported.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v5 -> v9:
	* In the switch block, handle the case when hs mode is not
	  supported. Also update it to use Fast mode for master code
	  byte as per the I2C spec for HS mode.
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
 drivers/i2c/busses/i2c-tegra.c | 49 +++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index aa7c0d8c0941..cc75340f6cb5 100644
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
@@ -678,16 +685,28 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		tegra_i2c_vi_init(i2c_dev);
 
 	switch (t->bus_freq_hz) {
-	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
 	default:
+		if (!i2c_dev->hw->has_hs_mode_support)
+			t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
+		fallthrough;
+
+	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
 		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
 		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
 
-		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
+		/*
+		 * When HS mode is supported, the non-hs timing registers will be used for the
+		 * master code byte for transition to HS mode. As per the spec, the 8 bit master
+		 * code should be sent at max 400kHz. Therefore, limit the bus speed to fast mode.
+		 * Whereas when HS mode is not supported, allow the highest speed mode capable.
+		 */
+		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ && !i2c_dev->hw->has_hs_mode_support) {
 			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
-		else
+			t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
+		} else {
 			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
+		}
 		break;
 
 	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
@@ -717,6 +736,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
+	}
+
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
 
 	err = clk_set_rate(i2c_dev->div_clk,
@@ -1214,6 +1245,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
+	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		packet_header |= I2C_HEADER_HS_MODE;
+
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
@@ -1502,6 +1536,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1527,6 +1562,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1552,6 +1588,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1577,6 +1614,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1602,6 +1640,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1627,6 +1666,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1648,10 +1688,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
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
2.50.1


