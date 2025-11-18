Return-Path: <linux-i2c+bounces-14143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E1997C69DF7
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 15:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 341E94EF150
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 14:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CC135A121;
	Tue, 18 Nov 2025 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QP8KJe/k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013015.outbound.protection.outlook.com [40.107.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E34625D53C;
	Tue, 18 Nov 2025 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474873; cv=fail; b=YEO6+ZG7CCW9XJmqK84uSA7fnErm5D+ggCP/x9K2ANF7OTdNOUafnMPs3ICmKPl6WqUDz+ypdaJF467oS1WZ2tT8izscadgLmaxoJk0+GhGn7lSjbboqxseTugi9uRdwhIzk5PMCYBVHYDLlcS+sHV8R4g9qemsStHvpfv+OLMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474873; c=relaxed/simple;
	bh=saK2icSUBH2bMgkDPMNEVUFy2rmyPM5ByhLGIA4WaMI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m4e5aiZPQpIYQlkoDNawWKbqUHD9QANKF6iY+DS8ir5GVXJgfB2Wy5Ey3OiWbXECSjQF/LiMLUjl0o5Q8Qbn+JVxqG3RIzeLHIiNjfOou26XpevpU6e1mmY595B07rBejlgs4T5EyV0sShepMI0PAW8BJAVK93oOCb1wn0Zv7dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QP8KJe/k; arc=fail smtp.client-ip=40.107.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQgYeGeozzDRi1e27yOvqMHC4eY9bcs9F2baehHQ6Xk81aWy1OoKjJwV3rVqPuKciAgk5YNnU5WhP3e0qYFAAhHuyjZTgZxq650Aamtcyzn5e9EBYLKjLyi4pZSXoqN4I09dHJQCxBaXhIU3BvuCpX/OeIuKWWz9Ma0ptGnDplTzfNz8QIRy03UEzjj5tU0zK3NfO//EDAVHPEi0fZ7PxVfcvsByC2lNa52UbfdxI4b/5Vucj1Hq1slPLkyR2haMtzySJrnIYMOiMSJwUOgwEHcbRUJRrtpcUFkj5amaZ13kFNAbxGM9r0M59A5nRw/UqZfZZtCjrbNUcY0+5t6W+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqJgGeb8psysB1P5j245bvwnlFLymkN6h7hZq5H7K7A=;
 b=Af68Ld1bX+07YZE+azIlq6j/gheNSK0DEu4AuuEWAZVAe0p6RpJUiOiJMPBThu2qbiG95aYTUpKY1OPZgvFqD+j1IRM7CRAfSWbAVwXZb7RnNI2Sir4m8d0Dp3MG1T0tm5pF3aSxwNWV9OLIQbWY2v7c5CH84vQQqNx8VShKMBaKOOSvTe0jJE0TqXjPlSryC+NN3nL5fPvb9YLmZ/KUfoONZtdkpAs0CI3VOAjn364Y0qJZ8pxcmZbKZthHXKO1CmSCvp4XxEYcxQgTrGSTGw37DQxHaZFlwb61i1kZWzwFCGRycoAlEYhVVGeJkJ/J3BdG5e35wFfPxvrghQvr7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqJgGeb8psysB1P5j245bvwnlFLymkN6h7hZq5H7K7A=;
 b=QP8KJe/kieMMnrq3HJBWbN0yiXewGosnErTi1WPFfbQhl9v5C5Zr8O1apCcXwN7igs8RqsfB+k2gfzwrhVcLEAl3E0Aud7kCVfRxvx9Y9Np1m5AlI9QZ7kcC3FrL/o45MgVsjpmSFsUelqsbQDKm13Unr3a+OelnF1iudPLCyAstOKucchFHdXKDAgv5e0g9EsrC+zJsvTVBKcNzntecSVC1al3yvcw/IOBSZyYli9Cd5PRk6+zN2aX66RYzzW0bYOdD9jwGNZkxPkkX8tm1YkXXyW8A0xB/o4Hrkr/6DvBet8KHhUOKhfcT/A1aLHyIIBEtF1FT0A2LQP8ZJQD7RA==
Received: from BYAPR21CA0020.namprd21.prod.outlook.com (2603:10b6:a03:114::30)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 14:07:44 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::de) by BYAPR21CA0020.outlook.office365.com
 (2603:10b6:a03:114::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.2 via Frontend Transport; Tue,
 18 Nov 2025 14:07:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 14:07:43 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:07:25 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:07:24 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 06:07:20 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v13 4/6] i2c: tegra: Add HS mode support
Date: Tue, 18 Nov 2025 19:36:18 +0530
Message-ID: <20251118140620.549-5-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251118140620.549-1-akhilrajeev@nvidia.com>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 154b2375-4e11-49fd-a54a-08de26abd817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uKnjKelJKDNvAMl+QcgM3npYoDRfmwyyX2fUbc1K7Z1b0KB/EwvCgYAVix6m?=
 =?us-ascii?Q?43oXD/6QT+ER4AOZdhoCZaQSU/PXGvTFd1EWWQRd6E74ievRz8no0auSPfUt?=
 =?us-ascii?Q?DgXLbqOXOdFd8SYM4mmZPToy/EUbD/2BbFYCpZVeIoKnw9Zg7+pdLgJZC2Tr?=
 =?us-ascii?Q?hXD+7yfaPt6Dc2ezr4/9alsS9E4FUc346yVo2nzZbgfXadEfQuLD0OnOuVpP?=
 =?us-ascii?Q?zbroESUlCWPL3CZ2ftGuCSfcBnT2/ZxPuQ/DXe0/CaTcy4t/CKzkTIQoA8ve?=
 =?us-ascii?Q?eq5RLr+tO0rA/p5V1gIgXNTRoq9YVw6vMfVOMy+k3kdwsT8wN6Rlt2LG9+dw?=
 =?us-ascii?Q?u4zAaDPSgmh4VjsH4dzLG2jB5eWNhq7d08uCjKwO8VZn/kl/9cI0YtWz6Dat?=
 =?us-ascii?Q?09Mq81b5s+g2Pk1zirbUpdfa17xSgePDaeUMWokn7AQJQzUvUp7GvEgEFm5P?=
 =?us-ascii?Q?HVvuT+Z5pBcSS3HKytETK8tXCwoUgCFw7aMZX9vbk02gdUk1ZujNjFChJj6Y?=
 =?us-ascii?Q?JBkbK+u2k38m90gTvDwdPH97vieDWRgmdbiTL/k6coyr80uW3ab+E5lTyYcL?=
 =?us-ascii?Q?i1Eta1w7YUE3nEvCCnQj6V0E2S0APUGrbQCmnUwNTwdlW0lIDOYMe2/cFM4q?=
 =?us-ascii?Q?4yeLTVTLBIJOzbl7mJClREXr7DVDfvHYB6BR0UGMobk7e27LlGyWoDJ+/Q0V?=
 =?us-ascii?Q?KXxXMGxpWBahWMGR/47sb6qn/eVu8/MCxjdJ3m2i7TTLYuzn6eOg6U/DJkOm?=
 =?us-ascii?Q?/b7pEYVPAu7wnd10/8gYXAiBwvVMXr6456EozfMcFX0XDRPlBsPt6QiXa69P?=
 =?us-ascii?Q?5svMKvAnIDN0fWCaKu22UH7mqVTlBQWWGKNbRV20uStci4nL1pBGtEk2DPnJ?=
 =?us-ascii?Q?EF0GjexIkqT1gSBbd0IUFM9TJ6mM+48xA0rJIJUnswZRYQd95+2b1W+8/Zdx?=
 =?us-ascii?Q?Vky+Nsiomm7iVby8piFl4PKQqZ/hII7utUKjc2rEZLyNCS4wxw5MUYMQYi+/?=
 =?us-ascii?Q?YpoS7CJy+omdEgHXM91mCvg0RfOKfdSBOsiCRruxGb4yOYKYaqhFsbesEkjS?=
 =?us-ascii?Q?Sn7XH/kEfZFEQKUWosg3fC1OS8wjVNaPo4VhLJo4joygxdZ4bhhAcUGt+bmV?=
 =?us-ascii?Q?bnCh8V5vUP1cbCKVksUBCNShhLFIz0+A+rwYwSj9+fqhBHMuFfZgbZFlaQ/B?=
 =?us-ascii?Q?wF3NSnHBT7Ho1vnIhLg/hCixEaJCucKBOne4NZ11NPyfBKy+0HyQs/vzVBJy?=
 =?us-ascii?Q?jpT3mfXIMut2qe70pokuSAL+BdJYs8N8QL9V2oQZ1P4/D3UDcCS3EoxS228+?=
 =?us-ascii?Q?8JtSSe+wh3qs6QHzSNVzSINSdwyD3l04DUR5VQs3dS4YAcftfIkDbmnfYjbi?=
 =?us-ascii?Q?8vFaFu265RMCpod1YIWdlYDfkwu1/ktHEjHo9nc1QSPGBOwgY886/5VD7UKh?=
 =?us-ascii?Q?a6MRqod1y4l1qpEy642ULd2MTDJ80BnIPMWu1Ui2vPZan4g6PVTg3Hg9Bfrr?=
 =?us-ascii?Q?ettD151j5KaXkzk7mpQIkRI6JbZn8B2ZtVn0C+MPUzsiPyqC4ZXFVGmHE/Xi?=
 =?us-ascii?Q?fguDAimp65I4XywlxOIVHF+dWra+sAQ6nM41KwxY?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:07:43.8450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 154b2375-4e11-49fd-a54a-08de26abd817
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079

Add support for High Speed (HS) mode transfers for Tegra194 and later
chips. While HS mode has been documented in the technical reference
manuals since Tegra20, the hardware implementation appears to be broken
on all chips prior to Tegra194.

When HS mode is not supported, set the frequency to FM+ instead.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v12 ->v13:
	* Update has_hs_mode_support to enable_hs_mode_support
	* Update the commit description
v11 -> v12:
        * Update bus_freq_hz to max supported freq and updates to
          accomodate the changes from Patch 2/6.
v10 -> v11:
        * Update the if condition as per the comments received on:
          https://lore.kernel.org/linux-tegra/20251110080502.865953-1-kkartik@nvidia.com/T/#t
v9 -> v10:
        * Change switch block to an if-else block.
v5 -> v9:
        * In the switch block, handle the case when hs mode is not
          supported. Also update it to use Fast mode for master code
          byte as per the I2C spec for HS mode.
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
 drivers/i2c/busses/i2c-tegra.c | 59 ++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 470d0d32d571..b2fe8add895b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -85,6 +85,7 @@
 #define PACKET_HEADER0_PROTOCOL			GENMASK(7, 4)
 #define PACKET_HEADER0_PROTOCOL_I2C		1
 
+#define I2C_HEADER_HS_MODE			BIT(22)
 #define I2C_HEADER_CONT_ON_NAK			BIT(21)
 #define I2C_HEADER_READ				BIT(19)
 #define I2C_HEADER_10BIT_ADDR			BIT(18)
@@ -200,6 +201,8 @@ enum msg_end_type {
  * @thigh_fast_mode: High period of the clock in fast mode.
  * @tlow_fastplus_mode: Low period of the clock in fast-plus mode.
  * @thigh_fastplus_mode: High period of the clock in fast-plus mode.
+ * @tlow_hs_mode: Low period of the clock in HS mode.
+ * @thigh_hs_mode: High period of the clock in HS mode.
  * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
  *		in standard mode.
  * @setup_hold_time_fast_mode: Setup and hold time for start and stop
@@ -210,6 +213,7 @@ enum msg_end_type {
  *		in HS mode.
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
+ * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -232,11 +236,14 @@ struct tegra_i2c_hw_feature {
 	u32 thigh_fast_mode;
 	u32 tlow_fastplus_mode;
 	u32 thigh_fastplus_mode;
+	u32 tlow_hs_mode;
+	u32 thigh_hs_mode;
 	u32 setup_hold_time_std_mode;
 	u32 setup_hold_time_fast_mode;
 	u32 setup_hold_time_fastplus_mode;
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
+	bool enable_hs_mode_support;
 };
 
 /**
@@ -646,6 +653,7 @@ static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
+	u32 max_bus_freq_hz;
 	struct i2c_timings *t = &i2c_dev->timings;
 	int err;
 
@@ -684,6 +692,14 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
+	if (i2c_dev->hw->enable_hs_mode_support)
+		max_bus_freq_hz = I2C_MAX_HIGH_SPEED_MODE_FREQ;
+	else
+		max_bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
+
+	if (WARN_ON(t->bus_freq_hz > max_bus_freq_hz))
+		t->bus_freq_hz = max_bus_freq_hz;
+
 	if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
 		tlow = i2c_dev->hw->tlow_std_mode;
 		thigh = i2c_dev->hw->thigh_std_mode;
@@ -694,11 +710,22 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		thigh = i2c_dev->hw->thigh_fast_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
 		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
-	} else {
+	} else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		tlow = i2c_dev->hw->tlow_fastplus_mode;
 		thigh = i2c_dev->hw->thigh_fastplus_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fastplus_mode;
 		non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
+	} else {
+		/*
+		 * When using HS mode, i.e. when the bus frequency is greater than fast plus mode,
+		 * the non-hs timing registers will be used for sending the master code byte for
+		 * transition to HS mode. Configure the non-hs timing registers for Fast Mode to
+		 * send the master code byte at 400kHz.
+		 */
+		tlow = i2c_dev->hw->tlow_fast_mode;
+		thigh = i2c_dev->hw->thigh_fast_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
+		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
 	}
 
 	/* make sure clock divisor programmed correctly */
@@ -720,6 +747,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
+	/* Write HS mode registers. These will get used only for HS mode*/
+	if (i2c_dev->hw->enable_hs_mode_support) {
+		tlow = i2c_dev->hw->tlow_hs_mode;
+		thigh = i2c_dev->hw->thigh_hs_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
+
+		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
+			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
+		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
+		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
+	}
+
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
 
 	err = clk_set_rate(i2c_dev->div_clk,
@@ -1217,6 +1256,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
+	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		packet_header |= I2C_HEADER_HS_MODE;
+
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
@@ -1508,6 +1550,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.enable_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1536,6 +1579,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.enable_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1564,6 +1608,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.enable_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1592,6 +1637,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1620,6 +1666,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1648,6 +1695,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1671,17 +1719,20 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.thigh_fast_mode = 0x2,
 	.tlow_fastplus_mode = 0x2,
 	.thigh_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x8,
+	.thigh_hs_mode = 0x3,
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_mode = 0x02020202,
 	.setup_hold_time_fastplus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
-	.clk_divisor_hs_mode = 7,
+	.clk_divisor_hs_mode = 9,
 	.clk_divisor_std_mode = 0x7a,
 	.clk_divisor_fast_mode = 0x40,
 	.clk_divisor_fast_plus_mode = 0x14,
@@ -1699,10 +1750,14 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.thigh_fast_mode = 0x2,
 	.tlow_fastplus_mode = 0x4,
 	.thigh_fastplus_mode = 0x4,
+	.tlow_hs_mode = 0x3,
+	.thigh_hs_mode = 0x2,
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_mode = 0x04010101,
 	.setup_hold_time_fastplus_mode = 0x04020202,
+	.setup_hold_time_hs_mode = 0x030303,
 	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = true,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.50.1


