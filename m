Return-Path: <linux-i2c+bounces-15089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B570D177E6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 10:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9E1230141C5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 09:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9809C3815F2;
	Tue, 13 Jan 2026 09:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ekrBxB4T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013048.outbound.protection.outlook.com [40.93.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD6C3815DB;
	Tue, 13 Jan 2026 09:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295141; cv=fail; b=WS4e6OS6KM3WGgf0zWLXOQSHN9b44bz4/Sk0Wes8exuiKiuGUcz2BLFUNjqHieg7wpVopMo/K6aI2bGso3ADU9+eTm+lrfOEm4W/SLfzeK4bHNaARqrT4YujRv0INziZwWkiY2+mdh6b7+9wTxT8tUU2iQEI1gT6JttAvv/fhyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295141; c=relaxed/simple;
	bh=VlChWv+SWUvX82xG5aeAQ8+rne/mT/2w55CUMJIzmc8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F40DQtanUqwdRZYkj4fCF3H0+9x4LkKYWBTL6MmhbeM/jcZs4MBO0Q3boeTpzOE9je1+HdxGqT8EMGMSwg40nOtPIyoLgyk4atX5ke1rBQ/QuahlK2zZrbcfcXIJ+lek2inrrGz8KAhRzenr32cwhgHNM++IxQm0eEVgx4Kb52w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ekrBxB4T; arc=fail smtp.client-ip=40.93.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuYwxjVURJ1lVZJH6Fegd6EP+obKNz5g4Onck/PZtkAX2O/N9854KBUNcmfADtbFWDdtzK/DjMJcorkhTmi9uYm0obTf23ekg+Xk/TgsZGu6bLiIPyuujrpXFev3uLJqAlSGSnYh8RZQpT4QHAAE0+4h9fqRKrpIRyMuY1ZZXjeasBLd4ws+Rb/AknlO3gt5d4qBk0lVeA6hDee71KKc9HQ3Ginp7Hkc+Dy2XiG8fyBsu9/2yybMZGnS/WDbRUqXuvgR+cdGoxj09K4dlGYdvVf9uTmrzZpEe74i89vQky+GWhBo6LjEWnNy1yHDSkobWLVoq/nOTTu1fDlRQ+oIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoKJws9esb103P32N2XcT09MHvHiZP/WdpHJGWFeku8=;
 b=RIVUf9l49yNUjaIhKlpHvZEqMVfqRkNs5cfnFczBdmF+1e24/yXD04drikDQ36IFF+HrsmIXJ3UV01F2ptGxhbjkXJ4gueWcvwd/VtFHdnfG5DpH64oX7ydcligIUFPRjqLkIaARcUjfjtKHqyf6Mkszv6wZKHHzneyP88jfyEmlL7LcEdo40t6vc0UDTKdPdm999YuS2bWUA36thdahKbxkAfRKQ3FTWsWJUqBHjOtqSAEaAkh/ef9mrVfAdxcVb6Fb+1tQnezT8jk+DpJpE5sjcYXc9nn5xQZ5bz4W38vAU12nLbVN539/6ktllbqmmfcNqZdqai6PZMGAzUWZ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoKJws9esb103P32N2XcT09MHvHiZP/WdpHJGWFeku8=;
 b=ekrBxB4Tm/Pp4e4IUgFKk/k3XvQof+yvMExq7PZCWET8UY8EKj+BztSzNK0hbggsQeioRXi5Q7I9uzDdv9JhERtvogW31lP2Y3kJyg7lakXGVvyIBCir/1mQlDWjAL/SW/Aoy7ZRsogXJ/kmVJcNUqO8aLjNhqV6VEVBtBgRm3JaWk8nINAyQTIhfLJNCfOFL4Kfz1Js6RNGW9cuufIXRCYFBjFOorunlf9lGEuXZoH0cwvf7UBg0gFgCainzzjKqCQGH3JRqICgtdQpnDbJJXObRBf2uFeRiDdNF1txQKv6f9HHKfk0wc9IwkPJSOsPJ83pFEBvBzJPV1HW3oFmPg==
Received: from BYAPR21CA0030.namprd21.prod.outlook.com (2603:10b6:a03:114::40)
 by CH2PR12MB4200.namprd12.prod.outlook.com (2603:10b6:610:ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:05:32 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::69) by BYAPR21CA0030.outlook.office365.com
 (2603:10b6:a03:114::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.1 via Frontend Transport; Tue,
 13 Jan 2026 09:05:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 09:05:31 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 01:05:22 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 13 Jan 2026 01:05:21 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 01:05:18 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v6 4/4] i2c: tegra: Add support for Tegra410
Date: Tue, 13 Jan 2026 14:34:57 +0530
Message-ID: <20260113090457.41689-5-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|CH2PR12MB4200:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a9a806-941e-40a3-d061-08de5282e7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gr5XDvw6f2keLQ6b1Kzg614o9ACE1vY8VMrj2GwsKyAmJQcdjjDgRfZUy/xZ?=
 =?us-ascii?Q?dI55+XA6WB+BRhtYQZ1RYiGH9bb/f2ifQISsm6lPsLH7vOTEaz3EEckMpage?=
 =?us-ascii?Q?jLYSLqSVWF4R3zvs0enmY3/TXKWmr0IA9e/2s5xholewzxpY4sMkUCxx1gPV?=
 =?us-ascii?Q?+bvWb8+ofntam1fBuRcutAnqhpjt3XAJFHKqBZ0NIvyvpBCgExsC4cZ817lq?=
 =?us-ascii?Q?1MPpQCl3Ha/TKo0yBRyfRLS8oyGDuxYuSnmGm+v6681svvNVdLsltSrMYwl2?=
 =?us-ascii?Q?FuSpaK5lLJEkSpKgmVtyGbNkqyJvDs9ePe6B7W1u9mkvwrtIRe+UfGt8HHXD?=
 =?us-ascii?Q?Uc8JovIqG8rrY8vmwkzukWlkoyZ3f2HiKkbTeusgH1bkv9QbB4/jJxlFnTpW?=
 =?us-ascii?Q?8DLfCnYwmNDkEP5ytalCVM6Np7IKIc1Mz9TM42eetj0t6DfpuHe0wkxbcckB?=
 =?us-ascii?Q?g470bx/+Tw2JU3YhkeQBIxvqpcxJcNZshcm05z8rRf7gZ/srKkFksW8R8/S3?=
 =?us-ascii?Q?w5FR9Bomab9zmJyuRt8uNEXBzg5ap23A0ceK2LIv8yp5LeNCrzkw/415TPt0?=
 =?us-ascii?Q?6qR/6P2YNw/z/A9oRdJ2s94DoehA7L3WyuJLKx+LVbbnP5hANJ1fzeWGSDP0?=
 =?us-ascii?Q?2fAuZbqP0NTBeHmm4vcZy2YNfak8bVuvGsDwk6Ro/lkYypbBPLEa7nfsQCEL?=
 =?us-ascii?Q?UgvFw1nKc67Cjgb+5WEXTlVuSIk4lhSTCn1geObLIPjL/N4hZ+v5KOw8nrRE?=
 =?us-ascii?Q?tONEqWffbJvSHdcTMxtVAa8pzZb1pQNaeKpZCRdkMYwKEGMPX1xqooc56UUp?=
 =?us-ascii?Q?y0BI5e3kVAfDsCjxmnfexrRb3Qa1BTaYDYKmzYgZqMyAvuyU3v5NZ7qdpd/y?=
 =?us-ascii?Q?cgtl8on5uZqqbcDzYxlGajNGBjbuYEintEFC1C3pN23byHqbQQpmBjFepTMH?=
 =?us-ascii?Q?23FdjsJfRMEZnLsg2W5pUAhII3Ds+rPY7iG/bevNwaTTNXICQcxvNGJSdLbX?=
 =?us-ascii?Q?a055+/zUI5HGNKWRAkLPtjDms8Ubf37PW5+fBjSpYEBBuW8sxZrtnQ9UeO4r?=
 =?us-ascii?Q?7TmyKVHhv/93oYucmhv0uh+XP6hrRg6tzPciT7OKXfO80pNVBvs7WXgn7L5/?=
 =?us-ascii?Q?1VzVRBe1SiZCThM4cYzLAKEff2wMWDT+qbknn9UbYqrSr22AJzAEpGFJcA9Q?=
 =?us-ascii?Q?V/ag3TfrxLq8k8FIKjg5Ik2+1zXVnSMwp90cY2LLhjqGqyqDn0tBcFBvbUor?=
 =?us-ascii?Q?6tuEuNsb8CGHPk86Q+YKsJk7UooYc96Mt7hjs1oifh3+9riIMQG7VZMdeBNs?=
 =?us-ascii?Q?5RYq4A6MYchh7fCT5ipkoUfCFltSJS70S/sejiw33EVj2saAt2q4rX2gHr/a?=
 =?us-ascii?Q?AT9La1MhyGJUDFGjlfgzaFBQo+6Pc80WGUJMooUZ8sAEcvDjZwU/oHWw12r/?=
 =?us-ascii?Q?5dayzGh5TOhuffpEYffRsRox9jW53jLDyiHPhY+BEvv8IakzSbMdiaxftr50?=
 =?us-ascii?Q?PAAvFYxBDybJEzdNEaB6Cd1k5LKE0pkGjLZexvywG4s0x0GpICk+V4dom+p4?=
 =?us-ascii?Q?CdCgP7c++XZgFjlbvWsfOTcBzGsudcy0gN7hF7yA?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:05:31.9875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a9a806-941e-40a3-d061-08de5282e7bc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4200

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v3:
	* Updated timing parameters for Tegra410.
---
 drivers/i2c/busses/i2c-tegra.c | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 81a25c00ac5d..255d8f8f9e5a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -275,6 +275,34 @@ static const struct tegra_i2c_regs tegra264_i2c_regs = {
 	.sw_mutex = 0x0ec,
 };
 
+static const struct tegra_i2c_regs tegra410_i2c_regs = {
+	.cnfg = 0x000,
+	.status = 0x01c,
+	.sl_cnfg = 0x020,
+	.sl_addr1 = 0x02c,
+	.sl_addr2 = 0x030,
+	.tx_fifo = 0x054,
+	.rx_fifo = 0x058,
+	.packet_transfer_status = 0x05c,
+	.fifo_control = 0x060,
+	.fifo_status = 0x064,
+	.int_mask = 0x068,
+	.int_status = 0x06c,
+	.clk_divisor = 0x070,
+	.bus_clear_cnfg = 0x088,
+	.bus_clear_status = 0x08c,
+	.config_load = 0x090,
+	.clken_override = 0x094,
+	.interface_timing_0 = 0x098,
+	.interface_timing_1 = 0x09c,
+	.hs_interface_timing_0 = 0x0a0,
+	.hs_interface_timing_1 = 0x0a4,
+	.master_reset_cntrl = 0x0ac,
+	.mst_fifo_control = 0x0b8,
+	.mst_fifo_status = 0x0bc,
+	.sw_mutex = 0x0f0,
+};
+
 /*
  * msg_end_type: The bus control which needs to be sent at end of transfer.
  * @MSG_END_STOP: Send stop pulse.
@@ -2082,6 +2110,40 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.regs = &tegra264_i2c_regs,
 };
 
+static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x3f,
+	.clk_divisor_fast_mode = 0x2c,
+	.clk_divisor_fast_plus_mode = 0x11,
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
+	.tlow_fast_mode = 0x2,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x2,
+	.thigh_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x8,
+	.thigh_hs_mode = 0x6,
+	.setup_hold_time_std_mode = 0x08080808,
+	.setup_hold_time_fast_mode = 0x02020202,
+	.setup_hold_time_fastplus_mode = 0x02020202,
+	.setup_hold_time_hs_mode = 0x0b0b0b,
+	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = true,
+	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra410_i2c_regs,
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
 	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
@@ -2392,6 +2454,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
 	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
 	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
 	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
-- 
2.43.0


