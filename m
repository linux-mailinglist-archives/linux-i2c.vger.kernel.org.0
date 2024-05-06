Return-Path: <linux-i2c+bounces-3447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE78BD7E2
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87E021F2266C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BC115E802;
	Mon,  6 May 2024 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a6VAAP3M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB3215E209;
	Mon,  6 May 2024 22:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715035991; cv=fail; b=DzVKYeI5A8vGUVpcooCrx+zA1YBhrAUqPxlQx4yL3MxkNS2rFn85jlXrDB0dKJUwOOkUm6ZBMvpI6JRleDCZAoyjQ21OOBjkTP/lYJd9NJqEUtxRy8rlQXQ4CL0Ezlxtvx7xlbjgM2wUsZYFto3q392FJ2/Ptxp1RePfy6NXkIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715035991; c=relaxed/simple;
	bh=FbGlXhJjDNJUhD1IsvjFyvU8cXfKPSOSGrbtzM5JRAA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QI5YHlP7vw7F8+DxmyXPKEJZ10AnK/yyHWTqdZvbm0dQwogaIRgruaZQ4B3ryo/pjndVJ4jao5gHBFRHhL1IhXwLI3NRwo8yggSAekq9I59BMv5n/lJrt80C8QM0HFx753huOg/6s71F6Y1XaCtAp7Av5zsV5nDjZcPcidHyuLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a6VAAP3M; arc=fail smtp.client-ip=40.107.212.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FckNgg8IvDYwuETkKub+pCkuoe/3T83XBGKg9V/aA0S956ojPDJQ/5UG/cCTFK61oMdI/6voo9QxL123/lnnWUtO0ZYNgRIfRzktPV2jveEpwfmviZ/sPzl2g9vEp/ho8S92eYj7F0oXhHg7SCBZNBNlDQRcR54yeGEBZ+6DgnXe1TKGNFUUK+w55I5ZLI24ALeDgWdixWMYFjOPqr3na6wY/BHCtzjotN6CSUQLlHT14zeYLnHz7PF347BXeSAEd25SA2tztEZH07QFuYMHpBSjtFSPdgTItD4FBio6tXKX9WPdMncv9It6i440xOXLUiTOM9JNgfVNpAWbEjD7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+bFvYH+NXPBYXsdnKjMmmU8m87SEXjDrEUcztxlrw4=;
 b=nVrgYAfUDliv3HPeNIVPaYzmFQLXWEdLcIWFUtd9NA4JY7tCVzCQhEKlskkwr2sGAWdqWUIsTvaxr/bY2z+5S05Npl4jfRf3KCgiCZxNikNflHkfCWCOdjAgQyiN3KeH5Nc3CZdhg/7VjAqzxKQvTgMysiHhlCeWUQIF2J5vOkENQx5A1ZnPLWCWVIs0pyK0aDOczXUtkgirkcHV/l1il3tPW49p5/LYwWYGiqjMyt1Fnp/PXCqTPF6CDOvlwX55UfCs8nQVEWZcZRJCYT3OcPGCBFaVtMfCT4zP7GLsl2NPoORcR2ggENnaMd+OqW6ZeUmyksC4Y0kx2CHqWFK8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+bFvYH+NXPBYXsdnKjMmmU8m87SEXjDrEUcztxlrw4=;
 b=a6VAAP3MnVTgLSL6HUs0+UYl7RdCUAbEmkbAlVYz1gaseMoL8oczs0qxGHd2O/ToekXWusiLAlHTdGRJzPd7EarGPFnzT/UAYcvJShNSetWB3UijHMz/3P1w5l43s4HSnlHqa7RaaOCqxS5tzUO8qVE4ucgzWSFg8IQMFXF7TOQEtNje3MrsJj8MsaWwDvO5jH+vsW9vtWfGz3YJt2wQNL/itC8GybDsq6A9EDUtODUgAj7Ku3bKeXNkqPWVFse0XbKqjDNd+x7tDEGazaVk+Z2joDfyYUkTQqwHslyR5k8dg6/5ZakPCsJK9uppkK4WF4V9j7YsYi3bMz2gn2U4Wg==
Received: from CH0PR04CA0097.namprd04.prod.outlook.com (2603:10b6:610:75::12)
 by CY8PR12MB7586.namprd12.prod.outlook.com (2603:10b6:930:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 22:53:05 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::e) by CH0PR04CA0097.outlook.office365.com
 (2603:10b6:610:75::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 22:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:53:05 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:52:48 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:52:48 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:52:42 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>,
	"Akhil R" <akhilrajeev@nvidia.com>
Subject: [RFC PATCH 07/11] i2c: tegra: config settings for interface timings
Date: Tue, 7 May 2024 04:21:35 +0530
Message-ID: <20240506225139.57647-8-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506225139.57647-1-kyarlagadda@nvidia.com>
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|CY8PR12MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4049cd-2c91-4fc6-4d08-08dc6e1f4a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|7416005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UScEXKSYdXPok7XjM+bNsbmLoiGARkgZmEmhXgrmAfv5ZX1bL6WYVTjUzNoO?=
 =?us-ascii?Q?HSS4QiSfDNbQELbKCyptRLWAWZ9ca8TESmCeOln/YKhh6cyeINkUu8NQt/Pm?=
 =?us-ascii?Q?HLikTF/36ZVf6Z4HCt4h+Kxxio4vG+S9iBg3aYAM4OilnUKf0Z9dFOzkQ5a+?=
 =?us-ascii?Q?Yj9goaOctHrmWJBb2WTZMbHlFPha5ZjC6d/+ZAQRisGczxcNotqq3TJz4EDv?=
 =?us-ascii?Q?IZcGTN2LcdmSXCTT5DKfUtg3FOyvKSh4VvnT9iQu4RS+GS0Z4Eo/8EbLzPtu?=
 =?us-ascii?Q?paOC56M0Kx80S8WQdNpgesJW09Q6nqFys5p4TPgdD3lMybNUn4LMDHQYWFPQ?=
 =?us-ascii?Q?lg29UwE2UnuaIyvoJNvvvYkwfdn7RkM9kZKXOt3n92rUcutGQMWELcG5zHpc?=
 =?us-ascii?Q?TR5JiN50zHlLRQVy3oxi9qKKNsGVsfuN0CdRf1TMnuaemnGvC2ImH0gvE3Av?=
 =?us-ascii?Q?4lklVy4Y5/w40VA9KrUzPSKYR6S8Ibe9IhY952PLljyMTX3m/iEQ1vMb2HAk?=
 =?us-ascii?Q?JZEEM0GHPyrfO2XJl9H1dSrquIGxPsTOg0QlvqcjQekE261Aoqx0aszJkR2f?=
 =?us-ascii?Q?qDIggjaCn19k0s/VRt8M2/L0RDJP4PbKItO17vwerHWw4uviaawYgKLjHpHA?=
 =?us-ascii?Q?CdckGnIolcbMFBFoHC1Tq4edIKEoM8d5zb821/4795U1cPKos0bnjimY5er3?=
 =?us-ascii?Q?AALP8C9T5wGFmCZfWb+P41jBwGEfpYf0cfaSEfCB+8iR8VRjF5d+U7Hc8O4L?=
 =?us-ascii?Q?EnPPnSXXrxs3syRtOiuVAPRfzu1Fn5KzdqWn1GN6bBeM7eDdC5p8yTRzCsbU?=
 =?us-ascii?Q?5paGr0ccNGKlWxCAuSoov1n0mpXYwF1cVl5wkSIiEIPIAGXU2JBSvm99bXhz?=
 =?us-ascii?Q?u70c8N7up+CgO9YrEe8r6zFEyHEtRkWKrp5kXR2W2TGy9DYNV+/CR8Hfe26L?=
 =?us-ascii?Q?wvBMbO5dZkeuMCwBb5tM7vSudQ8iiQm9p2iBanPfrTt5tkICuXziB8OZGzxj?=
 =?us-ascii?Q?xNPQVW21WXS6o6BZjYhWhvpT1kG5lpsukvTwtluuHCv99Qnvt6ejuQVFZUPs?=
 =?us-ascii?Q?vE3VHZq8ZYkdwvAasx9T3ifMGI1Y/1ce4fNbtAJumyhqjc+XrkwgPX0/B0Qb?=
 =?us-ascii?Q?JI2ggvEgEt5RWEMwLO3oHejlZu52v+tUxvuBfpDzHFD/EOobyhgY7uFdWplS?=
 =?us-ascii?Q?YzHxLpeNX1+uLFqkXFWuhVQKCreyBzb5jlR/RSCqgrzuCc9rd2nkWKwRFO5Q?=
 =?us-ascii?Q?pFZ3oTwpFy1oGisCTkT4mB0dmnESK8aJ6tWjQgEVMEgcnTK4RcJdUmLGzoYq?=
 =?us-ascii?Q?gacRL4HUVFvVjYGqKv44tCaTqJdkjgfuncDaOWBKyxL3Vt4UJlgDfhysXM1V?=
 =?us-ascii?Q?BBzY8Jc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(376005)(7416005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:53:05.1350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4049cd-2c91-4fc6-4d08-08dc6e1f4a7e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7586

Use config settings framework to initialize Tegra I2C interface
timing registers and clock divisor based on I2C speed modes.

Each speed mode uses predefined configuration for interface timing
and clock registers.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 134 +++++++++++++++++++++++++++++++--
 1 file changed, 129 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b3dc2603db35..263fd64e440f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -28,6 +28,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/tegra-cfg.h>
+
 #define BYTES_PER_FIFO_WORD 4
 
 #define I2C_CNFG				0x000
@@ -108,8 +110,9 @@
 #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
 
 #define I2C_INTERFACE_TIMING_0			0x094
-#define  I2C_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
-#define  I2C_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
+#define  I2C_INTERFACE_TIMING_THIGH		GENMASK(15, 8)
+#define  I2C_INTERFACE_TIMING_TLOW		GENMASK(7, 0)
+
 #define I2C_INTERFACE_TIMING_1			0x098
 #define  I2C_INTERFACE_TIMING_TBUF		GENMASK(29, 24)
 #define  I2C_INTERFACE_TIMING_TSU_STO		GENMASK(21, 16)
@@ -117,8 +120,9 @@
 #define  I2C_INTERFACE_TIMING_TSU_STA		GENMASK(5, 0)
 
 #define I2C_HS_INTERFACE_TIMING_0		0x09c
-#define  I2C_HS_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
-#define  I2C_HS_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
+#define  I2C_HS_INTERFACE_TIMING_THIGH		GENMASK(15, 8)
+#define  I2C_HS_INTERFACE_TIMING_TLOW		GENMASK(7, 0)
+
 #define I2C_HS_INTERFACE_TIMING_1		0x0a0
 #define  I2C_HS_INTERFACE_TIMING_TSU_STO	GENMASK(21, 16)
 #define  I2C_HS_INTERFACE_TIMING_THD_STA	GENMASK(13, 8)
@@ -226,6 +230,49 @@ struct tegra_i2c_hw_feature {
 	bool has_interface_timing_reg;
 };
 
+/**
+ * I2C register config fields.
+ */
+static const struct tegra_cfg_field_desc i2c_cfg_fields[] = {
+	TEGRA_CFG_FIELD("nvidia,i2c-clk-divisor-fs-mode",
+			I2C_CLK_DIVISOR, I2C_CLK_DIVISOR_STD_FAST_MODE),
+	TEGRA_CFG_FIELD("nvidia,i2c-clk-divisor-hs-mode",
+			I2C_CLK_DIVISOR, I2C_CLK_DIVISOR_HSMODE),
+	TEGRA_CFG_FIELD("nvidia,i2c-hs-sclk-high-period",
+			I2C_HS_INTERFACE_TIMING_0,
+			I2C_HS_INTERFACE_TIMING_THIGH),
+	TEGRA_CFG_FIELD("nvidia,i2c-hs-sclk-low-period",
+			I2C_HS_INTERFACE_TIMING_0,
+			I2C_HS_INTERFACE_TIMING_TLOW),
+	TEGRA_CFG_FIELD("nvidia,i2c-hs-stop-setup-time",
+			I2C_HS_INTERFACE_TIMING_1,
+			I2C_HS_INTERFACE_TIMING_TSU_STO),
+	TEGRA_CFG_FIELD("nvidia,i2c-hs-start-hold-time",
+			I2C_HS_INTERFACE_TIMING_1,
+			I2C_HS_INTERFACE_TIMING_THD_STA),
+	TEGRA_CFG_FIELD("nvidia,i2c-hs-start-setup-time",
+			I2C_HS_INTERFACE_TIMING_1,
+			I2C_HS_INTERFACE_TIMING_TSU_STA),
+	TEGRA_CFG_FIELD("nvidia,i2c-sclk-high-period",
+			I2C_INTERFACE_TIMING_0, I2C_INTERFACE_TIMING_THIGH),
+	TEGRA_CFG_FIELD("nvidia,i2c-sclk-low-period",
+			I2C_INTERFACE_TIMING_0, I2C_INTERFACE_TIMING_TLOW),
+	TEGRA_CFG_FIELD("nvidia,i2c-bus-free-time",
+			I2C_INTERFACE_TIMING_1, I2C_INTERFACE_TIMING_TBUF),
+	TEGRA_CFG_FIELD("nvidia,i2c-stop-setup-time",
+			I2C_INTERFACE_TIMING_1, I2C_INTERFACE_TIMING_TSU_STO),
+	TEGRA_CFG_FIELD("nvidia,i2c-start-hold-time",
+			I2C_INTERFACE_TIMING_1, I2C_INTERFACE_TIMING_THD_STA),
+	TEGRA_CFG_FIELD("nvidia,i2c-start-setup-time",
+			I2C_INTERFACE_TIMING_1, I2C_INTERFACE_TIMING_TSU_STA),
+};
+
+static struct tegra_cfg_desc i2c_cfg_desc = {
+	.num_regs = 0,
+	.num_fields = ARRAY_SIZE(i2c_cfg_fields),
+	.fields = i2c_cfg_fields,
+};
+
 /**
  * struct tegra_i2c_dev - per device I2C context
  * @dev: device reference for power management
@@ -288,6 +335,8 @@ struct tegra_i2c_dev {
 	dma_addr_t dma_phys;
 	void *dma_buf;
 
+	struct tegra_cfg_list *list;
+
 	bool multimaster_mode;
 	bool atomic_mode;
 	bool dma_mode;
@@ -340,6 +389,16 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 	return readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
 
+static void i2c_update(struct tegra_i2c_dev *i2c_dev, u32 mask,
+		       u32 val, unsigned int reg)
+{
+	u32 rval;
+
+	rval = i2c_readl(i2c_dev, reg);
+	rval = (rval & ~mask) | val;
+	i2c_writel(i2c_dev, rval, reg);
+}
+
 static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
 			unsigned int reg, unsigned int len)
 {
@@ -604,6 +663,48 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
+static void tegra_i2c_write_cfg_settings(struct tegra_i2c_dev *i2c_dev,
+					 const char *name)
+{
+	struct tegra_cfg_reg *regs;
+	struct tegra_cfg *cfg;
+	unsigned int i;
+
+	cfg = tegra_cfg_get_by_name(i2c_dev->dev, i2c_dev->list, name);
+	if (!cfg)
+		return;
+
+	regs = cfg->regs;
+	for (i = 0; i < cfg->num_regs; i++) {
+		i2c_update(i2c_dev, regs[i].mask, regs[i].value,
+			   regs[i].offset);
+	}
+}
+
+static void tegra_i2c_config_cfg_settings(struct tegra_i2c_dev *i2c_dev)
+{
+	const char *name;
+
+	switch (i2c_dev->timings.bus_freq_hz) {
+	case I2C_MAX_FAST_MODE_PLUS_FREQ + 1 ... I2C_MAX_HIGH_SPEED_MODE_FREQ:
+		name = "high";
+		break;
+	case I2C_MAX_FAST_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
+		name = "fastplus";
+		break;
+	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_FREQ:
+		name = "fast";
+		break;
+	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
+	default:
+		name = "standard";
+		break;
+	}
+
+	tegra_i2c_write_cfg_settings(i2c_dev, "common");
+	tegra_i2c_write_cfg_settings(i2c_dev, name);
+}
+
 static void tegra_i2c_set_clk_params(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, tsu_thd, tlow, thigh, non_hs_mode;
@@ -712,7 +813,11 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
-	tegra_i2c_set_clk_params(i2c_dev);
+	if (i2c_dev->list)
+		tegra_i2c_config_cfg_settings(i2c_dev);
+	else
+		tegra_i2c_set_clk_params(i2c_dev);
+
 	err = tegra_i2c_set_div_clk(i2c_dev);
 	if (err)
 		return err;
@@ -1772,6 +1877,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	struct tegra_i2c_dev *i2c_dev;
 	struct resource *res;
 	int err;
+	const struct tegra_cfg_field_desc *fields;
+	unsigned int count = 0, i, j;
 
 	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
 	if (!i2c_dev)
@@ -1808,6 +1915,23 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	fields = i2c_cfg_fields;
+
+	for (i = 0; i < i2c_cfg_desc.num_fields; i++) {
+		for (j = 0; j < i; j++)
+			if (fields[i].offset == fields[j].offset)
+				break;
+		if (i == j)
+			count++;
+	}
+	i2c_cfg_desc.num_regs = count;
+
+	i2c_dev->list = tegra_cfg_get(i2c_dev->dev, NULL, &i2c_cfg_desc);
+	if (IS_ERR_OR_NULL(i2c_dev->list)) {
+		dev_dbg(&pdev->dev, "Config setting not available\n");
+		i2c_dev->list = NULL;
+	}
+
 	tegra_i2c_parse_dt(i2c_dev);
 
 	err = tegra_i2c_init_reset(i2c_dev);
-- 
2.43.2


