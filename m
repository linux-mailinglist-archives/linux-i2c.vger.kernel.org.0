Return-Path: <linux-i2c+bounces-12455-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B507B39387
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 08:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7C7A7AE5AD
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 05:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8B727B340;
	Thu, 28 Aug 2025 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IZzf4vih"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C194227FD75;
	Thu, 28 Aug 2025 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756360810; cv=fail; b=kD/2zms2+uHebHNS0A5S0uCPO1ei52FO7DLEOs7457ME0wVqFQLhy03tbzYv7sSqQubLIQZaDB0/ldDnSp2mpG0U88wuSvfdCjwO2wli8vaphZEAS6EAiqwQ/aprUmSKayYQxglZkJLpydbRFCdMqAmWGXotRlvm7D/E7L9q9Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756360810; c=relaxed/simple;
	bh=2VMW242CtkOQ+PNfot0klWHe1n3VaxA1T1gab/rP16A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MT3VPAReVE+KA+7+LXS7+RlpCoGBh4kKgRK+zYI82iGaXKpUK2xXfqY6qmhiu2bokfcxjS+MsQCCZaED0+HO/GMI7wlp+ROYmCJ/w8GZA8w2nIj8w/pLrQCrUU48YrfqcsITUICGGFr3k6lOUXE7No4g819mbysQ5tPy3Xnnp/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IZzf4vih; arc=fail smtp.client-ip=40.107.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoY78D1kJC3yno+tae9Tb/GxbdDPWeiFqGgMEi4p4OCLLNqSg/ozCVDbphZfoEGFRAvWQJX7WAifyu3HWS3x2XrcMlHjOtcweJHtsJJKvl6vmVHJMuX5G5ZFIDRvcHRdh0UKzKKmbVBGrGoUNq8sMy2HiPel+eMP8DhCopg3xMhkzhOWtFh85m/DrcEdxsglnSDVcpCwPFK/s7LFrQwBfczxMMj+q2gLlflhqSNJZSMIp82KKc4xI0Zju8BV2lnLR0PVVoos7UDiAJ4YeaUploN0qOED/6aPTI1ksoqQUF+oPY7gnxSEbTARx+JW4qCs32wl82j2Jnm9d+hnjyGqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRg0JU/yjvdLxd9Z7WD5qPZ5qDytPrEVsV6okmmrTew=;
 b=VEyu7p6e9GrTVZroIbeyonkRpP2OnfnNsTUiLgX84b9cTiKoNW9lB/VXiPUOCxRcM4ZuH7pSdlrVK3XdI4/g3NGtgtKKxp64SHQNF1wYOnlYzw1893WzYhgp/b6eSI3xNJNu2UaabBFPWXRMB998TkqA0MvGzez0Mi6G/jG7WX2uoBMaTmbDo55QRnwHIMou3FzBPO/Qn03mqdQgH8Q6XcX++OuAw32i1l0ux8ikjKU+Mj+rUGlNEoasKOxQXe6P/QuI20g3nTMlC/96j+lckbsQl5alBvYbd8no5TX4LFf3STiBlKA340h3zIzUkBffc+CWeJVE3DYRvoCC/E5h+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRg0JU/yjvdLxd9Z7WD5qPZ5qDytPrEVsV6okmmrTew=;
 b=IZzf4vihKzSHPawQxFk/29NDu0M8h8GOEWQWY5uUuMFy6s2eIoes4148yobFgBCFWnNI9hHiPbq9tZwXdFHZCnaXur1//EMzHHwJzWRrAx8EC7FwyF9lmflvNCIHqLYVWakgYYbiTobO7C0U4lniO7W6QK87Lff9jXlZ99Yjf/+GsSFZYvsVv9KIik5V6VyPsxCgKVy/Uyi/LT6mGbJONVqN/JY6dxRHlrJcrVjiz0o0573a8CPsg7iANUUN0YZiuVkqfqSXi2Bf7cyWpurGX3jqkVL5enGDL43jctlxO6VKHqrQInFZECjdLsC2qevaiJUcd08fO0VXTiS7Z8xxtw==
Received: from CH0PR03CA0223.namprd03.prod.outlook.com (2603:10b6:610:e7::18)
 by SA1PR12MB9548.namprd12.prod.outlook.com (2603:10b6:806:458::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 28 Aug
 2025 06:00:05 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::f1) by CH0PR03CA0223.outlook.office365.com
 (2603:10b6:610:e7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 06:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 06:00:04 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 27 Aug
 2025 22:59:54 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 27 Aug 2025 22:59:53 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 27 Aug 2025 22:59:50 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v6 3/5] i2c: tegra: Add HS mode support
Date: Thu, 28 Aug 2025 11:29:31 +0530
Message-ID: <20250828055933.496548-4-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828055933.496548-1-kkartik@nvidia.com>
References: <20250828055933.496548-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|SA1PR12MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a0f20d-d4f4-4a1f-539f-08dde5f8228a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KvTX7f994UEYeiUmPLDQTK9boixX7YyP4M+ltzAyO1aMg5D2l1TjI3gMTWC4?=
 =?us-ascii?Q?ivIc8pREIUprKttu+QOchPwoin0qzjcTgqUlMCjEJxngCalVwexjWxU9yGoO?=
 =?us-ascii?Q?i7/Mozm8qfAfks/Ww02Juxdl7j9gjBM/L6ozwp98NtvMVIZK1wgxdA5uGneW?=
 =?us-ascii?Q?k6+4X/gRlrKU8PQ3ujSdTTlpyOLN7ESP922g3pUEILBNoDxCct/deJPTDME7?=
 =?us-ascii?Q?3DG6hMdAgSQgq6CuZQPoi2WOfFlfRDdxxYKwZ14EdSJtDzq/A0tnPQsAHdJo?=
 =?us-ascii?Q?qd82a9DJKbgHH/HwzUxiznLPD6TpfHaGtCXZLJcMfdaGprA7fr3Uleo2VoKU?=
 =?us-ascii?Q?Wacao/f0TEM2TLranT/yDeV1Fga+TCvI7mT9RQrfhJpNiC0v3sXECcYDPm96?=
 =?us-ascii?Q?r/Pz/wBCPWlJKpoLZrIF/mvAWefmLuetUrTMCroIm8LtAE1EeffgTUa4EBEe?=
 =?us-ascii?Q?Vi0XqdLBIqu3tYAJovoQOcTNcZr5oUVLVN7OD6XrD+EX4CVK2NWNVnG4LjrX?=
 =?us-ascii?Q?Mjalzs+Ig1gn1f9QY6VCANH9Fzfn6GBg5m3R57Me4zpUhJe6uCraqGoCz3mQ?=
 =?us-ascii?Q?TPA+n9xo22LvhB/gyeYHOrmYYnMx/xoA15uwCrzXBFvc38Rg5B6y2lZcwNH5?=
 =?us-ascii?Q?x+v70YOI8/ubeMNs71NzS1tHT5BFApZ2tLmoyr3ZHncdcdsk9kUlsDhBJ1vR?=
 =?us-ascii?Q?uahxA9pjbjaYlzNJZBxcoZ4cNqg7byIPZZWyixBtdhB3GCBNu9HZMVoFfvLN?=
 =?us-ascii?Q?3WSVCVj7q2HsT+/ckwiQjU05ioviRLCXrATd70zDZVQvBDl4Wd59GZLHgglY?=
 =?us-ascii?Q?Y+U3zUiHgpvM2R/3RimQ1osHrsLhvbyFTtZ2ErZc72mBdM0dtu6gex9CpgHD?=
 =?us-ascii?Q?/yCWUCdMijLlva6aAelDpyutQlr5/VkzqyyE5QfN169PrPyydF8wURpI8F4F?=
 =?us-ascii?Q?0dCKlrGk9tUkI/r+wbC2fIqRjwB1IRQEdnUaCzkOM8yeUh9hbojgg+NU/au2?=
 =?us-ascii?Q?UBCv/+Op6/6zoy7sqoTCdKSnZi8yuk7jrmlsNKJsMmIkinFpIhXbRzGlpWE+?=
 =?us-ascii?Q?JDiojh/4GN4bdCcxxNAGm+L6gse3ZFpWMO6zN6M/fZcUU86dT5qy0FUChCOM?=
 =?us-ascii?Q?QAMvbpY537UUCITbUqlwRO8jHyp/ii1fQP7Y/d3xYGPX/W3//NZ9+bg3pDKr?=
 =?us-ascii?Q?cn+xGt2PFTzr2WVrbAND9OQ+bTT5ICHI4FKhtb9d/I+3Yws9oaVGLBiB+q85?=
 =?us-ascii?Q?Rgxy35pLmFznDraw8FqTBUrz6W7XIb6abVzc9bVN+ZMHhkcevR7j25UUE6bB?=
 =?us-ascii?Q?CIDhG1zWGrM5UmHl/zmWSxmhagYewELIEtFQMybpR5sWZZmLEtM4NSog+zkN?=
 =?us-ascii?Q?SOImcQOHqsm12FQehay4sYnETXAHB+6SWS7ttt+ucs/PvRKJDCkwvKwEuk+M?=
 =?us-ascii?Q?zVHPpNHFMjKwLa4NO/vyB/9vOPedGrigbN1oa9gIcMhrI4YkiB4E+iEQwmcD?=
 =?us-ascii?Q?Wvjvxg3haHjJyTTnG6LEiKTPpTDujKIy7CKdkcnVvlyjOvVJEFNQDewtQw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 06:00:04.9228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a0f20d-d4f4-4a1f-539f-08dde5f8228a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9548

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
index 0c428cba4df3..20d5c8a6925d 100644
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
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.43.0


