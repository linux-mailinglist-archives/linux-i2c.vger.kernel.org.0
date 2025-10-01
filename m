Return-Path: <linux-i2c+bounces-13288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F86BB11BA
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 17:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 103F9194683B
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 15:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A67F283FF1;
	Wed,  1 Oct 2025 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qDdL3eDt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50609279787;
	Wed,  1 Oct 2025 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759333053; cv=fail; b=XLY2n3iSn/j8YvTqQtFU42k38N4aMkL/D9roVbANDq1bRpON2URRiFwBDtD57+LNzTNet0+8Fv6trlbbJH1oDKFVxBpYahbo5TDyB1fptQBIMcmxVLSliZTD1Ib4EwC70sl3c0DIk03CYLmE75PDQxVgAuojpghluW0q5jjrInE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759333053; c=relaxed/simple;
	bh=ApfBCN3SDOZzGFmmQkdOQ1hrhnceu2/b3oLTiN8R6aw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RjYnynrJhWkn/GoKorFUwvA6t5wf27yO7sJTCl+9ZzfYm3sCemW1fL+0SSWH/0HjAYEZsRT3aeWIyh0v9xSG2goyjD9lHP/5qOSX6siEiwJLJVJN51WZIBqPiupYcH8ADAHYg9Akn169hgwAEnfCM1GHHzsN6GCdv5MilBANbuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qDdL3eDt; arc=fail smtp.client-ip=52.101.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8Iw6JZS+SrQuc6jkoDEyStLpL9LjTHf3+8110iam2KEAsqeVrYpL38HVOSegf9AGeEdpdB6mRS3rz6EtgTZ1GyqkDjYdP04ZYWIDek7vEK4MSyUVHNnI5BHGu/SgGzkCnv2wsTsXoGaMoRCOQ9L2m4OItJjMhXxL9eystZYfdXt3N0l/Y8RwB0OfBLSafL8SztGUNCQuPBrpztJta+2uHk/5kV8Siah+qmkfY4uHu6fvA7F4GcBPMv/PyGcGHhNrLwlYVUCQY5U1zkh3G63/sF7GHkioZlXjfJGHl4p1F3LSIB3Rg/UBmWqHACcrBFWypxnwVK5/UMRQvustKIRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieO13i4WjwWlEXnlylVJQI4PpcQdcb3k99Rlz55Jkac=;
 b=cPpuYwm6jzraPYh4/i1r5eZhYJRSyf4eLqDmEsJKIOk0/e2iN6mppsGaWo+Y2oPdDpjFlJbHRR7UbBiuA+NmuM50xCPq+DjZtq9XWBKgrwllF78jnLTrHHB1Cc56BSvuVp2E+h/cA5Yfa6m58SxH2m8ryFXFojKaLssN0HMrk+/Sy2SlUSKl9hZe32xK5Nfk59yiSyRlZxMxguYQFayDXTh04GDiPPG+PeISPKKDcozEfa+hC64EiL5rIPcfiVhRGnQyQKVgjpLPm37r7iecyRAsiS7nLocz0+2VnjNtS+kKWcf1Knl90Yr+RoKLZlk1aSZmMOE+GmRZOoDJgf2EGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieO13i4WjwWlEXnlylVJQI4PpcQdcb3k99Rlz55Jkac=;
 b=qDdL3eDtodLeq9IH3F6axsag7WX1YDgnETPLcSTLB1usP2nUeBpJYT9SQC2diPT9K++rsT7cp7De7p1f884EkqRm3/4LpWbvrHX4BgkS/vFWQ1q+OdRtxmahuElnSs6/AWuf8b7RpqxD+tTQvNQKrDTKrjF9B6La3LskOqKHN5Yn5DSFWa2a688YtK20IxRR8heCHW8zCfaQgpKyfU1ueQmD6AJ45sx17KNpUUVefmAKaivAhgdZy0az3ptKnmo3cSyH4dopdzWq0FHY0MeUedB2OYQZf/x2vffG9rUUycuROBquw9MqUMgm10Hb7ooGkHXJ6QLqIWfPtzWaJ3Gh1g==
Received: from CH0PR03CA0414.namprd03.prod.outlook.com (2603:10b6:610:11b::32)
 by CY5PR12MB6384.namprd12.prod.outlook.com (2603:10b6:930:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 15:37:16 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:11b:cafe::30) by CH0PR03CA0414.outlook.office365.com
 (2603:10b6:610:11b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Wed,
 1 Oct 2025 15:37:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.1 via Frontend Transport; Wed, 1 Oct 2025 15:37:14 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 1 Oct
 2025 08:37:00 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 08:36:59 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 08:36:55 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH 1/2] i2c: tegra: Add logic to support different register offsets
Date: Wed, 1 Oct 2025 21:06:47 +0530
Message-ID: <20251001153648.667036-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001153648.667036-1-kkartik@nvidia.com>
References: <20251001153648.667036-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|CY5PR12MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6e6a41-8ec9-48a6-fad5-08de0100653f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QaygtwqV4B3MprOI06ziaSmEWpBg5A5Qa4qf2TspF40X1/euRDPz1XjDdN1g?=
 =?us-ascii?Q?hF29SEaIX9W8VtbHRrjn+Qd3QRIGsuaEUvTgP4dN9MIpaSJ4vYxqijNWydeU?=
 =?us-ascii?Q?h1cVnid4FyPhxj/PvVREJBHOThfYEsJMljmu5JHzys77eClk1ORViTpuPaP+?=
 =?us-ascii?Q?yBml6RU6QFzLH/bcDC5SDW0jWW/TEo9ZmyeG9mhFznLc5sn+QGoV9eskoIDo?=
 =?us-ascii?Q?wKIt96xk2sJWPf6KFymrMn4242TyrD7ReEvWqFzO5YRE82qs44QhH6CSMSEi?=
 =?us-ascii?Q?9RwccnMryVmjjRLFXOnQMoDvWp/13L0J93TuUq5OrtH3QXSp1wYYEUJXdOO9?=
 =?us-ascii?Q?ZFqoTIcl8QcB07Ly1hXUEY38qolb2tNgBkskA6PVFnGVQsWBv28EBAjL7yNu?=
 =?us-ascii?Q?/2HdPPao7tC0w5H5dM8n0jhgsDsPf2Tqf+Xbs0RUpxvIBnbG3ZhSsyeHde7W?=
 =?us-ascii?Q?nuutiCJce6BNL3ozLTZLq5Tq4l/88lCCJryuP+yS9j5NDvAcA0It3iDclw2z?=
 =?us-ascii?Q?KvrJTwn/m5vIY3SoV1H2SVRfl9ok2IF1Fj1fw8BPaAEXZpYJdAvvbT1WDCGU?=
 =?us-ascii?Q?3cmqVMSLsHQeNtPBh59YLQg7g2D5HWcma2DvJxcme82H/GLgxmzU1AFhV0zT?=
 =?us-ascii?Q?vZ6Nj4xX4g9CsSyxK7T9okPH1Dpmp4nX0XCQxYsJ7IJmMJf0yellSzI4sWnG?=
 =?us-ascii?Q?DPl5jnr27zAzn616MF2qBFlYmjP4zskOgLSWQi1j/16A627lhXaSIkqETaiK?=
 =?us-ascii?Q?PpRRx6PuByi80v8l77Zt1JTuZSCfo0pxVN0IgSatTcwYlmmLxhwL7+xxgtGU?=
 =?us-ascii?Q?h0LZgqUtkzfDD3bH3yzkv3azT9DMjKufWoPgvjNEMos5htPXGsY4bOqQ+Lad?=
 =?us-ascii?Q?jR8wp9GHjbtmU96lZkYmqLp2AV5Q9lpWmGE+fLuJbb8p5gQZMk1evxHOHn6f?=
 =?us-ascii?Q?QeofUGf1z5zRdKaxsU5E4H25d+cNxtv5j2ZK5dAvVsOuxJH7hn51s1c58Guj?=
 =?us-ascii?Q?t38vYTJ01kXgttqO4coRDPlIHOjJwDKgMzk3+jnVpiEVf2efss5hnnnuScOA?=
 =?us-ascii?Q?qgYuv3JLuDNaAGbxZVja12cmjbFLlLYXxTDUAghOy7Qe5htQAL+ZMah6KPkb?=
 =?us-ascii?Q?x23275fS4iGyCNKdVF4syDQHVAjqtg20MnIoJcuL6TWas4p+0/hkI0ohMYW/?=
 =?us-ascii?Q?Nnzl6KFllW+HiiTY9OlI7IfiHjWFkUjYzvslkiKTm8PwkcI1VOGfE3PC4xii?=
 =?us-ascii?Q?yQDpGFV25U+/wnXStgbOJUNtlTlB5moq+v5mDZswNvfUvaXndWSx8B4bvKbG?=
 =?us-ascii?Q?Ioe5RCV/0Ls2TeyoyGYbvxObOHZMIEIggJ3yT20HRRRjFNGj+NvLVlT49y80?=
 =?us-ascii?Q?BKTHWmpJdUvPnOZtTYmYY0g7WhOnCeQlwscrz/HUO9TlSyHH4dfIW/pahXJS?=
 =?us-ascii?Q?cvALqKA7A2Vz9/+D2IdrFv3ft3/T1WxoOY1ABBShpoZnS2EgXeLbZV4IHam4?=
 =?us-ascii?Q?PhqiBi5sYsBlPWWLawxIbj28+xRk32Qo2d9aSBO11utacAe4DtryF/Ia2ZRY?=
 =?us-ascii?Q?jAbs7YZ6GzgG+bVCnsYHCfJDvAfttuQksnrKQuaC?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:37:14.2005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6e6a41-8ec9-48a6-fad5-08de0100653f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6384

Tegra410 use different offsets for existing I2C registers, update
the logic to use appropriate offsets per SoC.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 499 ++++++++++++++++++++++-----------
 1 file changed, 334 insertions(+), 165 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 038809264526..1e26d67cbd30 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -30,47 +30,35 @@
 
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
 
-#define DVC_CTRL_REG1				0x000
 #define DVC_CTRL_REG1_INTR_EN			BIT(10)
-#define DVC_CTRL_REG3				0x008
 #define DVC_CTRL_REG3_SW_PROG			BIT(26)
 #define DVC_CTRL_REG3_I2C_DONE_INTR_EN		BIT(30)
-#define DVC_STATUS				0x00c
+
 #define DVC_STATUS_I2C_DONE_INTR		BIT(30)
 
 #define I2C_ERR_NONE				0x00
@@ -94,50 +82,37 @@
 #define I2C_HEADER_HS_MODE			BIT(22)
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
-#define I2C_BUS_CLEAR_CNFG			0x084
 #define I2C_BC_SCLK_THRESHOLD			GENMASK(23, 16)
 #define I2C_BC_STOP_COND			BIT(2)
 #define I2C_BC_TERMINATE			BIT(1)
 #define I2C_BC_ENABLE				BIT(0)
-#define I2C_BUS_CLEAR_STATUS			0x088
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
@@ -159,6 +134,134 @@
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
+	unsigned int dvc_ctrl_reg1;
+	unsigned int dvc_ctrl_reg3;
+	unsigned int dvc_status;
+};
+
+static const struct tegra_i2c_regs tegra20_i2c_regs = {
+	.cnfg = 0x000,
+	.status = 0x01c,
+	.sl_cnfg = 0x020,
+	.sl_addr1 = 0x02c,
+	.sl_addr2 = 0x030,
+	.tlow_sext = 0x034,
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
+	.dvc_ctrl_reg1 = 0x000,
+	.dvc_ctrl_reg3 = 0x008,
+	.dvc_status = 0x00c,
+};
+
+static const struct tegra_i2c_regs tegra20_i2c_regs_dvc = {
+	.cnfg = 0x000 + 0x40,
+	.status = 0x01c + 0x40,
+	.sl_cnfg = 0x020 + 0x40,
+	.sl_addr1 = 0x02c + 0x40,
+	.sl_addr2 = 0x030 + 0x40,
+	.tlow_sext = 0x034 + 0x40,
+	.tx_fifo = 0x050 + 0x10,
+	.rx_fifo = 0x054 + 0x10,
+	.packet_transfer_status = 0x058 + 0x10,
+	.fifo_control = 0x05c + 0x10,
+	.fifo_status = 0x060 + 0x10,
+	.int_mask = 0x064 + 0x10,
+	.int_status = 0x068 + 0x10,
+	.clk_divisor = 0x06c + 0x10,
+	.bus_clear_cnfg = 0x084 + 0x40,
+	.bus_clear_status = 0x088 + 0x40,
+	.config_load = 0x08c + 0x40,
+	.clken_override = 0x090 + 0x40,
+	.interface_timing_0 = 0x094 + 0x40,
+	.interface_timing_1 = 0x098 + 0x40,
+	.hs_interface_timing_0 = 0x09c + 0x40,
+	.hs_interface_timing_1 = 0x0a0 + 0x40,
+	.master_reset_cntrl = 0x0a8 + 0x40,
+	.mst_fifo_control = 0x0b4 + 0x10,
+	.mst_fifo_status = 0x0b8 + 0x10,
+	.sw_mutex = 0x0ec + 0x40,
+	.dvc_ctrl_reg1 = 0x000,
+	.dvc_ctrl_reg3 = 0x008,
+	.dvc_status = 0x00c,
+};
+
+static const struct tegra_i2c_regs tegra20_i2c_regs_vi = {
+	.cnfg = 0x0c00 + (0x000 << 2),
+	.status = 0x0c00 + (0x01c << 2),
+	.sl_cnfg = 0x0c00 + (0x020 << 2),
+	.sl_addr1 = 0x0c00 + (0x02c << 2),
+	.sl_addr2 = 0x0c00 + (0x030 << 2),
+	.tlow_sext = 0x0c00 + (0x034 << 2),
+	.tx_fifo = 0x0c00 + (0x050 << 2),
+	.rx_fifo = 0x0c00 + (0x054 << 2),
+	.packet_transfer_status = 0x0c00 + (0x058 << 2),
+	.fifo_control = 0x0c00 + (0x05c << 2),
+	.fifo_status = 0x0c00 + (0x060 << 2),
+	.int_mask = 0x0c00 + (0x064 << 2),
+	.int_status = 0x0c00 + (0x068 << 2),
+	.clk_divisor = 0x0c00 + (0x06c << 2),
+	.bus_clear_cnfg = 0x0c00 + (0x084 << 2),
+	.bus_clear_status = 0x0c00 + (0x088 << 2),
+	.config_load = 0x0c00 + (0x08c << 2),
+	.clken_override = 0x0c00 + (0x090 << 2),
+	.interface_timing_0 = 0x0c00 + (0x094 << 2),
+	.interface_timing_1 = 0x0c00 + (0x098 << 2),
+	.hs_interface_timing_0 = 0x0c00 + (0x09c << 2),
+	.hs_interface_timing_1 = 0x0c00 + (0x0a0 << 2),
+	.master_reset_cntrl = 0x0c00 + (0x0a8 << 2),
+	.mst_fifo_control = 0x0c00 + (0x0b4 << 2),
+	.mst_fifo_status = 0x0c00 + (0x0b8 << 2),
+	.sw_mutex = 0x0c00 + (0x0ec << 2),
+	.dvc_ctrl_reg1 = 0x000,
+	.dvc_ctrl_reg3 = 0x008,
+	.dvc_status = 0x00c,
+};
+
 /*
  * msg_end_type: The bus control which needs to be sent at end of transfer.
  * @MSG_END_STOP: Send stop pulse.
@@ -219,6 +322,9 @@ enum msg_end_type {
  *		timing settings.
  * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
  * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
+ * @is_dvc: This instance represents the DVC I2C controller variant.
+ * @is_vi: This instance represents the VI I2C controller variant.
+ * @regs: Register offsets for the specific SoC variant.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -247,6 +353,9 @@ struct tegra_i2c_hw_feature {
 	bool has_interface_timing_reg;
 	bool has_hs_mode_support;
 	bool has_mutex;
+	bool is_dvc;
+	bool is_vi;
+	const struct tegra_i2c_regs *regs;
 };
 
 /**
@@ -262,8 +371,6 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @is_dvc: identifies the DVC I2C controller, has a different register layout
- * @is_vi: identifies the VI I2C controller, has a different register layout
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -316,12 +423,10 @@ struct tegra_i2c_dev {
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
-	bool is_dvc;
-	bool is_vi;
 };
 
-#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && (dev)->is_dvc)
-#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && (dev)->is_vi)
+#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && (dev)->hw->is_dvc)
+#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && (dev)->hw->is_vi)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -334,40 +439,26 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 	return readl_relaxed(i2c_dev->base + reg);
 }
 
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
@@ -388,12 +479,12 @@ static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, void *data,
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
@@ -404,7 +495,7 @@ static bool tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
 
 static bool tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	val = readl(i2c_dev->base + reg);
@@ -428,8 +519,8 @@ static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
 
 	if (i2c_dev->atomic_mode)
 		ret = read_poll_timeout_atomic(tegra_i2c_mutex_trylock, locked, locked,
-					       USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
-					       false, i2c_dev);
+				       USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
+				       false, i2c_dev);
 	else
 		ret = read_poll_timeout(tegra_i2c_mutex_trylock, locked, locked, USEC_PER_MSEC,
 					I2C_SW_MUTEX_TIMEOUT_US, false, i2c_dev);
@@ -442,7 +533,7 @@ static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	if (!i2c_dev->hw->has_mutex)
@@ -465,16 +556,16 @@ static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
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
@@ -602,14 +693,14 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
 
-	val = dvc_readl(i2c_dev, DVC_CTRL_REG3);
+	val = dvc_readl(i2c_dev, i2c_dev->hw->regs->dvc_ctrl_reg3);
 	val |= DVC_CTRL_REG3_SW_PROG;
 	val |= DVC_CTRL_REG3_I2C_DONE_INTR_EN;
-	dvc_writel(i2c_dev, val, DVC_CTRL_REG3);
+	dvc_writel(i2c_dev, val, i2c_dev->hw->regs->dvc_ctrl_reg3);
 
-	val = dvc_readl(i2c_dev, DVC_CTRL_REG1);
+	val = dvc_readl(i2c_dev, i2c_dev->hw->regs->dvc_ctrl_reg1);
 	val |= DVC_CTRL_REG1_INTR_EN;
-	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
+	dvc_writel(i2c_dev, val, i2c_dev->hw->regs->dvc_ctrl_reg1);
 }
 
 static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
@@ -618,34 +709,34 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 
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
@@ -664,11 +755,11 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
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
@@ -691,9 +782,9 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	if (!i2c_dev->hw->has_config_load_reg)
 		return 0;
 
-	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, i2c_dev->hw->regs->config_load);
 
-	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
+	err = tegra_i2c_poll_register(i2c_dev, i2c_dev->hw->regs->config_load, 0xffffffff,
 				      1000, I2C_CONFIG_LOAD_TIMEOUT);
 	if (err) {
 		dev_err(i2c_dev->dev, "failed to load config\n");
@@ -714,10 +805,10 @@ static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
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
@@ -758,8 +849,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_multi_master_mode)
 		val |= I2C_CNFG_MULTI_MASTER_MODE;
 
-	i2c_writel(i2c_dev, val, I2C_CNFG);
-	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
+	i2c_writel(i2c_dev, val, i2c_dev->hw->regs->cnfg);
+	i2c_writel(i2c_dev, 0, i2c_dev->hw->regs->int_mask);
 
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
@@ -801,12 +892,12 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -814,9 +905,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 * Otherwise, preserve the chip default values.
 	 */
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
-		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
+		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->interface_timing_1);
 
-	/* Write HS mode registers. These will get used only for HS mode*/
 	if (i2c_dev->hw->has_hs_mode_support) {
 		tlow = i2c_dev->hw->tlow_hs_mode;
 		thigh = i2c_dev->hw->thigh_hs_mode;
@@ -824,8 +914,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 
 		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
 			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
-		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
-		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
+		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->hs_interface_timing_0);
+		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->hs_interface_timing_1);
 	}
 
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
@@ -838,12 +928,12 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -851,7 +941,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 
 	if (i2c_dev->multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
-		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
+		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, i2c_dev->hw->regs->clken_override);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
 	if (err)
@@ -872,9 +962,9 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 	 */
 	udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->timings.bus_freq_hz));
 
-	cnfg = i2c_readl(i2c_dev, I2C_CNFG);
+	cnfg = i2c_readl(i2c_dev, i2c_dev->hw->regs->cnfg);
 	if (cnfg & I2C_CNFG_PACKET_MODE_EN)
-		i2c_writel(i2c_dev, cnfg & ~I2C_CNFG_PACKET_MODE_EN, I2C_CNFG);
+		i2c_writel(i2c_dev, cnfg & ~I2C_CNFG_PACKET_MODE_EN, i2c_dev->hw->regs->cnfg);
 
 	return tegra_i2c_wait_for_config_load(i2c_dev);
 }
@@ -894,19 +984,18 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
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
 
-	/* round down to exclude partial word at the end of buffer */
 	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
 	if (words_to_transfer > rx_fifo_avail)
 		words_to_transfer = rx_fifo_avail;
 
-	i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_transfer);
+	i2c_readsl(i2c_dev, buf, i2c_dev->hw->regs->rx_fifo, words_to_transfer);
 
 	buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
@@ -922,7 +1011,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		 * when (words_to_transfer was > rx_fifo_avail) earlier
 		 * in this function.
 		 */
-		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->rx_fifo);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
 		buf_remaining = 0;
@@ -947,10 +1036,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
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
 
@@ -981,9 +1070,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
 		if (IS_VI(i2c_dev))
-			i2c_writesl_vi(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+			i2c_writesl_vi(i2c_dev, buf, i2c_dev->hw->regs->tx_fifo, words_to_transfer);
 		else
-			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+			i2c_writesl(i2c_dev, buf, i2c_dev->hw->regs->tx_fifo, words_to_transfer);
 
 		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	}
@@ -1005,7 +1094,7 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf_remaining = 0;
 		i2c_dev->msg_buf = NULL;
 
-		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->tx_fifo);
 	}
 
 	return 0;
@@ -1017,13 +1106,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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
@@ -1062,13 +1151,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 				tegra_i2c_fill_tx_fifo(i2c_dev);
 			else
 				tegra_i2c_mask_irq(i2c_dev,
-						   I2C_INT_TX_FIFO_DATA_REQ);
+					   I2C_INT_TX_FIFO_DATA_REQ);
 		}
 	}
 
-	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
+	i2c_writel(i2c_dev, status, i2c_dev->hw->regs->int_status);
 	if (IS_DVC(i2c_dev))
-		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
+		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, i2c_dev->hw->regs->dvc_status);
 
 	/*
 	 * During message read XFER_COMPLETE interrupt is triggered prior to
@@ -1104,10 +1193,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->hw->supports_bus_clear)
 		tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
+	i2c_writel(i2c_dev, status, i2c_dev->hw->regs->int_status);
 
 	if (IS_DVC(i2c_dev))
-		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
+		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, i2c_dev->hw->regs->dvc_status);
 
 	if (i2c_dev->dma_mode) {
 		dmaengine_terminate_async(i2c_dev->dma_chan);
@@ -1120,16 +1209,16 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 }
 
 static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
-				       size_t len)
+			       size_t len)
 {
 	struct dma_slave_config slv_config = {0};
 	u32 val, reg, dma_burst, reg_offset;
 	int err;
 
 	if (i2c_dev->hw->has_mst_fifo)
-		reg = I2C_MST_FIFO_CONTROL;
+		reg = i2c_dev->hw->regs->mst_fifo_control;
 	else
-		reg = I2C_FIFO_CONTROL;
+		reg = i2c_dev->hw->regs->fifo_control;
 
 	if (i2c_dev->dma_mode) {
 		if (len & 0xF)
@@ -1140,7 +1229,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			dma_burst = 8;
 
 		if (i2c_dev->msg_read) {
-			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
+			reg_offset = i2c_dev->hw->regs->rx_fifo;
 
 			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -1151,7 +1240,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			else
 				val = I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
 		} else {
-			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
+			reg_offset = i2c_dev->hw->regs->tx_fifo;
 
 			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -1187,14 +1276,14 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 }
 
 static unsigned long tegra_i2c_poll_completion(struct tegra_i2c_dev *i2c_dev,
-					       struct completion *complete,
-					       unsigned int timeout_ms)
+			       struct completion *complete,
+			       unsigned int timeout_ms)
 {
 	ktime_t ktime = ktime_get();
 	ktime_t ktimeout = ktime_add_ms(ktime, timeout_ms);
 
 	do {
-		u32 status = i2c_readl(i2c_dev, I2C_INT_STATUS);
+		u32 status = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_status);
 
 		if (status)
 			tegra_i2c_isr(i2c_dev->irq, i2c_dev);
@@ -1253,14 +1342,14 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
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
@@ -1271,7 +1360,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 		return -ETIMEDOUT;
 	}
 
-	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
+	val = i2c_readl(i2c_dev, i2c_dev->hw->regs->bus_clear_status);
 	if (!(val & I2C_BC_STATUS)) {
 		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
@@ -1281,29 +1370,29 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 }
 
 static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
-					 struct i2c_msg *msg,
-					 enum msg_end_type end_state)
+				 struct i2c_msg *msg,
+				 enum msg_end_type end_state)
 {
 	u32 *dma_buf = i2c_dev->dma_buf;
 	u32 packet_header;
 
 	packet_header = FIELD_PREP(PACKET_HEADER0_HEADER_SIZE, 0) |
 			FIELD_PREP(PACKET_HEADER0_PROTOCOL,
-				   PACKET_HEADER0_PROTOCOL_I2C) |
+			   PACKET_HEADER0_PROTOCOL_I2C) |
 			FIELD_PREP(PACKET_HEADER0_CONT_ID, i2c_dev->cont_id) |
 			FIELD_PREP(PACKET_HEADER0_PACKET_ID, 1);
 
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
 
@@ -1331,7 +1420,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
 }
 
 static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
@@ -1361,8 +1450,8 @@ static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
 }
 
 static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
-			      struct i2c_msg *msg,
-			      enum msg_end_type end_state)
+		      struct i2c_msg *msg,
+		      enum msg_end_type end_state)
 {
 	unsigned long time_left, xfer_time = 100;
 	size_t xfer_size;
@@ -1413,7 +1502,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
 	 */
 	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
-				       i2c_dev->timings.bus_freq_hz);
+			       i2c_dev->timings.bus_freq_hz);
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
@@ -1452,12 +1541,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
 	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
-		i2c_readl(i2c_dev, I2C_INT_MASK));
+		i2c_readl(i2c_dev, i2c_dev->hw->regs->int_mask));
 
 	if (i2c_dev->dma_mode) {
 		time_left = tegra_i2c_wait_completion(i2c_dev,
-						      &i2c_dev->dma_complete,
-						      xfer_time);
+				      &i2c_dev->dma_complete,
+				      xfer_time);
 
 		/*
 		 * Synchronize DMA first, since dmaengine_terminate_sync()
@@ -1477,7 +1566,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	}
 
 	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
-					      xfer_time);
+				      xfer_time);
 
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
@@ -1623,7 +1712,75 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
 	.has_mutex = false,
+	.is_dvc = false,
+	.is_vi = false,
+	.regs = &tegra20_i2c_regs,
+};
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
+static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
+	.has_continue_xfer_support = false,
+	.has_per_pkt_xfer_complete_irq = false,
+	.clk_divisor_hs_mode = 3,
+	.clk_divisor_std_mode = 0,
+	.clk_divisor_fast_mode = 0,
+	.clk_divisor_fast_plus_mode = 0,
+	.has_config_load_reg = false,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = false,
+	.has_mst_fifo = false,
+	.has_mst_reset = false,
+	.quirks = &tegra_i2c_quirks,
+	.supports_bus_clear = false,
+	.has_apb_dma = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_fastplus_mode = 0x4,
+	.thigh_fast_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0x0,
+	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_hs_mode = 0x0,
+	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
+	.has_mutex = false,
+	.is_dvc = true,
+	.is_vi = false,
+	.regs = &tegra20_i2c_regs_dvc,
+};
+#endif
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+static const struct tegra_i2c_hw_feature tegra210_vi_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x19,
+	.clk_divisor_fast_mode = 0x19,
+	.clk_divisor_fast_plus_mode = 0x10,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = true,
+	.has_mst_fifo = false,
+	.has_mst_reset = false,
+	.quirks = &tegra_i2c_quirks,
+	.supports_bus_clear = true,
+	.has_apb_dma = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_fastplus_mode = 0x4,
+	.thigh_fast_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0,
+	.setup_hold_time_fast_fast_plus_mode = 0,
+	.setup_hold_time_hs_mode = 0,
+	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
+	.has_mutex = false,
+	.is_dvc = false,
+	.is_vi = true,
+	.regs = &tegra20_i2c_regs_vi,
 };
+#endif
+
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_continue_xfer_support = true,
@@ -1650,6 +1807,9 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
 	.has_mutex = false,
+	.is_dvc = false,
+	.is_vi = false,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1677,6 +1837,9 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
 	.has_mutex = false,
+	.is_dvc = false,
+	.is_vi = false,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1704,6 +1867,9 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
 	.has_mutex = false,
+	.is_dvc = false,
+	.is_vi = false,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1731,6 +1897,9 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
 	.has_mutex = false,
+	.is_dvc = false,
+	.is_vi = false,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1758,6 +1927,9 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
 	.has_mutex = false,
+	.is_dvc = false,
+	.is_vi = false,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1787,6 +1959,9 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
 	.has_mutex = false,
+	.is_dvc = false,
+	.is_vi = false,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
@@ -1840,6 +2015,9 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
 	.has_mutex = true,
+	.is_dvc = false,
+	.is_vi = false,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1848,7 +2026,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_vi_i2c_hw, },
 #endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
@@ -1856,7 +2034,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
-	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_dvc_i2c_hw, },
 #endif
 	{},
 };
@@ -1864,21 +2042,12 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
 static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
-	struct device_node *np = i2c_dev->dev->of_node;
 	bool multi_mode;
 
 	i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
 
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->is_dvc = true;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->is_vi = true;
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.43.0


