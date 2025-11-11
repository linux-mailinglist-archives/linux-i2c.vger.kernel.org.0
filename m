Return-Path: <linux-i2c+bounces-14051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C470C4C9D0
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 10:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A6801884C03
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443352F39B1;
	Tue, 11 Nov 2025 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="siwMQcww"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012032.outbound.protection.outlook.com [40.93.195.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2402EDD69;
	Tue, 11 Nov 2025 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852635; cv=fail; b=JUUoBv3+kvUK+9AoajP+lx/aJz+Ep6mqjXNGUuRdbpvt3+/asy2We85NuCqvxS25lcfdrhiPpoVcceEUlVw2Og6dh9xIDk/a7pb2Wh28THwi+Wd95mMv3QrJc3jmfg7eYEUhusYC+7t/obGufZDofGhJheCD4WxcwzqjhlaLyQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852635; c=relaxed/simple;
	bh=kxaCokdgSkJnZcGMzb6S+MPyE0jeAWwecDQ8O9yK77A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EtS95uGgMTZN1vLdKc16LpzKjvliyJ/GOVz0fWtGcRcGPWI3SRvdcprHmkFKKsSXATv81MTblto2oKKEeLOoauAgXpGaryepd6ecnSEh4d24Ki1qzxrS/kecHiubqdm9NgDF8lt9PoJ8l2IJ7LRguHZBC4SN8ZBehNzOhNro6f8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=siwMQcww; arc=fail smtp.client-ip=40.93.195.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvZdP4Cd8ktUsacGXCDiOGYei/CepJe51mKwIo7hSMfUXM8Aclw6Ez6GZ/KmV0749SeN8wxcOILYRw1a7aiRxScmI24x7NVVkiUth5+y9b441+buLZVaUN+RurEnyU/1tairs3PKOcrSVJxNU+EjsOAO0Kh1hMURf2khIZ2qEfe7c9WNtaNT8OxX+T2mhu/FM5s6kSrTufvtGJTZb6DKALzgbE7aF2EnSP9VKJ8MuJLvodU5bIEnv6289VstK0G9ylceRfnxc+ieG80Wps9kkcgyo5KCd/Hpl6ZczTd5p8xqaZLDsmUIDmR90keC3HtBV6gaiEnFXPYJQyqyrg/icQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtk1ueF1k9MxWwGmLjGxgJkVLrR2K8aRmR9C8pvv20Y=;
 b=h1Kl4IetugX+Fo3jYR5ztN6WN4WicJqJcT9phtR7ewDcUleOuGYBPJkZihEv0SUgVO6X+SaPOlP3AfS0ViAd4h0O8dDfFrb5QxMu7vJ7NxaKxGEA2RomBTekagLx2li9YpZK0CvS7j4Kz6keHEnj5QmHEIUXjJiEv1QeboUAZq4eRwJBeo7nobXUQCk8gln6WoPnNNLvti0R/oR3/6NMpLE6hUSP+45OhG6sAeforNU2n8pLqlNr4EgIyymc5Re+L7QsWgzobzln7cxTnQo4UGvg49/NsiciEa1DP8w+90CZK2sfqkEVR8qyot6/F0hE8t/jESsU/ggR8USgBCLJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtk1ueF1k9MxWwGmLjGxgJkVLrR2K8aRmR9C8pvv20Y=;
 b=siwMQcww1IIeX8kogUTGRtYYYktEkCyD+e8XHEL8IYQXuAUh51VQAlrq6Cdd4IjB0Pp85YGc9aRlmUayY13lWEIXzHdqNK5JFjL+zv8Xi6sJvYhX89id9v/mLLtJkCtM88+rBFdNO+0Ex6BGmlU6FyhlDps6zTNp/kgB3a9uh2osnCytITAmy0To86FDPp78SksN7OXvf7R5RkYoTi4Sn+uJvdNJj/m6+O7NZEzNttwj/W4PKwtOUBSp4zxpeAuYfKpXOseXrRGfAa1wwgAhwTfHjeqirZrSLnWNhzd/uuM6aXq4Q/+X3KzbYDTnUkM0YjZhfGcA7KpEF0XvASw61A==
Received: from BY5PR16CA0036.namprd16.prod.outlook.com (2603:10b6:a03:1a0::49)
 by LV0PR12MB999094.namprd12.prod.outlook.com (2603:10b6:408:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:17:10 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::51) by BY5PR16CA0036.outlook.office365.com
 (2603:10b6:a03:1a0::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 09:17:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 09:17:10 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 01:16:54 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 01:16:53 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 01:16:49 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v11 4/4] i2c: tegra: Add Tegra264 support
Date: Tue, 11 Nov 2025 14:46:27 +0530
Message-ID: <20251111091627.870613-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111091627.870613-1-kkartik@nvidia.com>
References: <20251111091627.870613-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|LV0PR12MB999094:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca34b6c-2a22-48b7-12ab-08de210317ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XxQoE04Za6caA0aYnSwXK+TiKu+I4Sbj+X6e9i4qU3A5eLEEBSFXoBzkB5Ju?=
 =?us-ascii?Q?4HkIaLTG8iA237siCJSzm2kZL/ew5sYNo40XgHgGFPdMtOl61Dty1DsnF7rh?=
 =?us-ascii?Q?ytRtRdaBTx8XPok83tQ2bELYRl9F8fKcREpXjEcurHaoEjga9LQMPKSqX2FP?=
 =?us-ascii?Q?/PDm6lPDRx6xLw4SjutP/k6zzy81iXN1jP3xezk+FW26aGcqqpPs7rcs/1CB?=
 =?us-ascii?Q?EROvrxTinvsRJWnxahwCpDDjmsZSObLmYBtD2v7s8E09ylK//oITVGd6qlDI?=
 =?us-ascii?Q?SSg0+NMUV91QPyU4i5B6X/wUXbwr2mDhwyZrWVcmtcb/ura13F49GeNajoEH?=
 =?us-ascii?Q?k18wE66RMz4AJe5pEYz9B9yXTl7KbUoq9hQ6s2oSweSNuHIHD8fGe2jNEc9x?=
 =?us-ascii?Q?LXfwimYA/GHhbkcGWgzIvWflzhYvQghzQ7Di+1S5KTJA+RMk7IHheGQorqmu?=
 =?us-ascii?Q?bm/q+Typ5X8+gC6Xs+0MoQ+lfoCDykZ+DCPF4he0NLzfGapF4aelfONFJCCY?=
 =?us-ascii?Q?9phgAhRO4drpYN4Xd7WcQZMTHJIK1absngk3jAVlFn81DoNe5ljrMeHuNOfj?=
 =?us-ascii?Q?BU65nGWrfR4nMK9b7jXByA5HnGZXevzR7H8yvrewBtLhSIvmSglLSJZdHeaU?=
 =?us-ascii?Q?4RCtn6mkFR9yoOMK0FA/MszcamOrVGQa+Nm6sTJy3l3UhyGAmvIK9c+prgmc?=
 =?us-ascii?Q?bgyTztY3oC7YE4Acu2Kpo5aRRCy4+whpCENuW3JkirgBshFV/LxzmR/pEWIJ?=
 =?us-ascii?Q?Kf7nCvXFSLfsZxz3gfGwZPM5lm5LZDyKuJhhn2MK0ui+ZoaaC3zZeC2CPbGL?=
 =?us-ascii?Q?WCNjbot7pBl2uasqzOd9GTWE9oHnqFyDfwmyYQu/uJX1oHnnexcMEpyxOIJA?=
 =?us-ascii?Q?nSUmS6LzZFPFkNKxDFDTnonvhs1S9CMgXBndVgT1TB58c8BT8KmZOUchwGYX?=
 =?us-ascii?Q?EhuJg3SsNYSZ0c/bQEPSfPfFPa4AT+RtVUO7LWyzbunQ3vEvsrA8et19KiEC?=
 =?us-ascii?Q?DMCfluQPtUedsmWb5s4XPTA4ZyQSDYSMLTK3nB8G9mrNwekyVEVazT8reCMD?=
 =?us-ascii?Q?hBna5jpmg4wTd1bfXZa7Vt6wJtEJlBM100U+dg82pyfaHEqd2gTX9Q3/LrmE?=
 =?us-ascii?Q?LuW5+CU1S8TAfxyF1MLvT0Ruye3Fm92/qkEpjzaQOhIWF40thcLlaJZPRLgN?=
 =?us-ascii?Q?5JymcwA8l/HEBc3zhEZj1LDI3LBtDaeJR0nOdi7jYoJHijpUDrDw763nfAEx?=
 =?us-ascii?Q?xjelAp7p1fnHj6OFT1eM5KQM3cIzAe4MJ71tvGadJxfz0f5b4yy0IVlpSJzr?=
 =?us-ascii?Q?KAXacjW4b+wi7o8u6w4zYoDHFrDdHtKoR+RuyoyHYGjl97kEcIfSdx1IA/Op?=
 =?us-ascii?Q?CFkQoi1+j93o003aHLPCA+pUDWh+yXQV/6TCEUVdigiBnmd8w+3eGOTjfZ7G?=
 =?us-ascii?Q?ZesQfGOSsy5hlJNlo3m+fedM6DoBbcg51DwWOHO9moQrwbpF0EBfxSkBaHzw?=
 =?us-ascii?Q?i66u00X5Sb9aia0SuGwh/ZQi9FhLP//4cx2ELW+l3Wc603me52X2cbc70+tY?=
 =?us-ascii?Q?5li5VIXLMPq6orPKe1mB1H9ea2yulG28UZHpWUkd?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 09:17:10.2013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca34b6c-2a22-48b7-12ab-08de210317ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999094

From: Akhil R <akhilrajeev@nvidia.com>

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
 drivers/i2c/busses/i2c-tegra.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3c20cb4a8fa6..a4b215dc14fd 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1805,7 +1805,37 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
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
 	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
-- 
2.43.0


