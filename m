Return-Path: <linux-i2c+bounces-12327-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571AAB29DC3
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 11:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1A8A2A33D4
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 09:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92D330E85E;
	Mon, 18 Aug 2025 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V9zeMKKX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137CA30E826;
	Mon, 18 Aug 2025 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509110; cv=fail; b=YVfjDum2aS4kLTtrE+VJjIcbkDS+HHXRJwsMuQwgrYZ7X+VSWupXD2PJEocCD/JP/7FLObTSDkGJyRqBk7kHoWlBZcuczlGEpalOuExvt0J4QMlyYnTKmcoyD3PZhHlqVpX8xIidrTRN2hcKO9y+raoiSnf8lh5gAk5garSRki8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509110; c=relaxed/simple;
	bh=iOFxZUZpBgwAU38cEgii4F7g0nIzLRZky1WG3iVfUOg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEaEoekfvG3/oQT9b3Wdkm05T33uVkI0ATSmhTAPEs+ElGjdHIl167tDTTYBpM7fSxZWvIom+qlPiP2ZVS0IXDDrXAMkmyEtQXMQCSvyBMCKPUdZDmeo9awkADajq+ihopVJEA2Zd/00WWi4Qa78LJogmuXDOF1ZGW33iifWMq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V9zeMKKX; arc=fail smtp.client-ip=40.107.236.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1wkQhicGDq54ri6IDo1N9dKCGrbOH8QbHwQ6KLG88NdQE2t7UFSzNRJFkBE3gputd6cDQZWrxBo13CJYsIuCQ6j2ZmVEf1qub1A02F8RPvnA5LyIhD8GCwSIDWmU7e/pbl/i0/Nfb77NWjOHceknyHrDenNzlqQ6O4x9gHNupJ0S01j6ph5kKwFG2Z126WfZra7dTfW4x8kmAedEDH4LoahF/6YTu2F7wmZXezH4UYcF7t4M7TcwydGb4F85Lt4YbFVrtoFW0vUC73sa2Rvke/Ff2faFRk+2lyn16VQ9hw9oUAmApMnv8nwpi0dNCy0cZ2jQZer/Fa1+QnUNZWzsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAa3I5hT8HTOqPKlmTXIrj7x0HiJI2MnNwkTmvefJ14=;
 b=tGVfQe4DmO5L4FM459Fx7tK9i6ljs1DrxU0GW1GwgNOM0b565YkzStDuT7PP7OxpKwttg3Sv7Ac9UkzAM5/EabkxqvRzUcstLWBGaxxqwTRCl/4X1Z8Ho+swEqSIw+/qwUqyiE+jsGTI7mMfcQI+gYHfneSHmMkYuIW7fDULpQ5WwS7Yvnfyefw+ArJxicIK6kC2LDmpQnAsXxtfQrPUQt7WrN25cpxbmUZPUrKyYi8vD67Arx/Z8PyQY8Sj1PQN2jiI5I1zXp9jWCHG3yhGhHKhzIQda8PCVM7x2b9GM+BvhvrBmFoFJi9lxJYvawnYSo/qNs+igSKbtTvpkanaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAa3I5hT8HTOqPKlmTXIrj7x0HiJI2MnNwkTmvefJ14=;
 b=V9zeMKKXEmUhfgOJJrr7A6Xo9/BFXy69LR9koVVu2OOoFeS2LL4ak0ya2Wn4ldwDxqvCWwFMHaWj4F7lrejfTrlwXhpfuPFob6/y6w9pEoTVq4wjOzOgtOZOIJaBF81ouf9oYJj9ISqSLHs1afZsQtIKNDsAVAnXvFreLZrGweyoVWWVCpEZB/AKa8x2rabIVamSMtjb7Nya64DTDAGy0dinSG5NClKOf1S4ZDSWiYT+6FBx2M+p0Dp7ghD6KccRXQfM2/Akukmp8+dcxKTRxvAiKvRL9GG/UwbP8GvVEDs4/BdmGn4/41lDYVipXe07kmR8UzQynUk9OVW3w9Qfhg==
Received: from CH0P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::9)
 by DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 18 Aug
 2025 09:25:05 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::9a) by CH0P223CA0021.outlook.office365.com
 (2603:10b6:610:116::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.20 via Frontend Transport; Mon,
 18 Aug 2025 09:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 09:25:05 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:53 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:52 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 18 Aug 2025 02:24:48 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v4 5/5] i2c: tegra: Add Tegra264 support
Date: Mon, 18 Aug 2025 14:54:11 +0530
Message-ID: <20250818092412.444755-6-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818092412.444755-1-kkartik@nvidia.com>
References: <20250818092412.444755-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|DM6PR12MB4137:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da89426-fc50-4991-881c-08ddde391e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?62mNraPZojSLcFu7i3Q5peji21+6275gJDcw+qXajx7tsRGSwe+bF1vzVVnW?=
 =?us-ascii?Q?1RXUysM9nX2ay7OmwJOyNPZYz8yIDN1qHa0oiEwQuX6U9EgErx+UGTA4Gtfa?=
 =?us-ascii?Q?e8QXFR6OKVMWSRN0vPnVuzhCQqO8XVYyA9wa0ICdRUJHAXrFNUXmVYnXPdNZ?=
 =?us-ascii?Q?PpxckH73iJNbaIS+LFPZoUDM6Ejej9X2ltp4Dae2fHNIdfT340UhtXE1Zhbg?=
 =?us-ascii?Q?PnEEZZdHeWAZ+ymbEnZ4YtgLKinMpqtPKNRjGapdI350iNclrFsjpNpvkbu6?=
 =?us-ascii?Q?EhZ3LFBqkM59HtuTgraxvODlCMKjCn4Gf2ozLOT3OCVZmdVJwFR1aiZsXGHE?=
 =?us-ascii?Q?RJs2syVbwL7TbY/tT3lDvmORTmkxt1v3gLh3hokS0kEVo+q2usoK2gvfjPRC?=
 =?us-ascii?Q?7fGCyHEc6eyMU15ioJZw7B7izN+93UV0GhuX+LaS1qC5cyYOiSoyGSPBExk0?=
 =?us-ascii?Q?NwwVLRdEbfRkPAQzNs9yyAPT0yftiiK8vdRPQDwn4KSQkhfQTEIh+bnc8wyb?=
 =?us-ascii?Q?wZRuC+6RiHohVYyIA9jnnakPzR87zw4aGa8y/wlxRq7hS9aFQcHLtUEGaQQV?=
 =?us-ascii?Q?7HaKBddSC0Gr3Trjjp5/HSrRAafbIsrqIrIVFexPek2GwKIlLsgHM7DX60IT?=
 =?us-ascii?Q?Zv8PenNHWwWNgOQwZMYRPShiyNG7CcOhz16vhyFT5VEsygLvDF+HteLQHtjH?=
 =?us-ascii?Q?WcqRv+Pl0oYYWQK1rMvMJAnR5wfpM+eX6i8xfZNIo5nxFYjg9pxQf7NMOQbw?=
 =?us-ascii?Q?vycY+lo1AvPgagu8/sZslyX/IqMv60HAHeFfjtNZfygiZSbIoeERgzfoly9Y?=
 =?us-ascii?Q?yXDh5C1LJ58jh4o+t52Kx9tecXSc6uhhleura7LQg47FERR4mkaNhtZBQA1d?=
 =?us-ascii?Q?Cqdd5dwFpUgA+zme/IQn0bhcs6LlRAF6Cp+XyzsNtUeLxyUDkkn/9g+fJRDu?=
 =?us-ascii?Q?gGnw1JGZ5u8L/43y+bFCDX9lZjGT1+Z1+kXNBf4NWUsR3c+TIWGerlzhkXWa?=
 =?us-ascii?Q?5WruCrUiQ+iUoBoFKSK6tYme5owo+mAL7FM7BMhKmOPBM1DLFRbPmAbReFcv?=
 =?us-ascii?Q?y+Pmccx3C7e2wro4tDcB7qYRq7VyjEyPatQpNwE5vsk1r7mM1J6UmRfYjlOp?=
 =?us-ascii?Q?mP/h8yYr4fG/QMdkrQ9B1K7YkB9zAaz33HiA2i9BRD9qZVFcKvOFyrvs1gwR?=
 =?us-ascii?Q?H6z58xcikDdDKYEQ2dzEivcUWP0AX8ZYuKlkhNn55tR8dMzO0qwtP5CiNouN?=
 =?us-ascii?Q?wr+MkRgVqyjficJBsr2AzwTr8Vvbx35C2nUSHMGEjgN3auORvh86O/PbPrQs?=
 =?us-ascii?Q?kNu79cv78yW/hotXK0VOnT6hNfu1W2ITQq3fBfbOBHy5S+vMCRqPHgfzlT+l?=
 =?us-ascii?Q?2JItI537rTys2SeHV1yJQ9a/uxFafdxxs9lipJyVA4yQstkMFlSFi3PDLLO6?=
 =?us-ascii?Q?gl6Ato9PJS02BzOXFThscdoO+KO6JxUCadJ4xQBKIEsqVwCAwLoZn6fjrPdY?=
 =?us-ascii?Q?oSYL0FyeUhdt2IxBNEPk9aw89gI8e8C/Rzx3PwpMUnwd+A26GDFqvyT6Yg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 09:25:05.4682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da89426-fc50-4991-881c-08ddde391e1a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4137

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
index 4b889dc66ba7..53bd1e38ff94 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1773,7 +1773,36 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
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


