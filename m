Return-Path: <linux-i2c+bounces-15280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2FDD3C3F0
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C35F46894BF
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F02E3D301B;
	Tue, 20 Jan 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cipMkb/r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F23B3D412E;
	Tue, 20 Jan 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900887; cv=fail; b=JIksBVNX18AO48piOMxmJIjAUu9Y065ta/88hsRIFxfbxe8TQNH2wXQZEOb5TOWdSxHA2juDLxKJSHr2B7z6y6ic9I7xe/2Lgifn6MZWfczf7cGobMoPWES7pUWr0pCpdcUbD7t+n4ZRGJwVUiD0cEjfOr3h+aS0FRfQvGGFJNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900887; c=relaxed/simple;
	bh=GKb6P06nPBL+4WFccWc5JBVNJUGfvPhJbxM9caxCLGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XQsqgAS9rNhxmyNOFlOzAwChF0eIUe6i11H5+iQL7NduuYFJTUi8qRksbpr9y1eG7IXnBNvWA0DvHS1zgzfkXKrmc4kkPU4mZIDrs4wNhwHA9QNCN0FhUuGbnsBnc9ws1Rhe8mS54/vSnhCk4FxD07LA07wGOFycFz4BT2UXRB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cipMkb/r; arc=fail smtp.client-ip=52.101.48.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRniiXF3h+I72ftY6CNQ8u+Xl7QsbhP1y0E0XIifj0+wvqDYfHAMTPmVh95ou/T/aWmVVQwyY8hDz9woiLFVdtWQW4m9qJ76NEUBuVM55A9E3fpXa5NWFYIwL0tBfK91sObTDsBBgUIjLZfn5lmInIMiz28im9fqCvJRY6r3U5IQsiJifb6f0+9Sdb9EZF8O2tn0vppqORj0KDvlobBT+cIcN27UQHltYvJl6OMKyCMb05/b0O/5ZWgx00XjAHuY/YO6w7j3NTISpli5dHXN+hGgCCu0t8zIJDgGgSzhczqh2+f2DeELWUvURYZoaHYvvLPkfjknuWYhSHUPWrbGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/C6H9rjMdSCZN2wB8ng96XTIwUwp4rCysLOAXl2kHE=;
 b=aQkuWR6o3LNGBZaQRVyEcNSFn1p3A2aZi5K1BvsvckqAXrl7iix6aCB3yq4yndAOojw2iuiZ1wHx6qRzdA8oI/ZZ6z3NgsyoqFPXVmuzqxUVhuMQkA93UPOhPhfnhLc9ctU8wJSxn/eSmx+1zJVoJnnc+F0CJ3eVnDf89eB0ikYJ9GtW7619R8xgg3uawH4hKYKJHwitpJacuft+sFvxxEsa9Rq46k9UstA30ZolxSylUwPO5Wk3ghfvzamHTCfTu903GWjer0wMr9g/TeaFPdyqorlxf8GF3BqX4WMu+ARAZ0ZHF6VT/vVdDmbZ6GCjZLEECeJMfr2ArNjpbT23OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/C6H9rjMdSCZN2wB8ng96XTIwUwp4rCysLOAXl2kHE=;
 b=cipMkb/r2cMGP+kKR0hp0ITY95KT8FGQsu6Tds+Vq4IitSkKI6LwYGqozE0yEkHk/UHLYZIPfe0afTRV0T9fEeSCzUCzIgxQnUivRcajK2C1MylDNHrY9ArkbAFDcDE+N2Gle1ycxGKkXFm8ybeSsGjMm1ge34SrjhHHCOzf+l51Yx7adNpLS+4DnrZ1bHd0j9oZjC+pIF+TyX0fkVfa2ZTBdoPNAbtGaDYOcUa2aOx0xSnEVMPtQUFSA6tzhwUhD15AtQBA6X9TEXR7s90ZMWpwHSk6002IY467Pbdq4w2W2rzjrz6A9IAXy2t3fazdziROUpYXWXhbyKEFFnqUwg==
Received: from DS7PR06CA0009.namprd06.prod.outlook.com (2603:10b6:8:2a::28) by
 DS7PR12MB6190.namprd12.prod.outlook.com (2603:10b6:8:99::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 09:21:19 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::71) by DS7PR06CA0009.outlook.office365.com
 (2603:10b6:8:2a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Tue,
 20 Jan 2026 09:21:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:21:19 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 01:20:47 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 01:20:47 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 01:20:44 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v8 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
Date: Tue, 20 Jan 2026 14:50:30 +0530
Message-ID: <20260120092032.83100-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120092032.83100-1-kkartik@nvidia.com>
References: <20260120092032.83100-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|DS7PR12MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d8dfb9-4bf9-4c46-496a-08de58054588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rvDgV0dwjSquFzxt8pXoDb0/U4semHRJBiCqx++GamSwpVM00odsZS3fbKKa?=
 =?us-ascii?Q?H4lF479JhYoffrVSEdEfMjknTV8t1JWgnVo2wrfRSZOxh3hzOQiglLl/M/ir?=
 =?us-ascii?Q?fssoZXFTLTVVqfUe+0s5yqFwQv8et/83iTAvpzj+tirI/cyh3ckktmVm/tO7?=
 =?us-ascii?Q?VJb0n7U85oiXvcdlJlF3rbkyupArytQSYqG5zptsqO3v5j9JyspYoPBQrEGe?=
 =?us-ascii?Q?VIR6kOc9pxAnWSzKhO8b4sprAvJNwnpr0h0Rm5qvBdrpIqEyqfsbw+uW7ii3?=
 =?us-ascii?Q?nqnWch9QPd7p2UzhH1zokMXyxthPZtXGRkIZGi2o7ybB1Q7eR+fWHh/DMT5y?=
 =?us-ascii?Q?YPjDZNB1xmw/ZRcECBj2Dg6qVeTWmhe8xeARJbKyua7L5sDP3LxC0kxCn7JI?=
 =?us-ascii?Q?b7SwnVqLL5c14OcLxeONvTrnYW2phsqEMTzDoLQBdDm+WBaAht8BtF8IO5HV?=
 =?us-ascii?Q?r6jcq1YOVvS/TMQtZoUa9AX49BCzPdKNuW5VHw/jcqSdVQyWnxYyGEUjzmzO?=
 =?us-ascii?Q?jIhoCYdQmsI+cv3vUdhq3XNmZSgP3oSTajYd4QpjQD3Ey70Xzr7to/ELjd4K?=
 =?us-ascii?Q?Xd92AlB+eRvbWn4Kmlkz3QbFHulhEEOkRZs1z/jIzyiO9KgtMSNIxQPl4zZ6?=
 =?us-ascii?Q?YQIBxbDgr2iaqVn9MX7gY0Xua380wHwgXWyj3Vm79pCmqKXRFRYigYw5fa3w?=
 =?us-ascii?Q?tmTcSa9UvY3ds5i5gPk5efLhZQ4uTIbuIkgf0X1Re8QWT/mgAqjLYCz3kbwP?=
 =?us-ascii?Q?dbVgj7lcQ1BAxnItyaOJrr5/kJlkcK1lIBQjD9Xt9MnDFYpsQLppcJmqXL34?=
 =?us-ascii?Q?kiUwyhtZp30NZ224rSeNJ2hUhqCdrhNBTs1b8cxu4y0ucLP9PWfyigcaBaJl?=
 =?us-ascii?Q?D+e6PicLtk0FVulo8OR+p74VG+DGBw+P1AKq/0yTNd8EGcoxrA3npeOcuTQ9?=
 =?us-ascii?Q?1+jaJu7cox5hslGu4frXpdnecMQdZa+qk5jnkUFFYT3uQu3zwHwiOoVHYCkV?=
 =?us-ascii?Q?vf5KAH3iuzzdob38nUCOxclnodeuD73Psua+CyGjxGi3JmD/s2jEyZ2SNaWQ?=
 =?us-ascii?Q?Gl7D8mM3GpET4aS108Tuh+pMOm4rnc8EMcxXeEtnFXlBox7WmWeRv4sFv8nX?=
 =?us-ascii?Q?S+LcdLAJ+heyExNh8EIEVunyHcXtTjEjSYbZIVamcjif7zpmBRUZSaVolNEX?=
 =?us-ascii?Q?k6oiRcAUledQAm/LnK3Af+e21XFE+zg3GnjfQ0UQ3cR/JyJpLxy0BLsZxFUv?=
 =?us-ascii?Q?uA7oIgtyJf60+vNlEd6H+OY8wB/TdTaUQ/2F8L0lU/uE+gIUWEDdAKSjT4pR?=
 =?us-ascii?Q?WA+2UBcxtrBu2e2CZTEl2JrdS33ojqhtd8muWszqXS4LE3ByI7ViHZ5Vp4S3?=
 =?us-ascii?Q?VdfOWM23tQTg44zgfPgg84PkFqBEP0/wFYhRWjWL3viv/IzhD1uEOsi6rMIj?=
 =?us-ascii?Q?bXUEeVUVMihiA4hRO2DTxRod+wSIJDv9MR51+P6wn9wzoVFFBsytKKeFvQLG?=
 =?us-ascii?Q?Nsk4BuzCjzcmzrExI8d3BZqeR1Sp5Y43K2ZSA/cmdSgIEUBpDfe9a9qhrGl4?=
 =?us-ascii?Q?S3xYEThyz1/My+ppusnCkQCDFkcm0gnwfPd8Mtj2p2n202EemGEw3bFaCUbR?=
 =?us-ascii?Q?Wv3v6Bzx/sewtPkH5JG4Be8wxJjUAL6w2q63brDduGRDvA3xRMX7PzfB+7qd?=
 =?us-ascii?Q?BTPJ4EeugwbFlWhTjFhm3VumwkA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:21:19.6278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d8dfb9-4bf9-4c46-496a-08de58054588
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6190

Move the variant field into tegra_i2c_hw_feature and populate it for all
SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
"nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
from tegra_i2c_parse_dt to initialize the Tegra I2C variant.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v5:
	* Updated commit message.
Changes in v4:
	* Reverted the change to remove config checks from IS_DVC and
	  IS_VI macros.
---
 drivers/i2c/busses/i2c-tegra.c | 98 ++++++++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c2c60ba4fe5e..2ef5fba66b0f 100644
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
@@ -280,7 +282,6 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @variant: This represents the I2C controller variant.
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -332,13 +333,12 @@ struct tegra_i2c_dev {
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
@@ -1647,8 +1647,42 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
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
@@ -1677,6 +1711,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1707,6 +1742,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1737,6 +1773,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1767,8 +1804,42 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
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
@@ -1797,6 +1868,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1829,6 +1901,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
@@ -1861,6 +1934,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1893,6 +1967,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1901,7 +1976,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_vi_i2c_hw, },
 #endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
@@ -1909,7 +1984,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
-	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_dvc_i2c_hw, },
 #endif
 	{},
 };
@@ -1917,23 +1992,12 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
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


