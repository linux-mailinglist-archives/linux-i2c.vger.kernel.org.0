Return-Path: <linux-i2c+bounces-14974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89654CFE48C
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 15:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94E7C30146F3
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 14:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC2C34CFB4;
	Wed,  7 Jan 2026 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="umkzmGuq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E235434C9B5;
	Wed,  7 Jan 2026 14:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796044; cv=fail; b=oZLDo3+cTlsw1mo4rbKu5K67hF8ZxOB/TD4T/Kdl2H3PHfKfXrdlB+QE9kk/ntwcXbn7YcnroLkStsnZpoc0lz16o2btU31uxqpr6MJQZlz9QYzVIHYRKdUVPf0f6bs2tKo0eQr8HF+oUYxdtQlWf0OeCPEWYSmv9Asl85b8vT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796044; c=relaxed/simple;
	bh=Gefb5u4ND+xHQIaOGg8sK9WocwhXImHLyAi0AYUCuVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fA+MQ+Xv9Hhvoza66+rNrvGksgOl1phBSb9K0TLO7XjEvkNjZOYrdH5oFL5p6JmzIZzuXmxYmZROhYqTw+Ea3a9eJ56Ycp293ZeOXEfdTI/yFkwj3u2rvhTkCPVjv/6PifaAKrNRhfT63wJPEyIK10clFWxPsnrgerK7Uwctauk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=umkzmGuq; arc=fail smtp.client-ip=40.107.200.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3650cp4XSkGOd2hEKnBO59o+CY4H9wG0BAXPa+HKdE25cJoQhoZW7hqCXIMopukNPo+XrVfxOdZ+5XAfcvAhI/05y+RTk85VuhqNIkMBioOxn68jZoXIvt7loISSotgIkgek7N8xyzkHUcxeCc/njJmcumPPrbYxpRh3FKEfibJ/Tjzg5zqLTSiQ/mEm0Enatm6ZqnHlszSyTMBCBKmN/68NCmF5n1hDEIOcODwFXyRyhnUagsRd7mWrnFf3u7ldbSh8ap6GgLZQ5jabN/GuyXE5xs4A1v5+kY+Wz7Y1DoTj0O+ZpLGCwZ5RGSOTOGQpMFYzsRjmj6gQj3t4Z1BZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTYT6/ojseOosIBH1Asu8ri6UO68D/EWH72BQhod3RU=;
 b=j3J9cHckqpIlEB7P1gyZgXcfAdsVCpmjnKJ8TBu604HFczF/qsh3mPKwURm9dmAABI4S4xv6viQ6CPCFt3+EyVZwDYrmfB7OqpBxN9o38T1jYonIMJb0dNWrGf2IHin4ypA7UZT47DaQJmc7Anv8mqgjRAAFl0/4kselUCnP6o3qjp5QKYBz7Q7gK8saV6G46QAuhfYwJepRCvOJJFNzjkgsbjDrANDxwBNpc3cN2ymsNw2SOoBxwUVRTSVV/KKSKDxtWQbUXgJcZq1a9R6OZSKzV0faGq8zGvVUCzEK6e4bLKW4sm/Wi+l4OHQirWCFxp1gFE4O1dSGG/ZDGJJO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTYT6/ojseOosIBH1Asu8ri6UO68D/EWH72BQhod3RU=;
 b=umkzmGuqe/KOjqdWgmX52a6fiBWSJrfDon5t3xSmwqq77uYoDOQ33v+nZkbICDfU2iA/vmQBV4Hr+2oIbEV4vTnRyVAdWt/e6XvA42uGtWqn/imTaiLq5/YIsFJWXuJp9HS37YPpj02ohupg/t+HU+3Ct5X8wm5VEPtNBRaK2bCnwKR9qfuztuIpwZCbahVc7f3cdoP8jgsyg0FtyIu4zY/UlDTEJ+Pern+h8XHFK5o2hrBqIZq2+z1fbA3XqCcj4PhY1JuLTyQMB74dmr399pXlBKweum0bZ6RJVblmChsQML42bVMbgdwztvU4Gi/ks7qY9nVwx7p1KiwekQ4fMw==
Received: from CY5P221CA0108.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::39) by
 IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:27:16 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:930:9:cafe::f4) by CY5P221CA0108.outlook.office365.com
 (2603:10b6:930:9::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 14:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 14:27:15 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:26:59 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 7 Jan 2026 06:26:59 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 06:26:56 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v5 1/4] i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
Date: Wed, 7 Jan 2026 19:56:46 +0530
Message-ID: <20260107142649.14917-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107142649.14917-1-kkartik@nvidia.com>
References: <20260107142649.14917-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|IA1PR12MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdb633f-ff00-4974-53df-08de4df8db53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?84x7fcYkyxahzxNlz4+7hH4UgfJ5oJ0cxNwZAEunO2tLVafhciczl3UXobaX?=
 =?us-ascii?Q?NVprTtpbIcOxl9h6XKHG7/zc/aSV918i/gX7pZjXYIWhU6W/IUp02IeeGs2r?=
 =?us-ascii?Q?N3Bf3YQrAqiA4XmdzOBe3/nMqf3w93pHx4DVEM0LMnL+os7FK18NjzbRRdOe?=
 =?us-ascii?Q?divz2Lo/GaJBV6Z1S7bTxYgkZDdU9i1qj/vIkIF0+i2+P/IeTb39BhuPSA4i?=
 =?us-ascii?Q?5ufrDPhDGviOfbGe+HbAwH07Khh2cckMDGtFg1Oq3Yvf2dIt+Lsps51OsCFU?=
 =?us-ascii?Q?DLHSptDjAT8MMCQMuLXYkq00VinNnqODyCCJCw19M458j++pfgevGwQ6Rx7j?=
 =?us-ascii?Q?zV3JYBLi71SQEJNZ/utVlpRkWRYH7xr3wMYAVxlXJAJx4FyMy6mk8HJxYiXK?=
 =?us-ascii?Q?XMyAVo9feapUMqrMc6MO0GBw+uaYIfNyJnjQGsWWoTpmVKd3AoqdKjexwWYx?=
 =?us-ascii?Q?T1xLaGSwQluzxPs0rq5zoFan8i8fykiRtSTTpwAsRcIc+xn2bxMNX/X2tUyq?=
 =?us-ascii?Q?KUEhUYhoqd58BmmZ/nY5bVHCv4MtMyHLW+CjzFTug2lkoyHtbFu632DeA7U1?=
 =?us-ascii?Q?W9poViPKp+IQDIo4relXYsw1jIJdynK6QDNo926mzugvu8WPLxkDUYQ3C/J8?=
 =?us-ascii?Q?+tgV1fDfFhSqOD5jyb0LeobPsXg41W9DvmiYmkCjKVS2U/4T3sbSjiOKYvuN?=
 =?us-ascii?Q?LrkTBb1ALU1xEMeb28tLUKlG2NzWKB1c3QkYQvFFImY5TIuipTfy5vIvpCYb?=
 =?us-ascii?Q?KbtSfiZPjBw0oCTU7SDMZRke8dadpUSvcoqucIzq1DSLze9wh1yJZuAZh1nz?=
 =?us-ascii?Q?3zONWT00T+11hIAqGkNMygpAVy+5lE031TtqQXO64pkIqmb0KFK3c1KNxplz?=
 =?us-ascii?Q?A2kZXpgi8JIXO+6UegbAPJpUnTz+Vq3zFFHOnqhUjSht2nYpJPfh4n+VbrGE?=
 =?us-ascii?Q?MUEK5s9edRd177d/B0R29ot3qDfsqpJv/jFOAY9Wxcs4BdJNkXbUeG5kfLuT?=
 =?us-ascii?Q?gB1+4Zt7Ow6Ph9MbGnwHoj+pA9Y/rwhLJe6sCY6Oy+PIUEcdTJTlEwYd70he?=
 =?us-ascii?Q?WjMznDJTZ1kXP9l88v4YSptP5VD2G15nTA+q5Y23LijtDMio4CDSDE2Cu6hi?=
 =?us-ascii?Q?bD0OAcxPTbiDt86z7/nnZMKBHvR5bdQyet1bm9SibTTs5Hd6KhT6xISn3+wo?=
 =?us-ascii?Q?gUlUhHlDpTc1vURJ3ACOl+2Y9Lp00tDeFs7fBtUgda53x/bdbkmE2p9in+SZ?=
 =?us-ascii?Q?tN7ezaTa8ca/FuN18vvdn8T2GBQdGcL06sArqYgyonZFbACsrfziflocifVC?=
 =?us-ascii?Q?jBFw/UYYJe78t66yJtRWBnwLCaKeYxjgQ+IH6CCjEcKE2zx7dBhhWMXWcgyB?=
 =?us-ascii?Q?KdylGaojChPkn4tP7k/OHI15ppB4VBiRVJPF4dUxaT/Xs7Mu6WmnFi9yjYDB?=
 =?us-ascii?Q?0rmHZkna/+a1SqT2kmKQQkFkPr1d3HoOKPm/ctiAj6AbPpumCFX5MgpAKSJy?=
 =?us-ascii?Q?1O27pxtG6zCVBL3rzcwREXIXwqWGpinFg9bnGjpRtsAN+2DY7xwDLqNM4si/?=
 =?us-ascii?Q?kBOdX5UnsLxcm6ss0L/7vBQ28rrZb653qFGzf+yx?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:27:15.9162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdb633f-ff00-4974-53df-08de4df8db53
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6210

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


