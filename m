Return-Path: <linux-i2c+bounces-11206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6909CACCA38
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 17:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 393693A19C8
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 15:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0151F23C8C7;
	Tue,  3 Jun 2025 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KX0aL42f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B4123BD0F;
	Tue,  3 Jun 2025 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964685; cv=fail; b=imkuTa9WNkNEddPFjeBlJsJehTq5LVwKDqyuM/TfW7ZwA0vhCsSHRWJ5e7nsO7aAwlg3w6KL1aPfCrO9yiBnxrFt5cz/U2MncHXNp44SiCotIltZf1hMwcycsWV62IEP/TM+GYe4dy9uKIKYtOKle/1t7K5KtG2sHfhC2QpIeOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964685; c=relaxed/simple;
	bh=60Hedu1C5znc1D97pOSxAM9of+vzIc5ib1kizYNbkps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pwc+t8fcgx1Tna+eAnt7w+LwfJ0zKMuPC60X0fN7+g1RziglqghDFD2b6OlHjVrR7blB8BZyHOoisfH+5OmrBHAlfD3wdS74QegOEe7rIFmMpYCQHOz/55p7qOwbNFrsBDaWLLgg2UT2KveGGdAITerQ+PJoz//Hzm0+eLBK/Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KX0aL42f; arc=fail smtp.client-ip=40.107.243.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbpEz/92vsKA2uduzr7wTKGNTHC+MVnANHLPQ9nRIadUQQmSL4/naO5Ef7Vmgq/q5NNm/79rJ0q4EeC1m+lvDmALK+laoDVE0NQ08+7Xglp7ywzcvBgSXPCB8C+DhSRfBuIWP+aLDhS8xN+CV+6HOAJ1sYkttS0GnNXZOOcVQ9RmV4kgfGeO8p5gyIDg6B0XO68rmCREi4T+uXdviIWB/4y67Vukjld/HLR0Wy5bHSOP0P1aqtqbCdThUYPOXw4oqhcHgmEGDpqqQ1EcgQ0JrvK9PTwRYAWAL5uuaKNkzJuQ4NWXSY/ClOZWc3kgiHsFZcwmQObbeSpPKtOg/cPgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sghxC7rw53Qcsso+ijWrk8LSvXav82UBTYy1jeL5kz8=;
 b=XkOutYU9wH/sYjDn+HfIBy5zb7q9JPv21RE8VPvAwZYg+9Q19SigxHLN1Pq37NOSNu+pXrxulTOeLrUisS39PtYMwTEflXns42o72Domf3NocllH7ISdkHNeZCwfLJrZDAd/zZLoCLL/kywekB8sYb70EcpDv8nbuCvAbUtvlT0Ff+VZyghgfH4WojW+zCw0UQYdf+SX1r7ZFn7VNnsPYHfymPzqcqbupqk5MosqLpZsAc8GhmyV7oUbh9Lqh7NOoz85WLNOXdCrRl3ZTcQ31gu8XtgJNrkLutN+Ww2p1aL/IxZY3EeTiJwkG8CiAF625qhveKXY2dWWQ9swswZTag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sghxC7rw53Qcsso+ijWrk8LSvXav82UBTYy1jeL5kz8=;
 b=KX0aL42fDUN5LHVLhAJSZtyP7uqheLtKO8ZqxcYwywCS9vpqkr23U7DdOhFypsyqRzNLE+BHMcr+POwBOgjGp9Z+NlG0nxTPL+9w27tro6fxKgwgxqx/ViR6OvlV9RwuHkiCtUlKlgRKiRSJjZbOAfPrNgRKVNRciB12lEW0q3kPWdL1CmdHdIlWI5gYLwKFjSMDPuu7UwwZ75qsnB55IGBUn6CG6W7jLe1WVlwmLaPq+Itf2rLGCCdLqELeWnnmJauqAf73CGfyuBuOAzdKY7l+jngVaIF91wjGKwPNGMMDLUVMnQ1NHrhWaASg5EG+PFdu1Obvv6Nz0h+5q9GNUw==
Received: from BN9PR03CA0409.namprd03.prod.outlook.com (2603:10b6:408:111::24)
 by CH3PR12MB8753.namprd12.prod.outlook.com (2603:10b6:610:178::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Tue, 3 Jun
 2025 15:31:13 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::dd) by BN9PR03CA0409.outlook.office365.com
 (2603:10b6:408:111::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Tue,
 3 Jun 2025 15:31:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 15:31:13 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Jun 2025
 08:30:50 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 3 Jun 2025 08:30:50 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 3 Jun 2025 08:30:46 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Date: Tue, 3 Jun 2025 21:00:21 +0530
Message-ID: <20250603153022.39434-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603153022.39434-1-akhilrajeev@nvidia.com>
References: <20250603153022.39434-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|CH3PR12MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b0a520-4ad7-4ce9-ad93-08dda2b3ac76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0ojZCDqkcwZWWdsjDlO7ly2Px18EGb6T54AvLZOFVzxF1btfLgRzrkC+zFHc?=
 =?us-ascii?Q?PWFgketS5Mep6gC5NuV0BKt05XvwgNjIID2gA0ysDEDMtt2ZgDhYpFwJ5PVU?=
 =?us-ascii?Q?87uLxfaso/FrCjUdY1ZzgBUPtk0AC1Qzwseb/uiIe9JaM04XRKZc4sKRlqNS?=
 =?us-ascii?Q?g4MPgDzBRocPlIAsvUsJ2eD7VAlvxh60mOSvPBaxfePS7ZdJ0PRJiJ88xgX1?=
 =?us-ascii?Q?cIB/f9ixsSUsqqb7w7fkQgcAnT5dlNEJ8D1hXRIezj7c+R8HztVkXT0riGq8?=
 =?us-ascii?Q?jtHMkjh94DAu341oiNkW/AAFhshYoiJrz1LQ8uQg7Rk+6rayiPotK7v4uQik?=
 =?us-ascii?Q?w64iv8tuqANYSCYelTTCG3F8kHP70T42Sfzlws8lEQLYODC23HYav7L0glBT?=
 =?us-ascii?Q?L8bseuGSzF7yLMic+V5/ptK/0VQJv971CJqzZF8ba1KgSLS1yl6Fl4YQTr+2?=
 =?us-ascii?Q?v9xDGYUtdNpG1/Wm1HgxytCyJKKrTMz49vDLWgqOrG0VoVuTvPwzgDjbGj1j?=
 =?us-ascii?Q?silOKPKUUnCsm5+NUGqmtWqzML2BFY2Bv9VPZg3uYjtN3qSspZuHcEBQT6C9?=
 =?us-ascii?Q?nmXwSUkavBqsMT9kfaDLb7aoz2WEhRtCr27DNHeHYOuVIMQYeUDw4cnJ/ha7?=
 =?us-ascii?Q?W8Kq/5I8+An8SNvhBgDY5Zj5eHU5IKHBuVmr5epEAByBJ7Mq3M4NEdv45VYT?=
 =?us-ascii?Q?V7/URAUz0txh6o/RLDMyXougKc8RJNimjQNcqR/3D4eCo+HG/heN0WFsVNw6?=
 =?us-ascii?Q?g5u0G90J4QH/Mb2bfCJ+nmj+XFsRMspphCpFCALPMegVIkKy3ys1Kx1JxHbi?=
 =?us-ascii?Q?aSVtZekacK/KmTjpgPc9zg/0bMt0X6dUcMh83oS2oL5BldIaWMz4iOEAGvCK?=
 =?us-ascii?Q?X+YfWIcsFhAuLV7yHDUeVFumSEolJiZ6nTKBf6m97+UIy3tsRoOg1m4Ydi3N?=
 =?us-ascii?Q?qz72qoJ/cfUP8SPjQWUBD6wHiK5SAfqSSlLwxS8c9lsbssrc579hS2NZVOIM?=
 =?us-ascii?Q?qqVRT0DlkeRwdAWd3y9MT9b7A+20TQ1Ddv95aG9+7iuVFe+G3uiFwX4Fo1PG?=
 =?us-ascii?Q?t36wmYnGP4IJJdbG6YOyh+6yWtN1Nozo7NHxvxc1Lz4AdjS5zDAJcG9sADUE?=
 =?us-ascii?Q?3fxVIboHL98XDR+fOf1hsA8pUpR25RVUIAj4bZJHAG+HDSMM1IK3tRa0i5SB?=
 =?us-ascii?Q?XamzoJrqlXEyLI9ezxVEWX/9yLCCXP9jEBVDFRgtP20KJEHHmaqaHfykq0xR?=
 =?us-ascii?Q?rwDdhSzw7WXWrHy8A2iz9J8GQ0+TAS9n/00RmXgobwtcJdIGoh8e5Da6EoSG?=
 =?us-ascii?Q?xyuX1OB0e0BST5aC0inr7i7+yM7nHkTjU0ZkbEGV0HmPjQNQ0vtlPwnkeifh?=
 =?us-ascii?Q?QcdgABt4bsEGCuYlpD1ekWyjJi8kaVw/0uxvlAuMK9cyFW4feUg2kUqsIvjg?=
 =?us-ascii?Q?T1Cf3fhk+PJVqLIwsTcU6AJO1TmUsmbXwgjyaywTYME/O0qmbzosvBRDnC4i?=
 =?us-ascii?Q?X+WacpKUIOxenpoJ17IWUlbEMbRgQfOTARGSZdgwzfbXJXz0+T1AvnUB4g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:31:13.0756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b0a520-4ad7-4ce9-ad93-08dda2b3ac76
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8753

For controllers that has an internal software reset, make the reset
property optional. This is useful in systems that choose to restrict
reset control from Linux.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v3->v4: No change
v2->v3: No change
v1->v2:
  * Call devm_reset_control_get_optional_exclusive() unconditionally.
  * Add more delay based on HW recommendation.

 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d0..22ddbae9d847 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -134,6 +134,8 @@
 #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
 #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
 
+#define I2C_MASTER_RESET_CNTRL			0x0a8
+
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
@@ -184,6 +186,9 @@ enum msg_end_type {
  * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
  *		provides additional features and allows for longer messages to
  *		be transferred in one go.
+ * @has_mst_reset: The I2C controller contains MASTER_RESET_CTRL register which
+ *		provides an alternative to controller reset when configured as
+ *		I2C master
  * @quirks: I2C adapter quirks for limiting write/read transfer size and not
  *		allowing 0 length transfers.
  * @supports_bus_clear: Bus Clear support to recover from bus hang during
@@ -213,6 +218,7 @@ struct tegra_i2c_hw_feature {
 	bool has_multi_master_mode;
 	bool has_slcg_override_reg;
 	bool has_mst_fifo;
+	bool has_mst_reset;
 	const struct i2c_adapter_quirks *quirks;
 	bool supports_bus_clear;
 	bool has_apb_dma;
@@ -604,6 +610,20 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
+static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
+{
+	if (!i2c_dev->hw->has_mst_reset)
+		return -EOPNOTSUPP;
+
+	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
+	udelay(2);
+
+	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
+	udelay(2);
+
+	return 0;
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
@@ -621,8 +641,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 */
 	if (handle)
 		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
-	else
+	else if (i2c_dev->rst)
 		err = reset_control_reset(i2c_dev->rst);
+	else
+		err = tegra_i2c_master_reset(i2c_dev);
 
 	WARN_ON_ONCE(err);
 
@@ -1467,6 +1489,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1491,6 +1514,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1515,6 +1539,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1539,6 +1564,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1563,6 +1589,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1587,6 +1614,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1611,6 +1639,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = true,
+	.has_mst_reset = true,
 	.quirks = &tegra194_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1666,7 +1695,7 @@ static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
 	if (ACPI_HANDLE(i2c_dev->dev))
 		return 0;
 
-	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
+	i2c_dev->rst = devm_reset_control_get_optional_exclusive(i2c_dev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst))
 		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
 				      "failed to get reset control\n");
-- 
2.49.0


