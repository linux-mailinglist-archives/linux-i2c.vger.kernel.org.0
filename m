Return-Path: <linux-i2c+bounces-9235-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D1AA23074
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 15:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B05B7A2A26
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 14:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2031EB9F6;
	Thu, 30 Jan 2025 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ebvU5MTQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A951E9B3F;
	Thu, 30 Jan 2025 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247720; cv=fail; b=OFtSeXVULulp1N8NHx0B/9thJK7qGRm7i2UfJ5w9Tx4GpICULkW/Vvtg1GpQcEyrSat5jvU+gqLUXTzwBGgaANIKOcxwtGWr4Nt46PCeQ2XrssHwmihIFt17V4z6PJFJvD8VPQMGAV/MsDQO93AK9XyRwNlyPX7YCwZANkOnDIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247720; c=relaxed/simple;
	bh=ipkK9qVBmxsRaQ/JLbsMd5uURfC9MvJHc07qm3EyeVQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYV6dQQCygWOQiIDIUlH4INhxaPwkZmrkxc2KrSgKfZ8wXDl70uKEyu4WWXMHfFmIE8G/GzSv4pgqGRqq3V3EJ5phNN6DmmbwR1hWpzEkQ4hqcxcyqtGwYalrAaC2f9pkycEL4L4stRsV54x+x21oR3Zg1h0b9JnZ2zjyRTp0HE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ebvU5MTQ; arc=fail smtp.client-ip=40.107.95.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXtuP1ez0X9XsSn5YbJbLeY1zfjiprtsa3Dl3lCrUaogeddPvr6qOzq2EDGvcXFUKp2vM5EVUQac07kmH2IJVYlhL/SPmZ1Ukan6lUvfRv0PhpwEcHYCUAo7SCdCtjAJAOSeDJpDEqmIBTXrUIV1TwbAZ353PU9O1umyAtbZGYTZizW5IDkjg/bsaSwrpXwWIY8zyjEhRhvqv1BNwZqw3i6xqJc4AqhayCcB7w7NDPMUK6MpBmJU43i86L8edVs66lELuCiADCBIK8FWk/TSzhpZcLyEjyCpk5UWhW4wlrv0Rz5NH2XzZQh+KSG6DEKKuQSDYYQNoeZRaWLdwa/ahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqXcx2DGTrwKAfXXErarJYyW5q6jSgRZ8BTwuCQu3Mw=;
 b=v7pDRTLPPUirxU6ZTwi/XSYDhIAKQfX69y9cwAj86tothUwLiMO5rEtnGo3fZh59eXDrypmjZ8T/CZFVZKMj6PXaZCfHo2/M0NT0THxgf62tP6gPqjPbQUROb7fQ2MR1Hhapjeqs+6fkAyUlWXiKSe5V5I3pFmoMXDHHubXnaPSgwpsmW2sfAU5qOVqU2uqLsO45jq3XdX9EsUNKJZFLtNybAasdAJbQpDc9nnaw2gAaSV0irRFTkQYzagb6B7eJrovh8Pjt4FVnbe23vov1PK8M+6eSfTtPLszWTlUWSvg0q/Jv6UCdWx55/rP181aji8uUkaRiHN7aOgEKHl+mBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqXcx2DGTrwKAfXXErarJYyW5q6jSgRZ8BTwuCQu3Mw=;
 b=ebvU5MTQkG38+5qCs8w+3V2SPZZacB2MJZQjmRT0fvDPsjDAT4LHznOUG+9KboI+TD/SkNlX1RS3gsFAxKcDE8PPbOC+GB97/U1CumRsVBTBcdPC1PkkxtlBy8ilaunC7QZRo7Csaq/PPBBHeJAAWasz9EXz17ZUMZXHAxkjaaonj8f5zEtERjL/Ghe0lPVUUK6gHu3Vj94YUwM77aiS5ZEeaxzM34NPLok7gqqxJDrjXysgIU9DgPmBcJZlydAYFpYtVxzSJ5IVQ5EmjycN3Ac9t4U+GZ5ARWSv6HTus/yC5DcbyR8ynjmg4iUGSHeaaxOz8MvfPB+o1idXV8+2/Q==
Received: from BL1PR13CA0265.namprd13.prod.outlook.com (2603:10b6:208:2ba::30)
 by SA0PR12MB7092.namprd12.prod.outlook.com (2603:10b6:806:2d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 14:35:14 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::50) by BL1PR13CA0265.outlook.office365.com
 (2603:10b6:208:2ba::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 14:35:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 14:35:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 30 Jan
 2025 06:34:56 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 30 Jan
 2025 06:34:55 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 30 Jan 2025 06:34:51 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/5] i2c: tegra: Add HS mode support
Date: Thu, 30 Jan 2025 20:04:22 +0530
Message-ID: <20250130143424.52389-4-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130143424.52389-1-kkartik@nvidia.com>
References: <20250130143424.52389-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|SA0PR12MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: a216b733-10a0-4dcb-2e34-08dd413b4ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XvmIcTkpjpp9WFb3u0iUN2Mvu+oDIH4P+oxEwVc8GBonBxPAV9KOvlzGulIj?=
 =?us-ascii?Q?6TsWdtAbdgEk5khSwk1kTLITO7d1GVBfmOGtmSpr71Gen5wux1X+WWoySo2h?=
 =?us-ascii?Q?/M5RoL7d6vSG2FVL+bnN/WCN2iFRsH1n3RElmESASyeTGZulOGvKZZiKMwId?=
 =?us-ascii?Q?3cg9r5ZUu9oY2cKIOAayYprUrrDUDpwCeGStCEpwCjIZSr2MGiBDu10xf2/7?=
 =?us-ascii?Q?+6hamN3eY4kuXl+EGoTGlVX5JsjyvkzO7TWop5otkqd8LxKolwAuf0SDq+u6?=
 =?us-ascii?Q?PFtlgXJxz66FAyrHoHqLYFFqzjaO4I/uX3IsB/2iZqca2rdg37qwYqRUXLDT?=
 =?us-ascii?Q?gqSyy1hPD6vkreCbuVmziwPoo5tSdxocXg6FPHvfP88OsALB2/1RBGe1W4nE?=
 =?us-ascii?Q?aBcbU2X49folLPuDVEauIyHDjaVSHnQWrAoiKF4YaCf76/wuIkluNETCVAPD?=
 =?us-ascii?Q?a8VgFU6C1SHeUMcxdvj81RO1owyA5WUyew3S8ZyyUeSJk/FHdgLbs8AoCiIj?=
 =?us-ascii?Q?PhyzAuv25pmLS6v+Iw5scA6KCB8Y2UoR4/+TTlMw7JKTgPsR+Ke0CwqvJh3v?=
 =?us-ascii?Q?Yp2y5LE5fvWptZNGTE/B5AYK8evpKpI/u0mdYGvQbQ19H4YTCt2D9tcCNLJb?=
 =?us-ascii?Q?8UWQ8fmGIQ/cscn0m9J+TefK+073IGSLaLQ+FDXeZSGZl3ySr+l38DL5ZtDi?=
 =?us-ascii?Q?cL2CV7ixuOYUa4OeAJMstMBy4l2/rs/Lca6Q+UbDTVNSaxQCJyf7S85SP3Zt?=
 =?us-ascii?Q?1PNQplm26sJpnRJKQBeEewli2o0z7HJFwY6osuB5cpmOecdtmZ+F2vjvbR4y?=
 =?us-ascii?Q?EK+T46DRdkAWhXd3impDA4C/4RbQQ9eMzUkHKVklL/M2CB1NTp5Nf6sHSEDP?=
 =?us-ascii?Q?iC2QO6YMsA8t+6vuSWz058Yz4EZDJ7GWeiOwUIykgAAC8liPkBSdl9jmA2c6?=
 =?us-ascii?Q?g3B0qPm7qJ31DXgwbNVowxZIxIWbITygumo5tTPpzk4A3MhRkSHeOzSLGEpk?=
 =?us-ascii?Q?JloIZY0f61gb6zc7+bo+QJZENH6ZaXp6pKADhtNJY8YmT4ozhAqVtq/OrApl?=
 =?us-ascii?Q?bes7I/YfLR97W/d05UtxWICmG0vUdi6XYM/nkaxWFbQv9vRAO/wTVNAEZOcf?=
 =?us-ascii?Q?Ltv438H2SvC+MIkt+cTijeRAbKDFmC8O8RHy1o3jNnyMK4tXtHCOTqsEudbg?=
 =?us-ascii?Q?s4eeLKhwVCaTp6cfD0tfCLdg2nU6iHwg20ciR0i11wQ+lqT+IN6/nfHR7yPU?=
 =?us-ascii?Q?Jw6W9j2ijEAaLrqf5MsEUOfVMPLkSWQd9+/vHeT3fXSc3Gr0EY2k7zxpGvHa?=
 =?us-ascii?Q?5fYOO2ba3lupxD1oWomDJximhdADV4ypaq265D3fH9Y6bd33d+Px2zllMSaE?=
 =?us-ascii?Q?rM0rgjqnW7px9nq5vMWqp54+0f9Ex78R+oiea1gfbyHxYv4VLLNu6nOcVCI+?=
 =?us-ascii?Q?ARxafHPmJ5uVVaZg6xtYdF3OD3VpAMYprK3wVuymZe8xUuU91ki+KkxFphmj?=
 =?us-ascii?Q?3zyFBllhe6+FnsYs7B3SxmUJ5cwaLpNgpzQZ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 14:35:13.2836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a216b733-10a0-4dcb-2e34-08dd413b4ea6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7092

From: Akhil R <akhilrajeev@nvidia.com>

Add support for HS (High Speed) mode transfers, which is supported by
Tegra194 onwards.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v1 -> v2:
	* Document has_hs_mode_support.
	* Add a check to set the frequency to fastmode+ if the device
	  does not support HS mode but the requested frequency is more
	  than fastmode+.
---
 drivers/i2c/busses/i2c-tegra.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b0dd129714a2..7c8b76406e2e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -91,6 +91,7 @@
 #define I2C_HEADER_IE_ENABLE			BIT(17)
 #define I2C_HEADER_REPEAT_START			BIT(16)
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
+#define I2C_HEADER_HS_MODE			BIT(22)
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_BUS_CLEAR_CNFG			0x084
@@ -201,6 +202,7 @@ enum msg_end_type {
  *		in HS mode.
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
+ * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -220,10 +222,13 @@ struct tegra_i2c_hw_feature {
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
@@ -684,6 +689,20 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -1181,6 +1200,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
+	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		packet_header |= I2C_HEADER_HS_MODE;
+
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
@@ -1621,10 +1643,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
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
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.43.0


