Return-Path: <linux-i2c+bounces-4546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E17E91E3AA
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08EA31F2331E
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9273F16DEC0;
	Mon,  1 Jul 2024 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dCV2wnZX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A67916DC29;
	Mon,  1 Jul 2024 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846823; cv=fail; b=TaRnq8TuDFCVmiEGV8+2aOyp9FA9DADTm+Co29xgstWnmvsa2KsoWSgROQl1b6aleE+iuJ2H5efxn2FZVzVA3pFhrfYMjx3Ywd1ismdyfu68vj9soSyzdH0pl3qp6KXVOZFFUlTsF5LDZPxa5qjb4J+zX9FX9BhWUG+JBUOU1nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846823; c=relaxed/simple;
	bh=E117bRPM0/tqqPpnK5FdqynKoa64sKvJOX8lCbgr/30=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C7xdHqwMf5evO/gs302hzzbydnIXyxtDdqmffTpNQCA6+uHHlUb46iRMBk8TRqTnizkK3G15N59RVKj26o1b5wL4J5/S/GTqZa04DlfdpoMY/ekY+mbzUq3KfJZxemKFxxX6a27QXKgi+pLclwjlVyS4+Uo8U1hRgqDz728c0Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dCV2wnZX; arc=fail smtp.client-ip=40.107.92.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcC7+5zTxA1rKxDt7E0D4ix28lRO21PM4YplXplzD17MG5vkg7Cjv9QSRMn/svy8XKiCrWFE1IBj7gSSBdkL3enKEdU9yRAUZYuPDVFDQq3dVAZ+PZcBRAC2pjb1fR7ddQYkk6tC/k1cK0VLXTQpKWkBnTNrRyzI2mWN3coh5ZgUGz+3fF2o34dm37/9WY2KWmoOpg5g8HT4f0pBRk0Agi+3IAVUxAIDuLOlBvWWD+21MkCctCi6tPUzynfrB+S2V5TfOKC0eqCWpPJG3ZNPY29j7auuislI7AJbZdHV70jLyuTAAmhffDzxhnAlh85Raxpy3ieND9yczykH4xyfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHs8yPVIxrSWZhhJmWV3PS33Ay9zxIOEsmii6bPK1T0=;
 b=BrZ8IJkNlE+yyqnZJKIYVxAyTfaZaJfJNyNyf1/q4HPNnwcrMHtEtTM+ti6HVQxXL53D0bQXg6z8b58FCoINJzWLPLWNYqjA87Yl34KS5ngAwV2t61fgP7EvlWu1xnwuECG7JbPgpBepD8DK6kN5h7Trb3OjgvqmFhssbCba7xJ62PPTSH2PkJ+ZNAad5ROhAty8WZVn8zA81+qRnslQ19u+nhahyrySNi2PjRztJqW0GSBLF+Z056EvWCJyz2xNm7xqeT+uU7lSfJP1L6Ns9J2u4pZq92D1g0NjQ1C0hfZ/jFSX468Karg42m2Pzj4BViMw43PdNgvjwIiHxOtyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHs8yPVIxrSWZhhJmWV3PS33Ay9zxIOEsmii6bPK1T0=;
 b=dCV2wnZX5JOs29doD6KMDQCT9jFC3YeTzOq8jm+af9P0ZvSIW8z5ppTJThAG3QFPX5yvK62eMeqDVpDoAaoyRlLm/xL+AXOkGKD+1aYWKivwYtWeMpN1lxf4McvO88sO/GB2JCO3pAmG0JTVldDI9j0hbzsMW1ibMdzYLhMw834t3kHHGbSerecL/tx1IsxvtmDv6zJoORUY6L1tG0Z0mCm/u13/zf3GY491vHPOGBbiREsRmeSLzQP0B+hGhiYfx41Lp+55Pi+VwsBFkrDLj3H5UIiSGNyeORJMlsEQJTnwFli3lMeKtEfgEoe9CNHtj3bjXXu4Z4zpQ6IVbpWlnw==
Received: from PH8PR20CA0012.namprd20.prod.outlook.com (2603:10b6:510:23c::10)
 by CH0PR12MB8461.namprd12.prod.outlook.com (2603:10b6:610:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 15:13:33 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::a6) by PH8PR20CA0012.outlook.office365.com
 (2603:10b6:510:23c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:32 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:13:22 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:13:21 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:13:16 -0700
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
Subject: [RFC PATCH V2 07/12] i2c: tegra: config settings for interface timings
Date: Mon, 1 Jul 2024 20:42:25 +0530
Message-ID: <20240701151231.29425-8-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240701151231.29425-1-kyarlagadda@nvidia.com>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|CH0PR12MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a24cd01-fc4a-4f06-bebd-08dc99e05f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L1eqMvXIxoMdWo9VhrMcoUkW0cTSXi4UXu0tsSgA3pfh4nC3ykqhCzIlhrq+?=
 =?us-ascii?Q?3n7nXBpiRR3pzWZqvAZIKhU/MBRY2nzTCraqInV1K1ezTTi4aCMxDJR84Ci9?=
 =?us-ascii?Q?CVllLIUAHIV/P7iHe0Fq5T1vKaOENXEqqCKmeI+lK3grhFmxFnIPAZFNC8ey?=
 =?us-ascii?Q?TluISH7u5oeL0L1NybA7W/sAHqYFcB4vTWAEsp2OrWoeTP19nukrkJpIDdYm?=
 =?us-ascii?Q?U4W2blU364w9qlfL3j3rNcre/W+hhmYNcIOt3gBV8TZaxhHQ8JZ+6fa96d5k?=
 =?us-ascii?Q?gyE5whRq66Vppt+Hj6YIszCXw0n40egkgSGxjMB5017XTNDZUYgFtX25oYos?=
 =?us-ascii?Q?49IF3rY8Z4wAr4UXyqsnN1rBZbXzpHt7t2Dxvjz2MjwJY1J5YPBPzxPlrBhf?=
 =?us-ascii?Q?VdsPG63Z9Kpf62KQK4NyH5V0B3OPqHu5NjznXBlS335f8cZ8ybKeD4h0xG0M?=
 =?us-ascii?Q?TG4m/KN4CQ1mlHyilIjP9ySFGPw8GoNGVD5B+a8cpfiGKrBET7b328GV0qJ1?=
 =?us-ascii?Q?S/9VEu1sLFHkfaoCpsiPS73VEWvO/REEezOluRvvuv2fRHKaRwpEi41AYulu?=
 =?us-ascii?Q?ZOzD8EdYahKF2JiZk6YxlIv1u2jkFRB4siO0hK9koEGAmoDIvR+2nbgdmZpg?=
 =?us-ascii?Q?6qBEZojAVS47crXN53YRtpIK6Mz0Sye9PYxMGIHOwDpOnOQ0xYILZJyUZOkK?=
 =?us-ascii?Q?nhHLvEMlLsp/6bxStFOMswcYeTVxyMkBTrnqRHjz1fw5U7+vxGJyrSdUZdb6?=
 =?us-ascii?Q?tPx2ygFomJd7rw/6CokSKNlfItdmDPvmx5ZdzzcL2nCO1FpZt9ubV0F22HAK?=
 =?us-ascii?Q?l32yhW+ER7gM38d6JVAOU+89rMpWW/4XBtosXgeFH3yQ8mMLrMbtlBLbDlG4?=
 =?us-ascii?Q?XhMDSCueMIbWfX+i13zPJrTR/7WxTZnDNgeDcnQio9eTiikha2OSTsNjk/AR?=
 =?us-ascii?Q?fm16oUCHkl66lFF0u+DzOJcpQ5lnNrhvNkmxaCuKy6GKSfg9EI67DPryiA+y?=
 =?us-ascii?Q?edjqk2Uqdwx7yvtlw0jmJM8XeOvszF4rjpJK6ZEHGTtKWUehaGmzD90GpW6i?=
 =?us-ascii?Q?KJjRhEIWfcQf2xKrta1mtzHS1u/Uq03lYUw5aPxH6fgTk47p79Fxx8gKxwif?=
 =?us-ascii?Q?/nRMNj7rVCHKrrzJ/NIiJjjZ9onuyq9UHXbtvXKitchqfJ2CLnk2yfYcSZW5?=
 =?us-ascii?Q?6GElXkMHdaTlaR3D4+h/Q9py1V8GEaorAX3uzfJSxEKFQRjOdOCpsKyvIliM?=
 =?us-ascii?Q?EDdudgt+GZwT4FdkVy0wM9SsThS9lsBWZtdsHLd/dFHI8g/00qrXR8KmEbXr?=
 =?us-ascii?Q?Wlf/FwXZz28XdDLVN+7DWF7pCggq5vDAs6gt6xSyho/gtlYN48igEaqEWk55?=
 =?us-ascii?Q?hHO/hP8COtcdhkAPoTLLgwxzwj5KyCeeN6l47+jyq0sjQ/BTrjuieVybi3NM?=
 =?us-ascii?Q?bk4b5ili7/rEyg3atD6fq9ve3+QLraBo?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:32.9222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a24cd01-fc4a-4f06-bebd-08dc99e05f49
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8461

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
index b3dc2603db35..b81925576060 100644
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
+		name = "i2c-high-cfg";
+		break;
+	case I2C_MAX_FAST_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
+		name = "i2c-fastplus-cfg";
+		break;
+	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_FREQ:
+		name = "i2c-fast-cfg";
+		break;
+	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
+	default:
+		name = "i2c-standard-cfg";
+		break;
+	}
+
+	tegra_i2c_write_cfg_settings(i2c_dev, "i2c-common-cfg");
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


