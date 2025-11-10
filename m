Return-Path: <linux-i2c+bounces-14024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B719FC454DE
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 09:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53CD2188F7DE
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 08:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5A42F7AA6;
	Mon, 10 Nov 2025 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D6kam6j4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963402F6937;
	Mon, 10 Nov 2025 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762761934; cv=fail; b=MY4d/P6FMXH6URqMEUsvHmEsYBeCrIEHHavTr5F8WzqV+93GlDik8uXcVKXF8d3lBK77tKxRDNteFhBeeiNnXBMqB4CekJDgT9UL72c3JnEpSSa0mVgfQTwyr/lBAhGDOSVzhCjiMZs3GX2VsJNOcGwKuIaF/1LdhqeefziA/O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762761934; c=relaxed/simple;
	bh=qYOTM4ayYDYAbotjZoWm+TSSssSBo27DADduNeMtNGE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FU9YT7ACaLfSgMpN7KAc06DswngZVkHltx4Qt6B9oRApC/YXTG2uxbSnXJIUlYXRMi0otCdLR9dea0LO0SrLVRuPQSu6+W8O41arZ6rb9rfwGAAI0zoL71WXH0Ex9yDWqBL6hi3xkb80j4+klk8H/jqqVka1O4N9IVYObO8lkn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D6kam6j4; arc=fail smtp.client-ip=52.101.62.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdyjKPEs2gFp1PVm0hD2mDaHT7GBedld4YI1PiHVSYAIK4H1KYE/94rQcEIrCC+8lklKPtdZAVgebFM/MkJBFe1/kafgIZkfiQmOCm8XFSB/8fIbejzX+AgfFL2gMkHwHtCHJGCeJBPwQlvckb/vW17+Wwlg+6sVYvvhC4q1jvitGiwSzFueWu1tp5LlZCbWS/FR8wqOa5dVyK4YgXmkRYdkUepi5S5mF36HDPpuqiSO+S0kxCtWbIhX38MaEn6HbRcIL1N/jHUVHgRCOwGHfTgOp3LUUUkoiKmQrdYgrwOza1uRs/IVza1kGTB5RcNtuktSf/lTv2VHEGQD8NcvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s31VzoUjmtA4xZqMnpcshxOy3IOw3lgbSHUgF84cghI=;
 b=xXoUeH2T8sjqpocJazvok89uGKSOzmwzS1TU7U6zZYPel64p22QLRR7ZJch2cuT7SZAO/tClKDuOYItS1VUn9Rw27vBRI4sDAhm6ZfBOJEAoM8aQmlM/ViYAnEOhPM7Dcc2x51goctI8YxBPYR+h6XdS4UYtIM3W49+AnjpBzUA2F/qFuj8Cq4hCBMfjmhRHRkA9jho5FxNkQ9p9KAjGbid5yVColiq6XigVGwEabvcHa101IqhGRlDQAzMIYqESEQ7bpHCXa8/FfKrAIr5H+RQ1UzYR+Zei2cVdidB741LeLP6RsBdZzTjxsnfvKl2a/NIH7YaTzCtaM7F4Gp5zog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s31VzoUjmtA4xZqMnpcshxOy3IOw3lgbSHUgF84cghI=;
 b=D6kam6j4C8h0+I3OulRX+u5wO4hSf6bt1dY179jaAG5h0mgZMdz4uZzzRTmLzX/Z878xc3E/2TV7By1aK76UIu2bAaYFbd59lEwlklIhBgFqbicl2pTMpxQOxcUUMVp19Cpgsw3n6RQK7HsTLIaw7JMGRo7oFx2tQTqguP0XuJsK9FPO3yiv1w8VDFaR/d2SY/wgc7pwcpnXlsK0MrVqxtTp/EdVfAAyk3lsSmG7dNo30WmSv6gCR3582lmAW0NQ5e0pJOGnNEU4+6glZpx68+PXDz+OvxqktF7ZAhXJ/d5WjOtB3zcriT5aSeq86eJGN1A7upKGYW1hHtgM7X3T8Q==
Received: from SJ0PR13CA0151.namprd13.prod.outlook.com (2603:10b6:a03:2c7::6)
 by DS5PPFF8845FFFB.namprd12.prod.outlook.com (2603:10b6:f:fc00::66a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 08:05:29 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::a0) by SJ0PR13CA0151.outlook.office365.com
 (2603:10b6:a03:2c7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.14 via Frontend Transport; Mon,
 10 Nov 2025 08:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 08:05:28 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 00:05:15 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 00:05:15 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 10 Nov 2025 00:05:10 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v10 1/4] i2c: tegra: Do not configure DMA if not supported
Date: Mon, 10 Nov 2025 13:34:59 +0530
Message-ID: <20251110080502.865953-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110080502.865953-1-kkartik@nvidia.com>
References: <20251110080502.865953-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|DS5PPFF8845FFFB:EE_
X-MS-Office365-Filtering-Correlation-Id: 5894d966-a239-4590-838b-08de202fe9ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wT5Bsv5lTe/pjujyLvACxgegLJkd0Y1V68dcI/KjuSKZXzDv3deKH/yGP1KH?=
 =?us-ascii?Q?1vkflJbuwk8pvkaT761zhvZO8m/dRywl/lwi5WpTs25LnEDALaYkOa9ITCw6?=
 =?us-ascii?Q?ImJPLWqOH4VyaICLPOFVB6IIoO/oTwYbwnUvlJzzZyMMWzc1GiYSpcYjyyHM?=
 =?us-ascii?Q?VzmxMNqZnF/fAe1uxAqeThL8RMSLVAHMbN86GfWYbaQvGs91bWSFm61K6S0X?=
 =?us-ascii?Q?RUx/3ECNoHqOvumHM39Po0URe73yr65+JNMDIgUmK/1+bCYcaH4nAT2uQNyO?=
 =?us-ascii?Q?auQwFc/4IUFUEXzhObcJ+WK8zBUVzjDkg3ObFh4yxcJvQk8+KXQXz7w5zB7N?=
 =?us-ascii?Q?3KZPm+rdycAm1oK1g7zhZe9FqSyVmbRZiSpnkVAZwT9wrBKRh7o0/LXXk2B2?=
 =?us-ascii?Q?tBPzkPHpg9Xt+PIgJTV70qZAuHQTjPNRPnCwtMgCDH5dQQK5ch8BYwu87gws?=
 =?us-ascii?Q?HbJNHhVCTtj4cHToeC5/KRIDyzlaYortOXEzab7LHrhXnFQQCdYJ5hsB6Wau?=
 =?us-ascii?Q?udTnxoSoxSmDPZguBFNcPI5qXrIcficlFHNKGuEuspKQcnDqeDSPBil7iMWk?=
 =?us-ascii?Q?0nTr2MBYzVUPD4Bdt1AA+uRsK4VUW0Kr2L+MTxavDfhEwaMhFMiKwwrtbZVx?=
 =?us-ascii?Q?wjr5Jbp1DK4mfo+YiVb5gEG7kifvLdqYWB2jY/D2QtONC0wIc9vPS7jCa0pp?=
 =?us-ascii?Q?5AhKhTAKThkuHK1MIHbnjSzEe3g+mv7v0s5vtkLWuEhC5qQyIQXTk5eIoeFA?=
 =?us-ascii?Q?MY+dl7s3FI96JWKyB9zg4bKpbU5VB92u3Zqgps5LZRldVsCRfzowGGuG7owi?=
 =?us-ascii?Q?Cj0Jl4Pfaf/8RfmQcpt4tONR9a2bXF580ZzdvaxKGEVAfscUX/+lWKI3Ut03?=
 =?us-ascii?Q?h54LlKz7K4FnoSPp7PTnTs9BpUA1Vr7tNSHamSERuTp9O88HjG9tTgcdLDU9?=
 =?us-ascii?Q?zj5l5fqyHsen8uEMLYBDH+i/1YhqQoYhsRiI3PzoZ8Stf0S6Pdy3lnRM/X2D?=
 =?us-ascii?Q?RjgJzRP3i7QsPnyBigL+hWoZpzOasGDdYJ8jNqsmYhl+AOsAXhORHjGMbtwe?=
 =?us-ascii?Q?s4jvVfF66NQqCalDtKRKgLBthCe7CWCtfFXjVvvvZIIV7OV649HvKDFEVQyo?=
 =?us-ascii?Q?yGFLa9a9500TUKjEyX2lh+VDZvBBdkNlfOOzYCOD+iJp7em3lWjGhuJlHpdF?=
 =?us-ascii?Q?p5YP/0Xu94c60Rf9G/0Q+ZZixHY5tJn1ZIVZ7qFNVcA4DEpdf5y0oCmc2Np1?=
 =?us-ascii?Q?e8YNfU8EsiNfjrRZVgHRnBqiMDfIo3xPz7ERIoKDjI/0TlnT1xZfQ5771VJs?=
 =?us-ascii?Q?sJ7/HfrrHfQN0uQ1Clsu+MEY1hV6C4qkXEHqHFa+LV4F2lOIq9P5449lZwCj?=
 =?us-ascii?Q?K+8rUWJoCzSq8ESZ2NRri+Gfp6PHsnSiB0XnB9EzZZ5rvZDlpultBib9lJg6?=
 =?us-ascii?Q?Yb4iKnALwxClDYX6hOtt92EayDeSBL8RNvJyQam7c+YI3NhTVm5IbzWzvjxP?=
 =?us-ascii?Q?SUgp1t7bCdmndVmiXJ1UkYWdVMGuDlKrOueZMqnWW61BTlwgZoV8Saq19pEY?=
 =?us-ascii?Q?KqCvkS3A9OtQjHMZbx6YgzacqpI/7rRKT5N1U52D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 08:05:28.8808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5894d966-a239-4590-838b-08de202fe9ab
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFF8845FFFB

On Tegra264, not all I2C controllers have the necessary interface to
GPC DMA, this causes failures when function tegra_i2c_init_dma()
is called.

Ensure that "dmas" device-tree property is present before initializing
DMA in function tegra_i2c_init_dma().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
v4 -> v9:
	* Moved the condition down to have all dma checks together.
v2 -> v4:
        * Add debug print if DMA is not supported by the I2C controller.
v1 -> v2:
        * Update commit message to clarify that some I2C controllers may
          not have the necessary interface to GPC DMA.
---
 drivers/i2c/busses/i2c-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e533460bccc3..bd26b232ffb3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -449,6 +449,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		return 0;
 
+	if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
+		dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
+		return 0;
+	}
+
 	if (i2c_dev->hw->has_apb_dma) {
 		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
 			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
-- 
2.43.0


