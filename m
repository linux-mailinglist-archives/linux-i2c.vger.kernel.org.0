Return-Path: <linux-i2c+bounces-14025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B89D1C454F8
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 09:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D596C4E8E7F
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 08:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB0B2F7AD5;
	Mon, 10 Nov 2025 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ndwI9EoV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013026.outbound.protection.outlook.com [40.93.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100302E92B4;
	Mon, 10 Nov 2025 08:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762761940; cv=fail; b=XO8XFwQtOKcVSK/hN52jxmoOn2unaxh+RFL04Gb5cSR+UJDVL8KwB8UDnq4e/RqP72bgayZ+Zn1+8ETxBcDbezVt9I+C2d7PKlqFAsEBypH/vm0huYmvZFm10UN3damBWr3DuIxqPJemg/LxE6oxG48VLSNn+kMKbwCCwmL/knk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762761940; c=relaxed/simple;
	bh=YtijUKS4OVjgxHE2pTWTv88gaS+rABbezORBHXeC7z0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tTOueBp4Np9EeeuaRIHzosyIcDfqOQRyKQgW3Uu7IDolECufFZuEeJk+6pWbgP1MPu/FY1WvX7TWlO91vuL+B/LNb5W0PRCbBA+6hyrU8EM4lnyLIdI1R4DLLSekPuPT7TO74PKwjqaz6GaNa3tzKGF1pGu7X19vLuE0CgvKDqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ndwI9EoV; arc=fail smtp.client-ip=40.93.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tn/ES5fW2f8pKp4N6Xze1+WYPGt2Txf0cVFPBIvqXACTDn0+N0BYKMA8Zsyo6GGs18iMmDWCXAklMBjSWZCfbJDjq57Cey2hfuGLAzQVtY8ysRbhcTEQDp7eUL+iKj3p9lRNxUQTOOUeAy4/temJ1TCj1bSWz/F1Fr0WVtQwi6BHJYsT2EHJn7xmejO5BF1L5ov4C5omNOO+GIczGrhRd1PrQyVpJMWPOA8lsuWyKXXuFkiTltsYIL+wGj3o4REzdONV19VYLnCU0vAYrGMnoiWVApjNXinr8x0qx+Plk6mGpaupyJlCgASwg6Xr15dDFBn+vqVIcmWutvwc9ZhoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWkKEK1WO0mVoE5r+XtIkA49C5pYUAq8H2sq94aPZMk=;
 b=DWZnizAYY4CaXP1adnm7Q5YZFV8olTtHjQmGPpjIVfWyf8LijmXNBExiFb6nYAu0RDNF7w7J7WEZzcVVR7+NjUn4bpxPmdCD39g0AoswNzEVOUtphwhtVRCrY0zaMeQs4V+wB8Dmp45gXCK36Y6nNliqFI7ndpJhWYqSVqjhk/Ds4KRK7v+HINaYBDTPKszTdhIp7wIoj+dDVwc1ZtNwnAEbzSZQzbWU82dw6OpYWRSjmRiX4aV1w2Msah82GXLehoK3TLMppUKZp4kWjvAhI6DPGsalJoofzwzi+XLfMrxz/l/nRkz95ADiqAFd7TW9FzV8PVDmEF2wBk0BPX52Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWkKEK1WO0mVoE5r+XtIkA49C5pYUAq8H2sq94aPZMk=;
 b=ndwI9EoVfVix89gEPU1FQATKc1wn7LzkJyQlN69TFTrSnAgvM91NyYAj4Qsr8FYGL+QH/POIQ0nz2uBXqu4DKM2HKxJSH5SPtC/3hVKOAV/zEvE1mh8a4cE0opPwffO/8X0E4i/UEIVLbjFHSt+DJLhVWZMVNN+uknjJ+QP6kBBE/Y568Vo4f6AWBXEUsP6kwhl13mjQUm3CGptWGaL4jFNqv00EXtuAxD0qmv3H7zqWiUly5RdYahl/8MZMn2S5p51QQodaAtzYMRnqm0DX3EoeHxkXRQf6fdE1p5044B6b+3xpogzY4/AzOqD+ehdYA5RMLlzM4fIURxVAw3dJaw==
Received: from SJ0PR13CA0154.namprd13.prod.outlook.com (2603:10b6:a03:2c7::9)
 by SN7PR12MB8001.namprd12.prod.outlook.com (2603:10b6:806:340::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 08:05:33 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::d6) by SJ0PR13CA0154.outlook.office365.com
 (2603:10b6:a03:2c7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.14 via Frontend Transport; Mon,
 10 Nov 2025 08:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 08:05:33 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 00:05:21 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 00:05:20 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 10 Nov 2025 00:05:15 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v10 2/4] i2c: tegra: Add HS mode support
Date: Mon, 10 Nov 2025 13:35:00 +0530
Message-ID: <20251110080502.865953-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110080502.865953-1-kkartik@nvidia.com>
References: <20251110080502.865953-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|SN7PR12MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: bc94f704-79bc-4ecd-055f-08de202fec6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9LEEIMgdd14z8o03ZfpwuI5JB/3dG+m2VHjvs7++oq4SjHK8LF/bhnpZ9CZW?=
 =?us-ascii?Q?7AkZiwBxKvxSHJd30ByOT491i5g1FYmc4x366EEvZjyJfl5pxXXG4HArOcSM?=
 =?us-ascii?Q?m66YVSV+x8dFDO5JPAC19QiP9qJF1RVVeyQOoxwqzai+91ARcsKdXATvZ2VK?=
 =?us-ascii?Q?hBsG+kv5IzANRulCrW30bBYXVdsDqbQ90zRJvkdWWiHCa+hQE6Wwn+kY7wck?=
 =?us-ascii?Q?QD5D+2koJuuc+9fTYqT12TO5vseQRL1jHkC1ctkWZm246C/fqGy5b1F3Y51k?=
 =?us-ascii?Q?36FAW0FzHZjn0PVEBIdVY9Qbtlwijfjs9ZzOwd4B0FtXZeG9HYqVYSVPVVPd?=
 =?us-ascii?Q?VTWhX6au7uUQ/rUz1vqB+cgAwP108mKu+JUJ1Rn24SKkzTq5qIjhUqYkursh?=
 =?us-ascii?Q?n4NxzEiD1FTWcBLojzPnudAhcoWtORxmYRzUwiMw0EYvbEdp5TG8jO4HUHgc?=
 =?us-ascii?Q?YlQDaOIG5idtaNZ+l/HhIHjRFZLXLz6ozj2VKtDW97lz/kA0mYT1atKCFDyI?=
 =?us-ascii?Q?mBxcXkH8tmPWdpfpjtErhgWqRqkE+jjZpsbQ1txJRrW5Y1t7Qkq+p2cmh563?=
 =?us-ascii?Q?s1YfjI8Reqwv8Vt591TK80mwdzlPg0rFlJW7HvsTv7gNe6nnUm7rn/xwsyYX?=
 =?us-ascii?Q?JQ7R/x+gV5OL/tDtyRQB1dTFcp7if5srt2ruJ5hUb64Aui4yXKSzwBzOn1Dy?=
 =?us-ascii?Q?KI2IveL1r8medS+0w1uwFeGOFlJLVkgasjL/9my0/gFB8nX+ioyi9TsVOPPX?=
 =?us-ascii?Q?tklSeZcsIZo+5aWrvs83UYNilookzdFzZNGXoY8dSp9RtBMcfdtpVT2eFVIe?=
 =?us-ascii?Q?xPRZS63tUYu1W46lvMiqs7CvbuubpC1peaunOqwbyX6Hi3Jy85EEn0HDrjD+?=
 =?us-ascii?Q?0IUS32FQclAVNeKroy48pSl0GvH5GYKPVb0ddG7+6CEW9XV3iKPtVOk3BVI9?=
 =?us-ascii?Q?qe6125eg55NsNt5lnR7dbm97lTBWbYmrMXgho0DOCrCWSGdATAHhKSN7ZV1V?=
 =?us-ascii?Q?GiyEQplVACNXIr4696TQcn6RipdOtl4vg5HcoqAewPzZrDSiSY7Ej+BfqEYb?=
 =?us-ascii?Q?uij57/IFiucZ1II9gOu58Jd+TwxXQ75I2AyD2TPo+yQM+C+zYuYfQSbqrOS9?=
 =?us-ascii?Q?GDM0NMKUFFpcZIF6TNfhIfEETqDsO/cVNccNFFIM2/huPpdgBmSIEumudkvu?=
 =?us-ascii?Q?l4H9DMvR5Hpz5WieFTp+B9II7VtA/gUo9yH3Ve9VKZXcoSf7mjfOtmLzeqzR?=
 =?us-ascii?Q?aXm+FglCrBG4VvA7hnGBcgbDpOET+KCziChsPU4NwDcb/TRCkRSmU2JUYfOz?=
 =?us-ascii?Q?YIPPIyroVMWyB4NKM3figKdqiJ6TSTwVfx6cQ9nhUXBtqSwbs8UBNd+Dc8f1?=
 =?us-ascii?Q?OPbGQSrNB3H7iseKdUk2La4Yfasy8XllfqJD5dU8NF/eNnTb5NfZtS1L4Vd3?=
 =?us-ascii?Q?wCHrUMNIIfGo9hSYLWFGZGmdZeuyfTc2Oz20qshYm6OMeEB44hr2YRsY+SmQ?=
 =?us-ascii?Q?l4OqVkk72uuPSuM6dbdU7xpV4yfJFZhV9++b5kHF01DK3fckV8T6EVMHeJD4?=
 =?us-ascii?Q?gf44XoTGUb/oJkgmqvKSJn9wg/aI7W7KrV64f2td?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 08:05:33.5057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc94f704-79bc-4ecd-055f-08de202fec6f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8001

From: Akhil R <akhilrajeev@nvidia.com>

Add support for HS (High Speed) mode transfers, which is supported by
Tegra194 onwards. Also adjust the bus frequency such that it uses the
fast plus mode when HS mode is not supported.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v9 -> v10:
	* Change switch block to an if-else block.
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
 drivers/i2c/busses/i2c-tegra.c | 65 ++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bd26b232ffb3..2038ab2d8095 100644
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
@@ -677,25 +684,31 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
-	switch (t->bus_freq_hz) {
-	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
-	default:
+	if (t->bus_freq_hz < I2C_MAX_STANDARD_MODE_FREQ) {
+		tlow = i2c_dev->hw->tlow_std_mode;
+		thigh = i2c_dev->hw->thigh_std_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
+		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
+	} else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
 		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
-
-		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
-			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
-		else
+		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
+	} else {
+		/*
+		 * When HS mode is supported, the non-hs timing registers will be used for the
+		 * master code byte for transition to HS mode. As per the spec, the 8 bit master
+		 * code should be sent at max 400kHz. Therefore, limit the bus speed to fast mode.
+		 * Whereas when HS mode is not supported, allow the highest speed mode capable.
+		 */
+		if (i2c_dev->hw->has_hs_mode_support)
 			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
-		break;
+		else
+			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
 
-	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
-		tlow = i2c_dev->hw->tlow_std_mode;
-		thigh = i2c_dev->hw->thigh_std_mode;
-		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
-		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
-		break;
+		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
+		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
 	}
 
 	/* make sure clock divisor programmed correctly */
@@ -717,6 +730,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -1214,6 +1239,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
+	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		packet_header |= I2C_HEADER_HS_MODE;
+
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
@@ -1502,6 +1530,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1527,6 +1556,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1552,6 +1582,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1577,6 +1608,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1602,6 +1634,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1627,6 +1660,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1648,10 +1682,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
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


