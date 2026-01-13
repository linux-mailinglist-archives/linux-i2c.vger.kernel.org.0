Return-Path: <linux-i2c+bounces-15088-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC1D177D1
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 10:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6B853015AEC
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 09:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADE63815E5;
	Tue, 13 Jan 2026 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qBqoApp6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012005.outbound.protection.outlook.com [52.101.43.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168DD3803ED;
	Tue, 13 Jan 2026 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295129; cv=fail; b=j+VwWaR1+0GkPOx8J6A5xL2z0FQmwqbR/5yoz3BVkoRApgG51tzNZ5BKnJqm3uGoHWQGVENnMqAOrUlusEwPjnVr0YEo1VIx9Oi3Y0pgNLZHwqnixgUP1dvkLCq53cjJHN366q40Pz1OoTg2jWj7G1c42hMb0XLnz38HUzxX0cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295129; c=relaxed/simple;
	bh=Rp31vY6kusCgVOvODWSx1EfIpP9M88bG/ypvjZG7xog=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ddo1R46w7oHG5tMt1xCpepSIQcwM2GAURon0nyXCF4PCWvlRMtwe1TvuEzhlLdjqllej0Nx+qwjaFsDcZIWPrHpFOSaH0XtHz7Z++MELuTmsQe8FJNYKECqlQ7aU8OfNIjT+exBzGwJYxKKVbI/DmHaMmpuMS7QDh/u6tGtCpuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qBqoApp6; arc=fail smtp.client-ip=52.101.43.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxnIt++rpunSaoLu6tnXoBkXV5MBKy3HK7DIdZy3EGhjqZGiOvAJGMeKVAMnXJkktDtr2kqLXbKZAcchURA+8lBGXNo36eP3egw6f5BEIkN3agf7flfL8LHgVD148fZiqpwirkP2Sq0e1kUYa6eXFqFLvsfPgZPq8m+Fhim8FUxs/cgbDbfX2zVVmQBBvccfgqePQbngpzZryWk5L505+FTVuTAmaSDVigHsxKFSVNZwwznxrY2t1B1pifecT1ZxeAhLaCphwbYkbVDj87lALep/qY462wGQ9w85f8u4zpnccy7YqrwG7Em7JAr9BMqEDLzeTOD20O0tNpFYb7ZuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihvPl2jF6Y3xR1CVfTQp9YEzEAuwlUwBCXtWeRVOUT8=;
 b=ZNPkBAQgTV6Ph8Cta98YYmxm3VA65/pHkZ7SfM9/5P6K7l7bGIKEpX3t7A1fRQ63ItXV4EUnAPRThXp90Ab1k1PpLTdACqtbriWxdrwrGi4bfF2Zn5csd7h2kELhVePMcdmx1wqHryzb25D1FyM7RALiZmLAjAqRJ92NhXbCcb7LK0fj09wfVKKc1+HksxFp9lJ5V+YChIZtL0g8btS6jWfmjcdPbH/h0YnmSBuOVS4gDuBMemJ49sYP9F64T4hd5XnxSSGy2LrKYWEqNVmJTjY4DLGwSRDvAX96eBgAvl9SA2BM9s/u7eLCoExolxYJ9RIcbjETgkzQdS3RyR26aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihvPl2jF6Y3xR1CVfTQp9YEzEAuwlUwBCXtWeRVOUT8=;
 b=qBqoApp61XRxVYMpZx/AvQrj9adrPzsytf6Y9raz77t/EzGPchX/+4VG0vCNUUoadkxLTeYxEo9R703UmQ2oP1Mb/wlXTWqEf61ULOuJwgw+FM1TtcGihYSFFsTYRiAS6+dAz9Ft2451orbAMY6HGwpSaKtYUcW0LXuKoXTLSh7sJGCWmjZTTpjc6FlU7riQWgvKRz+Xe+0rFVasuQSF9DXM4I23slYGobfo6HWS+rxCONVOmXr2JoT/+3D0+rWN71S6tqF6HkKdKArn1Y6qUfqPBKuJ8YVIfmeFRrDqDSYYTyzpbw2laoND8qDtReJCKWBvFuNiB9EKgFJuMLDzWg==
Received: from SJ0PR03CA0134.namprd03.prod.outlook.com (2603:10b6:a03:33c::19)
 by SN7PR12MB6815.namprd12.prod.outlook.com (2603:10b6:806:265::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:05:21 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::3f) by SJ0PR03CA0134.outlook.office365.com
 (2603:10b6:a03:33c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 09:05:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 09:05:20 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 01:05:14 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 13 Jan 2026 01:05:13 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 01:05:10 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v6 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
Date: Tue, 13 Jan 2026 14:34:55 +0530
Message-ID: <20260113090457.41689-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113090457.41689-1-kkartik@nvidia.com>
References: <20260113090457.41689-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|SN7PR12MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: 51118e78-5d5b-4fc5-1728-08de5282e10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xa383rdn3iYVDY8wJ9hSYq6BzegS/f+5+Hup0R0f9M7wBZyFoiX2kjy2PaNT?=
 =?us-ascii?Q?rP7ktM33E1i0TfAPP/ULulOLfkinecttB1UUtYB9kJwKwGqkZaUq7O2qGa60?=
 =?us-ascii?Q?6uuCucxA5WkGEfkMMrx0lTfRRMkJMZg850vgaNfQFjFuiGm2DQmzjUaYGlO2?=
 =?us-ascii?Q?TFFXYu1VHqzI2fa0yP4P3zq6clxn9Bk68gsM+Vmd4YuvLgbGnUd30GPyCBzM?=
 =?us-ascii?Q?gitt43dW19+Hym3qzzKiXRJT58qMiCv5Yi68t3LdPCT0oON8jauIyH4sDsng?=
 =?us-ascii?Q?ejJhk/2I3eUPHo6v8Tvi5N1dmWid0RenS/pAvxPdO9TAq/TtscK/NZF/cSXa?=
 =?us-ascii?Q?VaAxEugUibaDROBxM+E+Bjlln6wGbBSwXjHfHstF7y4UwNTyCoQr29HrKc2p?=
 =?us-ascii?Q?UU+XsRDzl2OvL+Ib98QQMKIUbxyg1FhbWIokodCBT1F3/peFMDMBkCu3WLdt?=
 =?us-ascii?Q?BzLs8J+a7ZqayxCnCMLrXZycZuYk1vXbwIGjHxZaSgUtEoQlrosOrqmZRMjP?=
 =?us-ascii?Q?hmzcsgcBCH/c7Q9loFXy+lsr56+rfzbYriZwMaqnQWYVanjcDHfm1nZeyt9X?=
 =?us-ascii?Q?jS5omMH1eTVasdGcWMaxzRGpKsr57MEk+OGYj04sUzDAkPt2caQjUKk6UOQ3?=
 =?us-ascii?Q?X49euaEiK0SNu/jMvmMj/OgUyMQfGd/pRQfdm1qexd8u9BftgfA2TEjeqgRb?=
 =?us-ascii?Q?eV9ciqIp1Q9h362tgK/VjBn+syEocLHp1Xw+bxzj+mnL0HlbzB9qD8SVfwLU?=
 =?us-ascii?Q?V6s4CPJmOAlzkSpsoZcXxlHjEpIomn+Ppeqy2Zc9EQw7wyDFnsFitGC3ITtO?=
 =?us-ascii?Q?ACdL7sTO6qj5xaqW6SV5s/hPlv0i/1rUiFPsQQZZGzyEZgIWLL4WsWQM8t01?=
 =?us-ascii?Q?Rd7L8Fac26HinDWhUYT3Y8FFDaKtOfEs3akNepKkwHlmRbl21mqeIrqReajg?=
 =?us-ascii?Q?+g5b531ghCLKeBJ8V3b6HMoCKYa9hWck5o8+fmYz5K29D24DjPlAhPVGKNlj?=
 =?us-ascii?Q?oJ0ZQ/TNBJHXYq6zGZMToy+N0yo4t737NmE7IXsjeTF6cp62rmd/NZyEO6Tx?=
 =?us-ascii?Q?5+Tdwi6KSPJYKRlUYyjKzqBh+5mn4+MFR7ZXtZcTUXT2/Gzw9KwD8l27O89C?=
 =?us-ascii?Q?fkPL8uZs1JwW+XatfRPkHZRD/qlZxgYWfjwSZTa84X60YXE2Y9XhfcgQUUDB?=
 =?us-ascii?Q?vXvpBy42nW+V/ufGzSWinb1zIJetu4KxFcJi89kAdNpKSWSbS75Gm1Idq9uF?=
 =?us-ascii?Q?UIqgzo9o+A8oD5fdT5SV8767eDxfqP6Mm9FQgi49GkAaptKPVTejbQbbk7cD?=
 =?us-ascii?Q?HivTXnYTWCStYqCNT7IUZhfcI90Vt3xv9ZxDDdvCa81AYN4hD32ozAz4SaCo?=
 =?us-ascii?Q?7ud2gBFoC6V+snUZ/v+w1zEBSQ8Nw4QEG+LxRSgY6CD7WisJBXuSVGsYbBYp?=
 =?us-ascii?Q?IKJJ9K4ewdnKHlWevyv0Y3vccOwvdTu51GtjoaDwdUp2O87vo9WL51kl1tO7?=
 =?us-ascii?Q?npvCyGUlst5+BgPW49g+d3seHEeJMKk5lPmGXuDT+9LRRKo2Psc3D+0Hx2mh?=
 =?us-ascii?Q?1CJfp8KZeLPnEkFk1QmNFaMmZXF2JoODNpldhlwP?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:05:20.7923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51118e78-5d5b-4fc5-1728-08de5282e10d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6815

Move the variant field into tegra_i2c_hw_feature and populate it for all
SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
"nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
from tegra_i2c_parse_dt to initialize the Tegra I2C variant.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 98 ++++++++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9a09079dcc9c..cb6455fb3ee1 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -235,6 +235,7 @@ enum tegra_i2c_variant {
  *		timing settings.
  * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
  * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
+ * @variant: This represents the I2C controller variant.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -266,6 +267,7 @@ struct tegra_i2c_hw_feature {
 	bool has_interface_timing_reg;
 	bool enable_hs_mode_support;
 	bool has_mutex;
+	enum tegra_i2c_variant variant;
 };
 
 /**
@@ -281,7 +283,6 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @variant: This represents the I2C controller variant.
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -334,13 +335,12 @@ struct tegra_i2c_dev {
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
-	enum tegra_i2c_variant variant;
 };
 
 #define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
-		     (dev)->variant == TEGRA_I2C_VARIANT_DVC)
+		     (dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
 #define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
-		     (dev)->variant == TEGRA_I2C_VARIANT_VI)
+		     (dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -1649,8 +1649,42 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
+static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
+	.has_continue_xfer_support = false,
+	.has_per_pkt_xfer_complete_irq = false,
+	.clk_divisor_hs_mode = 3,
+	.clk_divisor_std_mode = 0,
+	.clk_divisor_fast_mode = 0,
+	.clk_divisor_fast_plus_mode = 0,
+	.has_config_load_reg = false,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = false,
+	.has_mst_fifo = false,
+	.has_mst_reset = false,
+	.quirks = &tegra_i2c_quirks,
+	.supports_bus_clear = false,
+	.has_apb_dma = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
+	.setup_hold_time_hs_mode = 0x0,
+	.has_interface_timing_reg = false,
+	.enable_hs_mode_support = false,
+	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DVC,
+};
+#endif
+
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = false,
@@ -1679,6 +1713,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1709,6 +1744,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1739,6 +1775,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1769,8 +1806,42 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+static const struct tegra_i2c_hw_feature tegra210_vi_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x19,
+	.clk_divisor_fast_mode = 0x19,
+	.clk_divisor_fast_plus_mode = 0x10,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = true,
+	.has_mst_fifo = false,
+	.has_mst_reset = false,
+	.quirks = &tegra_i2c_quirks,
+	.supports_bus_clear = true,
+	.has_apb_dma = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0,
+	.setup_hold_time_fast_mode = 0,
+	.setup_hold_time_fastplus_mode = 0,
+	.setup_hold_time_hs_mode = 0,
+	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = false,
+	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_VI,
+};
+#endif
+
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
@@ -1799,6 +1870,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1831,6 +1903,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
@@ -1863,6 +1936,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1895,6 +1969,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1903,7 +1978,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_vi_i2c_hw, },
 #endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
@@ -1911,7 +1986,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
-	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_dvc_i2c_hw, },
 #endif
 	{},
 };
@@ -1919,23 +1994,12 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
 static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
-	struct device_node *np = i2c_dev->dev->of_node;
 	bool multi_mode;
 
 	i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
 
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
-
-	i2c_dev->variant = TEGRA_I2C_VARIANT_DEFAULT;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->variant = TEGRA_I2C_VARIANT_DVC;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->variant = TEGRA_I2C_VARIANT_VI;
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.43.0


