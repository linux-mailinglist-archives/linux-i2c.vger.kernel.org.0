Return-Path: <linux-i2c+bounces-15281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3DD3C39C
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 50712522577
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E773D5243;
	Tue, 20 Jan 2026 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sUdR+dsS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010009.outbound.protection.outlook.com [52.101.85.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E93D5235;
	Tue, 20 Jan 2026 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900894; cv=fail; b=lj5e4hSQ5tYntMY14tw8EIp1feA6z7CM0Fkc4LG6mo7Dmxan7J0/9dgZXsW35Tk0b0hXflPlQqh2tcNbPRjjiMICLDeHWNYYunDWJEoL1vzSER9V0GX13yI9C3zVcRyQPpX07Owu+JMaWYoApsRFh7gCVp0C4H5xZ932z7JPrFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900894; c=relaxed/simple;
	bh=F7IysCWYxk0AmOycs9Kp27NnUKvVuUzRGMpPyEnXoOk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FL9kfNYWJIHMfJmlOgjnO/o/dIrvoCGXjk6u6zxhByPiKqtUuOG+SCSX24I2u2gcyPhk43YwFS2JG3TBPlhBOiYOPy/5k/BOnaHxRIQt9SbAJY58T7pTkJf9TvAcXbAKqRjfgns1U5yFJe/JFQBRnYdoubr8byF03GCDEVpjy9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sUdR+dsS; arc=fail smtp.client-ip=52.101.85.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4XNuiABFWUpBw8fv9UN5cTsFH991UIjX/4QBGsITtdzfBl/6MJ2lxctzvBn5mIuZar7iQlC2qLgi8oeFCJG+qwUjVpPu+DPmS/O47hjHPQMDvmgD+1JYdnyeDj4g1bU2pyBnjZSj4rkid66/9TRRlRRQ+dKQF8B2Bqn/ti+DqEYYGYxJlTRFn3HsoJ2/6lrOTKsD3/zG2HcyQDZ3cfECW7cCb4nuy3SfB33G57V4tTGtThlYUtmyGqvvpk+f7qS8ERgiScJIiSVOEj1BMMD+eW5dqrcuAzER1v8LF9tkBB3nCI3IuFvh+tZuW4eRz2ZTNsEJvX1/maxq67ma6OuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPhIHrV1KIfHLLKVKWWizeJMgZZXX6Co+soss9aPYUI=;
 b=QIxRLY/2Cc3Fk1iR+j+7xHRfdTmdapbl5cgBaKrM2xMrMINhVx5gJsbJV4b14MQyxFB2bFthWdw2oAA9e4M+NJCqNomWssLuH+ZZxUk+nDyUGCoNnGAzwk1wQZbzaHtdxRl5pYgsz0jFPnxXSzShGcHcI2ucm8ATfvLVG7XTDUIjSBtisy01UBiwU9BSU2X/r6fxOgSCENYmw2mj9lUjEFU3dk0QErloWfRrl8br9GxeBO806EHX1uFSgMoQB8sHAyVzHNqXPJk2V7R4STAuQlYPfWgDvSwu0zWvG2Nusq18c14UP3CvHMzxONAVIIc53Se9Yt+ICtT3bDWaZ6JGug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPhIHrV1KIfHLLKVKWWizeJMgZZXX6Co+soss9aPYUI=;
 b=sUdR+dsSVm2hIMd7dkZRor2/l3lg3k3hnNGwTiKGEJVB9woPD4l+sBn8h7XtSy9IMkg6I/ysUleh3fmdgjGNL7/HeXNz6Kw4WheVta7q4rmJvubxUq/fOC6565NOEP246EyxSxv1FMOotKG/g4mQjZWqh/JD+XFfP89NdSh1cds5vCTqE8mdAtA3OoHXnNrgIw5R7ppa+omXZLCC2J7MTm+p0L29pO8PfweELZj4EYCjalhh8pTpMZMoHAer0pn33vPkEsGUryMwPxQtkw7xajdiH3hmNYQtPLXaT7x0usjE2zkZJvm4OLbNZtdcbYiL8aSugTq00524TGR9Zhr2Fw==
Received: from CH5PR02CA0001.namprd02.prod.outlook.com (2603:10b6:610:1ed::17)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 09:21:21 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::1b) by CH5PR02CA0001.outlook.office365.com
 (2603:10b6:610:1ed::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.13 via Frontend Transport; Tue,
 20 Jan 2026 09:21:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:21:20 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 01:20:52 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 01:20:51 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 01:20:48 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v8 3/4] i2c: tegra: Add logic to support different register offsets
Date: Tue, 20 Jan 2026 14:50:31 +0530
Message-ID: <20260120092032.83100-4-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120092032.83100-1-kkartik@nvidia.com>
References: <20260120092032.83100-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: 520db18a-ef40-4e4f-48b4-08de58054657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ahY7R1G4l+FvqTfbUDxlNsTCjNEjE8V9eegiao4UaVFJEymvz8BGd75GtvZV?=
 =?us-ascii?Q?bhCkCevClfuc4oaJKfv9vnjKXxAcfoFU1HACN5JGTJhyM1NvboSezHDTLE0M?=
 =?us-ascii?Q?5xD42qC/f1SWac0nHM9M9pkVUh/u4c5CYZ/2o8ccVcOkZHZDlz0szGlYgVTk?=
 =?us-ascii?Q?DJ74V/hCUYEyyJqvxgwi3AeOkVIymafz9NOv1nU1LURuCRXKtBXnEumrgKKn?=
 =?us-ascii?Q?eFE8KZMveoy9zxkp4tkND0CW9UgMZsJ1lc/q3LnBA1Zak4SsFUsXnMIM8EgE?=
 =?us-ascii?Q?+/y/CQv65MXFHitMa3wIEd4GXAigQExAUa/La7hWDy1blcM0DxxxtZk3xKsB?=
 =?us-ascii?Q?5T8aB3aTO067gC+l8aGfaSkrw0sYZgAbs1+xjv09rnIQGXW6FEIwWRdxuj2Y?=
 =?us-ascii?Q?FAmiI9FMaEIm56YDObRmLshvpHI/MHrR2yYrbYo4fb6gYo3D5RG++KcfBNx0?=
 =?us-ascii?Q?Ju29gw2iiknBFMU1E2Zg7Xf+tXQ1Vo85Tu5UEeOtbD5U4UdVdvbVD1HE9+bK?=
 =?us-ascii?Q?F0/xNCZ0HdGMZSDdM9Ft16NSnm0SnxvjgK1zGD/iZ90aZ2KGWJsTuIjRj+uw?=
 =?us-ascii?Q?iNdYq4oy2ebntTMYySwzWIqJ1Prp6ikG1FYyQ+u46D9G6U9cRgHUllzxJbfI?=
 =?us-ascii?Q?ksFD9wG/DZT1jghwe0reERH0z+rO33kS2UCWXp9tleyh4l2cOsKHPTi1Bo25?=
 =?us-ascii?Q?cX2PC5oX7BvLa8aTm70vYHbOZwMUDRW4zxq03JHvM0hnXRpwx9BVAAxEG/gk?=
 =?us-ascii?Q?ooREMeBuhtcQupRKIXGleZ1mFcPLUT1vBRGiQVUFCf5UL1cQbzmSRDtS2pn+?=
 =?us-ascii?Q?rvJH7mqTYVWRrpvasRYpSU0scNKA8SJhaCBfHz0YVz3GOTYcNIDfzHXg9hDC?=
 =?us-ascii?Q?97G3u9QdCAPdAMkuPucL4z6jbRYSXNmWF9+Gy8jmOEvHsykUiH6LUy522NPe?=
 =?us-ascii?Q?RP+F754Br+Cy16YPtXe0/cZKeCCWMiReBeWUy9T9cal/O3nHWefIEKcmDiN2?=
 =?us-ascii?Q?g5WibSnO5/LClD43FP+Sz8b5TksvsW7iwDvuUoL7XKiFIIDWzZQCW2m3EOWA?=
 =?us-ascii?Q?GGPe41o6abfp31zIItTSgQ1KR+wU+maGZIyKWAuJXvvYc/mwI8CIb6uSTsAX?=
 =?us-ascii?Q?u1fz0EoS9BhmBiwDRD50/plnvykeNfTH+YxkNWzinkExJze5Q5VuWjKkNSzx?=
 =?us-ascii?Q?KVupoIzhpuVasH4KnAU8r7VY54US73Ogr7byF7N2Et1n/MciECklK8h/Bm3m?=
 =?us-ascii?Q?GGyRAP0Yz2hV3Wq4hC9tS6s+FJXE8cXftQEnK0Ndy5qIm7rKpGD3OzrfxNMz?=
 =?us-ascii?Q?tg4qV1s26tqcnGxKASX3mFNiC7V0m0LHo55jExsI7+7HObtxKLhJORNQQaQl?=
 =?us-ascii?Q?9s+KvtfEs2Uvwn6y6RzJZDeGVRVxVAkZucnepIcXIM7DaYLbfsyXWnY4M5MV?=
 =?us-ascii?Q?aKUphY5YBMpqP5Q0dNPE2A8TfqswsIXYZmNLl1FuwYBHcGQI7RalFjEGBdyU?=
 =?us-ascii?Q?hTN4ZKlahSSxOmPvGOaKkVvB8wFZ5wkwv+0vaEjPh86OxA53NuIWGlc3CjzP?=
 =?us-ascii?Q?vJTyv/dNbS6yccAuZafHV7CE/hTz2vcDjkJ5CyigFL1CdSP5hPrRNj12a75f?=
 =?us-ascii?Q?rrOhN/0FxWcVUq9VXvZT+6lmPhyj35pY5GhVvM5NlgMTMq49BdXwFyLzgXiK?=
 =?us-ascii?Q?4pgC7r+OK7SmC3ht7B577Nn6aWw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:21:20.9946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 520db18a-ef40-4e4f-48b4-08de58054657
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116

Tegra410 use different offsets for existing I2C registers, update
the logic to use appropriate offsets per SoC.

As the registers offsets are now also defined for dvc and vi, following
function are not required and they are removed:
 - tegra_i2c_reg_addr(): No translation required.
 - dvc_writel(): Replaced with writel_relaxed().
 - dvc_readl(): Replaced with i2c_readl().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v8:
	* Replace usage of dvc_writel() with writel_relaxed().
	* Remove dvc_writel().
Changes in v7:
	* Fix Tegra256 reg offsets, change it to tegra264_i2c_regs as it
	  supports SW mutex.
Changes in v6:
	* Do not remove dvc_writel().
	* Keep DVC registers defined as a macro.
	* Correct Tegra20 DVC register offsets.
	* Remove sl_cnfg, sl_addr1 and sl_addr2 registers for DVC and VI
	  as they are not used.
Changes in v2:
	* Replace individual is_dvc and is_vi flags with an I2C variant.
	* Add tegra20_dvc_i2c_hw and tegra210_vi_i2c_hw in a separate
	  patch.
	* Use calculated offsets for tegra20_dvc_i2c_regs and
	  tegra210_vi_i2c_regs.
	* Initialize registers only if they are used on the given SoC.
---
 drivers/i2c/busses/i2c-tegra.c | 382 +++++++++++++++++++++------------
 1 file changed, 243 insertions(+), 139 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2ef5fba66b0f..b525997df330 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -30,38 +30,29 @@
 
 #define BYTES_PER_FIFO_WORD 4
 
-#define I2C_CNFG				0x000
 #define I2C_CNFG_DEBOUNCE_CNT			GENMASK(14, 12)
 #define I2C_CNFG_PACKET_MODE_EN			BIT(10)
 #define I2C_CNFG_NEW_MASTER_FSM			BIT(11)
 #define I2C_CNFG_MULTI_MASTER_MODE		BIT(17)
-#define I2C_STATUS				0x01c
-#define I2C_SL_CNFG				0x020
+
 #define I2C_SL_CNFG_NACK			BIT(1)
 #define I2C_SL_CNFG_NEWSL			BIT(2)
-#define I2C_SL_ADDR1				0x02c
-#define I2C_SL_ADDR2				0x030
-#define I2C_TLOW_SEXT				0x034
-#define I2C_TX_FIFO				0x050
-#define I2C_RX_FIFO				0x054
-#define I2C_PACKET_TRANSFER_STATUS		0x058
-#define I2C_FIFO_CONTROL			0x05c
+
 #define I2C_FIFO_CONTROL_TX_FLUSH		BIT(1)
 #define I2C_FIFO_CONTROL_RX_FLUSH		BIT(0)
 #define I2C_FIFO_CONTROL_TX_TRIG(x)		(((x) - 1) << 5)
 #define I2C_FIFO_CONTROL_RX_TRIG(x)		(((x) - 1) << 2)
-#define I2C_FIFO_STATUS				0x060
+
 #define I2C_FIFO_STATUS_TX			GENMASK(7, 4)
 #define I2C_FIFO_STATUS_RX			GENMASK(3, 0)
-#define I2C_INT_MASK				0x064
-#define I2C_INT_STATUS				0x068
+
 #define I2C_INT_BUS_CLR_DONE			BIT(11)
 #define I2C_INT_PACKET_XFER_COMPLETE		BIT(7)
 #define I2C_INT_NO_ACK				BIT(3)
 #define I2C_INT_ARBITRATION_LOST		BIT(2)
 #define I2C_INT_TX_FIFO_DATA_REQ		BIT(1)
 #define I2C_INT_RX_FIFO_DATA_REQ		BIT(0)
-#define I2C_CLK_DIVISOR				0x06c
+
 #define I2C_CLK_DIVISOR_STD_FAST_MODE		GENMASK(31, 16)
 #define I2C_CLK_DIVISOR_HSMODE			GENMASK(15, 0)
 
@@ -94,50 +85,38 @@
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
-#define I2C_BUS_CLEAR_CNFG			0x084
 #define I2C_BC_SCLK_THRESHOLD			GENMASK(23, 16)
 #define I2C_BC_STOP_COND			BIT(2)
 #define I2C_BC_TERMINATE			BIT(1)
 #define I2C_BC_ENABLE				BIT(0)
-#define I2C_BUS_CLEAR_STATUS			0x088
+
 #define I2C_BC_STATUS				BIT(0)
 
-#define I2C_CONFIG_LOAD				0x08c
 #define I2C_MSTR_CONFIG_LOAD			BIT(0)
 
-#define I2C_CLKEN_OVERRIDE			0x090
 #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
 
-#define I2C_INTERFACE_TIMING_0			0x094
-#define  I2C_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
-#define  I2C_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
-#define I2C_INTERFACE_TIMING_1			0x098
-#define  I2C_INTERFACE_TIMING_TBUF		GENMASK(29, 24)
-#define  I2C_INTERFACE_TIMING_TSU_STO		GENMASK(21, 16)
-#define  I2C_INTERFACE_TIMING_THD_STA		GENMASK(13, 8)
-#define  I2C_INTERFACE_TIMING_TSU_STA		GENMASK(5, 0)
-
-#define I2C_HS_INTERFACE_TIMING_0		0x09c
-#define  I2C_HS_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
-#define  I2C_HS_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
-#define I2C_HS_INTERFACE_TIMING_1		0x0a0
-#define  I2C_HS_INTERFACE_TIMING_TSU_STO	GENMASK(21, 16)
-#define  I2C_HS_INTERFACE_TIMING_THD_STA	GENMASK(13, 8)
-#define  I2C_HS_INTERFACE_TIMING_TSU_STA	GENMASK(5, 0)
-
-#define I2C_MST_FIFO_CONTROL			0x0b4
+#define I2C_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
+#define I2C_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
+#define I2C_INTERFACE_TIMING_TBUF		GENMASK(29, 24)
+#define I2C_INTERFACE_TIMING_TSU_STO		GENMASK(21, 16)
+#define I2C_INTERFACE_TIMING_THD_STA		GENMASK(13, 8)
+#define I2C_INTERFACE_TIMING_TSU_STA		GENMASK(5, 0)
+
+#define I2C_HS_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
+#define I2C_HS_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
+#define I2C_HS_INTERFACE_TIMING_TSU_STO		GENMASK(21, 16)
+#define I2C_HS_INTERFACE_TIMING_THD_STA		GENMASK(13, 8)
+#define I2C_HS_INTERFACE_TIMING_TSU_STA		GENMASK(5, 0)
+
 #define I2C_MST_FIFO_CONTROL_RX_FLUSH		BIT(0)
 #define I2C_MST_FIFO_CONTROL_TX_FLUSH		BIT(1)
 #define I2C_MST_FIFO_CONTROL_RX_TRIG(x)		(((x) - 1) <<  4)
 #define I2C_MST_FIFO_CONTROL_TX_TRIG(x)		(((x) - 1) << 16)
 
-#define I2C_MST_FIFO_STATUS			0x0b8
 #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
 #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
 
-#define I2C_MASTER_RESET_CNTRL			0x0a8
-
-#define I2C_SW_MUTEX				0x0ec
 #define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
 #define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
 #define I2C_SW_MUTEX_ID_CCPLEX			9
@@ -159,6 +138,143 @@
  */
 #define I2C_PIO_MODE_PREFERRED_LEN		32
 
+struct tegra_i2c_regs {
+	unsigned int cnfg;
+	unsigned int status;
+	unsigned int sl_cnfg;
+	unsigned int sl_addr1;
+	unsigned int sl_addr2;
+	unsigned int tlow_sext;
+	unsigned int tx_fifo;
+	unsigned int rx_fifo;
+	unsigned int packet_transfer_status;
+	unsigned int fifo_control;
+	unsigned int fifo_status;
+	unsigned int int_mask;
+	unsigned int int_status;
+	unsigned int clk_divisor;
+	unsigned int bus_clear_cnfg;
+	unsigned int bus_clear_status;
+	unsigned int config_load;
+	unsigned int clken_override;
+	unsigned int interface_timing_0;
+	unsigned int interface_timing_1;
+	unsigned int hs_interface_timing_0;
+	unsigned int hs_interface_timing_1;
+	unsigned int master_reset_cntrl;
+	unsigned int mst_fifo_control;
+	unsigned int mst_fifo_status;
+	unsigned int sw_mutex;
+};
+
+static const struct tegra_i2c_regs tegra20_i2c_regs = {
+	.cnfg = 0x000,
+	.status = 0x01c,
+	.sl_cnfg = 0x020,
+	.sl_addr1 = 0x02c,
+	.sl_addr2 = 0x030,
+	.tx_fifo = 0x050,
+	.rx_fifo = 0x054,
+	.packet_transfer_status = 0x058,
+	.fifo_control = 0x05c,
+	.fifo_status = 0x060,
+	.int_mask = 0x064,
+	.int_status = 0x068,
+	.clk_divisor = 0x06c,
+	.bus_clear_cnfg = 0x084,
+	.bus_clear_status = 0x088,
+	.config_load = 0x08c,
+	.clken_override = 0x090,
+	.interface_timing_0 = 0x094,
+	.interface_timing_1 = 0x098,
+	.hs_interface_timing_0 = 0x09c,
+	.hs_interface_timing_1 = 0x0a0,
+	.master_reset_cntrl = 0x0a8,
+	.mst_fifo_control = 0x0b4,
+	.mst_fifo_status = 0x0b8,
+};
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
+static const struct tegra_i2c_regs tegra20_dvc_i2c_regs = {
+	.cnfg = 0x040,
+	.status = 0x05c,
+	.tx_fifo = 0x060,
+	.rx_fifo = 0x064,
+	.packet_transfer_status = 0x068,
+	.fifo_control = 0x06c,
+	.fifo_status = 0x070,
+	.int_mask = 0x074,
+	.int_status = 0x078,
+	.clk_divisor = 0x07c,
+	.bus_clear_cnfg = 0x094,
+	.bus_clear_status = 0x098,
+	.config_load = 0x09c,
+	.clken_override = 0x0a0,
+	.interface_timing_0 = 0x0a4,
+	.interface_timing_1 = 0x0a8,
+	.hs_interface_timing_0 = 0x0ac,
+	.hs_interface_timing_1 = 0x0b0,
+	.master_reset_cntrl = 0x0b8,
+	.mst_fifo_control = 0x0c4,
+	.mst_fifo_status = 0x0c8,
+};
+#endif
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+static const struct tegra_i2c_regs tegra210_vi_i2c_regs = {
+	.cnfg = 0x0c00,
+	.status = 0x0c70,
+	.tlow_sext = 0x0cd0,
+	.tx_fifo = 0x0d40,
+	.rx_fifo = 0x0d50,
+	.packet_transfer_status = 0x0d60,
+	.fifo_control = 0x0d70,
+	.fifo_status = 0x0d80,
+	.int_mask = 0x0d90,
+	.int_status = 0x0da0,
+	.clk_divisor = 0x0db0,
+	.bus_clear_cnfg = 0x0e10,
+	.bus_clear_status = 0x0e20,
+	.config_load = 0x0e30,
+	.clken_override = 0x0e40,
+	.interface_timing_0 = 0x0e50,
+	.interface_timing_1 = 0x0e60,
+	.hs_interface_timing_0 = 0x0e70,
+	.hs_interface_timing_1 = 0x0e80,
+	.master_reset_cntrl = 0x0ea0,
+	.mst_fifo_control = 0x0ed0,
+	.mst_fifo_status = 0x0ee0,
+};
+#endif
+
+static const struct tegra_i2c_regs tegra264_i2c_regs = {
+	.cnfg = 0x000,
+	.status = 0x01c,
+	.sl_cnfg = 0x020,
+	.sl_addr1 = 0x02c,
+	.sl_addr2 = 0x030,
+	.tx_fifo = 0x050,
+	.rx_fifo = 0x054,
+	.packet_transfer_status = 0x058,
+	.fifo_control = 0x05c,
+	.fifo_status = 0x060,
+	.int_mask = 0x064,
+	.int_status = 0x068,
+	.clk_divisor = 0x06c,
+	.bus_clear_cnfg = 0x084,
+	.bus_clear_status = 0x088,
+	.config_load = 0x08c,
+	.clken_override = 0x090,
+	.interface_timing_0 = 0x094,
+	.interface_timing_1 = 0x098,
+	.hs_interface_timing_0 = 0x09c,
+	.hs_interface_timing_1 = 0x0a0,
+	.master_reset_cntrl = 0x0a8,
+	.mst_fifo_control = 0x0b4,
+	.mst_fifo_status = 0x0b8,
+	.sw_mutex = 0x0ec,
+};
+
 /*
  * msg_end_type: The bus control which needs to be sent at end of transfer.
  * @MSG_END_STOP: Send stop pulse.
@@ -236,6 +352,7 @@ enum tegra_i2c_variant {
  * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
  * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
  * @variant: This represents the I2C controller variant.
+ * @regs: Register offsets for the specific SoC variant.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -268,6 +385,7 @@ struct tegra_i2c_hw_feature {
 	bool enable_hs_mode_support;
 	bool has_mutex;
 	enum tegra_i2c_variant variant;
+	const struct tegra_i2c_regs *regs;
 };
 
 /**
@@ -340,51 +458,26 @@ struct tegra_i2c_dev {
 #define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
 		     (dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
 
-static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
-		       unsigned int reg)
-{
-	writel_relaxed(val, i2c_dev->base + reg);
-}
-
-static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
-{
-	return readl_relaxed(i2c_dev->base + reg);
-}
-
-/*
- * If necessary, i2c_writel() and i2c_readl() will offset the register
- * in order to talk to the I2C block inside the DVC block.
- */
-static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
-{
-	if (IS_DVC(i2c_dev))
-		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
-	else if (IS_VI(i2c_dev))
-		reg = 0xc00 + (reg << 2);
-
-	return reg;
-}
-
 static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned int reg)
 {
-	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	writel_relaxed(val, i2c_dev->base + reg);
 
 	/* read back register to make sure that register writes completed */
-	if (reg != I2C_TX_FIFO)
-		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	if (reg != i2c_dev->hw->regs->tx_fifo)
+		readl_relaxed(i2c_dev->base + reg);
 	else if (IS_VI(i2c_dev))
-		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, I2C_INT_STATUS));
+		readl_relaxed(i2c_dev->base + i2c_dev->hw->regs->int_status);
 }
 
 static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 {
-	return readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	return readl_relaxed(i2c_dev->base + reg);
 }
 
 static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
 			unsigned int reg, unsigned int len)
 {
-	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
+	writesl(i2c_dev->base + reg, data, len);
 }
 
 static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, void *data,
@@ -405,12 +498,12 @@ static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, void *data,
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
 		       unsigned int reg, unsigned int len)
 {
-	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
+	readsl(i2c_dev->base + reg, data, len);
 }
 
 static bool tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	val = readl(i2c_dev->base + reg);
@@ -421,7 +514,7 @@ static bool tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
 
 static bool tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	val = readl(i2c_dev->base + reg);
@@ -459,7 +552,7 @@ static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	if (!i2c_dev->hw->has_mutex)
@@ -482,16 +575,16 @@ static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 {
 	u32 int_mask;
 
-	int_mask = i2c_readl(i2c_dev, I2C_INT_MASK) & ~mask;
-	i2c_writel(i2c_dev, int_mask, I2C_INT_MASK);
+	int_mask = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_mask) & ~mask;
+	i2c_writel(i2c_dev, int_mask, i2c_dev->hw->regs->int_mask);
 }
 
 static void tegra_i2c_unmask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 {
 	u32 int_mask;
 
-	int_mask = i2c_readl(i2c_dev, I2C_INT_MASK) | mask;
-	i2c_writel(i2c_dev, int_mask, I2C_INT_MASK);
+	int_mask = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_mask) | mask;
+	i2c_writel(i2c_dev, int_mask, i2c_dev->hw->regs->int_mask);
 }
 
 static void tegra_i2c_dma_complete(void *args)
@@ -619,14 +712,14 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
 
-	val = dvc_readl(i2c_dev, DVC_CTRL_REG3);
+	val = i2c_readl(i2c_dev, DVC_CTRL_REG3);
 	val |= DVC_CTRL_REG3_SW_PROG;
 	val |= DVC_CTRL_REG3_I2C_DONE_INTR_EN;
-	dvc_writel(i2c_dev, val, DVC_CTRL_REG3);
+	writel_relaxed(val, i2c_dev->base + DVC_CTRL_REG3);
 
-	val = dvc_readl(i2c_dev, DVC_CTRL_REG1);
+	val = i2c_readl(i2c_dev, DVC_CTRL_REG1);
 	val |= DVC_CTRL_REG1_INTR_EN;
-	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
+	writel_relaxed(val, i2c_dev->base + DVC_CTRL_REG1);
 }
 
 static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
@@ -635,34 +728,34 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 
 	value = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, 2) |
 		FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, 4);
-	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_0);
+	i2c_writel(i2c_dev, value, i2c_dev->hw->regs->interface_timing_0);
 
 	value = FIELD_PREP(I2C_INTERFACE_TIMING_TBUF, 4) |
 		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STO, 7) |
 		FIELD_PREP(I2C_INTERFACE_TIMING_THD_STA, 4) |
 		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STA, 4);
-	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_1);
+	i2c_writel(i2c_dev, value, i2c_dev->hw->regs->interface_timing_1);
 
 	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, 3) |
 		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, 8);
-	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_0);
+	i2c_writel(i2c_dev, value, i2c_dev->hw->regs->hs_interface_timing_0);
 
 	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STO, 11) |
 		FIELD_PREP(I2C_HS_INTERFACE_TIMING_THD_STA, 11) |
 		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STA, 11);
-	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_1);
+	i2c_writel(i2c_dev, value, i2c_dev->hw->regs->hs_interface_timing_1);
 
 	value = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND;
-	i2c_writel(i2c_dev, value, I2C_BUS_CLEAR_CNFG);
+	i2c_writel(i2c_dev, value, i2c_dev->hw->regs->bus_clear_cnfg);
 
-	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
+	i2c_writel(i2c_dev, 0x0, i2c_dev->hw->regs->tlow_sext);
 }
 
 static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
 				   u32 reg, u32 mask, u32 delay_us,
 				   u32 timeout_us)
 {
-	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
+	void __iomem *addr = i2c_dev->base + reg;
 	u32 val;
 
 	if (!i2c_dev->atomic_mode)
@@ -681,11 +774,11 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_mst_fifo) {
 		mask = I2C_MST_FIFO_CONTROL_TX_FLUSH |
 		       I2C_MST_FIFO_CONTROL_RX_FLUSH;
-		offset = I2C_MST_FIFO_CONTROL;
+		offset = i2c_dev->hw->regs->mst_fifo_control;
 	} else {
 		mask = I2C_FIFO_CONTROL_TX_FLUSH |
 		       I2C_FIFO_CONTROL_RX_FLUSH;
-		offset = I2C_FIFO_CONTROL;
+		offset = i2c_dev->hw->regs->fifo_control;
 	}
 
 	val = i2c_readl(i2c_dev, offset);
@@ -708,9 +801,9 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	if (!i2c_dev->hw->has_config_load_reg)
 		return 0;
 
-	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, i2c_dev->hw->regs->config_load);
 
-	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
+	err = tegra_i2c_poll_register(i2c_dev, i2c_dev->hw->regs->config_load, 0xffffffff,
 				      1000, I2C_CONFIG_LOAD_TIMEOUT);
 	if (err) {
 		dev_err(i2c_dev->dev, "failed to load config\n");
@@ -731,10 +824,10 @@ static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
 	 * SW needs to wait for 2us after assertion and de-assertion of this soft
 	 * reset.
 	 */
-	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
+	i2c_writel(i2c_dev, 0x1, i2c_dev->hw->regs->master_reset_cntrl);
 	fsleep(2);
 
-	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
+	i2c_writel(i2c_dev, 0x0, i2c_dev->hw->regs->master_reset_cntrl);
 	fsleep(2);
 
 	return 0;
@@ -776,8 +869,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_multi_master_mode)
 		val |= I2C_CNFG_MULTI_MASTER_MODE;
 
-	i2c_writel(i2c_dev, val, I2C_CNFG);
-	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
+	i2c_writel(i2c_dev, val, i2c_dev->hw->regs->cnfg);
+	i2c_writel(i2c_dev, 0, i2c_dev->hw->regs->int_mask);
 
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
@@ -822,12 +915,12 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
 				 i2c_dev->hw->clk_divisor_hs_mode) |
 		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE, non_hs_mode);
-	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
+	i2c_writel(i2c_dev, clk_divisor, i2c_dev->hw->regs->clk_divisor);
 
 	if (i2c_dev->hw->has_interface_timing_reg) {
 		val = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, thigh) |
 		      FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, tlow);
-		i2c_writel(i2c_dev, val, I2C_INTERFACE_TIMING_0);
+		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->interface_timing_0);
 	}
 
 	/*
@@ -835,7 +928,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 * Otherwise, preserve the chip default values.
 	 */
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
-		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
+		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->interface_timing_1);
 
 	/* Write HS mode registers. These will get used only for HS mode*/
 	if (i2c_dev->hw->enable_hs_mode_support) {
@@ -845,8 +938,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 
 		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
 			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
-		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
-		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
+		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->hs_interface_timing_0);
+		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->hs_interface_timing_1);
 	}
 
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
@@ -859,12 +952,12 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	}
 
 	if (!IS_DVC(i2c_dev) && !IS_VI(i2c_dev)) {
-		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
+		u32 sl_cfg = i2c_readl(i2c_dev, i2c_dev->hw->regs->sl_cnfg);
 
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
-		i2c_writel(i2c_dev, sl_cfg, I2C_SL_CNFG);
-		i2c_writel(i2c_dev, 0xfc, I2C_SL_ADDR1);
-		i2c_writel(i2c_dev, 0x00, I2C_SL_ADDR2);
+		i2c_writel(i2c_dev, sl_cfg, i2c_dev->hw->regs->sl_cnfg);
+		i2c_writel(i2c_dev, 0xfc, i2c_dev->hw->regs->sl_addr1);
+		i2c_writel(i2c_dev, 0x00, i2c_dev->hw->regs->sl_addr2);
 	}
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
@@ -872,7 +965,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 
 	if (i2c_dev->multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
-		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
+		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, i2c_dev->hw->regs->clken_override);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
 	if (err)
@@ -893,9 +986,9 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 	 */
 	udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->timings.bus_freq_hz));
 
-	cnfg = i2c_readl(i2c_dev, I2C_CNFG);
+	cnfg = i2c_readl(i2c_dev, i2c_dev->hw->regs->cnfg);
 	if (cnfg & I2C_CNFG_PACKET_MODE_EN)
-		i2c_writel(i2c_dev, cnfg & ~I2C_CNFG_PACKET_MODE_EN, I2C_CNFG);
+		i2c_writel(i2c_dev, cnfg & ~I2C_CNFG_PACKET_MODE_EN, i2c_dev->hw->regs->cnfg);
 
 	return tegra_i2c_wait_for_config_load(i2c_dev);
 }
@@ -915,10 +1008,10 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		return -EINVAL;
 
 	if (i2c_dev->hw->has_mst_fifo) {
-		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->mst_fifo_status);
 		rx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_RX, val);
 	} else {
-		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->fifo_status);
 		rx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_RX, val);
 	}
 
@@ -927,7 +1020,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	if (words_to_transfer > rx_fifo_avail)
 		words_to_transfer = rx_fifo_avail;
 
-	i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_transfer);
+	i2c_readsl(i2c_dev, buf, i2c_dev->hw->regs->rx_fifo, words_to_transfer);
 
 	buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
@@ -943,7 +1036,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		 * when (words_to_transfer was > rx_fifo_avail) earlier
 		 * in this function.
 		 */
-		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->rx_fifo);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
 		buf_remaining = 0;
@@ -968,10 +1061,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	u32 val;
 
 	if (i2c_dev->hw->has_mst_fifo) {
-		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->mst_fifo_status);
 		tx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_TX, val);
 	} else {
-		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->fifo_status);
 		tx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_TX, val);
 	}
 
@@ -1002,9 +1095,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
 		if (IS_VI(i2c_dev))
-			i2c_writesl_vi(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+			i2c_writesl_vi(i2c_dev, buf, i2c_dev->hw->regs->tx_fifo, words_to_transfer);
 		else
-			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+			i2c_writesl(i2c_dev, buf, i2c_dev->hw->regs->tx_fifo, words_to_transfer);
 
 		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	}
@@ -1026,7 +1119,7 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf_remaining = 0;
 		i2c_dev->msg_buf = NULL;
 
-		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->tx_fifo);
 	}
 
 	return 0;
@@ -1038,13 +1131,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	struct tegra_i2c_dev *i2c_dev = dev_id;
 	u32 status;
 
-	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
+	status = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_status);
 
 	if (status == 0) {
 		dev_warn(i2c_dev->dev, "IRQ status 0 %08x %08x %08x\n",
-			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
-			 i2c_readl(i2c_dev, I2C_STATUS),
-			 i2c_readl(i2c_dev, I2C_CNFG));
+			 i2c_readl(i2c_dev, i2c_dev->hw->regs->packet_transfer_status),
+			 i2c_readl(i2c_dev, i2c_dev->hw->regs->status),
+			 i2c_readl(i2c_dev, i2c_dev->hw->regs->cnfg));
 		i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
 		goto err;
 	}
@@ -1087,9 +1180,9 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		}
 	}
 
-	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
+	i2c_writel(i2c_dev, status, i2c_dev->hw->regs->int_status);
 	if (IS_DVC(i2c_dev))
-		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
+		writel_relaxed(DVC_STATUS_I2C_DONE_INTR, i2c_dev->base + DVC_STATUS);
 
 	/*
 	 * During message read XFER_COMPLETE interrupt is triggered prior to
@@ -1125,10 +1218,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->hw->supports_bus_clear)
 		tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
+	i2c_writel(i2c_dev, status, i2c_dev->hw->regs->int_status);
 
 	if (IS_DVC(i2c_dev))
-		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
+		writel_relaxed(DVC_STATUS_I2C_DONE_INTR, i2c_dev->base + DVC_STATUS);
 
 	if (i2c_dev->dma_mode) {
 		dmaengine_terminate_async(i2c_dev->dma_chan);
@@ -1148,9 +1241,9 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 	int err;
 
 	if (i2c_dev->hw->has_mst_fifo)
-		reg = I2C_MST_FIFO_CONTROL;
+		reg = i2c_dev->hw->regs->mst_fifo_control;
 	else
-		reg = I2C_FIFO_CONTROL;
+		reg = i2c_dev->hw->regs->fifo_control;
 
 	if (i2c_dev->dma_mode) {
 		if (len & 0xF)
@@ -1161,7 +1254,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			dma_burst = 8;
 
 		if (i2c_dev->msg_read) {
-			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
+			reg_offset = i2c_dev->hw->regs->rx_fifo;
 
 			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -1172,7 +1265,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			else
 				val = I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
 		} else {
-			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
+			reg_offset = i2c_dev->hw->regs->tx_fifo;
 
 			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -1215,7 +1308,7 @@ static unsigned long tegra_i2c_poll_completion(struct tegra_i2c_dev *i2c_dev,
 	ktime_t ktimeout = ktime_add_ms(ktime, timeout_ms);
 
 	do {
-		u32 status = i2c_readl(i2c_dev, I2C_INT_STATUS);
+		u32 status = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_status);
 
 		if (status)
 			tegra_i2c_isr(i2c_dev->irq, i2c_dev);
@@ -1274,14 +1367,14 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
 	val = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
-	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
+	i2c_writel(i2c_dev, val, i2c_dev->hw->regs->bus_clear_cnfg);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
 	if (err)
 		return err;
 
 	val |= I2C_BC_ENABLE;
-	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
+	i2c_writel(i2c_dev, val, i2c_dev->hw->regs->bus_clear_cnfg);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete, 50);
@@ -1292,7 +1385,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 		return -ETIMEDOUT;
 	}
 
-	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
+	val = i2c_readl(i2c_dev, i2c_dev->hw->regs->bus_clear_status);
 	if (!(val & I2C_BC_STATUS)) {
 		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
@@ -1317,14 +1410,14 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
 
 	packet_header = i2c_dev->msg_len - 1;
 
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
 
 	packet_header = I2C_HEADER_IE_ENABLE;
 
@@ -1352,7 +1445,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
 }
 
 static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
@@ -1473,7 +1566,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
 	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
-		i2c_readl(i2c_dev, I2C_INT_MASK));
+		i2c_readl(i2c_dev, i2c_dev->hw->regs->int_mask));
 
 	if (i2c_dev->dma_mode) {
 		time_left = tegra_i2c_wait_completion(i2c_dev,
@@ -1648,6 +1741,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
@@ -1680,6 +1774,7 @@ static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DVC,
+	.regs = &tegra20_dvc_i2c_regs,
 };
 #endif
 
@@ -1712,6 +1807,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1743,6 +1839,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1774,6 +1871,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1805,6 +1903,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
@@ -1837,6 +1936,7 @@ static const struct tegra_i2c_hw_feature tegra210_vi_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_VI,
+	.regs = &tegra210_vi_i2c_regs,
 };
 #endif
 
@@ -1869,6 +1969,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1902,6 +2003,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
@@ -1935,6 +2037,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra264_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1968,6 +2071,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra264_i2c_regs,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.43.0


