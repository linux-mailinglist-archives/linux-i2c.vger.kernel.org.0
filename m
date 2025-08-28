Return-Path: <linux-i2c+bounces-12457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712DFB3938F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 08:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC83916795F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 06:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495C427A135;
	Thu, 28 Aug 2025 06:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kfibw37F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA124A02;
	Thu, 28 Aug 2025 06:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756360825; cv=fail; b=WvfJW/gWq8NDn31ztpF71G3v96qWgcDVJ2oqEMKmTQFjkoHfMmmxzckQ9rAzW8SFbXDfioTKS97qjAMzTQb5FJtZFDtYZ/vntUnxjKXuY4opv7Eauw4J7l0HCQWW75EBJF8O60BHCByEGuhh7Sv3cttpFPyeUrPAXuDP5f5Kd6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756360825; c=relaxed/simple;
	bh=G4VV19jFqs856+Ggpi1/frm+DoMPsmAx2gllTXWL7CQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9LVhkW+X2xqF5OwKMzVw4EG1vLbAZqqchKyY2GtLZ1JWOCm/xUHX797/PCZnIYdR5CS8mhlsCPX4HJQkkAJx4624RBTrOXmIzeR3r94emFr/NlISgeD/76l7ecfh77vNLJPNC5m2Y4ZnskhymH/0TkXfReRPNLUjiXcJXkDbK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kfibw37F; arc=fail smtp.client-ip=40.107.237.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdEcDz/oesTheBdoPUX8b+RgPWfJSwnTU8WyBUSAgZos0mjgkNUNGq/9z7h/ThfoU2vQNsdQDjSYe1FQ0P8tsrxDDN/9uSvLQyTRaMV/HSMc8ovGc2UqW3gjPOhEjDJOim6GnNWXzseM+wQTVB3KKX+Tsl61cDpK3vP5g9WADBGzulnRBL/sIqldHZdRTJDpbKHxSLvx8K62ndgeFA+Aptgb3cWpPqgD2YYyYo/XmWGBgV/o8xGVkl3Fs9SrhlIzUBQAHqIfnEk6Ho98Ip4JDHb3lFxdImr5ZN7vo5EYe6doLyG6CuvtA4B8Pg4HeBS74h9B+/4ZP6RTjj6gCBpHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr/r5hvoMGqP7vXY30zVWnFPbtOtAcqwd+9ikZuqK1E=;
 b=IXNz8NURYT83nhAr2etp3ik/61cZoFXwyDd8pmnVyPRUEATjrh23orkMTpU2IMKatgR2LReiDy4yCWHz6O4b/36UwP9u+H+XjZs+nuSTZ/Mx0wyRRVizgE2XkMt/HxV7OLry/bKxzenNsiAv7RugUAjOYOCR3NL7FNXDwzVP3jPRBdG9MVjQ1+2xD/AcKtJA4uozo98BXzVU/dtC49RZ6AVGLeQLQFmXEw1a/JY6yNYXIhv816jZQMRLyNJ2kLczyGBdwB7XXsji3ksqtUgrLi9h60Y9bnMv7pGhinlRBDQy805yruyqz02uRsA5Nw7kBVdUlDcpIHXSjlIqfmxYGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wr/r5hvoMGqP7vXY30zVWnFPbtOtAcqwd+9ikZuqK1E=;
 b=kfibw37F9K2RL7hrfFStJTVMlLJA/3YXEpygShcTaGRR/JnaKtO95q60WKPeuvXQI6qALoDlevvn3fCY32tnlpMnr+S4RXxeywtwIGmFgqInDM2TNDJNtelwf6hhDiAFDaItjduiEQbasNbd5MLfD1P4rZ7/Ik2sQTmQe9iuK+fYJNMCGjFLtGupMgorbknz+Dcgsm9fToI18MLben4sXZgdfEFcFMoMx0ms66rJvPK+7pett6ZHEKfLR5Ef2H6Dvss6SReGT7xJaQjw9GAtqrs0YNGKi31JOucMAmRB93XB92UQhVBZag/8fJC6wPWPv2MMZvOfCfTrRgneZFqkSw==
Received: from SJ0PR05CA0075.namprd05.prod.outlook.com (2603:10b6:a03:332::20)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 06:00:18 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::1b) by SJ0PR05CA0075.outlook.office365.com
 (2603:10b6:a03:332::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.10 via Frontend Transport; Thu,
 28 Aug 2025 06:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 06:00:17 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 27 Aug
 2025 23:00:03 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 27 Aug 2025 23:00:02 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 27 Aug 2025 22:59:58 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v6 5/5] i2c: tegra: Add Tegra264 support
Date: Thu, 28 Aug 2025 11:29:33 +0530
Message-ID: <20250828055933.496548-6-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2ce25d-07be-4706-7144-08dde5f82a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CJjUnvQw5kE8wmWs/pqkVt7/8pg9bC7blHtmj/C0PR31DPb/Ku7OiHQ3thV1?=
 =?us-ascii?Q?EAjdrZ6Vdkfxx2XdsFq6zeaukJiWTlojg+MCcRgt7gyAt+OBKoEgoRakQfv0?=
 =?us-ascii?Q?xbamR/FIRcqPf+X8/MuibOWXDGWcqE9z4OGnPfZTNq9OXCb7xhD/7HcUq8fh?=
 =?us-ascii?Q?Wy5YefKhMEBvZy1pAck5S6+qwh1EWtYOoT4wSJzc8hlNz/BPGAwl8Ol6dYQm?=
 =?us-ascii?Q?rJyLXAV+U9HUkfbtCbSiOq3QvJQ3ye56pFBdvw+3jTFkNGJj5mfbmgKTGlIR?=
 =?us-ascii?Q?G6l4Cm5/KKvDc8N9eViWFwWPFlPGpiCSbgFZogudZQuIT0wp1rx6dEcbjpkh?=
 =?us-ascii?Q?QzobdOxXpDPbWY13w5seEbON6Z43/BEXDlpoarMfaEaSwvfUTjjg7URA8HKT?=
 =?us-ascii?Q?b7eyf/vhrcnBFs+pSApm5E+F+uV/sywxjWTrq31u9Z2v3KPHQgkItGrvO2yS?=
 =?us-ascii?Q?dQ7syj59WDVoaSb5/4G/DaS25rRpK0oBdnF8N9IacBeijdGtUH0ChxQptgvJ?=
 =?us-ascii?Q?8QiTlNc7MegF0GqmIUiXbtKrQg3L7BzCVvt5sjVlrPvdeNTMIkXi3YtXQM35?=
 =?us-ascii?Q?ocE5W0ry0BqSASFs7XiwM7HEc5aWFrB14NTfUwmxmUQ+SOiLJceMn7YYbLB8?=
 =?us-ascii?Q?TuoVGa85JoC4Xt5tuThFec0DjzIk2SeUFbDkf4XQHdddHJpunAEiySuHPfbZ?=
 =?us-ascii?Q?o5H5yLB3Oem3mp7+Wvc2Vxt9osG7S+PTH5xE3AzHMXOL3LxNO1k0H1Dm7agg?=
 =?us-ascii?Q?Qdfn4w1rsiqBvh+xoXnpXM2eMOxulwpeqtY9cuet09p1p7Y+Z54t3KkSJZwY?=
 =?us-ascii?Q?H0CBtC35IMrNhKkd43mNx0q+IBSHJZ9rZRxYWbUP0Pad0azHhE+nvZAkKBdf?=
 =?us-ascii?Q?E0pqOqPaOYNolMx72H/1BKxcdbHMmEOUbYwTedDz+oIChzygqEW7jAvXcxeV?=
 =?us-ascii?Q?FSWSFkLrIL49AqOawdsx4P0ju8Nb0AvJ1QOuOhGtNo3W5ir6ySxPfXPiOsQD?=
 =?us-ascii?Q?EXwU5z5htN7r+ocrA+j2tUUNmBVeQYaRyVTmphv2TuRlFIA/EuatPnoxS45N?=
 =?us-ascii?Q?Hssia4s1hnA2d2yi9Ejv82vZEKcSn42i0IiJgQnkAWQ01QUR3Ju5cdOkpiKd?=
 =?us-ascii?Q?BJnQNvmsrBQcFQh42usPnrpcBZfNE9O5uiFNcAF6I48PuAPl/5rOo0+4mG1e?=
 =?us-ascii?Q?X2unV/vtO+8hUIqbPwO0EpDo3dDDtGsA46CXNYHFY3aD+B3333idv8y5yvpq?=
 =?us-ascii?Q?o9bHJWdOQ3DwB8wTR1u/pWX/RUUltkhJTcTs+VCP95Y8cKd6J9NwomU/nIlR?=
 =?us-ascii?Q?93J0iA06EC5/ncNVuaap4y3MYSoH+0/nZckgvovLH7dkTl25EHLGX44ia2yd?=
 =?us-ascii?Q?9LsGtHYIgIehnGSFV2kPNXx4b61TTHsHkjNbtCrL19wCeL1WvG8MQWuRUA5g?=
 =?us-ascii?Q?SihDcoBRPmCCqm85ZHRijNx7cVjYCDZfgt/DB8UCM2i7SSrEZJEjABzfy1tt?=
 =?us-ascii?Q?rfNNf7tn9gtrV11EKeeg8DdMBhQF/lP/5VKYrqeHhQ2ufiirvknAa9nsjg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 06:00:17.5995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2ce25d-07be-4706-7144-08dde5f82a0e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134

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
index 88ee27f90526..971aa1559fa5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1784,7 +1784,36 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
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


