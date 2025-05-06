Return-Path: <linux-i2c+bounces-10832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D5AACE14
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 21:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2DE41C22431
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 19:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBB41C84B8;
	Tue,  6 May 2025 19:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XCyY1Lyf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8325A72614;
	Tue,  6 May 2025 19:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746559904; cv=fail; b=SfQ94NqylRcD5txH7Qjoom4x0pgjF5iWRWIxLMPsqtcifjZZ9/RroAnjyJ4rH8B3UAugii//TIRQ3YOt6VCS9jCIBNGvITZI8gWO2YLALsWm78i2b0nfLjQf1OUJ3AwS2qhwduhA2SISLACD6hhScH6OL8WA9bct3QeL9RWSnbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746559904; c=relaxed/simple;
	bh=tL79n7BtLeI4w35d1xnX6+jU9GlFGEWmH6cTh1VFun8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BIP2DcxP1yCq1sOzHnn+D41MySJxoQRwIJg58aLFZdkIvorLZeQEfo2d3xrw5HfCzHt0bMV97FyoeXWnNkj4HihYSZm01WxP7+g0NP8qJExuH16TH6/saQwsK3TVL98JKMzgskvobP6CHesr8e5pKd6cXRRYoxZgGadeIogW0Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XCyY1Lyf; arc=fail smtp.client-ip=40.107.220.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mC45f4EVRHqcY7k3iOVEzbTOgCSPNVkTRq8SYlbHP6TGLe/bdzZaB145ovVD7J+nhpomIB3wNtevizzso2q3WfFxzzHBWJufLTBf2SzpsBW8bSPYkVhuVuJ1nZRWEUkSYF/1t4mdAlwH5VI1LnzMJWuLwuHXiR95nWB+XfYPE9E1RfHh/zusuMElfUQWc06BuRbSO6kP1mmQ/q/LUvCt1IEfesPJwrsu4lF0+Qj8jFzXrAbEX2/zNykgsrJoXZPVgjyIRW8ycbKAobL1gfqJiRkeUqxhlH//rak/D7FXPWzFOLdz3diekZy3s4PLwOHFDliN8sJdyYsUmYQ2DIaLPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loQC1j/6ANHhVZT03sf5gYSotcS09vOOupiJ0uC2iLg=;
 b=tiKkRBOuNqAWFy6y+/Gu/WGc9TfWJLXdvXpWXVfEn27vAglNaK9QfkK+PH4LuLIq5y2sIWc1QuVyNOrQUCrduUYedyDB6WMZqpOGf/1Es/T+Ia73sPikqwOYaGig8JcZQ4XlFU/E3H4zSwMO5xs40u67OFAE5AwP97IqHaVUB/FXqMul3Jdee9p5RwuSr6PMHOBTS1JQ7aHUEohHCo0KclK8hexu5bz/SNrNeGIpuOVsSrSViareLgBbjLBINSLOhEK2oAbg/D+O3uvV6RmKjz84jcAjdY5Kpb9IbzGCIRi2kHO561TI2l3QOmJtxf18Yj5/LqOHKVeMK5VUgmINag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loQC1j/6ANHhVZT03sf5gYSotcS09vOOupiJ0uC2iLg=;
 b=XCyY1LyfgyYuyajyzK9U/46zGu3JTdFAmKhDIgHRZRyOOc12vLkhrByJkcMPrW5AiLmgF26XpaSwiR5wsKuxmSV8xgF+KC7xdSvqOwiXootVxYeT5ewbgDQq1eJaZDMMDX/6OyKsL03LeYkAznIT6tt8GTNmK/9Gp2JyvPIgUkVWpAZ8ZbcSsg/1Vmm2YyisrC3aY/wj17zGvp63l1i3pB//qwRKv6LPeHcrX40offlipvWy4LDMHvlje7QXQWllPxee6eTOw3/3GHb0z5gJmS3vU3+eiNL/28XL3oU+ZdQkwzNAdXu3049rEPtbwZuGsAs9TMVB7HAIvqcHMNiLMw==
Received: from BL1PR13CA0321.namprd13.prod.outlook.com (2603:10b6:208:2c1::26)
 by LV8PR12MB9184.namprd12.prod.outlook.com (2603:10b6:408:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 19:31:34 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::e1) by BL1PR13CA0321.outlook.office365.com
 (2603:10b6:208:2c1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 19:31:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 19:31:33 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 12:31:15 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 12:31:16 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Tue, 6 May
 2025 12:31:16 -0700
From: Chris Babroski <cbabroski@nvidia.com>
To: <andi.shyti@kernel.org>, <kblaiech@nvidia.com>, <asmaa@nvidia.com>
CC: <davthompson@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cbabroski@nvidia.com>
Subject: [PATCH v4 2/2] i2c-mlxbf: Improve I2C bus timing configuration
Date: Tue, 6 May 2025 19:30:59 +0000
Message-ID: <20250506193059.321345-2-cbabroski@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506193059.321345-1-cbabroski@nvidia.com>
References: <20250506193059.321345-1-cbabroski@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|LV8PR12MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7455db-7e58-4351-234d-08dd8cd49c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tsUJd4tIpS0iAeGwajhgRhQDnswAjAbVcT+gLy9BK4YMjaNHHMIzPYA31r8o?=
 =?us-ascii?Q?DtVtgNks+7MeXHa4wanFrFTfG6JVO/RlMe7CCq2Rzhm39UR//yoBrPxm3uFb?=
 =?us-ascii?Q?6wSmpt66N9IxMp1j+lI+tuTxOAXi58Jl9EY7fSBFCZCpY3UbaALsippBsiDT?=
 =?us-ascii?Q?sIB1IhFp9vvwtBqAVY8UQpBM3J/vmdvd1/M/vLfFYCWZ4xwCfwdsjvkZpVdU?=
 =?us-ascii?Q?PVSo07/PXb3c85BqQZIjyq2p3ODfDeBuiAARg6WU+WRYhVgsx8adHAXCK1LM?=
 =?us-ascii?Q?+E2YbYMxr4JvyAQmb7o7d5N7OceKUwci64Z/C73TjOB7qHKO1E1uOgE26xuA?=
 =?us-ascii?Q?FgimBFH2R1T/zMF6DfhDCKdUznF0vVvi+spoQJ411dwG5vTc21jwi2FSEfPz?=
 =?us-ascii?Q?d/OD2rxAYEIJ7juM0LB9r7m24F8xkmpLcbIp8FmN3eG21cXzhrbep6//y17Q?=
 =?us-ascii?Q?wOYvGnrlXn4stCMjzAg4ZGJPV3HVkzk7bbYndjuY0uotJliegJSru8s36EhJ?=
 =?us-ascii?Q?ktLN0auLbRWlhLya0nJCHvMJzhb7GSADaKu7RNGbiLRBs3++/YEyg6q2amko?=
 =?us-ascii?Q?+kkxCiR99vzqtWS4nhakyXUtuuDT5DR9qz3zInRVBbIz+YyMrja45WSH2TgX?=
 =?us-ascii?Q?fCnCRGto7c9uDxDfty0cOj7SKrSvhwaGEdsVEIrgvkvcFTREfxLnGWyuyNDL?=
 =?us-ascii?Q?Ye+HvOwgkeaHaAUPaVgREVh+H/ktAgeCGg4j3EEWvG8zO4XKRCwMyptYCsc5?=
 =?us-ascii?Q?/tY4py7cR5uZEswVDBNqzqAzITzmdS18c/Nf/Z3KwtNrth0RLWtA/TUCuPUo?=
 =?us-ascii?Q?kZD+XOhH9ymqYBXUGj60GVff/WJW9Y73gE8ffiPKJho/3qIP5avY/KJPVgqU?=
 =?us-ascii?Q?iAP/3qA1kAAop2PSS1+iIWHA/SOQu4NIsYlgzxS8TQDBx4Ec30rZh50Q6Cch?=
 =?us-ascii?Q?4S6eAn3vaC2Bv3oaBWfd6UQlZlGANL4vTCb1XZLOaWSRSXLS6m+arg+Jh+rB?=
 =?us-ascii?Q?b8U9wJXBIL7geDlSKfs9ijd3+yWS9TZwuCfp3AsbRSquw8yZ8JoSYEL5DiwZ?=
 =?us-ascii?Q?RcVKEH95AEmmcBlAlKXTPUTZ6aHCu/llBWJIbSt/wUW7oyGJNDESjhDIxmJJ?=
 =?us-ascii?Q?NcwRZJClQN6LPPzNjF3OknkISUWWpS/JXGLxyNVajZUUJkA5XGalsgRHBq/X?=
 =?us-ascii?Q?mMYqCCiItVrQZ7DV6+VEElt8Dkev1TEelO0zcn+e9FUtdD/ENhrp/+tptZ2g?=
 =?us-ascii?Q?cxMPNhsQuSQCgRO/EBDtixgkGpzWkXQ1Wpnhssg+Q/ifR5IKD0VCS5Nf7km4?=
 =?us-ascii?Q?0i2HJDSYVZAbPL8Mq3P08THg1KUxDnaW9ZLrnlY420mu0tvq0jwvQJ7UljHF?=
 =?us-ascii?Q?ezkX8Jxt2tzqiJshZazVpV7JWXikXMtRGBx7N36d4DLzewSELQZ6fNfnPgFd?=
 =?us-ascii?Q?se5xAR//znwoR/+OYok7LIF1AVvGd9OByLWIn80tHbMmD4ZhIonnjhIgIuQ+?=
 =?us-ascii?Q?Sh5TO9zEWMHvuxVS7oYt7zaFWmpMAEYomR1C?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 19:31:33.9937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7455db-7e58-4351-234d-08dd8cd49c6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9184

Update the I2C bus timing configuration on BlueField to match the
configuration recommended and verified by the HW team.

I2C block read failures were found on BlueField 3 during communication
with a device that requires the use of repeated start conditions.
Testing showed that these failures were caused by the I2C transaction
getting aborted early due to a short bus "timeout" configuration value.
This value determines how long the clock can be held low before the I2C
transaction is aborted.

Upon further inspection, it was also found that other I2C bus timing
configuration values used by the kernel driver do not match the
configuration that is recommended by the HW team and used in the
BlueField BSP I2C drivers.

Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
Reviewed-by: Asmaa Mnebhi <asmaa@nvidia.com>
Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 V3 -> V4: Split changes into two separate logical patches
 V2 -> V3: Cleaned up code and address review comments
 V1 -> V2: Removed default "Reviewed-by:" tags

 drivers/i2c/busses/i2c-mlxbf.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 0f5b6a00c1b6..3f8b4574f735 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -196,6 +196,7 @@
 
 #define MLXBF_I2C_MASK_8    GENMASK(7, 0)
 #define MLXBF_I2C_MASK_16   GENMASK(15, 0)
+#define MLXBF_I2C_MASK_32   GENMASK(31, 0)
 
 #define MLXBF_I2C_MST_ADDR_OFFSET         0x200
 
@@ -1192,7 +1193,8 @@ static void mlxbf_i2c_set_timings(struct mlxbf_i2c_priv *priv,
 				     MLXBF_I2C_MASK_16, MLXBF_I2C_SHIFT_16);
 	writel(timer, priv->timer->io + MLXBF_I2C_SMBUS_THIGH_MAX_TBUF);
 
-	timer = timings->timeout;
+	timer = mlxbf_i2c_set_timer(priv, timings->timeout, false,
+				    MLXBF_I2C_MASK_32, MLXBF_I2C_SHIFT_0);
 	writel(timer, priv->timer->io + MLXBF_I2C_SMBUS_SCL_LOW_TIMEOUT);
 }
 
@@ -1202,11 +1204,7 @@ enum mlxbf_i2c_timings_config {
 	MLXBF_I2C_TIMING_CONFIG_1000KHZ,
 };
 
-/*
- * Note that the mlxbf_i2c_timings->timeout value is not related to the
- * bus frequency, it is impacted by the time it takes the driver to
- * complete data transmission before transaction abort.
- */
+/* Timing values are in nanoseconds */
 static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
 	[MLXBF_I2C_TIMING_CONFIG_100KHZ] = {
 		.scl_high = 4810,
@@ -1221,8 +1219,8 @@ static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
 		.scl_fall = 50,
 		.hold_data = 300,
 		.buf = 20000,
-		.thigh_max = 5000,
-		.timeout = 106500
+		.thigh_max = 50000,
+		.timeout = 35000000
 	},
 	[MLXBF_I2C_TIMING_CONFIG_400KHZ] = {
 		.scl_high = 1011,
@@ -1237,24 +1235,24 @@ static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
 		.scl_fall = 50,
 		.hold_data = 300,
 		.buf = 20000,
-		.thigh_max = 5000,
-		.timeout = 106500
+		.thigh_max = 50000,
+		.timeout = 35000000
 	},
 	[MLXBF_I2C_TIMING_CONFIG_1000KHZ] = {
-		.scl_high = 600,
-		.scl_low = 1300,
+		.scl_high = 383,
+		.scl_low = 460,
 		.hold_start = 600,
-		.setup_start = 600,
-		.setup_stop = 600,
-		.setup_data = 100,
+		.setup_start = 260,
+		.setup_stop = 260,
+		.setup_data = 50,
 		.sda_rise = 50,
 		.sda_fall = 50,
 		.scl_rise = 50,
 		.scl_fall = 50,
 		.hold_data = 300,
-		.buf = 20000,
-		.thigh_max = 5000,
-		.timeout = 106500
+		.buf = 500,
+		.thigh_max = 50000,
+		.timeout = 35000000
 	}
 };
 
-- 
2.43.2


