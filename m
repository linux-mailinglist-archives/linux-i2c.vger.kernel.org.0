Return-Path: <linux-i2c+bounces-15131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0A2D1A840
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 18:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 868383064A9E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D75C350295;
	Tue, 13 Jan 2026 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k9/xAaWp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FA9AD5A;
	Tue, 13 Jan 2026 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323632; cv=fail; b=UiBSWcy/OpxOMry3St0iI0H6o+mjpt2TOC0nEDPst9PAMqE4W+/Txbff1m8my2PXem7D2QCzxBYIuHdA4PVZ5IUMqzz5wVo7rfPwve2gNnBJpmStRqFPoSlfc7OyerH8t28TjNucoED08uVmGIirih9loAwcqqQ0mlp78JGs8Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323632; c=relaxed/simple;
	bh=6ux/qE0nM0WaR8A2uY/vCQnGbe6CONfI1otkATuFPVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TsdYq0yaXSiEdf93Oj4YnaNocUjGKAuBc9UQ2aLZiE9YqiGeQMI9zArmrYpq/cPe0PPlO2IFXt/8YCChue5CPWSs98r91HN7D9QyfzSDjlBalKLDgJKJxuq0Cet44LRLQqmDej/lse/p98H4FA7uf2AxMCAtA5JZyzJTPWcZ7A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k9/xAaWp; arc=fail smtp.client-ip=52.101.56.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1XTPE9IqIF5WoaS7TqS/H6JDmquNCoFUmp1sHvvSQYCWsOvKlOB8qgdF9Yo/OO/3RM/XbYQflTYYITVWJ5k0SLjzYuXmaw3+/saWUcD0+kFR3aqAF2HGCGsOG9FrBXDByxFud2+1xcrW2xDgUZGSUncv8grZs2yV4Vn/VAEpAYSa6l+UwoGZj9iIWzwL8kXNc68yie5LZICadtbZtfUis6+fQcFQlYoavDrQhzCEq832qsv8piVUXN8lwup5WpvzHyUyxwtlBh6BDiDOjbMEgU2hZl8Z09Odef2HOCdKjsdpVJYUU0wxu2+L7Gel3wK+52gp0GeSaPXc6oFchdE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jR6H+T4nk1t9B33E8voN1dRGhE54TIUQsz2g98mbHA=;
 b=zNtmzNOoF+h6gJd1FQvXzkXQ71gjc3M5XAK5cdQUXBh+ZbfoM0wy1efAQ+S8LWGEkLypSaryuSs8xy2TE2fMfvtV/zplkGOPlXFnhDn4fJfLEu5NhJXh0YtzWy4TO7E+zIcIdiHQ8LxOUMe4ZNe/4a6IuJGX7GZep2g8h56RwtCT9Zxc79OXhkZrTLsSQQ5cCRUpIXWM2JnK5zmixcO9h5RDjF32mUP7uaIlm8/sFu67xzhlc8D2CmeDSR8zIBe7qr4H0UId+8A+fovavp4GyRshNFuocxC7pUgzpq+3IzMB/fam0lXraV4gz7SmmuQLgxYT4kCHJGe6/eOPNTYLAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jR6H+T4nk1t9B33E8voN1dRGhE54TIUQsz2g98mbHA=;
 b=k9/xAaWpA4tEU9LHwNQGaBVZM6U/WE/98BroyqQzonmPBV6TlXoJYtykImMwmk4ZlL8KZcKIbcF0wNZiynEf5+zN7rUJj5bTACNK7iGhDKLqMFGg1x9mP7zmJOgYsSgUveXXBlCa7L//ieCPPT1WvA7y2AFK+d/T1mFnxgQOtyZKrmDLyPxqXbYA+8/8n+XQQKwaeeLRNuyiGqiFEPkFtflvYq59MpdmuN9oclW0ZijJIp4OVfJaX+Pj4fjxHJxWyHkN7oDZCReMk56ektM93S53mHn9/cVhH0MZPc5jfFUjhC/ydnQ7nw9757UFgLFqCgrHEu29CJ+9fSMxFEkDWA==
Received: from PH7PR17CA0036.namprd17.prod.outlook.com (2603:10b6:510:323::20)
 by MN6PR12MB8591.namprd12.prod.outlook.com (2603:10b6:208:471::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 17:00:14 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::d6) by PH7PR17CA0036.outlook.office365.com
 (2603:10b6:510:323::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.8 via Frontend Transport; Tue,
 13 Jan 2026 17:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 17:00:12 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:59:47 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:59:47 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 08:59:44 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v7 3/4] i2c: tegra: Add logic to support different register offsets
Date: Tue, 13 Jan 2026 22:29:28 +0530
Message-ID: <20260113165929.43888-4-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|MN6PR12MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: 451b946c-d4b8-4308-1d16-08de52c53747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oH5JKRG/Mr82sq4miJtAXU5uzxyo3Z6mq2Nhedzvt44j0mmv4Y4JtmLlGaSY?=
 =?us-ascii?Q?ZazulKky6hkKt5XaLcR/YL4e6GvaQOx/WNULLJdU3oX1kJZHnGjoi84v5mcE?=
 =?us-ascii?Q?s2Bom9rVkJrETZAHnirbr592f8TfoIl4BTYPQ7qymVpKBrQKYwEAvCIbQEgM?=
 =?us-ascii?Q?tsbdu45Y2j+q/498daUcm18c+7wUJfaYJz1HMrV/R9eYK0x+f2mp3aTC0RAg?=
 =?us-ascii?Q?9qm2N7ugMnznzVJnZ8n/kpNVVDN+qBPHLN43g/P0h8rn386RjPP3jHbdUL90?=
 =?us-ascii?Q?b1zeK77bEzsTG+2Cw0DHY5TVjujxJhZeYRDWqCFjuihqwiNRdIYNPh5ByTt9?=
 =?us-ascii?Q?VGlM01g+4A1CZNhZOPdG9OB+vdV2i/cAKsNXm1hugLTEEGR35cph0wSbE1BT?=
 =?us-ascii?Q?OOojCSbKwshagAWe3RTruhMM4bm6ALAHXpGMLIU+haNPUL1fmxD37OTFdtOA?=
 =?us-ascii?Q?73PsS7QISJlGTFx3AY5oBy0ndgtNUI9IB3syHZp4CNkaoHn4h79HEx2sFyfj?=
 =?us-ascii?Q?u8wFF4jGlX6hCfXRnugOr8SBrxxkxIM5IJFds44pkqPEO4FCkI5UdtrNRAFi?=
 =?us-ascii?Q?hpq0mQEmpwGMcKZ+pRfMeY8qwu2k860j7ufyEr0PNXnqXDeNyJAKnLCO3kA0?=
 =?us-ascii?Q?OZbqGwmV3/ckKXsy/4NG3KysHWf01XB/098cDEQ5IS6XSP9eB3bkC3mYJvfG?=
 =?us-ascii?Q?gQSaIJZgRgKvK2IGtv8YE77RD0Pu88DffQKtBkM1qz/KVCbfPJhr0AIw/ukN?=
 =?us-ascii?Q?KvcsGIl8qSqwtGiO6Rdvo3jng47qqPbuXrFtrgjfndobnPvxaIHQtZHe16M8?=
 =?us-ascii?Q?Nao/B95jZUlnZAxSYwBlxRd7Nbtidnrj8JM7ZuwlI1hiuF/blJVg+q7oJec3?=
 =?us-ascii?Q?lT83afNLk+MmREYb8rsC3p/LgF7ZmlYKH4AViaYoo9aD6JqSL3qWugta0O75?=
 =?us-ascii?Q?QoPQfDUGVHxnzPmXw3BiqHtWF7QUh2A3IeE0mz0UlfWlPzhK/0xcbCcHb2Co?=
 =?us-ascii?Q?flh4t8xLfhdmR0Qw7tROEHcIC99y3JyclfR7IFki78EPyJRQJJdxLgfd1zco?=
 =?us-ascii?Q?LTkZKsz300fPLUv9yVHgY3/4AhY7ZUFpYSGIwYz9X9Fj9L/+uZtBlSXqPbBx?=
 =?us-ascii?Q?RCtuMoaxDn36q5MqiBjLQl3Z8Qc+7KpyZ0/5iiCHiNW0etsuvNAA+8azWBa8?=
 =?us-ascii?Q?X6EO/U3ZsjxYbIKybRaINNf1Fw2hEB8kUoiWHZWYR//BQE8rLfXd2Ob95stE?=
 =?us-ascii?Q?8bZmbRGq5dXQyK55azoTLAHzLUk46xqBGqJWfEs3Ojt+oHNAy+QtoQ2JZa4N?=
 =?us-ascii?Q?R7kNdMvtL/ZFyqtqdXfrABWDoXySoYfuXGJtsLrmdq9EB14BbnTwCXDFmH4K?=
 =?us-ascii?Q?ICEiz3QbmPKZnirFDOANTCUEqS7kFvsztW7kRcJBMPfbPzR6vUar+JKJgGVj?=
 =?us-ascii?Q?cQO97np+2na2RmQYWODL6egG1aNDFkryQ1jjNA26nl2PDzXZnI0keEJQgNx+?=
 =?us-ascii?Q?+QzOYIoZZh+PeDVceD9LDSO6bIrFVqgZ6SYMMgwIOa9YGRE1EngDBWjSAnyW?=
 =?us-ascii?Q?UfTb1+kthjyMnX+kG6qkFqV6Y7LBJleXKsrEuCkS?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:00:12.1197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 451b946c-d4b8-4308-1d16-08de52c53747
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8591

Tegra410 use different offsets for existing I2C registers, update
the logic to use appropriate offsets per SoC.

As the registers offsets are now also defined for dvc and vi, following
function are not required and they are removed:
 - tegra_i2c_reg_addr(): No translation required.
 - dvc_writel(): Replaced with i2c_writel() with DVC check.
 - dvc_readl(): Replaced with i2c_readl().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
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
 drivers/i2c/busses/i2c-tegra.c | 368 +++++++++++++++++++++------------
 1 file changed, 239 insertions(+), 129 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index cb6455fb3ee1..e9d0a5c40cd3 100644
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
@@ -348,45 +466,26 @@ static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 	writel_relaxed(val, i2c_dev->base + reg);
 }
 
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
@@ -407,12 +506,12 @@ static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, void *data,
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
@@ -423,7 +522,7 @@ static bool tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
 
 static bool tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	val = readl(i2c_dev->base + reg);
@@ -461,7 +560,7 @@ static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	if (!i2c_dev->hw->has_mutex)
@@ -484,16 +583,16 @@ static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
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
@@ -621,12 +720,12 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
 
-	val = dvc_readl(i2c_dev, DVC_CTRL_REG3);
+	val = i2c_readl(i2c_dev, DVC_CTRL_REG3);
 	val |= DVC_CTRL_REG3_SW_PROG;
 	val |= DVC_CTRL_REG3_I2C_DONE_INTR_EN;
 	dvc_writel(i2c_dev, val, DVC_CTRL_REG3);
 
-	val = dvc_readl(i2c_dev, DVC_CTRL_REG1);
+	val = i2c_readl(i2c_dev, DVC_CTRL_REG1);
 	val |= DVC_CTRL_REG1_INTR_EN;
 	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
 }
@@ -637,34 +736,34 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 
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
@@ -683,11 +782,11 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
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
@@ -710,9 +809,9 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	if (!i2c_dev->hw->has_config_load_reg)
 		return 0;
 
-	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, i2c_dev->hw->regs->config_load);
 
-	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
+	err = tegra_i2c_poll_register(i2c_dev, i2c_dev->hw->regs->config_load, 0xffffffff,
 				      1000, I2C_CONFIG_LOAD_TIMEOUT);
 	if (err) {
 		dev_err(i2c_dev->dev, "failed to load config\n");
@@ -733,10 +832,10 @@ static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
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
@@ -778,8 +877,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_multi_master_mode)
 		val |= I2C_CNFG_MULTI_MASTER_MODE;
 
-	i2c_writel(i2c_dev, val, I2C_CNFG);
-	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
+	i2c_writel(i2c_dev, val, i2c_dev->hw->regs->cnfg);
+	i2c_writel(i2c_dev, 0, i2c_dev->hw->regs->int_mask);
 
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
@@ -824,12 +923,12 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -837,7 +936,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 * Otherwise, preserve the chip default values.
 	 */
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
-		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
+		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->interface_timing_1);
 
 	/* Write HS mode registers. These will get used only for HS mode*/
 	if (i2c_dev->hw->enable_hs_mode_support) {
@@ -847,8 +946,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 
 		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
 			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
-		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
-		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
+		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->hs_interface_timing_0);
+		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->hs_interface_timing_1);
 	}
 
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
@@ -861,12 +960,12 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -874,7 +973,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 
 	if (i2c_dev->multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
-		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
+		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, i2c_dev->hw->regs->clken_override);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
 	if (err)
@@ -895,9 +994,9 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 	 */
 	udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->timings.bus_freq_hz));
 
-	cnfg = i2c_readl(i2c_dev, I2C_CNFG);
+	cnfg = i2c_readl(i2c_dev, i2c_dev->hw->regs->cnfg);
 	if (cnfg & I2C_CNFG_PACKET_MODE_EN)
-		i2c_writel(i2c_dev, cnfg & ~I2C_CNFG_PACKET_MODE_EN, I2C_CNFG);
+		i2c_writel(i2c_dev, cnfg & ~I2C_CNFG_PACKET_MODE_EN, i2c_dev->hw->regs->cnfg);
 
 	return tegra_i2c_wait_for_config_load(i2c_dev);
 }
@@ -917,10 +1016,10 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
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
 
@@ -929,7 +1028,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	if (words_to_transfer > rx_fifo_avail)
 		words_to_transfer = rx_fifo_avail;
 
-	i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_transfer);
+	i2c_readsl(i2c_dev, buf, i2c_dev->hw->regs->rx_fifo, words_to_transfer);
 
 	buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
@@ -945,7 +1044,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		 * when (words_to_transfer was > rx_fifo_avail) earlier
 		 * in this function.
 		 */
-		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->rx_fifo);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
 		buf_remaining = 0;
@@ -970,10 +1069,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
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
 
@@ -1004,9 +1103,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
 		if (IS_VI(i2c_dev))
-			i2c_writesl_vi(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+			i2c_writesl_vi(i2c_dev, buf, i2c_dev->hw->regs->tx_fifo, words_to_transfer);
 		else
-			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+			i2c_writesl(i2c_dev, buf, i2c_dev->hw->regs->tx_fifo, words_to_transfer);
 
 		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	}
@@ -1028,7 +1127,7 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf_remaining = 0;
 		i2c_dev->msg_buf = NULL;
 
-		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->tx_fifo);
 	}
 
 	return 0;
@@ -1040,13 +1139,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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
@@ -1089,7 +1188,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		}
 	}
 
-	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
+	i2c_writel(i2c_dev, status, i2c_dev->hw->regs->int_status);
 	if (IS_DVC(i2c_dev))
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
@@ -1127,7 +1226,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->hw->supports_bus_clear)
 		tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
+	i2c_writel(i2c_dev, status, i2c_dev->hw->regs->int_status);
 
 	if (IS_DVC(i2c_dev))
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
@@ -1150,9 +1249,9 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 	int err;
 
 	if (i2c_dev->hw->has_mst_fifo)
-		reg = I2C_MST_FIFO_CONTROL;
+		reg = i2c_dev->hw->regs->mst_fifo_control;
 	else
-		reg = I2C_FIFO_CONTROL;
+		reg = i2c_dev->hw->regs->fifo_control;
 
 	if (i2c_dev->dma_mode) {
 		if (len & 0xF)
@@ -1163,7 +1262,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			dma_burst = 8;
 
 		if (i2c_dev->msg_read) {
-			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
+			reg_offset = i2c_dev->hw->regs->rx_fifo;
 
 			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -1174,7 +1273,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			else
 				val = I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
 		} else {
-			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
+			reg_offset = i2c_dev->hw->regs->tx_fifo;
 
 			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -1217,7 +1316,7 @@ static unsigned long tegra_i2c_poll_completion(struct tegra_i2c_dev *i2c_dev,
 	ktime_t ktimeout = ktime_add_ms(ktime, timeout_ms);
 
 	do {
-		u32 status = i2c_readl(i2c_dev, I2C_INT_STATUS);
+		u32 status = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_status);
 
 		if (status)
 			tegra_i2c_isr(i2c_dev->irq, i2c_dev);
@@ -1276,14 +1375,14 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
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
@@ -1294,7 +1393,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 		return -ETIMEDOUT;
 	}
 
-	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
+	val = i2c_readl(i2c_dev, i2c_dev->hw->regs->bus_clear_status);
 	if (!(val & I2C_BC_STATUS)) {
 		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
@@ -1319,14 +1418,14 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
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
 
@@ -1354,7 +1453,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
 }
 
 static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
@@ -1475,7 +1574,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
 	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
-		i2c_readl(i2c_dev, I2C_INT_MASK));
+		i2c_readl(i2c_dev, i2c_dev->hw->regs->int_mask));
 
 	if (i2c_dev->dma_mode) {
 		time_left = tegra_i2c_wait_completion(i2c_dev,
@@ -1650,6 +1749,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
@@ -1682,6 +1782,7 @@ static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DVC,
+	.regs = &tegra20_dvc_i2c_regs,
 };
 #endif
 
@@ -1714,6 +1815,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1745,6 +1847,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1776,6 +1879,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1807,6 +1911,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
@@ -1839,6 +1944,7 @@ static const struct tegra_i2c_hw_feature tegra210_vi_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_VI,
+	.regs = &tegra210_vi_i2c_regs,
 };
 #endif
 
@@ -1871,6 +1977,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1904,6 +2011,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
@@ -1937,6 +2045,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra264_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1970,6 +2079,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra264_i2c_regs,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.43.0


