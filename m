Return-Path: <linux-i2c+bounces-14049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE1FC4C9DC
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 10:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B3B74F89A1
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849AF2F1FF3;
	Tue, 11 Nov 2025 09:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P/PJy7SU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012054.outbound.protection.outlook.com [40.107.200.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7310E2F1FCF;
	Tue, 11 Nov 2025 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852625; cv=fail; b=EO2IyhhNdy2QL2B8mlmgCrkrw5txAtqE/eDLNnYGsrpAgD7Le/AgecyIrS/dwRWvvpHBRfnCf4uPrsjIGt37ITrEaQ4BwatI8RKJKoRBKB6jwMxb5+Rio5o5HWnHamcb2PeVtvrMltCezZ0j6Hy5igKSJsVCsQPmI6E89gGmgeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852625; c=relaxed/simple;
	bh=Dglyod+GbqPYFh6wMLVV8sN+0piGbEp2QUYvgqnOXr4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nW5ypZywySER/w71t5tRptmZLyvzaEjVwph8pUkVm5/Yg8wTlcEmAAhH+W1W9MbGgu6DqIDATTSNDUxufuxJThui5oKfjdj8a9aRRV9N/07qRdYqtMa3gA6CqXP7RN8VC1IjXaJ9SqLyXa98Nr9hFDo2VETg+hA4kSq1yHsbNYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P/PJy7SU; arc=fail smtp.client-ip=40.107.200.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbbh+G+WgnYcQsBwXxZznNvPjxeiqDZAlKK8uMHoQizn6LgG2GhztvVmqNo0dzp1/bPJph3jdSS3vsTHsuBDHyeZlwucDyNJh45Sn468R/7NkMjyKt855B3iPDloimjXm8CEHL6fEPfqyEtCuMlog4I6KI19ZX3rz5gdcYXcptIuL5NtLTfGujRhKmq4hxjkr6xx/l7AjAKK/30HBriqZSCi9r1kxp2/XmF7Am2PB50yLgoqpCIHlXtemoX6TATo/G8fXwuNZrxl4Z2YEy6JidiiyopgMFkIxSb+QWqz1DEt8oV5npBu/wmnMUZgc0LEHhGH7vNDln3xsYhB9r2Y+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozmpQ31Zhyhuoub8rwhVxoKQ1W0K5EOqpA/glijCRds=;
 b=lwi6rkXvn/uatUDRsqSg3nbbH0n4HFasrsuJMRGYjjMNkigmOwshTYlSuuhKkLIyHGzQbZgMP19Ob9eYN3AcRyXoqW6QvFaT0sQTg1WREdhu5w3a6FzvOOyAm3fbq7BiBOdXAP85jcJmPq+Koe3asrWA1QSCFawVG9Dy+lZHD/Gw8rVUx+HIteU+AN4Bp8VfVyvsUkx/jttlfNU/zLoCrPa1chnN0/LBTQz35ylGB0yq1/W93o83iCQWKYUMQH9re1dZccP20P/hGABMGg/T78IraqvThC8pnADAqimi8cFFSHPMFbfhRfDzDzOY8PA9wZzrSCeH8wOq0Yr1ldh2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozmpQ31Zhyhuoub8rwhVxoKQ1W0K5EOqpA/glijCRds=;
 b=P/PJy7SUXrAZ4+aGAbz2a5zYW9uQxtueVAip4t0fkeaGlbLQIEYk1HFkPlf7uFFJ+UNzFnprJIGfRehn2/xhl0td5D6J02DynQt3PzsbpKGXEKVy5jj5pfFPgtmWUU1HbnucD0K0R31nmL9781SezN+vDFsWH5YsVbY8z3F7C/du3f0YS15fw9mjGdRsPouAk92gMD/iZL76oDAaStY611Q3T8gOfLf3FS6aC/JKfsNv2SuY79JHcw/CQPSL5uXPl1HwASSo9ELpCTAQ0+7vhTQKBwet4np1xGaWfvqN+aIN2wmqKaLYDDiw0GJldrXXy3s+zziTm9ddXIsJzl8zzQ==
Received: from MW4PR03CA0127.namprd03.prod.outlook.com (2603:10b6:303:8c::12)
 by MW4PR12MB6899.namprd12.prod.outlook.com (2603:10b6:303:208::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:16:56 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:303:8c:cafe::93) by MW4PR03CA0127.outlook.office365.com
 (2603:10b6:303:8c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 09:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 09:16:56 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 01:16:43 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 01:16:43 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 01:16:39 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v11 2/4] i2c: tegra: Add HS mode support
Date: Tue, 11 Nov 2025 14:46:25 +0530
Message-ID: <20251111091627.870613-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111091627.870613-1-kkartik@nvidia.com>
References: <20251111091627.870613-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|MW4PR12MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 52229fba-a5f1-443d-95e0-08de21030faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vc9MaNbAJSUu0lxm9yseQ8R9gkQR6aC3tFc80HeeB8haAT2Qv5cMVpQHGAyq?=
 =?us-ascii?Q?YMXRb3AtQAkdbCz9G+r6n0cIvpv66zzc2Sp+17oQ1A5y3pwDJmANSt8ppG2d?=
 =?us-ascii?Q?eM0as5o51Ne7/T0Ygvp3SwHM/O6BtNvaVNBrvJOu7cKlTnzdXwgRqTWkF6/B?=
 =?us-ascii?Q?5ss+uxhAWH4EBfMYIFlFecwwkaJe72T21l3ghOsXnU3TxPGg9eYWWNlwLE0+?=
 =?us-ascii?Q?TU3rBIG6t67J5XwKknF2mxlI5AD6hvq2WA/iWh4FGbNgLSw/wloroybpzX87?=
 =?us-ascii?Q?8dH5sJKbY/5IqUi6VII8u1NPfY2meiFvp77ltF6/MY7pTTeoZdLEIs9kM53T?=
 =?us-ascii?Q?zXkEor/SVcLdnfpMslEcZlh9gpL90ssIxfZk5NUcLEY5KxuLfhLIzuDpQBLo?=
 =?us-ascii?Q?FfeEQQAUBQnKSVlvmO9H9LugSEj//BivHSIKpuT5jW8J/LEMYBuZauUKPvV7?=
 =?us-ascii?Q?RXOy/RdCurwqkiCoB49iQI8u1DP1wlVQqlx3RHC1dM8AKGhhECTv8DkfoEW1?=
 =?us-ascii?Q?fEI+4PQcHI39Lrm2MriXBB34930FOffhPlxF6MSePltswy70iuQo/Ot5uU4L?=
 =?us-ascii?Q?uUFqhuGOfQ8bM79F4ryDni3O6bal2Jxi4wq7H5myq2Srga/znQQVpuYwAKF+?=
 =?us-ascii?Q?yXiigE16onHxDLr/hLNcP8koZ/RuwiQz6zCvl1efNvOtXQJJqRvsn1GquVIi?=
 =?us-ascii?Q?alYO0i8q3bFWBTovQQo7IJWeEVJ43omnNHYECNQwCcWIbobMhtfNFoZxFBEU?=
 =?us-ascii?Q?q7/J+GP9LguXUJVYxwFRv6j2fCUhI+1SikxwRtORtA6r4HzQOvyJ9/R4KqQK?=
 =?us-ascii?Q?9buWTG9+R4g5W9vEEnRDkzv7RuUkU3T6DOxe8iTAN6EDbVossITGovJrzh8W?=
 =?us-ascii?Q?9UekB0tnN6rW7vxjoE6e1F7l4be/e9Gq51U2V65lBCK7u+a4rgsUpIWn2S5n?=
 =?us-ascii?Q?rWKWxRfYsQxKNRSePr8VW0HiLyGgx9tkXdiIleRKBLng/w0Il/710bC4WbWl?=
 =?us-ascii?Q?LGWDgVnURIR7t2m80b+U1KTkrbrTRyhp2w0DxOmodmSGizZDXhiR65tbK3Bk?=
 =?us-ascii?Q?qRVL+hFrzdCjhhJo1c3oVCLWfpthQ4aC+NQMT9vgxk2YbXjUUa6fQZN0MlV6?=
 =?us-ascii?Q?1P8pJD+WxoHP9nOPFdPXKWCRpjYHXhZk0p///Ke9Lc1uUbe1YLfszw9pt+io?=
 =?us-ascii?Q?BGoGMg2FufHJ6B3Pefcx5BzyK3DTgNgh9bLLGtHXOy0BNOJUzKHq3Lh7uPFV?=
 =?us-ascii?Q?GDwQSuVDh/D7rJMFSNTeGldZ/DLDfbpJPrJTQ4VTvm/HtHW4I9HfICH1sF13?=
 =?us-ascii?Q?wwlBKwUGcycEXClmII6gjsO8VOK46H4EwrUj31yyFgBkP2VaYpcxwnvj2CfM?=
 =?us-ascii?Q?Y+P7MXxW4XPoAeDQ3CLi2IvWHe5+fA+DVXowZqfMZEPujrUgjcrN8zqALa0x?=
 =?us-ascii?Q?TC0WDE+ZRfyyFTyr+/y5EuiQx3/uk3npKutCYqq5O2dOWvGbBC0kul4Gss9A?=
 =?us-ascii?Q?g6cfqYGVO5l8NNccKg2GUuhFO7vRQW7oWz0Pklux1eSD4ZShDBU18J7bKDTJ?=
 =?us-ascii?Q?+chSJ8h9KvZ1km1okjRaQ9GvwZxyl/uA8jtp4lc8bj/UFSKHs4LOKritEU6p?=
 =?us-ascii?Q?YA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 09:16:56.4660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52229fba-a5f1-443d-95e0-08de21030faf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6899

From: Akhil R <akhilrajeev@nvidia.com>

Add support for HS (High Speed) mode transfers, which is supported by
Tegra194 onwards. Also adjust the bus frequency such that it uses the
fast plus mode when HS mode is not supported.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
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
 drivers/i2c/busses/i2c-tegra.c | 62 ++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bd26b232ffb3..2b18ceb837da 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -91,6 +91,7 @@
 #define I2C_HEADER_IE_ENABLE			BIT(17)
 #define I2C_HEADER_REPEAT_START			BIT(16)
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
+#define I2C_HEADER_HS_MODE			BIT(22)
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_BUS_CLEAR_CNFG			0x084
@@ -198,6 +199,8 @@ enum msg_end_type {
  * @thigh_std_mode: High period of the clock in standard mode.
  * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
  * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
+ * @tlow_hs_mode: Low period of the clock in HS mode.
+ * @thigh_hs_mode: High period of the clock in HS mode.
  * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
  *		in standard mode.
  * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
@@ -206,6 +209,7 @@ enum msg_end_type {
  *		in HS mode.
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
+ * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -226,10 +230,13 @@ struct tegra_i2c_hw_feature {
 	u32 thigh_std_mode;
 	u32 tlow_fast_fastplus_mode;
 	u32 thigh_fast_fastplus_mode;
+	u32 tlow_hs_mode;
+	u32 thigh_hs_mode;
 	u32 setup_hold_time_std_mode;
 	u32 setup_hold_time_fast_fast_plus_mode;
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
+	bool has_hs_mode_support;
 };
 
 /**
@@ -677,25 +684,28 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
-	switch (t->bus_freq_hz) {
-	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
-	default:
+	if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
+		tlow = i2c_dev->hw->tlow_std_mode;
+		thigh = i2c_dev->hw->thigh_std_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
+		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
+	} else {
 		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
 		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
 
-		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
-			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
-		else
+		/*
+		 * When HS mode is supported, the non-hs timing registers will be used for the
+		 * master code byte for transition to HS mode. As per the spec, the 8 bit master
+		 * code should be sent at max 400kHz. Therefore, limit the bus speed to fast mode.
+		 * Whereas when HS mode is not supported, allow the highest speed mode capable.
+		 */
+		if (t->bus_freq_hz < I2C_MAX_FAST_MODE_PLUS_FREQ ||
+		    (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ &&
+			i2c_dev->hw->has_hs_mode_support))
 			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
-		break;
-
-	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
-		tlow = i2c_dev->hw->tlow_std_mode;
-		thigh = i2c_dev->hw->thigh_std_mode;
-		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
-		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
-		break;
+		else
+			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
 	}
 
 	/* make sure clock divisor programmed correctly */
@@ -717,6 +727,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -1214,6 +1236,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
+	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		packet_header |= I2C_HEADER_HS_MODE;
+
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
@@ -1502,6 +1527,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1527,6 +1553,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1552,6 +1579,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1577,6 +1605,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1602,6 +1631,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1627,6 +1657,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1648,10 +1679,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.thigh_std_mode = 0x7,
 	.tlow_fast_fastplus_mode = 0x2,
 	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x8,
+	.thigh_hs_mode = 0x3,
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
-- 
2.43.0


