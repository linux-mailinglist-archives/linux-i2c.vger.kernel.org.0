Return-Path: <linux-i2c+bounces-11897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE37B00317
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 15:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4BC4188EC24
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 13:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84ED2E8E0A;
	Thu, 10 Jul 2025 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kTfXpGYy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5FC2E54DD;
	Thu, 10 Jul 2025 13:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752153198; cv=fail; b=Dm9JzrkclIqDVdj/5v9Q1ydE28OtNbNMd27Fnp6wPEYrJCVZ4Un5QztZb/E8TinvAFFtS9wMb0/8bsJY50zvO/oOkcWym5g3c1exvfC6Poeirlor22/5Z83vrMFkrPlhbB9HG4vxfPNL68gkOXpZGQ6I0TFF07s9qYJS+IRUq8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752153198; c=relaxed/simple;
	bh=S2zECxMoB3WM1giKHU6P0bWSzIQ0rDwK2qFqHh4wObc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFggrRgFVmm6uW3ZsJ2fcxc0b9yyDUGjrUv4Ij5M4t+6zUM5q63D+xdT87w6EuJozTIHtNLWO2TGBj/SXxZuXW/r2QsF3qcFK4rERaYsE0GF0dba5ZpSDDoQWRcXkZiifdjbIe/B8Fy4CxBhtRnTDrhpK4BD7aIxEi+pGBYuPRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kTfXpGYy; arc=fail smtp.client-ip=40.107.94.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtojIfopQwMyKLKTucXB9cGFN9vUsvd8JeKoHs7QJwQEfTIBWn9IKinxAPL8G5pyNwhYbCwSbeaGYY2SSD5nD+hUvAzXk4XIUwgJvQaANQD1dHF0DS2jSW8J28/iWv1vBhvuoL45IUXj821U61d0d94bV/WpNlfNSAiXRcW6P9V+qqk1Ry8kGuZwuHt6hTgtxZWbrAwc1glpfU4yA+qHlfDFZwFxoBdqySwXQsowusHYtx5W5WRiszOP2tAy/ldh8YEvdY3dmQkUrA84eyaegZD1BV+8Z40IkLZZQn0sAhQ6VZN69rLkHRETZ4vjg9a4y5b3fpTAUmYW1cTs2jpnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/YvVYI0Ircrzg5SxDvhj8rMrB6UoGqosvDTkxImUZo=;
 b=DDUQYMKV21Ws+Tk4QOx8iN6zeWIZKVtdJ55Dud8FNchsn/NA33iotb/SwjfdOim12yoaWUgJcZc+eRY0MsyMkz88YCfqwg3oymhSu7pSHFQlhU75OGyQXtRy8eQeOl2zeafu7e+ceAa7dyzodoX7ChBCpBwtthzlLqyQ1lxsIjYLDcmrjhNSs4GCbMpDKcmXVrIREitSYSeCFXrDMczTvPSnHJMLQafDDnbezSghX8F1uq6ZGW+sndKbn6atZiebfVuFBYI0GIxX1Yn2eYrqXAkV7g7k9hCT9kTsGYVjgoh9plOLNz/t6yghnNHbhC0xbXhoV2T8xTJPMa1+ztnXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/YvVYI0Ircrzg5SxDvhj8rMrB6UoGqosvDTkxImUZo=;
 b=kTfXpGYyUXIlZ5iDNvSIeoAfCy40LRgN1PQgH9xzwvIbNepyX7lIKKBoYSzPuWfwS1YAf3/X/SMirYfS2b7VqvZiBshm1osLNSJiux9J5gOdnhipsUVlAudbKtBLsGNcKiaZLVK6QJfG42s2IsSbf/I5K+7J+6XFrrwWTXP0nEnIZ3YHESzc9qOTBnEiHMcI+I7bwI+cBD68V86YvGbNYvjyByJP6oUZB5ZxKo73jOnasc6q9enaeI8n8jXyEIuL2FeP5ewuRqhEcnUyzPDIjmSMM1MwbZRNx7HSy7Np8YbtzUbKH1x3e4dFPdiGkw9+iVZ3yLIiuB0GcYxKVAtKVg==
Received: from MW4PR03CA0020.namprd03.prod.outlook.com (2603:10b6:303:8f::25)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Thu, 10 Jul
 2025 13:13:09 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::b0) by MW4PR03CA0020.outlook.office365.com
 (2603:10b6:303:8f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.25 via Frontend Transport; Thu,
 10 Jul 2025 13:13:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 13:13:09 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 10 Jul
 2025 06:12:58 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 10 Jul
 2025 06:12:57 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 10 Jul 2025 06:12:54 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@linux.intel.com>, <andi.shyti@kernel.org>,
	<digetx@gmail.com>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>
Subject: [PATCH v6 2/3] i2c: tegra: Use internal reset when reset property is not available
Date: Thu, 10 Jul 2025 18:42:05 +0530
Message-ID: <20250710131206.2316-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710131206.2316-1-akhilrajeev@nvidia.com>
References: <20250710131206.2316-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f67dea-4e62-4465-61c3-08ddbfb38404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JD+kvaGZy1xEWBtqsXTB+oGPEm5lxPpPSWyNgmoATb2lejx8fiPqxjJOs8v2?=
 =?us-ascii?Q?qipDLOcFmTu4XrbkWFOd7cb+j0nPtu03qZACVKuOiijzGm7pCIfjitRzgBkF?=
 =?us-ascii?Q?JuCzK4Y3QDBnOQAQMD8sUH/9fwPWGVatf1uZp3JZnA5FZkMkdpKureLumWBL?=
 =?us-ascii?Q?uznagKYpmLTUTPaaiPprIyBDGgCMKxFC3TFOIaKAXdN92YoL9KRQvceHs3QU?=
 =?us-ascii?Q?FLkw3fzJ0oMKMj45G9nHcG+XDq+g6hRblcGKQqAcmB70voCxZdTgaemhnKoZ?=
 =?us-ascii?Q?7GhH9E1ziP0dsByGLCkBmp4FWsWA7r/JgHxB5ATgqtduGVDQujafHG+5HIhl?=
 =?us-ascii?Q?ovXrEUzcyTVwb9uTd5ujKVXnMYywB1HOvJIX6RsQJ5RWIpUAJKbtip/rM792?=
 =?us-ascii?Q?EDDxfcgUAb4MK2Yi6PEY5MOYwjWhkw13NoKtswsKZPuHzyivFzNmkZt8/fY7?=
 =?us-ascii?Q?GPB2fz8oS+xNF1JydsaiygZ320RVKA3skHYLO++X3DD0CXduBdBwz43L8bTR?=
 =?us-ascii?Q?k6saxVXM5iA1wQEe30HqqA0khZCLMh53aUT5e3aCxWl9D4QzG0OfYajwDOFT?=
 =?us-ascii?Q?DIi/gC8dTlQ0gNj+LLtGUUgKhKy39mlWDvOKV2pbTmT9rCY5Cad3HFvFL2GX?=
 =?us-ascii?Q?ZJ8lS2B7LpfbbUq/j4JBZCoLBEMvziZMtwG8edMvAkxklHedyBVBWagTAPPd?=
 =?us-ascii?Q?+iGeArdFJp3uw5YaU8cSIQ/u6a3KA6rsqMvo+s0A+ixqittmjrWGV5V6UprS?=
 =?us-ascii?Q?+rPfZ/hf51W3WHXa1EYkVQdGp/NMCzZ0S7u/cyIPyrJXTxYS3QZqWtp2YI1E?=
 =?us-ascii?Q?XQ6GWe5X+S3NjsjhB7eqh92jAMIHzLBiECG7abguEru1T5hTneROMrxYSv/D?=
 =?us-ascii?Q?t0APBeQrSfgpFJUMmhdLKU+BRvTeAArxWGCEtLdwGCf3DIcB37N/Pa1BP4Ps?=
 =?us-ascii?Q?uLUDbOxw0/gfqkBzhv62qsXuvmv/S7r6r8FF2MIk9buxD16qOUZ3TjxKanEX?=
 =?us-ascii?Q?QVkwm1Yr5lN9XPPIEr1Q1gBf5wXh8lN8y9Lcc0nk9uQi5XwlSetRn+aDFJbc?=
 =?us-ascii?Q?IWcbQTIHCzGEKjXkX/To6RvtXY5O/HmRtFg+0STlRPRwMc1CFLbkzOHevEYY?=
 =?us-ascii?Q?myXiTZxH4KWoVfcD3Ukvy9yIgdyaT3CnRBMkiIUg0HSiQ4dEJK32DbkJH8K9?=
 =?us-ascii?Q?dASfY4PeVizXxRacQk46oJl50TGEmvngxAxwCQsIYoIj9WtEHUs2y4149CTv?=
 =?us-ascii?Q?3mSgl9fHLJpDmzytO6EQzGZsgXoCcpn5CbktUd892iP2WmAGeISYLu2snFay?=
 =?us-ascii?Q?hs3AkenqJk5nr95mk/IKFqVvieOJQQ0vJkJF7tTqaR1L9NIJcoGuFBli+NBM?=
 =?us-ascii?Q?jU0Gwn8oUVjdM5t2p1BEbs5ScpiENR+E2IcXC6pLTiWB56bFlxBxgWuxL7bE?=
 =?us-ascii?Q?Uf76+SlYucEnnR4Wyyb2ALDXuFI2BuukHoj/Clbri19b7R5D1R1nFfXPA8Nm?=
 =?us-ascii?Q?dzz1l00WfmyDfRvwjq13J1sDYGF4UwCge++HHfbcpGx/W7bhKtCCqTgD+g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 13:13:09.0121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f67dea-4e62-4465-61c3-08ddbfb38404
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572

For controllers that has an internal software reset, make the reset
property optional. This provides and option to use I2C in systems
that choose to restrict reset control from Linux or not to implement
the ACPI _RST method.

Internal reset was not required when the reset control was mandatory.
But on platforms where the resets are outside the control of Linux,
this had to be implemented by just returning success from BPMP or with
an empty _RST method in the ACPI table, basically ignoring the reset.

While the internal reset is not identical to the hard reset of the
controller, this will reset all the internal state of the controller
including FIFOs. This may slightly alter the behaviour in systems
which were ignoring the reset but it should not cause any functional
difference since all the required I2C registers are configured after
this reset, just as in boot. Considering that this sequence is hit
during the boot or during the I2C recovery path from an error, the
internal reset provides a better alternative than just ignoring the
reset.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 687d1e608abc..e291b8586214 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -134,6 +134,8 @@
 #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
 #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
 
+#define I2C_MASTER_RESET_CNTRL			0x0a8
+
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
@@ -184,6 +186,9 @@ enum msg_end_type {
  * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
  *		provides additional features and allows for longer messages to
  *		be transferred in one go.
+ * @has_mst_reset: The I2C controller contains MASTER_RESET_CTRL register which
+ *		provides an alternative to controller reset when configured as
+ *		I2C master
  * @quirks: I2C adapter quirks for limiting write/read transfer size and not
  *		allowing 0 length transfers.
  * @supports_bus_clear: Bus Clear support to recover from bus hang during
@@ -213,6 +218,7 @@ struct tegra_i2c_hw_feature {
 	bool has_multi_master_mode;
 	bool has_slcg_override_reg;
 	bool has_mst_fifo;
+	bool has_mst_reset;
 	const struct i2c_adapter_quirks *quirks;
 	bool supports_bus_clear;
 	bool has_apb_dma;
@@ -603,6 +609,26 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 
 	return 0;
 }
+
+static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
+{
+	if (!i2c_dev->hw->has_mst_reset)
+		return -EOPNOTSUPP;
+
+	/*
+	 * Writing 1 to I2C_MASTER_RESET_CNTRL will reset all internal state of
+	 * Master logic including FIFOs. Clear this bit to 0 for normal operation.
+	 * SW needs to wait for 2us after assertion and de-assertion of this soft
+	 * reset.
+	 */
+	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
+	fsleep(2);
+
+	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
+	fsleep(2);
+
+	return 0;
+}
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
@@ -619,6 +645,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 * won't hose machine entirely.
 	 */
 	err = device_reset(i2c_dev->dev);
+	if (err == -ENOENT)
+		err = tegra_i2c_master_reset(i2c_dev);
+
 	WARN_ON_ONCE(err);
 
 	if (IS_DVC(i2c_dev))
@@ -1467,6 +1496,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1491,6 +1521,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1515,6 +1546,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1539,6 +1571,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1563,6 +1596,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1587,6 +1621,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1611,6 +1646,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = true,
+	.has_mst_reset = true,
 	.quirks = &tegra194_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
-- 
2.50.1


