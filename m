Return-Path: <linux-i2c+bounces-14091-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8700EC5FFEB
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 05:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFA033BD50B
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 04:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795D022D781;
	Sat, 15 Nov 2025 04:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rMajnQv6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010067.outbound.protection.outlook.com [52.101.193.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7411311CBA;
	Sat, 15 Nov 2025 04:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763180901; cv=fail; b=epYXww2+R9ekpE2t1Iz6tjcEHUAdabyPZJ1fohTku05y9gIQpDbfGtMw3g1QkKwG6f9lk4mpFlzhO4nj2j4s+b1iaNeGPZteunrkng+T4HPyyjjK708gtEwMIs89GGW5sSddQ+AJ4rH1Re2dLNrh8QVMRtYvhVwC7vxY7B2oJCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763180901; c=relaxed/simple;
	bh=Bpo5Mb1fY4FG5oKP+/LT81uvNLq1AAceC15uvn6NLIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AHmO3kLdGzB89c+kaEomRZ+phBXVllMEjoWBc0B/rsOOZRzFbvqY3wEyYLAItdwqAOOjYyKe3mngufWCka33m5nYRHjwSBkNHEYodNN+txYmeIGzEghc3AQV0Dl5ZKJqex5WSbVsJiKTSX2j5VZmAfQinn0gp7CwPQtPjsI2Bzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rMajnQv6; arc=fail smtp.client-ip=52.101.193.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKCwkSj7vBvhBjhxk+OMxLmxguKAtTjuGDfb1EALzpNMRNV87xs3Sq2pzCR0pSndg3T1/t/SyCkN7fY5yM6hp1a0jOEVq1qKCb/FgIvTrtaNw9Y3igEOWM8N+8x0MlakQoY41bE2ksHWn+bVNzVgbhe2HWziuVLf51qKqgLBcO3LDf0EP6OWVll70npYOit4GCik/7fCeadEUVc3MBpftUpxS8qj9SSzNaO+P3i3aADR7Uz3qKJ3upUYbqaKhd85jZ6wJYNPbAc9a2AH/5kjBy0DsYJ+tDsjSjQniMYY89wUiwdHKZgCGMlqiu8jmrAc3zjkVV0dwFUwLDN9muOR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ARkiUNhiyRiDFLZOB/kd3t5WGUhYXY4ipmwigypWLg=;
 b=TTAu1d7Zc8yXuCzTbg41n8W7WZSU0TERDGYVGXyOIs7rGd9BfD2nxQlh7NDD8ahIkWIZjbJIKul5Oit0qkQuvaeSxm9EUB08MR62x+LWnezJb68UqltkjuRwIRK78GvIFOl2xIdd2Dv+BnqYHGmXyVqEPAVjuk6NYIK9TO49KelIU6DWZwqwis7ueQmCjDOgs1BlzLbTgzIjySwDE4ahPZtVxAyH8PZYkDwzms0E83+JVOYGZC4FPZloYzFte1rjkxm9otn93xYV5ydBQ8t9vyTlxWeOpe6zoAhn2pDDYsqT+V0QwTczW92Am+Ft+FW5CyQ4z3rI282+f0hq739vZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ARkiUNhiyRiDFLZOB/kd3t5WGUhYXY4ipmwigypWLg=;
 b=rMajnQv6WysH2n96yU1xSUFNDFPm9+FtFUrNwBX4qIKCWhKZWEYmfliyh7Xj1THW6lsK4TJ6LMxaMYbrCi5e1WwWemtVtmusJ+YmekLosId/ocWAxsUqH7V1SMfjBpTzqhVRitsW+QvcT2DTf/7IBjcGl4KLAfkD6Xpi237DgKkIdXf2Z6/LEBrLNiyozkcEZ98hEVBdNzJ8lvJple2qnEiDjXnC58j5266cy9L0G0aL88RluV9RPkRGt14BE7FN4YqrX8NNW0V8T5CPOFqSyDiQ+gIP345bYeCXUCIm3MPt044Y1IDEjGQh2jBsOtxycwS30MyBS+HHWWCLE78iEg==
Received: from BLAPR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:36e::29)
 by DS0PR12MB9324.namprd12.prod.outlook.com (2603:10b6:8:1b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 04:28:14 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::33) by BLAPR05CA0017.outlook.office365.com
 (2603:10b6:208:36e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.8 via Frontend Transport; Sat,
 15 Nov 2025 04:28:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 04:28:14 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:27:58 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:27:57 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 20:27:53 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v12 4/6] i2c: tegra: Add HS mode support
Date: Sat, 15 Nov 2025 09:56:30 +0530
Message-ID: <20251115042632.69708-5-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251115042632.69708-1-akhilrajeev@nvidia.com>
References: <20251115042632.69708-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|DS0PR12MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d1f2f5-421b-4220-c0f7-08de23ff649c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EjpZ94ZDBVR+IpDDk04+K/aIFl/cg7ApOXGIESul5EROFnoQCQWs+hB+296D?=
 =?us-ascii?Q?xY3M0ekRqOQCwfIc26JIrmCbidSNEmCyKF5Xj3udBRE/JW401ZOtO+IV0wJL?=
 =?us-ascii?Q?gHVagTG/eyndyvbeAJiYMkUTg5tvCagjCQOW3yVTYRGA3W2Whk1e4KVJDtk2?=
 =?us-ascii?Q?8Ni3BptqT9/XfpXorEjRrwcmEmnq2D62cSqUa1lEX06c/pOztiZg0fOrxZdA?=
 =?us-ascii?Q?VKpKbeO2d1n4+hRYnQZDE/g/7VIlbCTXx39ohgSXHnIZR7C/Jr520Q/XJy5M?=
 =?us-ascii?Q?niRVk1O+HrSPaVjCZhs04QCAvQVqQVTErIHsbC8vwok3F5vONrCjJNZLObGW?=
 =?us-ascii?Q?SmQDyWRTwiLp/4IUGWOwyTHr3do3b3HB68MnM6owY2HZVo4aZ4pVpRYPLxA8?=
 =?us-ascii?Q?KoUZ+J2E3ljGDQb3L6Dg6PPDb43czyBvRQgS2e9Ks37+fBvLzm37SMlfFR4v?=
 =?us-ascii?Q?hjJG+YkVsz7by5wubAKYn/1/lwB11v6XIyH+V6Hf/3ASDdoivzt28wdtlxTS?=
 =?us-ascii?Q?YUAqYJJfN9i7BphwJX6jLGRz3cnn3cJgTQl8DEG8+jXZgefwrgt1/wLJ/eF3?=
 =?us-ascii?Q?CQPlyYox8w5rrCdYLxy4BYN5g0PTA0xBPeo1jiobCQ7UBMqyj9bm2i8TItYD?=
 =?us-ascii?Q?GB1NNmwZSktE8k4KA4zHAASzvE3725GpvV3Y5jsnYaqhwSwxybV/CEL/YV4j?=
 =?us-ascii?Q?K5wa/Nj2x+uCaUelbTSr/OPbHehuWsDnplM09c0Cg/I52GJpWKZ0ibXonnHu?=
 =?us-ascii?Q?3ysITUrHXrfw6qVo/82kqA9HDgw/JzM34mFkaz4/Sci/5kEpXP4rtdroBZBR?=
 =?us-ascii?Q?zKFZ0EQDToUNyr/5CBClfKN8z3r0GizAexDmdO9wfaMBdijyEy+9H4dF6tT2?=
 =?us-ascii?Q?Ebpez+yzl3MCM5l9bfgk5ASqlakK8Lu9/od4d47W76cgVacPeknGYRTux/rI?=
 =?us-ascii?Q?sTEB9XDb2CbrErDRXPZ81ZNFDUfy0dkYOkEmOd9RbeycFL04b5RCQSji79xf?=
 =?us-ascii?Q?jjq9xdfMrbx1Y40TQZJ/q6KSRcTPmC2w4HmjjzMWB7EVQ5HNohAL9FS0Cg5H?=
 =?us-ascii?Q?7lx6p+6TwBciS/Y1t+r7mt8M4cf9frbmHAXPsS8RxWQesJ87yWfyaV/8xHK5?=
 =?us-ascii?Q?mBbgs+pXJmS2oRo59w5bhRWlCnF0TI9Ac2jZc7Ta2pOKCTB/YlN8L+Vq8yq7?=
 =?us-ascii?Q?NVOP3twouiviqtG6cOo4/qtaaOXxVmiPjD0RF2LEXgdIDwBoxsB5MnL52mba?=
 =?us-ascii?Q?pHmUvBj/a1VrA/E32rXS/ffzxD8F1mv21cjd8q592c/zIw6IVRtAnZ6vbQMw?=
 =?us-ascii?Q?ahkyXc8Xn1+OR6yNTkjuBFHKsiAgTmFlVcxbqjutW4tL4SWGeTyDAth3SRzf?=
 =?us-ascii?Q?wj7dK9Hs69Ldp2AGzAteMDfKFb6KxLYn/h4hAL8NCFmw26VjWPfQguu1063L?=
 =?us-ascii?Q?PmAf/Yx22qWv2o7WZKlKF/NdD1iNi/qe7ug4b/7Z+R5pvCkfq55BTVgItxwx?=
 =?us-ascii?Q?N0x0Un3ZE1k4oh92hxnCWvy9Y8+gNLjZKBtcQpniBP6i7dabIJ2XYay1zYrt?=
 =?us-ascii?Q?Y2BC1S0TVa5YzumyuNoFSEJQOOSpF4RU2PxBCSvs?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 04:28:14.2816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d1f2f5-421b-4220-c0f7-08de23ff649c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9324

Add support for HS (High Speed) mode transfers, which is supported by
Tegra194 onwards. Also adjust the bus frequency such that it uses the
fast plus mode when HS mode is not supported.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v10 -> v12:
	* Update bus_freq_hz to max supported freq and updates to
	  accomodate the changes from Patch 2/6.
v10 -> v11: 
	* Update the if condition as per the comments received on:
	  https://lore.kernel.org/linux-tegra/20251110080502.865953-1-kkartik@nvidia.com/T/#t
v9 -> v10:
        * Change switch block to an if-else block.
v5 -> v9:
        * In the switch block, handle the case when hs mode is not
          supported. Also update it to use Fast mode for master code
          byte as per the I2C spec for HS mode.
v3 -> v5:
        * Set has_hs_mode_support to false for unsupported SoCs.
v2 -> v3:
        * Document tlow_hs_mode and thigh_hs_mode.
v1 -> v2:
        * Document has_hs_mode_support.
        * Add a check to set the frequency to fastmode+ if the device
          does not support HS mode but the requested frequency is more
          than fastmode+.
---
 drivers/i2c/busses/i2c-tegra.c | 59 ++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 8a696c88882e..9ebeb6a2eaf5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -91,6 +91,7 @@
 #define I2C_HEADER_IE_ENABLE			BIT(17)
 #define I2C_HEADER_REPEAT_START			BIT(16)
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
+#define I2C_HEADER_HS_MODE			BIT(22)
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_BUS_CLEAR_CNFG			0x084
@@ -200,6 +201,8 @@ enum msg_end_type {
  * @thigh_fast_mode: High period of the clock in fast mode.
  * @tlow_fastplus_mode: Low period of the clock in fast-plus mode.
  * @thigh_fastplus_mode: High period of the clock in fast-plus mode.
+ * @tlow_hs_mode: Low period of the clock in HS mode.
+ * @thigh_hs_mode: High period of the clock in HS mode.
  * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
  *		in standard mode.
  * @setup_hold_time_fast_mode: Setup and hold time for start and stop
@@ -210,6 +213,7 @@ enum msg_end_type {
  *		in HS mode.
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
+ * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -232,11 +236,14 @@ struct tegra_i2c_hw_feature {
 	u32 thigh_fast_mode;
 	u32 tlow_fastplus_mode;
 	u32 thigh_fastplus_mode;
+	u32 tlow_hs_mode;
+	u32 thigh_hs_mode;
 	u32 setup_hold_time_std_mode;
 	u32 setup_hold_time_fast_mode;
 	u32 setup_hold_time_fastplus_mode;
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
+	bool has_hs_mode_support;
 };
 
 /**
@@ -646,6 +653,7 @@ static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
+	u32 max_bus_freq_hz;
 	struct i2c_timings *t = &i2c_dev->timings;
 	int err;
 
@@ -684,6 +692,14 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
+	if (i2c_dev->hw->has_hs_mode_support)
+		max_bus_freq_hz = I2C_MAX_HIGH_SPEED_MODE_FREQ;
+	else
+		max_bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
+
+	if (WARN_ON(t->bus_freq_hz > max_bus_freq_hz))
+		t->bus_freq_hz = max_bus_freq_hz;
+
 	if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
 		tlow = i2c_dev->hw->tlow_std_mode;
 		thigh = i2c_dev->hw->thigh_std_mode;
@@ -694,11 +710,22 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		thigh = i2c_dev->hw->thigh_fast_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
 		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
-	} else {
+	} else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		tlow = i2c_dev->hw->tlow_fastplus_mode;
 		thigh = i2c_dev->hw->thigh_fastplus_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fastplus_mode;
 		non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
+	} else {
+		/*
+		 * When using HS mode, i.e. when the bus frequency is greater than fast plus mode,
+		 * the non-hs timing registers will be used for sending the master code byte for
+		 * transition to HS mode. Configure the non-hs timing registers for Fast Mode to
+		 * send the master code byte at 400kHz.
+		 */
+		tlow = i2c_dev->hw->tlow_fast_mode;
+		thigh = i2c_dev->hw->thigh_fast_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
+		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
 	}
 
 	/* make sure clock divisor programmed correctly */
@@ -720,6 +747,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
+	/* Write HS mode registers. These will get used only for HS mode*/
+	if (i2c_dev->hw->has_hs_mode_support) {
+		tlow = i2c_dev->hw->tlow_hs_mode;
+		thigh = i2c_dev->hw->thigh_hs_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
+
+		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
+			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
+		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
+		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
+	}
+
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
 
 	err = clk_set_rate(i2c_dev->div_clk,
@@ -1217,6 +1256,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
+	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		packet_header |= I2C_HEADER_HS_MODE;
+
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
@@ -1508,6 +1550,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1536,6 +1579,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1564,6 +1608,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1592,6 +1637,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1620,6 +1666,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1648,6 +1695,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fastplus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1671,16 +1719,19 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.thigh_fast_mode = 0x2,
 	.tlow_fastplus_mode = 0x2,
 	.thigh_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x8,
+	.thigh_hs_mode = 0x3,
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_mode = 0x02020202,
 	.setup_hold_time_fastplus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = true,
 };
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
-	.clk_divisor_hs_mode = 7,
+	.clk_divisor_hs_mode = 9,
 	.clk_divisor_std_mode = 0x7a,
 	.clk_divisor_fast_mode = 0x40,
 	.clk_divisor_fast_plus_mode = 0x14,
@@ -1698,10 +1749,14 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.thigh_fast_mode = 0x2,
 	.tlow_fastplus_mode = 0x4,
 	.thigh_fastplus_mode = 0x4,
+	.tlow_hs_mode = 0x3,
+	.thigh_hs_mode = 0x2,
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_mode = 0x04010101,
 	.setup_hold_time_fastplus_mode = 0x04020202,
+	.setup_hold_time_hs_mode = 0x030303,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = true,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.50.1


