Return-Path: <linux-i2c+bounces-15128-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB7D1A801
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 18:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7C2E3051AC2
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB0A350283;
	Tue, 13 Jan 2026 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="anxAXhYc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010038.outbound.protection.outlook.com [40.93.198.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410F51E51EE;
	Tue, 13 Jan 2026 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323616; cv=fail; b=k05qbPo6vyUO4HEOxw+L5ROPn4E2RSKb8wbCRQ0DsLqCeeOwxrS3HFR/eNECMw2OuqgSlyx8SMroHbggBO5/sVTzy/cVXTk+d213J5m3va8a430QdJBQ87+Vd0mZZFAgVjapuMoWA3Bo5QfL5I3URzfITONN2NARGiADg+Y4NXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323616; c=relaxed/simple;
	bh=Gefb5u4ND+xHQIaOGg8sK9WocwhXImHLyAi0AYUCuVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C7kSFIZCdIrEgtNcFTbw7hBCo7p0RJwGwdw0ntPS8BguEsfWwD6f5peW55tpTheg8kXMpQltF50p6/LK89MLxKrO/Luh8vfCBGpoa9EKDpiGE3jyVOnex/vz0y24S3UmZfZaFWP0MAbxybh0+Ezs+datm6ANtilJe5dPsSM5bfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=anxAXhYc; arc=fail smtp.client-ip=40.93.198.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDE5DJIJ6otPct8vLiVZ0Qinh483jr+YgLdSW7QbAiewTqBLfAINJtcKcoa11eSs5iriWp26+VBGQ6k/u8k9c4yMvQ+pQXeE7dvbll8p8g0XDaGi7uFqvH1YnvtAE7qz3qkQsHflMmjEG4YYuHo5HLJyxX2NdMXouJYDrTE7XWexRW0JbmtDsruL48Nhqz7qKtHq1Y2VJ1mdQEG9o8ge52kNamol7MF9nrkVz68RU7HQh/cQTYzE1vpTx3YvUxCtNBGOfBIApGSJWjyyhF33QfDXz96ZNrupZ2TvVjTWSAKDZMDNqlxa7K8Pgqz43kWa/9q+wwDYBD4SHtjAbRYcOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTYT6/ojseOosIBH1Asu8ri6UO68D/EWH72BQhod3RU=;
 b=tOwVer2nXgi/Z0XduXVc8BEy6rk+O2lw2wwpCUdIsjBBjFtRbmjbl6mknwk+VwjeDgDdvCM1ZJKjA6Mzcap/T2HF9lEnDLC/gCwMPRb7L0J7B5BLbggfuYTZLKEyi4hgTfGlh0r5vtAcxK37f0vpLPAg+rEGRKwyCK52p+9MNnhDmIL6WE6FUJTGAe4Mkyj9THpjpqbVhTHguqzfK3T/OKyI1sHuqwMeWIKD3XsWYwJ+yt+hYoofXa2y69aCicjxcTNbi+5yKo7v1Lfp8OfUOB91YVnIG/P9yjMnAJxr+xVh280Jl0wbWq40LTFToNunVpDHM2pP32sjVtwcAcPzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTYT6/ojseOosIBH1Asu8ri6UO68D/EWH72BQhod3RU=;
 b=anxAXhYcvONBPw5y4KqKBk2UvjVi5ZWV3vAM6dGJRrTeCVWTrs1wdj3ss4rkNyqo8wxIm9NkGX7uye+pcWeDVxpejUsS+1nHufdgMiqfjINc6ALigRg7QBaGf6ODaqWRHGFFA6ba4TUuoYJm10Aqtipt/KLEU6NFMCHYL4jVE28XY+LcAe3oHZrzmCwbg/fo1lFKDvfVaoN3YjUBLHQut9f1T2kkr3NSfeZbuBnGJHRwvxH6TsBNhbkmHMdxNVrJCipJ0itoZIU0Q3g/JPT/Nl9krbIKv9m1Z0GVbmcZK4i9JvZWI+ey6XHmd6DJM6jHYMDRX6fOlr7MFyYOfeV2Tg==
Received: from BY5PR17CA0062.namprd17.prod.outlook.com (2603:10b6:a03:167::39)
 by MN6PR12MB8543.namprd12.prod.outlook.com (2603:10b6:208:47b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 17:00:09 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:167:cafe::de) by BY5PR17CA0062.outlook.office365.com
 (2603:10b6:a03:167::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 17:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 17:00:08 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:59:40 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:59:39 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 08:59:36 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v7 1/4] i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
Date: Tue, 13 Jan 2026 22:29:26 +0530
Message-ID: <20260113165929.43888-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113165929.43888-1-kkartik@nvidia.com>
References: <20260113165929.43888-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|MN6PR12MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 162d09ef-11de-4b2c-5fc2-08de52c53527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bmtrjY1lYLNMIyGs3GXSWtHX0c7kL9HcnxbYmyO5gj/VmKL78SOy/+cx7g11?=
 =?us-ascii?Q?xaoBfD33sks2h18O8N591I+GL+tRmcSiNz9JPjsb2+DzlPIPH0NI5UPdPYiK?=
 =?us-ascii?Q?uT41f3dt/gv2rR3prB2/kS+CeasL+8020JSkNOUqTqH7IlJzpojUYlTGo8ek?=
 =?us-ascii?Q?/BQygwEFixisDjkUZC7Bx+hrYqUQ4XR2q/PWjU7hMKR2kjP1vg9b0ni3tXHC?=
 =?us-ascii?Q?bRDCDBhvRtWf1Z/dCIJ8uxgjXIYDSV7ReH0quidQUGXQ7geIXXG50MBGpHi7?=
 =?us-ascii?Q?kbVlLIntGgoxbGtxx8Trp7sqgDjGRW7AxgCWO11GxSIR5Xy7xMuZ5BDRRFv+?=
 =?us-ascii?Q?Y1pOYZRZ7NSV3gefp0HMK2GBbKQLgkwwHwjCVfhsT82P0COdsr6pqIE7d2OE?=
 =?us-ascii?Q?oU303lANl7x1/sq600VfaRiZs6H7zGIIZOs9UfRCRF1l7EBVal12BYASVqid?=
 =?us-ascii?Q?Adsozqas1huUUGO6x2UEmGGIfQRy19ynI3oGAR6Vh5uK/0esSqkCq52Lc8h2?=
 =?us-ascii?Q?lcOK+WSmq9DuM+u0Yw6VFhL4wDZiNNVT0SBuF6p0Q5hqxMPz2g8DAkO824Sa?=
 =?us-ascii?Q?+WWdF8Y6bLg0vmkoQPbGOYIIbEhi1krQEzecFLBKSxETgKrTxOaMXlTF0rb1?=
 =?us-ascii?Q?/CCMccaaGjJmJsYrgwYvsZhgwJccPiSuVk28xBhl7E1tI8eQpSDFY4JXZbYi?=
 =?us-ascii?Q?XwwY87lFaIY482HCd0J7vfUcx+qdXlR2zsg0/AgB4fg+l5N23np5AaLZUq/7?=
 =?us-ascii?Q?DCVvx3J3JU3IsPnK5zJKRNzDYJVqFuo8e+laT9Dp5DKakXu5ZtIZz6twSSYs?=
 =?us-ascii?Q?l2BGEyQm8T2vsxVUMe6+9fgS70fjYjFCh8kSZMSCK+n8PnSp5QPw6hAxCWA5?=
 =?us-ascii?Q?b5Cc6s3iOy0sGmKA5lAWQVeHg55XhpB8osvi1zin58ahhRaVM/iYqDRUs/10?=
 =?us-ascii?Q?pO6DeB5Up3mvi8mVt6inU1x4XQsdlpp9gZn5KOxNbMdNxG8r4xoVK4w0PQ3Y?=
 =?us-ascii?Q?/daFHxDT9r381YpBI+Wsyc1Xlnbrl+82pYkJVUKGXDSFX4G/KVDI3jWJ+qdE?=
 =?us-ascii?Q?8fxx1EZNWQoDuYUj86O1Agbbp2LzWTYY9X2b8tHxdvrScaFRRPqWdC86asWB?=
 =?us-ascii?Q?3OvuhQQtxwr10nGMY3SGt8VDdu9EIkZPscslTNCUGchMzV9IL1dj0vAp11FS?=
 =?us-ascii?Q?ayu/pdBx2IEMbs+sVft/tmbgAJppDrrwu9BM7hXaqe+NKPobkEmwlVfMQpFY?=
 =?us-ascii?Q?JrNaYL7e2iRPedG4KA6fGMx8tKS60INKFRy387tI2V2XZYZub5GM10cOnymW?=
 =?us-ascii?Q?H376bO7mMeAZaT/D331qvvWGbYBTFa6MitQ1M359W2w7MsH+KNEj3SDGP3nV?=
 =?us-ascii?Q?81ZkSZdEJGgb+GhVvFhjxw7ByfvU71xMWylqR0Wj9jXuEBOj8EE0cM8/uZ5x?=
 =?us-ascii?Q?Kph0XZa82+K5MFwnq9Zaz4l804wLtokcaRoiETeFpR6maUCOk8CZxd0slHES?=
 =?us-ascii?Q?Eks1EYSRomWKA0gLNDjJh1lTzk7DkEQoJrxTqfTdYwujqWcmgXgcJl3GD6Hh?=
 =?us-ascii?Q?n/m7Y15tphUfFJF2LF5ENb6kRq+UA47YtAiPsOwn?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:00:08.5493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 162d09ef-11de-4b2c-5fc2-08de52c53527
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8543

Replace the per-instance boolean flags with an enum tegra_i2c_variant
since DVC and VI are mutually exclusive. Update IS_DVC/IS_VI and variant
initialization accordingly.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d05015ef425d..9a09079dcc9c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -171,6 +171,18 @@ enum msg_end_type {
 	MSG_END_CONTINUE,
 };
 
+/*
+ * tegra_i2c_variant: Identifies the variant of I2C controller.
+ * @TEGRA_I2C_VARIANT_DEFAULT: Identifies the default I2C controller.
+ * @TEGRA_I2C_VARIANT_DVC: Identifies the DVC I2C controller, has a different register layout.
+ * @TEGRA_I2C_VARIANT_VI: Identifies the VI I2C controller, has a different register layout.
+ */
+enum tegra_i2c_variant {
+	TEGRA_I2C_VARIANT_DEFAULT,
+	TEGRA_I2C_VARIANT_DVC,
+	TEGRA_I2C_VARIANT_VI,
+};
+
 /**
  * struct tegra_i2c_hw_feature : per hardware generation features
  * @has_continue_xfer_support: continue-transfer supported
@@ -269,8 +281,7 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @is_dvc: identifies the DVC I2C controller, has a different register layout
- * @is_vi: identifies the VI I2C controller, has a different register layout
+ * @variant: This represents the I2C controller variant.
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -323,12 +334,13 @@ struct tegra_i2c_dev {
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
-	bool is_dvc;
-	bool is_vi;
+	enum tegra_i2c_variant variant;
 };
 
-#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && (dev)->is_dvc)
-#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && (dev)->is_vi)
+#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
+		     (dev)->variant == TEGRA_I2C_VARIANT_DVC)
+#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
+		     (dev)->variant == TEGRA_I2C_VARIANT_VI)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -1915,13 +1927,15 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
 
+	i2c_dev->variant = TEGRA_I2C_VARIANT_DEFAULT;
+
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
 	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->is_dvc = true;
+		i2c_dev->variant = TEGRA_I2C_VARIANT_DVC;
 
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
 	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->is_vi = true;
+		i2c_dev->variant = TEGRA_I2C_VARIANT_VI;
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.43.0


