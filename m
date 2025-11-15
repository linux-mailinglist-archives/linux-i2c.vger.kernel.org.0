Return-Path: <linux-i2c+bounces-14090-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CE481C5FFFA
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 05:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 780A7360074
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 04:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53840224AF1;
	Sat, 15 Nov 2025 04:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="atB2Xkr2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013015.outbound.protection.outlook.com [40.93.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9028311CBA;
	Sat, 15 Nov 2025 04:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763180894; cv=fail; b=T1a4Fl4SMvK45NViXFH7GskvfK2BZg60W+pKWNxhdWS+auo4cdsPNU2ZMm5CkWNH9M84xil1TRULw+I7TovvX1HOUCofLEESAIYS07abUMSe/TnvGgPlbPnykqpfyBDCMIdT72fIVLKf8kX4iReszwJ7dZr4Alpa5+SPUIm9If4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763180894; c=relaxed/simple;
	bh=jFpm1X+chx8nDIhkCkX8n/wu6pWWhgC8kS29F0T6Hv0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iV6axpxGsg+vjgEbyFM7q2yyjAhu3qdUUJJnJebnBx9qavpeswuyGJAJp1DVQhduO0HPfLVERWgPRgNm9TO5UyRGsuVA4C69vShogAtsURSQUjhtYHeTfC4jrTzjV8grP/AvVo16FH8LdYcymHSYOFlA5krkTbvGyXCaX/8GezA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=atB2Xkr2; arc=fail smtp.client-ip=40.93.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bT6iB3VdtHe1+0LQkx0vFfly9nXZLgKGgm31Y9vKwWpKTcUiaZzGJPUG8D18F65awZcx9Vn6MuRNrDxTh7iaZHzV8/SHJ6ZidQjOrsFoJGkub2iNEPGpIkJI3UO7F9jNhNodrXqAT6S9u16ziTRD+vaPrJnqVwStXvJ34B3fvUXtG67bADK9TMKafn1pFgmYHPfFThspLojkLpWwMLZgqUWE3BSPb7I4yag1ss1vfm+nQRlydz9t/a0IbhS4yDa1DLLGZcCtrU1NnBMm0Hlr7wUqAAflwcn2C+LnIofTsdQEcV0r45Y9FNHhc9+toRe5kBdaIS1BFzYkaZr5ad22mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJSyOMg8iQpLue1faaUU3DGO1pfTeMQ42oEn+19HrO4=;
 b=MT3GoxzcpeGGPNYDLHJepcGQbpI8ejmgC/H7rXSnmW/BeNHxHa8OfK65Xtgw1NLvTYuraOX19uj+4lqAJj8votSmF5xFmh/y/rXVa9Lkl6LcnLnOI2IxpwKPwxNSN/zMW4yhEItM0pUK/tj8G0i4Zu5XnegdFEVl9C+eri9Y9VFeX6eAQP0k1+/145LBZx9WqgVXZTvSSbxitBidgXFM1T25jPD0qyB7/IlFrmR5YbF/bC2IB56FOyLUU8HaB1FHcIv2y8eZVVVcZd8r0H6FGKjmnJ0CYsK2H1obFS4JjHuZTr01L6ZtVwM+S0LXaMjVAY4RJ+crfw+A8MffhDwhNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJSyOMg8iQpLue1faaUU3DGO1pfTeMQ42oEn+19HrO4=;
 b=atB2Xkr2zgr/Bya3WsXUSLwheSS/ZcqP5tzCvv8azwHtYdcq5Lp9f/Z+gFzPf3VDPR2VNMGE42uMA3US/XGcIf3Qw+DyaPeG+eHggXHHvXxwwC57g3hF20zuS9UOXg00F6bdwrqCOJGQWnu8nuYQ5y6CzI2To4NUlBjNBBOxmtv2XGqV2fWharQ6swB9DB+lCeKJ8H3IwqWkPV2izEHyzSrVXpbg032vrcr0/5tpuHer6MKMrlfjiCbdTnlXIyXS4c30K/akiQDS8UdPP0LtIDo7odciK+YI1b69tohmr0zfHp1Bb9JIsDPxsqmGQd3uoyzXmjXOGDwCQNf297N3aw==
Received: from SA0PR12CA0009.namprd12.prod.outlook.com (2603:10b6:806:6f::14)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 04:28:00 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:6f:cafe::65) by SA0PR12CA0009.outlook.office365.com
 (2603:10b6:806:6f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 04:27:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 04:27:59 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:27:50 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:27:49 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 20:27:45 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v12 3/6] i2c: tegra: Update Tegra256 timing parameters
Date: Sat, 15 Nov 2025 09:56:29 +0530
Message-ID: <20251115042632.69708-4-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251115042632.69708-1-akhilrajeev@nvidia.com>
References: <20251115042632.69708-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d76fcc-2387-4453-003f-08de23ff5ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?89jCb+bQA74XLi7WThr/hXYZWiMBy/RL0cUBywJyqK6d3h7oMSMgUBunerFY?=
 =?us-ascii?Q?91Z3GOUjqo6Wn11FczeRwxIY6vGgOVeRq+LvrR6oCiHRspgdYLfaBkYBcbDU?=
 =?us-ascii?Q?ComdsGpAhQwsrDwF7HMUkVa5ZDEjBD5dqqbpztKkxtQRshXUBL+FB5Qe6Vdr?=
 =?us-ascii?Q?DpBg1tw9+oLjpPMyuDilrpz1lPoN3QVVFZCtVdpYhyk8eAE+5wKoiRwYGCbI?=
 =?us-ascii?Q?C7AGPDQDI5yzQGhuYDloKPR+hvE/ZEUZGA2S8XIngC8KsTNM+U/w3ozYq890?=
 =?us-ascii?Q?diD8y+zk2O4rjfHKo9qldzg1G2lPJO31nAls9x/HJKsPuPjgNsL5y5dr3QB9?=
 =?us-ascii?Q?Ba6JNqBdFdPlG3dkn9JxI3y0qhM3EsNucsfEbiih2En/LkFVCj0YabnXd7Y2?=
 =?us-ascii?Q?Wlc/gLKRr8CgFRxXl6h4vNh036UhXnlnV5SbbbAJbCdMHLxNwQOYQQnjAuYM?=
 =?us-ascii?Q?+bxAIebAhovS8D7SOIXZkEKixJhslIIYFJhcbBfR6eRGNMAKFxY2QZsuA1+c?=
 =?us-ascii?Q?a6TUkHZ7bL+yukK1iq7cY1bJ/v2fOHEBIH0i04heUPwUc70JIJCDYpURGbPV?=
 =?us-ascii?Q?kHXgNYK067N0U/sSZO3rqdqU6VMbFIGgTxAceTR15DB2hXkS/OJRvK8Yd3ui?=
 =?us-ascii?Q?EdO7Sl6reegrMY+mLCfZ4VPunmz7XIk/xjx40McjFKLkgcn2n1OkBJxODssm?=
 =?us-ascii?Q?YgQ/ffUrzGDBCOMIYt/wpkkqHdjKiG7OBUL5nIjTOKFK1LkDmp+iviqXnJzl?=
 =?us-ascii?Q?hTFJeFzuydh+TFa+2kw/dpWzOWjsg/kTnHHHDtI/Vlmicj/iqOIOuunAzobv?=
 =?us-ascii?Q?LlABbL/jpQZfD/KpNadqEwK7dGh99vP3mw9c65wbKMX3X80Dimb7ACXzEckz?=
 =?us-ascii?Q?+3TEIrM6bwdDuVpTXHiqCY4ibbBRM9MxQvWqJYLox0HML7DfvujSHSleOq5b?=
 =?us-ascii?Q?jNdVbYXIw+FQMWB2I5UKrL4Vl/zvV7plED21l3dbXfgI3IWjCUe2sF31Ryi5?=
 =?us-ascii?Q?Ely9Bg1PNXDYKyZcs6q+V+U2UswmRS6wbRBKXsF7l00pKktG3Oau33uFa3/J?=
 =?us-ascii?Q?F7JHG7zMzIx4+tyWD/iL8Pvkmm81oTQemOvB7Pe8zNs3JKwgI76hOBqR+n31?=
 =?us-ascii?Q?6TtHq8veEDqfcpLl9H6ku2uA+HH0edsL5ic0/QJcqsyr/i82wMtaCmuVCRdz?=
 =?us-ascii?Q?t7zZ3A0CJfkJSzAPxek0e5MwIOGg7aSuWiu9bZ8GHeNR6DW6lclNAQiyh8rQ?=
 =?us-ascii?Q?g7EAWpWytD+oMVrj7kpAMn1d4TsMjSnvgyOj/UvsszD48qobHpCxvyEkscsK?=
 =?us-ascii?Q?5RQSMBEwSJfkpARWBbhKxiiP2KXXViLsQWUijBdWCf1QYhFA0PTtSzF0gdZf?=
 =?us-ascii?Q?HZxMo8PwL/7p4YdS2AmSLW9M8e7s5ioOjokjWJr7cknf/BLLgSrMIGKuLiUT?=
 =?us-ascii?Q?aYFH++rP7C9gHsNSKfwoVPa1kMKtBxM3VdMO92jK/m+W6bRxPU3mGrM/NXa+?=
 =?us-ascii?Q?gIYyRu1ZXfkaigez2j3b1CIwYpr/EoatF0H0HXPrLn4bK6kcbCqssVNBS+Zp?=
 =?us-ascii?Q?QMhwRLFs5Nuop5anMN8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 04:27:59.2714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d76fcc-2387-4453-003f-08de23ff5ba2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662

Update the timing parameters of Tegra256 so that the signals are complaint
with the I2C specification for SCL low time.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c0382c9a0430..8a696c88882e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1677,14 +1677,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 };
-
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
 	.clk_divisor_hs_mode = 7,
 	.clk_divisor_std_mode = 0x7a,
 	.clk_divisor_fast_mode = 0x40,
-	.clk_divisor_fast_plus_mode = 0x19,
+	.clk_divisor_fast_plus_mode = 0x14,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
@@ -1695,14 +1694,13 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
-	.tlow_fast_mode = 0x3,
-	.thigh_fast_mode = 0x3,
-	.tlow_fastplus_mode = 0x3,
-	.thigh_fastplus_mode = 0x3,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x4,
 	.setup_hold_time_std_mode = 0x08080808,
-	.setup_hold_time_fast_mode = 0x02020202,
-	.setup_hold_time_fastplus_mode = 0x02020202,
-	.setup_hold_time_hs_mode = 0x090909,
+	.setup_hold_time_fast_mode = 0x04010101,
+	.setup_hold_time_fastplus_mode = 0x04020202,
 	.has_interface_timing_reg = true,
 };
 
-- 
2.50.1


