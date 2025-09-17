Return-Path: <linux-i2c+bounces-13015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4571B7DC88
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9BB31C06817
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 08:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB883112C8;
	Wed, 17 Sep 2025 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tSW4zbK6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011033.outbound.protection.outlook.com [52.101.57.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E4C310652;
	Wed, 17 Sep 2025 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099452; cv=fail; b=R9sqdOUMDbrVA3RVGu8sjrQ0bh01dg90RnWzlcciZFhBoG8pNSalowh4JLxbrVDGjCQBBbaHaiL51VPT2o9bG9aAU18dI8OaZsrTL++/e7XTxj/Eq0tET7xUN9yrYmgJQ5g2Abz6qR9lg0Ti9yesrUR7TtgaAqhWuI1ksbUih8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099452; c=relaxed/simple;
	bh=lnGkIj5ugbvNbGVo7T4u3ZdQ7S2a+QuFCpOhlwkWKms=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mW+M9KacvwAndmh/IX6SLGPbeD5Vlwo5mqIcHUW+ufimkMWcDh5QnJW4oKYRB3/Pff/7bVZh2SRfJirXbZvTgt/eoBoAw/wgWaaP13ARFWF8KurNFDzbe06AJDzn8BnBlkIO+qoq6nqxKOXQwgJRJ2MSxWZL3Z+sG3/qcsd61Bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tSW4zbK6; arc=fail smtp.client-ip=52.101.57.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkcoALyuDBCM3xY/w3PGPBufT1shCPhDANjhsCTnwKwq8rwWrpQT+gfXcmCdhJ3esXQDwB/0y2jXESNz+MQzFfGye9y5E3qyfRdO5CEHYJMU0442tx54z/4D7zU7azMvuzrXEZ7wbd71b5Ehr7lQObWIZBqmMIfPDlXUAcf+SRnWWNrfFflmV5XFhOsQfGhUIPi3/pqZqC+7dEHIhnNz/TZ6bDNJEW4esGhnT0SyjM8ZCkbSBXSaNDMYZscVZFdHm9wPET/CKzjygK+ymoG/tufyxXqAY9LsWpG9Syu1T8UnoJkXVMUWg3qssOrihOfXgsWKI+Ehx/K7m/wjAK0txA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfmJSZoabzycpu8zhzYxRez2aCoAcToHId0DGEApSDY=;
 b=L6UA7KElHIzDS23CMdeiqLq5lmruppQZAWsiuA6ypre8+eBowLKYGQ2Siu6N7kbvrfWLxaH5S+wZu/dlvGgKPSNLAO0g7SSmKO6TIPTqD5Hd7H9qlf/Yq9POtpyCpY8P/KDYZOa9EHRXQ51BZhcY4U3ysU+2p5brXBYs2gUPyZ4XQPoNuLnpyYsYQl3ohB+UB00Le+wGsVni0YivfPN7Zlc6pNwJbSuRfGNP26zOMsKJVPjODPrdNpcA2JEIWZ8ttrR/BRNp7XkZYeUX2IvHNzsNa8TBQkHfqTFPEUY9HLyypns6j6U4CIw+cOVRd1Jls0OCSizGZSOrPYEXiZ7VgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfmJSZoabzycpu8zhzYxRez2aCoAcToHId0DGEApSDY=;
 b=tSW4zbK6x4n9fdmV2EadqqWFnDJj08VW8+8pTMJSan61syX0lH9psRl8PUu1Jt91s0PbXyM8Yj8zcgD3ZuDsPRFg8a2B2F+dsvqzFVYXXnA3S2zUSXPgtZnmAepGGaFIcPkVNZMJqQ0EXg5SNnjqGx3YbVilC0tgIXj+3PMRCx12/zhHFVbP4f/YUeVaOYt/2+/yge8/S/CuOe4tKvWkto/r+nuoYSTxIMdSH6yfeEDBRE73VtHfSLI5FjQln0eNWgoaEH4nMvqcy9KilnWuXWthdeQ8F+szaYzaWuH7KshSTWR/HV2LN9xo/guWx78UV5vJVF1vCxrve7OsSaUIsQ==
Received: from CH0P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::13)
 by CYXPR12MB9340.namprd12.prod.outlook.com (2603:10b6:930:e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 08:57:26 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::62) by CH0P221CA0031.outlook.office365.com
 (2603:10b6:610:11d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 08:57:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 08:57:26 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:57:16 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 17 Sep 2025 01:57:15 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 17 Sep 2025 01:57:11 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v8 4/4] i2c: tegra: Add Tegra264 support
Date: Wed, 17 Sep 2025 14:26:50 +0530
Message-ID: <20250917085650.594279-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917085650.594279-1-kkartik@nvidia.com>
References: <20250917085650.594279-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|CYXPR12MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a173031-5485-4fce-95a5-08ddf5c839b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?URW0prKk18AB904b0JE1riTeZpUkgtleHef5iRI4ZyjlYn+nj9Jam4slybN4?=
 =?us-ascii?Q?fnHhG83smwAXGBCk2vXB6Js1tgiDYB5mfdFi259prZi5hC8MB/RzkTWXyHSU?=
 =?us-ascii?Q?OAdbbEbY1WGcPQtKdH5SK1woH5irhgrYgF47GtYacLQA1rxBwA3FfuBIf6/I?=
 =?us-ascii?Q?Yju/eN4Mx8tms6ykVBTQ2cmtmjKhyH1duN/GrcBW2QmZWM0vIN7TRcBmq2NB?=
 =?us-ascii?Q?qFf911VGmfawmMvmy3H4+dPaalOBARq9Vp7hNJctAW5q5Wy6pqp9OIP2XLrE?=
 =?us-ascii?Q?2r7/Qvge236rOFF26NB5xpHicI+JDPRT+9Kve+5iVTb3qXwWd0zwKpRmR3g5?=
 =?us-ascii?Q?9Wf7rDL94kxTh1t7GS4+723CG3rhsu4T3fEUKPB3FEL0WSCYASrHW1Lo5Zkk?=
 =?us-ascii?Q?5OuT4dDZwop4pwXyCSs7t0pBzq2Xmsycuprh0YNFENfDU9vymBnV4IPUye4L?=
 =?us-ascii?Q?2r9+8yaUMQgP8APt6IW4J5yl5hNe4JoxVsF2FOdEQL7ZUYri8we26zTHFPv3?=
 =?us-ascii?Q?q2cpL3oGrEIoTUMU4QLyhpwrlZOmP2lK+WVldC49iqlvegUim4LHHZga4ALU?=
 =?us-ascii?Q?wGk4u7TM+CefxZrLuXvk8v8PlIc8XKZnch59X2B5jpcx8g+Fsc09F5o5d6QI?=
 =?us-ascii?Q?TvoP26XfKam737/R0RmznV1G033NeWxqmwhR/RV3VQjU7HKtLUvFFI2oI4+3?=
 =?us-ascii?Q?Tnn9Ad69KqWstl+rmIY/skccrKZWD1N6UfOvuV/2H2KfyLiN9ntaLWT7hZ8F?=
 =?us-ascii?Q?EgTbVGVNzVsIlxDvD+rW5oovlP2X10b2HCLl+r9eo79aSyuKvf1qqgmDQHoY?=
 =?us-ascii?Q?AcY3D0lP6R6qYOKVWorpiXffMSf24f7SBtZ0EqKBNUeGYPCXXobyuvYTTrmZ?=
 =?us-ascii?Q?Du2KXEMJHSjYHLvMfIs+9qLvUkL38dNvPSa64erphucs3bo79ACUmzddpYPZ?=
 =?us-ascii?Q?6BnA8Fkr0YsSGdWrUToN1nA51r7ZUL3aBHXiDJT3a69mSPpzis9VBdHlZpnh?=
 =?us-ascii?Q?eSkiNEwuT7uKj9Dfs6OArJi+0zeWJtk/okVimNRnBqghDfe1f0cCKD7cR+mF?=
 =?us-ascii?Q?rbdEpxsIWPJUEOhuJ8XTnFzyRqF9Jou+56ILfc4KvI9vwS1DvcdCGuo8nDQj?=
 =?us-ascii?Q?j35wFUg8tB7fmNXns6OtsTvOA6PafM069nugorBQxy2+NwtjXDu+5V35SHVi?=
 =?us-ascii?Q?ttOaxK5aVTEi6EuQuB7ebuD0NVhk1IxNUESlJR+NoI8sF2ScsPOh0Z78WGTp?=
 =?us-ascii?Q?dp7+ggN3MiCQnStFaksQj4Kkdf0EJGfEl93IQUMaczZ8FTTpBdSVfIuukjoN?=
 =?us-ascii?Q?oyrac54t0a9YYnTzZ5Bw903WAVnkrN3uCYGNQQpLMUNpwG6iN6ReGWCKtmGg?=
 =?us-ascii?Q?X6/w40aTgbTHEFDrA5+6BZC7oXvYZL1mR9QNV48OZXV4q2DbNGFfNU9S3Rni?=
 =?us-ascii?Q?GISIdXHLEGAlGBYSFAaIRW0EGO/8XnLNe4PPspNBvedaeFa0Jdudi4becMC2?=
 =?us-ascii?Q?zdRG9FiN8tLA5TxEVLp0ScyaD/o+tx6K6qbZK8fcZ1NgtQPoDEfwnRk0Yw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:57:26.5412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a173031-5485-4fce-95a5-08ddf5c839b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340

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
index a2119b8bcc1d..cc9aa7f008eb 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1804,7 +1804,36 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
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


