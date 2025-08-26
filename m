Return-Path: <linux-i2c+bounces-12430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6346B35707
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 10:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BFE22A085D
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 08:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB742FE580;
	Tue, 26 Aug 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nUnIil5S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FDD2FE065;
	Tue, 26 Aug 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197201; cv=fail; b=r4wLBWxA4S2Jzrza9JB3GatIHxxHHrsR1l8Ip2KOGze3K2AiRP2tqFyw1okkHxNDOi49KYtHBFbHyfrVEDZpGybihULv5SUc7krHpZY7BmneCDXL+hd9bh5S6nzF6B6RwyZMFIkiLEmqY0r9kT1sK2BbPf7cYIN0qbRlQa7pMaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197201; c=relaxed/simple;
	bh=2VMW242CtkOQ+PNfot0klWHe1n3VaxA1T1gab/rP16A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OTHpfpUCwKIqFWB3nEq0Mlqig6nTeevo15HUdX95MVHzU8hS8dbxEMDSlfu9XH243jYy9c8CS099skYbs4pBTjiTBWtEV36XjHhA1TQWQjG7iWiU5Lj/sZ2h8YgLgdmyyHaicmETJ2ebcph04P6/bk+YCxsTOGl1Myk4pdOK+rM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nUnIil5S; arc=fail smtp.client-ip=40.107.237.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pszcxueEQQZnNKGTBCBOou/YL0bGbJXgXBAjqBvlRMLpkhC0ZSc19J4vovtOZ4hsPCP01Zdn5tmy1LEL0JEAJ7NjWpXA6HShHWoZ037YmO6/MR0VBXe40Dt/B57n3ho5tsgWfyTQ0QX8vO6Nrchuccs59hPbTmxm2vMpC2Nwr+1YypLwy/R1mRkM7YTyet19o1rw+rOp1nvyghF5mL7Vx2KtzsiYc/lWDhsoorRjuJfo2ed9UC8indUW07RIl0/SYNJNmUMtysml9s/sF6ceEfM2D8fpoS0RRvLboX6ZVdtBO+ubeo33ZUvI69lqsc2KhucMsLOiKblXj1oUjVb5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRg0JU/yjvdLxd9Z7WD5qPZ5qDytPrEVsV6okmmrTew=;
 b=K7N3RWKswLLown9kKI5PE+Qwu7GV9CJYHsA2dkT42M9r72g+h9LFRcLW356VRbid95BIIA1FmvWLkzbdwx3rMKT02gIqINIp+7xzKJEF81hs/ZUc7oh4IQDZpbmGh/4cnYTsac7gHW1kDxWaokyl6slMTTfkdORaRcK/uIwp8Qh+dkd6KSSW+NY3PSzXxNDR3puc026B/tNL+tun1JVoboGyNM1rPeyX24/G7gXRfSHjYYy42+PgKZQrEwIEDY39LaQAOZsP+UYK1RQ4mlAbhUCl4d3R5z8MW8LfTTVA7QbgaxiVDTYbA3Kdd3Kb5SKNrzsBNiIuKjnBxit9Z4H0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRg0JU/yjvdLxd9Z7WD5qPZ5qDytPrEVsV6okmmrTew=;
 b=nUnIil5SPv/4OC7M1+HS/Fpd8U6J2XoUreG3hQyQeuKifTkKo5BRTlYUQ4cc/GWccS8NSrEC5Wrg/mWNTVOIndYfJujs/F/WumHACsk0SkMXPPR9DQB+NynMgWgu7LA8uMaiz0HOuw34xP7g+j4LuK2OPIU87NYuXetDT5hAx7ESxaw2m/hyxC3dK9c2NkFlREMwRWXXGF20UgUM0aQEZHKGYRAIp67+UdyqxQ3Ew0gw8ZOt5g4htkle+qNgyXk29EeLLtiXyy68GZ7+Cdsp7d/e2GMdxQeT+oJc9Vqj2tCs92ABla7eiCrPGOkaGpFXQ65J0JgHtRUkTAnT/VQh7g==
Received: from BYAPR02CA0030.namprd02.prod.outlook.com (2603:10b6:a02:ee::43)
 by IA0PR12MB8895.namprd12.prod.outlook.com (2603:10b6:208:491::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Tue, 26 Aug
 2025 08:33:16 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a02:ee:cafe::e2) by BYAPR02CA0030.outlook.office365.com
 (2603:10b6:a02:ee::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Tue,
 26 Aug 2025 08:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 08:33:16 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 26 Aug
 2025 01:33:05 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 26 Aug 2025 01:33:04 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 26 Aug 2025 01:33:01 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v5 3/5] i2c: tegra: Add HS mode support
Date: Tue, 26 Aug 2025 14:02:42 +0530
Message-ID: <20250826083244.487610-4-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|IA0PR12MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d6640a-d103-41ea-815f-08dde47b3422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gzRKdf5EpPkW88rGB2mBN5Um3Ip6a5saDgeAGpqFQuLcOn4c+9G8JEVlxEQp?=
 =?us-ascii?Q?gcisnVxjswv0rR+P1BoJKsAW2SJZzVzKEmKWG8Z7jVkzwTfP++XlMlPPgaXg?=
 =?us-ascii?Q?G5PW40XFW04pxVjDxPWdjlp7q40negIPi94iKOmqrQkU69zAkiZ+F4oWalWi?=
 =?us-ascii?Q?9jn4zDL2xc5JDWwUx1LoakNHMq0a/SMvE+504qu8UinM80Egjeshqn1v80RO?=
 =?us-ascii?Q?8tHsfOKEOxBnGtpJ1a6qXqzV6MaB4x0DWijgPIfuP/BhLlszpLBXGwZtM/G8?=
 =?us-ascii?Q?k1xcZrOsD+SYc3OTm1meeS6dlST+oqMd9/3vKFlsAV5WVNXFCcxeVTsPqcQ6?=
 =?us-ascii?Q?b3pMqwEwVbpRJaJUbjuFZd1p9OqvN5ehIyBSwUxHx7e3SxTYj8n/+RiWIX9h?=
 =?us-ascii?Q?+QZXiuBHPZ7ot3hrAAzM2uKYbFXzKrPwM5XdIY43FvJYO5PVYouqMG6+vYOW?=
 =?us-ascii?Q?Ydl3jmK2BnCBa2/dO6jtsrzbf0+tXc+03JSvrTKo3Qj0psLpj1FrBUI3AYrT?=
 =?us-ascii?Q?A5zIGDezoLc4+AjvUcXWFmgjuaHSZqMeX7b1y6rQdmqoJr1Z3uxSifFnlnuO?=
 =?us-ascii?Q?IsBRG64FRLeflz0Dm2Oa2dIWqLkHY20Owr1eReaZb4dBoHNDJ9xksUf2uhFf?=
 =?us-ascii?Q?JkbfgEiok2rU4xRb9QVQNR+p2h6/haacvyAE16sreUutkYlsaR9T4u+RRnZS?=
 =?us-ascii?Q?0AOA8Ft0MvcFPqkntHEEtmnrEA71+GOgUG/2jia4BnCLXzvq4EWbDIvx6UyZ?=
 =?us-ascii?Q?ccaBX7Iodc2DnbTcrUhjQysUoavgTeq8lctmPQzl3t53GVpblKeYNzNrFpzI?=
 =?us-ascii?Q?VhG8fmkWiIvRxIbHxrJlHNcZZp+bNxnMPBitjMypS1w60iKJmWP0jwMg8V/d?=
 =?us-ascii?Q?OBpJJ+DcN/p6qMJMcCrO9qmouvR0VUx2r8RdNcI8jkA/JnnzSB+EGIYuALM4?=
 =?us-ascii?Q?bvGfH0qRFEpltattugM+xf+Vr5wpHoqpw3+qp9gJO2SM3vRLHOiVQqi7BNVx?=
 =?us-ascii?Q?E8BfQBBd7qct7Bpy6LmUvItBMP/ces5UMOL84LgC5LtmHJP9BdFcgMwRztcs?=
 =?us-ascii?Q?dEkjR8TDOgek9FREdYgxFgreflyyh68o4a6LQurrcwjLI91pJafAIAuLvvlR?=
 =?us-ascii?Q?XQJtCi5BkeCFMspjXMw+1hcopmUDqPm/9agA053Hg97+wcY9IFmfyvfa8FWt?=
 =?us-ascii?Q?KM3zu4+AcK05hiJI5lz44gJWSRtlRcYyGEXJvNP4J9nrlVzx+EeOAZ5QWS8A?=
 =?us-ascii?Q?Hb5YON6UoBuuv1CxLID751Led3FYXtLrch8YsFAdFPZLlo8olDbK1REkiwpr?=
 =?us-ascii?Q?OUFUESXrlWIgYcQg83x/9HmNtvFx3DpkYAe3cL2pZAJ0TSdx9sCb/bKdPva7?=
 =?us-ascii?Q?2jdJ2LNlXJj3Tm5Jl0/gXtQuD2u/gt+6LsnM6V1Y/CxiXOzh8HrGyE6tiEkF?=
 =?us-ascii?Q?mVISLS0nmxbk1XanmqmFqzkltlh3TeyYWviNk/BPl+kxOMGlnv6B2kH9KsLq?=
 =?us-ascii?Q?t4xcwsvpHKxFg1DRuKE8Ox59rpnH56reiHBWXpzlITcMrvgt779t0Yoh1w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:33:16.2952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d6640a-d103-41ea-815f-08dde47b3422
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8895

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


